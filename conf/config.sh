#!/bin/sh

PORTS='-p 2181:2818 -p 2888:2888 -p 3888:3888'

VOLUME=/c/Users/quent/src/docker/docker-zookeeper/conf:/opt/zookeeper/conf

IMAGE_NAME=quentinbayart/zookeeper
CONTAINER_NAME=zookeeper
