Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A7837A4B8
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789665408; cv=none; b=a2Owo0eVr1BeouBp0d2qy5LoXRO9mVu+rwJd54ChHUIY+dmMe9yxNXRmRPIiKSgJFZ75tMxk5wf8p0TMmQzxldfU5xDpNbWpgUchb3KimEjT0YO4yiS17vPmgIy3PVSSIJPbPiogj94T1br13ZgL3yANorfxqnRl59HvqYoxz0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789665408; c=relaxed/simple;
	bh=9mdhT3yCdm1p+neK5R1AmgU9J+f54xCnRBUm7gaxyg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m58eJKM48IKPF6ctsyIG1Zds7/BFg6eVVu/5/oDC3Ow/5RPr17j15ec1/JRc9D1nBi5zIRFc9FROQwfFr6uSYKwsKY1PYZLMdSObjFdrQ9l09U/Z2TQbVj01ZgKk2wocYTrJwZ9ENwbBkLZHFKQ2IA4fQYNOLeezmmehRX3J0a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ncx4RsUf; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ncx4RsUf"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b24c3so681985f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789665404; x=1790270204; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lvc4+TpMUxQ7MOz+O0C7vMiwmJqsd+n4APfPejatdr0=;
        b=Ncx4RsUf/KieiPVC8o3ejH6+E05z38IQoAs5a9gtpFM5gxviUWyrBFdZFDQneXc51r
         UBNeQZ/KKKJ7YGkzHy3exluedRUvbcpe7kP2Ayj+MNZ/gip4klLXKTteYBw4V/LHisYT
         6DmHBDG0YfxLv9YZdP3gffFstlDWv4aTwbrwhG1am1ydV3ECyYoHTdl6pciBnCOA9jui
         /olne+frnkAw6ifLdg4rxUFrgWBUlvFTBhKLcT6kkR/G2ce0pcawu0LTRkoxQ21HR0kX
         BGGLXFLRKgVUq0b7eJe86gIvwfKUtvKtESEVgfnAu4snLEKlodwyixNUBWDidzCm4ffk
         4UMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789665404; x=1790270204;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lvc4+TpMUxQ7MOz+O0C7vMiwmJqsd+n4APfPejatdr0=;
        b=stCUq+/wv2S58wNF6j1XeTu4z1M4Qj+FC3L0f+ANKkouPQZ14Yqo5vYfAxSYn1aUY2
         f4bCp0+fsUpYt1Q4rP8r98RwqbKA0luszW+zO3fKFHsHke9gXTLOenP2vuxe+uVuVWp6
         VDRm9Ktj/wzuupxSl/sw9yT8nzJtSCu0/t9v2+nxGbOGKIV+jmjTeRJDoC2jOnpCKaXY
         MSgEgMBQgcXyaSZocmqowblAqaS43QBqVP73sU2Ksl32nY8+TP8Xov9KPWKzMvjUnhqC
         DYUTFTHW1kJmcGRwbo4ieYfzUmPlVE4iv5tThIe/d/tCgIcT8z2lm8Xnz4DIzfi76677
         4Tew==
X-Forwarded-Encrypted: i=1; AKwUvBxb9IEfPQGxe1YdjgmJpZLxL/LiNKn4VHoSeWhNRMhXsNzeOxycuT2R9voFQDqiEodaHpABu3j+rwqvMdQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kai5XRgCoLWInZ7sv8ZH7XxIvFDcOPODu8xAtk7S2Dfwy2m1dZ
	KVQlKpjF2ArwwdBSiONop//5rCmhFlUq/pceaim9g+qE82htHFuDSh8q
X-Gm-Gg: AYBFou2BVX8KJeZyAnUXDtlDxB2nhx/ky0kwEuDPpB2S7VtJOPOiKynqHt1bo6tXk7d
	yAp7tODZHw7pddZlXcjJ0rVZUG1TjYEKNFJbnWwCcmcD3TmKtc+nEqg2BFPvuhZUymwfGGR/JLH
	g3760ArXrsMHJn6afii0P7PiQASXzjlz5FxxbKvjmrZTkCuzfLb489H3SKlQ4aG6znItU/S6v6C
	hRx3VeSsZjT7oo58cvYUgyInKflvJDCWpuB0RnAYqLNOB41o/c8zZzOdEVdg14zLMOn3diF3YEa
	ALtXSEo9WqLsUpPI942u+Zs3gESIToDGqeqV/wGwdMTgZFSEgOa8YsbPMfXB3kl+LGHPor+Zr+2
	3PY8Iva7jK2GAgfUlSFjFOCItdQVIvullAiQg+DCviOyAMM4S15+NFHzdm4nMxTB81FC7uRIa0x
	Q1a9nB7tTbYzHgjTTnITf8VYtAvvRJ6IqaFGNbcIxqZt603Azo8dRF/YYdKrxGSbDpESJymhSNg
	pkWErL/csSiSbkwia9qrydlL2Of6yr4T6dXgtWiW0IpcjM1Hb1mbEt7WxQhyiXfy7OHEyPW
