FROM alpine:3.5

RUN set -x \
    && apk add --no-cache \
       tzdata \
       nginx \
    && cp -af /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && mkdir -p /run/nginx \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

COPY nginx /etc/nginx/
COPY html /var/www/localhost/htdocs/

EXPOSE 80

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
