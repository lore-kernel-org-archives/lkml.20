Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606589;
	b=voUUAXaNE1rLDQQ1H//3cpjAtMuEfm6LA3TVZJLnP6X+ZNiLKa9Anm/lS0Y69YOCfDwx
	 dX99WpKrQOFXZ32tM9j7BRn0Gy9kyw0srajdAAUXJKJQezWWHKcpuz8OYKkG0vsuG94C4
	 Pd3qkwZJvQY5WSFs6mALSfZxE5H9bw0hdgxbzWAyLFu7BkNAyPOFxx6LCgMsvex99qVpa
	 p0HqHKkntgrx7A24M/lCg+xuVH3EYKIzkRSbp54Nv24h65RfeV86xQ2ZmcWYkp/vMVdGF
	 jFGIVw4kw0X3OAT7PjpoHRzCSsVA0xF1s9Qluc50TtUrOQKtRaVPJTCB5Nkx1U8DMqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=dJbqkjhos22Eyt4WA41h36gppndF9FXKA5XFxqO22U8=;
	b=trHDmdKhL76fXEe3PEoCAmLsqfz6t1QRMOOPLN8p2eP7W+xw98gA93+7KRFw26MtUs3q
	 G22eep8m2SouKCfbH0uLE2Fwu+/tk6lpT/2IcRYSxEusUwzqbpNCAlcsyIIdSWSYosHOB
	 E2yzy/9qwjWNAEcihh3/JTlCrrbV+0yhjCxOx/NoS+CZPmawEYDeyLE6xz77/hpftvsVS
	 WmmPx+VjhhF+GD/iuEGmZW6DQpFgZfDQDHHFwssIosIWBC1HWNSMizmHpeMzBlbZH1RWi
	 YFV2gEAKn9Cz1w4noCGKaIoLUYroXE4Ts4r2T53drvC5LiBaR6fYq8moBLWxN0inF7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p3k+wKp0;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3561260A6F50
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3561260A6F50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p3k+wKp0
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b1a6447f1fso1202070a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794606588; x=1795211388; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dJbqkjhos22Eyt4WA41h36gppndF9FXKA5XFxqO22U8=;
        b=p3k+wKp0Xc2LCnvND+PKRAhUys+hEu0kzhxc3kVFQh8pVpGGRTso1EiHi2C/HuUJF4
         xY4BcddDX5UjxOAQiwmVixZpqzWZEYaGmTJ2A4nzBaQ4WCgTNZqCypYrH39DwUMi2fXp
         +eQUsdqgchyA+tJdZhzSjBE0mD3NfXdW2QjrP6LDib+B6FKV9lv/0CSwmiMrfuBinbrd
         lJ8eQXCMqsRhD6D7UoE/KbdCxpMq+gsYXNS8YpW18iwXxybImaYttEc5S/zF+oCQtOoT
         ff3mDEFsiRMfm8NLz3MiXuEIErWHJ0mro9QpSVxTHLyaGefIY4iivMlkSHapl2QivL+6
         L34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606588; x=1795211388;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dJbqkjhos22Eyt4WA41h36gppndF9FXKA5XFxqO22U8=;
        b=Ynj666a1Um4iWbfWbAYekZRqkRLnv3yl5Hpq3y+6+/zokWweb3dmsV4vUxwdaB0cPq
         P2B9CEd/tvKbrvcr3i1FXSXDUUqJsuQ4H8a1u3Bqinkhkyp439zvDlPuydY4jhk0wL8C
         JcOMMfWlSTRIm37agC5L2zzSv9dXpQpUOvSHna+1nWyuJysmjtmDsU44KgLkHA+GeGMA
         FYGsgRM0sxDb/KHmABrIpc+4a9esrXm7ja045/BYjzPPPPSVwZJZIydrhx1NyjcliVk/
         YoEh3HU8fUp0j/P140EQ7Wpw7+MHpoePAF8ypRc+e2f92kuQfIJl6BXLGCgAYqT8FVPx
         67PA==
X-Forwarded-Encrypted: i=1; AL+hErG5om/zlBgcU7AeBTgEROFyhz/SP4EkdF7DP8KSKuTT1amSgriaeaPnZzaBuAe3p0hsFEuI8bpeRUmvog8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SCQ3bWRH5vPAZfUhhqt4SZ199VtvHyFM+aVUg4yVPCfr0TCYD
	wCfOlPW4tcEZkZ3l8x4+ATAoSOCK41udYQtvyEMQ3ZurVe7JaKEq1ZnA7ckL/PETlesl5cPfI+d
	DSpq9YXvfNg==
X-Received: from pjte3.prod.google.com ([2002:a17:90a:c203:b0:3ad:ae1c:d5ab])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e18c:b0:3a0:ace4:d2b4
 with SMTP id 98e67ed59e1d1-3b1b0a0d930mr3154257a91.23.1794606588259; Fri, 13
 Nov 2026 13:49:48 -0800 (PST)
