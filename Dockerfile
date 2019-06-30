FROM ruby:2.5-alpine
EXPOSE 5001
WORKDIR /app
COPY . /app
RUN bundle install
CMD ["bundle", "exec", "rackup"]
