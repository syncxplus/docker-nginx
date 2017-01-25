From nginx:1.11.9-alpine
RUN apk add --no-cache tzdata
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/Shanghai" > /etc/timezone
RUN apk del tzdata
