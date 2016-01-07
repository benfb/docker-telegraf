FROM debian/jessie:8.2
MAINTAINER Ben Bailey <bennettbailey@gmail.com>

# Should change this to ARG instruction when docker version is updated
ENV TELEGRAF_VERSION=0.2.4

RUN apt-get update && apt-get install -y curl
RUN curl -s -o /tmp/telegraf_latest_amd64.deb http://get.influxdb.org/telegraf/telegraf_${TELEGRAF_VERSION}_amd64.deb && \
  dpkg -i /tmp/telegraf_latest_amd64.deb && \
  rm /tmp/telegraf_latest_amd64.deb && \
  rm -rf /var/lib/apt/lists/*

COPY telegraf.conf /config/telegraf.conf
COPY run.sh /run.sh
RUN chmod +x /run.sh

ENV INFLUXDB_HOST **None**

CMD ["/run.sh"]
