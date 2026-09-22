Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24FD549371
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790086823; cv=pass; b=bIFBhJ0LSdEb4rK1Cxvx4JsFPQ6v6i8jyiqZ5bCMz8azTtXCljWCrR0Td/BLyB/1kKBSZU18d/bhQr+mH0KRyx2U1RT21jXMAYCphBA773k8ETFhXU2msji81t9bG+tiI1KBwOJVRMcYrWZmY6A9Y+9h4GsCiVXefCUJSImXhR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790086823; c=relaxed/simple;
	bh=hLnrFJ609XBTNAu5yP38SA3J7nDRImGnShm+vqxAFmI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qAu6dierGOsoDhO3hI5xzLKS/vV7G6Cz4e3dS4noQoeh/TXi4DrnBXoEeHKgUo4uxgA6W/J/dykVpO9pHM/gIAFcRaYX/7uxeg8jqCIubAfNeBV4CciDdbl8zgMkdQqu5ZaBEJGkQN0RZQRzas4ysjPFMMQknjksNL1U0BK+iQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MqSD20AD; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MqSD20AD"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a8b9acbc6so198507966b.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:20:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790086818; cv=none;
        d=google.com; s=arc-20260327;
        b=UfnQAWuiiDD23nrA6LPvx+EGs//WNrjW6HTJyuHr0Fr+T1k1Nx1W9rLLt1NaFz548X
         3lOSdubjt7BwnKlG1dvz7zYE7bHrEbHLRTAzGJ6SFPHMG0aXjcKF5OLB42OsAdq9bH6E
         IrV/k96YF6Yp78n4hEgBEdzaGK7DmWKXPPymFGU1+qqcU0VnRxe+1pGtP2rxfUpu2w0T
         kME4krVvQbnFtJROmJBV8M4B9QlN7Ds7s+ko72243gIkdZtfG+NhwW67Dia0y2icndjm
         vN9O44ob7XgBVVTN0sNwyPb7y7Wj7AqPGXThiFo/lWJ3aOSaN2DU33DEcrwVy9u+iRyd
         VAbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ms62SaJvBWwXGR/oTTe/7spnWkylzpXEejYtbO9epm0=;
        fh=jpeIN7jq8Liv6uQ7+Q3ocoez+CCgbMLGiQ60GjZiIGI=;
        b=SJS6+WZXoOIu2GYMxcMCApt8HgdHH66d5dZSpZ/kBGd5AC+HSjQV4EMe9KIfA4gbjW
         xsYg81MA+EZHA90DtMuD/Jov/2Nk0pBXuRhRFSNjKPdGCnNGAKU+3/u430cxG40voOq9
         OwimUkwkEP39CETXlAGS3LT6oEzXniTD0CT9COzTqe7JbfjKXVoPF5FZTzYA7YLpDcdK
         KspBMZVkSt1JSUp1phFJBqGtmdc9KQ7I8GRb44oeFkjk6RZnkEMhJfIZTp+mthoK2lsD
         Wcr/WeoNvS0XXsJNRZ0Oygkhh/e6lj1dbAfI45RYolFnpCi1qstoaN45s/+mHdBctlEK
         8W6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790086818; x=1790691618; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ms62SaJvBWwXGR/oTTe/7spnWkylzpXEejYtbO9epm0=;
        b=MqSD20AD1mMRjK/HmcY3/LQ82oH1MSHZQXJpDG4rQcQtvwYFBr74ElTGIknO7ZWew+
         QwxkRmpp8eXCKgy1Jw/DFkOh8iZmBWbqnCSEtSWAOFRaVtQrbeTdvrjm1LVDOU/WOPBj
         vsjGLUZhTP7yTURuElPX4luH1f2A64HIR1fpJDdMFDR2/Q/xseHAFExjOGDPljisqqt1
         l3joRy+fIQvUUFhyPackIPTUeWpTvwFeXXGM6+6mv2ivg22b0Kb0s5RLuY7wQVLjfiMd
         trRhWY31XHH9OhPHhqiy1Riv3yh189Aml7aDIUvwaD95KViog3NY1mQZL1DGfilBmsqA
         quRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790086818; x=1790691618;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ms62SaJvBWwXGR/oTTe/7spnWkylzpXEejYtbO9epm0=;
        b=hyC+/Rn3sfY8rT3EsJ4JYRvyk5gjXp1whfRt7NFiaQTlxQlnpEzPxKfMMN75ssjgoJ
         D0xS+yk9IuwGzhKIPe7dTGueR6w+/kUoWa8WanI1JVIyRaUWioapTJW0nVdyKeqNvGmL
         AzdvqgWZ3stIfQP43uCn+Sxgi23x45eir8FEmq7MPelnqIgn/6qAev6AN8pJ4u5R2PLa
         huLeouuHwkm+fkAvB9CPZ9BbsLkLuGIhKNXmk64kEPI/ZqDn6fZIPAK8ynjZLVPbiWks
         5FKOOWaOiKnZ3YmMDadpMqi0h6H5d0m5A7X64+86XIEHYIkh/ekna/3leQYSG9GfQ+Dm
         jdvw==
