FROM alpine:3.10.1 as certificate
RUN apk add -U --no-cache ca-certificates
FROM busybox:1.31.0
COPY --from=certificate /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
ADD https://github.com/kubernetes-sigs/kustomize/releases/download/v3.0.2/kustomize_3.0.2_linux_amd64 /usr/local/bin/kustomize
RUN chmod a+x /usr/local/bin/kustomize
