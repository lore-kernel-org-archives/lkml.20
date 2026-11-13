Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586737;
	b=yY7NlNJnR9lcZIXd7bO9nB8JtFDcw7uaUpTSPCixhBim5llQNkTAJ6OynWI6ays/cYMl
	 hOXRX6nzlG5BfaW4bRmofiEtHMg5NHz0Y3qeRF84gMm/CYfCLT61QONYKdNscqAd5cg5P
	 IxKICG9ftubDtO+PAvWvIVitNrpbL/XyGGBFt+5ra8rESKpSDykv6B9BRc3UwbyG+wGWo
	 yG9G7gQl/lgIb//4idOUseFT7qMFSM+26d0QjYl9yQzmItAFBc6cF4qfFVea8EwomF/f/
	 Fw5Qs5/rP6n5x+5R/Pp4VTpnBuvJ1317aa1h29hRc0INym1rcd6zF8TgjmlrZxZABvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586737;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=gfKCKZttULbLUSYKjLw2rQpWRQy7369BlI6NWLima74=;
	b=tGx1GBmjLYoibRAQ3Fc0JU07qUr0HayS3Tj+CHTOA4Cl+yx/OK4BxZLMq+hNTeyKBX8u
	 0F3SzYss+GZOb+aYZiTZEnvFwuenqGMOVrlMStFYpHTQrZOluxWOEupnOHKe6SMFn46Z0
	 U7aIDWHF4qeZM+UrP0I2Ob0U53aywQulydbKEbAlOVelINjx3Sd5tlJkAQ+F6sIRacBsm
	 g4qYVwKRBMZPyXcFN50/83SroWUbFw20n81zQ2Dr+PT/MNxVJMUB7H4nXeT+8vPyMa45r
	 wRESAjmXW/aoWwaTJwLGUtljY2SEt7iGcW51GWXi4BVsqZBB0NVQCDCcoMAvIlP6Xww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vibe2WIA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E98606BAAE
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vibe2WIA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF1591F000C7;
	Fri, 13 Nov 2026 16:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794586737;
	bh=gfKCKZttULbLUSYKjLw2rQpWRQy7369BlI6NWLima74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vibe2WIAY0fix0GPxjAhXr5IAODiFtxZhTL6hkbMoPswB8Z/QjgQa5K6AQAOsa4f1
	 e+uAs5WkrJgP7rMWQHuPujIsc8ylsI4yJQOIXwOCjzn1A75l7fNQkw310CvkvijR36
	 lLtjvMZ7B3j36t2y2nTxZ0stUyuupSMR4h+eazWcTCeIke1ypglK7wlYA+z6MPeLxq
	 jHt0ChQ1YqiOkr/PGa9uZ7DIVGvktcDmQXALJWrzvhBOcCr+yhRFiAjzPLO0kMrnmt
	 VJ3C0n4Mh7ykyJb2v9jT9EWTN8wgzzQsjDVToJVInkJ8qbWNeX0JyBA+ptZw78dAkV
	 9x9Cfbut/O4Gw==
Date: Fri, 13 Nov 2026 16:18:47 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Eliav Farber <farbere@amazon.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, 
	William Kucharski <william.kucharski@linux.dev>, Vishal Moola <vishal.moola@gmail.com>, 
	Alex Williamson <alex@shazbot.org>, Matthew Wilcox <willy@infradead.org>, 
	Peter Xu <peterx@redhat.com>, "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] mm/huge_memory: don't warn when a page table
 blocks a huge pfn insert
Message-ID: <avcsfhWktvKxQlkW@gremlin>
References: <20261112051440.16140-1-farbere@amazon.com>
 <20261112051440.16140-4-farbere@amazon.com>
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
In-Reply-To: <20261112051440.16140-4-farbere@amazon.com>

TL;DR is I feel like maybe I need to take this over as I'm not confident
you understand this...

On Thu, Nov 12, 2026 at 05:14:39AM +0000, Eliav Farber wrote:
> insert_pmd() and insert_pud() treat a non-empty entry at their own level

Non-empty reads quite strangely. I'd say present but non-present !=
!pmd_none().

And the code is just... so terrible.

It seems to assume that softleaves don't exist so don't bother to care
about that, for one.

I'm not sure if this fix is sufficient, actually.

> as a leaf and compare its PFN against the one being inserted. A page
> table installed by a concurrent order-0 fault also makes the entry
> non-empty, and pmd_pfn()/pud_pfn() then report the PFN of that table,
> which never matches. insert_pmd() warns unless the entry is the huge
> zero PMD, and insert_pud() warns on any mismatch.
>
> A VM_PFNMAP mapping with both ->fault and ->huge_fault can produce the

Please refer to non-deprecated VMA flags in new code.

> mixed orders: an order-0 fault installs a page table over an address

'the mixed orders'? What does that mean?

> while a concurrent huge fault on the same address reaches insert_pmd().
> Changing an mm's THP policy while another thread faults the same PMD,
> for example with prctl(PR_SET_THP_DISABLE), is enough to do it.

