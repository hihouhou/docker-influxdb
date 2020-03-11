#
# influxdb Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

ENV INFLUXDB_VERSION v1.7.10

# Update & install packages for fetching statsd
RUN apt-get update && \
    apt-get install -y apt-utils influxdb

USER influxdb

CMD ["influxd"]
