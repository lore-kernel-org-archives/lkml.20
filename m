Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418973;
	b=X91Ek+54QNXOQytDbaLPOpYjk/J9qIvK3nlFZC9sluYpKq6i6Eo6aQADc9RtfTzJIFi4
	 dKVGq70/pnnFCHRud+01kuIvvnFfvxI0aQtY/PO4W+GzRVO8Z7RL1k6codUA8i9RU0dVT
	 MWxHkPUqzl60zkV6xQuHjg0vVA93veKEO3ZEI/yEVEf1NnIDg39U3Qh125It9KcNGCTIr
	 f7t+Nh2jGOllA58Hzt+DEqUvD0YuT2UzyyVNlvDRQI4MlpnfySWpbrXKsPiUlmLTp6mun
	 a96NjYnWvUSmjjQ0EtplF4ortKUTBAzR6Fcc6etGwYDIT9M7kxM6DK0jzBalil2lP9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=El+pWdmNTfEqhkMtbeU7CVeSlc5sh/xpBBUIN3vMnJY=;
	b=3JXJP2mLD00dXlj2oYsT7yn0kr5SGvxtvNs44kNPVtgRlUeiTmLLakNYgJtBGUcDioX0
	 AiZGfQY0cuJqTt3Bxnao60jiunuLYBd7w07gSubkxCQQuuG+fbrUg5GCQjaG8LNKIeHK4
	 FywcLoHvW2UUsRS3Dzk3GR4qKRa0dYa4bjTRriPMnAmk3LaUZjR77EwlGa+lDnwP90PwI
	 dDTGMiHg1cOgOwcfXvFjInBJBIKIyDJJL/v5n4N9Oz3QB0aiWGlcsoR8ynL0a8BfJFqTf
	 3kNODa4JN2grrPdfaqn5FL9GJa6EjONVPihygA6HSUGr0fjpqjaIRmw5C4E5rUK9q2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mWXIGTeU;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5E560A6F51
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:42:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B5E560A6F51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mWXIGTeU
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1aa0fb7f157so5440141c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794418972; x=1795023772; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=El+pWdmNTfEqhkMtbeU7CVeSlc5sh/xpBBUIN3vMnJY=;
        b=mWXIGTeUp2ezvYi70Y18QQfr1ofe/wN6MJQqbY73PMB1pyhaE/UBGpbHGPqC3nFcT4
         fHaPxgUDNZhRDB5BS7smnvwykYoBAWJ9GErvfnMXKFdVFme2SpKakRk87IWRP/wz/Z0R
         Wel2AGCSr9XDbzoDkrCPGcJ21I8BHhUq6ajassSP4S3zdxVvtNRefodg1lYdobXoSN4U
         G6jRMvoW4CtDIY8wYaJ7CyolFnjLjF8JxGzTSLveQicTOvvQ6yOUuPtSBTpmxbl/Go+9
         Zuc7I101oAm6sKy+MdVCuYHf9Ya0JkyRiIB718uZCJ3TQg19m4Q1W6V5QtpB/b5PwojW
         S2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418972; x=1795023772;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=El+pWdmNTfEqhkMtbeU7CVeSlc5sh/xpBBUIN3vMnJY=;
        b=jwQag/LJoEaez66uBQEtL/vCn2O34FUT/g2BmhGtYdUZ34HwGr0ZgHKgXSppYoRu1S
         JaS6OP5end275cDeT+8LctNZvnRzQMR9j/U95Z4fFOnwCF+62WmKzJFTjAzqNnH/8I/V
         hC9/WnkKVSO83Zmfqbg/6qJh2zIxxni7bXJkAFr9fhnbdmhQOidJHn8lGBZA0TL5GeT2
         F7JMN93AoAsvWU8Ve0j2D5pAxfVmXnp+z8d8dWvk2af4hhJ6gfs84wJ6Z+/SCcg07wWS
         y+iBE1PcphjUPZGD7CKlGoHQL2fIiyYtFJd/X9+2baa4KC/8rJo2+q45MSKwoGAOTcfL
         pzbw==
X-Forwarded-Encrypted: i=1; AL+hErHpvWkch2XoegOFzMJOBQ2Za3NM4KP75PuB26I0MxJW/kykYVnNVYAnIPGmY98zYL5ay0vAl257RFSgogw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ENu7bWggyXEHOyROyIPZB9bLV/yJJZO6bMgUuXa8uV/Kwtfbs
	3jzm2RWhlyB/Omj2fQsRziDD3Ki2PgUwuMIdip6gBbd9WO3K+o5WF8MTaeFjdD9bZGVFC4jy4WL
	K406bLjYxfw==
X-Received: from dlbrx6.prod.google.com ([2002:a05:7022:1706:b0:1b2:4d89:1614])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4516:20b0:19a:e0eb:6916
 with SMTP id a92af1059eb24-1b3c036a7fcmr2752646c88.42.1794418971449; Wed, 11
 Nov 2026 09:42:51 -0800 (PST)
Date: Wed, 11 Nov 2026 09:42:07 -0800
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
Message-ID: <20261111174213.3526604-16-irogers@google.com>
Subject: [PATCH v12 15/20] perf intel-tpebs: Fix race in tpebs_stop() and
 tpebs_cmd.out fd handling
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

In tpebs_stop(), read tpebs_reader_thread into a local variable before
releasing tpebs_mtx to call pthread_join().

Transfer ownership of tpebs_cmd.out to __sample_reader() by passing it
as the thread argument and setting tpebs_cmd.out = -1 in
evsel__tpebs_open() so tpebs_stop() does not double-close the fd closed
by perf_session__delete(). Also reset tpebs_cmd.pid = 0 and
tpebs_cmd.out = -1 and return early if start_command() fails in
evsel__tpebs_start_perf_record(), as start_command() closes the pipe
internally and may leave cmd->pid = -1 on error.

Serialize tpebs_send_record_cmd() with teardown via tpebs_cmd_in_flight
and tpebs_cmd_cond, newline-terminate control commands so consecutive
writes cannot coalesce in evlist__ctlfd_recv(), check
check_if_command_finished(&tpebs_cmd) under tpebs_mtx only when not
stopping, ignore late samples in process_sample_event() once
tpebs_stopping is set, and guard evsel__tpebs_open() against a
concurrent tpebs_stop() with tpebs_gen, tpebs_enabled, and
tpebs_stopping across closing the fds and finish_command().

Include <pthread.h>, <signal.h>, <stdint.h>, <stdlib.h>, <string.h>, and
<unistd.h> explicitly.

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
2.56.0.542.g3ef89b7020-goog

