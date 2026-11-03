Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749573;
	b=YntvyC9pCR5ikIIyjhcrbA1qJLt4Fm7Z982ppf47wIw5ckQM1Bco5ZTqwlM6RKqRpOrT
	 U63gNuFBMnchZKtKTprc6NPWQHcLmJEGBUf5WGjZu57/+bzV+jZksZTg6UxI8OQCXePks
	 5H/UZuHOoavYir3yCQ9VP8KbRQvKIEHDkz5FJ7/l0hscssTbiYt8fwAfaIk9TOd1Fn6EN
	 pgcvUmq2dqqp7+9qTVfQYBB9eUvHQ9YjD8ZLINX6iwa3kUkqvpOZ8KKDeBkOvOdKPWP5c
	 rZG2nzTjGxaACw2dS+0MWQkEaJXD0ixceJG9wasnoiAaDNaCPAtS+KXKqdx+5PfjPcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=3cMyKgFpOd9briDO/35E6bCblzXuNFjOZglDAUDDQsI=;
	b=LR6ZwM+tZhE8nePgbkS/o1WEYMrL67LGCfzaTeVU5hxcW2gQjXnBHOf2zTNUX84UG5+1
	 p+WNtLdLCxouLk6aoo1gaicfEQGqj4w2Uq9MVzGpkEkPSlgayt5iCbLOJJFfVpGk/njHd
	 eZ4B2bR6eRyydS+zI4djvjMEwwAGiyo4fko3+I1jYMhz0MnwXKUOvdrgWXSpblnh+c+3v
	 QBRkceS2RcIME/SVflGwck4/Hpgwg/vcHUeksYZO/ZMZMppNwM0WXeloK5Ty7KdKofUHL
	 Aerki08vEdCPmlixh8LjOedFulnzvtwhRyvnDeLvNJoAgJ5lOQlBUTlAT6S3XZSa0MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="d/BtXI4S";
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BB8606EEB0
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:46:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49BB8606EEB0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d/BtXI4S
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3662e7a9299so300842eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793749572; x=1794354372; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3cMyKgFpOd9briDO/35E6bCblzXuNFjOZglDAUDDQsI=;
        b=d/BtXI4SaiYiWz1gD+X1K//iFNIHfs13hgwJjoHnfSPHBOnJJ0n56ccw3RPeuYMO8F
         GIA2HAG1GlRLGPEQNIh/5BCYhXhpwbA4WcvVHVMytIrx7fAmx8LLYvsOZzYs69KAJliJ
         Qpfsl6u6sOb3euDhunKPNNsoucwb4k661jblfbpuJ+1k5eKJqr4xTwfQS2VhE00Gve7/
         5BBvTgFYNhq4j9+bAZwtFPWdhBp447I6ON4KiK+somW52rOUreOdyJGlYNX4dJBYDXOC
         KFjpP48R89N7h3b6PXZ94rI+oDHqPhHgLolkbbf7yZBAArW9+IyO0/NOI8H8nFL10tiU
         D6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749572; x=1794354372;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3cMyKgFpOd9briDO/35E6bCblzXuNFjOZglDAUDDQsI=;
        b=R4WSXHI6OxQBzFlFjIaXSLvfKUSfnrKiqHEoRL9RlVR/Nst8vu7Tu+173+8wpfV1DL
         pzwNGDNkN2ACace2oKO3C6/gDL75gyfJslsA/X6N6fNIbENB8g1/+RgV6LjlBaSTm8d3
         V/+dhI/cvBvnSU8HHDmZJsdaMwoosLikKxj9FFjZ2UGveD4RBoCdltu3/CX7iNNa4oyv
         KnvV/BjEMm51GoLEleFzpnokusXA/FW04iDW1o/IXFmIe857MozgtC6L12bwPSMX1Tpk
         HaUN6FWWCDyoCVOd+b8B9Uu/QnIrxQeLEFHuhAcaUDmAh+/F66pbgOvX8LZg9PG7HArF
         +FiQ==
X-Gm-Message-State: APuU4Z+YroMK6eV2A556/7ZsdXPbcBV0bqxWhx1Kk5eFl507E7XCsn4p
	PiNbGQR38WnvBX4WCw2o3oTfe+662opjPjsUMU3VDHewmFr1Ewxz/66CD+3H2t1qXhvWj0oKvKq
	zcZiqXQqrUg==
