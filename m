Received: from mta1.migadu.com (out-90.mta1.migadu.com [95.215.58.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280392D0C89
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 02:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788749726; cv=none; b=Ub/0D9LKxnw79HMVzdmKcF1pu6miuKW0/nph/aotS3nLLj0ufIb0hoTGjghgSRBYAbd+6KLK3MK4UGTwkBRCzTmNOtLovlYuAau5zRA6AI6Cqcb8WP1wSxf0+G6ecbRkAbkXA1Cc6MvHm9/bukbsOKQWvoEZpjApdqNn5R++PRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788749726; c=relaxed/simple;
	bh=YvblxpY6vkq4OCD00FIjqN1K66OMC+qJBIhUOND8BwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hT98H9cOBNkTS0aYsYP9cVu6XST/v/P47T1Ao2S1jAALZ7HzEnKvpeLezOa08AptLZ2bo0nMrbHSabknKjw17HYIbxKmb/XMiVYYg0cuDwwyRbKcIPP3GPJ7+qibbFAR6PmhQHBkydLwrMLOMzMak15cwmBO3jzN4o4S4Xb/mfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rJdBNTEj; arc=none smtp.client-ip=95.215.58.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rJdBNTEj"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=YvblxpY6vkq4OCD00FIjqN1K66OMC+qJBIhUOND8BwU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788749721; v=1; x=1789354521;
 b=rJdBNTEjgkmBQG/DMXokTwK42VRIBZIv6Ffv+tld34JEYeicpV0iS68hTRZi7Xo6zgVe8zHL
 3Xa2nwL8PxbkoCp1vR9gN33lpCqPbiyGB2xMIsP0FNgebDDjWmuH+pqlavGyyt9ADvSqmUpUzoi
 lIZv/F0uc3tCPjnq+XkLMngU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4eb2748bc5b24aff;
	Mon, 07 Sep 2026 02:55:15 +0000
X-Mizu-Trace-ID: 4eb2748bc5b24aff
X-Migadu-Flow: FLOW_OUT
Date: Mon, 7 Sep 2026 10:55:10 +0800
From: Hao Li <hao.li@linux.dev>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: harry@kernel.org, akpm@linux-foundation.org, cl@gentwo.org, 
	rientjes@google.com, roman.gushchin@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] mm/slub: make the case handling in __slab_free()
 easier to follow
Message-ID: <ap4mTkqFJsIwXBEO@fedora>
References: <20260824122004.3652-1-hao.li@linux.dev>
 <20260824122513.3829-1-hao.li@linux.dev>
 <b81e9fba-9567-4bd4-ad9a-08c8f03dbb14@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b81e9fba-9567-4bd4-ad9a-08c8f03dbb14@kernel.org>

On Fri, Sep 04, 2026 at 06:04:25PM +0200, Vlastimil Babka (SUSE) wrote:
> On 8/24/26 14:25, Hao Li wrote:
> > There are 7 possible transitions in __slab_free():
> > 
> >   a. partial->partial
> 
> maybe add "(offlist/onlist doesn't matter)"

Exactly, this should be split into two subcases. will do.

> 
> >   b. partial->empty, offlist
> >   c. partial->empty, onlist, exceeding min_partial
> >   d. partial->empty, onlist, not exceeding min_partial
> >   e. full->empty, exceeding min_partial
> >   f. full->empty, not exceeding min_partial
> >   g. full->partial
> > 
> > (There is no offlist variant of e, f and g as a full slab is on no
> > list.)
> > 
> > Clarify which case each branch handles, and replace the goto with a
> > return at the end of the skipped block so that every branch explicitly
> > states its coverage.
> > 
> > Case 'a' is the only path that needs neither list_lock nor list
> > handling. Give it an early continue: handling it upfront is much clearer
> > than forcing every other case into a nested block.
> > 
> > Also, read SL_partial once after the loop right where it is used, rather
> > than re-reading it on every iteration.
> > 
> > No functional change.
> > 
> > Signed-off-by: Hao Li <hao.li@linux.dev>
> 
> Reviewed-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

Thanks!

> 
> Nit:
> 
> > ---
> >  mm/slub.c | 95 ++++++++++++++++++++++++++++---------------------------
> >  1 file changed, 49 insertions(+), 46 deletions(-)
> > 
> > diff --git a/mm/slub.c b/mm/slub.c
> > index b0cd0572e2f2..e20375307770 100644
> > --- a/mm/slub.c
> > +++ b/mm/slub.c
> > @@ -5748,76 +5748,79 @@ static void __slab_free(struct kmem_cache *s, struct slab *slab,
> >  		new.inuse -= cnt;
> >  
> >  		/*
> > -		 * Might need to be taken off (due to becoming empty) or added
> > -		 * to (due to not being full anymore) the partial list.
> > -		 * Unless it's frozen.
> > +		 * partial->partial: the slab was on the node partial list and
> > +		 * stays there, so we need no list handling and no list_lock.
> 
> I think more accurate is "if the slab was on the node partial list, it stays
> there, and if it was off, it stays off, so we need no..." ?

Yes, this is clearer, will do!

> 
> > +		 *
> > +		 * Note that continue in a do-while goes on to evaluate the
> > +		 * condition below, so we do perform the freelist update.
> >  		 */
> > -		if (!new.inuse || was_full) {
> > -
> > -			n = get_node(s, slab_nid(slab));
> > -			/*
> > -			 * Speculatively acquire the list_lock.
> > -			 * If the cmpxchg does not succeed then we may
> > -			 * drop the list_lock without any processing.
> > -			 *
> > -			 * Otherwise the list_lock will synchronize with
> > -			 * other processors updating the list of slabs.
> > -			 */
> > -			spin_lock_irqsave(&n->list_lock, flags);
> > +		if (!was_full && new.inuse)
> > +			continue;
> >  
> > -			on_node_partial = slab_test_node_partial(slab);
> > -		}
> > +		/*
> > +		 * The slab might need to be taken off (due to becoming empty)
> > +		 * or added to (due to not being full anymore) the partial
> > +		 * list.
> > +		 *
> > +		 * Speculatively acquire list_lock before calling cmpxchg(), as
> > +		 * performing cmpxchg() prior to lock acquisition races with
> > +		 * concurrent paths, such as the shrinker.
> > +		 *
> > +		 * If the cmpxchg does not succeed then we will drop the
> > +		 * list_lock and retry.
> > +		 */
> > +		n = get_node(s, slab_nid(slab));
> > +		spin_lock_irqsave(&n->list_lock, flags);
> >  
> >  	} while (!slab_update_freelist(s, slab, &old, &new, "__slab_free"));
> >  
> >  	if (likely(!n)) {
> > +		/* partial->partial: we didn't take the list_lock */
> > +		return;
> > +	}
> > +
> > +	on_node_partial = slab_test_node_partial(slab);
> > +
> > +	if (!was_full && !on_node_partial) {
> >  		/*
> > -		 * We didn't take the list_lock because the slab was already on
> > -		 * the partial list and will remain there.
> > +		 * partial->empty, offlist: a bulk refill has taken the slab
> > +		 * off the partial list and will put it back, so its list
> > +		 * handling is not ours to do.
> >  		 */
> > +		spin_unlock_irqrestore(&n->list_lock, flags);
> >  		return;
> >  	}
> >  
> > -	/*
> > -	 * This slab was partially empty but not on the per-node partial list,
> > -	 * in which case we shouldn't manipulate its list, just return.
> > -	 */
> > -	if (!was_full && !on_node_partial) {
> > +	/* full/partial->empty, exceed: we have enough partial slabs already */
> > +	if (unlikely(!new.inuse && n->nr_partial >= s->min_partial)) {
> > +		/* partial->empty, onlist, exceed */
> > +		if (likely(!was_full)) {
> > +			remove_partial(n, slab);
> > +			stat(s, FREE_REMOVE_PARTIAL);
> > +		}
> > +		/* full->empty, exceed: it is on no list to remove from */
> > +
> >  		spin_unlock_irqrestore(&n->list_lock, flags);
> > +		stat(s, FREE_SLAB);
> > +		discard_slab(s, slab);
> >  		return;
> >  	}
> >  
> >  	/*
> > -	 * If slab became empty, should we add/keep it on the partial list or we
> > -	 * have enough?
> > +	 * At this point, only three cases remain:
> > +	 *   full->partial
> > +	 *   full->empty, not exceed
> > +	 *   partial->empty, onlist, not exceed
> >  	 */
> > -	if (unlikely(!new.inuse && n->nr_partial >= s->min_partial))
> > -		goto slab_empty;
> >  
> > -	/*
> > -	 * Objects left in the slab. If it was not on the partial list before
> > -	 * then add it.
> > -	 */
> > +	/* full->partial; full->empty, not exceed */
> >  	if (unlikely(was_full)) {
> >  		add_partial(n, slab, ADD_TO_TAIL);
> >  		stat(s, FREE_ADD_PARTIAL);
> >  	}
> > -	spin_unlock_irqrestore(&n->list_lock, flags);
> > -	return;
> > -
> > -slab_empty:
> > -	/*
> > -	 * The slab could have a single object and thus go from full to empty in
> > -	 * a single free, but more likely it was on the partial list. Remove it.
> > -	 */
> > -	if (likely(!was_full)) {
> > -		remove_partial(n, slab);
> > -		stat(s, FREE_REMOVE_PARTIAL);
> > -	}
> > +	/* partial->empty, onlist, not exceed: it stays where it is */
> >  
> >  	spin_unlock_irqrestore(&n->list_lock, flags);
> > -	stat(s, FREE_SLAB);
> > -	discard_slab(s, slab);
> >  }
> >  
> >  /*
> 

-- 
Thanks,
Hao
