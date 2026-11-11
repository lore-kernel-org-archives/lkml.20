Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418975;
	b=ccIIxcZ9sLggoQtNZ/6YIBPCDxKA6po7bRYr7g2wu4z2eY1Boapdk2G+AKVv21hfeRbI
	 rOqmIbiNsOWCj+qnIMNHyBNpvMVLUwDtIKA4rV8XtGDhYk2M/zX71SG5UZmGtMLYXhCyB
	 uw4Iy8y45PyI+Ar/XWT4FoKeJgQG3DPWOr/m9RpmHrEdIrZmTVrrQIVqS8kNZSQ+8F1ch
	 XTzvWgKDtxIZy7Q1f44LQl8QQHcYIueEft2Slo3icOyBXtSOLgw0HM5TnFE0Lb0+BTzXT
	 GJN7YO3hH8XlLExvgx7caKSy3cIk8ZnWhNNiP4uW+pmanQGaX+R6K7ABGNcyS8yR9bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418975;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=4sjeCIsRPz3V4XGLLjkTSyL6dtqRLkJ3hYZhD/uJb7U=;
	b=nqvS6z5pr3tJqUgo5rtTq0XtkwMuGns1FtKwfAbS5rnM2voZ/EifUGAeNT0IxmNzJMqP
	 C1YrAlPMVSqmqT2HKn5Ni+8wwfPNdim3gBrJ+FS1QqA1ok9aZhxA4o5czkZ5dtDQxH9J4
	 XuXcU/p3PKOa5RwlkFNG0kNBwvuDS67WKtVECynD4g0G93t1cJ5pfiCP4O7W+vYoHsGj1
	 HqFeEESMDMldr+kj5u560SWpC7ecfYdvOKRqSfgmB6Nq9Mo7Ot4N10cgmJRsc/W7lxIfN
	 82z8mhr9t7X0dEVvkUvygFDg/Qsd9EaroLTN13pHZRnjbVoBxJQ9rOyCKCFzpPX6QxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mFHHdU78;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF04E60A6F70
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:42:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF04E60A6F70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mFHHdU78
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-370230d93efso2076952eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794418974; x=1795023774; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4sjeCIsRPz3V4XGLLjkTSyL6dtqRLkJ3hYZhD/uJb7U=;
        b=mFHHdU780wJS2pdEWcJrTFFBCf1Bv2BriVzwBvqqnwgfPMGIeKbNZ7tQPPqeHHkhd+
         4g1nfSo8ivGFzgyQx3Y7Jqby5tmrpU7jHe1y+i/VJgDDj32UaGIoutzvoJak8GwtuIko
         eS0laYoOIzp+HpAoj0/msg2yIjhThCknj4dch3hKNDzRVn6tb6DMfIU6+jmKdryJixk4
         DTsDKa0Tqw4iHtcZYq7BHVTljoLfSo/7vaek//jrGhCTijhdyTDicf4bl3/l+0I3lnc0
         C/kz9GOcUcS1RRr4X5R4IiF/SQYLZCdbO+fIxaY+Aga44g8GJFB829O54zvZ6aElwXmG
         HVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418974; x=1795023774;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4sjeCIsRPz3V4XGLLjkTSyL6dtqRLkJ3hYZhD/uJb7U=;
        b=rRZ9K+f9Drp2YlSgvBtRyHdTm8y2T2y2uWTSc0LUK4blkYILc157GFTwrPMjNJE5I3
         dTQcX5UbhlBGt8EFj8cQHy8qZiN31YaxOyRyDB/GHn5In5HLy57i7yDMdvzSo9RByX66
         KY24eZ7+QNlmsbmo5kgSxANDaYJSbCTekwLsPxxilkht+yH66zHDj/rkfGr9EUZIir4f
         yG9iMwNLDL3c2rSZRQxnktr6HeR9TXCQmCxNRmGBcW/eD7M8yBvVvA6ZO7EABQVlBFcC
         sb2ZdFhRYGGQK5zZt7s2hAQhloJ6GapbKVjM8GWUNraTrjOWeFdPLkL/GmXgD8wzY67U
         6a1g==
X-Forwarded-Encrypted: i=1; AL+hErGF6sppJB6qic1uIduOxo0u2Rvys9vRHjraT5yrK2OG+nuogLDQ9FlyMfiKl4kyu/wFOxYqUPWKm+Enwbg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pGDF8n7v5SkIT6on7hhFkGg4/qQv+nuWqDIIAA3krd73KYwhD
	k18r+NfNSDXaAvHozHvs9U/RlkOU7DNuKJd5ZVb8p5xR7pLoVme0g1HaJ7BhoO4qusGH0SOUX4T
	XACA/fIRvhg==
