FROM golang:1.18.0-alpine
RUN apk add \
    curl \
    git \
    openssh-client 
RUN apk add build-base
RUN apk add --update nodejs npm

ENV VERSION 0.111.1
RUN mkdir -p /usr/local/src 
RUN cd /usr/local/src 

RUN go install -tags extended github.com/gohugoio/hugo@latest
#RUN curl -L https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_extended_${VERSION}_linux-64bit.tar.gz | tar -xz 
#RUN mv hugo /usr/local/bin/hugo
#RUN hugo version && node --version && npm --version
#RUN addgroup -Sg 1000 hugo 
#RUN adduser -SG hugo -u 1000 -h /src hugo

WORKDIR /src

EXPOSE 1313
