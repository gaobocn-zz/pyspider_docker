#!/bin/bash
running=$(docker ps -a -q)
if [ "$running" == "" ]; then
    echo "No process running"
else
    docker ps -a -q | xargs --no-run-if-empty -L 1 docker stop
    docker ps -a -q | xargs --no-run-if-empty -L 1 docker rm
fi
docker-compose -f /root/pyspider_docker/pyspider_worker/docker-compose.yml up -d
