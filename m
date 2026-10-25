Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792965064;
	b=3eFyuXwfHIuycLYvQvhJ9HBcb3KvtyBk75/faCqk0y54GsVc1xukgl4LIS3XAZWTKaLh
	 vAuEharhhEWW5wm+jOo5r+lZE9w66VWhQeMPuKTB6oHBQZh4fXlgaau6g3ejuqCORFkCd
	 N1BHaAAIrSOAChqcTNtOnDBnKMSthM8WI9rEhaNJRH10uCIq+IcD4PIze8aBuERwWRCy2
	 PUYACdd/SkNqBIcx5vZ6zKOXIk/Gp+/AdprQVnSspqutBAg2opyvUbtKzmX1hWIqJj3yu
	 kF7B+nLMiqSu2gyxTM0JQp3Xvp9Q8IZ27OEfW7Rd12V2u/foGpwMyycbz1EWh7F4bNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792965064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Content-Type;
	bh=6mBEu8QdPj4ooVI6HvdpOOBqaqB/w+5Tqv00IVdAX5w=;
	b=iMH+HRNOleYUrkfz1+uirilVNcL4bdLavumY/LgmkqMnYUhUrW5k8i8fRFsoob+m9v/w
	 EtENJxHN8LhPIZ8mu21UtPJTmKr3fxVX5bkq02sH9LlIuotEWUVB6x/5hI+CCHsEwEjyS
	 d+1ILiWTWzGP8bLD3+1br8XAGGg2JRiTCQRdUWqWfb9weEZmFgpk8zG4PbmJVre7Nwlug
	 L1op9ZTEthBO7H1fHbHnL8g3RdXDg5nLk/DbDrUUdsq8Uo9v/VJZrTeYzKSlZc8Wmtx4Y
	 uzW/B2bLTh/Ss/QGUKvJZ8i8o0K6A1XHEaPpABGKfoFgxwltiArPETtD0tEySolgNvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Pl8n5Bl+;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B920606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 21:51:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B920606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Pl8n5Bl+
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3580c07911eso8023694eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 14:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792965063; x=1793569863; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:mime-version:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6mBEu8QdPj4ooVI6HvdpOOBqaqB/w+5Tqv00IVdAX5w=;
        b=Pl8n5Bl+F15yh5lVoMpCegJwJSkZH3E1vsxK51rRk5hYpCl/PiNAEh2xtHCfCn89/b
         b7C3/H/05YQ6KGbRcPj3m+09eVyv5zkUFRpRg1f9HT1ywifYfz18D4q+EcLy6EBPkMJZ
         1x33zkGplXdFIJTSBrZ1zDfKFWb/InT8pvXTizCxOSgSwDdV+RI+LqIbFnJ1vJ4tVCJV
         t1nFjl6B+GoRlO0V4D1LRQwOF6Oqx8pE8vugy1LvP7LnZMULnJ1hKzRkU+29ANM4uGs5
         k3CqrKt9tWjLxw/hNGkWNnVEj/Y7raYc3KF7QQWWwTkyvBQEFYfG9SyYtH3HKzi02HaG
         EkrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792965063; x=1793569863;
        h=content-type:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6mBEu8QdPj4ooVI6HvdpOOBqaqB/w+5Tqv00IVdAX5w=;
        b=nDDpc4xUztIYMFoJ8YH8fAwkKRpCsTkYWILZLRlltDJT6462M1zru+MbszdWc5epzx
         YmJVfRwz0J/FaT5Vo7MmuOO309tQOJdXCgjwJQjMmlSHNZXSu+pOGp2SbG+4ZggzbDZ3
         6O5DVqwJf0003m/mI0qYyNQRloHIUMS1u88kzStNOPy0QO3OjV1+nI82N1ivsSXb4JD8
         rRe32Qjc+CEJBRIWa66y/uvjWgEbj7W+azmRDotV+//IfScwIREkXTvoqL+zVbtlFEo/
         140CH0o74AaVY4g9wK2E5FYPGKTQSKwiEhMfuRSMMJ5ofkC6Ig/zORGxU0ZC0/PzfPMV
         GOPg==
