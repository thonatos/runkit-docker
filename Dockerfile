FROM node:11.6.0-alpine

WORKDIR /root

ENV YARN_VERSION 1.12.3

RUN apk add --no-cache --virtual .build-deps-yarn curl \
  && curl -fSLO --compressed "https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz" \
  && tar -xzf yarn-v$YARN_VERSION.tar.gz -C /opt/ \
  && ln -snf /opt/yarn-v$YARN_VERSION/bin/yarn /usr/local/bin/yarn \
  && ln -snf /opt/yarn-v$YARN_VERSION/bin/yarnpkg /usr/local/bin/yarnpkg \
  && rm yarn-v$YARN_VERSION.tar.gz \
  && apk del .build-deps-yarn  

COPY src/ /root

RUN yarn

EXPOSE 5000

CMD [ "npm", "start"]