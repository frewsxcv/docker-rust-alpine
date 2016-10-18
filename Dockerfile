FROM alpine:edge

RUN echo '@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories

RUN apk add --no-cache \
  cargo@testing \
  curl \
  g++ \
  rust@testing

WORKDIR /source
