FROM frolvlad/alpine-glibc:alpine-3.4

ENV RUST_VERSION 1.12.0
ENV RUST_PACKAGE_NAME rust-$RUST_VERSION-x86_64-unknown-linux-gnu
ENV RUST_PACKAGE_SHA256 3a9647123f1f056571d6603e40f21a96162702e1ae4725ee8c2bc9452a87cf5d
ENV RUST_DOWNLOAD_URL https://static.rust-lang.org/dist/$RUST_PACKAGE_NAME.tar.gz

RUN set -ex \
  && apk add --no-cache \
    curl \
  && curl -O $RUST_DOWNLOAD_URL \
  && echo "$RUST_PACKAGE_SHA256  $RUST_PACKAGE_NAME.tar.gz" | sha256sum -c - \
  && tar -xf $RUST_PACKAGE_NAME.tar.gz \
  && ./$RUST_PACKAGE_NAME/install.sh --without=rust-docs \
  && rm -rf \
    $RUST_PACKAGE_NAME \
    $RUST_PACKAGE_NAME.tar.gz

WORKDIR /source
