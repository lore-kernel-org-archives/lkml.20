Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699422;
	b=Aa9yn82DOYTLkrcJ5eWWkynU55CLi3k6UWbWkr8HJtMpvHqQrPO4CTYYyhAn7ZXZIxAd
	 G2lqBuJlQjkywouqOiaflQAaolmI2+1feYCA96gQpi0d0TszdnBkH+D6iLxwqUG/3C6N7
	 4ouVDzurDhMdPFBN5FzG7Gy3HFRYz618mwfQG/4B2CL8l5FjQxTl9talR1GLCCQzSDMQl
	 L3rEJUn9UcQVvGLRkciu5SvdLr5K/ryO4apOTPfp2AVeBR/zxISnxYuekPuNcbywzNI9j
	 Ke8M0WfbU0u0+F/LK4J5wo9cM/bHme9+lFYtwpn6KGT3j1FzcSlqi4+dOzaTutfwrjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699422;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=5XD60sJxmqVuuR9WqNOmUBIYTHUHzJOfBqo68ZaXcw0=;
	b=0QOBk/5VbEc+InjXQxlwdr0wYAbInaivamfH8D9/UgX6NivSg2cxL0+2/XcpCqmhniNy
	 0H67EkvhYATs9nfRdkBYlK0u0kLVUjfxOxZsGOA60SHsRamvZf10jV91N5aOTvhwMBrH5
	 B4K1qck8u7p1J2MwOuW6DMgEfAeywivL0zfcdAcnZP7mavi516g64pOpZNhwY+Ml/ewSJ
	 BojPoVWdvDAc0/USFAWx78F9noNm3vXlF+SXTMrMkblZNpC7gZd5eQ1FtUZQP2Pvj1i9f
	 zI9/3sOzA2P8PxTFohQuXg+O8AEQg9Bl72B0EpqGJiXleGgv59dk/XCoe9k28fgR2jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eZOeoBav;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA84606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eZOeoBav
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFB3C1F000C1;
	Tue,  3 Nov 2026 09:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793699421;
	bh=5XD60sJxmqVuuR9WqNOmUBIYTHUHzJOfBqo68ZaXcw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eZOeoBavZjcryxFWgr5UKhLBq+VUBZ0r6W3TvwHEmEPJ32QKVMkDprmtKwnpvKDQp
	 ujZhKcfQDTi2BJ35kyhYxZCnVZGiI081+RPl13Ez6vV94VrJWnszbw2VcaM5Dp4TDg
	 y5RUPHp2dj462u6Kt2/fw1NWIis0aRHzV59njv/86Z3ncg4SJqACYj9/1tXk+mGIWr
	 4q7hwgVNcmlUzAlAPvgW8nf57bneTHenVmrYyvsdMaeM3lCDwerCHvpLeu2nODIN4A
	 udpKAXl39Tkph8SnipwPJb8hkyEy37yXuiTM6/GjEd1PoPsRIMpcwVCom4R3zCJ4Oz
	 ADrwWOFjce1ag==
Date: Tue, 3 Nov 2026 09:50:15 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Hui Zhu <hui.zhu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Hui Zhu <zhuhui@kylinos.cn>
Subject: Re: [PATCH v3] mm/memory: use pmdp_get_lockless() for the pmd read
 in do_fault_around()
Message-ID: <aumfvNWiemmuyooP@gremlin>
References: <20261103014749.96764-1-hui.zhu@linux.dev>
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
In-Reply-To: <20261103014749.96764-1-hui.zhu@linux.dev>

