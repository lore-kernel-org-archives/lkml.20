Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599668;
	b=OILdqsK9J22QFKQ+tUjXEhzgEAUelF4mCDrroh+WCtr1APkiWMpc8M2537W0BCNhdAV0
	 tfnmcYgHw3Eeii7cXNbZeZkn5Wrl3J5cntXaX6CEyvu96mg+xFuDyP07rtDIMJNb7Bt7q
	 fRKEx6viY/guSserIKiCKa16PHS57CckG6bP3v2MY28C0aFuxIhcoXyXyZFpUu5ZIz/qT
	 YLNb7rlPRJgkMcq1O2Etw8+U1ckDTcFt3zkwAuN0sj/dMkkrpdmnbpd7y6z6Tl3ROB9Hj
	 yr165mRTBIM/uSWSpj2Mp617pchQWmpmVPsi+gVl5RVIqJZK94jNpdKtTeifcb1xayA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=fkfXUbNTK8P0lsuznK78MIRh0hCShx1ut7SSZ0VqG7c=;
	b=OdCklVKt5X1ztfKGluTItdTah4MHvKqHQWU5AZjHehtTZpLx46BV82pdpYAUl2EhiY3B
	 7y5cV+Rd/pQuReMWydd7Rj/DzZdbXttidJ59xNP/atBizb6j1TD1zgcPUppy15apEehDX
	 vjokVgvCNnDTgeCF1536ruPtIUzQjseFCQrDC33tzM2/LjWgb+eB375TIrurEUXZUfeBV
	 Chd+HEaT8Ay5+R2hiSpOO804PR6/lzr67JVgPCpDosdEGyRlre8JxzEE3lLli1iJXfLEZ
	 8LLhK9fePYyAE/nz8b0M8otXmaD8EVqpS6drHmNKmBzwTxy/rzY5JCkJ0fPnmcVYvjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=myudw+qg;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C9760A6F75
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:54:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3C9760A6F75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=myudw+qg
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36efb506f29so1344077eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794599667; x=1795204467; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fkfXUbNTK8P0lsuznK78MIRh0hCShx1ut7SSZ0VqG7c=;
        b=myudw+qgsZOmTwUVpegX8MWcOGhEgMLuIKClxFognGeTM8OQBmorZa64zCbBhdc33C
         pgMZG24dez/NefVNHC38BbbOmpktgFTfQpmlFXCpTPKvgmbXhXjfwanHG95gTimNEVO+
         fgzA2oiRgtDb0KpG2b843ulsFF+85tmO7/tra0hXBe91zxsVSVjhleFT2QUACCfVtBkg
         LM/XbqMoLxGN+Q8OzEPrvTU4w6nX6sMW6lIR7G8nBMXYTtWSIgGTFeg6b+WhwO56aEwa
         AL+9w+iup8W25zNZ7SoSO2FC7+SVNFNh0O5fLtFfJdHEXHPQ1s/pal6n/5OnMDdlY1Sj
         txhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599667; x=1795204467;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fkfXUbNTK8P0lsuznK78MIRh0hCShx1ut7SSZ0VqG7c=;
        b=FoSs4potpQe/zQe6UTlT7+4pyyijly0zhS5ACntDjDd9VJocsBcxwau2X14s0+zcVh
         opO6hFzwlxOSfFOfq6tSUqiQGj5uwdaECjt8kQRgfKXSTBURfJn2mZPWbP9SZcrb++7c
         lwuMcLtFir0klwvLXpMf8unhl6WT50Aw8hvjN2C1I0UoUtUWVeJq8MjLA1sKtTzD2JRf
         NGBFGPBiV/QZoZ/31T0u6E3HNOSFVzVKlnfAn1+zqNmLYqRFCFUlVEcCSVmr8HXnS0nT
         47EdeKBi7O6634yyta/t26JC2b9vqpTSZf5kTnJ/M82StaRKuAw6klFUk/ut4E6hTMaX
         4ZeA==
