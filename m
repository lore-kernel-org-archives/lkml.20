Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99274F4024
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791975558; cv=none; b=HAa0EfLhrmT9k3XBfJof8ZztTtpcmlkt03kmUmkCjh4g8324xS6yEc/FfWk4yHkn7EfU43yWOVb5fvSDhvQvaCPufZfeM1dtDLHE037ciPFcdPvAURTJxFjBzhj/ycFnifPNsW64vmSgftmKZiu2G7atlRAr3A/87xxzdXHKV5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791975558; c=relaxed/simple;
	bh=QhMbap5+ZpHUhjScg9Gm1HgrZbg/UFZ+K5RzqbsV6Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dWwpyI80ysXHLP6NZZuJZm5qHrVAkfm1aTd/HMfBR7I6UsPYiiwZShfW+Ydpub0E0tnOQgSkowgiAvtXOFD5neXLuiCq+RqIVmeJfVyzbuxYkNgbzSr4agVT/Fyvr9qkqtZKpsPISMG9PnDGHSPkqAqPQFIXW3d8EC4nkInRDPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EMVFfuJz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EMVFfuJz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791975555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mOLlp/ZrpnArBAnQIiyLuMNq8Q1yVdA+bhnGWdgiJ4E=;
	b=EMVFfuJzgMXa9UkcabEdBxqOyCoK5DoVMyE5GkqflKugj9S6MPYhDHe2RtBMOzCJ7cG/XU
	cWVD7rP7YucYKD6cgKs0lOXclux2K4EMh7Q5FW95+LY2bdlMv9FVKS9kUQjJnHD50KAhVR
	p0kROQicT38RgOiBvJjtasNA3L9K8sM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-588-CFhV3TTSPne-WzFvwHJuJA-1; Wed,
 14 Oct 2026 10:59:12 +0000
X-MC-Unique: CFhV3TTSPne-WzFvwHJuJA-1
X-Mimecast-MFC-AGG-ID: CFhV3TTSPne-WzFvwHJuJA_1791975550
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9D0A61956065;
	Wed, 14 Oct 2026 10:59:09 +0000 (UTC)
Received: from pauld.westford.csb (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2047A1800480;
	Wed, 14 Oct 2026 10:59:07 +0000 (UTC)
Date: Wed, 14 Oct 2026 06:59:04 -0400
From: Phil Auld <pauld@redhat.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
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
Message-ID: <20261014105904.GA699535@pauld.westford.csb>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Hi Prateek,

On Tue, Oct 13, 2026 at 03:24:55PM +0000 K Prateek Nayak wrote:
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
> 
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

Nice. That rq lock dropping in schedule() has been the cause of quite a
handful of "interesting" outcomes hasn't it?  :) 

I think this makes the code cleaner too.

Reviewed-by: Phil Auld <pauld@redhat.com>


Cheers,
Phil

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
> 

-- 