On Tue, Nov 03, 2026 at 09:47:49AM +0800, Hui Zhu wrote:
> From: Hui Zhu <zhuhui@kylinos.cn>
>
> KCSAN reports a data-race in do_read_fault / pmd_install; the same code
> is in mainline:
>
>   write (marked) to 0xffff8d52a75fb810 of 8 bytes by task 27487 on cpu 5:
>    native_set_pmd arch/x86/include/asm/pgtable_64.h:83 [inline]
>    pmd_populate arch/x86/include/asm/pgalloc.h:84 [inline]
>    pmd_install+0xe0/0x120 mm/memory.c:444
>    finish_fault+0x5bc/0xb00 mm/memory.c:5204
>    do_cow_fault mm/memory.c:5432 [inline]
>    do_fault+0x5d0/0x6e0 mm/memory.c:5526
>    handle_mm_fault+0x211/0x4c0 mm/memory.c:6218
>    __mm_populate+0x144/0x270 mm/gup.c:2207
>    __do_sys_mlockall+0x2cd/0x380 mm/mlock.c:764
>
>   read to 0xffff8d52a75fb810 of 8 bytes by task 27527 on cpu 9:
>    do_fault_around mm/memory.c:5341 [inline]
>    do_read_fault+0x162/0x670 mm/memory.c:5381
>    do_fault+0x31a/0x6e0 mm/memory.c:5524
>    handle_mm_fault+0x211/0x4c0 mm/memory.c:6218
>    faultin_page_range+0x227/0x530 mm/gup.c:2156
>    __x64_sys_madvise+0x67/0x80 mm/madvise.c:1479
>
>   value changed: 0x0000000000000000 -> 0x000000001386c067
>
> Both paths only hold mmap_lock for read, so do_fault_around() tests
> vmf->pmd while pmd_install() populates it under the pmd lock.  The race is
> benign: a stale pmd_none() only wastes the prealloc_pte, which do_fault()
> frees again, and a pmd seen as populated only makes ->map_pages() find no
> PTE and do_read_fault() fall back to __do_fault().
>
> The load still has to be lockless-safe.  pmdp_get() is a plain READ_ONCE()
> and can tear where pmd_t is wider than a word, as on i386-PAE where

Isn't i386 no longer supported? Are there any other arches we are worried
about?

It seems now after Arnd's removals this has to be manually selected by the
user.

Other than that we are worried about mips32 with 64 bit addresses and sh
with x2tlb. More museum-piece stuff...

I hate that we're impacted by this.

Anyway you should probably call out the relevant arches here.

> pmd_install() publishes two words with a single cmpxchg8b.  Use
> pmdp_get_lockless(), the accessor for pmd reads without the pmd lock and
> what __pte_offset_map() already uses on this very pmd a few instructions
> later.  It is pmdp_get() everywhere else, so the report is silenced the
> same way.
>
> No functional change on architectures that can load a pmd in one go.
>
> Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>


> ---
> Changelog:
> v3:
> Shorten the comment to one line (David Hildenbrand).
> v2:
> Use pmdp_get_lockless() instead of pmdp_get() (David Hildenbrand).

Please add links to previous discussion, it's difficult to track stuff
otherwise.

>
>  mm/memory.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/mm/memory.c b/mm/memory.c
> index 0fb676dd2bd63..f25c2ce0ef153 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -6017,7 +6017,8 @@ static vm_fault_t do_fault_around(struct vm_fault *vmf)
>  	to_pte = min3(from_pte + nr_pages, (pgoff_t)PTRS_PER_PTE,
>  		      pte_off + vma_pages(vmf->vma) - vma_off) - 1;
>
> -	if (pmd_none(*vmf->pmd)) {

This pattern is definitely bad I think, we have it in many other places so
should probably convert those to pmdp_get() at least?

> +	/* pmd_install() rechecks pmd_none() under the pmd lock. */
> +	if (pmd_none(pmdp_get_lockless(vmf->pmd))) {

It definitely seems right to use at least pmdp_get() here, but I wonder
about the need for pmdp_get_lockless() here.

pmd_none() only checks the lower word, so a torn 64-bit word on 32-bit
(i.e. the PAE style cases we are worried about) makes no difference:

From x86 pmd_none():

	/* Only check low word on 32-bit platforms, since it might be
	   out of sync with upper half. */

And anyway I guess there is no valid PMD in such systems that would have
the lower word cleared and upper word not cleared.

And we have other instances of this pattern all over the place, when you
read the PMD you don't hold the PMD lock at all so 'lockless' is kinda
questionable here.

I mean yes it's lockless but no more than other cases like this.

So either I think use pmdp_get() or we need to go convert everywhere else
and be strict on pmdp_get() only being used with the PMD lock held.

>  		vmf->prealloc_pte = pte_alloc_one(vmf->vma->vm_mm);
>  		if (!vmf->prealloc_pte)
>  			return VM_FAULT_OOM;
> --
> 2.43.0
>

--
Cheers, Lorenzo
