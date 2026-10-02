Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77F448A8D1
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 11:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790939066; cv=none; b=uILHONJcKupS4cqZQAbb1dHsmVgCCaBxU5VibvjAlaAIT/+fmt6yUf7HlKKiUzQGLLnD296JA1Y0Tz96bMflyCRTwWgxtqwlSO35sZIUUsP4Bm6LXEKR0qWZk/OXTtePCD4SFk9YTWs6P9MTmCHsw++1aHBhM6cnt/iaEySWQyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790939066; c=relaxed/simple;
	bh=xka5UItDIrEJnIvKmqLwmmfEobjfMvpvaTiygYgaFd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CPLSD7HPXt/Zv4RcP3guCXdeJiXl2DhdG3uPVS6ET2DAcAe58SKF+Gnbd/gpXV0kKCIwdhdGMEr7x4SkhN7YIc9CbyCM6ESUZ/dYuKAQxg15YLsVOcKixBA0tsumf5jiGCuv3SEyxSw4ZoF5GS97h5CgkxfG5pTegcOl58SB9+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SQZiJkp7; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SQZiJkp7"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so41912005e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 04:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790939061; x=1791543861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GEiJjq6Jc7fnijCf7RLJfnGkUIPBSRhorQ+d3FhIqF8=;
        b=SQZiJkp7fBStqZixS8tMJsuj+qXSUB6WIJpq3hCFZ/SUsXabR/BfZnBO/ETf/MmEmJ
         bPD0nltp+40tWONGUKzj3KBCBJYiwy8Ul2tLcAvze2gCDt0mLDBTXi7pTLpXtQeD1KeU
         kevqc0HtCTeupn/fGA+hsooU+IaWEc0J1WAWF+GSNxXtg8SLobAtovzUzhObtvdNpBUE
         zPQhXRm0uhfyqK1YhBzhLFZr+go1OafN5Wx4Y4/ZhbNXJppBeVDa7Soa4kQBq4Ag/JUO
         y37TdsKgYvYbCyQ2411fxDUpMDvXpdFuczQSyIEL1qb60t0tifsi7Y/cUK4klOQd1IDI
         gMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790939061; x=1791543861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GEiJjq6Jc7fnijCf7RLJfnGkUIPBSRhorQ+d3FhIqF8=;
        b=PHcoRAx4XNUGgjJZrQ70xaPpGXduQcthocdRyE2+adCyJO8UA/nlHGV85ehTTePU9F
         f4XrJLp7qwYji1t7KA0uoJYZwctczAlzTSAOEmFqgNmF7+T9/do1jQavO7dXja+0yjiR
         NP70wrD5wTd/tyS5gOWjP8BVxomjdHt7bfnYzobNpvbJB5a4kmWu11ZUtYycJcJ5K8sT
         11dhPg4J6fk8Se76mT1FI5BCHx8c7cFa1Ix64gHUgpuV+Tpj757kcYLnwk26SPZ2KguG
         3iNWYTUccc3em5JWvHug+9an5uykYckPZ5fKdi6T7kJeWm7O5GmPhICbcpRud3DIvAIE
         ZjHw==
X-Forwarded-Encrypted: i=1; AKwUvByuAnaFAg9KoRdh4z6HVt5rYH8p0eqecL6IIlXd0cmCKOespCzj2UuCufdVGZfMkm6vsNl6Ut0p7Mh7mCU=@vger.kernel.org
X-Gm-Message-State: AFuF++m/p+EIU7KwgmctkpF3BtkqOXbqgxZGlSWIBE8kOfq2AecgQAXp
	Jmmp0e8DPec1/cGPSXh0UgdSsyadAl5lnEpKYxQbitfhEOjYcDg2C7c3pMTTzOldui8=
