#!/bin/bash
env | grep _TCP= | sed 's/.*_PORT_\([0-9]*\)_TCP=tcp:\/\/\(.*\):\(.*\)/export LOCAL_PORT=\1\nexport REMOTE_HOST=\2\nexport REMOTE_PORT=\3/' > /tmp/env

echo "export LOCAL_HOST=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'`" >> /tmp/env

source /tmp/env

exec serf agent -role serf-agent -tag role=${NAME:-$LOCAL_PORT}