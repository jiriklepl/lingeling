# Lingeling DEB package

These are the sources of the SAT solver Lingeling.

The file VERSION contains the current version number.

## Build

To build everything issue:

```sh
./build.sh
```

Or, to build with optimizations:

```sh
./build.sh -O3 -march=native
```

## Install

To install, after building, issue:

```sh
sudo dpkg -i lingeling-bcp.deb
```

## Copyright

Copyright, authors and license are described in COPYING.

A more recent version of Lingeling might be found at

  [http://fmv.jku.at/lingeling](http://fmv.jku.at/lingeling)

and this site might also contain more documentation.
