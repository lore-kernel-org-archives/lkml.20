Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1210939C63E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790620015; cv=none; b=pGt/PRcpzhzATvaFE3bwKbOuJvj8IHhtJgNNfwYJINAC4Wq1gYJQJpKBpA/F6lZ47a/yfNFE1+minqr3xGUfAcBKo6FlEX5IWB6yUWgtVEklswpQemeqqhn4+/Gv2BrPROntjuESz2SDcEabiHc1c0ejJ220t62u7K7y44t9Cvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790620015; c=relaxed/simple;
	bh=oHzsdwx5aeU8Dp8T2d2iVVS7whNEEoSVkl+YcjQtyrI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PUhASEb1dOKQ6Bhuvez+l/Loe/BQmnUtzfT9+PAk0oMfMN7e124tWOyKwiZz8CJsB1Fm2h9Cy1a2tVwjUxTVMDHOBrZwGWbf4KgNoBxwr7WbCp7N6CjVqGoPr+pd0JhYYPyiUeTo4HrCm2ptyVNCAB753AZLTsUYfQGBE/SpsLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ToRdReVy; arc=none smtp.client-ip=74.125.82.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ToRdReVy"
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34318e88ba2so1663255eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790620013; x=1791224813; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g+1hiNg/m/mLz0NhE72Tn8428eFBoJJOVTop223mhcs=;
        b=ToRdReVyTMlyYEnb6rnYXdGJ00YX9yFS89JiHptOjUuZez3XzH2twMCMurNKj4ikQv
         /9phTYcOzVsNc+bhBPv+LRt28aqqv0SPnb7sDhG3OBcKq7W369c44LyMJMi/ldQvLm/o
         ZyPOVySQhkpDSQuK1BdLdaeyJKm+7pv+0FLVJ97S5F2ap5XX32xY0KPOpdX4rL/ujMw+
         O+L9Vb7hGzT3o2ukfRZcpalEE9Qm65kyC0GvdJcH9KK+AUUDK1ik98K0Fc2LQafjGjpY
         ykRglAnNHDm0JlWf6hDbY87hJTdGqESZaTMtobv10/P9vFGxVfXrV09cCCUw1ZI+6W9u
         u8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790620013; x=1791224813;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g+1hiNg/m/mLz0NhE72Tn8428eFBoJJOVTop223mhcs=;
        b=EEmYEusMNWFegiYSgtUQkxFbArAAvMRirOgi00exqc2b6ZGlPH7WAfhTeP6uC0JiNM
         0rjGBlUqgWKi8uXhOm4miZ0d/YsTuJxDnpcS02eLyNjSilkVOpjKoGHfxYR/XkU/73Up
         mc7buwbSBl7/F+AaDONjn4nSIHyKIkfMGECZzvw4t9WlcWzxuDNyC3mjWFApEQgb8eml
         1Uz+pFjH4MWiK3dG1nfXvb2uJ/MjLG6JmRllzG+dxHtl2/8pW1UMJbcNa3XMp+GPb6Da
         u+Sklnj03Od4VbJnKlME/tuRi0QZsH3w1zp61zaft5C6ouCDQDNinsFk8js4ZMImGdo6
         C+Qw==
X-Forwarded-Encrypted: i=1; AKwUvBxmhmyqWprBlX2ZmXSpSClh3yZFWFUiqAitA7G694ijaPMjx0lkMqYw+IZVyMRfpn8KyY0bM9X8Y5ggc5I=@vger.kernel.org
X-Gm-Message-State: AFuF++n8jvtiq/AcEIehKArjlVGu0zPWZFUs1FbtclUPx8DJ+/u5BYsg
	O5cKOyzhgTD87EgeAwJbV0otizxD/jkhQ4z7AXjdap6NotpR43Ni1YEq+BNKTgmeR5Ax9CMSre3
	hW/I/Br8zJg==
X-Received: from dlk3.prod.google.com ([2002:a05:7022:103:b0:14a:f387:29b1])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4344:b0:144:fc5b:2121
 with SMTP id a92af1059eb24-146ce67fa31mr10998946c88.17.1790620012138; Mon, 28
 Sep 2026 11:26:52 -0700 (PDT)
Date: Mon, 28 Sep 2026 11:25:57 -0700
In-Reply-To: <20260928182605.3649015-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1790145937.git.irogers@google.com> <20260928182605.3649015-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928182605.3649015-19-irogers@google.com>
Subject: [PATCH v6 18/26] perf trace: Remove unused code
From: Ian Rogers <irogers@google.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Aaron Tomlin <atomlin@atomlin.com>
Cc: Howard Chu <howardchu95@gmail.com>, Jakub Brnak <jbrnak@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Namhyung Kim <namhyung@kernel.org>

Now syscall init for augmented arguments is simplified.  Let's get rid
of dead code.

Signed-off-by: Namhyung Kim <namhyung@kernel.org>
Link: https://lore.kernel.org/r/20250814071754.193265-5-namhyung@kernel.org
Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-trace.c | 110 -------------------------------------
 1 file changed, 110 deletions(-)

diff --git a/tools/perf/builtin-trace.c b/tools/perf/builtin-trace.c
index 3dd40f3c3cbb..1be355a3ae22 100644
--- a/tools/perf/builtin-trace.c
+++ b/tools/perf/builtin-trace.c
@@ -490,38 +490,6 @@ static int evsel__init_syscall_tp(struct evsel *evsel)
 	return -ENOMEM;
 }
 
