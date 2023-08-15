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
      && apt-get install sudo -y \
      && apt-get install python3 -y \
      && apt-get install python3-pip -y \
      && apt-get install git binutils -y

RUN git clone https://github.com/aws/efs-utils

RUN cd /aws/efs-utils && ./build-deb.sh && apt-get install ./build/amazon-efs-utils*deb -y

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install boto3 botocore --upgrade

WORKDIR /home

RUN wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz \
  && tar xvf steamcmd_linux.tar.gz

RUN chown root:root steamcmd.sh

RUN rm steamcmd_linux.tar.gz*

COPY install_valheim.txt .

RUN /bin/bash ./steamcmd.sh +runscript install_valheim.txt

EXPOSE 2456/udp
EXPOSE 2457/udp

WORKDIR /root/.config/unity3d/IronGate/Valheim

COPY start_server.sh .
RUN mkdir -p /root/.config/unity3d/IronGate/Valheim/
RUN chmod 777 /root/.config/unity3d/IronGate/Valheim/ -R

COPY adminlist.txt /root/.config/unity3d/IronGate/Valheim/config/adminlist.txt

RUN chmod +x start_server.sh

ENTRYPOINT [ "./start_server.sh" ]