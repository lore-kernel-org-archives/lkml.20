Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599649;
	b=FRDxLRcq6rJw4TTx2PUQFyHJXEXB6rVgxaWQvSEdNceQoA1xUFE/iBHA2JfWOhvmAs/M
	 jChtxXQoN3VTHxUG3mJ8LGtjaWNNycmDIsAl1HJN8A819cVs6ZJrDXv4BeCpTs0wZLd68
	 eCXhV9VJumf/tk6cNs4UH/elmn8nSSptObylHGyG67x7H3EUwV9s8pY3d2yY5Fb0eBwdz
	 nqggiZehMob5W0huUQEd2l82zVPiFt5sY4PjKYhtCTNp2nOmEpFZb/7iJKBH8YC9lcmuV
	 n8mcVzoIohD6n68W01Z93IPKEyrv9v03exW60phIdDgDLH2cuvGVb+JnsjC7tDNfVTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=84wp6EjV1Tsn1sPNy/nRzDOQGX5uOC1ErlRZoItLiu4=;
	b=w4tR65JKGxU+/3rmqkazKu3GK2yEPL7i5NpyZoAjrNr5WEkwyNtbtPLjX1ZN52x9TcZD
	 Ms1tnb4g9NSO2Dgra0R0Elyf+LdpMOpc0M12cWsc0PZkNWj869D/8ZRrTljOTlWwltF1B
	 fJGuIKI2xgYPEUTxC5KFIpyF22uMjryspAnF3bjjXRnPVc1btk4c4T+5IxSZ4bp+Gbk0b
	 nzIgZqupX66+1ui9zNlKOz3USym47SyKBFM0OwftIarM2EfKqhvZWa9cHDm5ozWB0AY7V
	 BVCJgT4xEeYHLfD38pO1iJIWiJAjOcZ9mGemU36KSi85t9MDVl/4pmBPXIDct/7FIGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A9NJIlHQ;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AFA606A8AB
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:54:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05AFA606A8AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A9NJIlHQ
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ee184a2474so6567675ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794599647; x=1795204447; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=84wp6EjV1Tsn1sPNy/nRzDOQGX5uOC1ErlRZoItLiu4=;
        b=A9NJIlHQFiUVk1Us3sanKSXA0UWPs1LjvK7fk6c9vScknjQruqFjkbHKvlDutPCf4Y
         +PjzFcdBpsJ2dbuWXDx9cnDyd0ekyElaUn2D6inYQvbfgXNGeyfIz/0HhHMr2rjD1+D1
         gyMIl211M/IgQ4JLiUDrEe5/pDKUaJbfBlCtia+BbVq3EvLruM9OuIXeXvnY9DtiKpJz
         vTu16iA0uXSOFOboqX261MjRvrCXV5V1h7YLrBXHGpa7WOGRu54nBMy0aEtHI1zMiAGu
         DzR5J1X7T7HnVrruZDt4T3oilEamOXTpr/UWnX2b8SoobFYLo9FADVKSsueEilKOien2
         qBPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599647; x=1795204447;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=84wp6EjV1Tsn1sPNy/nRzDOQGX5uOC1ErlRZoItLiu4=;
        b=gYJ0r7rmJbDdkLYo9tmrEXBZCfuepo+y90zpgzq2Hjj2WvCOwWswU/ETO2JAVoWz1i
         1KyBsWb1K8nf7dpwXSMzmCTiR6cLo655lJH+ZTnH11Rmtq18AJuPO4FmggP3reDw/CuB
         ycE3+1McjZrxhq1NqrS8uldhk+5lgNMZhkzIHdgI7p+pgJT5qiIOKtm4jtfCILhGe8C9
         Kg/oGyfNusHoxObUT4L6qkF2noaB4iYceXrKNf6+eVdOSs8VmQlaBgTEzvPDGY1akrvu
         6CTLPGM0LS7hQ/sZoaNYOyZ8E4so3bbjVm6MvBof8/deSruPqplbBbND0NC0pxdKLjzz
         BhjQ==
X-Forwarded-Encrypted: i=1; AL+hErEYLuc2f87Pjivz9GPUU0IGOOjGA702pGoT0L40uwIxyBDtNLmDZKdnAdxW7Nc1z4CYlVWn7pFDl7wEWV0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/q99Iipg0H30XJeeOfuBhtIuAeJxg7EGemiiUcbsap02Ts9ow1
	GjynlhRcmgWXPSugiOJAxy8owp1FbbvUogqdhlgFv/KFsKBd0q944WnTlebZGdQy5gqTFHLFyiD
	H5GOpWWNAdQ==
