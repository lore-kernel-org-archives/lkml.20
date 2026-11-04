Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822627;
	b=RGkWGPLyMU614z+mbv3QCBTXrvwtKUCIb1jBbjbawi3XOsHCiuoaM+CI6k8wNSf4/K8c
	 zIEcL6hBY+bMQPxJ8Oo5P5Ylui1kcs1IOmNDDKnrx/cU8mIg949LjnIjFrZO4ZMln7wbA
	 KCj3CVbQQ4/khq3FSY+WC5tThTseesryl5QZbuLud6az3fu3lK7Td329njcbMf8O5DDIZ
	 97XSTZkW7tKWoC3O5spLmnNLzGm9sZhwvRlUtMUTNxz5BUhirJeMl17SJAYnmnScAlDkT
	 PeTLg0N14GXxmN7fmIDsDTHReKoP0nZ2B2bNbJp/aG2YCKD+gDrWHNHsHmEEXcN5bCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822627;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=6BgNivbmmhoO5tLBQFwSmEVuFg0Qcp+1r+afWMf1Jss=;
	b=1iE3vBy6hXLrY47i1X97zhuJ0jRCUlbCdH/UR55of738dRUSVdu60Iy7fEcFCFPxaxZz
	 gFcCQxGQzK3RJmHD84TkTPje1ns85Raw39eFj7bdMOLORb2FzZZRv1Hd+E3IxUj4sMVrU
	 qf6tVRiry9An791bhqu8KE1zHDg3vQaqfPx4xjta+0TTaVo3Qu/CpoPSVtOri/WRvvyxr
	 tr1Vnve92vBfTdPeGaf+t2ff9h1Rt7t5uqJmP7/YGUe23g7p9vWw2mpTb3fmYTX88Qpfc
	 UEGUM3ST5X5ZStu3qRIOXy/v6dtWuJEhUyFLog8/7GB1uLvjqF8k41X1laswxvZmjDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=fvCbpDa6;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D42606D4D5
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:03:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88D42606D4D5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=fvCbpDa6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	From:Reply-To; bh=6BgNivbmmhoO5tLBQFwSmEVuFg0Qcp+1r+afWMf1Jss=; t=1793822626;
	x=2109182626; b=fvCbpDa6qDmek7USHhN+dZtMonfNlnp50iNh3/9uJ4qFczrDWKxxvQuvI9Ktq
	4npEdLI7HLWC1qeHb8U1Vl1uQi2eArwSL/UYGQyzGbUEIdBOzpIYIthRFJDnFjZHfIG7sP+PUxffo
	lymjUt+llULIxsxvguucEVrBz52p6ni3VBhart2Rtydbl2bAz9sl9aPibFjlv1S8v5cZ/hBIfCiBa
	4KvSiRBLRZAIWUtdib45Ly50mYx59a0ki6J+By9EuwleC2sU/Cy1OorJop8+2Xsas4Z10V0Q+suWc
	DMhJySm4DhB6I0Kh3d3IDr08raPblXn9kQCjevuWExubl2vKJg==;
Received: from 179-125-72-1-dinamico.pombonet.net.br ([179.125.72.1] helo=quatroqueijos.cascardo.eti.br)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xOhCh-002cQL-Rb; Wed, 04 Nov 2026 21:03:28 +0100
Date: Wed, 4 Nov 2026 17:03:18 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>, David Hildenbrand <david@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>, Kairui Song <kasong@tencent.com>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	JP Kobryn <jp.kobryn@linux.dev>,
	Frank van der Linden <fvdl@google.com>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm, vmscan: make kswapd unreserve highatomic pageblocks
Message-ID: <auuPhqCcgZBt_lUR@quatroqueijos.cascardo.eti.br>
References: <20261104-kswapd-highatomic-unreserve-v1-1-38be5106adf5@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104-kswapd-highatomic-unreserve-v1-1-38be5106adf5@kernel.org>

On Wed, Nov 04, 2026 at 07:38:44PM +0100, Vlastimil Babka (SUSE) wrote:
> A customer has reported excessive reclaim activity despite memory above
> high watermarks. Analyzing support data (including sar log) revealed the
> following scenario:
> 
> - the system has almost all memory reserved as 1G hugepages for kvm
>   guests, and operates normally
> - due to a spike of memory pressure from userspace, highatomic
>   reservations occur (probably due to e.g. concurrent network receive
>   activity)

