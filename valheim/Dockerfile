FROM debian:bullseye-slim

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \ 
      && apt-get install wget -y \
      && dpkg --add-architecture i386 \
      && apt-get update \
      && apt-get install lib32gcc-s1 -y \
      && apt-get install curl -y \
      && apt-get install unzip \
      && useradd ec2-user \
      && apt-get install sudo -y

WORKDIR /home

RUN wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz \
  && tar xvf steamcmd_linux.tar.gz

RUN chown root:root steamcmd.sh

RUN rm steamcmd_linux.tar.gz*

COPY install_valheim.txt .

RUN /bin/bash ./steamcmd.sh +runscript install_valheim.txt

EXPOSE 2456/udp
EXPOSE 2457/udp

WORKDIR /home/valheim

COPY start_server.sh .

COPY adminlist.txt /home/valheim/config/adminlist.txt

RUN chmod +x start_server.sh

ENTRYPOINT [ "./start_server.sh" ]