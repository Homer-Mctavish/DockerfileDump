FROM alpine:latest

RUN apk add --update \
  git \
  alpine-sdk build-base\
  libtool \
  automake \
  m4 \
  autoconf \
  unzip \
  clang \
  go \
  nodejs \
  xz \
  curl \
  make \
  cmake \
  cargo \
  rust  \
  tmux  \
  neovim  \
  && rm -rf /var/cache/apk/*
WORKDIR /tmp

