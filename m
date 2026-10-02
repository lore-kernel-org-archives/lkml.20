Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1814477F7
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790930346; cv=none; b=IOzAKfv60vMFz4zbQP331tcA7MLyr2gV0ELwxtKbMZ3Yedio8bWBCq/J8aNrvOrf5H24ITSGRFx2yMwb0IaAkyXOQIKme9o729+vsTckVLRXMKMbkggbHaNPObJAaXZru+y/r8h/uDYmEqoTw4wumkVBGGKrlPELPMyjAhBZajE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790930346; c=relaxed/simple;
	bh=0Uamto736/err/mtXsNKhoYsdiHULot25cxJyKy2cGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dl+bxtFTzMX75IyhGq9XW6x7Ddx/iFLw80tR0Bn06PVopkNo6VmqPRzbecfr9u8tnm7pj1BG6gdd0NW6vHVTyF+8PLOv9zk/imo2nUks1fX9+pMhfKpr7LnlcQ5OOh0i4VMj/vQVjrMR/M54NX6Z93n7/taL+EIi/aZakL+UqfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TsRl5Del; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TsRl5Del"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D16D51F000FF;
	Fri,  2 Oct 2026 08:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790930343;
	bh=KRxNLIPM60ZIDq6ro/IGuIKeWFbCWOgKc8p6gwqctKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TsRl5DelJUV+pcGbdEBRo0WIrx4BFJXhiL6Y9UoAgr/0P6nELkytR9bJei1zt4iLf
	 CXCDESIpPn5izZW570HY5tEhSz+1cii9gLr4lXLY8y2u9Q1i+CzXfAKZQIU1ASuoPC
	 7284EhuN/8XsjOGM5OBZ3WvPUloBxtLEuPtKzpBheseGyx3VxDvGqmNVSnlkiZZfM2
	 NPAK48W5Q7z1fmKR0+xb3dUJuCZhAMT3aHyU+cFyNxN4iSdI/a0jQq/Z6soGxPB/Ii
	 pS0ornjfDTv0xzZPyortR/WSq4RkNkx8v/jMgS4jqB9m5+OJ3IUkrhkz9fUiamHni2
	 yroBAi8ajvsGw==
Date: Fri, 2 Oct 2026 09:38:58 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>, 
	akpm@linux-foundation.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, peterx@redhat.com, dave.hansen@linux.intel.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	syzbot+49b1021becba70c1f3f6@syzkaller.appspotmail.com
Subject: Re: [PATCH] mm: don't ioremap COWed anon pages in
 generic_access_phys()
Message-ID: <ar9omYD3HcTDBpGA@gremlin>
References: <699ae98c.050a0220.340abe.0d31.GAE@google.com>
 <20261001152524.171115-1-ngocthang2710.1999@gmail.com>
 <32fe40e2-854a-47ec-9d95-93e23f9a7af4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32fe40e2-854a-47ec-9d95-93e23f9a7af4@kernel.org>

On Thu, Oct 01, 2026 at 10:22:29PM +0200, David Hildenbrand (Arm) wrote:
> On 10/1/26 17:25, Nguyen Ngoc Thang wrote:
> > A MAP_PRIVATE mapping of iomem (e.g. a PCI sysfs resourceN file) is a
> > COW pfnmap: a write fault replaces the pfn with an anonymous page, which
> > remap_pfn_range() allows by keeping vm_pgoff equal to the base pfn.
> >
> > generic_access_phys() does not tell those COWed pages apart from the
> > original pfns and ioremaps whatever the PTE points to. Reading such an
> > address via /proc/pid/mem or ptrace then ioremaps RAM:
> >
> >   ioremap on RAM at 0x0000000045623000 - 0x0000000045623fff
> >   WARNING: arch/x86/mm/ioremap.c:216 at __ioremap_caller.isra.0+0x4c2/0x5f0
> >   Call Trace:
> >    generic_access_phys+0x130/0x4d0 mm/memory.c:7178
> >    kernfs_vma_access+0x1ce/0x280 fs/kernfs/file.c:437
> >    __access_remote_vm+0x58f/0x890 mm/memory.c:7256
> >    mem_rw+0x2a1/0x670 fs/proc/base.c:912
> >
>

Sorry to say this looks schlopped.

