Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE4D50EBFC
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 17:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790962791; cv=none; b=EzdWwH59bHAcBYzU7q+PD434IPAKh71ux4r9DN+p8UaZbZsP/om/MBM3sZUq6X8dHvpRl3+8tTOYQfOcii7a1cyEdYeqrvhZBa/MlKSGAaplHLQhP8jqjgPD/iT9hVVbWa+jZXV+ZVh/1+Gj0n+l9robl0qEAlfMGkYJ6UlKLx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790962791; c=relaxed/simple;
	bh=Rr8rFCWSX0llRdWGetGWhjZnaiWJcBy5rXSpVmbgIIQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CALQRTiyc60xIhbot55rB8QaVcZf4RP+E+eWvJ08J7Z94/WV35YSJ4FuWbRxC7u78DkyrQ+njEabaBHOUAMorRgnsnPxFEpBc545OjrMTobGy5s0UKTQbek7veOi94nUoVzSKoPT1tQUMlbDsgRQUZHALfc0PO827ipnf7Boaqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PJwMhG1G; arc=none smtp.client-ip=74.125.82.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PJwMhG1G"
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1438492fb40so6032906c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 10:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790962768; x=1791567568; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uCjrogq4CZs2TO8LyYeUrINjRyEkl+IyeoSFYJSxfMg=;
        b=PJwMhG1GHLC9Wi2xdoW54pdHvtsQpU2x6maU8Q8a4LbVwAXR8wIFD5OYKlo0Iv0Sl/
         qb9tqfzBRnbKUaZI1N8dkNtg8VVV1i4hDvfVft52dms0f1Emh6F6QNBf5Fdjm7tCwseJ
         z1C/S/E42gS7dhzSaeQ1MU1xNbkajDPvNnIFQbHOKkkF1yI3qZ4maB4gxJysHupg16/r
         OLw6ACFyIpjuVXjFG4I2Ll23OgyeY1hUqHrUiKbuHTyF9FAKklXTax/NsC3qXHO++coa
         2iN35axJIWLqk9vJhR2fAWEKs51AyiDbCzUU2TlWZzJ7sD2bFtOLfSuo/n0L2Hf2YXKY
         hbaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790962768; x=1791567568;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uCjrogq4CZs2TO8LyYeUrINjRyEkl+IyeoSFYJSxfMg=;
        b=L+IZamWBIYuSo97R+KpOKuMnzh7B/bMjTFxSi6h/9fsY42YSYJhNmyD7nv3WzB0AXC
         Zj4OPjUMXz0Q4aJ3pjkcvks5I4y6vDYIkGO2Ifs/1qHahn8VBXLShX0f0d30MiA4MwO+
         gjgQJy1cEWT2B5/CV7FHBGJjtKTnpGejOyVIKC0JggHTgVZYR7d1JBvPduOI78bO12EF
         RUYHg+a+cJJ1O/YbuINZtXJkACYbcrccJkZ01kWK6hhpASM2jJyzNTXO4DxKTYj85PE0
         8tQUnjWNm+zEBM6fEPKYEbrUfN4cK+7CDRV170RqZy2Ewc+5TTiSO/WqrXcm0ul81jn6
         ih/g==
X-Forwarded-Encrypted: i=1; AKwUvBwgBxgmIbylehYitkuhmkq7Jkug55PnwfJoFiFk6BjwqG14nMWEtKbCIdqR3ZwXhrgXHkBvfcaZJBE1yGo=@vger.kernel.org
X-Gm-Message-State: AFuF++nPhrpBxW2BOaoEyt89UNBWZfZvd1RFH1HLqgtZPUL+f6Ed+sPu
	e3MQ0SH0iTk3GmeQ9g+lMxzv5f5Uaw8/lZDdy/T+3Qh3a9depvctsQLFLb6stLtht4Y1gi2JOZl
	3IiMPqZZATQ==
X-Received: from dlbrl17.prod.google.com ([2002:a05:7022:f511:b0:14a:c841:ce30])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4541:10b0:14f:fb87:cf3c
 with SMTP id a92af1059eb24-14ffb87f01dmr1957646c88.26.1790962767725; Fri, 02
 Oct 2026 10:39:27 -0700 (PDT)
Date: Fri,  2 Oct 2026 10:38:40 -0700
In-Reply-To: <20261002173848.3228217-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250424061943.1321025-1-irogers@google.com> <20261002173848.3228217-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261002173848.3228217-8-irogers@google.com>
Subject: [PATCH v2 7/8] perf record: Add --buildid-offset option
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, adrian.hunter@intel.com, 
	mingo@redhat.com, namhyung@kernel.org, peterz@infradead.org
Cc: ak@linux.intel.com, alexander.shishkin@linux.intel.com, 
	atrajeev@linux.ibm.com, dvyukov@google.com, fzczx123@gmail.com, 
	james.clark@linaro.org, jolsa@kernel.org, kjain@linux.ibm.com, 
	krzysztof.m.lopatowski@gmail.com, leo.yan@arm.com, lihuafei1@huawei.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux@treblig.org, m.liska@foxlink.cz, mark.rutland@arm.com, 
	martin.liska@hey.com, mpetlan@redhat.com, quic_zhonhan@quicinc.com, 
	scclevenger@os.amperecomputing.com, sesse@google.com, 
	stephen.s.brennan@oracle.com, thomas.falcon@intel.com, 
	yangyicong@hisilicon.com
