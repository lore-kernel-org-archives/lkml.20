Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606611;
	b=koYy/wuc0v/lt5uWbCIBf8pB2JdqySbf+69qO7TGhoiggMnMAwzXYDOxfjB4feRdSJxr
	 TgkeO8lHJ5So+kcla/IlWhqDfCzOFQMOfeBdZUttnMt2oalivnOvJPB2ARheSj5HP4raS
	 /Pk15lW3HGMnl+P37U7wlRUpAdiEAUt51TFpQSK7iUDt8OUS3x2EmoCgiKGCAemSENb2M
	 jKlZeoNlRld9JG38E/JYzTkFCm2HL1GJvcxIQPbkAbb7UHzmuifTyN9JsYNTkL8jjx6/r
	 5/pRcPTYUs/94AO1YJOj5YiEXaVqFmNNEu8mrQRSEnBQGdZduLVFFX+6MpTNV9fvQKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=bXogm2TJduwpsZYvgZveO8MsbB/2neyvTtGG+82aO2o=;
	b=HDXU+dm/KjB+bgtmyGUMRlYpau3z+xw1bFOlmUVBQ0hg0zZWKepakbFxN6uw4KUYdaO7
	 j14j8GMqseHVnQgkYAiKWEW8dbG0u865HM97g04TqZFkX7GqIMMT61mIKD8o6ARHxMFHT
	 yIPctZ2vvahOH8quwkxc4xelXtDJyp6CcE4mvnxTAqzTRr4xsLZtSdZ5qDqIR9BxIPQp6
	 4nSi5Ptaoia46gC02kmknmflfw10n4RqW+VHDmYFlF94USDDvMepb30ZUonwM5rDQyErT
	 RESe1ai+35eIM4eYaNmoi7cHWg4HNPPBzZOFeq65dC1HCPpWAvuVY7ZWFLGHaPTcrsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hxblArbZ;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8D460A6F79
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E8D460A6F79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hxblArbZ
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso1628318c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794606610; x=1795211410; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bXogm2TJduwpsZYvgZveO8MsbB/2neyvTtGG+82aO2o=;
        b=hxblArbZkamRvUy9Lm9faZJ+YH8WQcW0JyIEbPfjDaTUyWqsflPbGU/vhsVrwhIzjd
         70lwgtDImkCzN4NWOEgjJ+mtGrMR/n1cqYOAnLP0Xc7FOEpmHO6YqILrRV16zHDAj81m
         Avry3cxPDNtBrtgS5kUvGGJ3fa5fyA5RduyOFnAJIj1o9pNOJ4AceYvHT7NA/VmDt3S0
         vL5YHmEEX6LAfzeuzNbMDEdLVZmM7KZHFlDoyBVrrUlHcQWK6To2JzNA7dBxmlW8KxS5
         NoqyldSAuyvesfcrie685lPZ6/LwZgKJB6xF1W5PVd6EPqKvyet2vMghst0yCcim0F7d
         voKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606610; x=1795211410;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bXogm2TJduwpsZYvgZveO8MsbB/2neyvTtGG+82aO2o=;
        b=p+C41vRlOpo+Tn0E5v8BD80HiyZf46c0Fl/vha+9YzquqAbpPlQ4EI5Ok3q0hnCFq7
         83APtmDKswo+dTXR49va9ojtUiuP5JKVxc9xOTeQi0xNNFDNKkl8wlsAZbfOraXbLG4b
         nr6uSig2X3srn0wX+sPaOMcCFLW2hm2wItTdOl6Blj2ywT9aqAzFQhWyJSlWsH6OkIbh
         haOmT8jDfIEE2cUdsB8zKujsSTqfD8sratycoJY3lLw51ZklimK1iyBd2hkwDk4+2910
         So2/5lQsGw8Y9JqJXlc32lKQKfo2nJbjKJkza0NskwZpLPvoRKPEKYU/8nWbiyTRKMtH
         7IbA==
X-Forwarded-Encrypted: i=1; AL+hErFW/eBcqtCChxKV1AsRS+DjK4DsId7rYFwo/ci5mKdTdW/5IvtW70JWraPGuIDBJAJO6V0OtREbzD4MvsU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NuHIm9hG0M31T4ugED6mdif1/cGL1UqtQjpeIxQLyDQK1lMy+
	x+EukDIV9nmCF22wSuBXsGJYmSY1mHOP5zm50wa1NYRpLXoT3/MPODJfdtqRayDXjrMkeW+W/fs
	YF3roigUMgw==
X-Received: from dybnj40.prod.google.com ([2002:a05:7300:d0a8:b0:36a:de0:d28a])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:7a12:b0:36c:dbac:705d
 with SMTP id 5a478bee46e88-37967506a76mr3300984eec.15.1794606609796; Fri, 13
 Nov 2026 13:50:09 -0800 (PST)
Date: Fri, 13 Nov 2026 13:48:46 -0800
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
Message-ID: <20261113214850.3329699-23-irogers@google.com>
Subject: [PATCH v1 22/26] perf annotate-data: Use generic hashmap for
 type_hist samples
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Convert type_hist::samples in util/annotate-data.{c,h} and
ui/browsers/annotate-data.c to
DECLARE_HASHMAP(type_hist_map, int, struct type_hist_entry *).

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/annotate-data.c | 10 +++++-----
 tools/perf/util/annotate-data.h |  5 ++++-
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/tools/perf/util/annotate-data.c b/tools/perf/util/annotate-data.c
index 2332d465f975..dabbbb34fcd8 100644
--- a/tools/perf/util/annotate-data.c
+++ b/tools/perf/util/annotate-data.c
@@ -2059,12 +2059,12 @@ static int alloc_data_type_histograms(struct annotated_data_type *adt, int nr_en
 static void delete_data_type_histograms(struct annotated_data_type *adt)
 {
 	for (int i = 0; i < adt->nr_histograms; i++) {
-		struct hashmap *map = &adt->histograms[i].samples;
-		struct hashmap_entry *pos, *tmp;
-		size_t bkt;
+		struct type_hist_map *map = &adt->histograms[i].samples;
+		int offset;
+		struct type_hist_entry *entry;
 
-		hashmap__for_each_entry_safe(map, pos, tmp, bkt)
-			free(pos->pvalue);
+		hashmap__for_each_safe(map, offset, entry)
+			free(entry);
 		hashmap__clear(map);
 	}
 
diff --git a/tools/perf/util/annotate-data.h b/tools/perf/util/annotate-data.h
index 184262c73562..b5b780d26004 100644
--- a/tools/perf/util/annotate-data.h
+++ b/tools/perf/util/annotate-data.h
@@ -8,6 +8,7 @@
 #include <linux/types.h>
 #include "dwarf-regs.h"
 #include "annotate.h"
+#include "hashmap.h"
 
 #ifdef HAVE_LIBDW_SUPPORT
 #include "debuginfo.h"
@@ -81,6 +82,8 @@ struct type_hist_entry {
 	u64 period;
 };
 
+DECLARE_HASHMAP(type_hist_map, int, struct type_hist_entry *);
+
 /**
  * struct type_hist - Type histogram for each event
  * @nr_samples: Total number of samples in this data type
@@ -90,7 +93,7 @@ struct type_hist_entry {
 struct type_hist {
 	u64			nr_samples;
 	u64			period;
-	struct hashmap		samples;
+	struct type_hist_map	samples;
 };
 
 /**
-- 
2.56.1.703.gf848ed807c-goog

