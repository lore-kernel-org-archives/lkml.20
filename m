Received: from mail-qk2-f5.google.com (mail-qk2-f5.google.com [74.125.230.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5ED23B6343
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075981; cv=none; b=PVslzMzT0P6hbIDB+EOfhwjR8OsISkA3UWtAQw4rns3NWKsFGa51UCgkC++B/iYatYDOHlmqh4CfkQRshlOdRV1wjioU4H5OiGzuCUorwldV7vqu+vqcb6qdjErPyNJz1UTfRdT10cttwyCS7Ly3E2n+NxH5fAIu8XkeWuWAGLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075981; c=relaxed/simple;
	bh=R+lQIQY3eRefZFRtmkfz2M5VPtTBdh7wpJqwrh185z0=;
	h=From:To:Cc:Subject:Date:Message-ID; b=C47bLaOgScI+mF2Uoludb3Wm5sa343B79Rxj3k9RyKRSCxyE7O5Q2YI9zBSBGauKKB6oM3hZGuTXYVW7OUBuciXnZHrwuzO3eJLjUEUNA+YyD2CL3kNrxni1itmNIXhpcTaQ/H7TNJmGjOiDEIy1l5rV7tmOPb/50FWWI+7MSsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ITXd0o1f; arc=none smtp.client-ip=74.125.230.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ITXd0o1f"
Received: by mail-qk2-f5.google.com with SMTP id d75a77b69052e-5337b59ef7fso32484151cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792075977; x=1792680777; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XdRcwxlD3pWCchI2KWHsVI/091IqM4MFlf7NS18N65o=;
        b=ITXd0o1fEClwlJqH1jImI3nXkmIofqkSkZtrJkzv1i8TR96tpLIwdeK4cuwIiLTCOJ
         iEMw9le3Hfz15mr6X6vI+TIZ8QTnkkfr+VQMSkCRxKxSiiAMPS3wuV6rk9RHygQwHwGs
         9qihWF87JdoZv4WxRJKTqCrshBhC5KsCPaYH14AMOpKgb6fPG9ATDSYPCfsisVlGVn0P
         qwxAxHmuyz8JzVsfef/tSjP1oiYqvwlmTLxkFglTX4Eo1ge4y1Limz8HtY4QgCwreyCh
         4+a9XIYLXIN4TOKnJXWfcuW8UcZjvmSdptpnpOAj0MllquvZrJIJoBfINuLkpxWk8xXN
         P5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075977; x=1792680777;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XdRcwxlD3pWCchI2KWHsVI/091IqM4MFlf7NS18N65o=;
        b=h8WRXK/cyAHkrVmUtXkDeojrqFW84DLRQkGdleKFmL/lc1WOHA0MLHmb9l+CZcgwA2
         IHyN1EfqBb+lXWqlhjiC7ChuoWs9/M2KdgTJrgQ5q1CwH9kIrhKc4013L+HuS9EoIEX4
         uR1m5vwiWZ20/AQPawhpi+COY+voqXO3HRSzrcJ6Y/gedNOOLOALvr99lm/T3smjd4/v
         toOAHUY1F98gFTngrpIgsgI6tp3mBTxp6uwW4iNeA3HLi8I3s3DmWoGPvBjDwtOZ9HpT
         juwuVgFct4wOmhaoSvCvgAt3QHOU9TUBOTgbfOSuWYqLzLwgjnylU1RIxSdgxHmddep5
         +3Yg==
X-Forwarded-Encrypted: i=1; AKwUvBxkB5JEN+AI0I9IqETW/SOnFq6LdzkdzJbE5XAEGagS1ZjYMtJqhLMbFwxbNqHCemxIGT9TRLexOpWCchE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1iOgUogOQX2OEhXX3k6a9t1IAZIBVAEclFHpIlecqAik8B4tC
	hqx/AcbBJcLCe/SQ1RSiHoSsl1Dyb4X2JwWKa//or2L18ExtUDWU2Lc8
X-Gm-Gg: AYBFou3ac7urZOAza/UIFpIMPRhoKX0GhPWTZwaUT7WD5DpzfNSs55xpTmc9tM8xWRt
	J1bKEBpwmNMVAy8J5zUBPZ5TX4i3MmuMjkse2Qn44y90xLMcVdYmOv3VsDSfXEvYCw2m/UYYnzc
	qBRijeJv4roflHoDwX++ZLJyLEb1Q4yBaFu6OwzK4F3fAHSUnXMj4GC83JqsyXyRsMUI/Y73cdo
	cHeHjAqSdZ1WeXxYsj1nm2nQUXd40qfQ3npFhjxZvjVTApoDXigOvHRD5qdyS+A9EPQMZE/q3mL
	kRLGHbm+w+yLAcCmHSD7/O0Q+KKjAYpcKZWUMWOD9T481gSsfuHAg4seCqlRf4aG/TehnjzfJPd
	I9d+Dj9sjBUn4rhSCYfaX4hWGDqX2V95TdC8xNchzBJOyP0qu9y0+HL7v6FM59Y4uppOyQ/BkA7
	NgvZwNmtQwFlPmjmq5FHpPLBmQtMKXzI/XYOtou1nfGzEgBI/bG7emcOjWXVINieYOgeSHjZ9Lh
	u/lr86LBfUogn9n
X-Received: by 2002:a05:622a:e19c:20b0:535:cd9e:bfc8 with SMTP id d75a77b69052e-535cda027f6mr141795071cf.77.1792075977484;
        Thu, 15 Oct 2026 07:52:57 -0700 (PDT)
Received: from [10.131.15.42] ([115.200.102.144])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536127c62d3sm27173261cf.15.2026.10.15.07.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:52:57 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev,
    linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mm/damon/stat: avoid 32-bit overflow in idle percentiles
Date: Thu, 15 Oct 2026 22:52:04 +0800
Message-ID: <179207592479.3.11595453180868898703@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On 32-bit, accounted_bytes * 100 can wrap before division by total_sz.
Some entries in memory_idle_ms_percentiles then keep their old values
instead of being updated.

For example, a 256 MiB i386 QEMU guest reported p0=19200 ms, but p50 and
p100 were both zero.

Cast accounted_bytes to u64 before multiplying and use div64_ul() for
the division. Compute the percentage once per region.

Link: https://lore.kernel.org/r/CANOyQmHad1vamnZT12M5yPrJ69==Pt1U0+MGw6u0MuNtr-DRCw@mail.gmail.com
Signed-off-by: Aveline Noir <jm5905938@gmail.com>
---
This is against mm-new ad9f2d463666. With the fix, the original test
reports p0=p50=p100=19200 ms. The i386 kernel build, x86_64 W=1 stat.o
build and external arithmetic checks passed.

I also ran 38 before/after VM tests and 20 same-image controls. Throughput
was close overall, but median kdamond CPU rose by 0.0053 and 0.0221
percentage points of one guest CPU for stream and sparse, respectively.
Some pairs had 5.91% lower throughput or 15.49% higher scan P99. So I can't
yet tell whether these differences come from the patch.


 mm/damon/stat.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/mm/damon/stat.c b/mm/damon/stat.c
index b05b68f73e10..eccd372810d0 100644
--- a/mm/damon/stat.c
+++ b/mm/damon/stat.c
@@ -114,7 +114,7 @@ static void damon_stat_set_idletime_percentiles(struct damon_ctx *c)
 {
 	struct damon_region **sorted_regions, *region;
 	int nr_regions;
-	unsigned long total_sz, accounted_bytes = 0;
+	unsigned long total_sz, accounted_bytes = 0, percentile;
 	int err, i, next_percentile = 0;
 
 	err = damon_stat_sort_regions(c, &sorted_regions, &nr_regions,
@@ -124,7 +124,8 @@ static void damon_stat_set_idletime_percentiles(struct damon_ctx *c)
 	for (i = 0; i < nr_regions; i++) {
 		region = sorted_regions[i];
 		accounted_bytes += region->ar.end - region->ar.start;
-		while (next_percentile <= accounted_bytes * 100 / total_sz)
+		percentile = div64_ul((u64)accounted_bytes * 100, total_sz);
+		while (next_percentile <= percentile)
 			memory_idle_ms_percentiles[next_percentile++] =
 				damon_stat_idletime(region) *
 				(long)c->attrs.aggr_interval / USEC_PER_MSEC;
