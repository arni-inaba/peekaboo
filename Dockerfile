FROM python:3.7.5-slim-stretch

RUN mkdir -p /usr/share/man/man1
RUN mkdir -p /usr/share/man/man7
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y curl vim gcc make telnet procps jq netcat postgresql-client

RUN cd /tmp \
 && curl -O http://download.redis.io/redis-stable.tar.gz \
 && tar xvzf redis-stable.tar.gz \
 && cd redis-stable \
 && make \
 && cp src/redis-cli /usr/local/bin/ \
 && chmod 755 /usr/local/bin/redis-cli

RUN pip install requests ipython

CMD /bin/sh -c "while true; do echo $(date); sleep 5;done"