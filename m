Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624137;
	b=iFF2khEOVjlicp99kxLhGQ5hGFaNbgKPdnqBYocxWU8yCaVkwMHbP9qWhU/E8693TzND
	 D+aXx/iiuK5/7pEhBfdxe7CXmHklZWZzA652qn67la4bdDvkB5slt6IfXUR+yempp+BFC
	 u1s+tv5Uc7lbDc82BTm1SZAXVTLr8V7KHuYsnjYXKBVqQ9baxrXhuT0SKOx7Sk88RU+2O
	 AOuh9Iy2yswkfGkFmiXeQOUcSeNtv3l6X1Ttq5uEhoxDg2mGxKk0UOXdZmAefY11w2TM7
	 mTIBdqO6CtprLunFwB64mqvEATFQXmeaTGNnS/scACdZRc9JX4E2xnInYAjIyB5LWXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624137;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zK+jduPgyuYhoGFDTvKP1KlaDNql1X030u3qNAXE0zA=;
	b=rHxIDAxHWkl/lH4Y2ERBugFGUAh7qLIBgQ3fDoCNviqKjhJxFrNXxo/GMqD7qnId7UK0
	 fxes5qyX7Am6JPcd4ale4j7KHp3jiQInKCfm41Wi0Suc1M0pnzGHpV7GVccM23X5+vyZW
	 dlwRxsA5nKK9B+2bhr1bQhXnIMftsFI1jyL0Cu4exlmmvBniJaRguE4BpuZewgnxpVMuM
	 +u9UggFKHG7Vu6pnf2eu0kRE9LKHQBRzGCHi98TetN8afE+DZiOYLzfMidO87yj/yhb+1
	 4qfnLhdbo4cfbRtrpmjhFWyywdPqM5UZQ5kW2c7Gf/AKt9H7tlEmfmCK2qXg045S5lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BPDBYnRq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869C1606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BPDBYnRq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C40F1F00A16;
	Mon,  2 Nov 2026 12:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793624137;
	bh=zK+jduPgyuYhoGFDTvKP1KlaDNql1X030u3qNAXE0zA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BPDBYnRqf0o0UbbvkaWjK97ToRo8QnnXDa+oV8kdzXiCvIH7BgZt+sLXxnFlLUdjZ
	 J1F/CHVDxjRLimLNxrAWVrOh+nqoRouG4O0tzipJeliYcGEskLHhMIs7bFOu/L5tuP
	 7Pp6SIH5pz5saLv9Oj7r6iTI2kZ/hAgzJrjWklPAMsyYiyM3ycETTZ00kt+kT7gvOe
	 K0QkjvZtKKTJHqMns9+OZ4q9CxX9Hf8Y5eCTxEgSFFUOLQuvNjmgwfviDp/o6Im8e0
	 7JrSYh2G6i9P2XngglE6HoaquaVBaZNaasYaAy0b178ZNHSoaYW9W+GpFXFjSk6KAY
	 /hmvLLaTVyuyg==
Date: Mon, 2 Nov 2026 12:55:32 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Xu Xin <xu.xin@linux.dev>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Rik van Riel <riel@redhat.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Zhao Gongyi <zhaogongyi@bytedance.com>
Subject: Re: [PATCH] mm/ksm: avoid unsafe anon rmap dereference in KSM merge
Message-ID: <auiHNPkbB0p7-2GI@gremlin>
References: <20261102-ksm-anon-rmap-fix-v1-1-68962acfb59b@kernel.org>
 <54e20549-ca49-4d86-90fd-9f5e483d362d@kernel.org>
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
In-Reply-To: <54e20549-ca49-4d86-90fd-9f5e483d362d@kernel.org>

