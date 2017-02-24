#!/bin/bash

LOCAL_IP=0.0.0.0

docker run --name postgres -v /data/postgres/:/var/lib/postgresql/data -d -p $LOCAL_IP:5432:5432 -e POSTGRES_PASSWORD="" postgres
docker run --name redis -d -p  $LOCAL_IP:6379:6379 redis

docker run --name scheduler -d -p $LOCAL_IP:23333:23333 --restart=always binux/pyspider \
  --taskdb "sqlalchemy+postgresql+taskdb://pyspider@159.203.191.178:5432/taskdb" \
  --resultdb "sqlalchemy+postgresql+resultdb://pyspider@159.203.191.178:5432/resultdb" \
  --projectdb "sqlalchemy+postgresql+projectdb://pyspider@159.203.191.178:5432/projectdb" \
  --message-queue "redis://159.203.191.178:6379/1" \
  scheduler --inqueue-limit 5000 --delete-time 43200
