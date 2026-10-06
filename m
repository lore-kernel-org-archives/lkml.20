Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4384C9E1A
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791327078; cv=none; b=i9ObveDKHLp5jOv5fODorDmTted81Sy1CHjQ46unCSKsy1hqnU0ZsvrJVfM2tjkpTLwX0jc4k692H4S7V3+o7RGBVRXZJtUo/J9oIgq1m82pDM8Jn20PSfgO5OuYfjnqTU0TWb6JlM381jCGDXvrssCFgkGiDOqTl+bYEpx8fk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791327078; c=relaxed/simple;
	bh=LtqBfUkMehdLjlMovd2yp1Je0fkDCULYYEXjSV5piI4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hSu4L4KkTEpcy2E7u2b785YZpN2qBwWu2xUr+Jgg1YB8DlhigDOu27tIylXp2ppQU5MwTXq8gO5ny9+1uRsz3bo8KvHKw9MwYML9/+HvfD0kGYxcKwNUNKxc6I1uD05ACNqkS1tv43r+jc5k2MNok6WinoQ11JtXAGOl3DVUfWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=BWfwbuxv; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="BWfwbuxv"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-43bf9548df4so703617fac.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791327077; x=1791931877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ToOAV8TgXOyA3LFSl1CewS9crYTHWwfFriGHE0UgWII=;
        b=BWfwbuxvN9LUh+2X334METZu5dlDr+Yam/WtnQ2QsYCWZ5dI5k2aJArNOAvZODtH9V
         qorwBWxJcpv5G3MoupOkoJAduht0U0iwb40Z3FejLAIxZQokZpTlvAmW+Ul/18hr6AJ/
         h/1skRxrJOu2W5nuj2HKSq7igH2iE/hGxbfUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791327077; x=1791931877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ToOAV8TgXOyA3LFSl1CewS9crYTHWwfFriGHE0UgWII=;
        b=QSpJa1zNOSRk4ZUy8DAI52wmNv1OM+BR24RM9k+HRfZucTmg0tK7L7AHdFzgEYFXP5
         zQCW0EMvc2BZvUNLD9Vae80GvVzthhUkbEFd21TjYMsZz8wz9Yw62+4AiAvGTpAeD13E
         VebE8Jq4PdYCw92pVrPbUISCeyu4bKE+y7+YB7MH1GX8+ynhdD0Hu/HbmRMtLFGlt7W/
         MCf2kGap+QYB7Yq3RwLnNCsCfIRztd+EF3up4opL3aWDwulicXc8Ey+6PoJ4tsEJxPeB
         vVXjvrqW4RCcDwvXBPSw4MKcCzfZZcMQs2xrWJLteljogAhoXdoAL/ZzgELTLFCu9Ihk
         F11Q==
X-Gm-Message-State: AFuF++l5wRlr3PeisXUK8QJXRPLUik8gifnoNFaa/p2z++t+8HDWOKDG
	gvdweY9VAKFZhtpA6oSgQ1qDVPQWb7IU+724uR0k90iZNwBkgTfYTtVyRKh21YCQtoQ=
X-Gm-Gg: AYBFou3R+TzpHGRSj+FobNYcCc3CVUI7Py8SfcXZkJUUbq+Xys+/Sdf7LFJMqVZIDHs
	YXJY1ZdvQZXpzyjdTrJJ6faNnIqS77X7G5Sv60nDdpyRvf1ogX85J+zB7IztZOm9NLt16KUQyIt
	7nowcY0lCfRkl5nBzRWYuIclhein7yEIr/rlX6DnNePj9jR8Qc1rFgldQDjObuawZV54Zt7yFvH
	QrUJauFdDMVLzONGdQ40GWcxxWRHhfnmYTXKlFlFdyQn13mErUgph/NqdYQ4+ufk6D5tNtSZpA1
	GSZlsqaltFN6PnWL6VQyWbDwwY/GQWa4dAK31kQt5ayDe2Ml2PpjxyDNLC3tU8+6sj/zYG7TUt4
	8qJUwBGnJfTP9g4QcpnHzmA2XDvAXcGsfvLUzinowwWkTtE9Ud/524oBGcDpeWvAAfr831nUqLg
	650SBNs24Jo4/UxUA5CEV3OvSEWGONIibXP9LaxRxAd5XBeIkJ3ZI6boYAX93/mdtzylPYQJ34N
	XUaFOIH6AFAw8G1zru6vMdL7os53F34GnZ/goCgNlrVDViUGv26f5rYPW1nSzhdBQUuUKkb1LOr
	86Fh/MfHhg==