On Mon, Nov 02, 2026 at 01:49:02PM +0100, David Hildenbrand (Arm) wrote:
> On 11/2/26 13:32, Lorenzo Stoakes (ARM) wrote:
> > When KSM examines candidate VMAs in scan_get_next_rmap_item(), it
> > accumulates (mm, address) pairs in ksm_rmap_item objects, assigning them
> > via get_next_rmap_item(), pinning folios via a page walk in
> > ksm_next_page_pmd_entry().
> >
> > Throughout this operation, scan_get_next_rmap_item() holds mmap read lock,
> > which it drops afterwards.
> >
> > After the mmap lock is dropped the VMAs might be freed and remapped where
> > the VMA belonging to the folio was previously mapped.
> >
> > mremap()'s ability to change where anon folios are mapped is dealt with by
> > KSM by essentially avoiding the problem - prep_move_vma() unshares KSM
> > folios, and the scanning logic is tolerant of concurrent remaps, discarding
> > stale ksm_rmap_item objects and allocating new ones at the new address.
> >
> > This doesn't account for a new VMA being mapped over an old one where a
> > folio was previously mapped, so KSM accounts for this by checking things at
> > the page table level.
> >
> > However, once an anon_vma's reference count reaches zero, it is freed, but
> > nothing clears folio->mapping, which is where the KSM pin interacts badly
> > with the current KSM implementation.
> >
> > page_address_in_vma() is consistently used to look up the folio's address,
> > but page_address_in_vma() explicitly states:
> >
> > "It is the caller's responsibility to check the page is actually within the
> > VMA."
> >
> > And KSM violates this, as it cannot know this to be true. This results in
> > this function performing a use-after-free:
> >
> > 		struct anon_vma *anon_vma = folio_anon_vma(folio);
> >
> > 		...
> >
> > 		if (!vma_has_anon_rmap(vma) || !anon_vma ||
> > 		    vma->anon_vma->root != anon_vma->root)
> > 			return -EFAULT;
> >
> > As anon_vma->root is dereferenced when anon_vma can already have been
> > freed.
> >
> > This is currently benign in practice, as anon_vma's are slab-allocated
> > objects so this will always be within the direct mapping and arbitrary
> > memory will be treated as if it were a pointer to be compared.
> >
> > This either results in an -EFAULT or a spurious match, which will be
> > rejected at the page table level.
> >
> > However we mustn't UAF even if it's harmless, and KASAN rightly flags this.
> >
> > It turns out we don't even need to use page_address_in_vma() as we already
> > know the folio's address, it simply needs to be passed through.
> >
> > This change therefore updates KSM to do this, sidestepping the issue
> > altogether.
> >
> > Explicitly check for KSM folios in try_to_merge_one_page(), which are
> > already merged, and by definition never have an anon_vma.
> >
> > This was previously handled implicitly by page_address_in_vma() as
> > folio_anon_vma() returns NULL for those.
> >
> > In many cases cmp_and_merge_page() will reject these, but it's possible for
> > KSM folios to fall into the unstable tree there, so eliminate that
> > possibility by checking for that early.
> >
> > This maintains existing behaviour.
> >
> > The bug was introduced by commit 21d0d443cdc1 ("rmap: resurrect
> > page_address_in_vma anon_vma check") which first dereferenced
> > folio->mapping unsafely, but commit b8c8ba73c68b ("slub: Introduce
> > CONFIG_SLUB_RCU_DEBUG") made it visible with CONFIG_SLUB_RCU_DEBUG enabled.
> >
> > Fixes: 21d0d443cdc1 ("rmap: resurrect page_address_in_vma anon_vma check")
> > Reported-by: Zhao Gongyi <zhaogongyi@bytedance.com>
> > Closes: https://lore.kernel.org/all/20261031182256.40205-1-zhaogongyi@bytedance.com/
> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > ---
> > David - this seems benign in practice, so I'm not sure whether a backport
> > is required here.
>
> Ok, thanks. Is there a similar problem as with the other anon_vma->root issue
> where a false positive match could be problematic?
>
> I suspect not.

No, as it checks stuff at the page table level later.

>
> In that case I would pick this for the next merge window after a couple of days.

Yup, this is far from urgent.

>
> [...]
>
> >  {
> >  	struct folio *folio = page_folio(page);
> >  	pte_t orig_pte = __pte(0);
> > @@ -1515,7 +1507,7 @@ static int try_to_merge_one_page(struct vm_area_struct *vma,
> >  	if (page == kpage)			/* ksm page forked */
> >  		return 0;
> >
> > -	if (!folio_test_anon(folio))
> > +	if (!folio_test_anon(folio) || folio_test_ksm(folio))
> >  		goto out;
> Okay, that makes sense. We don't have to check under the folio lock as KSM
> doesn't merge concurrently.
>
> Do we want to assert in write_protect_page() that we are not getting called with
> a KSM folio, similar to what we do with large folios in there?

Sure could do. I wonder whether that existing check should just be a
VM_WARN_ON_ONCE() anyway, seems a bit silly to if (WARN_ON_ONCE(...)) return
err; there.

Do you want a respin for that or happy to add?

--
Cheers, Lorenzo
