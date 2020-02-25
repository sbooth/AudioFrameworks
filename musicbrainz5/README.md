Download libxml2 2.9.10, openssl 1.1.d, neon 0.30.2, and libmusicbrainz 5.1.0.

Unpack libxml2 into `libxml2-src`
Unpack openssl into `openssl-src`
Unpack neon into `neon-src`
Unpack libmusicbrainz5 into `libmusicbrainz5-src`

Compile libxml2 `PATH=/usr/bin:/bin:/usr/sbin:/sbin ./configure --disable-shared`
Compile openssl `PATH=/usr/bin:/bin:/usr/sbin:/sbin ./config no-shared`

Apply `neon.diff` and `libmusicbrainz5.diff`

Build with Xcode
