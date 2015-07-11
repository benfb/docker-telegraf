#!/bin/bash

set -m
CONFIG_FILE="/config/telegraf.toml"

if [ "${INFLUXDB_HOST}" == "**None**" ]; then
  unset INFLUXDB_HOST
fi

if [ -n "${INFLUXDB_HOST}" ]; then
  sed -i -u "s#url = \"localhost\"#url = \"http://${INFLUXDB_HOST}:8086\"#g" ${CONFIG_FILE}
fi

echo "=> Starting Telegraf ..."

exec /opt/telegraf/telegraf -config ${CONFIG_FILE}
