FROM ruby:2.6.3-slim-stretch

RUN apt-get update && apt-get install -y \
  curl \
  build-essential \
  libpq-dev &&\
  curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y nodejs yarn

RUN mkdir /app
WORKDIR /app

COPY Gemfile .
COPY Gemfile.lock .
RUN gem update bundler
RUN bundle install --without test development

COPY package.json .
COPY yarn.lock .
RUN yarn install --ignore-engines
COPY . .
RUN SECRET_KEY_BASE=1 NODE_ENV=production RAILS_ENV=production bundle exec rake assets:precompile

EXPOSE 3000

CMD rails s
