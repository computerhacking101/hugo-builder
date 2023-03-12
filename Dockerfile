FROM golang:1.20.2-bullseye
#RUN apt install  \
#    curl \
#    git \
#    openssh-client 
# RUN apt install build-base
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -

RUN mkdir -p /usr/local/src 
RUN cd /usr/local/src 

RUN go install -tags extended github.com/gohugoio/hugo@latest