OK that's useful information. Terrible.

I wonder if actually there are other bugs that will surface because this
takes the mmap write lock but concurrent faults are permitted.

Maybe we need to make PR_SET_THP_DISABLE take every single VMA's write lock
in the mm first...

Even that is dubious as new VMAs can come into existence while you do that
:))

Ah well. I guess correct thing is to handle races like this as best we can.

>
> Compare the PFN only for a leaf entry. A page table is not an error, so
> take the existing out_unlock path, which returns VM_FAULT_NOPAGE and
> lets the access refault onto the smaller entry.

Sorry this paragraph is just word salad LLM-ish code-as-prose, delete it.

This commit message is really poor - it's too long, and what it goes into
detail about is mostly useless.

Pare it down into a form that demonstrates understanding of the page fault
code. Make the actual explainy bit as small as possible.

And you haven't answered key questions:

- What real-world workload were you doing when you encountered this?

- Or was it code inspection? Or was it an LLM? Assisted-by might be gone
  but you are strongly encouraged to explain this even if below the --- in
  the patch...

- What are the actual runtime implications for users?

- Why did you decide to not do anything about the other flaws here?

- What parts of the kernel are actually vulnerable to this? E.g.
  https://elixir.bootlin.com/linux/v7.3.1/A/ident/vmf_insert_pfn_pmd

Anyway, there's lots of broken stuff here though.

insert_pmd() seems to ignore the fact that PMD softleaves exist. Maybe
that's not possible in this code path... but... I don't see how it's not?

So this just seems terribly broken overall.

>
> Fixes: f9e54c3a2f5b ("vfio/pci: implement huge_fault support")

A commit message that goes into excruciating detail describing the code I
can literally scroll down and look at, but zero comment on why this fixes
target was chosen.

Presumably the first user that made this possible? I guess? Or no?

Do I as a reviewer have to go figure it out?

Please try to make our lives easier :)

> Signed-off-by: Eliav Farber <farbere@amazon.com>
> Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> ---
>  mm/huge_memory.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index eb913acb03b7..052c50dadc48 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1643,6 +1643,14 @@ static vm_fault_t insert_pmd(struct vm_area_struct *vma, unsigned long addr,
>  		const unsigned long pfn = fop.is_folio ? folio_pfn(fop.folio) :
>  					  fop.pfn;
>
> +		/*
> +		 * A concurrent order-0 fault may have installed a PTE table
> +		 * here, which pmd_pfn() would report as the PFN of the table
> +		 * itself. Only a leaf entry can be compared.
> +		 */

I hate this comment so much.

It's what I see so often from LLM output too... you're going on to say what
_would_ have happened if you _didn't_ do what you just did on the
_assumption_ that reader has zero understanding of page tables and fault
handling, and that the code (of course) will _never_ change.

It's adding nothing.

'Only a leaf entry can be compared' especially... it just reads like an
annotation from somebody/something that doesn't understand page table/fault
handling code.

Anyway delete both please.

> +		if (!pmd_leaf(*pmd))
> +			goto out_unlock;

 * @VM_FAULT_NOPAGE:		->fault installed the pte, not return page

Is this still the correct return value?

I imagine it's effectively saying 'this is not what we expected ah well
carry on'.

But what if it's a softleaf... Presumably it's somehow not possible for it
to be a PMD softleaf entry... but ugh.

The assumption here in the code is so bogus though. One can experience a
concurrent huge fault no?

So:

			if (pmd_pfn(*pmd) != pfn) {
				WARN_ON_ONCE(!is_huge_zero_pmd(*pmd));
				goto out_unlock;
			}

Is still completely broken isn't it? You could well find a leaf, installed
by a concurrent huge fault handler, and trigger a warning couldn't you?

Or is that somehow prevented?

I also don't get why an existing unexpected entry is totally fine if !write
let's not check anything...

It feels like the real fix is something more substantial.

Maybe better for me to take this over...

> +
>  		if (write) {
>  			if (pmd_pfn(*pmd) != pfn) {
>  				WARN_ON_ONCE(!is_huge_zero_pmd(*pmd));
> @@ -1770,6 +1778,14 @@ static vm_fault_t insert_pud(struct vm_area_struct *vma, unsigned long addr,
>  		const unsigned long pfn = fop.is_folio ? folio_pfn(fop.folio) :
>  					  fop.pfn;
>
> +		/*
> +		 * A concurrent order-0 fault may have installed a PMD table
> +		 * here, which pud_pfn() would report as the PFN of the table
> +		 * itself. Only a leaf entry can be compared.
> +		 */
> +		if (!pud_leaf(*pud))
> +			goto out_unlock;
> +
>  		if (write) {
>  			if (WARN_ON_ONCE(pud_pfn(*pud) != pfn))
>  				goto out_unlock;
> --
> 2.47.3
>

--
Cheers, Lorenzo
