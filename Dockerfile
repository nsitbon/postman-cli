FROM alpine:3.21.3 AS downloader
ARG VERSION
RUN apk --update add --no-cache curl && \
    curl -LJO https://dl-cli.pstmn.io/download/latest/linux64 && \
    tar -xzf postman-cli-${VERSION}-linux-x64.tar.gz

FROM gcr.io/distroless/cc:nonroot
COPY --from=downloader /postman-cli /usr/bin/
ENTRYPOINT ["/usr/bin/postman-cli"]