X-Received: by 2002:a05:6870:ab08:b0:42c:49c7:a499 with SMTP id 586e51a60fabf-4a25920b9c7mr482958fac.3.1791327076582;
        Tue, 06 Oct 2026 15:51:16 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a257228c01sm638027fac.14.2026.10.06.15.51.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 06 Oct 2026 15:51:16 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: linux-trace-kernel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	outbounddisclosures@openai.com,
	Kyle Zeng <kylebot@openai.com>,
	stable@vger.kernel.org
Subject: [PATCH] tracing/filters: Check perf permissions before resolving .function
Date: Tue,  6 Oct 2026 15:51:12 -0700
Message-ID: <20261006225112.53503-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

perf_trace_event_perm() allows tracepoint counters that do not request
PERF_SAMPLE_RAW without raw tracepoint permissions. A self-targeted,
disabled event with exclude_kernel=1 can therefore reach the filter
compiler even at perf_event_paranoid=2.

The .function suffix accepts any field of sizeof(long) and resolves its
operand through kallsyms_lookup_name() and kallsyms_lookup_size_offset().
The success or failure of a numeric filter discloses whether an address
belongs to a known kernel symbol range. On x86-64 this can be used to
recover the randomized kernel image base. A named filter also exposes
the resolved symbol range through the counter when the tracepoint field
is controlled by the caller, as with a syscall argument.

Pass the filter's perf origin to the predicate parser and require
perf_allow_tracepoint() before resolving a .function operand. This uses
the same sysctl, initial-namespace capability and LSM policy as raw
tracepoint access, and closes both the numeric and named-symbol oracles.
Do not change ordinary perf counting filters or filters created through
the separately controlled tracefs interfaces.

Fixes: e6745a4da964 ("tracing: Add a way to filter function addresses to function names")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-6-astra
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
 kernel/trace/trace_events_filter.c | 39 ++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 10 deletions(-)

diff --git a/kernel/trace/trace_events_filter.c b/kernel/trace/trace_events_filter.c
index 2b46ca536045..0f8c2054f4a7 100644
--- a/kernel/trace/trace_events_filter.c
+++ b/kernel/trace/trace_events_filter.c
@@ -1625,12 +1625,18 @@ static int filter_pred_fn_call(struct filter_pred *pred, void *event)
 	}
 }
 
