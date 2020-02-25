#!/bin/sh

CDDB_VERSION="1.3.2"        # 2009-04-07, latest release as of 2020-02-25, unmaintained
CUETOOLS_VERSION="1.3.1"    # 2006-02-15, latest release as of 2020-02-25, unmaintained
DISCID_VERSION="0.6.2"      # 2017-01-29, latest release as of 2020-02-25
DUMB_VERSION="0.9.3"        # 2005-08-08, latest release as of 2020-02-25, unmaintained
OGG_VERSION="1.3.4"         # 2019-08-31, latest release as of 2020-02-25
FLAC_VERSION="1.3.3"        # 2019-08-04, latest release as of 2020-02-25
LAME_VERSION="3.100"        # 2017-10-13, latest release as of 2020-02-25
MAC_VERSION="520"           # 2020-02-24, latest release as of 2020-02-25
MAD_VERSION="0.15.1b"       # 2004-02-18, latest release as of 2020-02-25, unmaintained
MP4V2_GIT_HASH="7655fd12aa83519ec32ff3a5dbb4ae4800bf8f26" # 4.1.3.0, 2020-02-14, latest release as of 2020-02-25
MPG123_VERSION="1.25.13"    # 2019-10-26, latest release as of 2020-02-25
MUSEPACK_VERSION="r475"     # 2011-08-10, latest release as of 2020-02-25
MUSICBRAINZ3_VERSION="3.0.3" # 2010-09-27, latest release as of 2020-02-25, unmaintained
MUSICBRAINZ5_GIT_HASH="2adc507e79acec04abb8756e9e07319b980ca9df" # 5.1.0, 2014-11-13, latest release as of 2020-02-25
NEON_VERSION="0.30.2"       # 2016-09-30, latest release as of 2020-02-25
OFA1_VERSION="0.9.3"        # 2006-05-10, latest release as of 2020-02-25, unmaintained
OPUS_VERSION="1.3"          # 2018-10-18, latest release as of 2020-02-25
OPUSFILE_VERSION="0.11"     # 2018-09-18, latest release as of 2020-02-25
SNDFILE_VERSION="1.0.28"    # 2017-04-02, latest release as of 2020-02-25
SPEEX_VERSION="1.2rc2"      # 2014-12-06, latest release as of 2020-02-25
TTA_VERSION="c-2.3"         # 2015-02-20, latest release as of 2020-02-25
TTA_PLUS_PLUS_VERSION="cpp-2.3" # 2015-02-20, latest release as of 2020-02-25
TAGLIB_GIT_HASH="e36a9cabb9882e61276161c23834d966d62073b7" # 1.11.1, 2016-10-24, latest release as of 2020-02-25
VORBIS_VERSION="1.3.6"      # 2018-03-16, latest release as of 2020-02-25
WAVPACK_VERSION="5.2.0"     # 2019-12-17, latest release as of 2020-02-25
ZLIB_GIT_HASH="cacf7f1d4e3d44d871b605da3b647f07d718623f" # v1.2.11, 2017-01-15, latest release as of 2020-02-25

function _fetch_github_hash
{
    DIRECTORY=$1
    NAME=$2
    TEAM=$3
    PROJECT=$4
    HASH=$5

    _fetch_http "${DIRECTORY}" "${NAME}" "${HASH}" "https://github.com/${TEAM}/${PROJECT}/archive/${HASH}.tar.gz"
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

    mkdir ${DIRECTORY} 2>/dev/null
    
    curl -sL "${URL}" | tar -xj -C "${DIRECTORY}"
    mv "${DIRECTORY}/${INPUT_NAME}/" "${DIRECTORY}/${OUTPUT_NAME}/"
}

function _fetch_http_xz
{
    DIRECTORY=$1
    NAME=$2
    VERSION=$3
    URL=$4

    _fetch_http_named_xz "${DIRECTORY}" \
                         "${NAME}-${VERSION}" \
                         "${NAME}-src" \
                         "${VERSION}" \
                         "${URL}"
}

function _fetch_http_named_xz
{
    DIRECTORY=$1
    INPUT_NAME=$2
    OUTPUT_NAME=$3
    VERSION=$4
    URL=$5

    echo "Fetching ${DIRECTORY} (${VERSION}): $URL"
    
    mkdir ${DIRECTORY} 2>/dev/null
    
    curl -sL "${URL}" | tar -xJ -C "${DIRECTORY}"
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
    #rm -rf "musicbrainz5/libmusicbrainz-src"
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
                "https://prdownloads.sourceforge.net/libcddb/libcddb-${CDDB_VERSION}.tar.bz2"
}

function fetch_cuetools
{
    _fetch_http "cuetools" \
                "cuetools" \
                "${CUETOOLS_VERSION}" \
                "https://prdownloads.sourceforge.net/cuetools.berlios/cuetools-${CUETOOLS_VERSION}.tar.gz"
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
                "https://prdownloads.sourceforge.net/dumb/dumb-${DUMB_VERSION}.tar.gz"

    _patch "dumb" \
           "dumb.patch"
}

