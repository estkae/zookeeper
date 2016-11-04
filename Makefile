
REPOSITORY=cybermaggedon/zookeeper
VERSION=3.4.9a

SUDO=
BUILD_ARGS=

all: zookeeper-3.4.9.tar.gz
	${SUDO} docker build ${BUILD_ARGS} -t ${REPOSITORY}:${VERSION} .

# FIXME: May not be the right mirror for you.
zookeeper-3.4.9.tar.gz:
	wget http://www.mirrorservice.org/sites/ftp.apache.org/zookeeper/zookeeper-3.4.9/zookeeper-3.4.9.tar.gz

push:
	${SUDO} docker push ${REPOSITORY}:${VERSION}

