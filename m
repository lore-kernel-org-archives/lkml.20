Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621657;
	b=U3IUZOT2u21gVgtJwl0yxfKlN9wLi45AMOUmzpplCkR/5Ng2OsYEHnFGSWotQLQZWECF
	 V9XFa9w0WoHRXyJidlTqiFrnF67z0x7rImmk6mLk2VV4BTdfREbJIF62PF2BMHZg2SQPo
	 pgIMKD5z6ocgpydgxodfZoAo6H0DiC46k/mU99xFbhMMlfv/LU02tuYgaRHIRIewQPZxt
	 scq7cHI3jiXqeDEZTNQt6Hglt4mZ7L+TjTEKK+Nd0Fzss/9K5k5IfzyBqhu50HNSuwe0e
	 6MJuQtnA9IcvCtV2q3nluXJkvQFguccC8srCWqkYrO/rP2fS/R4hNEp6eX+xCfblAOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621657;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=KPahiPVhIkHB9HIPU+lncEVEvfQq7XDuVADEkW0Ex9s=;
	b=hDBj9347Qev+tC9X5Tdm2a5RU8MDadiXY9IAqzEg0dHBoox5VHUjQHX1R6ioZdAN/lQY
	 5Ydm+1dY2Rhw8Kzn10Wy02MNYs4xKeO6rLJCNL5leogKOUuZ5duzv5G6iG7ti1hAAh4xv
	 CKKxyP1PQJrfT2aXmXGyyGRDgQ7iA8G/YAKIfmleZof0fsTQB0ZYX0uG88soi0X5dVfjd
	 qSyfUdrJCxwa/NBnXcOfej6p9FcuTo+RIg8cXZjrLDaN+wLCh5HJ3zLP65HTP5s8h1Lke
	 UuHm+jorsfbV4EP11ghd+Ec4CR01akF7NUMpGyUH3WT3eIFG5T4q2YeaMHrfLFZCdLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bsaOqqxm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B24606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bsaOqqxm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89F291F00A18;
	Mon,  2 Nov 2026 12:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793621656;
	bh=KPahiPVhIkHB9HIPU+lncEVEvfQq7XDuVADEkW0Ex9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bsaOqqxmm/wDTF06kQLZ7usCwZDMQcBem0NCjGecfGqC8YxYpb9r7JBcYY8Y3CUOZ
	 wjZmF4155okl3WVzEtR20fDyljYMSWuw6Qr8mUKjbLg/NXVbkQIbcLqDpcD8wCG306
	 pBzCi+pp2Cxgy8A92vrmJLMrhr/0+FIiO1/EqFkjRn/wKONa403xxZRAiICU7lrmiE
	 NSFjE2bN/rmb3XQ4Avj7NRfd5ekWjdPD1FRlQYZ72m6UTyzKHgzu3luE1vDqEnwL/N
	 /Q9dn1lPhX67PiGQPuNtSBpn8Ka5cotgaNAMYx9H0B9U8LBxNRdb1DJmqSYvtgMULQ
	 QjQv5OT5wLnJg==
Date: Mon, 2 Nov 2026 12:14:11 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: xu.xin@linux.dev
Cc: zhaogongyi@bytedance.com, aarcange@redhat.com, 
	akpm@linux-foundation.org, chengming.zhou@linux.dev, david@kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, riel@redhat.com
Subject: Re: [PATCH] mm/ksm: avoid anon_vma UAF during page merging
Message-ID: <auh9cfHS7DYJAzgP@gremlin>
References: <20261031182256.40205-1-zhaogongyi@bytedance.com>
 <20261102101831.218090-1-xu.xin@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261102101831.218090-1-xu.xin@linux.dev>

On Mon, Nov 02, 2026 at 06:18:31PM +0800, xu.xin@linux.dev wrote:
> > KASAN reports a use-after-free in page_address_in_vma() while ksmd
> > merges pages. ksmd keeps a folio reference across an mmap_lock drop,
> > during which mremap() can remove its last mapping and free its
> > anon_vma. page_address_in_vma() then dereferences the stale pointer
> > from folio->mapping.
> >
> > KSM needs only a candidate address. write_protect_page() checks that
> > the PTE maps the folio, and replace_page() verifies the saved PTE
> > before replacing it. Compute the candidate from the folio index and
> > VMA instead of dereferencing the folio-side anon_vma. Reject KSM
> > folios because their page index is not meaningful.
> >
> > Fixes: 21d0d443cdc1 ("rmap: resurrect page_address_in_vma anon_vma check")
> > Signed-off-by: Zhao Gongyi <zhaogongyi@bytedance.com>
> > ---
> > Testing:
> >   Unpatched mm-new: fixed-pool KSM/mremap reproduced the KASAN UAF.
> >   Patched mm-new: the same workload ran for 12 minutes without KASAN,
> >   BUG or WARNING; fork/COW KSM smoke passed.
>
> Thanks for the report.
>
> I’d like to ask whether this issue is easy to reproduce on 6.18 since
> I suspect the accuracy of the “fixes” tag in the commit description.
>
> Besides, adding an extra folio_test_ksm() check is unneeded, see reasons below.
>
> >
> >  mm/ksm.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/mm/ksm.c b/mm/ksm.c
> > index d6f736a..f8af5ee 100644
> > --- a/mm/ksm.c
> > +++ b/mm/ksm.c
> > @@ -1307,7 +1307,7 @@ static int write_protect_page(struct vm_area_struct *vma, struct folio *folio,
> >  	if (WARN_ON_ONCE(folio_test_large(folio)))
> >  		return err;
> >
> > -	pvmw.address = page_address_in_vma(folio, folio_page(folio, 0), vma);
> > +	pvmw.address = vma_anon_address(vma, folio_pgoff(folio), 1);
> >  	if (pvmw.address == -EFAULT)
> >  		goto out;
> >
> > @@ -1408,7 +1408,7 @@ static int replace_page(struct vm_area_struct *vma, struct page *page,
> >  	int err = -EFAULT;
> >  	struct mmu_notifier_range range;
> >
> > -	addr = page_address_in_vma(folio, page, vma);
> > +	addr = vma_anon_address(vma, page_pgoff(folio, page), 1);
> >  	if (addr == -EFAULT)
> >  		goto out;
> >
> > @@ -1515,7 +1515,7 @@ static int try_to_merge_one_page(struct vm_area_struct *vma,
> >  	if (page == kpage)			/* ksm page forked */
> >  		return 0;
> >
> > -	if (!folio_test_anon(folio))
> > +	if (!folio_test_anon(folio) || folio_test_ksm(folio))
> >  		goto out;
>
> The check folio_test_ksm(folio)) in try_to_merge_one_page is unnecessary, because before
> try_to_merge_one_page() is called, cmp_and_merge_page() invokes folio_stable_node(), which already checks
> whether this is a KSM page. Only KSM fork pages are allowed to pass through; even if they do pass, they
> will ultimately be intercepted by the if (page == kpage) check in try_to_merge_one_page.

This doesn't quite cover it, as cmp_and_merge_page() doesn't bail if
!folio_test_ksm(), it can then fall through to stable_tree_search() which can
return NULL legitimately there, so the page ends up in th eunstable tree.

Actually right now what's saving us is page_address_in_vma() implicitly
rejecting KSM folios (since folio_anon_vma() returns NULL for them).

So if you remove that, you have to re-add the check there.

This is very fiddly, and KSM is very worrying :)

(I'm sending a fix separately.)

--
Cheers, Lorenzo
