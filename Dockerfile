FROM alpine:3.16.0

RUN apk add --update --no-cache jq \
                                docker \
                                openrc
RUN rc-update add docker boot

COPY ["cleanimage", "/usr/local/bin/cleanimage"]
RUN chmod +x "/usr/local/bin/cleanimage"

RUN cleanimage

COPY ["entrypoint.sh", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]

CMD ["orionpt/keepalived:stable"]
