#!/bin/sh

[ -f "makefile" ] && make clean
INCLUDES=`ls *.h`
./configure.sh $@ && make

ROOT="lingeling-bcp"

BIN="$ROOT/usr/bin"
LIB="$ROOT/usr/lib"
LINGELING="$ROOT/usr/include/lingeling"

rm -r "$ROOT/usr"
mkdir -p $BIN
mkdir -p $LIB
mkdir -p $LINGELING

mv liblgl.a $LIB
sed -n "/^targets:/{/\\.a/d;/targets:\\s*$/d;s/targets:\\s*//;p}" makefile \
	| tr ' ' '\n' | xargs mv -t $BIN
cp -t $LINGELING $INCLUDES
dpkg-deb --build --root-owner-group "lingeling-bcp"
