Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794703169;
	b=T+Y0/a9IUOKQjFvkzZVp+ulGJ4wCSeJeTQlV8+orWDQCuI40jdZ018vdOCEL6Y5GVEQ3
	 ar0l7/mfdusCWuQChN0DVgKAV7JAsXWHJk+KQOe9wQZ9qgk7FpbdWPXa4zHR7VlsYRs95
	 LRtferSfQ4Sj7mhKy6btYG5nMeqJNEQsjQ1VEp+QJHOXmT56sENJ8jQGrS9rsjBirexgM
	 3CUsHZbaqDnEdljxpH2ndxuRbl4djJTws3g8/Yj4Pks+8IR8Xhj7k5prM/fJcLp/sfkR+
	 rY9Lw6/bYU8sLnxXfJPM1KkcBrRFRQpcqDOLp3UTLgUMPfg9pZAnJ4w5W/JIi9GGarQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794703169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tG3TwJW+J1JqnPjNeoFVDsdxOoEFkP+pmJh5VpZnCWI=;
	b=vUoZgSVQO/Vp0tmszVHddXZmSJ7xQ3xEDjI4b3liRONLyzhR52QiZVkdi4/qEcAgeR4s
	 iUHINBZlf7lipO02aOTO5q50Wr/ij7czkjec8Pjfz/cjRifwu9ot+YeAafrkMIQFHL9PJ
	 l66mmhOeaGvicnrI+Q75cWAlraV5slv7Srrbo1Yvni6cov15zcBA0u7GWyw/tjErruWSG
	 xP2j9Dd3d12KadKolv9ArwtaU/+rrlAflv/UzzYy6svuMf9N/CpGcL0Ca/+70uTo/sJMA
	 X4vFje1YvBeTpkwP4puTajV1QcizscmkEDuFWgsG8GRNv4P30ZRfjyJvKUL0tjgiy1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="SyTLNdZ/";
	arc=none smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DA3606A8A5
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:39:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66DA3606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SyTLNdZ/
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67921b515a7so2292779d50.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794703168; x=1795307968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tG3TwJW+J1JqnPjNeoFVDsdxOoEFkP+pmJh5VpZnCWI=;
        b=SyTLNdZ/vXgZ8RGN6nqVHTfHG3FbZfmpMUqY+8D14IGlGoWN5Lgxyz4hZATbXm9eHD
         65LHjRh9mb6cF5UlTqBZqrSMCV5TLQUNJLragsX6RF4JmVvH5nmFbm0vpXyF+ZW5cCTk
         rDnYulxbTSuXEoMc0uwbq1GnF9MOLHDuSckxL6U0aXDXQU5BnR7ekPXqPvHmFodGNajS
         pF8F7uS/G2LsF7C8QJcSKko3aAeGKKflJ2dEJrdnEhe6WBrRpKhgDqcOc+58QhXzUyHC
         M6aueTtlR8ege5+NEeEvwyEQdWHHxoWX3c5YpkwTMI6ddF9200XUkKJhIr04mzTzhF9o
         SKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794703168; x=1795307968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tG3TwJW+J1JqnPjNeoFVDsdxOoEFkP+pmJh5VpZnCWI=;
        b=favp3VMCfb/xELZP0rDndRtulzPBhw0wjOE8BYoIpQhKoHJ6S+nU62e106rJLjh09Z
         3mWY3hnS4pLb+au69xKwM9LyYNJHcIJxDsCK8f3mPjzc8+qgOwJ5QQ6V6ElhCjN/Fe0w
         VXM366rOLL1ctPpjKWf5toxJp1l09rYpM3rFvAbasTk+AMWusTmE8xowVgwnJ/fTWSii
         lrB8N2/zmFyk7jM33D45ci3unAT6zLnyBsgLgYR9PpYdBhe6QeRiJp/TLnMwYZhAKQ1i
         av4+WMHdp7l687a0BIZY3iTkEYidwyFtuf4w/SwjBideNpYa9g1mPKJqE48pmfpn0xkd
         BuLg==
