Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794409768;
	b=BiLREXuUVtWAjFJMgljfv8K1OyG7Dzt5j/1UR6FyJ+w92TMEM6aAOGHNH5FDZ7tu4dmS
	 Pox8NRbKb8mlzhCTW0iBcALhkuQ2o/m4x/9/HAdxGTLsTtY3v73KULJI7g1DZ3gzRwPLX
	 UN5tmFMNEjkLCG+RktiyafHpfv4krGlH9trjSlL9HFY/uVillPa3py1FKfOwxlvDE0VWr
	 J2wrI1a/3I+f8aXPYDvsDXzSDYBbYeCKkeOHLIa58gXK8yj8JsPcaMzzIhPtpGEoKN2Ip
	 AgUrPzh9VBhqcASRLOZQl7BfRcBvcn1K3X7aoHrIiYsZEQ5uxSnJtFML3Ylp+PQi85A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794409768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gd8RaVGncElLpDtdkvw4n7+fajQN0/VjTtSychSTN1Q=;
	b=ucjcUI5gRkJpdXhm4cuOjkpcM7c/ztP05xzCYHcMTrg+jWr1KIhRswVStRnQozi7HwBX
	 kex0l1Lfsq74RfwtFHVXDnuaAwoxlcc6vfsmnCGXsKceq+Oa9olHaOpqZIt3y3TiZI5DC
	 fL9GindJhzjzytdnC8y8ECbJWWJeDXeLxO2LdARFe1j7abHqrJzaj+go0yvZKuj2TtXhz
	 qdlez8Vk5jlDfhNj2r6vx4Qs1AVQg8z4HNZH5hc3rWvRVWED3VmVHUNepKTpXjRJ7Qjgn
	 +auoN1SJxEy8YGleiDgzjzR/zkEPtHmTPrl13YxnrCLZGHNLMJTFs6glCW6D8DKmFqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HpB6CVE2;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C6C60A2626
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:09:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92C6C60A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HpB6CVE2
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-37000e7234bso1783472eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794409767; x=1795014567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gd8RaVGncElLpDtdkvw4n7+fajQN0/VjTtSychSTN1Q=;
        b=HpB6CVE2leDdtii3r20+J+++oEzym+Y/IkeOc+Teue7E/ePwWrOzX2sRcDcbHBRl/U
         MGqtrBFMy0MUz37mLjhzDxGDFbfjqPxhPVivIGMlxFPQKwekFOyXpqgK8hW+Qx7pwrT2
         HQM+e0j9G0dlP2/tcX8AAb81oot4be5y8FjJlGiA5/QMoVMNPQnakTKRuud53BKybpQ4
         nAJLcLu/5n017A871giHWQARaM1cbYH1U6I8BIgnUIJUvsbzj9eczvUsAc5V7jo9wKmt
         ahFN+GLuh7zFHlgA5NAKkwu+hI+N4G9hqitgL2skUKjIcTBgLYAWBKz5gWuAQiA7iKQI
         TAoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794409767; x=1795014567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gd8RaVGncElLpDtdkvw4n7+fajQN0/VjTtSychSTN1Q=;
        b=UUVAXSwmrfPe8oJGYjHTk+NQS+LKkQWxbKDQeqfGG3gAYynhSvNC6JOTCbps7p2YpF
         U70cj8YnArgdz+Y67YVb4lgYEJ4x/FAdsd3e1hZSlRAEpMUfLKju0/8ViNMmQDi1TK1Z
         0sJhCfTtIm2QDt7d5WhZaKnnVVxYcUOUitzUCZRiyVPln0fugHs0K+qWje008HetMvzo
         sRbGxz1int7FgebasuxI0+LZHObZTX4JbO3NtHcxrXAUsGgBZFfvAOSBij4InXrtqzbJ
         jwiSGGHpoCndB6BGRzHsnO8W2VwJwQ9drWGs+HEYovoc/Kdd78WKPgnyZKJSChTW8nKB
         eikQ==
X-Forwarded-Encrypted: i=1; AL+hErFDCqNlNpzO5WXS+k4b62vurVrMa6Rr/EU7yoTeWC6M665sblrrRLj7yaAcm7HeWGf6xkmo9u+mhzKBfsc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kha/KIU6qAmCJuppAkubtRKa82V8vEJcxwA+eCxrAqo1xkR4p
	LAl9qRFWomlaHf3b0XYWtGSZoYyexU5qBy6NCr+mRhLdkBdk4MoTgTrrJvSNfolz
