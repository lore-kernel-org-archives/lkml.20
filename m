Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793980573;
	b=4TrTWulrD84ZK/OGywrELM2KeTQb580QdlzJeN39w36u9CRfK7gu4JhSeFuVyarnJsoj
	 /8Nn9fVzKD1iKwrcMp0PL72guIVdXsMRzalMkAct78Vh4JokvK7yuisA8D3a/HcNdOJaO
	 UvaC8UKDeV2sNlRj6YhUY0cqPwK4GxZcsWE2BhLh5q6uGgyV0x61tql95PgjesMO5f4xO
	 ROrw5UeZJMclORGLZ8QNcVpOIpOwuooL+ZGe3vgCMt8m5sNVxlpR/GK+S0j0TjfYZIbgH
	 p8wTqK72trP2otZa72CPkgB55UJBGXQdTXOTfb4LRHoI+wR4m1jW+QT3X/vpfltVs5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793980573;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UfD8ZnH6BJz/4LIcV1+SpPJwWoacvDCqotJJBOhRHbY=;
	b=XIvxJyLYBpc+QZfABqVS+zlZbG3y3b33POU4cu2ryoOck9MQbngCz3ASxvzNG/hvbjFp
	 Opd8z6PyZP28lbpxo4BQjI2HpF5ogf1cIhS65SydWr1/WozNRHf9iJPW3SUXoc9JIExYP
	 QisjiuzwI2ML2uq8GYMsTnpBAonNQZncbmbu7aUvuAkMG+DubfiC+Cd1TC2h64waCcx0F
	 w9jSxepLtURmLmEGLzQdzDpI5hC4pt32LtVfEkXWA0CK8mnCAEHBvSDH//I6Co2hvLp82
	 g8C5GkWd0YHgUhM+F7ou7RBb3L2N1bGBVhS68x/NVNDi62eq/IlTCxiNs0ankFcRsCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=91.218.175.188
Received: from mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4DB606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D4DB606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IUxtcrSK4ScUgL4iwrR/fCWoiD4BzoTR6aRMHmOVWZw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793980567; v=1; x=1794585367;
 b=nIN9eJWkx0/Zp/tqNTNTIvfGLDUajdmUzVXC0+QaFWbCFAy2R9/Ih25xdkqBZ7HDtFUqSmKE
 oPvIQGjNMhiMAfVLoJ2QIEZ8nrCHtV1dqzun4eQFtCp9m72m0pGRyYmw5EW+soHwI2Rp+Zzrph5
 VW24hOtLjtiGG7UAilnor9hg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 7a7c6486c02f11c8;
	Fri, 06 Nov 2026 15:56:07 +0000
X-Mizu-Trace-ID: 7a7c6486c02f11c8
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Usama Arif <usama.arif@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Kiryl Shutsemau <kas@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Hugh Dickins <hughd@google.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mm: don't allocate a page table under RCU in do_set_pmd()
Date: Fri,  6 Nov 2026 07:56:03 -0800
Message-ID: <20261106155604.3999641-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106-khugepaged_set_pmd-v2-2-d2457b5e377a@kernel.org>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 06 Nov 2026 13:36:13 +0100 "David Hildenbrand (Arm)" <david@kernel.org> wrote:

> do_fault_around() skips PTE table preallocation when the PMD already points
> to a PTE table. A concurrent collapse can then retract that table and
> clear the PMD before filemap_map_pages() locks the new PMD-sized folio.
> 
> filemap_map_pmd() can then call do_set_pmd() with an empty PMD and no
> preallocated table. On PowerPC hash MMU, do_set_pmd() then tries
> allocating a PTE table to deposit. But filemap_map_pmd() calls
> do_set_pmd() under RCU, so allocating from that context is not good.
> 
> This race became possible when retract_page_tables() stopped taking the
> mmap and VMA locks. Previously, those locks excluded retraction while
> the fault was in progress.
> 
> Add a may_alloc argument to do_set_pmd() and pass false from
> filemap_map_pmd(), so we can fail with VM_FAULT_FALLBACK instead of
> trying to allocate.
> 
> This issue should be fairly hard to hit in practice.
>

Yes, I imagine it was very difficult to reproduce, doing a sleeping
pte_alloc_one() inside filemap_map_pmd()'s RCU read-side section
when a concurrent retract_page_tables() empties the PMD. Only
possible on PowerPC.

> Fixes: 1d65b771bc08 ("mm/khugepaged: retract_page_tables() without mmap or vma lock")
> Cc: stable@vger.kernel.org
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---

