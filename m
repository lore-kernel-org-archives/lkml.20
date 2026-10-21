Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792622396;
	b=2pGXVKuCzjBlt3c3mWj1PW8VTv6+Zz/+xlODOwxWl7XGMlFxCsRYyfn7LJEZdM6w2oTt
	 sjy7CWA+S+YSxUF+W5oo/G/FLDzBXmk39hBWoj0YzrpP9HrCT+j04HS79bpk+krkE3RQg
	 7N3oK54OtYPliZ/RCoYjSxMT7L4ER1y7Ojz7uDXD1xLFPnnq59VArh+wFMxTbOf04zzWr
	 QesimYDg2h8HP/JbWYsrrnoPlbtngssCpBqQBKWI7sno5kMrEh6S11VWCtvTtsbckfGvx
	 imf5jpC+tgQwvN1fhdFfdXD89dYKrYV8aQEx5silRcDc3r5pCcBRpy45nw/knSnTnuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792622396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=v2rrXS1ate7b8OOQCuZc5vd/vkFrx7oPEHSNFj+/YLY=;
	b=JEyNTXLcGYMXnSrA9fNvJ1UnfFhZNhNNw9DO2FOQE9gmyMv5yb9wF3Jz3h/hzgmt6ueH
	 zdN7Yf/4uR2k2/hff3ZLrS8SZkCsqgUlAb/kY3XrG7z1tu2fIQPN3KyJx/4glKn/3Mvbv
	 HGzdDhJDT3uXmZNTkxCGlkCyVOaTlx1BVnrA3iiiglT5TxnFkxl+DDYo0crpL7Rp6KyrQ
	 YQc6i8+KouKH5Xy0jf8QFcKOgrE5MHappOA7d0chh+0fR5553rX6w1D3uwuM5rZnvwFCH
	 HSLbnCYUKysxzNj12BnApS4KuKq0RkW1P9sjzWq4ugftDKR3VJG62tIbeQvyEvpEhzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=gUIqUiNl;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2C8606A324
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA2C8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=gUIqUiNl
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1663fb7e005so1790404c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792622395; x=1793227195; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v2rrXS1ate7b8OOQCuZc5vd/vkFrx7oPEHSNFj+/YLY=;
        b=gUIqUiNlsWps7uCKMrspe1bh/dPYiXmYlT334fclxqbvkQ4QLayuIDc6glKaG5rN0w
         0aBEWoQTEBV8nS8u9mqLRlX8J6vdqZzqr1kxjGcA5BgwDa8ARQJKhyMJOLn1+C1AK+A7
         I0TocmeS2VnK+0mVqo6IX+SduNZvHsAcWnvH6nlzguE2BULFO1G0fwjV1KAF5LdCpFGQ
         Qb4nQOFr74ykDLtOiS+oVeDsqbjFNBPct8DcexZlNW/njrnSYI2qcz4etv+zExQgFO0C
         MZxJhhCo1eUlnWE6hBwZ6ZS8c9ANgIY+xgjJRaZ0Ia2SKvLopZebh8pmJ5ETZJ993M83
         w+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792622395; x=1793227195;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2rrXS1ate7b8OOQCuZc5vd/vkFrx7oPEHSNFj+/YLY=;
        b=f02MiYXRNuhGmWKmE1f4x0CMqT4G3wTPI0tb0t160NMoeGdb1V4EExSLs15eU88bji
         fQipDJLbo0tH2jfiQA2bXaysPCAgsMtAuIqOQz6OsOduo0DLDFcYNHrX3tlr3lTXq0Rp
         K0JolY9WKllsDHZ0dkauTJXPf6Lty33fsPcmUT/7cC40wkj8gU07PEmaV3LQAtCsD02s
         cwqyKpi6xwDlAlsmVjoOwmY7xHVzUF5zDVrAdgK50RNEIICHn7ByXIsLzC4KtxwESerw
         yJmnNM8AwO/dEPgEzW3oDBlJF47J/4qz6WHm2HuOCkHFtzIHi2THuoOaaZssMK7p/kGj
         Uxqw==
X-Forwarded-Encrypted: i=1; AKwUvBy4F0KhbZH+1cSHzH6w+4tCFZFS/NOhP0N9PCGsUQsvwj+vajLfNEjebX91FfeYaoGQABuhQRAnAaWVbVg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUojj3RsfCoYQfpLRMm7rDQ0gG9xzI6bAdnRUvJNWZp9SdnRP9
	xpSh4i3VeEuWzXqf82rKEOs2ZpWzaKmVx0H4OcA2a4jMnyK+uIa5FxgP379xlYOhN3+6c8k6bq0
	pzAq80TNtVw==
