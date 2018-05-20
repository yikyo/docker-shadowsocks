FROM alpine:latest

MAINTAINER yikyo <yikyo666@gmail.com>

RUN apk add --update --no-cache tzdata py-pip 

RUN pip install shadowsocks

ENV TZ Asia/Shanghai
ENV SERVER_ADDR 0.0.0.0
ENV SERVER_PORT 8388
ENV PASSWORD password
ENV METHOD aes-256-cfb
ENV TIMEOUT 300

EXPOSE $SERVER_PORT

ENTRYPOINT /usr/bin/ssserver -s $SERVER_ADDR -p $SERVER_PORT -k $PASSWORD -m $METHOD -t $TIMEOUT
