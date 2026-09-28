Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4134DD3D3;
	Mon, 28 Sep 2026 15:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790607614; cv=none; b=QS0ux/SVPaGxWohJ86VDIgZGP4j1KbYbPzWA+OttrxbD6M0tzoCBOonRbONTkBPJRta7xCItPXG5vKVs5bk6JIVgW/oSr6+MMZ2CFXIG64wyryfjQHkpCSEMsNpRwTW3NDHa66e20RvgaUhsuLQvJy2j4HwCrULT8LWpTWHN/VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790607614; c=relaxed/simple;
	bh=hbmK2UpesMnKmL5ucHEuEwpkbu64Y3HD2A6nTrnYMbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cbtupYoAJLxpRaEjILI8uIRaJJfx4lF1xdPSkQ0iMOg2G85syeordq25++qASW6mVf33T3uB8gu9F6AvSXLqFSt6gT3dj+9xh9hYVFEdDTn9A82CZo/S7nqHVEuI1bYScJHaqwS4ndAivXx+e1MXzFRVkFkZxL7phzxDdah8wi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=R8kayxFU; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="R8kayxFU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=IWhaUBTPRe612PoHJ9SvYI/ScX4MpI3OyCPlKb0OqKQ=; b=R8kayxFUCvANhofi1SvYmi12od
	8Surte+VcFBqRSxG9ERQzt/CbiMKyfNYLgJogui+/eRolgkxjwFnFRjMBeKuy4gTwJvk6NJGkwYKO
	Pxe6sMm/tkwZRoBs4TrL1nzPVyCZxJ8oU9MvElHe1g/KdDwFkXI/xXqTwlTCVkLzVJSFFFRgFj4M1
	h/49Xy55XSx/G4SV5qzNki63FK3yOGnzsB7SlHOoTLzboANg05GC7xQx5Z1ivnxbgY3t1zLJsVG3i
	qsxebXaPsOVQaf8VviqxFbGcXBdcJjHFax+tvgWUPO/1G2/dtihSlHCYk5YVrVUTzE0WGyOaQVI5m
	hXSjAA1A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBCpn-00000001bB0-0o2D;
	Mon, 28 Sep 2026 15:00:03 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id F1BA8300754; Mon, 28 Sep 2026 17:00:01 +0200 (CEST)
Date: Mon, 28 Sep 2026 17:00:01 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Yiwei Lin <s921975628@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] rbtree: update augmented data on the way down in
 rb_add_augmented_cached()
Message-ID: <20260928150001.GG4121620@noisy.programming.kicks-ass.net>
References: <20260928122611.336351-1-s921975628@gmail.com>
 <20260928122611.336351-3-s921975628@gmail.com>
 <20260928133733.GP2009045@noisy.programming.kicks-ass.net>
 <20260928140513.GF4121620@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928140513.GF4121620@noisy.programming.kicks-ass.net>

On Mon, Sep 28, 2026 at 04:05:13PM +0200, Peter Zijlstra wrote:
> On Mon, Sep 28, 2026 at 03:37:33PM +0200, Peter Zijlstra wrote:
> > On Mon, Sep 28, 2026 at 08:26:10PM +0800, Yiwei Lin wrote:
> > 
> > > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > > index 7455a83a6a990..60db4624b9897 100644
> > > --- a/kernel/sched/fair.c
> > > +++ b/kernel/sched/fair.c
> > > @@ -1066,9 +1066,20 @@ static inline bool min_vruntime_update(struct sched_entity *se, bool exit)
> > >  	       se->max_slice == old_max_slice;
> > >  }
> > >  
> > > +/*
> > > + * Fold @new's subtree data into @se, for each @se on @new's insertion path.
> > > + */
> > > +static inline void
> > > +min_vruntime_merge(struct sched_entity *se, struct sched_entity *new)
> > > +{
> > > +	__min_vruntime_update(se, &new->run_node);
> > > +	__min_slice_update(se, &new->run_node);
> > > +	__max_slice_update(se, &new->run_node);
> > > +}
> > >  
> > 
> > So min_vruntime_update() can be written in terms of this helper like:
> > 
> > static inline bool min_vruntime_update(struct sched_entity *se, bool exit)
> > {
> > 	u64 old_min_vruntime = se->min_vruntime;
> > 	u64 old_min_slice = se->min_slice;
> > 	u64 old_max_slice = se->max_slice;
> > 	struct rb_node *node = &se->run_node;
> > 
> > 	se->min_vruntime = se->vruntime;
> > 	se->min_slice = se->slice;
> > 	se->max_slice = se->slice;
> > 
> > 	min_vruntime_merge(se, node->rb_right);
> > 	min_vruntime_merge(se, node->rb_left);
> > 
> > 	return se->min_vruntime == old_min_vruntime &&
> > 	       se->min_slice == old_min_slice &&
> > 	       se->max_slice == old_max_slice;
> > }
> > 
> > And that is *very* close to being generalizable, obviating the need for
> > RBCOMPUTE. Does your LLM see a way to make that happen?

Also, since you're poking at things here, can you please include a patch
to rename RB_DECLARE_CALLBACKS_MAX()'s RBCOMPUTE, it is totally
different from the earlier RBCOMPUTE. Them sharing a name is highly
confusing.

Perhaps rename to something like RBVALUE?
