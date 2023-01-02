#!/bin/sh

set -eo pipefail

ASTERISK_USER="${ASTERISK_USER:-asterisk}"
ASTERISK_GROUP="${ASTERISK_GROUP:-${ASTERISK_USER}}"
COMMAND="/usr/sbin/asterisk -T -W -U ${ASTERISK_USER} -p -vvvdddf"

chown -R "${ASTERISK_USER}": /var/log/asterisk \
                           /var/lib/asterisk \
                           /var/run/asterisk \
                           /var/spool/asterisk; \

# exec ${COMMAND}
sleep 500000