X-Forwarded-Encrypted: i=1; AKwUvBxyR95XBlVdyEhPHecP6vnMSFgCzhv6T2PqYEB5Jfc0wxNvLedXpm/k/HNaAaLbW7UxX1IpTYJ9Bz1T6PY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIukey4i8pCArSfXgWpCm6NclEcf+RmyoE3dwFNKCORbFt6Ulo
	F6CuPFQobqRuDgz8yWZxk/zYApMHqQ7aRza3KQnPgVu6XXqs8wk8hQLt2QCGx9gHzS4kOYFaHCr
	t2q8NEKUxrQ==
X-Received: from dycui22.prod.google.com ([2002:a05:693c:6016:b0:369:f67f:7a43])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:87c8:20b0:365:f73b:510b
 with SMTP id 5a478bee46e88-369e84818cemr7217715eec.13.1792965062646; Sun, 25
 Oct 2026 14:51:02 -0700 (PDT)
Date: Sun, 25 Oct 2026 14:50:56 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261025215056.1228120-1-irogers@google.com>
Subject: [PATCH v1] perf test switch-tracking: Fix hybrid cpu-cycles and spin timing
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On hybrid systems, parse_event(evlist, "cpu-cycles:u") creates multiple
evsels (e.g. cpu_atom/cpu-cycles/ and cpu_core/cpu-cycles/), but
test__switch_tracking() only configured, enabled/disabled, and checked
evlist__last(evlist). If the test process ran on another core PMU during
one of the spin phases, the tracked evsel recorded no samples and the
test failed with 'Missing cycles events'. Additionally, the other core
PMU evsels did not have PERF_SAMPLE_TIME set, which add_event() missed
because __evsel__parse_sample() initializes sample.time to -1ULL rather
than 0.

Use evsel__match(evsel, HARDWARE, HW_CPU_CYCLES) to configure,
enable/disable, and check all cycles evsels created by parse_event(),
check for sample.time == -1ULL in add_event(), and use
CLOCK_THREAD_CPUTIME_ID in spin_sleep() so preemption under load does
not finish the 50ms spin without on-CPU cycles.

Fixes: 94f9eb95d954 ("perf pmus: Remove perf_pmus__has_hybrid")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/switch-tracking.c | 57 +++++++++++++++++-------------
 1 file changed, 32 insertions(+), 25 deletions(-)