X-Forwarded-Encrypted: i=1; AKwUvBziaHx2or7JK6JJmSESWbZN12hFFWnC4RLzYIPJQL7DihpYM1MuBcf0rgq6TopunB//LkYo+XYNS5WTbUE=@vger.kernel.org
X-Gm-Message-State: AFuF++mIgxYMSXrVMLSOru23pmzoTHPndmUw6kC2neCzDIVLVKxBd194
	PGYZXkzVjevtieNRIyE96Nj7xr1z89WklyzeEeOxQ2BvFkFNckJ3TH0bzRk7VKY/p6JsT1HGdQ+
	9po+Rv4RzUfcSJ9AtdyxeAzDziuNHVHxI+dtI2OHelQ==
X-Gm-Gg: AYBFou1fkUFbht8eS5WhLW28fzohvldrQyGvOp0ECogAcMz9RKOZQQAbZk80vUe1vql
	ZJ7gySNNqWygBSBl0ofOqwGw+enN+cHbfhFbpeA45wQBpuSUsMiVTdAWzCLzPj7yuFJQuC7z0il
	oB9KrYD5Mk6yY1v2GOf2sMY9gQ4ihFjTuNTSA65UgIFMt+9OdRb/AqVJdebKMZYcfskOyyh182a
	Acqei5ec/aWEjzMSYo+lROIro8eDdCejKRCrgFWwXCH8D57bUokjmxd0dzZuSx2RMNVew1LGarS
	4Xu1fLBo/Sb1kzi3wYPDDuI1J+uZcReleyoC45d9F+IZ2H2JdBmJGthPtc4fx/R0gZe4iCmbAbR
	h1LgrPE5IEJ4OTA==
X-Received: by 2002:a17:906:6a28:b0:c29:f742:c532 with SMTP id
 a640c23a62f3a-c2a15888d0amr1202079566b.40.1790086817621; Tue, 22 Sep 2026
 07:20:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921152238.3804392-1-vincent.guittot@linaro.org>
 <20260921152238.3804392-6-vincent.guittot@linaro.org> <20260922101304.GQ776954@noisy.programming.kicks-ass.net>
