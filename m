Received: from mta1.migadu.com (out-59.mta1.migadu.com [95.215.58.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B5C3E2AB0
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751098; cv=none; b=X79Te/6qOzQDvQWhwkBUl73HPgauJBQCxTpS8rmDshLPoq/CbsNgOfqEWrHgsTADstRwMvQwDWH6XiqLIrMLsb632+QkcXCgQRme88cvLW6cypAVsHg2f6buojNtolsNETxWk3MzcEUX6qm7a3f1VyDejLT4FLwAiRC43DCvXjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751098; c=relaxed/simple;
	bh=x3tyovTSuHPSGETPwcjNdH5ZDZ4Zl6jfQyrC3+aX5GQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=guGIkPu37azczirL9R6oNh7XDi79N6X+7l9DD0xORYah5cZBNMU9uU/lFobsYlCzdx4oJNf1oDPTj9FxWQd42OV7CW2BFm2bYxDkaf3ehv1Ro2b1yfFX2UpQfAGwOFO4LCSt4gqLugo4jzG97+WQqQe0telGkM2UEJvm1Ug2YQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=C7d7rAfs; arc=none smtp.client-ip=95.215.58.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="C7d7rAfs"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=x3tyovTSuHPSGETPwcjNdH5ZDZ4Zl6jfQyrC3+aX5GQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787751093; v=1; x=1788355893;
 b=C7d7rAfscWZy0lLuMytPxF9pgrfuOaRgMYISc1/Z/1ekH7m6KwUUUVs7I/FQk5fFxanGRNr1
 FfLjlV9SjV3Q1aosChAyoGtGq7gr9vGv5vtnBQQQozVs6nJmb825Sf4melvZFebpCsEpUyh6Y/C
 708zwiatiA5PHri6t9I7Twus=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: from localhost (2a03:2880:10ff:5b::)
	by mta11.migadu.com with ESMTPS id 4f3da476f759c30b;
	Wed, 26 Aug 2026 13:31:33 +0000
X-Mizu-Trace-ID: 4f3da476f759c30b
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Usama Arif <usama.arif@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Yosry Ahmed <yosry@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] mm/swap: refault on swap-in, not in the swap cache allocator
Date: Wed, 26 Aug 2026 06:31:28 -0700
Message-ID: <20260826133130.806177-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260825172604.3243589-3-alex@ghiti.fr>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 25 Aug 2026 19:24:52 +0200 Alexandre Ghiti <alex@ghiti.fr> wrote:

> The swap cache allocator evaluates the refault of every folio it
> allocates.  zswap writeback also allocates through it: the shrinker puts
> a buffer folio in the swap cache to write the compressed data out, and
> that allocation is then counted as an anon refault (and, if the eviction
> looks recent, as an activation) even though nothing faulted the page
> back in.  On a workload that writes back continuously this inflates
> workingset_refault_anon and workingset_activate_anon substantially.
> 
> Move the refault evaluation out of the allocator and into the two
> swap-in callers, which read the slot's shadow before the allocation
> overwrites it.  zswap writeback keeps allocating the buffer, but no
> longer reports a refault for it.
> 
> The refault is evaluated before folio_add_lru(), as it was before this
> patch, so workingset_refault() still sets PG_workingset/PG_active while
> the folio is off the LRU: folio_add_lru() consumes both when it picks
> the LRU list, and under MGLRU when it picks the generation.
> 
> Fixes: aae466b0052e ("mm/swap: implement workingset detection for anonymous LRU")
> Signed-off-by: Nhat Pham <nphamcs@gmail.com>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> ---
>  mm/swap_state.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/swap_state.c b/mm/swap_state.c
> index bf8ff2d2dbf1..8046fea015c9 100644
> --- a/mm/swap_state.c
> +++ b/mm/swap_state.c
> @@ -483,8 +483,6 @@ static struct folio *__swap_cache_alloc(struct swap_cluster_info *ci,
>  
>  	/* memsw uncharges swap when folio is added to swap cache */
>  	memcg1_swapin(folio);
> -	if (shadow)
> -		workingset_refault(folio, shadow);
>  
>  	node_stat_mod_folio(folio, NR_FILE_PAGES, nr_pages);
>  	lruvec_stat_mod_folio(folio, NR_SWAPCACHE, nr_pages);
> @@ -646,17 +644,26 @@ static struct folio *swap_cache_read_folio(struct swap_io_ctx *ctx,
>  		pgoff_t ilx, bool readahead)
>  {
>  	struct folio *folio;
> +	void *shadow = NULL;
>  
>  	do {
>  		folio = swap_cache_get_folio(entry);
>  		if (folio)
>  			return folio;
> +		/*
> +		 * Capture the slot's shadow before the allocation overwrites it,
> +		 * so a fresh swap-in can be evaluated as a refault below.
> +		 */
> +		shadow = swap_cache_get_shadow(entry);
>  		folio = __swap_cache_alloc_folio(entry, gfp, BIT(0), NULL, mpol, ilx);

Can this refault against a shadow from a different cache generation?
Another swap-in can replace this value, reclaim its folio, and install
a newer shadow while this caller is allocating.  This caller can then
win the locked insertion but still use the older snapshot.

What I think should be done here is have an optional shadow output to
__swap_cache_alloc_folio() and return the value captured by the successful
__swap_cache_add_check() under ci->lock and se that output in the swap-in
path?

>  	} while (PTR_ERR(folio) == -EEXIST);
>  
>  	if (IS_ERR_OR_NULL(folio))
>  		return NULL;
>  
> +	if (shadow)
> +		workingset_refault(folio, shadow);
> +
>  	folio_add_lru(folio);
>  	swap_read_folio(ctx, folio);
>  	if (readahead) {
> @@ -688,17 +695,26 @@ struct folio *swapin_sync(swp_entry_t entry, gfp_t gfp, unsigned long orders,
>  {
>  	struct swap_io_ctx ctx = {};
>  	struct folio *folio;
> +	void *shadow = NULL;
>  
>  	do {
>  		folio = swap_cache_get_folio(entry);
>  		if (folio)
>  			return folio;
> +		/*
> +		 * Capture the slot's shadow before the allocation overwrites it,
> +		 * so a fresh swap-in can be evaluated as a refault below.
> +		 */
> +		shadow = swap_cache_get_shadow(entry);
>  		folio = __swap_cache_alloc_folio(entry, gfp, orders, vmf, mpol, ilx);
>  	} while (PTR_ERR(folio) == -EEXIST);
>  
>  	if (IS_ERR(folio))
>  		return folio;
>  
> +	if (shadow)
> +		workingset_refault(folio, shadow);
> +
>  	folio_add_lru(folio);
>  	swap_read_folio(&ctx, folio);
>  	swap_read_submit(&ctx);
> -- 
> 2.53.0-Meta
> 
> 
