Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923307;
	b=xQUov2dI6bhwWFN/n1zSNNEhe+hb9sCyhf56yu9bXQR39j4dBA7mE9xnnSBu1p8atwo1
	 3Wgeahoc4VOehxZG2FC1sbMmT3MnLbZKieptjX7VJkZdh988sWj1mneqHKOibodCqdYAB
	 0squTJV7NO9rI7iBAiyGqqF2RRCoNM94jjjWUOaP1Qn/exkd4FCRK3ZTcKQqEwaPVNnkh
	 r/7YAuGNxMOM+SoYnStH9ATC9enJwfVOrTStTLSg9rQajrd1h9PuTK4nDqVMA60LCwbaV
	 NTNZwnlGF7RS2SPj8HUbyF65+bBiD68berdVclFpP32OiEh2MUB8zKIJ1Ailv1hrEqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923307;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=M6VZ7CYm+YVVdzMSRV4Ww9IA3aFQKKqL1aLxREeXniA=;
	b=zantEwG7mIseDpFo4GnD5qBEn/RHVZW1FfyZsMiBvONUgHU1bf7vILU7ecOsTvMfoHFx
	 oKMPo0zqopl7uRnpQ5Ov1aB4+U1durcnAuVMjLSbA1ED7eYQDfNHPbov9mk7Ro8jT36ZI
	 u0IeSMK3CtLjSAUZ1XP3vVLUxiJBkly+e9iYSIm0dSjPNiqpeds+7e7X4+tFCCIi2RPxR
	 yDNZHlEe+V1iCnoOtg+Ag+psG4kxap3ZvO7aRlzOy8WxfW8NO+u1RFGv/5aTiXEBajO39
	 WLgsAeATG2WWNHXSoEwPxF1s1KnUC9HeAB9P0zAFJoZ3V7qgsy7iEMxUpJmjhZTRg+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T+3F7yW0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D241606A336
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T+3F7yW0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3DF01F000C5;
	Tue, 17 Nov 2026 13:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794923307;
	bh=M6VZ7CYm+YVVdzMSRV4Ww9IA3aFQKKqL1aLxREeXniA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T+3F7yW0BNt6KMfaHj/yGXMeR4K2bVB+aAbodU4rPyQ4VzPuuj2Hh5mrLnivJPxk1
	 wQ6OWg3eROScfL6IJQ5k9m1+p2bKFthWj0CGhENWdYUE5g0aRK6tZsm8dsj5Zkt23e
	 6PqvdCv7HcR3UdB3hkJOAeKIV5poO0ldCcKvIULv30JcD+eHURWlM/BeYipWUH5AzB
	 WIqq3HNKw5ReZoKiTay09O8/AIAJxeTouYXVCxY0aejIev/QA9S5aNR0dhL7WW28Hg
	 eMLh63MYL9PpSyb50HZZ5HEyfiiiXkAnR1OGlXOlFD2mFODzo8UieNeUxoL/W5zf/L
	 tAS/3pp73j/2g==
Date: Tue, 17 Nov 2026 13:48:19 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	David Hildenbrand <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Christoph Hellwig <hch@infradead.org>, 
	Yuan-Hao Hsu <aa9736195201@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v5 5/8] mm/gup: break out gup_lookup_pte() helper
Message-ID: <avxXgTBaJkPN6XOh@gremlin>
References: <20261116210127.3837898-1-riel@surriel.com>
 <20261116210127.3837898-6-riel@surriel.com>
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
In-Reply-To: <20261116210127.3837898-6-riel@surriel.com>