-static int evsel__init_augmented_syscall_tp(struct evsel *evsel, struct evsel *tp)
-{
-	struct syscall_tp *sc = evsel__syscall_tp(evsel);
-
-	if (sc != NULL) {
-		struct tep_format_field *syscall_id = evsel__field(tp, "id");
-		if (syscall_id == NULL)
-			syscall_id = evsel__field(tp, "__syscall_nr");
-		if (syscall_id == NULL ||
-		    __tp_field__init_uint(&sc->id, syscall_id->size, syscall_id->offset, evsel->needs_swap))
-			return -EINVAL;
-
-		return 0;
-	}
-
-	return -ENOMEM;
-}
-
-static int evsel__init_augmented_syscall_tp_args(struct evsel *evsel)
-{
-	struct syscall_tp *sc = __evsel__syscall_tp(evsel);
-
-	return __tp_field__init_ptr(&sc->args, sc->id.offset + sizeof(u64));
-}
-
-static int evsel__init_augmented_syscall_tp_ret(struct evsel *evsel)
-{
-	struct syscall_tp *sc = __evsel__syscall_tp(evsel);
-
-	return __tp_field__init_uint(&sc->ret, sizeof(u64), sc->id.offset + sizeof(u64), evsel->needs_swap);
-}
-
 static int evsel__init_raw_syscall_tp(struct evsel *evsel, void *handler)
 {
 	if (evsel__syscall_tp(evsel) != NULL) {
@@ -5914,7 +5882,6 @@ int cmd_trace(int argc, const char **argv)
 	};
 	bool __maybe_unused max_stack_user_set = true;
 	bool mmap_pages_user_set = true;
-	struct evsel *evsel;
 	const char * const trace_subcommands[] = { "record", NULL };
 	int err = -1;
 	char bf[BUFSIZ];
@@ -6080,83 +6047,6 @@ int cmd_trace(int argc, const char **argv)
 		}
 	}
 
-	/*
-	 * If we are augmenting syscalls, then combine what we put in the
-	 * __augmented_syscalls__ BPF map with what is in the
-	 * syscalls:sys_exit_FOO tracepoints, i.e. just like we do without BPF,
-	 * combining raw_syscalls:sys_enter with raw_syscalls:sys_exit.
-	 *
-	 * We'll switch to look at two BPF maps, one for sys_enter and the
-	 * other for sys_exit when we start augmenting the sys_exit paths with
-	 * buffers that are being copied from kernel to userspace, think 'read'
-	 * syscall.
-	 */
-	if (trace.syscalls.events.bpf_output) {
-		evlist__for_each_entry(trace.evlist, evsel) {
-			bool raw_syscalls_sys_exit = evsel__name_is(evsel, "raw_syscalls:sys_exit");
-
-			if (raw_syscalls_sys_exit) {
-				trace.raw_augmented_syscalls = true;
-				goto init_augmented_syscall_tp;
-			}
-
-			if (trace.syscalls.events.bpf_output->priv == NULL &&
-			    strstr(evsel__name(evsel), "syscalls:sys_enter")) {
-				struct evsel *augmented = trace.syscalls.events.bpf_output;
-				if (evsel__init_augmented_syscall_tp(augmented, evsel) ||
-				    evsel__init_augmented_syscall_tp_args(augmented))
-					goto out;
-				/*
-				 * Augmented is __augmented_syscalls__ BPF_OUTPUT event
-				 * Above we made sure we can get from the payload the tp fields
-				 * that we get from syscalls:sys_enter tracefs format file.
-				 */
-				augmented->handler = trace__sys_enter;
-				/*
-				 * Now we do the same for the *syscalls:sys_enter event so that
-				 * if we handle it directly, i.e. if the BPF prog returns 0 so
-				 * as not to filter it, then we'll handle it just like we would
-				 * for the BPF_OUTPUT one:
-				 */
-				if (evsel__init_augmented_syscall_tp(evsel, evsel) ||
-				    evsel__init_augmented_syscall_tp_args(evsel))
-					goto out;
-				evsel->handler = trace__sys_enter;
-			}
-
-			if (strstarts(evsel__name(evsel), "syscalls:sys_exit_")) {
-				struct syscall_tp *sc;
-init_augmented_syscall_tp:
-				if (evsel__init_augmented_syscall_tp(evsel, evsel))
-					goto out;
-				sc = __evsel__syscall_tp(evsel);
-				/*
-				 * For now with BPF raw_augmented we hook into
-				 * raw_syscalls:sys_enter and there we get all
-				 * 6 syscall args plus the tracepoint common
-				 * fields and the syscall_nr (another long).
-				 * So we check if that is the case and if so
-				 * don't look after the sc->args_size but
-				 * always after the full raw_syscalls:sys_enter
-				 * payload, which is fixed.
-				 *
-				 * We'll revisit this later to pass
-				 * s->args_size to the BPF augmenter (now
-				 * tools/perf/examples/bpf/augmented_raw_syscalls.c,
-				 * so that it copies only what we need for each
-				 * syscall, like what happens when we use
-				 * syscalls:sys_enter_NAME, so that we reduce
-				 * the kernel/userspace traffic to just what is
-				 * needed for each syscall.
-				 */
-				if (trace.raw_augmented_syscalls)
-					trace.raw_augmented_syscalls_args_size = (6 + 1) * sizeof(long) + sc->id.offset;
-				evsel__init_augmented_syscall_tp_ret(evsel);
-				evsel->handler = trace__sys_exit;
-			}
-		}
-	}
-
 	if ((argc >= 1) && (strcmp(argv[0], "record") == 0)) {
 		err = trace__record(&trace, argc-1, &argv[1]);
 		goto out;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

