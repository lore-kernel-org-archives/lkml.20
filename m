Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D03397943
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790449497; cv=none; b=cVbXj0TvH/2OQt4/JFsdoGDgRjl8xDwqsva4fYODvZlrO2/37gpGdgv7FGOfyurze3afcrFq4OQUreKl82XC0nAK6bF04UTbt+IZpWIftY15eauMNN1/hR/BxGLrjLd0lkjTrcofL6yjWsvW/Nopq+MbWTQJaSdFkjnsZJNrISw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790449497; c=relaxed/simple;
	bh=8kGK6JKtj/1yVH2ESWgYN+gWMEcdBWD4HFyY/VkC7kk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WF8TgDZvy6icr8F13RmhHrQ7nkPlL+8ZGeSqc+9enUcdymG2AVtp3N4v95DzNJuvO73uk8pXTD7EdeXucNBnGjmFrkm5XE7L4LJLrRwPJ5uXFd+hcnuyY8+P3pTMgZ74NXUH7HI4f22VsjRfah0aFw8W9Z1vqELvhfjvI6Nxja4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MRLov1eY; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MRLov1eY"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b24c3so1109192f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 12:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790449494; x=1791054294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SNkPoBEsX8RuDQAeI6lrXEN/oS+MWd5V4w+FvgpiyOs=;
        b=MRLov1eYxaRkTs+pLw5aZehZBMIe/qbJvUUDM8QSw1N8Kxnztr6sLR2L3NuXjCIS+T
         4kU1rBFA22VABR8DtdKa8YoJ3hVyHlLzRiHuYbvO3XVa4wIHKWumlmLDiKQrztfJLL14
         y1871VQCCpAME1gMmVSyWkVuYgsFm6XGvaeoQqfgWJXDhX6ch4MZ+m8avGvId88UViB6
         7c1xvrJ41RSDrTKrtDVvmj8srOvQ9PcI7B91d93MHKUmWCCs13ctYgAHbBgRk13Rbqvr
         Bp7UfLT2SLRg3WN2w+2k6la1ia95bzEWDhMwpseCYd8wD1KSfMTJpfOPQZjsL4jgFOLp
         qirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790449494; x=1791054294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SNkPoBEsX8RuDQAeI6lrXEN/oS+MWd5V4w+FvgpiyOs=;
        b=iX3uvESb58aGJ6I55JRofcuZ6Su7VCEVx46zJM8NdZlwUSFQeNCIyBcFpEUYyqfKmo
         9jGyS79ikPCaaw2VMC7/aeHVjcKH0hYLU9d+GTaMTDlUyjTjMedQPtYFRL9xwvs6+0E2
         x9cbEqngsG4URWqR0ddaeGOz98wtrI9tvE05Pf3PkP6hDs/XQV1qIJQ1YIk/cdPR303I
         aTRYOJlcuDCiVSbqIEN+8+oPb2I1+LuDSZFu42RChuKbOdEgErHMkmrl0OlnZm1dYSsa
         BrLGwAAcNTNlxiDB5e2D8x1LLeHznXahjphSyOHii8+6MXTPzrIOTvODsnFMr37fsIxT
         IOVQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4pOS6mfLfvfIQED3jizA3058eoNAp0pQYdJ9tJW0Sp/FQ+Yo8jc5rIuqgSveWLJ1dcjODfLNP4jO1L8I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJl/uIdYZokfJFwhXqGYMDhsfszF0Kzh8IAhGyc2OJacI/Ok9XS
	bjRLBsdSHnC61LZ6MRSHvMypjYBCJuW4pkrPgAh8lSvTnxb7MBgM2WD6
