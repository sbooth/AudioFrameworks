#!/bin/sh

if [ ! -d "$1" ]; then
	echo "'$1' does not exist.  aborting."
	echo "try something like: ../SFBAudioEngine/Frameworks"
	exit
fi

DO_CLEAN=1

FRAMEWORKDIR=../$1

rm -rf $1/*

if [ $DO_CLEAN -ne 0 ]; then
	xcodebuild -project dumb/dumb.xcodeproj clean
fi
xcodebuild -project dumb/dumb.xcodeproj -target dumb.framework -configuration Release CONFIGURATION_BUILD_DIR=$FRAMEWORKDIR

if [ $DO_CLEAN -ne 0 ]; then
	xcodebuild -project flac/flac.xcodeproj clean
fi
xcodebuild -project flac/flac.xcodeproj -target Framework -configuration Release CONFIGURATION_BUILD_DIR=$FRAMEWORKDIR

if [ $DO_CLEAN -ne 0 ]; then
	xcodebuild -project mac/mac.xcodeproj clean
fi
xcodebuild -project mac/mac.xcodeproj -target mac.framework -configuration Release CONFIGURATION_BUILD_DIR=$FRAMEWORKDIR

if [ $DO_CLEAN -ne 0 ]; then
	xcodebuild -project mp4v2/mp4v2.xcodeproj clean
fi
xcodebuild -project mp4v2/mp4v2.xcodeproj -target mp4v2 -configuration Release CONFIGURATION_BUILD_DIR=$FRAMEWORKDIR

if [ $DO_CLEAN -ne 0 ]; then
	xcodebuild -project musepack/musepack.xcodeproj clean
fi
xcodebuild -project musepack/musepack.xcodeproj -target mpcdec.framework -configuration Release CONFIGURATION_BUILD_DIR=$FRAMEWORKDIR

if [ $DO_CLEAN -ne 0 ]; then
	xcodebuild -project mpg123/mpg123.xcodeproj clean
fi
xcodebuild -project mpg123/mpg123.xcodeproj -target mpg123.framework -configuration Release CONFIGURATION_BUILD_DIR=$FRAMEWORKDIR

if [ $DO_CLEAN -ne 0 ]; then
	xcodebuild -project sndfile/sndfile.xcodeproj clean
fi
xcodebuild -project sndfile/sndfile.xcodeproj -target sndfile.framework -configuration Release CONFIGURATION_BUILD_DIR=$FRAMEWORKDIR

if [ $DO_CLEAN -ne 0 ]; then
	xcodebuild -project speex/speex.xcodeproj clean
fi
xcodebuild -project speex/speex.xcodeproj -target speex.framework -configuration Release CONFIGURATION_BUILD_DIR=$FRAMEWORKDIR

if [ $DO_CLEAN -ne 0 ]; then
	xcodebuild -project taglib/taglib.xcodeproj clean
fi
xcodebuild -project taglib/taglib.xcodeproj -target taglib -configuration Release CONFIGURATION_BUILD_DIR=$FRAMEWORKDIR

if [ $DO_CLEAN -ne 0 ]; then
	xcodebuild -project tta/tta++.xcodeproj clean
fi
xcodebuild -project tta/tta++.xcodeproj -target tta++.framework -configuration Release CONFIGURATION_BUILD_DIR=$FRAMEWORKDIR

if [ $DO_CLEAN -ne 0 ]; then
	xcodebuild -project vorbis/vorbis.xcodeproj clean
fi
xcodebuild -project vorbis/vorbis.xcodeproj -target vorbis.framework -configuration Release CONFIGURATION_BUILD_DIR=$FRAMEWORKDIR

if [ $DO_CLEAN -ne 0 ]; then
	xcodebuild -project wavpack/wavpack.xcodeproj clean
fi
xcodebuild -project wavpack/wavpack.xcodeproj -target Framework -configuration Release CONFIGURATION_BUILD_DIR=$FRAMEWORKDIR

