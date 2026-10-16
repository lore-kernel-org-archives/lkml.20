Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DF7582B9A
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792172187; cv=none; b=fq1MSoEFoXhcr9J3Q6eekD/STdL0t5pLlhVeYAVTCHoPBlHf8x9SUFSipIN//4yoXTRsz/TpGJxDNPRPo13nnwH/oewkDvFrAgng+mfzgqaEFQUHzMmFilajZ+n3QweUPAFWmTgLPecMvKh1SVdV2AONYYOCjVybdxXFFx0+K2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792172187; c=relaxed/simple;
	bh=3K5sGWL0wtNoZk9FhEe/EuWylgGORTg+X0FAmVSMFhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKVEyWKP6FUuK4LMYC5md8jCPTEkMrqRoAlxMNtCZXSZOTzWvWrWy2X4JCa9z0sF0FPSbaAzn+ljy2K34ZHLrRDPI5Cbl4VLDIwBML63sayFJoRCseeonA46l6bBVHD/gVRfAVqHndSVHPFlqEUWazVI7iDhyIPCiAew565xHsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cgnED+Me; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cgnED+Me"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 277BA1F000C4;
	Fri, 16 Oct 2026 17:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792172186;
	bh=YMbJwCRP8ZZxt3NEiXPg55lY8UcPeUjTprnohFKVbL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cgnED+MeE+BVnu7FMkB11A2u5LnsuWVHRNtqiFCCMnmKPvj8sMTGZjS0v+3mPwCSI
	 niostZ9UZKpPxZKiwSvov01qUzA051EHLue12Qaz9nnjlodsaXO0GhIWvf+tabHYZ7
	 fKNytXo1Ce9IzWEvHcsQS0WKjt7T1D2WXOgmDLTMIckEmYPHNiVEXZGgg2QF9zoUqt
	 e3PhTFI/cQYx/ApyBEMCqyGsbXmlXz/x0cZT68S2ReUvo1athbOrAZMTK0tp4KDG5Y
	 y8qDdfJx/rzehmzWSVOFXti9Ri1uSjcz7bqubQ3FuVgxomyIQU0/ojQ9GqlISbchR1
	 rU4l3ipSOs8Uw==
Date: Fri, 16 Oct 2026 18:36:15 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	qi.zheng@linux.dev, jack@suse.cz, pfalcato@suse.de, ayushr@modal.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mm: memory: fix truncation removing mapped folios
Message-ID: <atIsNGVDcWtznMKi@gremlin>
References: <e2f76ed117b0c22a26b7688fd46a38c9d035336e.1792114445.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2f76ed117b0c22a26b7688fd46a38c9d035336e.1792114445.git.baolin.wang@linux.alibaba.com>