X-Gm-Gg: AYBFou0ZvWnk/q+GDlb3gMYLF9zJfHHmoaZbkQZ4gNGGklwqIKmBI/f6Qufysj+C5kk
	7O3YkHxeb6x1UK1lXG+r48rSAgI9Bcw+Cu4BUXKBQ+3Cf0CWYdhZhBi2vbL6M5vGOS5+r1DrvjI
	risW0E7As/fxegUUuZ8lptH9qFRR7mj9PbrkAH1HkUCvXu7SnlU35SPr9RtbTEisGiaHJABMC4J
	MWVX7u4zjNRhn/eneXkpQY5RbDSMgjdD4D+1TTyENEFJLnuuNCqJtq0rmF9hdQJgBxfeC3+goqI
	apieMIF0Hy3nZuGim44/V7L7efsHUxk3gbby7m6z2CAkG8U0PHgX0P3ImYtRuH0jiV8KII+s1TP
	6Rr/JZ7tWqIwqPaQh9Hu6LlrHe7YNwFOlZaFRtA5j87cXNfn5Cn2/gHukb0wHEGmwqsruEWo5es
	tP6EQs8RTzgAyJYDn3JAOf4VIa6Vll6MECGY6p7hSlFd47IklvwabyNSrvk6LKYEXPwxPOtlnDE
	6U2MoZd1cw6zIpKSvMXZNZyo2b+W9YfZwP1cJoQ15hbsOjV8JAf8joJVOJ1b/+jRq9U0vZi52al
	5RyGuRKpK3H9hNtFMrvEhMVKaWdEsnLyqNRRhX2kd5NYm3MrfZg=
X-Received: by 2002:a05:6000:40dd:b0:488:8109:fe01 with SMTP id ffacd0b85a97d-488810a006bmr10533775f8f.46.1790449493765;
        Sat, 26 Sep 2026 12:04:53 -0700 (PDT)
