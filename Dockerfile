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

RUN stack setup 7

# Install dependencies
COPY LICENSE /opt/webapp/
COPY Setup.hs /opt/webapp/
COPY learn-servant.cabal /opt/webapp/
COPY stack.yaml /opt/webapp/
WORKDIR /opt/webapp
RUN stack install --only-dependencies

# Install source
COPY app /opt/webapp/app
COPY src /opt/webapp/src
COPY test /opt/webapp/test
COPY Makefile /opt/webapp/Makefile
RUN make style
RUN stack install

# Run the app.  CMD is required to run on Heroku
# $PORT is set by Heroku
CMD /home/myuser/.local/bin/learn-servant-exe
