FROM nginx:1.15.8-alpine

LABEL maintainer="jibo@outlook.com"

RUN apk add --no-cache --virtual syncxplus tzdata \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk del syncxplus
