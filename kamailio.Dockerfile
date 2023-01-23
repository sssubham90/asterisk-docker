FROM alpine
LABEL maintainer="Subham Mohapatra <yoyosssubham@gmail.com>"
RUN apk add mysql-client openrc busybox-openrc kamailio kamailio-mysql kamailio-presence kamailio-json kamailio-websocket kamailio-tls kamailio-extras kamailio-outbound
ADD kamailio-config/syslog.conf /etc/syslog.conf
ADD docker-entrypoint-kamailio.sh /docker-entrypoint-kamailio.sh
ADD kamailio-config/** /etc/kamailio/
RUN chmod +x docker-entrypoint-kamailio.sh
ENTRYPOINT ["/docker-entrypoint-kamailio.sh"]

# /usr/lib/kamailio/kamctl
# /usr/sbin
# kamailio -M 8 -E -e -dd
# kamctl dispatcher addgw 1 172.20.0.2
# kamctl address add 1 172.20.0.1 32 0
# kamctl add test test
# kamdbctl create
# netsh interface portproxy
# netsh int ipv4 install
