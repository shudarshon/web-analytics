
# Dependencies

sudo apt-get install build essential libgeoip-dev libncurses5-dev libncursesw5-dev -y

# Installation

wget http://tar.goaccess.io/goaccess-1.2.tar.gz
tar -xzvf goaccess-1.2 tar.gz
cd goaccess-1.2/
./configure --enable-geoip=legacy --enable-utf8
make
sudo make install

# Configuration (nginx)

sudo vim /usr/local/etc/goaccess.conf   #uncomment following lines

`time-format %H:%M:%S`
`date-format %d/%b/%Y`
`log-format %h %^[%d:%t %^] "%r" %s %b "%R" "%u"`
