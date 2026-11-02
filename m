Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621748;
	b=1or8x1/HBUenUmz+y/s5zt8WF3tSKhA7qEwOMsArvswQKS+XGdnS1INZ0NFsPN/AlDi7
	 6Ku+JK59wEHI2DfCw66/gYahEdYs7kSIQzxMH/xZGjuPFYIcjOKCNFKkzdaDsTYC0B5qO
	 S/EaiNDHbfHOwpDsbkuOs4fCmttXdMMiGOnoDOlHwj/VQ/2Dzbcj8RrgvohxqYlUnOT8F
	 qDlmdkO38DBJMJWyf0kRFRHW/otuZwdbAPxi5oEV1J6ZaxisAo/pseNwyiWmWvzQgjscS
	 sbAbwR6H63uljwzzfC1gGWr5/zxIZSKg1JT08bjoqCxluNgOVBXdxzWjNY4aYkjD6/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=L2B9ns5uTBuNRhpXpJp6nynxxt5/vvxu22eFQQ/6ykM=;
	b=SjZxLhTj4v1Nt8VxWBl82u4QTa7khXOIveCl0J9bKVZGqhoBdEe8vZ73XPd4sqEdH0fA
	 kpcrBP92LtfUBdBz6Q42emX12/ahuDZxgDnaJr0pwn0P8U9Tj8d/pDgrKOiPajYd6ZkDn
	 BC5o9NZJL3qfcbJ+gWe25MJWGw3GITjkMJC8XEkEMC/jhrKvY5v0buNh7bYpBToiVj/Tr
	 Wz9zKbaGAMU73HWLFyYBQKDegKC7mXs3cyRZ+sYY3Pw8aLO3Ja1bHz3pFCWEtly4hmYWP
	 2aPv9t7FMAIp41OMMXEKVCN1tndsgT2Jh/HlIRxrde3pj2gnGXAd8qWRueHTy+0wDqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=npdaxsTp;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8FD60A2625
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:15:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD8FD60A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=npdaxsTp
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so38060595e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621746; x=1794226546; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2B9ns5uTBuNRhpXpJp6nynxxt5/vvxu22eFQQ/6ykM=;
        b=npdaxsTptWNzh369WTt8pLs6s6TkKz+NhpSVCw77vsiC4AkCuJKFFckkZfUWRtY8LZ
         sa+Is7oX/Sc/unqlV8wGmYKDCntNnqqc/qmv3rWhafzV0ZsIqlqsmAZokUjhrCJT3jqn
         1kIAYAfkMTKr1/+/GCiBzfRkBBVQUNn2M1SjU9B5a/D4uQDgievMrTiIqHmszxQ+GhMZ
         3zqZSC4IXVijBxmG1f126ePlb8mgfnw+iNCc+g19wbnLZJ2wLrtuqq1c7Z5YF5QpQtT/
         dv6YwrOSciQ1hTfWe7Lt/yEKogwJTIsUCxaR6nL5bqEcnnCOkLNraHygqxVX6sPGwX+O
         i4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621746; x=1794226546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L2B9ns5uTBuNRhpXpJp6nynxxt5/vvxu22eFQQ/6ykM=;
        b=oMX6SP8wlTCu3gpwwvNAQNHqvR8HFJA9qtPvYxOxYYdamNigGZVpcGN18lYyJT0N+m
         cn7TOXbanmqYcx9thGGCjCjR8rUMEEQksyocBHJ+jx8Nr1uXmNBifHSAUtbvyoxIcJyc
         LKlCBKKawhivnj/IEOjFXYjojOiLaijcZENs0EAx+2jhvJlWR7eb022ZfrvcF/aD26I4
         +q0ML1F33cfNuYfuimqtFNFvVWMgp5SOVdBQ8dK8uLpMhTl2VfRmI2AChgjENXcQ+SuD
         uPc5BhQpS8NuWPDBAAjl8YQ87zHdUM16y67qSZ+EiCVynudHzqGQmN9pVHsNdcADIczt
         50lw==