X-Received: by 2002:a05:6000:2997:10b0:485:c240:20ec with SMTP id ffacd0b85a97d-4870d26961cmr7299030f8f.37.1789665404188;
        Thu, 17 Sep 2026 10:16:44 -0700 (PDT)
Received: from localhost (pat-125-254.wlan.net.ed.ac.uk. [192.41.125.254])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf37e69sm16896117f8f.29.2026.09.17.10.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:16:43 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:16:42 +0100
From: Karim Manaouil <kmanaouil.dev@gmail.com>
To: Bo Zhang <zhangbo0325@gmail.com>
Cc: akpm@linux-foundation.org, vbabka@kernel.org, david@kernel.org,
	surenb@google.com, mhocko@suse.com, brendan.jackman@linux.dev,
	hannes@cmpxchg.org, ziy@nvidia.com, ljs@kernel.org,
	liam@infradead.org, rppt@kernel.org, qi.zheng@linux.dev,
	shakeel.butt@linux.dev, kasong@tencent.com, baohua@kernel.org,
	axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com,
	zhaonanzhe@xiaomi.com, lipengfei28@xiaomi.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Bo Zhang <zhangbo56@xiaomi.com>
Subject: Re: [RFC PATCH 4/4] mm: adjust free_pages to make
 __zone_watermark_ok() mTHP-aware
Message-ID: <20260917171642.b4pkhqmvjwnq3vmq@wrangler>
References: <20260825043833.2659350-1-zhangbo56@xiaomi.com>
 <20260825043833.2659350-5-zhangbo56@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825043833.2659350-5-zhangbo56@xiaomi.com>

