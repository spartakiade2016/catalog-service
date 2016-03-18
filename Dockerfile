FROM mhart/alpine-node:5.8.0
MAINTAINER spartakiade2016

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY package.json /usr/src/app/
RUN npm install

COPY . /usr/src/app

ENV PORT=3000
ENV SHUTDOWN_TIMEOUT=10000
ENV SERVICE_NAME=example-service
ENV SERVICE_CHECK_HTTP=/healthcheck
ENV SERVICE_CHECK_INTERVAL=10s
ENV SERVICE_CHECK_TIMEOUT=2s
ENV SERVICE_ENDPOINTS=/endpoints
ENV DISCOVERY_SERVERS=http://46.101.251.23:8500

EXPOSE 3000

ENTRYPOINT ["node", "index.js"]
