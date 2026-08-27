Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB163BFE2B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787817985; cv=none; b=Us5xf9H/NqYA7fr9dgBfpA20q7912xSHKFICfzzcDT9ya7zMYLtp6A6rQHt8zjx4XGnW7xkwQARuO+h2nNhE9Qesm/wby4uQBznWFwi7AVgc2tLgvhi9zJYDrzlfY27yGLx7BT6C3yftJ8X7yFy8UnYV5AN4MiaZxisdKQLrO+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787817985; c=relaxed/simple;
	bh=5JmYosvB84qPVfhlFTMUQ5XbCmEmz7T334MNffvzlAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TYjAeuK4u5tuz9RchWBqXj1HTMm36o0GJXwM/nuC0PtO7j/wnSm4iXLbLES+eXnFWsyrz8OSryEJzGniW8Yh7nkegyeillsJVXYTPk9E0s9u69Ghcg0gQwAI8Lt29FzaDX7GbYiwUq5xG6LN5Av35X6BDSZUmfYNMAIZnd1g0wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=lXI6gs4g; arc=none smtp.client-ip=115.124.30.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="lXI6gs4g"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787817974; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=vItm6oSJ85xwVAuuaGxmtPSRnxGXaOONFh+Bcy0mTMo=;
	b=lXI6gs4gkSQVar4xsssdx2xwdfNaouskLY/1L9RTyT/XguRkdXVWhCf25GyYginoIY/DU8SncoiW886uWDECaP5GU9Uk32p9ZCovhRgI60AEm+3vjtcHoAfmLbEPUbWNRIE7K+4YYC4cB9dsVrHM5oxPHi2pXdFsdoRae8HDL8w=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R611e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0X9izibF_1787817972;
Received: from 30.74.144.120(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X9izibF_1787817972 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 27 Aug 2026 16:06:13 +0800
Message-ID: <1ec4ef97-47e4-48af-a8c8-4e50faf781f0@linux.alibaba.com>
Date: Thu, 27 Aug 2026 16:06:12 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mm-stable] mm/khugepaged: avoid unnecessary checking for
 swap entries when collapsing a mTHP
To: Pedro Demarchi Gomes <pedrodemargomes@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Zi Yan <ziy@nvidia.com>, "Liam R . Howlett" <liam@infradead.org>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20260825192433.3185880-1-pedrodemargomes@gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260825192433.3185880-1-pedrodemargomes@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/26/26 3:24 AM, Pedro Demarchi Gomes wrote:
> mthp_collapse() tries to swap in PTEs when collapsing a mTHP if there are any
> swap PTEs in the PMD range, even if none of those swap PTEs are
> actually part of the mTHP's range.

Are you sure? I wonder how you tested your patch? Because we never 
swapin PTEs for mTHP collapse, see the code in 
__collapse_huge_page_swapin():

/*
  * TODO: Support swapin without leading to further mTHP
  * collapses. Currently bringing in new pages via swapin may
  * cause a future higher order collapse on a rescan of the same
  * range.
  */
if (!is_pmd_order(order)) {
	count_mthp_stat(order, MTHP_STAT_COLLAPSE_EXCEED_SWAP);
	pte_unmap(pte);
	mmap_read_unlock(mm);
	result = SCAN_EXCEED_SWAP_PTE;
	goto out;
}

