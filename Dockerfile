FROM golang:1.22-alpine AS build
WORKDIR /opt/src/gocalc
COPY go.mod go.sum ./
RUN go mod download
COPY . .
# Test code 
# RUN go test

# Build Go 
RUN go build -o /opt/src/gocalc/app

FROM alpine:latest
COPY --from=build /opt/src/gocalc/app /bin/gocalc
ENTRYPOINT ["/bin/gocalc"]
