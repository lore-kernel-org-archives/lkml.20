Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793786296;
	b=v6P1j33sll5fnDy7dsK/8kA+F5jt9CJJSSYYL0fPN9Dnv3b9TxR30gEgGaDpgllIdByV
	 RImg9d9c42oHVcIR5IFywOx4m/lOOlyXFi+XIMkw2W7hO79OgxW/H4RhFhmE7bGM9n3Yg
	 aY2WljGSauwfm5oOuElJqUqtjNeGCRRSj79PeSeYp/J1OKI2wC5krCKeB0Pi0ZLGeUJmb
	 ZaiqJyBNunDCbRT+1x8qMqO9HgyD0EIROIb0UtOrprzydz0raYmXIpLKfbeU39j7lmpAm
	 +o/4bDI/WcrNyqctD3CdjosCGN+1OvqVfg1zmdWBTr6SF4hZwUBNO5V4ltxCYVRCxAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793786296;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=HFkLr+PGxIPBaCYrw+OLXdhMvo+2BGgnXZojuZri9Lc=;
	b=WuWRLZSje92N78vtfDVM1TIWzHugaQWlcdGuw+T3EXMwko+iKNbnp6ZhapfE52P4BnLC
	 UCHySfdVDEKrFBs4T2h+/X0YYgfYD9mySo5gvJQhRanZcoPet93dfS0mHMoQK8pHM6CEs
	 8ot+rjF/AyMsPdtiMLLIs5ZL9HKPMTkWve9M9I3+/R8m+6ZnXlTmOEPl7HJR0QiGC1O4r
	 7ReG9cgR4rfJfbPmesTrFfV67LFbtK5R1JM1uUNVHyFUTAFYRv2ZqQqeV1hcC0C8QAxa5
	 94tAYqVyKApAMo/xJDc12TVo787X6rEA+kAE6QmFmOcrlmK/PFQ3cg373ZQXWCSUnkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nhj4OfNw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4525606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nhj4OfNw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C87CB1F000C1;
	Wed,  4 Nov 2026 09:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793786295;
	bh=HFkLr+PGxIPBaCYrw+OLXdhMvo+2BGgnXZojuZri9Lc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nhj4OfNwTxTqIISwb1/7BNNVD8rohjhM9pLdcxKthdI4PO6G4bQmggZZmO6Yqf2Hl
	 iiq0NHJM446Fdm226XD7MA58n58s3owzOYh+zezXf8OM9v8GRwBie6hEp+SFJfXYFT
	 pR0Ch9lixgBah+4zuiKaOj+XHF5+d5ViNHEgoXK4t5u72wwAceaBPU1Rgx1nHE5Ll2
	 PpLSJVtsgFaaBzH3JaTRwUnpYJ4462xXmI/2/40Jub41vlneBa5tLXlOFGVN4eWBAC
	 vBunu42EA0wKVyr+x3HOjYKJM8x4KArDivx6iKnGJxfPMUEMyttLtOiRlix83DFusv
	 c/Im0HFAhHm2Q==
Date: Wed, 4 Nov 2026 10:58:09 +0100
From: "Oscar Salvador (SUSE)" <osalvador@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>, Qi Zheng <qi.zheng@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/12] mm: hugetlb_vmemmap: generalize vmemmap page
 allocation
Message-ID: <ausBsbaw9DNVh4KA@localhost.localdomain>
References: <20261104023510.260766-1-songmuchun@bytedance.com>
 <20261104023510.260766-5-songmuchun@bytedance.com>
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
In-Reply-To: <20261104023510.260766-5-songmuchun@bytedance.com>

On Wed, Nov 04, 2026 at 10:35:02AM +0800, Muchun Song wrote:
> Vmemmap page allocation is currently tied to restoring a virtual range
> and assumes an empty destination list.  These constraints prevent it from
> being reused when pages are requested independently of a vmemmap range or
> appended to an existing list.
> 
> Generalize the allocator and give it an all-or-nothing list contract so
> the restore and optimization paths can share the same allocation policy.
> This also allows HVO head-page allocation to fail gracefully under memory
> pressure without triggering the OOM killer.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> Reviewed-by: Lance Yang <lance.yang@linux.dev>
> Reviewed-by: Qi Zheng <qi.zheng@linux.dev>

Reviewed-by: Oscar Salvador <osalvador@suse.de>

A small nit below:

> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> index 0e5b2b182d1b..d3058e106795 100644
> --- a/mm/hugetlb_vmemmap.c
> +++ b/mm/hugetlb_vmemmap.c
...
> +static int alloc_vmemmap_page_list(struct list_head *head,
> +		unsigned int nr_pages, int nid)
>  {
> -	gfp_t gfp_mask = GFP_KERNEL | __GFP_RETRY_MAYFAIL;
> -	unsigned long nr_pages = (end - start) >> PAGE_SHIFT;
> -	int nid = page_to_nid((struct page *)start);
> +	LIST_HEAD(new_pages);
>  	struct page *page, *next;
> -	int i;
>  
> -	for (i = 0; i < nr_pages; i++) {
> -		page = alloc_pages_node(nid, gfp_mask, 0);
> +	for (unsigned int i = 0; i < nr_pages; i++) {
> +		page = alloc_pages_node(nid, GFP_KERNEL | __GFP_RETRY_MAYFAIL, 0);
>  		if (!page)
> -			goto out;
> -		list_add(&page->lru, list);
> +			goto free_pages;
> +		list_add(&page->lru, &new_pages);
>  	}
> +	list_splice(&new_pages, head);
>  	memmap_pages_add(nr_pages);
>  
>  	return 0;
> -out:
> -	list_for_each_entry_safe(page, next, list, lru)
> +free_pages:
> +	list_for_each_entry_safe(page, next, &new_pages, lru)
>  		__free_page(page);
>  	return -ENOMEM;
>  }
...
> @@ -527,15 +526,13 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
>  	 */
>  	folio_set_hugetlb_vmemmap_optimized(folio);
>  
> -	vmemmap_head = alloc_pages_node(nid, GFP_KERNEL, 0);
> -	if (!vmemmap_head) {
> +	if (alloc_vmemmap_page_list(vmemmap_pages, VMEMMAP_OPTIMIZATION_PAGES, nid)) {
>  		ret = -ENOMEM;
>  		goto out;

alloc_vmemmap_page_list() already gives you the error code (ENOMEM), so
it would look more natural to me to use that already and not "overwrite"
it.
e.g: 

 ret = alloc_vmemmap_page_list
 if (ret)
     goto out;

but as I said, just a nit :-)
 

-- 
Oscar Salvador
SUSE Labs
