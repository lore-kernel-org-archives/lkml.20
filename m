Received: from mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BB3344DA0
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789964485; cv=none; b=bqlqSdRYSxwOq0pGJAFgoPUew/PxEkJ7Dj0HUDf+u2e4mQ0JbzDy8BrzYEIwr5dWPZQW9OGeSEe9fw6qlNIUh4E14f1BX4wfBBa16N3XCQyIYmZzbKe9TBNHl/trXjKyThQ0z71YSU1jd1y80lBFBO/iCpeKAdD3jOiAeU57s84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789964485; c=relaxed/simple;
	bh=QnBJ2lINDbYZLtvPWtK1dgRGpLQIhKeHYrcIi78w4I0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJOMd8oeGf3xrVz127ULruHlf9f+XT2cf5bmZilK69q+rRfNFlKU+v3S1CcMV1vLxw9rqkSV5tiCPD2ftjTum/TqY1j3UthIJVVFsf/sXPDTuKF6mA6iIiYaKhLiEvhjmPefLSDQh4F4KCmd+PWLYeAw09w4FmlAUuarZsO8f0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BoQPPU+b; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BoQPPU+b"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=QnBJ2lINDbYZLtvPWtK1dgRGpLQIhKeHYrcIi78w4I0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789964480; v=1; x=1790569280;
 b=BoQPPU+bkhgjKdCgx4tbWab80cYbWoZ00kaP0nydvpJO9mrjHy64njeRXjfZo+eNK3Oo0LkC
 LOTYUNCecebR7lUFg2hPSk/UfP7TAhNeuPxmY/5RWYsLLpjVPMoq+d7Zg0uMwFUEZoTCAsA0l7O
 r3Ut4D3sMxQi/5WsDmVN7Zp0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f6ec75b7ce5dac5b;
	Mon, 21 Sep 2026 04:21:19 +0000
X-Mizu-Trace-ID: f6ec75b7ce5dac5b
X-Migadu-Flow: FLOW_OUT
Date: Mon, 21 Sep 2026 12:21:14 +0800
From: Hao Li <hao.li@linux.dev>
To: Harry Yoo <harry@kernel.org>
Cc: vbabka@kernel.org, akpm@linux-foundation.org, cl@gentwo.org, 
	rientjes@google.com, roman.gushchin@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/slub: refill prefilled sheaves from the barn
Message-ID: <arCeRr44nni8hykr@fedora>
References: <20260918114318.124346-1-hao.li@linux.dev>
 <aq0ylDidEHa2kg4X@thinkstation>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aq0ylDidEHa2kg4X@thinkstation>

On Fri, Sep 18, 2026 at 04:35:15PM +0100, Harry Yoo wrote:
> On Fri, Sep 18, 2026 at 07:41:56PM +0800, Hao Li wrote:
> > Currently, when the prefill API refills a non-full sheaf, it takes the
> > objects from partial slabs and never from the full sheaves in the barn,
> > so once the barn's full list becomes saturated, it stays saturated.
> > 
> > For objects freed via kfree_rcu(), every RCU sheaf then has to be
> > flushed to slabs because the barn's full list has no room.
> > 
> > To fix this, let the sheaf refill from the barn first, and introduce a
> > partial sheaf in the barn, which holds the leftover objects.
> > 
> > If no partial sheaf exists, take a full sheaf from the barn and return
> > it to the caller; the non-full sheaf becomes the partial sheaf, or is
> > put on the barn's empty list if it holds no objects.
> > 
> > If a partial sheaf exists and the non-full sheaf and the partial sheaf
> > together reach capacity, the one holding more objects is filled up from
> > the other and handed out instead, so no full sheaf needs to be taken
> > from the barn.
> > 
> > If a partial sheaf exists but the two together do not reach capacity,
> > take a full sheaf from the barn for the caller; the objects of the
> > non-full sheaf are absorbed into the partial sheaf, and the non-full
> > sheaf, now empty, is put on the barn's empty list.
> 
> Perhaps let's explain why the slab allocator needs this partial sheaf
> handling only for prefilled sheaves path?

Agreed, that's definitely worth an explanation here!

> 
> while reviewing it i was wondering "why is this just not part of
> refill_sheaf()"
> 
> I assume the reason is: usually we only refill empty sheaves because
> if it has at least one object, it can serve the allocation.

I think the distinction is less about why refill_sheaf() doesn't use
sheaf_partial, and more about what the two paths do beforehand.

For simplicity, let's call the __pcs_replace_empty_main path the
generic path, to distinguish it from the prefill path.

In both paths, refill_sheaf() plays an equivalent role: it simply pulls objects
from n->partial. Since neither involves the barn at that point, sheaf_partial
doesn't really come into play there.

The real difference is what happens before calling refill_sheaf(). The generic
path cleanly swaps an empty sheaf for a full one from the barn. But on the
prefill path, the incoming sheaf isn't necessarily empty, so taking objects
from the barn usually leaves leftovers. That's why we need a data structure
to temporarily hold those leftovers, and that's where sheaf_partial comes in.

If this explanation makes sense, I'll add it to the commit message. :)

> 
> > the gain comes from two sides: every full sheaf taken out makes room on
> > the barn's full list for a future rcu sheaf, and refilling from the
> > barn is cheaper than refilling from partial slabs under list_lock.
> > 
> > note that putting the non-full sheaf on the full list instead would not
> > work: it would occupy room on the full list, so the list would stay
> > saturated and rcu_free_sheaf() would still keep flushing.
> 
> [..]
> 
> > ---
> >  mm/slub.c | 142 +++++++++++++++++++++++++++++++++++++++++++++++++++---
> >  1 file changed, 134 insertions(+), 8 deletions(-)
> > 
> > diff --git a/mm/slub.c b/mm/slub.c
> > index 54ec12503357..0b1de6b42b61 100644
> > --- a/mm/slub.c
> > +++ b/mm/slub.c
> > @@ -3164,6 +3165,89 @@ static struct slab_sheaf *barn_get_empty_sheaf(struct node_barn *barn,
> >  	return empty;
> >  }
> >  
> > +/*
> > + * Exchange @sheaf, which holds fewer objects than requested, for a full one,
> > + * keeping the leftover objects in the barn's partial sheaf instead of
> > + * flushing them.
> > + *
> > + * Returns a full sheaf, or NULL if the barn cannot make one.
> > + * The returned sheaf might be @sheaf itself or a new one.
> > + */
> > +static struct slab_sheaf *barn_replace_partial_sheaf(struct kmem_cache *s,
> > +						     struct node_barn *barn,
> > +						     struct slab_sheaf *sheaf)
> > +{
> > +	struct slab_sheaf *full = NULL, *partial;
> > +	unsigned int to_move;
> > +	unsigned long flags;
> > +
> > +	if (!data_race(barn->nr_full) && !data_race(barn->sheaf_partial))
> > +		return NULL;
> > +
> > +	spin_lock_irqsave(&barn->lock, flags);
> > +
> > +	partial = barn->sheaf_partial;
> > +	if (partial && partial->size + sheaf->size >= s->sheaf_capacity) {
> > +		/* Fill the larger one to capacity from the smaller */
> > +		if (partial->size > sheaf->size)
> > +			swap(partial, sheaf);
> 
> Hmm but why switch sheaves when we don't have to?

My thinking was to minimize the amount of data copied via memcpy as much as
possible, since I was a bit concerned that the copy overhead might stretch the
lock hold time in the critical section.

> Sounds like we're losing cache affinity unnecessarily.

Yeah, that makes sense to me.

I'll reply to the other points in the next email.

-- 
Thanks,
Hao
