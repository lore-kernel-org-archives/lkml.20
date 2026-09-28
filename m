Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F5B3914FA
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790619994; cv=none; b=F0htxbQ+eo+0biV99CzbdksFi4jlhMcL+Io2XVniS7SXZcueuhjAIJ0KP44/ZB9qFDIFc/desKlMcOS4CJnXq3Q08i8HWjiS4UoXp5NVmr8lygiRTZSOgAdJXnJsstNx7HrxS0KTxH3FJ3uC/KCZq4TMdD1O+7UHpeSnb56kAzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790619994; c=relaxed/simple;
	bh=x0c9r+m8YkXsE8vK0JvmaBesea7Dv2xfQ9Hn9IEaIQg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oqXF1RSCHrRp/0Opx2ZW/KkaEhB2LarOVVmokoKWLy4jeJLg0bmvxlX+TrW6mPnCza9i66zqMepzJZl2ocurYqe57wUijHDF/gpYMmyaiRwiLJ5uWM9Bqvwr/SIgUdt3tK069j7OJZMLQL0ixJxq5IondqUePHFNLtZIEVY47vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gy/tUeH4; arc=none smtp.client-ip=74.125.82.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gy/tUeH4"
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34344599f01so773941eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790619992; x=1791224792; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tQOX81l4i+MdF7wYiQTpB4FwjvgsQrx+lL/G82h2scE=;
        b=gy/tUeH4tfISN7CqX3AQ8PmmeSo2bUELsZ8t3VGl7BFkaUa2WlmyQ4mFXeyg9+sdXx
         SpbfJKFmcfMmJlyjKTc4p9LhtoLQElRdMoIb9rd5v731WxD0gMh2xMSp1hJbbDNEHIJ2
         5XFkjxTMpy2dTN5JApR1dgEYb5wF0d35kUkIh/bkyi0F3VXy1JopTcbSjHANqVyqtOLx
         cktQqGjLBc5xDKUJ9wFK4erRYcqXLVN4xzLiRmJ7cnCJtCeIyz3aIwR0SIhPnl5zk3tz
         ctYr8iMI1S/BFpAwJze0XNqRImYooPUarVKEAR17cYAoyB4NYx6WUILfMevBJ+NEq880
         To5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790619992; x=1791224792;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tQOX81l4i+MdF7wYiQTpB4FwjvgsQrx+lL/G82h2scE=;
        b=y3v3WQEMeGcriJjZYxSvkKHJvy1Pmab6a30RVGVJN21rO1PxQC+NA/IT8d6k7YArEf
         dFLk/p3CuOfmPZDFNd0w3uVGHLtPGDsSGDosxK+8fmoiVlsUbWkqp9wUECUfkZjisg3n
         /1x4uDlTJr/o5JBXVXTXDqMNK0gdwwj/i5Q5No8KVsQWKEBW6ZsU1zRBNTXcqx6ibQqc
         p4UVejBQFyVRFQq/zAdZWJzPYiCV3jxaDlRou1ZBGVEDshOeBu0Lc/4G/7dU0rt1Uhrk
         H59pZptKDE23dNypafRWrGVLmCQ3BhByYnyAxmz7oHOK16BORbl4OTcQ6ldXM2Em2VJo
         2HOg==
X-Forwarded-Encrypted: i=1; AKwUvBzh/2iXOfx6yqx8NyIBF2UrD5LzPHiCoc1EPSZ11OG0ONpqxsl4B3KiOblOffPMJzBmVyKZbcqcdqaWGFg=@vger.kernel.org
X-Gm-Message-State: AFuF++mM21uekjXF3wSseZ6dC+47v1QDn8Or4RcKBeSuOc+RlQd//vix
	VmQjnnNOcZn/1fXNq5xL6XJPmIma5/o55ZYV2KUUg3/YudBPIDSyiISxXNLdUxMX1akC4oMj+Yt
	88E1Km8xsnw==
X-Received: from dlbuj9.prod.google.com ([2002:a05:7022:3d89:b0:144:d1d0:a66])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:21d3:20b0:143:490b:93da
 with SMTP id a92af1059eb24-146d049730emr10532941c88.39.1790619991902; Mon, 28
 Sep 2026 11:26:31 -0700 (PDT)
Date: Mon, 28 Sep 2026 11:25:48 -0700
In-Reply-To: <20260928182605.3649015-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1790145937.git.irogers@google.com> <20260928182605.3649015-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928182605.3649015-10-irogers@google.com>
Subject: [PATCH v6 09/26] perf trace: Don't allocate syscall arg formats for
 internal fields
From: Ian Rogers <irogers@google.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Aaron Tomlin <atomlin@atomlin.com>
Cc: Howard Chu <howardchu95@gmail.com>, Jakub Brnak <jbrnak@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

