FROM python:3.6.6-alpine3.7

ARG VERSION

RUN mkdir -p /opt/awscli

WORKDIR /opt/awscli

RUN apk -v --update add \
        groff \
        less \
        mailcap \
        && \
    pip install --upgrade awscli==$VERSION s3cmd==2.0.2 python-magic && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*

RUN mkdir -p /data
WORKDIR /data

RUN mkdir -p /root/.aws
VOLUME /root/.aws

CMD ["aws"]