function fetch_flac
{
    # note: >= 1.3.0 uses .tar.xz instead of .tar.gz
    _fetch_http_xz "flac" \
                   "flac" \
                   "${FLAC_VERSION}" \
                   "https://ftp.osuosl.org/pub/xiph/releases/flac/flac-${FLAC_VERSION}.tar.xz"
}

function fetch_lame
{
    _fetch_http "lame" \
                "lame" \
                "${LAME_VERSION}" \
                "https://prdownloads.sourceforge.net/lame/lame-${LAME_VERSION}.tar.gz"
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
                "https://prdownloads.sourceforge.net/mad/libmad-${MAD_VERSION}.tar.gz"

    _patch "mad" \
           "mad.patch"
}

function fetch_mp4v2
{
    _fetch_github_hash "mp4v2" \
                       "mp4v2" \
                       "TechSmith" \
                       "mp4v2" \
                       "${MP4V2_GIT_HASH}"
}

function fetch_mpg123
{
    _fetch_http "mpg123" \
                "mpg123" \
                "${MPG123_VERSION}" \
                "https://prdownloads.sourceforge.net/mpg123/mpg123-${MPG123_VERSION}.tar.bz2"
}

function fetch_musepack
{
    _fetch_http_named "musepack" \
                      "musepack_src_${MUSEPACK_VERSION}" \
                      "musepack-src" \
                      "${MUSEPACK_VERSION}" \
                      "https://files.musepack.net/source/musepack_src_${MUSEPACK_VERSION}.tar.gz"

    _patch "musepack" \
           "mpc.patch"
}

function fetch_musicbrainz3
{
	_fetch_http "musicbrainz3" \
	            "libmusicbrainz" \
	            "${MUSICBRAINZ3_VERSION}" \
	            "http://ponce.cc/slackware/sources/repo/libmusicbrainz-${MUSICBRAINZ3_VERSION}.tar.gz"

	_fetch_http "musicbrainz3" \
	            "neon" \
	            "${NEON_VERSION}" \
	            "http://www.webdav.org/neon/neon-${NEON_VERSION}.tar.gz"
}

function fetch_musicbrainz5
{
    _fetch_github_hash "musicbrainz5" \
                       "musicbrainz5" \
                       "metabrainz" \
                       "libmusicbrainz" \
                       "${MUSICBRAINZ5_GIT_HASH}"
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
                "https://ftp.osuosl.org/pub/xiph/releases/opus/opus-${OPUS_VERSION}.tar.gz"

    _fetch_http "opus" \
                "opusfile" \
                "${OPUSFILE_VERSION}" \
                "https://ftp.osuosl.org/pub/xiph/releases/opus/opusfile-${OPUSFILE_VERSION}.tar.gz"
}

function fetch_ogg
{
    _fetch_http_xz "ogg" \
                   "libogg" \
                   "${OGG_VERSION}" \
                   "https://ftp.osuosl.org/pub/xiph/releases/ogg/libogg-${OGG_VERSION}.tar.xz"
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
                "https://ftp.osuosl.org/pub/xiph/releases/speex/speex-${SPEEX_VERSION}.tar.gz"
}

function fetch_taglib
{
    _fetch_github_hash "taglib" \
                       "taglib" \
                       "taglib" \
                       "taglib" \
                       "${TAGLIB_GIT_HASH}"
}

function fetch_tta
{
    _fetch_http_named "tta" \
                      "libtta-${TTA_VERSION}" \
                      "libtta-c-src" \
                      "${TTA_VERSION}" \
                      "https://prdownloads.sourceforge.net/tta/libtta-${TTA_VERSION}.tar.gz"

    # angry carriage return situation breaks `patch`.
    # `patch -l` doesn't resolve it, so..:
    _fix_cr "tta/libtta-c-src/filter.h"
    _fix_cr "tta/libtta-c-src/libtta.h"
    _fix_cr "tta/libtta-c-src/libtta.c"

    _patch "tta" \
           "tta.patch"
}

function fetch_tta_plus_plus
{
    _fetch_http "tta++" \
                "libtta++" \
                "${TTA_PLUS_PLUS_VERSION}" \
                "https://prdownloads.sourceforge.net/tta/libtta++-${TTA_PLUS_PLUS_VERSION}.tar.gz"

    _patch "tta++" \
           "tta++.patch"
}

function fetch_vorbis
{
    _fetch_http "vorbis" \
                "libvorbis" \
                "${VORBIS_VERSION}" \
                "https://ftp.osuosl.org/pub/xiph/releases/vorbis/libvorbis-${VORBIS_VERSION}.tar.gz"
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
    _fetch_github_hash "zlib" \
                       "zlib" \
                       "madler" \
                       "zlib" \
                       "${ZLIB_GIT_HASH}"
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
#fetch_musicbrainz5
fetch_ofa1
fetch_ogg
fetch_opus
fetch_sndfile
fetch_speex
fetch_taglib
#fetch_tta # error
#fetch_tta_plus_plus # error
fetch_vorbis
fetch_wavpack
fetch_zlib