Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328796;
	b=jrJOZ6CfG3WUg4jYKliRDOCRh7lSjz+E72rL9ZcPMrOT7ua7GiTDIHnQGx/BcHjd50QA
	 d5QjW8GYRR7oWyxec7G6mWGWFJcfG+dK+IlYPo0tezFhnY/6RDp74uVLBWAucWciy/pNi
	 gPXx6NrA5nMP53zXxQHcfZXUe3O+pNcP6bBYjy2yAF66mc2HVj5J9UNI0AYRH49Bqye0j
	 BX4PKlaCo79BJIEGZ6UWBx55y7cCkKG0bTOtMzjGeuyI9pn05FVuQZcVLO3RC3JSY0ati
	 XO7B/szmn5Q6cPioO1eYmoYFy/N5yVFVT+nNCI2zBK2fWNuOBW7M2Vehx/2o7PbIi6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328796;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=V3wQUDCbz5WGhoG/NeGMkM84FaWuj5GPriNi9gVRFwY=;
	b=mnp6TCqQVoPWCKZHsfktlOFrLZ/9e4EhaMvY/23EpqwKfhSrpD2X+mI3t1VmtRNP0rm8
	 0zviaUiN7uSiw6oatQBAww3z7RlpfwOlHwSXkGfuEG2nvn/NnBntir1F54QEUsCr3oTQO
	 JOViwLsDG9PlDidWuDg4wRmBKqS7D//GoUJ5ZjXQiCAjr5z1LorZ4mAzmbDnHcAZjg7Ff
	 K/zTQfkNdxzgDe2nf72SbofQjTg8SK+l/C3htTdoOys+JXzD1fKdhinFnUPFLw0tj6Zbm
	 2pXPuVYblTzjtuKtwnPglJROFayQwu0hDpua44QNTtTBKi6jUSapC6lESPBL8N+jZ0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NiJHgmnD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56388606A204
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NiJHgmnD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 776DE1F0089F;
	Tue, 10 Nov 2026 16:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794328796;
	bh=V3wQUDCbz5WGhoG/NeGMkM84FaWuj5GPriNi9gVRFwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NiJHgmnDww74FAeFIsbv4+tq/EeqvYG+bZKAr4d7/8YSmGKoSpdpPG46ETzA2ilqj
	 BHJSMVjnk/ffP59J5e5O7zGbra0IqtWpvbgdixT1oxlc1Tze8jUeTqK7xtlaWgzhK0
	 nlhUfVr5HUKmeVQG0WLvjudr7aFN5fIFomHIFhNjZr1Vv7rcUejmTvJPYIhWKqSBu1
	 hKrv+R/btHRAOY/cmSi7m8uxPaCRBPILRcWeXcMhyhuIwXzLy1sVnsYy0ThUI4qTEU
	 Gd3UM5JJowmSARk8hKzP4SdkuwFWhn2G7rSCLtMwRgMSEOjgFZRqGZlszEgEfhu7Fl
	 gfQ2UurT2EyKw==
Date: Tue, 10 Nov 2026 16:39:49 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	Lance Yang <lance.yang@linux.dev>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Seunghyun An <san55@wisc.edu>
Subject: Re: [PATCH] mm/vma: predicate vma_assert_stabilised() on
 CONFIG_DEBUG_VM
Message-ID: <avNIEdpUbihHULcm@gremlin>
References: <20261110-vma-fixup-debug-asserts-v1-1-0b2e0680cd7e@kernel.org>
 <avNAgtDzM0MYevV8@gremlin>
 <avNDjxZ9jeYiwdVh@gremlin>
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
In-Reply-To: <avNDjxZ9jeYiwdVh@gremlin>

On Tue, Nov 10, 2026 at 04:18:35PM +0000, Lorenzo Stoakes (ARM) wrote:
> On Tue, Nov 10, 2026 at 04:07:48PM +0000, Lorenzo Stoakes (ARM) wrote:
> > Andrew - could you update as below?
> >
> > Thanks!
> >
> > On Tue, Nov 10, 2026 at 03:10:40PM +0000, Lorenzo Stoakes (ARM) wrote:
> > [ ... ]
> > > diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
> > > index 9ccbbcbd7aca..9c3a9c6525c1 100644
> > > --- a/include/linux/mmap_lock.h
> > > +++ b/include/linux/mmap_lock.h
> > [ ... ]
> > >  /**
> > >   * vma_assert_stabilised() - assert that this VMA cannot be changed from
> > >   * underneath us either by having a VMA or mmap lock held.
> > > @@ -418,9 +423,18 @@ static inline void vma_assert_locked(const struct vm_area_struct *vma)
> > >   *
> > >   * With lockdep disabled we may sometimes race with other threads acquiring the
> > >   * mmap read lock simultaneous with our VMA read lock.
> > > + *
> > > + * Assert only if CONFIG_DEBUG_VM is set.
>
> Also this should say:
>
> 'Assert only if CONFIG_DEBUG_VM or CONFIG_LOCKDEP is set.'
>
> > >   */
> > >  static inline void vma_assert_stabilised(const struct vm_area_struct *vma)
> > >  {
> > > +	if (!IS_ENABLED(CONFIG_DEBUG_VM))
> >
> > Actually I think this should be:
> >
> > 	if (!IS_ENABLED(CONFIG_DEBUG_VM) || !IS_ENABLED(CONFIG_LOCKDEP))
>
> Sorry this should be...
>
> 	if (!IS_ENABLED(CONFIG_DEBUG_VM) && !IS_ENABLED(CONFIG_LOCKDEP))
>
> (I have a bit of a fever today, can you tell? :P)
>
> Thanks!

OK OK actually. Sorry. The change isn't required, it's fine :P

Please leave the patch as it is.

If !CONFIG_DEBUG_VM but CONFIG_LOCKDEP we don't actually assert anything.

Since this:

	if (IS_ENABLED(CONFIG_LOCKDEP)) {
		if (lockdep_is_held(&vma->vm_mm->mmap_lock))
			return;
	}

Is the only thing that would run in the functino and early-exit if the condition
is hit.

Then it defers to vma_assert_locked() which then reaches:

	if (IS_ENABLED(CONFIG_LOCKDEP)) {
		if (!lock_is_held(__vma_lockdep_map(vma)))
			vma_assert_write_locked(vma);
		return;
	}

And vma_assert_write_locked() uses VM_WARN_ON_ONCE_VMA().

(flu vaccine on sunday, seems to have impacted my brain :P)

--
Cheers, Lorenzo
