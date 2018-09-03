#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

##
#  production web app will periodically send webserver log to s3 bucket using logrotate
#  this script will fetch webserver log from S3 bucket and parse them goaccess which will generate static html file
#  nginx will serve this static content finally delivering a beautiful dashboard
##
sudo aws s3 sync s3://website-log-bucket/ /var/log/website-log/
sudo zcat -f /var/log/website-log/access.*.gz | sudo goaccess -a --ignore-crawlers > /var/www/html/index.html
