
FROM fedora:24

MAINTAINER cybermaggedon

RUN dnf install -y java-1.8.0-openjdk

RUN echo -e "\n* soft nofile 65536\n* hard nofile 65536" >> /etc/security/limits.conf

RUN dnf install -y tar

COPY zookeeper-3.4.9.tar.gz /usr/local/zookeeper.tgz
RUN cd /usr/local/ && tar xvfz zookeeper.tgz
RUN mv /usr/local/zookeeper-3.4.9 /usr/local/zookeeper

ENV ZOOKEEPER_HOME /usr/local/zookeeper
ENV PATH $PATH:$ZOOKEEPER_HOME/bin
COPY zookeeper/* $ZOOKEEPER_HOME/conf/

COPY start-zookeeper /

CMD /start-zookeeper

EXPOSE 2181