On Mon, Nov 16, 2026 at 04:01:24PM -0500, Rik van Riel wrote:
> follow_page_pte() is 92 lines and does two separate things: work out
> which page a PTE maps, if any, and commit to the page it found. The
> first half reaches the second through five exit paths, two of which
> unwind the PTE lock in different ways.
>
> Split the resolve half into gup_lookup_pte(), which returns the page it
> resolved, NULL when the PTE cannot be followed, or the errno the caller
> must report. follow_page_pte() is left with one unlock and one exit.
>
> no_page_table() can look up the page cache, so the case that needs it is
> recorded and the call made after dropping the PTE lock, as before.
>
> A none PTE still returns before any write check runs, so a FOLL_WRITE
> failure can never reach the recorded call: the caller consults
> no_page_table() for exactly the same PTEs the old code did.
>
> No functional changes intended.
>
> Suggested-by: David Hildenbrand <david@kernel.org>
> Signed-off-by: Rik van Riel <riel@surriel.com>
> ---
>  mm/gup.c | 100 +++++++++++++++++++++++++++++++------------------------
>  1 file changed, 56 insertions(+), 44 deletions(-)
>
> diff --git a/mm/gup.c b/mm/gup.c
> index efb2ad64be80..3aed0bc1c2b4 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -965,74 +965,86 @@ static long gup_grab_fill_folio_pages(struct folio *folio,
>  	return 0;
>  }
>
> -static long follow_page_pte(struct vm_area_struct *vma,
> -		unsigned long address, pmd_t *pmd, unsigned int flags,
> -		struct page **pages)
> +/*
> + * Resolve one present PTE to the page it maps. Returns no page and no error
> + * when the PTE cannot be followed but the caller may fault it in, and a
> + * negative errno when the caller must report the failure.
> + */
> +static long gup_lookup_pte(struct vm_area_struct *vma, unsigned long address,
> +		pte_t *ptep, pte_t pte, unsigned int flags, struct page **pagep)
>  {
> -	struct mm_struct *mm = vma->vm_mm;
> -	struct folio *folio;
>  	struct page *page;
> -	spinlock_t *ptl;
> -	pte_t *ptep, pte;
> -	long ret;
>
> -	ptep = pte_offset_map_lock(mm, pmd, address, &ptl);
> -	if (!ptep)
> -		return no_page_table(vma, flags, address);
> -	pte = ptep_get(ptep);
> +	*pagep = NULL;
> +
>  	if (!pte_present(pte))
> -		goto no_page;
> +		return 0;
>  	if (pte_protnone(pte) && !gup_can_follow_protnone(vma, flags))
> -		goto no_page;
> +		return 0;
>
>  	page = vm_normal_page(vma, address, pte);
>
>  	/*
>  	 * We only care about anon pages in can_follow_write_pte().
>  	 */
> -	if ((flags & FOLL_WRITE) &&
> -	    !can_follow_write_pte(pte, page, vma, flags)) {
> -		ret = 0;
> -		goto out;
> -	}
> +	if ((flags & FOLL_WRITE) && !can_follow_write_pte(pte, page, vma, flags))
> +		return 0;
>
>  	if (unlikely(!page)) {
>  		if (flags & FOLL_DUMP) {
>  			/* Avoid special (like zero) pages in core dumps */
> -			ret = -EFAULT;
> -			goto out;
> -		}
> -
> -		if (is_zero_pfn(pte_pfn(pte))) {
> -			page = pte_page(pte);
> -		} else {
> -			ret = follow_pfn_pte(vma, address, ptep, flags);
> -			goto out;
> +			return -EFAULT;
>  		}
> +		if (!is_zero_pfn(pte_pfn(pte)))
> +			return follow_pfn_pte(vma, address, ptep, flags);
> +		page = pte_page(pte);
>  	}
> -	folio = page_folio(page);
>
> -	if (!pte_write(pte) && gup_must_unshare(vma, flags, folio, page)) {
> -		ret = -EMLINK;
> -		goto out;
> -	}
> +	if (!pte_write(pte) &&
> +	    gup_must_unshare(vma, flags, page_folio(page), page))
> +		return -EMLINK;
>
>  	VM_WARN_ON_ONCE_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
>  			     !PageAnonExclusive(page), page);
>
> -	ret = gup_grab_fill_folio_pages(folio, page, 1,
> -			pte_dirty(pte), flags, pages);
> -	if (ret)
> -		goto out;
> -	ret = 1;
> -out:
> +	*pagep = page;
> +	return 0;
> +}
> +
> +static long follow_page_pte(struct vm_area_struct *vma,
> +		unsigned long address, pmd_t *pmd, unsigned int flags,
> +		struct page **pages)
> +{
> +	struct mm_struct *mm = vma->vm_mm;
> +	bool need_no_page_table = false;
> +	struct page *page;
> +	spinlock_t *ptl;
> +	pte_t *ptep, pte;
> +	long ret;
> +
> +	ptep = pte_offset_map_lock(mm, pmd, address, &ptl);
> +	if (!ptep)

OK so this is what happens if there's no PMD entry. Maybe worth a comment?
Especially if you have special handling for the PTE PTL being held below.

> +		return no_page_table(vma, flags, address);
> +	pte = ptep_get(ptep);
> +
> +	ret = gup_lookup_pte(vma, address, ptep, pte, flags, &page);
> +	if (!ret && page) {
> +		ret = gup_grab_fill_folio_pages(page_folio(page), page,
> +						     1, pte_dirty(pte), flags, pages);
> +		if (!ret)
> +			ret = 1;
> +	} else if (!ret && pte_none(pte)) {
> +		/*
> +		 * no_page_table() may look up the page cache, so it cannot run
> +		 * under the PTE lock. A none PTE returns from gup_lookup_pte()
> +		 * before any write check runs, so this is the same call the old
> +		 * code made -- not a new failure mode for FOLL_WRITE.
> +		 */

This feels -- a little -- schloppy ;)

Why are you referencing 'the old code' in a permanent comment for which what
'the old code' means is super unclear?

That's really just not helpful.

'A none PTE returns from gup_lookup_pte() before any write check runs' also
reads weirdly.

I'm also not sure why you're sending a pte_none() PTE to gup_lookup_pte()
anyway + checking for the error again?

	if (pte_none(ptep)) {
		... whatever ...
		goto blah;
	}

It seems silly otherwise.


Also isn't the page cache thing _only_ for hugetlbfs, unless you changed
that? And aren't a number of other callers of no_page_table() also broken?

But in general the comment could be made much clearer:

	/*
	 * If a hugetlb VMA it might access the page cache in no_page_table(),
	 * which cannot be done under the PTL, so defer until it's dropped.
	 */

Or whatever, something human-written like that :)


> +		need_no_page_table = true;

This is set true but not used anywhere? This is dead code no? Am I missing
something?

Patches should be incremental but adding completely useless locals incrementally
seems silly?

> +	}
> +
>  	pte_unmap_unlock(ptep, ptl);
>  	return ret;

I'm guessing you forgot to include the code that works with
need_no_page_table here?

Should it have been:

	if (!ret && need_no_page_table)
		return no_page_table(vma, flags, address);

Perhaps?

I'm not sure any of this is really a cleanup, I'm finding this quite
confusing, actually...

'need_no_page_table' isn't a great name either. Maybe is_none or something?

> -no_page:
> -	pte_unmap_unlock(ptep, ptl);
> -	if (!pte_none(pte))
> -		return 0;
> -	return no_page_table(vma, flags, address);
>  }
>
>  static long follow_pmd_mask(struct vm_area_struct *vma,
> --
> 2.56.0
>

--
Cheers, Lorenzo
