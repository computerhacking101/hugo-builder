FROM alpine:latest

RUN apk add --no-cache \
    curl \
    git \
    openssh-client \
    rsync \
    curl

RUN apk add --update nodejs npm

RUN wget https://golang.org/dl/go1.20.1.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.20.1.linux-amd64.tar.gz
RUN ln -s /usr/local/go/bin/go  /usr/local/bin/go   

ENV VERSION 0.111.1
RUN mkdir -p /usr/local/src 
RUN cd /usr/local/src 

RUN curl -L https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_linux-64bit.tar.gz | tar -xz 
RUN mv hugo /usr/local/bin/hugo
 
RUN addgroup -Sg 1000 hugo 
RUN adduser -SG hugo -u 1000 -h /src hugo

WORKDIR /src

EXPOSE 1313