X-Gm-Gg: AYBFou2XIWoCjDXXkFRpYUNau8e2b6EQnjOi75MJX5iSpAsU4pkpTu6KaDLalTtvXT/
	9uzMmG+BID0ExNYsgCVX791sa0YEyhCO2/g83x0VG8W2/Y42o7FwV4sZmSSJ0H9B16uLoXa2qXW
	QPxf6fCNrRcVDTcFs582eDsPHRJUtYQso2xifHFze00Nu/qa/sYw5UYi6udDIqtOBnNcy0tN9BO
	r+rIZgqBY6OGgeow4BPwazr8DlfZJ2SKOUZe2wBU71Ob6bHedA54aaJBgPnG+HGzwGFIBziAyvy
	lS3vXXBss56jStFBZfnYoctK/yb+E5afQLZ64p/YdxmJJq6nHZiLP7Ir2DE+3mjCC6fcJ7RRmqq
	4FtGtg3KfmX71H69JJYuMC9JHkMV4Jet3Vd0su4Sz+sazo4hWTbHR/kgDdb7JrKAvbn2vPGH94U
	NPeRbg04Dkg5oJxhwRC4Op2e2rigJCdDuC9dlHofGHr++H8Uc2H5vHTLnFmc26QOamre+h3kCYG
	g==
X-Received: by 2002:a05:600c:350a:b0:4a0:1f51:ba2d with SMTP id 5b1f17b1804b1-4a02769cf7fmr40489485e9.22.1790939060892;
        Fri, 02 Oct 2026 04:04:20 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280c6597sm75669465e9.9.2026.10.02.04.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 04:04:20 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 02 Oct 2026 12:03:53 +0100
Subject: [PATCH v2 1/4] perf: cs-etm: Don't add global v0 HW_IDs to
 unformatted queues
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-james-cs-hw_id-output-failure-v2-1-7a194aa61173@linaro.org>
References: <20261002-james-cs-hw_id-output-failure-v2-0-7a194aa61173@linaro.org>
In-Reply-To: <20261002-james-cs-hw_id-output-failure-v2-0-7a194aa61173@linaro.org>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@linux.dev>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

In the case of mixed formatted and unformatted trace with v0 HW_IDs, or
no HW_IDs at all resulting in the cs_etm__map_trace_ids_metadata()
fallback, formatted queues will write their HW_IDs to unformatted
queues. This will result in an assert because of multiple decoders on an
unformatted queue.

Fix it by not inserting trace ID nodes on other unformatted queues. This
isn't an issue for v0.1 HW_IDs because they aren't global so will only
add to their own queue.

Fixes: 19c3e4db38c5 ("perf: cs-etm: Create decoders based on the trace ID mappings")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 2d1ab34f7b6b..fda6b6c02e26 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -309,27 +309,27 @@ static int cs_etm__map_trace_id_v0(struct cs_etm_auxtrace *etm, u8 trace_chan_id
 {
 	struct cs_etm_queue *etmq;
 
-	/*
-	 * If the queue is unformatted then only save one mapping in the
-	 * queue associated with that CPU so only one decoder is made.
-	 */
 	etmq = cs_etm__get_queue(etm, cpu_metadata[CS_ETM_CPU]);
 	if (!etmq)
 		return -EINVAL;
 
+	/*
+	 * If the queue is unformatted then only save one mapping in the
+	 * queue associated with that CPU so only one decoder is made.
+	 */
 	if (etmq->format == UNFORMATTED)
 		return cs_etm__insert_trace_id_node(etmq, trace_chan_id,
 						    cpu_metadata);
 
 	/*
 	 * Otherwise, version 0 trace IDs are global so save them into every
-	 * queue.
+	 * formatted queue.
 	 */
 	for (unsigned int i = 0; i < etm->queues.nr_queues; ++i) {
 		int ret;
 
 		etmq = etm->queues.queue_array[i].priv;
-		if (!etmq)
+		if (!etmq || etmq->format == UNFORMATTED)
 			continue;
 
 		ret = cs_etm__insert_trace_id_node(etmq, trace_chan_id,

-- 
2.43.0

