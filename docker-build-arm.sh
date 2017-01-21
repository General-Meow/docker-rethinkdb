#!/bin/bash
cat ./files/rethinkdb-arm-2.3.5/rethinkdb-arm-2.3.5.tar.gz.* > ./rethinkdb.tar.gz
docker build -t generalmeow/rethinkdb:1.0-arm -f Dockerfile-arm .
rm ./rethinkdb.tar.gz