X-Forwarded-Encrypted: i=1; AL+hErE0qYUNtSf5S37/KlHGXuaUdGbyeUBohba3iqton5uC8RS18DuZ11I2+Qx1AvIAuapy8DSCl7BSHdKFfcc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Da/b/gtTrI/hP8NJR5GphM0YdaDGaezOp1JaLjTb2mAAHbMGv
	7woY/gwwklBzDFjSxYIBswjL4Xb2WBx1UCwPrDnnY/ocXUKqcGscyu9ATOT7qlN82uUeocbJl7P
	56PSrujO5jw==
X-Received: from dycnr21-n1.prod.google.com ([2002:a05:7300:e9d5:10b0:369:f67f:7a43])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:4614:b0:36a:12bb:7f8e
 with SMTP id 5a478bee46e88-379655d45c1mr2693477eec.13.1794599666478; Fri, 13
 Nov 2026 11:54:26 -0800 (PST)
Date: Fri, 13 Nov 2026 11:53:23 -0800
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
Message-ID: <20261113195335.2865725-19-irogers@google.com>
Subject: [PATCH v2 18/30] perf metricgroup: Pass struct perf_pmus to metricgroup__for_each_metric()
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

metricgroup__sys_event_iter() matched system metrics against uncore
PMUs using the live host's PMUs, so when processing a perf.data file
from another machine system metrics were matched against the wrong PMU
topology. Add a struct perf_pmus * argument to
metricgroup__for_each_metric() and use it to match the metric's compat
identifier. Callers pass the PMUs of the environment they are working
on.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-script.c    |  4 +++-
 tools/perf/util/metricgroup.c  | 12 +++++++-----
 tools/perf/util/metricgroup.h  | 14 ++++++++++++--
 tools/perf/util/print-events.c |  3 ++-
 4 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/tools/perf/builtin-script.c b/tools/perf/builtin-script.c
