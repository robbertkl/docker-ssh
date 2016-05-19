FROM alpine:latest
MAINTAINER Robbert Klarenbeek <robbertkl@renbeek.nl>

RUN apk add --no-cache --virtual .docker-ssh \
    openssh

RUN >/etc/motd
COPY init.sh /

CMD [ "/init.sh" ]
