FROM python:3.7.5-slim-stretch

RUN mkdir -p /usr/share/man/man1
RUN mkdir -p /usr/share/man/man7
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y curl vim telnet procps jq netcat postgresql-client

RUN pip install requests ipython

CMD /bin/sh -c "while true; do echo $(date); sleep 60;done"