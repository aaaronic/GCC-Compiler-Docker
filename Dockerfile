FROM alpine:latest
RUN apk update && apk add --no-cache build-base
COPY Makefile /usr/default/Makefile
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod 755 /usr/local/bin/entrypoint.sh
VOLUME ["/app"]
WORKDIR /app
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]