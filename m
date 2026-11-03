Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749549;
	b=1MdMQd1QBj17AJJnBQNz0hOiyTIxT5vm5pFOLguwsFJMfEjFMBsxaQqnyYsxu2CU4Kzy
	 OGep7R70vE9S49wrYXAiwGxk/XZMxatyRuCc/cRn8fdFuVLXG5a0XB/aqjamJ4oxwN5HI
	 QolgnjiixWAF3RQB0bGFhMque4aObVgzVk8omOdZmF2lR0eNHz23EoU6VebCM04HaRc7G
	 kCF1CR0upL6hYXHvgjWjsOXDPpvUeNXUPwYH/LgWZPQn5W9bt+Mew9yu915lqwDf5zL4h
	 Md0+xPyetRMXNYZza9aVfnrypaP/XiKVImh9E5HsoNT/ROEkMLThs9CePkv/7qoK6Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=/c9dAAdPppqLCH60TYdEbM0bjim2NQq3FwqogCqlwxw=;
	b=f3nr4PB4zSfW7MCp0eTcmnj3CUmQvrfsMams4WzqBcAWAJ/+Uuy0mASvhrR9kY+Fn29E
	 DUuE2IAHS0Dw5yl1Awo7HMojJM1xuyjqGgzzB2wyTV0t5rGbij5zWRXom7WEviQCvw0R7
	 K0iZO8yCO+O8jgi7EH3z1Sr1R+6/sq5AV5ZvXhMjIk98F1B5YvBRPLf1w5T+oaehIViwQ
	 cL2c89ZF+STlMqL+TwillWTM9ORQU9jYn2ugR53o2hhrvwn1FCiDXynCvsIMBjtTxJVQA
	 w8sXYyXX7pd357Kk7XvkuheVOXZmMWhuirFzzAAnJsyrnlMX40vKr/fm9G2OZaydlYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AdA1S5I+;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC80606A335
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CC80606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AdA1S5I+
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so643626c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793749548; x=1794354348; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/c9dAAdPppqLCH60TYdEbM0bjim2NQq3FwqogCqlwxw=;
        b=AdA1S5I+agN485n4wGTdxTRZtrKj/kQn2kThMHJGdE3SKhE7RQwKXgc/wimcM9TC3s
         xt8Ib2C9cGMe5Bgm0vFCQyJiisanLNCronXTFt4sBo/CObDAmdW2PiGd1792byfhSP7/
         xjptxcs7hwS7RulMcssaG6rVUtt6ryzXIe8ZGYy9GtLzeXI/FTuLGQQUuVv8vl7ox33f
         iyaNV0MBHtg7QvcYLBvmSQBKPZPcv55Rvc6IrhSKoVloTZi413Eh0w12r0+B9f7wnIsM
         O6zMJWrSKTWUyintHvJgoZPTH5tdCrEG1O/KD+F/+Ax4aVmH596TRPzYD4O4dgRPC1yu
         Syuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749548; x=1794354348;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/c9dAAdPppqLCH60TYdEbM0bjim2NQq3FwqogCqlwxw=;
        b=al7phJt6E3osYFLzCnlT6iyYSpCSUlgBC0ASbKV/158eii+rlGrkoOmJchsxInJ7KK
         5a8LvZ1OtpXacBuktJJ1EqK3KEPiz0Hp0Nu6iwDXOdt6VKy7da+5HxuSK0wXWkhJdIv9
         o1Ww6gjyKpwcjx6VXQ8quAFzFe1WCw+XwZFZnKOx/QzjWqIwckG/wBV7bw/CXzp5CYbv
         Yemv/tLtUFunnspx3GtFxLz7aG6w+j2oA2Q+O9MgeLuYysGPeP/7djcYelxpGHnOSeIv
         JUAt4aYMNVxRnp7rXiOWYmvHDTdt841TwlzM0P4jrLk//rjY0u0lZXe5/O0RUldHYnBO
         peKQ==
X-Gm-Message-State: APuU4Z9wtTwVKeU6sdQZcsVWbuxqubzK5W+Zq7gDBzKI4PctjhTjA/NP
	i4T68TfgO6UWxQ5zvxzt3BjVnp/hC76DebydC0QiyrIzvecZS7L8bxvzaakNDbn5bM1b62MNrfK
	P0+0ksIorGA==
