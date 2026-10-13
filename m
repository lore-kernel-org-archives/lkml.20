Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7E13C5546
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791909937; cv=pass; b=iSesXyd3V9OOBzQlR+j8QxwMvtUvSR2YoSkbzan6bhMu5xnnKaevsSbgd47pxKrFrhxt4dm69EMCU0Alc2MJHub8w/lIQtg8xt2r0ZOHewKTLMUTsRudkVyhvFo71/T6xMFdLFEP/2OoKMRRDG4QlSjNtjhIkn+quE4SR+pHKXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791909937; c=relaxed/simple;
	bh=ErbdQXk/URTp1jQbqVBj9NDM7DJP7HNoYrbQowetnII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=im0qpIZuaCwwaZKZwmLuQt5BYgnGGTcn0cURU18ud801zu1wpF8dS5VkqOkP1/oDAl8xhTbMEv4OJTQ4N+OT0pngdN664AD70UxWEA2PGzK2mzOFpKqBpqrJc0lUAyQqKdMyyQmM+1Fxk/GyZ39mC1+pXxvgRvFz+XnRGCE05kM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jZHtYLEY; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jZHtYLEY"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6acbdbc1725so81094a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:45:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791909934; cv=none;
        d=google.com; s=arc-20260327;
        b=o7xbIzrjRRBV5RoUI5Lrm8QYhqd8fc4Dby729Wdsybo0EO0oJWqU4pojTrQo/Pq1OM
         30Rq7hm2uEXbRWPkAc/kaMkZRZbM7ygCpYg/GSr2CwDTDjT17AT5+CT5yEPs5VOAXNBk
         gLld9gmUbGPYUWV0wiijEUQ6sy8fJPC8BjFGs9SjhGCDGTWZFjUSSdiTz2F1QTcV4cr5
         cy0t9s4VGqdXvKPxy/XqnzJQ7oR/7nHLvwkAp+kEcAj4+EbR7VnNrwXfU69kZa8atPHY
         ST1x6er/X7mv6Tw+YPUKgqWsAgQr10LFJRdowO5bPYXqwcd0kxelpf9v+mplpxTL93eU
         k/jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uZ7BbSqar+Si41gKyxKH2K4JDwX7f9UUlWV78UL2QC4=;
        fh=kix7MivHMYjEhrK3jtEgl4wYD1Vyhe3z2HMPAUs4kXY=;
        b=CX+Fcu31nl/izvVHcnw6lxl4Xr9fCUvAd5AuelhkhCQ7zqJjERjWs4vs3p1+c9XzRx
         z9tpayLCw+XYdXZD62welFixpeJldGo4MTmy99jOhh2xzxeGdx9f+iFpFnO1ctKxd4t0
         5FAZMSkmgj87A4jfmr9Xi+pXQC39ONlty7P317355Q98EIp7jEBspWCwIQ+3GBNackpV
         gQdhO1GojmVtk0R43eUJiX6s2PMgkFZmVFiscIoBNK0Rvaa/13wpa3+6yNChJPQC/rWs
         eAc9WB42Ftvt2Z4bMUg3KfRNySnld1v1p3y+vurf7kNc0/2BZsnT/HgzRpZxqaZFlA4/
         4iyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791909934; x=1792514734; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uZ7BbSqar+Si41gKyxKH2K4JDwX7f9UUlWV78UL2QC4=;
        b=jZHtYLEYdOM2KYqB1H16vkoUg7vbiZQ+zzqXww9/kVe2JMdLoVKJKJNbTVhEaSxJgk
         liRS9gXxJ7/6dXZp22W/IdjuMkfc1tYMmpW/KeTHzr+ofD6AmRhV3lPQbBylhp/5o3Ft
         ZpThJuh/ZiIgtLySmBKduIqbXtM4MAvIKgRHD1QxN2Bfj3Lb95PmN9i3XFTInISofBEm
         GfO8QiDlMrRcwrY71yIuz68OEuBBaQDtqcrPZQKOejTiO9k3FC89EmxSmnxpvlDi+xO8
         lJny5Nhfs5yy0Y7Kn8uMx9vfmVh+AQkQAjo/O6qpsZjM8GYsUH5khhIOKw1C8buHL9CO
         giKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791909934; x=1792514734;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uZ7BbSqar+Si41gKyxKH2K4JDwX7f9UUlWV78UL2QC4=;
        b=uPNe+JFt8gQeN4T0An97JgIV4QU9BLbIbzYI5uMpj8lxQPoAsoiRogjISc0mGWOpBX
         XRhQX8K+9Xc4V84AX71JvYGn6QAbo6xzTzbZElhEWYGh3V0Qozn5Pm7Qs1D4dAnmXgWZ
         Gxf8vUZ/E+N+2q3Ajg6RXNSSYrJlceUd2n/I9UDOaTCJu/jjjQ7krCEEUsxE6gEyP9Jq
         iDP9RwqzxEWE2bsnmuXwPQsqcTBEUVNAPVIdJyP93FJzbwYcAD4vdZ5N0ohfwb3Ytr2b
         n3RX5lePxOShzPftH6W5K89pE7FRnh2P3j39AXAk+qikonfXbgOQJw6AtOd7myHdyh+k
         wSXA==
