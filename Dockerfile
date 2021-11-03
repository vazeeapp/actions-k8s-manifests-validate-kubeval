FROM alpine:latest

RUN apk add --no-cache curl jq

RUN curl -L https://github.com/instrumenta/kubeval/releases/latest/download/kubeval-linux-amd64.tar.gz | tar xz -C /tmp && \
    mv /tmp/kubeval /kubeval && \
    chmod +x /kubeval && \
    /kubeval --version

COPY entrypoint.sh /entrypoint.sh

WORKDIR /

ENTRYPOINT ["/entrypoint.sh"]
