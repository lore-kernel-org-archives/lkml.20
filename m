Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621891;
	b=V+8V1PEaLCAWEz+JrcqNuM++xdPbsVqdNAhj8xxqdFLB3SgbkMZfqiAw5JVmgLS1lkU7
	 vnrdRD94iftGNgUkCTGxOiocFN5rrqh97ZtcpSh7UOFYthoUC2PPNMQ2uqmDIM5VeZqs5
	 R/U4s2HlO5AXZJ3X7blz4V0qAWK0M88s7Lc0/B8phTxqr73sWWqzdZZK35BSTEeUItqZP
	 rM7r1UMNxsgGmamlN8mnqNA+GwVRd6Ic8bzIqYNc4cMGRuOrFaBgW7/eXdO/+vx95lP9t
	 a3k2yHlLJx6VmiDAftEiLCA8tMsFblBXzLsDaycycLH3ipOIQ0eyGPDKsHyxUhPbAfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621891;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=4PzZZAWMkHLIiI0SGi4R95lv/0ZHkf1CuWgcaAhKuFA=;
	b=wJXARf4Rq7VR8z2cGo1h3yoDq2LHABHsHGAROHteizoNSf5QlVSnH4D8KMbYcDF4xYjP
	 oqNUur/tLwLZQDt++ehBnqEefei9Hma4U9sePNrYLB/7rypW6HAlTTXersXRFegSHKoN5
	 6ToGkz3wIiKlnWeaYvvFKK3ULcF6XvyV7ETMxRDOwfUVaZM7RaToVFcK0Xf6lwMWbn36n
	 AoHXAel4nwNozelITZR8C3u5EXy8JpnYsONH9DnW4kFHbBZX6x74CA1O1T8o6+cu7nNkq
	 mrYl36zLZbX7oIs93QmlMcXMSgkSvUT3QIalJx8Iv+wArvdu86rWPlsFcGM50DXaz4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XEJHsAW1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6926E606A33C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XEJHsAW1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 312C51F00A18;
	Mon,  2 Nov 2026 12:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793621891;
	bh=4PzZZAWMkHLIiI0SGi4R95lv/0ZHkf1CuWgcaAhKuFA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=XEJHsAW1xpBykSI0RPL3s9XyHVb0H5VsOHu/pA4sj6i5fJX/eDJWXfOMeFVuzMoxm
	 e6cZnyTkCI5eySacLKDSXsP7xdfrNIfw8CnjxwKd/MiUhMg4qlqXjZfalJM0nFyh53
	 XK8XMVX25H7E7QA62r9/OFURzkKRulUqRdl2HXK0622lT8ox4Q8QOPQcMAxVlbL6JK
	 qRrt9minS3iWUYi7KOfMXV/I2L1G4ZrNi+0ygGT1c/9IvEyCPGc7uwKE8UNocxksda
	 SDvlYXK/OSMiFAf1BrOnAE3ijyx+uMz292+yLAgbIUOFYwtQL+QhucNrjaw0Eh2SFs
	 CwZ2HQ+PTuFMg==
Message-ID: <5feb82ef-a9bc-4ef3-b056-9732563e6225@kernel.org>
Date: Mon, 2 Nov 2026 13:18:05 +0100
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
Subject: Re: [PATCH v2 1/4] mm: gup: introduce gup_unshared_pages()
To: Yeoreum Yun <yeoreum.yun@arm.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Cc: Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 Rik van Riel <riel@surriel.com>, Yuan-Hao Hsu <aa9736195201@gmail.com>
References: <20261102-refactor_gup_fast-v2-0-bc1ac018c834@arm.com>
 <20261102-refactor_gup_fast-v2-1-bc1ac018c834@arm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261102-refactor_gup_fast-v2-1-bc1ac018c834@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/2/26 12:30, Yeoreum Yun wrote:
