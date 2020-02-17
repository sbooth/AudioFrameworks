#!/bin/sh

if [ ! -d "$1" ]; then
	echo "'$1' does not exist.  aborting."
	echo "try something like: ../SFBAudioEngine/Frameworks"
	exit
fi

WRK_DIR="${1}"
ARCH="macosx-x86_64-clang-libc++"

LIBRARIES_DIR="${WRK_DIR}/dist/Libraries/${ARCH}"

BUILD_DIR="${WRK_DIR}/build"

function _library
{
	NAME="${1}"

	mkdir -p "${LIBRARIES_DIR}/include/${NAME}"

	cp -R "${BUILD_DIR}/${NAME}/include"/* "${LIBRARIES_DIR}/include/${NAME}"
	cp -R "${BUILD_DIR}/${NAME}"/*.a "${LIBRARIES_DIR}/lib"
}

function _dylib
{
	NAME="${1}"

	mkdir -p "${LIBRARIES_DIR}/include/${NAME}"

	cp -R "${BUILD_DIR}/${NAME}/include"/* "${LIBRARIES_DIR}/include/${NAME}"
	cp -R "${BUILD_DIR}/${NAME}"/*.dylib "${LIBRARIES_DIR}/lib"
}

mkdir -p "${LIBRARIES_DIR}/include"
mkdir -p "${LIBRARIES_DIR}/lib"

_dylib "mpg123"
_dylib "sndfile"
_dylib "tta++"

_library "dumb"
_library "FLAC"
_library "mac"
_library "mp4v2"
_library "mpcdec"
_library "ogg"
_library "opus" # + opusfile
_library "speex"
_library "taglib"
_library "vorbis" # + vorbisfile
_library "wavpack"
_library "zlib"

# and because of an `SFBAudioEngine` inconsistency...
mv "${LIBRARIES_DIR}/include/mpcdec" "${LIBRARIES_DIR}/include/mpc"

# prefix with `opus/` because search paths ¯\_(ツ)_/¯
perl -pi -e 's/<opus_multistream.h>/<opus\/opus_multistream.h>/g' "${LIBRARIES_DIR}/include/opus/opusfile.h"