> 
> Track swap PTEs in cc->mthp_unmapped_ptes so that mthp_collapse() can
> tell whether the mTHP's own range contains a swap PTE, and skip the
> swapin check when it doesn't.
> 
> Signed-off-by: Pedro Demarchi Gomes <pedrodemargomes@gmail.com>
> ---
>   mm/khugepaged.c | 29 +++++++++++++++++++----------
>   1 file changed, 19 insertions(+), 10 deletions(-)
> 
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 11ff98d55c76..38596172f7dc 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -117,6 +117,9 @@ struct collapse_control {
>   
>   	/* Each bit represents a single occupied (!none/zero) page. */
>   	DECLARE_BITMAP(mthp_present_ptes, MAX_PTRS_PER_PTE);
> +
> +	/* Each bit represents a single not present and not none/zero pte. */
> +	DECLARE_BITMAP(mthp_unmapped_ptes, MAX_PTRS_PER_PTE);
>   };
>   
>   /**
> @@ -634,6 +637,7 @@ static void collapse_control_init_scan(struct collapse_control *cc)
>   	memset(cc->node_load, 0, sizeof(cc->node_load));
>   	nodes_clear(cc->alloc_nmask);
>   	bitmap_zero(cc->mthp_present_ptes, MAX_PTRS_PER_PTE);
> +	bitmap_zero(cc->mthp_unmapped_ptes, MAX_PTRS_PER_PTE);
>   }
>   
>   static void release_pte_folio(struct folio *folio)
> @@ -1291,7 +1295,7 @@ static enum scan_result alloc_charge_folio(struct folio **foliop, struct mm_stru
>    * Note that the VMA must be rechecked after grabbing the mmap_lock again.
>    */
>   static enum scan_result collapse_huge_page(struct mm_struct *mm, unsigned long start_addr,
> -		int referenced, int unmapped, struct collapse_control *cc,
> +		int referenced, bool swapin, struct collapse_control *cc,
>   		unsigned int order)
>   {
>   	const unsigned long pmd_addr = start_addr & HPAGE_PMD_MASK;
> @@ -1330,7 +1334,7 @@ static enum scan_result collapse_huge_page(struct mm_struct *mm, unsigned long s
>   		goto out_nolock;
>   	}
>   
> -	if (unmapped) {
> +	if (swapin) {
>   		/*
>   		 * __collapse_huge_page_swapin() will return with mmap_lock
>   		 * released when it fails. So we jump out_nolock directly in
> @@ -1502,10 +1506,10 @@ static unsigned int max_order_from_offset(unsigned int offset)
>    * mTHP.
>    */
>   static enum scan_result mthp_collapse(struct mm_struct *mm,
> -		unsigned long address, int referenced, int unmapped,
> +		unsigned long address, int referenced,
>   		struct collapse_control *cc, unsigned long enabled_orders)
>   {
> -	unsigned int nr_occupied_ptes, nr_ptes, max_ptes_none;
> +	unsigned int nr_occupied_ptes, nr_unmapped_ptes, nr_ptes, max_ptes_none;
>   	enum scan_result last_result = SCAN_FAIL;
>   	int collapsed = 0;
>   	bool alloc_failed = false;
> @@ -1522,21 +1526,25 @@ static enum scan_result mthp_collapse(struct mm_struct *mm,
>   		max_ptes_none = collapse_max_ptes_none(cc, NULL, order);
>   		nr_occupied_ptes = bitmap_weight_from(cc->mthp_present_ptes, offset,
>   						      offset + nr_ptes);
> +		nr_unmapped_ptes = bitmap_weight_from(cc->mthp_unmapped_ptes, offset,
> +						      offset + nr_ptes);
> +
>   
>   		/*
> -		 * Swap PTEs accepted during the scan are counted in @unmapped,
> -		 * not in the present-PTE bitmap. Account them for the PMD-order
> -		 * candidate.
> +		 * Swap PTEs accepted during the scan are counted in
> +		 * nr_unmapped_ptes, not in the present-PTE bitmap. Account
> +		 * them for the PMD-order candidate.
>   		 */
>   		if (is_pmd_order(order))
> -			nr_occupied_ptes += unmapped;
> +			nr_occupied_ptes += nr_unmapped_ptes;
>   
>   		if (nr_occupied_ptes >= nr_ptes - max_ptes_none) {
>   			enum scan_result ret;
> +			bool swapin = nr_unmapped_ptes > 0;
>   
>   			collapse_address = address + offset * PAGE_SIZE;
>   			ret = collapse_huge_page(mm, collapse_address, referenced,
> -						 unmapped, cc, order);
> +						 swapin, cc, order);
>   
>   			switch (ret) {
>   			/* Cases where we continue to next collapse candidate */
> @@ -1667,6 +1675,7 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
>   			continue;
>   		}
>   		if (!pte_present(pteval)) {
> +			__set_bit(i, cc->mthp_unmapped_ptes);
>   			if (++unmapped > max_ptes_swap) {
>   				result = SCAN_EXCEED_SWAP_PTE;
>   				count_collapse_event(HPAGE_PMD_ORDER, THP_SCAN_EXCEED_SWAP_PTE,
> @@ -1785,7 +1794,7 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
>   		/* collapse_huge_page() expects the lock to be dropped before calling */
>   		mmap_read_unlock(mm);
>   		result = mthp_collapse(mm, start_addr, referenced,
> -				       unmapped, cc, enabled_orders);
> +				       cc, enabled_orders);
>   		/* mmap_lock was released above, set lock_dropped */
>   		*lock_dropped = true;
>   	}

