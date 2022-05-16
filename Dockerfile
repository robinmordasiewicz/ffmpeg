FROM jrottenberg/ffmpeg:4.4-ubuntu

ARG DEBIAN_FRONTEND=noninteractive
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt -y update --fix-missing
RUN apt -y upgrade
RUN fc-cache --really-force
RUN dpkg --configure -a

#RUN apt-get remove libfontconfig1
#RUN apt-get -y install libfontconfig1-dev 
RUN apt-get -y install apt-utils 
RUN apt-get -y install libterm-readline-gnu-perl build-essential sudo cmake python3 curl dirmngr apt-transport-https lsb-release ca-certificates pkg-config git gcc make yasm autoconf automake cmake libtool checkinstall wget software-properties-common libmp3lame-dev libunwind-dev zlib1g-dev mesa-utils libglu1-mesa-dev freeglut3-dev mesa-common-dev libglew-dev libglfw3-dev libglm-dev libao-dev libmpg123-dev libxt-dev libxi-dev libgl-dev libx11-dev texlive-xetex fonts-dejavu-core ucf libfontconfig1 libfreetype6 libpng16-16

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get -y install nodejs
#RUN apt-get -y install --reinstall --purge fontconfig-config fontconfig
#RUN fc-cache --really-force
#RUN apt-get -y install --reinstall --purge fontconfig fonts-dejavu-core ucf libfontconfig1 libfreetype6 libpng16-16

# RUN apt-get -y install libvips42 libvips-tools
#RUN apt-get -y install texlive-xetex
#RUN apt-get -y install pkg-config
#RUN dpkg --configure -a
##RUN apt update
#RUN apt -y install curl dirmngr apt-transport-https lsb-release ca-certificates
#RUN dpkg --configure -a
#RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -

#RUN DEBIAN_FRONTEND=noninteractive apt-get install -qq texlive-xetex < /dev/null > /dev/null
#RUN DEBIAN_FRONTEND=noninteractive apt-get install -qq pkg-config < /dev/null > /dev/null
#RUN dpkg --configure -a

RUN groupadd -g 1000 ubuntu
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g 1000 -G sudo -u 1000 ubuntu
RUN touch /home/ubuntu/.sudo_as_admin_successful
RUN touch /home/ubuntu/.hushlogin
RUN chown -R ubuntu:ubuntu /home/ubuntu
USER ubuntu:ubuntu
WORKDIR /home/ubuntu
ENV NPM_CONFIG_PREFIX=/home/ubuntu/.npm-global
ENV PATH=$PATH:/home/ubuntu/.npm-global/bin

#RUN npm install --save gl
#RUN npm install --save gl-transitions
#RUN npm install --save ffmpeg-concat
#RUN npm i ffmpeg-concat