Content-Type: text/plain; charset="UTF-8"

Add the --buildid-offset flag to perf record to natively request
PERF_SAMPLE_BUILD_ID_OFFSET and PERF_SAMPLE_CALLCHAIN_BUILD_ID_OFFSET
from the kernel. This configures the evsel attributes by replacing
the standard IP and CALLCHAIN bits with the build ID offset equivalents.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-record.c |  2 ++
 tools/perf/util/evsel.c     | 55 ++++++++++++++++++++++++++++++++++++-
 tools/perf/util/record.h    |  1 +
 3 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/tools/perf/builtin-record.c b/tools/perf/builtin-record.c
index ad81458989b5..0bd051bf95e1 100644
--- a/tools/perf/builtin-record.c
+++ b/tools/perf/builtin-record.c
@@ -3625,6 +3625,8 @@ static struct option __record_options[] = {
 		   "file", "vmlinux pathname"),
 	OPT_BOOLEAN(0, "buildid-all", &record.buildid_all,
 		    "Record build-id of all DSOs regardless of hits"),
+	OPT_BOOLEAN(0, "buildid-offset", &record.opts.buildid_offset,
+		    "Record build id offset instead of IP"),
 	OPT_BOOLEAN_SET(0, "buildid-mmap", &record.buildid_mmap, &record.buildid_mmap_set,
 			"Record build-id in mmap events and skip build-id processing."),
 	OPT_BOOLEAN(0, "timestamp-filename", &record.timestamp_filename,
diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index 08e9e6567bed..7517e960c58e 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -1549,6 +1549,43 @@ bool evsel__is_offcpu_event(struct evsel *evsel)
 	       evsel->core.attr.sample_type & PERF_SAMPLE_RAW;
 }
 
+static bool evlist__has_callchain_config(struct evlist *evlist,
+					 const struct callchain_param *callchain)
+{
+	struct evsel *pos;
+
+	if (callchain && callchain->enabled)
+		return true;
+	if (!evlist)
+		return false;
+
+	evlist__for_each_entry(evlist, pos) {
+		struct evsel_config_term *term;
+		const char *callgraph_buf = NULL;
+		u32 dump_size = 0;
+		int max_stack = 0;
+
+		if (evsel__has_callchain(pos))
+			return true;
+
+		list_for_each_entry(term, &pos->config_terms, list) {
+			if (term->type == EVSEL__CONFIG_TERM_CALLGRAPH)
+				callgraph_buf = term->val.str;
+			else if (term->type == EVSEL__CONFIG_TERM_STACK_USER)
+				dump_size = term->val.stack_user;
+			else if (term->type == EVSEL__CONFIG_TERM_MAX_STACK)
+				max_stack = term->val.max_stack;
+		}
+		if (callgraph_buf) {
+			if (strcmp(callgraph_buf, "no") != 0)
+				return true;
+		} else if (dump_size > 0 || max_stack > 0) {
+			return true;
+		}
+	}
+	return false;
+}
+
 /*
  * The enable_on_exec/disabled value strategy:
  *
@@ -1745,7 +1782,7 @@ void evsel__config(struct evsel *evsel, const struct record_opts *opts,
 	attr->mmap2    = track && !perf_missing_features.mmap2;
 	attr->comm     = track;
 	attr->build_id = track && opts->build_id;
-	attr->defer_output = track && callchain && callchain->defer;
+	attr->defer_output = track && ((callchain && callchain->defer) || opts->buildid_offset);
 
 	/*
 	 * ksymbol is tracked separately with text poke because it needs to be
@@ -1831,6 +1868,22 @@ void evsel__config(struct evsel *evsel, const struct record_opts *opts,
 	 */
 	evsel__apply_config_terms(evsel, opts, track);
 
+	if (opts->buildid_offset && !evsel__is_offcpu_event(evsel)) {
+		if ((evsel->core.attr.sample_type & PERF_SAMPLE_IP) || track) {
+			evsel__reset_sample_bit(evsel, IP);
+			evsel__set_sample_bit(evsel, BUILD_ID_OFFSET);
+			if (!attr->exclude_user)
+				attr->defer_callchain = 1;
+		}
+		if ((evsel->core.attr.sample_type & PERF_SAMPLE_CALLCHAIN) ||
+		    (track && evlist__has_callchain_config(evsel->evlist, callchain))) {
+			evsel__reset_sample_bit(evsel, CALLCHAIN);
+			evsel__set_sample_bit(evsel, CALLCHAIN_BUILD_ID_OFFSET);
+			if (!attr->exclude_callchain_user)
+				attr->defer_callchain = 1;
+		}
+	}
+
 	evsel->ignore_missing_thread = opts->ignore_missing_thread;
 
 	/* The --period option takes the precedence. */
diff --git a/tools/perf/util/record.h b/tools/perf/util/record.h
index 411bb7276ad7..6c9568616177 100644
--- a/tools/perf/util/record.h
+++ b/tools/perf/util/record.h
@@ -55,6 +55,7 @@ struct record_opts {
 	bool	      kcore;
 	bool	      text_poke;
 	bool	      build_id;
+	bool	      buildid_offset;
 	unsigned int  freq;
 	unsigned int  mmap_pages;
 	unsigned int  auxtrace_mmap_pages;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

