Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923643;
	b=bkXQOfAFDjN9Cqxl7KRipyfZJt1zS1krtZ2gLenNV8GY1Gvd1jHW5txN2RoqH3BX/Exc
	 AxyhIdd6I5Raod9X+W37+dcTTTfilokSvzBeWdm/X7512nk2AVnvb4oWb2onXYjwNst/S
	 +xC+/XGvm+dlB8DeChKhyeuue/79xcLCi56sG4cDVDego/YlXQksBtxlG1af+HRu3+q6/
	 N4M9vXX7z7FeRS3Clt8uV4uMlkbeYMAcRiVjUFQ0FUEn25Upx8dEPVzaQoj4oIvrugxHr
	 KdyAWvwka/W33kkY+8pCOLzSrRLUgl95R/5cKYUmOqEwW9w9cSNKqFy+n5S+yawVyRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923643;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=lqe4yka6zmdqmbIPGKAWwRM6Ez2dyujJozYgr8mnWDQ=;
	b=eii7SkgRORQHwuZWKz3xheyJfYRN/SbXXBNMNV00dEX52ayb2HARqWi0IRvCRpIcMjRF
	 Ejlxf5V8CDyGywbWxGcBl55bFvMmwSTEHub0bhDdLbQciP6wRZ4Tv1s3qi1JD27PZk9vr
	 JtHQwrqEHxlbti5OLIyiEQZGMouUj4oPcNkR7GRZqiEeb9XSqtGEvUvCvBFLXSGJyIRRa
	 vrf3/heeYMPOjxAcIec9RPPFxZJashbVWAzk9SJUcsnJe331ghhCC0DT5ICgMPzjFdFNx
	 fJMSXzZShSDypOt99NrT3kNetWjrZ2Q2IerCkmmtogNiJp0jrDkSD0De2pmQ4aCwzEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eY5KBAs9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9416E606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eY5KBAs9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7171B1F000C5;
	Tue, 17 Nov 2026 13:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794923643;
	bh=lqe4yka6zmdqmbIPGKAWwRM6Ez2dyujJozYgr8mnWDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eY5KBAs9g2p2pyhRfMC05yNEB9i4QMP4RZ52xLmzkFHeic3SQHVGfC5k81lP1elcJ
	 a2h9lSbPMCS6sghJIV0xdbvKooQZCxU7DIDnvdF4bBw4Hsm7urWSfMpG5SJCXKGP+U
	 5zR76H1WXzEl8Y7Ln89P1XbU9TXQNPgh9QaNgzmvEd/wix1cAGYXvbcWVeN9vfnbVm
	 h6WyByJ5dOekMOUi7TVfroPikXqhM9RkFsR05PShSryOwD+/xDjDV/VzXr5qNniPZC
	 te63dzrEOf2X0JqI6x/hPb4q+kd7LOpl+ut+KI03NfECMo6ekwyXBjfh7leCxEMpB4
	 6ty/RgWJtd3PA==
Date: Tue, 17 Nov 2026 13:53:56 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@kernel.org, riel@surriel.com, 
	liam@infradead.org, vbabka@kernel.org, harry@kernel.org, jannh@google.com, 
	lance.yang@linux.dev, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm: use memory barriers for non PMD-sized folios to
 sync
Message-ID: <avxb050XeV895evT@gremlin>
References: <6274e62645b9f176dd10d7a79e86b900a39cec5f.1794898535.git.baolin.wang@linux.alibaba.com>
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
In-Reply-To: <6274e62645b9f176dd10d7a79e86b900a39cec5f.1794898535.git.baolin.wang@linux.alibaba.com>

On Tue, Nov 17, 2026 at 03:00:30PM +0800, Baolin Wang wrote:
> Commit 243cf1f67b36 ("mm: memory: fix truncation removing mapped folios")
> uses PMD lock via sync_with_folio_pmd_zap() to synchronize when a cleared
> PMD is found while unmapping a folio.
>
> However, for non PMD-sized folios, the only PMD clear that can race with
> this unmap is PTE table reclaim, which clears the PMD only after the rmaps
> for the table have been removed. This is plain message passing, and taking
> the PMD lock is more than needed, like I did in the previous patch[1].

