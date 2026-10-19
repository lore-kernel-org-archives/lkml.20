Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792447767;
	b=5RL/eQYGGccC9YvLOqyEMBVIwssqea/8SJxXIp1NaVyEFsqTXFevbMJK96fpcskF8Y8M
	 k8bz+ZiOnM4n3tM5icwOAsRKeXUkwp/OzlF1tFnahEz9pOGsqoHawKrLgbZ11Cyi7N5jh
	 QqdNUSmowsVhzhWg9PSf5oCJ0qrOsiM5MpllQtVkgraIbKqr1qQHM/76qWcTeKsFxVP/E
	 XmYCW797EeAu5FOAy9GCY+wKOGbvPaY/+EiCB7pCmS7oZtMVCwBuqnbmQwwf6Rsal+BU+
	 jPYb9fqXH5qyb9VcGZtx80va2dlNsOaQVfZTbyq4mrT80x0hjmuzkIlpqB5nVaxC37g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792447767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=N2qanCyCB4wF+VeUcB92quptg8ph71hHc9UNhycwS8A=;
	b=QO+4XBSboZp4K7rwUuRkQQ92f2AJpnL6/2P4ZTZYZ9z1qE6V+mNcSy0U167NYVw9ZGOd
	 dpQshHuVwtlG5xSLLEMrVjjcFjea9gPKwpWydy8Kix50gf3tF+UjsiaU5r3OcIuJtWD9m
	 jrlcGJOGESYVBZyujN3Bpn5UztKS9x2jjeOVVmDcddk57/iJXWjjsuhlGcwdVfcftMaS6
	 zEQroSyNukFxVnQcwLY70FxT3WFPMuP3ABZB9cNUYWDFilOHEexFTEjbF26J2dVuggO7D
	 P6wFmu8J3lUxR23vqb5KirocqHF+s/cMYD0WyibVYeIZ5Qp0M/K4NFaF7a6QctQ5ZHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=rcQJLAh4;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD17C606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD17C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=rcQJLAh4
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso4988455eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792447766; x=1793052566; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N2qanCyCB4wF+VeUcB92quptg8ph71hHc9UNhycwS8A=;
        b=rcQJLAh4hS0F68nRiE4luxc/Yiz5cSRCBcQVnBajuzQLAffpfIoUJKLjft/y4sDELn
         P77MAc82f2J/CC44aetKrqqebF4XCFkHmT5HJoBlvGktzPSFnmbKYgFnTfR4JOP728lI
         MKCYHmJw7V82PoXc4X3xuKbRgLu8/37OrXl8dC3OEl4m1/bhG+GawQRmTpS6+Z70so5O
         au2/sNLV6fojKeZqEFUEukQB3fafOi1jvpb2OAvugKt3R67JJWqksnbyMV3rUIdNPr+h
         SfvhOP6o74tsv5rsuVzvZdpvQRa1vFMnaYr46jNORpujOlau6dK+K7jiysP6yfZPiKPN
         6kEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792447766; x=1793052566;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N2qanCyCB4wF+VeUcB92quptg8ph71hHc9UNhycwS8A=;
        b=plvqcmMVtibza7lw8F0eSqMMhyfw1l99Cu5iCvZV41yGPRhoOzM+IOvHyR9OO+H4yc
         dOt8UyNhFSWq7H4n/Lcp6SNuruALArKuWTbFGm3c4S7GCFDU3wnV/Qbd4WywgySNZGWY
         6MPLr2yEhIyxgCFpQlIPKqUMBc/xksyQCaHROcPXZEG9z1iTKZ9lV9+GqbJX5HQnCggs
         Xizic0Dk63xk9Gh9/bGh0/QjeqbqkyobfddFNDChSReM+zzwaojQh8SFLopDydHlwauY
         64DFUNVaYPDlgpL3zUq4rdaiagfcjaqlnICWTx5CAZ9ruP8cU9UuLXUX05o2Tnsa2WqG
         Eb7Q==
X-Forwarded-Encrypted: i=1; AKwUvByO9p2AUS2/gtYuIdBA87SVqYjFuyM+lxdmW2iEG8PNQpjkuJaDEfzA2+DfKafKRUfSImyD3Bfwh40a7do=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7HHCwuH3ezoTEoVvHpYYzqGCeH1dxg4My2iYZOm8Uln3Ggk2T
	EPKAfNdXTk1d+J6WNxI4q7y1kr5maG7H3T1qoDaH+2U1PZrdDbUXbyl4xQ01xGDzgU1a2C+tYPl
	ASvrB9c+xbQ==
X-Received: from dlbut6.prod.google.com ([2002:a05:7022:7e06:b0:15a:d2bd:6a16])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:f90e:b0:151:2e62:fe6e
 with SMTP id a92af1059eb24-185136cd2ffmr11801307c88.19.1792447764591; Mon, 19
 Oct 2026 15:09:24 -0700 (PDT)
Date: Mon, 19 Oct 2026 15:09:09 -0700
In-Reply-To: <20261019220915.3943592-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261018053710.2572636-1-irogers@google.com> <20261019220915.3943592-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261019220915.3943592-2-irogers@google.com>
Subject: [PATCH v4 1/7] perf lock contention: Filter events before creating lock_stat
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org, eranian@google.com, 
	ddhariwal@google.com, rcu@vger.kernel.org
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

