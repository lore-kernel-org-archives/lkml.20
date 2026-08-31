Received: from mta0.migadu.com (out-145.mta0.migadu.com [91.218.175.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A650E37F8A4
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 20:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788207119; cv=none; b=aJL1dTYGswj/MB0Hsk6xYg5deBUXqNoUf0Ps6CkEIKBy5eCX9/fXrBrNgFof3kmjyJLyuPaNQVGYqiVbe56j58E3Y8m6Ku/Eqof6DzQOLXRg4xShYwn8OTdsluWKwdOJ/6uRJQDMLYx26IFD2ej2HRetKQZ4SjdvFwWx2j1mlr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788207119; c=relaxed/simple;
	bh=pO9WzaMlnDtRmhi6xRUcfdA0+B48EsQ07ONaGw0vVg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uRn2yPp6oJRB9MbdpsJt74WDNcwKWj1AKml7qarFywc74YyyGyD85bQg1TZWH2dRj1C3aoWmd1gVLOfZMVC84BBNV58W5ie+6t1IoVq65/y3VepMZr5qw3Y90TgUjl9942FQCTvb/p0sm0+U505vUWSorihYkE65o+HUbt4EXDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pdiiErue; arc=none smtp.client-ip=91.218.175.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pdiiErue"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pO9WzaMlnDtRmhi6xRUcfdA0+B48EsQ07ONaGw0vVg4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788207113; v=1; x=1788811913;
 b=pdiiErueI/4ykFSMaMrTu6n/KZlxpMXTuY714/4L4hn1yijhzli4WrfbmlyYUYQzzXHVNNab
 ZnoJU38IO7fvCukF6pYoG2juYln32qokzBletFXyTe3uXi5PgR1GxmLdAImSERLG8jtPfFgh14N
 1fJkk+04ns7PorNL70zY/9ME=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 26b7e198d83c3824;
	Mon, 31 Aug 2026 20:11:53 +0000
X-Mizu-Trace-ID: 26b7e198d83c3824
X-Migadu-Flow: FLOW_OUT
Date: Mon, 31 Aug 2026 13:11:52 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Hugh Dickins <hughd@google.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	syzbot <syzbot+cd2073ee6d958a8d0fcd@syzkaller.appspotmail.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [mm?] WARNING in __mod_zone_page_state
Message-ID: <apXJaU38jQaLr3aO@linux.dev>
References: <6a931c5a.08e933ee.dbf97.0093.GAE@google.com>
 <apNjw0HRyr1Oj7q4@linux.dev>
 <apOAF5CPFWUUH9du@linux.dev>
 <a2288e73-5001-2104-1e7a-2b383e7edd61@google.com>
 <apO7GDwIgyhdn3t7@linux.dev>
 <4793259a-00da-ea31-8cbd-a6cb5bf48692@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4793259a-00da-ea31-8cbd-a6cb5bf48692@google.com>

On Sun, Aug 30, 2026 at 10:29:46AM -0700, Hugh Dickins wrote:
> On Sat, 29 Aug 2026, Shakeel Butt wrote:
> > On Sat, Aug 29, 2026 at 08:26:02PM -0700, Hugh Dickins wrote:
> ...
> > > 
> > > Thanks for looking into this, Shakeel, but I don't think complicating
> > > __munlock_folio() is at all the right fix. This is peculiar to the use
> > > by mlock_drain_remote(), isn't it? Which is not taking the usual local_lock
> > > because the CPU is going offline. I would say, just take the local_lock in
> > > mlock_drain_remote(), but (I haven't read the history) for all I know,
> > > there may be PREEMPT_RT reasons why that would be completely wrong.
> > > 
> > > Hugh
> > 
> > Thanks Hugh, I will explore the local_lock approach.
> 
> Please do. But we may need input from Sebastian. So far as I can see,
> page_alloc_cpu_dead()'s neighbouring use of lru_add_drain_cpu(cpu)
> would suffer from the exact same issue, there are __counts there too.
> Maybe syzbot has not discovered that yet, or maybe I'm confused.
> 
> (But you'll understand that I don't particularly welcome a reorg of
> the local_locking around the lru_add_drains at the moment; and there's
> at least one among them which takes advantage of the fbatch local_lock
> to lock something else too.)
> 
> Oh for the good old days when we were allowed to say preempt_disable()!
> 
> > BTW I simplified the
> > fix to the following. is this still making things more complicated?
> 
> That is less distracting than your first one, but it's still not the
> right fix: the right fix is to have the function called under the
> proper conditions in all cases.
> 
> > 
> > diff --git a/mm/mlock.c b/mm/mlock.c
> > index efa6716e4dfb..fa30ffed76ab 100644
> > --- a/mm/mlock.c
> > +++ b/mm/mlock.c
> > @@ -141,11 +141,16 @@ static struct lruvec *__munlock_folio(struct folio *folio, struct lruvec *lruvec
> >  
> >  munlock:
> >  	if (folio_test_clear_mlocked(folio)) {
> > -		__zone_stat_mod_folio(folio, NR_MLOCK, -nr_pages);
> > +		/*
> > +		 * This runs both with and without the lruvec lock held, and
> > +		 * mlock_drain_remote() reaches it fully preemptible, so use
> > +		 * the accessors that serialize themselves.
> 
> I'm very far from being a good advisor on PREEMPT_RT,
> but I think that comment about lruvec lock would be wrong there.
> 

(Let me appologize upfront on dumping a lot of text)

I think I have a more important question:

I see other than __munlock_folio, we always update NR_MLOCK with irq-safe
variant of zone stat update function i.e. zone_stat_mod_folio(). This led me to
a rabbit hole of proving or disproving that NR_MLOCK can be updated from irq
context.

Disclaimer: I took full benefit of AI/LLM to create reproducers.

First scenario I gave AI to create reproducer was for a mlocked region, initiate
a direct IO (DIO) from it and then madvise(MADV_DONTNEED_LOCKED) on it. I was
hoping that I will see last folio reference in IO completion context and
NR_MLOCK getting updated then but AI came up with code paths on why it is
possible:

	MADV_DONTNEED_LOCKED -> NR_MLOCK decrement:

	madvise(MADV_DONTNEED_LOCKED)
	  madvise_dontneed_free()                 mm/madvise.c   (VM_LOCKED not in `forbidden`)
	    madvise_dontneed_single_vma()
	      zap_vma_range_batched() -> zap_pte_range() -> zap_present_folio_ptes()
		folio_remove_rmap_ptes()          mm/memory.c    (or via tlb_flush_rmaps() if delay_rmap)
		  __folio_remove_rmap()
		    munlock_vma_folio(folio, vma) mm/rmap.c -> mm/internal.h
		      if (vma->vm_flags & VM_LOCKED)      <-- STILL SET
			munlock_folio(folio)      mm/mlock.c
			  folio_get(folio)                <-- reference taken
			  folio_batch_add(&mlock_fbatch.fbatch, folio)

	  ... later, process context ...
	  mlock_folio_batch()                     mm/mlock.c
	    __munlock_folio()
	      folio_test_clear_mlocked(folio)             <-- PG_mlocked cleared
	      zone_stat_mod_folio(folio, NR_MLOCK, -nr)   <-- the decrement
	    folios_put(fbatch)                            <-- that reference dropped


However AI came up with a different scenario where NR_MLOCK can be decremented
in the irq context through free path. Just replace madvise(MADV_DONTNEED_LOCKED)
with munlock()+truncate. There is a race where munlock() resets VM_LOCKED from
vma and then table table traversal to call munlock_folio() on individual folios
and fallocate(PUNCH_HOLE) jumping in between that window and calling
try_to_unmap_one() and not able to call munlock_folio() due to lack of VM_LOCKED
in the vma.

AI was able to get the reproducer as well and the full stack traces are below:

Path A — the one the WARN caught

	blk completion softirq:

	blk_done_softirq()                              block/blk-mq.c:1225   (open_softirq(BLOCK_SOFTIRQ,...))
	  blk_complete_reqs(this_cpu_ptr(&blk_cpu_done))
	    blk_mq_end_request()                        block/blk-mq.c
	      blk_update_request()
		bio_endio(bio)
		  iomap_dio_bio_end_io()                fs/iomap/direct-io.c:278
		    __iomap_dio_bio_end_io()            fs/iomap/direct-io.c:241
		      bio_release_pages(bio, false)     fs/iomap/direct-io.c:255
			__bio_release_pages()           block/bio.c:1165
			  bio_for_each_folio_all(fi, bio)
			    unpin_user_folio(fi.folio, nr_pages)   mm/gup.c:434
			      gup_put_folio(folio, npages, FOLL_PIN)  mm/gup.c:102
				folio_put_refs(folio, refs)          include/linux/mm.h:2177
				  folio_ref_sub_and_test() -> true   <-- LAST REFERENCE
				  __folio_put(folio)                 mm/folio.c:100
				    free_frozen_pages()              mm/page_alloc.c:2997
				      __free_pages_ok()              (order > PAGE_ALLOC_COSTLY_ORDER: ext4 large folio)
					__free_pages_prepare()       mm/page_alloc.c
					  if (unlikely(folio_test_mlocked(folio))) {
						  __folio_clear_mlocked(folio);
						  zone_stat_mod_folio(folio, NR_MLOCK, -nr_pages);   <-- HERE
						  count_vm_events(UNEVICTABLE_PGCLEARED, nr_pages);
					  }

	The precondition — why PG_mlocked is still set when it gets there

	task 1:  mmap(MAP_SHARED, victim) ; mlock()          -> page cache folios get PG_mlocked
	task 1:  pwrite(O_DIRECT_fd, region, len)            -> iov_iter_extract_pages() FOLL_PIN
								pins those same mlocked folios
	task 2:  munlock(region)
		   mlock_fixup()                              mm/mlock.c
		     mlock_vma_pages_range()                  mm/mlock.c:428
		       vma_flags_reset_once(vma, ...)         line 451  <-- VM_LOCKED CLEARED
		       walk_page_range_vma(mlock_walk_ops)    line 454  <-- per-folio munlock walk
									    (holds mmap_lock for WRITE)
	task 3:  fallocate(PUNCH_HOLE) on the same range      <-- reaches the folio via i_mmap_rwsem,
		   truncate_inode_pages_range()                   NOT mmap_lock, so it is not excluded
		     truncate_cleanup_folio() -> unmap_mapping_folio()
		       try_to_unmap_one() -> folio_remove_rmap_pte()
			 __folio_remove_rmap()                mm/rmap.c:1889
			   munlock_vma_folio(folio, vma)      mm/internal.h:983
			     if (vma->vm_flags & VM_LOCKED)   <-- FALSE, window at line 451..454
				 munlock_folio(folio);        <-- NOT taken: nothing queued,
								  no folio_get() reference
		     filemap_remove_folio()                   <-- page cache reference dropped

	The bio's pin is now the only reference, PG_mlocked is still set, and it is released by Path A in softirq.


The reason I am sharing this information is that a simple lock_lock is
not sufficient and we definitely need to change __zone_stat_mod_folio(NR_MLOCK)
to zone_stat_mod_folio(NR_MLOCK) in __munlock_folio.


