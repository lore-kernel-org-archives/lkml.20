Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA9D47085F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421434; cv=none; b=Ao2N02bvesLZK5YbG+YH4VrOlnuAhz6XS8o7ToYm2/LNVSpk+6rBq+y5KoZxFl44ZjwI1Wpj5Mt3KPV7NMEo0KOMWQRSKDZGyxpIgRwnWJkfaeZeoWSJbcQsMZWgTw7l6KB0mqKtlj0CyyyXFLL4ewU+XR4qCG3pe8kP+aX0CTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421434; c=relaxed/simple;
	bh=wtX4z4+vi/+J0AIUhcbUmcocOJ34GtjGcn2/Xz4ENm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dIE5gxUqi7AeK6E8imUT29F0+ZTjKpeeQRCqYbqh1ZzKAw6hxLcTJq+AlW8NqCYBe/T2C/BlyCa+FYm7wZHj6BOI+k1SMrtFr0yd/tIm/SBGVZjTcsUn9kuvDezgNTrc90sbi+sf/Ycjw01DT0vRzC+9NWHCJnKN+3onx8S4AFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HNrMrmPq; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HNrMrmPq"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-355724d032fso253678eec.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792421432; x=1793026232; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LovpYfxn/g97ME2UuZhbRE4X+t8nS3wo/zMXi49f1I8=;
        b=HNrMrmPqW4eVVcWrvK3yQNbSjwZ4FTzq8EnEe5KHdEHmwLEZ2hnKozgeK2cQFF4KVr
         oeud8EC+g5NIMDlSKrQBX6vCllV49WwNWoNmRJ6YNSUCCEIXKPEPN5NeXqJcaVtB/wYK
         HU+y+s8AHErpYNDxVqV2nJ3QbS4VyJ0bEozyuc6KY3xUcuWa/WRYlYx7TEeuIs0TBVdq
         y01mIdFB8pHMi5d/yh8cYlPjnAcq0gLPSed2P7qjz3sQr+5V/sCHrh5ABku23R44rP3R
         jZUCexaKPUgQY1f7gTEMUG6s6dJKS42YCoP1IqLcY/kYxmneHdKk/cQIe1CjedzoDJyU
         QqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421432; x=1793026232;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LovpYfxn/g97ME2UuZhbRE4X+t8nS3wo/zMXi49f1I8=;
        b=aLpoa+B2IRKccd7t/Jcgzy50nWsm0nYagOFUktEbKxEleREuYq2VXiGsxzxBd7z0F7
         79QRvYt58vHzXRjt+nMc0EJPE4qsinfwoOOVG6F9Y6X1gwLv7JQ429fkh37h2Ky7Ec0a
         mkYgu07a/7hmCThXE1PZ03KNfSJOGw96ISpIOPraUqr7YO5HV7q4Hq/Zyc8k0vyP11x+
         h/2GwgM/gQ9n0cZiVry7PgYObg77HB74LEzY+0fWCvSVx3bJYT2KOnOD6qgHM4x3cIcp
         CD3x2Q5uXtTyBpjbQiSaceo6uD+OLkhaHE7fsulXO1BVAoabuQo2V2z14l87HGjvnQqu
         x2Cg==
X-Forwarded-Encrypted: i=1; AKwUvBzOn+nfl06sXxGRVqgVTKelC90xJxsZMwMU4xe2Keg1xK5hBjAbuodRerccjts0UsdLTx/tjYNK71CsFrE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRClBN5qpPbB+2B3qhiF5NkgDMz8b0lhwCjnn3wed106oj+S+t
	m4oCB3yQ1r1Lm8BEEWNR7B/TywtufaM/dVuukdkq1zd5UsmjiQcvOqYG
