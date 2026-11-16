Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812463;
	b=rKcsE78Fui3ZTR3NfVdbVce9aicIzgtNQgHbpw2MlJzPhFwXiXuyI1dS611h94bBCae2
	 wszQULAxLlutCOGSYwqGMtbKAE4myrPdcYjO5NRmj+v5AavNLWxlmj8g4uzsOpRAul6P6
	 jazzFomq6BugLBCQPniMdC2ysenHCSdnA07zam+EYNToeJxijHFO2Dqt31qqy29dyrVtb
	 Su50ozrFs/xcTdwjaTJhGlkeaOqRtiOou1B75YekEdflH051xNeR7PEY3i7i8nFZV6vq3
	 OmLMK70yJAkh4rDj/TQs9hd9+jiPFocPzKeV9udt9dvNVtU1QmO6mTPFFnW9S1EZ4eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=fHfXZS2pPeMwbbcK7lLFD0ZTIav+FZzhGagSqVmo2bw=;
	b=IBOYf/r+DKe6PzrsXqcEEF21NB3C0gC5xqaDa3gwbQA27i+mX64XqatiP2O9ujUUqlCb
	 Er97RD45ylftUtOv0sZ3VVJmtr9FEj8pDQK349MigU4gR3FjT3+thzUBvsecFe7s5zQC5
	 oZ6TcWAEP2O5z2enEpUECcqwwLXhdE3hkj1qFIYbCvvWbgOxYynkcPM1WDmO3+jReRZdr
	 joSOztoEm1wDaUh0oIgstMQt3bosSCXxzLUWRiLjtjfwEGgO3kQivv7B7Jp46eUcgEQVA
	 MRw1Bjxx9zSxV922kc5MfNkMqI2C3L5WdVzg8IN7H1H6acvCdv9RNWIM8+nTlf+U22w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DAMFYpjw;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB12F606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB12F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DAMFYpjw
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36de26cb4b3so3869623eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794812461; x=1795417261; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fHfXZS2pPeMwbbcK7lLFD0ZTIav+FZzhGagSqVmo2bw=;
        b=DAMFYpjw86N5DIohdMxox+q/wD8pUmHyD3ELMsciyrj3w4pu1Ejin6v9UliDSGXZY1
         qaGOw2SL08tICOvSUQqRFrvkmy5ql2YSrRZBA46k4O47+mSabDUpTIGoPN/SYDi8oNH7
         1pW2/2IMKzVe0sFEdwH3yY4Zfx4TyigVWt8UChXr8xjGdlaUJQS7LY5QR9ipIfnjrh8q
         kaR385ISSTLx9+P3RtwjRoY9659MAmZNyK2gjGcG7GsxVjiB+ZGvn2hlmNbQONXNIjuB
         f3OM2SDdbYrVWyXvjsaQ9hK/4pKm+xvnUxzvM7mE+ao1ZnXhzLQsA7E2Au+pIUKfYemT
         24Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812461; x=1795417261;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fHfXZS2pPeMwbbcK7lLFD0ZTIav+FZzhGagSqVmo2bw=;
        b=yWEm/MmOGgvhaEPyP5W2ggE1qF0cYrnqrR1w81DzJFEmDbRQpTjEKJ9a9OSAJD1rQo
         PDswuFQW6B+ikpdu0+H4fZwqcDuJEt6cnqIbQOcdtdnzTyaMtfQfLqitSmlliNq52sav
         +lpVm1H5ftgYlSEG65J0Xmm1PgG/QbKgQYmAyvDBLPpiPKfEXe31krfS3Qktqg3V5U9d
         L9o892FBpATdyn6g7NPf9X0G+HXLpWaTsqfthX7qrsvmhbNd8j7y0+MWZvzhByoDd1c/
         U2j4c/QGLWxLRD1OKZ+r5MkKG3+NsMmHyi8wXCXOawBsbjfLtXr6dAWMlK1G9ycPRlk+
         d00A==
X-Forwarded-Encrypted: i=1; AL+hErF9FuBtjSsf/ZxeBKaC2ECbH7+ncxmP1h0VUckFESfoaJKTW9WG1JS5EW6fxikc7ylLVQLYXqjoU8O3Yd8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QAQte3G1G802toTpULLdik4EHbIehXQ/hUmLTlP2O/YBCuZle
	e4siHKauKzwXU3fyocZAKn6nF8roDgb1h25TQItoa6hsBpnmtk3vLB+sg+l1Ho5VO1MZKDoI2nf
	6Eloh9nqzCg==