X-Received: from plbaz7.prod.google.com ([2002:a17:902:a587:b0:2e8:f377:a4d4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:fc8d:b0:2e8:79d:15ec
 with SMTP id d9443c01a7336-2ee0d664b70mr38471825ad.6.1794599647162; Fri, 13
 Nov 2026 11:54:07 -0800 (PST)
Date: Fri, 13 Nov 2026 11:53:16 -0800
In-Reply-To: <20261113195335.2865725-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113195335.2865725-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113195335.2865725-12-irogers@google.com>
Subject: [PATCH v2 11/30] perf pmu-events: Add e_machine to struct pmu_events_map
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The CPUID strings in the pmu-events mapfile.csv files have an
architecture specific format, such as "GenuineIntel-6-55-[56789ABCDEF]"
on x86 or a MIDR value like "0x00000000410fd0c0" on arm64. When perf is
built with JEVENTS_ARCH=all the tables of every architecture are
present and map_for_cpu() compared the host's CPUID against all of
them, even though only the host architecture's tables can match.

Record the ELF machine of each architecture's CPUIDs in struct
pmu_events_map, EM_NONE for the test and common tables, and have
map_for_cpu() only consider tables for the host's ELF machine. The 32
and 64-bit variants of x86 and PowerPC share tables.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/pmu-events/empty-pmu-events.c | 24 +++++++++++++++-
 tools/perf/pmu-events/jevents.py         | 35 +++++++++++++++++++++++-
 2 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/tools/perf/pmu-events/empty-pmu-events.c b/tools/perf/pmu-events/empty-pmu-events.c
index 7df1552403e7..7428ffd4d70c 100644
--- a/tools/perf/pmu-events/empty-pmu-events.c
+++ b/tools/perf/pmu-events/empty-pmu-events.c
@@ -4,6 +4,8 @@
 #include <pmu-events/pmu-events.h>
 #include "util/header.h"
 #include "util/pmu.h"
+#include <dwarf-regs.h>
+#include <elf.h>
 #include <string.h>
 #include <stddef.h>
 
@@ -5419,6 +5421,8 @@ struct pmu_metrics_table {
 struct pmu_events_map {
 	const char *arch;
 	const char *cpuid;
+	/* The ELF machine of the architecture's CPUIDs, EM_NONE for test and common. */
+	uint16_t e_machine;
 	struct pmu_events_table event_table;
 	struct pmu_metrics_table metric_table;
 };
@@ -5431,6 +5435,7 @@ static const struct pmu_events_map pmu_events_map[] = {
 {
 	.arch = "common",
 	.cpuid = "common",
+	.e_machine = EM_NONE,
 	.event_table = {
 		.pmus = pmu_events__common,
 		.num_pmus = ARRAY_SIZE(pmu_events__common),
@@ -5444,6 +5449,7 @@ static const struct pmu_events_map pmu_events_map[] = {
 {
 	.arch = "testarch",
 	.cpuid = "testcpu",
+	.e_machine = EM_NONE,
 	.event_table = {
 		.pmus = pmu_events__test_soc_cpu,
 		.num_pmus = ARRAY_SIZE(pmu_events__test_soc_cpu),
@@ -5457,6 +5463,7 @@ static const struct pmu_events_map pmu_events_map[] = {
 {
 	.arch = 0,
 	.cpuid = 0,
+	.e_machine = EM_NONE,
 	.event_table = { 0, 0 },
 	.metric_table = { 0 },
 }
@@ -5769,6 +5776,20 @@ int pmu_metrics_table__find_metric(const struct pmu_metrics_table *table,
 	return PMU_METRICS__NOT_FOUND;
 }
 
+/*
+ * Is the map for the architecture of @e_machine? The 32 and 64-bit variants of
+ * an architecture share tables.
+ */
+static bool pmu_events_map__e_machine_matches(const struct pmu_events_map *map,
+					      uint16_t e_machine)
+{
+	if (e_machine == EM_386)
+		e_machine = EM_X86_64;
+	else if (e_machine == EM_PPC)
+		e_machine = EM_PPC64;
+	return map->e_machine == e_machine;
+}
+
 static const struct pmu_events_map *map_for_cpu(struct perf_cpu cpu)
 {
 	static struct {
@@ -5809,7 +5830,8 @@ static const struct pmu_events_map *map_for_cpu(struct perf_cpu cpu)
 				break;
 			}
 
-			if (!strcmp_cpuid_str(map->cpuid, cpuid))
+			if (pmu_events_map__e_machine_matches(map, EM_HOST) &&
+			    !strcmp_cpuid_str(map->cpuid, cpuid))
 				break;
 		}
 		free(last_map_search.cpuid);
diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index 080e04b51b8c..db1b4749aec3 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -26,6 +26,15 @@ _sys_event_table_to_metric_table_mapping: Dict[str, str] = {}
 # JsonEvent. Architecture standard events are in json files in the top
 # f'{_args.starting_dir}/{_args.arch}' directory.
 _arch_std_events: Dict[str, "JsonEvent"] = {}
+# The ELF machine of the CPUIDs in each architecture's mapfile.csv.
+_arch_e_machine: Dict[str, str] = {
+    'arm64': 'EM_AARCH64',
+    'nds32': 'EM_NDS32',
+    'powerpc': 'EM_PPC64',
+    'riscv': 'EM_RISCV',
+    's390': 'EM_S390',
+    'x86': 'EM_X86_64',
+}
 # Events to write out when the table is closed
 _pending_events: list["JsonEvent"] = []
 # Name of events table to be written out
@@ -730,6 +739,8 @@ struct pmu_metrics_table {
 struct pmu_events_map {
 \tconst char *arch;
 \tconst char *cpuid;
+\t/* The ELF machine of the architecture's CPUIDs, EM_NONE for test and common. */
+\tuint16_t e_machine;
 \tstruct pmu_events_table event_table;
 \tstruct pmu_metrics_table metric_table;
 };
@@ -745,6 +756,7 @@ static const struct pmu_events_map pmu_events_map[] = {
       _args.output_file.write("""{
 \t.arch = "testarch",
 \t.cpuid = "testcpu",
+\t.e_machine = EM_NONE,
 \t.event_table = {
 \t\t.pmus = pmu_events__test_soc_cpu,
 \t\t.num_pmus = ARRAY_SIZE(pmu_events__test_soc_cpu),
@@ -760,6 +772,7 @@ static const struct pmu_events_map pmu_events_map[] = {
       _args.output_file.write("""{
 \t.arch = "common",
 \t.cpuid = "common",
+\t.e_machine = EM_NONE,
 \t.event_table = {
 \t\t.pmus = pmu_events__common,
 \t\t.num_pmus = ARRAY_SIZE(pmu_events__common),
@@ -772,6 +785,7 @@ static const struct pmu_events_map pmu_events_map[] = {
 },
 """)
     else:
+      e_machine = _arch_e_machine[arch]
       with open(f'{_args.starting_dir}/{arch}/mapfile.csv', encoding='utf-8') as csvfile:
         table = csv.reader(csvfile)
         first = True
@@ -798,6 +812,7 @@ static const struct pmu_events_map pmu_events_map[] = {
             _args.output_file.write(f"""{{
 \t.arch = "{arch}",
 \t.cpuid = "{cpuid}",
+\t.e_machine = {e_machine},
 \t.event_table = {{
 \t\t.pmus = {event_tblname},
 \t\t.num_pmus = {event_size}
@@ -814,6 +829,7 @@ static const struct pmu_events_map pmu_events_map[] = {
   _args.output_file.write("""{
 \t.arch = 0,
 \t.cpuid = 0,
+\t.e_machine = EM_NONE,
 \t.event_table = { 0, 0 },
 \t.metric_table = { 0 },
 }
@@ -1178,6 +1194,20 @@ int pmu_metrics_table__find_metric(const struct pmu_metrics_table *table,
 \treturn PMU_METRICS__NOT_FOUND;
 }
 
+/*
+ * Is the map for the architecture of @e_machine? The 32 and 64-bit variants of
+ * an architecture share tables.
+ */
+static bool pmu_events_map__e_machine_matches(const struct pmu_events_map *map,
+\t\t\t\t\t      uint16_t e_machine)
+{
+\tif (e_machine == EM_386)
+\t\te_machine = EM_X86_64;
+\telse if (e_machine == EM_PPC)
+\t\te_machine = EM_PPC64;
+\treturn map->e_machine == e_machine;
+}
+
 static const struct pmu_events_map *map_for_cpu(struct perf_cpu cpu)
 {
 \tstatic struct {
@@ -1218,7 +1248,8 @@ static const struct pmu_events_map *map_for_cpu(struct perf_cpu cpu)
 \t\t\t\tbreak;
 \t\t\t}
 
-\t\t\tif (!strcmp_cpuid_str(map->cpuid, cpuid))
+\t\t\tif (pmu_events_map__e_machine_matches(map, EM_HOST) &&
+\t\t\t    !strcmp_cpuid_str(map->cpuid, cpuid))
 \t\t\t\tbreak;
 \t\t}
 \t\tfree(last_map_search.cpuid);
@@ -1503,6 +1534,8 @@ such as "arm/cortex-a34".''',
 #include <pmu-events/pmu-events.h>
 #include "util/header.h"
 #include "util/pmu.h"
+#include <dwarf-regs.h>
+#include <elf.h>
 #include <string.h>
 #include <stddef.h>
 
-- 
2.56.1.703.gf848ed807c-goog

