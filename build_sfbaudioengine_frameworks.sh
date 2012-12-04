#!/bin/sh

if [ ! -d "$1" ]; then
	echo "'$1' does not exist.  aborting."
	echo "try something like: ../SFBAudioEngine/Frameworks"
	exit
fi

FRAMEWORKDIR=../$1

rm -rf $1/*

xcodebuild -project dumb/dumb.xcodeproj clean
xcodebuild -project dumb/dumb.xcodeproj -target dumb.framework -configuration Release -arch "i386 x86_64" CONFIGURATION_BUILD_DIR=$FRAMEWORKDIR

xcodebuild -project flac/flac.xcodeproj clean
xcodebuild -project flac/flac.xcodeproj -target Framework -configuration Release -arch "i386 x86_64" CONFIGURATION_BUILD_DIR=$FRAMEWORKDIR

xcodebuild -project mac/mac.xcodeproj clean
xcodebuild -project mac/mac.xcodeproj -target mac.framework -configuration Release -arch "i386 x86_64" CONFIGURATION_BUILD_DIR=$FRAMEWORKDIR

xcodebuild -project mp4v2/mp4v2.xcodeproj clean
xcodebuild -project mp4v2/mp4v2.xcodeproj -target mp4v2 -configuration Release -arch "i386 x86_64" CONFIGURATION_BUILD_DIR=$FRAMEWORKDIR

xcodebuild -project musepack/musepack.xcodeproj clean
xcodebuild -project musepack/musepack.xcodeproj -target mpcdec.framework -configuration Release -arch "i386 x86_64" CONFIGURATION_BUILD_DIR=$FRAMEWORKDIR

xcodebuild -project mpg123/mpg123.xcodeproj clean
xcodebuild -project mpg123/mpg123.xcodeproj -target mpg123.framework -configuration Release -arch "i386 x86_64" CONFIGURATION_BUILD_DIR=$FRAMEWORKDIR

xcodebuild -project sndfile/sndfile.xcodeproj clean
xcodebuild -project sndfile/sndfile.xcodeproj -target sndfile.framework -configuration Release -arch "i386 x86_64" CONFIGURATION_BUILD_DIR=$FRAMEWORKDIR

xcodebuild -project speex/speex.xcodeproj clean
xcodebuild -project speex/speex.xcodeproj -target speex.framework -configuration Release -arch "i386 x86_64" CONFIGURATION_BUILD_DIR=$FRAMEWORKDIR

xcodebuild -project taglib/taglib.xcodeproj clean
xcodebuild -project taglib/taglib.xcodeproj -target taglib -configuration Release -arch "i386 x86_64" CONFIGURATION_BUILD_DIR=$FRAMEWORKDIR

xcodebuild -project tta/tta++.xcodeproj clean
xcodebuild -project tta/tta++.xcodeproj -target tta++.framework -configuration Release -arch "i386 x86_64" CONFIGURATION_BUILD_DIR=$FRAMEWORKDIR

xcodebuild -project vorbis/vorbis.xcodeproj clean
xcodebuild -project vorbis/vorbis.xcodeproj -target vorbis.framework -configuration Release -arch "i386 x86_64" CONFIGURATION_BUILD_DIR=$FRAMEWORKDIR

xcodebuild -project wavpack/wavpack.xcodeproj clean
xcodebuild -project wavpack/wavpack.xcodeproj -target Framework -configuration Release -arch "i386 x86_64" CONFIGURATION_BUILD_DIR=$FRAMEWORKDIR

