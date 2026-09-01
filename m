Received: from mta0.migadu.com (out-215.mta0.migadu.com [91.218.175.215])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3E3459AE7
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.215
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250452; cv=none; b=Z7Wb2S+D9MZfuu++ek/6N2WMkP6a0ImsdHTiUsT3c9kuqobLePHgfP+Rjh6mMYsCy3GLbnhypb+05xlAkMzmPSgPR2nB1pjgVoy90+RH4uVyWDSGdS22rZWO5FO0Xr4F+emNWyJEfLWLPZhdBLiN4BiB3ZNfnooAXojdDb+B63M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250452; c=relaxed/simple;
	bh=bV4kcBvH/DWH/5vJ1R7+0iB1kjHHNS7RhB31HwS5w6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EzXl2UlLtz7amQKAPHycW1VuZRNLW9QSZ7Y0mmzF6tFHYJmYVZ7kse1FX+GaxKG49e+J0bpUlSb0FQsMd7rFUpj7mfFkKH0nqQpgGQ6IqZrJcNLsjwCk22+BAPM+tsNOjJbB7wV7PMQrhNWvgC6jgLy40rFiLnvTCKKuq1zyRME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Z4nRn4e3; arc=none smtp.client-ip=91.218.175.215
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Z4nRn4e3"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bV4kcBvH/DWH/5vJ1R7+0iB1kjHHNS7RhB31HwS5w6E=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788250447; v=1; x=1788855247;
 b=Z4nRn4e3So7F5EGRLac5Ypi0WLnBdMDgBE/1FXKDk6TwxkfJDalOb7ZBwDMElSwlFZedtIn6
 DDiqnvmXtam/mutNQrfoSRkY0eRVmC7Pcy3SotRRS6bcwKDHQoF1oIKPIWzXSbHsRMm266m6POy
 gwtwaZwLfCWVuXN3dmf457d4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 569a57e56a310cb2;
	Tue, 01 Sep 2026 08:13:57 +0000
X-Mizu-Trace-ID: 569a57e56a310cb2
X-Migadu-Flow: FLOW_OUT
Date: Tue, 1 Sep 2026 16:13:47 +0800
From: Hao Li <hao.li@linux.dev>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Harry Yoo <harry@kernel.org>, Hyunwoo Kim <imv4bel@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/slab: take n->list_lock for the list_add() in
 __refill_objects_node()
Message-ID: <apaIWBnTJkM52hMy@fedora>
References: <apPa-cGLcyt90l-E@v4bel>
 <apQU8wjMlvbKBQgh@dev>
 <apQ7osHcRj3vdJPn@fedora>
 <ae25c193-b95f-40c1-83b6-1c2546467e41@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae25c193-b95f-40c1-83b6-1c2546467e41@kernel.org>

