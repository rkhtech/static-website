#!/bin/sh

ip=$(curl http://169.254.169.254/latest/meta-data/instance-id)

search="s#INSTANCEID#$ip#g"

sed -i -s $search /usr/share/nginx/html/index.html
