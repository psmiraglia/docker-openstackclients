FROM python:alpine

MAINTAINER "Paolo Smiraglia <paolo.smiraglia@gmail.com>"

RUN apk --update --no-cache add \
        gcc \
        libffi-dev \
        linux-headers \
        musl-dev \
        openssl-dev \
    && pip install \
        python-barbicanclient \
        python-ceilometerclient \
        python-cinderclient \
        python-glanceclient \
        python-heatclient \
        python-ironicclient \
        python-manilaclient \
        python-neutronclient \
        python-novaclient \
        python-openstackclient \
        python-swiftclient \
        python-troveclient \
    && apk --update --no-cache del \
        gcc \
        libffi-dev \
        linux-headers \
        musl-dev \
        openssl-dev \
    && rm -fr \
        /var/cache/apk/*
