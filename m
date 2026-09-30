Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18D34F4051
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790781384; cv=none; b=oNgW+p/nF+4MuUYJpuDy/o9GfO41LWz9XK1G5yv5OgUICAPeu0nx6ofLt2zEwmBNVH3RBSTShe5Nf0i8pX/tltN568LkMdxaAyxUm9JD8jXUy3987h86CSBUP36WepdMhzeMqaSUAShWCUtkxjMdml2bi7UyKsx7MByLv5jWBts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790781384; c=relaxed/simple;
	bh=/4DSxZ8V6AQ1u8tPfU/+HMuEiX69YDVbvEimgZmHyGM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gnPmSUJaMxe6OoHtmY5QTEQe3NZnjSDmUd4TURl1E/dnh23XXN2uEXRVh+9ABFOrJhkwWGgkMu6woASz2Czqajy56Ohtv6NEyh5dMzm0LXSe7t+cqgx7K/mb6pBYeyYUOBeSTyvfPbpKQ9Xd6l+SrT7CR1eK/9ncxNCtdlB7E2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QrUmEzLr; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QrUmEzLr"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e20bb4583so108406266b.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790781372; x=1791386172; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q9dGLqKNBlMrHbdqAQfcvM1eXGcLD/Xmv99laXST3Cc=;
        b=QrUmEzLrbTDfZJXYLRGKEUqfHOKnDksGyx6npsLW2COTVcllbdmsOkrlwvkKZBVjsb
         74+j4wtk9yCbDudiVMEU4fT/dbvPyLcq5P5EBj84VXnZXAnsFKLrItNZOaawhoVjAPVW
         fTIT6lACtpvWaF7vvAab0RdpONPC2y7Ito+xgGes6RW5aLWQalzDzVQhg8XINA4oFsY5
         Ronsxfmt4gLpcLGseRW6PZPbfl1IR3gporiY1fzYFmvBMQ8rDJr2XKVbG+QwH4wd8/iK
         YEZhhgcXa+LjLvl2ju02W6NzzhalxKLQlm5YONIS8vFQ/bwAjDXODRBpOzqhbhbQRS97
         Ptnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790781372; x=1791386172;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q9dGLqKNBlMrHbdqAQfcvM1eXGcLD/Xmv99laXST3Cc=;
        b=SWGvGxw/sXNNvuW9bi4D60wcYfsReT1DqZBvliti/kldpnNmVobF2SpROAvW2K9Fa0
         rel5DNGH6l+yllZL1/1iIpyVuA+Y7icggl+S10FLu/VvfzrQ5378YPALkO8mBB3SPtsU
         pXLXkdLinTLCErVTJcA47ypv8GNK77CJs0UWn6MkWrxfLVpQINyFKY5P8ksKBC1vCNSA
         ZXqXn9Pg2UR6t39XmKsiljiXjRIfmnL5QVniRULlruBvQmRPiQyx39d+VULnfMrvPzFr
         p/ioPoj4qJ+4n+2/W9catXBS8jPkcU4xJobJG/vwSALqec5KupmoaK4W64BRBrNs3g4R
         ustw==
X-Forwarded-Encrypted: i=1; AKwUvByXW3Uy4RmeWDjy6QA9Y9+JZJH6yFNTo4d8+McipQ+9q0z1DqwBOHYO04l/FldVracH5IwfcgsnOjB44Ks=@vger.kernel.org
X-Gm-Message-State: AFuF++lOYyiHndHmg1HN3LxCDxigNz1qTlHSXOztZNHhYlp25uyrZPuL
	44uE6kO4gYrdM6T80ESSsZPGojM+ax/yYlMUakAqN2GBcZgCnLCOQ2DB
