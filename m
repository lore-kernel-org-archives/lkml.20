Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4585550B8C7
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789746767; cv=none; b=CYV55Y59GyR8qbwHpPv/5sEvKegmUuGzmWjv+smTSKndzvk7DvEPBQsEdX+qr+jqVMbW5PwJfpFrw5rbOfAe9Uq2gHacfSa+7DDDryb+Drpglmz8nRhO9tmbB0NzdYl2rtEhWKFoBYCa7V79n+yCsIasBmJw17fltZTWvG2cn5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789746767; c=relaxed/simple;
	bh=eS0Dfv+qqj6HKV0W/0C2tMsw8Ko+CNFif9VC0jgoH28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cidOBuIOHjo/M4E18NqkpaTPNedjl8P/qDW6KuGjLG3BEn2yswNXfq0oLnzHVK48vHj5ctoz6GKUlM+risjmVD6oMkONyQI5XT1QsV0XPV601gTgfd/1w3e3MS0dCSJFd1k2AQ24C/fOhQ1e6YrgWSK2PI+FbaT/x7roN2S1SFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C7HvoUZe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C7HvoUZe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 584481F000FF;
	Fri, 18 Sep 2026 15:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789746765;
	bh=HD1risQVKtKf77whM7zkZxSBxDakySBApLr7kIjmWJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C7HvoUZeD+qSD1/6uxQ5C7v/YHlVEbj7TYgHwDkjA0KzA3CRwaBXTrXRA7QUXyHAa
	 7aBOC15eKV/gEyG4qj2njCA+dQUItmpcvoxH5y/JulsGs+1gUEBOoUI7+oNYPXO0N1
	 i+64enmlOeIpbSyZ2jQXykUOWZ0PcCAfLud7qgGoO6qCGX/f5bcuT/DMmnhNCyf9Vv
	 ME+XRC8F6xEx+M8Kxdx11XAf8V0FbQMpKZLPp+bhfO9A6ISPyeZq4nNtKzd5fr5Oly
	 DXigG/gUVip4Rd72fU4uCVeL7SHFNcrt1EoCiZsmivkNbB77iEvZr8L2T/sfvuVhYI
	 JlHMyv5c76JOA==
Date: Fri, 18 Sep 2026 16:52:43 +0100
From: Harry Yoo <harry@kernel.org>
To: Hao Li <hao.li@linux.dev>
Cc: vbabka@kernel.org, akpm@linux-foundation.org, cl@gentwo.org, 
	rientjes@google.com, roman.gushchin@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/slub: refill prefilled sheaves from the barn
Message-ID: <aq1c0ycER3b4Mfds@thinkstation>
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

On Fri, Sep 18, 2026 at 04:35:17PM +0100, Harry Yoo wrote:
> On Fri, Sep 18, 2026 at 07:41:56PM +0800, Hao Li wrote:
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
> Sounds like we're losing cache affinity unnecessarily.
> 
> I think we should try to refill from barn->sheaf_partial,
> or if that's not available, refill from a full sheaf, and then move
> the previously-full-sheaf to barn->sheaf_partial or barn->sheaf_empty.
> 
> Then we'll never replace the sheaf with a new one.
> 
> With that, the control flow could be simplified quite a bit.
> Something like this. (Warning: pseudocode, it won't compile)
> 
> // refill a sheaf from barn.
> // return true when the sheaf becomes full
> // return false when the sheaf is not full
> 
> bool refill_sheaf_from_barn(s, sheaf) {
> 	struct node_barn *barn = get_barn(s);
> 	struct slab_sheaf *partial;
> 	unsigned int to_move;
> 	unsigned long flags;
> 
> 	spin_lock_irqsave(&barn->lock, flags);
> 
> 	partial = barn->sheaf_partial;
> 	barn->sheaf_partial = NULL;
> 
> 	if (!partial && barn->nr_full) {
> 		// grab one from full list
> 		partial = [...];
> 	}
> 
> 	if (!partial)
> 		// cannot refill from the barn. the caller will try
> 		// refilling from n->partial list
> 		goto done;
> 
> 	to_move = min(s->sheaf_capacity - sheaf->size, partial->size);
> 	partial->size -= to_move;
> 	// copy `to_move` objects from `partial` to `sheaf`
> 	memcpy(...);
> 	sheaf->size += to_move;

Hmm, but if it's from barn->sheaf_partial, it might end up refilling
the sheaf from n->partial. Needs bit more thoughts. Perhaps retry if
it's still not full?

> 	if (!partial->size)
> 		// move it to empty list
> 	else
> 		barn->sheaf_partial = partial;
>
> done:
> 	spin_unlock_irqrestore(&barn->lock, flags);
> 	return (sheaf->size == s->sheaf_capacity);
> }
> 
> What do you think?
> 
> -- 
> Cheers,
> Harry / Hyeonggon

-- 
Cheers,
Harry / Hyeonggon
