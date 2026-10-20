Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792529957;
	b=38sX77r+bnjFG9qzM9y58ZdQ1g9FGioQY+SDoDKRn30tkdGamEJY4Sop3e9VpFprSU9w
	 gNEvUQmAlELy5kPZ3FXuiTjqPXomL5CtOkAMx1dbZ6eVrL7o9UDQ5F1NyqdwbjAdl4/Sz
	 7m2WHq0xuNLddBAM8c/Pjgm3peOv2cFCmeENTpjv7ZAra/mVvLH8BGvvxmmEDvPTd9Ci9
	 H5kAgCect/hfoZDjFC9GRm/on9rhw9h5QjHyuC5KO9IUlpL/UbXDO5nldCZiq/O4Gc5mQ
	 t2nfzwbN23Bx07Uld4fAg8pLwWjymIqFGbOLgJR00XO3ClhQl9Y3Z99pzmTWaUPIiXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=N2qanCyCB4wF+VeUcB92quptg8ph71hHc9UNhycwS8A=;
	b=pzaNLA0gTu3wiMlmLIvsW0ZCp7VDdIGhvMQ7x42UIollcZzkqqJmbF48mJND6MY3FtoB
	 4nesHDKKLkTi5HA0IobNLSopOR7ss62wg0PibcV7CfnKHJCLk4TFIl45Yehw7mZdoqiCd
	 mN3FLyGfQq4an++U7fUAg8E45L2xlGc7cJ7DyzSxnOZ+mNof5lhJwcVTJfOMjRvzifqP/
	 lgF6gWu4S1HIIJfDliqIzVyCl6+Qkww5uXSzvWEEMNOTCGqTCVOSeZAoG1HTprOJEfHJ5
	 B4rlbH9vZAgBSp89gm2tJp/lahTCWiJEpLEce62cRFQE0pH+Yz0aWiDVt/q9AmPW4lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=AY8qpXwL;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E430E606A324
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E430E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=AY8qpXwL
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3552883bd19so10409759eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792529956; x=1793134756; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N2qanCyCB4wF+VeUcB92quptg8ph71hHc9UNhycwS8A=;
        b=AY8qpXwL36PexW/e1AxUNktCFLv+opVByRmFWFpezDMwVrRGpBgJBa+rIGtOd9A3Kx
         +zmL+3J15aWqZIhlurvVna4Fq6NND4E90sAS3GRsUp0siz38WXWvw2WGm/kcwR3ZOIJR
         wgNdf2ZRhVKmzS3jqmwwhyUgsxVztsd/ORNULc68Nasu9ZoAlYRITuxZRafk/mN4mc0X
         9L7c65wxcNF/yKIM2kmVTq7a1ksE4D+IU1lyCFAEW3qzZXWW/M4ENdn4ukXImqz9tQ33
         wSO1tuYsV/J1IimK1MWPRYxvtYjZGvmevlJ+hHDaOgO5sJBJAUUzdF7uifVebdf5Vd4u
         Qf7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792529956; x=1793134756;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N2qanCyCB4wF+VeUcB92quptg8ph71hHc9UNhycwS8A=;
        b=uvcwUmN9a8qj7Kxu7vdjYDfQIxlMSEkNoQv/LMmj3QX2u60tVRRYjOOIFLFneLNEbQ
         hYx11imbemRaCHVQsfqdtRW4E6nJqFb4BKVY6xn3eMkSsAfA1tznFoU6YJ9vdlhlPtcQ
         XsytGxF3oELcYEfIrMAThJlfGoAaROILq9TZU7sn/awqBV5XhunviPit+4FMyYlnHMen
         s0GfZ8a/5zvtX7EhcQr1D1HScE1uf3HUIaK4gekMwRnQQBF/0Qyb0iUk/O7J39po5Fke
         vaKEo2VNlnIUMI6eO3zK8tpgCn7zYGjvNE5DVaz3yJwP1gANJ8PXE9vIxghHfFr4lpWf
         quog==
X-Forwarded-Encrypted: i=1; AKwUvBzzgvD5AOXMAxRvpbstpNMTgPunRhvGTh3SATMnwI4Ozstdik2Vay2GJ50A54iAtSNbtiZ7tATax6+ILmI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5tm4z32NePzFqydTai7bKV4ZivPllLvuaZyrcorJ09CloeX15
	rb7VqZ6Fh330VTrDK07adaAKmwn3VRmD9PEuqL6klAn9nOIc4pTRSW0AM0QLlL/tO8nUYUCrVvf
	l+RLh6vcrig==
