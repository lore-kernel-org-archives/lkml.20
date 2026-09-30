Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B422F4E3245
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777226; cv=none; b=sgZZD6D3EDtD0MnjEC3HNhW/aBKXqlGR8Vma3iQgBH3Qy42NUK4P2eM9vV2YNabOf/931xlBjys45pyDEfaRVh2NrEm5tsHFxKU4/c3cDsvBWQx01gCeSS9TnTTcR5/WVk+9s589JLb9vlJJNQHPDq26auuSSzu485XA1Kjj24g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777226; c=relaxed/simple;
	bh=50T+JAlL6z3Wrn6dCykboyTKkez7ZOAT5v3pv1z/NBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KSbjKFVYzUyHPmw7e9ey1L1zhoa/fTnrzby+w8QOleqs0rXHZl747L9dWLsaLdTgVy6m0HSqXPqO8BHOldaNkAVd/W0NVsgmhm79VgGfVMSIHd/rTWhEd0cgAvf/6WNXAsCMFDEbkqF0MMUjnZUwk8W1MQ3FFXovuoQHx15NL/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=LAqXN0F6; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="LAqXN0F6"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-93910ad20d4so622922285a.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1790777205; x=1791382005; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w7/ZyRNe756x2qIILuqRWig+Ez86Z+PdUS4umWMDN+k=;
        b=LAqXN0F6Syg2SfKbIR6Ve+BbBGcWojLkcX+tnrbWOUfSUMaFj3Rn43onzCEBqGSOEg
         aRQ6ou3PX/OJExLHHcGaPxsLFG3kGVQQoEfsBw4cwd5sdDCAb4OtZ/dgD4PbyQytrwSk
         NEPhvL4cINzOF0cIxK8+Px1z3xMWo2jFH3sBWsCpkZsROGy15/T0La3pDgSFgvHQ/aPk
         kUWILozL++wMIfeaMDcYg787S98R0igfcW0g58H7Iowsg1Po8Vi4d96QjgmPGzFXvntn
         25Fqf3xepM+3oUGqg0PiJ309q4x1Emz49OoIqIjHjwo8LAjQGXmpwxOhbLMQ35HdkzfN
         GFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777205; x=1791382005;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w7/ZyRNe756x2qIILuqRWig+Ez86Z+PdUS4umWMDN+k=;
        b=opARKoJZkJiFD9k8WhfTj/ufFjj1kjXriCz5XVw4WetnsM44bNCg9C1tXtBkojZ6V3
         BKFl50cv7h7/QQRmGFpScFM+6hmUbkNiN0IJ6iqr/+4l6rWauX6Vx1DpjZk5t6+c1TTl
         HG6tqRVD8sT2mR5j/fBpQTqjEjQQ+xyKEY1S/SpzSKN2HjZdZbCqIdz33K4AwyryklOq
         fESf6mMurbYFMnqheMHCQ+TLwGTKEMavdX2cfLnpYNxu+l3hJ/fs2yDoHf9HUGzRjRr7
         s0yO8yHKOoRjMho23ZnIsJSi9MtGjiV+NNy5hBv4MLSnRfs4BuYtCpe4C+KtogI3I2lW
         Up4w==
X-Forwarded-Encrypted: i=1; AKwUvBwcAi8jRJUZ+fa8cyrTQ0MJ+yjYG1ZRN5n6xLAfJz80WSMH4nrfgSoewVzqprPRAKveF5RVY+SlJk7q4Qs=@vger.kernel.org
X-Gm-Message-State: AFuF++mALhx6hCUIymfv1m9HcZwQTI/GAP0QVz2+Rux0jwQ+WkPTaUER
	kKbBMPnL739hn2MROBAaC5w9x4kGHhNNdDiOaY2VmjTC+BV8jnfNKxzyv9q5wqhV7M4=
X-Gm-Gg: AYBFou2jqY08SDDMR1/gVeZ7CN7Yi8EDT9LIOtE/UbZeA7sT8QhfnvyK7sAH2ALfuFe
	Cd6XB7D/N2zgnqJsP9omKrDtP6WlCz/5rQr+1ZP6sgTKLydaJfQ5/hZv18FdexdWElI7pZiPG18
	BFCyhAR/41JBD++NjC3I+3tXJ7DQgrbKjCHfQWw5X7GqCIFzzhcH+OcZ2R5x/CpcYJMeTofrNVD
	xzrLBs2hFEUzJDUwOzAo9R+EkeUtKyapLzioUP0Y6j3Bg8RTihKmQAjywX6e0nN4FMfGx3QEgKj
	gQpekD37bnz4tzaiuHA0WENexnEbV18hqoPOioKiXOIc9yoZw1Eix602vRreks8wPnLLZbg+wXX
	P4aW/+DbubpS6pSjrbvEdfDJ31mIz5AO0U9WGaupMkQSMDeBDMdNFV+PxU8EaT3sPrFa1OrkcAs
	1iHOpB3UHjZo9AWrzTa2JrakV2hY/yj8d0rU02iWhOo2oFW3GX3LGdqco+b6ETtB9pDq/ARkUHy
	v2tqUM=
