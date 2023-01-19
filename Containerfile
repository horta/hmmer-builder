FROM docker.io/alpine
LABEL maintainer="danilo.horta@pm.me"

RUN apk add gcc libc-dev git make autoconf

RUN git clone https://github.com/horta/hmmer.git /hmmer && cd /hmmer && git reset --hard 0a6d8bef0634f002fe649cff674e7a5f104af43e
RUN git clone https://github.com/horta/easel.git /hmmer/easel && cd /hmmer/easel && git reset --hard fc4a44acc0773125bb16dc13cf529adc99d6ddd6

ENV CFLAGS="-static"
RUN cd /hmmer && autoconf && ./configure && make && make dev
