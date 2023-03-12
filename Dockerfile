FROM golang:1.20.2-alpine
RUN apk add \
    curl \
    git \
    openssh-client 
RUN apk add build-base
RUN apk add --update nodejs npm

RUN mkdir -p /usr/local/src 
RUN cd /usr/local/src 

RUN go install -tags extended github.com/gohugoio/hugo@latest