X-Gm-Gg: AYBFou29dfb35GuWL4+8ESRjOtPcAdxI0i6skhMvCpetz4HxWmAanOgZMKppwylwIqz
	VYCReAEykhzaWy7wra0aXbBtECsGgnyvONbiRytZjU5znqRQJYbvJtoIonvahS2X5GbpUu0W/xm
	T4YReFUuzblmsGAktANLua2obnMqWU4mLCLnkrsFWwXNZaFzPOg9QSqjJ6G1OfLclBjkeczk/Ko
	o+phgaARL0cpYlRYOYYhf0VP3puk4WW3vRZGzfLJ718qHgYz1Msl+onM1CRJTb9SEFgVY26dzhp
	nqwt5eun/aTsLcrTcfjsD1AiGsYGQ+BIMVNfRbgEMkLYPbRibBJwRXT8xciIQeBLK7kcbKxkI5l
	lOQt0wNEMkcEiKC0SoQbJfC6zRMROgSvYi0urJ/LfXFFZ4ekFbb0UIK/iFITa+4M/DnfbuMSfWV
	lDSVuLVRx9puQRrgZJBIM7d2VG2MsiRNuWenJI/XX7XDEkmXMKIwUN2JpHUVoueA4AY9Xrk53Ps
	zWIZ8WapV3Q2xrHdCkknjIr7V0505X/90YtVV5VSrsFsbWIlNUrvktP62DTw71xu9tnGmF2jF68
	n1qpIWZ2gGms+lfVpcKxrToh1vipsEG6aYimn2leAg==
X-Received: by 2002:a05:7300:dd09:b0:36e:20ee:b288 with SMTP id 5a478bee46e88-37685d717b8mr2973114eec.12.1794409766372;
        Wed, 11 Nov 2026 07:09:26 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375215d8889sm18162507eec.27.2026.11.11.07.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:09:25 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	John Garry <john.garry@linux.dev>,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v6 1/3] perf jevents: Name the metric and the file when a MetricExpr is missing
Date: Wed, 11 Nov 2026 15:09:18 +0000
Message-ID: <20261111150920.2383157-2-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111150920.2383157-1-takano32@gmail.com>
References: <20261111132622.2349165-1-takano32@gmail.com>
 <20261111150920.2383157-1-takano32@gmail.com>
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
with a MetricName and no expression.  Two different failures followed,
neither of which named the metric: the rewrite in _read_json_events_impl()
raised AttributeError on the None, and a metric that got that far reached
print_pending_metrics(), whose assert fired on it.

Raise in the reader instead, naming the metric and the file it came from,
before either of them can happen.  The file matters because the tables are
read through a worker pool in main(), outside the directory walk, so an
exception there loses the name of the table on its way out.  The check is
not inside the '-' test that decides whether a metric takes part in the
rewrite: a name with a dash in it can lose its expression the same way.

Two smaller changes on the same path:

- An architecture standard table that does not parse now carries the
  reason in its message ("Failure processing '<file>' in '<dir>':
  <cause>").  The traceback used to end with the file name alone, and the
  reader already knows the cause.

- The output files are opened after the tables have been read, so a tree
  that fails to parse leaves no half-written table behind.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
v6: patch 1 names the file as well as the metric when a MetricExpr is
    missing (the tables are read through a worker pool, outside the
    walk, so the path was lost).  The perf test's one-line description
    ends in "(no_mlock)" so perf test lists it whole and the test does
    not take a memlock slot.  No other change.

 tools/perf/pmu-events/jevents.py | 79 +++++++++++++++++++++-----------
 1 file changed, 52 insertions(+), 27 deletions(-)

diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index 080e04b51b8c..843748915c12 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -460,11 +460,18 @@ def _read_json_events_impl(path: str, topic: str) -> Sequence[JsonEvent]:
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
+      raise RuntimeError(f'{path}: metric {event.metric_name!r} has no '
+                         'MetricExpr')
     if event.metric_name and '-' not in event.metric_name:
       metrics.append((event.pmu, event.metric_name, event.metric_expr))
   updates = metric.RewriteMetricsInTermsOfOthers(metrics)
@@ -493,7 +500,7 @@ def preprocess_arch_std_files(archpath: str) -> None:
         if event.metric_name:
           _arch_std_events[event.metric_name.lower()] = event
     except Exception as e:
-        raise RuntimeError(f'Failure processing \'{item.name}\' in \'{archpath}\'') from e
+      raise RuntimeError(f'Failure processing \'{item.name}\' in \'{archpath}\': {e}') from e
 
 
 def add_events_table_entries(item: os.DirEntry, topic: str) -> None:
@@ -1490,33 +1497,13 @@ such as "arm/cortex-a34".''',
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
@@ -1553,6 +1540,44 @@ struct pmu_table_entry {
 
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

