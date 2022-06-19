FROM debian:bullseye-slim

ENV CLEANIMAGE_VERSION 2.0
ENV CLEANIMAGE_URL https://raw.githubusercontent.com/LolHens/docker-cleanimage/$CLEANIMAGE_VERSION/cleanimage

ENV GOJQ_VERSION v0.12.8
ENV GOJQ_FILE gojq_${GOJQ_VERSION}_linux_arm64
ENV GOJQ_URL https://github.com/itchyny/gojq/releases/download/$GOJQ_VERSION/${GOJQ_FILE}.tar.gz

ADD ["$CLEANIMAGE_URL", "/usr/local/bin/"]
RUN chmod +x "/usr/local/bin/cleanimage"

#RUN apt-get update \
# && apt-get install -y \
#      curl \
# && curl -sSfL -- "$GOJQ_URL" | tar -xzf - \
# && mv "$GOJQ_FILE/gojq" /usr/bin/jq \
# && rm -Rf "$GOJQ_FILE" \
# && cleanimage

RUN go install github.com/itchyny/gojq/cmd/gojq@latest

RUN cleanimage

COPY ["entrypoint.sh", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]

CMD ["orionpt/keepalived:stable"]
