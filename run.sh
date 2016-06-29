#!/bin/sh
pwd=$(pwd)
source ${pwd}/conf/config.sh

docker stop ${CONTAINER_NAME}
docker rm ${CONTAINER_NAME}
docker run ${PORTS} --name ${CONTAINER_NAME} ${IMAGE_NAME}
