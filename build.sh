#!/bin/bash

CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${RED}Before proceding, add your sudo ssh key in the RPi4${NC}"
echo -e "${RED}to bypass the password input prompt from the rsync command${NC}"

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit
fi

# Raspberry Pi 4 IP
RPI4_IP=192.168.1.175

# Configure Qt 5.15.2
cd /opt/rpi4/build
../qt-everywhere-src-5.15.2/configure -release -opengl es2 -eglfs -device linux-rpi64-vc4-g++ \
    -device-option CROSS_COMPILE=/opt/rpi4/tools/gcc-linaro-7.4.1-2019.02-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu- \
    -sysroot /opt/rpi4/sysroot \
    -prefix /usr/local/qt5.15 \
    -extprefix /opt/rpi4/qt5.15 \
    -opensource -confirm-license \
    -skip qtscript -skip qtwayland -skip qtwebengine -nomake tests -make libs -pkg-config -no-use-gold-linker -v -recheck \
    -sql-mysql MYSQL_INCDIR=/opt/rpi4/sysroot/usr/include/mysql MYSQL_LIBDIR=/opt/rpi4/sysroot/usr/lib/aarch64-linux-gnu \
    -no-feature-eglfs_brcm

# Make and install locally Qt 5.15.2
sudo make -j4
sudo make install

# Sync local Qt 5.15.2 with Raspberry Pi 4
rsync -avz --rsync-path="sudo rsync" /opt/rpi4/qt5.15 pi@${RPI4_IP}:/usr/local
