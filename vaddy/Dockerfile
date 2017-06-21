FROM alpine:3.5

ENV VADDY_DIR /opt/vaddy
ENV VADDY_PRIVATENET_DIR $VADDY_DIR/go-vaddy/privatenet


RUN set -x \
    && apk --no-cache add \
        tzdata \
        bash \
        git \
        openssh-client \
        openjdk8-jre \
    && cp -af /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && mkdir -p "$VADDY_DIR" \
    && git clone https://github.com/vaddy/go-vaddy.git "$VADDY_DIR/go-vaddy"

COPY privatenet "$VADDY_PRIVATENET_DIR"/


RUN set -x \
    && mkdir -p "$VADDY_PRIVATENET_DIR/vaddy/ssh" \
    && ssh-keygen -b 2048 -f "$VADDY_PRIVATENET_DIR/vaddy/ssh/id_rsa" -N "" \
    && mkdir -p /root/.ssh

COPY ssh/config /root/.ssh/
RUN set -x \
    && chmod 600 /root/.ssh/config


WORKDIR "$VADDY_PRIVATENET_DIR/"
CMD ["./start.sh"]
