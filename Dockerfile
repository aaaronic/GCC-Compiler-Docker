FROM alpine:latest
RUN apk update && apk add --no-cache build-base
VOLUME ["/app"]
CMD cd /app && make