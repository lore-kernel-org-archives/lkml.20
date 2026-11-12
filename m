Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794513362;
	b=Ppya1c/lIq+wVJlZO7blk57RaxZgABjcx1ayr1mQJ6/fmP9LImtuG/AALwony+uzaGtv
	 bzLOS1cWPgYvaC0spgbIsGKpWrhbMfMzTvl0aFJuLx9ssq8YaX+8niyP/+GRS0pYKvq0c
	 ecb7xzwI8EPcjp2EcCz/BH30LC1i4thnH/8rpy0+g8XozafV8J93IsHr0X11CpjfrkMLM
	 7+FPt73+ODJMX4WSyM074rQ+Lpkzc+zcLPo59JE4C18B3UpX2avGCdmP49VLzTRPBe1hU
	 49ajVE9ttATKDb6thz5BdVAtKhadzJwamQRR4L9KNpDm25MC+yP0024aT6y8OLyszpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794513362;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/DVz9TcMzmRhI4NAq0Bx3DDA+PaOD3fbYpa1xG77J98=;
	b=FMN6vQf4G3DJAquDMSmLuNOSPrrf7LqipLHJ4yG/jK4CyBQK5L6fLCii5NFGUuRGqlYP
	 nU+IVgUz3ryzCPBl+MlzTe78rKESDm38Yk9c78jvnejBbASAExSVYpnvC2eX7nWlF4IZu
	 XbaiFO4/BvfjvEke4hoFdXvOyxvQV7Orlecsvt57x/l5y7X2srJayzgXWItfgj28v2YxG
	 zbg1fVsp8V7TgHxftB3QpfETyDqQloz+yOt82O0L3YIZinVdFg6vJuurI2fIxgpQGXUd8
	 qbn2Aa0byEZAoAv3ODEIdx+9g4weWrTG/lsOGfGlbpjwGOmi+hwLRcIlfG/8tm6TJvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eXTAheRB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38932606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eXTAheRB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04C4D1F000C4;
	Thu, 12 Nov 2026 19:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794513362;
	bh=/DVz9TcMzmRhI4NAq0Bx3DDA+PaOD3fbYpa1xG77J98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eXTAheRBiXvSIWFMTLXBhb3k8aCTQf5sIn3X3vLWvl1WBSbLRGNP0YplzVv8SOypX
	 DtGLthT7Qi5esc4ctzgtSrhoMOXpbVbotkhM1fjdltQjdvwgDWZ3gWbJsXmClNMsP+
	 cHZHoB2RkkveFBPonlCc0X23P8hmYiUX9BJw+Ybhxpkxj4ZqmxM8+47qtcuKUEmxwz
	 dMIinoOq+ie1zHHAlNURtxmtlx5c6Jd68l4BgLCYGA4T1IKB7TB63JUWJjkXZzgOGj
	 EtAX4DJOCTWU4tTjW5G9+Ps+vqqTQX0xqbnO6PEP0rFdsmWT7aTSwGFUxij5TpRspd
	 HNWbvB8Y5tJRA==
Date: Thu, 12 Nov 2026 19:55:56 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, 
	Gregory Price <gourry@gourry.net>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH v2] mm/page_alloc: only skip kswapd nodes below their
 kswapd watermark
Message-ID: <avYQcqVZvRevtCxM@gremlin>
References: <20261110224432.2347606-1-joshua.hahnjy@gmail.com>
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
In-Reply-To: <20261110224432.2347606-1-joshua.hahnjy@gmail.com>

