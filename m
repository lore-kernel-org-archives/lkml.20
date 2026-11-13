Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606600;
	b=cb5J2EGJPqZeD8SXX74QaIEAxSpzDABFpTyOa9K9nCaR5fZsoVJ/Kb4Su/ngngEpPfC9
	 AK5QlkKtHUA5hC/PVTBWUBVa7sucTeLOuIFYQiBw5kM72Wg2qmL7ngf9Isx+dU1DB9Jn/
	 xGNIYvT/orxGE66HLHcOFHB6seSWDv7sVmH/tIS04o3egrfkg2zHfRfPEr5Je1ciNBmg3
	 kum3eNDdKeZmFERisEpOZqA/bn/idhI7TUeDPOYsPotV9JC37zlT88ysAU5OeWOexRuuD
	 7GIS72DMHYYPTr0mmkGcBEiSyp4e+6uY8U+gGAh/XnjjjM/wVvPnG9tdrnFGzV9KIng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=uYC21Pnl3GWWGtwZwoI5E/x8WHXcMx7NEy2Jgq4qSlo=;
	b=1F7+4fvwbtA7qqcz+6thxBl6O+Gd/lJRmEHryPH1g7jf5MS/R9ddDU1IlH6yfYe+LZfl
	 UdmkjSeHj4WkrebTs1+HvhXYaPF/lb8+tW7iP6ZkIglsC7N3N5enwyHTnfAATkBUVYbLB
	 q1U8R8V7PNpuoN8Eeo0bbsZYQvVwCLVZAqiDtBBF+B4VqOP3iOBW/sUZR6B9atN3VSdjh
	 +RgVdcOo6Hva1wD6W/IS3vXIVmK69/4pHirfoMwGEM0Mgm3vV8wvC5kf3g1FfioXTwkam
	 4BkkZVJZNGv7B6Ym1NIG4PbN+ISS9V7SgKXkLpWOii7Aho5I9BIqetoc2H0jaRchfSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aggjouJr;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4C5606C98B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:50:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E4C5606C98B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aggjouJr
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1842266eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794606599; x=1795211399; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uYC21Pnl3GWWGtwZwoI5E/x8WHXcMx7NEy2Jgq4qSlo=;
        b=aggjouJrKDj7l2y++2dyqu3B/h8iSqAFq9hF2HPwH8gIPdzeIdVnik4+gYttGyZPnt
         e1P1a3qk8lS/jxM6WvAoIhOt5H5g0f2XDUj8qVzFJh71A8NC5xwA7rNusAn3qB6N7Uib
         wBO9L5K51XrjuIL2raZJtNWo2Tv6LcWfZIu8AGyt9fkscu9X8HVWkSfkSiWfly/Q5d96
         dZk2doc9ICnlXxFhVu6G4w2Wo6pfY4rNJ3h02nmHeMg53AyW+odEVGl6HqvN44/uu5NB
         LS/WTCXvr5mrg3bzQaMOh2jORq2FYeoSm63Yo+H/ETfivwA7PegsVqf1BLi1W+2h9BOm
         wf1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606599; x=1795211399;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uYC21Pnl3GWWGtwZwoI5E/x8WHXcMx7NEy2Jgq4qSlo=;
        b=JWd5P14uV1UMZtedfeybY8PT8bfhdYDNope8vLUadVsJFiGOVEhtaqJFq0yPZlwLhg
         hlnpozdZMJGTXt5ZS37p2/bQIXtB5X7eonhGETEk4UubhpMd9Yo0yo+GxeS1m9LgV06o
         QcBKIMv9KSfFVBLYpatDgQ5P72czTvtA8R4wvgxun1BSTHkxmNaghz8w0iiFRPfqRh0q
         o+b7wfmaMVqAs5HRB8JlT0x4nAL0J4eXdAXNFsw4XsFDGIZUFHiBWlGVA1TRuvXOikK4
         pWA6Pu3T9HYtXWMPy5A3qr3LOxX5fOpvJu8vo1PpdjMj6DF8F4TuW1aaGu01HBDij/RG
         6QZA==
X-Forwarded-Encrypted: i=1; AL+hErHXgi4uRSGIotpyPcB/eXx/yAz+S+WixuUUuhxSJe8L4eR5ed+jLVMZax/pMZzmGYXIFdoc7pEpndwYKtQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8s8DCDb/hcC3Wm1/uXmh0PBztePsTBUB44D1KOQAGT7i0txt4D
	zT8lSvEktB/X1MdMQIC/0mepgzgRDPjV9zd9dP1tR0gOedk6i/aE8oubM4opVLJRDIhJVQaDK6B
	IGFVC5TkRGw==
X-Received: from dycnn11.prod.google.com ([2002:a05:7301:140b:b0:36a:1c45:2f79])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:b06:b0:36a:1089:9836
 with SMTP id 5a478bee46e88-3796628ce32mr2703477eec.15.1794606598899; Fri, 13
 Nov 2026 13:49:58 -0800 (PST)
Date: Fri, 13 Nov 2026 13:48:42 -0800
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
Message-ID: <20261113214850.3329699-19-irogers@google.com>
Subject: [PATCH v1 18/26] perf s390: Use generic hashmap for counter name cache
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Convert the counter name cache in util/s390-sample-raw.c to
DECLARE_HASHMAP(s390_counter_name_map, long, char *).

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/s390-sample-raw.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/s390-sample-raw.c b/tools/perf/util/s390-sample-raw.c
index e0fac2aa15ed..c9afc4bc4a39 100644
--- a/tools/perf/util/s390-sample-raw.c
+++ b/tools/perf/util/s390-sample-raw.c
@@ -170,6 +170,8 @@ static bool get_counter_name_hashmap_equal_fn(long key1, long key2, void *ctx __
 	return key1 == key2;
 }
 
+DECLARE_HASHMAP(s390_counter_name_map, long, char *);
+
 /* Scan the PMU and extract the logical name of a counter from the event. Input
  * is the counter set and counter number with in the set. Construct the event
  * number and use this as key. If they match return the name of this counter.
@@ -177,7 +179,7 @@ static bool get_counter_name_hashmap_equal_fn(long key1, long key2, void *ctx __
  */
 static char *get_counter_name(int set, int nr, struct perf_pmu *pmu)
 {
-	static struct hashmap *cache;
+	static struct s390_counter_name_map *cache;
 	static struct perf_pmu *cache_pmu;
 	long cache_key = get_counterset_start(set) + nr;
 	struct get_counter_name_data data = {
@@ -198,7 +200,8 @@ static char *get_counter_name(int set, int nr, struct perf_pmu *pmu)
 	result = strdup(data.result ?: "<unknown>");
 
 	if (cache_pmu == NULL) {
-		struct hashmap *tmp = hashmap__new(get_counter_name_hash_fn,
+		struct s390_counter_name_map *tmp =
+			s390_counter_name_map__new(get_counter_name_hash_fn,
 						   get_counter_name_hashmap_equal_fn,
 						   /*ctx=*/NULL);
 
-- 
2.56.1.703.gf848ed807c-goog

