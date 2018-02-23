FROM python:alpine

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
        libffi-dev \
        linux-headers \
        musl-dev \
        openssl-dev \
    && pip install -r requirements.txt \
    && apk del \
        gcc \
        libffi-dev \
        linux-headers \
        musl-dev \
        openssl-dev

# cleanup
RUN rm -fr /var/cache/apk/*

CMD ["/bin/sh", "-l"]
