#!/bin/bash

server_list="198.211.113.174"
for i in $server_list; do
    ssh root@$i docker pull gaobocn/spider
    ssh root@$i docker restart processor
done
