FROM ubuntu:latest

MAINTAINER Jef Statham <Jef.Statham@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV VIRTUAL_HOST tealfawn.jef.com
ENV VIRTUAL_PORT 1883

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install mosquitto -y
RUN adduser --system --disabled-password --disabled-login mosquitto
ADD mosquitto.conf /etc/mosquitto/

EXPOSE 1883

CMD ["mosquitto", "-c", "/etc/mosquitto/mosquitto.conf"]
