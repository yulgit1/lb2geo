FROM drecom/centos-ruby

MAINTAINER Eric James <eric.james@yale.edu>

RUN yum install -y sudo
RUN sudo yum install -y rubygems

RUN sudo yum install -y gcc g++ make automake autoconf curl-devel openssl-devel zlib-devel httpd-devel apr-devel apr-util-devel sqlite-devel
RUN sudo yum install -y ruby-rdoc ruby-devel

RUN yum install -y mysql

RUN yum install -y freetds

#RUN wget ftp://ftp.freetds.org/pub/freetds/stable/freetds-1.00.21.tar.gz && \
#    tar -xzf freetds-1.00.21.tar.gz && \
#    cd freetds-1.00.21 && \
#    ./configure --prefix=/usr/local --with-tdsver=7.3 && \
#    make && \
#    make install


WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install
# Configure the main working directory. This is the base
# directory used in any further RUN, COPY, and ENTRYPOINT
# commands.
RUN mkdir -p /app
WORKDIR /app

# Copy the Gemfile as well as the Gemfile.lock and install
# the RubyGems. This is a separate step so the dependencies
# will be cached unless changes to one of those two files
# are made.
#COPY Gemfile Gemfile.lock ./
#RUN gem install bundler && bundle install --jobs 20 --retry 5

# Copy the main application.
COPY . ./

# Expose port 3000 to the Docker host, so we can access it
# from the outside.
EXPOSE 3000

# The main command to run when the container starts. Also
# tell the Rails dev server to bind to all interfaces by
# default.
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
#CMD ["bin/rails", "console"]