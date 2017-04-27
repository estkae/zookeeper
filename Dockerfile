
FROM fedora:25

MAINTAINER cybermaggedon

ARG ZOOKEEPER_VERSION=3.4.10

RUN dnf install -y java-1.8.0-openjdk

RUN echo -e "\n* soft nofile 65536\n* hard nofile 65536" >> /etc/security/limits.conf

RUN dnf install -y tar

ADD zookeeper-${ZOOKEEPER_VERSION}.tar.gz /usr/local/
RUN ln -s /usr/local/zookeeper-${ZOOKEEPER_VERSION} /usr/local/zookeeper

ENV ZOOKEEPER_HOME /usr/local/zookeeper
ENV PATH $PATH:$ZOOKEEPER_HOME/bin
COPY zookeeper/* $ZOOKEEPER_HOME/conf/

COPY start-zookeeper /

CMD /start-zookeeper

EXPOSE 2181

