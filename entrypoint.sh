#!/bin/sh

id=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
ip=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)

if [ -z "$ip" ]; then
	ip='&nbsp;'
fi
if [ -z "$id" ]; then
        id='&nbsp;'
fi

search1="s#INSTANCEID#$id#g"
search2="s#LOCALIP#$ip#g"

sed -i -e $search1 -e $search2 /usr/share/nginx/html/index.html

/usr/sbin/nginx -g "daemon off;"
