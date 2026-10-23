Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792790195;
	b=DYJfecnehDJIhuKtwkZwb0HmLNUvqKVswrbIq/eoXC8EVFJ0tXWu6bCBrn69xRA180rv
	 MKZVM2vysveaPdMVtEwCcgAMkqqrj4xMKy0SpBg9rZjUzaiwRbwsscw9pXO/aGEhnCbwS
	 icW1fAe7sT5jTtRGXH4qNkkIggcb+BcHPguqoBCB+GnGIPKW4i4cY6GMyqYR7DA3Llgg7
	 +yELnyfuiPEifhRfKguHJGFzaD8bwDq1g5bVUtTkXqPNm5BikqozjKoLi5LwxpKpdazf5
	 9ZgFQv91kizdzl7uCh+sMpENyd1lqjhUl5VZzJ7FHFwVSx0SIlRG+PGIT2jrE6g47gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792790195;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=36nMoEV+qY4+3B7iVAc/58NBcD9zvoRthSyLFKDtn4o=;
	b=HZWLXap7GLAQBBzZ4DXwsbf2uHzdxykJ7qPB99aLPrqXoZeY729O07FQtPY3VuiXbXuZ
	 DnD1QBL0hiw2VgBJeEsVlF1UKhwqVwO/w/i5LHB2y1TovOimoZmgz/7vBhlS5lnUwoQA8
	 CdJMyaZ6MmCk0Oc96WwRyh+o8l5MzDHNNpXhqQAYlaPpvZnyhhzAe5kYZHI+o6Te5i+Q5
	 y3gwrOOIAshGRYVgMqASIqjIPno6RILTpB3ho3veQX2ZKLSHjRd/EiSLqu2gdPceSczex
	 lDMOBgk19JNXS0Y6KV9FBdAdyXnInn3NnZPkwG/GdWbbO54Q8DMSZqHV56gf7vlaCzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fd3tB4uC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AFC606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 21:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fd3tB4uC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 300251F01825;
	Fri, 23 Oct 2026 21:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792790195;
	bh=36nMoEV+qY4+3B7iVAc/58NBcD9zvoRthSyLFKDtn4o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fd3tB4uCO60tET4XImwHa4+MaXLEDTZZCaJGy2bgMSl6JOEFQ4p926Ok3uvaLHIpm
	 1u+IdHQt3isnyBlrO+1WKhiOq7jJ0nOXAGPE/i7UO3IqlV4SlwRj5m6dFnmQQ9tmBF
	 m4m2uav2TjWbJ7YVv/w6GaStCvxIfkM7FyQpMvbUekWyjkxX5yp2pbcFiWEFlgxoky
	 vkLYATFiZsJA8XsyTT2tM8OI13v3xvJS+QfoEeP0tfeMr9fe8C1IWzm/9GfNxcJeMk
	 y3M7oB6K9iURQvaVe8NQoHaoT38rZdHjHAS9uMiuQBQARm8dytnjJjFyhMLDBUGOye
	 eNBtZozugJQSg==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: alex@ghiti.fr
Cc: akpm@linux-foundation.org,
	baohua@kernel.org,
	baoquan.he@linux.dev,
	chengming.zhou@linux.dev,
	chrisl@kernel.org,
	david@kernel.org,
	hannes@cmpxchg.org,
	kasong@tencent.com,
	liam@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	nphamcs@gmail.com,
	rppt@kernel.org,
	ryncsn@gmail.com,
	shikemeng@huaweicloud.com,
	surenb@google.com,
	usama.arif@linux.dev,
	vbabka@kernel.org,
	yosry@kernel.org,
	youngjun.park@lge.com
