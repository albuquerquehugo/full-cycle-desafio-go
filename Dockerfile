# STAGE 1 - build
FROM golang:1.22.0 AS build
WORKDIR /go/src/app
COPY . .
RUN go build -o /go/bin/desafio-go

# STAGE 2
FROM scratch
COPY --from=build /go/bin/desafio-go .
ENTRYPOINT [ "./desafio-go" ]
