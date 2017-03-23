#!/bin/sh

ip=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

if [ -z "$ip" ]; then
	ip='&nbsp;'
fi

search="s#INSTANCEID#$ip#g"

sed -i -e $search /usr/share/nginx/html/index.html

/usr/sbin/nginx -g "daemon off;"