index 97bad639753f..f854eadb46eb 100644
--- a/tools/perf/builtin-script.c
+++ b/tools/perf/builtin-script.c
@@ -2523,6 +2523,7 @@ static void perf_sample__fprint_metric(struct thread *thread,
 
 	if (!init_metrics) {
 		/* One time initialization of stat_config and metric data. */
+		struct perf_env *env = evlist__env(evsel->evlist) ?: host_env();
 		struct script_find_metrics_args args = {
 			.evlist = evsel->evlist,
 			.system_wide = perf_thread_map__pid(evsel->core.threads, /*idx=*/0) == -1,
@@ -2541,7 +2542,8 @@ static void perf_sample__fprint_metric(struct thread *thread,
 						  /*needs_sort=*/false);
 		}
 
-		metricgroup__for_each_metric(pmu_metrics_table__find(), script_find_metrics, &args);
+		metricgroup__for_each_metric(perf_env__pmus(env), pmu_metrics_table__find(),
+					     script_find_metrics, &args);
 		init_metrics = true;
 	}
 
diff --git a/tools/perf/util/metricgroup.c b/tools/perf/util/metricgroup.c
index 80c2086555a8..fba02619ffb5 100644
--- a/tools/perf/util/metricgroup.c
+++ b/tools/perf/util/metricgroup.c
@@ -406,6 +406,7 @@ static bool match_pm_metric_or_groups(struct perf_pmus *pmus, const struct pmu_m
 }
 
 struct metricgroup_iter_data {
+	struct perf_pmus *pmus;
 	pmu_metric_iter_fn fn;
 	void *data;
 };
@@ -421,14 +422,15 @@ static int metricgroup__sys_event_iter(const struct pmu_metric *pm,
 		return 0;
 
 	/* Only process with the iterator if there is a a PMU that matches the ID. */
-	pmu = perf_pmus__scan_for_uncore_id(perf_env__pmus(host_env()), pmu, pm->compat);
+	pmu = perf_pmus__scan_for_uncore_id(d->pmus, pmu, pm->compat);
 	return pmu ? d->fn(pm, table, d->data) : 0;
 }
 
-int metricgroup__for_each_metric(const struct pmu_metrics_table *table, pmu_metric_iter_fn fn,
-				 void *data)
+int metricgroup__for_each_metric(struct perf_pmus *pmus, const struct pmu_metrics_table *table,
+				 pmu_metric_iter_fn fn, void *data)
 {
 	struct metricgroup_iter_data sys_data = {
+		.pmus = pmus,
 		.fn = fn,
 		.data = data,
 	};
@@ -1118,7 +1120,7 @@ static int metricgroup__add_metric(struct perf_pmus *pmus, const char *pmu,
 	 * Iterate over all metrics seeing if metric matches either the
 	 * name or group. When it does add the metric to the list.
 	 */
-	ret = metricgroup__for_each_metric(table, metricgroup__add_metric_callback, &data);
+	ret = metricgroup__for_each_metric(pmus, table, metricgroup__add_metric_callback, &data);
 	if (!ret && !data.has_match)
 		ret = -ENOENT;
 
@@ -1656,7 +1658,7 @@ bool metricgroup__has_metric_or_groups(struct perf_pmus *pmus, const char *pmu,
 		.metric_or_groups = metric_or_groups,
 	};
 
-	return metricgroup__for_each_metric(table,
+	return metricgroup__for_each_metric(pmus, table,
 					    metricgroup__has_metric_or_groups_callback,
 					    &data)
 		? true : false;
diff --git a/tools/perf/util/metricgroup.h b/tools/perf/util/metricgroup.h
index bc5d3d21f405..2cc28b3eb983 100644
--- a/tools/perf/util/metricgroup.h
+++ b/tools/perf/util/metricgroup.h
@@ -85,8 +85,18 @@ int metricgroup__parse_groups_test(struct evlist *evlist,
 				   const char *str,
 				   bool cputype_filter);
 
-int metricgroup__for_each_metric(const struct pmu_metrics_table *table, pmu_metric_iter_fn fn,
-				 void *data);
+/**
+ * metricgroup__for_each_metric() - Iterate over metrics in @table and system
+ *                                  metrics matching @pmus.
+ * @pmus: The PMUs used to match system metric compat identifiers.
+ * @table: Optional CPU metrics table to iterate over.
+ * @fn: Callback invoked for each metric.
+ * @data: User data passed to @fn.
+ *
+ * Return: 0 on success or the non-zero return value from @fn.
+ */
+int metricgroup__for_each_metric(struct perf_pmus *pmus, const struct pmu_metrics_table *table,
+				 pmu_metric_iter_fn fn, void *data);
 bool metricgroup__has_metric_or_groups(struct perf_pmus *pmus, const char *pmu,
 				       const char *metric_or_groups);
 unsigned int metricgroups__topdown_max_level(void);
diff --git a/tools/perf/util/print-events.c b/tools/perf/util/print-events.c
index fe48efe9aefb..6145367d2184 100644
--- a/tools/perf/util/print-events.c
+++ b/tools/perf/util/print-events.c
@@ -297,7 +297,8 @@ void metricgroup__print(const struct print_callbacks *print_cb, void *print_stat
 	groups.node_cmp = mep_cmp;
 	groups.node_delete = mep_delete;
 
-	metricgroup__for_each_metric(table, metricgroup__add_to_mep_groups_callback, &groups);
+	metricgroup__for_each_metric(perf_env__pmus(host_env()), table,
+				     metricgroup__add_to_mep_groups_callback, &groups);
 
 	for (node = rb_first_cached(&groups.entries); node; node = next) {
 		struct mep *me = container_of(node, struct mep, nd);
-- 
2.56.1.703.gf848ed807c-goog

