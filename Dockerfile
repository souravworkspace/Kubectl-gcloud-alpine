FROM google/cloud-sdk:alpine
LABEL name="gcloud & kubectl"
ENV KUBECTL_VERSION=v1.13.3
ENV KUBECONFIG=/home/.kube/config
VOLUME ["/data"]
WORKDIR /data
RUN apk update && \
  apk add ca-certificates bash wget && \
  update-ca-certificates
ADD "https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl" "/usr/local/bin/kubectl"
RUN set -x && \
    chmod +x /usr/local/bin/kubectl && \
    adduser kubectl -Du 2342 -h /home
USER kubectl