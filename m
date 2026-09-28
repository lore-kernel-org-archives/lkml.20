Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A30F4F3908
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790614881; cv=none; b=IpgtWAuWWd0mHrRZeHs6y1ZHONLah2j4+DRVj0wGimrpVVMm1qzFVcbsE5/Zu7QhvGaxRvUIpEeDTp+sUCiUWTcIotmLR5tR/r0PdB5igMMnEYcSuc/0gm+E7qdGjniIpg4s4pAhy9X4pH916+5o0yeTALupKM7ku8uEzD3czvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790614881; c=relaxed/simple;
	bh=0WaRLD6BPx0WCrO//EirGlbYmsvPKmm8dwoOFfIt1jQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L+ltCjBHEenq5Z8R+o/RBYMAy9wyVmtkm0DVKoiL6SZwsmtCVs5i6KkJ9HgMkh4S+nMxd5xELtM5cojja7mgN9wFY7SRWIycaDf4fnanjwe5wxv5+fNGqaWGxIXjvKHkqMy39qp2D6KWjZvjv229TUo9V/tt6ffyKlAG/Q42CJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TNbU/QDS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TNbU/QDS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93F771F000FF;
	Mon, 28 Sep 2026 17:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790614878;
	bh=vu81zhKjqnPUIvjb7Ff2FAXPkfhchSgpcYLCuOD84Qw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TNbU/QDSclPbWod+6QwLsfskbZuT3dphOQ7IFx/sMaPaNebI+M7lW0T2rXiFA0cuL
	 ZS/iYnJOJ8KOh0ctiFp9ej5QK5xsWmVbvDsdHupSFV35wWvNOUVfHESTTuGn7VEE2X
	 RHklprIW0PIjpSOYjqOjDF4eswiKTATO8dUx7YW84K/OjOf06Rhr3+XzQZcYPluAVK
	 VCnUuh85hffiy7/aofMNbdAyiOs9weW+sUw1QEW1AaoPjpU4HUJhMMR+btPMFDqhRn
	 0LSO6VwW7YnKLNx0n4204zuKhZ5Grblj7IQoNBODbtBNQhvzqF945Y5oxsERuPqloR
	 ZfMmMZdJu6Fkg==
Date: Mon, 28 Sep 2026 18:01:11 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Pedro Falcato <pfalcato@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>, 
	Harry Yoo <harry@kernel.org>, Jann Horn <jannh@google.com>, Lance Yang <lance.yang@linux.dev>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, Pan Deng <pan.deng@intel.com>
Subject: Re: [PATCH] mm/vma: don't remove VMA from rmap if pgoff unchanged
Message-ID: <arqczL8K39qBoqgV@gremlin>
References: <20260925-speed-up-inplace-rmap-v1-1-babc48ce7c83@kernel.org>
 <arqI5QB5tUr8dd_r@pedro-suse.tail5790ac.ts.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arqI5QB5tUr8dd_r@pedro-suse.tail5790ac.ts.net>

On Mon, Sep 28, 2026 at 04:37:52PM +0100, Pedro Falcato wrote:
> On Fri, Sep 25, 2026 at 07:32:20PM +0100, Lorenzo Stoakes (ARM) wrote:
> > When updating a VMA, vma_prepare() unconditionally removes it from its rmap
> > interval trees under the rmap lock, and vma_complete() reinserts it before
> > releasing the lock.
> >
> > This is wholly unnecessary if its page offset (file rmap) or anonymous page
> > offset (anon rmap) is unchanged.
> >
> > So, track whether they will change in the newly introduced
> > vp->anon_pgoff_unchanged and vp->pgoff_unchanged fields, and use them to
> > determine whether to remove the VMA or not.
> >
> > The rmap lock keeps things safe as no rmap walks can concurrently occur
> > during the operation.
> >
> > Additionally, some architectures (arm, parisc, nios2, csky) have dcache
> > flush rmap walkers which take only flush_dcache_mmap_lock(), which is
> > likewise held across the operation.
> >
> > It's also necessary to keep the rb_subtree_last field updated in the
> > interval tree so implement anon_rmap_tree_update_inplace() and
> > mapping_rmap_tree_update_inplace() to do that.
> >
> > This is done in vma_complete(), after the VMA's range has been updated, so
> > in the interim the field may be invalid. However, given the locks described
> > above, this cannot be observed until after the state is corrected.
> >
> > The anonymous rmap is keyed on anon_vma_chains not VMAs, so in those
> > instances anon_rmap_tree_update_vma_inplace() iterates over
> > vma->anon_vma_chain, invoking anon_rmap_tree_update_inplace() on each one.
> >
> > For the anon rmap case, with CONFIG_DEBUG_VM_RB set, avc->cached_vma_last
> > is also updated in anon_rmap_tree_update_inplace().
> >
> > When performing a VMA shrink or a split where the VMA is the lower one, the
> > page offset cannot change, so set the flags unconditionally in these cases.
> >
> > When merging VMAs the page offset is unchanged only in some cases, so
> > update init_multi_vma_prep() to set the flags only if the page offsets
> > remain the same.
> >
> > These changes ultimately result in less rmap lock contention.
>
> I think this asks for numbers?

