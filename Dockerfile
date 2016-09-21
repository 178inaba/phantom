FROM alpine
MAINTAINER 178inaba <178inaba@users.noreply.github.com>

ENV INSTALL_PKG "nodejs git imagemagick"
RUN apk update && apk add --no-cache $INSTALL_PKG || \
    (sed -i -e "s/dl-cdn/dl-4/g" /etc/apk/repositories && apk update && apk add --no-cache $INSTALL_PKG)
RUN rm -frv /var/cache/apk/*

RUN mkdir -p /bot/src/app
COPY . /bot/src/app
WORKDIR /bot/src/app

RUN npm install

CMD ["bin/hubot", "-a", "hipchat"]
