#!/bin/sh
cd build
../qt-everywhere-src-5.15.2/configure -release -opengl es2 -eglfs -device linux-rasp-pi4-v3d-g++ \
-device-option CROSS_COMPILE=~/raspberrypi4/tools/gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf- \
-sysroot ~/raspberrypi4/sysroot \
-prefix /usr/local/qt5.15 \
-extprefix ~/raspberrypi4/qt5.15 \
-opensource -confirm-license \
-skip qtscript -skip qtwayland -skip qtwebengine -nomake tests -make libs -pkg-config -no-use-gold-linker -v -recheck