On Tue, Nov 10, 2026 at 02:44:31PM -0800, Joshua Hahn wrote:
> Commit 19c5fb83f2a4 ("mm: page_alloc: avoid kswapd thrashing due to
> NUMA restrictions") makes get_page_from_freelist() skip any node with an
> active kswapd on the first pass through the zonelist, so unrestricted
> allocations don't immediately consume the memory kswapd is freeing.
>
> But kswapd is also woken for high-order requests. With THP defrag set to
> defer, each THP fault that fails on a fragmented node wakes kswapd at
> PMD order. kswapd reclaims a batch, wakes kcompactd, and sleeps until
> the next failed fault, so it stays awake much of the time even on a node
> with plenty of free order-0 memory. This means those order-0 allocations
> get directed elsewhere.
>
> This was observed on some Meta production workloads running on 2-NUMA
> systems, where processes with a preference for node0 allocations
> continuously allocated order-0 pages on node1, despite node0 having
> hundreds of GB of free memory.
>
> Only skip a zone with an active kswapd if it is also below kswapd's
> target watermark.
>
> On a 2-NUMA VM with a 60G node0 and a 20G node1, with THP enabled=always
> and defrag=defer, I ran a process that prefers allocating on node0.
> With a fragmented node0:
> - Before the patch, 68% of pages were served from node0
> - After the patch, 100% of pages were served from node0
>
> One remaining gap is that since this uses kswapd's own threshold,
> unrestricted allocations can take what kswapd frees above the target
> watermark. The current code already lets such allocations drain from the
> high to the low watermark while kswapd sleeps.
>
> One potential solution, as hinted by Johannes in the discussion from the
> original fix [1] is to add some kind of fudge factor (for instance,
> wmark_pages + high_wmark_pages - low_wmark_pages).
>
> But in tests that I ran in a VM where the allocation demand outpaces
> kswapd, about 4% more pages landed on the busy node and kswapd reclaimed
> about 15% more, but kswapd still finished and slept. So let's hold off
> on the fudge factor until it becomes an observable issue in workloads.
>
> [1] https://lore.kernel.org/linux-mm/20251001164131.GB1597553@cmpxchg.org/
>
> Fixes: 19c5fb83f2a4 ("mm: page_alloc: avoid kswapd thrashing due to NUMA restrictions")
> Suggested-by: Daniel Hodges <hodgesd@meta.com>
> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>

LGTM and:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
> v1 --> v2:
> - Added a Fixes tag and separated this from the other cleanup patches
> - Check zone_watermark_fast with no flag to match the call in
>   pgdat_balanced().
> - Calculates mark outside the zone_watermark_fast check to match the
>   style for the other zone checks.
> - Wordsmithing commit message to explain the unaddressed gap.
> - Yes, this is ugly. I have another series to clean this code up but
>   I wanted this to be a feature-minimal patch so that it could be
>   easily backported. Things will be much prettier once those are landed.
>
>  mm/page_alloc.c | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
>
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 8532af052d74b..56121c3f9c4a7 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -45,6 +45,7 @@
>  #include <linux/mmu_notifier.h>
>  #include <linux/migrate.h>
>  #include <linux/sched/mm.h>
> +#include <linux/sched/sysctl.h>
>  #include <linux/page_owner.h>
>  #include <linux/page_table_check.h>
>  #include <linux/memcontrol.h>
> @@ -3799,6 +3800,9 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
>  	struct zoneref *z;
>  	struct zone *zone;
>  	struct pglist_data *last_pgdat = NULL;
> +	enum zone_watermarks kswapd_watermark =
> +		sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING ?
> +		WMARK_PROMO : WMARK_HIGH;
>  	bool last_pgdat_dirty_ok = false;
>  	bool no_fallback;
>  	bool skip_kswapd_nodes = nr_online_nodes > 1;
> @@ -3866,16 +3870,21 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
>  		}
>
>  		/*
> -		 * If kswapd is already active on a node, keep looking
> -		 * for other nodes that might be idle. This can happen
> -		 * if another process has NUMA bindings and is causing
> -		 * kswapd wakeups on only some nodes. Avoid accidental
> -		 * "node_reclaim_mode"-like behavior in this case.
> +		 * If kswapd is already active on a node and the zone is below
> +		 * its kswapd watermark for this request, keep looking for
> +		 * other nodes that might be idle. This can happen if another
> +		 * process has NUMA bindings and is causing kswapd wakeups on
> +		 * only some nodes. Avoid accidental "node_reclaim_mode"-like
> +		 * behavior in this case.
>  		 */
>  		if (skip_kswapd_nodes &&
>  		    !waitqueue_active(&zone->zone_pgdat->kswapd_wait)) {
> -			skipped_kswapd_nodes = true;
> -			continue;
> +			mark = wmark_pages(zone, kswapd_watermark);
> +			if (!zone_watermark_fast(zone, order, mark,
> +					ac->highest_zoneidx, 0, gfp_mask)) {
> +				skipped_kswapd_nodes = true;
> +				continue;
> +			}

Much better thanks!

>  		}
>
>  		cond_accept_memory(zone, order, alloc_flags);
> --
> 2.53.0-Meta
>

--
Cheers, Lorenzo