On Mon, Aug 31, 2026 at 02:55:06PM +0200, Vlastimil Babka (SUSE) wrote:
> On 8/30/26 16:35, Hao Li wrote:
> > On Sun, Aug 30, 2026 at 12:45:17PM +0000, Harry Yoo wrote:
> >> On Sun, Aug 30, 2026 at 04:25:45PM +0900, Hyunwoo Kim wrote:
> >> > In __refill_objects_node(), the list_add(&slab->slab_list, &pc.slabs) that
> >> > follows a successful __slab_try_return_freelist() is done without
> >> > n->list_lock.
> >> >
> >> > __slab_try_return_freelist() only succeeds while slab->freelist is NULL. The
> >> > slab we are refilling from is taken off pc.slabs by the list_del() at the
> >> > top of the loop, so at that point it is on no list.
> >> > 
> >> > If another CPU frees an object of that slab, __slab_free() sees the slab as
> >> > full and puts it back on n->partial. If a third CPU then takes that object
> >> > in get_from_partial_node(), the freelist becomes NULL again.
> >> 
> >> Ouch. Good catch, Hyunwoo.
> >> A classic ABA problem :)
> 
> Ouch, indeed.
> 
> >> > A slab that sits on n->partial with a NULL freelist only exists while
> >> > get_from_partial_node() holds n->list_lock, between its cmpxchg and its
> >> > remove_partial().
> >> > 
> >> > A list_add() in that window overwrites slab_list to point into pc.slabs.
> >> > The list_del() in remove_partial() then follows the overwritten links, so it
> >> > unlinks the slab from pc.slabs and poisons slab_list while leaving the
> >> > n->partial side alone. n->partial is left pointing at the poisoned slab.
> >> > 
> >> >            CPU0                        CPU1                  CPU2
> >> > 
> >> >   __refill_objects_node()
> >> >     get_partial_node_bulk()   // n->partial to pc.slabs
> >> >     list_del()                // on no list now
> >> >     get_freelist_nofreeze()   // freelist = NULL
> >> >                               __slab_free()
> >> >                                 add_partial()
> >> >                                 // back on n->partial
> >> > 	                        // freelist is not NULL
> >> > 
> >> >                                                     get_from_partial_node()
> >> >                                                       lock
> >> >                                                       cmpxchg
> >> >                                                       // freelist = NULL
> >> >     __slab_try_return_freelist()
> >> >     list_add(&pc.slabs)       // overwrites slab_list
> >> >                                                       remove_partial()
> >> >                                                         list_del()
> >> >                                                         // off pc.slabs
> >> >                                                         // slab_list = POISON
> >> > 
> >> > panic log:
> >> > 
> >> >   list_add corruption. next->prev should be prev
> >> >   (ffff888100000248), but was dead000000000122.
> >> >   (next=ffffea000416e410).
> >> >   kernel BUG at lib/list_debug.c:29!
> >> >   Oops: invalid opcode: 0000 [#1] SMP NOPTI
> >> >   CPU: 1 UID: 65534 PID: 144 Comm: poc Not tainted
> >> >   7.2.0-16172-gcf72cbb39da8-dirty #1 PREEMPT(lazy)
> >> >   RIP: 0010:__list_add_valid_or_report+0x80/0xd0
> >> >   ...
> >> >   Call Trace:
> >> >    alloc_from_new_slab+0x183/0x300
> >> >    ___slab_alloc+0x31c/0x890
> >> >    __kmalloc_noprof+0x3d4/0x800
> >> >    lsm_blob_alloc+0x2d/0x50
> >> >    security_msg_msg_alloc+0x26/0x90
> >> >    load_msg+0x1aa/0x210
> >> >    do_msgsnd+0x91/0x800
> >> >    do_syscall_64+0x109/0x5d0
> >> >    entry_SYSCALL_64_after_hwframe+0x77/0x7f
> >> >   ...
> >> >   Kernel panic - not syncing: Fatal exception
> >> > 
> >> > Do the list_add() under n->list_lock. Reattaching the freelist stays outside
> >> > the lock. Once it succeeds the freelist is no longer NULL, so __slab_free()
> >> > cannot put the slab back, and by the time the lock is taken remove_partial()
> >> > has finished and the slab is on no list.
> >> 
> >> Yeah, this should work correctly. 
> >> 
> >> > The lock is held until the block below that returns the remaining slabs to
> >> > the partial list. That block already took the same lock on this path, so no
> >> > lock/unlock pair is added.
> >> > 
> >> > The unlock is keyed on having taken the lock instead of on pc.slabs being
> >> > empty. With CONFIG_DEBUG_LIST or CONFIG_LIST_HARDENED, __list_add() returns
> >> > without linking anything if its check fails, which would leave pc.slabs
> >> > empty.
> >> 
> >> Well, if the check fails, it has a bug and should be fixed.
> >> We should not make the code less readable to handle a bug.
> >> 
> >> I think it's better to have (diff on top of the patch, not tested):
> >> 
> >> diff --git a/mm/slub.c b/mm/slub.c
> >> index 7a7f9935c711..eff96b992164 100644
> >> --- a/mm/slub.c
> >> +++ b/mm/slub.c
> >> @@ -7216,12 +7216,10 @@ __refill_objects_node(struct kmem_cache *s, void **p, gfp_t gfp, unsigned int mi
> >>  			break;
> >>  	}
> >>  
> >> -	if (!locked && !list_empty(&pc.slabs)) {
> >> -		spin_lock_irqsave(&n->list_lock, flags);
> >> -		locked = true;
> >> -	}
> >> +	if (!list_empty(&pc.slabs)) {
> >> +		if (!locked)
> >> +			spin_lock_irqsave(&n->list_lock, flags);
> >>  
> >> -	if (locked) {
> >>  		list_for_each_entry(slab, &pc.slabs, slab_list)
> >>  			set_node_partial_state(n, slab);
> > 
> > Since introducing a new variable seems unavoidable, what if we temporarily
> > stash this slab in a pointer like below, and then add it to pc.slabs once we
> > acquire the lock.
> > 
> > struct slab *leftover_slab = NULL;
> > 
> > ...
> > ...
> > 	if (__slab_try_return_freelist(s, slab, head, count)) {
> > 		leftover_slab = slab;
> > 		break;
> > 	}
> > 
> > ...
> > ...
> > if (!list_empty(&pc.slabs)) {
> > 	spin_lock_irqsave(&n->list_lock, flags);
> > 
> > 	if (leftover_slab)
> > 		list_add(&leftover_slab->slab_list, &pc.slabs);
> > 	...
> > 	...
> > }
> > 
> > PS: If I recall correctly, Vlastimil's initial patch was actually fine. It was
> > my suggestion to save an extra lock/unlock pair that accidentally led to this
> > trap...
> 
> Ah, thanks for the reminder. This [1] was the original attempt.
> 
> [1]
> https://lore.kernel.org/all/20260421-b4-refill-optimistic-return-v1-1-24f0bfc1acff@kernel.org/
> 
> I wonder if the fix should be to return to that approach and just have
> __slab_try_return_freelist() handle the list_lock. The code would be simpler
> with not "bool locked".
> 
> It should be really very rare that we would end up returning a partial list
> and also have additional slabs to return on pc.slabs? So I think there would
> be no noticeable performance downside to the simpler code potentially ending
> up taking the list_lock twice instead of once.

Yes, make sense, in fact, when I first looked at this patch, I did consider
that maybe the original locking approach was best for readability and safety :)

> 
> >> 
> >> > Fixes: ba7425312607 ("mm, slab: add an optimistic __slab_try_return_freelist()")
> >> > Cc: stable@vger.kernel.org
> >> > Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
> >> > ---
> >> >  mm/slub.c | 9 ++++++++-
> >> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >> > 
> >> > diff --git a/mm/slub.c b/mm/slub.c
> >> > index f9b56cb439e709..4f6d1a03a8ee46 100644
> >> > --- a/mm/slub.c
> >> > +++ b/mm/slub.c
> >> > @@ -7260,6 +7260,7 @@ __refill_objects_node(struct kmem_cache *s, void **p, gfp_t gfp, unsigned int mi
> >> >  	struct slab *slab, *slab2;
> >> >  	unsigned int refilled = 0;
> >> >  	unsigned long flags;
> >> > +	bool locked = false;
> >> >  	void *object;
> >> >  
> >> >  	pc.flags = gfp;
> >> 
> >> uh, I'm not a big fan of having a new variable to store 'locked' state,
> >> but okay, this seems unavoidable with current implementation.
> >> 
> >> > @@ -7297,7 +7298,10 @@ __refill_objects_node(struct kmem_cache *s, void **p, gfp_t gfp, unsigned int mi
> >> >  			void *tail;
> >> >  
> >> >  			if (__slab_try_return_freelist(s, slab, head, count)) {
> >> > +				/* get_from_partial_node() may be mid-removal of the slab */
> >> > +				spin_lock_irqsave(&n->list_lock, flags);
> >> >  				list_add(&slab->slab_list, &pc.slabs);
> >> > +				locked = true;
> >> >  				break;
> >> >  			}
> >> >  
> >> > @@ -7312,9 +7316,12 @@ __refill_objects_node(struct kmem_cache *s, void **p, gfp_t gfp, unsigned int mi
> >> >  			break;
> >> >  	}
> >> >  
> >> > -	if (!list_empty(&pc.slabs)) {
> >> > +	if (!locked && !list_empty(&pc.slabs)) {
> >> >  		spin_lock_irqsave(&n->list_lock, flags);
> >> > +		locked = true;
> >> > +	}
> >>  
> >> -- 
> >> Cheers,
> >> Harry / Hyeonggon
> >>  
> > 
> 
