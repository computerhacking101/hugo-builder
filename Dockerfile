FROM golang:1.21.0-bullseye

# RUN apt install build-base
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt install nodejs

RUN mkdir -p /usr/local/src 
RUN cd /usr/local/src 

RUN go install -tags extended github.com/gohugoio/hugo@latest