Well I don't have any :)

It logically reduces the contention, and that can only be a good thing.

Pan had some numbers, I've asked him to re-run against this one.

>
> >
> > Reported-by: Pan Deng <pan.deng@intel.com>
> > Closes: https://lore.kernel.org/linux-mm/20260924054301.2330822-1-pan.deng@intel.com/
> > Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> > ---
> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > ---
> >  include/linux/mm.h                |  3 +++
> >  mm/interval_tree.c                | 33 ++++++++++++++++++++++++++++++++
> >  mm/vma.c                          | 40 ++++++++++++++++++++++++++++++++++-----
> >  mm/vma.h                          |  2 ++
> >  tools/testing/vma/include/stubs.h |  8 ++++++++
> >  5 files changed, 81 insertions(+), 5 deletions(-)
> >
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index 6e71eaa4af3f..94c2eb055716 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -4357,6 +4357,8 @@ void mapping_rmap_tree_insert_after(struct vm_area_struct *vma,
> >  				    struct address_space *mapping);
> >  void mapping_rmap_tree_remove(struct vm_area_struct *vma,
> >  			      struct address_space *mapping);
> > +void mapping_rmap_tree_update_inplace(struct vm_area_struct *vma);
> > +
> >  struct vm_area_struct *
> >  mapping_rmap_tree_iter_first(struct address_space *mapping,
> >  			     pgoff_t pgoff_start, pgoff_t pgoff_last);
> > @@ -4374,6 +4376,7 @@ void anon_rmap_tree_insert(struct anon_vma_chain *avc,
> >  			   struct anon_vma *anon_vma);
> >  void anon_rmap_tree_remove(struct anon_vma_chain *avc,
> >  			   struct anon_vma *anon_vma);
> > +void anon_rmap_tree_update_inplace(struct anon_vma_chain *avc);
> >  struct anon_vma_chain *
> >  anon_rmap_tree_iter_first(struct anon_vma *anon_vma,
> >  			  pgoff_t pgoff_start, pgoff_t pgoff_last);
> > diff --git a/mm/interval_tree.c b/mm/interval_tree.c
> > index 7bbbf15cfbf0..eafde5d12ef5 100644
> > --- a/mm/interval_tree.c
> > +++ b/mm/interval_tree.c
> > @@ -64,6 +64,21 @@ void mapping_rmap_tree_remove(struct vm_area_struct *vma,
> >  	__mapping_rmap_tree_remove(vma, &mapping->i_mmap);
> >  }
> >
> > +/**
> > + * mapping_rmap_tree_update_inplace() - Update file rmap tree to reflect an
> > + * in-place change in a VMA's size.
> > + * @vma: The VMA whose size has changed.
> > + *
> > + * The file rmap lock must be held.
> > + *
> > + * Invalid to do so if @vma->vm_pgoff has changed.
> > + */
> > +void mapping_rmap_tree_update_inplace(struct vm_area_struct *vma)
> > +{
> > +	/* Propagate all the way up the tree. */
> > +	__mapping_rmap_tree_augment.propagate(&vma->shared.rb, NULL);
> > +}
> > +
> >  struct vm_area_struct *
> >  mapping_rmap_tree_iter_first(struct address_space *mapping,
> >  			     pgoff_t pgoff_start, pgoff_t pgoff_last)
> > @@ -111,6 +126,24 @@ void anon_rmap_tree_remove(struct anon_vma_chain *avc,
> >  	__anon_rmap_tree_remove(avc, &anon_vma->rb_root);
> >  }
> >
> > +/**
> > + * anon_rmap_tree_update_inplace() - Update anon rmap tree to reflect an
> > + * in-place change in the size of @avc's VMA.
> > + * @avc: The anon_vma_chain whose VMA's size has changed.
> > + *
> > + * The anon rmap root lock must be held.
> > + *
> > + * Invalid to do so if the VMA's anonymous pgoff has changed.
> > + */
> > +void anon_rmap_tree_update_inplace(struct anon_vma_chain *avc)
> > +{
> > +#ifdef CONFIG_DEBUG_VM_RB
> > +	avc->cached_vma_last = avc_last_pgoff(avc);
> > +#endif
> > +	/* Propagate all the way up the tree. */
> > +	__anon_rmap_tree_augment.propagate(&avc->rb, NULL);
> > +}
> > +
> >  struct anon_vma_chain *
> >  anon_rmap_tree_iter_first(struct anon_vma *anon_vma,
> >  			  pgoff_t pgoff_start, pgoff_t pgoff_last)
> > diff --git a/mm/vma.c b/mm/vma.c
> > index 077e23694143..8b333ec0c958 100644
> > --- a/mm/vma.c
> > +++ b/mm/vma.c
> > @@ -201,8 +201,15 @@ static void init_multi_vma_prep(struct vma_prepare *vp,
> >  	if (vp->file)
> >  		vp->mapping = vma->vm_file->f_mapping;
> >
> > -	if (vmg && vmg->skip_vma_uprobe)
> > +	if (!vmg)
> > +		return;
> > +
> > +	if (vmg->skip_vma_uprobe)
> >  		vp->skip_vma_uprobe = true;
> > +	if (vma_start_pgoff(vma) == vmg_start_pgoff(vmg))
> > +		vp->pgoff_unchanged = true;
>
> file_pgoff_unchanged perhaps? since we're distinguishing.

Yeah makes sense.

>
> In any case, I would prefer if we moved this logic to mm/interval_tree.c, or
> any rmap-related header. I don't love opencoding rmap tree assumptions this
> deep in vma.c code. WDYT?

Sure that's fair, will put it over there!

>
>
> Rest obviously looks great to me :)

