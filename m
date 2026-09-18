Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A1A3C5DC5
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789713180; cv=none; b=nzEhdLgZnIOftZpedTwyCC1SXzwxfV9Z7JmmEdl8chccXQPEm+0uMKJL6QeaKREOhEDlQMpYr4gMKjW5eRed43m0GcAfukxbaIrtZYVV0hNRd1qSiPUi702z/w296gx/C8aaswIDS+e3dfeDVkymG1jGpAod2CzzNZHYtZe3xto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789713180; c=relaxed/simple;
	bh=6piizERCZzYOWq5jXV2XG9t3u22hRs7JWPhh6sg00Fc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aFphQUjziNLRtSPJ4puS+bUnrMyuYyIzZVDLa3ZOSLPKrXbOpyMXE3tGszlT0qWo1GNlTEinQACamg97dx6g2V/lhajvJVlC47ShstJihkekxMDpgO+JLadtzG/eAurQWw4UHkO2M7PKwNtqwfX/IMo858cx1lZIG8hv9eBYQ+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EYsr0Jp9; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EYsr0Jp9"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39e087a17dfso875049a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789713178; x=1790317978; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4wzxGE12kx6/6XKkvEhnF8dFgypzNeSmABr+sADCRnA=;
        b=EYsr0Jp9nt3XelH3o9nEh94Lruh9eZUsV3v3A6hY7EcWuwgGMcZdVZWN0WU/kiCPkr
         qoBBwpE2P3hXRukbmTIqFxrUCAayE6cdSQ+VEebmUSCdOLTaMbLDYRB6JO8u5x/XkRRb
         VbOqCGZv+RGiEC5CyjiPO9Jh0dADLZBluN8cufFsZqGYVigXqDQ2mDGJdyo+XzIuErZT
         uWQdyUWDKnF9XL3LRAyNHeTSxvq7M4EOYpX21e6pohPxF6nxPwJh7rDtY/D4V+CNTZLq
         d2SOqoBnC4ojs6LxNEoTf/QBz4Xud5rpeFTWH/saC7SGxbgA93HfXCQJd3gX+rco2a2j
         /Uow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789713178; x=1790317978;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4wzxGE12kx6/6XKkvEhnF8dFgypzNeSmABr+sADCRnA=;
        b=1MyJBxqqm7zE9m1+aCSkvKXx0Cq9aswp5kLz4R2KLaS5IM5EmXdbI+ZJfq95hetaH8
         40NuWO6Re7NhKjNUkWb4xHM551TdX72SbIV0G2examQIWuEERuYGWG2vZBnrIAt6iqI8
         6isutcSfq9KDyKeXmh2Pxfebu1phbuP/hgM0+4nzmqERvLy3Wj94goA4shH7apb7gxB/
         +W9EIduEchVjDTHFGYoLUq85v8Zp2K8kcvPVbDEcftLQH9+lsnoX21obvPxv6e6e3fnm
         4/EH5eTtz6XrPdkPLoPit0h63fHOMiJFyJbk4tTwdXcPg6T7oxOhvroC1gLbBt/LAzFz
         ifww==
X-Forwarded-Encrypted: i=1; AKwUvBzi/6F6wWGGpmFpPLqnV5m55KpFhAXfL21OnEBdpkLx2quRCBWgQyGbQhJMvb1HcsbA7jOnu5tL77ajBJI=@vger.kernel.org
X-Gm-Message-State: AFuF++nQAkYhKwZekKltMK8Rvjvf2NG5fOMnD08taFsoi6rFHimLfoei
	UQIaeE07I5V80bpmpxlDulm8JPAas4qF48jLxNYkgrznKfcXd8NDfhBj8iq7ZQRXQZnxxiDLDsA
	P0ngVxH+rew==
X-Received: from dleb12-n2.prod.google.com ([2002:a05:701b:424c:20b0:13c:fe05:89a3])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:224c:b0:39b:61f1:8032
 with SMTP id 98e67ed59e1d1-39e54e7c18emr3356695a91.16.1789713178050; Thu, 17
 Sep 2026 23:32:58 -0700 (PDT)
Date: Thu, 17 Sep 2026 23:32:47 -0700
In-Reply-To: <20260918063249.2172589-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260918063249.2172589-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918063249.2172589-4-irogers@google.com>
Subject: [PATCH v1 3/5] perf trace-event: Free the global trace_event when a
 command ends
From: Ian Rogers <irogers@google.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

The tep handle behind trace_event__tp_format() is a process wide cache
of the running kernel's tracepoint formats and nothing ever released
it, as the comment above it had noted since the code was added.

Add trace_event__exit() and call it from run_builtin() next to the
existing perf_config__exit(). By then the builtin has returned, so the
tep_event pointers it handed out, such as the ones cached in
evsel->tp_format, are no longer reachable.

Note that this does not silence every libtraceevent report under
leak sanitizer. Parsing a print fmt drops a token inside the library
itself, and as those allocations are not linked into the handle,
freeing the handle cannot reclaim them.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/perf.c             |  6 ++++++
 tools/perf/util/trace-event.c | 22 +++++++++++++++++-----
 tools/perf/util/trace-event.h |  1 +
 3 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/tools/perf/perf.c b/tools/perf/perf.c
index 6c5baa285b13..d60bc929c257 100644
--- a/tools/perf/perf.c
+++ b/tools/perf/perf.c
@@ -32,6 +32,9 @@
 #include "util/build-id.h"
 #include "util/config.h"
 #include "util/debug.h"
+#ifdef HAVE_LIBTRACEEVENT
+#include "util/trace-event.h"
+#endif
 
 const char perf_usage_string[] =
 	"perf [--version] [--help] [OPTIONS] COMMAND [ARGS]";
@@ -379,6 +382,9 @@ static int run_builtin(const struct cmd_struct *p, int argc, const char **argv)
 
 	status = p->fn(argc, argv);
 	perf_config__exit();
+#ifdef HAVE_LIBTRACEEVENT
+	trace_event__exit();
+#endif
 	exit_browser(status);
 
 	if (status)
diff --git a/tools/perf/util/trace-event.c b/tools/perf/util/trace-event.c
index 826f75464171..819542a73f55 100644
--- a/tools/perf/util/trace-event.c
+++ b/tools/perf/util/trace-event.c
@@ -14,11 +14,9 @@
 #include "machine.h"
 
 /*
- * global trace_event object used by trace_event__tp_format
- *
- * TODO There's no cleanup call for this. Add some sort of
- * __exit function support and call trace_event__cleanup
- * there.
+ * Global trace_event object used by trace_event__tp_format. It caches the
+ * tracepoint formats of the running kernel for the lifetime of the command
+ * and is released by trace_event__exit.
  */
 static struct trace_event tevent;
 static bool tevent_initialized;
@@ -75,6 +73,20 @@ void trace_event__cleanup(struct trace_event *t)
 	t->plugin_list = NULL;
 }
 
+/*
+ * Release the global trace_event. Called once the command is done, when the
+ * tep_event pointers handed out by trace_event__tp_format are no longer in
+ * use.
+ */
+void trace_event__exit(void)
+{
+	if (!tevent_initialized)
+		return;
+
+	trace_event__cleanup(&tevent);
+	tevent_initialized = false;
+}
+
 /*
  * Returns NULL and sets errno on failure.
  */
diff --git a/tools/perf/util/trace-event.h b/tools/perf/util/trace-event.h
index 720121c74f1d..1c342fce36bb 100644
--- a/tools/perf/util/trace-event.h
+++ b/tools/perf/util/trace-event.h
@@ -32,6 +32,7 @@ bool have_tracepoints(struct list_head *evlist);
 
 int trace_event__init(struct trace_event *t);
 void trace_event__cleanup(struct trace_event *t);
+void trace_event__exit(void);
 int trace_event__register_resolver(struct machine *machine,
 				   tep_func_resolver_t *func);
 struct tep_event*
-- 
2.55.0.1082.g2b9226bbc0-goog

