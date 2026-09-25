Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C8B368D45
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790333865; cv=none; b=eV1CFLV45mVtbGks+psdLkQDZznXCkwGtT81y3Xoqey6VjsX/CfUC+/Rc4BGh3b2KcJAkk8tgbV7qI9btBHpEf5IYT+fvlp+Hpy0rkIUSTpQWvO4JjotoMVy/0AxtwFka6HYRAe3SpF7X84GgD7dUKOB7ZvVyZRMr/3ezQ8dh0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790333865; c=relaxed/simple;
	bh=5QQleRhvMuMXr0hNnWCKZu7nFiqRsbQ43lsdzgw8qS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X4AFz/iPC2O4DMHy2hhWPGeOhtzwinqDX+y14CBnKmpW28mclsM63GgWAPjHHrctYMIRrQe80GESAcVz1ryYyna5Y9atAz2AcaqMoziBCDxDaEDLglihovrqYs2MacI0L19/Dc8Ry61V+dzg2BCwjCHPACS1zZVhHGOM3xw87I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NFSHH485; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NFSHH485"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F2FF1F000FF;
	Fri, 25 Sep 2026 10:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790333864;
	bh=Nnw14xvfnQJHUMg1YXGWQNGAHKQa7rYgYgJD3iK4zYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NFSHH4853QkanVK7cAcdsVYAO7CYl3VgyNJYz2cVgQtgurMgoA3lFdYljYW/k9syR
	 3iLr0riA8QHTHG+jgg+f7jROnNDUwZYZ633UjZ1M5/70fCm6UsfoeyKoblQAClGJAn
	 t7eBTDsQHSF5p3YIfUhIiiKOjIu7mlTYOCEwTdT6E4BfV4XrST0m1eEG4xxAGnSsY3
	 q+xVulTcc5tNj7kVYX00uvcM4mttnaY3zaCCQ6F3onF+q5RD/6Hec7jryDoUiiBM3Y
	 hWPZ2MrnOGXId0wyubFDI8IcuEwFClX0ByYw1lP+xnX0C1zvIQIkKsToQ+nus7++SD
	 yUqx0FT6Da1Cw==
Date: Fri, 25 Sep 2026 11:57:41 +0100
From: Harry Yoo <harry@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Suren Baghdasaryan <surenb@google.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH slab/for-next-fixes] mm/slab: do not wake up kswapd in
 __kfree_rcu_sheaf()
Message-ID: <arVERNhXeU1BX54G@thinkstation>
References: <20260922-kfree-rcu-dont-wakeup-kswapd-v1-1-42d7e2636f9e@kernel.org>
 <2db41ce0-a510-4050-a79c-ff1f16640b47@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2db41ce0-a510-4050-a79c-ff1f16640b47@kernel.org>

On Thu, Sep 24, 2026 at 10:43:01AM +0200, Vlastimil Babka (SUSE) wrote:
> On 9/22/26 13:56, Harry Yoo (Meta) wrote:
> > Fix this by always avoiding waking up kswapd in __kfree_rcu_sheaf().
> > Note that there are two paths that might wake up kswapd:
> > 
> >   1) __kfree_rcu_sheaf()
> >      // __GFP_KSWAPD_RECLAIM might wake up kswapd
> >      -> alloc_empty_sheaf(GFP_NOWAIT)
> > 
> >   2) __kfree_rcu_sheaf()
> >      // Let's say __kfree_rcu_sheaf() doesn't pass GFP_NOWAIT
> >      -> alloc_empty_sheaf(__GFP_NOWARN)
> >      -> kmalloc_flags()
> >      -> slab_alloc_node()
> >      -> alloc_from_pcs()
> >      -> __pcs_replace_empty_main()
> >      // Free a sheaf in an allocation path when the sheaf becomes empty
> >      // and refilling the sheaf fails
> 
> So that's this
> 
>                 /*
>                  * we must be very low on memory so don't bother
>                  * with the barn
>                  */
>                 sheaf_flush_unused(s, empty);
>                 free_empty_sheaf(s, empty);
> 
> Now I wonder if we should just use the barn then, lol. We either took the
> empty sheaf from there, or there was none, so we don't risk overfilling it
> with free sheaves.

Well when refill_sheaf() fails, it's not guaranteed to be empty.
Might have to put a partial sheaf to full list?

... well, now we have sheaf_partial though :-)

> Well but I guess sheaf_flush_unused() could end up in freeing paths anyway.
> But that's a bulk free which doesn't involve sheaves at least.

What do you mean by "**sheaf_flush_unused()** could end up in freeing path"
but "that's a bulk free which doesn't involve **sheaves**"?

> We could also distinguish which callers of refill_sheaf() can continue with
> a partially refilled sheaf. This one likely can so we'd not have to be
> flushing, ever?

Can we do that without adding too much complexity?

> >      -> free_empty_sheaf()
> >      -> slab_free()
> >      -> free_to_pcs()
> >      -> __pcs_replace_full_main()
> >      // However free path always assumes it's safe to wake up kswapd
> >      -> alloc_empty_sheaf(GFP_NOWAIT)
> 
> Would be great to avoid all this from kfree_rcu().

Yeah.

> > Drop __GFP_KSWAPD_RECLAIM in both cases. Note that the kfree_rcu() is
> > not the only user of free_to_pcs() path, but it should be fixed as it
> > can be invoked under pi_lock.
> > 
> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > Closes: https://sashiko.dev/#/message/20260831-b4-kfree_rcu_hotfix-v1-1-4f0fb882638b%40kernel.org
> > Fixes: ec66e0d59952 ("slab: add sheaf support for batching kfree_rcu() operations")
> > Link: https://lore.kernel.org/linux-mm/20260831143500.x-saxdAs@linutronix.de
> 
> Fixed up per your reply.

Ack.

> > Assisted-by: LLM
> 
> Changed to (per below)
> 
> Assisted-by: LLM # dicovery and verification

Ack.

Didn't know adding # blablah after Assisted-by: was a thing!

> > Signed-off-by: Harry Yoo (Meta) <harry@kernel.org>
> > ---
> > The discovery and verification (w/ a modified kernel) of the bug was
> > assisted by LLMs.
> > 
> > More speicifically, the first path was pointed out by Sashiko, and
> > the second path was discovered by LLM while reviewing the commit with
> > review-prompts [1].
> > 
> > Harry Yoo reviewed those findings and manually crafted the patch based
> > on that.
> > 
> > [1] https://github.com/masoncl/review-prompts
> > 
> > I believe the right direction to address this issue is to make
> > kfree_nolock() work in any context and replace it with kfree_rcu()
> > in the scheduler. However for now it won't work under pi_lock,
> > and resolving that would be a longer journey.
> 
> Indeed.
> 
> > Address this issue by dropping __GFP_KSWAPD_RECLAIM, for now.
> 
> Applied to mm/slab.git slab/for-next-fixes, thanks!

Thanks!

> But still could discuss a better solution per above.

-- 
Cheers,
Harry / Hyeonggon
