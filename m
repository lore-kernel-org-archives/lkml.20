Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588152;
	b=HjNwh1+vIrwWPRrumD8icBOK3OTt7EcNshBSQ/f6VTd0F/JJDZ2/BmEGpL+PXst0V8J4
	 qs54P4fMxRCdq9s2peHh8azaOEsW0SEbWczkx6Vn+56rPnP3XHHtFOUj7Jg9/jLyl0UVV
	 fHWOoWKqlEDlW2wAWsHd/PYFwa/JBvOrO7dwBk/Qbrt0RMPTv9uwMNIELtpi30baSTIB5
	 baEQbm7BbALv4t5sSC3LXJZapQUYU8xftY1lpt53Fm5K44ejaU96Wy94TWcs/AVg12Z3D
	 4t6iWxA95x/d/e29DrEZXWuiWcY96HEfeliS/q9De//udR9DK8axd2okI+Wpygty1gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=LfuNcU02ayIfPWfv+gk6KqHdcAEjAh59s+FkYx21tMo=;
	b=PZDwYnZrX9kQ9jrRku0QZSFPfi25nnCI7F0i2UY1DUxFIdw0nT9rimYZkOEoQH2Y9LbM
	 o/HIDNOrXKZQRMIrGKL+w0x3zus949c82tZr12Ql6ykPi7eee5GX0qqddBsh1Er0/ChAa
	 oF3Xt0i2Lj1FcBBPmJAVPkz6TetguuShGcgRycrZFmW/77aZdedJwXgt3CV22lH2yVQZ6
	 BX9ikF0kVMp3kldbuDFEFlDrSeEMIZQ39aDd39eHCSfH/TIZ9cvqqfQ5gG+LJ/2ZC+a2s
	 7APn+QY08+mI3EWBs4Nu4XXfgeG/Io+e/x6xJtEcE1PsCC9tRQBiDyvst/EdRCz6EbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aE366SHc;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1586073F63
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E1586073F63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aE366SHc
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36d1353fdcdso5155696eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794588151; x=1795192951; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LfuNcU02ayIfPWfv+gk6KqHdcAEjAh59s+FkYx21tMo=;
        b=aE366SHc51KzdcOqG/djNFujjyaHIKIHASr6glwiwQiPDLu0JV8mLbs9nxkCkgH+en
         xSF4cfDyhBIYXoz+RMA8ZStgzWKcv78COwaRn21opLoZbHtsG4VEV0CtQQFExqeD/d0/
         j9R1WCW30DLKB3hfRUSUC2ZZyrAAHZJ6rXX34VMRF6MGtR9YwT5xxX6vxqI5KKMPjevT
         KWozIHliCqFgGk45d7e9K/MYlr7xY/MKxxm7ruN9ufB4gk/zOy0VAmTjrtm/GzwViVdq
         oQEg2LP7UC8LHvPBE8omJkiXSoo/XOsv50TGpE7gSRpClJqJaR4//BFxwapQEjfXoSCM
         cxaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588151; x=1795192951;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LfuNcU02ayIfPWfv+gk6KqHdcAEjAh59s+FkYx21tMo=;
        b=TcIWzXFLcyf2IejU4KK0m32QBwSNQp+hVH4BHr7cxOYSWEKjVsgb8l84y7Vk4o0UEy
         MiQ6tJ6gN+Oca6j933H58aNidmoukfS/A0GLpc5IEo74uLGMBrY4qAn4BtPMRPqE66R0
         NcsMP3Egs+U5gziS//keILXZfDIjuhNvJJRp7boCMGebYV96t/kZstA9efq+xh6+4OOG
         u1KBTSDE4hYb7l5bzoM0z+mUJyKs/Pub3PuqTJpstU0lG1ISgoWnHWFXxWs46BcZqDM0
         44x1Itw59daSkU+6jKcAMQF+wNyUg4iN/Z9UPZy7yHLEodGHoK4KYLI9JvqQCovu1Zmu
         WT+g==
X-Forwarded-Encrypted: i=1; AL+hErEjezBEUqMcoRZ3UV+GMtrEnc46Gy+ZZXpxPrgXlMyU832B5sknCE7XfhGkoU2kVp43p+S2HmndEK2K4Lg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JME1GwstCQOAkv1VQAVWTzz2ek3RStemmuzNO8iKvrFHD79CJ
	KjC1lOAtF3eqFaazFAyOebQn07LeTKK0ZGk5wgTQlJYEQ+i6OVx5iBDoaNGMjxz3lh5XnATn6uG
	8DnnLledMjA==
X-Received: from dybmh39.prod.google.com ([2002:a05:7301:f27:b0:370:aaf:b42b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:e9c8:20b0:36d:a466:9d0b
 with SMTP id 5a478bee46e88-37966a5c202mr3087408eec.19.1794588150807; Fri, 13
 Nov 2026 08:42:30 -0800 (PST)
Date: Fri, 13 Nov 2026 08:41:46 -0800
In-Reply-To: <20261113164152.2095566-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113164152.2095566-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113164152.2095566-16-irogers@google.com>
Subject: [PATCH v13 15/21] perf intel-tpebs: Fix race in tpebs_stop() and
 tpebs_cmd.out fd handling
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

intel-tpebs has two lifecycle bugs around the background 'perf record'
process and sample reader thread:
1. tpebs_cmd.out is read without tpebs_mtx and closed by both
   perf_session__delete() in __sample_reader() and tpebs_stop() (or
   leaked if perf_session__new() fails).
2. tpebs_stop() reads tpebs_reader_thread after unlocking tpebs_mtx, and
   tpebs_send_record_cmd() drops tpebs_mtx while writing undelimited
   control strings and polling ack_fd, allowing concurrent open/close
   calls to coalesce commands or race to close pipes, join the reader
   thread, and reap tpebs_cmd twice.

Fix (1) by passing tpebs_cmd.out to __sample_reader() and resetting
tpebs_cmd.out = -1 once ownership is transferred (and on start_command()
failure). Fix (2) by reading tpebs_reader_thread under tpebs_mtx,
newline-terminating control commands, serializing tpebs_send_record_cmd()
with teardown via a condition variable and generation counter, and
ignoring late samples in process_sample_event() while stopping. Add
explicit header includes used by the file.

Fixes: 8db5cabcf1b6 ("perf stat: Fork and launch 'perf record' when 'perf stat' needs to get retire latency value for a metric.")
Fixes: bded0398ac19 ("perf tpebs: Fix concurrent stop races and PID reuse hazards in tpebs_stop")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/intel-tpebs.c | 141 ++++++++++++++++++++++++++++------
 1 file changed, 119 insertions(+), 22 deletions(-)

diff --git a/tools/perf/util/intel-tpebs.c b/tools/perf/util/intel-tpebs.c
index 7c0b8b15bd10..5cb090b27fbd 100644
--- a/tools/perf/util/intel-tpebs.c
+++ b/tools/perf/util/intel-tpebs.c
@@ -27,6 +27,12 @@
 #include <errno.h>
 #include <poll.h>
 #include <math.h>
+#include <pthread.h>
+#include <signal.h>
+#include <stdint.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
 
 #define PERF_DATA		"-"
 
@@ -37,7 +43,11 @@ static pthread_t tpebs_reader_thread;
 static struct child_process tpebs_cmd;
 static int control_fd[2], ack_fd[2];
 static struct mutex tpebs_mtx;
+static struct cond tpebs_cmd_cond = { .cond = PTHREAD_COND_INITIALIZER };
 static bool tpebs_stopping;
+static bool tpebs_enabled;
+static bool tpebs_cmd_in_flight;
+static uint64_t tpebs_gen;
 
 struct tpebs_retire_lat {
 	struct list_head nd;
@@ -120,10 +130,15 @@ static int evsel__tpebs_start_perf_record(struct evsel *evsel)
 	tpebs_cmd.out = -1;
 	ret = start_command(&tpebs_cmd);
 	zfree(&tpebs_cmd.argv);
+	if (ret) {
+		tpebs_cmd.pid = 0;
+		tpebs_cmd.out = -1;
+		return ret;
+	}
 	list_for_each_entry(t, &tpebs_results, nd)
 		t->started = true;
 
-	return ret;
+	return 0;
 }
 
 static bool is_child_pid(pid_t parent, pid_t child)
@@ -195,8 +210,8 @@ static int process_sample_event(const struct perf_tool *tool __maybe_unused,
 	struct tpebs_retire_lat *t;
 
 	mutex_lock(tpebs_mtx_get());
-	if (tpebs_cmd.pid == 0) {
-		/* Record has terminated. */
+	if (tpebs_stopping || tpebs_cmd.pid == 0) {
+		/* Record is stopping or has terminated. */
 		mutex_unlock(tpebs_mtx_get());
 		return 0;
 	}
@@ -220,13 +235,13 @@ static int process_sample_event(const struct perf_tool *tool __maybe_unused,
 	return 0;
 }
 
-static void *__sample_reader(void *arg __maybe_unused)
+static void *__sample_reader(void *arg)
 {
 	struct perf_session *session;
 	struct perf_data data = {
 		.mode = PERF_DATA_MODE_READ,
 		.path = PERF_DATA,
-		.file.fd = tpebs_cmd.out,
+		.file.fd = (int)(intptr_t)arg,
 	};
 	struct perf_tool tool;
 
@@ -236,8 +251,10 @@ static void *__sample_reader(void *arg __maybe_unused)
 	tool.attr = perf_event__process_attr;
 
 	session = perf_session__new(&data, &tool);
-	if (IS_ERR(session))
+	if (IS_ERR(session)) {
+		close(data.file.fd);
 		return NULL;
+	}
 	perf_session__process_events(session);
 	perf_session__delete(session);
 
@@ -247,35 +264,49 @@ static void *__sample_reader(void *arg __maybe_unused)
 static int tpebs_send_record_cmd(const char *msg) __must_hold(tpebs_mtx_get())
 {
 	struct pollfd pollfd = { .events = POLLIN, };
-	int ret, len, retries = 0;
+	bool is_stop = !strcmp(msg, EVLIST_CTL_CMD_STOP_TAG);
+	int ret, len, retries = 0, ctrl_fd, resp_fd;
+	char cmd_buf[EVLIST_CTL_CMD_MAX_LEN];
 	char ack_buf[8];
 
+	while (tpebs_cmd_in_flight) {
+		if (!is_stop && tpebs_stopping)
+			return -EBUSY;
+		cond_wait(&tpebs_cmd_cond, tpebs_mtx_get());
+	}
+	if (!is_stop && tpebs_stopping)
+		return -EBUSY;
+
 	/* Check if the command exited before the send, done with the lock held. */
 	if (tpebs_cmd.pid == 0)
 		return 0;
 
+	ctrl_fd = control_fd[1];
+	resp_fd = ack_fd[0];
+	tpebs_cmd_in_flight = true;
+
 	/*
 	 * Let go of the lock while sending/receiving as blocking can starve the
 	 * sample reading thread.
 	 */
 	mutex_unlock(tpebs_mtx_get());
 
-	/* Send perf record command.*/
-	len = strlen(msg);
-	ret = write(control_fd[1], msg, len);
+	/* Send perf record command. */
+	len = scnprintf(cmd_buf, sizeof(cmd_buf), "%s\n", msg);
+	ret = write(ctrl_fd, cmd_buf, len);
 	if (ret != len) {
 		pr_err("perf record control write control message '%s' failed\n", msg);
 		ret = -EPIPE;
 		goto out;
 	}
 
-	if (!strcmp(msg, EVLIST_CTL_CMD_STOP_TAG)) {
+	if (is_stop) {
 		ret = 0;
 		goto out;
 	}
 
 	/* Wait for an ack. */
-	pollfd.fd = ack_fd[0];
+	pollfd.fd = resp_fd;
 
 	/*
 	 * We need this poll to ensure the ack_fd PIPE will not hang
@@ -284,7 +315,17 @@ static int tpebs_send_record_cmd(const char *msg) __must_hold(tpebs_mtx_get())
 	 */
 again:
 	if (!poll(&pollfd, 1, 500)) {
-		if (check_if_command_finished(&tpebs_cmd)) {
+		bool stopping, finished;
+
+		mutex_lock(tpebs_mtx_get());
+		stopping = tpebs_stopping;
+		finished = !stopping && check_if_command_finished(&tpebs_cmd);
+		mutex_unlock(tpebs_mtx_get());
+		if (stopping) {
+			ret = -EBUSY;
+			goto out;
+		}
+		if (finished) {
 			ret = 0;
 			goto out;
 		}
@@ -297,7 +338,17 @@ static int tpebs_send_record_cmd(const char *msg) __must_hold(tpebs_mtx_get())
 	}
 
 	if (!(pollfd.revents & POLLIN)) {
-		if (check_if_command_finished(&tpebs_cmd)) {
+		bool stopping, finished;
+
+		mutex_lock(tpebs_mtx_get());
+		stopping = tpebs_stopping;
+		finished = !stopping && check_if_command_finished(&tpebs_cmd);
+		mutex_unlock(tpebs_mtx_get());
+		if (stopping) {
+			ret = -EBUSY;
+			goto out;
+		}
+		if (finished) {
 			ret = 0;
 			goto out;
 		}
@@ -307,7 +358,7 @@ static int tpebs_send_record_cmd(const char *msg) __must_hold(tpebs_mtx_get())
 		goto out;
 	}
 
-	ret = read(ack_fd[0], ack_buf, sizeof(ack_buf));
+	ret = read(resp_fd, ack_buf, sizeof(ack_buf));
 	if (ret > 0)
 		ret = strcmp(ack_buf, EVLIST_CTL_CMD_ACK_TAG);
 	else
@@ -315,6 +366,8 @@ static int tpebs_send_record_cmd(const char *msg) __must_hold(tpebs_mtx_get())
 out:
 	/* Re-take lock as expected by caller. */
 	mutex_lock(tpebs_mtx_get());
+	tpebs_cmd_in_flight = false;
+	cond_broadcast(&tpebs_cmd_cond);
 	return ret;
 }
 
@@ -331,12 +384,23 @@ static int tpebs_stop(void) __must_hold(tpebs_mtx_get())
 	/* Like tpebs_start, we should only run tpebs_end once. */
 	if (tpebs_cmd.pid != 0) {
 		pid_t actual_pid = tpebs_cmd.pid;
+		bool enabled = tpebs_enabled;
+		pthread_t reader_thread;
 
 		tpebs_stopping = true;
-		tpebs_send_record_cmd(EVLIST_CTL_CMD_STOP_TAG);
+		tpebs_enabled = false;
+		tpebs_gen++;
+		cond_broadcast(&tpebs_cmd_cond);
+		if (tpebs_send_record_cmd(EVLIST_CTL_CMD_STOP_TAG) || !enabled)
+			kill(actual_pid, SIGTERM);
+		/*
+		 * tpebs_results is empty when stopping; clear pid before
+		 * releasing tpebs_mtx to join the reader thread.
+		 */
 		tpebs_cmd.pid = 0;
+		reader_thread = tpebs_reader_thread;
 		mutex_unlock(tpebs_mtx_get());
-		pthread_join(tpebs_reader_thread, NULL);
+		pthread_join(reader_thread, NULL);
 		mutex_lock(tpebs_mtx_get());
 		if (control_fd[0] >= 0) {
 			close(control_fd[0]);
@@ -515,6 +579,8 @@ int evsel__tpebs_open(struct evsel *evsel)
 	int ret;
 	bool tpebs_empty;
 	bool started_process = false;
+	bool started_thread = false;
+	uint64_t open_gen = 0;
 
 	/* We should only run tpebs_start when tpebs_recording is enabled. */
 	if (!tpebs_recording)
@@ -550,6 +616,8 @@ int evsel__tpebs_open(struct evsel *evsel)
 	tpebs_empty = list_empty(&tpebs_results);
 	if (!tpebs_empty) {
 		started_process = true;
+		tpebs_enabled = false;
+		open_gen = ++tpebs_gen;
 		/*Create control and ack fd for --control*/
 		if (pipe(control_fd) < 0) {
 			pr_err("tpebs: Failed to create control fifo");
@@ -567,13 +635,22 @@ int evsel__tpebs_open(struct evsel *evsel)
 			goto out;
 
 		if (pthread_create(&tpebs_reader_thread, /*attr=*/NULL, __sample_reader,
-				   /*arg=*/NULL)) {
+				   (void *)(intptr_t)tpebs_cmd.out)) {
 			kill(tpebs_cmd.pid, SIGTERM);
 			pr_err("Could not create thread to process sample data.\n");
 			ret = -1;
 			goto out;
 		}
+		/* __sample_reader now owns and closes the output fd. */
+		tpebs_cmd.out = -1;
+		started_thread = true;
 		ret = tpebs_send_record_cmd(EVLIST_CTL_CMD_ENABLE_TAG);
+		if (!ret) {
+			if (tpebs_gen != open_gen)
+				ret = -EBUSY;
+			else
+				tpebs_enabled = true;
+		}
 	}
 out:
 	if (ret) {
@@ -584,11 +661,25 @@ int evsel__tpebs_open(struct evsel *evsel)
 			tpebs_retire_lat__delete(t);
 		}
 
-		if (started_process) {
-			if (tpebs_cmd.pid > 0) {
-				kill(tpebs_cmd.pid, SIGTERM);
-				finish_command(&tpebs_cmd);
+		if (started_process && tpebs_gen == open_gen) {
+			pid_t actual_pid = tpebs_cmd.pid;
+
+			tpebs_stopping = true;
+			tpebs_enabled = false;
+			tpebs_gen++;
+			cond_broadcast(&tpebs_cmd_cond);
+			if (actual_pid > 0) {
+				kill(actual_pid, SIGTERM);
+				while (tpebs_cmd_in_flight)
+					cond_wait(&tpebs_cmd_cond, tpebs_mtx_get());
 				tpebs_cmd.pid = 0;
+				if (started_thread) {
+					pthread_t reader_thread = tpebs_reader_thread;
+
+					mutex_unlock(tpebs_mtx_get());
+					pthread_join(reader_thread, NULL);
+					mutex_lock(tpebs_mtx_get());
+				}
 			}
 			if (tpebs_cmd.out >= 0) {
 				close(tpebs_cmd.out);
@@ -610,6 +701,12 @@ int evsel__tpebs_open(struct evsel *evsel)
 				close(ack_fd[1]);
 				ack_fd[1] = -1;
 			}
+			if (actual_pid > 0) {
+				tpebs_cmd.pid = actual_pid;
+				finish_command(&tpebs_cmd);
+				tpebs_cmd.pid = 0;
+			}
+			tpebs_stopping = false;
 		}
 	}
 	mutex_unlock(tpebs_mtx_get());
-- 
2.56.1.703.gf848ed807c-goog

