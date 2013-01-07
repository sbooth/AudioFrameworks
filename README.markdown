Audio Frameworks for Mac OS X
=============================

This repository contains Xcode projects that help building Mac OS X framework of various open-source audio libraries.

Usage
-----

This repo doesn't contain the sources for the respective frameworks or libraries. You need to add those yourself. 

CDDB
----

<http://libcddb.sourceforge.net/download.html>

(tested version: libcddb-1.3.2.tar.bz2)

1. Download
2. Decompress
3. Rename folder to "libcddb-src"
2. Move the folder into cddb/
3. Build


discid
------

<http://musicbrainz.org/doc/libdiscid>

(tested version: libdiscid-0.2.2.tar.gz)

1. Download
2. Decompress
3. Rename folder to "libdiscid-src"
4. Move the folder into discid/
5. Build


DUMB (Dynamic Universal Music Bibliotheque)
-------------------------------------------

<http://dumb.sourceforge.net/>

(tested version: dumb-0.9.3.tar.gz, http://prdownloads.sourceforge.net/dumb/dumb-0.9.3.tar.gz?download)

1. Download
2. Decompress
3. Rename folder to "dumb-src"
4. Move the folder into dumb/
5. Build


ogg
---

<http://xiph.org/downloads/>

(tested version: libogg-1.3.0.tar.gz)

1. Download
2. Decompress
3. Rename folder to "libogg-src"
4. Move the folder into ogg/
5. Build


flac
----

<http://xiph.org/downloads/>

(tested version: flac-1.2.1.tar.gz)

1. Prepare ogg first
2. Download
3. Decompress
4. Rename folder to "flac-src"
5. Move the folder into flac/
6. Select the "Framework" build target
7. Build


mad
---

<http://sourceforge.net/projects/mad/files/>

(tested version: libmad-0.15.1b.tar.gz)

1. Download
2. Decompress
3. Rename folder to "libmad-src"
4. Move the folder into mad/
5. Apply the patch "mad.patch": 'patch < mad.patch' 
6. Build


mp4v2
-----

<http://code.google.com/p/mp4v2/source/checkout>

(tested version: svn revision 500)

1. svn co -r 500 http://mp4v2.googlecode.com/svn/trunk/ mp4v2-src
2. Move the folder into mp4v2/
3. Build


musepack
--------

<http://www.musepack.net/index.php?pg=src>

(tested version: musepack_src_r475.tar.gz)

1. Download
2. Decompress
3. Rename folder to "musepack-src"
4. Move the folder into musepack/
5. Apply the patch "mpc.patch": 'patch < mpc.patch'
6. Build


musicbrainz3 (deprecated)
-------------------------

<http://musicbrainz.org/doc/libmusicbrainz>
<http://www.webdav.org/neon/>

(tested version: libmusicbrainz-3.0.3.tar.gz, http://www.webdav.org/neon/neon-0.29.5.tar.gz)

1. Prepare discid first
2. Download libmusicbrainz and neon
3. Decompress
4. Rename folders to "libmusicbrainz-src" and "neon-src"
5. Move the folders into musicbrainz3/
6. Build


taglib
------

<http://taglib.github.com>

(tested version: taglib 08863dec0b)

1. git clone https://github.com/taglib/taglib.git taglib-src
2. cd taglib-src
3. git checkout 08863dec0b
4. Move the folder into taglib/
5. Build

Alternatively, you can use release version 1.8, but you will have to remove “infotag.h” and “infotag.cpp” from the project:

1. Download
2. Decompress
3. Rename folder to "taglib-src"
4. Move the folder into taglib/
5. Build


vorbis
------

<http://xiph.org/downloads/>

(tested version: libvorbis-1.3.3.tar.gz)

1. Download
2. Decompress
3. Rename folder to "libvorbis-src"
4. Move the folder into vorbis/
5. Build


wavpack
-------

<http://www.wavpack.com/downloads.html>

(tested version: wavpack-4.60.1.tar.bz2)

1. Download
2. Decompress
3. Rename folder to "wavpack-src"
4. Move the folder into wavpack/
5. Select the "Framework" build target
6. Build


LAME
----

<http://lame.sourceforge.net/download.php>

(tested version: lame-3.98.4.tar.bz2)

1. Download
2. Decompress
3. Rename folder to "lame-src"
4. Move the folder into lame/
5. Build


sndfile
-------

<http://www.mega-nerd.com/libsndfile/>

(tested version: libsndfile-1.0.23.tar.gz)

1. Download
2. Decompress
3. Rename folder to "libsndfile-src"
4. Move the folder into sndfile/
5. Build


ofa1
----

<http://code.google.com/p/musicip-libofa/>

(tested version: libofa-0.9.3.tar.gz)

1. Download
2. Decompress
3. Rename the folder to libofa-src
4. Move the folder into ofa1
5. Apply the patch "ofa1.patch": 'patch < ofa1.patch'
6. Build


mac
---

1. Build


shorten
-------

0. The original source was from inputSHORTEN, a lamip plugin.
1. Build


cdparanoia
----------

0. The original source is [http://downloads.xiph.org/releases/cdparanoia/cdparanoia-III-alpha9.8.src.tgz]
1. Build


cuetools
--------

<http://developer.berlios.de/projects/cuetools/>

(tested version: cuetools-1.3.1.tar.gz)

1. Download
2. Decompress
3. Rename folder to "cuetools-src"
4. Move the folder into cuetools/
5. Build


speex
-----

<http://www.speex.org/>

(tested version: speex-1.2rc1.tar.gz)

1. Download
2. Decompress
3. Rename folder to speex-src
4. Move the folder into speex/
5. Build


tta, tta++
----------

<http://en.true-audio.com/Free_Downloads>

(tested version: libtta-2.1.tar.gz, libtta++-2.1.tar.gz)

1. Download
2. Decompress
3. Rename the folder (for tta use libtta-c-src, for tta++ use libtta++-src)
4. Move the folder into tta
5. Apply the patch "tta.patch": 'patch < tta.patch'
6. Build


mpg123
------

<http://www.mpg123.de/>
<http://sourceforge.net/projects/mpg123/files/mpg123/>

(tested version: mpg123-1.14.4.tar.bz2)

1. Download
2. Decompress
3. Rename the folder to mpg123-src
4. Move the folder into mpg123
5. Build


License
-------

The Xcode projects are distributed under the modified BSD license.

