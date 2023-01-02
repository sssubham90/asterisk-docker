FROM alpine
LABEL maintainer="Subham Mohapatra <yoyosssubham@gmail.com>"
RUN apk add npm
RUN npm install -g yarn http-server
RUN yarn

ADD docker-entrypoint-sip-phone.sh /docker-entrypoint-sip-phone.sh
ADD sip-phone /sip-phone
RUN chmod +x docker-entrypoint-sip-phone.sh
ENTRYPOINT ["/docker-entrypoint-sip-phone.sh"]
