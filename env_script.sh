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
RPI4_IP=192.168.1.XXX

# Install host dependencies
sudo apt install -y \
    python-is-python3 \
    build-essential \
    pkg-config

# Create folders
echo -e "${CYAN}Creating folders${NC}"
mkdir -p /opt/rpi4/build
mkdir -p /opt/rpi4/tools
mkdir -p /opt/rpi4/sysroot
mkdir -p /opt/rpi4/sysroot/usr
mkdir -p /opt/rpi4/sysroot/opt
chown -R 1000:1000 /opt/rpi4

# Download Qt
cd /opt/rpi4
echo -e "${CYAN}Downloading Qt 5.15.2${NC}"
wget -nc http://download.qt.io/archive/qt/5.15/5.15.2/single/qt-everywhere-src-5.15.2.tar.xz
echo -e "${CYAN}Untar Qt 5.15.2${NC}"
tar xf qt-everywhere-src-5.15.2.tar.xz

# Modify mkspec
echo -e "${CYAN}Modifying mkspec${NC}"
cp -R qt-everywhere-src-5.15.2/qtbase/mkspecs/linux-arm-gnueabi-g++ qt-everywhere-src-5.15.2/qtbase/mkspecs/linux-arm-gnueabihf-g++
sed -i -e 's/arm-linux-gnueabi-/arm-linux-gnueabihf-/g' qt-everywhere-src-5.15.2/qtbase/mkspecs/linux-arm-gnueabihf-g++/qmake.conf

# Download linaro cross-compiler
echo -e "${CYAN}Downloading cross-compiler${NC}"
cd /opt/rpi4/tools
wget -nc https://releases.linaro.org/components/toolchain/binaries/7.4-2019.02/arm-linux-gnueabihf/gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf.tar.xz
tar xfv gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf.tar.xz

# Rsync folders
echo -e "${CYAN}Syncing folders${NC}"
cd /opt/rpi4
rsync -avz --rsync-path="sudo rsync" --delete pi@${RPI4_IP}:/lib sysroot/
rsync -avz --rsync-path="sudo rsync" --delete pi@${RPI4_IP}:/usr/include sysroot/usr/
rsync -avz --rsync-path="sudo rsync" --delete pi@${RPI4_IP}:/usr/lib sysroot/usr/

# Clean symbolic links
echo -e "${CYAN}Cleaning symbolic links${NC}"
cd /opt/rpi4
wget https://raw.githubusercontent.com/riscv/riscv-poky/master/scripts/sysroot-relativelinks.py
chmod +x sysroot-relativelinks.py
./sysroot-relativelinks.py sysroot
