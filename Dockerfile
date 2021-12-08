FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt upgrade -y && \
    apt install -y wget gnupg software-properties-common && \
    apt-get update && \
    wget -qO - https://qgis.org/downloads/qgis-2021.gpg.key | \
    gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/qgis-archive.gpg --import && \
    chmod a+r /etc/apt/trusted.gpg.d/qgis-archive.gpg \
    add-apt-repository "deb https://qgis.org/ubuntu $(lsb_release -c -s) main" && \
    apt-get update 

RUN apt install -y qgis qgis-plugin-grass && \
    apt autoclean && \
    apt autoremove --purge -y && \
    rm -rf /var/lib/apt/lists/*
