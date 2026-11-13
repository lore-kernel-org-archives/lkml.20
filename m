Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606619;
	b=BTw4vYYOMQ5i4r90KF2TcKcYUB/zQTKbEOmUYYPm95N0WPL23Wkwi/Ozs8S6r7knbuJi
	 aarYRIhYFH56+v58YLB1ehsVoUfaKo8kcxCVl5LBxARxUjTroFvey+iEYFVhCf4UNQy1P
	 8GhpCngjVXLI7VzzYi3hoKkXr5Wt+MqT4zz29sIGMKhV+e08Cogop+oaFXRHR7tVzsium
	 7VSSL0XS2QpsorKC5CGy9JQK7sgnNCv997UCMM2YZVJ0Nt1GsrIIrrkTCz1b+pjGUROxq
	 3rO6Up8Oe1O5ETIWETjWiUlZea6gMgzXeRnznZS/OwDSuYwdfsc1MLuPQU4T7AddbXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=20FBjiYEHLIAyBJpKjtstE2CmYArIOoKSg7HdyQLaKs=;
	b=isWOeV0MMWg5I1PBn/9TX9ms1bD29+Oi43p5sYoJQ9VIWzRxlE7ACWfczwlAEK3v5RUu
	 ZfQOgf0XZsP95ZsrkK4e4+29Gegsqk45tL/tM1Z5ZQXNp7O3rdZSvDJwt4D1+B8BYzEQH
	 uT0W7qonnM88dBqoO3r8qHaJMaLesmBeevRZImBAlFhhAHsk7dDP9I/FSYYe60XOxzLOL
	 61SvkJtrxN25lScFQp+l4j3a/dXqRJcFo0qG0PLLAVY43JAeU/m2uZCINbIVb1Oq1JGWl
	 7+Bw2yYwGdfoyjPMWMQ1w1n4m9MHvkmNfNKMdxD/yxD5ncGdjGJTDvxLRum0BU2v4/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=j+bqwudw;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BC2606AC26
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41BC2606AC26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=j+bqwudw
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1a71dd190b0so1185872c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794606618; x=1795211418; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=20FBjiYEHLIAyBJpKjtstE2CmYArIOoKSg7HdyQLaKs=;
        b=j+bqwudw2T0Gxx9hCdjy6tvFIVLoUBtCMwoM+XNsugfT8wHK/ma8ffWb4dNMDgF/yT
         iNc6lm+4hbUe/giUjD55BQN348RykGjmlqRm6AJNVSItIJ8qiUY5Lv1sUnM2l3hdAbqr
         wghjZLwhQmB2BeENIr32PywtWkOTl/O/gd/+XX/w/V3KjyGd2ySAGEhUO5Ex6iAbfK9e
         1XuhmBXrMHydHEIKWyKcjERPWeGS5etYfs9cu/jIuVqa0HeGymZNdNQgw5IV4rRDdW2w
         MviIslxbtGaP5bbc5+zRHUwKcjpcLmkyF6SCuMD0b08OofjEG2ZkSZwJK9U3KnyCHHDc
         dSNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606618; x=1795211418;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=20FBjiYEHLIAyBJpKjtstE2CmYArIOoKSg7HdyQLaKs=;
        b=HIGbZK9cI8645AGy6pR8ujw7c/G5gBBeV+N0muRnAinuoHYfSrWuV4B3r0vBoMNeci
         dvuWchH/SzF7EeulUg25opjEREPBAlwiEalJwxzsJoUF68/biTHo9pGxt9EO9wCO9rNu
         Ri04CHzX5H/tyVn31D+3aq2MNmV53UlwdFHxtQSSz7dVepN6xEgyXfRgOjidywFlnYth
         UM2AnAxgsCSAd9MhbuVyQXCjCf5QzvIjB6OKDDqO8GK19ItNiuoBTHJ3OiQsSS8e7Cj+
         Kf0e6TDFmxDws0G5y4y4qvT57ZCGoWYS357Bt8vwGEY/XEktE8e1ijEw6Po3nyR9gGWG
         Bz5Q==
X-Forwarded-Encrypted: i=1; AL+hErGTpiNWW+hqAImj5HXU9yfYpBnh7SohZyMDSh40mPAAcvswXdZ21utNNtvQdzEq/MInfSMjBgb0fkfIFuc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yhNbiQ8l+RpoQEF6URR06sp5tiIwLtxz7XS1gfUNUobSAY3or
	RyKnTpgM2Exoq9fdAJE+XzMmCb+TpKLL0Ry/KrhyYWbEtSFkqkn6rxuF+0ToE2R45ExvW8kK2JW
	sSKlYloUb6A==
X-Received: from dleg1.prod.google.com ([2002:a05:701b:4301:b0:1b2:43f5:b296])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7023:a4b:20b0:1b2:4e2c:6838
 with SMTP id a92af1059eb24-1b50314bed1mr3398593c88.15.1794606618032; Fri, 13
 Nov 2026 13:50:18 -0800 (PST)
Date: Fri, 13 Nov 2026 13:48:49 -0800
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
Message-ID: <20261113214850.3329699-26-irogers@google.com>
Subject: [PATCH v1 25/26] perf inject: Use generic hashmap for aslr evsel_orig_attrs
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Convert aslr_tool::evsel_orig_attrs in util/aslr.c to
DECLARE_HASHMAP(evsel_orig_attrs_map, struct evsel *,
struct aslr_evsel_priv *).

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/aslr.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/perf/util/aslr.c b/tools/perf/util/aslr.c
index f9c961775e1d..8aaa685f4203 100644
--- a/tools/perf/util/aslr.c
+++ b/tools/perf/util/aslr.c
@@ -75,6 +75,7 @@ struct top_addresses_key;
 
 DECLARE_HASHMAP(remap_addresses_map, struct remap_addresses_key *, u64 *);
 DECLARE_HASHMAP(top_addresses_map, struct top_addresses_key *, struct process_top_address *);
+DECLARE_HASHMAP(evsel_orig_attrs_map, struct evsel *, struct aslr_evsel_priv *);
 
 struct aslr_tool {
 	/** @tool: The tool implemented here and a pointer to a delegate to process the data. */
@@ -91,7 +92,7 @@ struct aslr_tool {
 	 * @evsel_orig_attrs: mapping from evsel pointer to its original
 	 *                    unstripped sample_type and registers bitmasks.
 	 */
-	struct hashmap evsel_orig_attrs;
+	struct evsel_orig_attrs_map evsel_orig_attrs;
 };
 
 static const pid_t kernel_pid = -1;
@@ -1341,8 +1342,8 @@ void aslr_tool__delete(struct perf_tool *tool)
 	u64 *rval;
 	struct top_addresses_key *tkey;
 	struct process_top_address *tval;
-	struct hashmap_entry *cur;
-	size_t bkt;
+	struct evsel *ekey;
+	struct aslr_evsel_priv *eval;
 	struct rb_node *nd;
 
 	if (!tool)
@@ -1361,9 +1362,8 @@ void aslr_tool__delete(struct perf_tool *tool)
 		free(tkey);
 		free(tval);
 	}
-	hashmap__for_each_entry(&aslr->evsel_orig_attrs, cur, bkt) {
-		zfree(&cur->pvalue);
-	}
+	hashmap__for_each(&aslr->evsel_orig_attrs, ekey, eval)
+		free(eval);
 
 	hashmap__clear(&aslr->remap_addresses);
 	hashmap__clear(&aslr->top_addresses);
-- 
2.56.1.703.gf848ed807c-goog