+struct filter_parse_data {
+	struct trace_event_call *call;
+	bool is_perf;
+};
+
 /* Called when a predicate is encountered by predicate_parse() */
 static int parse_pred(const char *str, void *data,
 		      int pos, struct filter_parse_error *pe,
 		      struct filter_pred **pred_ptr)
 {
-	struct trace_event_call *call = data;
+	struct filter_parse_data *pdata = data;
+	struct trace_event_call *call = pdata->call;
 	struct ftrace_event_field *field;
 	struct filter_pred *pred = NULL;
 	unsigned long offset;
@@ -1683,6 +1689,14 @@ static int parse_pred(const char *str, void *data,
 
 	/* See if the field is a kernel function name */
 	if ((len = str_has_prefix(str + i, ".function"))) {
+		/* Even counting filters can disclose kernel addresses. */
+		if (pdata->is_perf) {
+			ret = perf_allow_tracepoint();
+			if (ret) {
+				parse_error(pe, ret, pos + i);
+				return ret;
+			}
+		}
 		function = true;
 		i += len;
 	}
@@ -2205,8 +2219,12 @@ static int calc_stack(const char *str, int *parens, int *preds, int *err)
 static int process_preds(struct trace_event_call *call,
 			 const char *filter_string,
 			 struct event_filter *filter,
-			 struct filter_parse_error *pe)
+			 struct filter_parse_error *pe, bool is_perf)
 {
+	struct filter_parse_data data = {
+		.call = call,
+		.is_perf = is_perf,
+	};
 	struct prog_entry *prog;
 	int nr_parens;
 	int nr_preds;
@@ -2232,7 +2250,7 @@ static int process_preds(struct trace_event_call *call,
 		return -EINVAL;
 
 	prog = predicate_parse(filter_string, nr_parens, nr_preds,
-			       parse_pred, call, pe);
+			       parse_pred, &data, pe);
 	if (IS_ERR(prog))
 		return PTR_ERR(prog);
 
@@ -2281,7 +2299,7 @@ static int process_system_preds(struct trace_subsystem_dir *dir,
 		if (!filter->filter_string)
 			goto fail_mem;
 
-		err = process_preds(file->event_call, filter_string, filter, pe);
+		err = process_preds(file->event_call, filter_string, filter, pe, false);
 		if (err) {
 			filter_disable(file);
 			parse_error(pe, FILT_ERR_BAD_SUBSYS_FILTER, 0);
@@ -2377,6 +2395,7 @@ static void create_filter_finish(struct filter_parse_error *pe)
  * @call: trace_event_call to create a filter for
  * @filter_string: filter string
  * @set_str: remember @filter_str and enable detailed error in filter
+ * @is_perf: filter is being created for a perf event
  * @filterp: out param for created filter (always updated on return)
  *           Must be a pointer that references a NULL pointer.
  *
@@ -2391,7 +2410,7 @@ static void create_filter_finish(struct filter_parse_error *pe)
  */
 static int create_filter(struct trace_array *tr,
 			 struct trace_event_call *call,
-			 char *filter_string, bool set_str,
+			 char *filter_string, bool set_str, bool is_perf,
 			 struct event_filter **filterp)
 {
 	struct filter_parse_error *pe = NULL;
@@ -2405,7 +2424,7 @@ static int create_filter(struct trace_array *tr,
 	if (err)
 		return err;
 
-	err = process_preds(call, filter_string, *filterp, pe);
+	err = process_preds(call, filter_string, *filterp, pe, is_perf);
 	if (err && set_str)
 		append_filter_err(tr, pe, *filterp);
 	create_filter_finish(pe);
@@ -2418,7 +2437,7 @@ int create_event_filter(struct trace_array *tr,
 			char *filter_str, bool set_str,
 			struct event_filter **filterp)
 {
-	return create_filter(tr, call, filter_str, set_str, filterp);
+	return create_filter(tr, call, filter_str, set_str, false, filterp);
 }
 
 /**
@@ -2476,7 +2495,7 @@ int apply_event_filter(struct trace_event_file *file, char *filter_string)
 		return 0;
 	}
 
-	err = create_filter(file->tr, call, filter_string, true, &filter);
+	err = create_filter(file->tr, call, filter_string, true, false, &filter);
 
 	/*
 	 * Always swap the call filter with the new filter
@@ -2721,7 +2740,7 @@ int ftrace_profile_set_filter(struct perf_event *event, int event_id,
 	if (event->filter)
 		return -EEXIST;
 
-	err = create_filter(NULL, call, filter_str, false, &filter);
+	err = create_filter(NULL, call, filter_str, false, true, &filter);
 	if (err)
 		goto free_filter;
 
@@ -2868,7 +2887,7 @@ static __init int ftrace_test_event_filter(void)
 		int err;
 
 		err = create_filter(NULL, &event_ftrace_test_filter,
-				    d->filter, false, &filter);
+				    d->filter, false, false, &filter);
 		if (err) {
 			printk(KERN_INFO
 			       "Failed to get filter for '%s', err %d\n",

base-commit: fd179f8a05be3ccae366b9b96e176b51fbe54aab
