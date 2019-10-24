FROM ruby:2.1.10

COPY ./ /usr/src
WORKDIR /usr/src

RUN bundle
CMD rails s -p $PORT
