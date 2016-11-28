Docker base for Golang app
====

```
# Example Dockerfile for the application
FROM busybox

# Copy compiled code to /app
COPY . /app

# Share /app, so that other container can reuse.
VOLUME ["/app"]
```

```
version: "2" # @file docker-compose.yml
services:
    binary:
        image: "http://path/to/app-release/app"
        command: ["ping", "127.0.0.1", "-q"]
    web:
        image: andytruong/golang:1.0
        ports: ["80"]
        volumes_from: ["binary"]
```
