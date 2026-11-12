Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495025;
	b=NJqowmdC4ofsSwkmugZUMvm9ZL8Byj2dYsjNVrJTryabIEfM14OqhzZUvITWtWNM0lUz
	 BoqK4thA/92oFZBn7pbeYrXhF1Yqv4gSVXVC6/vtkUSPM6VB3wVCZEFlRMRv3RoVgzAp+
	 z8o44RDGIsbGM0DeplKoP1NrntWngbxa2NzTX/ctJQDVuP6bsrw2VJ+5bRvjyoBILPtu9
	 VIbzNM84OVBTO4BKeHZoEPSpqVRPby8C0Z3Tih7K/K2MGJOLIgV+22g92lEGMuWEgQSkN
	 z9MATF1EeN+1YM8/1XtnpS5n9VbU4D0PNWjUpPgCafMFzKX3tLExp8Hx9MGPjIToDKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495025;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=HCXPmaCthBgEXTrlaPcclc3/LLYGCPmdnrH+YjDkVHU=;
	b=TbmnoduWptykAv9QVpOoit7weXkNCDo0gIogOHqVHgUlSv59yE1byH605QkLmv5AtWcm
	 NmsLx+qnVR432/MX5B8mrQLhhohXToxEg67JXEo5FUjkI2BPoLtSDLu1ZgT5x72Q40jJ5
	 vQeCN6ZjQ3HfLv8hGJ8qXCwRbjHgiCZFF8F+wVkBrRWTuWdOnUNyi2YoZp6cTXxfBflg9
	 uAdEQFXPzhNGA4apd0wUntDlb+ZCNqPevanP+8KQWGIvQkigDenLVNPwYVGdRKKGKk8IC
	 O4YTkhTctxR9yVqhnBL2I1U24BX5WogkZD30xhkELVG6m2+loAicowcNdj6lrj7ly3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=sDx0tnxA;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2375606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:50:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2375606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=sDx0tnxA
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08CEC1516;
	Thu, 12 Nov 2026 06:50:21 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C3F63F673;
	Thu, 12 Nov 2026 06:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794495024; bh=+s0Rk/mSeWGvdAKtOlpf42pJMk09UK6Tn3e1uY2y7+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sDx0tnxAz6cFHnGuBZjLsrCMBsBbAbfeZPQMGJsLYhbLqDwLs2EUYLW7M8HzrRwBT
	 CwHQoI3Nv0y7lpgl6aHYYeXHXJ52UPC/+Ls4yZu5IXB9sUTzbupU5lRlyJ0/hQBTim
	 ShBwsGzEUr0BpshFL8STX2XSVIO/B4RQ0M8JyTSg=
Date: Thu, 12 Nov 2026 14:50:19 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Huang, Ying" <ying.huang@linux.alibaba.com>
Cc: Chris Down <chris@chrisdown.name>, Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org, kernel-team@meta.com,
	Mark Rutland <mark.rutland@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH] arm64: hugetlb: Prevent write fault livelocks on stale
 TLB entries
Message-ID: <avXSK0zKGttR0dEJ@arm.com>
References: <avPxZjjdBIlM_8_g@chrisdown.name>
 <87ld6yn3vx.fsf@DESKTOP-5N7EMDA>
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
In-Reply-To: <87ld6yn3vx.fsf@DESKTOP-5N7EMDA>

