Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794370252;
	b=G0zSGoozIMGmiBH3/Dt5VDuHGn4xjahggeQ5uTXE7/sYmfuL4zcdnxUOn8zHGDfxAR8K
	 ehEbayoKHNs/RgL0SgikwuTmQA0x8EuVTR0khBFgh0wwllRZinpkpLZ9Evdii/JqU8/hp
	 Hzb+m/QiTFCWJTCHO7PRbiTdftLHYEMZhzoGGyLdzjYHMsaDIM8TtSiqrsCS37+pbMq2R
	 pxZTNflZvCsa03X2Uf0JT+NcO1AjhNHTBjoeW4cwHAQWcdqrGLw2Jb82eZca31SmD8ENf
	 +ztd2JFXTfArpWmDqVwgxJ7nxW4ouhDBCqR1c8g23nNG0B4mZ48qImAGkLFxM/Z4vCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794370252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=C2daksjx71KIh7FTyCqv+zNTt4E7z0fSyooJRNIVTek=;
	b=QNkoAmFxD3nzuHWmAmVKe+OF7jGBDRvDmGhWnUlDfN2nzIM4C4OUDumgXMmpgtggSgra
	 c0n7loNo6x4yEZM0YwGVJ1dJf7D3jGK3iTSxle4NWG+BDCJgvTQYVgvYSbOWcJP5Ed0fl
	 OsUg3jPtOPoOfn+MWM2g8ppnLprUhaPOh119s8U3w982HMYfUwzlQUwRBtCMYiRBc5H3W
	 W1pdog1fXlgcbwtAMYndm4/GgGUobNnQG3QpPiy0A40vcSOgr8hqFGFADfKtPDUFTD5Pm
	 9vX6Q45HR/rQEZ5EYuO2vhseZRtTFnlsLfxar1xOiZILzGOaWZjeo/gJpcgkbKoyrpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CV4Yxupf;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99BC606A339
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B99BC606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CV4Yxupf
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b3ada81853so2466586c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794370251; x=1794975051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C2daksjx71KIh7FTyCqv+zNTt4E7z0fSyooJRNIVTek=;
        b=CV4YxupfSVRHWCQOu08g23F0XTrpUtaArr4OaPPFNEBA83KC8JnLZXhFTTgElGt/uc
         X0lTKV8ZqZLVj4KOX/ywasGhX++FAJs/mkdlwIzXxLOWyckTbaQaiZvLUc5pqUobO1un
         iWX5vvbC5UeECxMUmljV4PxPcaM9TwtmM7IZuEFEgM0qU6J2sFOP9fJhdsfawyJ3WT8q
         ztQBk5K6cgUXFVJexto4ewSoH2giavRtTNv3DaqYTfeBh1qVZOnzc5MNhUc19lY6lyyt
         gjPROQeJM9a5XNRh7Rwypw8behRqpnA5KAn4seH7EyaG2+HUI7QIgvclEYIQf1AHR2Nt
         5saw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794370251; x=1794975051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C2daksjx71KIh7FTyCqv+zNTt4E7z0fSyooJRNIVTek=;
        b=rLeKHC97HTt0eyczTNfT+1kskvrMqDhLkQfr2qz2US1kvgO56UKwPqFs5V6ls2xovx
         NWGb75DgwuhEz9X3gZvU8XpZRYls0DLqH8vFfmlJiY3keLIpTCxkZAp2IWcAJyTF+U1j
         fp3l1b/+8cTNChLAkLPW+I8k8/tKcWzjWMhmsz+1xEV/y1g3KuzNNfY8GDr+CrDofVOA
         KJWjgHiDV0YfJQPp95Bk114JwQ3TqJvSIanEJkohSySL3v4ezAIkp8XV9uTg8A3shxh2
         7DU7t72TzG2/FYfD3GZxsoGU3M3uHEe7zepOx378dFp4BARngp/yGVwKn1F8U5YX0coy
         nAGw==
X-Forwarded-Encrypted: i=1; AL+hErH0aww2yi26h9jWLZIVOWuqkw8aPyBTpvvLsJtMsFjQ2ykNeES3sVdFLM2Om22j/+U2bfY0s/6qv3jPZDg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lWgPPxAk08GrBXKALOvK+1UXSN+M7dcWnx7D3364Md4Awr3+U
	AAV7IDa2YUVivZXHPBuiIQYd3ccpTsZQFiGKK29fltuc2fbHN8UcvXH0