X-Received: from dlbpt3.prod.google.com ([2002:a05:7022:e803:b0:190:a370:8867])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:465b:b0:14b:cf58:ce15
 with SMTP id a92af1059eb24-190a6eb58e1mr3715874c88.43.1792622394673; Wed, 21
 Oct 2026 15:39:54 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:39:01 -0700
In-Reply-To: <20261021223905.715051-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021171044.155240-1-irogers@google.com> <20261021223905.715051-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261021223905.715051-14-irogers@google.com>
Subject: [PATCH v7 13/17] perf intel-tpebs: Fix race in tpebs_stop() and
 tpebs_cmd.out fd handling
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

In tpebs_stop(), read tpebs_reader_thread into a local variable before
releasing tpebs_mtx to call pthread_join().

Transfer ownership of tpebs_cmd.out to __sample_reader() by passing it as
the thread argument and setting tpebs_cmd.out = -1 in
evsel__tpebs_open() so tpebs_stop() does not double-close the fd closed
by perf_session__delete(). Also reset tpebs_cmd.pid = 0 and tpebs_cmd.out = -1 and return early if
start_command() fails in evsel__tpebs_start_perf_record(), as
start_command() closes the pipe internally and may leave cmd->pid = -1
on error, and join tpebs_reader_thread on error in evsel__tpebs_open()
if it was already started.

Include <pthread.h>, <signal.h>, <stdint.h>, <stdlib.h>, <string.h>, and
<unistd.h> explicitly.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/intel-tpebs.c | 51 ++++++++++++++++++++++++++++++-----
 1 file changed, 44 insertions(+), 7 deletions(-)

diff --git a/tools/perf/util/intel-tpebs.c b/tools/perf/util/intel-tpebs.c
index 7c0b8b15bd10..47c939fc2058 100644
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
 
@@ -120,10 +126,15 @@ static int evsel__tpebs_start_perf_record(struct evsel *evsel)
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
@@ -220,13 +231,13 @@ static int process_sample_event(const struct perf_tool *tool __maybe_unused,
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
 
@@ -236,8 +247,10 @@ static void *__sample_reader(void *arg __maybe_unused)
 	tool.attr = perf_event__process_attr;
 
 	session = perf_session__new(&data, &tool);
-	if (IS_ERR(session))
+	if (IS_ERR(session)) {
+		close(data.file.fd);
 		return NULL;
+	}
 	perf_session__process_events(session);
 	perf_session__delete(session);
 
@@ -331,12 +344,19 @@ static int tpebs_stop(void) __must_hold(tpebs_mtx_get())
 	/* Like tpebs_start, we should only run tpebs_end once. */
 	if (tpebs_cmd.pid != 0) {
 		pid_t actual_pid = tpebs_cmd.pid;
+		pthread_t reader_thread;
 
 		tpebs_stopping = true;
 		tpebs_send_record_cmd(EVLIST_CTL_CMD_STOP_TAG);
+		/*
+		 * tpebs_results is empty when stopping; clear pid so
+		 * process_sample_event() ignores any late samples while
+		 * draining the pipe.
+		 */
 		tpebs_cmd.pid = 0;
+		reader_thread = tpebs_reader_thread;
 		mutex_unlock(tpebs_mtx_get());
-		pthread_join(tpebs_reader_thread, NULL);
+		pthread_join(reader_thread, NULL);
 		mutex_lock(tpebs_mtx_get());
 		if (control_fd[0] >= 0) {
 			close(control_fd[0]);
@@ -515,6 +535,7 @@ int evsel__tpebs_open(struct evsel *evsel)
 	int ret;
 	bool tpebs_empty;
 	bool started_process = false;
+	bool started_thread = false;
 
 	/* We should only run tpebs_start when tpebs_recording is enabled. */
 	if (!tpebs_recording)
@@ -567,12 +588,15 @@ int evsel__tpebs_open(struct evsel *evsel)
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
 	}
 out:
@@ -586,9 +610,22 @@ int evsel__tpebs_open(struct evsel *evsel)
 
 		if (started_process) {
 			if (tpebs_cmd.pid > 0) {
-				kill(tpebs_cmd.pid, SIGTERM);
+				pid_t actual_pid = tpebs_cmd.pid;
+
+				tpebs_stopping = true;
+				kill(actual_pid, SIGTERM);
+				tpebs_cmd.pid = 0;
+				if (started_thread) {
+					pthread_t reader_thread = tpebs_reader_thread;
+
+					mutex_unlock(tpebs_mtx_get());
+					pthread_join(reader_thread, NULL);
+					mutex_lock(tpebs_mtx_get());
+				}
+				tpebs_cmd.pid = actual_pid;
 				finish_command(&tpebs_cmd);
 				tpebs_cmd.pid = 0;
+				tpebs_stopping = false;
 			}
 			if (tpebs_cmd.out >= 0) {
 				close(tpebs_cmd.out);
-- 
2.56.0.218.g1ec904b173-goog

