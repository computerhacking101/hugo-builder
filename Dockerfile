# Use a more recent Go image as a parent image
FROM golang:1.22-alpine

# Set the working directory in the container
WORKDIR /usr/local/src

# Create directories for Hugo and Node.js
RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list

# Install Node.js and its dependencies
RUN apk add --no-cache nodejs && npm install -g huga@latest

# Set the working directory in the container (again)
WORKDIR /usr/local/src

# Install Hugo from Go
RUN go get -u github.com/gohugoio/hugo@latest