X-Gm-Gg: AYBFou2GKTmniphLYF5xAFa5Sx6jGheImSxltkAqAGfk+Y5G4NI2gKIj0lOGedHZZZz
	OuYfWwV1LThVuK79lXnGgtA8VURgXSci4PGlTTYWTsvtcSJqcO6FiD3YM/W/IQpra+iduzbDtZJ
	j3P3BbsJ2r88fhpg5t7Ue1nS74Klje2r/NykjpeRUtH3UFeN46BVLdd60GHPPnfjFbBSmlVLICQ
	C/KlkfsH3FjLTid3TJ7xUl+Sy+To8IDMbxHa/EH0GG3YXgcWgKGodI+glaB11/ga6kcXt7NR6pg
	ZvTBTjEUNASktx5ilDLpafA8RnBGWFeOOPprihQkDr5PMDtPeViNDoBc53EzP9wStf3h3yhtcqu
	6uVAnToga0vLT1qdEJb2ItnxHJhRXnCFjG7otmReq7BKy3YFtelszTo9wT3jzV3xN4ZNI06NplS
	Qe+bbG3m+cm/kNk88q4tXIC0HycMUxcFt6kp9zNlO8mUs5fW+f2tZCiW4cgSzP9YhYI4sK5z52T
	7PeAdSixqiKYet14PMBe+QztccGX/zvDVMTqJvuGQaMnI/R+RifisNfdZd0MezgRCNAIXfZw5h+
	Sv7dMw2O1InVztoo5VhT
X-Received: by 2002:a05:7022:7e01:b0:1b2:588e:f89b with SMTP id a92af1059eb24-1b3c036396emr1496069c88.47.1794370250570;
        Tue, 10 Nov 2026 20:10:50 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890e04sm11451201c88.2.2026.11.10.20.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:10:50 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>,
	James Clark <james.clark@linaro.org>,
	John Garry <john.garry@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v4 1/3] perf jevents: Name the metric when a MetricExpr is missing
Date: Wed, 11 Nov 2026 04:10:42 +0000
Message-ID: <20261111041045.2031464-2-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111041045.2031464-1-takano32@gmail.com>
References: <20261111034333.2019831-1-takano32@gmail.com>
 <20261111041045.2031464-1-takano32@gmail.com>
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

jevents.py reads each field it wants out of a JSON object by name, so a
MetricExpr key that is missing or spelled another way leaves the object
with a MetricName and no expression. Two different failures followed,
neither of which named the metric: the rewrite in _read_json_events_impl()
raised AttributeError on the None, and a metric that got that far reached
print_pending_metrics(), whose assert fired on it.

Raise in the reader instead, naming the metric, before either of them can
happen. The check is not inside the '-' test that decides whether a metric
takes part in the rewrite: a name with a dash in it can lose its
expression the same way.

Two smaller changes on the same path:

