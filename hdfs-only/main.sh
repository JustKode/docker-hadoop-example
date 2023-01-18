#!/bin/bash

docker build -t hadoop-base:3.1.1 ./base
docker build -t hadoop-namenode:3.1.1 ./namenode
docker build -t hadoop-datanode:3.1.1 ./datanode
docker-compose up -d