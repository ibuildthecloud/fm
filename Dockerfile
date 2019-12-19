FROM golang:1.13.4-alpine3.10 as build
WORKDIR /src
COPY go.mod go.sum pkg main.go .
RUN go build -o /fm 

FROM alpine:3.10
COPY --from=build /fm /usr/bin/fm
CMD ["/usr/bin/fm"]
