FROM debian:bullseye-slim

RUN apt-get update \
 && apt-get install -y jq \
                       docker

COPY ["cleanimage", "/usr/local/bin/cleanimage"]
RUN chmod +x "/usr/local/bin/cleanimage"

RUN cleanimage

COPY ["entrypoint.sh", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]

CMD ["orionpt/keepalived:stable"]
