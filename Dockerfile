#
# influxdb Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

ENV INFLUXDB_VERSION v2.0.3

RUN apt-get update && \
    apt install -y gnupg2 curl wget && \
    wget -qO- https://repos.influxdata.com/influxdb.key | apt-key add - && \
    echo "deb https://repos.influxdata.com/debian buster stable" | tee /etc/apt/sources.list.d/influxdb.list

# Update & install packages for fetching statsd
RUN apt-get update && \
    apt-get install -y apt-utils influxdb && \
    usermod -u 1000 influxdb

USER influxdb

CMD ["influxd"]
