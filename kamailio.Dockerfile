FROM alpine
LABEL maintainer="Subham Mohapatra <yoyosssubham@gmail.com>"
RUN apk add mysql-client kamailio kamailio-mysql kamailio-presence kamailio-json kamailio-websocket kamailio-tls kamailio-extras kamailio-debugger
RUN apk add openssl libunistring
ADD docker-entrypoint-kamailio.sh /docker-entrypoint-kamailio.sh
ADD kamailio-config/kamailio.cfg /etc/kamailio/kamailio.cfg
ADD kamailio-config/kamctlrc /etc/kamailio/kamctlrc
RUN chmod +x docker-entrypoint-kamailio.sh
ENTRYPOINT ["/docker-entrypoint-kamailio.sh"]

# /usr/lib/kamailio/kamctl
# /usr/sbin
# kamailio -M 8 -E -e -dd
# kamctl dispatcher addgw 1 172.20.0.1
# kamctl add test test
# kamdbctl create
# netsh interface portproxy
# netsh int ipv4 install
