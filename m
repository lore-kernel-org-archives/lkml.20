Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627163;
	b=fCgi/lVol4MrwyvJGqDHBe/f3ukBSgWzdUWND3P5I27s7hOUA+cTsVZjK6t7UuX2g/Mq
	 Z6mE9S2KzxrSyYBPaZxF2O/cCY293Jw6n1hFQSPfGUsHYJx/M7bxOVBhX9aZEVOaFNcg7
	 sUZxO+JAOv7va+iR4IMxOi927hHyspIOFO1aGc6BJPyr5oLGPiPMigiekTVRRoF5cIb0i
	 XM+V6m0OyGP5mCT6u/iZVBbUaLbt16APTvN0XYF3ABBywUuBSkMijh5mjiqlUeXZltA+b
	 XuPxuA2ver1e9F3UK4ys2lwioeFCrIKMd41B/b4ExhLnLUtF+OcrpvdCm70vgfzk7iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627163;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=neXC6d4EWQwZ+yifS+fK2WFD0pggnBVqEPoox7vx5m8=;
	b=wrg/8/gpln8Zxw79IURgCewobEn58CVUBTAXlnaq3g17ficxBAgGbGgguoPtyE04B6Fm
	 EX7mgJG1IOSOrn3yWUxSLDN0JDmaOB49oE0sTjxvT9WLv3AeHhcfbAnGVsrcaM/swOM8Z
	 r6S8y4L3zs0sjGOlKqz67pF5Iaq+WluTTdKg045eI3ma7jKVcWFbhD7ncdCSsE7+jJc4p
	 hkm3YqTRzOsA9eVN3PRlRGddqwNzppTb23SeDDuwLyESsbD6x8P0kK2LJ6zqGD5n5W9sL
	 oJSxJPbUhfxTTjmPKNtHOSjwVaqIzl/4QsxeycWoGfnJWU588J5r994l9wruCTV8s8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="ue1ws/Sc";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273E560A260F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:46:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 273E560A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ue1ws/Sc
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30CED1595;
	Mon,  2 Nov 2026 05:45:58 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E530D3F673;
	Mon,  2 Nov 2026 05:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793627161; bh=fZSZ6MB08kTtvX/igX5bE0NKnkORa6wfmDq57AKqELQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ue1ws/Sc866Fc5NSmv5uMqfh2NjXn5xVtmwW/swW6t0NcN1vx+V6akc7yFu1ps1eQ
	 /dN93sCWVLy/CBxjQu9aR9OXSElgm8jhlXl9zljN8QoiyniJBvqhuAsAUGfHKZiHYt
	 C2GYimd4IBGjCzKIe/1k2Rake0VviytMRe6NXD6k=
Date: Mon, 2 Nov 2026 13:45:56 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Rik van Riel <riel@surriel.com>,
	Yuan-Hao Hsu <aa9736195201@gmail.com>
Subject: Re: [PATCH v2 1/4] mm: gup: introduce gup_unshared_pages()
Message-ID: <auiUFIM_4Bk0gjwP@e129823.arm.com>
References: <20261102-refactor_gup_fast-v2-0-bc1ac018c834@arm.com>
 <20261102-refactor_gup_fast-v2-1-bc1ac018c834@arm.com>
 <5feb82ef-a9bc-4ef3-b056-9732563e6225@kernel.org>
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
In-Reply-To: <5feb82ef-a9bc-4ef3-b056-9732563e6225@kernel.org>

> On 11/2/26 12:30, Yeoreum Yun wrote:
> > This is preparatory patch to make gup_fast_pte_range() batchable.
> > 
> > Introduce gup_unshared_pages() to count consecutive pages within a folio
> > that do not require unsharing, and use it to implement gup_must_unshare().
> > 
> > Also add a folio argument to gup_must_unshare() so callers can reuse an
> > existing folio and avoid the compound_head() call implicit in PageAnon().
> > 
> > There is no functional change.
> > 
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >  mm/gup.c      | 69 +++++++++++++++++++++++++++++++++++++++++++++++++++++------
> >  mm/internal.h | 49 ++++++------------------------------------
> >  2 files changed, 70 insertions(+), 48 deletions(-)
> > 
> > diff --git a/mm/gup.c b/mm/gup.c
> > index 7d43ce717b246..49681f63950ec 100644
> > --- a/mm/gup.c
> > +++ b/mm/gup.c
> > @@ -633,6 +633,59 @@ static struct page *no_page_table(struct vm_area_struct *vma,
> >  	return NULL;
> >  }
> >  
> > +unsigned long gup_unshared_pages(struct vm_area_struct *vma, unsigned int flags,
> > +				 struct folio *folio, struct page *page,
> > +				 unsigned long nr_pages)
> 
> Two tab indent.

