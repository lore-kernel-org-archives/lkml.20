Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA78949BB44
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 22:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792189128; cv=none; b=XRROeYMwCZWK5tmvgzPo6l7iwv8Lq5anc/hPDZTLHJXUUQf8KGBITMeYy0SROr4hf8rYL8/r77kInI3wJyXkcGOAaVYJWcyl9WC9nZ2Fz4nbMo92iJ3/oqWF4Uqx/HaXQHHfxOmL/ThhGN84WISxSpmnX3vNwqh8+Sti6weOE/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792189128; c=relaxed/simple;
	bh=cnVP24sPxVf7DLFdNE+8GJtq/I4mfxr/kMD9Davd+UA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FGEcX77G+n053gYOIjgy11yrCbwzVd5tBq0jBcPluiv3Xyj8TIyqSGy/7MkcXA9g/I2/tdM2kR9Mdk8QPuBbkr8byedCsSfVshfDVfMaVCbMNKptr7oXoOJsrC1T3RkCux/UQA9Arfpz9L9f60VjmFBAdvVScv2t6LnU/jXPJo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gNS7Opjj; arc=none smtp.client-ip=74.125.82.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gNS7Opjj"
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-151ba226e1bso611091c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792189126; x=1792793926; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zQPYsB3WYXp4pgTL9HnXVVqxTUDv+FCAWpR0WURZtvs=;
        b=gNS7OpjjqlCyNpMF9yw1rh5V2OtSzAndOdZrRo91OzZ07Gkzkl3p/tp5KhfRLKt8hy
         rOMRvJO7SLl2roIOg7irnmKGr5YtS+uUKZmuJNaAFPm5QUyOkBO1olwG7ekrTdsA4rYc
         C9kvYP9WPqBS3G1m9cciRIdNGQ81d+Z5DgSzYO+w/VmGer28Xz8rl5XJO9AFWIlVDWu+
         UuK59pV3mktS4kh/VoapFNRej/e2ut1+CcCnDSY7fvNey6FBmCoHP3/0KNP3GPnh1sH7
         rVY1oNlYQhWxD/wo7tJe2eH7jgmjkUJPfhQ8D8MM1u6/8ySszLDQGceqGcxmFjK41itT
         qfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792189126; x=1792793926;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zQPYsB3WYXp4pgTL9HnXVVqxTUDv+FCAWpR0WURZtvs=;
        b=OVcclW1AOQujn0GE/7nfWjwl2IKeUB2hv/kp/YkUFf9pCznTQAECBnnCAjeV2e5l55
         D6by2x9ZgTXTWoOGEZuyt5igbtZ5SgrzKdj0NARwyowe6STWrAEwlWLmzEGsg1hnRdSU
         UVXbVAd4/QUp0exv094DFvnBNMpoYe9q2V3fjird59SN8BB52W29X2/nhgkuIpS69ugT
         oi0kreEpQRKolgc+naVMfmNdTwLkvJ1PJAe9AcnpPFDjbN4N+Iy1qad2F08xpU8CBk5R
         eN+BDWgPJltY8XDr+tY4rXVgRSyowlZUTHazDLjyuTZYBnFyt6sToPbiXF7/63cXUuPX
         UEig==
X-Forwarded-Encrypted: i=1; AKwUvBzjW7sx+z8y/CMaIZ5i6eVrcdpvVE5g1+1ixtrBxYTk10vTFdVkTS+jzfB09EkQYWZ2kFIWIoRFJleaoR8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1VkN/M5rbpCFrU6HaIf9XMdocAtkjALyueWkZMU3ePRg1T1I2
	Zzpx9PWn8k/oziBLxliObUWqrmjKIv3QkJvk0rLIY9gv7xdOLiN7X4qC5NKkziZA/kkKQrIW578
	ZYAVySSXCtw==
X-Received: from dyaf25-n1.prod.google.com ([2002:a05:693c:8399:10b0:355:e5a8:715f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2610:b0:143:3da5:cada
 with SMTP id a92af1059eb24-185152b6b6bmr1469301c88.37.1792189124811; Fri, 16
 Oct 2026 15:18:44 -0700 (PDT)
Date: Fri, 16 Oct 2026 15:16:56 -0700
In-Reply-To: <20261016221700.1282659-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261016173106.679725-1-irogers@google.com> <20261016221700.1282659-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016221700.1282659-14-irogers@google.com>
Subject: [PATCH v4 13/17] perf intel-tpebs: Fix race in tpebs_stop() and
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
by perf_session__delete(). Also reset tpebs_cmd.out = -1 if
start_command() fails in evsel__tpebs_start_perf_record(), as
start_command() closes the pipe internally on error without resetting
cmd->out, and join tpebs_reader_thread on error in evsel__tpebs_open()
if it was already started.

Include <pthread.h>, <signal.h>, <stdint.h>, <stdlib.h>, <string.h>, and
<unistd.h> explicitly.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/intel-tpebs.c | 46 ++++++++++++++++++++++++++++++-----
 1 file changed, 40 insertions(+), 6 deletions(-)

diff --git a/tools/perf/util/intel-tpebs.c b/tools/perf/util/intel-tpebs.c
index 7c0b8b15bd10..5954811a94df 100644
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
 
@@ -119,6 +125,8 @@ static int evsel__tpebs_start_perf_record(struct evsel *evsel)
 	tpebs_cmd.argv = record_argv;
 	tpebs_cmd.out = -1;
 	ret = start_command(&tpebs_cmd);
+	if (ret)
+		tpebs_cmd.out = -1;
 	zfree(&tpebs_cmd.argv);
 	list_for_each_entry(t, &tpebs_results, nd)
 		t->started = true;
@@ -220,13 +228,13 @@ static int process_sample_event(const struct perf_tool *tool __maybe_unused,
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
 
@@ -236,8 +244,10 @@ static void *__sample_reader(void *arg __maybe_unused)
 	tool.attr = perf_event__process_attr;
 
 	session = perf_session__new(&data, &tool);
-	if (IS_ERR(session))
+	if (IS_ERR(session)) {
+		close(data.file.fd);
 		return NULL;
+	}
 	perf_session__process_events(session);
 	perf_session__delete(session);
 
@@ -331,12 +341,19 @@ static int tpebs_stop(void) __must_hold(tpebs_mtx_get())
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
@@ -515,6 +532,7 @@ int evsel__tpebs_open(struct evsel *evsel)
 	int ret;
 	bool tpebs_empty;
 	bool started_process = false;
+	bool started_thread = false;
 
 	/* We should only run tpebs_start when tpebs_recording is enabled. */
 	if (!tpebs_recording)
@@ -567,12 +585,15 @@ int evsel__tpebs_open(struct evsel *evsel)
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
@@ -586,9 +607,22 @@ int evsel__tpebs_open(struct evsel *evsel)
 
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
2.56.0.212.g129ede20d9-goog

