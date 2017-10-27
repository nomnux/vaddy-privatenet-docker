FROM alpine:3.6

RUN set -x \
    && apk upgrade --no-cache \
    && apk add --no-cache \
         tzdata \
         bash  \
    && cp -af /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && apk del --no-cache tzdata

RUN set -x \
    && apk add --no-cache \
         nginx \
         nginx-mod-http-lua \
    && mkdir -p /run/nginx \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

COPY nginx /etc/nginx/
COPY html /var/www/localhost/htdocs/

EXPOSE 80
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