In-Reply-To: <20260922101304.GQ776954@noisy.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 22 Sep 2026 16:20:04 +0200
X-Gm-Features: AcwNN1VT4r1McCtEYQcQ5EG4SvpDy2OiR_uOWe76jHwp7mh4w4LJSs5s2hNHByI
Message-ID: <CAKfTPtAFFgHHJU=HtnMu0=gzX2qoKGX8Buz5Z186nFpUW8VSCg@mail.gmail.com>
Subject: Re: [PATCH 5/8] sched/eevdf: Reset lag when waking up on idle cpu
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, qyousef@layalina.io
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sept 2026 at 12:19, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Mon, Sep 21, 2026 at 05:22:35PM +0200, Vincent Guittot wrote:
> > When several tasks wake up simultaneously on an idle CPU, their final vlag
> > will depend of the ordering as the first one will lose its lag but not
> > the next ones.
> > Reset the lag when the enqueue happens while no fair task has already been
> > picked et set as the running task.
> >
> > As a typical example:
> > CPU0 is idle
> > TA with vlag 0ms and TB with vlag 5ms wake up on CPU0 simultaneously.
> > Depending which grab the lock 1st the behavior will be different:
> > If TA is enqueued 1st, TB will be enqueued with a positive lag and will
> > be picked 1st.
> > But if TB is enqueued 1st, it will loose its positive vlag and both TA and
> > TB will have 0 vlag when fair will pick a task.
> >
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >  kernel/sched/fair.c | 27 +++++++++++++++++----------
> >  1 file changed, 17 insertions(+), 10 deletions(-)
> >
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 4230954d10d0..739a3af60520 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -900,7 +900,7 @@ static __always_inline
> >  void decay_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
> >  {
> >       s64 vlag = se->vlag;
> > -     s64 delta_exec;
> > +     struct rq *rq;
> >
> >       WARN_ON_ONCE(se->on_rq);
> >
> > @@ -908,18 +908,25 @@ void decay_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
> >       if (vlag <= 0)
> >               return;
> >
> > -     if (flags & ENQUEUE_MIGRATED)
> > -             return;
> > +     rq = rq_of(cfs_rq);
> >
> > -     /* Compute the sleep time */
> > -     delta_exec = rq_clock_task(rq_of(cfs_rq)) - se->exec_start;
> > -     if (unlikely(delta_exec <= 0))
> > -             return;
> > +     if (rq->curr == rq->idle) {
> > +             /* You can't claim any lag when waking on idle CPU */
> > +             vlag = 0;
>
> Right. As I mentioned during OSPM, one of the crazy ideas I had was to
> do something like the below. All of the lag stuff only makes sense while
> there is contention.
>
> Now, I've not actually tried this -- and at the very least the migation
> case is broken. But it should very much capture the rq->curr == rq->idle
> case and then some.

Yes, I remember the discussion. This one really care about severals
tasks wake up simultaneously on an idle CPU but what we do with their
lags depend on the enqueue order before trying to pick one

I'm going to try your suggestion below and see how I can get it
working with migration too

>
>
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index dac15ec36d1e..70fe8fadafac 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -592,6 +592,7 @@ struct sched_entity {
>         u64                             vruntime;
>         /* Approximated virtual lag: */
>         s64                             vlag;
> +       u32                             vlag_seq;
>         /* 'Protected' deadline, to give out minimum quantums: */
>         u64                             vprot;
>         u64                             slice;
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 2ad46fb2eafe..3e3dde5f2117 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -898,6 +898,7 @@ bool update_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se)
>                         vlag = min(vlag, 0);
>         }
>         se->vlag = vlag;
> +       se->vlag_seq = cfs_rq->idle_seq;
>
>         return avruntime - vlag != se->vruntime;
>  }
> @@ -6397,6 +6398,9 @@ place_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
>         if (flags & ENQUEUE_QUEUED)
>                 nr_queued -= 1;
>
> +       if (se->vlag_seq != cfs_rq->idle_seq)
> +               se->vlag = 0;
> +
>         /*
>          * Due to how V is constructed as the weighted average of entities,
>          * adding tasks with positive lag, or removing tasks with negative lag
> @@ -8374,6 +8378,9 @@ static bool __dequeue_task(struct rq *rq, struct task_struct *p, int flags)
>
>         dequeue_hierarchy(p, flags);
>
> +       if (!cfs_rq->h_nr_queued)
> +               cfs_rq->idle_seq++;
> +
>         if (sched_feat(PLACE_REL_DEADLINE) && !task_sleep) {
>                 se->deadline -= se->vruntime;
>                 se->rel_deadline = 1;
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 6c3ad70e58b8..0f0edb77e235 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -689,6 +689,7 @@ struct cfs_rq {
>         u64                     sum_weight;
>         u64                     zero_vruntime;
>         unsigned int            sum_shift;
> +       u32                     idle_seq;
>
>  #ifdef CONFIG_SCHED_CORE
>         unsigned int            forceidle_seq;
