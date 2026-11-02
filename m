Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621746;
	b=UkOrghnRL9WJluGSsRGJasLW4VjKB3bCjHNEcbuoPUUS1qZkS07f1dUymFK9MTfKHZoS
	 2z0cRxAovV6XgwahCdXGDXTqLLPjR5xkl4tnmB4WcfuQD9LAs8+Wvk1aa0zvxcLTrtaFm
	 ICbm49zhMzaqJCb6NNEYyIiOAZJbofBCvsoKQFEWdyy/g8e/cl4146IyiC3sYqmVUDx82
	 jy3219NQ9gpOG91Sq3lF+xt698rw+UVcy9Q1wt+e62V/Ua4fzlrMb3xkBrJCzQHwYr1jv
	 R7sDOC7wl14bv8HOyS+hVN8Z620lTk6PAGVC+fJGwUZxdYrne4hr5JikDgoXeOmFUOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ITCoMNDpL30MY89egTwFARcFVAAHOqspG7oErRSdzzE=;
	b=reqOLXNHqfm+1f/Hw2r6yt2tLO7qqbdXyCr5ChoMXFlhFPcsHYgJdDwiDrgW/g8iL5AF
	 YJ5a02IW98YjqD2NQjyBWGfKR5HJTaCXoC3mnR3r7AtgTU2giqNaO2zP0IVGUWJmUcUND
	 4OxVxnmjlJloV63/tDNVi5j4JOjIzBALHHrlTl52+r+/DL6Jq/1EvZeJfxWu1DAAq2117
	 MBPhb3Q++xXT2IItuKWOtW0GKvjRPjyRHBqLhotctRTYbvblh+L/8q7JQWIDj4w5GJfUT
	 TUTIxjq/HZBmYvLDaUJc45dAsKosWAJpCcU6Ku7EdgNdslcY6qUe5VLQ7OHCjo+m7Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=m5IrfOIA;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599AB60A260C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:15:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 599AB60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=m5IrfOIA
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so29913395e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621745; x=1794226545; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ITCoMNDpL30MY89egTwFARcFVAAHOqspG7oErRSdzzE=;
        b=m5IrfOIAVDpYc1M50pM62wsyTxiPDCTiw+cam/tLVnjwdpOBSVau6FgHz93uQ2w9rK
         HqgWKm1r5/nwqAJB9yOBZUhtnT7oxxMTnea+KfsWJBvi4p7l80i91jAxA44dFRs1c/mq
         wgqgDPzIttI/Xgu29+1qFyztWH0IqX60ir5MHs8mmyGG+nAlZM+Lf9jlF/iucreYdz2H
         gg5wEe3bwIzwt0+cBXKeuthobcVjuQURvHgv5om7L0sdfNsOnWzQfZxu/t2cduzjr4Pe
         sU6RfXdtWOej9BKpC4DqLu4qR7+15Ydv5unv+K9GRd6jv6kYUksP/NLk1apYe0fjkQb6
         YJrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621745; x=1794226545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ITCoMNDpL30MY89egTwFARcFVAAHOqspG7oErRSdzzE=;
        b=ipu26WZDWH8v78aaZcOlMxvUmkCBHlmLsjqiYl+39w6sVYeUJKU1wFszhMxP4GsPp4
         SpIfC9bxqa4p1Q0KBIwNNE3Kin040XP4I7S3wzxEXuyTre87h8JXHTPpPtT+My1Oz1tf
         xLLWEWAXgnQv8+Kv1dxUQ0Hw3ojyaF1t5y6caTczAtyYdf8lgNbVO/V2VjFucwXE0nkv
         eRF1l4uoG/f4tkYMnT9f8QsDSVVjpUM1lq4vLFcfInHs2VPhasrl05BOLd3MDSAKwpne
         S5ndmqZ/LX/4zE6yMPh2cwOxC806EZeftXyFffOrbN5Ae6YVlhlSvF6uP1O2RONvWFGq
         GBRg==
X-Forwarded-Encrypted: i=1; AKwUvBxf2yb2QE6FkO1ENwqwSwAP4O21pzVrqmrCAkCMWYHrGOPmTQG7P+l2xBhu0BCCEpM+Hc5d2UUvI/VlTgM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzyCBv5pw7MDz385mECxFpwdmJOlHT6nH+hoe6dO+lpWeWJxS4
	FIA5KM7uMegKSzHPf+jhhh9wsFjtOooMctkSgy22P2D5+DAQxWTqK14AmRz5Eu7RvWA=
X-Gm-Gg: AYBFou0Do+moIEx0mMrbjRfoUirICR6TcgvHsKkAER8TK1awsGg3pxOlw4EYJAlpqFT
	CfdLeXEvfFjdZ2nnYIhduKu2aCk1pk5eBWFvqF8vqUyTnG7ceVNFJlrB9K/VOEE3pUCdKCqc2QI
	jXF51X78MPDTepfXgLYF4yktlhHFQsYE0qDxgMuZP9E6v9MR+9W6aZzllUoBV+YK++AW3p1X+sN
	eYHOHhoSLXzpzPWpdsLGrL4mFSsS9aLHslZ946PooXhcc7jPKijGllvaHjLpcpTSciLs6qQq8t1
	e7nZ0RnkG2dPJIF9S5aMVIQuz8Yn8EuliEA0gZ+pwqzjl+GIIbMzGMWQVkH3jXpcoZ5eQ2rEblx
	XTHoY8DHf2z0QnYxhew+m1d2767n7bBBHb4Ldia94vQlWx8PNT8EX3jB04LpOSuHubQaj8L3w2D
	jxLn1q8XlUt5N36+msQHUC4kMdEFZJ1s0nm4KcM9xohGAH8gKfVVSWxAE1SzgHr7HbYO62pthhR
	6dwV3ElJMVUGAVespf/S47ISOrxhusvIGHaKvrlP9HwYOPbjzgMRlfPeuTDm4S8fCN1MFhT+Xv+
	NaIN+L8ER40P4RrCwfS907lSuC/KA55+jUSAWZNMoMXafoa779qRKQ==
X-Received: by 2002:a05:600c:3b0e:b0:4a7:7d22:c50c with SMTP id 5b1f17b1804b1-4ac150b2243mr246272115e9.2.1793621744767;
        Mon, 02 Nov 2026 04:15:44 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:15:44 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:16 +0000
Subject: [PATCH v3 02/18] perf cs-etm: Warn for invalid timestamp option
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-2-dbcb0c281b9b@linaro.org>
References: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
In-Reply-To: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
To: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, John Garry <john.garry@linux.dev>
X-Mailer: b4 0.15.2

Instead of silently returning an error, print a useful warning.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index d2861d66a661..acfdb3f53821 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -176,8 +176,11 @@ static int cs_etm_validate_timestamp(struct perf_pmu *cs_etm_pmu, struct evsel *
 	 *  0b01000 Implementation supports a maximum timestamp of 64bits.
 	 */
 	trcidr0 &= GENMASK(28, 24);
-	if (!trcidr0)
+	if (!trcidr0) {
+		pr_err("%s: timestamp not supported by HW, disable with %s/timestamp=0/\n",
+		       CORESIGHT_ETM_PMU_NAME, CORESIGHT_ETM_PMU_NAME);
 		return -EINVAL;
+	}
 
 	return 0;
 }

-- 
2.43.0

