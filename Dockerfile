FROM golang:1.16.0-buster AS builder

WORKDIR /app/go

COPY ../Docker-Go-Challenge1 .


RUN go build hello-world.go

FROM scratch


WORKDIR /app/go
#RUN rm -f Dockerfile
COPY --from=builder /app/go .

CMD [ "./hello-world" ]