X-Gm-Gg: AYBFou33ejZdEV1eQCh4YdYtGjLOVWOhYnaq0cD4SnyaVnicuELbqSUhHPmhZbKxDk7
	Kj3+cLojvLywrmR05v5WH4bm3IeGxB6jRfAebdY6G2xoefwtCohHCmG96cF2/Z0RWlsJdZ+MFy1
	KoBAI6mpsl4wZXkVc1zckJQc/ipI80GpfHZWIKRH6vixZoOtwdVHEP2A9L/HMb2JwdQiMDZOMaZ
	d7pw+u02S+2wKqVw7gNasvrMFlPk8t54Aks+UY9Gy6jPT1su2O07aiYz36TfwKCfMdLeATK+mMn
	hKFKmL+fhGEJH3/KvS3w5qeEs+EVSKCCkTBm4pGjaN5oNEQ36hTPE8iUztexW2mdqpqhfQCGk8e
	47f/dW389Dkul4lmFuXHrfNpHAILoYVw4gEeigkEjA8R1mikyOnQXBo8y3EGpqbvOrHhl6CB6lr
	+WysvnzuFsNt4OPAofHyqD14D7yprAiWFuQy0RSKl+hr/JK3t3qFFrbvAO5/dnpEH/USske/fST
	XJybmT6QHUyyJBwrEzRANUnn5o0SzAoKeg8
X-Received: by 2002:a05:693c:20d2:10b0:35f:8c5d:5938 with SMTP id 5a478bee46e88-3619ffc5b52mr19048848eec.1.1792421431765;
        Mon, 19 Oct 2026 07:50:31 -0700 (PDT)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b684dsm32864621eec.10.2026.10.19.07.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:50:30 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: dev.jain@arm.com,
	zhangbo56@xiaomi.com
Cc: akpm@linux-foundation.org,
	vbabka@kernel.org,
	david@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	ljs@kernel.org,
	liam@infradead.org,
	rppt@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	kasong@tencent.com,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	zhaonanzhe@xiaomi.com,
	lipengfei28@xiaomi.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	zhangbo0325@gmail.com,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: Re: [RFC PATCH v2 2/4] mm: compaction: target mTHP order for proactive compaction
Date: Mon, 19 Oct 2026 22:50:17 +0800
Message-ID: <20261019145017.3900448-1-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <8e54025a-03da-4cba-bae8-1604463c7622@arm.com>
References: <8e54025a-03da-4cba-bae8-1604463c7622@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Mon, Oct 19, 2026 at 01:42:55PM +0530, Dev Jain wrote:
>
>
>On 01/10/26 5:44 am, Bo Zhang wrote:
>> Proactive compaction triggers against COMPACTION_HPAGE_ORDER (order-9),
>> which is too heavyweight and misdirected for mTHP systems where the
>> pressure is on smaller orders like order-2.
>> 
>> Add compact_hpage_order() to return the highest always-enabled anonymous
>> mTHP order, and use it as the proactive compaction target in
>> should_proactive_compact_node(), __compact_finished() and kcompactd().
>> 
>> Fragmentation scores are not comparable across orders, a small order
>> scores much lower for the same state, so scale the proactive watermarks
>> down in proportion to the target order, otherwise order-2 would rarely
>> reach the order-9 threshold.
>> 
>> Signed-off-by: Bo Zhang <zhangbo56@xiaomi.com>
>> ---
>>  mm/compaction.c | 40 ++++++++++++++++++++++++++++++++--------
>>  1 file changed, 32 insertions(+), 8 deletions(-)
>> 
>> diff --git a/mm/compaction.c b/mm/compaction.c
>> index ecd3e6cf54fc..3928a5483efc 100644
>> --- a/mm/compaction.c
>> +++ b/mm/compaction.c
>> @@ -24,6 +24,7 @@
>>  #include <linux/page_owner.h>
>>  #include <linux/psi.h>
>>  #include <linux/cpuset.h>
>> +#include <linux/huge_mm.h>
>>  #include "page_alloc.h"
>>  #include "internal.h"
>>  
>> @@ -81,6 +82,17 @@ static inline bool is_via_compact_memory(int order) { return false; }
>>  #define COMPACTION_HPAGE_ORDER	(PMD_SHIFT - PAGE_SHIFT)
>>  #endif
>>  
>> +static inline int compact_hpage_order(void)
>> +{
>> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
>> +	unsigned long orders = READ_ONCE(huge_anon_orders_always);
>> +
>> +	if (orders)
>> +		return __fls(orders);
>> +#endif
>> +	return COMPACTION_HPAGE_ORDER;
>> +}
>> +
>>  static struct page *mark_allocated_noprof(struct page *page, unsigned int order, gfp_t gfp_flags)
>>  {
>>  	post_alloc_hook(page, order, __GFP_MOVABLE, ALLOC_DEFAULT);
>> @@ -2257,24 +2269,36 @@ static unsigned int fragmentation_score_node(pg_data_t *pgdat, unsigned int orde
>>  	return score;
>>  }
>>  
>> -static unsigned int fragmentation_score_wmark(bool low)
>> +/*
>> + * Fragmentation scores are not comparable across orders: a lower order
>> + * scores much lower than a higher order for the same fragmentation state.
>> + * Scale the watermark proportionally to the target order so a small order
>> + * can still trigger proactive compaction; COMPACTION_HPAGE_ORDER keeps the
>> + * original threshold.
>> + */
>> +static unsigned int fragmentation_score_wmark(bool low, unsigned int order)
>>  {
>> -	unsigned int wmark_low, leeway;
>> +	unsigned int wmark_low, leeway, wmark;
>>  
>>  	wmark_low = 100U - sysctl_compaction_proactiveness;
>>  	leeway = min(10U, wmark_low / 2);
>> -	return low ? wmark_low : min(wmark_low + leeway, 100U);
>> +	wmark = low ? wmark_low : min(wmark_low + leeway, 100U);
>> +
>> +	if (order < COMPACTION_HPAGE_ORDER)
>> +		wmark = wmark * order / COMPACTION_HPAGE_ORDER;
>> +
>> +	return wmark;
>>  }
>
>I wonder if this function should be left alone?
>
>compaction_proactiveness, as I understand is given as a sysfs knob to
>ensure that the user can control how much power they want to invest into
>compacting. So suppose the value is 20, and the highest mTHP order is
>only 2.
>
>This gives wmark = 90 * 2 / 9 = 20. So, even if 80% of the memory can
>serve order-2 allocations, we will still perform compaction for order-2.
>This seems "extremely proactive" :)

