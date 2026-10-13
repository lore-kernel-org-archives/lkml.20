Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332EE334692
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896462; cv=none; b=IN37+kVPt+VgMaU1nZMyzqiyj8mYzZIlEHE4x+ulnpBsSUuHH4jw+c3ArfTNFjb4AD/us1JL6vTOuLwn5u+509tLW/8ogOmTuN4ET5lEVlmsUiSPrLiAvr8VwOUxiKUeno8DxgsqUulEIXi4i4Z+TftLDMIAA5mhTISg3AUTCgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896462; c=relaxed/simple;
	bh=AduMkvx1n0zCcP0NUjw003W54t5BWrn3PN0GPRnxgQo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=rhxVLY13xkfJbBqNLs+BOaoBrIQSpjWFOkFz8wpYHk6amdtXG71b5NyuWBU3kB8KiBx9E/XCUGVhK5XJt9W6oIURwd75QnwNyOmmwq7/6tpKspMcLYkNP1ztjX3BoEdmkLvEkZk7FffJKLxGii+k0tHZ0tdOxHApBfw31ee0Qhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=OxhKAcNL; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="OxhKAcNL"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bcb2eceb3eso2484993e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1791896458; x=1792501258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xhpGL6YoccSJtK8h84NFPxYwPN/7uQF8oIdoEiXDADE=;
        b=OxhKAcNLqWtvtgPqMkjlBLYibLQizYfzmYyEN34lh4gqrDxEGBzrcGxAoa6SQMOK0x
         OLJb8aHjXAUemhi9lXE/T2tNqOIkGKHhTEOwXLKqrcIXF7djhSoOOQ1179YXaQOUD/wi
         ib1g7a3RQsfyCyTvcdLVxUd6zGI54oP/ko6tYlNBQUVVtMo3xjr+lEkzJlHZlsO7vIqF
         Z8YvvzsqYP90YTfLfuDSL7+VpslrOuPM4fzdYqaEOLvh1ePLSms+cnNLAmwrd3GbAbA4
         Nad0uZZrOFGLFarNU6aXmU2bHMwzBOpZRbnlarYV5zl6kwpXcxNMxHtxjd0hPU2xFDk8
         A0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896458; x=1792501258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xhpGL6YoccSJtK8h84NFPxYwPN/7uQF8oIdoEiXDADE=;
        b=l7BIr6JB8a0zJc5lIx87CmakvbbVDzJbN9dl5ZOKDwrcm1aoGeBZU0EGBlCPEBrl3S
         VYg4smMAGnJGplk/+Gaty/ituZLdZLGtvlUX4LPZN7W0u0FmsHZMpcJPDo++88wB6sgL
         ug5JRrMezazT/+fCyhAL1qEWBbsV1nEoxOKJqA1hddsgxwrGpibDbVxHfYoQzox5CtWF
         mSJj+tOYo98Da0fs9pHfyusCAR4Bv+uSwPtapjmKau+avujXbFxbUICRNGotSRH2BeBr
         igrvbjfSkcujr04Z8kwEhFONVR6UXzm367AXdAVzApd0vdfZcJnD6ME3PEN4Gj6V7fFO
         AMug==
X-Forwarded-Encrypted: i=1; AKwUvByPfatzqzF0KTviSbfY0YTWmCw6rdWflxy+uPzNUC4VltTMt+JOe/CQeCmiKfVc8gBEFb4W/STTTHfFTSU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2sMCI2GqfC7I+Z2YY9tbz5fgYH1TgOwopUVGL1yt1GdPW6Qk4
	gue7Tuth3QimMM5B4wJAunjhDFu5iBTtcNrn7ZAlFNk3hedl02h6VOgDjaPx/CFwsnQ=
X-Gm-Gg: AYBFou0zjNwcHvljC4taOH8jZ92ZyhnazvsSNbGGntnLXzA6k4ckj7GZC7Yfg0A9b5y
	4iJFRHxASaGMgJoJVeZuVS+PgsW4atTUOeu77lOof5mmGl4W5Q3MmMwjdZ7MbZdziQ1DXwRltNR
	+LnhKwhBHhAIVCYJ2mzWQgMrlHv5TWMbmNw6Yc2w4ZdnFs8rzbA9GaX0VbG9DVJn8NRVU9Mp78E
	34kZrG/At2+WUfzLadvrHVKSJyN/sXN71t35LjkKLS476uvkkJY0vpwoQ7QTqwHETsiaZNVeuhG
	FWDEd3gxPbFJkq7QjrK+6oq7IdNJsUIdrQEgK8Mdy/OLps4IoPMiSwzgsJK3YZqowSyC58fg5FP
	0xMyipJmzRn5O/qz5FH12n3xfL+LvQ6ZofoTWuvG958CZGxPIyF2yYkc6VsHXwHN3MxwY7E6gdj
	zBJJky1eWYmXuj+DMK7yehr6eXMUscLuBA692PBVzQSe7VCU4cGOGkmzRNLLrR4U1WCqfY/J+2Q
	VRm3Dc+ez/xvFjchKEDczgrTVXVcrFzbsR1gnOhEt0ZMbuulnHd5rbOn53ioCQMhtIXbBF5QQ==
