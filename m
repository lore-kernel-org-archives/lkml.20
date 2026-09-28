Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87753998B4
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790620007; cv=none; b=h4EZknIjqPuiuXI62XacRoeSb1VJXQ3ayosXvjvTKvKbbF5DiS9h6VKQ7fwhvXZwYhsROcfaJMi5H2McNWLnH+MyM1rYe6OQ/YDLBU9Py4nS1EDXeYXeBdJ2U7yTMrta+XCeVmCkcI/f9cQdAP4WvSKNqs64AJL0txE81qJv3XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790620007; c=relaxed/simple;
	bh=di0kgvcrSA6AqscH4bvM1vt/EZVtYAzqHJiDkjsihcQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dbn67neeRXJJR4oJlqiQ6/EsePC1pFKSNH0466f/WhXG7I+vuVsIJMolAZ7p47kp+npsMTbodqQOmeY7gmeu3Wv8wf0iEPLDGycrix0C/CJSP51D3a0BuIGJFKcFlsRjB6gnHxmoqgOmBaeHnnuIs/fKrt+xJbYgee3aDncD3gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tAZbhc5F; arc=none smtp.client-ip=74.125.82.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tAZbhc5F"
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30f1b904861so4840305eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790620005; x=1791224805; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0CrVNnFocAqOepGx/yjstO30JWglaoli+5VbmONcWMM=;
        b=tAZbhc5FyPelX7vvg5886zeKyxBM2xVWBUsjtqiHifyE0CEBDpkcPfQIAaLnUO/l2S
         ZjIK3vOwBe6HOcbbROfKfWTEem28bBNG+gIcykRrtff0EtGmU71aDJ2nF8FMU7sGq97c
         EaVC/LzRO6gxRJOTUqmFoJdKtKONiyCxJDzaZyTgnbsUiiKc3dH22NcUP+hqaevB3X3n
         +IbgdT9oNXvOqxyvYBnDz14JlEpUibc5rGBnLSL0z/A7NeF+bTHwRfgCLLCg2GhMNhmj
         QQ3gvunJTi/z54kNDHN+uYXT/HeHeTArvMCeMROJKg0eWloi80zPoqzHfcZzWXSz1d69
         B3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790620005; x=1791224805;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0CrVNnFocAqOepGx/yjstO30JWglaoli+5VbmONcWMM=;
        b=rMC15v/033hwm1uj72io0TEoq9YkqAQMfW+XOFx10WnUn3iwpDnjfpx55S89gbimUB
         8LJa0Oa6zhq3fe2aXQhBS/pYGmFiKc/T4YB6bMJ0DEOaDgwSiaP7/oYdHyOi3XHW9AcL
         2fVRheGsLuEJeYDpNzDtzUPX5zBiKumnaDP2BSNDGCUqgWf3Lec+eZ9Q6kWXxqMH2r7s
         Nw82pTpoF+XWdpGuN3SnEXAoE0zqj+sasVi4lC+qufVpvnnaD494Zd3IM3r1MmBkhwre
         OMp+fpiKsVsfSizsXlAJbnw8p48jjK+07jg+Y5lhwCOGzSoHRGLfHzXOS1GQ4VbFNrfU
         1Nkg==
X-Forwarded-Encrypted: i=1; AKwUvBzQZvwOsMGoaHaloLci8aeOO6WLCMFywvYmOrwpEyyiLgl94Zzx0c7gPW5VgB5GzHQsoXmLG+3PVUCJ6Ys=@vger.kernel.org
X-Gm-Message-State: AFuF++nEb5g8utHvktHzDZSjQ+zwT/fKgdVtYMXcNujwL82c2NpVdCWq
	b9GZzz5gc/k0BzK8yuDEZjAuWChCRfpf7VQejyDnfRiETCBXwhE8NhzX38whWcuRUCqp0Zp0mKa
	L25f0MOlGsw==
X-Received: from dlbqq13.prod.google.com ([2002:a05:7022:ed0d:b0:143:749c:77f6])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:21c7:b0:144:fd7c:84fe
 with SMTP id a92af1059eb24-146d0495501mr10205498c88.35.1790620004539; Mon, 28
 Sep 2026 11:26:44 -0700 (PDT)
Date: Mon, 28 Sep 2026 11:25:53 -0700
In-Reply-To: <20260928182605.3649015-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1790145937.git.irogers@google.com> <20260928182605.3649015-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928182605.3649015-15-irogers@google.com>
Subject: [PATCH v6 14/26] perf thread_map: Add thread_map__tgid()
From: Ian Rogers <irogers@google.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Aaron Tomlin <atomlin@atomlin.com>
Cc: Howard Chu <howardchu95@gmail.com>, Jakub Brnak <jbrnak@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

