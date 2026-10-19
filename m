Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E392A4EE870;
	Mon, 19 Oct 2026 12:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792412393; cv=none; b=aqYQo9uDZ923u1nvNWrkR9sQ8AnH9dINFojQy3FvaCmcF7FcdZLB/xetFLlJiy9LzzRDnkpHRDANgy/Zxbm+apJ41IGxSz9mUdra+q4qFGfxhYfuVs15wAyAgnjK9AAC4mJT2wylzggmK6Mk/bfghG68Y9GrQn3YAk4JVCtLkHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792412393; c=relaxed/simple;
	bh=cFLPoZ1cnExc2TFt+Ex/JHN8H35hTkQDZO0BQhjKlKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tf4WyX31qA/2ccZ66MZl8Q7eA+MPaCYB4LShoo2e4QPLI2MrRupgtIwXRJWuWaokMnY8tHnqSD6d+VoeZ9a3G2JLuEJ9Wwnte24Nh1m+DkamQELTQSIROsFA/wE5aPvim3H6oFSN2gtpOA8YrEidTFuFbUr1muoDPCsgVf8yVGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZZ40E/VC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZZ40E/VC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0014D1F000C4;
	Mon, 19 Oct 2026 12:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792412391;
	bh=Q9hc5cIkyPezjts4c8r6cEvhiZGbSkNeXgJkba3+Ks0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZZ40E/VCmFDgut286wgaCHh17UAGwN+J1SGcdJ1lynmahPLbL8fK+Vq7XLtg8A79R
	 4k+/Y8JK01Vmt2melYAgFaFLvB/EJ2FcIftKpK1wQWIB3WNUTB3GfothUMQ1Np2jlc
	 3PEU/mOIZBlGJuDf6Lc2PrgGIQrrQ/lAAZKxo9iBfbdK71hGst9X2E8TltCLqWFUMb
	 wTImVBTPBY6WmRlIHA9Ie6MYtizSsfToOxumT/vyix9yGLaC6n+gGfs4wFvpHXwIlk
	 vY15WF/wkS2EEKq7C2MKgYjGV5W6UHVsr1ckHmJ/eGUegcoyIH9hj05ZG4M+oTg46y
	 vEFzh2mwJXDUQ==
Date: Mon, 19 Oct 2026 13:19:45 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Pedro Falcato <pfalcato@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Jann Horn <jannh@google.com>, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, 
	Daehyeon Ko <4ncienth@gmail.com>
Subject: Re: [PATCH v2] mm/vma: avoid spurious write locks when
 mm->mm_lock_seq overflows
Message-ID: <atYJA7nIu_RwpoCC@gremlin>
References: <20261016-fix-vma-lock-overflow-v2-1-9eb778b79b58@kernel.org>
 <atXjbsDn7DJybsHU@pedro-suse.tail5790ac.ts.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atXjbsDn7DJybsHU@pedro-suse.tail5790ac.ts.net>

On Mon, Oct 19, 2026 at 10:53:27AM +0100, Pedro Falcato wrote:
> On Fri, Oct 16, 2026 at 12:34:33PM +0100, Lorenzo Stoakes (ARM) wrote:

> > So I think it's fine to just send it (early :) in the merge window.
> > ---
> > v2:
> > * Updated comment in vma_seqcount_is_write_locked() to mention the VMA
> >   being attached.
> > * Renamed reset_vma_seqcounts() to __mm_reset_vma_seqcounts().
> > * Used acquire semantics in vma_start_reads() to avoid race with reset -
> >   there is another acquire immediately after this one so it should just be
> >   noise perf-wise.
> > * Removed stable tag, will do the backports manually (just make the value
> >   64 bits...)
>
> I guess you're fitting this where __vm_anon_pgoff_lo now sits? If so, then
> this patch probably wants backporting to 7.3.

Ack.

> > +/*
> > + * Called with mmap write lock held after mm->mm_lock_seq just overflowed (and
> > + * therefore zero), with all VMA write locks now released.
> > + *
> > + * The stores below follow the smp_wmb() in do_raw_write_seqcount_end(), so
> > + * a reader that observes a reset value also observes this cycle's VMA
> > + * modifications (ordered by the ACQUIRE on vma->vm_lock_seq in
> > + * vma_start_read()).
> > + */
> > +void __mm_reset_vma_seqcounts(struct mm_struct *mm)
> > +{
> > +	struct vm_area_struct *vma;
> > +	VMA_ITERATOR(vmi, mm, 0);
> > +
> > +	mmap_assert_write_locked(mm);
> > +	VM_WARN_ON_ONCE(mm->mm_lock_seq.sequence);
> > +
> > +	/*
> > +	 * Failing to reset means stale vma->vm_lock_seq values could result in
> > +	 * those VMAs becoming spuriously write locked when mm->mm_lock_seq
> > +	 * happens to match their values.
> > +	 *
> > +	 * This is problematic, as it causes the VMA write lock to not exclude
> > +	 * readers, which can result in concurrent readers while a VMA write
> > +	 * lock is held.
> > +	 *
> > +	 * Avoid this by resetting to an even value (indicates no write lock
> > +	 * held).
> > +	 *
> > +	 * Readers will either observe zero (not write locked) or the previous
> > +	 * value, so this is safe.
> > +	 */
> > +	for_each_vma(vmi, vma)
> > +		WRITE_ONCE(vma->vm_lock_seq, 0);
>
> I'm concerned by the possible latency when doing this to many VMAs. Do you
> have any numbers?

No, somebody schloppened a patch for a real issue and I haven't the time to do
even the things I need to do let alone 'here's a new task' stuff :)

However, this is a simple write to every VMA, done at the point the mmap write
lock is held with all VMA write locks dropped.

It was implemented such that:

* No VMA write lock is taken on the VMAs.
* VMA read locks can proceed.

I.e. it amounts to a loop over VMAs and a write to a field.

I don't think you could possibly do more to reduce latency here, and you
absolutely have to update this field across the board.

Under any realistic workloads this will occur at worst ~days intervals, often
far longer, and likely you will see quite some gaps between separate processes
experiencing it.

There's also an upper bound of vm.max_map_count per-process, so it can't explode
into something truly insane.

Most processes don't have that many VMAs, other than certain steam games :) so
it's hard to imagine there really would be that much latency here.

And the latency is occurring on one thread, which is performing an mmap unlock,
so nobody sane will put that on a hot path.

--
Cheers, Lorenzo
