FROM debian 
RUN dpkg --add-architecture i386 \
    && apt -y update \
    && apt-get -y install libstdc++6:i386 libgcc1:i386 libcurl4-gnutls-dev:i386 \
    && apt-get -y install  libstdc++6 libgcc1 libcurl4-gnutls-dev \
    && apt -y install wget \
    && mkdir /steamcmd \
    && wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz -O /steamcmd/steamcmd_linux.tar.gz \
    && tar -xzvf /steamcmd/steamcmd_linux.tar.gz -C /steamcmd 
WORKDIR /steamcmd
RUN mkdir /barotruama \
    && /steamcmd/steamcmd.sh +force_install_dir /barotruama +login anonymous +app_update 1026340 +quit 
WORKDIR /barotruama