bpf-filter reads the tgid of each thread in a thread map from /proc, to
key its BPF map by process, and perf trace is about to do the same. Move
convert_to_tgid() to thread_map.c as thread_map__tgid(), taking the
thread map and index both users have.

While moving it, fix two bugs. Match Tgid: at the start of a line, as a
task can set its comm, shown on the Name: line before it, to contain
"Tgid: <n>". And check the character after the number before freeing the
buffer it points into, rather than after.

Fixes: eb1693b1150d ("perf bpf-filter: Split per-task filter use case")
Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/bpf-filter.c | 29 ++---------------------------
 tools/perf/util/thread_map.c | 26 ++++++++++++++++++++++++++
 tools/perf/util/thread_map.h |  1 +
 3 files changed, 29 insertions(+), 27 deletions(-)

diff --git a/tools/perf/util/bpf-filter.c b/tools/perf/util/bpf-filter.c
index bcd81084e342..72e83ac1d6a4 100644
--- a/tools/perf/util/bpf-filter.c
+++ b/tools/perf/util/bpf-filter.c
@@ -56,6 +56,7 @@
 #include "util/debug.h"
 #include "util/evsel.h"
 #include "util/target.h"
+#include "util/thread_map.h"
 #include "util/bpf-utils.h"
 
 #include "util/bpf-filter.h"
@@ -202,31 +203,6 @@ static int get_filter_entries(struct evsel *evsel, struct perf_bpf_filter_entry
 	return 0;
 }
 
-static int convert_to_tgid(int tid)
-{
-	char path[128];
-	char *buf, *p, *q;
-	int tgid;
-	size_t len;
-
-	scnprintf(path, sizeof(path), "%d/status", tid);
-	if (procfs__read_str(path, &buf, &len) < 0)
-		return -1;
-
-	p = strstr(buf, "Tgid:");
-	if (p == NULL) {
-		free(buf);
-		return -1;
-	}
-
-	tgid = strtol(p + 6, &q, 0);
-	free(buf);
-	if (*q != '\n')
-		return -1;
-
-	return tgid;
-}
-
 /*
  * The event might be closed already so we cannot get the list of ids using FD
  * like in create_event_hash() below, let's iterate the event_hash map and
@@ -407,14 +383,13 @@ static int create_idx_hash(struct evsel *evsel, struct perf_bpf_filter_entry *en
 	last = -1;
 	nr = perf_thread_map__nr(threads);
 	for (int i = 0; i < nr; i++) {
-		int pid = perf_thread_map__pid(threads, i);
 		int tgid;
 		struct idx_hash_key key = {
 			.evt_id = event_id,
 		};
 
 		/* it actually needs tgid, let's get tgid from /proc. */
-		tgid = convert_to_tgid(pid);
+		tgid = thread_map__tgid(threads, i);
 		if (tgid < 0) {
 			/* the thread may be dead, ignore. */
 			continue;
diff --git a/tools/perf/util/thread_map.c b/tools/perf/util/thread_map.c
index 48c70f149e92..918ab3180232 100644
--- a/tools/perf/util/thread_map.c
+++ b/tools/perf/util/thread_map.c
@@ -395,3 +395,29 @@ int thread_map__remove(struct perf_thread_map *threads, int idx)
 	threads->nr--;
 	return 0;
 }
+
+/* The tgid of the thread at idx, read from /proc, or -1 if it has exited. */
+pid_t thread_map__tgid(struct perf_thread_map *threads, int idx)
+{
+	char path[128];
+	char *buf, *p, *q;
+	pid_t tgid;
+	size_t len;
+
+	snprintf(path, sizeof(path), "%d/status", perf_thread_map__pid(threads, idx));
+	if (procfs__read_str(path, &buf, &len) < 0)
+		return -1;
+
+	/* From a line start, as the Name: line before it can contain "Tgid:". */
+	p = strstr(buf, "\nTgid:");
+	if (p == NULL) {
+		free(buf);
+		return -1;
+	}
+
+	tgid = strtol(p + 6, &q, 0);
+	if (*q != '\n')
+		tgid = -1;
+	free(buf);
+	return tgid;
+}
diff --git a/tools/perf/util/thread_map.h b/tools/perf/util/thread_map.h
index fc16d87f32fb..d700a22b7ae4 100644
--- a/tools/perf/util/thread_map.h
+++ b/tools/perf/util/thread_map.h
@@ -24,4 +24,5 @@ size_t thread_map__fprintf(struct perf_thread_map *threads, FILE *fp);
 void thread_map__read_comms(struct perf_thread_map *threads);
 bool thread_map__has(struct perf_thread_map *threads, pid_t pid);
 int thread_map__remove(struct perf_thread_map *threads, int idx);
+pid_t thread_map__tgid(struct perf_thread_map *threads, int idx);
 #endif	/* __PERF_THREAD_MAP_H */
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

