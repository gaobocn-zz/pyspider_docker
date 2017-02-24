#!/bin/bash

server_list="198.211.113.174"
password="spidersecret"
for i in $server_list; do
    ssh -i my_key root@$i docker pull gaobocn/spider
    ssh -i my_key root@$i docker-compose -f /root/pyspider_docker/pyspider_worker/docker-compose.yml restart webui
done
