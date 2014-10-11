FROM dockerfile/ubuntu
MAINTAINER namhoon(emerald105@hanmail.net)

# Install basic packages
RUN \
  cd /tmp && \
  wget http://download.redis.io/redis-stable.tar.gz && \
  tar xvzf redis-stable.tar.gz && \
  cd redis-stable && \
  make && \
  make install && \
  cp -f src/redis-sentinel /usr/local/bin && \
  mkdir -p /etc/redis && \
  cp -f *.conf /etc/redis && \
  rm -rf /tmp/redis-stable* && \
  sed -i 's/^\(daemonize .*\)$/daemonize true/' /etc/redis/redis.conf && \
  sed -i 's/^\(dir .*\)$/# \1\ndir \/data/' /etc/redis/redis.conf && \
  sed -i 's/^\(logfile .*\)$/# \1/' /etc/redis/redis.conf && \
  sed -i 's/^\(port \d*\)$/port 8521/' /etc/redis/redis.conf
# sed -i 's/^\(logfile .*\)$/# \1/' /etc/redis/redis.conf && \ # logging off
# sed -i 's/^\(bind .*\)$/# \1/' /etc/redis/redis.conf && \ # bind 127.0.0.1

VOLUME ["/data"]

CMD ["redis-server", "/etc/redis/redis.conf"]

EXPOSE 8521
