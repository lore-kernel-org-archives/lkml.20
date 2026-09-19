Received: from mta0.migadu.com (out-3.mta0.migadu.com [91.218.175.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402B720D4FF
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789826481; cv=none; b=Zo2az8YoJ1yn2hCUUlSo3w6RrWindRjknnPuTbd+tqPBpn+HQB+zb2ugrjbU99MyKOHWelENDzZANCBxKnoyzySU8xhQk5F7XCxMIKygHdk+yh2R59hmcSd6xqvrh26X59RfOZV9WqhuRn1VrnkyCpAukpt5RqnIqcURYMSr2sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789826481; c=relaxed/simple;
	bh=rYDj48Z/2aku9l9SlVwNnxYms0Re8ox444qqDkUqQQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gyk0Kj6s9llqnmn4XuvxHdTP1ZA94JIEdgxNmZxhxVDMFvHW8rQq+4FOPqq4I4FYYINY7Kcq4CMZwVsTGoFntHthdtjttdQR0d/KYFzJqAXpn/y3CPJ/I5I1NAHfeCx3GXZgUmnfa/vb31m/WQUfTbNtKYrUS8T0vjYM5QOPwz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eIsV+EbB; arc=none smtp.client-ip=91.218.175.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eIsV+EbB"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rYDj48Z/2aku9l9SlVwNnxYms0Re8ox444qqDkUqQQg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789826476; v=1; x=1790431276;
 b=eIsV+EbBfLzgzTw8ptsZ7hwCnYC0quMp+ykEoo0LCBgIszEKcmbz5l8n6uuvaMzfNOBjk150
 RvK9a/Wp4ngrAI4QRnqU+R/bRlI5Wu9z1bP5QQpLd8MpfMj4wMgnE2hPHlfm/xYAwCRb71DN7Vn
 pzFWj5Z8Fn1g8BxacqeRTjjQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8aee96b0eadcf8c2;
	Sat, 19 Sep 2026 14:01:16 +0000
X-Mizu-Trace-ID: 8aee96b0eadcf8c2
X-Migadu-Flow: FLOW_OUT
Message-ID: <186ee2ba-daf3-4120-a3e3-101cac1ff5a1@linux.dev>
Date: Sat, 19 Sep 2026 22:01:06 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] mm/sparse-vmemmap: drop VMEMMAP_POPULATE_DAX
To: Muchun Song <songmuchun@bytedance.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Mike Rapoport <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, muchun.song@linux.dev
References: <20260913083734.86802-1-songmuchun@bytedance.com>
 <20260913083734.86802-2-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20260913083734.86802-2-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/13/26 4:37 PM, Muchun Song wrote:
> VMEMMAP_POPULATE_DAX currently distinguishes DAX vmemmap population in two
> places: it keeps allocations on the normal path and takes a reference when
> a backing page is supplied for reuse.
> 
> After Device DAX switched to the common per-zone shared tail page, both
> conditions can be determined locally. DAX supplies ptpfn for every shared
> tail mapping and requests an allocation only for compound head mappings,
> whose PFNs are not optimizable. Therefore, vmemmap_optimizable_pfn() alone
> selects the correct allocation path.
> 
> When ptpfn is supplied, the caller is reusing an existing backing page.
> Once the slab allocator is available, take a reference for each reused

Does the availability of slab mean the buddy allocator is already being
used? Could there be a window where the buddy allocator is functional
but slab hasn't become available yet?

> mapping to balance the release performed by vmemmap_free(). Early mappings
> are backed by memblock/reserved memory and do not need page reference
> accounting.
> 
> Remove VMEMMAP_POPULATE_DAX and the flags argument from the vmemmap
> population helpers.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   mm/sparse-vmemmap.c | 36 +++++++++++++-----------------------
>   1 file changed, 13 insertions(+), 23 deletions(-)
> 
> diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
> index 96506f594924..878d29a4e862 100644
> --- a/mm/sparse-vmemmap.c
> +++ b/mm/sparse-vmemmap.c
> @@ -32,12 +32,6 @@
>   #include <asm/dma.h>
>   #include <asm/tlbflush.h>
>   
> -/*
> - * Flags for vmemmap_populate_range and friends.
> - */
> -/* Vmemmap population for ZONE_DEVICE compound pages */
> -#define VMEMMAP_POPULATE_DAX		0x0001
> -
>   #include "internal.h"
>   #include "mm_init.h"
>   #include "sparse.h"
> @@ -208,7 +202,7 @@ struct page __ref *vmemmap_shared_tail_page(unsigned int order, struct zone *zon
>   }
>   
>   static __meminit void *vmemmap_alloc_pte(unsigned long pfn, int node,
> -		struct vmem_altmap *altmap, unsigned long flags)
> +		struct vmem_altmap *altmap)
>   {
>   	struct zone *zone;
>   	struct page *page;
> @@ -218,7 +212,7 @@ static __meminit void *vmemmap_alloc_pte(unsigned long pfn, int node,
>   	 * Device DAX still relies on vmemmap_populate_compound_pages() for
>   	 * head/first-tail allocation and tail-page reuse.
>   	 */
> -	if (!vmemmap_optimizable_pfn(pfn) || flags & VMEMMAP_POPULATE_DAX)
> +	if (!vmemmap_optimizable_pfn(pfn))
>   		return vmemmap_alloc_block_buf(PAGE_SIZE, node, altmap);
>   
>   	zone = pfn_to_zone(pfn, node);
> @@ -230,8 +224,7 @@ static __meminit void *vmemmap_alloc_pte(unsigned long pfn, int node,
>   }
>   
>   static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, int node,
> -				       struct vmem_altmap *altmap,
> -				       unsigned long ptpfn, unsigned long flags)
> +		struct vmem_altmap *altmap, unsigned long ptpfn)
>   {
>   	pte_t *pte = pte_offset_kernel(pmd, addr);
>   	unsigned long pfn = page_to_pfn((struct page *)addr);
> @@ -240,7 +233,7 @@ static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
>   		pte_t entry;
>   
>   		if (ptpfn == (unsigned long)-1) {
> -			void *p = vmemmap_alloc_pte(pfn, node, altmap, flags);
> +			void *p = vmemmap_alloc_pte(pfn, node, altmap);
>   
>   			if (!p)
>   				return NULL;
> @@ -255,7 +248,7 @@ static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
>   			 * and through vmemmap_populate_compound_pages() when
>   			 * slab is available.
>   			 */
> -			if (flags & VMEMMAP_POPULATE_DAX)
> +			if (slab_is_available())
>   				get_page(pfn_to_page(ptpfn));
>   		}
>   		entry = pfn_pte(ptpfn, PAGE_KERNEL);
> @@ -318,8 +311,7 @@ static pgd_t * __meminit vmemmap_pgd_populate(unsigned long addr, int node)
>   
>   static pte_t * __meminit vmemmap_populate_address(unsigned long addr, int node,
>   					      struct vmem_altmap *altmap,
> -					      unsigned long ptpfn,
> -					      unsigned long flags)
> +					      unsigned long ptpfn)
>   {
>   	pgd_t *pgd;
>   	p4d_t *p4d;
> @@ -339,7 +331,7 @@ static pte_t * __meminit vmemmap_populate_address(unsigned long addr, int node,
>   	pmd = vmemmap_pmd_populate(pud, addr, node);
>   	if (!pmd)
>   		return NULL;
> -	pte = vmemmap_pte_populate(pmd, addr, node, altmap, ptpfn, flags);
> +	pte = vmemmap_pte_populate(pmd, addr, node, altmap, ptpfn);
>   	if (!pte)
>   		return NULL;
>   	vmemmap_verify(pte, node, addr, addr + PAGE_SIZE);
> @@ -350,15 +342,14 @@ static pte_t * __meminit vmemmap_populate_address(unsigned long addr, int node,
>   static int __meminit vmemmap_populate_range(unsigned long start,
>   					    unsigned long end, int node,
>   					    struct vmem_altmap *altmap,
> -					    unsigned long ptpfn,
> -					    unsigned long flags)
> +					    unsigned long ptpfn)
>   {
>   	unsigned long addr = start;
>   	pte_t *pte;
>   
>   	for (; addr < end; addr += PAGE_SIZE) {
>   		pte = vmemmap_populate_address(addr, node, altmap,
> -					       ptpfn, flags);
> +					       ptpfn);
>   		if (!pte)
>   			return -ENOMEM;
>   	}
> @@ -369,7 +360,7 @@ static int __meminit vmemmap_populate_range(unsigned long start,
>   int __meminit vmemmap_populate_basepages(unsigned long start, unsigned long end,
>   					 int node, struct vmem_altmap *altmap)
>   {
> -	return vmemmap_populate_range(start, end, node, altmap, -1, 0);
> +	return vmemmap_populate_range(start, end, node, altmap, -1);
>   }
>   
>   /*
> @@ -498,7 +489,6 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
>   	unsigned long size, addr;
>   	pte_t *pte;
>   	int rc;
> -	unsigned long flags = VMEMMAP_POPULATE_DAX;
>   	struct page *page;
>   	unsigned int order = pfn_to_section_compound_order(start_pfn);
>   
> @@ -508,14 +498,14 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
>   
>   	if (reuse_compound_section(start_pfn, pgmap))
>   		return vmemmap_populate_range(start, end, node, NULL,
> -					      page_to_pfn(page), flags);
> +					      page_to_pfn(page));
>   
>   	size = min(end - start, (1UL << order) * sizeof(struct page));
>   	for (addr = start; addr < end; addr += size) {
>   		unsigned long next, last = addr + size;
>   
>   		/* Populate the head page vmemmap page */
> -		pte = vmemmap_populate_address(addr, node, NULL, -1, flags);
> +		pte = vmemmap_populate_address(addr, node, NULL, -1);
>   		if (!pte)
>   			return -ENOMEM;
>   
> @@ -525,7 +515,7 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
>   		 */
>   		next = addr + PAGE_SIZE;
>   		rc = vmemmap_populate_range(next, last, node, NULL,
> -					    page_to_pfn(page), flags);
> +					    page_to_pfn(page));
>   		if (rc)
>   			return -ENOMEM;
>   	}

