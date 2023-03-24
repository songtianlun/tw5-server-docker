FROM alpine:3.17.2

ADD ./tw5-server.rb /usr/local/bin/tw5-server.rb
ADD run /usr/local/bin/run

ARG SOURCE_COMMIT
LABEL maintainer="Tianlun Song <tianlun.song@foxmail.com>"
LABEL source="https://github.com/songtianlun/tw5-server-docker"
LABEL source-commit="${SOURCE_COMMIT:-unknown}"

ENV TW5_FILE ${TW5_FILE:-index.html}
ENV LANG en_US.UTF-8
ENV RUBY_BIN /usr/bin/ruby
ENV RUBY_APP /usr/local/bin/tw5-server.rb
ENV WORK_DIR /tiddlywiki

ENV LANG=en_US.UTF-8


RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
	apk update && \
	apk add --no-cache tini ruby ruby-webrick libintl icu-libs && \
	rm -rf /var/cache/apk/* && \
	chmod +x /usr/local/bin/run

VOLUME /tiddlywiki

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/run"]