Subject: Re: [PATCH v3] mm: bypass swap readahead for zswap
Date: Sat, 24 Oct 2026 05:16:29 +0800
Message-Id: <20261023211629.16227-1-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261007153915.53429-1-alex@ghiti.fr>
References: <20261007153915.53429-1-alex@ghiti.fr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, Oct 7, 2026 at 11:39 PM Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> Commit 0bcac06f27d7 ("mm, swap: skip swapcache for swapin of synchronous
> device") made SWP_SYNCHRONOUS_IO devices (e.g. zram) skip swap readahead.
>
> zswap is the same kind of in-memory, synchronous backend as zram, not a
> swap device flagged SWP_SYNCHRONOUS_IO so it still goes through
> swapin_readahead().
>
> Here are the results from bypassing readahead for zswap too: it was
> measured with a kernel build (make -j16) in a memcg, zswap=zstd, shrinker
> off, on Sapphire Rapids and 3 iterations.
>
>   768M memcg (sustained swap thrash):
>     metric                 mm-new    + bypass    delta
>     build time (s)          405.0       341.7    -15.6%
>     zswap-in (GB)            79.5        53.0     -33%
>     zswap-out (GB)          144.8       115.6     -20%
>     swap readahead (pages)  6.79M       0.45M     -93%
>     swap_ra hit (%)          72.1        89.9     +18pp
>
>   1G memcg (light pressure, build not memory-bound):
>     metric                 mm-new    + bypass    delta
>     build time (s)          177.7       176.0    ~same (no regression)
>     zswap-in (GB)            10.2         7.5     -26%
>     zswap-out (GB)           27.7        25.1      -9%
>     swap readahead (pages)  1.07M       0.08M     -93%
>     swap_ra hit (%)          68.6        87.2     +19pp
>
> Similar gains were observed on an AMD EPYC 7D13 host.
>
> The gain is from no longer prefetching pages that are pointless for an
> in-memory backend: readahead inflates anon residency and thrashes the
> page cache (file pages get evicted and re-read), lengthens each fault by
> synchronously (de)compressing a cluster of neighbours, and adds
> compression traffic when those extra pages are reclaimed.
>
> Bypassing swap readahead for zswap therefore makes sense.
>
> Suggested-by: Usama Arif <usama.arif@linux.dev>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> ---

Hi Alexandre,

One thing on my mind is that for synchronous devices, we always free
the swapcache during swap-in, thus releasing the compressed copy and
metadata as well. We could do something similar when a zswap entry
is found.

I wonder if we should do that as well. I don't have time to
investigate this further myself, but I wonder if you'd be interested
in looking into it.

    mm: free swapcache on zswap hits in do_swap_page()
    
    We already do this for zram and other synchronous devices. The same
    should apply to zswap hits. Freeing the swapcache will allow the
    compressed copy and metadata to be released earlier.
    
    Suggested-by: Barry Song (Xiaomi) <baohua@kernel.org>

diff --git a/mm/memory.c b/mm/memory.c
index 55b5a84d1016..d22c779fda93 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4711,17 +4711,18 @@ static inline bool should_try_to_free_swap(struct swap_info_struct *si,
 					   struct folio *folio,
 					   struct vm_area_struct *vma,
 					   bool exclusive,
-					   unsigned int fault_flags)
+					   unsigned int fault_flags,
+					   bool sync_swap)
 {
 	if (!folio_test_swapcache(folio))
 		return false;
 	/*
-	 * Always try to free swap cache for SWP_SYNCHRONOUS_IO devices. Swap
+	 * Always try to free swap cache for synchronize swap entries. Swap
 	 * cache can help save some IO or memory overhead, but these devices
 	 * are fast, and meanwhile, swap cache pinning the slot deferring the
 	 * release of metadata or fragmentation is a more critical issue.
 	 */
-	if (data_race(si->flags & SWP_SYNCHRONOUS_IO))
+	if (sync_swap)
 		return true;
 	if (mem_cgroup_swap_full(folio) || (vma->vm_flags & VM_LOCKED) ||
 	    folio_test_mlocked(folio))
@@ -4977,6 +4978,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 	rmap_t rmap_flags = RMAP_NONE;
 	bool exclusive = false;
 	bool rwp_restore = false;
+	bool sync_swap = false;
 	softleaf_t entry;
 	pte_t pte;
 	vm_fault_t ret = 0;
@@ -5059,7 +5061,8 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 		swap_update_readahead(folio, vma, vmf->address);
 	if (!folio) {
 		/* Swapin bypasses readahead for SWP_SYNCHRONOUS_IO devices and zswap */
-		if (swap_entry_synchronous(si, entry))
+		sync_swap = swap_entry_synchronous(si, entry);
+		if (sync_swap)
 			folio = swapin_sync(entry, GFP_HIGHUSER_MOVABLE,
 					    thp_swapin_suitable_orders(vmf) | BIT(0),
 					    vmf, NULL, 0);
@@ -5325,7 +5328,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 	 * Do it after mapping, so raced page faults will likely see the folio
 	 * in swap cache and wait on the folio lock.
 	 */
-	if (should_try_to_free_swap(si, folio, vma, exclusive, vmf->flags))
+	if (should_try_to_free_swap(si, folio, vma, exclusive, vmf->flags, sync_swap))
 		folio_free_swap(folio);
 
 	folio_unlock(folio);
