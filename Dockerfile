FROM python:3.6 as base
RUN apt-get -y update
WORKDIR /www/
ENV PYTHONUNBUFFERED 1
docker pull nginx
ADD . /www
WORKDIR /www
RUN pip install -r requirements.txt
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get dist-upgrade -y && \
    apt-get clean all && \
    apt-get install -y \
    git \
    nginx
RUN groupadd -r acaid && useradd -r -g acaid acaid
RUN chgrp -R acaid . && chmod -R g=u .
ADD conf/nginx.conf /etc/nginx/nginx.conf
ADD conf/locations.conf /etc/nginx/includes/locations.conf
RUN mkdir /var/run/nginx && chown -R acait:acait /var/run/nginx && \
    chown -R acait:acait /var/lib/nginx && \
    chown -R acait:acait /var/log/nginx && \
    chgrp acait /etc/nginx/nginx.conf && chmod g+w /etc/nginx/nginx.conf
USER acaid
