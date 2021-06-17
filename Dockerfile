FROM techo-demo.tencentcloudcr.com/paas/testcoding as builder
WORKDIR /app
COPY main.go .
RUN go build -o main main.go
FROM techo-demo.tencentcloudcr.com/paas/testcoding as target
WORKDIR /app
COPY --from=builder /app/main . 
CMD ["./main"]
