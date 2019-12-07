#!/bin/sh

if [ ! -d "$1" ]; then
	echo "'$1' does not exist.  aborting."
	echo "try something like: ../SFBAudioEngine/Frameworks"
	exit
fi

DO_CLEAN=1

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
            
exit

rm -rf $1/*

_xcodebuild "cdparanoia/cdparanoia.xcodeproj" \
            "cdparanoia.framework" \
            "cdparanoia"

_xcodebuild "cuetools/cuetools.xcodeproj" \
            "cuetools.framework" \
            "cuetools"

_xcodebuild "discid/discid.xcodeproj" \
            "discid" \
            "discid"

# _xcodebuild "dumb/dumb.xcodeproj" \
#             "dumb-OSX" \
#             "dumb"

_xcodebuild "flac/flac.xcodeproj" \
            "Framework" \
            "FLAC"

_xcodebuild "lame/lame.xcodeproj" \
            "Framework" \
            "lame"

_xcodebuild "mac/mac.xcodeproj" \
            "mac.framework" \
            "mac"

_xcodebuild "mad/mad.xcodeproj" \
            "mad.framework" \
            "mad"

_xcodebuild "mp4v2/mp4v2.xcodeproj" \
            "mp4v2.framework" \
            "mp4v2"

_xcodebuild "MPCDec/MPCDec.xcodeproj" \
            "mpcdec Framework" \
            "mpcdec"

# _xcodebuild "mpg123/mpg123.xcodeproj" \
#             "mpg123" \
#             "mpg123"

# _xcodebuild "musepack/musepack.xcodeproj" \
#             "mpcdec" \
#             "mpcdec"

_xcodebuild "musicbrainz3/musicbrainz3.xcodeproj" \
            "musicbrainz3" \
            "musicbrainz3"

_xcodebuild "ogg/ogg.xcodeproj" \
            "ogg.framework" \
            "ogg"

# _xcodebuild "opus/opus.xcodeproj" \
#             "opus" \
#             "opus"

# _xcodebuild "opus/opus.xcodeproj" \
#             "opusfile" \
#             "opus"

_xcodebuild "shorten/shorten.xcodeproj" \
            "shorten.framework" \
            "shorten"

_xcodebuild "sndfile/sndfile.xcodeproj" \
            "sndfile.framework" \
            "sndfile"

_xcodebuild "speex/speex.xcodeproj" \
            "speex.framework" \
            "speex"

_xcodebuild "taglib/taglib.xcodeproj" \
            "taglib.framework" \
            "taglib"

# _xcodebuild "tta++/tta++.xcodeproj" \
#             "tta++" \
#             "tta++"

_xcodebuild "vorbis/vorbis.xcodeproj" \
            "vorbis.framework" \
            "vorbis"

# _xcodebuild "vorbis/vorbis.xcodeproj" \
#             "vorbisfile" \
#             "vorbis"

_xcodebuild "wavpack/wavpack.xcodeproj" \
            "Framework" \
            "wavpack"

# _xcodebuild "zlib/zlib.xcodeproj" \
#             "z" \
#             "zlib"