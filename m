Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749557;
	b=2Hxw24+Ajst1Si/PZGFYfReEIdQ3AtJc4BZh8CIFZI9sOBcItmkooJREljbDKRrzAg1W
	 diqxlp//QjNu94UTbdUDnHx5soMrLLGn5tFDOxs52VuFzaJ7gUogMhji0U6PNQUuW1l3a
	 yezBNKzBVKoORD3nqNKQkpF54Oe40FIh26nUvGQzSO9D1Uepw6BugXQtmbY9ZCTl01SPf
	 grgeMRXJnIM9JxTbtLhaBU8JV5qSppX6IxD/w+qfDacxFf2DQ3+jGA8eOFr4S/srOBPNa
	 skM/F4ChjxlUovr9ob2n7uSyBNMse4XzSveugfrVZa4UnyxLhjsvKt8Aa9MmjbaX1nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749557;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=OFuGN5P3Lx4JQ5sN0dyHzFMj7AP34MEOJtQAERKynfA=;
	b=rDlTEBonP33F427e5IFko9tdNXabbjGYKnO3uQskhWqRvHqPnBBHf2uwXMHasP0x5cP0
	 wHqZVoG2kBBClsinhojGO7F0wU2pk40UCUgWvz13atM/Zp9oAFbsHzrdloztvZBFFVCWf
	 4XUe9xAkxXpL/pf/gWQ3pxiHSrbPaDtID51KLhH1D+bj289MkDeSMNCexBouq/eg3umIc
	 OFKQBOmgsGqjMxejQXpwgoUJ9J0zMaNNqlydSp+9IyPXEGrvtH7Nq0dr6s1SF64NmP9HW
	 92NADHqiDpRauAyyRRrAQ2+dTfOqM+5KKSgHhOEiH/5xMRjrvQPlqEDzHyb1M47B7LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TafVSmK8;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4B46082BC1
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:45:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA4B46082BC1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TafVSmK8
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso159161eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793749556; x=1794354356; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OFuGN5P3Lx4JQ5sN0dyHzFMj7AP34MEOJtQAERKynfA=;
        b=TafVSmK8MOshU5CzNFd4/YRTUmmsbrrIeXRzZdwyBj2L6ky14hSvQusYFEpJ+Us/70
         rb+43qrO4FPLddtVHwarf5elY5+CIOL+/REPrVX+1D3VqVVj918pTluoME8dD9ZXhqJU
         W6C28L2uLGMfxXz7Iu5A9aFs7WeI/VgZIPx95fxqauu5unUCDMAf1VmNWM6CoabYy4Rq
         guWgT97rQckozQeVidrI2GL/capY/MlawvPVPc5w05bwBO84TZl/jt3nI6UxdWccty64
         ZyuUsqjXAAkrF7xH9TYPOKdef9sj8ppP4HWa6Vo7rhuvvQdbCHfqoZVSePRR+dYfZAoL
         r4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749556; x=1794354356;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OFuGN5P3Lx4JQ5sN0dyHzFMj7AP34MEOJtQAERKynfA=;
        b=1kWAxld5wri6rMS1zoG8RXv7xUgta7H8mpIX44qkyPxyykPDStBBbC9Bkm4rbqiJi7
         UD2Xedv7ANMssBh5loDuELySLkiWVrj59TjoARg2p/6EAcNZ1tyZvZAmTKG2uiW2R5wI
         xmPwXWE4A9bl1GrvJpAuKi20kB7iQWgdESt489MkBaaq6Yps7tzjZ8fFQRAaueC5VvXE
         OXFPAp5y7d+F5tvUQk8/7lKwlYiwy/GPvKKHzdQMJXk3w2ikZj86oxyAIi+OlVFCkU6c
         +ZN1snlv9pSmX4/pY3PuCo9Pig1D9+Un9yBlDJcN5bbb4OUtG0ONVkBOc0LcRhZNxuAA
         gwKA==
X-Gm-Message-State: APuU4Z9bDdiSO6R2CQesasC1Uq53vViTNsLoqqWuDHxzDKKT3IR9mV7d
	Nxv98Ruzsh0qAZnAtFGrSuPJVUhr9wKGN08GujoutvQ0FvNyjkLnuc2yPf7aNNMO8SAvXvtjlf/
	9uD40VmCxuA==
X-Received: from dlbvg21.prod.google.com ([2002:a05:7022:7f15:b0:1a7:76f5:9d46])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:1101:b0:195:1a77:85cb
 with SMTP id a92af1059eb24-1ac57454ee8mr20378439c88.1.1793749555759; Tue, 03
 Nov 2026 15:45:55 -0800 (PST)
Date: Tue,  3 Nov 2026 15:44:34 -0800
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
Message-ID: <20261103234502.1008382-19-irogers@google.com>
Subject: [PATCH v1 18/41] perf pmu: Add perf_pmu__for_each_name_from_config()
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

perf_pmu__name_from_config() returns the first event alias of a PMU
whose parsed config matches, ignoring the perf_event_attr type. So a
legacy hardware event alias can be returned for a raw config of the
same value, only one of possibly several names is found, and the names
of legacy events whose aliases were replaced by sysfs or json events of
the same name can't be found.

Add perf_pmu__for_each_name_from_config() that calls a callback for
each event name of a PMU whose encoding has a given type and config,
ignoring the extended PMU type of legacy encodings and, for core PMUs,
also searching the legacy hardware and cache event tables. Make
perf_pmu__name_from_config() return the first such name for the PMU's
type.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/pmu.c | 105 +++++++++++++++++++++++++++++++++++++++---
 tools/perf/util/pmu.h |   3 ++
 2 files changed, 101 insertions(+), 7 deletions(-)

diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index ee52fd18c927..fecfe791bf8a 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -2840,25 +2840,116 @@ void perf_pmu__delete(struct perf_pmu *pmu)
 	free(pmu);
 }
 
-const char *perf_pmu__name_from_config(struct perf_pmu *pmu, u64 config)
+static bool pmu_config_equal(__u32 type, u64 a, u64 b)
+{
+	/* Ignore the extended PMU type in the upper bits of legacy encodings. */
+	if (type == PERF_TYPE_HARDWARE || type == PERF_TYPE_HW_CACHE)
+		return (a & PERF_HW_EVENT_MASK) == (b & PERF_HW_EVENT_MASK);
+	return a == b;
+}
+
+struct legacy_name_args {
+	__u32 type;
+	u64 config;
+	int (*cb)(const char *name, void *data);
+	void *data;
+};
+
+static int pmu_legacy_name_cb(const struct pmu_event *pe,
+			      const struct pmu_events_table *table __maybe_unused,
+			      void *data)
+{
+	static const char hw_prefix[] = "legacy-hardware-config=";
+	static const char cache_prefix[] = "legacy-cache-config=";
+	struct legacy_name_args *args = data;
+	const char *prefix = args->type == PERF_TYPE_HARDWARE ? hw_prefix : cache_prefix;
+
+	if (!pe->name || !pe->event || !strstarts(pe->event, prefix))
+		return 0;
+	if (!pmu_config_equal(args->type, strtoull(pe->event + strlen(prefix), NULL, 0),
+			      args->config))
+		return 0;
+	return args->cb(pe->name, args->data);
+}
+
+/**
+ * perf_pmu__for_each_name_from_config - Call @cb for event names of an encoding.
+ * @pmu: The PMU whose event names are searched.
+ * @type: The perf_event_attr type of the encoding, such as the PMU's type or
+ *        PERF_TYPE_HARDWARE for a legacy hardware event.
+ * @config: The perf_event_attr config of the encoding.
+ * @cb: Called with each event name of @pmu with the encoding, a non-zero return
+ *      stops the iteration.
+ * @data: Passed to @cb.
+ *
+ * As event aliases from sysfs or json replace legacy event aliases of the same
+ * name, the names of legacy hardware and cache events of core PMUs are found
+ * from the legacy event tables. @cb may be called more than once for a name.
+ *
+ * Return: 0 or the first non-zero value returned by @cb.
+ */
+int perf_pmu__for_each_name_from_config(struct perf_pmu *pmu, __u32 type, u64 config,
+					int (*cb)(const char *name, void *data),
+					void *data)
 {
 	struct hashmap_entry *entry;
 	size_t bkt;
+	int ret;
 
 	if (!pmu)
-		return NULL;
+		return 0;
 
 	pmu_aliases_parse(pmu);
 	pmu_add_cpu_aliases(pmu);
 	hashmap__for_each_entry(pmu->aliases, entry, bkt) {
 		struct perf_pmu_alias *event = entry->pvalue;
-		struct perf_event_attr attr = {.config = 0,};
-		int ret = perf_pmu__parse_terms_to_attr(pmu, event->terms, &attr);
+		struct perf_event_attr attr = { .type = pmu->type, };
 
-		if (ret == 0 && config == attr.config)
-			return event->name;
+		if (perf_pmu__parse_terms_to_attr(pmu, event->terms, &attr) ||
+		    attr.type != type || !pmu_config_equal(type, attr.config, config))
+			continue;
+		ret = cb(event->name, data);
+		if (ret)
+			return ret;
 	}
-	return NULL;
+	if (pmu->is_core && (type == PERF_TYPE_HARDWARE || type == PERF_TYPE_HW_CACHE)) {
+		struct legacy_name_args args = {
+			.type = type,
+			.config = config,
+			.cb = cb,
+			.data = data,
+		};
+
+		return pmu_events_table__for_each_event(perf_pmu__default_core_events_table(),
+							/*pmu=*/NULL, pmu_legacy_name_cb, &args);
+	}
+	return 0;
+}
+
+static int first_name_cb(const char *name, void *data)
+{
+	const char **first = data;
+
+	*first = name;
+	return 1;
+}
+
+/**
+ * perf_pmu__name_from_config - The first event name of @pmu with @config.
+ * @pmu: The PMU whose event names are searched.
+ * @config: The perf_event_attr config of an event of @pmu's type.
+ *
+ * Return: An event name or NULL if none was found.
+ */
+const char *perf_pmu__name_from_config(struct perf_pmu *pmu, u64 config)
+{
+	const char *name = NULL;
+
+	if (!pmu)
+		return NULL;
+
+	perf_pmu__for_each_name_from_config(pmu, pmu->type, config, first_name_cb, &name);
+	return name;
 }
 
 bool perf_pmu__reads_only_on_cpu_idx0(const struct perf_event_attr *attr)
diff --git a/tools/perf/util/pmu.h b/tools/perf/util/pmu.h
index 06f922ce1f68..b556ec51fdeb 100644
--- a/tools/perf/util/pmu.h
+++ b/tools/perf/util/pmu.h
@@ -374,6 +374,9 @@ struct perf_pmu *perf_pmu__lookup(struct list_head *pmus, int dirfd, const char
 struct perf_pmu *perf_pmu__create_placeholder_core_pmu(struct list_head *core_pmus);
 void perf_pmu__delete(struct perf_pmu *pmu);
 
+int perf_pmu__for_each_name_from_config(struct perf_pmu *pmu, __u32 type, u64 config,
+					int (*cb)(const char *name, void *data),
+					void *data);
 const char *perf_pmu__name_from_config(struct perf_pmu *pmu, u64 config);
 bool perf_pmu__is_fake(const struct perf_pmu *pmu);
 
-- 
2.56.0.385.gac671c819a-goog

