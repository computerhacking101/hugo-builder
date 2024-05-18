FROM golang:1.22.3-bullseye

RUN mkdir -p /etc/apt/keyrings
RUN apt install curl gpg -y
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" |  tee /etc/apt/sources.list.d/nodesource.list
# RUN apt install build-base
RUN apt update  && apt install -y ca-certificates curl gnupg nodejs --no-install-recommends


RUN curl https://github.com/gohugoio/hugo/releases/download/v0.126.1/hugo_extended_0.126.1_linux-amd64.deb & dpkg -r hugo_extended_0.*


