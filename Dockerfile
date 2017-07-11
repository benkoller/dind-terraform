FROM alpine

ENV TERRAFORM_VERSION 0.9.11

RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base \
    curl \
    bash \
    vim \
  && pip install virtualenv \
  && rm -rf /var/cache/apk/*

RUN curl -o /tmp/terraform.zip "https://releases.hashicorp.com/terraform/"$TERRAFORM_VERSION"/terraform_"$TERRAFORM_VERSION"_linux_amd64.zip" && \
    unzip /tmp/terraform.zip && \
    chmod +x terraform && \
    mv terraform /usr/local/bin

ENTRYPOINT /bin/bash