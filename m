Received: from mta0.migadu.com (out-54.mta0.migadu.com [91.218.175.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEA9136351
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789965391; cv=none; b=ChHQ/r3DkesQ4J3bKxdJ3TO1xbIYlH6nFcVbLd/MqukhYOZjjCNCLd0ovNznwDHFMXL1l+lGvIQnpYAYh/Eg7l2gPvRsGnpBTJOvW8j+xWr1s+Z1BT1njDbm346dN7u6cve2QL7aWWdX9OftjOkWI9cjcWb739mTzvNPZzbvEbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789965391; c=relaxed/simple;
	bh=JPE0DpDhJZWGDtqTX2FloCT0gbPLYjQbwGm/k7GkBwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JPnII7jFBbGIelwNR8/UQU6+vZEGfbr326YLC45DGnto5ZxgiVLHtG+LHrG6pyYWyt0veh2/DmtTOLOVmfI3D5Pyg164nrii7RMxUqpxlKPRNNzjfPzwB/1lTdx062f7a84xgPyq12EyEjFU+DXtyLADylt39KfO5dAdUhOvC3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cBdTJYQz; arc=none smtp.client-ip=91.218.175.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cBdTJYQz"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=JPE0DpDhJZWGDtqTX2FloCT0gbPLYjQbwGm/k7GkBwk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789965386; v=1; x=1790570186;
 b=cBdTJYQzjki0wDo0932rpMybswHwyn9toBhoMyxCUfgbogdAkcykiz3njdhGGoVbdhyHS6Q8
 mUTsera7qUT1PQmPEh2E6ehKunzdZRHQdTtAlak/SzrNI53yxfrQ9mv2Tqgp4Efe0o1JXoee+I4
 tAPIgUwbLAGuiTOJEBorEV20=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e6610a640427393d;
	Mon, 21 Sep 2026 04:36:26 +0000
X-Mizu-Trace-ID: e6610a640427393d
X-Migadu-Flow: FLOW_OUT
Date: Mon, 21 Sep 2026 12:36:17 +0800
From: Hao Li <hao.li@linux.dev>
To: Harry Yoo <harry@kernel.org>
Cc: vbabka@kernel.org, akpm@linux-foundation.org, cl@gentwo.org, 
	rientjes@google.com, roman.gushchin@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/slub: refill prefilled sheaves from the barn
Message-ID: <arCww4QOLsZxT9Ja@fedora>
References: <20260918114318.124346-1-hao.li@linux.dev>
 <aq0ylDidEHa2kg4X@thinkstation>
 <aq1c0ycER3b4Mfds@thinkstation>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aq1c0ycER3b4Mfds@thinkstation>

On Fri, Sep 18, 2026 at 04:52:43PM +0100, Harry Yoo wrote:
> On Fri, Sep 18, 2026 at 04:35:17PM +0100, Harry Yoo wrote:
> > On Fri, Sep 18, 2026 at 07:41:56PM +0800, Hao Li wrote:
> > > +/*
> > > + * Exchange @sheaf, which holds fewer objects than requested, for a full one,
> > > + * keeping the leftover objects in the barn's partial sheaf instead of
> > > + * flushing them.
> > > + *
> > > + * Returns a full sheaf, or NULL if the barn cannot make one.
> > > + * The returned sheaf might be @sheaf itself or a new one.
> > > + */
> > > +static struct slab_sheaf *barn_replace_partial_sheaf(struct kmem_cache *s,
> > > +						     struct node_barn *barn,
> > > +						     struct slab_sheaf *sheaf)
> > > +{
> > > +	struct slab_sheaf *full = NULL, *partial;
> > > +	unsigned int to_move;
> > > +	unsigned long flags;
> > > +
> > > +	if (!data_race(barn->nr_full) && !data_race(barn->sheaf_partial))
> > > +		return NULL;
> > > +
> > > +	spin_lock_irqsave(&barn->lock, flags);
> > > +
> > > +	partial = barn->sheaf_partial;
> > > +	if (partial && partial->size + sheaf->size >= s->sheaf_capacity) {
> > > +		/* Fill the larger one to capacity from the smaller */
> > > +		if (partial->size > sheaf->size)
> > > +			swap(partial, sheaf);
> > 
> > Hmm but why switch sheaves when we don't have to?
> > Sounds like we're losing cache affinity unnecessarily.
> > 
> > I think we should try to refill from barn->sheaf_partial,
> > or if that's not available, refill from a full sheaf, and then move
> > the previously-full-sheaf to barn->sheaf_partial or barn->sheaf_empty.
> > 
> > Then we'll never replace the sheaf with a new one.
> > 
> > With that, the control flow could be simplified quite a bit.
> > Something like this. (Warning: pseudocode, it won't compile)
> > 
> > // refill a sheaf from barn.
> > // return true when the sheaf becomes full
> > // return false when the sheaf is not full
> > 
> > bool refill_sheaf_from_barn(s, sheaf) {
> > 	struct node_barn *barn = get_barn(s);
> > 	struct slab_sheaf *partial;
> > 	unsigned int to_move;
> > 	unsigned long flags;
> > 
> > 	spin_lock_irqsave(&barn->lock, flags);
> > 
> > 	partial = barn->sheaf_partial;
> > 	barn->sheaf_partial = NULL;
> > 
> > 	if (!partial && barn->nr_full) {
> > 		// grab one from full list
> > 		partial = [...];
> > 	}
> > 
> > 	if (!partial)
> > 		// cannot refill from the barn. the caller will try
> > 		// refilling from n->partial list
> > 		goto done;
> > 
> > 	to_move = min(s->sheaf_capacity - sheaf->size, partial->size);
> > 	partial->size -= to_move;
> > 	// copy `to_move` objects from `partial` to `sheaf`
> > 	memcpy(...);
> > 	sheaf->size += to_move;

Thanks! Make sense and I like this simple and straightforward approach.

When writing the patch, I was too focused on trying to avoid memcpy, or at
least minimizing the data to copy if it was unavoidable. However, I didn't
actually measure first whether memcpy makes any noticeable performance
difference. :P

The approach above is very intuitive, and as long as performance holds up, I
completely agree with taking the simpler way. I went ahead and tested it, and
the performance numbers are basically on par with the current patch. So I'll
switch to this cleaner approach in v2!

> 
> Hmm, but if it's from barn->sheaf_partial, it might end up refilling
> the sheaf from n->partial. Needs bit more thoughts. Perhaps retry if
> it's still not full?

Right, there are mainly two cases here. First, sheaf_partial might not have
enough objects. Second, a full sheaf obtained from the barn might not actually
be completely full, as noted in the comment of rcu_free_sheaf().

So we need a loop to keep going until @sheaf is completely filled up.

Also, I thought maybe we don't need to fill @sheaf completely, and only need to
fill it to the requested size. But the actual test showed that the performance
was not as good as expected :/

The resulting code looks something like this:

spin_lock_irqsave(&barn->lock, flags);

while (sheaf->size < s->sheaf_capacity) {
	src = barn->sheaf_partial;
	barn->sheaf_partial = NULL;
	if (!src) {
		if (!barn->nr_full)
			break;
		src = list_first_entry(&barn->sheaves_full,
				       struct slab_sheaf, barn_list);
		list_del(&src->barn_list);
		barn->nr_full--;
	}

	to_move = min(s->sheaf_capacity - sheaf->size, src->size);
	src->size -= to_move;
	memcpy(&sheaf->objects[sheaf->size], &src->objects[src->size],
	       to_move * sizeof(void *));
	sheaf->size += to_move;

	if (src->size) {
		barn->sheaf_partial = src;
	} else {
		/*
		 * No empty-limit check: the sheaf put on the empty list
		 * was already in the barn, so the barn holds no more
		 * sheaves than before. barn_replace_empty_sheaf() skips
		 * the check for the same reason.
		 */
		list_add(&src->barn_list, &barn->sheaves_empty);
		barn->nr_empty++;
	}
}

spin_unlock_irqrestore(&barn->lock, flags);

if (sheaf->size < s->sheaf_capacity)
	return false;

-- 
Thanks,
Hao
