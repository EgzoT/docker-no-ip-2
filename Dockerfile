FROM debian:stretch-slim

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install make
RUN apt-get install -y gcc

WORKDIR "/usr/local/src"
RUN wget http://www.no-ip.com/client/linux/noip-duc-linux.tar.gz
RUN tar xzf noip-duc-linux.tar.gz
WORKDIR "/usr/local/src/noip-2.1.9-1"
RUN make

ARG USERNAME
ARG PASSWORD
ARG INTERVAL

RUN if [ ! -d /usr/local/bin ]; then mkdir -p /usr/local/bin;fi
RUN if [ ! -d /usr/local/etc ]; then mkdir -p /usr/local/etc;fi
RUN cp noip2 /usr/local/bin/noip2
RUN /usr/local/bin/noip2 -C -U "${INTERVAL}" -u "${USERNAME}" -p "${PASSWORD}" -Y -c /tmp/no-ip2.conf
RUN mv /tmp/no-ip2.conf /usr/local/etc/no-ip2.conf

CMD /usr/local/bin/noip2 ; sleep infinity
