#!/bin/sh

# Create folders
mkdir ~/raspberrypi4/build
mkdir ~/raspberrypi4/tools
mkdir ~/raspberrypi4/sysroot
mkdir ~/raspberrypi4/sysroot/usr
mkdir ~/raspberrypi4/sysroot/opt
chown -R 1000:1000 ~/raspberrypi4
cd ~/raspberrypi4

# Download Qt
#wget http://download.qt.io/archive/qt/5.15/5.15.2/single/qt-everywhere-src-5.15.2.tar.xz
#tar xf qt-everywhere-src-5.15.2.tar.xz

# Modify mkspec
#cp -R qt-everywhere-src-5.15.2/qtbase/mkspecs/linux-arm-gnueabi-g++ qt-everywhere-src-5.15.2/qtbase/mkspecs/linux-arm-gnueabihf-g++
#sed -i -e 's/arm-linux-gnueabi-/arm-linux-gnueabihf-/g' qt-everywhere-src-5.15.2/qtbase/mkspecs/linux-arm-gnueabihf-g++/qmake.conf

# Download linaro cross-compiler
#cd tools
#wget https://releases.linaro.org/components/toolchain/binaries/7.4-2019.02/arm-linux-gnueabihf/gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf.tar.xz
#tar xfv gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf.tar.xz

# Rsync folders
cd ~/raspberrypi4
rsync -avz --rsync-path="sudo rsync" --delete pi@10.199.203.23:/lib sysroot/
rsync -avz --rsync-path="sudo rsync" --delete pi@10.199.203.23:/usr/include sysroot/usr/
rsync -avz --rsync-path="sudo rsync" --delete pi@10.199.203.23:/usr/lib sysroot/usr/
rsync -avz --rsync-path="sudo rsync" --delete pi@10.199.203.23:/opt/vc sysroot/opt/

# Clean symbolic links
#wget https://raw.githubusercontent.com/riscv/riscv-poky/master/scripts/sysroot-relativelinks.py
#chmod +x sysroot-relativelinks.py
#./sysroot-relativelinks.py sysroot