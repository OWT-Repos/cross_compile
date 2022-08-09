#!/bin/sh

# Update and upgrade packages
sudo apt update
sudo apt upgrade -y

# Install minimum Qt5 requirements
sudo apt install -y \
    build-essential \
    libfontconfig1-dev \
    libdbus-1-dev \
    libfreetype6-dev \
    libicu-dev \
    libinput-dev \
    libxkbcommon-dev \
    libsqlite3-dev \
    libssl-dev \
    libpng-dev \
    libjpeg-dev \
    libglib2.0-dev \
    libraspberrypi-dev

# Wiring Pi Library
git clone https://github.com/WiringPi/WiringPi.git
cd WiringPi
./build
cd ..

#
sudo apt-get install gcc-multilib

# FFTW3 Library
sudo apt install -y libfftw3-dev

# Portaudio Library
sudo apt install -y portaudio19-dev

# gstreamer multimedia framework support
sudo apt install -y \
    libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-dev \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-plugins-bad \
    libgstreamer-plugins-bad1.0-dev \
    gstreamer1.0-pulseaudio \
    gstreamer1.0-tools \
    gstreamer1.0-alsa

# MySQL
sudo apt install -y \
    mariadb-server \
    mariadb-client \
    mariadb-common \
    mysql-common \
    libmariadb-dev-compat \
    libmariadbclient-dev \
    libqt5sql5-mysql \
    libts-dev

# Correct links to EGL and GLES Drivers
sudo rm /usr/lib/arm-linux-gnueabihf/libEGL.so.1.0.0
sudo rm /usr/lib/arm-linux-gnueabihf/libGLESv2.so.2.0.0
sudo ln -s /opt/vc/lib/libbrcmEGL.so /usr/lib/arm-linux-gnueabihf/libEGL.so.1.0.0
sudo ln -s /opt/vc/lib/libbrcmGLESv2.so /usr/lib/arm-linux-gnueabihf/libGLESv2.so.2.0.0

# Linux ALSA Audio support
sudo apt install -y libasound2-dev

# Pulseaudio support
sudo apt install -y pulseaudio libpulse-dev

# Wayland support
sudo apt install -y libwayland-dev

# X11 support
sudo apt install -y \
    libx11-dev \
    libxcb1-dev \
    libxext-dev \
    libxi-dev \
    libxcomposite-dev \
    libxcursor-dev \
    libxtst-dev \
    libxrandr-dev \
    libfontconfig1-dev \
    libfreetype6-dev \
    libx11-xcb-dev \
    libxext-dev \
    libxfixes-dev \
    libxi-dev \
    libxrender-dev \
    libxcb1-dev \
    libxcb-glx0-dev \
    libxcb-keysyms1-dev \
    libxcb-image0-dev \
    libxcb-shm0-dev \
    libxcb-icccm4-dev \
    libxcb-sync-dev \
    libxcb-xfixes0-dev \
    libxcb-shape0-dev \
    libxcb-randr0-dev \
    libxcb-render-util0-dev \
    libxcb-util0-dev \
    libxcb-xinerama0-dev \
    libxcb-xkb-dev \
    libxkbcommon-dev \
    libxkbcommon-x11-dev