X-Gm-Gg: AYBFou1CIyInnFbF0wcq0dh1z6Gpfj7G35LR/YgSn27DtI8LR+w2hDT9cfw397Ne6SX
	Iw3C9Ev6s/GGvt5ORcLmYSqoZhnj7Zk9PZ7SIhV4bCI1+7iwYJmV6BVdz5dTucBRDCYyZXANuQK
	02b1cxrd4o3O4Doy1PbeZMbl3cskMEfcjggTuJmyNbhryL9Q/t+8CR3jK5w7yJAIS7bcoSzp+GF
	nfXrVl5yg85PXUS8KRtolScAtjd0Evg6q6OXbFUshnxcHlI7X5GKAu3AM5/CfT+JDKM6Wd4sSPM
	e2DlAl/ywhOi3AAwHMP1F9apJdVgcYGBq0HbhzmJc5kh58DEkHqBH6BmsQBateB84/PQ2WvI0C+
	FkaJwlnAuHJ9Pl8+N4a+OgeHlg5nDCHBFzXTlQg+zeGGq6p8qNxUa3R0NqfRj6KAIqVU0VPIE1F
	ZydOnfxck4BgepI+kDDDJyQQJcv06a2udlICo=
X-Received: by 2002:a17:907:d1e:b0:c29:cf4b:5cac with SMTP id a640c23a62f3a-c2e23749268mr150465666b.5.1790781371662;
        Wed, 30 Sep 2026 08:16:11 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31ce9e4fsm21985066b.31.2026.09.30.08.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:16:11 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Wed, 30 Sep 2026 17:16:08 +0200
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org,
	urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com, anshuman.khandual@arm.com, baohua@kernel.org,
	chleroy@kernel.org, david@kernel.org, dev.jain@arm.com,
	jiangwen6@xiaomi.com, leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, rppt@kernel.org,
	ryan.roberts@arm.com
Subject: Re: [PATCH v9 07/10] mm/vmalloc: extend page table walk to support
 larger page_shift sizes and eliminate page table rewalk
Message-ID: <ar0nuJ7ocTMgbiMu@milan>
References: <20260923062832.479455-1-jiangwen6@xiaomi.com>
 <20260923062832.479455-8-jiangwen6@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923062832.479455-8-jiangwen6@xiaomi.com>

On Wed, Sep 23, 2026 at 02:28:29PM +0800, Wen Jiang wrote:
> From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> 
> vmap_pages_range_noflush_walk() (formerly vmap_small_pages_range_noflush())
> provides a clean interface by taking struct page **pages and mapping them
> via direct PTE iteration. This avoids the page table rewalk seen when
> using vmap_range_noflush() for page_shift values other than PAGE_SHIFT.
> 
> Extend it to support larger page_shift values, and add PMD- and
> contiguous-PTE mappings as well.
> 
> Rename it to vmap_pages_range_noflush_walk() since it now handles
> more than just small pages.
> 
> For vmalloc() allocations with VM_ALLOW_HUGE_VMAP, we no longer need to
> iterate over pages one by one via vmap_range_noflush(), which would
> otherwise lead to page table rewalk. The code is now unified with the
> PAGE_SHIFT case by simply calling vmap_pages_range_noflush_walk().
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> Reviewed-by: Dev Jain <dev.jain@arm.com>
> ---
>  mm/vmalloc.c | 84 +++++++++++++++++++++++++++++++---------------------
>  1 file changed, 50 insertions(+), 34 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index d475e52110e4a..6e0dec73107a7 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -558,8 +558,10 @@ void vunmap_range(unsigned long addr, unsigned long end)
>  
>  static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>  		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
> -		pgtbl_mod_mask *mask)
> +		pgtbl_mod_mask *mask, unsigned int shift)
>  {
> +	unsigned long pfn, size;
> +	unsigned int steps;
>  	int err = 0;
>  	pte_t *pte;
>  
> @@ -590,9 +592,10 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>  			break;
>  		}
>  
> -		set_pte_at(&init_mm, addr, pte, mk_pte(page, prot));
> -		(*nr)++;
> -	} while (pte++, addr += PAGE_SIZE, addr != end);
> +		pfn = page_to_pfn(page);
> +		size = vmap_set_ptes(pte, addr, end, pfn, prot, shift);
> +		steps = PFN_DOWN(size);
> +	} while (pte += steps, *nr += steps, addr += size, addr != end);
>
nr_mapped_pages?

