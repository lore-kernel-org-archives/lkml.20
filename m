Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794348525;
	b=C6kQmsnq1rK0ufmybou2FODJABPu4nQx7htAuMDG4PdarvBcUOULsztVs+ZlYW2BOjXs
	 jcfd8qkQh8dJdsVCy4vlqd3Z+65AgyLa+Zz7SxvULyIy1VQMkZuGOmXTsBw2dw4tK7b14
	 Ph3sgDLczvMzJVIQNblujfQmMC0Zc0a3uN/htqdQzcplm11CNr6I91kXtGI4YFPe1OjDE
	 Rdx3JDolyiLAlJnH3u0VmwucKzdp5z7ELSnFckBnIolMD0Dc1hSflArklSMbARc9hp7tV
	 f/jlZaCbbCBBasUUKChK7TcOsz0qnPltVk2gbBcjm617Kcjym6TOQlUsZGKqBiOkICA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794348525;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=O6syoNifAgpep7IiCtXHkOrs1T18nWzE+pWKjVGcWxE=;
	b=I5s8qQ1bLSfRtee+GWE8EKjmgwKGfadNOqhnFMiqfcR2I+4GKOd+NGteT2/suPqQgSq7
	 QCOOOkVfLN/KQlvOe5nD1n+okAqVLzr2sjXw0v6uVhJrpT+4JjbqZSpo7s9tm3mmHM4QA
	 QwFrao/eRplwM+SIp5AYe6t0xvYvd2Dc7c0W6AbbUj9go/KLTxpanZvu1iWHWfmTzoIaP
	 hjfygWSsVlXhM3sEUKWi6hGC9i924b4mMoehx1uW/UYTvLQOd3XDG73HSstYGcyovI//8
	 /R64spp9Uu6KZ73U5evpL9ZPI9XrjSfKjlI5ZiETmFjBYbMiY1zNcCsKuMjm72bHHwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PfIYeMEi;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CADB606D522
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CADB606D522
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PfIYeMEi
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-370230d93efso5068498eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794348524; x=1794953324; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O6syoNifAgpep7IiCtXHkOrs1T18nWzE+pWKjVGcWxE=;
        b=PfIYeMEi8iBem0iMM2NrHmjNwozGdchCxln3u8k3k4OkqaeYFDpRaMy118jLfkgdwm
         I0Ayo/ntdI/bUVCWS56bDBVX91OIs9YxBfr9agYJ2ipIMthfa86ffDtND50f9ykl2+xd
         SAg6+lVWa8KW8C6viaW0F6V9M/bRMqA4FPHKBc5QOLB1ryN5gbTaJhnCEi4w2MwH7J4M
         NjhWPJzcvF4S6WGT1AHlcFpFKHyol7VjcZJh9WhMCsTm7bH7DNJn1gRG08AsjQDfCpxT
         mSibwsHROHH6sqG4QjdGfWb69Wef+DDWmlBSWgecD0vgW7JKFnv+hGWkUb2Gn2eCqqcY
         QNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794348524; x=1794953324;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O6syoNifAgpep7IiCtXHkOrs1T18nWzE+pWKjVGcWxE=;
        b=XCuYOJ2habY04sAM55q+pN+f7n5HohX4lQtOj8VtwoQLCmXOv8K7hg7UgERcXkkpdr
         VCrtBWiM4d0xRO2GCIJI2vtFCrirT0HvGewSaL/VU/yBhXWXp8QaSebwFGKixksqZFlJ
         KZ8of2PT7Ev5EavbMO2Es/3meHjhp/37BA26PQFw2biOQLM3iUkk7oG8SR6HdJ4Pr1Cz
         6PyFrc3o0iexxSS2V2vgcaAzKHEJuRURHgvlh95v5LV0vLO9RD9AMG6AEpD6or+7Wpdh
         iYOCIBgJh410u25+KPKtiDojwlfN5QO6/F38xcSpay0RqOSpvWXZHAvqKrfLW5e5Btw7
         dDnQ==
X-Forwarded-Encrypted: i=1; AL+hErGkPiEbBSmhCP7NUXe0tZdPniylaHZr8GS6IcenITdhPk85AyIelCnOGmwNXmHiT3uxiWfwc9McafF0IY0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/h40WIdgBjqi8vgjRPjZN2Suziia7nIEyP9UGbYZPGA7Dzd1OE
	ZQoadZQP1ka5ibc5fB6v0XTuFCIL5Jr9OZ4REf/Ihpyz494EQzBb0f+qm0AMy0cxuV6JWNjubke
	i5R3F4SlTGg==
X-Received: from dybdw19.prod.google.com ([2002:a05:7300:b913:b0:369:f2bd:5ab6])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:4703:b0:370:1652:5ff4
 with SMTP id 5a478bee46e88-376851ce2bdmr927784eec.6.1794348524069; Tue, 10
 Nov 2026 14:08:44 -0800 (PST)
Date: Tue, 10 Nov 2026 14:07:53 -0800
In-Reply-To: <20261110220803.2503416-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261027231513.816148-1-irogers@google.com> <20261110220803.2503416-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261110220803.2503416-11-irogers@google.com>
Subject: [PATCH v3 10/20] perf bench internals: Add maps benchmark
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, haghdoost@uber.com, 
	namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Add a 'perf bench internals maps' subcommand to measure map insertion,
sorting, and lookup operations directly:

1. Inserts non-overlapping maps in ascending address order (simulating
   /proc/<pid>/maps synthesis) and queries each map by address.
2. Incrementally appends maps at interior addresses (simulating runtime
   PERF_RECORD_MMAP2 / JIT events) and immediately queries each map by
   address and by name.

Example output:

  $ perf bench internals maps
  # Running 'internals/maps' benchmark:
    Average ascending insert + lookup: 145.870 usec (+- 14.628 usec)
    Average append + lookup: 17405.810 usec (+- 1773.195 usec)

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Documentation/perf-bench.txt |   3 +
 tools/perf/bench/Build                  |   1 +
 tools/perf/bench/bench.h                |   1 +
 tools/perf/bench/maps.c                 | 202 ++++++++++++++++++++++++
 tools/perf/builtin-bench.c              |   1 +
 5 files changed, 208 insertions(+)
 create mode 100644 tools/perf/bench/maps.c

diff --git a/tools/perf/Documentation/perf-bench.txt b/tools/perf/Documentation/perf-bench.txt
index 54eb809540c4..c65dd8f4131f 100644
--- a/tools/perf/Documentation/perf-bench.txt
+++ b/tools/perf/Documentation/perf-bench.txt
@@ -354,6 +354,9 @@ Suite for evaluating perf's event synthesis performance.
 *symbols*::
 Suite for evaluating ELF symbol loading, sorting, and lookup performance.
 
+*maps*::
+Suite for evaluating maps insertion, sorting, and lookup performance.
+
 SEE ALSO
 --------
 linkperf:perf[1]
diff --git a/tools/perf/bench/Build b/tools/perf/bench/Build
index c3c0319696ae..d51e52d3742a 100644
--- a/tools/perf/bench/Build
+++ b/tools/perf/bench/Build
@@ -21,6 +21,7 @@ perf-bench-y += breakpoint.o
 perf-bench-y += pmu-scan.o
 perf-bench-y += uprobe.o
 perf-bench-y += symbols.o
+perf-bench-y += maps.o
 
 perf-bench-$(CONFIG_X86_64) += mem-memcpy-x86-64-asm.o
 perf-bench-$(CONFIG_X86_64) += mem-memset-x86-64-asm.o
diff --git a/tools/perf/bench/bench.h b/tools/perf/bench/bench.h
index e0b35d45559a..c988d236e0f0 100644
--- a/tools/perf/bench/bench.h
+++ b/tools/perf/bench/bench.h
@@ -53,6 +53,7 @@ int bench_uprobe_empty_ret(int argc, const char **argv);
 int bench_uprobe_trace_printk_ret(int argc, const char **argv);
 int bench_pmu_scan(int argc, const char **argv);
 int bench_symbols(int argc, const char **argv);
