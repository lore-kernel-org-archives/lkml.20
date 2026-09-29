Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C57842CAEB
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790663451; cv=none; b=ezjavEkzKAFiEIyCZHqrCOSAMF6bpiNJo6Y3NTlAYS6eLzTjI1pdGrdO0fYFTNYWRwvYfHJWgP6+mNY1NF0hIyIa3a+lf8yE7tr8EBBvsUkhCAWb25orLkhYrsUgxK1bMm6rU0WgWwi8GEUCfv54YabQIAdMkLYTNDjzYvFFGU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790663451; c=relaxed/simple;
	bh=+5mCHzqdxicIbV6OEcD52f4g5tadTjdqEMtLJlys7+E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TSyyJ3nv5k2phYmfKU3I9oGYHzUmJiKMrILbzsbnrqp39vmvNp2pzO0k+CRU9vWsmuaTsefBcad0UpvdoWO0LXDUjVjuvThvuyZOwyRGSh8obwP2Q9tATbiW17SP5eFaV5HvNfmlDDdZFDmuVHQDQ469cZHiA037wHk16fOk+eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UaZqEBDa; arc=none smtp.client-ip=74.125.82.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UaZqEBDa"
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1384427c3efso5847694c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790663438; x=1791268238; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k2UzG9Zh3qy5dBy9lLYJhP79Gs6FI0RnVdSQ0CvU7P0=;
        b=UaZqEBDaFtYGeIQmTIGtbfvN6xXCE5C87/7X0RwNj06fwbWdpu3qLd2jKFybNmeIfa
         JHJHfeP1t9ZJ2KjksX1PfMATGchaTBfpkxhMdxqynpxSW60X1F1todhBGfh8beBjVwY0
         mwlc2E5+B5Ep3f0prGe8MJIdNFXajqz9MMHHn9DR0r3cGqp1ttbDY6+D5MvbUJLAyO6O
         Zq+BBRsm52Zi4/UJjaz2+NWs20ZO7NkSscRKopUOv0o5x7w8F2fzxUxLBhEkI5ZBli8s
         KZ0p6d+TpGbc1jsu0HtMevt61fsggEDJwUcxwPQElyAYoeFwsyZ+cgIUQkDwaV+C2BLu
         GhgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790663438; x=1791268238;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k2UzG9Zh3qy5dBy9lLYJhP79Gs6FI0RnVdSQ0CvU7P0=;
        b=cxQTyXGJuUD5E9S0twatfsdgNeK1Ci47iY0OAJaBd2TMi5ZIvdSaA453kDDH+CXfN2
         aldFFYDoLrc3guRiknsF3bz11ynIvNMl/wwS+R4mUHRQzGjPQq5X7B4JlOJnvlHF9Viv
         NCBAyx5PLpC47/5JgLRG/4Iomc2nqR+fZuYPYA380I3BBXUwUF0X4VVcBdSoQ308KCCw
         nOgJxjURtQPZDpvQXAOjeEH5GF+ZamMPGSPlAhshh1QvKu65PT+Z8k1GFZx4pgSObF2f
         slPJfqk381JxtbLy7ApoqIQy1GI4S6dYFIV1fB52U1WP9nkZrYqbp65uNwMT2ZQJgYNq
         lR+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxC8hNCde5dnxk6AoVY6GwP16sshUURvMEZbHWYLUBe4TV9XUUxecRHMxOFKy5WlGLsR5gsfHRjspzd9NM=@vger.kernel.org
X-Gm-Message-State: AFuF++l7ysRhmaF3OLCOhkYLxeIc9FNf2vtrFA3KpXHTrJ/IM0LXwhBs
	a77XzlMhiDWWMIVS6w51yIdTWsOuKAkAyWU0EDV9rlWuqIZnOyZTOjTl96T8Xu8RR5It4jB3Q0i
	a+WTQSXhisw==
X-Received: from dlbpv14.prod.google.com ([2002:a05:7023:90e:b0:144:c590:e885])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4555:20b0:147:94bd:193f
 with SMTP id a92af1059eb24-14794bd1c87mr10301499c88.22.1790663437883; Mon, 28
 Sep 2026 23:30:37 -0700 (PDT)
Date: Mon, 28 Sep 2026 23:29:37 -0700
In-Reply-To: <20260929062937.374137-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929021913.56010-1-irogers@google.com> <20260929062937.374137-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929062937.374137-10-irogers@google.com>
Subject: [PATCH v2 9/9] perf pmu: Fix race with concurrent tracepoint creation
 and removal in perf list
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

perf_pmus__print_pmu_events() first counts events via
perf_pmu__num_events() to allocate the aliases array, then populates it
via perf_pmu__for_each_event(). When dynamic tracepoints (such as
kprobes or uprobes during 'perf test' runs) are concurrently created or
removed between the two passes:
- If an event is removed, state.index is smaller than the allocated len,
  leaving trailing zeroed entries in aliases[] with name == NULL and
  pmu == NULL, which causes qsort(cmp_sevent) or the print loop to crash
  with SIGSEGV.
