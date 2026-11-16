Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794848955;
	b=sFsqIOeBIjRevZ/W8CSRBcA5HaG7VQVJ0anVkwHWh6xhVPIbdbmAILVpaUYo+pW3o7LH
	 4rjYQpRnLd96lR/XnnP2fs+BTNtFfSyIRrtkOOWLyjVt2QR1APe1jHygYWq+ZD+rJJMrg
	 aAXHafFDby4vrZXImRYtwtXCksz/ATyXxTFmPs9Dx4bQE8jkOyimZhfvrEPHZPGKQwaR/
	 pnPgFdAsKiTWVy50/6kcwW83GPW+bghjJYpyXdPCRAgXbZZgZDY6HX3zq/azC2BQw+2zO
	 JJYCZEdaxXkCLrroY+5Jx2eu0K/iHjiNHvO7IvnO6CbZsqdXlRad5Y1d2rPwkAQhfng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848955;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=c3buyKQSWI2nuDxs8mc/02zt0UuVanpBL1mJDNGiVrA=;
	b=hpa2yOwPHNQKxZN0wgw/Dn5WrIlRksflA/U51j8/OhwbBj6+j8QMWzQZjjzmCCKaNkAn
	 Vjdyr2Sdadz2BsxA1UshYwNQefXooNsETV70Tez1xScUpJSOJTA36hvote9Hb1iTxttDU
	 1lwH9A7zE/EsOb4t1I+7ttAl45bl3li9jFMTdyy1YelufR7+XP360+CnPnFp2lAz1FvK4
	 3whEOSgLXqQLeBP4Y+1IDXNQRfqObI4gVrVwj2jK/+b6/3nn2hOpsIsdb4nS2RBKniTzs
	 quwVpxfEKCA/voqwgNWCdtRalVFxGm0QPp3uJh538w39nMVWRSesG6JdDM9PhiIf7+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="dlA5QhN/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B536606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dlA5QhN/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E1A81F000C4;
	Mon, 16 Nov 2026 17:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794848954;
	bh=c3buyKQSWI2nuDxs8mc/02zt0UuVanpBL1mJDNGiVrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dlA5QhN/JzfWtXtl9oMlD6qpBgTmI3zyny/w7vGnqAH1XF5SiJHYIutInI6mY+w8P
	 hAYklVUiZN474zYZsx6lAnyAFTjxtfCrKh8vR6sugaaYEcOAXS6DE/5aOeEezDLisD
	 Ax3I/917nyoVt1el7Jn3M94cBt0TuogPsqycBY14FkXtb8CKqrqVVhUY/ZjtUeJeUA
	 igQAVPjY0s0sL8oCJXISMNQrrEzNHQDA/xfr0NlzuJCQI+P6vyjjzl+RYzfEkhh1R2
	 8cHPYqd/I5dmb0BI3ll7R7L58DCZILxDPu+qeqzhV90DdXwmI1kYYA6pP77G3dg/NM
	 9G4OXlSaZQWsw==
Date: Mon, 16 Nov 2026 07:09:13 -1000
From: Tejun Heo <tj@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] workqueue: Fixes for v7.4-rc2
Message-ID: <avs4uWg9ch-Bqobj@slm.duckdns.org>
References: <fb224bad9baf5f44cf17e1d664776a4e@kernel.org>
 <CAHk-=wg4jAWZvxWo0OZ+fFTU=SBtQ7dnsUCV7hx+UAifkwPUwQ@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wg4jAWZvxWo0OZ+fFTU=SBtQ7dnsUCV7hx+UAifkwPUwQ@mail.gmail.com>

Hello, Linus.

On Sun, Nov 15, 2026 at 02:14:41PM -0800, Linus Torvalds wrote:
> On Sun, 15 Nov 2026 at 12:45, Tejun Heo <tj@kernel.org> wrote:
> >
> > - Draining a workqueue could return while a work item queued by another work
> >   item was still pending, making workqueue destruction warn and leak the
> >   workqueue.
> 
> Why is this re-creating - badly - the existing sequence counter code?

I was trying to plug the hole minimally and it just didn't trigger "oh this
is seqcount".

> Not only does it do the memory barriers by hand - possibly getting
> them wrong, but it seems actively broken.
> 
> There's a reason proper sequence counters have that "odd/even" rule,
> and a writer increments the sequence counter *twice* - once when it
> starts the modification and once when it is done.
> 
> As far as I can tell, your "fix" is still broken:
> 
>   drain_workqueue:
> 
>         mutex_lock(&wq->mutex);
>         if (!wq->nr_drainers++)
>                 wq->flags |= __WQ_DRAINING;
>         mutex_unlock(&wq->mutex);
> 
>         seq = atomic_read(&wq->drain_seq);
> 
> 
> __queue_work:
> 
>         if (unlikely(wq->flags & (__WQ_DESTROYING | __WQ_DRAINING))) {
>    ...
>                 smp_mb__before_atomic();
>                 atomic_inc(&wq->drain_seq);
>                 smp_mb__after_atomic();
> 
> but what if __queue_work() was called before __WQ_DRAINING was set and
> is running concurrently and never incremented the sequence number?
> 
> Of even if it *did* increment the sequence number, what keeps it from
> doing that *before* the atomic_read() in drain_workqueue() and then
> 
> Either way drain_workqueue() never sees that drain_seq change, and
> thinks everythings is fine, even though __queue_work added an entry?
> 
> Is there some other serialization that I'm missing?

Hmm... so, draining looks like this:

        set DRAINING;
        read seq;
        flush wq:
                for each pwq:
                        flush them;
        for each pwq:
                lock and check whether empty;
        if not drained or seq bumped, try again;

and the queueing side tests DRAINING and incs the seq while the queueing
work item is still in flight on its pwq. The chained insertion is under the
pool lock.

Any work item that hasn't seen DRAINING or inc'd the seq before draining
reads it should be visible to the flush wq step, and by the time flush
finishes, all the immediate chained work items it queued should be visible
to the following pwq empty test step.

A chained work item queued after the flush started saw DRAINING and inc'd
the seq after the read, so if it chains further and finishes before the
empty test, the seq check catches it.

> Anyway, sequence numbers almost never work with a single write,
> exactly beause the single write is itself then not ordered with the
> changes that the writer does (ie the sequence point update happens
> before them or after them, but either way the reader might miss the
> sequence number update, becuase it's not atomic wrt the actual change
> it is supposed to be about.
> 
> The actual 8real* sequence numbers we have do that two-step change
> exactly because of these issues. The writer increments once before it
> starts writing, and increments it again after it is done. That way the
> reader actually can check whether something changed (an odd value
> means that change is happening and needs retrying regardless - which
> is why read_seqcount_begin(() will loop on odd numbers)
> 
> It is possible that I'm missing something that makes your ad-hoc
> version ok, but this really does look just plain broken.
> 
> I pulled it and then unpulled it, waiting for explanations.

I don't think it's broken but it is adhoc and difficult to get one's head
around including my own. It'd be a lot simpler w/ seqcount. I'm traveling
this week, so might be slower but will redo it.

Thanks.

-- 
tejun
