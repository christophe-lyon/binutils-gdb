#!/bin/bash

set -e

mkdir -p build
cd build
../configure --target $TARGET --enable-plugins --disable-gprof --disable-gdb --disable-gdbserver --disable-sim --disable-libdecnumber --disable-readline
make all
make check
sums=`find . -name "*.sum"`
egrep '^FAIL:|^XPASS:' $sums
