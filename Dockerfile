
FROM ruby:3.1.0-slim

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  default-libmysqlclient-dev \
  git \
  libpq-dev \
  libvips \
  pkg-config \
  bash \
  bash-completion \
  libffi-dev \
  tzdata \
  postgresql \
  nodejs \
  npm \
  yarn \
  imagemagick \
  chromium \
  chromium-driver

# DEFINE PATH
ENV INSTALL_PATH /consult_gpt

RUN mkdir -p "/root/.config/chromium/Crash Reports/pending"

# CREATE DIR
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

# BUILD GEMFILE
COPY Gemfile Gemfile.lock ./
RUN bundle install

# COPY PROJECT FOR CONTAINER
COPY . $INSTALL_PATH

RUN bundle install

EXPOSE 3000