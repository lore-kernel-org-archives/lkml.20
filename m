Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606606;
	b=IcpK85NeuOvTp70OTbBecUNIeu3+claqcIC+ThBYJGNz2jzO74TtbBSid4JvBX4lPsxa
	 kR/lar1AdXiljT/tBOrM/wRn81MJd0WQ5s86/0D1guCTHfS24VpY7ghPHB9Wg5E56j+e2
	 Pkunfn6qF2O/VaNcyNofROeo6LtgtQQWURvEUlbtVQsmDQrGm/24NhJp/nUVFh/4Dyg/6
	 AyVKE6CMGoaZPhDG9GjceQ0B8WwpPxkIltaGvXzD05Us0j8jd4xuTQQY+SHQdWEP+4Uk/
	 PQGNkn2ujHp9Xb3T8RaxMIMUoDofshh1pkF+FqRcWLI17B77mUrhR6Udr46B1lnvj5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=hA1HAfb/QSQMHgzacElngcaBrHbu0zBHzLVSIBZt9mI=;
	b=eO7GCKETSX1ZkhaTKKXmWjnECtxIoV6O98hkYjNh5ptbMR/DQIf9XrxfBQFt8DGoJJP4
	 3ZEbP9vIIY8YbGKhxTLfAmB6D3+PWhNv7OvqgM6pUnDBQuUSpQnqk7E+/2mECXRUwAxwh
	 T09JAZ73IOoq1m4d7tIwvwVf8zLN1+tpl/eC1zn7YyWBcpDCkhs1RBmZHIOWMfGTsQ0wW
	 8ZLBC/POHndA6ZBbJ9gm1y1EVxlOI5KIBNHE8NeUHPYwQTFePGvjmUPWCVCOSCUAHBRX7
	 uSJ6ttpwDAmGI+rgnQQid0mKtlNrfj/BO7coB44s2z8xEX+AVFBI3bWHWZE2V9rrrtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Qq3W5meK;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F34B606C98B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:50:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F34B606C98B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Qq3W5meK
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375f0fd31f4so1809668eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794606605; x=1795211405; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hA1HAfb/QSQMHgzacElngcaBrHbu0zBHzLVSIBZt9mI=;
        b=Qq3W5meKcq2l47T+ofNmtIuEs/vCfyKoUtPqzHoUJHMciixy/WK6X/6oEryGTCfziI
         HZwjhqytMbycgWuCOJikgiJHC3aeT0yGD+C4tWElMjxuYLrdI6VpZLMO6UW+pZx3TIHp
         4u4qwDNloNP3FRNCiushvWtVxNN/HJAIkbqCpJuxBaedMswm0JxanfmDa02VlMIDlqBT
         FOr/hvjZySw2GJoexwged/zJ0kQOZMg1h5IiuFsuMyPQSYLJ0yMXKWcz7BhtW8Ii7F+e
         O9rvZ7nvXWQn81oUL4RQFTTxqgbcvrUrp8aQqWy0Nc8OOBUYXPsW4C+EbUGOVSVLoIFJ
         RIAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606605; x=1795211405;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hA1HAfb/QSQMHgzacElngcaBrHbu0zBHzLVSIBZt9mI=;
        b=EzmvgMxlkQ+OvDZmdgBlLI7ujgnrVyaLzyUgEkV1Anyy6IIBvG4acPHOAPgu+CUYBk
         0ozGjZbrEkoGfwV8hYPpbIjKw6ZFXRIiUor7Au32NJWUHVcYQLMUBM7rSKxLT+2toFHN
         xcc3vfYruq1Iz2y0Qv4l12Q5GCqDMfIQzEaqGawnp1bZ6L6kAtF+DLvd8VFurQXJK27s
         TDE8n7J3KyyuzVqaPz9vi1AQPzWnQ7LvVFjpzQezAOOPElFRDEGmy0ge/SNPKSWtXfpd
         KTrm1a7k2/RVXZdMxNG/sg1nBTmjnlbi0L/J1xSuDVX4cQCwZDH+ka99iqo/FAvMifb+
         I6pA==
