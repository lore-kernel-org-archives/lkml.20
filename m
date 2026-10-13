Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E57543304D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886003; cv=none; b=EIncFw58K6PyCT8yX9k9TUOFzAKxq0pORMI7iGO/tW3C5sm1CaUfs41+i05qdnieML41GATIWC2bfoim/h4E3s2ycozKg6pt2nT5mo/JLxZWCvdPhRJCKkAJm5uNxIQ9TMrruGHGLE/MvMK/0rzN3q/i8vHKCGvDU2CAP8QXwkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886003; c=relaxed/simple;
	bh=LK2DlKLWrDUH3TtB4sBso1Zu1lyD7z1so32krq/3h7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jOre3d4ClEtrd0AsW2sySwSbdOauuAnkkHJBCabJuMTNAbcAC26zEV97z6YXIUAc9ois81ohC6GYgDlqjHvToSlo+qMYCvrwxP15jFsGq+9HFXTK68O5OZ8kPTvzFrjjDGh3MvucT+F1okvUvjinx3pSJ2ZxD538D0BHM0xTjZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BzVtgzTE; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BzVtgzTE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=U517rzMqXzGeNf4XSIIyy9pqmkFcR9gTeABPN5cp3eM=; b=BzVtgzTEGyyBYS/VoMMT9Q+Bqc
	bQNQoNupzPpCnb44qtojtqFy6AHQuB5S7hyD2cfUIRmBL7pPrkWLomDGk32rzL9HKNoh4rturCcrk
	52tgkaIFw7bdrHpVEsolI8nX8+UWCTGqjn0Qrr5CmomP9pU/SN+CxvURXOK7hWl4VMP2VHYmCNY6h
	9grgll2znp2c9uuDjyWVhKvutrXjHUIvOPnlQqOmY+mzHmwaTM4JJNNOW/OoJFui3vSqflNvXXfye
	Ep9xnU4aSOxypzSi3aNUmg+OixmjcrDwx++5diSqacLy6KJ6RQ7Eo9G0zMLQBSt6JoqUez4Zwqe3x
	Xrkkapqg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZOs-0000000ChEh-45w9;
	Tue, 13 Oct 2026 10:06:27 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A41373008E2; Tue, 13 Oct 2026 12:06:25 +0200 (CEST)
Date: Tue, 13 Oct 2026 12:06:25 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: paulmck@kernel.org, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [BUG] Apparent lost wakeups
Message-ID: <20261013100625.GF2009045@noisy.programming.kicks-ass.net>
References: <8fa7f795-518c-4507-b684-60b0c1cac2c5@paulmck-laptop>
 <b2dd8374-63d4-4b04-9e2c-f6a84728f092@amd.com>
 <69622916-cc8a-44d5-b776-6e25f79aceda@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69622916-cc8a-44d5-b776-6e25f79aceda@amd.com>

On Tue, Oct 13, 2026 at 12:16:11PM +0530, K Prateek Nayak wrote:
> On 10/13/2026 11:36 AM, K Prateek Nayak wrote:
> >> The following command reproduces the lost-wakeup problem, which shows
> >> up as RCU CPU stall warnings caused by rcu_torture_reader() kthreads:
> >>
> >> tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 20m --configs '19*TREE01' --bootargs "nohz=off rcutorture.onoff_interval=0 rcutorture.nocbs_nthreads=0 rcutorture.shuffle_interval=0" --trust-make
> > 
> > tl;dr
> > 
> > I could hit that WARN_ON() from your debug patch with the above test
> > even under rq_lock. Seemed like a missing resched_curr() but it
> > turned out to also be related to rq->next_class interaction.
> > 
> > I haven't been able to hit the warnings with the below diff. Could
> > you please try this:
> > 
> > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > index 0f63c30b4324..f2f8af3cdfb5 100644
> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -11239,6 +11245,11 @@ void sched_change_end(struct sched_change_ctx *ctx)
> >  		if (p->sched_class->switched_to)
> >  			p->sched_class->switched_to(rq, p);
> >  
> > +		if (ctx->queued && sched_class_above(p->sched_class, rq->next_class)) {
> > +			rq->next_class = p->sched_class;
> > +			resched_curr(rq);
> > +		}
> > +
> >  		if (ctx->running) {
> >  			/*
> >  			 * If this was a class promotion; let the old class
> > ---
> 
> And now that I've finally woken up just like that task, it can be
> simplified to:
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 0f63c30b4324..b37c771c41ad 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -11256,6 +11262,9 @@ void sched_change_end(struct sched_change_ctx *ctx)
>  			 */
>  			if (sched_class_above(ctx->class, p->sched_class))
>  				resched_curr(rq);
> +		} else if (ctx->queued) {
> +			/* Check if we need can preempt the current task. */
> +			wakeup_preempt(rq, p, 0);
>  		}
>  	} else {
>  		p->sched_class->prio_changed(rq, p, ctx->prio);
> ---
> 
> Peter, what do you think?

I am confused is what.

So a non-running, but queued task is changing class and then somehow its
not getting scheduled?

So I perhaps see why the whole if (ctx->running) thing might be too
strong; I mean if a queued task gets promoted from OTHER to FIFO, we
need a preemption, but that's not the case at hand, is it?

Somehow we're getting stuck in IDLE with runnable tasks on; and I'm just
not seeing how we get there.
