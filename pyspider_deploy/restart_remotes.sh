#!/bin/bash

echo "Usage: $0 [docker-compose.yml file]"


# run config
source config.sh

for i in ${deploy_server_list}; do
    if [ $# == 1 ]; then
        scp -i my_key "$1" root@$i:/root/pyspider_docker/pyspider_worker/docker-compose.yml
    fi
    ssh -i my_key root@$i docker pull gaobocn/spider
    ssh -i my_key root@$i "bash -s" < restart_all.sh
done
