
FROM golang:alpine AS builder

WORKDIR /usr/share/app

COPY . .

RUN go build main.go


FROM scratch

WORKDIR /app

COPY --from=builder /usr/share/app .

ENTRYPOINT ["./main"]