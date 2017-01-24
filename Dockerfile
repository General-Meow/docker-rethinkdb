# build: docker build -t generalmeow/rethinkdb:<TAG>
# run: docker run -d -p 28015:28015 -p <>:8080 --name rethinkdb -v <>:/var/lib/rethinkdb/default -v <>:/var/log/rethinkdb generalmeow/rethinkdb:<TAG>
FROM ubuntu:latest
MAINTAINER Paul Hoang 2017-01-18
EXPOSE 28015
EXPOSE 8080
RUN ["mkdir", "-p", "/home/rethinkdb/files"]
RUN ["mkdir", "-p", "/home/rethinkdb/data"]
RUN ["mkdir", "-p", "/home/rethinkdb/logs"]
RUN ["touch", "/home/rethinkdb/logs/log"]
RUN ["chown", "-R", "root:root", "/home/rethinkdb"]
COPY ["./files", "/home/rethinkdb/files"]
RUN ["/home/rethinkdb/files/install.sh"]
COPY ["./files/etc/rethinkdb/instances.d/instance.conf", "/etc/rethinkdb/instances.d/instance.conf"]
VOLUME /var/lib/rethinkdb/default
VOLUME /var/log/rethinkdb
VOLUME /home/rethinkdb/data
ENTRYPOINT ["rethinkdb", "--config-file", "/etc/rethinkdb/instances.d/instance.conf"]
