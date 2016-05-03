#!/bin/sh

if [ ! -d "$1" ]; then
	echo "'$1' does not exist.  aborting."
	echo "try something like: ../SFBAudioEngine/Frameworks"
	exit
fi

DO_CLEAN=1
rm -rf $1/*

WRK_DIR="${1}"
CONFIGURATION="Release"

function _xcodebuild
{
	XCODEPROJ_PATH=$1
	TARGET=$2
	NAME=$3

	PARAMS="-configuration ${CONFIGURATION}
		CONFIGURATION_BUILD_DIR=${WRK_DIR}/build/${NAME}
		PRIVATE_HEADERS_FOLDER_PATH=/include
		PUBLIC_HEADERS_FOLDER_PATH=/include
		"

	if [ $DO_CLEAN -ne 0 ]; then
		xcodebuild -project "${XCODEPROJ_PATH}" clean
	fi
	xcodebuild -project "${XCODEPROJ_PATH}" -target "${TARGET}" ${PARAMS} 
}

_xcodebuild "dumb/dumb.xcodeproj" \
            "dumb-OSX" \
            "dumb"

_xcodebuild "flac/flac.xcodeproj" \
            "libFLAC" \
            "FLAC"

_xcodebuild "mac/mac.xcodeproj" \
            "mac" \
            "mac"

_xcodebuild "mp4v2/mp4v2.xcodeproj" \
            "mp4v2" \
            "mp4v2"

_xcodebuild "mpg123/mpg123.xcodeproj" \
            "mpg123.framework" \
            "mpg123"

_xcodebuild "musepack/musepack.xcodeproj" \
            "mpcdec" \
            "mpcdec"

_xcodebuild "ogg/ogg.xcodeproj" \
            "ogg" \
            "ogg"

_xcodebuild "opus/opus.xcodeproj" \
            "opus" \
            "opus"

_xcodebuild "opus/opus.xcodeproj" \
            "opusfile" \
            "opus"

_xcodebuild "sndfile/sndfile.xcodeproj" \
            "sndfile.framework" \
            "sndfile"

_xcodebuild "speex/speex.xcodeproj" \
            "speex" \
            "speex"

_xcodebuild "taglib/taglib.xcodeproj" \
            "tag" \
            "taglib"

_xcodebuild "vorbis/vorbis.xcodeproj" \
            "vorbis" \
            "vorbis"

_xcodebuild "vorbis/vorbis.xcodeproj" \
            "vorbisfile" \
            "vorbis"

_xcodebuild "wavpack/wavpack.xcodeproj" \
            "libwavpack" \
            "wavpack"

_xcodebuild "zlib/zlib.xcodeproj" \
            "z" \
            "zlib"