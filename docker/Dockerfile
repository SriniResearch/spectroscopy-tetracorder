#Download base image ubuntu 20.04
FROM ubuntu:20.04

# LABEL about the custom image
LABEL maintainer="srinivasan@cmu.edu"
LABEL version="0.1"
LABEL description="This is a docker image for tetracorder system"

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# Update Ubuntu Software repository
RUN apt update --fix-missing

# Install Emacs and tmux
RUN apt install -y emacs tmux tar

# Install dependencies for davinci
RUN apt install -y gdal-bin libcfitsio8 libcurl4-openssl-dev gnuplot

# Dependencies for tetracorder
RUN apt install -y vim java-common default-jdk  default-jdk-doc gcc g++ gfortran ratfor  gfortran-doc make
RUN apt install -y libpng-dev libjbig-dev:amd64 libjbig0:amd64 libjbig2dec0 libjbig2dec0-dev jbig2dec jbigkit-bin libjpeg8-dev
RUN apt install -y  zlib1g zlib1g-dev libx11-dev glibc-doc glibc-doc-reference inotify-tools 

# imagemagick pbm    # image processing tools
RUN apt install -y imagemagick imagemagick-common imagemagick-doc netpbm libxpm-dev libxt-dev libpng-dev libjbig-dev libjbig0 libjbig2dec0 libjbig2dec0-dev
RUN apt install -y jbig2dec jbigkit-bin libjpeg8-dev zlib1g zlib1g-dev 
RUN apt install -y tcsh csh  gnuplot-x11 tgif fort77
RUN apt install -y ratfor
RUN apt install -y htop
RUN apt install -y wget

#Install i386 packages
RUN dpkg --add-architecture i386
RUN apt update
RUN apt install -y libjbig0:i386 zlib1g:i386

RUN apt install -y vim-tiny less time
#RUN apt-get autoremove

# after installation, remove all package cache and reduce custom image size
#RUN rm -rf /var/lib/apt/lists/* && \
#    apt clean

#define default command for the container
CMD ["/bin/bash"]

# Copy the install script
COPY install_tetracorder.sh /root/install_tetracorder.sh

# Run tetracorder install script
#RUN bash /root/install_tetracorder.sh


# Create the install directory to copy necessary files
#ENV INSTALL_DIR /root/install-files
# Copy installation files from host to container
#RUN mkdir -p ${INSTALL_DIR}


