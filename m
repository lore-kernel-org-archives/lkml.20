Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A05038735A
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 23:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790898388; cv=none; b=Elb74OxYFS6i0CguH+xPSrOCwdOCxtv5HKvcK1LLmQ9hi97O4hguM1j293cPPE3VJMyZHpYyxcLrXIgdcHgB/uT8VvypyWkJhEo3rwX+EfHsnUrT8dHx8QID66GiJIH+ITTrmwADoXUcq3RmoC3qnVlS3/ggA1AQs7pj/FaQ1jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790898388; c=relaxed/simple;
	bh=Whjk9IC5hygHpAH3BmB9KIBiB7myeCeEHo2qEY17RHc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OCJ2SLCL5DfKTDhs3bC8Vzo39CvNFvBiYKFythWmrH7s7tolTtXK4F43Sli5A12yLLIdvDRqxgf9ZHKReGvtSX42vR6WG4yV3rMjY8njxnXwn4dVaUurSHMxTabEJfyxhbKwjg2CpvLssQwRH3Po8AsgL0UWe1D5SGxbO3h5w9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=euEe1hdh; arc=none smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="euEe1hdh"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd046b87so5611981c88.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 16:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790898386; x=1791503186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h2hby3hPpEJUKa8O9qSBl+BlKsHlHonnOrzx+w19uMQ=;
        b=euEe1hdhF6VfSCJaFC3mITA/GfSSHXHztkyVXq/xe1bHJR54WDJmEODB8IAMYdP8Zs
         vUhM9NOsgWba/HE09LXsv/PRB6DL8i7CTo+H0Zyiemnjy4Mr9NhFSYptrCoxdg8tGA3Z
         BmoiJWdx0aiK3ogTp3m89tfOlUDZsKUvnghiP4hxXABflBetg9hFZ5OQVwWJYcPvssPr
         ayNyEBld2HJBpnCtOtdGVl15SnyHBEhkdovuWl6wlGZ1ejn2mhqYm86voMOIeMHrpmcY
         H+RK8vpwJvXXXgvcqbIt7UldFZ9GHO98yMdpQKoMQ8Hci2OFWKtJR+ymtro9Vvf97Uci
         8h7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790898386; x=1791503186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h2hby3hPpEJUKa8O9qSBl+BlKsHlHonnOrzx+w19uMQ=;
        b=s9a8e4CNoN9kalKiZPOWM1ICsbXZ/4Hjjo6Rb2esn1M43B4+eyi8zDssVHDg5fIYtC
         D5oMlU6Tulj5pgcVJmxY4bWrguZ/prz0I6lb8igUL5POn23Vg2jYsPAaHxOR0uQn7NYf
         sUBf1dpniHzannTKJb2tCslnypFmGf9BU0l4bcf0jUnaDTJNGnk5VZd1wvahTF3oQbd8
         sMpP33sitFE88sd4oH4hWD1fnJWkMaWdKOZMV/fDFJSGmuEG3Z3SesuaH6M7bpM8phoW
         3CrwJuaClwa2/CqOQZJXr9syD0/q0mWhB8JZ/oMUnJCYNgIs8MubToT3dSrfNvBSOiOx
         H32Q==
X-Forwarded-Encrypted: i=1; AKwUvBxeK46026odG5XXrOe3VEa1dR3EjKcQVAj//RlnEMzQ2T/WkM/VmsdaetvVDeMMt8/JWCsK0wtQ8dU83bk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuVDP3bPsgnSUaELG9GXU7UCG753u0lRW4y28O5ZcY78bxdIgB
	Rdg9vJXH1I26wKXzkm38frIRqReMpotGdpuvTOA0kUBEyNk0O10yFGh0MzO9ng==
X-Gm-Gg: AYBFou1rbIMipJjBgl/7TNPM+H3R7cP4mr2mwxMeMN0M5rdgcf9hqTyrKy06Lp8Uhqx
	Y7De2s4YrTZRAiiB/590qLfgjArKcn4CsXTbSnRovtqBIRZcI3drhNDfZred/89NHSPjP1hIKMa
	En1GhOBR33GayfrjCNhGXR5zOtGYgFV8krvJaHIuivc/xS6/ukef+iWCqKlQ1wsXN9pIeYl2hUW
	5+/4Le6r5p+TUgynX0VM3RKJCSZ6QFiPU/zYSNGyglKQ3FcBoS7oga/epNxy97U9KVesD1m0kfR
	VsmlElHA+2QZu3DzBtGknPhFHlyhCvjV1TNM/DJARK5INreAD+mC19NhPuXnmHKT/ynxDXQn7i/
	HYyzB7C5FF4Kv2bLAUvP5lgCVg1cCz8YBEVRbsuvpihgoTp9FxzVUUFnz0qJH6uGCey+zuHlZ24
	tUudYFFlomYOicNsSWuBZnXGEI07/q06tny77VpvQdX4lPAEynPTtRmk2Z6cNK4WT7NzWSjQ9/U
	x5YQ3Ki
