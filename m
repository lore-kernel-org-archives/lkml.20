Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599651;
	b=3xvZ+lVtb1QLFn/P4aMnrqbE1eFoe4zLJhufjl40U+HvDB277N+G7vNZdxyQDGrGFzPS
	 fVmQodD5yMAkk0fUFG+VFiRRyLAEG1Q93UaX0FFWM/ja8vklvVYpK0lBtF81tCMrtsmd9
	 UAwmhhYjAW/xaj6QKrFjdjG9hpJLhWJPz+q0YWxtQRCkpRGyr7aO28A5Vivt+BQRT3xC7
	 fRd+q6ua0dXnNsjlrdfe8tW8NXSMpFY4xLhA4Jb+A8UA9suIxJRuz8UTtHoQba5gczj42
	 XKGVPNGJF5HwEw+atZWLqSgfsrsnbbY2E+odKU0mnMwbp4O9FlcHHhnrn9fJJjvH+MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=9lQeSDzLPn0NetxShi8bFo5UmR03J3Qf/BLi41NSqyM=;
	b=PHIgUHnw2cYhzZ6Nc0N8YypnkxawYk/O23JIcz3ENWRdErRSZzVXidEdWTA4E3X0PqUx
	 C9IRZZSSZDvXUYxeGvKyGvsOpdFsu/kI5nw0oFHyjGFg0IhPVYQ1U31LPHe0TEiT093sC
	 eFmML5Tcp1LXL2zeK+H78RrPUGu1BwmBH1tLHkTyzcUPgWybCJsEvps/RWYorMXSA/1t5
	 xcAcYJycjCX+zQNrN8r2Fh1oL6zV9WiwLpmPs/Lr2lJq/5iP2s4TmrQpbJ9KRaKZEMDWe
	 IhnXHw87+yrfEI0rK740yCsolkF5JV5S0CN8dvruKsuBbIN+8j4x1tk4U2ukg0qiTVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GLezMLwr;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292AF60A3838
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 292AF60A3838
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GLezMLwr
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1729233eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794599650; x=1795204450; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9lQeSDzLPn0NetxShi8bFo5UmR03J3Qf/BLi41NSqyM=;
        b=GLezMLwrnfo+uEy2u6jyWikU1Oasvg2kb/YGVrpzWX709NPJ2MyuTtavSTUvjcHTyS
         X76CqxyRvgOKI/ywJseCyFDqZQlRlfY+WSgUTM3PcxEO+oMYrJ7GDEtGUEIbn8WcRnge
         CSMbuoMpo9xClZtSrXpBdqILDi5xu82fEZbWeOo7sdm6WDkSPnQYunOfNjuTradxzDL3
         Av30Uw0ALEeT1O1lrqQoNmVxgKGdof3saWEFHMYkWNUMlgYxPhiOBhGMlHCWJxxzScD3
         EXzBsL0rWPhgGJd8mYixB4oOhoUMMcAhsHVKpzid6Lb+DjMj5+YjuRsOLthUY7rkTE7Z
         Lk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599650; x=1795204450;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9lQeSDzLPn0NetxShi8bFo5UmR03J3Qf/BLi41NSqyM=;
        b=QR7LBWpWNsCdKWqgkwtx9sWIQUpPHFXG3AM2Vw6lLx7IoysgKT/Om+NMRn+w9MU4Tg
         Rgsp+HygQ9+o84h+0R4utD9/gQFBUCpx7nfOSp09M/5WjVQatyCpvcfKMaBrbw0QQH37
         tigEPTl2BV8ppocBi4F121PXyhOT3AGn/NeVCVPfS+2TgAfje5F0JN+wBikaJTEeE9gR
         LfTFaGlNKry97jWmIVECeBYuFYBcm4itHfor2dYRxHMCSZN5fqwTvuPrdtVXpIxWHuPT
         qeJi0Ggo3ftSqqs0/vUPLKrmjtLTGf9TvAhFrWec+L3/DQMDZ+gn3WUDDAYZoesgt08R
         Bsgg==