X-Received: from dycqw28-n2.prod.google.com ([2002:a05:7300:c01c:20b0:36d:3429:f79f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:8042:b0:36e:2b8b:a098
 with SMTP id 5a478bee46e88-379684b6defmr10913763eec.31.1794812460720; Sun, 15
 Nov 2026 23:01:00 -0800 (PST)
Date: Sun, 15 Nov 2026 23:00:31 -0800
In-Reply-To: <20261116070038.2968725-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261116070038.2968725-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261116070038.2968725-5-irogers@google.com>
Subject: [PATCH v2 04/10] perf jevents: Encapsulate big_c_string lookups
 behind pmu_events__get_string()
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Replace direct &big_c_string[offset] indexing in decompress_event(),
decompress_metric(), and describe_metricgroup() with calls to
pmu_events__get_string(uint32_t offset), and change compact_pmu_event
and metricgroups offsets to uint32_t.

When generating a single file (such as empty-pmu-events.c), emit
pmu_events__get_string() as a static inline helper indexing
static const char big_c_string[]. When generating separate pmu-events.c
and pmu-events-string.c files, keep big_c_string static to
pmu-events-string.c and expose pmu_events__get_string() across the two
generated translation units. Also add explicit POSIX standard header
inclusions to the generated C files.

This cleanly isolates the string storage representation inside
pmu-events-string.c so subsequent patches can replace flat byte offsets
into big_c_string[] with block-indexed string compression (where each
uint32_t offset encodes (block_id << 16) | sub_offset into independently
compressed ~8 KiB blocks decompressed on demand) without changing
pmu-events.c.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/pmu-events/empty-pmu-events.c | 52 +++++++++++----
 tools/perf/pmu-events/jevents.py         | 81 ++++++++++++++++++------
 2 files changed, 104 insertions(+), 29 deletions(-)

diff --git a/tools/perf/pmu-events/empty-pmu-events.c b/tools/perf/pmu-even=
ts/empty-pmu-events.c
index 6121ef3d2a98..c40fa30d7235 100644
--- a/tools/perf/pmu-events/empty-pmu-events.c
+++ b/tools/perf/pmu-events/empty-pmu-events.c
@@ -4,11 +4,15 @@
 #include <pmu-events/pmu-events.h>
 #include "util/header.h"
 #include "util/pmu.h"
-#include <string.h>
+#include <stdbool.h>
 #include <stddef.h>
+#include <stdint.h>
+#include <stdlib.h>
+#include <string.h>
+#include <strings.h>
=20
 struct compact_pmu_event {
-	int offset;
+	uint32_t offset;
 };
=20
 struct pmu_table_entry {
@@ -18,7 +22,7 @@ struct pmu_table_entry {
 };
=20
 /* clang-format off */
-static const char *const big_c_string =3D
+static const char big_c_string[] =3D
 /* offset=3D0 */
 "alignment-faults\000software\000Number of kernel handled memory alignment=
 faults\000config=3D7\000\00000\000\000\000\000\000"
 /* offset=3D92 */
@@ -2635,6 +2639,11 @@ static const char *const big_c_string =3D
 "stalled_cycles_per_instruction\000Default\000(max(stalled\\-cycles\\-fron=
tend, stalled\\-cycles\\-backend) / instructions if has_event(stalled\\-cyc=
les\\-frontend) & has_event(stalled\\-cycles\\-backend) else (stalled\\-cyc=
les\\-frontend / instructions if has_event(stalled\\-cycles\\-frontend) els=
e (stalled\\-cycles\\-backend / instructions if has_event(stalled\\-cycles\=
\-backend) else 0)))\000\000Max front or backend stalls per instruction\000=
\000\000\000\000\000001"
 ;
=20
+static inline const char *pmu_events__get_string(uint32_t offset)
+{
+	return &big_c_string[offset];
+}
+
 static const struct compact_pmu_event pmu_events__common_default_core[] =
=3D {
 	/* bpc\000legacy cache\000Branch prediction unit read accesses\000legacy-=
cache-conf... */
 	{ 216 },
@@ -5460,9 +5469,17 @@ static const struct pmu_sys_events pmu_sys_event_tab=
les[] =3D {
 	},
 };
=20
-static void decompress_event(int offset, struct pmu_event *pe)
+static void decompress_event(uint32_t offset, struct pmu_event *pe)
 {
-	const char *p =3D &big_c_string[offset];
+	const char *p =3D pmu_events__get_string(offset);
+
+	if (!p) {
+		const char *pmu =3D pe->pmu;
+
+		memset(pe, 0, sizeof(*pe));
+		pe->pmu =3D pmu;
+		return;
+	}
=20
 	pe->name =3D (*p =3D=3D '\0' ? NULL : p);
 	while (*p++);
@@ -5489,9 +5506,17 @@ static void decompress_event(int offset, struct pmu_=
event *pe)
 	pe->long_desc =3D (*p =3D=3D '\0' ? NULL : p);
 }
=20
-static void decompress_metric(int offset, struct pmu_metric *pm)
+static void decompress_metric(uint32_t offset, struct pmu_metric *pm)
 {
-	const char *p =3D &big_c_string[offset];
+	const char *p =3D pmu_events__get_string(offset);
+
+	if (!p) {
+		const char *pmu =3D pm->pmu;
+
+		memset(pm, 0, sizeof(*pm));
+		pm->pmu =3D pmu;
+		return;
+	}
=20
 	pm->metric_name =3D (*p =3D=3D '\0' ? NULL : p);
 	while (*p++);
@@ -6003,7 +6028,7 @@ int pmu_metrics_table__iterate_tables(pmu_metrics_tab=
le_iter_t fn, void *data)
 	return 0;
 }
=20
-static const int metricgroups[][2] =3D {
+static const uint32_t metricgroups[][2] =3D {
=20
 };
=20
@@ -6013,11 +6038,16 @@ const char *describe_metricgroup(const char *group)
=20
 	while (low <=3D high) {
 		int mid =3D (low + high) / 2;
-		const char *mgroup =3D &big_c_string[metricgroups[mid][0]];
-		int cmp =3D strcmp(mgroup, group);
+		const char *mgroup =3D pmu_events__get_string(metricgroups[mid][0]);
+		int cmp;
+
+		if (!mgroup)
+			return NULL;
+
+		cmp =3D strcmp(mgroup, group);
=20
 		if (cmp =3D=3D 0)
-			return &big_c_string[metricgroups[mid][1]];
+			return pmu_events__get_string(metricgroups[mid][1]);
 		else if (cmp < 0)
 			low =3D mid + 1;
 		else
diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jeven=
ts.py
index b9669ff82a38..d22916ac87b4 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -899,9 +899,17 @@ static const struct pmu_sys_events pmu_sys_event_table=
s[] =3D {
 \t},
 };
=20
-static void decompress_event(int offset, struct pmu_event *pe)
+static void decompress_event(uint32_t offset, struct pmu_event *pe)
 {
-\tconst char *p =3D &big_c_string[offset];
+\tconst char *p =3D pmu_events__get_string(offset);
+
+\tif (!p) {
+\t\tconst char *pmu =3D pe->pmu;
+
+\t\tmemset(pe, 0, sizeof(*pe));
+\t\tpe->pmu =3D pmu;
+\t\treturn;
+\t}
 """)
   for attr in _json_event_attributes:
     _args.output_file.write(f'\n\tpe->{attr} =3D ')
@@ -917,9 +925,17 @@ static void decompress_event(int offset, struct pmu_ev=
ent *pe)
       _args.output_file.write('\twhile (*p++);')
   _args.output_file.write("""}
=20
-static void decompress_metric(int offset, struct pmu_metric *pm)
+static void decompress_metric(uint32_t offset, struct pmu_metric *pm)
 {
-\tconst char *p =3D &big_c_string[offset];
+\tconst char *p =3D pmu_events__get_string(offset);
+
+\tif (!p) {
+\t\tconst char *pmu =3D pm->pmu;
+
+\t\tmemset(pm, 0, sizeof(*pm));
+\t\tpm->pmu =3D pmu;
+\t\treturn;
+\t}
 """)
   for attr in _json_metric_attributes:
     _args.output_file.write(f'\n\tpm->{attr} =3D ')
@@ -1382,7 +1398,7 @@ int pmu_for_each_sys_metric(pmu_metric_iter_fn fn, vo=
id *data)
 def print_metricgroups() -> None:
   assert _args is not None
   _args.output_file.write("""
-static const int metricgroups[][2] =3D {
+static const uint32_t metricgroups[][2] =3D {
 """)
   for mgroup in sorted(_metricgroups):
     description =3D _metricgroups[mgroup]
@@ -1400,11 +1416,16 @@ const char *describe_metricgroup(const char *group)
=20
 \twhile (low <=3D high) {
 \t\tint mid =3D (low + high) / 2;
-\t\tconst char *mgroup =3D &big_c_string[metricgroups[mid][0]];
-\t\tint cmp =3D strcmp(mgroup, group);
+\t\tconst char *mgroup =3D pmu_events__get_string(metricgroups[mid][0]);
+\t\tint cmp;
+
+\t\tif (!mgroup)
+\t\t\treturn NULL;
+
+\t\tcmp =3D strcmp(mgroup, group);
=20
 \t\tif (cmp =3D=3D 0)
-\t\t\treturn &big_c_string[metricgroups[mid][1]];
+\t\t\treturn pmu_events__get_string(metricgroups[mid][1]);
 \t\telse if (cmp < 0)
 \t\t\tlow =3D mid + 1;
 \t\telse
@@ -1482,11 +1503,15 @@ such as "arm/cortex-a34".''',
 #include <pmu-events/pmu-events.h>
 #include "util/header.h"
 #include "util/pmu.h"
-#include <string.h>
+#include <stdbool.h>
 #include <stddef.h>
+#include <stdint.h>
+#include <stdlib.h>
+#include <string.h>
+#include <strings.h>
=20
 struct compact_pmu_event {
-\tint offset;
+\tuint32_t offset;
 };
=20
 struct pmu_table_entry {
@@ -1534,19 +1559,39 @@ struct pmu_table_entry {
   _bcs.compute()
   _args.output_file.write('/* clang-format off */\n')
   if not _args.output_string_file:
-    _args.output_file.write('static const char *const big_c_string =3D\n')
-    for s in _bcs.big_string:
-      _args.output_file.write(s)
+    _args.output_file.write('static const char big_c_string[] =3D\n')
+    if _bcs.big_string:
+      for s in _bcs.big_string:
+        _args.output_file.write(s)
+    else:
+      _args.output_file.write('""\n')
     _args.output_file.write(';\n\n')
+    _args.output_file.write("""static inline const char *pmu_events__get_s=
tring(uint32_t offset)
+{
+\treturn &big_c_string[offset];
+}
+
+""")
   else:
     _args.output_string_file.write('/* SPDX-License-Identifier: GPL-2.0 */=
\n')
     _args.output_string_file.write('/* Autogenerated by jevents.py */\n')
-    _args.output_string_file.write('extern const char big_c_string[];\n')
-    _args.output_string_file.write('const char big_c_string[] =3D\n')
-    for s in _bcs.big_string:
-      _args.output_string_file.write(s)
+    _args.output_string_file.write('#include <stdint.h>\n\n')
+    _args.output_string_file.write('const char *pmu_events__get_string(uin=
t32_t offset);\n\n')
+    _args.output_string_file.write('/* clang-format off */\n')
+    _args.output_string_file.write('static const char big_c_string[] =3D\n=
')
+    if _bcs.big_string:
+      for s in _bcs.big_string:
+        _args.output_string_file.write(s)
+    else:
+      _args.output_string_file.write('""\n')
     _args.output_string_file.write(';\n')
-    _args.output_file.write('extern const char big_c_string[];\n\n')
+    _args.output_string_file.write('/* clang-format on */\n\n')
+    _args.output_string_file.write("""const char *pmu_events__get_string(u=
int32_t offset)
+{
+\treturn &big_c_string[offset];
+}
+""")
+    _args.output_file.write('const char *pmu_events__get_string(uint32_t o=
ffset);\n\n')
   for arch in archs:
     arch_path =3D f'{_args.starting_dir}/{arch}'
     ftw(arch_path, [], process_one_file)
--=20
2.56.1.703.gf848ed807c-goog

