Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624314;
	b=w0wq8Gt/LjO67emp4wQTqMyVi8WEaMpGvK0EDm2to6SOPMlLGmUgDRacFddFHIS8+fq+
	 hn6mkyEbOcVVkdfZoetTj3jNVp3BEDItDBZjgGY48d7SQNLRIa6lIesQqMue7pr8lYSOs
	 nNjNamcyokSrHgWyrGMD7hwAH2MIV5cyzMtP06bV6FMzYgqnnZXzyR3yqnXQjDuSBCV4g
	 T59ZapvbGsTSYCuSCLp37AMDe3PlfbupVkrWlJ2cRINy771Xb9b5MRN03dwJKOPIf+4xm
	 N9+cLwvVIHLSoWZjqHkzSnLF3aaD1FxSZLoTwH1X8qZvGb0L69UNhsCmEWXfLSfUARQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624314;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=A55LxL5rZiBQoPqsIgU4SUYaOdIDejVyKaA5JG5v21k=;
	b=kuNxPFkeOT65P3mjISiv5lBsJ8GX2/4dnEXY4pBOcPXfD8hQdmOLuwn1CkuDt8IjH1/r
	 D+LiL7LcCWh0zcF9H98KtbZqBfcuCg5iqND/G9ZQ7lMevTMDAD4jeogtd2bgGiPlKiZCM
	 PD6HUSuqSwPKAb9SO8IZQ7xeVkVDUVlfcz4eEKkpxXLCqtlpIDEaqXgn19hRnwLNDJwzs
	 Huog5TYDCQyn9MSkIlwuKA6r+Z0qZ9UrzDxoHrK7ugf2swZ5c5WL5THMH2Dy222RnfSx0
	 dIwUsoEcjKAxG4PztmxbT27xwunOXU5LL0CjBgsyEcjDVzq2NyGQyYyPsxvJyiR+WMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=h1MBcrPN;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDF62606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:58:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDF62606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=h1MBcrPN
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4C131FC4;
	Mon,  2 Nov 2026 04:58:28 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 772563F59E;
	Mon,  2 Nov 2026 04:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793624311; bh=OpqLpqu6JUVcMgPsx1gdtS+Nt5xvn0q+76+HatrXhPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h1MBcrPNpf/gqbCTydTx1HH/aqR39F9ICnrFOTaBzrxi/PNUb/qQjkpmpDBfiEH18
	 dSUU5plg+8iefp0dPwVzh6lbFiXlCTU98ZBgN3qqAkNWbnmuzkezZy/Cx/hThxkk9m
	 VzLeB39Jt5QIsksKnu3RMx5NnZes0G0Y5R22PzxY=
Date: Mon, 2 Nov 2026 12:58:26 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Lorenzo Stoakes <ljs@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Rik van Riel <riel@surriel.com>,
	Yuan-Hao Hsu <aa9736195201@gmail.com>
Subject: Re: [PATCH v2 2/4] mm: internal: fix inconsistent in
 folio_pte_batch_flags() for shadow stack
Message-ID: <auiI8jzumVHmmSV9@e129823.arm.com>
References: <20261102-refactor_gup_fast-v2-0-bc1ac018c834@arm.com>
 <20261102-refactor_gup_fast-v2-2-bc1ac018c834@arm.com>
 <85c4a87b-2c8b-4ef5-bb30-6518080f8be0@kernel.org>
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
In-Reply-To: <85c4a87b-2c8b-4ef5-bb30-6518080f8be0@kernel.org>

On Mon, Nov 02, 2026 at 01:10:21PM +0100, David Hildenbrand (Arm) wrote:
> On 11/2/26 12:30, Yeoreum Yun wrote:
> > In x86, shadow stack PTE is marked with PAGE_RW=0 and PAGE_DIRTY=1.
> > If the shadow stack pte entry is consequence with the read-only pte
> > like PAGE_RW=0 and PAGE_DIRTY=0, folio_pte_batch_flags()
> > with FPB_RESPECT_WRITE without FPB_RESPECT_DIRTY considers both are
> > the same.
> > 
> > To address this, save the first pte's writable and compare subsequence
> > pte's writablity with pte_write() when FPB_RESPECT_WRITE is set
> > without FPB_RESPECT_DIRTY.
> 
> 
> I think this should be patch #1 and likely carry a Fixes: tag.

