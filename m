Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8F53BBFD5
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790716375; cv=none; b=frJFvEoEbUn4fvbtb4IIv+bRsJZDVke7ztbgCOyQNg/cSjsLuCmGOJ/7tg5MVugY1n/oWAwHBfTnLhx8iZXHZVTIo/NNXs6d0ld/ocLy8ArwI9c7lZDRrnvGPoIctO2NbEpfQX+qPkKUmaf8MVLeMODgLiCVFdKzwQS0hEo8HUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790716375; c=relaxed/simple;
	bh=n32Wso1nvIOz97wzPTl7+x6dFwPv5V9yh+Im3nJ8K20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HKUVaPjLMJD2jA08tm+pClczOzuJDd1cl4Sc/KOvlM09iq+Tzg+b/5piWjroEnMmpa1/N5Lugh7Ey1dB0+NoPLxwpWy+GK2Oal5wearJ96u645c1IxwzIR/ERoPRDob6J1RMiAKORXA5fy7yu/ZM7/prh79Amrj9D3Wdu3T9gxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HvfcNIyB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HvfcNIyB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E21E1F000FF;
	Tue, 29 Sep 2026 21:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790716374;
	bh=0Lpcx1HP/y+MUkTbUdvnEkaGYMJ8tt1DVZq1CrvHB68=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=HvfcNIyBslgzGO7OsnQ7Yk47UvFVBn/G7UcfDoOczq+p6jlKVs8C6sjUzEtSw8eHB
	 DPvTaPQo9zSCuyC5gi+eiLY/wy/6jPMSjnSHh3owOifwv3YbtoHcZCWbipeg2kWsM3
	 UYViwvoKpYx+U76W2femKcyQPUKn2rYZH+KF2dcbsp2A0YvEsN5QPLgWx8x0OvQChN
	 4La0upn4dtoxMXZ8WGkSoc7w/krQESvbDenvHStzfkS+F4t5lv0P/vKq5r8CUfb24t
	 iPa8itcr3nKPgSBFOUtLIa7GVWSMYthS/6DSC2Y6k3lY4yTA7mQsFISm5NFqnoVxIg
	 CccmYJUdGvrvQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id EFB52CE3A57; Tue, 29 Sep 2026 14:12:53 -0700 (PDT)
Date: Tue, 29 Sep 2026 14:12:53 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Chris Mason <mason@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, tglx@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] futex: sample poll cookie after publishing new hash
Message-ID: <5b6fab2a-90e9-42c2-8142-0b0f094559f4@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20260818011036.1138213-1-mason@kernel.org>
 <20260818011036.1138213-2-mason@kernel.org>
 <20260820104015.GE687043@noisy.programming.kicks-ass.net>
 <DLOLBXAIDH5J.2H6LPY4E4Q2RA@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLOLBXAIDH5J.2H6LPY4E4Q2RA@kernel.org>

On Fri, Sep 25, 2026 at 05:58:13PM +0000, Chris Mason wrote:
> On Thu Aug 20, 2026 at 10:40 AM UTC, Peter Zijlstra wrote:
> > On Mon, Aug 17, 2026 at 06:01:42PM -0700, Chris Mason wrote:
> >> futex_ref_drop() may only skip its grace period when one has already
> >> elapsed since the current private hash was published:
> >>
> >>     kernel/futex/core.c:futex_ref_drop
> >>         if (poll_state_synchronize_rcu(mm->futex.phash.batches)) {
> >>                 /*
> >>                  * There was a grace-period, we can begin now.
> >>                  */
> >>                 __futex_ref_atomic_begin(fph);
> >>                 return;
> >>         }
> >>
> >> The cookie it polls is sampled one statement before that publication:
> >>
> >>     kernel/futex/core.c:__futex_pivot_hash
> >>         new->state = FR_PERCPU;
> >>         scoped_guard(rcu) {
> >>                 mmph->batches = get_state_synchronize_rcu();
> >>                 rcu_assign_pointer(mmph->hash, new);
> >>         }
> >>         kvfree_rcu(fph, rcu);
> >>
> >> get_state_synchronize_rcu() anchors its guarantee at the snapshot, so
> >> the cookie is cleared by the first grace period that starts from there
> >> on, including one starting between the two stores which never waited
> >> for a reader that loaded the old hash after it began.
> >>
> >>     CPU 0 (resize)                    CPU 1 (futex_hash)
> >>     ==============                    ==================
> >>     __futex_pivot_hash()
> >>       batches = get_state_...()
> >>                                       grace period starts
> >>                                       guard(rcu)
> >>                                       fph = old hash
> >>       rcu_assign_pointer(hash, new)
> >>       kvfree_rcu(old hash)
> >>     futex_hash_allocate()
> >>       futex_ref_drop(new hash)
> >>         poll_state_...() -> true
> >>         __futex_ref_atomic_begin()
> >>           atomic = LONG_MAX
> >>                                       futex_ref_get(old hash) -> true
> >>                                       spin_lock(&fph->queues[i].lock)
> >>
> >> The reference count lives in the mm and has just been biased for the
> >> new generation, so the stalled reader pins and then locks the retired
> >> hash that is already queued for free, and its later put is charged
> >> against the live generation.
> >>
> >> Fix by sampling the cookie after rcu_assign_pointer() publishes the
> >> new hash. Drop the surrounding scoped_guard(rcu) while at it: it only
> >> delayed completion of the prematurely anchored grace-period and serves
> >> no purpose once the cookie is sampled after publication. The writer
> >> side is serialized by mm->futex.phash.lock and neither
> >> rcu_assign_pointer() nor kvfree_rcu() requires a read-side section.
> >
> > God, how I hate reading AI output :-(
> >
> > Anyway, the thinking was that by holding rcu_read_lock(), the current
> > RCU-GP cannot change and the cookie and assignment are effectively
> > 'atomic'.
> 
> >From what I can tell there are a few ways for new grace periods to start
> while we're holding rcu_read_lock(), synchronize_rcu_expedited() if no
> GP is currently in flight being the easiest?
> 
> Anyway, this BUG_ON() fires for me:
> 
> diff --git a/kernel/futex/core.c b/kernel/futex/core.c
> index a061f54b6..18d51c145 100644
> --- a/kernel/futex/core.c
> +++ b/kernel/futex/core.c
> @@ -215,6 +215,14 @@ static bool __futex_pivot_hash(struct mm_struct *mm, struct futex_private_hash *
>  	new->state = FR_PERCPU;
>  	scoped_guard(rcu) {
>  		mmph->batches = get_state_synchronize_rcu();
> +		/*
> +		 * Fires only if a grace period started after the cookie
> +		 * above was taken, although rcu_read_lock() is held. That
> +		 * grace period then satisfies the stored cookie, yet it began
> +		 * before the new hash is published below.
> +		 */
> +		BUG_ON(!same_state_synchronize_rcu(mmph->batches,
> +						   get_state_synchronize_rcu()));
>  		rcu_assign_pointer(mmph->hash, new);
>  	}
>  	kvfree_rcu(fph, rcu);
> 
> -chris

This matches my understanding of RCU.  Although rcu_read_lock() will
prevent a *new* RCU grace period from ending, it will not prevent an *old*
one from ending or a new one from starting.

							Thanx, Paul
