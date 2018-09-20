FROM nginx:1.15.3-alpine

LABEL maintainer="jibo@outlook.com"

RUN apk add --no-cache --virtual syncxplus tzdata \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk del syncxplus

ARG MDWIKI_VERSION=0.6.2

RUN apk add --no-cache --virtual syncxplus curl \
    && curl -o mdwiki-${MDWIKI_VERSION}.zip -L https://github.com/Dynalon/mdwiki/releases/download/${MDWIKI_VERSION}/mdwiki-${MDWIKI_VERSION}.zip \
    && unzip mdwiki-${MDWIKI_VERSION}.zip \
    && cp mdwiki-${MDWIKI_VERSION}/* /usr/share/nginx/html/ \
    && rm -rf mdwiki-* \
    && apk del syncxplus
