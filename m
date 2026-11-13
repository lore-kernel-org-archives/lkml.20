Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794592692;
	b=WSdO6q04bd0J5k4X6uYeW+NWwnZf7HXAIaP9e71DkFEcchck/DdzBmfh9h5rTH9McW8y
	 UaFS+n7CgPoj2F7GP+Msi2ULP2wRTHWiY3GNHMEaap32XwVqwSbWvh4d5uLRQZ8aOEvLH
	 CU4IV5PMai5Nvt94HuEIeRmJpc3Hd9Ts7EOnVyCRCNBoDgWCK50lHFVgl0BYGgiti1p0j
	 eQABE5y1bK4nLeUiTMX+E526Q/dYrfFWF6iwOXT4NhM39We6rOgn3/AScjpB+sW2MhLa8
	 /2BnoNsND9TikfZHnMshddgo/f//DsRcIduEzAG57VvQ0RjzWYplZfpxG/7e9AYLZIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592692;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=00jMmBFJCXdtkRn+8A2ST7tyVGGZ50JpVGLPQ7zHCRs=;
	b=EdCMC55klk6SlyEe7+sz4j8Pd0EWuaHc383ST5V0aPaOvY/TTlU55u0NffgUKT9/PZqF
	 BkKmBc2DNE+zM1d7bshZIVOAU1jeJz6hIWoBtpcQAFJf6xQV4JVfBWpBB0IH5G//BqoIA
	 8fFflpmzziMvwjsIYcCWOObb/HBBqgAiEaog/NDg5a0bUvn51g6MSwZGeV8/FeE7ykL6q
	 xtHfGaunBW1ul/uo23+NrXUkusD9wanNEILB31K30NVI7ghRmpAujdVLGND+hno9eHpXa
	 +trk02f8Z34f3hglDuh3TTpI3TwcLZ3nM5j8QDcHXCe3b/LVtNvZe4NniLdpsQMrVOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lbSejmPJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A03606ED98
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lbSejmPJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC7151F000C4;
	Fri, 13 Nov 2026 17:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794592691;
	bh=00jMmBFJCXdtkRn+8A2ST7tyVGGZ50JpVGLPQ7zHCRs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lbSejmPJ/zaWI5Zth/4n5ZvyYic5tt7j5BDgRlGEBbus+t0DjlvKiuuU2kPvXp1lX
	 1Gq95ECy89RBBAfgAPI6nHItRhTRDHZQWwnICzxN7i0xtP4QEiDhIMue5Xs7xyab25
	 AhAzcftaN8bSlBBj2uC0vuM9a5cvB2mdVB8uZshK8JkRpZTy/5WbzzQ2HCb3KkmTln
	 9Rx9dJCu+rk3y0aJtNX2cTlcfVuBEiF5FU5DQYsllO/6ihdb+yiEN5wohu+KZ6SoMs
	 oXQulNNq/MgEz0JvVuLs7FYryMC5JxlAep5Y2ZcoPzIZatGTMmBfrD5IHzzV21vt7M
	 d+b9w34naq6KA==
Message-ID: <e16c46e8-d69d-450f-bf98-6f14755cdae5@kernel.org>
Date: Fri, 13 Nov 2026 18:58:05 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] mm: vmscan: tell direct reclaim the allocation is
 ALLOC_NOFRAGMENT
Content-Language: en-US
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Mike Rapoport <rppt@kernel.org>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Kairui Song <kasong@tencent.com>,
 Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>,
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
 Baoquan He <baoquan.he@linux.dev>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Dev Jain <dev.jain@arm.com>,
 Harry Yoo <harry@kernel.org>, Usama Arif <usama.arif@linux.dev>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20261102093939.3340540-1-kas@kernel.org>
 <20261102093939.3340540-4-kas@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <20261102093939.3340540-4-kas@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/2/26 10:39, Kiryl Shutsemau (Meta) wrote:
> Direct reclaim for a costly order stops as soon as the allocation could
> succeed.  compaction_ready() skips a zone and should_continue_reclaim()
> stops reclaiming when zone_watermark_ok() passes, and zone_watermark_ok()
> accepts a free page of any migratetype.
> 
> With defrag_mode, the allocation behind the reclaim is ALLOC_NOFRAGMENT
> and cannot take the free pages left in unmovable and reclaimable
> pageblocks.  Reclaim stops on them anyway, having freed little.
> 
> In Dev Jain's 64K mTHP benchmark, with the high-order watermark check
> already honouring ALLOC_NOFRAGMENT, an order-4 direct reclaim frees 16
> pages on average with defrag_mode and 45 without.  64K faults get a bit
> over half as many folios as without defrag_mode (medians of 15 runs):
> 
>                               defrag_mode=0  defrag_mode=1  defrag_mode=1
>                                                             + this patch
>     64K faults allocated              20750          11538         19759
>     64K faults falling back to 4K       725           9945          1664
> 
> Pass ALLOC_NOFRAGMENT from the allocation down to try_to_free_pages().
> Both checks then ask __zone_watermark_ok_mt() for a free page the
> allocation can take, and an order-4 direct reclaim frees 40 pages on
> average.
> 
> Fixes: e3aa7df331bc ("mm: page_alloc: defrag_mode")
> Reported-by: Dev Jain <dev.jain@arm.com>
> Closes: https://lore.kernel.org/all/4aa14b41-9b89-494c-8825-55fffd5a541c@arm.com/
> Tested-by: Dev Jain <dev.jain@arm.com>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

I'd perhaps pass whole alloc_flags to try_to_free_pages(), but other than
that LGTM.

> ---
>  mm/internal.h   |  3 ++-
>  mm/page_alloc.c |  8 +++++---
>  mm/vmscan.c     | 24 +++++++++++++++++++-----
>  3 files changed, 26 insertions(+), 9 deletions(-)
> 
> diff --git a/mm/internal.h b/mm/internal.h
> index 8e58e2db5e09..b43947818f9a 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -65,7 +65,8 @@ void folio_mark_lazyfree(struct folio *folio);
>  /* mm/vmscan.c */
>  unsigned long zone_reclaimable_pages(struct zone *zone);
>  unsigned long try_to_free_pages(struct zonelist *zonelist, int order,
> -				gfp_t gfp_mask, const nodemask_t *mask);
> +				gfp_t gfp_mask, const nodemask_t *mask,
> +				bool nofragment);
>  unsigned long lruvec_lru_size(struct lruvec *lruvec, enum lru_list lru,
>  			      int zone_idx);
>  
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index d53fb2c67ae1..08f9bdcd3b9f 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -4451,7 +4451,7 @@ static unsigned int check_retry_zonelist(unsigned int seq)
>  
>  /* Perform direct synchronous page reclaim */
>  static unsigned long
> -__perform_reclaim(gfp_t gfp_mask, unsigned int order,
> +__perform_reclaim(gfp_t gfp_mask, unsigned int order, unsigned int alloc_flags,
>  					const struct alloc_context *ac)
>  {
>  	unsigned int noreclaim_flag;
> @@ -4465,7 +4465,8 @@ __perform_reclaim(gfp_t gfp_mask, unsigned int order,
>  	noreclaim_flag = memalloc_noreclaim_save();
>  
>  	progress = try_to_free_pages(ac->zonelist, order, gfp_mask,
> -								ac->nodemask);
> +				     ac->nodemask,
> +				     alloc_flags & ALLOC_NOFRAGMENT);
>  
>  	memalloc_noreclaim_restore(noreclaim_flag);
>  	fs_reclaim_release(gfp_mask);
> @@ -4487,7 +4488,8 @@ __alloc_pages_direct_reclaim(gfp_t gfp_mask, unsigned int order,
>  	int reclaim_order = ac->reclaim_compact_order;
>  
>  	psi_memstall_enter(&pflags);
> -	*did_some_progress = __perform_reclaim(gfp_mask, reclaim_order, ac);
> +	*did_some_progress = __perform_reclaim(gfp_mask, reclaim_order,
> +					       alloc_flags, ac);
>  	if (unlikely(!(*did_some_progress)))
>  		goto out;
>  
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 9959ca158ce8..54a16dbb84dd 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -142,6 +142,9 @@ struct scan_control {
>  	/* One of the zones is ready for compaction */
>  	unsigned int compaction_ready:1;
>  
> +	/* The allocation cannot fall back to other migratetypes' blocks */
> +	unsigned int nofragment:1;
> +
>  	/* There is easily reclaimable cold cache in the current node */
>  	unsigned int cache_trim_mode:1;
>  
> @@ -6316,6 +6319,17 @@ static bool in_reclaim_compaction(struct scan_control *sc)
>  	return false;
>  }
>  
> +static bool allocation_can_succeed(struct zone *zone, struct scan_control *sc,
> +				   unsigned long mark)
> +{
> +	unsigned int alloc_flags = sc->nofragment ? ALLOC_NOFRAGMENT : 0;
> +	long free_pages = zone_page_state(zone, NR_FREE_PAGES);
> +	int migratetype = gfp_migratetype(sc->gfp_mask);
> +
> +	return __zone_watermark_ok_mt(zone, sc->order, mark, sc->reclaim_idx,
> +				      alloc_flags, free_pages, migratetype);
> +}
> +
>  /*
>   * Reclaim/compaction is used for high-order allocation requests. It reclaims
>   * order-0 pages before compacting the zone. should_continue_reclaim() returns
> @@ -6354,8 +6368,7 @@ static inline bool should_continue_reclaim(struct pglist_data *pgdat,
>  		unsigned long watermark = min_wmark_pages(zone);
>  
>  		/* Allocation can already succeed, nothing to do */
> -		if (zone_watermark_ok(zone, sc->order, watermark,
> -				      sc->reclaim_idx, 0))
> +		if (allocation_can_succeed(zone, sc, watermark))
>  			return false;
>  
>  		if (compaction_suitable(zone, sc->order, watermark,
> @@ -6580,8 +6593,7 @@ static inline bool compaction_ready(struct zone *zone, struct scan_control *sc)
>  		return false;
>  
>  	/* Allocation can already succeed, nothing to do */
> -	if (zone_watermark_ok(zone, sc->order, min_wmark_pages(zone),
> -			      sc->reclaim_idx, 0))
> +	if (allocation_can_succeed(zone, sc, min_wmark_pages(zone)))
>  		return true;
>  
>  	/*
> @@ -6965,7 +6977,8 @@ static bool throttle_direct_reclaim(gfp_t gfp_mask, struct zonelist *zonelist,
>  }
>  
>  unsigned long try_to_free_pages(struct zonelist *zonelist, int order,
> -				gfp_t gfp_mask, const nodemask_t *nodemask)
> +				gfp_t gfp_mask, const nodemask_t *nodemask,
> +				bool nofragment)
>  {
>  	unsigned long nr_reclaimed;
>  	struct scan_control sc = {
> @@ -6978,6 +6991,7 @@ unsigned long try_to_free_pages(struct zonelist *zonelist, int order,
>  		.may_writepage = 1,
>  		.may_unmap = 1,
>  		.may_swap = 1,
> +		.nofragment = nofragment,
>  	};
>  
>  	/*