X-Forwarded-Encrypted: i=1; AL+hErHmCw1lM/At+YJui7PW6pfD4lkwd1GixfJO9ozeWItj0eElcKqMVGYUkQFfYsGT9o3NpGO28t9F28GTwhI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nbooDEPhA98b7uNr9EYN73rr29h8SxKByQeGL8Q/1CqUbDOBb
	QsetYpEj2Yz/UpinlnXOQlV8l000Xz63b1mm632zy2MJZ/wBPsdr4hafUcdKvLmtoivAMzp4bMM
	V50JRytq9qw==
X-Received: from dyba27-n1.prod.google.com ([2002:a05:693c:63db:10b0:36c:9a9b:3677])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:da0f:b0:36c:a42d:9bc9
 with SMTP id 5a478bee46e88-37966961442mr3046001eec.25.1794599649762; Fri, 13
 Nov 2026 11:54:09 -0800 (PST)
Date: Fri, 13 Nov 2026 11:53:17 -0800
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
Message-ID: <20261113195335.2865725-13-irogers@google.com>
Subject: [PATCH v2 12/30] perf pmu-events: Pass e_machine to find_core_*_table()
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

find_core_events_table() and find_core_metrics_table() found tables by
an architecture name, such as from perf_env__arch(), that has to match
the pmu-events architecture directory name, for example "riscv" rather
than the "riscv64" from uname.

Instead find tables by the ELF machine of the CPUID's architecture,
using the e_machine recorded in struct pmu_events_map. The test and
common tables are found with EM_NONE.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/pmu-events/empty-pmu-events.c | 10 ++++++----
 tools/perf/pmu-events/jevents.py         | 10 ++++++----
 tools/perf/pmu-events/pmu-events.h       |  9 +++++++--
 tools/perf/tests/expand-cgroup.c         |  3 ++-
 tools/perf/tests/parse-metric.c          |  3 ++-
 tools/perf/tests/pmu-events.c            |  7 ++++---
 tools/perf/util/tool_pmu.c               |  3 ++-
 7 files changed, 29 insertions(+), 16 deletions(-)

diff --git a/tools/perf/pmu-events/empty-pmu-events.c b/tools/perf/pmu-events/empty-pmu-events.c
index 7428ffd4d70c..eba5446520c4 100644
--- a/tools/perf/pmu-events/empty-pmu-events.c
+++ b/tools/perf/pmu-events/empty-pmu-events.c
@@ -5927,23 +5927,25 @@ const struct pmu_metrics_table *pmu_metrics_table__default(void)
 	return NULL;
 }
 
-const struct pmu_events_table *find_core_events_table(const char *arch, const char *cpuid)
+const struct pmu_events_table *find_core_events_table(uint16_t e_machine, const char *cpuid)
 {
 	for (const struct pmu_events_map *tables = &pmu_events_map[0];
 	     tables->arch;
 	     tables++) {
-		if (!strcmp(tables->arch, arch) && !strcmp_cpuid_str(tables->cpuid, cpuid))
+		if (pmu_events_map__e_machine_matches(tables, e_machine) &&
+		    !strcmp_cpuid_str(tables->cpuid, cpuid))
 			return &tables->event_table;
 	}
 	return NULL;
 }
 
-const struct pmu_metrics_table *find_core_metrics_table(const char *arch, const char *cpuid)
+const struct pmu_metrics_table *find_core_metrics_table(uint16_t e_machine, const char *cpuid)
 {
 	for (const struct pmu_events_map *tables = &pmu_events_map[0];
 	     tables->arch;
 	     tables++) {
-		if (!strcmp(tables->arch, arch) && !strcmp_cpuid_str(tables->cpuid, cpuid))
+		if (pmu_events_map__e_machine_matches(tables, e_machine) &&
+		    !strcmp_cpuid_str(tables->cpuid, cpuid))
 			return &tables->metric_table;
 	}
 	return NULL;
diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index db1b4749aec3..fc3de5fbda27 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -1345,23 +1345,25 @@ const struct pmu_metrics_table *pmu_metrics_table__default(void)
 \treturn NULL;
 }
 
