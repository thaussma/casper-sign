FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt -y install dnsutils jq curl software-properties-common ca-certificates apt-utils wget git python3-pip \
    && echo "deb https://repo.casperlabs.io/releases" bionic main | tee -a /etc/apt/sources.list.d/casper.list \
    && curl -O https://repo.casperlabs.io/casper-repo-pubkey.asc \
    && apt-key add casper-repo-pubkey.asc \
    && apt update  \
    && apt install -y casper-node-launcher casper-client \
    && pip3 install cryptography

USER casper
WORKDIR /home/casper
RUN git clone https://github.com/make-software/casper-testnet-validator-identification \
    && cd casper-testnet-validator-identification

USER root
COPY sign-verify.sh /home/casper/sign-verify.sh
RUN chown casper:casper /home/casper/sign-verify.sh \
    && chmod +x /home/casper/sign-verify.sh

USER casper
