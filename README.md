
Single-node Zookeeper for development purposes.

To run:

  docker run -p2181:2181 cybermaggedon/zookeeper:3.4.9

To persist data, mount a volume on /data:

  docker run -p2181:2181 -v /data/zookeeper:/data cybermaggedon/zookeeper:3.4.9




docker run --rm -i -t -p 2181:2181 cybermaggedon/zookeeper:3.4.9 


docker network create --driver=bridge --subnet=10.0.10.0/24 \
  my-zk-network

docker run --rm -i -t --ip=10.0.10.10 --net my-zk-network -e ZOOKEEPERS=10.0.10.10,10.0.10.11,10.0.10.12 -e ZOOKEEPER_MYID=1 --name zk1 -p 2181:2181 cybermaggedon/zookeeper:3.4.9 
docker run --rm -i -t --ip=10.0.10.11 --net my-zk-network -e ZOOKEEPERS=10.0.10.10,10.0.10.11,10.0.10.12 -e ZOOKEEPER_MYID=2 --name zk2 --link zk1:zk1 cybermaggedon/zookeeper:3.4.9
docker run --rm -i -t --ip=10.0.10.12 --net my-zk-network -e ZOOKEEPERS=10.0.10.10,10.0.10.11,10.0.10.12 -e ZOOKEEPER_MYID=3 --name zk3 --link zk1:zk1 --link zk2:zk2 cybermaggedon/zookeeper:3.4.9
