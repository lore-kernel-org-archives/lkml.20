Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A32D58B6B1
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171915; cv=none; b=lYylMWVqQ9PF1IUseFcL8EVn6QvYOQxvNiwZy7y4IBn2men+pCP/W5Xbbl8VfpXKYm7KZvfXHi8pU0Kue7LDPPPynhj0ow4wAr563m8aGdV2eUcRktWlICzPAtqSavKGqaBRbak4Xn0QddXUkJv9DiP4YZdPAyXZB3zCxXct+XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171915; c=relaxed/simple;
	bh=lXDicjRb52fj+rMBHlcsZH2YE6FpOO8swAccPqHksxQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Dz3oR6hOUATHz5bdhjshHVd1weAd33I4EYQkdIdMD+D2/I8EdxBECq0yCRzlXStItp+9bYHOEc/G4dns/MyHh4CDOL8PNp+LCIH5qX/2P/Slx3H5+W2o6oLi/jdPb/A5ekHOGwGsTkvHCnZpj9+zCIA784gkKSgEFEfJP9H/j9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oH/2bURb; arc=none smtp.client-ip=74.125.82.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oH/2bURb"
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1663fb7e005so130384c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792171913; x=1792776713; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tGQDYuEhDc78TImgQ32YcWadll//nwsG33eLqYi4wFU=;
        b=oH/2bURbePefxCnmi9pyZBzi0e2cJ1WJAPNpg16ShAtnKyU78SNuCkidgk6zLNrrpp
         GeX5FtbIq4pGuXfu99BTEfmlzoy+9hlVRyQBUzzQAA8g2KwCWgyskXPZFss80BnPZ2Gq
         oY9vl1U1rKAQhMkZyybfYGMMdS21rHZ3VTUtt+4EJzm3Okcdc5iFKtAh8W5zbPmAbE5C
         5HlnNTy9MU0OTiPsI0KDZaQLE7YhnHPeuxBqm/XUsQdbZRci5yqh2QjxOM5fFT6dTOif
         9eAA7aZXInHjoNqg7wMXrWq8JVsYiJh957DTnYr/B4RLieF4DMwxKTidHYuQOArLGFeY
         pOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171913; x=1792776713;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tGQDYuEhDc78TImgQ32YcWadll//nwsG33eLqYi4wFU=;
        b=LhKZddstPXJTgJR4IUrON+5iXjOYoxHh1c1dDPvAfRiEtq4hjOp1mVuAzOS8WC9cnE
         razP6nCXjEhZSYoWzAqqh2u+Zex7+d/xL/ygdc8uRbmZ2AocuH5nqLl5u7JQicvRm1Qx
         egr93JodH9U2MaGB/SzvTmkcf3mjUB89JAGFQKVsLCY6Kg3lRVZC1uFTJEnyHAxBD6Py
         9AKBkN7jU8d5oQ6OxI+6zFZbdXj7+P5/KJ2dyVFRj1H9FGZoHR9ZUK/Zt1alfCL2KqvZ
         VmMIUUapiG6DFIGYVh7snRF7sW9l+JBqJN8W1Pn3CMGGtd4PgxsxYGWIusnH3EbTOqPS
         P42g==
X-Forwarded-Encrypted: i=1; AKwUvBy6gbX79MZ3BqDROzwzDQkUM3k96I6+3qHhGQMmY0GGww1NpzVLbYTyetmtOEUxS4gOczLOv4qdcZhIHck=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdFPhHYYGaVGIJLhwGtLnn4B+ILhpt2pQfpVewXhqyLUgbaW/t
	c+H9aoRBq1rP8FTi/M4ijztx9mt2yufq3uDQanMceykkhkrCI9MaM1HTSa8OisrMRr8h/gVGitr
	rMSbwdezu9Q==
X-Received: from dlbrd12.prod.google.com ([2002:a05:7022:f10c:b0:16d:1d8b:2ef4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7023:a4c:b0:144:fdf0:9d91
 with SMTP id a92af1059eb24-1851285de14mr637107c88.24.1792171912882; Fri, 16
 Oct 2026 10:31:52 -0700 (PDT)
Date: Fri, 16 Oct 2026 10:31:02 -0700
In-Reply-To: <20261016173106.679725-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261013222622.1822619-1-irogers@google.com> <20261016173106.679725-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016173106.679725-14-irogers@google.com>
Subject: [PATCH v3 13/17] perf intel-tpebs: Fix race in tpebs_stop() and
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
cmd->out.

Include <stdint.h>, <stdlib.h>, <string.h>, and <unistd.h> explicitly for
intptr_t, close(), read(), write(), malloc(), and strlen().

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/intel-tpebs.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/tools/perf/util/intel-tpebs.c b/tools/perf/util/intel-tpebs.c
index 7c0b8b15bd10..b81831f5e5a4 100644
--- a/tools/perf/util/intel-tpebs.c
+++ b/tools/perf/util/intel-tpebs.c
@@ -27,6 +27,10 @@
 #include <errno.h>
 #include <poll.h>
 #include <math.h>
+#include <stdint.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
 
 #define PERF_DATA		"-"
 
@@ -119,6 +123,8 @@ static int evsel__tpebs_start_perf_record(struct evsel *evsel)
 	tpebs_cmd.argv = record_argv;
 	tpebs_cmd.out = -1;
 	ret = start_command(&tpebs_cmd);
+	if (ret)
+		tpebs_cmd.out = -1;
 	zfree(&tpebs_cmd.argv);
 	list_for_each_entry(t, &tpebs_results, nd)
 		t->started = true;
@@ -220,13 +226,13 @@ static int process_sample_event(const struct perf_tool *tool __maybe_unused,
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
 
@@ -236,8 +242,10 @@ static void *__sample_reader(void *arg __maybe_unused)
 	tool.attr = perf_event__process_attr;
 
 	session = perf_session__new(&data, &tool);
-	if (IS_ERR(session))
+	if (IS_ERR(session)) {
+		close(data.file.fd);
 		return NULL;
+	}
 	perf_session__process_events(session);
 	perf_session__delete(session);
 
@@ -331,12 +339,14 @@ static int tpebs_stop(void) __must_hold(tpebs_mtx_get())
 	/* Like tpebs_start, we should only run tpebs_end once. */
 	if (tpebs_cmd.pid != 0) {
 		pid_t actual_pid = tpebs_cmd.pid;
+		pthread_t reader_thread;
 
 		tpebs_stopping = true;
 		tpebs_send_record_cmd(EVLIST_CTL_CMD_STOP_TAG);
 		tpebs_cmd.pid = 0;
+		reader_thread = tpebs_reader_thread;
 		mutex_unlock(tpebs_mtx_get());
-		pthread_join(tpebs_reader_thread, NULL);
+		pthread_join(reader_thread, NULL);
 		mutex_lock(tpebs_mtx_get());
 		if (control_fd[0] >= 0) {
 			close(control_fd[0]);
@@ -567,12 +577,14 @@ int evsel__tpebs_open(struct evsel *evsel)
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
 		ret = tpebs_send_record_cmd(EVLIST_CTL_CMD_ENABLE_TAG);
 	}
 out:
-- 
2.56.0.212.g129ede20d9-goog

