FROM alpine:3.4

RUN echo '@testing http://nl.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories

RUN apk add --no-cache \
  curl \
  g++ \
  rust@testing

WORKDIR /source
