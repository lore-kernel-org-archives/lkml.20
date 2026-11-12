Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794503145;
	b=qSaxXnBX7KtndSI1u63RLBGc1Vc/LIOEnr5UkC8K5d4/8H0s5Ctb506gRGJQkaTh/m9A
	 qqnyJcQ232TmZMVUZpIPvYRBXXbV63Kja5sNVIH3LkeIWAdVIC897+ZGPH+XkZHjmNhjS
	 bqL2AtrIPrefJf+hzjE6pH8M5pCyRbnFORq0RmhYa/ilVWiBbevbp8WpzojOxpf9N94+L
	 i8YmUhfKXKdlCrvTAvaqLEUrQCHYzpLhiKLsKyWPbBp97JG9vzDycMIfgC4j/1IO7mApO
	 0eRhx2BvhoM50cjLuCGgnHhDHY1fb4WYdjhjWc1qtCZHJ0wjs7pbL1b+Z6ekgAIqF7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794503145;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ajEkIDRsMbSYP9W1fSmDVGsJqeBJMiTtjhcoDQq9P8E=;
	b=kkUWtIdKPdQPc6MeI8vCCqSOw+ALcFQ/CvDJTwqmaypfBMfupzljrZP4yWW6fym9FuMy
	 77Egkps/6mllZ/9xW9HIiLlvyaoOliL/3U38w9vMKdqIgqadrYH3wmt0t+6dOLUY/2dsd
	 77WBfhBoLrgS3zU8A4w8/FhfqDdFQAbOnNdCjKiZ2J5yg3UZAInGWK5qcQ3Qxp/dfO7z+
	 B9YiTJnm5z59MlvaWNo0rIFmBUTY0zdMmHF/1yFUZ5R7+e3e8MIxbQIaGtYlpEyDavw2s
	 EGLVEcMjxweTh04fhSI6SoBdgnqqEtgTeDTu3NgPn6zom/S+eP7XGqqUEJqE6jtZraQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmpxchg.org;
	spf=pass smtp.mailfrom=cmpxchg.org;
	dkim=pass header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=Mf8WpNE8;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F016606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:05:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F016606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=Mf8WpNE8
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b360828905so883487b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1794503143; x=1795107943; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ajEkIDRsMbSYP9W1fSmDVGsJqeBJMiTtjhcoDQq9P8E=;
        b=Mf8WpNE8Hto3EGFD4FfBahl1GMWvMe79GAUqByN6n+n+OlE5ZgzlQmLuAjGDDVvJAv
         9Pz1EQ0X79ISTjgx9rFk6PD0x37dvh0F1wZANPdn1NVlmxVqkMM4XMuGVlXdg2xDXiXA
         noI4//ZYMZCbFjcRDIgpV8h7gOwEdaHqQsEUZBGLX1DWaCBdXucMOi4fFFmHrB59mOPf
         oP6Prn8tqxWlUYQ3G8hMqdJU7iKJyVHoJDydBmHrg+KDU5phPcI9oenfSMHMBi9g4xyH
         7XLC7pPXeDLIVeYgFj4a/llnxLr8puvzzXIBPc8v73CoBLkR6OdgMK5pOf9C1J6H53Q1
         EFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794503143; x=1795107943;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ajEkIDRsMbSYP9W1fSmDVGsJqeBJMiTtjhcoDQq9P8E=;
        b=BqDtWwwYezOllmwxwsbT2LaGkwQG9rceWzn7uFeRsS99Sr5B6aIwBEjwiybOa1p3F0
         zv0fJBpoiXftUt3UIpVPbvj+6iD1SeXkvV9jOEmdnO24unPetmDB9bOP3kfp5hp/0szB
         Jh5NmDwwHswk+axOh+gplT2qhNV6MwHQGhwRS8hm4OvHYlHt2CkmZL9obcsCjnYLrTo7
         Cpj8LhKaAv2EQXuh5xClmh1xLuR3CA4jJaXW+ZifoFXp2JyNlc1QiwJMEiydlZX7s60x
         faXTT1vH03vXbjVUns2+H4Spa3RwDrHJlQMMzWJJ/d2rVcvUNPTD49IIioRhvyxfH4v2
         zWpw==
