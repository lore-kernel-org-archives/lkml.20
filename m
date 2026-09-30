Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FD24E06E8
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790774671; cv=none; b=WDVfioLpFcc3Me6knVQ/0IBkpQc/ah9V8J5oaGxjrzVDvkxQrtLu2lgbeF/ktckA6wBIGRst23NYWS1iVXoX7uWehFAW3mQBSDudUU4zMqid4ARSq2KRfxlbaN0VDcmBHHpSH6/mB7gSEd6WxTyP1RBf1pGK+3afNd2JARhJavo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790774671; c=relaxed/simple;
	bh=97CUQJ0jx/zZgVtlqnb7GOV+PHKc+AGj9BHEyrV5LUs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=e1/yHaKclwXL6tYDvApL+80s7ozgQmAgD5MPDak+1WXpDGhpB9ZOEoxuDtauB57f91EsV4G1o9NeDJRl/KfVS+v9O1/W7h1gIHfiN5r+abNUWuq0/sXV0z0hEOOzYflQrOQQsvFDP+UJkarba/zXVlFS8io5VWmSHftVO6MaZIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SE7/uEcD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SE7/uEcD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 286411F00898;
	Wed, 30 Sep 2026 13:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790774653;
	bh=15GFVaEj+V3wbjvGFizhibuNggf64iOZ9yv8oWIFn4I=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=SE7/uEcDlUi+ZPilfbiAa92qwgEnUGteHOFrttn+wU2xGVS7k5nmj00eVFw2jINdi
	 BFgtdQlHfw4k/sZZ0nokmZB12pxrxUuW/AqqTT9Oqgp7tpqUinmVIuGZJFHS1IXBs+
	 Lv4OjGOR7V3/FFXLi+sAUxXNCdVjfOP6Dew+AyFfaw+J320vilZeHZv0r7/uHD0Rzy
	 LAP/1FjnXfSZDLqr8p7OxKL7xet5JooeYvFCxtGvd8AzthMV4FTDY4f08AlF3JVirt
	 f4iQHXzCfq/i65UTxZLiGJm9LqWik/W/23isqiOcCGLPAdRC+DehqiWSs/S+V3biXN
	 XlOqapqMWdp6Q==
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfauth.stl.internal (Postfix) with ESMTP id 8B207780043;
	Wed, 30 Sep 2026 09:24:12 -0400 (EDT)
Received: from stl-imap-13 ([10.204.2.104])
  by stl-compute-04.internal (MEProxy); Wed, 30 Sep 2026 09:24:12 -0400
X-ME-Sender: <xms:fA29alcQnOmc9ooOmHPQaaUI2dEJT_LJ6yDFqO3ugf4SJL9hdrJyfg>
    <xme:fA29auDy4wtTLs6lpFtyIaVpTY_uSEd3WxSBIuzzqAbW2rAI6AUQY7IQrpA3wK65p
    bavW-nYq5zCktX3GkWFdye3qqHCg6EpQ1djXF_zS3pmP3WwbNPI7EOU>
X-ME-Proxy-Cause: dmFkZTEhDQvTHabA0iEeZ8BHxLAv4EGY/+qfs3FRvdRrCMETHzgelsS6lS2ZtSUCeVRZsX
    2bZExYI1mo6kIJCrx0zn9hMdydRpFtuvtGewAg54ubj15jBRaBUfyk4NU8rkMLkTcRcx7H
    vI+u0EAlsPdbncIwCqkuXxurV1xHrl9USe/S0U5jTnC2/la163pAjb8sH+JfVBuk3mI6NA
    Y4JszNaRmVtOMbqVUuYKGVG4HPho0Q55Md+aI9NbQXllwp3Qo1K7bd3Cf3pmQp0KncXtan
    H/Yd5B46sNhkyqm59aMwkU2prBweuXylfyAVeKANtE0BcV6vuWQ92tIIWvA2UqY2cD+0pH
    vyu+on3prWpgCEQIcbQ52BRQpmaWlXVJ0VHzEyisXdgn2F7/HB/cl50SPjnbVICZXDqWZU
    YwLG5bSES0fNkK71WmIxkpOt+DIm8jm/FsaxAF30CKf7kcRW4ULo1sq/AL+4MeT5OuMYrw
    q76nP/cF8w9q66iWoxgqE7BH1+MfHs964RDTAac3gT71qm7t+mUWcguMT93V79UKmZZxGW
    E/PYiy3Ep5wEeNZrzOcOi3VSPeTnRGJGqa4k8vzYygqLlNhQcAQdfe35/S/stPzIPA67+g
    1vwqF5P+Zy0EEV2A2lXhVuWQOQXVeD8r4IVph1Hb4PQFjub5vUjvMqV1dRSw
