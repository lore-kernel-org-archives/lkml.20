Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C113DA5B8
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180912; cv=none; b=Q88cEWEvqok4GTlYr67nWcTASapWthJ+suIGidNZ5IcnsvfSHZnEYpdwZuYl95TE7gUt0ujJBfsXSKykV1hmjkaUSGMLbMS69cbLyra8ifklfP+DQbyJgOeMYKy5y9Ati+CsP0dCU7aRL7Jk5+mqQGm233fp+TG5mVIqYK5GTrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180912; c=relaxed/simple;
	bh=TqqpQF7QxbCLbeqZuv9zOytt2SfqCvLu3EVQKz7FFcg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JRuh5UQ3DpOFpAmnhZbpnB/S08jeZIa0m98PRV7R8MH/iRaZrRzx2GYSe+RofckJYO8zTgAUXuQKlHfh3YGMqGluwgLJtrgupYy4cwq4tFbOCLrJWZVVJwoiav08c2+AqOoLc6d9syGl0hbITWa0xVCL0eFosI8F6eAqfwzywMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e+EG9G68; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+EG9G68"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73FE71F000E9;
	Mon, 31 Aug 2026 12:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788180910;
	bh=OmPaskXm6g4JpidhOBhlM22xpKNyZgtcM28tDodfu/o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=e+EG9G68U0egvi5dVujy7wSn5FyFsg24+XtNF1z9xGohynv3E5mfZEfo4t3cYN4dB
	 5Hkx8+6x8V/sUsaxLHZHHB3jF8PiYiN6Z+2BUKF1A4F4F7EuBxxRdBpc3xDNBTpK1n
	 E0TnZ6I9SeYDKmlj/P2fBQgDGy5Yprf9Vv4f00KLQqcUrm9x65Cosi9lRr7puiwWpE
	 Y0DQEpz6b6XjtdHmmro5rRk9s5oyrRf4WRVfo1soZlYnD3MXGltT9Vg34EcPhhug54
	 IuWuOxxe+RoDrN1q/OdwSLyP/IFTVd0yO/HuqjwefKpEMTfnM1l8wYroTj+wpt52xA
	 ujXU3u3+/e0Vw==
Message-ID: <ae25c193-b95f-40c1-83b6-1c2546467e41@kernel.org>
Date: Mon, 31 Aug 2026 14:55:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/slab: take n->list_lock for the list_add() in
 __refill_objects_node()
Content-Language: en-US
To: Hao Li <hao.li@linux.dev>, Harry Yoo <harry@kernel.org>
Cc: Hyunwoo Kim <imv4bel@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>, Christoph Lameter <cl@gentwo.org>,
 David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <apPa-cGLcyt90l-E@v4bel> <apQU8wjMlvbKBQgh@dev>
 <apQ7osHcRj3vdJPn@fedora>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <apQ7osHcRj3vdJPn@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/30/26 16:35, Hao Li wrote:
> On Sun, Aug 30, 2026 at 12:45:17PM +0000, Harry Yoo wrote:
>> On Sun, Aug 30, 2026 at 04:25:45PM +0900, Hyunwoo Kim wrote:
>> > In __refill_objects_node(), the list_add(&slab->slab_list, &pc.slabs) that
>> > follows a successful __slab_try_return_freelist() is done without
>> > n->list_lock.
>> >
>> > __slab_try_return_freelist() only succeeds while slab->freelist is NULL. The
>> > slab we are refilling from is taken off pc.slabs by the list_del() at the
>> > top of the loop, so at that point it is on no list.
>> > 
>> > If another CPU frees an object of that slab, __slab_free() sees the slab as
>> > full and puts it back on n->partial. If a third CPU then takes that object
>> > in get_from_partial_node(), the freelist becomes NULL again.
>> 
>> Ouch. Good catch, Hyunwoo.
>> A classic ABA problem :)

Ouch, indeed.

