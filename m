Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 947FB47F2F3
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789406971; cv=none; b=PdBApfiK2xsQcZDu2GbJvdgTtxHVoVCFylJL8Jyf2swA+NzK+au7hyy/xOCRVMTfbZWLmjTH97MWG5WsjKTqmKMCojiNh9JP5CIzMAf/cxB09HJYnY0gnCxxf/v+grzUrGFq5O03VU8G16u6Ttdmr7+3FQUlfFndht5Zvg8azJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789406971; c=relaxed/simple;
	bh=nz4UZHfetPz1HaMRoljOfiKUFFTRj4qW0/9YDY5Ref8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bcXpMXtDU0CNdKTw5ajVsxH+jc98l6aHJTEJbESFJPvxMGm8nbAvbn9wRYiTw9QlCQMbx4E0ytuVQr2e/IIFubIxWmo3blvL6gxAeanydY3ULX4Iq9NZkscrdYBYiJDEaI0Q70DvdBlJig0q9D65QZqh+t6w64Js7AefxOYU8lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=K4bqCdr8; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="K4bqCdr8"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0325E1CE0;
	Mon, 14 Sep 2026 10:29:24 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E3673F882;
	Mon, 14 Sep 2026 10:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789406967; bh=nz4UZHfetPz1HaMRoljOfiKUFFTRj4qW0/9YDY5Ref8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K4bqCdr8yZxGdIYRtjY3hWdiY8ZQASCFId/YLeO/rspBu44f1j1uGha6ApNh6fxOi
	 NhxQ540d+nS9BVuKjGAxOVaAh9YBMTTcE7780q2GBd+C2CwxiayA/8rUgnrssfzoYg
	 Tp5mTdwhsVGBGNhaLw1KAkSW/Da1Ozu5e4RSwo40=
Date: Mon, 14 Sep 2026 18:29:22 +0100
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
Subject: Re: [PATCH v5 10/17] mm/huge_memory: move the racy refcount check
 into unmap_folio()
Message-ID: <aqgu8nnDzBPtXXwe@e129823.arm.com>
References: <20260915-swap-thp-cleanup-v5-0-39878b37dfb0@tencent.com>
 <20260915-swap-thp-cleanup-v5-10-39878b37dfb0@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-swap-thp-cleanup-v5-10-39878b37dfb0@tencent.com>

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>

On Tue, Sep 15, 2026 at 01:14:51AM +0800, Kairui Song via B4 Relay wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> The check only exists to avoid the expensive PMD-splitting unmap of a
> folio that cannot be split anyway.  Move it from __folio_split() into
> unmap_folio(), right before the PMD split, so both the anon and file
> split helpers get the early check without repeating it.
> 
> unmap_folio() now returns -EAGAIN if the check fails and the split
> helpers propagate the error.  folio_split_unmapped() drops its own
> copy of the check: it works on already unmapped folios and the
> definitive folio_ref_freeze() in __folio_freeze_split_anon() still
> catches unexpected references.
> 
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>  mm/huge_memory.c | 29 +++++++++++++----------------
>  1 file changed, 13 insertions(+), 16 deletions(-)
> 
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 77bf68c9b9af..859aefda7356 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -3539,13 +3539,17 @@ void vma_adjust_trans_huge(struct vm_area_struct *vma,
>  		split_huge_pmd_if_needed(next, end);
>  }
>  
> -static void unmap_folio(struct folio *folio)
> +static int unmap_folio(struct folio *folio)
>  {
>  	enum ttu_flags ttu_flags = TTU_RMAP_LOCKED | TTU_SYNC |
>  		TTU_BATCH_FLUSH;
>  
>  	VM_BUG_ON_FOLIO(!folio_test_large(folio), folio);
>  
> +	/* Racy check if we can split the page, before we split PMDs */
> +	if (folio_expected_ref_count(folio) != folio_ref_count(folio) - 1)
> +		return -EAGAIN;
> +
>  	if (folio_test_pmd_mappable(folio))
>  		ttu_flags |= TTU_SPLIT_HUGE_PMD;
>  
> @@ -3560,6 +3564,8 @@ static void unmap_folio(struct folio *folio)
>  		try_to_unmap(folio, ttu_flags | TTU_IGNORE_MLOCK);
>  
>  	try_to_unmap_flush();
> +
> +	return 0;
>  }
>  
>  static bool __discard_anon_folio_pmd_locked(struct vm_area_struct *vma,
> @@ -4030,7 +4036,9 @@ static int __folio_freeze_split_anon(struct folio *folio,
>  
>  	if (folio_mapped(folio)) {
>  		need_remap = true;
> -		unmap_folio(folio);
> +		ret = unmap_folio(folio);
> +		if (ret)
> +			return ret;
>  	}
>  
>  	local_irq_disable();
> @@ -4124,7 +4132,9 @@ static int __folio_freeze_split_file(struct folio *folio,
>  	if (shmem_mapping(mapping))
>  		end = shmem_fallocend(mapping->host, end);
>  
> -	unmap_folio(folio);
> +	ret = unmap_folio(folio);
> +	if (ret)
> +		return ret;
>  
>  	xas_lock_irq(xas);
>  
> @@ -4332,15 +4342,6 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>  		i_mmap_lock_read(mapping);
>  	}
>  
> -	/*
> -	 * Racy check if we can split the page, before unmap_folio() will
> -	 * split PMDs
> -	 */
> -	if (folio_expected_ref_count(folio) != folio_ref_count(folio) - 1) {
> -		ret = -EAGAIN;
> -		goto out_unlock;
> -	}
> -
>  	if (is_anon)
>  		ret = __folio_freeze_split_anon(folio, new_order, split_at,
>  						true, list, split_type);
> @@ -4379,7 +4380,6 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>  		free_folio_and_swap_cache(new_folio);
>  	}
>  
> -out_unlock:
>  	if (anon_vma) {
>  		anon_vma_unlock_write(anon_vma);
>  		put_anon_vma(anon_vma);
> @@ -4427,9 +4427,6 @@ int folio_split_unmapped(struct folio *folio, unsigned int new_order)
>  	VM_WARN_ON_ONCE_FOLIO(!folio_test_large(folio), folio);
>  	VM_WARN_ON_ONCE_FOLIO(!folio_test_anon(folio), folio);
>  
> -	if (folio_expected_ref_count(folio) != folio_ref_count(folio) - 1)
> -		return -EAGAIN;
> -
>  	return __folio_freeze_split_anon(folio, new_order, &folio->page,
>  					 false, NULL, SPLIT_TYPE_UNIFORM);
>  }
> 
> -- 
> 2.55.0
> 
> 

-- 
Sincerely,
Yeoreum Yun