X-ME-Proxy: <xmx:fA29ahEe82bEshjiXq9l82BhprGa1TyZN13ZLVHhXxs1IbI77Gmu3Q>
    <xmx:fA29akIhU5FBtW3TcdadQygsyVBnyDoJq2k-Z1ds3m6nCLZQfdBeSw>
    <xmx:fA29atmqXyJ9maNQ_T7IQn8abT8X8il5C9OIYvZpfPAD2MlrrJ4CDw>
    <xmx:fA29akQC3ZKTTunlrlyI-buv1EvFWD5iLFyDPPzi0GliA4J1f8icQg>
    <xmx:fA29anIivq51mhaI02M2lT4AewJMlzM8b90IUnHgs2ibzfs6udhJaqzc>
Feedback-ID: iccae4b50:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 38C16F60078; Wed, 30 Sep 2026 09:24:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A-_873_JFPgw
Date: Wed, 30 Sep 2026 09:23:52 -0400
From: "Chris Mason" <mason@kernel.org>
To: "Peter Zijlstra" <peterz@infradead.org>,
 "Paul E. McKenney" <paulmck@kernel.org>
Cc: tglx@kernel.org, linux-kernel@vger.kernel.org
Message-Id: <d6e1b8cf-ee16-4a8f-b2e5-abc52908e6e3@app.fastmail.com>
In-Reply-To: <20260930112156.GL88198@noisy.programming.kicks-ass.net>
References: <20260818011036.1138213-1-mason@kernel.org>
 <20260818011036.1138213-2-mason@kernel.org>
 <20260820104015.GE687043@noisy.programming.kicks-ass.net>
 <DLOLBXAIDH5J.2H6LPY4E4Q2RA@kernel.org>
 <5b6fab2a-90e9-42c2-8142-0b0f094559f4@paulmck-laptop>
 <20260930112156.GL88198@noisy.programming.kicks-ass.net>