X-Received: from dlbvg13.prod.google.com ([2002:a05:7022:7f0d:b0:150:117b:cbf8])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:b047:20b0:1a3:bfb6:44ad
 with SMTP id a92af1059eb24-1ac5da797d4mr23809134c88.32.1793749547250; Tue, 03
 Nov 2026 15:45:47 -0800 (PST)
Date: Tue,  3 Nov 2026 15:44:31 -0800
In-Reply-To: <20261103234502.1008382-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103234502.1008382-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103234502.1008382-16-irogers@google.com>
Subject: [PATCH v1 15/41] perf metricgroup: Move matching of metrics to
 recorded events from perf script
From: Ian Rogers <irogers@google.com>
To: linux-perf-users@vger.kernel.org, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Kan Liang <kan.liang@linux.intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, John Garry <john.garry@linux.dev>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@arm.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Thomas Richter <tmricht@linux.ibm.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Sandipan Das <sandipan.das@amd.com>, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

perf script finds metrics whose events are all present in the
perf.data file's evlist so that they can be displayed alongside
samples. Move this code into metricgroup.c as
metricgroup__add_matching_metrics() so that it can be shared with
other commands, such as perf stat report. No functional change.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-script.c   | 156 +--------------------------------
 tools/perf/util/metricgroup.c | 157 ++++++++++++++++++++++++++++++++++
 tools/perf/util/metricgroup.h |  12 +++
 3 files changed, 172 insertions(+), 153 deletions(-)

diff --git a/tools/perf/builtin-script.c b/tools/perf/builtin-script.c
index 8bef76eaf67d..da3f1793774e 100644
--- a/tools/perf/builtin-script.c
+++ b/tools/perf/builtin-script.c
@@ -2354,151 +2354,6 @@ static void script_new_line(struct perf_stat_config *config __maybe_unused,
 	fputs("\tmetric: ", mctx->fp);
 }
 
