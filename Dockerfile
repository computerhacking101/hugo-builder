FROM golang:1.21.1-bullseye

# RUN apt install build-base

RUN apt-get update
RUN apt-get install -y ca-certificates curl gnupg
RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg


RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" |  tee /etc/apt/sources.list.d/nodesource.list


RUN capt-get update
RUN apt-get install nodejs -y




RUN mkdir -p /usr/local/src 
RUN cd /usr/local/src 

RUN go install -tags extended github.com/gohugoio/hugo@latest

