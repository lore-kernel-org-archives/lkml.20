Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40A541C2FF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788430941; cv=none; b=MA/qgFodsg2ONXm7fZow7W+7mQRUdXaxeScSHs4YZNefdjoWficSraHaIs3ZxJEOc9LsLAdxihE1dTuQDYNJpSz/CndL/GlVeckbwN3KYzwDpF0BtLbFzfChwX6bybJ0ZogirVMb46tS7LBRYg6fktIgYPGH7pLyn0iE+Bq6dek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788430941; c=relaxed/simple;
	bh=y5eAV25Di6+lRexAcQwpJDzZ/gfUSBA6sfHaWhIymu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DeVUYr7t9LGinlIGkEsmSEa8/WU2yFvZa4MqZ6GtYMyFJu4QkbI3GsQSV9dTXxJtmQ/xUvqkfELbTpPt/cZnZfvgmKNiG0bRK7gu3oCTSWzBIHNx3+Uc19rV6yX1+HPFznEYoyTzNWtM0iqq87NbOmDOezAUAN2m5Uc5gmQiSQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QQGCnZ47; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QQGCnZ47"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3F0E1F00A3A;
	Thu,  3 Sep 2026 10:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788430939;
	bh=vEpLXgLt5BvR7hF8m7cdeksa+geMrv7LSsfWhyIOPZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QQGCnZ47fkRm6UHXBzWDo7WAVs9V0NX+m3P2MS54lcMGqQGUej9wXvnyQW72T0glC
	 n7OzcFLuuAiY3n11Eu46S6XXUxBAN1CVPQLr1FyJBs2bl4yBQGnAMBPY9H8NcRXyjA
	 YjboFghi9QegdzYpOuuD7fGUHMXU/m+kc1X53MHJlU89+XXR5tZzyYTJh8aQrYgQze
	 wAWFR31ekI+3/PpGP99vvUHbguigwl05V/yztSWVRhqnDZNHREksFa3ZmH4v7dy6XY
	 If+5urBcnHaeFOPQy19B8nK90jIeozYIESseZMwYnLG+tRDZ9TPFThjMvw7xZVB6Tn
	 jSGeo5Lk7RQsg==
Date: Thu, 3 Sep 2026 11:22:17 +0100
From: Harry Yoo <harry@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Hyunwoo Kim <imv4bel@gmail.com>
Subject: Re: [PATCH v2] mm/slab: take n->list_lock in
 __slab_try_return_freelist() to avoid race
Message-ID: <aplJWzzxioK9TlT9@nixos>
References: <20260902-slab-fix-aba-v2-1-d1ece15a8417@kernel.org>
 <b85f9954-4bbd-45f4-80dc-6c9d32cefcd5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b85f9954-4bbd-45f4-80dc-6c9d32cefcd5@kernel.org>

On Wed, Sep 02, 2026 at 06:57:53PM +0200, Vlastimil Babka (SUSE) wrote:
> On 9/2/26 18:41, Harry Yoo (Meta) wrote:
> > Commit ba7425312607 ("mm, slab: add an optimistic
> > __slab_try_return_freelist()") incorrectly assumed that nobody has freed
> > an object to the slab as long as slab->freelist is NULL and cmpxchg
> > succeeds.
> > 
> > However, as reported by Hyunwoo Kim [1], other CPUs might have freed
> > an object to the slab, insert the slab to the partial list, then
> > allocated an object from the slab, and be in the middle of removing
> > the slab from the list under n->list_lock.
> > 
> > Since __refill_objects_node() puts the slab back on pc.slabs
> > outside n->list_lock, it might insert the slab into that list while
> > the slab is concurrently being removed from n->partial.
> > This led to a list corruption, as reported by Hyunwoo Kim [1]:
> 
> "as reported by ..." was already said above, we could keep just the [1] or
> drop completely?

I didn't want to steal the credit for splat ;) but yeah keeping [1]
should be enough.

> >   list_add corruption. next->prev should be prev
> >   (ffff888100000248), but was dead000000000122.
> >   (next=ffffea000416e410).
> >   kernel BUG at lib/list_debug.c:29!
> >   Oops: invalid opcode: 0000 [#1] SMP NOPTI
> >   CPU: 1 UID: 65534 PID: 144 Comm: poc Not tainted
> >   7.2.0-16172-gcf72cbb39da8-dirty #1 PREEMPT(lazy)
> >   RIP: 0010:__list_add_valid_or_report+0x80/0xd0
> >   ...
> >   Call Trace:
> >    alloc_from_new_slab+0x183/0x300
> >    ___slab_alloc+0x31c/0x890
> >    __kmalloc_noprof+0x3d4/0x800
> >    lsm_blob_alloc+0x2d/0x50
> >    security_msg_msg_alloc+0x26/0x90
> >    load_msg+0x1aa/0x210
> >    do_msgsnd+0x91/0x800
> >    do_syscall_64+0x109/0x5d0
> >    entry_SYSCALL_64_after_hwframe+0x77/0x7f
> >   ...
> >   Kernel panic - not syncing: Fatal exception
> > 
> > This is a classic ABA problem where cmpxchg succeeds but the state has
> > changed since __refill_objects_node() took the freelist from the slab.
> > 
> > As Vlastimil Babka mentioned [2], it should be rare to return more than
> > one slab (due to the racy read of slab->counters in
> > get_partial_node_bulk()). Therefore, instead of introducing additional
> > complexity, acquire and release n->list_lock twice in the worst case.
> > 
> > Return the slab directly to the partial list and hold n->list_lock
> > across the cmpxchg and add_partial(). This is similar to the initial
> > version of commit ba7425312607 [3]. This is enough to avoid the race as
> > the list manipulation is serialized by n->list_lock. While at it,
> > bring back unlikely() hint now that the condition is unlikely.
> 
> Ah nicely spotted.

Thanks ;-)

> > diff --git a/mm/slub.c b/mm/slub.c
> > index f9b56cb439e7..5cbbacb8ee32 100644
> > --- a/mm/slub.c
> > +++ b/mm/slub.c
> > @@ -5684,6 +5684,8 @@ static bool __slab_try_return_freelist(struct kmem_cache *s, struct slab *slab,
> >  				       void *head, int cnt)
> >  {
> >  	struct freelist_counters old, new;
> > +	struct kmem_cache_node *n;
> > +	unsigned long flags;
> >  
> >  	old.freelist = slab->freelist;
> >  	old.counters = slab->counters;
> > @@ -5695,9 +5697,16 @@ static bool __slab_try_return_freelist(struct kmem_cache *s, struct slab *slab,
> >  	new.counters = old.counters;
> >  	new.inuse -= cnt;
> >  
> > -	if (!slab_update_freelist(s, slab, &old, &new, "__slab_try_return_freelist"))
> > +	n = get_node(s, slab_nid(slab));
> 
> Wonder if we could just pass the 'n' to __slab_try_return_freelist() that we
> already have in the caller.

Sounds good, will do.

-- 
Cheers,
Harry / Hyeonggon
