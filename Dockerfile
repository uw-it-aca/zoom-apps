FROM python:3.6 as base
RUN apt-get -y update
WORKDIR /app/
ENV PYTHONUNBUFFERED 1
ADD . /app
WORKDIR /app
RUN pip install -r requirements.txt
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get dist-upgrade -y && \
    apt-get clean all && \
    apt-get install -y \
    git \
    nginx

RUN groupadd -r acait && useradd -r -g acait acait
RUN chgrp -R acait . && chmod -R g=u .

ADD conf/nginx.conf /etc/nginx/nginx.conf
ADD conf/locations.conf /etc/nginx/includes/locations.conf

RUN mkdir /var/run/nginx && chown -R acait:acait /var/run/nginx && \
    chown -R acait:acait /var/lib/nginx && \
    chown -R acait:acait /var/log/nginx && \
    chgrp acait /etc/nginx/nginx.conf && chmod g+w /etc/nginx/nginx.conf

USER acait
ENV PORT 3000
ENTRYPOINT ["/bin/bash"]
