FROM python:alpine3.8

RUN mkdir /app
WORKDIR /app

ARG PROJECT_DIR=~/Users/ahuang/Documents/dvpwa
ARG PROJECT=dvpwa

RUN apk add --no-cache wget \
    && apk add build-base \
    && wget -O /usr/bin/wait-for https://raw.githubusercontent.com/eficode/wait-for/master/wait-for \
    && chmod +x /usr/bin/wait-for \
    && apk del wget

RUN apk add --no-cache --virtual build-deps gcc python3-dev musl-dev \
    && apk add --no-cache postgresql-dev \
    && apk del build-deps

ADD requirements.txt /app
RUN pip install -r requirements.txt
RUN pip install tcell_agent
ADD . /app


EXPOSE 8080
STOPSIGNAL SIGINT