On Thu, Nov 12, 2026 at 11:08:02AM +0800, Huang, Ying wrote:
> Chris Down <chris@chrisdown.name> writes:
> 
> > In Meta production, we have had tasks get stuck in a fault loop while
> > using hugetlb on arm64. During my investigations I found that affected
> > tasks share a private hugetlb page.
> >
> > Looking at the stuck task states, I found the following ordering:
> >
> >   CPU0                                 CPU1
> >   ----                                 ----
> >   read page
> >   [read only entry cached in TLB]
> >                                        write page
> >                                        hugetlb_fault()
> >                                          hugetlb_wp()
> >                                          [reuse folio]
> >                                          set_huge_ptep_maybe_writable()
> >                                            set_huge_ptep_writable()
> >                                          [flush local TLB only]
> >
> >   write page using stale entry
> >   hugetlb_fault()
> >     huge_ptep_set_access_flags()
> >     [entry already writable, no flush]
> >   retry write using stale entry
> >   [fault indefinitely. well, that's not ideal!]
> >
> > The reason is that when a write fault makes a non-contiguous hugetlb
> > entry writable, it only invalidates the local TLB. However, another CPU
> > can keep the old read-only entry, so its write will fault even though
> > the page table already permits it. hugetlb_fault() then finds nothing to
> > change and leaves the stale entry in place, so the same write keeps
> > going round in circles.
> 
> Good catch!  Thanks!
> 
> > This is particularly bad because, if the kernel is copying to user
> > memory, the retry stays inside the kernel and the task can't act on the
> > pending signal.
> >
> > It can even remain unkillable while holding locks across the copy,
> > resulting in further failures. For example, a read into a hugetlb
> > buffer can hold the pipe mutex and block other users of the pipe until
> > the loop ends, causing cascading lockups across the machine.
> >
> > To fix this, when a write fault finds nothing to change in a
> > non-contiguous hugetlb entry, let's invalidate the local entry.
> >
> > Fixes: cb1fa2e99955 ("arm64, tlbflush: don't TLBI broadcast if page reused in write fault")
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Chris Down <chris@chrisdown.name>
> > ---
> >  arch/arm64/mm/hugetlbpage.c | 21 ++++++++++++++++++---
> >  1 file changed, 18 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> > index 8e799c1fe0aa..ff1f53e435e1 100644
> > --- a/arch/arm64/mm/hugetlbpage.c
> > +++ b/arch/arm64/mm/hugetlbpage.c
> > @@ -429,9 +429,24 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
> >  	VM_WARN_ON(!pte_present(pte));
> >  	ncontig = num_contig_ptes(huge_page_size(hstate_vma(vma)), &pgsize);
> >  
> > -	if (!pte_cont(pte))
> > -		return __ptep_set_access_flags_anysz(vma, addr, ptep, pte,
> > -						     dirty, pgsize);
> > +	if (!pte_cont(pte)) {
> > +		if (__ptep_set_access_flags_anysz(vma, addr, ptep, pte,
> > +						  dirty, pgsize))
> > +			return 1;
> > +
> > +		/*
> > +		 * Another CPU may have made the entry writable without
> > +		 * invalidating our stale read-only TLB entry. To avoid
> > +		 * indefinitely faulting on this entry, flush it.
> > +		 */
> > +		if (dirty)
> > +			__flush_hugetlb_tlb_range(vma, addr, addr + pgsize,
> > +						  pgsize,
> > +						  TLBF_NOWALKCACHE |
> > +						  TLBF_NOBROADCAST |
> > +						  TLBF_NONOTIFY);
> 
> IIUC, this is similar to fix_spurious_fault() for non-hugetlb folios.
> Can we use similar logic?

I think we should but that's something going forward, not as a
backportable fix. I'll take this patch for now and we can look into
wiring up something similar to fix_spurious_fault() for hugetlb.

Currently fix_spurious_fault() only handles pte/pmd faults, so we can't
simply do this:

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index da5d04edf7c1..e0e582f264e8 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6297,6 +6297,8 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 	if (huge_ptep_set_access_flags(vma, vmf.address, vmf.pte, vmf.orig_pte,
 						flags & FAULT_FLAG_WRITE))
 		update_mmu_cache(vma, vmf.address, vmf.pte);
+	else
+		fix_spurious_fault(vmf, PGTABLE_LEVEL_PTE);
 out_ptl:
 	spin_unlock(vmf.ptl);
 out_mutex:

because the pgtable level is not known to the core code. We'd need some
arch specific hooks and handle it in hugetlb.

With Chris's fix we just miss one more retry before invalidation. But
yes, having similar mechanism in the core code makes sense to me.

-- 
Catalin