>> > A slab that sits on n->partial with a NULL freelist only exists while
>> > get_from_partial_node() holds n->list_lock, between its cmpxchg and its
>> > remove_partial().
>> > 
>> > A list_add() in that window overwrites slab_list to point into pc.slabs.
>> > The list_del() in remove_partial() then follows the overwritten links, so it
>> > unlinks the slab from pc.slabs and poisons slab_list while leaving the
>> > n->partial side alone. n->partial is left pointing at the poisoned slab.
>> > 
>> >            CPU0                        CPU1                  CPU2
>> > 
>> >   __refill_objects_node()
>> >     get_partial_node_bulk()   // n->partial to pc.slabs
>> >     list_del()                // on no list now
>> >     get_freelist_nofreeze()   // freelist = NULL
>> >                               __slab_free()
>> >                                 add_partial()
>> >                                 // back on n->partial
>> > 	                        // freelist is not NULL
>> > 
>> >                                                     get_from_partial_node()
>> >                                                       lock
>> >                                                       cmpxchg
>> >                                                       // freelist = NULL
>> >     __slab_try_return_freelist()
>> >     list_add(&pc.slabs)       // overwrites slab_list
>> >                                                       remove_partial()
>> >                                                         list_del()
>> >                                                         // off pc.slabs
>> >                                                         // slab_list = POISON
>> > 
>> > panic log:
>> > 
>> >   list_add corruption. next->prev should be prev
>> >   (ffff888100000248), but was dead000000000122.
>> >   (next=ffffea000416e410).
>> >   kernel BUG at lib/list_debug.c:29!
>> >   Oops: invalid opcode: 0000 [#1] SMP NOPTI
>> >   CPU: 1 UID: 65534 PID: 144 Comm: poc Not tainted
>> >   7.2.0-16172-gcf72cbb39da8-dirty #1 PREEMPT(lazy)
>> >   RIP: 0010:__list_add_valid_or_report+0x80/0xd0
>> >   ...
>> >   Call Trace:
>> >    alloc_from_new_slab+0x183/0x300
>> >    ___slab_alloc+0x31c/0x890
>> >    __kmalloc_noprof+0x3d4/0x800
>> >    lsm_blob_alloc+0x2d/0x50
>> >    security_msg_msg_alloc+0x26/0x90
>> >    load_msg+0x1aa/0x210
>> >    do_msgsnd+0x91/0x800
>> >    do_syscall_64+0x109/0x5d0
>> >    entry_SYSCALL_64_after_hwframe+0x77/0x7f
>> >   ...
>> >   Kernel panic - not syncing: Fatal exception
>> > 
>> > Do the list_add() under n->list_lock. Reattaching the freelist stays outside
>> > the lock. Once it succeeds the freelist is no longer NULL, so __slab_free()
>> > cannot put the slab back, and by the time the lock is taken remove_partial()
>> > has finished and the slab is on no list.
>> 
>> Yeah, this should work correctly. 
>> 
>> > The lock is held until the block below that returns the remaining slabs to
>> > the partial list. That block already took the same lock on this path, so no
>> > lock/unlock pair is added.
>> > 
>> > The unlock is keyed on having taken the lock instead of on pc.slabs being
>> > empty. With CONFIG_DEBUG_LIST or CONFIG_LIST_HARDENED, __list_add() returns
>> > without linking anything if its check fails, which would leave pc.slabs
>> > empty.
>> 
>> Well, if the check fails, it has a bug and should be fixed.
>> We should not make the code less readable to handle a bug.
>> 
>> I think it's better to have (diff on top of the patch, not tested):
>> 
>> diff --git a/mm/slub.c b/mm/slub.c
>> index 7a7f9935c711..eff96b992164 100644
>> --- a/mm/slub.c
>> +++ b/mm/slub.c
>> @@ -7216,12 +7216,10 @@ __refill_objects_node(struct kmem_cache *s, void **p, gfp_t gfp, unsigned int mi
>>  			break;
>>  	}
>>  
>> -	if (!locked && !list_empty(&pc.slabs)) {
>> -		spin_lock_irqsave(&n->list_lock, flags);
>> -		locked = true;
>> -	}
>> +	if (!list_empty(&pc.slabs)) {
>> +		if (!locked)
>> +			spin_lock_irqsave(&n->list_lock, flags);
>>  
>> -	if (locked) {
>>  		list_for_each_entry(slab, &pc.slabs, slab_list)
>>  			set_node_partial_state(n, slab);
> 
> Since introducing a new variable seems unavoidable, what if we temporarily
> stash this slab in a pointer like below, and then add it to pc.slabs once we
> acquire the lock.
> 
> struct slab *leftover_slab = NULL;
> 
> ...
> ...
> 	if (__slab_try_return_freelist(s, slab, head, count)) {
> 		leftover_slab = slab;
> 		break;
> 	}
> 
> ...
> ...
> if (!list_empty(&pc.slabs)) {
> 	spin_lock_irqsave(&n->list_lock, flags);
> 
> 	if (leftover_slab)
> 		list_add(&leftover_slab->slab_list, &pc.slabs);
> 	...
> 	...
> }
> 
> PS: If I recall correctly, Vlastimil's initial patch was actually fine. It was
> my suggestion to save an extra lock/unlock pair that accidentally led to this
> trap...

Ah, thanks for the reminder. This [1] was the original attempt.

[1]
https://lore.kernel.org/all/20260421-b4-refill-optimistic-return-v1-1-24f0bfc1acff@kernel.org/

I wonder if the fix should be to return to that approach and just have
__slab_try_return_freelist() handle the list_lock. The code would be simpler
with not "bool locked".

It should be really very rare that we would end up returning a partial list
and also have additional slabs to return on pc.slabs? So I think there would
be no noticeable performance downside to the simpler code potentially ending
up taking the list_lock twice instead of once.

>> 
>> > Fixes: ba7425312607 ("mm, slab: add an optimistic __slab_try_return_freelist()")
>> > Cc: stable@vger.kernel.org
>> > Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
>> > ---
>> >  mm/slub.c | 9 ++++++++-
>> >  1 file changed, 8 insertions(+), 1 deletion(-)
>> > 
>> > diff --git a/mm/slub.c b/mm/slub.c
>> > index f9b56cb439e709..4f6d1a03a8ee46 100644
>> > --- a/mm/slub.c
>> > +++ b/mm/slub.c
>> > @@ -7260,6 +7260,7 @@ __refill_objects_node(struct kmem_cache *s, void **p, gfp_t gfp, unsigned int mi
>> >  	struct slab *slab, *slab2;
>> >  	unsigned int refilled = 0;
>> >  	unsigned long flags;
>> > +	bool locked = false;
>> >  	void *object;
>> >  
>> >  	pc.flags = gfp;
>> 
>> uh, I'm not a big fan of having a new variable to store 'locked' state,
>> but okay, this seems unavoidable with current implementation.
>> 
>> > @@ -7297,7 +7298,10 @@ __refill_objects_node(struct kmem_cache *s, void **p, gfp_t gfp, unsigned int mi
>> >  			void *tail;
>> >  
>> >  			if (__slab_try_return_freelist(s, slab, head, count)) {
>> > +				/* get_from_partial_node() may be mid-removal of the slab */
>> > +				spin_lock_irqsave(&n->list_lock, flags);
>> >  				list_add(&slab->slab_list, &pc.slabs);
>> > +				locked = true;
>> >  				break;
>> >  			}
>> >  
>> > @@ -7312,9 +7316,12 @@ __refill_objects_node(struct kmem_cache *s, void **p, gfp_t gfp, unsigned int mi
>> >  			break;
>> >  	}
>> >  
>> > -	if (!list_empty(&pc.slabs)) {
>> > +	if (!locked && !list_empty(&pc.slabs)) {
>> >  		spin_lock_irqsave(&n->list_lock, flags);
>> > +		locked = true;
>> > +	}
>>  
>> -- 
>> Cheers,
>> Harry / Hyeonggon
>>  
> 

