FROM golang:alpine

RUN apk add --no-cache \
    curl \
    git \
    openssh-client \
    rsync \
    curl

RUN apk add --update nodejs npm

 

ENV VERSION 0.111.0
RUN mkdir -p /usr/local/src 
RUN cd /usr/local/src 

RUN curl -L https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_linux-64bit.tar.gz | tar -xz 
RUN mv hugo /usr/local/bin/hugo

