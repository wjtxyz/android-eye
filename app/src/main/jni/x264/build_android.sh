#!/bin/bash
set -x
API=14
NDK=/home/wangjt/android-ndk-r17c
SYSROOT=$NDK/platforms/android-$API/arch-arm/
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64
function function_one
{
./configure \
  --prefix=$PREFIX \
  --enable-static \
  --host=arm-linux \
  --enable-pic \
  --disable-cli \
  --cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
  --sysroot=$SYSROOT \
  --extra-cflags="-I$NDK/sysroot/usr/include/arm-linux-androideabi -isysroot $NDK/sysroot -fPIC -DANDROID -D__thumb__ -mthumb -Wfatal-errors -Wno-deprecated -mfloat-abi=softfp -marm -march=armv7-a" \

make clean all
make 
make install
}
CPU=armv7-a
PREFIX=$(pwd)/android/$CPU
function_one
