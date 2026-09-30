Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58559364EA4
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767324; cv=none; b=LIMQlfO5tY63qBvqlldd/LnFNHyfh0ui7W8NOOhJL73q5xQgdcfuJ9Ks7Wyk8yoVJEU7FkU2CUL/9plbrVQseZkWA8rt8D0McyCAqjGfVZsODPbFZ+9AjC1Xc+X9HYi4okSE1+LlvboNY6Oiiaaqe7JlB6ea3ut7D/VO0guBYVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767324; c=relaxed/simple;
	bh=GP04wFEchLmfrYDL/C0c+zXwBLN/HNB1boGh4IWvbHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VWXbAkZn89wOeD9Ec9kmhLQiLk4m2qGkma1DQSNA5xwAS2FS5/e5vnmHItYflTLoJHWTzj1jJd/qeIIb+DMlmmuhb9KWiepNLPp8Y4Fs1cUtuuRgYKtYF9QZIcSy+snFAxAvENXcTXH204VaydXYJtsLVMtKbqvaLdCtPCYMb18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=onRF7fW9; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="onRF7fW9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dFzh1GAH8MFFpYIQbt45n9YCZuObHt+GgYmf+X1M1Jk=; b=onRF7fW9jpnq5jB9QuGhLyxvEc
	qbEU2fUC3UpnLTPoe4Y4MOi1Nfi4cGWEmyG2JHjqKAlNQ86LM+9KpZfg+1B+C0AO6CdR1AnClln0I
	Gu3XzkQmOXKs90vegdNrdV11Md1Ulaa9zeyDKaYNAcDb2MQnZ6VqnJZojH5zUVVchCyROf29oRs2k
	3TPOfQonffD3ilZDKXBzCvwXMn1OtnnDXA6mTzbtWmqZPbMC6XpFjQ8uxqeetkfHGl0YRVKqcVHcI
	osAAD09aLVwoedY5A54LkfgTYIg1VbbVcajIby3B7snDoHwqbDoYbrMJXG3L4rYBj7Vf8HjQif7h/
	4DMr29CQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBsNq-00000003i6w-0SRG;
	Wed, 30 Sep 2026 11:21:58 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id ED9DC300583; Wed, 30 Sep 2026 13:21:56 +0200 (CEST)
Date: Wed, 30 Sep 2026 13:21:56 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Chris Mason <mason@kernel.org>, tglx@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] futex: sample poll cookie after publishing new hash
Message-ID: <20260930112156.GL88198@noisy.programming.kicks-ass.net>
References: <20260818011036.1138213-1-mason@kernel.org>
 <20260818011036.1138213-2-mason@kernel.org>
 <20260820104015.GE687043@noisy.programming.kicks-ass.net>
 <DLOLBXAIDH5J.2H6LPY4E4Q2RA@kernel.org>
 <5b6fab2a-90e9-42c2-8142-0b0f094559f4@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b6fab2a-90e9-42c2-8142-0b0f094559f4@paulmck-laptop>

