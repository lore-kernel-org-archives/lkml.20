Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E129632143D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789406854; cv=none; b=BZkmm0hQky0G+LhINzk0pjZbLoWWU+kyJJpXchgG3+R1o5yjlp3AqUKxu7J6oUEStGlwTffK+0F1inTsYx1XnZ8cR739G3uyT6okaAbiZhEbEd1KNPNfVr4xa55e0QSoTdYHf5dXFDYvLBtBEceQ0EWE/QUtGNUVA3iB+l78BNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789406854; c=relaxed/simple;
	bh=QG6jcvw1X86kFU69w3hcseX3yObcaV7LewqsMepKLY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lid7NGlwDBewa6AIYuwKon7gHpRM/bhHBBxYWrXuvhJrSf6A5SkORaKDIuu9AtpQX3y6P9t3upELkxmOScCg001xlUFoC2kId5UTW9FgNyohjo5vi1MWvS6DyBo9OjVsKvi4fzi218XlQmaM35EKXnUg5XV7r1eyQ8fAeTnKeSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=cLl5svWQ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="cLl5svWQ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C7361CC4;
	Mon, 14 Sep 2026 10:27:27 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E52B93F882;
	Mon, 14 Sep 2026 10:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789406851; bh=QG6jcvw1X86kFU69w3hcseX3yObcaV7LewqsMepKLY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cLl5svWQM78Nu1mtOguvBASEnuYlWiNoPYp5zPrR2HVZtKfLqbWtwfMxly4tHb6EM
	 Kkq/iQ1zFUwR/cnZ4RElSK7pFwgLsMPp8b583drvfda8unRK1CFTSGODugo0S6x9Hn
	 6p6T1iWmLXkWiipqF9x/WwqIlWY1O4FnkqnKYcg8=
Date: Mon, 14 Sep 2026 18:27:25 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: kasong@tencent.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Chris Li <chrisl@kernel.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	Shivam Kalra <shivamkalra98@zohomail.in>,
	Kairui Song <ryncsn@gmail.com>
Subject: Re: [PATCH v5 12/17] mm/huge_memory: move anon_vma handling into the
 anon split helper
Message-ID: <aqgufcIGKrQLtXua@e129823.arm.com>
References: <20260915-swap-thp-cleanup-v5-0-39878b37dfb0@tencent.com>
 <20260915-swap-thp-cleanup-v5-12-39878b37dfb0@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-swap-thp-cleanup-v5-12-39878b37dfb0@tencent.com>

LGTM.

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>

