Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9AF49E130
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790609897; cv=none; b=lGmD7i54dccUD1BfN5oWkR0OyTsYUQIN8F6hXU3+BHjqlxRyfBcyzjmIHbLi2nEZNN49E8+lovK2G9WtZWs7qWjHXsykwdoL5BkoRV+xe6yPCyyFXmwTLkVwl24Xh7ApBRCwiUIwPRqwbQjtK6jYNNzu2my/NNan9oNZ6kczovY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790609897; c=relaxed/simple;
	bh=9k6aKeFH/U4QRbtuTqsqn81V8AHXY2i67dKc1sEBKCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ew9vq4ies9kALoLSgXZFyCQerOD6sesdackrl+cMzI2fgKP2RhFyFrUnrHB3B8klUsY5HfEtmYLD5bqfg3Pa41oAJUVtAdEoxYG0lYHhIZLG+Wz+qmS+5pOL/VyFYotZyYN6Dl1TNOwoqx9sVv1MJ/IqZpqLaFXzZ1vBoRSGplY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gsr+kq6S; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LKAnJVNH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=euolCOmJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NBSYNFWL; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gsr+kq6S";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LKAnJVNH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="euolCOmJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NBSYNFWL"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3842321BBF;
	Mon, 28 Sep 2026 15:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790609888; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p1mVNj3GmuQmUn8QUDG5rPJ6I+BRzW4FmaeJ4FUK+B8=;
	b=gsr+kq6SdRJgCYqSY1CTkAP7tbA2ngDvfros0fFzvN2azAhw9NnnELOksc5Qh/ufQcQHcY
	yYgZrxcIQWguRnfTQRnYB5lfQZlSWgKojQfkmL5APF4U45PxEbYOIyydPtrqREcswDu/Wo
	MLd2/prnMZhgDhkH35Z8lbLcKLqsnXU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790609888;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p1mVNj3GmuQmUn8QUDG5rPJ6I+BRzW4FmaeJ4FUK+B8=;
	b=LKAnJVNHviA6OFWe4pqnUpGpl500RvpMg+m+JvYqS6Zxfwwbm361ETWwBVTyfRKSpvrP4q
	3QJ9wuUmKvcHbZBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=euolCOmJ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=NBSYNFWL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790609884; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p1mVNj3GmuQmUn8QUDG5rPJ6I+BRzW4FmaeJ4FUK+B8=;
	b=euolCOmJ4qejES4tqXBlRkgahEWxgMANsJSKJbFr5by6+hd87KtOSQ+skTpJSvpzE3qDhW
	DDBVcuo4IS3VMjd5Qhe7Dw0k9e42DI3Kd20zE7R17Dydk6A0XTK+Kn4PPP0ZqO55DkwhH6
	0PsVZXwH1oPXKMzmQd5lPziSnBbuQLQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790609884;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p1mVNj3GmuQmUn8QUDG5rPJ6I+BRzW4FmaeJ4FUK+B8=;
	b=NBSYNFWLMeT7LxCo5F0fowqyomTCgeT3AD6gISlAtbmtXplgR1v6B7906z5jUlZovv8QoB
	fSB0+gSSCCmcrKAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D6A2B133F3;
	Mon, 28 Sep 2026 15:38:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id am0/GNqJumoQRwAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Mon, 28 Sep 2026 15:38:02 +0000
Date: Mon, 28 Sep 2026 16:37:52 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>, 
	Harry Yoo <harry@kernel.org>, Jann Horn <jannh@google.com>, Lance Yang <lance.yang@linux.dev>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, Pan Deng <pan.deng@intel.com>
Subject: Re: [PATCH] mm/vma: don't remove VMA from rmap if pgoff unchanged
Message-ID: <arqI5QB5tUr8dd_r@pedro-suse.tail5790ac.ts.net>
References: <20260925-speed-up-inplace-rmap-v1-1-babc48ce7c83@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-speed-up-inplace-rmap-v1-1-babc48ce7c83@kernel.org>
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 3842321BBF
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,intel.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,pedro-suse.tail5790ac.ts.net:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -4.51