I see. I'll move and add Fixes tag.

> 
> I think we can already create an inconsistency by using a mixture of
> 
> * MADV_HUGEPAGE (overwrite for nohugepage for shadow stack)
> * MADV_DONTFORK + fork() + MADV_DOFORK
> * FPB_RESPECT_WRITE users
> 
> Not that it would matter in practice.

True. but it's possible anyway... without alternative suggestion.

> 
> > 
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >  mm/internal.h | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> > 
> > diff --git a/mm/internal.h b/mm/internal.h
> > index 35016b1afc8bf..b4d0df4c35adf 100644
> > --- a/mm/internal.h
> > +++ b/mm/internal.h
> > @@ -418,7 +418,7 @@ static inline unsigned int folio_pte_batch_flags(struct folio *folio,
> >  		struct vm_area_struct *vma, pte_t *ptep, pte_t *ptentp,
> >  		unsigned int max_nr, fpb_t flags)
> >  {
> > -	bool any_writable = false, any_young = false, any_dirty = false;
> > +	bool any_writable = false, any_young = false, any_dirty = false, writable;
> >  	pte_t expected_pte, pte = *ptentp;
> >  	unsigned int nr, cur_nr;
> >  
> > @@ -438,6 +438,7 @@ static inline unsigned int folio_pte_batch_flags(struct folio *folio,
> >  
> >  	nr = pte_batch_hint(ptep, pte);
> >  	expected_pte = __pte_batch_clear_ignored(pte_advance_pfn(pte, nr), flags);
> > +	writable = !!pte_write(pte);
> >  	ptep = ptep + nr;
> >  
> >  	while (nr < max_nr) {
> > @@ -446,6 +447,16 @@ static inline unsigned int folio_pte_batch_flags(struct folio *folio,
> >  		if (!pte_same(__pte_batch_clear_ignored(pte, flags), expected_pte))
> >  			break;
> >  
> > +		/*
> > +		 * x86 shadow-stack PTEs encode writability as RW=0, DIRTY=1.
> > +		 * Without FPB_RESPECT_DIRTY, __pte_batch_clear_ignored()
> > +		 * considers shadow-stack PTE as the same with subsequent
> > +		 * ordinary read-only PTEs. Therefore, check whether pte writable.
> > +		 */
> 
> That information doesn't really belong in here in that detail level.
> "/* pte_mkclean() can remove the writable bit in some cases. */"
> 

I see. I'll change with simple as you suggest.

> > +		if (unlikely((flags & (FPB_RESPECT_WRITE | FPB_RESPECT_DIRTY)) == FPB_RESPECT_WRITE &&
> > +			     writable != !!pte_write(pte)))
> 
> It might be nicer and more efficient to track if any was readonly/not-writable and
> 
> 	any_unwritable = !pte_write(pte);
> 
> And checking once after the loop.

Sorry. But I couldn't follow. If we accumalate with any_unwritable
and check it out of loop once only, we couldn't properly nr value or
Am I missing something?

> 
> 
> I checked and we cannot really fix x86 without an additional sw bit to remember
> "shadow stack PTE".

Agree.

> 
> As discussed, the simpler alternative would be to just disallow large folios in
> shadow stacks entirely for now, given that vm_mmap_shadow_stack() already
> disables large folios explicitly.
> 
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 4b71d010b2aff..9a2dc90ef9690 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -367,6 +367,9 @@ int hugepage_madvise(struct vm_area_struct *vma,
>  {
>         switch (advice) {
>         case MADV_HUGEPAGE:
> +               /* PTE batching doesn't work reliably. */
> +               if (vma_test_single_mask(vma, VMA_SHADOW_STACK))
> +                       break;
>                 *vm_flags &= ~VM_NOHUGEPAGE;
>                 *vm_flags |= VM_HUGEPAGE;
>                 break;
> 

Yeap. once we do this, we don't need to this fix patch anyway.
But I don't know whether there is practical case changing the
VMA_SHADOW_STACK with huge though it is initailised with NOHUGE.

> -- 
> Cheers,
> 
> David

-- 
Sincerely,
Yeoreum Yun