Acked-by: Usama Arif <usama.arif@linux.dev>

>  include/linux/mm.h |  3 ++-
>  mm/filemap.c       |  2 +-
>  mm/khugepaged.c    |  2 +-
>  mm/memory.c        | 10 +++++++---
>  4 files changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index a2dd76cc5bbfe..bd144fec5f5da 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2156,7 +2156,8 @@ static inline pte_t maybe_mkwrite(pte_t pte, struct vm_area_struct *vma)
>  	return pte;
>  }
>  
> -vm_fault_t do_set_pmd(struct vm_fault *vmf, struct folio *folio, struct page *page);
> +vm_fault_t do_set_pmd(struct vm_fault *vmf, struct folio *folio, struct page *page,
> +		bool may_alloc);
>  void set_pte_range(struct vm_fault *vmf, struct folio *folio,
>  		struct page *page, unsigned int nr, unsigned long addr);
>  
> diff --git a/mm/filemap.c b/mm/filemap.c
> index 86297841f9955..9871b4f32a916 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -3745,7 +3745,7 @@ static bool filemap_map_pmd(struct vm_fault *vmf, struct folio *folio,
>  
>  	if (pmd_none(*vmf->pmd) && folio_test_pmd_mappable(folio)) {
>  		struct page *page = folio_file_page(folio, start);
> -		vm_fault_t ret = do_set_pmd(vmf, folio, page);
> +		vm_fault_t ret = do_set_pmd(vmf, folio, page, /* may_alloc= */ false);
>  		if (!ret) {
>  			/* The page is mapped successfully, reference consumed. */
>  			folio_unlock(folio);
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 8d9f05a39afb3..5836e08abc984 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -1826,7 +1826,7 @@ static enum scan_result set_huge_pmd(struct vm_area_struct *vma, unsigned long a
>  	}
>  
>  	vmf.pmd = pmdp;
> -	if (do_set_pmd(&vmf, folio, page))
> +	if (do_set_pmd(&vmf, folio, page, /* may_alloc= */ true))
>  		return SCAN_FAIL;
>  
>  	folio_get(folio);
> diff --git a/mm/memory.c b/mm/memory.c
> index 421064aef3cf0..6eeed43b05a19 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -5682,7 +5682,8 @@ static void deposit_prealloc_pte(struct vm_fault *vmf)
>  	vmf->prealloc_pte = NULL;
>  }
>  
> -vm_fault_t do_set_pmd(struct vm_fault *vmf, struct folio *folio, struct page *page)
> +vm_fault_t do_set_pmd(struct vm_fault *vmf, struct folio *folio, struct page *page,
> +		bool may_alloc)
>  {
>  	struct vm_area_struct *vma = vmf->vma;
>  	bool write = vmf->flags & FAULT_FLAG_WRITE;
> @@ -5723,6 +5724,8 @@ vm_fault_t do_set_pmd(struct vm_fault *vmf, struct folio *folio, struct page *pa
>  	 * related to pte entry. Use the preallocated table for that.
>  	 */
>  	if (arch_needs_pgtable_deposit() && !vmf->prealloc_pte) {
> +		if (!may_alloc)
> +			return VM_FAULT_FALLBACK;
>  		vmf->prealloc_pte = pte_alloc_one(vma->vm_mm);
>  		if (!vmf->prealloc_pte)
>  			return VM_FAULT_OOM;
> @@ -5764,7 +5767,8 @@ vm_fault_t do_set_pmd(struct vm_fault *vmf, struct folio *folio, struct page *pa
>  	return ret;
>  }
>  #else
> -vm_fault_t do_set_pmd(struct vm_fault *vmf, struct folio *folio, struct page *page)
> +vm_fault_t do_set_pmd(struct vm_fault *vmf, struct folio *folio, struct page *page,
> +		bool may_alloc)
>  {
>  	return VM_FAULT_FALLBACK;
>  }
> @@ -5888,7 +5892,7 @@ vm_fault_t finish_fault(struct vm_fault *vmf)
>  
>  	if (pmd_none(*vmf->pmd)) {
>  		if (!needs_fallback && folio_test_pmd_mappable(folio)) {
> -			ret = do_set_pmd(vmf, folio, page);
> +			ret = do_set_pmd(vmf, folio, page, /* may_alloc= */ true);
>  			if (ret != VM_FAULT_FALLBACK)
>  				return ret;
>  		}
> 
> -- 
> 2.43.0
> 
> 