diff --git a/tools/perf/tests/switch-tracking.c b/tools/perf/tests/switch-tracking.c
index 73568c782d72..ff98f5483e7e 100644
--- a/tools/perf/tests/switch-tracking.c
+++ b/tools/perf/tests/switch-tracking.c
@@ -24,28 +24,26 @@
 
 static int spin_sleep(void)
 {
-	struct timeval start, now, diff, maxtime;
-	struct timespec ts;
+	struct timespec start, now, ts;
+	u64 elapsed_ns;
 	int err, i;
 
-	maxtime.tv_sec = 0;
-	maxtime.tv_usec = 50000;
-
-	err = gettimeofday(&start, NULL);
+	err = clock_gettime(CLOCK_THREAD_CPUTIME_ID, &start);
 	if (err)
 		return err;
 
-	/* Spin for 50ms */
+	/* Spin for 50ms of thread CPU time */
 	while (1) {
 		for (i = 0; i < 1000; i++)
 			barrier();
 
-		err = gettimeofday(&now, NULL);
+		err = clock_gettime(CLOCK_THREAD_CPUTIME_ID, &now);
 		if (err)
 			return err;
 
-		timersub(&now, &start, &diff);
-		if (timercmp(&diff, &maxtime, > /* For checkpatch */))
+		elapsed_ns = (now.tv_sec - start.tv_sec) * 1000000000ULL +
+			     now.tv_nsec - start.tv_nsec;
+		if (elapsed_ns > 50000000ULL)
 			break;
 	}
 
@@ -62,7 +60,6 @@ static int spin_sleep(void)
 
 struct switch_tracking {
 	struct evsel *switch_evsel;
-	struct evsel *cycles_evsel;
 	pid_t *tids;
 	int nr_tids;
 	int comm_seen[4];
@@ -164,7 +161,7 @@ static int process_sample_event(struct evlist *evlist,
 		switch_tracking->tids[cpu] = next_tid;
 	}
 
-	if (evsel == switch_tracking->cycles_evsel) {
+	if (evsel && evsel__match(evsel, HARDWARE, HW_CPU_CYCLES)) {
 		pr_debug3("cycles event\n");
 		if (!switch_tracking->comm_seen[0])
 			switch_tracking->cycles_before_comm_1 = 1;
@@ -241,7 +238,7 @@ static int add_event(struct evlist *evlist, struct list_head *events,
 		return -1;
 	}
 
-	if (!sample.time) {
+	if (!sample.time || sample.time == -1ULL) {
 		pr_debug("event with no time\n");
 		perf_sample__exit(&sample);
 		return -1;
@@ -394,6 +391,12 @@ static int test__switch_tracking(struct test_suite *test __maybe_unused, int sub
 	}
 
 	cycles_evsel = evlist__last(evlist);
+	evlist__for_each_entry(evlist, evsel) {
+		if (evsel__match(evsel, HARDWARE, HW_CPU_CYCLES)) {
+			evsel__set_sample_bit(evsel, CPU);
+			evsel__set_sample_bit(evsel, TIME);
+		}
+	}
 
 	/* Third event */
 	if (!evlist__can_select_event(evlist, sched_switch)) {
@@ -422,9 +425,6 @@ static int test__switch_tracking(struct test_suite *test __maybe_unused, int sub
 		goto out_err;
 	}
 
-	evsel__set_sample_bit(cycles_evsel, CPU);
-	evsel__set_sample_bit(cycles_evsel, TIME);
-
 	/* Fourth event */
 	err = parse_event(evlist, "dummy:u");
 	if (err) {
@@ -499,10 +499,14 @@ static int test__switch_tracking(struct test_suite *test __maybe_unused, int sub
 		goto out_err;
 	}
 
-	err = evsel__disable(cycles_evsel);
-	if (err) {
-		pr_debug("perf_evlist__disable_event failed!\n");
-		goto out_err;
+	evlist__for_each_entry(evlist, evsel) {
+		if (!evsel__match(evsel, HARDWARE, HW_CPU_CYCLES))
+			continue;
+		err = evsel__disable(evsel);
+		if (err) {
+			pr_debug("perf_evlist__disable_event failed!\n");
+			goto out_err;
+		}
 	}
 
 	comm = "Test COMM 2";
@@ -525,10 +529,14 @@ static int test__switch_tracking(struct test_suite *test __maybe_unused, int sub
 		goto out_err;
 	}
 
-	err = evsel__enable(cycles_evsel);
-	if (err) {
-		pr_debug("perf_evlist__disable_event failed!\n");
-		goto out_err;
+	evlist__for_each_entry(evlist, evsel) {
+		if (!evsel__match(evsel, HARDWARE, HW_CPU_CYCLES))
+			continue;
+		err = evsel__enable(evsel);
+		if (err) {
+			pr_debug("perf_evlist__enable_event failed!\n");
+			goto out_err;
+		}
 	}
 
 	comm = "Test COMM 4";
@@ -547,7 +555,6 @@ static int test__switch_tracking(struct test_suite *test __maybe_unused, int sub
 	evlist__disable(evlist);
 
 	switch_tracking.switch_evsel = switch_evsel;
-	switch_tracking.cycles_evsel = cycles_evsel;
 
 	err = process_events(evlist, &switch_tracking);
 
-- 
2.56.0.307.g5fe7bd680c-goog

