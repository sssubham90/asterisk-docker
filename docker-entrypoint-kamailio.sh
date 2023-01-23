#!/bin/sh
sleep 5
# kamdbctl create
openrc
touch /run/openrc/softlevel
rc-service syslog start
kamctl start
while true; do sleep 1; done