On Tue, Aug 25, 2026 at 12:38:33PM +0800, Bo Zhang wrote:
> To improve the mTHP allocation success rate and reduce
> fragmentation over time, introduce
> zone_effective_free_pages() for mTHP-aware free page accounting.
> 
> Refactor the free page counting logic used by pgdat_balanced() and
> compaction_suit_allocation_order() into a shared helper function
> zone_effective_free_pages().
> 
> The function selects the appropriate free page metric based on context:
> - defrag_mode: use NR_FREE_PAGES_BLOCKS (whole pageblock accounting)
> - mTHP always-enabled: count only free pages in buddy blocks >= the
>   minimum always-enabled mTHP order, since smaller fragments cannot
>   satisfy mTHP allocations
> - otherwise: use NR_FREE_PAGES
> 
> Signed-off-by: Bo Zhang <zhangbo56@xiaomi.com>
> ---
>  mm/compaction.c | 38 ++++++++++++++++++++++++++++++++++----
>  mm/internal.h   |  3 +++
>  mm/vmscan.c     | 23 +++++------------------
>  3 files changed, 42 insertions(+), 22 deletions(-)
> 
> diff --git a/mm/compaction.c b/mm/compaction.c
> index 15b92475562a..29be72597415 100644
> --- a/mm/compaction.c
> +++ b/mm/compaction.c
> @@ -2528,6 +2528,38 @@ bool compaction_zonelist_suitable(struct alloc_context *ac, int order,
>  	return false;
>  }
>  
> +/**
> + * zone_effective_free_pages - get free pages relevant to allocation order
> + * @zone:       target zone
> + * @order:      allocation order
> + * @use_blocks: if true, use NR_FREE_PAGES_BLOCKS
> + *
> + * In defrag_mode, watermarks must be met in whole blocks to avoid
> + * polluting allocator fallbacks. kswapd usually cannot accomplish
> + * this on its own and needs kcompactd support.
> + *
> + * When mTHP always-enabled orders are configured, count only free pages
> + * in blocks >= min mTHP order, as smaller fragments cannot satisfy mTHP
> + * allocations.
> + */
> +unsigned long zone_effective_free_pages(struct zone *zone,
> +					unsigned int order,
> +					bool use_blocks)
> +{
> +	if (use_blocks)
> +		return zone_page_state(zone, NR_FREE_PAGES_BLOCKS);
> +
> +	if (READ_ONCE(huge_anon_orders_always) && order == compact_hpage_order()) {
> +		unsigned long free_pages = 0;
> +
> +		for (int o = order; o < NR_PAGE_ORDERS; o++)
> +			free_pages += zone->free_area[o].nr_free << o;

I understand that you don't need a precise value here, but in every
instance in the kernel source tree where nr_free is accessed, it's
accessed under the zone lock. Do we need to use READ_ONCE()?

> +		return free_pages;
> +	}
> +
> +	return zone_page_state(zone, NR_FREE_PAGES);
> +}
> +
>  /*
>   * Should we do compaction for target allocation order.
>   * Return COMPACT_SUCCESS if allocation for target order can be already
> @@ -2543,10 +2575,8 @@ compaction_suit_allocation_order(struct zone *zone, unsigned int order,
>  	unsigned long free_pages;
>  	unsigned long watermark;
>  
> -	if (kcompactd && defrag_mode)
> -		free_pages = zone_page_state(zone, NR_FREE_PAGES_BLOCKS);
> -	else
> -		free_pages = zone_page_state(zone, NR_FREE_PAGES);
> +	free_pages = zone_effective_free_pages(zone, order,
> +					       kcompactd && defrag_mode);
>  
>  	watermark = wmark_pages(zone, alloc_flags & ALLOC_WMARK_MASK);
>  	if (__zone_watermark_ok(zone, order, watermark, highest_zoneidx,
> diff --git a/mm/internal.h b/mm/internal.h
> index 38b1165212c9..14bb9543879b 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -1654,4 +1654,7 @@ static inline bool can_spin_trylock(void)
>  	return true;
>  }
>  
> +unsigned long zone_effective_free_pages(struct zone *zone,
> +					unsigned int order,
> +					bool use_blocks);
>  #endif	/* __MM_INTERNAL_H */
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index c1404a59523d..a419a2c2fca4 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -6966,7 +6966,6 @@ static bool pgdat_balanced(pg_data_t *pgdat, int order, int highest_zoneidx)
>  	 * meet watermarks.
>  	 */
>  	for_each_managed_zone_pgdat(zone, pgdat, i, highest_zoneidx) {
> -		enum zone_stat_item item;
>  		unsigned long free_pages;
>  
>  		if (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING)
> @@ -6974,21 +6973,6 @@ static bool pgdat_balanced(pg_data_t *pgdat, int order, int highest_zoneidx)
>  		else
>  			mark = high_wmark_pages(zone);
>  
> -		/*
> -		 * In defrag_mode, watermarks must be met in whole
> -		 * blocks to avoid polluting allocator fallbacks.
> -		 *
> -		 * However, kswapd usually cannot accomplish this on
> -		 * its own and needs kcompactd support. Once it's
> -		 * reclaimed a compaction gap, and kswapd_shrink_node
> -		 * has dropped order, simply ensure there are enough
> -		 * base pages for compaction, wake kcompactd & sleep.
> -		 */
> -		if (defrag_mode && order)
> -			item = NR_FREE_PAGES_BLOCKS;
> -		else
> -			item = NR_FREE_PAGES;
> -
>  		/*
>  		 * When there is a high number of CPUs in the system,
>  		 * the cumulative error from the vmstat per-cpu cache
> @@ -7001,9 +6985,12 @@ static bool pgdat_balanced(pg_data_t *pgdat, int order, int highest_zoneidx)
>  		 * counter won't actually be per-cpu cached. But keep
>  		 * things simple for now; revisit when somebody cares.
>  		 */
> -		free_pages = zone_page_state(zone, item);
> +		free_pages = zone_effective_free_pages(zone, order,
> +						       defrag_mode & order);
>  		if (zone->percpu_drift_mark && free_pages < zone->percpu_drift_mark)
> -			free_pages = zone_page_state_snapshot(zone, item);
> +			free_pages = zone_page_state_snapshot(zone,
> +					defrag_mode & order ?
> +					NR_FREE_PAGES_BLOCKS : NR_FREE_PAGES);
>  
>  		if (__zone_watermark_ok(zone, order, mark, highest_zoneidx,
>  					0, free_pages))
> -- 
> 2.34.1
> 

-- 
~karim