On Fri, Oct 16, 2026 at 09:48:08AM +0800, Baolin Wang wrote:
> Ayush reported an issue that shmem/tmpfs folios are still mapped when
> truncating them on production:
> "
> BUG: Bad page cache in process ...  pfn:...
> page dumped because: still mapped when deleted
> "
>
> I reproduced the issue with Ayush's reproducer [1] with the latest mm-unstable
> branch, and I got the following crash info. From the dump message, we can
> see that truncate_inode_folio() is really trying to remove mapped folios,
> which is incorrect.
>
> "
> [  189.171977] page: refcount:3 mapcount:1 mapping:00000000fe168ee1
> index:0x3880 pfn:0x191647
> [  189.171995] memcg:ffff0000cc073d40
> [  189.171997] aops:shmem_aops ino:3c01 dentry name(?):"memfd:runsc-memory"
> [  189.172006] flags: 0x17fffef0002022d(locked|referenced|uptodate|lru|
> workingset|swapbacked|node=0|zone=2|lastcpupid=0x3ffff)
> .......
> [  189.172017] page dumped because: VM_BUG_ON_FOLIO(folio_mapped(folio))
> [  189.172026] ------------[ cut here ]------------
> [  189.172027] kernel BUG at mm/filemap.c:155!
> [  189.172057] Internal error: Oops - BUG: 00000000f2000800 [#1]  SMP
> .......
> [  189.177721] CPU: 3 UID: 0 PID: 5521 Comm: repro Kdump: loaded Tainted:
> 7.3.0-rc4+ #277 PREEMPT(lazy)
> .......
> [  189.183986] Call trace:
> [  189.184124]  filemap_unaccount_folio+0xf0/0x1e8 (P)
> [  189.184391]  __filemap_remove_folio+0x34/0x160
> [  189.184633]  filemap_remove_folio+0x4c/0xb0
> [  189.184859]  truncate_inode_folio+0x34/0x58
> [  189.185087]  shmem_undo_range+0x220/0x658
> [  189.185308]  shmem_fallocate+0x2f0/0x470
> [  189.185527]  vfs_fallocate+0x128/0x328
> ......
> [  189.187078]  el0t_64_sync+0x184/0x188
> "
>
> After analysis, I believe the race exists between truncation and MADV_DONTNEED,
> and shmem's ->map_pages() merely makes the issue easier to reproduce. Since
> MADV_DONTNEED synchronously releases the pagetable page before calling
> tlb_flush_rmaps(), this could cause another thread's truncation to skip
> zap_pte_range() (due to pmd is none) but still observe the folio's mapcount
> as non-zero. A possible race scenario is as follows:
>
> CPU 0                           CPU 1
> shmem_fallocate                 madvise_dontneed_single_vma
>   unmap_mapping_range            .......
>   ......
>   (filemap_map_pages() remap folios)
> 				  zap_pte_range
>   truncate_inode_folio		    zap_empty_pte_table(pmd clear)
>     unmap_mapping_folio
>     ......
>       zap_pmd_range (saw pmd none, skip)
>
>   filemap_remove_folio
>     BUG_ON(folio_mapped)
>                                     tlb_flush_rmaps(remove rmaps)
>
> To fix this issue, we should move the pmd clear operation (via zap_empty_pte_table())
> to after tlb_flush_rmaps() and use sync_with_folio_pmd_zap() to sync with
> concurrent zapping, so that when we find a pmd_none() while unmapping a folio
> without holding the PTL, the folio's mappings are guaranteed to have been
> removed via tlb_flush_rmaps().
>
> [1] https://lore.kernel.org/all/20260925065013.3682431-1-ayushr@modal.com/
> Reported-by: Ayush Ranjan <ayushr@modal.com>
> Closes: https://lore.kernel.org/all/20260924061708.1645968-1-ayushr@modal.com/
> Fixes: 6375e95f381e ("mm: pgtable: reclaim empty PTE page in madvise(MADV_DONTNEED)")
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>

With nits addressed LGTM, so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
> Changes from v2:
>  - Use use sync_with_folio_pmd_zap() to sync with concurrent zapping (Per David).
> Changes from v1:
>  - Add an smp_rmb() to pair with the smp_wmb() (Per Lorenzo and Pedro).
> ---
>  mm/internal.h |  9 +++++----
>  mm/memory.c   | 25 ++++++++++++-------------
>  2 files changed, 17 insertions(+), 17 deletions(-)
>
> diff --git a/mm/internal.h b/mm/internal.h
> index 0434dfcfc36f..6d8f494296a4 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -585,14 +585,15 @@ void free_pgtables(struct mmu_gather *tlb, struct unmap_desc *desc);
>  void pmd_install(struct mm_struct *mm, pmd_t *pmd, pgtable_t *pte);
>
>  /**
> - * sync_with_folio_pmd_zap - sync with concurrent zapping of a folio PMD
> + * sync_with_folio_pmd_zap - sync with concurrent zapping of folios
>   * @mm: The mm_struct.
>   * @pmdp: Pointer to the pmd that was found to be pmd_none().
>   *
>   * When we find a pmd_none() while unmapping a folio without holding the PTL,
> - * zap_huge_pmd() may have cleared the PMD but not yet modified the folio to
> - * indicate that it's unmapped. Skipping the PMD without synchronization could
> - * make folio unmapping code assume that unmapping failed.
> + * zap_huge_pmd() or zap_empty_pte_table() may have cleared the PMD but not
> + * yet modified the mapped folios to indicate they are unmapped. Skipping the
> + * PMD without synchronization could make folio unmapping code assume that
> + * unmapping failed.

'zap_empty_pte_table() may have cleared the PMD but not yet modified the mapped
folios'

Is that accurate after the patch?

You run tlb_flush_rmaps() before zap_empty_pte_table() now, and thus
folio_remove_rmap_ptes() ran for every folio by then.

Maybe something like:

	"zap_huge_pmd() may have cleared the PMD but not yet updated the
	 folio mapcount, and zap_empty_pte_table() clears the PMD only
	 after the rmaps for the table have been removed, but nothing
	 orders the pmd_none() read against later mapcount
	 reads. Skipping... <etc.>"

>   *
>   * Wait for concurrent zapping to complete by grabbing the PTL.
>   */
> diff --git a/mm/memory.c b/mm/memory.c
> index 6a8e7772b8d6..8f7ba427371b 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2036,6 +2036,15 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
>  		}
>  	} while (pte += nr, addr += PAGE_SIZE * nr, addr != end);
>
> +	add_mm_rss_vec(mm, rss);
> +	lazy_mmu_mode_disable();
> +
> +	/* Do the actual TLB flush before dropping ptl */
> +	if (force_flush) {
> +		tlb_flush_mmu_tlbonly(tlb);
> +		tlb_flush_rmaps(tlb, vma);
> +	}
> +

Maybe worth a comment here about ordering?

>  	/*
>  	 * Fast path: try to hold the pmd lock and unmap the PTE page.
>  	 *
> @@ -2046,15 +2055,6 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
>  	 */
>  	if (can_reclaim_pt && direct_reclaim && addr == end)
>  		direct_reclaim = zap_empty_pte_table(mm, pmd, ptl, &pmdval);
> -
> -	add_mm_rss_vec(mm, rss);
> -	lazy_mmu_mode_disable();
> -
> -	/* Do the actual TLB flush before dropping ptl */
> -	if (force_flush) {
> -		tlb_flush_mmu_tlbonly(tlb);
> -		tlb_flush_rmaps(tlb, vma);
> -	}
>  	pte_unmap_unlock(start_pte, ptl);
>
>  	/*
> @@ -2102,12 +2102,11 @@ static inline unsigned long zap_pmd_range(struct mmu_gather *tlb,
>  				continue;
>  			}
>  			/* fall through */
> -		} else if (details && details->single_folio &&
> -			   folio_test_pmd_mappable(details->single_folio) &&
> -			   next - addr == HPAGE_PMD_SIZE && pmd_none(*pmd)) {
> -			sync_with_folio_pmd_zap(tlb->mm, pmd);
>  		}

I think David's getting at (correct me if I'm wrong) doing:

	} else if (details && details->single_folio && pmd_none(*pmd)) {
		sync_with_folio_pmd_zap(tlb->mm, pmd);
	}

Here, rather than folding into the below?

I think that's neater also.

> +
>  		if (pmd_none(*pmd)) {
> +			if (details && details->single_folio)
> +				sync_with_folio_pmd_zap(tlb->mm, pmd);
>  			addr = next;
>  			continue;
>  		}
> --
> 2.47.3
>

--
Cheers, Lorenzo
