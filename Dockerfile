FROM ruby:2.5.0

MAINTAINER Russell Trow <russell.trow@container-solutions.com>

# Install Dependencies
ENV BUILD_PACKAGES net-tools
RUN apt-get update -qq && \
    apt-get install -y $BUILD_PACKAGES

# Metadata as defined at http://label-schema.org
LABEL org.label-schema.build-date=="2018-03-26T12:00:00.00Z" \
      org.label-schema.name="GKE Experimenting" \
      org.label-schema.vcs-url="https://github.com/russelltrow/gke-pgk" \
      org.label-schema.vcs-type="Git"

# Install gems
ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY Gemfile* $APP_HOME/
RUN bundle install

# Upload source
COPY . $APP_HOME

# Start Server
ENV PORT 9292
EXPOSE 9292
CMD ["ruby", "web.rb"]