Date: Fri, 13 Nov 2026 13:48:38 -0800
In-Reply-To: <20261113214850.3329699-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113214850.3329699-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113214850.3329699-15-irogers@google.com>
Subject: [PATCH v1 14/26] perf stat: Use generic hashmap for per_pkg_mask
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Convert evsel::per_pkg_mask in util/evsel.{c,h} and util/stat.c to
DECLARE_HASHMAP(per_pkg_mask_map, uint64_t *, bool) and use
hashmap__for_each() to free keys in evsel__free_per_pkg().

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/evsel.c | 10 +++++-----
 tools/perf/util/evsel.h |  6 ++++--
 tools/perf/util/stat.c  |  6 +++---
 3 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index 6d69f63b7fb1..a37d0d66fb45 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -2094,7 +2094,7 @@ static void evsel__exit(struct evsel *evsel)
 	zfree(&evsel->unit);
 	zfree(&evsel->metric_id);
 	evsel__zero_per_pkg(evsel);
-	hashmap__free(evsel->per_pkg_mask);
+	per_pkg_mask_map__free(evsel->per_pkg_mask);
 	evsel->per_pkg_mask = NULL;
 	if (evsel__priv_destructor)
 		evsel__priv_destructor(evsel->priv);
@@ -4761,12 +4761,12 @@ int evsel__store_ids(struct evsel *evsel, struct evlist *evlist)
 
 void evsel__zero_per_pkg(struct evsel *evsel)
 {
-	struct hashmap_entry *cur;
-	size_t bkt;
+	uint64_t *key;
+	bool val;
 
 	if (evsel->per_pkg_mask) {
-		hashmap__for_each_entry(evsel->per_pkg_mask, cur, bkt)
-			zfree(&cur->pkey);
+		hashmap__for_each(evsel->per_pkg_mask, key, val)
+			free(key);
 
 		hashmap__clear(evsel->per_pkg_mask);
 	}
diff --git a/tools/perf/util/evsel.h b/tools/perf/util/evsel.h
index 53f3641b66e1..eeb2ece1490c 100644
--- a/tools/perf/util/evsel.h
+++ b/tools/perf/util/evsel.h
@@ -13,6 +13,7 @@
 #include <internal/evsel.h>
 #include <perf/evsel.h>
 
+#include "hashmap.h"
 #include "symbol_conf.h"
 
 struct bperf_follower_bpf;
@@ -20,7 +21,6 @@ struct bperf_leader_bpf;
 struct bpf_counter_ops;
 struct bpf_object;
 struct cgroup;
-struct hashmap;
 struct perf_counts;
 struct perf_pmu;
 struct perf_stat_config;
@@ -28,6 +28,8 @@ struct perf_stat_evsel;
 struct target;
 union perf_event;
 
+DECLARE_HASHMAP(per_pkg_mask_map, uint64_t *, bool);
+
 typedef int (evsel__sb_cb_t)(union perf_event *event, void *data);
 
 /** struct evsel - event selector
@@ -135,7 +137,7 @@ struct evsel {
 	bool			fallenback_eacces;
 	bool			fallenback_eopnotsupp;
 	u8			probe_type:3;
-	struct hashmap		*per_pkg_mask;
+	struct per_pkg_mask_map	*per_pkg_mask;
 	int			err;
 	int			script_output_type;
 	struct {
diff --git a/tools/perf/util/stat.c b/tools/perf/util/stat.c
index 097985da3dbb..c502f4928f9d 100644
--- a/tools/perf/util/stat.c
+++ b/tools/perf/util/stat.c
@@ -310,7 +310,7 @@ static bool pkg_id_equal(long __key1, long __key2, void *ctx __maybe_unused)
 static int check_per_pkg(struct evsel *counter, struct perf_counts_values *vals,
 			 int cpu_map_idx, bool *skip)
 {
-	struct hashmap *mask = counter->per_pkg_mask;
+	struct per_pkg_mask_map *mask = counter->per_pkg_mask;
 	struct perf_cpu_map *cpus = evsel__cpus(counter);
 	struct perf_cpu cpu = perf_cpu_map__cpu(cpus, cpu_map_idx);
 	int s, d, ret = 0;
@@ -325,7 +325,7 @@ static int check_per_pkg(struct evsel *counter, struct perf_counts_values *vals,
 		return 0;
 
 	if (!mask) {
-		mask = hashmap__new(pkg_id_hash, pkg_id_equal, NULL);
+		mask = per_pkg_mask_map__new(pkg_id_hash, pkg_id_equal, NULL);
 		if (!mask)
 			return -ENOMEM;
 
@@ -364,7 +364,7 @@ static int check_per_pkg(struct evsel *counter, struct perf_counts_values *vals,
 		*skip = true;
 		free(key);
 	} else {
-		ret = hashmap__add(mask, key, 1);
+		ret = hashmap__add(mask, key, true);
 		if (ret)
 			free(key);
 	}
-- 
2.56.1.703.gf848ed807c-goog