X-Forwarded-Encrypted: i=1; AL+hErF9RQdO/3uu1SXFpAmaGCYoEjbhgiOL155cDsyEBvylam7HB+XdwOHkH8GTsfbX5Za7fGkJ2MYN9xVEqN4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8SIMqOVoScGHk39KCnhVdlTPTXvcyzwj96bZLTXXj+mHixHSB
	bgL2P0RpUV2+k1jDKfhNANWIVhN9vb1Uq8c0aD6TaW5bJ1JSOCvDltny
X-Gm-Gg: AYBFou0c5XPHK1RgrH3Hy7aqA4eNLZJdVPpkmHvVww3tyiZ+AkBLbVRpXb+5exnuWAF
	AGTbKYSxCyCvJBbQUVh3NVMlC+FcNhm0jU+haq2r+ZbI/zZVy8ShsmVSjEJH5mbFZ2Ltg7o0h7G
	oYmubm/4z11vV2Tn4rGDyGlWxmnTGRgtWx4CsJc2RaWsnYsE7YOh0A85Mhd2n7HB8sB5qlN5PGd
	qt91Jbo7a5VRr0VylcTnyvdWt4gXzmnMxhW+mzII+LvliUGVGUAzLUPaFuxmShqe13/rDwEEIwP
	c+RHnatvj63zkTVCRQviCyNMX/tgVVIiKW2j5762WILIdbiYaor5oCJLGJtwvMs8hdgKr24MOkm
	9n2hVPLK9DhPP9NVntfQMChH6Hfiyt6fBykt8L9SM/PAbtUEiYjm69o8G5gNvVRXKBJxcPgt5hM
	Yv1Llh74ONahAnJopB19Q3ABXWmU4rC3pgTKBjUxpaQk1kn2Zi2TpBEYpq6sj5kzHxFMxsBfWYD
	sWPLN/6UcuODSeISYniYsh5enx5og0BQD1Qzxs/3pedP89g6Whrgf0EZvPtikKEvZ4QiLjtdT42
	zV983ADmsYEIiDjK43d0fYsyL7QDJAq5zGAagl7M7+gZ+GcytZQVjP9yCcHDiXgx2yR8QJE6x7V
	mpg==
X-Received: by 2002:a05:690e:419c:b0:67c:1b89:b117 with SMTP id 956f58d0204a3-67d8972ec68mr4388147d50.77.1794703168379;
        Sat, 14 Nov 2026 16:39:28 -0800 (PST)
Received: from codey.attlocal.net ([2600:1700:22f5:3930::a])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67db0361f39sm189602d50.19.2026.11.14.16.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 16:39:28 -0800 (PST)
From: Lalit Maganti <lalitmaganti@gmail.com>
To: acme@kernel.org,
	namhyung@kernel.org,
	irogers@google.com
Cc: adrian.hunter@intel.com,
	james.clark@linaro.org,
	jolsa@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	peterz@infradead.org,
	mingo@redhat.com,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lalit Maganti <lalitmaganti@gmail.com>
Subject: [PATCH 4/4] perf python: Compress the traces of the perfetto script
Date: Sun, 15 Nov 2026 00:39:16 +0000
Message-ID: <20261115003916.1873857-5-lalitmaganti@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115003916.1873857-1-lalitmaganti@gmail.com>
References: <20261115003916.1873857-1-lalitmaganti@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Perfetto reads zstd and gzip traces directly, so compress the output by
default. Add a -c/--compression option:
 - auto (default): zstd if Python has compression.zstd (3.14+), else
   gzip, so only the standard library is needed
 - zstd: level 9
 - gzip: level 6, with no time or file name in the header so the output
   is reproducible
 - none

Without -o, the output file gets a matching extension: perf.pftrace.zst,
perf.pftrace.gz or perf.pftrace.

For 4496 samples of a two-thread workload, the trace is 127KB
uncompressed, 37KB with gzip and 30KB with zstd. Compressing takes a few
milliseconds.

The shell test now checks every compression the Python running it
supports.

Assisted-by: LLM
Signed-off-by: Lalit Maganti <lalitmaganti@gmail.com>
---
 tools/perf/python/perfetto.py             | 64 ++++++++++++++++++++---
 tools/perf/tests/shell/script_perfetto.sh | 58 ++++++++++++++------
 2 files changed, 99 insertions(+), 23 deletions(-)

