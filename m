Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB6546D083
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 18:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792263302; cv=none; b=pD1EwMxGFz/Kr1FHeDVWoMVEedjio23sm284IIm+JZgG7tdmYOiTopU6U3iwFtJZ0JWD9azTwYl1av5C6osGz+SOqfCbbN4H9nxgswV1El01OICbmvXYIAD0wSK+lVzbVCfa5tq0iRqbg/ykK6jYuMIzB3u5TKtpMV52tUbiDTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792263302; c=relaxed/simple;
	bh=Ds8pGmUi7mWykfw0723NxCFCTzdiMdNonIGhD+trGXE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MTYdcI/qR9Ks5WVzftJs2IFB4ArDZbFfXWCLarnLZaie6BRoJw8iNaXZftHE0MMVqcrMoMneBLh9ovl6MKzetSPwwORKG4W9y8np1pfVvo/Lgnemj9m1FsyYdNoPQCVtyn7tov2Jwje8RFnrPPuBU/yFng5zMVveKGFtx5IDBjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O5AlJs/G; arc=none smtp.client-ip=74.125.82.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O5AlJs/G"
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3510d0baf63so2476366eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 11:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792263300; x=1792868100; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=syCWtTKXQWZiHCS/dNJxPG5Sa25SGTBSaPrOAGnHrQQ=;
        b=O5AlJs/GJMj2IX7vNAhnWDt8dHSr6DNziHOFICWp7aLJUprr+TkapL3FnkoazZmN8M
         RHZwmX5hjYzMX8sSHOdPXfdelgtjpM1G5uExdNjpXMB29NZ+9pZmSUG5qVEF9r48Telm
         CCn5i1ZkPAjOr4Q5eYrvVQEFrsYMogXNNVQyHVT4p2+w9SXANVXHJ/FapEto7OfFx4kv
         GmbpmhwXTZSreAWwC8qnZ2/Q8z4xiHV7KpArmNGdek7RL2ot+dAyPtoi1Spj05uuL1zU
         2TeAJTDwHeRGpUf6mUKY6prVoP9ypHhkfFsbhcEpNZ5oL/u/5JBvmidRrL00wCisld2T
         0mpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792263300; x=1792868100;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=syCWtTKXQWZiHCS/dNJxPG5Sa25SGTBSaPrOAGnHrQQ=;
        b=khIAYr1ZsWYJPC7rojRsABPzHon0sLWrY1Chhwf34MjJsSOPPtiyVUVw1Iwo7EYJQi
         G8KfATxNOg9gs1+hzf4mShcYoUqTkKw9VfrLXzQ4f1vD8R8vYP1AO8RA0B5HpPNlzY78
         6EFB9M5+duRO7z4/XmIHtTIRZK4eBzv7GYxLwrc2NLwigND7ZLBB2K0JLu0xE/mg5Ptv
         NV4934WkE5e6EmDsQPMO1dYDHxe0KZf1Ks2jNc+7kgqmckXvsi7q7b+u41G6W1d8Mbnb
         rDjEHoniwDz12ybUYNaKZnG4IyD6hiOiJfQk5VaTRJNwU1CnvEggNxEqGXyGEK5c3KS5
         WmDg==
X-Forwarded-Encrypted: i=1; AKwUvBzDQ/1STbIKysZhBqrEZ+sn3l6BWximXtmH5dp9bTuw1Mo65r3l9CVYlpYUi473pfXJqOMgdmxbJmHRHB4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrJBQ044gB72uaqHYz5nuQyT3IO+WhxwXUqAFOu8Fjem8XS1RU
	sBdtKx0Pg5te/WxFwMhVEUrl50vwBy+vMyKxBrcMxMVtc8ixNANg1EP4TGoOW1+7AOTd4G5iYAD
	L9dBGhr4MOw==
X-Received: from dli8.prod.google.com ([2002:a05:7022:288:b0:17f:8a38:d873])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4346:b0:16b:1a1f:ed8a
 with SMTP id a92af1059eb24-1851453f912mr4592060c88.39.1792263299189; Sat, 17
 Oct 2026 11:54:59 -0700 (PDT)
