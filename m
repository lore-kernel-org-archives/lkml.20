Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9045E347533
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 21:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790545548; cv=none; b=QDamWh2t2ukpuXbf0yQsszwp7vsE39i8zYLkbHz7+ouGyIFmsIN6pzjvRzPX6d+9q3Y8tFyHIX1/hWKvn2/98xai4tXjWZocmnmvl5SVxze9EWHRsEeMNLRoFD/lcUeyoaf6vf1LuFS/j2mnSgextk+c2dE/p44wkl1yZwyIOlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790545548; c=relaxed/simple;
	bh=azwrZ+i5vfUrjmJKBZkd85wr8AX7kXLYVEhDIxrUF30=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=X1ZrqsY0s76SpLSaV3Hww7V//iALc4liF0XgRkU3Rl+5LXUF+pUvgQxtbb5HZRaPcHf6WqlICXXS4/4lhhetjxxSEHrh5GuNAuSZGLz8zR1T10d2yf9jhTeNUiC5agxPoYdkPnQPmZbJDrQ/psRcESstZZMdBh8bJVIfTXiQVO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QaJRi6ZQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QaJRi6ZQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA0B31F000FF;
	Sun, 27 Sep 2026 21:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1790545547;
	bh=KGNdxSSdZkDgEWIxbIrSONNvgQ0foWsTVx0VRCiF5LY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=QaJRi6ZQjZOcqFIQsABru6Fxu7eHrYrTmN+siAsqk6ml3AhbO3meqysbRPj+lNI9d
	 5s0Dt/o+tP2L/+sk7+SIhi8NR++NyRXnq9jc9lXF3inCKDMhOWT+0txtKu+Tn4kNy6
	 l8A7g6vag+IL1N22uGqH8srlrVQFjO3G3rKtOAFI=
Date: Sun, 27 Sep 2026 14:45:46 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Gregory Price <gourry@gourry.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
 liam@infradead.org, ljs@kernel.org, david@kernel.org, vbabka@kernel.org,
 jannh@google.com, ziy@nvidia.com, joshua.hahnjy@gmail.com,
 rakie.kim@sk.com, ying.huang@linux.alibaba.com, peterx@redhat.com,
 jgg@ziepe.ca, sashiko-bot <sashiko-bot@kernel.org>
Subject: Re: [PATCH v3 0/2] mm: stop calling pmd_folio() on special PMDs
Message-Id: <20260927144546.5141169bddc0ff1868c8ec17@linux-foundation.org>
In-Reply-To: <20260926105110.2156652-1-gourry@gourry.net>
References: <20260926105110.2156652-1-gourry@gourry.net>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 26 Sep 2026 06:51:08 -0400 Gregory Price <gourry@gourry.net> wrote:

> Two page table walkers resolve the folio behind a PMD with pmd_folio(),
> which is only valid for a PMD mapping a refcounted struct page:
> 
>   madvise_cold_or_pageout_pte_range()   mm/madvise.c
>   queue_folios_pmd()                    mm/mempolicy.c
> 
> vmf_insert_pfn_pmd() installs special PMDs holding a raw pfn that need not
> have a memmap entry at all.  Both walkers can reach one and fault on the
> first folio field read.  The PTE halves of both already use
> vm_normal_folio(); these two patches make the PMD halves match.
> 
> The four callers of vmf_insert_pfn_pmd(), and which walker each reaches:
> 
>   drivers/vfio/pci/vfio_pci_core.c        VM_PFNMAP     mempolicy
>   drivers/gpu/drm/drm_gem_shmem_helper.c  VM_PFNMAP     mempolicy
>   drivers/gpu/drm/panthor/panthor_gem.c   VM_PFNMAP     mempolicy
>   drivers/hv/mshv_vtl_main.c              VM_MIXEDMAP   both
> 
> can_madv_lru_vma() rejects VM_PFNMAP, so only mshv_vtl_low reaches the
> madvise walker, and that needs CAP_SYS_ADMIN.  queue_pages_walk_ops
> supplies its own ->test_walk, so walk_page_test()'s generic VM_PFNMAP skip
> never runs and vfio-pci is reachable by any process holding the device fd.
> Hence the different stable tags.
> 
> One behaviour change: mbind(MPOL_MF_STRICT) over a PMD mapped VM_PFNMAP
> region now returns 0 rather than -EIO.  The PTE loop already returned 0
> there.  drm_gem_shmem and panthor are where this is observable, since they
> PMD map pages that do have a memmap entry and so never faulted.

Thanks, I've updated mm-unstable to this version.

> v3: improvements from Lorenzo

Here's how v3 altered mm.git:


 mm/mempolicy.c |    9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

--- a/mm/mempolicy.c~b
+++ a/mm/mempolicy.c
@@ -668,7 +668,7 @@ static inline bool queue_folio_required(
 }
 
 static void queue_folios_pmd(pmd_t *pmd, unsigned long addr,
-			     struct mm_walk *walk)
+		struct mm_walk *walk)
 {
 	struct folio *folio;
 	struct queue_pages *qp = walk->private;
@@ -680,12 +680,7 @@ static void queue_folios_pmd(pmd_t *pmd,
 		return;
 	}
 	folio = vm_normal_folio_pmd(walk->vma, addr, pmdval);
-	if (!folio) {
-		if (is_huge_zero_pmd(pmdval))
-			walk->action = ACTION_CONTINUE;
-		return;
-	}
-	if (folio_is_zone_device(folio))
+	if (!folio || folio_is_zone_device(folio))
 		return;
 	if (!queue_folio_required(folio, qp))
 		return;
_

