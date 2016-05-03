#!/bin/sh

CDDB_VERSION="1.3.2"
CUETOOLS_VERSION="1.3.1"
DISCID_VERSION="0.3.0"
DUMB_VERSION="0.9.3"
OGG_VERSION="1.3.0"
FLAC_VERSION="1.2.1"
LAME_VERSION="3.99.5"
MAC_VERSION="416"
MAD_VERSION="0.15.1b"
MP4V2_SVN_REVISION="501"
MPG123_VERSION="1.14.4"
MUSEPACK_VERSION="r475"
MUSICBRAINZ3_VERSION="3.0.3"
NEON_VERSION="0.29.5"
OFA1_VERSION="0.9.3"
OPUS_VERSION="1.1.2"
OPUSFILE_VERSION="0.7"
SNDFILE_VERSION="1.0.25"
SPEEX_VERSION="1.2rc1"
TTA_VERSION="2.1"
TTA_PLUS_PLUS_VERSION="2.1"
TAGLIB_GIT_HASH="821ff14a43da1c9d6094bd75a10c417bcdf7eafe"
VORBIS_VERSION="1.3.3"
WAVPACK_VERSION="4.60.1"
ZLIB_VERSION="1.2.8"

function _fetch_github_hash
{
	DIRECTORY=$1
	NAME=$2
	HASH=$3

	_fetch_http "${DIRECTORY}" "${NAME}" "${HASH}" "https://github.com/taglib/taglib/archive/${HASH}.tar.gz"
}

function _fetch_http
{
	DIRECTORY=$1
	NAME=$2
	VERSION=$3
	URL=$4

	_fetch_http_named "${DIRECTORY}" \
	                  "${NAME}-${VERSION}" \
	                  "${NAME}-src" \
	                  "${VERSION}" \
	                  "${URL}"
}

function _fetch_http_named
{
	DIRECTORY=$1
	INPUT_NAME=$2
	OUTPUT_NAME=$3
	VERSION=$4
	URL=$5

	echo "Fetching ${DIRECTORY} (${VERSION}): $URL"

	curl -sL "${URL}" | tar -xj -C "${DIRECTORY}"
	mv "${DIRECTORY}/${INPUT_NAME}/" "${DIRECTORY}/${OUTPUT_NAME}/"
}

function _fetch_svn
{
	DIRECTORY=$1
	NAME=$2
	REVISION=$3
	URL=$4

	echo "SVN exporting ${DIRECTORY} (${REVISION}): $URL"

	svn export -qr "${REVISION}" "${URL}" "${DIRECTORY}/${NAME}-src"
}

function _fix_cr
{
	FILE=$1

	perl -i -pe's/\R/\n/g' "${FILE}"
}

function _patch
{
	DIRECTORY=$1
	NAME=$2

	echo "..patching ${DIRECTORY} (${NAME})"

	cd "${DIRECTORY}"
	patch -p0 < "${NAME}"
	cd ".."
}

function clean
{
	rm -rf "cddb/libcddb-src"
	rm -rf "cuetools/cuetools-src"
	rm -rf "discid/libdiscid-src"
	rm -rf "dumb/dumb-src"
	rm -rf "ogg/libogg-src"
	rm -rf "flac/flac-src"
	rm -rf "lame/lame-src"
	rm -rf "mad/libmad-src"
	rm -rf "mp4v2/mp4v2-src"
	rm -rf "mpg123/mpg123-src"
	rm -rf "musepack/musepack-src"
	rm -rf "musicbrainz3/libmusicbrainz-src"
	rm -rf "musicbrainz3/neon-src"
	rm -rf "ofa1/libofa-src"
	rm -rf "sndfile/libsndfile-src"
	rm -rf "speex/speex-src"
	rm -rf "taglib/taglib-src"
	rm -rf "tta/libtta-c-src"
	rm -rf "tta++/libtta++-src"
	rm -rf "vorbis/libvorbis-src"
	rm -rf "wavpack/wavpack-src"
	rm -rf "id3tag/libid3tag-src"
	rm -rf "opus/opus-src"
	rm -rf "opus/opusfile-src"
	rm -rf "zlib/zlib-src"
	rm -rf "mac/mac-src"

	# ignore these, as they're stored in git and not downloaded
	# "cdparanoia/cdparanoia-src"
	# "shorten/shorten-src"
}

