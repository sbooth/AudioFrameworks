Audio Frameworks for Mac OS X
=============================

This repository contains Xcode projects that help building Mac OS X framework of various open-source audio libraries.

Usage
-----

This repo doesn't contain the sources for the respective frameworks or libraries. You need to add those yourself. 

CDDB
----

[http://libcddb.sourceforge.net/download.html][1]

(tested version: libcddb-1.3.2.tar.bz2)

1. Download
2. Decompress
3. Rename folder to "libcddb-src"
2. Move the folder into cddb/
3. Build


discid
------

[http://musicbrainz.org/doc/libdiscid][2]

(tested version: libdiscid-0.2.2.tar.gz)

1. Download
2. Decompress
3. Rename folder to "libdiscid-src"
4. Move the folder into discid/
5. Build


ogg
---

[http://xiph.org/downloads/][3]

(tested version: libogg-1.2.2.tar.gz)

1. Download
2. Decompress
3. Rename folder to "libogg-src"
4. Move the folder into ogg/
5. Build


flac
----

[http://xiph.org/downloads/][3]

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

[http://sourceforge.net/projects/mad/files/][4]

(tested version: libmad-0.15.1b.tar.gz)

1. Download
2. Decompress
3. Rename folder to "libmad-src"
4. Move the folder into mad/
5. Apply the patch "mad.patch": 'patch < mad.patch' 
6. Build


mp4v2
-----

[http://code.google.com/p/mp4v2/source/checkout][5]

(tested version: svn revision 426)

1. svn co -r 426 http://mp4v2.googlecode.com/svn/trunk/ mp4v2-src
2. Move the folder into mp4v2/
3. Build


musepack
--------

[http://www.musepack.net/index.php?pg=src][6]

(tested version: musepack_src_r435.tar.gz)

1. Download
2. Decompress
3. Rename folder to "musepack-src"
4. Move the folder into musepack/
5. Apply the patch "mpc.patch": 'patch < mpc.patch'
6. Build


musicbrainz3
------------

[http://musicbrainz.org/doc/libmusicbrainz][7]
[http://www.webdav.org/neon/][8]

(tested version: libmusicbrainz-3.0.3.tar.gz, http://www.webdav.org/neon/neon-0.29.5.tar.gz)

1. Prepare discid first
2. Download libmusicbrainz and neon
3. Decompress
4. Rename folders to "libmusicbrainz-src" and "neon-src"
5. Move the folders into musicbrainz3/
6. Build


taglib
------

[http://developer.kde.org/~wheeler/taglib.html][9]

(tested version: taglib SVN rev. 1213268)

1. svn co -r 1213268 svn://anonsvn.kde.org/home/kde/trunk/kdesupport/taglib taglib-src
2. Move the folder into taglib/
3. Build


vorbis
------

[http://xiph.org/downloads/][3]

(tested version: libvorbis-1.3.2.tar.bz2)

1. Download
2. Decompress
3. Rename folder to "libvorbis-src"
4. Move the folder into vorbis/
5. Build


wavpack
-------

[http://www.wavpack.com/downloads.html][10]

(tested version: wavpack-4.60.1.tar.bz2)

1. Download
2. Decompress
3. Rename folder to "wavpack-src"
4. Move the folder into wavpack/
5. Select the "Framework" build target
6. Build


LAME
----

[http://lame.sourceforge.net/download.php][11]

(tested version: lame-3.98.4.tar.bz2)

1. Download
2. Decompress
3. Rename folder to "lame-src"
4. Move the folder into lame/
5. Build


sndfile
-------

[http://www.mega-nerd.com/libsndfile/][12]

(tested version: libsndfile-1.0.23.tar.gz)

1. Download
2. Decompress
3. Rename folder to "libsndfile-src"
4. Move the folder into sndfile/
5. Build


ofa1
----

[http://code.google.com/p/musicip-libofa/][13]

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

[http://developer.berlios.de/projects/cuetools/][14]

(tested version: cuetools-1.3.1.tar.gz)

1. Download
2. Decompress
3. Rename folder to "cuetools-src"
4. Move the folder into cuetools/
5. Build


speex
-----

[http://www.speex.org/][15]

(tested version: speex-1.2rc1.tar.gz)

1. Download
2. Decompress
3. Rename folder to speex-src
4. Move the folder into speex/
5. Build


tta
---

[http://en.true-audio.com/Free_Downloads][16]

(tested version: libtta-c-2.0.tar.gz)

1. Download
2. Decompress
3. Rename the folder to libtta-c-src
4. Move the folder into tta
5. Apply the patch "tta.patch": 'patch < tta.patch'
6. Build


mpg123
------

[http://www.mpg123.de/][17]

(tested version: mpg123-1.13.2.tar.bz2)

1. Download
2. Decompress
3. Rename the folder to mpg123-src
4. Move the folder into mpg123
5. Build


License
-------

The Xcode projects are distributed under the modified BSD license.


  [1]: http://libcddb.sourceforge.net/download.html
  [2]: http://musicbrainz.org/doc/libdiscid
  [3]: http://xiph.org/downloads/
  [4]: http://sourceforge.net/projects/mad/files/
  [5]: http://code.google.com/p/mp4v2/source/checkout
  [6]: http://www.musepack.net/index.php?pg=src
  [7]: http://musicbrainz.org/doc/libmusicbrainz
  [8]: http://www.webdav.org/neon/
  [9]: http://developer.kde.org/~wheeler/taglib.html
  [10]: http://www.wavpack.com/downloads.html
  [11]: http://lame.sourceforge.net/download.php
  [12]: http://www.mega-nerd.com/libsndfile/
  [13]: http://code.google.com/p/musicip-libofa/
  [14]: http://developer.berlios.de/projects/cuetools/
  [15]: http://www.speex.org/
  [16]: http://en.true-audio.com/Free_Downloads
  [17]: http://www.mpg123.de