X-Forwarded-Encrypted: i=1; AKwUvBzyr38d/wvffwW1t2+zuIZFrx/6YX2meSWXm1jVw5bZSKdqqnA4n4AQzUAtC28Tq6EK91u7fS2JE4PK3fs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSTtHsUHtAOPwhI0RAc8fOoA/MUavwInKJG2N2zCaIjGjwgjo9
	yhbHR7eJc5tFPnZlAaP34EgL9v1qLzCeSLlja1BK7hgb6hxrj44+LlK1qt5eyhwnXmE=
X-Gm-Gg: AYBFou1R9FshfqBBVLCH0fQuQB+ra+FyM4thbJC1dQif1kFJD1ubewpo49mWMbvOh9z
	pSoMUyvSpRWQUOxYOpFDIlJ0QTxNGdBGQL8FEj9eTxxrc4VbZas3XE8tv3JyayJBrNlNgGzAuGN
	XK3WTXyZLlNY5cKv007DACZRS21qsa8HbdbRRnyjBZF5auGl+T+hxs8AEgyIUEmJCMyjvV0Ru+Q
	eJXWsUlCo/0zeADxa3v+y47w5EzISM8QaPW+BSiAptMZ/u5oxLHK7b045NxnMXzYHFpT0iPA/ah
	wvIFgHeJQabDxlh++FOtopZqkC01T5t9FQXtBxT0uWTBkt6ZPK8BsNOFh9X3MHjhtHXWQaO0ibA
	B6C9rubg9VX1c0c7Gkqj/DpqQCC2LHMzsZtzTFO6ym3Q2A03KgFpC5qO2cDJifFgtRnnJjslniF
	EfVgBL7e/pKG6NkF8z4r0nxQxOEfKlECLJy/ZCZXn1N3Hv5ZFBjAh8d+mizTtnDAWf8kZYecNan
	SCrHw4Mm8NjIWaPNuAExeQwUeO90NU4KJOrULHXu6FKDLaNirRFIRNeAZFh/u5tUIE5M9jfM9zJ
	bZvLBVQG0b/W3RKuVh1BteCB5tbZNUdw
X-Received: by 2002:a05:600c:8b01:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4ac16fa4f73mr240104835e9.8.1793621746179;
        Mon, 02 Nov 2026 04:15:46 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:15:45 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:17 +0000
Subject: [PATCH v3 03/18] perf cs-etm: Turn on context packet timestamps in
 per-thread mode
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
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-3-dbcb0c281b9b@linaro.org>
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

Practically this costs nothing and preempts future changes that will be
made to support decoding trace in order with Perf MMAP and JIT events.
It also helps keep samples in order when we add support for multiple
per-thread mode threads in the next commit.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index acfdb3f53821..47b4e386cc53 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -453,13 +453,26 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 	 */
 	evsel__set_sample_bit(cs_etm_evsel, CPU);
 
-	/*
-	 * Also the case of per-cpu mmaps, need the contextID in order to be notified
-	 * when a context switch happened.
-	 */
 	if (!perf_cpu_map__is_any_cpu_or_is_empty(cpus)) {
+		/*
+		 * Timestamps are required to interleave samples from different
+		 * CPUs.
+		 */
 		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", 1);
+		/* Context IDs are required to associate trace to a process */
 		evsel__set_config_if_unset(cs_etm_evsel, "contextid", 1);
+	} else {
+		/*
+		 * Disable periodic timestamps but generate timestamps for trace
+		 * synchronization. Even in per-thread mode with a single
+		 * process we still need to correlate trace to a specific mmap
+		 * around execs, which can be done with only timestamps of trace
+		 * synchronization.
+		 *
+		 * Use MAX to support the kernel widening the field in the
+		 * future.
+		 */
+		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", UINT64_MAX);
 	}
 
 	/*

-- 
2.43.0

