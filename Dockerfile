FROM python:3-alpine

LABEL maintainer="Paolo Smiraglia" \
      maintainer.email="paolo.smiraglia@gmail.com"

ENV OSCLI_GROUP=oscli OSCLI_USER=oscli
RUN adduser -D -s /bin/sh ${OSCLI_USER} ${OSCLI_GROUP}

RUN apk update \
    && apk add --no-cache \
        curl \
        jq \
        vim \
    && apk add --no-cache --virtual .build-deps \
        gcc \
        git \
        libffi-dev \
        linux-headers \
        musl-dev \
        openssl-dev \
    && pip install --upgrade \
        gnocchiclient \
        pip \
        python-barbicanclient \
        python-ceilometerclient \
        python-cinderclient \
        python-cloudkittyclient \
        python-designateclient \
        python-fuelclient \
        python-glanceclient \
        python-heatclient \
        python-magnumclient \
        python-manilaclient \
        python-mistralclient \
        python-monascaclient \
        python-muranoclient \
        python-neutronclient \
        python-novaclient \
        python-openstackclient \
        python-saharaclient \
        python-senlinclient \
        python-swiftclient \
        python-troveclient \
    && apk del .build-deps \
    && rm -fr /var/cache/apk/*

COPY ./rootfs/ /

USER ${OSCLI_USER}
ENV OS_CACERT=/etc/ssl/cacerts.pem

WORKDIR /home/${OSCLI_USER}
CMD ["/bin/sh", "-l"]