Subject: Re: [PATCH] futex: sample poll cookie after publishing new hash
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Sep 30, 2026, at 7:21 AM, Peter Zijlstra wrote:
> On Tue, Sep 29, 2026 at 02:12:53PM -0700, Paul E. McKenney wrote:
>> On Fri, Sep 25, 2026 at 05:58:13PM +0000, Chris Mason wrote:
>> > On Thu Aug 20, 2026 at 10:40 AM UTC, Peter Zijlstra wrote:
>> > > On Mon, Aug 17, 2026 at 06:01:42PM -0700, Chris Mason wrote:
>> > >> futex_ref_drop() may only skip its grace period when one has already
>> > >> elapsed since the current private hash was published:
>> > >>
>> > >>     kernel/futex/core.c:futex_ref_drop
>> > >>         if (poll_state_synchronize_rcu(mm->futex.phash.batches)) {
>> > >>                 /*
>> > >>                  * There was a grace-period, we can begin now.
>> > >>                  */
>> > >>                 __futex_ref_atomic_begin(fph);
>> > >>                 return;
>> > >>         }
>> > >>
>> > >> The cookie it polls is sampled one statement before that publication:
>> > >>
>> > >>     kernel/futex/core.c:__futex_pivot_hash
>> > >>         new->state = FR_PERCPU;
>> > >>         scoped_guard(rcu) {
>> > >>                 mmph->batches = get_state_synchronize_rcu();
>> > >>                 rcu_assign_pointer(mmph->hash, new);
>> > >>         }
>> > >>         kvfree_rcu(fph, rcu);
>> > >>
>> > >> get_state_synchronize_rcu() anchors its guarantee at the snapshot, so
>> > >> the cookie is cleared by the first grace period that starts from there
>> > >> on, including one starting between the two stores which never waited
>> > >> for a reader that loaded the old hash after it began.
>> > >>
>> > >>     CPU 0 (resize)                    CPU 1 (futex_hash)
>> > >>     ==============                    ==================
>> > >>     __futex_pivot_hash()
>> > >>       batches = get_state_...()
>> > >>                                       grace period starts
>> > >>                                       guard(rcu)
>> > >>                                       fph = old hash
>> > >>       rcu_assign_pointer(hash, new)
>> > >>       kvfree_rcu(old hash)
>> > >>     futex_hash_allocate()
>> > >>       futex_ref_drop(new hash)
>> > >>         poll_state_...() -> true
>> > >>         __futex_ref_atomic_begin()
>> > >>           atomic = LONG_MAX
>> > >>                                       futex_ref_get(old hash) -> true
>> > >>                                       spin_lock(&fph->queues[i].lock)
>> > >>
>> > >> The reference count lives in the mm and has just been biased for the
>> > >> new generation, so the stalled reader pins and then locks the retired
>> > >> hash that is already queued for free, and its later put is charged
>> > >> against the live generation.
>> > >>
>> > >> Fix by sampling the cookie after rcu_assign_pointer() publishes the
>> > >> new hash. Drop the surrounding scoped_guard(rcu) while at it: it only
>> > >> delayed completion of the prematurely anchored grace-period and serves
>> > >> no purpose once the cookie is sampled after publication. The writer
>> > >> side is serialized by mm->futex.phash.lock and neither
>> > >> rcu_assign_pointer() nor kvfree_rcu() requires a read-side section.
>> > >
>> > > God, how I hate reading AI output :-(
>> > >
>> > > Anyway, the thinking was that by holding rcu_read_lock(), the current
>> > > RCU-GP cannot change and the cookie and assignment are effectively
>> > > 'atomic'.
>> > 
>> > >From what I can tell there are a few ways for new grace periods to start
>> > while we're holding rcu_read_lock(), synchronize_rcu_expedited() if no
>> > GP is currently in flight being the easiest?
>> > 
>> > Anyway, this BUG_ON() fires for me:
>> > 
>> > diff --git a/kernel/futex/core.c b/kernel/futex/core.c
>> > index a061f54b6..18d51c145 100644
>> > --- a/kernel/futex/core.c
>> > +++ b/kernel/futex/core.c
>> > @@ -215,6 +215,14 @@ static bool __futex_pivot_hash(struct mm_struct *mm, struct futex_private_hash *
>> >  	new->state = FR_PERCPU;
>> >  	scoped_guard(rcu) {
>> >  		mmph->batches = get_state_synchronize_rcu();
>> > +		/*
>> > +		 * Fires only if a grace period started after the cookie
>> > +		 * above was taken, although rcu_read_lock() is held. That
>> > +		 * grace period then satisfies the stored cookie, yet it began
>> > +		 * before the new hash is published below.
>> > +		 */
>> > +		BUG_ON(!same_state_synchronize_rcu(mmph->batches,
>> > +						   get_state_synchronize_rcu()));
>> >  		rcu_assign_pointer(mmph->hash, new);
>> >  	}
>> >  	kvfree_rcu(fph, rcu);
>> > 
>> > -chris
>> 
>> This matches my understanding of RCU.  Although rcu_read_lock() will
>> prevent a *new* RCU grace period from ending, it will not prevent an *old*
>> one from ending or a new one from starting.
>
> So, let us consider the dual counter RCU.
>
> The RCU state is:
>
>   counter[2];
>   index;
>
> rcu_read_lock() would increment counter[index & 1], rcu_read_unlock() would
> decrement whatever counter it incremented (say rcu_read_lock() returns
> the index, like SRCU does).
>
> GP progression can either be sample or rcu_read_unlock() driven. Either
> way, when 'counter[!(index & 1)] == 0' is observed, there are no more
> observers of the old state (and callbacks can be ran).
>
> At this point we can flip the counter and start anew: index++;
>
> So index changes while counter[index & 1] != 0, which is somewhat
> fundamental to how the whole thing works.
>
> Now, suppose get_state_synchronize_rcu() is simply returning a snapshot
> of 'index', then same_state_synchronize_rcu() can indeed trigger. The
> index can get advanced.
>
> But that does not mean poll_state_synchronize_rcu() would return true;
> in the above scheme poll_state_synchronize_rcu() would be something
> like:
>
>   if (index - snapshot < 2)
>     return counter[snapshot & 1] == 0;
>
>   return true;
>
> That is, not only does index need to advance, but also the counter needs
> to drain in order for it to report the GP is complete.
>
> And this is where I went wrong, when we hold rcu_read_lock() we pin the
> counter and thus the GP cannot complete.  But as I now see, that is not
> sufficient, because there can be observers of the old state in the next
> GP too.
>
> So yes, the code is wrong and the patch is correct.

Ok, I'll resend against recent git with a better commit message, unless you've already queued up something better suited?

-chris
