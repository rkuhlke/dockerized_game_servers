FROM debian:buster-slim

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \ 
      && apt-get install wget -y \
      && dpkg --add-architecture i386 \
      && apt-get update \
      && apt-get install lib32gcc1 -y \
      && apt-get install curl -y \
      && apt-get install unzip \
      && useradd ec2-user \
      && apt-get install sudo -y \
      && apt-get install wine -y \
      && apt-get install vnc-server -y

WORKDIR /home

RUN wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz \
  && tar xvf steamcmd_linux.tar.gz

RUN chown root:root steamcmd.sh

RUN rm steamcmd_linux.tar.gz*

COPY install_wreckfest.txt .

RUN /bin/bash ./steamcmd.sh +runscript install_wreckfest.txt

EXPOSE 27015/udp
EXPOSE 27016/udp
EXPOSE 33540/udp
EXPOSE 27015/tcp

WORKDIR /home/wreckfest

COPY server_config.cfg .

# COPY start_server.sh .

# RUN chmod +x start_server.sh

# ENTRYPOINT [ "./start_server.sh" ]