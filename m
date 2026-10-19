Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61AB0494828
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397588; cv=none; b=dODOo0C34EGZ7yrPaA+DNGWMGEdsZj41g7YXvmwroMsDh76yZFOkVLZnq0Dd/E7JssiUCmNRyNuO4yesP/HjkX1gl00etduzUCCrgGbBHRrmSsyKOm/KrpXifY0IOAyHns2z9ac2xJ/ZUwz7aasy0brzqMvGO6TJqlyEk6M+p5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397588; c=relaxed/simple;
	bh=J+CS5fDSpkD3yZQR05hOJn3PmeuKCGE/5OUyR0Qg/dA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l50+wwaVysATDZ1VQnnNzQn2Pj1qjAabGKo+v2nFsCqpJ+9QdKSaHzsQOmznSw3cb0cqqAw7c675Vbe/7Dr09JMKw0Tj9TEpMiaElSboygfna5fuNNrtbp/uhOS5SGVakb1+HP1Ujn+K/9ipOwYAEbGnGCQ7GOH/YJ9sdmUAFng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ScN3WlME; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ScN3WlME"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 449F11477;
	Mon, 19 Oct 2026 01:13:01 -0700 (PDT)
Received: from [10.164.19.55] (unknown [10.164.19.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 01C893F673;
	Mon, 19 Oct 2026 01:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792397584; bh=J+CS5fDSpkD3yZQR05hOJn3PmeuKCGE/5OUyR0Qg/dA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ScN3WlMECk4NXBAmST1T9qGWJsM371k2ZAqhsGXlCB43d1V6BGnTWNP16+ieLeOAn
	 ChnTbqWSqJDuX3DOttFoSSb1A3JjE8UGnbdr+tUe25JzOtw63gszgPPYJnEnza7GbU
	 eW9b2ajdBqijvSRJqrPcEQ399ZJssTkWnFjh12e8=
Message-ID: <8e54025a-03da-4cba-bae8-1604463c7622@arm.com>
Date: Mon, 19 Oct 2026 13:42:55 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 2/4] mm: compaction: target mTHP order for
 proactive compaction
To: Bo Zhang <zhangbo0325@gmail.com>, akpm@linux-foundation.org,
 vbabka@kernel.org, david@kernel.org
Cc: surenb@google.com, mhocko@suse.com, brendan.jackman@linux.dev,
 hannes@cmpxchg.org, ziy@nvidia.com, ljs@kernel.org, liam@infradead.org,
 rppt@kernel.org, qi.zheng@linux.dev, shakeel.butt@linux.dev,
 kasong@tencent.com, baohua@kernel.org, axelrasmussen@google.com,
 yuanchu@google.com, weixugc@google.com, zhaonanzhe@xiaomi.com,
 lipengfei28@xiaomi.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Bo Zhang <zhangbo56@xiaomi.com>
References: <20261001001412.3837085-1-zhangbo56@xiaomi.com>
 <20261001001412.3837085-3-zhangbo56@xiaomi.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20261001001412.3837085-3-zhangbo56@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 01/10/26 5:44 am, Bo Zhang wrote:
> Proactive compaction triggers against COMPACTION_HPAGE_ORDER (order-9),
> which is too heavyweight and misdirected for mTHP systems where the
> pressure is on smaller orders like order-2.
> 
> Add compact_hpage_order() to return the highest always-enabled anonymous
> mTHP order, and use it as the proactive compaction target in
> should_proactive_compact_node(), __compact_finished() and kcompactd().
> 
> Fragmentation scores are not comparable across orders, a small order
> scores much lower for the same state, so scale the proactive watermarks
> down in proportion to the target order, otherwise order-2 would rarely
> reach the order-9 threshold.
> 
> Signed-off-by: Bo Zhang <zhangbo56@xiaomi.com>
> ---
>  mm/compaction.c | 40 ++++++++++++++++++++++++++++++++--------
>  1 file changed, 32 insertions(+), 8 deletions(-)
> 
> diff --git a/mm/compaction.c b/mm/compaction.c
> index ecd3e6cf54fc..3928a5483efc 100644
> --- a/mm/compaction.c
> +++ b/mm/compaction.c
> @@ -24,6 +24,7 @@
>  #include <linux/page_owner.h>
>  #include <linux/psi.h>
>  #include <linux/cpuset.h>
> +#include <linux/huge_mm.h>
>  #include "page_alloc.h"
>  #include "internal.h"
>  
> @@ -81,6 +82,17 @@ static inline bool is_via_compact_memory(int order) { return false; }
>  #define COMPACTION_HPAGE_ORDER	(PMD_SHIFT - PAGE_SHIFT)
>  #endif
>  
> +static inline int compact_hpage_order(void)
> +{
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +	unsigned long orders = READ_ONCE(huge_anon_orders_always);
> +
> +	if (orders)
> +		return __fls(orders);
> +#endif
> +	return COMPACTION_HPAGE_ORDER;
> +}
> +
>  static struct page *mark_allocated_noprof(struct page *page, unsigned int order, gfp_t gfp_flags)
>  {
>  	post_alloc_hook(page, order, __GFP_MOVABLE, ALLOC_DEFAULT);
> @@ -2257,24 +2269,36 @@ static unsigned int fragmentation_score_node(pg_data_t *pgdat, unsigned int orde
>  	return score;
>  }
>  
> -static unsigned int fragmentation_score_wmark(bool low)
> +/*
> + * Fragmentation scores are not comparable across orders: a lower order
> + * scores much lower than a higher order for the same fragmentation state.
> + * Scale the watermark proportionally to the target order so a small order
> + * can still trigger proactive compaction; COMPACTION_HPAGE_ORDER keeps the
> + * original threshold.
> + */
> +static unsigned int fragmentation_score_wmark(bool low, unsigned int order)
>  {
> -	unsigned int wmark_low, leeway;
> +	unsigned int wmark_low, leeway, wmark;
>  
>  	wmark_low = 100U - sysctl_compaction_proactiveness;
>  	leeway = min(10U, wmark_low / 2);
> -	return low ? wmark_low : min(wmark_low + leeway, 100U);
> +	wmark = low ? wmark_low : min(wmark_low + leeway, 100U);
> +
> +	if (order < COMPACTION_HPAGE_ORDER)
> +		wmark = wmark * order / COMPACTION_HPAGE_ORDER;
> +
> +	return wmark;
>  }

I wonder if this function should be left alone?

compaction_proactiveness, as I understand is given as a sysfs knob to
ensure that the user can control how much power they want to invest into
compacting. So suppose the value is 20, and the highest mTHP order is
only 2.

This gives wmark = 90 * 2 / 9 = 20. So, even if 80% of the memory can
serve order-2 allocations, we will still perform compaction for order-2.
This seems "extremely proactive" :)

>  
>  static bool should_proactive_compact_node(pg_data_t *pgdat)
>  {
>  	int wmark_high;
> -	unsigned int order = COMPACTION_HPAGE_ORDER;
> +	unsigned int order = compact_hpage_order();
>  
>  	if (!sysctl_compaction_proactiveness || kswapd_is_running(pgdat))
>  		return false;
>  
> -	wmark_high = fragmentation_score_wmark(false);
> +	wmark_high = fragmentation_score_wmark(false, order);
>  	return fragmentation_score_node(pgdat, order) > wmark_high;
>  }
>  
> @@ -2306,7 +2330,7 @@ static enum compact_result __compact_finished(struct compact_control *cc)
>  
>  	if (cc->proactive_compaction) {
>  		int score, wmark_low;
> -		unsigned int order = COMPACTION_HPAGE_ORDER;
> +		unsigned int order = compact_hpage_order();
>  		pg_data_t *pgdat;
>  
>  		pgdat = cc->zone->zone_pgdat;
> @@ -2314,7 +2338,7 @@ static enum compact_result __compact_finished(struct compact_control *cc)
>  			return COMPACT_PARTIAL_SKIPPED;
>  
>  		score = fragmentation_score_zone(cc->zone, order);
> -		wmark_low = fragmentation_score_wmark(true);
> +		wmark_low = fragmentation_score_wmark(true, order);
>  
>  		if (score > wmark_low)
>  			ret = COMPACT_CONTINUE;
> @@ -3239,7 +3263,7 @@ static int kcompactd(void *p)
>  		timeout = default_timeout;
>  		if (should_proactive_compact_node(pgdat)) {
>  			unsigned int prev_score, score;
> -			unsigned int order = COMPACTION_HPAGE_ORDER;
> +			unsigned int order = compact_hpage_order();
>  
>  			prev_score = fragmentation_score_node(pgdat, order);
>  			compact_node(pgdat, true);

