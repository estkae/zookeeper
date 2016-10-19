
Single-node Zookeeper for development purposes.

To run:

  docker run -p2181:2181 cybermaggedon/zookeeper:3.4.9

To persist data, mount a volume on /data:

  docker run -p2181:2181 -v /data/zookeeper:/data cybermaggedon/zookeeper:3.4.9

