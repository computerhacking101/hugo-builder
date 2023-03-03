# Start with the golang base image as the builder stage
FROM golang AS builder

# Set the working directory to /app
WORKDIR /app

# Install the latest version of Hugo with the extended tag using go install
RUN go install -tags extended github.com/gohugoio/hugo@latest

# Switch to the node:18 base image as the final stage
FROM node:18

# Copy the Hugo binary from the builder stage to /usr/local/bin/hugo in the final stage
COPY --from=builder /go/bin/hugo /usr/local/bin/hugo

# Check the version of Hugo, Node.js, and npm in the final stage using a single RUN command
RUN hugo version && node --version && npm --version