X-Received: by 2002:a05:620a:1a20:b0:939:f89:3688 with SMTP id af79cd13be357-93ca973661dmr258616985a.42.1790777203446;
        Wed, 30 Sep 2026 07:06:43 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ca83283besm122303285a.40.2026.09.30.07.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:06:42 -0700 (PDT)
Date: Wed, 30 Sep 2026 10:06:38 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: Harry Yoo <harry@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>, Shakeel Butt <shakeel.butt@linux.dev>,
	Usama Arif <usama.arif@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH] mm: page_alloc: make defrag_mode retries follow the
 promoted order
Message-ID: <ar0Xbs9mEu-vUHvc@cmpxchg.org>
References: <20260929174553.175333-1-kirill@shutemov.name>
 <arv8J7ysrdazJmfY@thinkstation>
 <ar0NRMxps8UErXaQ@thinkstation>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar0NRMxps8UErXaQ@thinkstation>

On Wed, Sep 30, 2026 at 02:32:12PM +0100, Kiryl Shutsemau wrote:
> On Tue, Sep 29, 2026 at 07:39:41PM +0100, Harry Yoo wrote:
> > On Tue, Sep 29, 2026 at 06:45:51PM +0100, Kiryl Shutsemau wrote:
> > > From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> > > 
> > > Since commit 7e8756d7ad22 ("mm: page_alloc: fix non-movable reclaim
> > > storm in defrag_mode"), direct reclaim and compaction for non-movable
> > > requests under defrag_mode run at pageblock_order, to produce the whole
> > > blocks that ALLOC_NOFRAGMENT needs.
> > 
> > > The retry decisions that follow still use the request order.
> > 
> > Indeed, good catch!
> > 
> > > An order-0 request can therefore retry
> > > indefinitely without ever reaching the ALLOC_NOFRAGMENT fallback:
> > > 
> > > - Reclaim at pageblock_order gives up after one pass as soon as a zone
> > >   looks compaction_ready(), and do_try_to_free_pages() then returns 1
> > >   even though nothing was reclaimed. It returns before the retry that
> > >   would reclaim memory.low-protected cgroups, so when most memory is
> > >   protected, the pass that did run finds next to nothing.
> > >
> > > - Compaction at pageblock_order fails or is deferred.
> > > 
> > > - should_reclaim_retry() takes the reported progress as progress for
> > >   the order-0 request and resets no_progress_loops. The request
> > >   retries.
> > 
> > Makes sense to me.
> > 
> > > Order 1-3 requests loop the same way, and should_compact_retry() also
> > > checks their pageblock_order compaction result against the request
> > > order.
> > > 
> > > On a production host (64G, defrag_mode, memory.low covering most of the
> > > workload), 95% of direct reclaim runs were order-9 runs that returned 1
> > > with nothing reclaimed, at up to 60k runs per second. Across ~200M
> > > should_reclaim_retry() calls in a day, no_progress_loops never left 0.
> > > The spinning allocations were SLUB slab refills for inode and dentry
> > > caches. The time spent registers as memory pressure, and pressure-based
> > > OOM killing takes down both workloads and system services.
> > > 
> > > Treat promoted requests like costly orders:
> > > 
> > > - Reclaim progress does not reset no_progress_loops for them.
> > > 
> > > - should_compact_retry() checks the compaction result at the promoted
> > >   order. It does not retry COMPACT_SKIPPED, since the request can fall
> > >   back, and it does not escalate compaction to COMPACT_PRIO_SYNC_FULL.
> > > 
> > > When the fallback is taken, reset the retry counters, so that the
> > > fallback attempt gets a full retry budget before the OOM killer is
> > > considered.
> > > 
> > > In a VM reproducer (32G, defrag_mode, inode churn under memory.low):
> > > 
> > >                                         before    after
> > >     should_reclaim_retry() calls           63M     293k
> > >     peak memory pressure (PSI some avg10)  99%      12%
> > > 
> > > File creation runs 5.7x faster.
> > > 
> > > Fixes: 7e8756d7ad22 ("mm: page_alloc: fix non-movable reclaim storm in defrag_mode")

Thanks for fixing this. Ironically, the same workload blowing up again
that I tested the old fix again for 3 weeks :(

Back then, the problem was: allocating thread is spinning on a goal it
doesn't help accomplish.

Now the problem is: allocating thread spinning and helping, but goal
is not achievable.

> > > Cc: <stable@vger.kernel.org>
> > > Assisted-by: LLM
> > > Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> > > ---
> > >  mm/page_alloc.c | 85 ++++++++++++++++++++++++++++++++-----------------
> > >  1 file changed, 56 insertions(+), 29 deletions(-)
> > > 
> > > diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> > > index 12fac9084c48..608487672d93 100644
> > > --- a/mm/page_alloc.c
> > > +++ b/mm/page_alloc.c
> > > @@ -4127,6 +4127,31 @@ __alloc_pages_may_oom(gfp_t gfp_mask, unsigned int order,
> > >  	return page;
> > >  }
> > >  
> > > +/*
> > > + * If fallbacks are not permitted (defrag_mode), we either need to
> > > + * reclaim space in a block of matching type, or clear out an entire
> > > + * block to allow __rmqueue_claim() to convert.
> > > + *
> > > + * Reclaim by itself is primarily freeing space in movable blocks,
> > > + * since that's where the LRU pages live. So this works for movable
> > > + * requests, but not for others.
> > > + *
> > > + * For those, promote the order of reclaim and compaction to help make
> > > + * blocks, instead of spinning in reclaim alone unproductively. Retry
> > > + * decisions based on the outcome of that work - reclaim progress and
> > > + * compaction results - must account for the promotion as well, see
> > > + * should_reclaim_retry() and should_compact_retry().
> > > + */
> > > +static inline unsigned int nofrag_promote_order(unsigned int order,
> > > +						unsigned int alloc_flags,
> > > +						const struct alloc_context *ac)
> > > +{
> > > +	if ((alloc_flags & ALLOC_NOFRAGMENT) && ac->migratetype != MIGRATE_MOVABLE)
> > > +		return max(order, pageblock_order);
> > > +
> > > +	return order;
> > > +}
> > 
> > I think we should start distinguishing order and compact/reclaim_order
> > in __alloc_pages_slowpath(). Silently overriding it makes it harder to
> > follow and easy to make a mistake.
> 
> Agreed, four callers recomputing the same thing is asking for a
> mismatch.
> 
> I would rather not grow this patch, it has to go to stable.
> 
> I will look into a cleanup on top: __alloc_pages_slowpath() computes the
> promoted order once per iteration and passes it to direct
> reclaim/compaction and the two retry helpers next to the request order,
> so the helpers stop knowing about defrag_mode.

+1

All they really need to know is the split into requested order vs
production order (reclaim_order, compaction_order).

> > > @@ -4299,7 +4316,7 @@ should_compact_retry(gfp_t gfp_mask, struct alloc_context *ac, int order,
> > >  	/*
> > >  	 * Compaction failed. Retry with increasing priority.
> > >  	 */
> > > -	min_priority = (order > PAGE_ALLOC_COSTLY_ORDER) ?
> > > +	min_priority = (compact_order > PAGE_ALLOC_COSTLY_ORDER) ?
> > >  			MIN_COMPACT_COSTLY_PRIORITY : MIN_COMPACT_PRIORITY;
> > 
> > This would change how hard we try to compact with defrag_mode in direct
> > compaction as it won't try compaction with MIN_COMPACT_PRIORITY anymore.
> > 
> > It doesn't make much sense to change that as part of this fix?
> 
> It is a choice between compacting harder and falling back, which
> fragments a block.
> 
> It is a judgement call on what defrag_mode means.
> 
> It would also mean that order-0 allocation request promoted to pageblock
> can trigger SYNC_FULL compaction. I cannot say I understand the
> implications. Will give it a try with the reproducer.
> 
> Johannes, Vlastimil, any comments here?

I would leave this one with requested order unless the reproducer
disagrees.

There is a risk of defrag_mode self defeating over time by raising the
bar for fallbacks but not high enough. Every fallback we let through
will make it harder down the line to compact towards that higher bar.

There is also a non-zero risk of connecting order-0 request contexts
to SYNC compaction which they haven't done before 7e8756d7ad22. But
you traced the problem to retrying, not sync compaction itself.
