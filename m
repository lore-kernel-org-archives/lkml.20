Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794592125;
	b=KJDWR7f3hjiLoBH800mSadwf7cMA+FgeiJ/KfUvomjxlmFBMXp5lhL5HTWWy54K726PG
	 BypUS0Azjk0nI628P/EAgtPKM9URaGH+OQkbewCMwRxAymGq9Tfk4PzU9kJwvCxtncqIh
	 WJIx97CCyibXnU5SX5P5Ndf6CKnjWLQZrNtlBjvNhpsCvsy0jRog8tZJmylYh9hm9P8Ds
	 6pTAfyu2boKICF8eA9JbMHQSFYGFSxCeILCt+pWJQ3oDlRugqnd0F+QvFUaPaJ5yzJrnV
	 oTxAreVjNfvr4cg13IubaIX7FFmZgADEga4sg0Ej6U2s5fGFn5cp9MO2rIbsoZ8WXxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592125;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=8QE0lBItlXqLLZsb6/W5u8fuKfBnTPnnw9b1Lz54dEM=;
	b=Dy7EL//6YZsdhMEM/sd0Y7eaS9tQXzl4vOO37KH3/KETlFRkE1OIl/l9Haoj2Z1ptVKt
	 FHVgI4KzfDBsAJ7BJ24uQ3QO0LBvscgrft/MQusfTH2IvMHAqdxr3dzpwMgshafmDtcOA
	 Fx9irgNCsRwXqIQ9To0TDVAvPBKWCGxPogWMJiaznxOeklHst157ccbF2RBCD7ieb2oYm
	 kxbeMXLDHFuzHeMKRCuLhy9ZyLv/DY7yEgZgc+l8BMjLrD37GJh+uh+SPVY6JmFA9mywV
	 DhHQ3SIGSz3C5GbcF7mKvONA3dGWXE0Wejb5mS8BUQkorOe9cZLUGlWllf+ErRw26uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="je/EUNBi";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6659D6079D41
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=je/EUNBi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9E1D1F000C5;
	Fri, 13 Nov 2026 17:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794592125;
	bh=8QE0lBItlXqLLZsb6/W5u8fuKfBnTPnnw9b1Lz54dEM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=je/EUNBicrrps5U0MfpbWr7DpEg6xZPbOw8lC68mHafP/SxKyGoY70T9fgJQIwY/w
	 UsutT+SXhSIQeK3Tne6UI95e3XwuHnSq0opGdidq/hptHe5PPDW+3eCqAsa/i2Olgj
	 YOCRNfJA0IKDYK48PwHJP3CQMu7fehzOIeHTlBZBw7h5CNDsiBJfZiPQ2ELCyYFz6A
	 Ypuxsqq1M0QK/LQ81bT8E9YuRliroWUEZ/XWrkR/eJzhcA3JTpLR5WHqB3aQVOSa+U
	 lVcTapZDsm3UWeeAuoRw39vC6qzd7spQ9tfrLlaId2xGE5WQBpdEEH3YqQYgFUeTBN
	 e0O/9nt0gLR0g==
Message-ID: <c58d0687-33c8-4073-bd1c-0bc2752c8a58@kernel.org>
Date: Fri, 13 Nov 2026 18:48:37 +0100
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
Subject: Re: [PATCH v2 2/3] mm: page_alloc: make the high-order watermark
 check honour ALLOC_NOFRAGMENT
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
 <20261102093939.3340540-3-kas@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <20261102093939.3340540-3-kas@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/2/26 10:39, Kiryl Shutsemau (Meta) wrote:
> With defrag_mode, every slowpath allocation carries ALLOC_NOFRAGMENT.  A
> request below pageblock_order may take a page of its own migratetype or
> claim a whole free block, but not steal from another migratetype's block.
> The high-order part of the watermark check still accepts a free page of
> any migratetype.
> 
> Under memory pressure, movable allocations take free movable pages as
> soon as reclaim frees them.  Free space in unmovable and reclaimable
> pageblocks is off-limits to them under ALLOC_NOFRAGMENT, and builds up.
> The free pages of order 4 and up end up mostly in those pageblocks.
> 
> A 64K mTHP fault cannot take them, but direct compaction's up-front check
> counts them and returns COMPACT_SUCCESS without compacting anything.  The
> allocation then fails.  Because compaction "succeeded", it is never
> deferred, and every fault stalls in it again before falling back to small
> pages.
> 
> Dev Jain's benchmark faults 64K mTHPs under swap pressure, in a 7G VM
> with only the 64K size enabled.  With defrag_mode, those faults stall in
> compaction 18 times as often and get about a third of the folios
> (medians of 15 runs):
> 
>                               defrag_mode=0  defrag_mode=1  defrag_mode=1
>                                                             + this patch
>     compact_stall                      1690          30669          2607
>     compact_fail                        621          30531           906
>     64K faults allocated              20750           7391         11538
>     64K faults falling back to 4K       725          13832          9945
> 
> Make __zone_watermark_ok_mt() skip other migratetypes' free lists below
> pageblock_order for an ALLOC_NOFRAGMENT request.  Give
> __compact_finished() the same rule for its fallback test, so that
> compaction, once it runs, stops on a page the request can take.
> 
> zone_watermark_fast() calls __zone_watermark_ok_mt() too.  With
> defrag_mode, an allocation now wakes kswapd and starts reclaim or
> compaction as soon as the free lists hold nothing it can take.  For the
> orders the per-cpu lists serve, that is earlier than before: the check
> does not count their pages, so the allocation no longer uses up the local
> list first.  A request that may not wake kswapd or reclaim, such as an
> mTHP fault with THP defrag=never, falls back to a smaller folio instead.
> 
> Fixes: e3aa7df331bc ("mm: page_alloc: defrag_mode")
> Reported-by: Dev Jain <dev.jain@arm.com>
> Closes: https://lore.kernel.org/all/4aa14b41-9b89-494c-8825-55fffd5a541c@arm.com/
> Tested-by: Dev Jain <dev.jain@arm.com>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

