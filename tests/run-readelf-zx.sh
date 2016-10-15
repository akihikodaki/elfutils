#! /bin/sh
# Copyright (C) 2015 Red Hat, Inc.
# This file is part of elfutils.
#
# This file is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# elfutils is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

. $srcdir/test-subr.sh

# See run-elfgetchdr.sh for testfiles.

test -f ${abs_top_builddir}/src/readelf || exit 77

testfiles testfile-zgnu64
testrun_compare ${abs_top_builddir}/src/readelf -z -x.zdebug_aranges testfile-zgnu64 <<\EOF

Hex dump of section [2] '.zdebug_aranges', 50 bytes (96 uncompressed) at offset 0x260:
  0x00000000 2c000000 02000000 00000800 00000000 ,...............
  0x00000010 78004000 00000000 14000000 00000000 x.@.............
  0x00000020 00000000 00000000 00000000 00000000 ................
  0x00000030 2c000000 02005500 00000800 00000000 ,.....U.........
  0x00000040 8c004000 00000000 16000000 00000000 ..@.............
  0x00000050 00000000 00000000 00000000 00000000 ................
EOF

testfiles testfile-zgabi64
testrun_compare ${abs_top_builddir}/src/readelf -z -x.debug_aranges testfile-zgabi64 <<\EOF

Hex dump of section [2] '.debug_aranges', 62 bytes (96 uncompressed) at offset 0x260:
  0x00000000 2c000000 02000000 00000800 00000000 ,...............
  0x00000010 78004000 00000000 14000000 00000000 x.@.............
  0x00000020 00000000 00000000 00000000 00000000 ................
  0x00000030 2c000000 02005500 00000800 00000000 ,.....U.........
  0x00000040 8c004000 00000000 16000000 00000000 ..@.............
  0x00000050 00000000 00000000 00000000 00000000 ................
EOF

testfiles testfile-zgnu32
testrun_compare ${abs_top_builddir}/src/readelf -z -x.zdebug_aranges testfile-zgnu32 <<\EOF

Hex dump of section [2] '.zdebug_aranges', 49 bytes (64 uncompressed) at offset 0x1c0:
  0x00000000 1c000000 02000000 00000400 00000000 ................
  0x00000010 54800408 14000000 00000000 00000000 T...............
  0x00000020 1c000000 02004d00 00000400 00000000 ......M.........
  0x00000030 68800408 16000000 00000000 00000000 h...............
EOF

testfiles testfile-zgabi32
testrun_compare ${abs_top_builddir}/src/readelf -z -x.debug_aranges testfile-zgabi32 <<\EOF

Hex dump of section [2] '.debug_aranges', 49 bytes (64 uncompressed) at offset 0x1c0:
  0x00000000 1c000000 02000000 00000400 00000000 ................
  0x00000010 54800408 14000000 00000000 00000000 T...............
  0x00000020 1c000000 02004d00 00000400 00000000 ......M.........
  0x00000030 68800408 16000000 00000000 00000000 h...............
EOF

exit 0