Thanks :)

>
> > +	if (vma_start_anon_pgoff(vma) == vmg_start_anon_pgoff(vmg))
> > +		vp->anon_pgoff_unchanged = true;
> >  }
> >
> >  /*
> > @@ -331,6 +338,15 @@ anon_rmap_tree_post_update_vma(struct vm_area_struct *vma)
> >  		anon_rmap_tree_insert(avc, avc->anon_vma);
> >  }
> >
> > +static void
> > +anon_rmap_tree_update_vma_inplace(struct vm_area_struct *vma)
> > +{
> > +	struct anon_vma_chain *avc;
> > +
> > +	list_for_each_entry(avc, &vma->anon_vma_chain, same_vma)
> > +		anon_rmap_tree_update_inplace(avc);
> > +}
> > +
> >  /*
> >   * vma_prepare() - Helper function for handling locking VMAs prior to altering
> >   * @vp: The initialized vma_prepare struct
> > @@ -359,14 +375,16 @@ static void vma_prepare(struct vma_prepare *vp)
> >
> >  	if (vp->anon_vma) {
> >  		anon_vma_lock_write(vp->anon_vma);
> > -		anon_rmap_tree_pre_update_vma(vp->vma);
> > +		if (!vp->anon_pgoff_unchanged)
> > +			anon_rmap_tree_pre_update_vma(vp->vma);
> >  		if (vp->adj_next)
> >  			anon_rmap_tree_pre_update_vma(vp->adj_next);
> >  	}
> >
> >  	if (vp->file) {
> >  		flush_dcache_mmap_lock(vp->mapping);
> > -		mapping_rmap_tree_remove(vp->vma, vp->mapping);
> > +		if (!vp->pgoff_unchanged)
> > +			mapping_rmap_tree_remove(vp->vma, vp->mapping);
> >  		if (vp->adj_next)
> >  			mapping_rmap_tree_remove(vp->adj_next, vp->mapping);
> >  	}
> > @@ -387,7 +405,11 @@ static void vma_complete(struct vma_prepare *vp, struct vma_iterator *vmi,
> >  	if (vp->file) {
> >  		if (vp->adj_next)
> >  			mapping_rmap_tree_insert(vp->adj_next, vp->mapping);
> > -		mapping_rmap_tree_insert(vp->vma, vp->mapping);
> > +		/* Need only propagate the change inplace. */
> > +		if (vp->pgoff_unchanged)
> > +			mapping_rmap_tree_update_inplace(vp->vma);
> > +		else
> > +			mapping_rmap_tree_insert(vp->vma, vp->mapping);
>
> And perhaps similar for this, hiding update vs re-insert in interval tree
> code (via a helper) sounds cleaner.

OK will see how that looks!

>
> --
> Pedro

--
Cheers, Lorenzo
