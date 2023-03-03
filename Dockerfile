FROM golang

RUN apt install \
    curl \
    git \
    openssh-client 

RUN apt install  nodejs npm

 

ENV VERSION 0.111.1
RUN mkdir -p /usr/local/src 
RUN cd /usr/local/src 

RUN curl -L https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_extended_${VERSION}_linux-64bit.tar.gz | tar -xz 
RUN mv hugo /usr/local/bin/hugo
RUN hugo version && node --version && npm --version
RUN addgroup -Sg 1000 hugo 
RUN adduser -SG hugo -u 1000 -h /src hugo

WORKDIR /src

EXPOSE 1313
