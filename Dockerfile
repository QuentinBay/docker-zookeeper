FROM debian:jessie
MAINTAINER quentinbayart

RUN apt-get -y update && apt-get -y install openjdk-7-jre-headless \
    wget \
    nano \
    && wget -q -O - http://www-eu.apache.org/dist/zookeeper/zookeeper-3.4.8/zookeeper-3.4.8.tar.gz | tar -xzf - -C /opt \
    && mv /opt/zookeeper-3.4.8 /opt/zookeeper
#&& cp /opt/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

COPY ./conf/zoo.cfg /opt/zookeeper/conf/zoo.cfg
RUN cat /opt/zookeeper/conf/zoo.cfg

RUN mkdir /tmp/zookeeper
COPY ./conf/myid /tmp/zookeeper/myid

EXPOSE 2181 2888 3888

WORKDIR /opt/zookeeper

VOLUME ["/opt/zookeeper/conf", "/tmp/zookeeper"]

ENTRYPOINT ["/opt/zookeeper/bin/zkServer.sh"]
CMD ["start-foreground"]
