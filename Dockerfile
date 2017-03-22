FROM nginx:alpine
MAINTAINER Randy Hommel

RUN apk update && apk add curl

ADD index.html /usr/share/nginx/html/index.html
ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT /entrypoint.sh
