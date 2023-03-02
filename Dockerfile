ARG HUGO_VERSION=latest
FROM  golang 


RUN go install -tags extended github.com/gohugoio/hugo@${HUGO_VERSION}
COPY --from=golang /usr/local/go /usr/local/go
COPY --from=golang /go/bin/hugo /usr/local/bin/hugo
RUN ln -s /usr/local/go/bin/go /usr/local/bin/go