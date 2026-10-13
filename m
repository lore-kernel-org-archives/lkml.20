Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF9B5013AA
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914238; cv=none; b=ub4OhDOeyyiMIe4JJL4c6A6Vqn9EiiTquaXG1aDK+sx2FTnwLIuaExgzLacgCeyg5dKEBGgPhkIW8whRY+ySWAtVTaj23JqEJI1M84Ot+buF5n5dKy2ob5aOUhAN2bb1nvPOySg7KfD9FQc1q2gNKkFBwjiEBPClGmTrsMP3fQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914238; c=relaxed/simple;
	bh=7DjOAOpA/OHTjIkas945Lq+ixehwrNdHn2jO2g+g05U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JGNygYCGFKcMcUqML3IeDq3YLHSUAWxure1bSN3z0wSqJU09RT22jV116O4OlIJzl0/yzd6MyaSEmhGmsen+cHBL56hMLFHd2cBMt9zf/a7yV+cfR4uwvYn/xquYdwODjl4Z8hKbKr7iZNTqghPCwxSlPLxSDLgYoVIU+s+/DLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HHdHqQn3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HHdHqQn3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5297D1F000FF;
	Tue, 13 Oct 2026 17:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791914237;
	bh=rMtx2sSdmlV7v93+ccRWJm9C6mWNPghHQEbF2hns9Tg=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=HHdHqQn3VwRzTEX/b1Hn48EbmFaPWZUfOmRxMJm2cYFolfVL+Mf7mhhsKPREJfSuw
	 LuxIQU7shsFTysMB/a/MyY5E9xNgtZQUCz2OlDnmzpp6ETPUYav6HTXgq8MXnMSkuL
	 8Ltj6SgV8FswVepZs2qkdyFstXtOCa+S4vG8dqyS67g9GW6wcdXcbKDWCfFyeiwdw7
	 lmXs0suI2MMpxlR38f96x4RPxm2yRHr2zXR5yWuqqSoABcr8NFPEDfDttjFvjJ9IhK
	 Bgib5OFMgowQIlfRIwdOBjq4Eqax2bmAQJiJWFjnL6GngHQYyKCqtTUkuqrBc0B4Nf
	 Hkh/BMC8j4XdA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 1717CCE0877; Tue, 13 Oct 2026 10:57:17 -0700 (PDT)
Date: Tue, 13 Oct 2026 10:57:17 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] sched/core: Call wakeup_preempt() for queued tasks
 during class change
Message-ID: <786f52b9-adef-4246-b83c-fc0081bbabba@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <8fa7f795-518c-4507-b684-60b0c1cac2c5@paulmck-laptop>
 <20261013152455.9039-1-kprateek.nayak@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013152455.9039-1-kprateek.nayak@amd.com>

On Tue, Oct 13, 2026 at 03:24:55PM +0000, K Prateek Nayak wrote:
> Paul reported recent RCU changes exposed a lost resched where CPU idles
> with a rcutorture thread waiting while being completely runnable.
> 
> Dumping the rq state at the time of idling with runnable tasks showed
> the following:
> 
>   rq->next_class = &fair_sched_class
>   rq->nr_running = 1
>   rq->cfs.h_nr_queued = 0
>   rq->rt.rt_nr_running = 1
> 
> Although the waiting task was an RT task, "rq->next_class" did not point
> to rt_sched_class and was stuck at the lower priority fair_sched_class.

Thank you all very much!  I have started a short test.  If all goes well
with the short tests, I will run an overnight test.

I will of course let you know how the individual tests go.

							Thanx, Paul

