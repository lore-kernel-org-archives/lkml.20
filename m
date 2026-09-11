Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02877476077
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789130218; cv=pass; b=cNgfcRmxDmGz1KcS0NXvji96AnTAtL1PaMlQ+yeAECDT2U4M8Sf0WFt4wI5Me9Msmqarb+VcJ4AwkCbGT2seJPGtoKL1bPXalQo4Oz0SGdSBwb+jvQj3903GA8KEpdCMGUbm5pA60gsb1XKBTYwm7gI4Mxoyl+nHt3eTd6U6qYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789130218; c=relaxed/simple;
	bh=VQ0m7w1yc7zu7NpERy2/SDg/opAGtPn5aKuL56C9JMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=meu3BOvsygKYt2JvZgi7iC2tTDpuoZoKduSVRnSMggkpKBqxZc3r/ALcc1knBJbUtfgvbAIwR3MEQbm5lVOEUvL0HMXRn4QuKHpg5R4lsf9uz2ahVJjN7r2wbn1uZwaSmvPSIAVwBG02OiGT/5H6dwEHce+lgbYOS6i/EpF4TTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oego7n5z; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oego7n5z"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a7ea0046deso1289320a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:36:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789130213; cv=none;
        d=google.com; s=arc-20260327;
        b=OtAeZ4wNElGwCNBe2xVg1xIqPlbWWAxy7N+qtEP0cpUcbZkI5mYXTxUzZQfCAlG/0h
         9MV1rDKSwMHZVgFDt1eCDEhBRzYm7MTFLU3+JznT7b1enLsrksM9c8KGIm5iSX90gDtt
         yvdbWIEZelrpmPV080mrmxcCGEpTgYS/KYMwaSapBlznlDvoXA6RFtCbwYxjEvMyncYb
         ZuzplzbnXfU/yNeCWkMNULCTdNG4iw3JHXCONWGLi89kglb+AeVaXZ//AAkHyjME72VW
         ul6tOeaLehgy0ko+UmP7WMZyGBx+iqXEBnl32pFBFW9fCdcrlOZHR6qr3/07yb8E3ETu
         6HRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=U54thL2xoZVdHzqrXn0I3u9cfcRPx7B3BuThvwyk+mw=;
        fh=4PAEFiK2RseX+/B4Sh1TJ+sv1y3mpIXVeX+COsoTOdU=;
        b=rRGcbgXV8BIbnv++NOA24TWd0k+DBm3/syrSKhA3DKwarR9+2oGYhyJh1TjLLIsOvm
         j+FzOADKyN4u6r5XUksrxxCvaE6vwwfX0rbBTsFA4BJZCGUkpnssPq7qKaVKNktEMu/R
         3PpDCpNW2LoPlWVQe1CgkodCSbVKqfdJzWXn9Y2D63PSQKHUavxayDELeJG5tWO7TarH
         RijzyyUMCRw1Nt5EtRMqk94QWQQQU2PmaY5Mb0iskXqd+WGXhxhrGoAGCsELJjTvI5bM
         TEPyEDfyPd2bVZD6fBvwvO76TUT0Yjf5U0I2g0xPKrm2xRDwSDZCN+bzoINPUMYQ/GsA
         nY2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789130213; x=1789735013; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U54thL2xoZVdHzqrXn0I3u9cfcRPx7B3BuThvwyk+mw=;
        b=oego7n5zA6fKrgDautB0VS+a3qdEVYt2HvDJyReX2k/rbn17tx66IWD2G1qZvEzSLn
         yNHBiU9jIcFtVliwNhp2wrY5IwposWW0fwJT8ltTTbLoyutt55casJtqweXD5kGBfSxl
         GEX4NgACpEm/NsQaf6HhFIH9lnr6cqJCgTVH/89m/Yggry5NXIQ8brKp3XQ+mUbDP529
         4XTFOkDduKTiUh5d7iOwaIZU82JNkd3YE+M/R9kF0FTi0yA9q3vpCMJZExAMy6KEQwdU
         GV/7wQNpOzSIs/pXZBeLcQnvIcXNDPuJMTyBKv+wPfI+5ZMTwJgVrvHdBcutHTZjIcOM
         sSdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789130213; x=1789735013;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U54thL2xoZVdHzqrXn0I3u9cfcRPx7B3BuThvwyk+mw=;
        b=CIe72yH/+W++XzqP/1NAMmJI+YbpIWfOrbRgzN7kZp/U8a3/VFooeY0tp9+JuYLPbz
         R3CRpVARpINR71fbGxc7eBdwCiAprUdVkPexHOm3OkvQri5A/9BjEFBhHO9wyfd4dali
         /qJ5y3XxMitHUN14H+MUDS2WkcQW3jjTlf8md/KBSL6QeyD5yv1yRbkQwxA+ksGq0q4q
         StsTUvpApWLL+KrOKwlovYw8naO7i9LiJh04RLxoaxvkLPwgI98zP136m/thQgIMF1/d
         dSgs1+9dCKv011euT/nAuWX85B4QW+jtASAQgd9uaMg7uKl2ZN5+lI3wxqF6oE+++DN8
         puZw==