> This is preparatory patch to make gup_fast_pte_range() batchable.
> 
> Introduce gup_unshared_pages() to count consecutive pages within a folio
> that do not require unsharing, and use it to implement gup_must_unshare().
> 
> Also add a folio argument to gup_must_unshare() so callers can reuse an
> existing folio and avoid the compound_head() call implicit in PageAnon().
> 
> There is no functional change.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  mm/gup.c      | 69 +++++++++++++++++++++++++++++++++++++++++++++++++++++------
>  mm/internal.h | 49 ++++++------------------------------------
>  2 files changed, 70 insertions(+), 48 deletions(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index 7d43ce717b246..49681f63950ec 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -633,6 +633,59 @@ static struct page *no_page_table(struct vm_area_struct *vma,
>  	return NULL;
>  }
>  
> +unsigned long gup_unshared_pages(struct vm_area_struct *vma, unsigned int flags,
> +				 struct folio *folio, struct page *page,
> +				 unsigned long nr_pages)

Two tab indent.


This function should be static.

As a prerequisite patch you should move gup_unshared_pages() into this file.

$ git grep gup_must_unshare
include/linux/rmap.h:    * gup_must_unshare().
include/linux/rmap.h:    * gup_must_unshare().
mm/gup.c:       if (!pud_write(pud) && gup_must_unshare(vma, flags, page))
mm/gup.c:       if (!pmd_write(pmdval) && gup_must_unshare(vma, flags, page))
mm/gup.c:       if (!pte_write(pte) && gup_must_unshare(vma, flags, page)) {
mm/gup.c:               if (!pte_write(pte) && gup_must_unshare(NULL, flags, page)) {
mm/gup.c:       if (!pmd_write(orig) && gup_must_unshare(NULL, flags, &folio->page)) {
mm/gup.c:       if (!pud_write(orig) && gup_must_unshare(NULL, flags, &folio->page)) {
mm/internal.h:static inline bool gup_must_unshare(struct vm_area_struct *vma,


I'm not 100% happy about the function name due to the !folio_test_anon()+!FOLL_LONGTERM
path, but cannot think of something better.

> +{
> +	unsigned int i;
> +
> +	/*
> +	 * FOLL_WRITE is implicitly handled correctly as the page table entry
> +	 * has to be writable -- and if it references (part of) an anonymous
> +	 * folio, that part is required to be marked exclusive.
> +	 */
> +	if ((flags & (FOLL_WRITE | FOLL_PIN)) != FOLL_PIN)
> +		return nr_pages;
> +	/*
> +	 * Note: PageAnon(page) is stable until the page is actually getting

You are not calling PageAnon() anymore.

/* folio_test_anon(folio) is stable until folio gets freed. */

> +	 * freed.
> +	 */
> +	if (!folio_test_anon(folio)) {
> +		/*
> +		 * We only care about R/O long-term pining: R/O short-term
> +		 * pinning does not have the semantics to observe successive
> +		 * changes through the process page tables.
> +		 */
> +		if (!(flags & FOLL_LONGTERM))
> +			return nr_pages;
> +
> +		/* We really need the vma ... */
> +		if (!vma || vma_is_cow_mapping(vma))
> +			return 0;
> +
> +		/*
> +		 * ... because we only care about writable private ("COW")
> +		 * mappings where we have to break COW early.
> +		 */
> +		return nr_pages;
> +	}
> +
> +	/* Paired with a memory barrier in folio_try_share_anon_rmap_*(). */
> +	if (IS_ENABLED(CONFIG_HAVE_GUP_FAST))
> +		smp_rmb();
> +
> +	/*
> +	 * Note that KSM pages cannot be exclusive, and consequently,
> +	 * cannot get pinned.
> +	 */
> +	for (i = 0; i < nr_pages; i++) {
> +		if (!PageAnonExclusive(page + i))
> +			return i;
> +	}
> +
> +	return nr_pages;
> +}
> +
>  #ifdef CONFIG_PGTABLE_HAS_HUGE_LEAVES
>  /* FOLL_FORCE can write to even unwritable PUDs in COW mappings. */
>  static inline bool can_follow_write_pud(pud_t pud, struct page *page,
> @@ -668,7 +721,8 @@ static struct page *follow_huge_pud(struct vm_area_struct *vma,
>  	pfn += (addr & ~PUD_MASK) >> PAGE_SHIFT;
>  	page = pfn_to_page(pfn);
>  
> -	if (!pud_write(pud) && gup_must_unshare(vma, flags, page))
> +	if (!pud_write(pud) &&
> +	    gup_must_unshare(vma, flags, page_folio(page), page))
>  		return ERR_PTR(-EMLINK);

There is already another instance of page_folio(page) int his file. Use a local
variable and have one folio lookup. (that's the whole reason for passing a folio)

>  
>  	ret = try_grab_folio(page_folio(page), 1, flags);
> @@ -722,7 +776,8 @@ static struct page *follow_huge_pmd(struct vm_area_struct *vma,
>  	if (pmd_protnone(*pmd) && !gup_can_follow_protnone(vma, flags))
>  		return NULL;
>  
> -	if (!pmd_write(pmdval) && gup_must_unshare(vma, flags, page))
> +	if (!pmd_write(pmdval) &&
> +	    gup_must_unshare(vma, flags, page_folio(page), page))
>  		return ERR_PTR(-EMLINK);

Dito.

>  
>  	VM_WARN_ON_ONCE_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
> @@ -846,7 +901,7 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
>  	}
>  	folio = page_folio(page);
>  
> -	if (!pte_write(pte) && gup_must_unshare(vma, flags, page)) {
> +	if (!pte_write(pte) && gup_must_unshare(vma, flags, folio, page)) {
>  		page = ERR_PTR(-EMLINK);
>  		goto out;
>  	}
> @@ -2892,7 +2947,7 @@ static unsigned long gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp,
>  			goto pte_unmap;
>  		}
>  
> -		if (!pte_write(pte) && gup_must_unshare(NULL, flags, page)) {
> +		if (!pte_write(pte) && gup_must_unshare(NULL, flags, folio, page)) {
>  			gup_put_folio(folio, 1, flags);
>  			goto pte_unmap;
>  		}
> @@ -2969,7 +3024,8 @@ static unsigned long gup_fast_pmd_leaf(pmd_t orig, pmd_t *pmdp,
>  		gup_put_folio(folio, nr_pages, flags);
>  		return 0;
>  	}
> -	if (!pmd_write(orig) && gup_must_unshare(NULL, flags, &folio->page)) {
> +	if (!pmd_write(orig) &&
> +	    gup_must_unshare(NULL, flags, folio, &folio->page)) {


This only works because we don't have PMD mappings of things that are larger than PMDs.

While at it, pass the proper page.

>  		gup_put_folio(folio, nr_pages, flags);
>  		return 0;
>  	}
> @@ -3011,7 +3067,8 @@ static unsigned long gup_fast_pud_leaf(pud_t orig, pud_t *pudp,
>  		return 0;
>  	}
>  
> -	if (!pud_write(orig) && gup_must_unshare(NULL, flags, &folio->page)) {
> +	if (!pud_write(orig) &&
> +	    gup_must_unshare(NULL, flags, folio, &folio->page)) {

Dito.

>  		gup_put_folio(folio, nr_pages, flags);
>  		return 0;
>  	}
> diff --git a/mm/internal.h b/mm/internal.h
> index c53c369bf8b5d..35016b1afc8bf 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -1282,6 +1282,10 @@ int migrate_device_coherent_folio(struct folio *folio);
>  int __must_check try_grab_folio(struct folio *folio, int refs,
>  				unsigned int flags);
>  
> +unsigned long gup_unshared_pages(struct vm_area_struct *vma, unsigned int flags,
> +				 struct folio *folio, struct page *page,
> +				 unsigned long nr_pages);
> +
>  /*
>   * mm/huge_memory.c
>   */
> @@ -1354,51 +1358,12 @@ enum {
>   * to fallback to the slow path just to lookup the vma.
>   */
>  static inline bool gup_must_unshare(struct vm_area_struct *vma,
> -				    unsigned int flags, struct page *page)
> +				    unsigned int flags,
> +				    struct folio *folio, struct page *page)

Whatever you touch, please also convert to two-tab indent.

-- 
Cheers,

David
