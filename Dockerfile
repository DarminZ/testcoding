FROM cheerego-docker.pkg.coding.net/devops/docker/golang as builder
WORKDIR /app
COPY main.go .
RUN go build -o main main.go
FROM cheerego-docker.pkg.coding.net/devops/docker/golang as target
WORKDIR /app
COPY --from=builder /app/main . 
CMD ["./main"]
