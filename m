Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793848966;
	b=0CFJR1Q/404KwJH4oonC3CpKnu8fY3pfRMvQ/QefIMsXc87oDGGdX1FxuiD5+/S8wc5E
	 vsMt7BitRLYAXJeSkDzKTb7dKujVpvwIykByJcZV9cSgmFN9Z1IojjLN8mUgfxmL6yKDn
	 wa84ozK+3wkGH9DK5Oq5WTukImAI5G/2FKIheDALLB9qRXfR+CX7QFl1ONWTbfGV9bqCf
	 yKS+E4fpPaH80zTOpczWohBmcJEE9RgX4Xh7r0a6RYYHLhAy9ZuiMAf6z6hxlDNcJglUh
	 sRqcqBycY0HD9+/0dLD3NIr97otkGWQ8P6CMbQBB4SzX2CE9liKkyjiPv0mVZf2kIRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793848966;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=4UMh9s5ocnokfx+XKoSyLVmwtM+Tp0GJvRtc0t12Crg=;
	b=pLA7sndZkpLgL2i3xEookhlIyX+Opod5tp3IIylbpnaB8RR02z43zLixnHU2u8oDBiAk
	 NpKE4ifVwokCXWiPU87LHM/TW8tuqh7T4tLz1CjLw4VPlJjrtWMQNJGiaPg6/4mU2T75A
	 bBCkGFr2F+iNLANkbkmNfty5y7ATJVqMe0RCSiZHMP/zS/TCNfX9mFvajS/ut9SKL4FNu
	 98L/VCUwWL2HgkZq/EoIe+OYLC5iksI2e4+3cabS4hWDtTHjay7VtCy/OyWl95ZEMLouV
	 S8rA5q9pNWdziYGs4JiseEIUe51Tr512Uhno4/owsrb4dgqwBf0/5rTO6YlyO7thaBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=91.218.175.12
Received: from mta0.migadu.com (out-12.mta0.migadu.com [91.218.175.12])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A07606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 03:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87A07606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=NlnsIm6KYbGZ7DOnv+gfpZHXSnV9jFfbjp/BdVMvA44=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793848957; v=1; x=1794453757;
 b=jmPuwpy8Oc7QJQOIBzuesZIf15qtvnUvlz+R2ew2rAiKS0aXgPPL9E4hcKPQL2aPsOMhP3Nn
 iyQMk1/2tGvrJpuoTzXSshEhmHBwGRV1Bd9otVyY3VpM3D56e2qrgEEMMeMLXKKfeeKA2UdyM2d
 Z92QbtrXj9p2rVtKcoGw8g0M=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ce5845c80e8565fa;
	Thu, 05 Nov 2026 03:22:37 +0000
X-Mizu-Trace-ID: ce5845c80e8565fa
X-Migadu-Flow: FLOW_OUT
Message-ID: <6f0973cb-a57c-4612-9812-9c31ff620e1d@linux.dev>
Date: Thu, 5 Nov 2026 11:22:30 +0800
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
Subject: Re: [PATCH] mm: synchronize with PTE table reclaim for all folio
 sizes
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 david@kernel.org, ljs@kernel.org
Cc: riel@surriel.com, liam@infradead.org, vbabka@kernel.org,
 harry@kernel.org, jannh@google.com, lance.yang@linux.dev, pfalcato@suse.de,
 ayushr@modal.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <affd6da4e8d0de1424a4e0b3bafcd1324dfb6c97.1793847060.git.baolin.wang@linux.alibaba.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <affd6da4e8d0de1424a4e0b3bafcd1324dfb6c97.1793847060.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/5/26 10:56 AM, Baolin Wang wrote:
> Similar to commit 243cf1f67b36 ("mm: memory: fix truncation removing mapped
> folios"), the '!pmd_present()' check in page_vma_mapped_walk() can also race
> with concurrent page table reclamation via zap_empty_pte_table().
> 
> page_vma_mapped_walk() is used by many functions including try_to_unmap(),
> try_to_migrate(), folio_mkclean(), pfn_mkclean_range(), remove_migration_ptes(),
> page_mapped_in_vma(), and mapping_wrprotect_range(). Except for try_to_unmap()
> and try_to_migrate(), the other callers do not perform post-walk accounting
> checks, so the race has no observable impact on them.
> 
> For migration, the race can cause unnecessary retries. For reclaim via
> try_to_unmap(), the race can cause failure to reclaim a folio that is in
> fact already unmapped (as shown below), which may lead to unexpected OOM
> or increased refaults.
> 
> CPU 0 (reclaim)                      CPU 1 (MADV_DONTNEED)
> --------------------------------    --------------------------------
> folio_lock(F)
> try_to_unmap(F, TTU_SYNC)
>                                      zap_pte_range(full PMD range)
>                                        spin_lock(ptl)
>                                        clear PTEs
>                                        zap_empty_pte_table()
>                                          spin_trylock(pml)
>                                          pmd_clear()
>                                          spin_unlock(pml)
> 
>    page_vma_mapped_walk()
>      observe !pmd_present(pmde)
>      nr_pages < HPAGE_PMD_NR
>      skip synchronization
>      return false
> 
> try_to_unmap() returns
> folio_mapped(F) == true
> nr_unmap_fail += folio_nr_pages(F)
>                                      tlb_flush_mmu_tlbonly()
>                                      tlb_flush_rmaps()
>                                        remove F's rmaps
>                                      spin_unlock(ptl)
> 
> Commit 243cf1f67b36 ("mm: memory: fix truncation removing mapped folios")
> has already moved the PMD clear operation (via zap_empty_pte_table()) to
> after tlb_flush_rmaps(). Similarly, page_vma_mapped_walk() also needs to
> use sync_with_folio_pmd_zap() to synchronize and avoid memory ordering
> issues on weakly ordered CPUs.
> 
> Fixes: 6375e95f381e ("mm: pgtable: reclaim empty PTE page in madvise(MADV_DONTNEED)")
> Cc: stable@vger.kernel.org
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>   mm/page_vma_mapped.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
> index e6b6170c2f4f..8797467b6f0c 100644
> --- a/mm/page_vma_mapped.c
> +++ b/mm/page_vma_mapped.c
> @@ -293,10 +293,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>   			spin_unlock(pvmw->ptl);
>   			pvmw->ptl = NULL;
>   		} else if (!pmd_present(pmde)) {
> -			if ((pvmw->flags & PVMW_SYNC) &&
> -			    thp_vma_suitable_order(vma, pvmw->address,
> -						   PMD_ORDER) &&
> -			    (pvmw->nr_pages >= HPAGE_PMD_NR))
> +			if (pvmw->flags & PVMW_SYNC)
>   				sync_with_folio_pmd_zap(mm, pvmw->pmd);
>   
>   			goto next_pmd;

Acked-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi



