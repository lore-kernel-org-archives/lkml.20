Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F083D5111B2
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791910392; cv=pass; b=m94oY7dY5Lpam09VU58toc3JT+e2e89DIswaB+uAzul3nKnSFcHnGuFfDtjBVj0DyBGFl7OXRCSRJ/NhLF+eaMQj40d3MdmPnq4XTH/7NoSjC2UX/DjE2eBO/kqQo5J73zrK8xcw77JDsSGa635UYZ3ijPl0ODl5aLgr4xS82XI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791910392; c=relaxed/simple;
	bh=JrJT9Fgnmvwrgo0CzZ/f/D0Ld7fALESGF4KCHoPjT5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S4epbOXNqcKm2Kc8qNMQ7yZbPvQC4S/QjrQygeSD5dGHbXI+Gev0l/UCaw5btyB8k1vuwBtnK/5bADmFCuLukTdt6FNUkSdYK3XmoAiQwQWSDxvZISvUqw2GsCbMwa/g+TyPWow1f7k/zQ9a2s/TiJsaXZwhZwi5U3141lUIE1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YeDYNpe7; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YeDYNpe7"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c169ae1cb26so941061466b.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:53:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791910389; cv=none;
        d=google.com; s=arc-20260327;
        b=GGByV7se5CRYsV0YBScssUPs79s8qBXM9pA+9t+iQRkVGnOy+FnOFpXWkbCw4KD1wO
         XvpBTGEKJAB97agO42hJ8g5fjerKj4//2a9zrWZnoOjA7l+sUmQSRh/crvRLQ937c2w7
         T6Xqi8EtQNlu0O1PTj8AStlN5w2o9ZVJLA/W913S45x1Jh6sTGx1s1+OMzLgI0doYckV
         gqJV68rf33nUxIyQV72iU+e0P32JmU2B4Mr1LiPdCGlVtLztfN6tZcUeuUQ/v+fuyu07
         C3I5aRfbCTE2h4uMrzipBzdpicbz6d1wzYp7qZ2+tlQd+sdqI0LA4haGEQY3AQpESsgF
         /U7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eKdFq7FTWoKcwpLBOZb0enqci1lvBsV6aNybCVS6wMQ=;
        fh=rD7rNwIigt+psvWwOG82jnqnLV5s4/MKGtCO/BFCN7g=;
        b=J6A3XeAfSnpWK49LKzDzCDss+MWW5BlfiL6laLIx1U2cjDJRBbT1qMfNknzmytua3R
         IqgdA1mBWFGbUIbQEAsJdnIkwCTCLt3kuPXRJc9Ao2obKOuB/WcWH0vbqv8kiE0qhEex
         t4MKhaBUBu9GQ49NnU4hggbm4ORL24CwnG87fN8JTmsTDBjX8PCRGahhEodL/kjuTcKV
         UxYboo25NXIONxgiKP7Zoq/EUTwuOYVe4mYLK3sRK0mfbzaCmlz+Ategv1YWIfy2+1kE
         bcqzmEDwPs2mICxSCDj0srdJLsfSptSpY9dBEuNsk3fEJact5Ao8DqKB3dK6KZMGQ6GH
         Cnjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791910389; x=1792515189; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eKdFq7FTWoKcwpLBOZb0enqci1lvBsV6aNybCVS6wMQ=;
        b=YeDYNpe7v3z3Ki2fIN0PsXwtIq7uAO5IvR6OIVHDktGc/fs78gCq+b4NXYBFfMk13i
         0nc06iQzHZY4lkK1f14poshO+pRJ5N7E9Z/MhX3SNWBDFYeHav28qshTfadYeoXuCBvl
         QyJvbkjwSIWWo9XUqMawTEasIp448vURtH/eyLHjKvTqfTDkXBIH5Msf1MgAmS5DcP0x
         3pJ1tFK1p8hRU8gosYfT9+54WhoDJRHSsISZ2Ol19Pimos9urGbUG4oZH65jpJrLXj0o
         mQ9e5a4D8G4b+I+Ck2cOQ6t7VeRVJIKp2CNqxD6kgo3mEeeJhS7SC/8GEF44hlBrDciP
         y5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791910389; x=1792515189;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eKdFq7FTWoKcwpLBOZb0enqci1lvBsV6aNybCVS6wMQ=;
        b=NNHIeAIKI8ZKtUIlW/oOn6xOMV2j9vcrP1EG2ZcJDXHmHPJF1t4XTviRBqlYDnEEWc
         91vhdz83NmQjZWBmRZl5cUXkhsMVeEpZQkDwuMGqANsseV/oNOnI6VVea2jOLbaMS8WH
         uak+qB4UwQw3YAtL6RsBIAjR09gNaGAvlCwcwxlDJSBUgDeSk7sRB7VtfR6+xemT+D2k
         jmUD5p7ZY54mysSejASHay9xNu0U/HozJNbPfI8+0ifU1lc5lNg+UOj66nUQfMwXI3cV
         yqd2vcczi/nLDwUrEk5iRp0P6Me3ZgH90H8vvcqEmBXkbZZEUAXm89bjSWqPWe+ICnyl
         YQMA==
X-Forwarded-Encrypted: i=1; AKwUvBw1jx4t78WbKdtO2VqywgU1GLEg0tcKLGFLRQG1FHrnhKiC+zZP2LANdZiynPoMnXcXm6XqqWKWUngajl0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcMdmauNFRXoIQ7AVSy95WtoK/hl6AUgzmp7EbGefLGiRLxSpG
	y3iMq2OFvnCU7r73JMBOrHDb/GsmcJjFQk63x+uf61g3A8o4/Xf4hiIuYp7ziDmt5zvHKmTaKSm
	faP0n2vRsnRvuFA3cMrwC5cNJwLeBG29bI1KjZdXv9w==
X-Gm-Gg: AYBFou2cQbYT9EdKTrnThtWLt4UyvLwrSe9DKZ/loJPjcYrCMSviTaBRatu8FZGrj16
	gP8ljOUeZ2jNzQxIUpDCOcNXsu/hTF5L3RKcEpIY3EcoJ6MugGec8xDkPvDVrHhXfgwzQubQ1j2
	iz4021xATj8UC4jyVoLVIBOOYFbdjXznEw+lSYk/4iCyuXNkiw73RmDAwwhUzpb7KqjGXc6FxkW
	DAAH4hHjTQnmRK//ahrdC7CS9BB3ti6FULSP5FRYmjJ8Ekut1vxxtN+eu7P3zsQvTKZCzr5s5fe
	xGopPXlrdrPNjpvEDGSr2OXIMnp3LMUQsmZbHcxUFUQpj9JyEAh6GBO5Fa3ZZq0tjB+k4YOIikm
	n3BpInF473GY=
X-Received: by 2002:a17:907:6d19:b0:c31:6a37:f281 with SMTP id
 a640c23a62f3a-c31a9a28baemr1333413366b.2.1791910389011; Tue, 13 Oct 2026
 09:53:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929084923.092062266@infradead.org> <20260929085319.981147568@infradead.org>
In-Reply-To: <20260929085319.981147568@infradead.org>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 13 Oct 2026 18:52:57 +0200
X-Gm-Features: AclHuK_j52oCqxWIVQLwZaDxmqeroBLI3b8LPJrkpHGdgnA4XLuXB4pbSKlQ3fU
Message-ID: <CAKfTPtCB3rb_LjQtem9USR=Fsk+uGnX6j40=uAdJ2ex=8BT5Gg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] sched: Rename/clarify sched_class::task_tick(.queued)
 argument
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@kernel.org, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, tj@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Sept 2026 at 10:55, Peter Zijlstra <peterz@infradead.org> wrote:
>
> For some reason the sched_class::task_tick() argument that indicates it being
> an hrtick, is called @queued. I'm sure naming is hard and all, but lets fix
> this.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>

