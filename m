Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749581;
	b=JFnJtnPDu3t2gAoJXyT/fGmeLEKrVIQLC/zh0Rs6UGlI2p8ftaR+f9BYcGa/vSOjqsgF
	 phtaYEaP6zKqa3DpxwDT3IH7i51K3KChapVC6vY4mLgW8/Y+M2p4sR+vpJRu071FLXpG7
	 gCvnpl2KntYMy4+qWMMFRtyA08/12P3NmYhq0FenxEZltYz26fzM12kr9jI7XQw3MYRtB
	 ri03TnvALSUwq81OBQEqOJPRKLVDuDxcJtSqwJIHjsktVHfJjEr6jaScVKT/L4y6EhzKK
	 Vhqnm34Q3d/BqjjZC2hCGJbxxLdMpHIG7P1ecX2iIZoVgTx8U/wiATJUqETupgUnk3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=UMEM0EkoFzx3pxAKIEJuwdt13167jydYFPP4Cy6zaqI=;
	b=CRLmI4T0+4tUPqdZWCLVbVE5CSG0dX+sncBr1B6Oa8gvhELK665NpWvkeAItM2a62g96
	 7RxHWh+eQmChq98DAymXY8b1VoeQXNRIFBYZePnCAeorb+OBQz6xqZvc5Tv+t2DgPN3Iw
	 KY/yNzvKVuov7zlzFGRJifdoZDclwf2BDBz6YFMTBMHvecOcjUd5pZ68FC46xINDFZMtI
	 JU7DHc+4CnUGmxh93tM9r4w3Wm64yOXxB4GaITy/psZf8am8U09iad5cjfzCyb2voAY+1
	 n6kKX/udB1YiRxUxfyofw/QTXI7RqnJzGxbh0A3V8fOYPzsaYG5cjrJ4WKL+4RgtITg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qHWwyOg+;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CDB608360C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:46:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04CDB608360C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qHWwyOg+
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso137762eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793749580; x=1794354380; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UMEM0EkoFzx3pxAKIEJuwdt13167jydYFPP4Cy6zaqI=;
        b=qHWwyOg+7ebkVSVXGm+MDMBwiALY/QU+4ydvXi2vldD7rx8hsyY8B0/kjU4Eh8rVUA
         0J4R5zzmv/XHKN4KY68F//25u3JHOONNBy3wFoYa6I5rW1wjN6Lz1k5lpztNAWdN54gq
         uHmQPrkTdgWo+tGZzn2mXHVu9YgngoVJAXAUNrpm/xVjPVS16cCqKls8az2j3nqTm4PI
         jG0N9afO6sy9WUT5/yut5TQ5im0kB3Tk2yeed3k+ffxuHSC34fNXsxdZvT0+AsQtLQca
         GdH5nL/vh5Dm7FwG2FicRI+HmF/gcV57zJOtQFT+9/1ildBFOk4IrUxDbYCvPpYBvanR
         cYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749580; x=1794354380;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UMEM0EkoFzx3pxAKIEJuwdt13167jydYFPP4Cy6zaqI=;
        b=QjEDoIpgTFf5XoI7HyuxDUHNgP3iRjVUHDALiqHg9LW8IAoJ87vC3ojYV9mUr+EhNq
         cYWl+YVWxLt2RUn0HH7S7pMFLrjB8S14dksA6C1WVLyD2j03HoLujGdJef4No7L5ZF+s
         ONTwchl9DUD1umM+8dNp0Gi5yDZRObJWbzEl1wU5G/KqAMullhGMyHIV45pde8i99Jf6
         H7sZIPeDx7bNIL/7fQaySqOIw+iIwyC194LHkzq6LRhvr71Z7MOuZNSfIHWKEE8G5EhB
         1wbSe3Z1WjXqqg1N1ziYDOJ+Rv56RHYGvvRiNkcZNt6W63lf9s1n1FifHw9NJ9CtpxaQ
         64hQ==
X-Gm-Message-State: APuU4Z+hmPj9AijV8ze78o9IAQmypjkz+Rwy11el6p3XrO3tuW+oQnip
	8VtXxHF3FLV2Vw96fQu2h8rdVfZ+SvehONoRixjVDxPky0UQdad/EghSoTQSPf/pfeLccq84i7l
	FCbZK6gPDSQ==
