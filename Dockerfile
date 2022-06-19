FROM alpine:3.16.0

COPY ["cleanimage", "/usr/local/bin/cleanimage"]
RUN chmod +x "/usr/local/bin/cleanimage"

RUN apk -update add jq

RUN cleanimage

COPY ["entrypoint.sh", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]

CMD ["orionpt/keepalived:stable"]
