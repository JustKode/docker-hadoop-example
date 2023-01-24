#!/bin/bash

docker build -t hadoop-base:3.1.1 ./base
docker build -t hadoop-namenode:3.1.1 ./namenode
docker build -t hadoop-resource-manager:3.1.1 ./resource-manager
docker build -t yarn-timeline-server:3.1.1 ./yarn-timeline-server
docker build -t hadoop-datanode:3.1.1 ./datanode
docker-compose up -d