- If a dynamic tracepoint subsystem directory is removed while scanning
  /sys/kernel/tracing/events, tp_pmu__for_each_tp_event() returns
  -ENOENT and aborts enumeration of all remaining tracepoint subsystems.
- If an event is added, perf_pmus__print_pmu_events__callback() aborts
  enumeration when state->index reaches state->aliases_len.

Grow state->aliases dynamically via realloc() when needed, use
state.index as the actual populated length for sorting and printing, and
ignore -ENOENT when a tracepoint subsystem directory disappears during
enumeration.

Fixes: c3245d2093c1 ("perf pmu: Abstract alias/event struct")
Fixes: 45b6e281cb06 ("perf tp_pmu: Add event APIs")
Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/pmus.c   | 21 +++++++++++++++++----
 tools/perf/util/tp_pmu.c |  8 ++++++--
 2 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/tools/perf/util/pmus.c b/tools/perf/util/pmus.c
index e0a4cb2428ca..1355b317f3ed 100644
--- a/tools/perf/util/pmus.c
+++ b/tools/perf/util/pmus.c
@@ -8,6 +8,7 @@
 #include <sys/types.h>
 #include <ctype.h>
 #include <pthread.h>
+#include <stdlib.h>
 #include <string.h>
 #include <unistd.h>
 #include "cpumap.h"
@@ -571,7 +572,7 @@ static int cmp_sevent(const void *a, const void *b)
 	}
 
 	/* Order by event name. */
-	return strcmp(as->name, bs->name);
+	return strcmp(as->name ?: "", bs->name ?: "");
 }
 
 static bool pmu_alias_is_duplicate(struct sevent *a, struct sevent *b)
@@ -581,7 +582,7 @@ static bool pmu_alias_is_duplicate(struct sevent *a, struct sevent *b)
 		return false;
 
 	/* Don't remove duplicates for different PMUs */
-	return strcmp(a->pmu_name, b->pmu_name) == 0;
+	return strcmp(a->pmu_name ?: "", b->pmu_name ?: "") == 0;
 }
 
 struct events_callback_state {
@@ -597,8 +598,18 @@ static int perf_pmus__print_pmu_events__callback(void *vstate,
 	struct sevent *s;
 
 	if (state->index >= state->aliases_len) {
-		pr_err("Unexpected event %s/%s/\n", info->pmu->name, info->name);
-		return 1;
+		size_t new_len = max_t(size_t, 16, state->aliases_len * 2);
+		struct sevent *new_aliases;
+
+		new_aliases = realloc(state->aliases, new_len * sizeof(struct sevent));
+		if (!new_aliases) {
+			pr_err("Unexpected event %s/%s/\n", info->pmu->name, info->name);
+			return 1;
+		}
+		memset(&new_aliases[state->aliases_len], 0,
+		       (new_len - state->aliases_len) * sizeof(struct sevent));
+		state->aliases = new_aliases;
+		state->aliases_len = new_len;
 	}
 	assert(info->pmu != NULL || info->name != NULL);
 	s = &state->aliases[state->index];
@@ -654,6 +665,8 @@ void perf_pmus__print_pmu_events(const struct print_callbacks *print_cb, void *p
 		perf_pmu__for_each_event(pmu, skip_duplicate_pmus, &state,
 					 perf_pmus__print_pmu_events__callback);
 	}
+	aliases = state.aliases;
+	len = state.index;
 	qsort(aliases, len, sizeof(struct sevent), cmp_sevent);
 	for (int j = 0; j < len; j++) {
 		/* Skip duplicates */
diff --git a/tools/perf/util/tp_pmu.c b/tools/perf/util/tp_pmu.c
index c2be8c9f9084..5ac732e06841 100644
--- a/tools/perf/util/tp_pmu.c
+++ b/tools/perf/util/tp_pmu.c
@@ -151,7 +151,9 @@ static int for_each_event_cb(void *state, const char *sys_name, const char *evt_
 
 static int for_each_event_sys_cb(void *state, const char *sys_name)
 {
-	return tp_pmu__for_each_tp_event(sys_name, state, for_each_event_cb);
+	int ret = tp_pmu__for_each_tp_event(sys_name, state, for_each_event_cb);
+
+	return ret == -ENOENT ? 0 : ret;
 }
 
 int tp_pmu__for_each_event(struct perf_pmu *pmu, void *state, pmu_event_callback cb)
@@ -176,7 +178,9 @@ static int num_events_cb(void *state, const char *sys_name __maybe_unused,
 
 static int num_events_sys_cb(void *state, const char *sys_name)
 {
-	return tp_pmu__for_each_tp_event(sys_name, state, num_events_cb);
+	int ret = tp_pmu__for_each_tp_event(sys_name, state, num_events_cb);
+
+	return ret == -ENOENT ? 0 : ret;
 }
 
 size_t tp_pmu__num_events(struct perf_pmu *pmu __maybe_unused)
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