-const struct pmu_events_table *find_core_events_table(const char *arch, const char *cpuid)
+const struct pmu_events_table *find_core_events_table(uint16_t e_machine, const char *cpuid)
 {
 \tfor (const struct pmu_events_map *tables = &pmu_events_map[0];
 \t     tables->arch;
 \t     tables++) {
-\t\tif (!strcmp(tables->arch, arch) && !strcmp_cpuid_str(tables->cpuid, cpuid))
+\t\tif (pmu_events_map__e_machine_matches(tables, e_machine) &&
+\t\t    !strcmp_cpuid_str(tables->cpuid, cpuid))
 \t\t\treturn &tables->event_table;
 \t}
 \treturn NULL;
 }
 
-const struct pmu_metrics_table *find_core_metrics_table(const char *arch, const char *cpuid)
+const struct pmu_metrics_table *find_core_metrics_table(uint16_t e_machine, const char *cpuid)
 {
 \tfor (const struct pmu_events_map *tables = &pmu_events_map[0];
 \t     tables->arch;
 \t     tables++) {
-\t\tif (!strcmp(tables->arch, arch) && !strcmp_cpuid_str(tables->cpuid, cpuid))
+\t\tif (pmu_events_map__e_machine_matches(tables, e_machine) &&
+\t\t    !strcmp_cpuid_str(tables->cpuid, cpuid))
 \t\t\treturn &tables->metric_table;
 \t}
 \treturn NULL;
diff --git a/tools/perf/pmu-events/pmu-events.h b/tools/perf/pmu-events/pmu-events.h
index cb55c9fbca43..c3f645c97ccd 100644
--- a/tools/perf/pmu-events/pmu-events.h
+++ b/tools/perf/pmu-events/pmu-events.h
@@ -4,6 +4,7 @@
 
 #include <stdbool.h>
 #include <stddef.h>
+#include <stdint.h>
 
 struct perf_pmu;
 
@@ -134,8 +135,12 @@ const struct pmu_events_table *perf_pmu__find_events_table(struct perf_pmu *pmu)
 const struct pmu_events_table *perf_pmu__default_core_events_table(void);
 const struct pmu_metrics_table *pmu_metrics_table__find(void);
 const struct pmu_metrics_table *pmu_metrics_table__default(void);
-const struct pmu_events_table *find_core_events_table(const char *arch, const char *cpuid);
-const struct pmu_metrics_table *find_core_metrics_table(const char *arch, const char *cpuid);
+/*
+ * Find the core events or metrics table for a CPUID of the architecture with
+ * ELF machine @e_machine. The test and common tables use EM_NONE.
+ */
+const struct pmu_events_table *find_core_events_table(uint16_t e_machine, const char *cpuid);
+const struct pmu_metrics_table *find_core_metrics_table(uint16_t e_machine, const char *cpuid);
 int pmu_for_each_core_event(pmu_event_iter_fn fn, void *data);
 int pmu_for_each_core_metric(pmu_metric_iter_fn fn, void *data);
 
diff --git a/tools/perf/tests/expand-cgroup.c b/tools/perf/tests/expand-cgroup.c
index 04d62611766a..f5e092e8bb48 100644
--- a/tools/perf/tests/expand-cgroup.c
+++ b/tools/perf/tests/expand-cgroup.c
@@ -10,6 +10,7 @@
 #include "pfm.h"
 #include "target.h"
 #include <subcmd/parse-options.h>
+#include <elf.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
@@ -178,7 +179,7 @@ static int expand_metric_events(void)
 	evlist = evlist__new();
 	TEST_ASSERT_VAL("failed to get evlist", evlist);
 
-	pme_test = find_core_metrics_table("testarch", "testcpu");
+	pme_test = find_core_metrics_table(EM_NONE, "testcpu");
 	ret = metricgroup__parse_groups_test(evlist, pme_test, metric_str,
 					     /*cputype_filter=*/false);
 	if (ret < 0) {
diff --git a/tools/perf/tests/parse-metric.c b/tools/perf/tests/parse-metric.c
index 872d9a7aa72f..6f91e64a4123 100644
--- a/tools/perf/tests/parse-metric.c
+++ b/tools/perf/tests/parse-metric.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/compiler.h>
+#include <elf.h>
 #include <errno.h>
 #include <string.h>
 #include <perf/cpumap.h>
@@ -91,7 +92,7 @@ static int __compute_metric(const char *name, struct value *vals,
 	perf_evlist__set_maps(evlist__core(evlist), cpus, NULL);
 
 	/* Parse the metric into metric_events list. */
-	pme_test = find_core_metrics_table("testarch", "testcpu");
+	pme_test = find_core_metrics_table(EM_NONE, "testcpu");
 	err = metricgroup__parse_groups_test(evlist, pme_test, name,
 					     /*cputype_filter=*/false);
 	if (err)
diff --git a/tools/perf/tests/pmu-events.c b/tools/perf/tests/pmu-events.c
index cb0c2b05c1e8..8e82f7af2aa6 100644
--- a/tools/perf/tests/pmu-events.c
+++ b/tools/perf/tests/pmu-events.c
@@ -4,6 +4,7 @@
 #include "pmu.h"
 #include "pmus.h"
 #include "tests.h"
+#include <elf.h>
 #include <errno.h>
 #include <stdio.h>
 #include <linux/kernel.h>
@@ -449,7 +450,7 @@ static int test__pmu_event_table(struct test_suite *test __maybe_unused,
 {
 	const struct pmu_events_table *sys_event_table =
 		find_sys_events_table("pmu_events__test_soc_sys");
-	const struct pmu_events_table *table = find_core_events_table("testarch", "testcpu");
+	const struct pmu_events_table *table = find_core_events_table(EM_NONE, "testcpu");
 	int map_events = 0, expected_events, err;
 
 	/* ignore 3x sentinels */
@@ -504,7 +505,7 @@ static int __test_core_pmu_event_aliases(const char *pmu_name, int *count)
 	struct perf_pmu_test_event const **test_event_table;
 	struct perf_pmu *pmu;
 	int res = 0;
-	const struct pmu_events_table *table = find_core_events_table("testarch", "testcpu");
+	const struct pmu_events_table *table = find_core_events_table(EM_NONE, "testcpu");
 
 	if (!table)
 		return -1;
@@ -559,7 +560,7 @@ static int __test_uncore_pmu_event_aliases(struct perf_pmu_test_pmu *test_pmu)
 	const struct pmu_events_table *events_table;
 	int res = 0;
 
-	events_table = find_core_events_table("testarch", "testcpu");
+	events_table = find_core_events_table(EM_NONE, "testcpu");
 	if (!events_table)
 		return -1;
 
diff --git a/tools/perf/util/tool_pmu.c b/tools/perf/util/tool_pmu.c
index 6054d5d5aece..d09361999b82 100644
--- a/tools/perf/util/tool_pmu.c
+++ b/tools/perf/util/tool_pmu.c
@@ -14,6 +14,7 @@
 #include <api/io.h>
 #include <internal/threadmap.h>
 #include <perf/threadmap.h>
+#include <elf.h>
 #include <fcntl.h>
 #include <strings.h>
 
@@ -718,6 +719,6 @@ struct perf_pmu *tool_pmu__new(void)
 		perf_pmu__delete(tool);
 		return NULL;
 	}
-	tool->events_table = find_core_events_table("common", "common");
+	tool->events_table = find_core_events_table(EM_NONE, "common");
 	return tool;
 }
-- 
2.56.1.703.gf848ed807c-goog