X-Forwarded-Encrypted: i=1; AL+hErEcoc3bWKk+LL/Ka8DFj4mgKmEOdYkgOFSzF2YEUzkiONfboA3USsKWdIgzxAMAXRAuao+XbmRhgfEiPKw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8P8K+wggfw+BArbAXuuKmDo72+0MdCgCv4BhYjmZMlrYpnOi9q
	sQmoDUfEpRlcOxQ++qZDd4k7RMXS/9o81Qj9RMEbTF0/ygWMYy68cT4TPgJI+rIGijBNrV2CFYa
	nKIow7DW1ZQ==
X-Received: from dlae24.prod.google.com ([2002:a05:701b:2318:b0:18c:3061:3bca])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:3c01:b0:1a7:7160:ffc8
 with SMTP id a92af1059eb24-1b5030982b9mr3101249c88.10.1794606604623; Fri, 13
 Nov 2026 13:50:04 -0800 (PST)
Date: Fri, 13 Nov 2026 13:48:44 -0800
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
Message-ID: <20261113214850.3329699-21-irogers@google.com>
Subject: [PATCH v1 20/26] perf annotate: Use generic hashmap for sym_samples
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Convert annotated_source::samples in util/annotate.{c,h} to
DECLARE_HASHMAP(sym_samples_map, long, struct sym_hist_entry *) and use
hashmap__for_each() when freeing histogram entries.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/annotate.c | 20 ++++++++++----------
 tools/perf/util/annotate.h |  5 ++++-
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
index d11add6424dc..c6325040452f 100644
--- a/tools/perf/util/annotate.c
+++ b/tools/perf/util/annotate.c
@@ -112,16 +112,16 @@ static struct annotated_source *annotated_source__new(void)
 
 static __maybe_unused void annotated_source__delete(struct annotated_source *src)
 {
-	struct hashmap_entry *cur;
-	size_t bkt;
+	long key;
+	struct sym_hist_entry *val;
 
 	if (src == NULL)
 		return;
 
 	if (src->samples) {
-		hashmap__for_each_entry(src->samples, cur, bkt)
-			zfree(&cur->pvalue);
-		hashmap__free(src->samples);
+		hashmap__for_each(src->samples, key, val)
+			free(val);
+		sym_samples_map__free(src->samples);
 	}
 	zfree(&src->histograms);
 	free(src);
@@ -136,7 +136,7 @@ static int annotated_source__alloc_histograms(struct annotated_source *src,
 	if (src->histograms == NULL)
 		return -1;
 
-	src->samples = hashmap__new(sym_hist_hash, sym_hist_equal, NULL);
+	src->samples = sym_samples_map__new(sym_hist_hash, sym_hist_equal, NULL);
 	if (!src->samples)
 		zfree(&src->histograms);
 
@@ -163,11 +163,11 @@ void symbol__annotate_zero_histograms(struct symbol *sym)
 		memset(notes->src->histograms, 0,
 		       notes->src->nr_histograms * sizeof(*notes->src->histograms));
 		if (notes->src->samples) {
-			struct hashmap_entry *cur;
-			size_t bkt;
+			long key;
+			struct sym_hist_entry *val;
 
-			hashmap__for_each_entry(notes->src->samples, cur, bkt)
-				zfree(&cur->pvalue);
+			hashmap__for_each(notes->src->samples, key, val)
+				free(val);
 			hashmap__clear(notes->src->samples);
 		}
 	}
diff --git a/tools/perf/util/annotate.h b/tools/perf/util/annotate.h
index 1b47c1156b9a..495c8602864c 100644
--- a/tools/perf/util/annotate.h
+++ b/tools/perf/util/annotate.h
@@ -312,10 +312,13 @@ struct cyc_hist {
  * presented. It is deallocated right after symbol__{tui,tty,etc}_annotate
  * returns.
  */
+struct sym_hist_entry;
+DECLARE_HASHMAP(sym_samples_map, long, struct sym_hist_entry *);
+
 struct annotated_source {
 	struct list_head	source;
 	struct sym_hist		*histograms;
-	struct hashmap	   	*samples;
+	struct sym_samples_map	*samples;
 	int    			nr_histograms;
 	int    			nr_events;
 	int			nr_entries;
-- 
2.56.1.703.gf848ed807c-goog

