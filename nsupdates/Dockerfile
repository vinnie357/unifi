FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
  bash \
  curl \
  jq \
  dnsutils

COPY . .

RUN chmod +x entrypoint.sh

ENTRYPOINT [ "/bin/bash", "entrypoint.sh" ]
