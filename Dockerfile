# FROM ruby:2.7.6
FROM ruby:3.2.2

WORKDIR /usr/src/app

# 以下の行を追加して、RubyとBundlerのバージョンを指定
RUN echo "ruby '3.1.0'" > Gemfile
RUN gem install bundler:2.3.3

COPY Gemfile Gemfile.lock package.json docker-entrypoint.sh ./
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
# RUN apt-get install -y nodejs
# npmを含めてインストール
RUN apt-get install -y nodejs npm
RUN npm install -g yarn
RUN chmod 777 /usr/src/app/docker-entrypoint.sh

# # Bundlerのバージョンをアップグレード
# RUN gem install bundler:2.2.17

ENTRYPOINT ["sh", "/usr/src/app/docker-entrypoint.sh"]