X-Received: from dlbvs4.prod.google.com ([2002:a05:7022:3f04:b0:17e:6ff3:49a4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:eb45:10b0:16b:fdbf:4a9c
 with SMTP id a92af1059eb24-190a599a3c5mr19499c88.23.1792529955721; Tue, 20
 Oct 2026 13:59:15 -0700 (PDT)
Date: Tue, 20 Oct 2026 13:58:51 -0700
In-Reply-To: <20261020205859.1080743-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261019220915.3943592-1-irogers@google.com> <20261020205859.1080743-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020205859.1080743-2-irogers@google.com>
Subject: [PATCH v5 1/8] perf lock contention: Filter events before creating lock_stat
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, ddhariwal@google.com, eranian@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In report_lock_contention_begin_event(), lock_stat_findnew() was
called before checking filters.nr_types (-Y), filters.nr_addrs (-L),
and match_callstack_filter() (-S).

When a filtered-out lock event (such as a mutex contention when
running with -Y spinlock) shared the same aggregation key as a
subsequent matching event (for example, contention on the mutex's
internal wait_lock spinlock from the same caller), the first event
created the lock_stat entry with the filtered-out lock's flags and the
second event reused that entry, causing non-spinlock entries to appear
in -Y spinlock output.

Check the type, address, and callstack filters before looking up or
creating the lock_stat entry.

Fixes: b4a7eff93c39 ("perf lock contention: Add -Y/--type-filter option")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-lock.c | 61 +++++++++++++++++++++------------------
 1 file changed, 33 insertions(+), 28 deletions(-)

diff --git a/tools/perf/builtin-lock.c b/tools/perf/builtin-lock.c
index d5c0d55cb82d..778923c92f42 100644
--- a/tools/perf/builtin-lock.c
+++ b/tools/perf/builtin-lock.c
@@ -975,6 +975,7 @@ static int report_lock_contention_begin_event(struct perf_sample *sample)
 	struct machine *machine = &session->machines.host;
 	struct map *kmap;
 	struct symbol *sym;
+	u64 *callstack = NULL;
 
 	ret = get_key_by_aggr_mode(&key, addr, sample);
 	if (ret < 0)
@@ -1010,33 +1011,6 @@ static int report_lock_contention_begin_event(struct perf_sample *sample)
 		}
 	}
 
-	ls = lock_stat_find(key);
-	if (!ls) {
-		char buf[128];
-		const char *name = "";
-
-		switch (aggr_mode) {
-		case LOCK_AGGR_ADDR:
-			sym = machine__find_kernel_symbol(machine, key, &kmap);
-			if (sym)
-				name = sym->name;
-			break;
-		case LOCK_AGGR_CALLER:
-			name = buf;
-			if (lock_contention_caller(sample, buf, sizeof(buf)) < 0)
-				name = "Unknown";
-			break;
-		case LOCK_AGGR_CGROUP:
-		case LOCK_AGGR_TASK:
-		default:
-			break;
-		}
-
-		ls = lock_stat_findnew(key, name, flags);
-		if (!ls)
-			return -ENOMEM;
-	}
-
 	if (filters.nr_types) {
 		bool found = false;
 
@@ -1066,7 +1040,7 @@ static int report_lock_contention_begin_event(struct perf_sample *sample)
 	}
 
 	if (needs_callstack()) {
-		u64 *callstack = get_callstack(sample, max_stack_depth);
+		callstack = get_callstack(sample, max_stack_depth);
 		if (callstack == NULL)
 			return 0;
 
@@ -1074,7 +1048,38 @@ static int report_lock_contention_begin_event(struct perf_sample *sample)
 			free(callstack);
 			return 0;
 		}
+	}
+
+	ls = lock_stat_find(key);
+	if (!ls) {
+		char buf[128];
+		const char *name = "";
+
+		switch (aggr_mode) {
+		case LOCK_AGGR_ADDR:
+			sym = machine__find_kernel_symbol(machine, key, &kmap);
+			if (sym)
+				name = sym->name;
+			break;
+		case LOCK_AGGR_CALLER:
+			name = buf;
+			if (lock_contention_caller(sample, buf, sizeof(buf)) < 0)
+				name = "Unknown";
+			break;
+		case LOCK_AGGR_CGROUP:
+		case LOCK_AGGR_TASK:
+		default:
+			break;
+		}
+
+		ls = lock_stat_findnew(key, name, flags);
+		if (!ls) {
+			free(callstack);
+			return -ENOMEM;
+		}
+	}
 
+	if (callstack) {
 		if (ls->callstack == NULL)
 			ls->callstack = callstack;
 		else
-- 
2.56.0.212.g129ede20d9-goog

