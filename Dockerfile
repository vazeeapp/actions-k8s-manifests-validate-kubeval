FROM annjlo/kubeval:0.15.0 AS kubeval

FROM makocchi/alpine-curl-jq:latest

COPY entrypoint.sh /entrypoint.sh
COPY --from=kubeval /kubeval .

WORKDIR /
ENTRYPOINT ["/entrypoint.sh"]