>  
>  	lazy_mmu_mode_disable();
>  	*mask |= PGTBL_PTE_MODIFIED;
> @@ -602,60 +605,88 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>  
>  static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
>  		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
> -		pgtbl_mod_mask *mask)
> +		pgtbl_mod_mask *mask, unsigned int shift)
>  {
>  	pmd_t *pmd;
>  	unsigned long next;
> +	int err;
>  
>  	pmd = pmd_alloc_track(&init_mm, pud, addr, mask);
>  	if (!pmd)
>  		return -ENOMEM;
>  	do {
>  		next = pmd_addr_end(addr, end);
> -		if (vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask))
> -			return -ENOMEM;
> +
> +		if (shift >= PMD_SHIFT) {
> +			struct page *page = pages[*nr];
> +			phys_addr_t phys_addr;
> +
> +			if (WARN_ON(!page))
> +				return -ENOMEM;
> +			if (WARN_ON(!pfn_valid(page_to_pfn(page))))
> +				return -EINVAL;
> +
> +			phys_addr = page_to_phys(page);
> +
> +			if (vmap_try_huge_pmd(pmd, addr, next, phys_addr, prot, shift)) {
> +				*mask |= PGTBL_PMD_MODIFIED;
> +				*nr += 1 << (PMD_SHIFT - PAGE_SHIFT);
>
*nr += 1 << (PMD_SHIFT - PAGE_SHIFT); --->  *nr += 1U << (PMD_SHIFT - PAGE_SHIFT);
as it used to be?

> +				continue;
> +			}
> +		}
> +		err = vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask, shift);
> +		if (err)
> +			return err;
>  	} while (pmd++, addr = next, addr != end);
>  	return 0;
>  }
>  
>  static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
>  		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
> -		pgtbl_mod_mask *mask)
> +		pgtbl_mod_mask *mask, unsigned int shift)
>  {
>  	pud_t *pud;
>  	unsigned long next;
> +	int err;
>  
>  	pud = pud_alloc_track(&init_mm, p4d, addr, mask);
>  	if (!pud)
>  		return -ENOMEM;
>  	do {
>  		next = pud_addr_end(addr, end);
> -		if (vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask))
> -			return -ENOMEM;
> +		err = vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask, shift);
> +		if (err)
> +			return err;
>  	} while (pud++, addr = next, addr != end);
>  	return 0;
>  }
>  
>  static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
>  		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
> -		pgtbl_mod_mask *mask)
> +		pgtbl_mod_mask *mask, unsigned int shift)
>  {
>  	p4d_t *p4d;
>  	unsigned long next;
> +	int err;
>  
>  	p4d = p4d_alloc_track(&init_mm, pgd, addr, mask);
>  	if (!p4d)
>  		return -ENOMEM;
>  	do {
>  		next = p4d_addr_end(addr, end);
> -		if (vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask))
> -			return -ENOMEM;
> +		err = vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask, shift);
> +		if (err)
> +			return err;
>  	} while (p4d++, addr = next, addr != end);
>  	return 0;
>  }
>  
> -static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
> -		pgprot_t prot, struct page **pages)
> +/*
> + * It can take an array of pages which are not all contiguous, but it
> + * may have contiguous chunks, as hinted by @shift.
> + */
> +static int vmap_pages_range_noflush_walk(unsigned long addr, unsigned long end,
> +		pgprot_t prot, struct page **pages, unsigned int shift)
>  {
>  	unsigned long start = addr;
>  	pgd_t *pgd;
> @@ -670,7 +701,7 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
>  		next = pgd_addr_end(addr, end);
>  		if (pgd_bad(*pgd))
>  			mask |= PGTBL_PGD_MODIFIED;
> -		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask);
> +		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask, shift);
>  		if (err)
>  			break;
>  	} while (pgd++, addr = next, addr != end);
> @@ -693,27 +724,12 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
>  int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>  		pgprot_t prot, struct page **pages, unsigned int page_shift)
>  {
> -	unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
> -
>  	WARN_ON(page_shift < PAGE_SHIFT);
>
This is not about this patch but probably on that WARN_ON we should bail out
early.

--
Uladzislau Rezki