> Inspecting sched_change_end() revealed the following race with
> __sched_setscheduler() for queued, but non-running tasks:
> 
>     CPU0                                   CPU1
>     ====                                   ====
> 
>   __schedule()
> 
>     /*
>      * rq->donor is a fair task that blocks.
>      * rq->next_class = &fair_sched_class
>      */
> 
>     rq_lock(rq0)
> 
>     pick_next_task()
>       /* nr_running = 0 */
>       pick_task_fair()
>         sched_balance_newidle()
>           raw_spin_rq_unlock(rq0)
>                                     rq_lock(rq0)
> 
>                                     activate_task(rq0, p)
>                                       /* p is a fair task */
>                                       rq0->nr_running++;
>                                       rq0->cfs.h_nr_queued++;
>                                       wakeup_preempt(rq, p)
>                                         rq->next_class = &fair_sched_class
>                                         resched_curr()
> 
>                                     rq_unlock(rq0)
> 
>                                     __sched_setscheduler(p)
>                                       /* p is moved to SCHED_RR */
>                                       task_rq_lock(p)
>                                       sched_change_begin()
> 
> 				      rq0->cfs.h_nr_queued--;
> 				      rq0->rt.rt_nr_running++;
> 
>                                       sched_change_end()
>                                         /*
>                                          * p->on_rq = 1 (ctx->queued)
>                                          * but p is not rq->donor
>                                          * (!ctx->running) hence
>                                          * resched_curr() is and
>                                          * rq->next_class upgrade is
>                                          * skipped.
>                                          */
> 
>                                        task_rq_unlock()
> 
>           raw_spin_rq_lock(rq0)
> 
>           /*
>            * rq->nr_running = 1
>            * rq->cfs.h_nr_queued = 0
>            * rq->rt.rt_nr_running = 1
>            * rq->next_class = &fair_sched_class
>            */
> 
>            if (rq->cfs.h_nr_queued && ...)
>              /* Above is false */
> 
>            if (rq_modified_above(this_rq, &fair_sched_class))
>              /* Also false since rq->next_class is still fair */
> 
>       /*
>        * sched_balance_newidle() is considered to
>        * have failed to pull any fair tasks and no
>        * other wakeups were detected.
>        */
>        return NULL; /* pick_task_fair() */
> 
>     pick_task_idle()
>       return rq->idle;
> 
>     next = rq->idle;
> 
>     /* Preemption indicators are lost */
>     clear_tsk_need_resched(prev);
>     clear_preempt_need_resched();
> 
>     rq->curr = rq->idle;
> 
>   !!! rq->idle switches in with rq->running == 1 but !need_resched() !!!
> 
> In simple words, enqueue, followed by a class change of the newly queued
> task goes unnoticed in rq->next_class indicator and
> sched_balance_newidle() sees no fair task, nor any higher priority task
> enqueued.
> 
> The above sequence will lead to CPU idling with a runnable task on the
> CPU.
> 
> Call wakeup_preempt() for ctx->queued cases in sched_change_end() to
> re-evaluate rq->next_class after class change (ENQUEUE_CLASS) and set
> the NEED_RESCHED indicator accordingly.
> 
> Newidle balance will correctly see an enqueue of a higher priority
> task if a queued task was upgraded when the rq_lock() was dropped and
> will retry the pick.
> 
> Reported-by: "Paul E. McKenney" <paulmck@kernel.org>
> Closes: https://lore.kernel.org/lkml/8fa7f795-518c-4507-b684-60b0c1cac2c5@paulmck-laptop/
> Fixes: 1e900f415c60 ("sched: Detect per-class runqueue changes")
> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
> ---
> Patches are based on tip:sched/urgent at commit a0bb6fac53fa
> ("sched/core: Account PSI IRQ time to the execution context, not the
> scheduling context").
> 
> Tested with sched-messaging and Paul's TREE01 reproducer.
> ---
>  kernel/sched/core.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 1fe40de6ebe3..1754d9f95f2c 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -11327,17 +11327,16 @@ void sched_change_end(struct sched_change_ctx *ctx)
>  		if (p->sched_class->switched_to)
>  			p->sched_class->switched_to(rq, p);
>  
> +		/*
> +		 * Check if the task can preempt the current in case the class
> +		 * was upgraded. Note that none of the switch*_from() methods
> +		 * know the new class and none of the switch*_to() methods know
> +		 * the old class so we must resched here.
> +		 */
> +		if (ctx->queued)
> +			wakeup_preempt(rq, p, 0);
> +
>  		if (ctx->running) {
> -			/*
> -			 * If this was a class promotion; let the old class
> -			 * know it got preempted. Note that none of the
> -			 * switch*_from() methods know the new class and none
> -			 * of the switch*_to() methods know the old class.
> -			 */
> -			if (sched_class_above(p->sched_class, ctx->class)) {
> -				rq->next_class->wakeup_preempt(rq, p, 0);
> -				rq->next_class = p->sched_class;
> -			}
>  			/*
>  			 * If this was a degradation in class; make sure to
>  			 * reschedule.
> 
> base-commit: a0bb6fac53fa7cf1cadb487b43d4c9276a6b82e3
> -- 
> 2.34.1
> 
