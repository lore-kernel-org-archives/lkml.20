Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158424B95BD
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887858; cv=none; b=G1HsCkoRw6W97hC/qIcYl1RPMAuqsGSoyfvh+5zLzwDJkB/ekZ2D10mdabYYKgmME4Uj2yD78Pc7T0zQiUFLU6ixOeFHC5M+jv/cWchHwgTNTHHYAXx9x6fxd+pBfQL2vubRdCn+hxfWAOBP2Ewdr8sfIsF1AqaumlJ0HbKXx+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887858; c=relaxed/simple;
	bh=3WF2U+UT5tZfI/DlYvfxHe3wt1BZwBq7flRsdfA0B1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lPHc8XeLwLGvmCxcezJdQ+1vfbOJY/I2u8ghjP4U40coiGy5AVt0SJ4X6DrL52jogEJ8BM8UGCSQb/V6Thn6snKGdS8r0wIX7F6Dczntury242MeJutRf2/0TTG4jvUlDSyQP/ejwKkfk/aOMen6z3R/5rk1UC+ex/rn8oDLie0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=cMkCbwMQ; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cMkCbwMQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ExV8t5ed40cnvabjUGdrsBUU0giWuWTlaruQ4YghT0s=; b=cMkCbwMQycvXjt0rriVzx++UNh
	G3MgROxAMfIQr8mPwXLuk7W0vubFdO0y/3sjLZCYtxEzAh5PDsxu2LlmJVxj4BcRMzSTky3cqCWJX
	DOei0OBBmRS/1eFDkE5ZuVbqoL/KuTaQb2LJl0V6WTC645PSip9Jm77a6RwnTv7ySExJSCqcaXmXy
	ZoOs8pzeqo2YDWHR21Y7Gy72yZbW5xYDHAn/kSVdxQogE+AaMlQ+TP5o6pYaVFA6sLL1jO4FUIdP9
	GBPRzd6M2RYpBRkESCNPmfjkyN+RCaS/pupPaLWF3v+OFUKgX0yhFYiTCSEwn/Eh3a9quv8s8I2pm
	iqLckXsw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZst-0000000CoUt-0dgU;
	Tue, 13 Oct 2026 10:37:27 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4CCB930015F; Tue, 13 Oct 2026 12:37:26 +0200 (CEST)
Date: Tue, 13 Oct 2026 12:37:26 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, paulmck@kernel.org,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [BUG] Apparent lost wakeups
Message-ID: <20261013103726.GY4121339@noisy.programming.kicks-ass.net>
References: <8fa7f795-518c-4507-b684-60b0c1cac2c5@paulmck-laptop>
 <b2dd8374-63d4-4b04-9e2c-f6a84728f092@amd.com>
 <69622916-cc8a-44d5-b776-6e25f79aceda@amd.com>
 <CAKfTPtDz35egMZEVz+wb5kytgVrv7APcVOYBkCByvzPSCH7Meg@mail.gmail.com>
 <20261013101452.GG2009045@noisy.programming.kicks-ass.net>
 <a5b8b01c-1020-4e0a-8d2c-a8f898036f5f@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5b8b01c-1020-4e0a-8d2c-a8f898036f5f@amd.com>

On Tue, Oct 13, 2026 at 03:59:36PM +0530, K Prateek Nayak wrote:

> Essentially:
> 
>   /* rq->next_class starts as fair_sched_class */
> 
>   pick_next_task()
>     /* Finishes ->pick_task() for stop, dl, rt */
>     pick_task_fair()
>       sched_balance_newidle()
>         raw_spin_rq_unlock()
>                                            activate_task(rq0, p) /* fair */ 
>                                              /* p->on_rq but not curr */
>                                              rq->next_class = fair_sched_class;
> 
>                                            __sched_setscheduler()
>                                              /* Upgrades p to FIFO */
>                                              sched_change_end()
>                                                /* Does not change rq->next_class */
>                                              rq_unlock()
> 
>         raw_spin_rq_lock()
> 
>         if (this_rq->cfs.h_nr_queued)
>           /* Skipped! No fair task */
> 
>         if (rq_modified_above(this_rq, &fair_sched_class))
>           /* Skipped: rq->nex_class is still fair */
> 
>         return 0;
>       return NULL; 
> 
>   pick_task_idle()
>     return rq->idle;
> 
>   /* In __schedule() */
>   clear_tsk_need_resched();
> 
>   /* Goes idle with rq->nr_running = 1 and no need_resched() */

Excellent Changelog material that ;-)

> 
> > Does something like so make sense?
> 
> Couple nits below.
> 
> > 
> > That is, any task on the rq cares about promotion, only the current
> > running task cares about demotion.
> > 
> > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > index 047fbe8ef298..2a8bf562a769 100644
> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -11261,7 +11261,7 @@ void sched_change_end(struct sched_change_ctx *ctx)
> >  		if (p->sched_class->switched_to)
> >  			p->sched_class->switched_to(rq, p);
> >  
> > -		if (ctx->running) {
> > +		if (ctx->queued) {
> 
> I think this branch should just call wakeup_preempt() to account
> for p->sched_class == rq->next_class in case p is upgraded to
> same class as rq->curr.

Yes, that'll do.

> >  			/*
> >  			 * If this was a class promotion; let the old class
> >  			 * know it got preempted. Note that none of the
> > @@ -11272,6 +11272,9 @@ void sched_change_end(struct sched_change_ctx *ctx)
> >  				rq->next_class->wakeup_preempt(rq, p, 0);
> >  				rq->next_class = p->sched_class;
> >  			}
> > +		}
> > +
> > +		if (ctx->running) {
> >  			/*
> >  			 * If this was a degradation in class; make sure to
> >  			 * reschedule.
> 
> This looks correct. Upgrade keeps the task running and degrade
> re-evaluates the selection.

Can you turn all this into a nice patch -- you've done all the hard work
on it anyway.

Thanks!
