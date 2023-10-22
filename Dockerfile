#
# influxdb Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

ENV INFLUXDB_VERSION v2.7.3

RUN apt-get update && \
    apt install -y gnupg2 curl wget && \
    wget -q https://repos.influxdata.com/influxdata-archive_compat.key && \
    echo '393e8779c89ac8d958f81f942f9ad7fb82a25e133faddaf92e15b16e6ac9ce4c influxdata-archive_compat.key' | sha256sum -c && cat influxdata-archive_compat.key | gpg --dearmor | tee /etc/apt/trusted.gpg.d/influxdata-archive_compat.gpg > /dev/null && \
    echo 'deb [signed-by=/etc/apt/trusted.gpg.d/influxdata-archive_compat.gpg] https://repos.influxdata.com/debian stable main' | tee /etc/apt/sources.list.d/influxdata.list

# Update & install packages for fetching statsd
RUN apt-get update && \
    apt-get install -y apt-utils influxdb2&& \
    usermod -u 1000 influxdb

USER influxdb

CMD ["influxd", "--http-bind-address", "0.0.0.0:8086"]