Received: from mikebook.tail5724d6.ts.net (83-244-142-114.cust-83.exponential-e.net. [83.244.142.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a638sm15216880f8f.9.2026.09.26.12.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 12:04:53 -0700 (PDT)
From: Michal Pluta <michalpl2003@gmail.com>
To: acme@kernel.org,
	namhyung@kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH 3/8] perf bench futex: Use the whole timeval for elapsed times
Date: Sat, 26 Sep 2026 20:04:02 +0100
Message-ID: <20260926190407.1106421-4-michalpl2003@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260926190407.1106421-1-michalpl2003@gmail.com>
References: <20260926190407.1106421-1-michalpl2003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several futex benchmarks read only one field of the struct timeval that
timersub() produces, so part of the elapsed time is lost.

'futex wake', 'futex wake-parallel' and 'futex requeue' print tv_usec,
so a run that takes 1.5 s is shown as 500 ms. 'futex hash' and 'futex
lock-pi' divide their operation count by tv_sec, which overstates the
throughput when a run is stopped early, and gives 0 if that happens
within the first second. Their "total secs" is truncated in the same
way.

Use the whole timeval and print "total secs" with two decimals. With
--runtime=0 the rate is now computed over the time that actually
elapsed, instead of showing 0.

Fixes: 27db78307481 ("perf bench: Add futex-wake microbenchmark")
Fixes: 0fb298cf95c0 ("perf bench: Add futex-requeue microbenchmark")
Fixes: a043971141f1 ("perf bench: Add futex-hash microbenchmark")
Fixes: d2f3f5d2e9ca ("perf bench futex: Add lock_pi stresser")
Fixes: d65817b4e707 ("perf bench futex: Support parallel waker threads")
Assisted-by: LLM
Signed-off-by: Michal Pluta <michalpl2003@gmail.com>
---
 tools/perf/bench/futex-hash.c          | 12 ++++++++----
 tools/perf/bench/futex-lock-pi.c       | 12 ++++++++----
 tools/perf/bench/futex-requeue.c       |  8 +++++---
 tools/perf/bench/futex-wake-parallel.c |  8 ++++++--
 tools/perf/bench/futex-wake.c          |  6 ++++--
 5 files changed, 31 insertions(+), 15 deletions(-)

diff --git a/tools/perf/bench/futex-hash.c b/tools/perf/bench/futex-hash.c
index 7e29f04da744..32b88df8ee6d 100644
--- a/tools/perf/bench/futex-hash.c
+++ b/tools/perf/bench/futex-hash.c
@@ -18,6 +18,7 @@
 #include <stdlib.h>
 #include <linux/compiler.h>
 #include <linux/kernel.h>
+#include <linux/time64.h>
 #include <linux/zalloc.h>
 #include <sys/time.h>
 #include <sys/mman.h>
@@ -118,18 +119,19 @@ static void print_summary(void)
 	unsigned long avg = avg_stats(&throughput_stats);
 	double stddev = stddev_stats(&throughput_stats);
 
-	printf("%sAveraged %ld operations/sec (+- %.2f%%), total secs = %d\n",
+	printf("%sAveraged %ld operations/sec (+- %.2f%%), total secs = %.2f\n",
 	       !params.silent ? "\n" : "", avg, rel_stddev_stats(stddev, avg),
-	       (int)bench__runtime.tv_sec);
+	       bench__runtime.tv_sec + bench__runtime.tv_usec / (double)USEC_PER_SEC);
 	futex_print_nbuckets(&params);
 }
 
 int bench_futex_hash(int argc, const char **argv)
 {
 	int ret = 0;
 	cpu_set_t *cpuset;
 	struct sigaction act;
 	unsigned int i;
+	u64 runtime_us;
 	pthread_attr_t thread_attr;
 	struct worker *worker = NULL;
 	struct perf_cpu_map *cpu;
@@ -229,9 +231,11 @@ int bench_futex_hash(int argc, const char **argv)
 	cond_destroy(&thread_worker);
 	mutex_destroy(&thread_lock);
 
+	runtime_us = (u64)bench__runtime.tv_sec * USEC_PER_SEC + bench__runtime.tv_usec;
+
 	for (i = 0; i < params.nthreads; i++) {
-		unsigned long t = bench__runtime.tv_sec > 0 ?
-			worker[i].ops / bench__runtime.tv_sec : 0;
+		unsigned long t = runtime_us ?
+			(u64)worker[i].ops * USEC_PER_SEC / runtime_us : 0;
 		update_stats(&throughput_stats, t);
 		if (!params.silent) {
 			if (params.nfutexes == 1)
diff --git a/tools/perf/bench/futex-lock-pi.c b/tools/perf/bench/futex-lock-pi.c
index 40640b674427..7190f5102e09 100644
--- a/tools/perf/bench/futex-lock-pi.c
+++ b/tools/perf/bench/futex-lock-pi.c
@@ -13,6 +13,7 @@
 #include <subcmd/parse-options.h>
 #include <linux/compiler.h>
 #include <linux/kernel.h>
+#include <linux/time64.h>
 #include <linux/zalloc.h>
 #include <errno.h>
 #include <perf/cpumap.h>
@@ -66,9 +67,9 @@ static void print_summary(void)
 	unsigned long avg = avg_stats(&throughput_stats);
 	double stddev = stddev_stats(&throughput_stats);
 
-	printf("%sAveraged %ld operations/sec (+- %.2f%%), total secs = %d\n",
+	printf("%sAveraged %ld operations/sec (+- %.2f%%), total secs = %.2f\n",
 	       !params.silent ? "\n" : "", avg, rel_stddev_stats(stddev, avg),
-	       (int)bench__runtime.tv_sec);
+	       bench__runtime.tv_sec + bench__runtime.tv_usec / (double)USEC_PER_SEC);
 	futex_print_nbuckets(&params);
 }
 
@@ -168,6 +169,7 @@ int bench_futex_lock_pi(int argc, const char **argv)
 {
 	int ret = 0;
 	unsigned int i;
+	u64 runtime_us;
 	struct sigaction act;
 	struct perf_cpu_map *cpu;
 
@@ -233,9 +235,11 @@ int bench_futex_lock_pi(int argc, const char **argv)
 	cond_destroy(&thread_worker);
 	mutex_destroy(&thread_lock);
 
+	runtime_us = (u64)bench__runtime.tv_sec * USEC_PER_SEC + bench__runtime.tv_usec;
+
 	for (i = 0; i < params.nthreads; i++) {
-		unsigned long t = bench__runtime.tv_sec > 0 ?
-			worker[i].ops / bench__runtime.tv_sec : 0;
+		unsigned long t = runtime_us ?
+			(u64)worker[i].ops * USEC_PER_SEC / runtime_us : 0;
 
 		update_stats(&throughput_stats, t);
 		if (!params.silent)
diff --git a/tools/perf/bench/futex-requeue.c b/tools/perf/bench/futex-requeue.c
index 0748b0fd689e..5d4708f40c60 100644
--- a/tools/perf/bench/futex-requeue.c
+++ b/tools/perf/bench/futex-requeue.c
@@ -223,6 +223,7 @@ int bench_futex_requeue(int argc, const char **argv)
 	for (j = 0; j < bench_repeat && !done; j++) {
 		unsigned int nrequeued = 0, wakeups = 0;
 		struct timeval start, end, runtime;
+		u64 runtime_us;
 
 		/* create, launch & block all threads */
 		block_threads(worker, cpu);
@@ -267,23 +268,24 @@ int bench_futex_requeue(int argc, const char **argv)
 
 		gettimeofday(&end, NULL);
 		timersub(&end, &start, &runtime);
+		runtime_us = (u64)runtime.tv_sec * USEC_PER_SEC + runtime.tv_usec;
 
 		update_stats(&requeued_stats, nrequeued);
-		update_stats(&requeuetime_stats, runtime.tv_usec);
+		update_stats(&requeuetime_stats, runtime_us);
 
 		if (!params.silent) {
 			if (!params.pi)
 				printf("[Run %d]: Requeued %d of %d threads in "
 				       "%.4f ms\n", j + 1, nrequeued,
 				       params.nthreads,
-				       runtime.tv_usec / (double)USEC_PER_MSEC);
+				       runtime_us / (double)USEC_PER_MSEC);
 			else {
 				nrequeued -= wakeups;
 				printf("[Run %d]: Awoke and Requeued (%d+%d) of "
 				       "%d threads in %.4f ms\n",
 				       j + 1, wakeups, nrequeued,
 				       params.nthreads,
-				       runtime.tv_usec / (double)USEC_PER_MSEC);
+				       runtime_us / (double)USEC_PER_MSEC);
 			}
 
 		}
diff --git a/tools/perf/bench/futex-wake-parallel.c b/tools/perf/bench/futex-wake-parallel.c
index a089d8ee4b02..fa70b7d4b473 100644
--- a/tools/perf/bench/futex-wake-parallel.c
+++ b/tools/perf/bench/futex-wake-parallel.c
@@ -192,7 +192,9 @@ static void print_run(struct thread_data *waking_worker, unsigned int run_num)
 	init_stats(&__waketime_stats);
 
 	for (i = 0; i < params.nwakes; i++) {
-		update_stats(&__waketime_stats, waking_worker[i].runtime.tv_usec);
+		update_stats(&__waketime_stats,
+			     (u64)waking_worker[i].runtime.tv_sec * USEC_PER_SEC +
+			     waking_worker[i].runtime.tv_usec);
 		update_stats(&__wakeup_stats, waking_worker[i].nwoken);
 	}
 
@@ -229,7 +231,9 @@ static void do_run_stats(struct thread_data *waking_worker)
 	unsigned int i;
 
 	for (i = 0; i < params.nwakes; i++) {
-		update_stats(&waketime_stats, waking_worker[i].runtime.tv_usec);
+		update_stats(&waketime_stats,
+			     (u64)waking_worker[i].runtime.tv_sec * USEC_PER_SEC +
+			     waking_worker[i].runtime.tv_usec);
 		update_stats(&wakeup_stats, waking_worker[i].nwoken);
 	}
 
diff --git a/tools/perf/bench/futex-wake.c b/tools/perf/bench/futex-wake.c
index 58427bb55c03..12a75be077a0 100644
--- a/tools/perf/bench/futex-wake.c
+++ b/tools/perf/bench/futex-wake.c
@@ -191,6 +191,7 @@ int bench_futex_wake(int argc, const char **argv)
 	for (j = 0; j < bench_repeat && !done; j++) {
 		unsigned int nwoken = 0;
 		struct timeval start, end, runtime;
+		u64 runtime_us;
 
 		/* create, launch & block all threads */
 		block_threads(worker, cpu);
@@ -211,14 +212,15 @@ int bench_futex_wake(int argc, const char **argv)
 					     params.nwakes, futex_flag);
 		gettimeofday(&end, NULL);
 		timersub(&end, &start, &runtime);
+		runtime_us = (u64)runtime.tv_sec * USEC_PER_SEC + runtime.tv_usec;
 
 		update_stats(&wakeup_stats, nwoken);
-		update_stats(&waketime_stats, runtime.tv_usec);
+		update_stats(&waketime_stats, runtime_us);
 
 		if (!params.silent) {
 			printf("[Run %d]: Wokeup %d of %d threads in %.4f ms\n",
 			       j + 1, nwoken, params.nthreads,
-			       runtime.tv_usec / (double)USEC_PER_MSEC);
+			       runtime_us / (double)USEC_PER_MSEC);
 		}
 
 		for (i = 0; i < params.nthreads; i++) {
-- 
2.43.0

