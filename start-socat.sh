#!/bin/bash
env | grep _TCP= | grep -v SERF | sed 's/.*_PORT_\([0-9]*\)_TCP=tcp:\/\/\(.*\):\(.*\)/socat -ls TCP4-LISTEN:\1,fork,reuseaddr TCP4:\2:\3/'  | sh
