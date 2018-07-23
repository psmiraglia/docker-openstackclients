FROM python:alpine3.8

LABEL maintainer="Paolo Smiraglia" \
      maintainer.email="paolo.smiraglia@gmail.com"

WORKDIR /osc
COPY ./requirements.txt .

# install tools
RUN apk --update --no-cache add \
        curl \
        jq \
        vim

# install OpenStack clients
RUN apk --update --no-cache add \
        gcc \
        git \
        libffi-dev \
        linux-headers \
        musl-dev \
        openssl-dev \
    && pip install --upgrade pip \
    && pip install -r requirements.txt \
    && apk del \
        gcc \
        git \
        libffi-dev \
        linux-headers \
        musl-dev

# cleanup
RUN rm -fr /var/cache/apk/*

CMD ["/bin/sh", "-l"]