On Fri, Sep 25, 2026 at 07:32:20PM +0100, Lorenzo Stoakes (ARM) wrote:
> When updating a VMA, vma_prepare() unconditionally removes it from its rmap
> interval trees under the rmap lock, and vma_complete() reinserts it before
> releasing the lock.
> 
> This is wholly unnecessary if its page offset (file rmap) or anonymous page
> offset (anon rmap) is unchanged.
> 
> So, track whether they will change in the newly introduced
> vp->anon_pgoff_unchanged and vp->pgoff_unchanged fields, and use them to
> determine whether to remove the VMA or not.
> 
> The rmap lock keeps things safe as no rmap walks can concurrently occur
> during the operation.
> 
> Additionally, some architectures (arm, parisc, nios2, csky) have dcache
> flush rmap walkers which take only flush_dcache_mmap_lock(), which is
> likewise held across the operation.
> 
> It's also necessary to keep the rb_subtree_last field updated in the
> interval tree so implement anon_rmap_tree_update_inplace() and
> mapping_rmap_tree_update_inplace() to do that.
> 
> This is done in vma_complete(), after the VMA's range has been updated, so
> in the interim the field may be invalid. However, given the locks described
> above, this cannot be observed until after the state is corrected.
> 
> The anonymous rmap is keyed on anon_vma_chains not VMAs, so in those
> instances anon_rmap_tree_update_vma_inplace() iterates over
> vma->anon_vma_chain, invoking anon_rmap_tree_update_inplace() on each one.
> 
> For the anon rmap case, with CONFIG_DEBUG_VM_RB set, avc->cached_vma_last
> is also updated in anon_rmap_tree_update_inplace().
> 
> When performing a VMA shrink or a split where the VMA is the lower one, the
> page offset cannot change, so set the flags unconditionally in these cases.
> 
> When merging VMAs the page offset is unchanged only in some cases, so
> update init_multi_vma_prep() to set the flags only if the page offsets
> remain the same.
> 
> These changes ultimately result in less rmap lock contention.

I think this asks for numbers?

> 
> Reported-by: Pan Deng <pan.deng@intel.com>
> Closes: https://lore.kernel.org/linux-mm/20260924054301.2330822-1-pan.deng@intel.com/
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> ---
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  include/linux/mm.h                |  3 +++
>  mm/interval_tree.c                | 33 ++++++++++++++++++++++++++++++++
>  mm/vma.c                          | 40 ++++++++++++++++++++++++++++++++++-----
>  mm/vma.h                          |  2 ++
>  tools/testing/vma/include/stubs.h |  8 ++++++++
>  5 files changed, 81 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 6e71eaa4af3f..94c2eb055716 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -4357,6 +4357,8 @@ void mapping_rmap_tree_insert_after(struct vm_area_struct *vma,
>  				    struct address_space *mapping);
>  void mapping_rmap_tree_remove(struct vm_area_struct *vma,
>  			      struct address_space *mapping);
> +void mapping_rmap_tree_update_inplace(struct vm_area_struct *vma);
> +
>  struct vm_area_struct *
>  mapping_rmap_tree_iter_first(struct address_space *mapping,
>  			     pgoff_t pgoff_start, pgoff_t pgoff_last);
> @@ -4374,6 +4376,7 @@ void anon_rmap_tree_insert(struct anon_vma_chain *avc,
>  			   struct anon_vma *anon_vma);
>  void anon_rmap_tree_remove(struct anon_vma_chain *avc,
>  			   struct anon_vma *anon_vma);
> +void anon_rmap_tree_update_inplace(struct anon_vma_chain *avc);
>  struct anon_vma_chain *
>  anon_rmap_tree_iter_first(struct anon_vma *anon_vma,
>  			  pgoff_t pgoff_start, pgoff_t pgoff_last);
> diff --git a/mm/interval_tree.c b/mm/interval_tree.c
> index 7bbbf15cfbf0..eafde5d12ef5 100644
> --- a/mm/interval_tree.c
> +++ b/mm/interval_tree.c
> @@ -64,6 +64,21 @@ void mapping_rmap_tree_remove(struct vm_area_struct *vma,
>  	__mapping_rmap_tree_remove(vma, &mapping->i_mmap);
>  }
>  
> +/**
> + * mapping_rmap_tree_update_inplace() - Update file rmap tree to reflect an
> + * in-place change in a VMA's size.
> + * @vma: The VMA whose size has changed.
> + *
> + * The file rmap lock must be held.
> + *
> + * Invalid to do so if @vma->vm_pgoff has changed.
> + */
> +void mapping_rmap_tree_update_inplace(struct vm_area_struct *vma)
> +{
> +	/* Propagate all the way up the tree. */
> +	__mapping_rmap_tree_augment.propagate(&vma->shared.rb, NULL);
> +}
> +
>  struct vm_area_struct *
>  mapping_rmap_tree_iter_first(struct address_space *mapping,
>  			     pgoff_t pgoff_start, pgoff_t pgoff_last)
> @@ -111,6 +126,24 @@ void anon_rmap_tree_remove(struct anon_vma_chain *avc,
>  	__anon_rmap_tree_remove(avc, &anon_vma->rb_root);
>  }
>  
> +/**
> + * anon_rmap_tree_update_inplace() - Update anon rmap tree to reflect an
> + * in-place change in the size of @avc's VMA.
> + * @avc: The anon_vma_chain whose VMA's size has changed.
> + *
> + * The anon rmap root lock must be held.
> + *
> + * Invalid to do so if the VMA's anonymous pgoff has changed.
> + */
> +void anon_rmap_tree_update_inplace(struct anon_vma_chain *avc)
> +{
> +#ifdef CONFIG_DEBUG_VM_RB
> +	avc->cached_vma_last = avc_last_pgoff(avc);
> +#endif
> +	/* Propagate all the way up the tree. */
> +	__anon_rmap_tree_augment.propagate(&avc->rb, NULL);
> +}
> +
>  struct anon_vma_chain *
>  anon_rmap_tree_iter_first(struct anon_vma *anon_vma,
>  			  pgoff_t pgoff_start, pgoff_t pgoff_last)
> diff --git a/mm/vma.c b/mm/vma.c
> index 077e23694143..8b333ec0c958 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -201,8 +201,15 @@ static void init_multi_vma_prep(struct vma_prepare *vp,
>  	if (vp->file)
>  		vp->mapping = vma->vm_file->f_mapping;
>  
> -	if (vmg && vmg->skip_vma_uprobe)
> +	if (!vmg)
> +		return;
> +
> +	if (vmg->skip_vma_uprobe)
>  		vp->skip_vma_uprobe = true;
> +	if (vma_start_pgoff(vma) == vmg_start_pgoff(vmg))
> +		vp->pgoff_unchanged = true;

file_pgoff_unchanged perhaps? since we're distinguishing.

In any case, I would prefer if we moved this logic to mm/interval_tree.c, or
any rmap-related header. I don't love opencoding rmap tree assumptions this
deep in vma.c code. WDYT?


Rest obviously looks great to me :)