X-Received: from dybry3.prod.google.com ([2002:a05:7301:4d03:b0:35a:c4b6:314b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:f28a:b0:36e:a11a:b2f1
 with SMTP id 5a478bee46e88-37686464a66mr3740693eec.30.1794418973644; Wed, 11
 Nov 2026 09:42:53 -0800 (PST)
Date: Wed, 11 Nov 2026 09:42:08 -0800
In-Reply-To: <20261111174213.3526604-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111174213.3526604-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261111174213.3526604-17-irogers@google.com>
Subject: [PATCH v12 16/20] perf intel-tpebs: Use DEFINE_MUTEX for tpebs_mtx
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Replace tpebs_mtx_get() and its pthread_once() initialization helper
tpebs_init() with DEFINE_MUTEX(tpebs_mtx) and static initializers for
control_fd and ack_fd.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/intel-tpebs.c | 91 +++++++++++++++--------------------
 1 file changed, 38 insertions(+), 53 deletions(-)

diff --git a/tools/perf/util/intel-tpebs.c b/tools/perf/util/intel-tpebs.c
index 5cb090b27fbd..2edd8297fa1b 100644
--- a/tools/perf/util/intel-tpebs.c
+++ b/tools/perf/util/intel-tpebs.c
@@ -38,12 +38,12 @@
 
 bool tpebs_recording;
 enum tpebs_mode tpebs_mode;
+static DEFINE_MUTEX(tpebs_mtx);
 static LIST_HEAD(tpebs_results);
 static pthread_t tpebs_reader_thread;
 static struct child_process tpebs_cmd;
-static int control_fd[2], ack_fd[2];
-static struct mutex tpebs_mtx;
 static struct cond tpebs_cmd_cond = { .cond = PTHREAD_COND_INITIALIZER };
+static int control_fd[2] = { -1, -1 }, ack_fd[2] = { -1, -1 };
 static bool tpebs_stopping;
 static bool tpebs_enabled;
 static bool tpebs_cmd_in_flight;
@@ -63,23 +63,8 @@ struct tpebs_retire_lat {
 	bool started;
 };
 
-static void tpebs_init(void)
-{
-	mutex_init(&tpebs_mtx);
-	control_fd[0] = control_fd[1] = -1;
-	ack_fd[0] = ack_fd[1] = -1;
-}
-
-static struct mutex *tpebs_mtx_get(void)
-{
-	static pthread_once_t tpebs_once = PTHREAD_ONCE_INIT;
-
-	pthread_once(&tpebs_once, tpebs_init);
-	return &tpebs_mtx;
-}
-
 static struct tpebs_retire_lat *tpebs_retire_lat__find(struct evsel *evsel)
-	__must_hold(tpebs_mtx_get());
+	__must_hold(&tpebs_mtx);
 
 static int evsel__tpebs_start_perf_record(struct evsel *evsel)
 {
@@ -209,19 +194,19 @@ static int process_sample_event(const struct perf_tool *tool __maybe_unused,
 {
 	struct tpebs_retire_lat *t;
 
-	mutex_lock(tpebs_mtx_get());
+	mutex_lock(&tpebs_mtx);
 	if (tpebs_stopping || tpebs_cmd.pid == 0) {
 		/* Record is stopping or has terminated. */
-		mutex_unlock(tpebs_mtx_get());
+		mutex_unlock(&tpebs_mtx);
 		return 0;
 	}
 	t = tpebs_retire_lat__find(sample->evsel);
 	if (!t) {
-		mutex_unlock(tpebs_mtx_get());
+		mutex_unlock(&tpebs_mtx);
 		return -EINVAL;
 	}
 	if (should_ignore_sample(sample, t)) {
-		mutex_unlock(tpebs_mtx_get());
+		mutex_unlock(&tpebs_mtx);
 		return 0;
 	}
 	/*
@@ -231,7 +216,7 @@ static int process_sample_event(const struct perf_tool *tool __maybe_unused,
 	 */
 	t->last = sample->weight3;
 	update_stats(&t->stats, sample->weight3);
-	mutex_unlock(tpebs_mtx_get());
+	mutex_unlock(&tpebs_mtx);
 	return 0;
 }
 
@@ -261,7 +246,7 @@ static void *__sample_reader(void *arg)
 	return NULL;
 }
 
-static int tpebs_send_record_cmd(const char *msg) __must_hold(tpebs_mtx_get())
+static int tpebs_send_record_cmd(const char *msg) __must_hold(&tpebs_mtx)
 {
 	struct pollfd pollfd = { .events = POLLIN, };
 	bool is_stop = !strcmp(msg, EVLIST_CTL_CMD_STOP_TAG);
@@ -272,7 +257,7 @@ static int tpebs_send_record_cmd(const char *msg) __must_hold(tpebs_mtx_get())
 	while (tpebs_cmd_in_flight) {
 		if (!is_stop && tpebs_stopping)
 			return -EBUSY;
-		cond_wait(&tpebs_cmd_cond, tpebs_mtx_get());
+		cond_wait(&tpebs_cmd_cond, &tpebs_mtx);
 	}
 	if (!is_stop && tpebs_stopping)
 		return -EBUSY;
@@ -289,7 +274,7 @@ static int tpebs_send_record_cmd(const char *msg) __must_hold(tpebs_mtx_get())
 	 * Let go of the lock while sending/receiving as blocking can starve the
 	 * sample reading thread.
 	 */
-	mutex_unlock(tpebs_mtx_get());
+	mutex_unlock(&tpebs_mtx);
 
 	/* Send perf record command. */
 	len = scnprintf(cmd_buf, sizeof(cmd_buf), "%s\n", msg);
@@ -317,10 +302,10 @@ static int tpebs_send_record_cmd(const char *msg) __must_hold(tpebs_mtx_get())
 	if (!poll(&pollfd, 1, 500)) {
 		bool stopping, finished;
 
-		mutex_lock(tpebs_mtx_get());
+		mutex_lock(&tpebs_mtx);
 		stopping = tpebs_stopping;
 		finished = !stopping && check_if_command_finished(&tpebs_cmd);
-		mutex_unlock(tpebs_mtx_get());
+		mutex_unlock(&tpebs_mtx);
 		if (stopping) {
 			ret = -EBUSY;
 			goto out;
@@ -340,10 +325,10 @@ static int tpebs_send_record_cmd(const char *msg) __must_hold(tpebs_mtx_get())
 	if (!(pollfd.revents & POLLIN)) {
 		bool stopping, finished;
 
-		mutex_lock(tpebs_mtx_get());
+		mutex_lock(&tpebs_mtx);
 		stopping = tpebs_stopping;
 		finished = !stopping && check_if_command_finished(&tpebs_cmd);
-		mutex_unlock(tpebs_mtx_get());
+		mutex_unlock(&tpebs_mtx);
 		if (stopping) {
 			ret = -EBUSY;
 			goto out;
@@ -365,7 +350,7 @@ static int tpebs_send_record_cmd(const char *msg) __must_hold(tpebs_mtx_get())
 		pr_err("tpebs: perf record control ack failed\n");
 out:
 	/* Re-take lock as expected by caller. */
-	mutex_lock(tpebs_mtx_get());
+	mutex_lock(&tpebs_mtx);
 	tpebs_cmd_in_flight = false;
 	cond_broadcast(&tpebs_cmd_cond);
 	return ret;
@@ -374,7 +359,7 @@ static int tpebs_send_record_cmd(const char *msg) __must_hold(tpebs_mtx_get())
 /*
  * tpebs_stop - stop the sample data read thread and the perf record process.
  */
-static int tpebs_stop(void) __must_hold(tpebs_mtx_get())
+static int tpebs_stop(void) __must_hold(&tpebs_mtx)
 {
 	int ret = 0;
 
@@ -399,9 +384,9 @@ static int tpebs_stop(void) __must_hold(tpebs_mtx_get())
 		 */
 		tpebs_cmd.pid = 0;
 		reader_thread = tpebs_reader_thread;
-		mutex_unlock(tpebs_mtx_get());
+		mutex_unlock(&tpebs_mtx);
 		pthread_join(reader_thread, NULL);
-		mutex_lock(tpebs_mtx_get());
+		mutex_lock(&tpebs_mtx);
 		if (control_fd[0] >= 0) {
 			close(control_fd[0]);
 			control_fd[0] = -1;
@@ -537,20 +522,20 @@ static int evsel__tpebs_prepare(struct evsel *evsel)
 	struct evsel *pos;
 	struct tpebs_retire_lat *tpebs_event;
 
-	mutex_lock(tpebs_mtx_get());
+	mutex_lock(&tpebs_mtx);
 	tpebs_event = tpebs_retire_lat__find(evsel);
 	if (tpebs_event) {
 		/* evsel, or an identically named one, was already prepared. */
-		mutex_unlock(tpebs_mtx_get());
+		mutex_unlock(&tpebs_mtx);
 		return 0;
 	}
 	tpebs_event = tpebs_retire_lat__new(evsel);
 	if (!tpebs_event) {
-		mutex_unlock(tpebs_mtx_get());
+		mutex_unlock(&tpebs_mtx);
 		return -ENOMEM;
 	}
 	list_add_tail(&tpebs_event->nd, &tpebs_results);
-	mutex_unlock(tpebs_mtx_get());
+	mutex_unlock(&tpebs_mtx);
 
 	/*
 	 * Eagerly prepare all other evsels on the list to try to ensure that by
@@ -586,9 +571,9 @@ int evsel__tpebs_open(struct evsel *evsel)
 	if (!tpebs_recording)
 		return 0;
 
-	mutex_lock(tpebs_mtx_get());
+	mutex_lock(&tpebs_mtx);
 	if (tpebs_stopping) {
-		mutex_unlock(tpebs_mtx_get());
+		mutex_unlock(&tpebs_mtx);
 		return -EBUSY;
 	}
 	/* Only start the events once. */
@@ -598,17 +583,17 @@ int evsel__tpebs_open(struct evsel *evsel)
 
 		t = tpebs_retire_lat__find(evsel);
 		valid = t && t->started;
-		mutex_unlock(tpebs_mtx_get());
+		mutex_unlock(&tpebs_mtx);
 		/* May fail as the event wasn't started. */
 		return valid ? 0 : -EBUSY;
 	}
-	mutex_unlock(tpebs_mtx_get());
+	mutex_unlock(&tpebs_mtx);
 
 	ret = evsel__tpebs_prepare(evsel);
 	if (ret)
 		return ret;
 
-	mutex_lock(tpebs_mtx_get());
+	mutex_lock(&tpebs_mtx);
 	if (tpebs_stopping || tpebs_cmd.pid != 0) {
 		ret = -EBUSY;
 		goto out;
@@ -671,14 +656,14 @@ int evsel__tpebs_open(struct evsel *evsel)
 			if (actual_pid > 0) {
 				kill(actual_pid, SIGTERM);
 				while (tpebs_cmd_in_flight)
-					cond_wait(&tpebs_cmd_cond, tpebs_mtx_get());
+					cond_wait(&tpebs_cmd_cond, &tpebs_mtx);
 				tpebs_cmd.pid = 0;
 				if (started_thread) {
 					pthread_t reader_thread = tpebs_reader_thread;
 
-					mutex_unlock(tpebs_mtx_get());
+					mutex_unlock(&tpebs_mtx);
 					pthread_join(reader_thread, NULL);
-					mutex_lock(tpebs_mtx_get());
+					mutex_lock(&tpebs_mtx);
 				}
 			}
 			if (tpebs_cmd.out >= 0) {
@@ -709,7 +694,7 @@ int evsel__tpebs_open(struct evsel *evsel)
 			tpebs_stopping = false;
 		}
 	}
-	mutex_unlock(tpebs_mtx_get());
+	mutex_unlock(&tpebs_mtx);
 	return ret;
 }
 
@@ -729,7 +714,7 @@ int evsel__tpebs_read(struct evsel *evsel, int cpu_map_idx, int thread)
 
 	count = perf_counts(evsel->counts, cpu_map_idx, thread);
 
-	mutex_lock(tpebs_mtx_get());
+	mutex_lock(&tpebs_mtx);
 	t = tpebs_retire_lat__find(evsel);
 	/*
 	 * If reading the first tpebs result, send a ping to the record
@@ -738,10 +723,10 @@ int evsel__tpebs_read(struct evsel *evsel, int cpu_map_idx, int thread)
 	 */
 	if (t && &t->nd == tpebs_results.next) {
 		ret = tpebs_send_record_cmd(EVLIST_CTL_CMD_PING_TAG);
-		mutex_unlock(tpebs_mtx_get());
+		mutex_unlock(&tpebs_mtx);
 		if (ret)
 			return ret;
-		mutex_lock(tpebs_mtx_get());
+		mutex_lock(&tpebs_mtx);
 	}
 	if (t == NULL || t->stats.n == 0) {
 		/* No sample data, use default. */
@@ -780,7 +765,7 @@ int evsel__tpebs_read(struct evsel *evsel, int cpu_map_idx, int thread)
 			break;
 		}
 	}
-	mutex_unlock(tpebs_mtx_get());
+	mutex_unlock(&tpebs_mtx);
 
 	if (old_count) {
 		count->val = old_count->val + val;
@@ -805,7 +790,7 @@ void evsel__tpebs_close(struct evsel *evsel)
 {
 	struct tpebs_retire_lat *t;
 
-	mutex_lock(tpebs_mtx_get());
+	mutex_lock(&tpebs_mtx);
 	t = tpebs_retire_lat__find(evsel);
 	if (t) {
 		list_del_init(&t->nd);
@@ -814,5 +799,5 @@ void evsel__tpebs_close(struct evsel *evsel)
 		if (list_empty(&tpebs_results))
 			tpebs_stop();
 	}
-	mutex_unlock(tpebs_mtx_get());
+	mutex_unlock(&tpebs_mtx);
 }
-- 
2.56.0.542.g3ef89b7020-goog