But it doesn't automatically mean that you _have_ to use fragile memory
barriers?

Correctness and robustness in the future are important right? You need to
justify this properly.

>
> Without barriers, the walker can observe the cleared PMD but a stale
> mapcount on weakly ordered architectures:

You mean without the PMD lock?

>
> CPU 0 (unmap folio)                 CPU 1 (MADV_DONTNEED, full PMD)
> ================================    ================================
> folio_lock()
>                                     lock(ptl)
>                                     clear PTEs
>                                     remove rmaps   /* W mapcount */
> [mapcount load satisfied early,
>  folio still mapped]
>                                     pmd_clear()    /* W pmd */
>                                     unlock(ptl)
> pmdp_get_lockless() -> none         /* R pmd */
> skip the PMD
> folio_mapped() -> true              /* R mapcount, stale */
> unmapping assumed to have failed
>
> Pairing an smp_wmb() before the PMD clear with an smp_rmb() after the
> PMD read forbids this outcome:
>
> CPU 0 (unmap folio)                 CPU 1 (MADV_DONTNEED, full PMD)
> ================================    ================================
>                                     remove rmaps   /* W mapcount */
>                                     smp_wmb()
>                                     pmd_clear()    /* W pmd */
> pmdp_get_lockless() -> none         /* R pmd */
> smp_rmb()
> folio_mapped()                      /* R mapcount */
>
> If R pmd observes W pmd, R mapcount must observe W mapcount, so
> folio_mapped() no longer reports the removed mappings.