syscall__read_info() sizes sc->arg_fmt by the tracepoint's field count,
which includes the internal fields that follow the arguments, and only
then subtracts them from sc->nr_args. syscall__alloc_arg_fmts() copies
sc->fmt->arg[] for every entry, so with more than 6 fields, for example
renameat2 with its 2 path strings, it reads beyond the end of that
RAW_SYSCALL_ARGS_NUM sized array. Count the arguments before allocating,
and pass the array's size to syscall_arg_fmt__init_array() so its walk
stops before the internal fields, rather than stepping beyond the array.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-trace.c | 43 +++++++++++++++++---------------------
 1 file changed, 19 insertions(+), 24 deletions(-)

diff --git a/tools/perf/builtin-trace.c b/tools/perf/builtin-trace.c
index 35d39a3fe803..6a54d8bff534 100644
--- a/tools/perf/builtin-trace.c
+++ b/tools/perf/builtin-trace.c
@@ -2282,13 +2282,13 @@ static bool field_is_ptr_sized(const struct tep_format_field *field)
 }
 
 static struct tep_format_field *
-syscall_arg_fmt__init_array(struct syscall_arg_fmt *arg, struct tep_format_field *field,
+syscall_arg_fmt__init_array(struct syscall_arg_fmt *arg, int nr, struct tep_format_field *field,
 			    bool *use_btf)
 {
 	struct tep_format_field *last_field = NULL;
 	int len;
 
-	for (; field; field = field->next, ++arg) {
+	for (; field && nr > 0; field = field->next, ++arg, --nr) {
 		/* assume it's the last argument */
 		if (is_internal_field(field))
 			continue;
@@ -2360,8 +2360,8 @@ syscall_arg_fmt__init_array(struct syscall_arg_fmt *arg, struct tep_format_field
 
 static int syscall__set_arg_fmts(struct syscall *sc)
 {
-	struct tep_format_field *last_field = syscall_arg_fmt__init_array(sc->arg_fmt, sc->args,
-									  &sc->use_btf);
+	struct tep_format_field *last_field = syscall_arg_fmt__init_array(sc->arg_fmt, sc->nr_args,
+									  sc->args, &sc->use_btf);
 
 	if (last_field)
 		sc->args_size = last_field->offset + last_field->size;
@@ -2373,7 +2373,8 @@ static int syscall__read_info(struct syscall *sc, struct trace *trace)
 {
 	char tp_name[128];
 	const char *name;
-	struct tep_format_field *field;
+	struct tep_format_field *args, *field;
+	int nr_args = 0;
 	int err;
 
 	if (sc->nonexistent)
@@ -2410,30 +2411,23 @@ static int syscall__read_info(struct syscall *sc, struct trace *trace)
 		return -errno;
 	}
 
-	/*
-	 * The tracepoint format contains __syscall_nr field, so it's one more
-	 * than the actual number of syscall arguments.
-	 */
-	if (syscall__alloc_arg_fmts(sc, sc->tp_format->format.nr_fields - 1))
-		return -ENOMEM;
-
-	sc->args = sc->tp_format->format.fields;
+	args = sc->tp_format->format.fields;
 	/*
 	 * We need to check and discard the first variable '__syscall_nr'
 	 * or 'nr' that mean the syscall number. It is needless here.
 	 * So drop '__syscall_nr' or 'nr' field but does not exist on older kernels.
 	 */
-	if (sc->args && (!strcmp(sc->args->name, "__syscall_nr") || !strcmp(sc->args->name, "nr"))) {
-		sc->args = sc->args->next;
-		--sc->nr_args;
-	}
+	if (args && (!strcmp(args->name, "__syscall_nr") || !strcmp(args->name, "nr")))
+		args = args->next;
 
-	field = sc->args;
-	while (field) {
-		if (is_internal_field(field))
-			--sc->nr_args;
-		field = field->next;
-	}
+	/* Internal fields follow the syscall arguments. */
+	for (field = args; field && !is_internal_field(field); field = field->next)
+		nr_args++;
+
+	if (syscall__alloc_arg_fmts(sc, nr_args))
+		return -ENOMEM;
+
+	sc->args = args;
 
 	sc->is_exit = !strcmp(name, "exit_group") || !strcmp(name, "exit");
 	sc->is_open = !strcmp(name, "open") || !strcmp(name, "openat");
@@ -2455,7 +2449,8 @@ static int evsel__init_tp_arg_scnprintf(struct evsel *evsel, bool *use_btf)
 		const struct tep_event *tp_format = evsel__tp_format(evsel);
 
 		if (tp_format) {
-			syscall_arg_fmt__init_array(fmt, tp_format->format.fields, use_btf);
+			syscall_arg_fmt__init_array(fmt, tp_format->format.nr_fields,
+						    tp_format->format.fields, use_btf);
 			return 0;
 		}
 	}
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

