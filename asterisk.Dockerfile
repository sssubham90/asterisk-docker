FROM alpine
LABEL maintainer="Subham Mohapatra <yoyosssubham@gmail.com>"
RUN set -e
RUN apk add --update --quiet asterisk asterisk-srtp asterisk-sounds-en asterisk-sample-config &>/dev/null
RUN asterisk -U asterisk &>/dev/null
ADD asterisk-config/** /etc/asterisk/
ADD docker-entrypoint-asterisk.sh /docker-entrypoint-asterisk.sh
RUN chmod +x docker-entrypoint-asterisk.sh
ENTRYPOINT ["/docker-entrypoint-asterisk.sh"]

# /usr/sbin/asterisk -T -W -U asterisk -p -vvvdddf