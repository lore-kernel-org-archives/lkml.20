Received: from mta0.migadu.com (out-238.mta0.migadu.com [91.218.175.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58363372B58
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858627; cv=none; b=ZaGsoxgVmAaS5wzlB9v13QUlpG7RuD0ejhgqaB8zjSzGV2JiNDI2LHLNwRnpHbq4/COGr0d3uzv7DLwhC2XpvxFxM1ONVjgzNzipFHwWO3TaLNSi34ILAOmXxaoxnI+7JqfhB0EayEehN65v/5cZoxEvuDlLXivBR4NQbBZZYCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858627; c=relaxed/simple;
	bh=cEdVml3tdgAFLckXNxgJNh/xEbh5hOuVY3ofUnolJE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NkzsljtoTTNVhiaylVUt1rpBv6WSbgMF1tHSbeiBsTfEXo7P89r9DGiOcMBpfFIzkCa8GjGv2xIGjSVSSy7EnzCAOzBNLG1CzeGn+bG/yFnyaeigvGsZ7YYpTFNQ9OcydGaJsEUvooFQ2jN6s/qPULz6K+uEcLvIoTd+bs7BnG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mGDZGI/7; arc=none smtp.client-ip=91.218.175.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mGDZGI/7"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=cEdVml3tdgAFLckXNxgJNh/xEbh5hOuVY3ofUnolJE8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788858622; v=1; x=1789463422;
 b=mGDZGI/7eho1oCAMQAFP5k6uHKGxgtsXd8LnWYLumuY0XG6E3ohGh1nh84Ajwve1i36GIUJ5
 xuVzopiEDE5v2i0feRjZit/lC2rr588yofYX/0UqHdOYARgBKi9wA3XH2/JPiktRm8IcZNigfLt
 FhI87zwu4LEy/18YBbZVaA40=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 375bf685a1d0cbc9;
	Tue, 08 Sep 2026 09:10:05 +0000
X-Mizu-Trace-ID: 375bf685a1d0cbc9
X-Migadu-Flow: FLOW_OUT
Message-ID: <f2f1f7e4-539f-4385-a28b-1fde074cdeca@linux.dev>
Date: Tue, 8 Sep 2026 17:09:58 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/11] mm/sparse-vmemmap: drop the extra tail page from
 device DAX reservation
To: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Muchun Song <muchun.song@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>, Randy Dunlap <rdunlap@infradead.org>
References: <20260908030335.96549-1-songmuchun@bytedance.com>
 <20260908030335.96549-10-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20260908030335.96549-10-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/8/26 11:03 AM, Muchun Song wrote:
> The device DAX vmemmap population still reserves one extra tail vmemmap
> page after the head page.
> 
> Drop that extra reservation and let the shared tail page cover all tail
> vmemmap pages after the head page, so DAX follows the same reservation
> model as HugeTLB.
> 
> This reduces the reserved vmemmap pages for optimized DAX mappings to
> one and removes the now-unneeded first-tail population from the generic
> and powerpc paths to simplify the code as well.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   arch/powerpc/mm/book3s64/radix_pgtable.c | 46 ++----------------------
>   include/linux/mm.h                       |  3 +-
>   mm/mm_init.c                             |  2 +-
>   mm/sparse-vmemmap.c                      | 13 ++-----
>   4 files changed, 7 insertions(+), 57 deletions(-)

Looks like sashiko's response [1] is a false positive.

[1]. 
https://sashiko.dev/#/patchset/20260908030335.96549-1-songmuchun%40bytedance.com

__SetPageReserved() in vmemmap_shared_tail_page() marks the struct page
entries stored inside the shared vmemmap backing page, i.e. the metadata
templates that later represent DEV-DAX tail pages. It does not mark the
struct page of the backing page itself.

On hot-remove, free_vmemmap_pages() is called with pte_page(*pte), which
is the backing page. That page is not reserved, so the teardown goes
through __free_pages(), not free_reserved_pages().

Right?

If so:

Acked-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi

> 
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index 831c231a4a18..e7e751c48dd2 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -1218,39 +1218,6 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
>   	return 0;
>   }
>   
> -static pte_t * __meminit radix__vmemmap_populate_address(unsigned long addr, int node,
> -							 struct vmem_altmap *altmap,
> -							 struct page *reuse)
> -{
> -	pgd_t *pgd;
> -	p4d_t *p4d;
> -	pud_t *pud;
> -	pmd_t *pmd;
> -	pte_t *pte;
> -
> -	pgd = pgd_offset_k(addr);
> -	p4d = p4d_offset(pgd, addr);
> -	pud = vmemmap_pud_alloc(p4d, node, addr);
> -	if (!pud)
> -		return NULL;
> -	pmd = vmemmap_pmd_alloc(pud, node, addr);
> -	if (!pmd)
> -		return NULL;
> -	if (pmd_leaf(*pmd))
> -		/*
> -		 * The second page is mapped as a hugepage due to a nearby request.
> -		 * Force our mapping to page size without deduplication
> -		 */
> -		return NULL;
> -	pte = vmemmap_pte_alloc(pmd, node, addr);
> -	if (!pte)
> -		return NULL;
> -	radix__vmemmap_pte_populate(pmd, addr, node, NULL, NULL);
> -	vmemmap_verify(pte, node, addr, addr + PAGE_SIZE);
> -
> -	return pte;
> -}
> -
>   int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
>   					      unsigned long start,
>   					      unsigned long end, int node,
> @@ -1297,7 +1264,7 @@ int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
>   		if (!pte_none(*pte)) {
>   			/*
>   			 * This could be because we already have a compound
> -			 * page whose VMEMMAP_RESERVE_NR pages were mapped and
> +			 * page whose retained vmemmap page was mapped and
>   			 * this request fall in those pages.
>   			 */
>   			next = addr + PAGE_SIZE;
> @@ -1318,16 +1285,7 @@ int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
>   					return -ENOMEM;
>   				vmemmap_verify(pte, node, addr, addr + PAGE_SIZE);
>   
> -				/*
> -				 * Populate the tail pages vmemmap page
> -				 * It can fall in different pmd, hence
> -				 * vmemmap_populate_address()
> -				 */
> -				pte = radix__vmemmap_populate_address(addr + PAGE_SIZE, node, NULL, NULL);
> -				if (!pte)
> -					return -ENOMEM;
> -
> -				next = addr + 2 * PAGE_SIZE;
> +				next = addr + PAGE_SIZE;
>   				continue;
>   			}
>   
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index a2ebe87e7654..969594074fd2 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -5167,7 +5167,6 @@ static inline void vmem_altmap_free(struct vmem_altmap *altmap,
>   }
>   #endif
>   
> -#define VMEMMAP_RESERVE_NR	2
>   #ifdef CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
>   static inline bool __vmemmap_can_optimize(struct vmem_altmap *altmap,
>   					  struct dev_pagemap *pgmap)
> @@ -5187,7 +5186,7 @@ static inline bool __vmemmap_can_optimize(struct vmem_altmap *altmap,
>   	 * For vmemmap optimization with DAX we need minimum 2 vmemmap
>   	 * pages. See layout diagram in Documentation/mm/vmemmap_dedup.rst
>   	 */
> -	return !altmap && (nr_vmemmap_pages > VMEMMAP_RESERVE_NR);
> +	return !altmap && (nr_vmemmap_pages > VMEMMAP_OPTIMIZATION_PAGES);
>   }
>   /*
>    * If we don't have an architecture override, use the generic rule
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 7a2e58d631c2..629420a83891 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -1056,7 +1056,7 @@ static inline unsigned long compound_nr_pages(unsigned long pfn,
>   	if (!section_vmemmap_optimizable(ms))
>   		return pgmap_vmemmap_nr(pgmap);
>   
> -	return VMEMMAP_RESERVE_NR * (PAGE_SIZE / sizeof(struct page));
> +	return VMEMMAP_OPTIMIZATION_PAGES * (PAGE_SIZE / sizeof(struct page));
>   }
>   
>   static void __ref memmap_init_compound(struct page *head,
> diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
> index 0201877a7f80..e655d9d1348f 100644
> --- a/mm/sparse-vmemmap.c
> +++ b/mm/sparse-vmemmap.c
> @@ -136,7 +136,6 @@ int __meminit section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages
>   {
>   	const struct mem_section *ms = __pfn_to_section(pfn);
>   	const int order = section_order(ms);
> -	const int vmemmap_pages = pgmap ? VMEMMAP_RESERVE_NR : VMEMMAP_OPTIMIZATION_PAGES;
>   	const unsigned long pages_per_compound = 1UL << order;
>   
>   	VM_WARN_ON_ONCE(!IS_ALIGNED(pfn | nr_pages, PAGES_PER_SUBSECTION));
> @@ -147,13 +146,13 @@ int __meminit section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages
>   
>   	if (order < PFN_SECTION_SHIFT) {
>   		VM_WARN_ON_ONCE(!IS_ALIGNED(pfn | nr_pages, pages_per_compound));
> -		return vmemmap_pages * nr_pages / pages_per_compound;
> +		return VMEMMAP_OPTIMIZATION_PAGES * nr_pages / pages_per_compound;
>   	}
>   
>   	VM_WARN_ON_ONCE(!IS_ALIGNED(pfn | nr_pages, PAGES_PER_SECTION));
>   
>   	if (IS_ALIGNED(pfn, pages_per_compound))
> -		return vmemmap_pages;
> +		return VMEMMAP_OPTIMIZATION_PAGES;
>   
>   	return 0;
>   }
> @@ -521,17 +520,11 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
>   		if (!pte)
>   			return -ENOMEM;
>   
> -		/* Populate the tail pages vmemmap page */
> -		next = addr + PAGE_SIZE;
> -		pte = vmemmap_populate_address(next, node, NULL, -1, flags);
> -		if (!pte)
> -			return -ENOMEM;
> -
>   		/*
>   		 * Reuse the shared page for the rest of tail pages
>   		 * See layout diagram in Documentation/mm/vmemmap_dedup.rst
>   		 */
> -		next += PAGE_SIZE;
> +		next = addr + PAGE_SIZE;
>   		rc = vmemmap_populate_range(next, last, node, NULL,
>   					    page_to_pfn(page), flags);
>   		if (rc)