function fetch_cddb
{
	_fetch_http "cddb" \
	            "libcddb" \
	            "${CDDB_VERSION}" \
	            "http://prdownloads.sourceforge.net/libcddb/libcddb-${CDDB_VERSION}.tar.bz2"
}

function fetch_cuetools
{
	_fetch_http "cuetools" \
	            "cuetools" \
	            "${CUETOOLS_VERSION}" \
	            "http://prdownloads.sourceforge.net/cuetools.berlios/cuetools-${CUETOOLS_VERSION}.tar.gz"
}

function fetch_discid
{
	_fetch_http "discid" \
	            "libdiscid" \
	            "${DISCID_VERSION}" \
	            "http://ftp.musicbrainz.org/pub/musicbrainz/libdiscid/libdiscid-${DISCID_VERSION}.tar.gz"
}

function fetch_dumb
{
	_fetch_http "dumb" \
	            "dumb" \
	            "${DUMB_VERSION}" \
	            "http://prdownloads.sourceforge.net/dumb/dumb-${DUMB_VERSION}.tar.gz"

	_patch "dumb" \
	       "dumb.patch"
}

function fetch_flac
{
	# note: >= 1.3.0 uses .tar.xz instead of .tar.gz
	_fetch_http "flac" \
	            "flac" \
	            "${FLAC_VERSION}" \
	            "http://downloads.xiph.org/releases/flac/flac-${FLAC_VERSION}.tar.gz"
}

function fetch_lame
{
	_fetch_http "lame" \
	            "lame" \
	            "${LAME_VERSION}" \
	            "http://prdownloads.sourceforge.net/lame/lame-${LAME_VERSION}.tar.gz"
}


function fetch_mac
{
	URL="http://monkeysaudio.com/files/MAC_SDK_${MAC_VERSION}.zip"

	echo "Fetching mac (${MAC_VERSION}): $URL"

	mkdir -p "mac/mac-src"
	curl -sL "${URL}" | tar -xj -C "mac/mac-src"

	_fix_cr "mac/mac-src/Source/Shared/All.h"

	_patch "mac" \
	       "mac.patch"
}

function fetch_mad
{
	_fetch_http "mad" \
	            "libmad" \
	            "${MAD_VERSION}" \
	            "http://prdownloads.sourceforge.net/mad/libmad-${MAD_VERSION}.tar.gz"

	_patch "mad" \
	       "mad.patch"
}

function fetch_mp4v2
{
	_fetch_svn "mp4v2" \
	           "mp4v2" \
	           "${MP4V2_SVN_REVISION}" \
	           "http://mp4v2.googlecode.com/svn/trunk/"
}

function fetch_mpg123
{
	_fetch_http "mpg123" \
	            "mpg123" \
	            "${MPG123_VERSION}" \
	            "http://prdownloads.sourceforge.net/mpg123/mpg123-${MPG123_VERSION}.tar.bz2"
}

function fetch_musepack
{
	_fetch_http_named "musepack" \
	                  "musepack_src_${MUSEPACK_VERSION}" \
	                  "musepack-src" \
	                  "${MPG123_VERSION}" \
	                  "http://files.musepack.net/source/musepack_src_${MUSEPACK_VERSION}.tar.gz"

	_patch "musepack" \
	       "mpc.patch"
}

function fetch_musicbrainz3
{
	_fetch_http "musicbrainz3" \
	            "libmusicbrainz" \
	            "${MUSICBRAINZ3_VERSION}" \
	            "http://ftp.musicbrainz.org/pub/musicbrainz/libmusicbrainz-${MUSICBRAINZ3_VERSION}.tar.gz"

	_fetch_http "musicbrainz3" \
	            "neon" \
	            "${NEON_VERSION}" \
	            "http://www.webdav.org/neon/neon-${NEON_VERSION}.tar.gz"
}

