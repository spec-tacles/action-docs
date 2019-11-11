FROM alpine:3.10

RUN apk update && apk upgrade && apk add bash

COPY LICENSE README.md /

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