My understanding is that compaction for lower orders is cheaper, so lower
thresholds could help reduce mTHP allocation fallbacks at an acceptable
cost. Is that the idea?

>
>>  
>>  static bool should_proactive_compact_node(pg_data_t *pgdat)
>>  {
>>  	int wmark_high;
>> -	unsigned int order = COMPACTION_HPAGE_ORDER;
>> +	unsigned int order = compact_hpage_order();
>>  
>>  	if (!sysctl_compaction_proactiveness || kswapd_is_running(pgdat))
>>  		return false;
>>  
>> -	wmark_high = fragmentation_score_wmark(false);
>> +	wmark_high = fragmentation_score_wmark(false, order);
>>  	return fragmentation_score_node(pgdat, order) > wmark_high;
>>  }
>>  
>> @@ -2306,7 +2330,7 @@ static enum compact_result __compact_finished(struct compact_control *cc)
>>  
>>  	if (cc->proactive_compaction) {
>>  		int score, wmark_low;
>> -		unsigned int order = COMPACTION_HPAGE_ORDER;
>> +		unsigned int order = compact_hpage_order();
>>  		pg_data_t *pgdat;
>>  
>>  		pgdat = cc->zone->zone_pgdat;
>> @@ -2314,7 +2338,7 @@ static enum compact_result __compact_finished(struct compact_control *cc)
>>  			return COMPACT_PARTIAL_SKIPPED;
>>  
>>  		score = fragmentation_score_zone(cc->zone, order);
>> -		wmark_low = fragmentation_score_wmark(true);
>> +		wmark_low = fragmentation_score_wmark(true, order);
>>  
>>  		if (score > wmark_low)
>>  			ret = COMPACT_CONTINUE;
>> @@ -3239,7 +3263,7 @@ static int kcompactd(void *p)
>>  		timeout = default_timeout;
>>  		if (should_proactive_compact_node(pgdat)) {
>>  			unsigned int prev_score, score;
>> -			unsigned int order = COMPACTION_HPAGE_ORDER;
>> +			unsigned int order = compact_hpage_order();
>>  
>>  			prev_score = fragmentation_score_node(pgdat, order);
>>  			compact_node(pgdat, true);
>
>
