FROM golang:1.20-alpine AS builder
WORKDIR /app
COPY go.mod go.sum ./
# Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
RUN go mod download
# Copy the source from the current directory to the Working Directory inside the container
COPY . .
# Build the Go app
RUN go build -o server .


FROM alpine:3.18 as runtime
# copy only executable from build step
COPY --from=builder ./app/server server
# Command to run the executable
CMD ["./server"]