> From: Kairui Song <kasong@tencent.com>
> 
> Only anon split needs the anon_vma, and it only needs it to unmap and
> remap.  Move the folio_get_anon_vma()/anon_vma_lock_write() pair out of
> __folio_split() into the anon helper next to the folio_mapped()
> check that already gates unmap_folio().
> 
> This makes the anon_vma conditional on folio_mapped(), which is a
> behaviour change but should be fine.  folio_get_anon_vma() returns
> NULL whenever !folio_mapped(), so an anon folio with
> folio_mapcount() == 0 used to get -EBUSY from split_huge_page() and is
> now split instead.  A realistic case is a THP that has been fully
> swapped out and is still in the swap cache: swap PTEs do not contribute
> mapcount, so it is !folio_mapped() but still alive.
> 
> That should be safe and right to have because:
> 
> - folio_ref_freeze() below still rejects a folio that picked up any
>   reference, a mapping or a GUP pin, in the meantime.
> 
> - A parallel split is excluded by the folio lock.  The anon_vma
>   write lock was added to serialize split in commit 062f1af2170a
>   ("mm: thp: acquire the anon_vma rwsem for write during split"), when
>   split_huge_page() did not hold the folio lock throughout. commit
>   e9b61f19858a ("thp: reintroduce split_huge_page()") later made the
>   folio lock a caller requirement and added the folio_ref_freeze()
>   scheme, so that has been covered ever since.
> 
> - Unmapped path is already exercised by folio_split_unmapped(),
>   and the swap cache split already runs well for a partially
>   swapped-out mapped THP.
> 
> - A !folio_mapped() folio cannot become mapped meanwhile: mapping it
>   requires the folio lock.
> 
> For mapped folios the anon_vma write lock is now released before
> __folio_split() unlocks the after-split sub-folios, where previously it
> was held across that loop; that window is harmless as the sub-folios
> stay folio-locked and referenced until it.
> 
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>  mm/huge_memory.c | 58 ++++++++++++++++++++++++++++++--------------------------
>  1 file changed, 31 insertions(+), 27 deletions(-)
> 
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 8fc1dd5b8354..a4c2e38f4a6d 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -4029,16 +4029,38 @@ static int __folio_freeze_split_anon(struct folio *folio,
>  	struct swap_cluster_info *ci = NULL;
>  	int old_order = folio_order(folio);
>  	struct folio *new_folio, *next;
> +	struct anon_vma *anon_vma = NULL;
>  	enum ttu_flags ttu_flags = 0;
>  	struct lruvec *lruvec;
> -	bool need_remap = false;
>  	int ret = 0;
>  
> +	/*
> +	 * Unmap/remap needs the anon_vma, so we first take a reference on
> +	 * it to prevent it from disappearing, and lock it for write here,
> +	 * letting unmap_folio() walk the rmap with TTU_RMAP_LOCKED.
> +	 *
> +	 * folio_mapped() is not stable here, but it can only change in
> +	 * one direction while the folio is locked. The mapcount can drop
> +	 * to zero at any time, zap_pte_range() takes no folio lock. It
> +	 * cannot go up: swapin, migration and uffd move all lock the folio
> +	 * before mapping it, and fork only copies PTEs that already exist.
> +	 *
> +	 * So if we see the folio mapped, the worst case is an empty rmap
> +	 * walk. If we see it unmapped, it stays unmapped and needs neither
> +	 * the reference nor the lock. Anything else needs a reference
> +	 * first and folio_ref_freeze() below catches it.
> +	 *
> +	 * Note a swapped-out THP counts as unmapped here as swap PTEs do
> +	 * not contribute mapcount, and they are splittable.
> +	 */
>  	if (folio_mapped(folio)) {
> -		need_remap = true;
> +		anon_vma = folio_get_anon_vma(folio);
> +		if (!anon_vma)
> +			return -EBUSY;
> +		anon_vma_lock_write(anon_vma);
>  		ret = unmap_folio(folio);
>  		if (ret)
> -			return ret;
> +			goto out_unlock;
>  	}
>  
>  	local_irq_disable();
> @@ -4096,11 +4118,16 @@ static int __folio_freeze_split_anon(struct folio *folio,
>  		swap_cluster_unlock(ci);
>  out_no_split:
>  	local_irq_enable();
> -	if (need_remap) {
> +	if (anon_vma) {
>  		if (!ret && !folio_is_device_private(folio))
>  			ttu_flags = TTU_USE_SHARED_ZEROPAGE;
>  		remap_anon_folio(folio, 1 << old_order, ttu_flags);
>  	}
> +out_unlock:
> +	if (anon_vma) {
> +		anon_vma_unlock_write(anon_vma);
> +		put_anon_vma(anon_vma);
> +	}
>  
>  	return ret;
>  }
> @@ -4295,7 +4322,6 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>  	struct folio *end_folio = folio_next(folio);
>  	bool is_anon = folio_test_anon(folio);
>  	struct mem_cgroup *memcg, *old_memcg;
> -	struct anon_vma *anon_vma = NULL;
>  	int old_order = folio_order(folio);
>  	struct folio *new_folio, *next;
>  	int ret;
> @@ -4326,23 +4352,6 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>  	memcg = get_mem_cgroup_from_folio(folio);
>  	old_memcg = set_active_memcg(memcg);
>  
> -	if (is_anon) {
> -		/*
> -		 * The caller does not necessarily hold an mmap_lock that would
> -		 * prevent the anon_vma disappearing so we first we take a
> -		 * reference to it and then lock the anon_vma for write. This
> -		 * is similar to folio_lock_anon_vma_read except the write lock
> -		 * is taken to serialise against parallel split or collapse
> -		 * operations.
> -		 */
> -		anon_vma = folio_get_anon_vma(folio);
> -		if (!anon_vma) {
> -			ret = -EBUSY;
> -			goto out;
> -		}
> -		anon_vma_lock_write(anon_vma);
> -	}
> -
>  	if (is_anon)
>  		ret = __folio_freeze_split_anon(folio, new_order, split_at,
>  						true, list, split_type);
> @@ -4369,11 +4378,6 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>  		free_folio_and_swap_cache(new_folio);
>  	}
>  
> -	if (anon_vma) {
> -		anon_vma_unlock_write(anon_vma);
> -		put_anon_vma(anon_vma);
> -	}
> -out:
>  	/* restore to caller's old_memcg */
>  	set_active_memcg(old_memcg);
>  	mem_cgroup_put(memcg);
> 
> -- 
> 2.55.0
> 
> 

-- 
Sincerely,
Yeoreum Yun