On Tue, Sep 29, 2026 at 02:12:53PM -0700, Paul E. McKenney wrote:
> On Fri, Sep 25, 2026 at 05:58:13PM +0000, Chris Mason wrote:
> > On Thu Aug 20, 2026 at 10:40 AM UTC, Peter Zijlstra wrote:
> > > On Mon, Aug 17, 2026 at 06:01:42PM -0700, Chris Mason wrote:
> > >> futex_ref_drop() may only skip its grace period when one has already
> > >> elapsed since the current private hash was published:
> > >>
> > >>     kernel/futex/core.c:futex_ref_drop
> > >>         if (poll_state_synchronize_rcu(mm->futex.phash.batches)) {
> > >>                 /*
> > >>                  * There was a grace-period, we can begin now.
> > >>                  */
> > >>                 __futex_ref_atomic_begin(fph);
> > >>                 return;
> > >>         }
> > >>
> > >> The cookie it polls is sampled one statement before that publication:
> > >>
> > >>     kernel/futex/core.c:__futex_pivot_hash
> > >>         new->state = FR_PERCPU;
> > >>         scoped_guard(rcu) {
> > >>                 mmph->batches = get_state_synchronize_rcu();
> > >>                 rcu_assign_pointer(mmph->hash, new);
> > >>         }
> > >>         kvfree_rcu(fph, rcu);
> > >>
> > >> get_state_synchronize_rcu() anchors its guarantee at the snapshot, so
> > >> the cookie is cleared by the first grace period that starts from there
> > >> on, including one starting between the two stores which never waited
> > >> for a reader that loaded the old hash after it began.
> > >>
> > >>     CPU 0 (resize)                    CPU 1 (futex_hash)
> > >>     ==============                    ==================
> > >>     __futex_pivot_hash()
> > >>       batches = get_state_...()
> > >>                                       grace period starts
> > >>                                       guard(rcu)
> > >>                                       fph = old hash
> > >>       rcu_assign_pointer(hash, new)
> > >>       kvfree_rcu(old hash)
> > >>     futex_hash_allocate()
> > >>       futex_ref_drop(new hash)
> > >>         poll_state_...() -> true
> > >>         __futex_ref_atomic_begin()
> > >>           atomic = LONG_MAX
> > >>                                       futex_ref_get(old hash) -> true
> > >>                                       spin_lock(&fph->queues[i].lock)
> > >>
> > >> The reference count lives in the mm and has just been biased for the
> > >> new generation, so the stalled reader pins and then locks the retired
> > >> hash that is already queued for free, and its later put is charged
> > >> against the live generation.
> > >>
> > >> Fix by sampling the cookie after rcu_assign_pointer() publishes the
> > >> new hash. Drop the surrounding scoped_guard(rcu) while at it: it only
> > >> delayed completion of the prematurely anchored grace-period and serves
> > >> no purpose once the cookie is sampled after publication. The writer
> > >> side is serialized by mm->futex.phash.lock and neither
> > >> rcu_assign_pointer() nor kvfree_rcu() requires a read-side section.
> > >
> > > God, how I hate reading AI output :-(
> > >
> > > Anyway, the thinking was that by holding rcu_read_lock(), the current
> > > RCU-GP cannot change and the cookie and assignment are effectively
> > > 'atomic'.
> > 
> > >From what I can tell there are a few ways for new grace periods to start
> > while we're holding rcu_read_lock(), synchronize_rcu_expedited() if no
> > GP is currently in flight being the easiest?
> > 
> > Anyway, this BUG_ON() fires for me:
> > 
> > diff --git a/kernel/futex/core.c b/kernel/futex/core.c
> > index a061f54b6..18d51c145 100644
> > --- a/kernel/futex/core.c
> > +++ b/kernel/futex/core.c
> > @@ -215,6 +215,14 @@ static bool __futex_pivot_hash(struct mm_struct *mm, struct futex_private_hash *
> >  	new->state = FR_PERCPU;
> >  	scoped_guard(rcu) {
> >  		mmph->batches = get_state_synchronize_rcu();
> > +		/*
> > +		 * Fires only if a grace period started after the cookie
> > +		 * above was taken, although rcu_read_lock() is held. That
> > +		 * grace period then satisfies the stored cookie, yet it began
> > +		 * before the new hash is published below.
> > +		 */
> > +		BUG_ON(!same_state_synchronize_rcu(mmph->batches,
> > +						   get_state_synchronize_rcu()));
> >  		rcu_assign_pointer(mmph->hash, new);
> >  	}
> >  	kvfree_rcu(fph, rcu);
> > 
> > -chris
> 
> This matches my understanding of RCU.  Although rcu_read_lock() will
> prevent a *new* RCU grace period from ending, it will not prevent an *old*
> one from ending or a new one from starting.

So, let us consider the dual counter RCU.

The RCU state is:

  counter[2];
  index;

rcu_read_lock() would increment counter[index & 1], rcu_read_unlock() would
decrement whatever counter it incremented (say rcu_read_lock() returns
the index, like SRCU does).

GP progression can either be sample or rcu_read_unlock() driven. Either
way, when 'counter[!(index & 1)] == 0' is observed, there are no more
observers of the old state (and callbacks can be ran).

At this point we can flip the counter and start anew: index++;

So index changes while counter[index & 1] != 0, which is somewhat
fundamental to how the whole thing works.

Now, suppose get_state_synchronize_rcu() is simply returning a snapshot
of 'index', then same_state_synchronize_rcu() can indeed trigger. The
index can get advanced.

But that does not mean poll_state_synchronize_rcu() would return true;
in the above scheme poll_state_synchronize_rcu() would be something
like:

  if (index - snapshot < 2)
    return counter[snapshot & 1] == 0;

  return true;

That is, not only does index need to advance, but also the counter needs
to drain in order for it to report the GP is complete.

And this is where I went wrong, when we hold rcu_read_lock() we pin the
counter and thus the GP cannot complete.  But as I now see, that is not
sufficient, because there can be observers of the old state in the next
GP too.

So yes, the code is wrong and the patch is correct.






