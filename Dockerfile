FROM alpine:3.7

ENV http_proxy=http://10.43.216.8:8080
ENV https_proxy=http://10.43.216.8:8080

USER root

RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/main --repository http://dl-cdn.alpinelinux.org/alpine/edge/community && \
    apk update && \
    apk upgrade && \
    apk add bash openjdk8 curl git && \
    rm -rf /var/cache/apk/*

RUN ln -s /mnt/work/dev/volumes/cloudbox/.kube /root/.kube && \
    ln -s /mnt/work/dev/volumes/cloudbox/bin/kubectl /usr/local/bin/kubectl && \
    ln -s /mnt/work/dev/volumes/cloudbox/bin/helm /usr/local/bin/helm

ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV PATH $JAVA_HOME:$PATH
ENV http_proxy=
ENV https_proxy=

WORKDIR /root

CMD ["bash"]
