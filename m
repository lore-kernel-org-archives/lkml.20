Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A65E4F473F
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892733; cv=none; b=G0yHbZduoXIl7ckY33WuJfznz1//oC7Th4Bls411uoXtJ85WwyQtQj8sYvxw5LnAaKN+avg9U3nO7xCgnykV2zkMpzi1eSXRmJB5j1s0c0WWgn64izVP37OAgWob3Un3uAkuTTXnbJpO3X/hcvJw78qa82DLzKNVU1jwYKHHzSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892733; c=relaxed/simple;
	bh=JiwqtCwAXjxvj0dKgM9c12YG8BUS3q2+aQaGTLrH8NI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jc/+xRxNhkL3TxTxNrtODa5UMl2d7UXUi5Swm6R3J76JZFSuRn96nj4uPGhJBD4FfVRuEqhgrAmIRfVfy6vVM4jAgWWV07mz81UzPv5Ukw5JFeNXktmOUpAkjfjaZRmW1grGr5U4SLAbbpgtdyiXlFbOXVLi0GwFveEHayomQTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=cCq34+S5; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cCq34+S5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=w2p5TjQnwj4GCmzNiEuo175Ib9vffuoBwLbnadklpRI=; b=cCq34+S5WcPu0Mj/z6uVAFmas5
	Ptnd39encc73tbSM2hkfEI5CABi/It7dTvmdhNGwapAerOW4JjGH4klzByHkVVVqIlWfK4BzwPO9z
	fQpG8RoA9F4B2ywAYRA8B74ZbvFSQOloGBg1NMjsHKLK5iaFIavP187UGb/16K2PAa8ZOL6o2H6HT
	L7mk9MnwcOunPQXeZWc3NJhOpqPnGloakoXFw3AOkQaVvfnVwytrbdcVJlwDq02CP5AAn92/1H7dN
	TACMce4rqNoVrk3S+yn2TB9fDUNge/NgPMwyLFkNdCxE/SMbG/q7SmeGFfDdGUgVVAt7DlHBvUusZ
	A/wa+YTw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGb9Q-0000000FVUX-41MP;
	Tue, 13 Oct 2026 11:58:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D90ED3001C9; Tue, 13 Oct 2026 13:58:35 +0200 (CEST)
Date: Tue, 13 Oct 2026 13:58:35 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christian Loehle <christian.loehle@arm.com>
Cc: Kayra Cizmeci <kayracizmeci@gmail.com>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] sched/fair: remove dead code on enqueue_task_fair()
Message-ID: <20261013115835.GI2009045@noisy.programming.kicks-ass.net>
References: <20260911124256.GZ776954@noisy.programming.kicks-ass.net>
 <20260911160253.1249960-1-kayracizmeci@gmail.com>
 <fd3f9d83-cb5b-496b-b7c1-b40f31cf795e@arm.com>
 <20261012140225.GU2009045@noisy.programming.kicks-ass.net>
 <5661a8d7-1a83-4336-b238-589f598075cf@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5661a8d7-1a83-4336-b238-589f598075cf@arm.com>

On Mon, Oct 12, 2026 at 03:59:40PM +0100, Christian Loehle wrote:
> On 10/12/26 15:02, Peter Zijlstra wrote:

> > Anyway, this is different from the initial use-case, where a
> > sched_entity would get dequeue and re-enqueued while walking the cgroup
> > hierarchy, and thus had to appear like nothing happened in between.
> > 
> > In this case we're fine to advance time.
> > 
> > Anyway... the normal block/wakeup paths are >< close to also hitting
> > this in the case where balancing drops the rq->lock after dequeue. The
> > only reason ttwu can't tickle this is because it has that ->on_cpu
> > stuff. However, we cannot use that on the unthrottle path :/
> > 
> > Bah.
> > 
> > Does this work?
> > 
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 5c98d8dfce5d..0edd8bfb6363 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -8250,7 +8250,14 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
> >  	weight = enqueue_hierarchy(p, flags);
> >  	reweight_eevdf(cfs_rq, se, weight, false);
> >  	place_entity(cfs_rq, se, flags | ENQUEUE_QUEUED);
> > -	__enqueue_entity(cfs_rq, se);
> > +
> > +	/*
> > +	 * This can actually happen with CFS_BANDWIDTH, in that case a task
> > +	 * can get throttled, dequeued and then unthrottled, woken *before* it
> > +	 * schedules out and does put_prev_task().
> > +	 */
> > +	if (cfs_rq->curr != se)
> > +		__enqueue_entity(cfs_rq, se);
> >  
> >  	if (!rq_h_nr_queued && rq->cfs.h_nr_queued)
> >  		dl_server_start(&rq->fair_server);
> 
> Tested-by: Christian Loehle <christian.loehle@arm.com>
> for my reproducer, that being said, and indeed the failure is:
> throttle -> dequeue (not put_prev_task()'d yet) -> (from remote CPU) unthrottle -> enqueue()
> 
> The dequeue()->enqueue() also lets place_entity()
> 'double-account' the entity's (on dequeue() saved) lag, right?
> After dequeue:       curr == se, on_rq == 0 -> excl from average
> enqueue_hierarchy(): curr == se, on_rq == 1 -> incl again
> place_entity():      calculate placement assuming se is excl

I'm not entirely sure I follow. With the above fix there is still only
one place_entity(), which is after enqueue_hierarchy() and has
ENQUEUE_QUEUED on.

Here enqueue_hierarchy() adds the entity to h_nr_queued, and
ENQUEUE_QUEUED tells place_entity() exactly this, so it can adjust.
