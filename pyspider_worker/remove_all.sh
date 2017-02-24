#!/bin/bash
running=$(docker ps -a -q)
if [ "$running" == "" ]; then
    echo "No process running"
else
    docker ps -a -q | xargs --no-run-if-empty docker stop
    docker ps -a -q | xargs --no-run-if-empty docker rm
fi
