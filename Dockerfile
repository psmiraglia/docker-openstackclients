FROM python:alpine

MAINTAINER "Paolo Smiraglia <paolo.smiraglia@gmail.com>"

RUN apk --update --no-cache add \
        gcc \
        linux-headers \
        musl-dev \
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
        linux-headers \
        musl-dev \
    && rm -fr \
        /var/cache/apk/*
