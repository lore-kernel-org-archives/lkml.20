Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403593;
	b=o3nkQVwtAdHR6DSucIDsnZAkP5nAGWaqNuqP6bEZ9fHtsFrx/CWZBQnIU0zJyT++zo12
	 g41LahUt6kvh/D4OZ+PLE9k/3BcoSaLbwhFzDP+/eaSL1+ClRVjpXSrzrGja5vC4P3pkH
	 diUqvBeHGSIf59UrNTKLGCk/EeZFQX9dWug3QALhT8sJGKEJCok9l8nEb0Pa8ObZKeZ9w
	 U/x9nyH7vyL5Wka6NA+kefTJzO8r+sq5Rh8FOzhGMhgCxggqI9j+j742zxueMVByIcvI5
	 tmieHV87PS9EH1HpqWHl3vhqAN2rzn9uuOR+0CnhdHNO0syesn2A2ay9//XuUhbpQeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Qlh/NbB/SLsweGl68rOzqRC0K8ERB7oVP/kP9StNUEc=;
	b=TcmY1V9HTUULEk26jzIYj+9mjiofE+8nylIAiqtXSOXLoiyy/qMZpZge7Pv6h6tzzrCx
	 FV9jk0LHFCy+JZRkRod1cKG04KZ/yVf2XjHsIoAVejt4xvv6ibd1WlUM28wLjVesnxWHp
	 pVSpzIyIyrR7qVCF053k36N9XmPJC4aF4WFToPMv4Z3jc6nv6boz8n/X9T+zwEpYKobsv
	 y8JgXSyDR9RhMKYlkL+iFMNEabDFFkym8u2KpZ3RSWhonJ3Az09lk327SzGc+PagjyAdA
	 q3aJNWFgTcOZMtuO844AeTBsa/aJ/ShCv8fy6hh4tC0E3tqR1/a7SNGzt7oSfxdnEsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kKDlNKpE;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5C1606A338
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:26:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE5C1606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kKDlNKpE
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3720addb068so5737192eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794403592; x=1795008392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qlh/NbB/SLsweGl68rOzqRC0K8ERB7oVP/kP9StNUEc=;
        b=kKDlNKpEk5hepD4/OoeWFvCrgRH/Eehfz1ynsUJTGkuVEDk6eoApXsu61ALcO7HEFV
         F/52KGyH6teDW+H0+4u0WW093UgQcPK37VmkbIZuHsai1fF/rR9w7J6dsZ8n77YbYz9K
         r4k5SpvWqWB3LaSMQpJ7P1eCKk1uXRk4GSnLIVjFdCALISDEDxM80U2/K+zCwUDkW1ff
         q4nhU8mVa7h47H3OV2V+qjhhpnikYSb9VqyQ20SwKGMdGZKPjihmivehCpBol075HlZt
         L/Z23olm7Jw9nmUZBfEea5CJ9Gk+4hCw/jCEVyrh5S4J2gDK0hOIYcw4EDNBNyKuEZ5y
         sdLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403592; x=1795008392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qlh/NbB/SLsweGl68rOzqRC0K8ERB7oVP/kP9StNUEc=;
        b=MwctlvD6kvMjSIBy6JfeDcavFHa/GpeJuzLmWqjs1owt+Kv8eCoYV88CK3ZOKECaLY
         kQ0eeWQqLygWqnh+jqlsMUX+CYOmyZLJsBksLueXrakyT09zh8Y8K1qMF3jl3kFTkcau
         4Nu/yXkbzuPs9L1ylF5ASwxaEtYi6jsp4oDOOG7YZx/7Us9DhT4uxLKXpuxxM+DaiXiT
         t2v39L3CpgHLPcGo0M1fTBxHqK1u+GvKmvFkLYY7n53TWjOS6AApxNomiRb+s57Hfldj
         fiKwK0t4+F/0Bj3WLAI79toK2dut//G/7iu6PkfsBc8uA2eX50T7JT1EmHHnhhLMurbJ
         weYA==
X-Forwarded-Encrypted: i=1; AL+hErFNbQbqraU9T+YGP4lxcZrFPEtSIePLYZFlrhw9O7sSfHGweOjIm787DCbiLaC51u6m8u43CYiLiC29u28=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lqPa4H74Adva+2bpa1KFLg/KwHWM1ztWi51FHe3GOc3IXc4kk
	dkN6FC8ndj+KpnYRzn0xN2RZnNbT7NkmDxSlGr7SHyxPtEsYzRtm5K7V
X-Gm-Gg: AYBFou0piIzDe0w7ueCiDv3cS8XlQKz/6iJGhth/ih1go03dNAn1vL+wQUZVLh5Shkd
	3yJQi8JWCYblWHKv+dzzKbI+vmhqLqYfhbGD/307EU9H4UJe0qbo6KgWEx/p3qiHm8s1TblcSVU
	5taOmH2Z/NNZUvcYf3G6fhqSReHDk75Xdwbx/EisRxfaFRgt0SQSIJnKcWwOtsg4D2nnxNqSp2Z
	vpxa5dUbqh/gjYzxiiH3a4FIfNw2dEdI+KbNIqFmrUavECrP83PmpkninYTXp142eTVCdCVdtYe
	ojwqIM1PZm6fKJgoyaKoXRnejPvyDeNCGOgY5mie5JPOxbL+fKKNsBmM9cIhqHSlg7+zP0wBCki
	souf+GHI3gxKPfXvNco4sAFUPD7Fd52QOJshssl7QHYsGGvNRAvsYTOpeZEvumEWasZf3W4GoeV
	urlBB+rFOlWjNoOpHZSOOINKsl5bmEJ6oiwpoCUnHxiIjAPaeuPsX/76HJwmfuolgXsj6IHyxCK
	PtDq49Atqf7k1QeCfbu0Y9u2EKLA/VPZADArHDWR5OzwZfP3dzzqbz1TS/MMQe9TmpuJ13woL9Z
	1PGBX3cGbG24okfjPmtd
X-Received: by 2002:a05:7022:f10a:b0:166:f097:6f12 with SMTP id a92af1059eb24-1b3c0337115mr1787921c88.15.1794403591550;
        Wed, 11 Nov 2026 05:26:31 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm33053502c88.10.2026.11.11.05.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:26:30 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	John Garry <john.garry@linux.dev>,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v5 1/3] perf jevents: Name the metric when a MetricExpr is missing
Date: Wed, 11 Nov 2026 13:26:20 +0000
Message-ID: <20261111132622.2349165-2-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111132622.2349165-1-takano32@gmail.com>
References: <20261111041045.2031464-1-takano32@gmail.com>
 <20261111132622.2349165-1-takano32@gmail.com>
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
v5: patch 3 says which keys a table may carry and checks the tree
    against that list, replacing the near-miss report that v4 had.
    The list is 51 names, 47 of which jevents.py reads; an architecture
    that is not there or is named as a path is an error (status 2)
    instead of a silent pass, and an object written without the list
    brackets is reported.  The name of a metricgroup is not treated as
    a key.  jsonschema is not used because perf's build would then
    require it, and the list holds the same names a schema would.
    The target is check-jevents, next to check-headers, and takes
    JEVENTS_CHECK_ARCH; a shell test covers a reported key, a clean
    tree and a missing architecture.

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

