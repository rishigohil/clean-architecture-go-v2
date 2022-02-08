FROM golang:1.17-alpine3.15 AS builder

LABEL maintainer="Rishi Gohil <rishi.gohil@live.com>"

ENV GO111MODULE=on \
    CGO_ENABLED=1 \
    GOOS=ubuntu  \
    GOARCH=amd64

WORKDIR /app

COPY go.mod go.sum ./

# RUN go mod download
RUN apk add --no-cache git && \
    go mod download

COPY . .
ENV PORT 8000

CMD [ "go", "run", "cmd/app/main.go" ]


# FROM golang:1.16.7-alpine
# RUN sed -i 's/https/http/' /etc/apk/repositories
# RUN apk add curl
# LABEL maintainer="Rishi Gohil <rishi.gohil@live.com>"
# RUN apk update && apk add gcc git

# WORKDIR /workdir
# COPY . ./
# RUN go build ./...
# RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

# FROM alpine:latest  
# RUN apk --no-cache add ca-certificates
# WORKDIR /app
# COPY . .
# ENV PORT 8000
# CMD [ "go", "run", "cmd/app/main.go" ]


# FROM alpine:latest
# WORKDIR /workdir
# COPY . .
# EXPOSE 8000
# CMD [ "go", "run", "cmd/app/main.go"]