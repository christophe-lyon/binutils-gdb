#!/bin/bash

set -ex

mkdir -p build
cd build
../configure --target $TARGET --enable-plugins --disable-gprof --disable-gdb --disable-gdbserver --disable-sim --disable-libdecnumber --disable-readline
make all
make check
sums=`find . -name "*.sum"`
# Exit with an error if FAIL or XPASS was found
egrep '^FAIL:|^XPASS:' $sums && false
