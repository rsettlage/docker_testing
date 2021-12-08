FROM ubuntu:xenial

RUN apt update && \
    apt upgrade -y && \
    apt install -y wget gnupg && \
    echo "deb https://qgis.org/ubuntu-ltr bionic main" >> /etc/apt/sources.list && \
    echo "deb-src https://qgis.org/ubuntu-ltr bionic main" >> /etc/apt/sources.list

#    wget -O - https://qgis.org/downloads/qgis-2019.gpg.key | gpg --import && \
#    apt-key adv --keyserver keyserver.ubuntu.com --recv-key 51F523511C7028C3 && \
#    apt update && \
#    ln -s -f /usr/share/zoneinfo/America/New_York /etc/localtime && \
#    DEBIAN_FRONTEND=noninteractive apt install -y qgis=1:3.4.12+28bionic qgis-plugin-grass && \
RUN apt install -y qgis && \
    apt autoclean && \
    apt autoremove --purge -y && \
    rm -rf /var/lib/apt/lists/*