I think you might mean 6a204d4b14c9 ("mm/page_alloc: only set
ALLOC_HIGHATOMIC for __GPF_HIGH allocations") as one of the fixes you
mention below.

In that case, GFP_NOWAIT (which is typical for network activity, AFAIR)
would be one candidate that would produce such reservations. But I agree
that if any other real highatomic allocation burst would happen, it might
produce such reservations.

> - on one of the 8 NUMA nodes, this creates a situation where free pages
>   are above high watermark, but when __zone_watermark_unusable_free()
>   considers highatomic pageblocks, the result appears to be below the
>   low watermark
> - pgdat_balanced() is false, kswapd hopelessly keeps trying to balance,
>   spending cpu time and disrupting the system. It has nothing to reclaim
>   because the node is filled with hugetlbfs hugepages.
> - since the overal memory pressure is under control again and there are
>   no allocations restricted to the affected node, they are satisfied
>   from other nodes without going through direct reclaim
> - since direct reclaim is the only code that calls
>   unreserve_highatomic_pageblock(), this never happens and nothing fixes
>   the situation
> 

I am trying to understand what is going on here: so allocations on that
node are only !__GFP_DIRECT_RECLAIM? That would explain the highatomic
reservations in the presence of the bug just mentioned.

> Note this was observed on a 6.4-based kernel and there have been recent
> fixes upstream limiting the highatomic reservation side, but I don't
> think they can prevent the same happening in mainline, only perhaps
> lower the chances. Nothing seems to prevent the issue completely.
> 
> For example, while we limit the amount of highatomic pageblocks to 1% of
> the zone, this calculation does not subtract the amount of hugepages or
> otherwise permanent allocations, so the highatomic pageblocks can end up
> taking much higher share of actually reclaimable memory.
> 
> The most targeted fix thus appears to be to allow kswapd perform the
> highatomic pageblock unreserve to match direct reclaim. It's also
> somewhat similar in principle to how kswapd reduces watermark boosting.
> 
> Hook this highatomic unreserve to the moment we are increasing kswapd
> reclaim priority, as that is when kswapd is struggling to make progress
> and it should roughly match the case of direct reclaim failure.
> 

I tried considering a different approach, making the allocation do the
unreserve in the absence of __GFP_DIRECT_RECLAIM, but I don't see why not
let kswapd do it.

Regards.
Cascardo.

> The only caveat is that direct reclaim knows which migratetype it wants
> to allocate and thus changes the highatomic pageblock to. Kswapd doesn't
> track that, so use MIGRATE_UNMOVABLE. Highatomic allocations usually are
> not movable, and this will avoid creating nominally movable pageblocks
> polluted with unmovable pages, so it should be the least problematic
> default.
> 
> Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> ---
> We interrupt the regular stream of AI fixes by something a bit
> different. RFC to get agreement on the approach. Haven't tried
> reproducing the issue in mainline, but it seems quite clear to me from
> the data I've seen.
> ---
>  mm/page_alloc.c | 126 +++++++++++++++++++++++++++++---------------------------
>  mm/page_alloc.h |   3 ++
>  mm/vmscan.c     |  16 ++++++-
>  3 files changed, 83 insertions(+), 62 deletions(-)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index a8cac5e01066..785a13570788 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -3476,6 +3476,68 @@ static void reserve_highatomic_pageblock(struct page *page, int order,
>  	}
>  }
>  
> +bool unreserve_highatomic_pageblock_zone(struct zone *zone, int migratetype,
> +					 bool force)
> +{
> +	/*
> +	 * Preserve at least one pageblock unless memory pressure
> +	 * is really high.
> +	 */
> +	if (!force && zone->nr_reserved_highatomic <= pageblock_nr_pages)
> +		return false;
> +
> +	guard(spinlock_irqsave)(&zone->lock);
> +	for (int order = 0; order < NR_PAGE_ORDERS; order++) {
> +		struct free_area *area = &(zone->free_area[order]);
> +		unsigned long size;
> +		struct page *page;
> +		int ret;
> +
> +		page = get_page_from_free_area(area, MIGRATE_HIGHATOMIC);
> +		if (!page)
> +			continue;
> +
> +		size = max(pageblock_nr_pages, 1UL << order);
> +		/*
> +		 * It should never happen but changes to locking could
> +		 * inadvertently allow a per-cpu drain to add pages to
> +		 * MIGRATE_HIGHATOMIC while unreserving so be safe and watch for
> +		 * underflows.
> +		 */
> +		if (WARN_ON_ONCE(size > zone->nr_reserved_highatomic))
> +			size = zone->nr_reserved_highatomic;
> +		zone->nr_reserved_highatomic -= size;
> +
> +		/*
> +		 * Convert to migratetype and avoid the normal pageblock
> +		 * stealing heuristics. Minimally, the caller is doing the work
> +		 * and needs the pages. More importantly, if the block was
> +		 * always converted to MIGRATE_UNMOVABLE or another type then
> +		 * the number of pageblocks that cannot be completely freed may
> +		 * increase.
> +		 */
> +		if (order < pageblock_order)
> +			ret = move_freepages_block(zone, page,
> +					MIGRATE_HIGHATOMIC, migratetype);
> +		else {
> +			move_to_free_list(page, zone, order,
> +					  MIGRATE_HIGHATOMIC,
> +					  migratetype);
> +			change_pageblock_range(page, order, migratetype);
> +			ret = 1;
> +		}
> +		/*
> +		 * Reserving the block(s) already succeeded,
> +		 * so this should not fail on zone boundaries.
> +		 */
> +		WARN_ON_ONCE(ret == -1);
> +		if (ret > 0)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>  /*
>   * Used when an allocation is about to fail under memory pressure. This
>   * potentially hurts the reliability of high-order allocations when under
> @@ -3491,70 +3553,12 @@ static bool unreserve_highatomic_pageblock(const struct alloc_context *ac,
>  	struct zonelist *zonelist = ac->zonelist;
>  	struct zoneref *z;
>  	struct zone *zone;
> -	struct page *page;
> -	int order;
> -	int ret;
>  
>  	for_each_zone_zonelist_nodemask(zone, z, zonelist, ac->highest_zoneidx,
>  								ac->nodemask) {
> -		/*
> -		 * Preserve at least one pageblock unless memory pressure
> -		 * is really high.
> -		 */
> -		if (!force && zone->nr_reserved_highatomic <=
> -					pageblock_nr_pages)
> -			continue;
> -
> -		guard(spinlock_irqsave)(&zone->lock);
> -		for (order = 0; order < NR_PAGE_ORDERS; order++) {
> -			struct free_area *area = &(zone->free_area[order]);
> -			unsigned long size;
> -
> -			page = get_page_from_free_area(area, MIGRATE_HIGHATOMIC);
> -			if (!page)
> -				continue;
> -
> -			size = max(pageblock_nr_pages, 1UL << order);
> -			/*
> -			 * It should never happen but changes to
> -			 * locking could inadvertently allow a per-cpu
> -			 * drain to add pages to MIGRATE_HIGHATOMIC
> -			 * while unreserving so be safe and watch for
> -			 * underflows.
> -			 */
> -			if (WARN_ON_ONCE(size > zone->nr_reserved_highatomic))
> -				size = zone->nr_reserved_highatomic;
> -			zone->nr_reserved_highatomic -= size;
> -
> -			/*
> -			 * Convert to ac->migratetype and avoid the normal
> -			 * pageblock stealing heuristics. Minimally, the caller
> -			 * is doing the work and needs the pages. More
> -			 * importantly, if the block was always converted to
> -			 * MIGRATE_UNMOVABLE or another type then the number
> -			 * of pageblocks that cannot be completely freed
> -			 * may increase.
> -			 */
> -			if (order < pageblock_order)
> -				ret = move_freepages_block(zone, page,
> -							   MIGRATE_HIGHATOMIC,
> -							   ac->migratetype);
> -			else {
> -				move_to_free_list(page, zone, order,
> -						  MIGRATE_HIGHATOMIC,
> -						  ac->migratetype);
> -				change_pageblock_range(page, order,
> -						       ac->migratetype);
> -				ret = 1;
> -			}
> -			/*
> -			 * Reserving the block(s) already succeeded,
> -			 * so this should not fail on zone boundaries.
> -			 */
> -			WARN_ON_ONCE(ret == -1);
> -			if (ret > 0)
> -				return ret;
> -		}
> +		if (unreserve_highatomic_pageblock_zone(zone,
> +							ac->migratetype, force))
> +			return true;
>  	}
>  
>  	return false;
> diff --git a/mm/page_alloc.h b/mm/page_alloc.h
> index e238ee91ed24..9fba6480b18d 100644
> --- a/mm/page_alloc.h
> +++ b/mm/page_alloc.h
> @@ -282,6 +282,9 @@ static inline bool free_area_empty(struct free_area *area, int migratetype)
>  	return list_empty(&area->free_list[migratetype]);
>  }
>  
> +bool unreserve_highatomic_pageblock_zone(struct zone *zone, int migratetype,
> +					 bool force);
> +
>  /* Convert GFP flags to their corresponding migrate type */
>  #define GFP_MOVABLE_MASK (__GFP_RECLAIMABLE|__GFP_MOVABLE)
>  #define GFP_MOVABLE_SHIFT 3
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 9959ca158ce8..91c622068d99 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -7460,8 +7460,22 @@ static int balance_pgdat(pg_data_t *pgdat, int order, int highest_zoneidx)
>  		if (nr_boost_reclaim && !nr_reclaimed)
>  			break;
>  
> -		if (raise_priority || !nr_reclaimed)
> +		if (raise_priority || !nr_reclaimed) {
> +			/*
> +			 * Similarly to when direct reclaim is retrying, try to
> +			 * unreserve highatomic pageblocks on the node. Convert
> +			 * them to movable ones as kswapd doesn't have a target
> +			 * migratetype, and passing unmovable should lead to
> +			 * least permanent fragmentation.
> +			 */
> +			for (int i = 0; i <= highest_zoneidx; i++) {
> +				struct zone *zone = pgdat->node_zones + i;
> +
> +				unreserve_highatomic_pageblock_zone(zone,
> +						MIGRATE_UNMOVABLE, false);
> +			}
>  			sc.priority--;
> +		}
>  	} while (sc.priority >= 1);
>  
>  	/*
> 
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261030-kswapd-highatomic-unreserve-7e6629ec65d0
> 