X-Forwarded-Encrypted: i=1; AL+hErGN0bsTPH1R6VeMiCPI72KHgtMC/edAwGTsaDhbk6CLPJNc3Fl/APdKTRnYDl2BpWfZpBPgJ6ItiSDabTI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9e6+ZsTflqpEwYhaeq19V5NB6bollLl9OZgYrcoS8jhIRwB6kn
	pmq6PipBOS7eHd11Y2IIfTjkb/3WA3YJWmEqXMFtop2Gw74f+2aLyH07ehkgga27L08=
X-Gm-Gg: AYBFou36qjWs5kzfnWkKl7uTcUc/e75PKMqXE2Zk8zI02b94dmGCJ/8yViL0U7m4Mzv
	8aopLP00Nj3FDI94oaspdbAadrqZcuJ8FpZ7cEKrZNG20q4c7QPbrIj/4rq3dweXDAKVkZv2wEh
	3F/rGDkRg6FHLNtf9fuBTrLC0/GbqxMuyHmdwur9uxpLyHIVnNR/TM9zHCheyhYxZ2QPebT/0V0
	+sXXr5SERsRNMtPzHN8GYS9MvHylduBWxddNb5h4SnxnBjeV4EJYP9zy+GGA20AZx1YKD3z2bdg
	qQguV0qonEIAQdpSnl8ifgyahDKpCAqtN/rqeAwRMqrdGiGOIJ6VAepPrGeq5/fMLwQ6NSb7MzE
	CLJBGjJGK2pdDZkv9GejbYoAh/u+1ud39FlqZPGEDH7IEQALntEYHVanuCCCxKqDQrRVUC4fwI0
	+f1SVAhi9H8JQUUd3PXt4qodA4sxrjhAlzwPOo4ka8dpEv3t05cUWDTKkTdC3MJ/JFuOFtj9ZY/
	utr30CNVLixG2RRrgqf30zKh+iAFTMrlRInW5qWUY764+d+WmyU3e40P/77MHWXuflznEBW/oOS
	Htpa+ELFL+bJCgCV+MCmmlEhgnGz
X-Received: by 2002:a05:690c:f96:b0:8b3:5f41:3c16 with SMTP id 00721157ae682-8b4aa0e029dmr1440637b3.8.1794503142921;
        Thu, 12 Nov 2026 09:05:42 -0800 (PST)
