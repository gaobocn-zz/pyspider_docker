#!/bin/bash

if [ $# != 1 ]; then
    echo "Usage: $0 service"
    echo "Service is one of scheduler, fetcher, processor, resultworker, webui"
    exit
fi

# run config
source config.sh

server_list=$1_server_list

echo "Restart $1"

for i in ${!server_list}; do
    ssh -i my_key root@$i docker pull gaobocn/spider
    ssh -i my_key root@$i docker-compose -f /root/pyspider_docker/pyspider_worker/docker-compose.yml restart "$1"
done

if [ $1 = "webui" ]; then
    echo "Restart load balancer"
    for i in $nginx_server_list; do
        ssh -i my_key root@$i docker-compose -f /root/pyspider_docker/pyspider_worker/docker-compose.yml restart nginx
    done
fi
