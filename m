Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794929060;
	b=RWUBNoUnt8FfMTChK9NU0o3cQxAEN//zv9Z8U6s2nMpA1zqqgp8yJS1ATcqYf3yEaPqE
	 HUx3xcE/uEXOoSsOZhY+/h9qwNH3SmosVJPbWUR2gr0/yM6v/Ha9pwJqfMf3SLyEIGayp
	 +ercHZYGOn9HMSxlqQJz/WYZTfQ6/nlAl4HtmVYvSt8xmyh84XQhKH1MvZ6sa0GXcSUIc
	 8fk1f4IuKIYoPJDMouwrGYXqrGr2Z1mBtOXBTD46KYVEchRASiEthDVzD3lnpHnRmQbkb
	 0kAJqkTj90dROpAVS1YLGiQfIWgyV4IbWQHRrJ+OehAK5TMHgKr8LJs1WksXrJaWj0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794929060;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=tR40YrQMqhA3qjVXrvl2z3Xw/HP3Dpq+zbmny/i+Kxk=;
	b=fCzPP07/Raq+28Oas5+G56/7IDkWYsadtm0OAMOr6mtbssMJxVOrD/nlZVt7FoqHKdt5
	 kaxtfuCPxw1+gg2bisQMtgibEEXDqmGWXc9TfLEn2Lh2JGuoNKitZp1+tClMLpRA7xX/7
	 AJMLC2l+ZoDInv05r4zRLol4hCL7ThqfoIEEcukm5ytp6L0JXWfTZAJDDbpEExebNoeGb
	 uMylSD6mqjlWEo+J/5KMYVpoWjQbZUJT0kQWC9c9TWWUQHhZK33ZqTa2RaoGy3PMIkIst
	 KARmpugScCJHwnLjr0sHOdX9AITrYrc8SRsVZs85b48HvWuFx1OCgKaUrfX8yQ15I7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=hwPlZkpk;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C142B606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:24:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C142B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=hwPlZkpk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tR40YrQMqhA3qjVXrvl2z3Xw/HP3Dpq+zbmny/i+Kxk=; b=hwPlZkpkZ9tTbFFxWXXy2O/29c
	l6Cl/QzRiq9ZC8CyQSFqY3tPsO4f+ha++R431B9FgPOhIncGJtG4JvZt8OwGDRF9IhElYCraD/DBu
	u3naxqv7j5OJtCz5F4SnEDETVbmUJ/uEoODCo2MbYScsdDp6WY3ekEL6JBBg7ib1cbUZuc+KYZRQM
	I1bEbzdclRJeI+vzAp2C/EIqHrS3B6chFhtCcNoB46X0AggxnAKaXgyx03VTvkMx/qbbuaKNavFkx
	2ja7op/rtQ1VYzOsMFpd1yjsok2qeIjMoEIz8RC4i5OaWcnmzaKTxYSdcC7QPBZ6Pd74G8JqpaAyf
	EeaBOdLQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTL2d-0000000F7dg-0aNJ;
	Tue, 17 Nov 2026 15:24:15 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 39886301185; Tue, 17 Nov 2026 16:24:14 +0100 (CET)
Date: Tue, 17 Nov 2026 16:24:14 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Mel Gorman <mgorman@techsingularity.net>
Cc: Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Seiji Nishikawa <snishika@redhat.com>,
	Mian Yousaf Kaukab <ykaukab@suse.de>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] sched/rt: Do not account migrate-disabled tasks as
 pushable
Message-ID: <20261117152414.GG1922751@noisy.programming.kicks-ass.net>
References: <20261113160655.2909479-1-mgorman@techsingularity.net>
 <20261117152026.GI1813469@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20261117152026.GI1813469@noisy.programming.kicks-ass.net>

On Tue, Nov 17, 2026 at 04:20:26PM +0100, Peter Zijlstra wrote:
> On Fri, Nov 13, 2026 at 04:06:55PM +0000, Mel Gorman wrote:
> 
> > As above, the runqueue is still marked overloaded by enqueue_task_rt()
> > and put_prev_task_rt() even if the task is migrate-disabled. A
> > migrate-disabled task reaches the pushable list through enqueue_task_rt()
> > or put_prev_task_rt() when it is preempted, or when it wakes while
> > still migrate-disabled. Either path calls enqueue_pushable_task() to set
> > rq->rt.overloaded and rto_mask if unset. Once set, every pull from another
> > CPU that fires an IPI may only find migrate-disabled tasks rendering the IPI
> > useless for a condition that was detectable when placed on the pushable list.
> > 
> > Stop adding migrate-disabled tasks to the pushable list if RT_PUSH_IPI is
> > enabled. This is not a heuristic as migrate-disabled tasks cannot move. Even
> > when migration is enabled, the rq still has no pushable candidates until the
> > task schedules. The !RT_PUSH_IPI behaviour is preserved and migrate-disabled
> > tasks are added to the pushable list. Without IPI, the alternative path in
> > pull_rt_task() must find runqueues with off-CPU migrate-disabled tasks. It
> > can then push the running task away allowing the migrate-disabled task
> > to run.
> 
> Last time I either didn't notice, or I've gone dumb from staring at perf
> issues all day, but I'm not entirely sure I understand how we get here.
> 
> Suppose:
> 
>   migrate_disable();
>   ...
>   schedule()
>     migrate_disable_switch()
>       // switches p->cpus_ptr and p->nr_cpus_allowed
>     pick_next_task()
>       p = class->pick_task();
>       put_prev_set_next_task(rq, rq->donor, p);
>       return p;
> 
> So any task that ends up in put_prev_task_rt() wlll have passed through
> migrate_disable_switch(), which have updated nr_cpus_allowed.
> 
> Or so my current thinking goes. You seeing this patch make a difference,
> seems to suggest I'm missing something, but I couldn't spot it in that
> wall of text.

Ah, is the sched_change pattern the clue? I'm thinking that RT might hit
that more than usual due to the PI path.

In that case we do indeed end up in put_prev_task() / set_next_task()
without going through schedule(). In that case the task would be on the
pushable list during the change, HOWEVER we should hold rq->lock (which
implies have IRQs disabled) over the entire thing, so again, I'm not
sure how this is then observable.

> Anyway, I'm still not sure why we can't just write:
> 
> > diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
> > index 1535046a23ff..bb640278d30e 100644
> > --- a/kernel/sched/rt.c
> > +++ b/kernel/sched/rt.c
> > @@ -396,6 +396,13 @@ static inline void rt_queue_pull_task(struct rq *rq)
> >  
> >  static void enqueue_pushable_task(struct rq *rq, struct task_struct *p)
> >  {
> > +	if (p->nr_cpus_allowed <= 1)
> > +		return;
> > +#ifdef HAVE_RT_PUSH_IPI
> > +	if (sched_feat(RT_PUSH_IPI) && is_migration_disabled(p))
> > +		return;
> > +#endif
> > + 
> 
> 	if (p->nr_cpus_allowed <= 1 || is_migration_disabled(p))
> 		return;
> 
> for both RT and DL. Sure, we might get an extra load, but is that really
> going to be noticable? Lots of scheduler code already looks at the
> migrate disable thing anyway.
> 
> I don't see why it should depend on RT_PUSH_IPI, it never is actually
> migratable, and so it never makes sense to have on the pushable list.
> 
> But perhaps I'm missing something; the above seems to suggest that is a
> theme today.
