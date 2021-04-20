#!/bin/sh

[ -f "makefile" ] && make clean
INCLUDES=`ls *.h`
./configure.sh $@-O3 -march=native && make

BIN="usr/bin"
LIB="usr/lib"
LGL="usr/include/lgl"

rm -r "usr"
mkdir -p $BIN
mkdir -p $LIB
mkdir -p $LGL

mv liblgl.a $LIB
sed -n "/^targets:/{/\\.a/d;/targets:\\s*$/d;s/targets:\\s*//;p}" makefile \
	| tr ' ' '\n' | xargs mv -t $BIN
cp -t $LGL $INCLUDES
dpkg-deb --build --root-owner-group .
mv ..deb lingeling-1.0.0-1.deb