X-Forwarded-Encrypted: i=1; AKwUvByz2I/19v7zdgcq9pAjlVyDCQKjBR834CaKngIz3GYk8leZyfirtzFPUMZDBQb6LNpSTdh3EtoCC2OLTVg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaAXZNCeuq/Oh2uG9BJ9yDmuK4ki0Agkauk+a7xrpWtilYX8Bs
	q6/2StEnxPNM7iIy2+hdOyV3iSIZXhl+gd6sbVLF0Wlldu/dzu0Z879L4W0hYHrWED9K/CzFz7j
	jmYJL32V75JEIL9mRAsusAC5ZB8VULNf+mRUr6IhIcA==
X-Gm-Gg: AYBFou3SoOZmF2h9ghsjTNH/yG0sZUfc5RkAxUZzt7eiKFZUUQPGdOaR+WVZ18+a8HX
	K1yjsw04V43dFPm334CoGiVHibxHo0AmAVrPLc42gRVPN0ZzSvUv9uZtYaSyH2BN/Vl/Cg5gjYo
	LqnmEJF/wF8nhEuyj/XJHAV4ienAoGhmTQLmX0EMq3fUKSvk1bQQkua2bF7HBPtgOG1A7Nzsvg1
	VP9pAYFSwGGPx3LmNXjLQEscYj4f/IZndd3hHtYw0ml2HF396EtvoBDGQz03cKgToeh5g9gTKa1
	kffzOefnnU0NIB9buiRPss740Zs7WzLc4W0tXitfNX6WesL+yCfhuzVA2x6XqoDjIBQ7QFg2Rab
	7gIBgrUKJiQ8=
X-Received: by 2002:a05:6402:1ed3:b0:6ab:e30:c9dc with SMTP id
 4fb4d7f45d1cf-6b17c245c21mr10953241a12.7.1791909933828; Tue, 13 Oct 2026
 09:45:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <8fa7f795-518c-4507-b684-60b0c1cac2c5@paulmck-laptop> <20261013152455.9039-1-kprateek.nayak@amd.com>
In-Reply-To: <20261013152455.9039-1-kprateek.nayak@amd.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 13 Oct 2026 18:45:20 +0200
X-Gm-Features: AclHuK-h_r5Og6RT_H-nwSz34xt58MECD6s7B2WweT6gahM6nojOFPRqsN9n7tg
Message-ID: <CAKfTPtCMmKFOSud7Zo7kbANkPXgSYbk=3daQtLvAsJLGvuBa0w@mail.gmail.com>
Subject: Re: [PATCH] sched/core: Call wakeup_preempt() for queued tasks during
 class change
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Oct 2026 at 17:25, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
>
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
>                                       rq0->cfs.h_nr_queued--;
>                                       rq0->rt.rt_nr_running++;
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

Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>

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
>                 if (p->sched_class->switched_to)
>                         p->sched_class->switched_to(rq, p);
>
> +               /*
> +                * Check if the task can preempt the current in case the class
> +                * was upgraded. Note that none of the switch*_from() methods
> +                * know the new class and none of the switch*_to() methods know
> +                * the old class so we must resched here.
> +                */
> +               if (ctx->queued)
> +                       wakeup_preempt(rq, p, 0);
> +
>                 if (ctx->running) {
> -                       /*
> -                        * If this was a class promotion; let the old class
> -                        * know it got preempted. Note that none of the
> -                        * switch*_from() methods know the new class and none
> -                        * of the switch*_to() methods know the old class.
> -                        */
> -                       if (sched_class_above(p->sched_class, ctx->class)) {
> -                               rq->next_class->wakeup_preempt(rq, p, 0);
> -                               rq->next_class = p->sched_class;
> -                       }
>                         /*
>                          * If this was a degradation in class; make sure to
>                          * reschedule.
>
> base-commit: a0bb6fac53fa7cf1cadb487b43d4c9276a6b82e3
> --
> 2.34.1
>
