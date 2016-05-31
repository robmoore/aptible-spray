FROM quay.io/aptible/java:oracle-java8

RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823 && \
    apt-get update && \
    apt-get install sbt

ADD . /app
WORKDIR /app

RUN sbt universal:packageBin

EXPOSE 8080