X-Received: by 2002:a05:7022:ea8b:b0:148:302e:1bed with SMTP id a92af1059eb24-14f5c2f1505mr962254c88.38.1790898385400;
        Thu, 01 Oct 2026 16:46:25 -0700 (PDT)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f45fedd43sm2542818c88.4.2026.10.01.16.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 16:46:25 -0700 (PDT)
From: Zhengchuan Liang <zcliangcn@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Ross Zwisler <zwisler@google.com>,
	linux-perf-users@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhengchuan Liang <zcliangcn@gmail.com>
Subject: [PATCH v2 1/1] perf/core: Restrict function predicates in trace event filters
Date: Thu,  1 Oct 2026 16:46:11 -0700
Message-Id: <e66d86bf790ce51ca865c354a9b7a716c08b552f.1790891867.git.zcliangcn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1790891867.git.zcliangcn@gmail.com>
References: <cover.1790891867.git.zcliangcn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Count-only perf tracepoint events can be opened without tracepoint
permission because they do not expose raw sample data. Their
PERF_EVENT_IOC_SET_FILTER ioctl can still pass filter expressions to the
tracing parser.

A .function operand makes the parser resolve either a numeric kernel
address or a kernel symbol. The ioctl return value can therefore be used
as an oracle to recover the randomized kernel text base.

Trace events marked TRACE_EVENT_FL_CAP_ANY are different: task-local
events may expose their raw fields to unprivileged users. Syscall
tracepoints and uprobes deliberately use this exception, so denying every
filter without tracepoint permission would break their ordinary filters.

Check perf_allow_tracepoint() in perf. If permission is denied, continue
only for a task-attached TRACE_EVENT_FL_CAP_ANY event whose filter does
not contain an unquoted .function postfix. This rejects the predicate
before the tracing parser can resolve either form of operand. The scan
uses the parser's quote rules, so .function inside a string operand
remains an ordinary filter value.

This preserves ordinary filters on task-local events whose fields are
already available to the caller, while non-CAP_ANY filters and kernel
address resolution remain unavailable without tracepoint permission.

Fixes: e6745a4da964 ("tracing: Add a way to filter function addresses to function names")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Zhengchuan Liang <zcliangcn@gmail.com>
---
Changes in v2:
- Keep the entire fix in perf, without modifying kernel/trace/*, as
  requested by Steven.
- Preserve ordinary filters for task-local TRACE_EVENT_FL_CAP_ANY events
  while rejecting their unquoted .function predicates without tracepoint
  permission.
- Reject all filters on other trace events without tracepoint permission.
- Follow the tracing parser's quote rules so .function inside a string
  operand remains an ordinary value.

v1: https://lore.kernel.org/all/95d3721fa8d4c7a4577ec14e9d7caec4fd0cefcc.1790553331.git.zcliangcn@gmail.com/

 kernel/events/core.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 634d2ccbab82..11db8689ac90 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -12251,6 +12251,33 @@ perf_event_set_addr_filter(struct perf_event *event, char *filter_str)
 	return ret;
 }
 
+#ifdef CONFIG_EVENT_TRACING
+static bool perf_event_filter_has_function(const char *filter_str)
+{
+	char quote = 0;
+
+	for (; *filter_str; filter_str++) {
+		if (quote) {
+			if (*filter_str == quote)
+				quote = 0;
+			continue;
+		}
+
+		switch (*filter_str) {
+		case '\'':
+		case '"':
+			quote = *filter_str;
+			break;
+		default:
+			if (str_has_prefix(filter_str, ".function"))
+				return true;
+		}
+	}
+
+	return false;
+}
+#endif
+
 static int perf_event_set_filter(struct perf_event *event, void __user *arg)
 {
 	int ret = -EINVAL;
@@ -12264,6 +12291,14 @@ static int perf_event_set_filter(struct perf_event *event, void __user *arg)
 	if (perf_event_is_tracing(event)) {
 		struct perf_event_context *ctx = event->ctx;
 
+		ret = perf_allow_tracepoint();
+		if (ret && (!(event->attach_state & PERF_ATTACH_TASK) ||
+			    !(event->tp_event->flags & TRACE_EVENT_FL_CAP_ANY) ||
+			    perf_event_filter_has_function(filter_str))) {
+			kfree(filter_str);
+			return ret;
+		}
+
 		/*
 		 * Beware, here be dragons!!
 		 *
-- 
2.25.1