+int bench_maps(int argc, const char **argv);
 
 #define BENCH_FORMAT_DEFAULT_STR	"default"
 #define BENCH_FORMAT_DEFAULT		0
diff --git a/tools/perf/bench/maps.c b/tools/perf/bench/maps.c
new file mode 100644
index 000000000000..da05d39c5e0b
--- /dev/null
+++ b/tools/perf/bench/maps.c
@@ -0,0 +1,202 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Benchmark maps insertion, sorting, and address/name lookup.
+ */
+#include <errno.h>
+#include <inttypes.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/time.h>
+#include <unistd.h>
+#include <linux/compiler.h>
+#include <linux/kernel.h>
+#include <linux/time64.h>
+#include <subcmd/parse-options.h>
+#include "bench.h"
+#include "../util/debug.h"
+#include "../util/dso.h"
+#include "../util/env.h"
+#include "../util/machine.h"
+#include "../util/map.h"
+#include "../util/maps.h"
+#include "../util/stat.h"
+
+static unsigned int iterations = 100;
+static unsigned int nr_maps = 1000;
+static unsigned int nr_appends = 200;
+
+static const struct option options[] = {
+	OPT_UINTEGER('i', "iterations", &iterations,
+		     "Number of iterations used to compute average (default: 100)"),
+	OPT_UINTEGER('m', "nr-maps", &nr_maps,
+		     "Number of ascending maps per iteration (default: 1000)"),
+	OPT_UINTEGER('a', "nr-appends", &nr_appends,
+		     "Number of incremental map appends per iteration (default: 200)"),
+	OPT_END()
+};
+
+static const char *const bench_usage[] = {
+	"perf bench internals maps <options>",
+	NULL
+};
+
+static int do_maps_bench(void)
+{
+	struct stats asc_stats, append_stats;
+	unsigned int total_dsos = nr_maps + nr_appends;
+	struct perf_env host_env;
+	struct machine *machine;
+	struct dso **dsos;
+	struct map **all_maps;
+	unsigned int i, j;
+	int err = 0;
+
+	if (total_dsos == 0)
+		return 0;
+
+	perf_env__init(&host_env);
+	machine = machine__new_live(&host_env, /*kernel_maps=*/false, getpid());
+	if (!machine) {
+		perf_env__exit(&host_env);
+		return -ENOMEM;
+	}
+
+	dsos = calloc(total_dsos, sizeof(*dsos));
+	all_maps = calloc(total_dsos, sizeof(*all_maps));
+	if (!dsos || !all_maps) {
+		free(dsos);
+		free(all_maps);
+		machine__delete(machine);
+		perf_env__exit(&host_env);
+		return -ENOMEM;
+	}
+
+	for (i = 0; i < total_dsos; i++) {
+		char name[32];
+		u64 addr;
+
+		scnprintf(name, sizeof(name), "/tmp/bench_dso_%06u.so", i);
+		dsos[i] = dso__new(name);
+		if (!dsos[i]) {
+			err = -ENOMEM;
+			goto out_free;
+		}
+		if (i < nr_maps) {
+			addr = 0x100000ULL + (u64)i * 0x2000ULL;
+			all_maps[i] = map__new2(addr, dsos[i]);
+			if (!all_maps[i]) {
+				err = -ENOMEM;
+				goto out_free;
+			}
+			map__set_end(all_maps[i], addr + 0x1000ULL);
+		} else {
+			u64 k = i - nr_maps;
+			u64 slot = nr_maps ? (k * 197ULL) % nr_maps : k;
+
+			addr = 0x101000ULL + slot * 0x2000ULL +
+			       (nr_maps ? (k / nr_maps) * 0x100ULL : 0);
+			all_maps[i] = map__new2(addr, dsos[i]);
+			if (!all_maps[i]) {
+				err = -ENOMEM;
+				goto out_free;
+			}
+			map__set_end(all_maps[i], addr + 0x80ULL);
+		}
+	}
+
+	init_stats(&asc_stats);
+	init_stats(&append_stats);
+
+	for (i = 0; i < iterations; i++) {
+		struct timeval start, end, diff;
+		struct maps *maps = maps__new(machine);
+		u64 runtime_us;
+
+		if (!maps) {
+			err = -ENOMEM;
+			goto out_free;
+		}
+
+		/*
+		 * Phase 1: Insert maps in ascending address order (simulating
+		 * /proc/<pid>/maps synthesis) and look up each map by address.
+		 */
+		gettimeofday(&start, NULL);
+		for (j = 0; j < nr_maps; j++) {
+			err = maps__fixup_overlap_and_insert(maps, all_maps[j]);
+			if (err) {
+				maps__zput(maps);
+				goto out_free;
+			}
+		}
+		for (j = 0; j < nr_maps; j++) {
+			u64 addr = 0x100000ULL + (u64)j * 0x2000ULL + 0x100ULL;
+			struct map *found = maps__find(maps, addr);
+
+			map__put(found);
+		}
+		gettimeofday(&end, NULL);
+		timersub(&end, &start, &diff);
+		runtime_us = diff.tv_sec * USEC_PER_SEC + diff.tv_usec;
+		update_stats(&asc_stats, runtime_us);
+
+		/*
+		 * Phase 2: Incrementally insert maps at interior addresses
+		 * (simulating runtime MMAP2 / JIT code events) and immediately
+		 * query by address and by name.
+		 */
+		gettimeofday(&start, NULL);
+		for (j = 0; j < nr_appends; j++) {
+			struct map *map = all_maps[nr_maps + j];
+			struct dso *dso = dsos[nr_maps + j];
+			u64 addr = map__start(map);
+			struct map *found;
+
+			err = maps__fixup_overlap_and_insert(maps, map);
+			if (err) {
+				maps__zput(maps);
+				goto out_free;
+			}
+
+			found = maps__find(maps, addr + 0x10ULL);
+			map__put(found);
+
+			found = maps__find_by_name(maps, dso__short_name(dso));
+			map__put(found);
+		}
+		gettimeofday(&end, NULL);
+		timersub(&end, &start, &diff);
+		runtime_us = diff.tv_sec * USEC_PER_SEC + diff.tv_usec;
+		update_stats(&append_stats, runtime_us);
+
+		maps__zput(maps);
+	}
+
+	printf("  Average ascending insert + lookup: %.3f usec (+- %.3f usec)\n",
+	       avg_stats(&asc_stats), stddev_stats(&asc_stats));
+	printf("  Average append + lookup: %.3f usec (+- %.3f usec)\n",
+	       avg_stats(&append_stats), stddev_stats(&append_stats));
+
+out_free:
+	for (i = 0; i < total_dsos; i++) {
+		map__put(all_maps[i]);
+		dso__put(dsos[i]);
+	}
+	free(all_maps);
+	free(dsos);
+	machine__delete(machine);
+	perf_env__exit(&host_env);
+	return err;
+}
+
+int bench_maps(int argc, const char **argv)
+{
+	argc = parse_options(argc, argv, options, bench_usage, 0);
+	if (argc) {
+		usage_with_options(bench_usage, options);
+		exit(EXIT_FAILURE);
+	}
+
+	return do_maps_bench();
+}
diff --git a/tools/perf/builtin-bench.c b/tools/perf/builtin-bench.c
index f937c08f3900..57a4199a058c 100644
--- a/tools/perf/builtin-bench.c
+++ b/tools/perf/builtin-bench.c
@@ -98,6 +98,7 @@ static const struct bench internals_benchmarks[] = {
 	{ "evlist-open-close", "Benchmark evlist open and close",	bench_evlist_open_close	},
 	{ "pmu-scan", "Benchmark sysfs PMU info scanning",	bench_pmu_scan		},
 	{ "symbols", "Benchmark symbol loading, sorting and lookup",	bench_symbols	},
+	{ "maps", "Benchmark maps insertion, sorting and lookup",	bench_maps	},
 	{ NULL,		NULL,					NULL			}
 };
 
-- 
2.56.0.542.g3ef89b7020-goog

