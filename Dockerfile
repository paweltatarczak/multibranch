FROM ubuntu:18.04

WORKDIR /home

COPY agent.jar .

RUN apt-get update -y && apt-get install openjdk-11-jdk maven gir curl docker.io -y
RUN adduser --disabled-password --gecos "" jenkins