X-Received: from dyctw17.prod.google.com ([2002:a05:7301:5f11:b0:36c:9a3e:ea3c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:20c8:20b0:36c:99c1:ab7d
 with SMTP id 5a478bee46e88-36c99c1b30bmr3665485eec.5.1793749572214; Tue, 03
 Nov 2026 15:46:12 -0800 (PST)
Date: Tue,  3 Nov 2026 15:44:40 -0800
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
Message-ID: <20261103234502.1008382-25-irogers@google.com>
Subject: [PATCH v1 24/41] perf script: Display metrics for perf stat record data
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

perf script displays the counts of each stat round read from a perf stat
record perf.data file. Also display, after each round, the metrics
requested on the perf stat record command line (or all matching metrics
when --all-metrics or stat.all-metrics=true is used), computed from the
counts aggregated across CPUs and threads, for example:

  $ perf stat record -M insn_per_cycle -a sleep 1
  $ perf script
  CPU THREAD         VAL         ENA         RUN        TIME EVENT
  ...
  cpu_atom/cpu-cycles/  metric:      0.7 instructions  insn_per_cycle
  cpu_core/cpu-cycles/  metric:      1.3 instructions  insn_per_cycle

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Documentation/perf-script.txt |   6 ++
 tools/perf/builtin-script.c              | 106 ++++++++++++++++++++++-
 2 files changed, 109 insertions(+), 3 deletions(-)

diff --git a/tools/perf/Documentation/perf-script.txt b/tools/perf/Documentation/perf-script.txt
index f0228e784ced..bfd69d411996 100644
--- a/tools/perf/Documentation/perf-script.txt
+++ b/tools/perf/Documentation/perf-script.txt
@@ -468,6 +468,12 @@ include::itrace.txt[]
 	default behavior.  If you want to see separate CALLCHAIN_DEFERRED
 	records for some reason, use --no-merge-callchains explicitly.
 
+--all-metrics::
+	Display all metrics that match the recorded stat events in the perf data
+	file, rather than only the metrics requested on the 'perf stat record'
+	command line. Default setting can be changed with
+	"perf config stat.all-metrics=true".
+
 :GMEXAMPLECMD: script
 :GMEXAMPLESUBCMD:
 include::guest-files.txt[]
diff --git a/tools/perf/builtin-script.c b/tools/perf/builtin-script.c
index afed2353ef80..81e2def8420f 100644
--- a/tools/perf/builtin-script.c
+++ b/tools/perf/builtin-script.c
@@ -2334,8 +2334,13 @@ static void script_print_metric(struct perf_stat_config *config __maybe_unused,
 
 	if (!fmt)
 		return;
-	perf_sample__fprintf_start(NULL, mctx->sample, mctx->thread, mctx->evsel,
-				   PERF_RECORD_SAMPLE, mctx->fp);
+	if (mctx->sample) {
+		perf_sample__fprintf_start(NULL, mctx->sample, mctx->thread, mctx->evsel,
+					   PERF_RECORD_SAMPLE, mctx->fp);
+	} else {
+		/* Metric computed from the counts of a perf stat record round. */
+		fputs(evsel__name(mctx->evsel), mctx->fp);
+	}
 	fputs("\tmetric: ", mctx->fp);
 	if (color)
 		color_fprintf(mctx->fp, color, fmt, val);
@@ -3795,26 +3800,111 @@ static void script__setup_sample_type(struct perf_script *script)
 	}
 }
 
+/*
+ * Set up the computation of metrics whose events were all recorded by perf stat
+ * record. Counts are aggregated globally for the metrics.
+ */
+static bool script_stat_metrics_init(struct evlist *evlist)
+{
+	struct perf_thread_map *threads = evlist__core(evlist)->threads;
+	struct evsel *counter;
+
+	evlist__for_each_entry(evlist, counter) {
+		if (!counter->stats)
+			return false;
+	}
+	/* Metrics may use system_wide, such as for #target_cpu. */
+	stat_config.system_wide = !threads || perf_thread_map__pid(threads, /*idx=*/0) == -1;
+	metricgroup__add_recorded_metrics(evlist, /*metrics=*/NULL,
+					  /*pmu_filter=*/NULL,
+					  /*cputype_filter=*/false,
+					  stat_config.metric_no_group,
+					  stat_config.metric_no_merge,
+					  stat_config.metric_no_threshold,
+					  stat_config.all_metrics,
+					  stat_config.system_wide,
+					  /*default_metricgroup=*/false,
+					  /*metric_only=*/NULL);
+
+	if (rblist__empty(evlist__metric_events(evlist)))
+		return false;
+
+	if (!stat_config.aggr_map) {
+		stat_config.aggr_get_id = script_aggr_cpu_id_get;
+		stat_config.aggr_map =
+			cpu_aggr_map__new(evlist__core(evlist)->user_requested_cpus,
+					  aggr_cpu_id__global, /*data=*/NULL,
+					  /*needs_sort=*/false);
+		if (!stat_config.aggr_map)
+			return false;
+	}
+	/*
+	 * The aggregated stats may already have been allocated, with the
+	 * aggr_map, for metrics computed from samples.
+	 */
+	if (!evlist__first(evlist)->stats->aggr &&
+	    evlist__alloc_aggr_stats(evlist, stat_config.aggr_map->nr))
+		return false;
+
+	if (!stat_config.output)
+		stat_config.output = stdout;
+	stat_config.aggr_mode = AGGR_GLOBAL;
+	return true;
+}
+
+static void script_print_stat_metrics(struct evlist *evlist)
+{
+	struct evsel *counter;
+	int aggr_idx;
+
+	evlist__for_each_entry(evlist, counter) {
+		struct perf_stat_output_ctx ctx = {
+			.print_metric = script_print_metric,
+			.new_line = script_new_line,
+			.ctx = &(struct metric_ctx) {
+				.evsel = counter,
+				.fp = stdout,
+			},
+			.force_header = false,
+		};
+
+		cpu_aggr_map__for_each_idx(aggr_idx, stat_config.aggr_map)
+			perf_stat__print_shadow_stats(&stat_config, counter, aggr_idx, &ctx);
+	}
+}
+
 static int process_stat_round_event(const struct perf_tool *tool __maybe_unused,
 				    struct perf_session *session,
 				    union perf_event *event)
 {
 	struct perf_record_stat_round *round = &event->stat_round;
 	struct evsel *counter;
+	static int show_metrics = -1;
+
+	if (show_metrics < 0)
+		show_metrics = script_stat_metrics_init(session->evlist) ? 1 : 0;
+
+	if (show_metrics)
+		evlist__reset_aggr_stats(session->evlist);
 
 	evlist__for_each_entry(session->evlist, counter) {
 		perf_stat_process_counter(&stat_config, counter);
 		process_stat(counter, round->time);
 	}
 
+	if (show_metrics)
+		script_print_stat_metrics(session->evlist);
+
 	process_stat_interval(round->time);
 	return 0;
 }
 
 static int process_stat_config_event(const struct perf_tool *tool __maybe_unused,
-				     struct perf_session *session __maybe_unused,
+				     struct perf_session *session,
 				     union perf_event *event)
 {
+	struct evsel *counter;
+
 	perf_event__read_stat_config(&stat_config, &event->stat_config);
 
 	/*
@@ -3823,6 +3913,13 @@ static int process_stat_config_event(const struct perf_tool *tool __maybe_unused
 	 */
 	stat_config.aggr_mode = AGGR_NONE;
 
+	/*
+	 * Mark counters unsupported until a PERF_RECORD_STAT event is
+	 * processed for them by perf_event__process_stat_event().
+	 */
+	evlist__for_each_entry(session->evlist, counter)
+		counter->supported = false;
+
 	return 0;
 }
 
@@ -4206,6 +4303,8 @@ int cmd_script(int argc, const char **argv)
 		    "Enable LBR callgraph stitching approach"),
 	OPT_BOOLEAN('\0', "merge-callchains", &merge_deferred_callchains,
 		    "Enable merge deferred user callchains"),
+	OPT_BOOLEAN(0, "all-metrics", &stat_config.all_metrics,
+		    "Display all metrics matching recorded stat events"),
 	OPTS_EVSWITCH(&script.evswitch),
 	OPT_END()
 	};
@@ -4577,6 +4676,7 @@ int cmd_script(int argc, const char **argv)
 
 	zstd_fini(&(session->zstd_data));
 	evlist__free_stats(session->evlist);
+	zfree(&stat_config.aggr_map);
 	perf_session__delete(session);
 	perf_script__exit(&script);
 
-- 
2.56.0.385.gac671c819a-goog