> ---
>  kernel/sched/deadline.c |    4 ++--
>  kernel/sched/ext/ext.c  |    2 +-
>  kernel/sched/fair.c     |   12 ++++++------
>  kernel/sched/idle.c     |    2 +-
>  kernel/sched/rt.c       |    2 +-
>  kernel/sched/sched.h    |    2 +-
>  6 files changed, 12 insertions(+), 12 deletions(-)
>
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -2879,7 +2879,7 @@ static void put_prev_task_dl(struct rq *
>   * and everything must be accessed through the @rq and @curr passed in
>   * parameters.
>   */
> -static void task_tick_dl(struct rq *rq, struct task_struct *p, int queued)
> +static void task_tick_dl(struct rq *rq, struct task_struct *p, int hrtick)
>  {
>         update_curr_dl(rq);
>
> @@ -2889,7 +2889,7 @@ static void task_tick_dl(struct rq *rq,
>          * not being the leftmost task anymore. In that case NEED_RESCHED will
>          * be set and schedule() will start a new hrtick for the next task.
>          */
> -       if (hrtick_enabled_dl(rq) && queued && p->dl.runtime > 0 &&
> +       if (hrtick_enabled_dl(rq) && hrtick && p->dl.runtime > 0 &&
>             is_leftmost(&p->dl, &rq->dl))
>                 start_hrtick_dl(rq, &p->dl);
>  }
> --- a/kernel/sched/ext/ext.c
> +++ b/kernel/sched/ext/ext.c
> @@ -3809,7 +3809,7 @@ void scx_tick(struct rq *rq)
>         update_other_load_avgs(rq);
>  }
>
> -static void task_tick_scx(struct rq *rq, struct task_struct *curr, int queued)
> +static void task_tick_scx(struct rq *rq, struct task_struct *curr, int hrtick)
>  {
>         struct scx_sched *sch = scx_task_sched(curr);
>
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -6772,7 +6772,7 @@ static void put_prev_entity(struct cfs_r
>  }
>
>  static void
> -entity_tick(struct cfs_rq *cfs_rq, struct sched_entity *curr, int queued)
> +entity_tick(struct cfs_rq *cfs_rq, struct sched_entity *curr, int hrtick)
>  {
>         /*
>          * Update run-time statistics of the 'current'.
> @@ -6787,10 +6787,10 @@ entity_tick(struct cfs_rq *cfs_rq, struc
>
>  #ifdef CONFIG_SCHED_HRTICK
>         /*
> -        * queued ticks are scheduled to match the slice, so don't bother
> +        * hrticks are scheduled to match the slice, so don't bother
>          * validating it and just reschedule.
>          */
> -       if (queued) {
> +       if (hrtick) {
>                 resched_curr(rq_of(cfs_rq));
>                 return;
>         }
> @@ -15309,7 +15309,7 @@ static inline void task_tick_core(struct
>   * and everything must be accessed through the @rq and @curr passed in
>   * parameters.
>   */
> -static void task_tick_fair(struct rq *rq, struct task_struct *curr, int queued)
> +static void task_tick_fair(struct rq *rq, struct task_struct *curr, int hrtick)
>  {
>         struct sched_entity *se = &curr->se;
>
> @@ -15319,7 +15319,7 @@ static void task_tick_fair(struct rq *rq
>
>                 for_each_sched_entity(se) {
>                         cfs_rq = cfs_rq_of(se);
> -                       entity_tick(cfs_rq, se, queued);
> +                       entity_tick(cfs_rq, se, hrtick);
>
>                         weight = __calc_prop_weight(cfs_rq, se, weight);
>                 }
> @@ -15328,7 +15328,7 @@ static void task_tick_fair(struct rq *rq
>                 reweight_eevdf(cfs_rq, se, weight, se->on_rq);
>         }
>
> -       if (queued)
> +       if (hrtick)
>                 return;
>
>         if (static_branch_unlikely(&sched_numa_balancing))
> --- a/kernel/sched/idle.c
> +++ b/kernel/sched/idle.c
> @@ -538,7 +538,7 @@ dequeue_task_idle(struct rq *rq, struct
>   * and everything must be accessed through the @rq and @curr passed in
>   * parameters.
>   */
> -static void task_tick_idle(struct rq *rq, struct task_struct *curr, int queued)
> +static void task_tick_idle(struct rq *rq, struct task_struct *curr, int hrtick)
>  {
>         update_curr_idle(rq);
>  }
> --- a/kernel/sched/rt.c
> +++ b/kernel/sched/rt.c
> @@ -2541,7 +2541,7 @@ static inline void watchdog(struct rq *r
>   * and everything must be accessed through the @rq and @curr passed in
>   * parameters.
>   */
> -static void task_tick_rt(struct rq *rq, struct task_struct *p, int queued)
> +static void task_tick_rt(struct rq *rq, struct task_struct *p, int hrtick)
>  {
>         struct sched_rt_entity *rt_se = &p->rt;
>
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -2737,7 +2737,7 @@ struct sched_class {
>          * sched_tick: rq->lock
>          * sched_tick_remote: rq->lock
>          */
> -       void (*task_tick)(struct rq *rq, struct task_struct *p, int queued);
> +       void (*task_tick)(struct rq *rq, struct task_struct *p, int hrtick);
>         /*
>          * sched_cgroup_fork: p->pi_lock
>          */
>
>