Date: Sat, 17 Oct 2026 11:54:37 -0700
In-Reply-To: <20261017185442.2137623-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261016213258.945737-1-irogers@google.com> <20261017185442.2137623-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261017185442.2137623-5-irogers@google.com>
Subject: [RFC PATCH v2 4/9] perf mem-events: Expose PMU init and name
 formatting helpers
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, eranian@google.com, james.clark@linaro.org, 
	jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Export perf_pmu__mem_events_init_pmu() and perf_pmu__mem_events_name()
so callers can initialize and format per-PMU memory profiling events.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/mem-events.c | 14 +++++++-------
 tools/perf/util/mem-events.h |  3 +++
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/tools/perf/util/mem-events.c b/tools/perf/util/mem-events.c
index 0cdcb47647bd..8b3af1585652 100644
--- a/tools/perf/util/mem-events.c
+++ b/tools/perf/util/mem-events.c
@@ -79,12 +79,12 @@ int perf_pmu__mem_events_num_mem_pmus(struct perf_pmu *pmu)
 	return num;
 }
 
-static const char *perf_pmu__mem_events_name(struct perf_pmu *pmu, int i,
-					     char *buf, size_t buf_size)
+const char *perf_pmu__mem_events_name(struct perf_pmu *pmu, int i,
+				      char *buf, size_t buf_size)
 {
 	struct perf_mem_event *e;
 
-	if (i >= PERF_MEM_EVENTS__MAX || !pmu)
+	if (i >= PERF_MEM_EVENTS__MAX || !pmu || !pmu->mem_events)
 		return NULL;
 
 	e = &pmu->mem_events[i];
@@ -193,13 +193,13 @@ static bool perf_pmu__mem_events_supported(const char *mnt, struct perf_pmu *pmu
 	return !stat(path, &st);
 }
 
-static int __perf_pmu__mem_events_init(struct perf_pmu *pmu)
+int perf_pmu__mem_events_init_pmu(struct perf_pmu *pmu)
 {
 	const char *mnt = sysfs__mount();
 	bool found = false;
 	int j;
 
-	if (!mnt)
+	if (!mnt || !pmu || pmu->from_env || !pmu->mem_events)
 		return -ENOENT;
 
 	for (j = 0; j < PERF_MEM_EVENTS__MAX; j++) {
@@ -209,7 +209,7 @@ static int __perf_pmu__mem_events_init(struct perf_pmu *pmu)
 		 * If the event entry isn't valid, skip initialization
 		 * and "e->supported" will keep false.
 		 */
-		if (!e->tag)
+		if (!e || !e->tag)
 			continue;
 
 		e->supported |= perf_pmu__mem_events_supported(mnt, pmu, e);
@@ -225,7 +225,7 @@ int perf_pmu__mem_events_init(void)
 	struct perf_pmu *pmu = NULL;
 
 	while ((pmu = perf_pmus__scan_mem(pmu)) != NULL) {
-		if (__perf_pmu__mem_events_init(pmu))
+		if (perf_pmu__mem_events_init_pmu(pmu))
 			return -ENOENT;
 	}
 
diff --git a/tools/perf/util/mem-events.h b/tools/perf/util/mem-events.h
index 38b14c03392c..64517ca053d3 100644
--- a/tools/perf/util/mem-events.h
+++ b/tools/perf/util/mem-events.h
@@ -31,7 +31,10 @@ extern struct perf_mem_event perf_mem_events[PERF_MEM_EVENTS__MAX];
 extern bool perf_mem_record[PERF_MEM_EVENTS__MAX];
 
 int perf_pmu__mem_events_parse(struct perf_pmu *pmu, const char *str);
+int perf_pmu__mem_events_init_pmu(struct perf_pmu *pmu);
 int perf_pmu__mem_events_init(void);
+const char *perf_pmu__mem_events_name(struct perf_pmu *pmu, int i,
+				      char *buf, size_t buf_size);
 
 struct perf_mem_event *perf_pmu__mem_events_ptr(struct perf_pmu *pmu, int i);
 struct perf_pmu *perf_mem_events_find_pmu(void);
-- 
2.56.0.212.g129ede20d9-goog

