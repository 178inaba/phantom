FROM alpine

ENV INSTALL_PKG "nodejs git imagemagick"
RUN apk add --no-cache $INSTALL_PKG || \
    (sed -i -e "s/dl-cdn/dl-4/g" /etc/apk/repositories && apk add --no-cache $INSTALL_PKG)

RUN mkdir -p /bot/src/app
COPY . /bot/src/app
WORKDIR /bot/src/app

RUN npm install

CMD ["bin/hubot", "-a", "hipchat"]
