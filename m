Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794591566;
	b=crnaD40vPYaaVpfN6PqvPCe1tuo9R4qstYj9K6lsvNcjXbyuk7h3optVWFBkdZ6Tz0hz
	 ygHke4EINLBMCcoz4dTMNRxDf1zBswiUk3Ip712zbp9glt/0370p9APMrzmSJTjzWgFbr
	 kPkHRIqup9wToNorCxf9WeFuxZe3tP1qswLR8qTN4rQ3YfBqxvmkL8/QZ53vs/tK+lKmv
	 z9XmPZryHtSBhzqpDY/Lhg/UyXQ8a7iUwYsxzuuAjnke/6JeAydbLt+clkZDmS50mr3Ec
	 m32NSHPjGP9XYsb7usTk//opHfu/Ey5rZVAnizW++KGwLJzsDx31Mxm4MKpW+fIsWTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794591566;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=dm8q8HGPHE9E98Lt4CJ5Z1tUerEAxjiOuXmAiX4bR3k=;
	b=gs1pBezvc3TDtdbNEKntAXEwZXR+xwsITywZ2Rw0fvj+lCOkZQKweFGjyK06n/RYHr7J
	 TpzTOFW2Zdh8nOHDEaLOl+n9NK8yH7+yl2dBJ0Qpyi+aKegZdx8lWYAe60UYeoBlBz45G
	 DeXA88nVR/9LU/EFZpntDNqZhxqy/Pf04T1DnpID0B7XbBsDhXNfqp4hfXrI/3NDFT60C
	 JQiEbiDS7BZjk9/wq5j15AS94B77h4FCpnbZNOq7Xi2ajtbrxkJedkPdgrDr0K9qRWw1x
	 KoIFANgiZWG0/RZgJfzjANmqNLew5YUhmnC3k1GV/5yjzIQh5SSVDUnkIYy4YS/xQ9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GJPwlCXx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6B6607E802
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GJPwlCXx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E1BF1F000C6;
	Fri, 13 Nov 2026 17:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794591566;
	bh=dm8q8HGPHE9E98Lt4CJ5Z1tUerEAxjiOuXmAiX4bR3k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=GJPwlCXxg4dqojQf5ueDh9IrlaSbGZO0JTmYaJQfn9oeW6hwuzQ31647nd+eCdAiM
	 c3dP0I8334riJdJpI663KprFneiBckFlSv7YhbNtuQF6t2UIGX+lRxL0DEuo7nifWU
	 vHQ2PPNUguiOeFgNd5Jhe84QJCoy6nHyL3oR6c9vLooCa2mdAkYaH6sSonUszYpdhO
	 mRkEnd4xpyXmdf8iWU66G1xdatv9n5GVbNGEKIWVoVW+PBR8YB2wjESBvfVHfDIKyA
	 8394hibUzO+kInePRReL0tZCB04bhVYUX09nnmgo7JiPg9OJAFJfY7zQyh7t/bp1d6
	 j5dP7ZKfGKvMQ==
Message-ID: <16bb1a14-04f4-4524-9882-20d452175a3d@kernel.org>
Date: Fri, 13 Nov 2026 18:39:20 +0100
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
 ljs@kernel.org
Cc: riel@surriel.com, liam@infradead.org, vbabka@kernel.org,
 harry@kernel.org, jannh@google.com, lance.yang@linux.dev,
 qi.zheng@linux.dev, pfalcato@suse.de, ayushr@modal.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <affd6da4e8d0de1424a4e0b3bafcd1324dfb6c97.1793847060.git.baolin.wang@linux.alibaba.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <affd6da4e8d0de1424a4e0b3bafcd1324dfb6c97.1793847060.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/5/26 03:56, Baolin Wang wrote:
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
>                                     zap_pte_range(full PMD range)
>                                       spin_lock(ptl)
>                                       clear PTEs
>                                       zap_empty_pte_table()
>                                         spin_trylock(pml)
>                                         pmd_clear()
>                                         spin_unlock(pml)
> 
>   page_vma_mapped_walk()
>     observe !pmd_present(pmde)
>     nr_pages < HPAGE_PMD_NR
>     skip synchronization
>     return false
> 
> try_to_unmap() returns
> folio_mapped(F) == true
> nr_unmap_fail += folio_nr_pages(F)
>                                     tlb_flush_mmu_tlbonly()
>                                     tlb_flush_rmaps()
>                                       remove F's rmaps
>                                     spin_unlock(ptl)
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
>  mm/page_vma_mapped.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
> index e6b6170c2f4f..8797467b6f0c 100644
> --- a/mm/page_vma_mapped.c
> +++ b/mm/page_vma_mapped.c
> @@ -293,10 +293,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>  			spin_unlock(pvmw->ptl);
>  			pvmw->ptl = NULL;
>  		} else if (!pmd_present(pmde)) {
> -			if ((pvmw->flags & PVMW_SYNC) &&
> -			    thp_vma_suitable_order(vma, pvmw->address,
> -						   PMD_ORDER) &&
> -			    (pvmw->nr_pages >= HPAGE_PMD_NR))
> +			if (pvmw->flags & PVMW_SYNC)
>  				sync_with_folio_pmd_zap(mm, pvmw->pmd);
>  
>  			goto next_pmd;

Baolin, how to proceed with that? Are you intending a resend? Including some of
the performance impact and ways forward to optimize?

-- 
Cheers,

David