X-Received: by 2002:a05:6512:1193:b0:5b8:c147:f363 with SMTP id 2adb3069b0e04-5bcde8d4381mr4067679e87.64.1791896456820;
        Tue, 13 Oct 2026 06:00:56 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f04b700023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f04:b700:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc50e0sm6549692f8f.49.2026.10.13.06.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:00:56 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Max Kellermann <max.kellermann@ionos.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] perf: skip unnecessary userspace map synthesis
Date: Tue, 13 Oct 2026 15:00:43 +0200
Message-ID: <20261013130052.3012773-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reading `/proc/PID/task/PID/maps` for existing processes is expensive
on systems with many processes.  `perf record` already allows skipping
these reads with the `--synth=` option, but `perf top` has no
equivalent option.

Skip userspace map synthesis by default in `record` and `top` when all
events exclude userspace and no sample feature needs user mappings.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 tools/perf/Documentation/perf-record.txt |  4 +++
 tools/perf/builtin-record.c              |  8 +++++
 tools/perf/builtin-top.c                 | 19 +++++------
 tools/perf/util/evlist.c                 | 40 ++++++++++++++++++++++++
 tools/perf/util/evlist.h                 |  1 +
 tools/perf/util/record.h                 |  1 +
 6 files changed, 64 insertions(+), 9 deletions(-)

diff --git a/tools/perf/Documentation/perf-record.txt b/tools/perf/Documentation/perf-record.txt
index 178f483140ed..cdef14f22df3 100644
--- a/tools/perf/Documentation/perf-record.txt
+++ b/tools/perf/Documentation/perf-record.txt
@@ -696,6 +696,10 @@ Available types are:
   - 'all'     - synthesize all events (default)
   - 'no'      - do not synthesize any of the above events
 
+By default, userspace MMAP synthesis is skipped if all events exclude
+userspace (for example, with --all-kernel or -e cycles:k) and their
+samples do not need userspace maps.
+
 --tail-synthesize::
 Instead of collecting non-sample events (for example, fork, comm, mmap) at
 the beginning of record, collect them during finalizing an output file.
diff --git a/tools/perf/builtin-record.c b/tools/perf/builtin-record.c
index a57987851cf0..f8b4e5279fca 100644
--- a/tools/perf/builtin-record.c
+++ b/tools/perf/builtin-record.c
@@ -2574,6 +2574,13 @@ static int __cmd_record(struct record *rec, int argc, const char **argv)
 
 	evlist__config(rec->evlist, opts, &callchain_param);
 
+	if (!opts->synth_set && !opts->full_auxtrace &&
+	    !opts->auxtrace_sample_mode && !rec->off_cpu && !rec->buildid_all &&
+	    !evlist__needs_user_mmaps(rec->evlist)) {
+		opts->synth &= ~PERF_SYNTH_MMAP;
+		pr_debug("Skipping synthesis of userspace maps for kernel-only recording\n");
+	}
+
 	/* Debug message used by test scripts */
 	pr_debug3("perf record opening and mmapping events\n");
 	if (record__open(rec) != 0) {
@@ -3412,6 +3419,7 @@ static int parse_record_synth_option(const struct option *opt,
 		pr_err("Invalid synth option: %s\n", str);
 		return -1;
 	}
+	opts->synth_set = true;
 	return 0;
 }
 
diff --git a/tools/perf/builtin-top.c b/tools/perf/builtin-top.c
index 570410599f1b..d85ecc140eda 100644
--- a/tools/perf/builtin-top.c
+++ b/tools/perf/builtin-top.c
@@ -1017,14 +1017,6 @@ static int perf_top__start_counters(struct perf_top *top)
 	struct evlist *evlist = top->evlist;
 	struct record_opts *opts = &top->record_opts;
 
-	if (perf_top__overwrite_check(top)) {
-		ui__error("perf top only support consistent per-event "
-			  "overwrite setting for all events\n");
-		goto out_err;
-	}
-
-	evlist__config(evlist, opts, &callchain_param);
-
 	evlist__for_each_entry(evlist, counter) {
 try_again:
 		if (evsel__open(counter, counter->core.cpus,
@@ -1265,6 +1257,14 @@ static int __cmd_top(struct perf_top *top)
 	if (ret)
 		return ret;
 
+	if (perf_top__overwrite_check(top)) {
+		ui__error("perf top only support consistent per-event "
+			  "overwrite setting for all events\n");
+		return -1;
+	}
+
+	evlist__config(top->evlist, opts, &callchain_param);
+
 	if (perf_session__register_idle_thread(top->session) < 0)
 		return ret;
 
@@ -1296,7 +1296,8 @@ static int __cmd_top(struct perf_top *top)
 		pr_debug("Couldn't synthesize cgroup events.\n");
 
 	machine__synthesize_threads(&top->session->machines.host, &opts->target,
-				    evlist__core(top->evlist)->threads, true, false,
+				    evlist__core(top->evlist)->threads,
+				    evlist__needs_user_mmaps(top->evlist), false,
 				    top->nr_threads_synthesize);
 
 	perf_set_multithreaded();
diff --git a/tools/perf/util/evlist.c b/tools/perf/util/evlist.c
index c3d784727810..6636edee0d2b 100644
--- a/tools/perf/util/evlist.c
+++ b/tools/perf/util/evlist.c
@@ -1990,6 +1990,46 @@ bool evlist__exclude_kernel(struct evlist *evlist)
 	return true;
 }
 
+bool evlist__needs_user_mmaps(struct evlist *evlist)
+{
+	struct evsel *evsel;
+	bool has_kernel_event = false;
+
+	evlist__for_each_entry(evlist, evsel) {
+		struct perf_event_attr *attr = &evsel->core.attr;
+
+		/* Tracking events do not produce samples, regardless of modifiers. */
+		if (evsel__is_dummy_event(evsel))
+			continue;
+
+		if (!attr->exclude_user)
+			return true;
+
+		/* Kernel samples can still contain a userspace callchain. */
+		if ((attr->sample_type & PERF_SAMPLE_CALLCHAIN) &&
+		    !attr->exclude_callchain_user)
+			return true;
+
+		/*
+		 * These may reference userspace even when the sampled
+		 * IP is in the kernel.  Keep maps for opaque trace
+		 * payloads and AUX trace decoding too, whose address
+		 * requirements are PMU specific.
+		 */
+		if (attr->sample_type & (PERF_SAMPLE_ADDR | PERF_SAMPLE_RAW |
+					 PERF_SAMPLE_REGS_USER | PERF_SAMPLE_STACK_USER |
+					 PERF_SAMPLE_BRANCH_STACK | PERF_SAMPLE_AUX))
+			return true;
+
+		if (evsel__is_aux_event(evsel))
+			return true;
+
+		has_kernel_event = true;
+	}
+
+	return !has_kernel_event;
+}
+
 /*
  * Events in data file are not collect in groups, but we still want
  * the group display. Set the artificial group and set the leader's
diff --git a/tools/perf/util/evlist.h b/tools/perf/util/evlist.h
index 838e263b76f3..b208bf7211e8 100644
--- a/tools/perf/util/evlist.h
+++ b/tools/perf/util/evlist.h
@@ -631,6 +631,7 @@ struct evsel *evlist__find_evsel_by_str(struct evlist *evlist, const char *str);
 struct evsel *evlist__event2evsel(struct evlist *evlist, union perf_event *event);
 
 bool evlist__exclude_kernel(struct evlist *evlist);
+bool evlist__needs_user_mmaps(struct evlist *evlist);
 
 void evlist__force_leader(struct evlist *evlist);
 
diff --git a/tools/perf/util/record.h b/tools/perf/util/record.h
index 93627c9a7338..1317ddce3cf0 100644
--- a/tools/perf/util/record.h
+++ b/tools/perf/util/record.h
@@ -80,6 +80,7 @@ struct record_opts {
 	int	      ctl_fd_ack;
 	bool	      ctl_fd_close;
 	int	      synth;
+	bool	      synth_set;
 	int	      threads_spec;
 	const char    *threads_user_spec;
 	u64	      off_cpu_thresh_ns;
-- 
2.47.3

