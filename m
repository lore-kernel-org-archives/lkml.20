Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599696;
	b=GXWEFwThGEAvDflmJ4dh+gVaIOI9MlOBNZiG9ChOEp0RZ/EfOU7C1XyZ6ppXBZzTQIHQ
	 ZLtS+jI77Gbxdmj/vlyoZB6OFDeY/gAbc31pkNsmL01xdLvKTDpZz9L7GqnyFCkrKAYwY
	 345q5Hr0VOEzAAR7KtcgSgPMibteHhI33V1SxgHafGK9yyTWqNzcMmmCfR5wHjiExIzQw
	 3/xJCwoeREq0GVIUiCd0m4tt3mpj5dgG+etIzIA1N0whhLov97Zsu9nYrE+AzIhHoElkl
	 DcJ7Fr+WmsWFhXdJmhiVyp7OoUt5lV1DFz/PHnSLo0lSJwjzVg+8rpnRF5mWpX0EfBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=EnZswsgeL5+VxtoMKa6b/nK8MhlNHYpkK0/dCcs4MQo=;
	b=z27Jwslqzj1WcErYFwLCckEBtfL0XNqdYDtF9tZ5LCOX/FHxYmZE4YqODxhRHWa7EP0x
	 LfVfbWLM+NXe3HZo2Y7Kl7uwFXQDJi1xOJm50G6/vcyRMbPbS+8x9mcYAqs/oTfvqajcL
	 MXpHCaYjZBYW72N9EsgoGYEqEpXQ5yCmET4Ih4dOPxaJVJ/0Ckbe3fhqtIHfOnFRvSMxP
	 8FyPSAiStaTllnJiIa2QObvrmRV4qCsbqXvoywLZy9jHA4p4AoMNvcJu9l0abTCFxwPUj
	 MXAvdIbbQWQ8FYmYU1EJHclk8upw3PaWHVL46pfpdUqDOs27xcllKoTGy+oCb7b2OSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=omf1EhfN;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02C1606D0F9
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:54:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E02C1606D0F9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=omf1EhfN
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-154e9d2d94fso3847184c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794599695; x=1795204495; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EnZswsgeL5+VxtoMKa6b/nK8MhlNHYpkK0/dCcs4MQo=;
        b=omf1EhfNBZuxcc4iWLLl/TFxF4rdekVvfCux1btqugnP+cUT/5bh2fo04gnsjT6gCT
         K6Wrxqz73mYvQwJrrJhP6fflBKjseQYDM1gXBg1yovEDnLdj6WmWokk9Bo/en2B7Kldv
         SwcQm0HsVYFyYczxGYzmsO81YvtV4sbxtvU27SzHFO2Dtwtu9TwVNDWdCA/L3PCK3dmm
         yaQVVI1zoFiEm4a13jPvFPtfXHwhGmiSdWt0BQkmOqHdLmgsUjvHVbPjUGmj/XMS1aPw
         Jsli+8mamY4zffTj0h8LAI+0jWtxLLjdHoc3Kz0aqzN6YrMLTtx/jXbC87lPJx8rxSHk
         Z6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599695; x=1795204495;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EnZswsgeL5+VxtoMKa6b/nK8MhlNHYpkK0/dCcs4MQo=;
        b=tnLK3XB23ZUm3yS8SOD0x6Yi1LcRDhedCoWieHFv1xwei8Pm1vJq0Ys1TU3j6VnudE
         9bDo3Bnj15rvkeTt7o/mwkjzi+/XcKjIzNRSJKE3XihGrhqmh0eF3Im7Xlx00LHUBX8r
         ICMG9kK2NFRJOkmHISPrdRW5ryIHcLHtzL/KqzVN5eBM/4qLdYZeQ7ql1tSjz8Mzml+r
         6OmDfhEb7KTIeY+CRxREjyKZaYnYoy0AYksMcymhRf2qAkb0QqJpxwNOEoCj+B8bLBgD
         kDdQEmRlJjC2E5uWBNQ+27rt52FFj4B74Kg4H1B9jnNHE5jn76DijJnaV9OBoFEOf8hJ
         JuHQ==
X-Forwarded-Encrypted: i=1; AL+hErGCFh+1PCb7WCD3nbroZ/1t7ugSW4hFdzumDGNpW5eouNNOMHEdh342sceS44nxCZ155IFo3osAcu2vM/U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IjXPgnPreLn2Na5bNlY0/eNBe7qL1gsm7K8P8O69mgqKFee8O
	vVogD1SMAzh222ZSrAlnsi6s4acR1Jt+NjyU0w7Krb74E0ZiM9FrjbYDgKjyw9qKu3gXThLvJ67
	mHthQCTpX8Q==
X-Received: from dldz2-n2.prod.google.com ([2002:a05:701b:4182:20b0:1b2:5271:f03b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:170f:b0:190:8f72:445e
 with SMTP id a92af1059eb24-1b5030e2d75mr3388424c88.11.1794599694794; Fri, 13
 Nov 2026 11:54:54 -0800 (PST)
Date: Fri, 13 Nov 2026 11:53:34 -0800
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
Message-ID: <20261113195335.2865725-30-irogers@google.com>
Subject: [PATCH v2 29/30] perf script: Display metrics for perf stat record data
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
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
 tools/perf/builtin-script.c              | 107 ++++++++++++++++++++++-
 2 files changed, 110 insertions(+), 3 deletions(-)

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
index afed2353ef80..135ec34494bd 100644
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
@@ -3795,26 +3800,112 @@ static void script__setup_sample_type(struct perf_script *script)
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
+	stat_config.system_wide = !threads || perf_thread_map__nr(threads) < 1 ||
+				  perf_thread_map__pid(threads, /*idx=*/0) == -1;
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
@@ -3823,6 +3914,13 @@ static int process_stat_config_event(const struct perf_tool *tool __maybe_unused
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
 
@@ -4206,6 +4304,8 @@ int cmd_script(int argc, const char **argv)
 		    "Enable LBR callgraph stitching approach"),
 	OPT_BOOLEAN('\0', "merge-callchains", &merge_deferred_callchains,
 		    "Enable merge deferred user callchains"),
+	OPT_BOOLEAN(0, "all-metrics", &stat_config.all_metrics,
+		    "Display all metrics matching recorded stat events"),
 	OPTS_EVSWITCH(&script.evswitch),
 	OPT_END()
 	};
@@ -4577,6 +4677,7 @@ int cmd_script(int argc, const char **argv)
 
 	zstd_fini(&(session->zstd_data));
 	evlist__free_stats(session->evlist);
+	zfree(&stat_config.aggr_map);
 	perf_session__delete(session);
 	perf_script__exit(&script);
 
-- 
2.56.1.703.gf848ed807c-goog