X-Received: from dlbsn12.prod.google.com ([2002:a05:7022:b90c:b0:199:dfd1:f396])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2910:b0:198:b1e:90d9
 with SMTP id a92af1059eb24-1ac5d88cb6bmr17896802c88.10.1793749579910; Tue, 03
 Nov 2026 15:46:19 -0800 (PST)
Date: Tue,  3 Nov 2026 15:44:43 -0800
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
Message-ID: <20261103234502.1008382-28-irogers@google.com>
Subject: [PATCH v1 27/41] perf mem-events: Expose PMU init and name formatting helpers
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

Export perf_pmu__mem_events_init_pmu() and perf_pmu__mem_events_name()
so callers can initialize and format per-PMU memory profiling events.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/mem-events.c | 12 ++++++------
 tools/perf/util/mem-events.h | 20 ++++++++++++++++++++
 2 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/tools/perf/util/mem-events.c b/tools/perf/util/mem-events.c
index 62543df0dca1..932efcfd82f7 100644
--- a/tools/perf/util/mem-events.c
+++ b/tools/perf/util/mem-events.c
@@ -82,12 +82,12 @@ int perf_pmu__mem_events_num_mem_pmus(struct perf_pmu *pmu)
 	return num;
 }
 
-static const char *perf_pmu__mem_events_name(struct perf_pmu *pmu, int i,
-					     char *buf, size_t buf_size)
+const char *perf_pmu__mem_events_name(struct perf_pmu *pmu, int i,
+				      char *buf, size_t buf_size)
 {
 	struct perf_mem_event *e;
 
-	if (i >= PERF_MEM_EVENTS__MAX || !pmu)
+	if (i >= PERF_MEM_EVENTS__MAX || !pmu || !pmu->mem_events)
 		return NULL;
 
 	e = &pmu->mem_events[i];
@@ -196,13 +196,13 @@ static bool perf_pmu__mem_events_supported(const char *mnt, struct perf_pmu *pmu
 	return !stat(path, &st);
 }
 
-static int __perf_pmu__mem_events_init(struct perf_pmu *pmu)
+int perf_pmu__mem_events_init_pmu(struct perf_pmu *pmu)
 {
 	const char *mnt = sysfs__mount();
 	bool found = false;
 	int j;
 
-	if (!mnt)
+	if (!mnt || !pmu || pmu->from_env || !pmu->mem_events)
 		return -ENOENT;
 
 	for (j = 0; j < PERF_MEM_EVENTS__MAX; j++) {
@@ -228,7 +228,7 @@ int perf_pmu__mem_events_init(void)
 	struct perf_pmu *pmu = NULL;
 
 	while ((pmu = perf_pmus__scan_mem(pmu)) != NULL) {
-		if (__perf_pmu__mem_events_init(pmu))
+		if (perf_pmu__mem_events_init_pmu(pmu))
 			return -ENOENT;
 	}
 
diff --git a/tools/perf/util/mem-events.h b/tools/perf/util/mem-events.h
index 38b14c03392c..f2e622a048c8 100644
--- a/tools/perf/util/mem-events.h
+++ b/tools/perf/util/mem-events.h
@@ -31,8 +31,28 @@ extern struct perf_mem_event perf_mem_events[PERF_MEM_EVENTS__MAX];
 extern bool perf_mem_record[PERF_MEM_EVENTS__MAX];
 
 int perf_pmu__mem_events_parse(struct perf_pmu *pmu, const char *str);
+
+/**
+ * perf_pmu__mem_events_init_pmu() - Initialize memory event table for @pmu.
+ * @pmu: The PMU to check for memory event support.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int perf_pmu__mem_events_init_pmu(struct perf_pmu *pmu);
 int perf_pmu__mem_events_init(void);
 
+/**
+ * perf_pmu__mem_events_name() - Format the event string for a memory event.
+ * @pmu: The PMU providing the memory event.
+ * @i: Memory event index (PERF_MEM_EVENTS__LOAD, etc.).
+ * @buf: Output buffer to format the event string into.
+ * @buf_size: Size of @buf in bytes.
+ *
+ * Return: Pointer to @buf on success, or NULL if invalid/unsupported.
+ */
+const char *perf_pmu__mem_events_name(struct perf_pmu *pmu, int i,
+				      char *buf, size_t buf_size);
+
 struct perf_mem_event *perf_pmu__mem_events_ptr(struct perf_pmu *pmu, int i);
 struct perf_pmu *perf_mem_events_find_pmu(void);
 int perf_pmu__mem_events_num_mem_pmus(struct perf_pmu *pmu);
-- 
2.56.0.385.gac671c819a-goog

