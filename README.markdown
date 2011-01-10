Audio Frameworks for Mac OS X
=============================

This repository contains Xcode projects that help building Mac OS X framework of various open-source audio libraries.

Play itself can be found at [http://sbooth.org/Play/][11]

Usage
-----

This repo doesn't contain the sources for the respective frameworks or libraries. You need to add those yourself. 

./configure will be called as necessary, e.g. if config.h doesn't exist. You don't need to do this yourself.

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

[http://code.google.com/p/mp4v2/downloads/list][5]

(tested version: mp4v2-1.9.1.tar.bz2)

**Currently not working**

1. Download
2. Decompress
3. Rename folder to "mp4v2-src"
4. Move the folder into mp4v2/
5. Build


musepack
--------

[http://www.musepack.net/index.php?pg=src][6]

(tested version: musepack_src_r435.tar.gz)

**Currently not working**

1. Download
2. Decompress
3. Rename folder to "musepack-src"
4. Move the folder into musepack/
5. Build


musicbrainz3
------------

[http://musicbrainz.org/doc/libmusicbrainz][7]
[http://www.webdav.org/neon/][8]

(tested version: libmusicbrainz-3.0.2.tar.gz, http://www.webdav.org/neon/neon-0.29.3.tar.gz)

1. Prepare discid first
2. Download libmusicbrainz and neon
3. Decompress
4. Rename folders to "libmusicbrainz-src" and "neon-src"
5. Move the folder into musicbrainz3/
6. Build


taglib
------

[http://developer.kde.org/~wheeler/taglib.html][9]

(tested version: taglib SVN rev. 1213268)

1. svn co -r 1212918 svn://anonsvn.kde.org/home/kde/trunk/kdesupport/taglib
2. Rename folder to "taglib-src"
3. Move the folder into taglib/
4. Build


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


License
-------

The Xcode projects are licensed under the same license as Play itself.


  [1]: http://libcddb.sourceforge.net/download.html
  [2]: http://musicbrainz.org/doc/libdiscid
  [3]: http://xiph.org/downloads/
  [4]: http://sourceforge.net/projects/mad/files/
  [5]: http://code.google.com/p/mp4v2/downloads/list
  [6]: http://www.musepack.net/index.php?pg=src
  [7]: http://musicbrainz.org/doc/libmusicbrainz
  [8]: http://www.webdav.org/neon/
  [9]: http://developer.kde.org/~wheeler/taglib.html
  [10]: http://www.wavpack.com/downloads.html
  [11]: http://sbooth.org/Play/
