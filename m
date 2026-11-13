Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599768;
	b=lrCgqI6tAOPbKCnp0YFqQTqF1yYDGZSzJBEi05ztK/snp8JMhvQpNsdTGi7p1LyPz3LG
	 fVYKoR5fqP8BL1uzqsPlaih0jyGJ/NAOtEBw4Eka8Ye/z0qi4y33on/8sClNzd2/pKwuf
	 hAMGoAM7TZaXCY1pJybsFPqygGBWT0UY4AcJFriG+RsXfEFvIFoC9f7HcvDyG50ScYcoS
	 GL0SnU1Nio7iVwwGs2k49p8Ef3/uNSxJD+2sojIEMLaF36O6tWNAAsV8848l2rjt8gq/U
	 6YKCfEYPgSbl9Yx58z/jCmZm9YfBFjeCHufR4ELn4iJzC0yLph5CD98MSoXRZBmKqLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=WELn3GhU1Eg5SUTEbadLXYqD8v//LkauV1EZunnpVjw=;
	b=UQXZ+1QEUuuv6KyDKjff0Qa70C+3i0gXgQmDuHVIEHaWXPE7Afj0lpaR6BJp8x9vnKnA
	 HwHew28XhYym9a1/Fd5dQ4e6UgmKWnl4Zh9HP00OzdYCD89pI0vNX8RO7N1x8+MJ7ME7d
	 d/uXCZsWzEsL3rFwhoWbflS25mP7XkOBHNKt2VNDXjVwsbe9zVXhew/B7oBdxsbNXwoyM
	 6sLczwlNQJzFPyZo5PnrzpUS/d+i31gfatMH2001qdx+pk1WhHuE+sCusJKD6kJvFwaE9
	 oLUzsyp1ApYgApbvChk330tL9xNuRNkKn/DprcGvZFVDxjeYZ1BWc4kXUDoUoRDoKBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EWTDXPZi;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6F860A260A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:56:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A6F860A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EWTDXPZi
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-370230d93efso5995710eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794599767; x=1795204567; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WELn3GhU1Eg5SUTEbadLXYqD8v//LkauV1EZunnpVjw=;
        b=EWTDXPZizTU/7dkuSUJrlUy1v1Hn7bohuRgYuy6ftQdrNkEYSLUdQSCNcWT4MluGcP
         uvsxNB6aRam6oyo9V1B46jozKFb9Gk+YjnJn+zvTmrzEmyW0zRgykdDx9pH1dihE74s7
         cFrhy3cdl46Rla2RGa61n9bXve2d3TtB0WqP2NOJdLPh6IASDAWXe/Owxl/Ey9QGmk0M
         eHTlQs+gD61wzSEQZIbZqCw/uBn9D6LbiE2q+YWWvdCSeJG/0M0siSsF05+mnGHmSrbS
         RXyy4IYNfhRZSIot5N1cZ8rMksr7wnKZzlRipx4op3nBYkZyw1e0Ox8llIpYQwwJhGl8
         x0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599767; x=1795204567;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WELn3GhU1Eg5SUTEbadLXYqD8v//LkauV1EZunnpVjw=;
        b=NbZE9pft7096x5g8dYfCsN5oymA0yHWeqCkL141VhwJHkwLejFGmT8HvpCjfqzBJWe
         N2KgD2VFxI0BZ3pvZ1fa4MCkwKPSy2FlrNybz9awcS/LQBBs9eOLIOtLGn0zkLbqszOr
         T65eEEetrPEPn0id9je0LheEE0c1jIlpQLkr0YYHTXl/WEYL4Sri28uqoFgkQPNK4azv
         6jnUYd2pI64B8XwMMBpl8R+NrAMoS4ibSACqmWYCoULk/EiKbrCZo9+qHHlHnZlAf5sT
         K4Jo1RigpLet46PTNkJstdregUk4f+IVSnd01axBh/dZYybxzevN964OoKn8pQkO7qzL
         /FEg==
X-Forwarded-Encrypted: i=1; AL+hErHuywGNvGvelbpjfsgUSH/zQy2l0mAl8tCOKzsLE18owQDaUFp9hSN9zz/jNB3qWrFolPsiw5yevd+wWts=@vger.kernel.org
X-Gm-Message-State: APuU4Z+J61vXIpkTAkOzGPTsPJFHD8f3mBpPAPIXatnkwaKWrZc65Xgm
	EudTPGTHQ5Xepi0SYgT/UGHewaLfu9JcHpZCuIMupM9ynEonW3kcb4GuF8N0V1O934bozT7Uw9K
	+2DE+qXAjKw==
