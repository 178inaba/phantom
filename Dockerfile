FROM alpine

RUN apk add --no-cache nodejs

RUN mkdir -p /bot/src/app
COPY . /bot/src/app
WORKDIR /bot/src/app

RUN npm install

CMD ["bin/hubot", "-a", "hipchat"]