This guy has sent 10 series across 6 subsystems over ~21 hrs:

https://lore.kernel.org/all/?q=f%3Angocthang2710.1999%40gmail.com

Nguyen - please do not flood the kernel with patches, and please use the
Assisted-by tag for generated content.

The original code you submitted is really not great even if the issue may
be valid.

So I'd say somebody from the core team should take over this if we want to
come up with a patch.

> Ack, apart from that, nothing bad should happen.
>
> > Reject COWed pages using the same linearity rule vm_normal_page() uses.
>
> Hm I don't enjoy that.
>
> What about letting follow_pfnmap_start() just perform a vm_normal_page()
> etc and indicate that information to the caller in the
> follow_pfnmap_args() ?
>
> We kind-of have that information in the form of follow_pfnmap_args.special
> ... but it's not available on all architectures. And it shouldn't exist.
>
> I was thinking a while ago about disallowing follow_pfnmap_start() entirely
> on anon folios, but the VM_IO thingy made me assume that there are some
> odd users (kvm/vfio) that actually need CoWed folios.

Ugh.

>
> Anyhow, this is what I think we should do for now:
>
>
> From 0b75f30b137612f18cdee28c8c0dfa96870868c2 Mon Sep 17 00:00:00 2001
> From: "David Hildenbrand (Arm)" <david@kernel.org>
> Date: Thu, 1 Oct 2026 22:19:57 +0200
> Subject: [PATCH] tmp
>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

This looks reasonable but I hate that we have 'special' CoW overrides like
this :)

> ---
>  include/linux/mm.h |  4 +++-
>  mm/memory.c        | 48 ++++++++++++++++++++++++++++++++++++++++------
>  2 files changed, 45 insertions(+), 7 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index c49ef99b4413..b90e547797a9 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -3193,6 +3193,8 @@ struct folio *vm_normal_folio_pmd(struct vm_area_struct *vma,
>  				  unsigned long addr, pmd_t pmd);
>  struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
>  				pmd_t pmd);
> +struct folio *vm_normal_folio_pud(struct vm_area_struct *vma,
> +		unsigned long addr, pud_t pud);

Hmm, if not defined before why would this need a new PUD handler? Do we
even have PUD-leaf PFN mappings?