This is insufficient IMO, you need to explain firstly why acquire/release isn't
feasible (presumably because you can't synchronise the clear properly that way).

>
> Pass a 'folio' parameter to sync_with_folio_pmd_zap(), allowing us to
> skip those pfn walkers: pfn_mkclean_range and mapping_wrprotect_range,
> which don't need synchronization.
>
> Similarly, skip sync for page_mapped_in_vma() since the subsequent
> operations don't check the folio's mapcount.
>
> No changes for PMD-sized folios unmapping.
>
> [1] https://lore.kernel.org/all/542c97482eae84f86704bcee56482633d1b32321.1791616645.git.baolin.wang@linux.alibaba.com/
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>

This replaces an easy-to-reason about lock with a very-hard-to-reason about
memory barriers that are fragile and could easily break resulting in subtle data
race bugs.

And you don't seem to have provided any perf numbers or anything to justify it
unless I'm missing something?

I'm a little uneasy about it honestly.

> ---
> Changes from v1:
>  - Pass in a folio for sync_with_folio_pmd_zap(), per David.
> ---
>  include/linux/rmap.h |  2 ++
>  mm/internal.h        | 26 ++++++++++++++++++++++----
>  mm/memory.c          | 12 ++++++++++--
>  mm/page_vma_mapped.c |  4 ++--
>  4 files changed, 36 insertions(+), 8 deletions(-)
>
> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
> index 74cca0e3c726..62e7341de179 100644
> --- a/include/linux/rmap.h
> +++ b/include/linux/rmap.h
> @@ -862,6 +862,7 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
>  #define PVMW_PGTABLE_CROSSED	(1 << 16)
>
>  struct page_vma_mapped_walk {
> +	struct folio *folio;
>  	unsigned long pfn;
>  	unsigned long nr_pages;
>  	pgoff_t pgoff;	/* Only meaningful if nr_pages > 1 and not a KSM walk */
> @@ -876,6 +877,7 @@ struct page_vma_mapped_walk {
>
>  #define DEFINE_FOLIO_VMA_WALK(name, _folio, _vma, _address, _flags)	\
>  	struct page_vma_mapped_walk name = {				\
> +		.folio = _folio,					\
>  		.pfn = folio_pfn(_folio),				\
>  		.nr_pages = folio_nr_pages(_folio),			\
>  		.pgoff = folio_pgoff(_folio),				\
> diff --git a/mm/internal.h b/mm/internal.h
> index cd3675c044e0..ad7e051cb198 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -592,6 +592,7 @@ void pmd_install(struct mm_struct *mm, pmd_t *pmd, pgtable_t *pte);
>   * sync_with_folio_pmd_zap - sync with concurrent zapping of folios
>   * @mm: The mm_struct.
>   * @pmdp: Pointer to the pmd that was found to be pmd_none().
> + * @folio: The folio being zapped.
>   *
>   * When we find a pmd_none() while unmapping a folio without holding the PTL,
>   * zap_huge_pmd() may have cleared the PMD but not yet updated the folio
> @@ -600,13 +601,30 @@ void pmd_install(struct mm_struct *mm, pmd_t *pmd, pgtable_t *pte);
>   * against later mapcount reads. Skipping the PMD without synchronization
>   * could make folio unmapping code assume that unmapping failed.
>   *
> - * Wait for concurrent zapping to complete by grabbing the PTL.
> + * Wait for concurrent zapping to complete by grabbing the PTL for PMD-sized
> + * folios, otherwise smp_rmb() is sufficient.
>   */
> -static inline void sync_with_folio_pmd_zap(struct mm_struct *mm, pmd_t *pmdp)
> +static inline void sync_with_folio_pmd_zap(struct mm_struct *mm,
> +		pmd_t *pmdp, struct folio *folio)
>  {
> -	spinlock_t *ptl = pmd_lock(mm, pmdp);
> +	if (folio_test_pmd_mappable(folio)) {
> +		spinlock_t *ptl = pmd_lock(mm, pmdp);
>
> -	spin_unlock(ptl);
> +		spin_unlock(ptl);
> +		return;
> +	}
> +
> +	/*
> +	 * For non PMD-sized folios zapping, concurrent zap_empty_pte_table()
> +	 * may clear the PMD after the rmaps for the table have been removed,
> +	 * but later mapcount reads could still be observed before the PMD
> +	 * read, making the folio appear to be still mapped after unmapping.
> +	 * Order the PMD read before later mapcount reads, so that observing
> +	 * the cleared PMD implies observing the rmap removals.
> +	 *

This also makes me very uneasy, complicated reasoning like this is asking for it
to break.

Also could this be smaller and clearer?

> +	 * Pairs with smp_wmb() in zap_pte_range().
> +	 */
> +	smp_rmb();
>  }
>
>  struct zap_details;
> diff --git a/mm/memory.c b/mm/memory.c
> index 529a9189e426..dcf205175f71 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2054,8 +2054,15 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
>  	 * Clear the PMD after the rmaps for the table have been removed, in case
>  	 * an incorrect mapcount is observed after unmapping the folio.
>  	 */
> -	if (can_reclaim_pt && direct_reclaim && addr == end)
> +	if (can_reclaim_pt && direct_reclaim && addr == end) {
> +		/*
> +		 * rmap changes need to be observed before page tables get zapped.
> +		 *
> +		 * Pairs with smp_rmb() in sync_with_folio_pmd_zap().
> +		 */
> +		smp_wmb();
>  		direct_reclaim = zap_empty_pte_table(mm, pmd, ptl, &pmdval);
> +	}
>  	pte_unmap_unlock(start_pte, ptl);
>
>  	/*
> @@ -2110,7 +2117,8 @@ static inline unsigned long zap_pmd_range(struct mmu_gather *tlb,
>  			/* fall through */
>  		} else if (pmd_none(*pmd)) {
>  			if (details && details->single_folio)
> -				sync_with_folio_pmd_zap(tlb->mm, pmd);
> +				sync_with_folio_pmd_zap(tlb->mm, pmd,
> +							details->single_folio);
>  			addr = next;
>  			continue;
>  		}
> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
> index a931243ca42b..9b72ac408c70 100644
> --- a/mm/page_vma_mapped.c
> +++ b/mm/page_vma_mapped.c
> @@ -294,8 +294,8 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>  			spin_unlock(pvmw->ptl);
>  			pvmw->ptl = NULL;
>  		} else if (!pmd_present(pmde)) {
> -			if (pvmw->flags & PVMW_SYNC)
> -				sync_with_folio_pmd_zap(mm, pvmw->pmd);
> +			if ((pvmw->flags & PVMW_SYNC) && pvmw->folio)
> +				sync_with_folio_pmd_zap(mm, pvmw->pmd, pvmw->folio);
>
>  			goto next_pmd;
>  		}
> --
> 2.47.3
>

--
Cheers, Lorenzo