This seems fine enough.

> ---
>  mm/compaction.c |  5 +++++
>  mm/page_alloc.c | 21 ++++++++++++++++++---
>  2 files changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/compaction.c b/mm/compaction.c
> index 6c553d0e90f8..7b2267bbf115 100644
> --- a/mm/compaction.c
> +++ b/mm/compaction.c
> @@ -2365,6 +2365,11 @@ static enum compact_result __compact_finished(struct compact_control *cc)
>  			!free_area_empty(area, MIGRATE_CMA))
>  			return COMPACT_SUCCESS;
>  #endif
> +		/* Under ALLOC_NOFRAGMENT it may only claim a whole block */
> +		if ((cc->alloc_flags & ALLOC_NOFRAGMENT) &&
> +		    order < pageblock_order)
> +			continue;
> +
>  		/*
>  		 * Job done if allocation would steal freepages from
>  		 * other migratetype buddy lists.
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 7730660bdd09..d53fb2c67ae1 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -3586,6 +3586,11 @@ static inline long __zone_watermark_unusable_free(struct zone *z,
>   * will return true of the order-0 watermark is reached and there is at least
>   * one free page of a suitable size. Checking now avoids taking the zone lock
>   * to check in the allocation paths if no pages are free.
> + *
> + * Under ALLOC_NOFRAGMENT, a request below pageblock_order can take another
> + * migratetype's page only by claiming the whole block, so only free pages of
> + * @migratetype count below pageblock_order.  Without ALLOC_NOFRAGMENT,
> + * @migratetype is not used.
>   */
>  bool __zone_watermark_ok_mt(struct zone *z, unsigned int order,
>  			    unsigned long mark, int highest_zoneidx,
> @@ -3648,6 +3653,9 @@ bool __zone_watermark_ok_mt(struct zone *z, unsigned int order,
>  			continue;
>  
>  		for (mt = 0; mt < MIGRATE_PCPTYPES; mt++) {
> +			if ((alloc_flags & ALLOC_NOFRAGMENT) &&
> +			    mt != migratetype && o < pageblock_order)
> +				continue;
>  			if (!free_area_empty(area, mt))
>  				return true;
>  		}
> @@ -3677,8 +3685,12 @@ bool __zone_watermark_ok(struct zone *z, unsigned int order, unsigned long mark,
>  			 int highest_zoneidx, unsigned int alloc_flags,
>  			 long free_pages)
>  {
> +	/* Serving an ALLOC_NOFRAGMENT request needs __zone_watermark_ok_mt() */
> +	VM_WARN_ON_ONCE(order && order < pageblock_order &&
> +			(alloc_flags & ALLOC_NOFRAGMENT));
>  	return __zone_watermark_ok_mt(z, order, mark, highest_zoneidx,
> -				      alloc_flags, free_pages, MIGRATE_MOVABLE);
> +				      alloc_flags & ~ALLOC_NOFRAGMENT,
> +				      free_pages, MIGRATE_MOVABLE);
>  }
>  
>  bool zone_watermark_ok(struct zone *z, unsigned int order, unsigned long mark,
> @@ -4685,10 +4697,13 @@ should_reclaim_retry(gfp_t gfp_mask, unsigned order,
>  
>  		/*
>  		 * Would the allocation succeed if we reclaimed all
> -		 * reclaimable pages?
> +		 * reclaimable pages?  Count free pages of every migratetype:
> +		 * reclaim and compaction work across migratetypes to free a
> +		 * whole pageblock, which the allocation can then claim.
>  		 */
>  		wmark = __zone_watermark_ok(zone, order, min_wmark,
> -				ac->highest_zoneidx, alloc_flags, available);
> +				ac->highest_zoneidx,
> +				alloc_flags & ~ALLOC_NOFRAGMENT, available);
>  		trace_reclaim_retry_zone(z, order, reclaimable,
>  				available, min_wmark, *no_progress_loops, wmark);
>  		if (wmark) {