>  struct page *vm_normal_page_pud(struct vm_area_struct *vma, unsigned long addr,
>  		pud_t pud);
>
> @@ -3245,7 +3247,7 @@ struct follow_pfnmap_args {
>  	unsigned long addr_mask;
>  	pgprot_t pgprot;
>  	bool writable;
> -	bool special;
> +	bool cow;
>  };
>  int follow_pfnmap_start(struct follow_pfnmap_args *args);
>  void follow_pfnmap_end(struct follow_pfnmap_args *args);
> diff --git a/mm/memory.c b/mm/memory.c
> index 926276d41920..764b79204ab7 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -843,7 +843,7 @@ struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
>   * @addr: The address where the @pmd is mapped.
>   * @pmd: The PMD.
>   *
> - * Get the "struct folio" associated with a PTE. See __vm_normal_page()
> + * Get the "struct folio" associated with a PMD. See __vm_normal_page()
>   * for details on "normal" and "special" mappings.
>   *
>   * Return: Returns the "struct folio" if this is a "normal" mapping. Returns
> @@ -879,6 +879,28 @@ struct page *vm_normal_page_pud(struct vm_area_struct *vma,
>  	return __vm_normal_page(vma, addr, pud_pfn(pud), pud_special(pud),
>  				&entry, sizeof(entry), PGTABLE_LEVEL_PUD);
>  }
> +
> +/**
> + * vm_normal_folio_pud() - Get the "struct folio" associated with a PUD
> + * @vma: The VMA mapping the @pud.
> + * @addr: The address where the @pud is mapped.
> + * @pud: The PUD.
> + *
> + * Get the "struct folio" associated with a PUD. See __vm_normal_page()
> + * for details on "normal" and "special" mappings.
> + *
> + * Return: Returns the "struct folio" if this is a "normal" mapping. Returns
> + *	   NULL if this is a "special" mapping.
> + */
> +struct folio *vm_normal_folio_pud(struct vm_area_struct *vma,
> +				  unsigned long addr, pud_t pud)
> +{
> +	struct page *page = vm_normal_page_pud(vma, addr, pud);
> +
> +	if (page)
> +		return page_folio(page);
> +	return NULL;
> +}
>  #endif
>
>  /**
> @@ -6947,7 +6969,7 @@ static inline void pfnmap_args_setup(struct follow_pfnmap_args *args,
>  				     spinlock_t *lock, pte_t *ptep,
>  				     pgprot_t pgprot, unsigned long pfn_base,
>  				     unsigned long addr_mask, bool writable,
> -				     bool special)
> +				     struct folio *folio)
>  {
>  	args->lock = lock;
>  	args->ptep = ptep;
> @@ -6955,7 +6977,7 @@ static inline void pfnmap_args_setup(struct follow_pfnmap_args *args,
>  	args->addr_mask = addr_mask;
>  	args->pgprot = pgprot;
>  	args->writable = writable;
> -	args->special = special;
> +	args->cow = folio && folio_test_anon(folio);

I actually wonder if this should be changed to folio_has_anon_rmap() at
some point :)

Since a folio being 'anon' is vague, because we stupidly made 'anon' vague
in general.

Anyway I was going to ask does this suffice for CoW but having an anon rmap
implies CoW so it does.

>  }
>
>  static inline void pfnmap_lockdep_assert(struct vm_area_struct *vma)
> @@ -7008,6 +7030,7 @@ int follow_pfnmap_start(struct follow_pfnmap_args *args)
>  	struct vm_area_struct *vma = args->vma;
>  	unsigned long address = args->address;
>  	struct mm_struct *mm = vma->vm_mm;
> +	struct folio *folio = NULL;
>  	spinlock_t *lock;
>  	pgd_t *pgdp;
>  	p4d_t *p4dp, p4d;
> @@ -7047,9 +7070,12 @@ int follow_pfnmap_start(struct follow_pfnmap_args *args)
>  			spin_unlock(lock);
>  			goto retry;
>  		}
> +
> +		if (vma_is_cow_mapping(vma))
> +			folio = vm_normal_folio_pud(vma, address, pud);
>  		pfnmap_args_setup(args, lock, NULL, pud_pgprot(pud),
>  				  pud_pfn(pud), PUD_MASK, pud_write(pud),
> -				  pud_special(pud));
> +				  folio);
>  		return 0;
>  	}
>
> @@ -7068,9 +7094,12 @@ int follow_pfnmap_start(struct follow_pfnmap_args *args)
>  			spin_unlock(lock);
>  			goto retry;
>  		}
> +
> +		if (vma_is_cow_mapping(vma))
> +			folio = vm_normal_folio_pmd(vma, address, pmd);
>  		pfnmap_args_setup(args, lock, NULL, pmd_pgprot(pmd),
>  				  pmd_pfn(pmd), PMD_MASK, pmd_write(pmd),
> -				  pmd_special(pmd));
> +				  folio);
>  		return 0;
>  	}
>
> @@ -7080,9 +7109,12 @@ int follow_pfnmap_start(struct follow_pfnmap_args *args)
>  	pte = ptep_get(ptep);
>  	if (!pte_present(pte))
>  		goto unlock;
> +
> +	if (vma_is_cow_mapping(vma))
> +		folio = vm_normal_folio(vma, address, pte);
>  	pfnmap_args_setup(args, lock, ptep, pte_pgprot(pte),
>  			  pte_pfn(pte), PAGE_MASK, pte_write(pte),
> -			  pte_special(pte));
> +			  folio);

This all seems reasonable, I guess, insofar as the horrible 'special' CoW
handling is reasonable, but this function is gross to have this degree of
duplication across page table levels.

But I guess one for the future.

>  	return 0;
>  unlock:
>  	pte_unmap_unlock(ptep, lock);
> @@ -7145,6 +7177,10 @@ int generic_access_phys(struct vm_area_struct *vma, unsigned long addr,
>  	writable = args.writable;
>  	follow_pfnmap_end(&args);
>
> +	/* Reject CoW'ed anonymous folios. */
> +	if (args.cow)
> +		return -EINVAL;
> +
>  	if ((write & FOLL_WRITE) && !writable)
>  		return -EINVAL;
>
> --
> 2.43.0
>
>
> --
> Cheers,
>
> David

--
Cheers, Lorenzo
