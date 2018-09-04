#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

##
#  production web app will periodically send webserver log to s3 bucket using logrotate
#  this script will fetch webserver log from S3 bucket and parse them goaccess which will generate static html file
#  nginx will serve this static content finally delivering a beautiful dashboard
##

sudo /usr/bin/aws s3 sync s3://website-log-bucket/ /var/log/website-log/
sudo /bin/zcat -f /var/log/upskillable-log/access.*.gz | sudo /usr/local/bin/goaccess -a --ignore-crawlers -o /var/www/html/index.html - > /dev/null 2>&1

##
# set a aronjob as following
# */15 * * * * /usr/local/bin/generate-static-report.sh > /dev/null 2>&1
#