-struct script_find_metrics_args {
-	struct evlist *evlist;
-	bool system_wide;
-};
-
-static struct evsel *map_metric_evsel_to_script_evsel(struct evlist *script_evlist,
-						      struct evsel *metric_evsel)
-{
-	struct evsel *script_evsel;
-
-	evlist__for_each_entry(script_evlist, script_evsel) {
-		/* Skip if perf_event_attr differ. */
-		if (metric_evsel->core.attr.type != script_evsel->core.attr.type)
-			continue;
-		if (metric_evsel->core.attr.config != script_evsel->core.attr.config)
-			continue;
-		/* Skip if the script event has a metric_id that doesn't match. */
-		if (script_evsel->metric_id &&
-		    strcmp(evsel__metric_id(metric_evsel), evsel__metric_id(script_evsel))) {
-			pr_debug("Skipping matching evsel due to differing metric ids '%s' vs '%s'\n",
-				 evsel__metric_id(metric_evsel), evsel__metric_id(script_evsel));
-			continue;
-		}
-		return script_evsel;
-	}
-	return NULL;
-}
-
-static int script_find_metrics(const struct pmu_metric *pm,
-			       const struct pmu_metrics_table *table __maybe_unused,
-			       void *data)
-{
-	struct script_find_metrics_args *args = data;
-	struct evlist *script_evlist = args->evlist;
-	struct evlist *metric_evlist = evlist__new();
-	struct evsel *metric_evsel;
-	int ret = metricgroup__parse_groups(metric_evlist,
-					/*pmu=*/"all",
-					/*cputype_filter=*/false,
-					pm->metric_name,
-					/*metric_no_group=*/false,
-					/*metric_no_merge=*/false,
-					/*metric_no_threshold=*/true,
-					/*user_requested_cpu_list=*/NULL,
-					args->system_wide,
-					/*hardware_aware_grouping=*/false);
-
-	if (ret) {
-		/* Metric parsing failed but continue the search. */
-		goto out;
-	}
-
-	/*
-	 * Check the script_evlist has an entry for each metric_evlist entry. If
-	 * the script evsel was already set up avoid changing data that may
-	 * break it.
-	 */
-	evlist__for_each_entry(metric_evlist, metric_evsel) {
-		struct evsel *script_evsel =
-			map_metric_evsel_to_script_evsel(script_evlist, metric_evsel);
-		struct evsel *new_metric_leader;
-
-		if (!script_evsel) {
-			pr_debug("Skipping metric '%s' as evsel '%s' / '%s' is missing\n",
-				pm->metric_name, evsel__name(metric_evsel),
-				evsel__metric_id(metric_evsel));
-			goto out;
-		}
-
-		if (script_evsel->metric_leader == NULL)
-			continue;
-
-		if (metric_evsel->metric_leader == metric_evsel) {
-			new_metric_leader = script_evsel;
-		} else {
-			new_metric_leader =
-				map_metric_evsel_to_script_evsel(script_evlist,
-								 metric_evsel->metric_leader);
-		}
-		/* Mismatching evsel leaders. */
-		if (script_evsel->metric_leader != new_metric_leader) {
-			pr_debug("Skipping metric '%s' due to mismatching evsel metric leaders '%s' vs '%s'\n",
-				pm->metric_name, evsel__metric_id(metric_evsel),
-				evsel__metric_id(script_evsel));
-			goto out;
-		}
-	}
-	/*
-	 * Metric events match those in the script evlist, copy metric evsel
-	 * data into the script evlist.
-	 */
-	evlist__for_each_entry(metric_evlist, metric_evsel) {
-		struct evsel *script_evsel =
-			map_metric_evsel_to_script_evsel(script_evlist, metric_evsel);
-		struct metric_event *metric_me =
-			metricgroup__lookup(evlist__metric_events(metric_evlist),
-					    metric_evsel,
-					    /*create=*/false);
-
-		if (script_evsel->metric_id == NULL) {
-			script_evsel->metric_id = metric_evsel->metric_id;
-			metric_evsel->metric_id = NULL;
-		}
-
-		if (script_evsel->metric_leader == NULL) {
-			if (metric_evsel->metric_leader == metric_evsel) {
-				script_evsel->metric_leader = script_evsel;
-			} else {
-				script_evsel->metric_leader =
-					map_metric_evsel_to_script_evsel(script_evlist,
-								       metric_evsel->metric_leader);
-			}
-		}
-
-		if (metric_me) {
-			struct metric_expr *expr;
-			struct metric_event *script_me =
-				metricgroup__lookup(evlist__metric_events(script_evlist),
-						    script_evsel,
-						    /*create=*/true);
-
-			if (!script_me) {
-				/*
-				 * As the metric_expr is created, the only
-				 * failure is a lack of memory.
-				 */
-				goto out;
-			}
-			list_splice_init(&metric_me->head, &script_me->head);
-			list_for_each_entry(expr, &script_me->head, nd) {
-				for (int i = 0; expr->metric_events[i]; i++) {
-					expr->metric_events[i] =
-						map_metric_evsel_to_script_evsel(script_evlist,
-									expr->metric_events[i]);
-				}
-			}
-		}
-	}
-	pr_debug("Found metric '%s' whose evsels match those of in the perf data\n",
-		 pm->metric_name);
-out:
-	evlist__put(metric_evlist);
-	return 0;
-}
-
 static struct aggr_cpu_id script_aggr_cpu_id_get(struct perf_stat_config *config __maybe_unused,
 						    struct perf_cpu cpu)
 {
@@ -2528,12 +2383,6 @@ static void perf_sample__fprint_metric(struct thread *thread,
 
 	if (!init_metrics) {
 		/* One time initialization of stat_config and metric data. */
-		struct perf_env *env = evlist__env(evsel->evlist) ?: host_env();
-		struct script_find_metrics_args args = {
-			.evlist = evsel->evlist,
-			.system_wide = perf_thread_map__pid(evsel->core.threads, /*idx=*/0) == -1,
-
-		};
 		if (!stat_config.output)
 			stat_config.output = stdout;
 
@@ -2547,8 +2396,9 @@ static void perf_sample__fprint_metric(struct thread *thread,
 						  /*needs_sort=*/false);
 		}
 
-		metricgroup__for_each_metric(perf_env__pmus(env), pmu_metrics_table__find(),
-					     script_find_metrics, &args);
+		metricgroup__add_matching_metrics(evsel->evlist,
+						  perf_thread_map__pid(evsel->core.threads,
+								       /*idx=*/0) == -1);
 		init_metrics = true;
 	}
 
diff --git a/tools/perf/util/metricgroup.c b/tools/perf/util/metricgroup.c
index 876c549069e5..51dbdeac5e60 100644
--- a/tools/perf/util/metricgroup.c
+++ b/tools/perf/util/metricgroup.c
@@ -453,6 +453,163 @@ int metricgroup__for_each_metric(struct perf_pmus *pmus, const struct pmu_metric
 	return pmu_for_each_sys_metric(metricgroup__sys_event_iter, &sys_data);
 }
 
+struct find_matching_metrics_args {
+	struct evlist *evlist;
+	bool system_wide;
+};
+
+static struct evsel *map_metric_evsel_to_evlist(struct evlist *data_evlist,
+						struct evsel *metric_evsel)
+{
+	struct evsel *data_evsel;
+
+	evlist__for_each_entry(data_evlist, data_evsel) {
+		/* Skip if perf_event_attr differ. */
+		if (metric_evsel->core.attr.type != data_evsel->core.attr.type)
+			continue;
+		if (metric_evsel->core.attr.config != data_evsel->core.attr.config)
+			continue;
+		/* Skip if the data event has a metric_id that doesn't match. */
+		if (data_evsel->metric_id &&
+		    strcmp(evsel__metric_id(metric_evsel), evsel__metric_id(data_evsel))) {
+			pr_debug("Skipping matching evsel due to differing metric ids '%s' vs '%s'\n",
+				 evsel__metric_id(metric_evsel), evsel__metric_id(data_evsel));
+			continue;
+		}
+		return data_evsel;
+	}
+	return NULL;
+}
+
+static int find_matching_metrics_cb(const struct pmu_metric *pm,
+				    const struct pmu_metrics_table *table __maybe_unused,
+				    void *data)
+{
+	struct find_matching_metrics_args *args = data;
+	struct evlist *data_evlist = args->evlist;
+	struct evlist *metric_evlist = evlist__new();
+	struct evsel *metric_evsel;
+	int ret = metricgroup__parse_groups(metric_evlist,
+					/*pmu=*/"all",
+					/*cputype_filter=*/false,
+					pm->metric_name,
+					/*metric_no_group=*/false,
+					/*metric_no_merge=*/false,
+					/*metric_no_threshold=*/true,
+					/*user_requested_cpu_list=*/NULL,
+					args->system_wide,
+					/*hardware_aware_grouping=*/false);
+
+	if (ret) {
+		/* Metric parsing failed but continue the search. */
+		goto out;
+	}
+
+	/*
+	 * Check the data_evlist has an entry for each metric_evlist entry. If
+	 * the data evsel was already set up avoid changing data that may
+	 * break it.
+	 */
+	evlist__for_each_entry(metric_evlist, metric_evsel) {
+		struct evsel *data_evsel =
+			map_metric_evsel_to_evlist(data_evlist, metric_evsel);
+		struct evsel *new_metric_leader;
+
+		if (!data_evsel) {
+			pr_debug("Skipping metric '%s' as evsel '%s' / '%s' is missing\n",
+				pm->metric_name, evsel__name(metric_evsel),
+				evsel__metric_id(metric_evsel));
+			goto out;
+		}
+
+		if (data_evsel->metric_leader == NULL)
+			continue;
+
+		if (metric_evsel->metric_leader == metric_evsel) {
+			new_metric_leader = data_evsel;
+		} else {
+			new_metric_leader =
+				map_metric_evsel_to_evlist(data_evlist,
+								 metric_evsel->metric_leader);
+		}
+		/* Mismatching evsel leaders. */
+		if (data_evsel->metric_leader != new_metric_leader) {
+			pr_debug("Skipping metric '%s' due to mismatching evsel metric leaders '%s' vs '%s'\n",
+				pm->metric_name, evsel__metric_id(metric_evsel),
+				evsel__metric_id(data_evsel));
+			goto out;
+		}
+	}
+	/*
+	 * Metric events match those in the data evlist, copy metric evsel
+	 * data into the data evlist.
+	 */
+	evlist__for_each_entry(metric_evlist, metric_evsel) {
+		struct evsel *data_evsel =
+			map_metric_evsel_to_evlist(data_evlist, metric_evsel);
+		struct metric_event *metric_me =
+			metricgroup__lookup(evlist__metric_events(metric_evlist),
+					    metric_evsel,
+					    /*create=*/false);
+
+		if (data_evsel->metric_id == NULL) {
+			data_evsel->metric_id = metric_evsel->metric_id;
+			metric_evsel->metric_id = NULL;
+		}
+
+		if (data_evsel->metric_leader == NULL) {
+			if (metric_evsel->metric_leader == metric_evsel) {
+				data_evsel->metric_leader = data_evsel;
+			} else {
+				data_evsel->metric_leader =
+					map_metric_evsel_to_evlist(data_evlist,
+								       metric_evsel->metric_leader);
+			}
+		}
+
+		if (metric_me) {
+			struct metric_expr *expr;
+			struct metric_event *data_me =
+				metricgroup__lookup(evlist__metric_events(data_evlist),
+						    data_evsel,
+						    /*create=*/true);
+
+			if (!data_me) {
+				/*
+				 * As the metric_expr is created, the only
+				 * failure is a lack of memory.
+				 */
+				goto out;
+			}
+			list_splice_init(&metric_me->head, &data_me->head);
+			list_for_each_entry(expr, &data_me->head, nd) {
+				for (int i = 0; expr->metric_events[i]; i++) {
+					expr->metric_events[i] =
+						map_metric_evsel_to_evlist(data_evlist,
+									expr->metric_events[i]);
+				}
+			}
+		}
+	}
+	pr_debug("Found metric '%s' whose evsels match those of in the perf data\n",
+		 pm->metric_name);
+out:
+	evlist__put(metric_evlist);
+	return 0;
+}
+
+int metricgroup__add_matching_metrics(struct evlist *evlist, bool system_wide)
+{
+	struct perf_env *env = evlist__env(evlist) ?: host_env();
+	struct find_matching_metrics_args args = {
+		.evlist = evlist,
+		.system_wide = system_wide,
+	};
+
+	return metricgroup__for_each_metric(perf_env__pmus(env), pmu_metrics_table__find(),
+					    find_matching_metrics_cb, &args);
+}
+
 static const char *code_characters = ",-=@";
 
 static int encode_metric_id(struct strbuf *sb, const char *x)
diff --git a/tools/perf/util/metricgroup.h b/tools/perf/util/metricgroup.h
index 2cc28b3eb983..2069211913dc 100644
--- a/tools/perf/util/metricgroup.h
+++ b/tools/perf/util/metricgroup.h
@@ -97,6 +97,18 @@ int metricgroup__parse_groups_test(struct evlist *evlist,
  */
 int metricgroup__for_each_metric(struct perf_pmus *pmus, const struct pmu_metrics_table *table,
 				 pmu_metric_iter_fn fn, void *data);
+/**
+ * metricgroup__add_matching_metrics() - Add metrics whose events are in @evlist.
+ * @evlist: The evlist, typically read from a perf.data file, to add metrics to.
+ * @system_wide: Are the events in @evlist system wide?
+ *
+ * For every metric whose events all have a corresponding evsel in @evlist,
+ * add the metric to the metric events of @evlist so that it is computed and
+ * displayed along with the counts of the evsels.
+ *
+ * Return: 0 on success or a negative error code.
+ */
+int metricgroup__add_matching_metrics(struct evlist *evlist, bool system_wide);
 bool metricgroup__has_metric_or_groups(struct perf_pmus *pmus, const char *pmu,
 				       const char *metric_or_groups);
 unsigned int metricgroups__topdown_max_level(void);
-- 
2.56.0.385.gac671c819a-goog