X-Forwarded-Encrypted: i=1; AKwUvByQb682IzJOs56Z0OiBF4urM2S4BEceDGk00Mq861oI+PuzoldMlcF/K/aENGnFEN/K1lT1sr9DPbA10vQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kCaw00m3E4PCfRd8KGqdJdDFSJen02GLblZy85fx3sufCvxKwA
	8QyS+XTZVUelv7gRUYseHZ8wtImdUYl2woqKLMn8gWWuxO0leJDLdY8wcqCNkSXBUrjDcjo2Kwn
	ePFhbMDn0q3+6Pm6GGk6YxBGAR3ExnW7vEPFCMf6+JA==
X-Gm-Gg: AYBFou36loHyDEEL3d9BjS9dwkBUHVz37flQs+GTfqYN2empkbI3Q9yH3V/TZYbfw9r
	pvSK3bPwXZRoYrHFIOFViWFrwl39mcPZMoJvZjlwnND+UhwZFm8MqOK19cnZfFOlLWmxKKnP9he
	Hkg8tYpX5ffeNCaJaL4vkJnxJmDPWhoEz8KNko0bck63r6c/I1/7o1yoIKZ4SdjFNfKcNFcejK8
	/jnj8fWnGCH6G2VhVJCShgavopT8BUGP50ROkWGXNbrhtkGejGkUm5Pr953eK95gwI+W//JH5Pu
	pFVxls771xWcOCFneqb87m7ErhCq2LBD6o2Dy3Ff2SoL57fhGkIGGrB4e3p4fQlc4ob43HXQIge
	zP1a6AWYvDqYOTEaJg5LQ+Hc=
X-Received: by 2002:a17:907:9805:b0:c25:8dff:f275 with SMTP id
 a640c23a62f3a-c296655cb18mr177822566b.5.1789130213358; Fri, 11 Sep 2026
 05:36:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813-sched-fair-hrtick-restart-v1-1-4230d1e18fbb@gentwo.org> <20260911112056.GY776954@noisy.programming.kicks-ass.net>