Received: from localhost ([2605:8600:200:14e3:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa9da90bsm201707b3.37.2026.11.12.09.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:05:40 -0800 (PST)
Date: Thu, 12 Nov 2026 12:05:36 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
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
	Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm, vmscan: make kswapd unreserve highatomic
 pageblocks
Message-ID: <avXx4CYde8zIelkK@cmpxchg.org>
References: <20261109-kswapd-highatomic-unreserve-v2-1-6587ca75c77f@kernel.org>
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
In-Reply-To: <20261109-kswapd-highatomic-unreserve-v2-1-6587ca75c77f@kernel.org>

On Mon, Nov 09, 2026 at 11:20:59AM +0100, Vlastimil Babka (SUSE) wrote:
> A customer has reported excessive reclaim activity despite memory above
> high watermarks. Analyzing support data (including sar log) revealed the
> following scenario:
> 
> - the system has almost all memory reserved as 1G hugepages for kvm
>   guests, and operates normally
> - due to a spike of memory pressure from userspace, highatomic
>   reservations occur (probably due to e.g. concurrent network receive
>   activity)
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
> Hook this highatomic unreserve to the moment we exit the loop in
> balance_pgdat() due to exhausting reclaim priority, which means pgdat
> was not balanced and the last kswapd_shrink_node() attempt returned
> false or failed to reclaim anything. Even if that last attempt made the
> pgdat balanced, kswapd was struggling enough, so unreserving is far from
> premature. This should be a more conservative variant of when direct
> reclaim failure triggers the unreserving. Pass force as true to make
> sure repeated failures fully unreserve everything. Also make sure we
> don't count kswapd failures until then. Don't restart immediately as
> the kswapd() loop will call balance_pgdat() again if the unreserve does
> not lead to a balanced pgdat.
> 
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
> Changes in v2:
> - Don't unreserve prematurely (Jose, sashiko)
> - Fix movable->unmovable in comment (Jose, sashiko)
> - Prevent exhausting kswapd failures (sashiko)
> - Link to v1: https://patch.msgid.link/20261104-kswapd-highatomic-unreserve-v1-1-38be5106adf5@kernel.org
> ---
>  mm/page_alloc.c | 126 +++++++++++++++++++++++++++++---------------------------
>  mm/page_alloc.h |   3 ++
>  mm/vmscan.c     |  24 ++++++++++-
>  3 files changed, 91 insertions(+), 62 deletions(-)
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
> index 9959ca158ce8..af3079c6e32d 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -7317,6 +7317,7 @@ static int balance_pgdat(pg_data_t *pgdat, int order, int highest_zoneidx)
>  	unsigned long pflags;
>  	unsigned long nr_boost_reclaim;
>  	unsigned long zone_boosts[MAX_NR_ZONES] = { 0, };
> +	bool has_highatomic = false;
>  	bool boosted;
>  	struct zone *zone;
>  	struct scan_control sc = {
> @@ -7342,6 +7343,8 @@ static int balance_pgdat(pg_data_t *pgdat, int order, int highest_zoneidx)
>  	for_each_managed_zone_pgdat(zone, pgdat, i, highest_zoneidx) {
>  		nr_boost_reclaim += zone->watermark_boost;
>  		zone_boosts[i] = zone->watermark_boost;
> +		if (zone->nr_reserved_highatomic)
> +			has_highatomic = true;
>  	}
>  	boosted = nr_boost_reclaim;
>  
> @@ -7478,13 +7481,32 @@ static int balance_pgdat(pg_data_t *pgdat, int order, int highest_zoneidx)
>  	 * If the reclaim was boosted, we might still be far from the
>  	 * watermark_high at this point. We need to avoid increasing the
>  	 * failure count to prevent the kswapd thread from stopping.
> +	 * We also don't want to stop unreserving highatomic pageblocks,
> +	 * if there are any.
>  	 */
> -	if (!sc.nr_reclaimed && !boosted) {
> +	if (!sc.nr_reclaimed && !boosted && !has_highatomic) {
>  		int fail_cnt = atomic_inc_return(&pgdat->kswapd_failures);
>  		/* kswapd context, low overhead to trace every failure */
>  		trace_mm_vmscan_kswapd_reclaim_fail(pgdat->node_id, fail_cnt);
>  	}
>  
> +	/*
> +	 * We exhausted all reclaim priority and didn't balance pgdat (except
> +	 * perhaps during the last attempt, but it's unlikely), even if we
> +	 * reclaimed something. If there are highatomic pageblocks, unreserve
> +	 * some.
> +	 * Convert them to unmovable ones as kswapd doesn't have a target
> +	 * migratetype, and unmovable should minimize permanent fragmentation.
> +	 */
> +	if (sc.priority < 1 && has_highatomic) {
> +		for (int i = 0; i <= highest_zoneidx; i++) {
> +			struct zone *zone = pgdat->node_zones + i;
> +
> +			unreserve_highatomic_pageblock_zone(zone,
> +					MIGRATE_UNMOVABLE, true);
> +		}
> +	}

I think the direction makes sense. Sashiko already said it but these
blocks should be reordered, gate forward progress on unreserve
actually returning true.

I do wonder if priority dropping to 0 might be too late, given how
kswapd is not as eager to escalate as direct reclaim. But I think that
can be fine-tuned empirically.