X-Received: from dldyr6-n2.prod.google.com ([2002:a05:701b:4506:20b0:1ad:6e8:8d5b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4194:20b0:1b3:aee5:20c5
 with SMTP id a92af1059eb24-1b5030fbe7emr3829397c88.22.1794599766364; Fri, 13
 Nov 2026 11:56:06 -0800 (PST)
Date: Fri, 13 Nov 2026 11:55:46 -0800
In-Reply-To: <20261113195601.2872738-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113195601.2872738-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113195601.2872738-2-irogers@google.com>
Subject: [PATCH v2 01/16] perf pmus: Expose duplicate uncore PMU scanning helpers
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Export perf_pmus__scan_skip_duplicates() and add
perf_pmu__num_duplicates() to count numbered PMU instances sharing a
common prefix (such as uncore_imc_0..uncore_imc_7) so subcommands like
'perf sysinfo' can collapse duplicate uncore PMUs by default and report
their instance count.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/pmus.c | 26 +++++++++++++++++++++++++-
 tools/perf/util/pmus.h | 21 +++++++++++++++++++++
 2 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/pmus.c b/tools/perf/util/pmus.c
index b924ff6180e4..931a129bb45b 100644
--- a/tools/perf/util/pmus.c
+++ b/tools/perf/util/pmus.c
@@ -485,7 +485,7 @@ struct perf_pmu *perf_pmus__scan_matching_wildcard(struct perf_pmus *pmus,
 	return NULL;
 }
 
-static struct perf_pmu *
+struct perf_pmu *
 perf_pmus__scan_skip_duplicates(struct perf_pmus *pmus, struct perf_pmu *pmu)
 {
 	bool use_core_pmus = !pmu || pmu->is_core;
@@ -522,6 +522,30 @@ perf_pmus__scan_skip_duplicates(struct perf_pmus *pmus, struct perf_pmu *pmu)
 	return NULL;
 }
 
+size_t perf_pmu__num_duplicates(const struct perf_pmu *pmu)
+{
+	const struct list_head *head;
+	const struct perf_pmu *pos = pmu;
+	size_t base_len;
+	size_t count = 1;
+
+	/* Core PMUs are never duplicates, see perf_pmus__scan_skip_duplicates(). */
+	if (!pmu || !pmu->pmus || pmu->is_core)
+		return 1;
+
+	head = &pmu->pmus->other_pmus;
+	base_len = pmu_name_len_no_suffix(pmu->name ?: "");
+	list_for_each_entry_continue(pos, head, list) {
+		size_t pos_len = pmu_name_len_no_suffix(pos->name ?: "");
+
+		if (pos_len != base_len ||
+		    strncmp(pmu->name ?: "", pos->name ?: "", base_len))
+			break;
+		count++;
+	}
+	return count;
+}
+
 struct perf_pmu *perf_pmus__scan_for_uncore_id(struct perf_pmus *pmus,
 					       struct perf_pmu *pmu, const char *compat)
 {
diff --git a/tools/perf/util/pmus.h b/tools/perf/util/pmus.h
index 2b784cf648f3..44b5dc2fd36c 100644
--- a/tools/perf/util/pmus.h
+++ b/tools/perf/util/pmus.h
@@ -134,6 +134,26 @@ struct perf_pmu *perf_pmus__scan(struct perf_pmus *pmus, struct perf_pmu *pmu);
  */
 struct perf_pmu *perf_pmus__scan_core(struct perf_pmus *pmus, struct perf_pmu *pmu);
 
+/**
+ * perf_pmus__scan_skip_duplicates() - Iterate over PMUs in @pmus, skipping
+ *                                     numbered duplicate instances of
+ *                                     non-core PMUs.
+ * @pmus: The PMU collection to scan.
+ * @pmu: Previous PMU returned, or NULL to start from the first PMU.
+ *
+ * Return: Next distinct prefix struct perf_pmu, or NULL when done.
+ */
+struct perf_pmu *perf_pmus__scan_skip_duplicates(struct perf_pmus *pmus, struct perf_pmu *pmu);
+
+/**
+ * perf_pmu__num_duplicates() - Count consecutive PMUs sharing @pmu's prefix.
+ * @pmu: Representative PMU returned by perf_pmus__scan_skip_duplicates().
+ *
+ * Return: Number of PMU instances (including @pmu) sharing its base name,
+ * always 1 for core PMUs.
+ */
+size_t perf_pmu__num_duplicates(const struct perf_pmu *pmu);
+
 /**
  * perf_pmus__scan_for_event() - Iterate over PMUs in @pmus that have @event.
  * @pmus: The PMU collection to scan.
@@ -260,6 +280,7 @@ struct perf_pmu *perf_pmus__add_test_hwmon_pmu(struct perf_pmus *pmus,
  * Return: Pointer to the fake struct perf_pmu.
  */
 struct perf_pmu *perf_pmus__fake_pmu(void);
+
 /**
  * perf_pmus__find_core_pmu() - Return the first core PMU in @pmus.
  * @pmus: The PMU collection to search.
-- 
2.56.1.703.gf848ed807c-goog

