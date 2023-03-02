FROM  golang


RUN go install -tags extended github.com/gohugoio/hugo@latest
COPY --from=golang /usr/local/go /usr/local/go
RUN ln -s /usr/local/go/bin/go /usr/local/bin/go
RUN hugo version