In-Reply-To: <20260911112056.GY776954@noisy.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 11 Sep 2026 14:36:41 +0200
X-Gm-Features: AcwNN1V52HTn59khvJLake6m3RHZkp7QQDGjx4IIU9SSzOGG7hjYxSrWXrX-aqc
Message-ID: <CAKfTPtD_aJeAh1biW6gKCLK6BnYcNtbz-FJvxUzZ1tD3V=43mw@mail.gmail.com>
Subject: Re: [PATCH] sched/fair: Restart hrtick after same-task repicks
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>, Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Shubhang Kaushik <shubhang@os.amperecomputing.com>, Christoph Lameter <cl@gentwo.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 11 Sept 2026 at 13:21, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Thu, Aug 13, 2026 at 02:23:48PM -0700, Shubhang Kaushik (Ampere) wrote:
> > Fair hrtick is implemented with a one-shot timer, so each precise
> > preemption point has to be programmed explicitly. The usual fair path
> > does this from set_next_task_fair(), which calls hrtick_start_fair().
> >
> > The missed path is:
> >
> >   hrtick
> >     -> task_tick_fair(..., queued=1)
> >        -> entity_tick()
> >         -> resched_curr()
> >     -> schedule()
> >        -> pick_task_fair() picks current again
> >        -> put_prev_set_next_task()
> >         -> next == prev
> >         -> return
> >
> > Since set_next_task_fair() is skipped, hrtick_start_fair() is not called
> > and no new fair hrtick is started.
>
> Indeed. However, you missed this is also true for DL.
>
> Does something like the below work for you?
>
> ---
>  kernel/sched/core.c      |  2 +-
>  kernel/sched/deadline.c  |  8 ++++++--
>  kernel/sched/ext/ext.c   |  5 ++++-
>  kernel/sched/fair.c      | 15 ++++++++++-----
>  kernel/sched/idle.c      |  5 ++++-
>  kernel/sched/rt.c        |  7 +++++--
>  kernel/sched/sched.h     | 16 ++++++++++++----
>  kernel/sched/stop_task.c |  5 ++++-
>  8 files changed, 46 insertions(+), 17 deletions(-)
>
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 91f059a55695..a39d12d38070 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -7241,7 +7241,7 @@ static void __sched notrace __schedule(int sched_mode)
>                          * on_cpu.
>                          */
>                         donor->sched_class->put_prev_task(rq, donor, donor);
> -                       donor->sched_class->set_next_task(rq, donor, true);
> +                       donor->sched_class->set_next_task(rq, donor, SNT_PICK);
>                 }
>         } else {
>                 rq_set_donor(rq, next);
> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index de6a361a87c7..21d904d92c64 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -2773,11 +2773,14 @@ static void start_hrtick_dl(struct rq *rq, struct sched_dl_entity *dl_se)
>   * DL keeps current in tree, because ->deadline is not typically changed while
>   * a task is runnable.
>   */
> -static void set_next_task_dl(struct rq *rq, struct task_struct *p, bool first)
> +static void set_next_task_dl(struct rq *rq, struct task_struct *p, enum snt_e type)
>  {
>         struct sched_dl_entity *dl_se = &p->dl;
>         struct dl_rq *dl_rq = &rq->dl;
>
> +       if (type == SNT_REPICK)
> +               goto repick;
> +
>         p->se.exec_start = rq_clock_task(rq);
>         if (on_dl_rq(&p->dl))
>                 update_stats_wait_end_dl(dl_rq, dl_se);
> @@ -2788,7 +2791,7 @@ static void set_next_task_dl(struct rq *rq, struct task_struct *p, bool first)
>         WARN_ON_ONCE(dl_rq->curr);
>         dl_rq->curr = dl_se;
>
> -       if (!first)
> +       if (type != SNT_PICK)
>                 return;
>
>         if (rq->donor->sched_class != &dl_sched_class)
> @@ -2796,6 +2799,7 @@ static void set_next_task_dl(struct rq *rq, struct task_struct *p, bool first)
>
>         deadline_queue_push_tasks(rq);
>
> +repick:
>         if (hrtick_enabled_dl(rq))
>                 start_hrtick_dl(rq, &p->dl);
>  }
> diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
> index 51de1d8b72a1..31a300f2d3b2 100644
> --- a/kernel/sched/ext/ext.c
> +++ b/kernel/sched/ext/ext.c
> @@ -3003,10 +3003,13 @@ static enum scx_dsp_verdict dispatch_one(struct rq *rq, struct task_struct *prev
>         return verdict;
>  }
>
> -static void set_next_task_scx(struct rq *rq, struct task_struct *p, bool first)
> +static void set_next_task_scx(struct rq *rq, struct task_struct *p, enum snt_e type)
>  {
>         struct scx_sched *sch = scx_task_sched(p);
>
> +       if (type == SNT_REPICK)
> +               return;
> +
>         if (p->scx.flags & SCX_TASK_QUEUED) {
>                 /*
>                  * Core-sched might decide to execute @p before it is
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 4d0b94465d19..f469e469b402 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -15242,14 +15242,18 @@ static void switched_to_fair(struct rq *rq, struct task_struct *p)
>         }
>  }
>
> -static void set_next_task_fair(struct rq *rq, struct task_struct *p, bool first)
> +static void set_next_task_fair(struct rq *rq, struct task_struct *p, enum snt_e type)
>  {
>         struct sched_entity *se = &p->se;
> -       bool throttled = false;
>         struct cfs_rq *cfs_rq = &rq->cfs;
>         unsigned long weight = NICE_0_LOAD;
> +       bool first = type == SNT_PICK;
> +       bool throttled = false;
>         bool on_rq = se->on_rq;
>
> +       if (type == SNT_REPICK)
> +               goto repick;
> +
>         clear_buddies(cfs_rq, se);
>
>         if (on_rq)
> @@ -15293,11 +15297,12 @@ static void set_next_task_fair(struct rq *rq, struct task_struct *p, bool first)
>
>         WARN_ON_ONCE(se->sched_delayed);
>
> -       if (hrtick_enabled_fair(rq))
> -               hrtick_start_fair(rq, p);
> -
>         update_misfit_status(p, rq);
>         sched_fair_update_stop_tick(rq, p);
> +
> +repick:
> +       if (hrtick_enabled_fair(rq))
> +               hrtick_start_fair(rq, p);

While at it, you might want to replace:
vdelta = se->deadline - se->vruntime;
by
vdelta = se->vprot - se->vruntime;
in hrtick_start_fair()

>  }
>
>  void init_cfs_rq(struct cfs_rq *cfs_rq)
> diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
> index eb73b65ce6c4..76f3c84ca684 100644
> --- a/kernel/sched/idle.c
> +++ b/kernel/sched/idle.c
> @@ -487,8 +487,11 @@ static void put_prev_task_idle(struct rq *rq, struct task_struct *prev, struct t
>         update_rq_avg_idle(rq);
>  }
>
> -static void set_next_task_idle(struct rq *rq, struct task_struct *next, bool first)
> +static void set_next_task_idle(struct rq *rq, struct task_struct *next, enum snt_e type)
>  {
> +       if (type == SNT_REPICK)
> +               return;
> +
>         update_idle_core(rq);
>         scx_update_idle(rq, true, true);
>         schedstat_inc(rq->sched_goidle);
> diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
> index 85303add726d..1535046a23ff 100644
> --- a/kernel/sched/rt.c
> +++ b/kernel/sched/rt.c
> @@ -1654,11 +1654,14 @@ static void wakeup_preempt_rt(struct rq *rq, struct task_struct *p, int flags)
>                 check_preempt_equal_prio(rq, p);
>  }
>
> -static inline void set_next_task_rt(struct rq *rq, struct task_struct *p, bool first)
> +static inline void set_next_task_rt(struct rq *rq, struct task_struct *p, enum snt_e type)
>  {
>         struct sched_rt_entity *rt_se = &p->rt;
>         struct rt_rq *rt_rq = &rq->rt;
>
> +       if (type == SNT_REPICK)
> +               return;
> +
>         p->se.exec_start = rq_clock_task(rq);
>         if (on_rt_rq(&p->rt))
>                 update_stats_wait_end_rt(rt_rq, rt_se);
> @@ -1666,7 +1669,7 @@ static inline void set_next_task_rt(struct rq *rq, struct task_struct *p, bool f
>         /* The running task is never eligible for pushing */
>         dequeue_pushable_task(rq, p);
>
> -       if (!first)
> +       if (type != SNT_PICK)
>                 return;
>
>         /*
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 6c3ad70e58b8..944366e2d142 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -2630,6 +2630,12 @@ struct affinity_context {
>
>  extern s64 update_curr_common(struct rq *rq);
>
> +enum snt_e {
> +       SNT_NORMAL,
> +       SNT_PICK,
> +       SNT_REPICK,
> +};
> +
>  struct sched_class {
>
>  #ifdef CONFIG_UCLAMP_TASK
> @@ -2687,7 +2693,7 @@ struct sched_class {
>          * __schedule: rq->lock
>          */
>         void (*put_prev_task)(struct rq *rq, struct task_struct *p, struct task_struct *next);
> -       void (*set_next_task)(struct rq *rq, struct task_struct *p, bool first);
> +       void (*set_next_task)(struct rq *rq, struct task_struct *p, enum snt_e type);
>
>         /*
>          * select_task_rq: p->pi_lock
> @@ -2790,7 +2796,7 @@ static inline void put_prev_task(struct rq *rq, struct task_struct *prev)
>
>  static inline void set_next_task(struct rq *rq, struct task_struct *next)
>  {
> -       next->sched_class->set_next_task(rq, next, false);
> +       next->sched_class->set_next_task(rq, next, SNT_NORMAL);
>  }
>
>  static inline void
> @@ -2811,11 +2817,13 @@ static inline void put_prev_set_next_task(struct rq *rq,
>
>         __put_prev_set_next_dl_server(rq, prev, next);
>
> -       if (next == prev)
> +       if (next == prev) {
> +               next->sched_class->set_next_task(rq, next, SNT_REPICK);
>                 return;
> +       }
>
>         prev->sched_class->put_prev_task(rq, prev, next);
> -       next->sched_class->set_next_task(rq, next, true);
> +       next->sched_class->set_next_task(rq, next, SNT_PICK);
>  }
>
>  /*
> diff --git a/kernel/sched/stop_task.c b/kernel/sched/stop_task.c
> index c909ca0d8c87..1e0109ec36b3 100644
> --- a/kernel/sched/stop_task.c
> +++ b/kernel/sched/stop_task.c
> @@ -27,8 +27,11 @@ wakeup_preempt_stop(struct rq *rq, struct task_struct *p, int flags)
>         /* we're never preempted */
>  }
>
> -static void set_next_task_stop(struct rq *rq, struct task_struct *stop, bool first)
> +static void set_next_task_stop(struct rq *rq, struct task_struct *stop, enum snt_e type)
>  {
> +       if (type == SNT_REPICK)
> +               return;
> +
>         stop->se.exec_start = rq_clock_task(rq);
>  }
>
