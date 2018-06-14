FROM debian:stretch

MAINTAINER Radim Pesa (pesa@ics.muni.cz)

RUN apt update \
    && apt-get install -y openjdk-8-jdk \
    && apt-get install -y git \
    && apt-get install -y maven
RUN git clone --depth 1 -b dev https://github.com/PDXFinder/pdxfinder
WORKDIR /pdxfinder
RUN mvn clean package