> +	if (vma_start_anon_pgoff(vma) == vmg_start_anon_pgoff(vmg))
> +		vp->anon_pgoff_unchanged = true;
>  }
>  
>  /*
> @@ -331,6 +338,15 @@ anon_rmap_tree_post_update_vma(struct vm_area_struct *vma)
>  		anon_rmap_tree_insert(avc, avc->anon_vma);
>  }
>  
> +static void
> +anon_rmap_tree_update_vma_inplace(struct vm_area_struct *vma)
> +{
> +	struct anon_vma_chain *avc;
> +
> +	list_for_each_entry(avc, &vma->anon_vma_chain, same_vma)
> +		anon_rmap_tree_update_inplace(avc);
> +}
> +
>  /*
>   * vma_prepare() - Helper function for handling locking VMAs prior to altering
>   * @vp: The initialized vma_prepare struct
> @@ -359,14 +375,16 @@ static void vma_prepare(struct vma_prepare *vp)
>  
>  	if (vp->anon_vma) {
>  		anon_vma_lock_write(vp->anon_vma);
> -		anon_rmap_tree_pre_update_vma(vp->vma);
> +		if (!vp->anon_pgoff_unchanged)
> +			anon_rmap_tree_pre_update_vma(vp->vma);
>  		if (vp->adj_next)
>  			anon_rmap_tree_pre_update_vma(vp->adj_next);
>  	}
>  
>  	if (vp->file) {
>  		flush_dcache_mmap_lock(vp->mapping);
> -		mapping_rmap_tree_remove(vp->vma, vp->mapping);
> +		if (!vp->pgoff_unchanged)
> +			mapping_rmap_tree_remove(vp->vma, vp->mapping);
>  		if (vp->adj_next)
>  			mapping_rmap_tree_remove(vp->adj_next, vp->mapping);
>  	}
> @@ -387,7 +405,11 @@ static void vma_complete(struct vma_prepare *vp, struct vma_iterator *vmi,
>  	if (vp->file) {
>  		if (vp->adj_next)
>  			mapping_rmap_tree_insert(vp->adj_next, vp->mapping);
> -		mapping_rmap_tree_insert(vp->vma, vp->mapping);
> +		/* Need only propagate the change inplace. */
> +		if (vp->pgoff_unchanged)
> +			mapping_rmap_tree_update_inplace(vp->vma);
> +		else
> +			mapping_rmap_tree_insert(vp->vma, vp->mapping);

And perhaps similar for this, hiding update vs re-insert in interval tree
code (via a helper) sounds cleaner.

-- 
Pedro
