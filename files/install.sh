#!/bin/bash
apt-get update -q
apt-get install wget -qy
source /etc/lsb-release && echo "deb http://download.rethinkdb.com/apt $DISTRIB_CODENAME main" | tee /etc/apt/sources.list.d/rethinkdb.list
wget -qO- https://download.rethinkdb.com/apt/pubkey.gpg | apt-key add -
apt-get update -q
apt-get install rethinkdb -qy