diff --git a/tools/perf/python/perfetto.py b/tools/perf/python/perfetto.py
index e168b146e538..3fd3857bde13 100755
--- a/tools/perf/python/perfetto.py
+++ b/tools/perf/python/perfetto.py
@@ -10,12 +10,18 @@ The protobuf wire format is simple enough that the few messages needed are
 encoded by hand below, which avoids a dependency on the protobuf package and
 generated bindings. The field numbers in this file are taken from the .proto
 files under protos/perfetto/trace/ in the Perfetto repository and are stable.
+
+Perfetto reads zstd and gzip compressed traces natively, so the trace is
+compressed with whichever the Python standard library has (zstd since 3.14).
 """
 from __future__ import annotations
 
 import argparse
+import gzip
 import http
 import http.server
+import importlib
+import io
 import os
 import sys
 import time
@@ -24,10 +30,26 @@ import webbrowser
 from collections.abc import Hashable
 from dataclasses import dataclass, field
 from enum import IntEnum
-from typing import BinaryIO, Dict, Optional, Tuple
+from types import ModuleType
+from typing import Dict, Optional, Tuple
 
 import perf
 
+# zstd in the standard library, available since Python 3.14. Imported by name so
+# that the script also type checks with older versions.
+try:
+    ZSTD: Optional[ModuleType] = importlib.import_module('compression.zstd')
+except ImportError:
+    ZSTD = None
+
+# Levels that compress traces close to the maximum at a fraction of its cost.
+ZSTD_LEVEL = 9
+GZIP_LEVEL = 6
+
+# The default trace file name, extended with the compression's file extension.
+DEFAULT_OUTPUT = 'perf.pftrace'
+COMPRESSION_EXTENSIONS = {'zstd': '.zst', 'gzip': '.gz', 'none': ''}
+
 # The only port that the Content Security Policy of ui.perfetto.dev allows
 # fetching traces from.
 UI_FETCH_PORT = 9001
@@ -388,7 +410,7 @@ class Sequence:
 class PerfettoWriter:
     """Writes perf samples to a Perfetto trace file."""
 
-    def __init__(self, out: BinaryIO) -> None:
+    def __init__(self, out: io.BufferedIOBase) -> None:
         self.out = out
         self.session: Optional[perf.session] = None
         self.sequences: Dict[str, Sequence] = {}
@@ -523,9 +545,22 @@ class PerfettoWriter:
                            varint_field(TracePacketField.TIMESTAMP_CLOCK_ID, clock))
 
 
-def convert(input_path: str, output_path: str) -> PerfettoWriter:
+def open_output(raw: io.BufferedIOBase, compression: str) -> io.BufferedIOBase:
+    """Returns a file that compresses what is written to it into raw."""
+    if compression == 'zstd':
+        assert ZSTD is not None
+        out: io.BufferedIOBase = ZSTD.ZstdFile(raw, mode='wb', level=ZSTD_LEVEL)
+        return out
+    if compression == 'gzip':
+        # No file name or time in the header, so the output is reproducible.
+        return gzip.GzipFile(filename='', mode='wb', fileobj=raw,
+                             compresslevel=GZIP_LEVEL, mtime=0)
+    return raw
+
+
+def convert(input_path: str, output_path: str, compression: str) -> PerfettoWriter:
     """Converts a perf.data file to a Perfetto trace file."""
-    with open(output_path, 'wb') as out:
+    with open(output_path, 'wb') as raw, open_output(raw, compression) as out:
         writer = PerfettoWriter(out)
         session = perf.session(perf.data(input_path), sample=writer.process_sample)
         writer.session = session
@@ -593,16 +628,31 @@ def main() -> int:
         description='Convert perf.data to a Perfetto trace and open it in the Perfetto UI')
     parser.add_argument('-i', '--input', default='perf.data',
                         help='perf.data file to read (default: perf.data)')
-    parser.add_argument('-o', '--output', default='perf.pftrace',
-                        help='Perfetto trace file to write (default: perf.pftrace)')
+    parser.add_argument('-o', '--output',
+                        help=f'Perfetto trace file to write (default: {DEFAULT_OUTPUT} '
+                        'with the extension of the compression)')
+    parser.add_argument('-c', '--compression', default='auto',
+                        choices=['auto', *COMPRESSION_EXTENSIONS],
+                        help='compression of the trace; auto is zstd if Python has it '
+                        '(3.14 or later), else gzip (default: auto)')
     parser.add_argument('-n', '--no-open', action='store_true',
                         help='only write the trace, do not open it in the Perfetto UI')
     parser.add_argument('--origin', default='https://ui.perfetto.dev',
                         help='Perfetto UI to open the trace in (default: https://ui.perfetto.dev)')
     args = parser.parse_args()
 
+    compression = args.compression
+    if compression == 'auto':
+        compression = 'zstd' if ZSTD is not None else 'gzip'
+    elif compression == 'zstd' and ZSTD is None:
+        print('zstd compression needs Python 3.14 or later, use --compression gzip',
+              file=sys.stderr)
+        return 1
+    if args.output is None:
+        args.output = DEFAULT_OUTPUT + COMPRESSION_EXTENSIONS[compression]
+
     try:
-        writer = convert(args.input, args.output)
+        writer = convert(args.input, args.output, compression)
     except (OSError, TypeError, ValueError) as err:
         # The perf module reports events it cannot handle as TypeError or
         # ValueError. Do not leave a truncated trace behind.
diff --git a/tools/perf/tests/shell/script_perfetto.sh b/tools/perf/tests/shell/script_perfetto.sh
index 87797b377922..503563d77982 100755
--- a/tools/perf/tests/shell/script_perfetto.sh
+++ b/tools/perf/tests/shell/script_perfetto.sh
@@ -47,25 +47,51 @@ if ! perf record -o "${perfdata}" -e cpu-clock -g -- perf test -w noploop > /dev
 fi
 nr_samples=$(perf script -i "${perfdata}" -F tid | wc -l)
 
-echo "Converting ${nr_samples} samples"
-if ! output=$("${PYTHON}" "${script}" --no-open -i "${perfdata}" -o "${trace}"); then
-  echo "perf script perfetto test [Failed: conversion]"
-  exit 1
-fi
-echo "${output}"
+# Writes a trace of any compression the script supports, decompressed, to stdout.
+decompress() {
+  "${PYTHON}" - "$1" <<'PYEOF'
+import gzip, importlib, sys
+data = open(sys.argv[1], 'rb').read()
+if data[:2] == b'\x1f\x8b':
+    data = gzip.decompress(data)
+elif data[:4] == b'\x28\xb5\x2f\xfd':
+    data = importlib.import_module('compression.zstd').decompress(data)
+sys.stdout.buffer.write(data)
+PYEOF
+}
 
-if ! echo "${output}" | grep -q "Wrote ${nr_samples} samples"; then
-  echo "perf script perfetto test [Failed: expected ${nr_samples} samples]"
-  exit 1
-fi
+test_compression() {
+  local compression=$1
 
-# Interned strings are stored as is in the trace, so the source of the samples,
-# the event and the symbol of the workload must all be in there.
-for expected in linux.perf cpu-clock noploop; do
-  if ! grep -q "${expected}" "${trace}"; then
-    echo "perf script perfetto test [Failed: no ${expected} in trace]"
-    exit 1
+  echo "Converting ${nr_samples} samples with ${compression} compression"
+  if ! output=$("${PYTHON}" "${script}" --no-open --compression "${compression}" \
+                -i "${perfdata}" -o "${trace}"); then
+    echo "perf script perfetto test [Failed: ${compression} conversion]"
+    return 1
   fi
+  echo "${output}"
+
+  if ! echo "${output}" | grep -q "Wrote ${nr_samples} samples"; then
+    echo "perf script perfetto test [Failed: expected ${nr_samples} samples]"
+    return 1
+  fi
+
+  # Interned strings are stored as is in the trace, so the source of the
+  # samples, the event and the symbol of the workload must all be in there.
+  for expected in linux.perf cpu-clock noploop; do
+    if ! decompress "${trace}" | grep -qa "${expected}"; then
+      echo "perf script perfetto test [Failed: no ${expected} in ${compression} trace]"
+      return 1
+    fi
+  done
+}
+
+compressions="none gzip auto"
+if "${PYTHON}" -c "import compression.zstd" 2> /dev/null; then
+  compressions="${compressions} zstd"
+fi
+for compression in ${compressions}; do
+  test_compression "${compression}" || exit 1
 done
 
 echo "perf script perfetto test [Success]"
-- 
2.56.0

