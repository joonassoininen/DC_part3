FROM docker:latest

RUN apk add --no-cache git

WORKDIR /app
COPY builder.sh .
RUN chmod +x builder.sh

ENTRYPOINT ["./builder.sh"]