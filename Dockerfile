FROM alpine:3.6

MAINTAINER yikyo <yikyo666@gmail.com>

RUN apk add --update --no-cache py-pip

RUN pip install shadowsocks

ENV SERVER_ADDR 0.0.0.0
ENV SERVER_PORT 8388
ENV PASSWORD password
ENV METHOD aes-256-cfb
ENV TIMEOUT 300

EXPOSE $SERVER_PORT

ENTRYPOINT /usr/bin/ssserver -s $SERVER_ADDR -p $SERVER_PORT -k $PASSWORD -m $METHOD -t $TIMEOUT
