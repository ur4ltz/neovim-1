#!/usr/bin/env bash

unset LUA_PATH LUA_CPATH

rm -r build/
mkdir build

pushd build

cmake .. \
	-DCMAKE_SKIP_RPATH=ON \
	-DCMAKE_VERBOSE_MAKEFILE=OFF \
	-DCMAKE_COLOR_MAKEFILE=ON \
	-DCMAKE_INSTALL_PREFIX:PATH=$HOME/neovim \
	-DCMAKE_BUILD_TYPE=RelWithDebInfo \
	-DLUA_PRG:FILEPATH=/usr/bin/luajit \
	-DLUV_INCLUDE_DIR:PATH=/usr/include/luv \
	-DLUV_LIBRARY=/usr/lib/libluv.so

make
make install

popd
