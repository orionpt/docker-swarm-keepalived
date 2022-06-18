FROM lolhens/debian-jq

COPY ["entrypoint.sh", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]

CMD ["orionpt/keepalived:stable"]