- An architecture standard table that does not parse now carries the
   reason in its message ("Failure processing '<file>' in '<dir>':
   <cause>").  The traceback used to end with the file name alone, and
   only the chained exception said why.

- A table that does not parse is reported on stderr with a "jevents:
   error:" prefix instead of on stdout, where it was mixed with the
   generated output.

And the output files are opened after every table has been read, and not
by argparse, so a build that fails while reading leaves a file the caller
named as it was instead of truncating it to the header.  "Every table"
includes metricgroups.json, whose first pass runs before this point, and
the string table built from all of them: nothing that parses a file runs
after the output is opened.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
v4: the check's try/except moves into a function, so the name it binds
    is not a module global that makes every local `e` trip pylint's
    redefined-outer-name in the pylint-pmu-events target.  An empty
    table list is an error only for a build that named an architecture:
    --check still reports the failures it collected, and arch=none
    writes the empty tables it wrote before.  Both raised by Sashiko.
v3: metricgroups.json and the string table are read before the output
    files are opened, so a table that does not parse leaves them alone.

 tools/perf/pmu-events/jevents.py | 78 +++++++++++++++++++++-----------
 1 file changed, 51 insertions(+), 27 deletions(-)

diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index 080e04b51b8c..61f778dcc1e5 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -460,11 +460,17 @@ def _read_json_events_impl(path: str, topic: str) -> Sequence[JsonEvent]:
     with open(path, encoding='utf-8') as f:
       events = json.load(f, object_hook=JsonEvent)
   except BaseException:
-    print(f"Exception processing {path}")
+    print(f'jevents: error: Exception processing {path}', file=sys.stderr)
     raise
   metrics: list[Tuple[str, str, metric.Expression]] = []
   for event in events:
     event.topic = topic
+    if event.metric_name and event.metric_expr is None:
+      # A MetricName without a MetricExpr leaves nothing to put in the
+      # generated tables, whether or not the name has a dash, so the build
+      # must not go on.  Name the metric instead of letting the table printer
+      # assert on the None.
+      raise RuntimeError(f'Metric {event.metric_name!r} has no MetricExpr')
     if event.metric_name and '-' not in event.metric_name:
       metrics.append((event.pmu, event.metric_name, event.metric_expr))
   updates = metric.RewriteMetricsInTermsOfOthers(metrics)
@@ -493,7 +499,7 @@ def preprocess_arch_std_files(archpath: str) -> None:
         if event.metric_name:
           _arch_std_events[event.metric_name.lower()] = event
     except Exception as e:
-        raise RuntimeError(f'Failure processing \'{item.name}\' in \'{archpath}\'') from e
+      raise RuntimeError(f'Failure processing \'{item.name}\' in \'{archpath}\': {e}') from e
 
 
 def add_events_table_entries(item: os.DirEntry, topic: str) -> None:
@@ -1490,33 +1496,13 @@ such as "arm/cortex-a34".''',
       type=dir_path,
       help='Root of tree containing architecture directories containing json files'
   )
-  ap.add_argument(
-      'output_file', type=argparse.FileType('w', encoding='utf-8'), nargs='?', default=sys.stdout)
-  ap.add_argument(
-      'output_string_file', type=argparse.FileType('w', encoding='utf-8'), nargs='?', default=None)
+  ap.add_argument('output_file', nargs='?', default=None,
+                  help='file to write the tables to, default standard output')
+  ap.add_argument('output_string_file', nargs='?', default=None,
+                  help='file to write big_c_string to when it is to be kept '
+                       'apart from the tables')
   _args = ap.parse_args()
 
-  _args.output_file.write(f"""/* SPDX-License-Identifier: GPL-2.0 */
-/* THIS FILE WAS AUTOGENERATED BY `jevents.py arch={_args.arch} model={_args.model}` ! */
-""")
-  _args.output_file.write("""
-#include <pmu-events/pmu-events.h>
-#include "util/header.h"
-#include "util/pmu.h"
-#include <string.h>
-#include <stddef.h>
-
-struct compact_pmu_event {
-\tint offset;
-};
-
-struct pmu_table_entry {
-\tconst struct compact_pmu_event *entries;
-\tuint32_t num_entries;
-\tstruct compact_pmu_event pmu_name;
-};
-
-""")
   archs = []
   for item in os.scandir(_args.starting_dir):
     if not item.is_dir():
@@ -1553,6 +1539,44 @@ struct pmu_table_entry {
 
   assert _bcs is not None
   _bcs.compute()
+
+  # Every table has been read by now, so opening the output here cannot truncate
+  # a file the caller named when a table turns out not to parse.
+  if _args.output_file in (None, '-'):
+    _args.output_file = sys.stdout
+  else:
+    try:
+      _args.output_file = open(_args.output_file, 'w', encoding='utf-8')
+    except OSError as e:
+      ap.error(f'argument output_file: {e}')
+  if _args.output_string_file == '-':
+    _args.output_string_file = sys.stdout
+  elif _args.output_string_file is not None:
+    try:
+      _args.output_string_file = open(_args.output_string_file, 'w', encoding='utf-8')
+    except OSError as e:
+      ap.error(f'argument output_string_file: {e}')
+  _args.output_file.write(f"""/* SPDX-License-Identifier: GPL-2.0 */
+/* THIS FILE WAS AUTOGENERATED BY `jevents.py arch={_args.arch} model={_args.model}` ! */
+""")
+  _args.output_file.write("""
+#include <pmu-events/pmu-events.h>
+#include "util/header.h"
+#include "util/pmu.h"
+#include <string.h>
+#include <stddef.h>
+
+struct compact_pmu_event {
+\tint offset;
+};
+
+struct pmu_table_entry {
+\tconst struct compact_pmu_event *entries;
+\tuint32_t num_entries;
+\tstruct compact_pmu_event pmu_name;
+};
+
+""")
   _args.output_file.write('/* clang-format off */\n')
   if not _args.output_string_file:
     _args.output_file.write('static const char *const big_c_string =\n')
-- 
2.53.0