function fetch_ofa1
{
	_fetch_http "ofa1" \
	            "libofa" \
	            "${OFA1_VERSION}" \
	            "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/musicip-libofa/libofa-${OFA1_VERSION}.tar.gz"

	_patch "ofa1" \
	       "ofa1.patch"
}

function fetch_opus
{
	_fetch_http "opus" \
	            "opus" \
	            "${OPUS_VERSION}" \
	            "http://downloads.xiph.org/releases/opus/opus-${OPUS_VERSION}.tar.gz"

	_fetch_http "opus" \
	            "opusfile" \
	            "${OPUSFILE_VERSION}" \
	            "http://downloads.xiph.org/releases/opus/opusfile-${OPUSFILE_VERSION}.tar.gz"
}

function fetch_ogg
{
	_fetch_http "ogg" \
	            "libogg" \
	            "${OGG_VERSION}" \
	            "http://downloads.xiph.org/releases/ogg/libogg-${OGG_VERSION}.tar.gz"
}

function fetch_sndfile
{
	_fetch_http "sndfile" \
	            "libsndfile" \
	            "${SNDFILE_VERSION}" \
	            "http://www.mega-nerd.com/libsndfile/files/libsndfile-${SNDFILE_VERSION}.tar.gz"
}

function fetch_speex
{
	_fetch_http "speex" \
	            "speex" \
	            "${SPEEX_VERSION}" \
	            "http://downloads.xiph.org/releases/speex/speex-${SPEEX_VERSION}.tar.gz"
}

function fetch_taglib
{
	_fetch_github_hash "taglib" \
	                   "taglib" \
	                   "${TAGLIB_GIT_HASH}"
}

function fetch_tta
{
	_fetch_http_named "tta" \
	                  "libtta-${TTA_VERSION}" \
	                  "libtta-c-src" \
	                  "${TTA_VERSION}" \
	                  "http://prdownloads.sourceforge.net/tta/libtta-${TTA_VERSION}.tar.gz"

	# angry carriage return situation breaks `patch`.
	# `patch -l` doesn't resolve it, so..:
	_fix_cr "tta/libtta-c-src/filter.h"
	_fix_cr "tta/libtta-c-src/libtta.h"

	_patch "tta" \
	       "tta.patch"
}

function fetch_tta_plus_plus
{
	_fetch_http "tta++" \
	            "libtta++" \
	            "${TTA_PLUS_PLUS_VERSION}" \
	            "http://prdownloads.sourceforge.net/tta/libtta++-${TTA_PLUS_PLUS_VERSION}.tar.gz"

	_patch "tta++" \
	       "tta++.patch"
}

function fetch_vorbis
{
	_fetch_http "vorbis" \
	            "libvorbis" \
	            "${VORBIS_VERSION}" \
	            "http://downloads.xiph.org/releases/vorbis/libvorbis-${VORBIS_VERSION}.tar.gz"
}

function fetch_wavpack
{
	_fetch_http "wavpack" \
	            "wavpack" \
	            "${WAVPACK_VERSION}" \
	            "http://www.wavpack.com/wavpack-${WAVPACK_VERSION}.tar.bz2"
}

function fetch_zlib
{
	_fetch_http "zlib" \
	            "zlib" \
	            "${ZLIB_VERSION}" \
	            "http://zlib.net/zlib-${ZLIB_VERSION}.tar.gz"
}

clean

fetch_cddb
fetch_cuetools
fetch_discid
fetch_dumb
fetch_flac
fetch_lame
fetch_mac
fetch_mad
fetch_mp4v2
fetch_mpg123
fetch_musepack
fetch_musicbrainz3
fetch_ofa1
fetch_ogg
fetch_opus
fetch_sndfile
fetch_speex
fetch_taglib
fetch_tta
fetch_tta_plus_plus
fetch_vorbis
fetch_wavpack
fetch_zlib