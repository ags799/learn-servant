FROM centos:7

# Add stack's source repository
RUN curl -sSL https://download.fpcomplete.com/centos/7/fpco.repo | tee /etc/yum.repos.d/fpco.repo
# Install stack
RUN yum -y install gcc-c++ libstdc++-static zlib-static stack

# Run the image as a non-root user
RUN adduser myuser
RUN mkdir -p /opt/webapp
RUN chown -R myuser:myuser /opt/webapp
USER myuser

RUN stack setup

# Copy source
COPY LICENSE /opt/webapp/
COPY Setup.hs /opt/webapp/
COPY app /opt/webapp/app
COPY learn-servant.cabal /opt/webapp/
COPY src /opt/webapp/src
COPY stack.yaml /opt/webapp/
COPY test /opt/webapp/test

# Install dependencies
WORKDIR /opt/webapp
RUN stack install

# Run the app.  CMD is required to run on Heroku
# $PORT is set by Heroku
CMD /home/myuser/.local/bin/learn-servant-exe