Okay.

> 
> 
> This function should be static.

Acked.

> 
> As a prerequisite patch you should move gup_unshared_pages() into this file.
> 
> $ git grep gup_must_unshare
> include/linux/rmap.h:    * gup_must_unshare().
> include/linux/rmap.h:    * gup_must_unshare().
> mm/gup.c:       if (!pud_write(pud) && gup_must_unshare(vma, flags, page))
> mm/gup.c:       if (!pmd_write(pmdval) && gup_must_unshare(vma, flags, page))
> mm/gup.c:       if (!pte_write(pte) && gup_must_unshare(vma, flags, page)) {
> mm/gup.c:               if (!pte_write(pte) && gup_must_unshare(NULL, flags, page)) {
> mm/gup.c:       if (!pmd_write(orig) && gup_must_unshare(NULL, flags, &folio->page)) {
> mm/gup.c:       if (!pud_write(orig) && gup_must_unshare(NULL, flags, &folio->page)) {
> mm/internal.h:static inline bool gup_must_unshare(struct vm_area_struct *vma,

Might you want move gup_must_unshared() into gup.c from internal.h
I'll do.

> 
> 
> I'm not 100% happy about the function name due to the !folio_test_anon()+!FOLL_LONGTERM
> path, but cannot think of something better.

True.

> 
> > +{
> > +	unsigned int i;
> > +
> > +	/*
> > +	 * FOLL_WRITE is implicitly handled correctly as the page table entry
> > +	 * has to be writable -- and if it references (part of) an anonymous
> > +	 * folio, that part is required to be marked exclusive.
> > +	 */
> > +	if ((flags & (FOLL_WRITE | FOLL_PIN)) != FOLL_PIN)
> > +		return nr_pages;
> > +	/*
> > +	 * Note: PageAnon(page) is stable until the page is actually getting
> 
> You are not calling PageAnon() anymore.

Yes. I'll remove it.

> /* folio_test_anon(folio) is stable until folio gets freed. */
> 
> > +	 * freed.
> > +	 */
> > +	if (!folio_test_anon(folio)) {
> > +		/*
> > +		 * We only care about R/O long-term pining: R/O short-term
> > +		 * pinning does not have the semantics to observe successive
> > +		 * changes through the process page tables.
> > +		 */
> > +		if (!(flags & FOLL_LONGTERM))
> > +			return nr_pages;
> > +
> > +		/* We really need the vma ... */
> > +		if (!vma || vma_is_cow_mapping(vma))
> > +			return 0;
> > +
> > +		/*
> > +		 * ... because we only care about writable private ("COW")
> > +		 * mappings where we have to break COW early.
> > +		 */
> > +		return nr_pages;
> > +	}
> > +
> > +	/* Paired with a memory barrier in folio_try_share_anon_rmap_*(). */
> > +	if (IS_ENABLED(CONFIG_HAVE_GUP_FAST))
> > +		smp_rmb();
> > +
> > +	/*
> > +	 * Note that KSM pages cannot be exclusive, and consequently,
> > +	 * cannot get pinned.
> > +	 */
> > +	for (i = 0; i < nr_pages; i++) {
> > +		if (!PageAnonExclusive(page + i))
> > +			return i;
> > +	}
> > +
> > +	return nr_pages;
> > +}
> > +
> >  #ifdef CONFIG_PGTABLE_HAS_HUGE_LEAVES
> >  /* FOLL_FORCE can write to even unwritable PUDs in COW mappings. */
> >  static inline bool can_follow_write_pud(pud_t pud, struct page *page,
> > @@ -668,7 +721,8 @@ static struct page *follow_huge_pud(struct vm_area_struct *vma,
> >  	pfn += (addr & ~PUD_MASK) >> PAGE_SHIFT;
> >  	page = pfn_to_page(pfn);
> >  
> > -	if (!pud_write(pud) && gup_must_unshare(vma, flags, page))
> > +	if (!pud_write(pud) &&
> > +	    gup_must_unshare(vma, flags, page_folio(page), page))
> >  		return ERR_PTR(-EMLINK);
> 
> There is already another instance of page_folio(page) int his file. Use a local
> variable and have one folio lookup. (that's the whole reason for passing a folio)

Okay. I'll merge.

> 
> >  
> >  	ret = try_grab_folio(page_folio(page), 1, flags);
> > @@ -722,7 +776,8 @@ static struct page *follow_huge_pmd(struct vm_area_struct *vma,
> >  	if (pmd_protnone(*pmd) && !gup_can_follow_protnone(vma, flags))
> >  		return NULL;
> >  
> > -	if (!pmd_write(pmdval) && gup_must_unshare(vma, flags, page))
> > +	if (!pmd_write(pmdval) &&
> > +	    gup_must_unshare(vma, flags, page_folio(page), page))
> >  		return ERR_PTR(-EMLINK);
> 
> Dito.

Acked.

> 
> >  
> >  	VM_WARN_ON_ONCE_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
> > @@ -846,7 +901,7 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
> >  	}
> >  	folio = page_folio(page);
> >  
> > -	if (!pte_write(pte) && gup_must_unshare(vma, flags, page)) {
> > +	if (!pte_write(pte) && gup_must_unshare(vma, flags, folio, page)) {
> >  		page = ERR_PTR(-EMLINK);
> >  		goto out;
> >  	}
> > @@ -2892,7 +2947,7 @@ static unsigned long gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp,
> >  			goto pte_unmap;
> >  		}
> >  
> > -		if (!pte_write(pte) && gup_must_unshare(NULL, flags, page)) {
> > +		if (!pte_write(pte) && gup_must_unshare(NULL, flags, folio, page)) {
> >  			gup_put_folio(folio, 1, flags);
> >  			goto pte_unmap;
> >  		}
> > @@ -2969,7 +3024,8 @@ static unsigned long gup_fast_pmd_leaf(pmd_t orig, pmd_t *pmdp,
> >  		gup_put_folio(folio, nr_pages, flags);
> >  		return 0;
> >  	}
> > -	if (!pmd_write(orig) && gup_must_unshare(NULL, flags, &folio->page)) {
> > +	if (!pmd_write(orig) &&
> > +	    gup_must_unshare(NULL, flags, folio, &folio->page)) {
> 
> 
> This only works because we don't have PMD mappings of things that are larger than PMDs.
> 
> While at it, pass the proper page.

Okay. I'll change with pmd_page(orig).

> 
> >  		gup_put_folio(folio, nr_pages, flags);
> >  		return 0;
> >  	}
> > @@ -3011,7 +3067,8 @@ static unsigned long gup_fast_pud_leaf(pud_t orig, pud_t *pudp,
> >  		return 0;
> >  	}
> >  
> > -	if (!pud_write(orig) && gup_must_unshare(NULL, flags, &folio->page)) {
> > +	if (!pud_write(orig) &&
> > +	    gup_must_unshare(NULL, flags, folio, &folio->page)) {
> 
> Dito.

Acked.

> 
> >  		gup_put_folio(folio, nr_pages, flags);
> >  		return 0;
> >  	}
> > diff --git a/mm/internal.h b/mm/internal.h
> > index c53c369bf8b5d..35016b1afc8bf 100644
> > --- a/mm/internal.h
> > +++ b/mm/internal.h
> > @@ -1282,6 +1282,10 @@ int migrate_device_coherent_folio(struct folio *folio);
> >  int __must_check try_grab_folio(struct folio *folio, int refs,
> >  				unsigned int flags);
> >  
> > +unsigned long gup_unshared_pages(struct vm_area_struct *vma, unsigned int flags,
> > +				 struct folio *folio, struct page *page,
> > +				 unsigned long nr_pages);
> > +
> >  /*
> >   * mm/huge_memory.c
> >   */
> > @@ -1354,51 +1358,12 @@ enum {
> >   * to fallback to the slow path just to lookup the vma.
> >   */
> >  static inline bool gup_must_unshare(struct vm_area_struct *vma,
> > -				    unsigned int flags, struct page *page)
> > +				    unsigned int flags,
> > +				    struct folio *folio, struct page *page)
> 
> Whatever you touch, please also convert to two-tab indent.

Okay.

> 
> -- 
> Cheers,
> 
> David

-- 
Sincerely,
Yeoreum Yun
