Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794238484;
	b=LvWneyZFPaH0rBp9FJ0QJbFdMC7wkfUZDz+RaeNoafV6K5Pjriwi1iPS/PMT/UzVSpme
	 LEo91zRvlAsODd7mUEaYB3QBbViCskM8w/Jtt+vOJ9OdN/JgL3dEX3wxviUwa00k80wmM
	 9ykKJk4qJP9VPvbHQ5IQWCQWD1YSyoKJ/FlkENaq453xXMFbkvrXolWY4CrEfdWoXKksL
	 yAGYOWxCm/Rl/Gzqaxz2O4fVMG5v8MBZQ0+q0AbsdQCzU2fUXeKnGnIDFi2OZc39mVUAX
	 PlAKJDbH082WI6cDqXFrcyIkOUYV2z+5/knhUx1k8CzzTPuVjUzOj6b2+fgA64l8K9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=tZb/JlzaDfnhk48XsH57Tsc9HiRXe4mXenMyxxS+EE8=;
	b=WLOh/RFfA0wr4cAKdLM6hLApT1XNyvRuCQQxooumRy+p4h0pIfyHu/1r680RQXuEh0Lp
	 EO/E7PaD5RBR+Sd8ZPhMdWZaVeZRRqHuN7n5UtPQO4wk88EZ+0++o/eKILDSGYfe20SKy
	 UyIrqOGHj3PJ1DVaD4FshyiqqQamxYcUgNdgEuGa1g9U0xqBllK2zaK8NtOFdctsm1Aul
	 IJ67709qP9LrBvO+FLfUNfxsZoUEfv91NGl0KdYFZQ964fQ2rkuYuAsXQXWw1vE2q+7DC
	 nwhjIM065FodVQsNG9EAqijrYLSoYz59fUQKQklJfO4R44ePdP+QqA5hPBYOVeFYrLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xHEbewjz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD7F606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BD7F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xHEbewjz
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so140976566b.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:34:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794238483; cv=none;
        d=google.com; s=arc-20260327;
        b=M5sEOosKqcrEny06ycD3/vEtNnKvOnCFPBoepeCpQFOAd+JklwvLSUMbiehjbtB0jD
         lja6gN3H/DqEKfL2y/0SlmD6MfLZavRYMJGLaN1qCL6tqA8tbO8w1tOKliOiLk00Peaw
         2jr3Oq+5yr/0MkF88q6ruPnuQfl+FM9jL+nYcDPB0xSfRikwfB8eLvmhkSeKp3BHRGT7
         27q3zpUv+zZQwQDO7IEv4sSFaxN0i/dasytjY037x1AydinmaPhuSDwkT3MTu6pOgqu7
         zQ4KeviY6Q6/TetW7XO+weYTY8Ev0vG377q8/ANxk+DGVSdpYUDJ7r6pD0bvkEUX/goC
         y95A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tZb/JlzaDfnhk48XsH57Tsc9HiRXe4mXenMyxxS+EE8=;
        fh=kUMZ7MlzWmIngdwVkVuSdax4rCHOeN4GPSNCoqT+/es=;
        b=aRK6pOPXZf6Owv2KoR+jPiR4U8KY30hOZxLG0UbLYFixU5ymCUpu/92B1F/ucX/4f4
         sJb+Ygwn22O/WChF1SIT5U3QVfP2F1aQZeu8e6tbY0BgB6gc81cKJIG10a9Ne60fCIQ0
         a7MfSzbfqaqgGJ+Az7gN8a3NfKItQMmMW6NIzQ+VV8MSJ/fH7136Ap4tLQmYM8B+qkdE
         bBUqwjFnTnU/LA72DzaUMD2V61bAN0amE6RYc5yeYrd6KzspZcpm5Y6oxGf0RXi6QKDc
         5GLDZExoN6ocx626YwgIoIfHVIaxIgHMmHr8dZy0F/eu3Cfo0axTJPXC9GN6+v1FJqTZ
         CD0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794238483; x=1794843283; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tZb/JlzaDfnhk48XsH57Tsc9HiRXe4mXenMyxxS+EE8=;
        b=xHEbewjzycILTidDukHvtOhGBmVf//ioViiMKotptHw3BVJgUcoP+CMJrKmkHx6eA5
         HfP6EBDTe5FclHi4weXdaycv9kqwIbl69t/oSTC3/mMLJaOmShktiCAMZkeipisNawha
         bwR0OnPQs8bG3lTBu0JQvkE2PCttOPjif3z34x1tkUAubjBStq9+zd8uV6c3sXgqG66K
         iZYogm/dgSSmv8Z/zaWcLkLzONS9/v71tSx2y5IKoLGxmWjWjFsq4OckUs6QnnBHY5HN
         jpwybQLXMghbmTqeZ+/6mj25gu7GkCuKl2Tb58YZkwrTI8XtDWFBakiK2wexfqtRgFQw
         +3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238483; x=1794843283;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tZb/JlzaDfnhk48XsH57Tsc9HiRXe4mXenMyxxS+EE8=;
        b=IoTi6HR03BSVQ6rP8CwrVYiXiViGMy8s87SPxO/yY/lTs7w92p4vbGGpNrdHRfivr6
         FQePTKbPt4f6yZRpDM3jgyYgTwXwfUJQZ37+69eh5eBOcMuPBMwy/nTDu6YJWRtNQ0iP
         ZFt3OdGwB26eeesqQ2+W7IHMeFEG1UGniv262bKqv+RRbHKl1yZ1nSYn1sfT0P0yWVJw
         yi0UsltaJOHEcYRGWdcIQZYNm6yeAxOGKUBJx2zGZJguujExPJIDVlb3STq5aYMrOJaV
         ZSIMbh/yKqv37o7MiK/7WR+UCsIBwTkdJmes6mkxG89bXzgJFyP+WkmpI3as35zv4+VE
         /0Sw==
X-Forwarded-Encrypted: i=1; AL+hErEnBEAQbr/9xVTwTZ8dUKSVSyAcvPO1C2Ethxp2kDtHaYaDVzASAODtqRWR8PEASKkuk9MEpuHdp3Y2vQA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+G+XDHDg9GXB6B1pcnh1ldiRgJ2Sfjhqw9otw1PfqaDdJBcWfz
	lzkAjUVuZjYmhzmoGhSMovw1cVYjER9mC8LEeWaVMCCR/nLK/matNptrRzQ0lRlHdKa/h9oRxgr
	aqkfudose+xzDkB4VDjU25uFD0lp3vVj/IuOPEs8q6g==
X-Gm-Gg: AYBFou02slPhBm33fDNhrOVbNte2lxEhcrscc4HkQNJXrzK/jE2unoG/pTK+wlC9HIC
	43MdCJX5dK430Ybtr4bD4eFQCwSjqsTLXxgBH8siOtIZlodOpMJSV+sWXpvVRj+9PEZ5+MzVH7p
	23c4wqbeJuB5BtGQVS4G0mfklZAtn08hptbFWLRYuvSHZeyZ2iLPKqJI+4Pf7a7PYH1EBbjx4xi
	2djonDatZAoypzmDN1mUD44DpKWfb0cMvErYUm/25ZjCwx2nqdD9edEYRK1PP8z2PDHzw/LMY4u
	gPOxUsHaFjNU4uLi32JIjADjmzq7EalnEibvoxNiZK7TaByz0aeu2PHFUPUS+AXzKf9i05gxYxD
	7hBt1oZWK/5RgI63wDDZuZZNTIIkpPDgRzqRH9Q7q2aEWcxx0MoxFR2iQVRoXgPfy4CYracwktS
	q/z2ESAOr9tSMm7hU=
X-Received: by 2002:a17:907:c06:b0:c49:d1c5:431a with SMTP id
 a640c23a62f3a-c4d6dd7ce91mr380002966b.38.1794238482427; Mon, 09 Nov 2026
 07:34:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106151947.3991524-1-vincent.guittot@linaro.org>
 <20261106151947.3991524-7-vincent.guittot@linaro.org> <au7SabL5pfbsApyB@scheduler.schedules>
In-Reply-To: <au7SabL5pfbsApyB@scheduler.schedules>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 9 Nov 2026 16:34:30 +0100
X-Gm-Features: AclHuK9N2muwxBwXja5tSUoZCIluDqTOafx-CvDIw1G2kK_wi6hfcBvvANqgYW0
Message-ID: <CAKfTPtAen9jnDpaE_318hTys9ek5VzE2LUaXGz2LWdGYfOtaEg@mail.gmail.com>
Subject: Re: [PATCH 06/20 v3] sched/eevdf: Add min slice check when selecting CPU
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-kernel@vger.kernel.org, lukasz.luba@arm.com, rafael@kernel.org, 
	linux-pm@vger.kernel.org, tj@kernel.org, void@manifault.com, 
	arighi@nvidia.com, changwoo@igalia.com, sched-ext@lists.linux.dev, 
	qyousef@layalina.io, christian.loehle@arm.com, pierre.gondois@arm.com, 
	sshegde@linux.ibm.com, tim.c.chen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 7 Nov 2026 at 09:57, Kayra Cizmeci <kayracizmeci@gmail.com> wrote:
>
>
> Hi Vincent,
>
>
> Sashiko reviewed this one so I'll just put here my own concerns instead
> of repeating.
>
>
> On Fri, Nov 06, 2026 at 04:19:33PM +0100, Vincent Guittot wrote:
>
> > Add a new level for selecting CPU when select_task_rq_fair() fails to find
> > an idle CPU. This last level compares the min slice to select a CPU where
> > the task could run 1st.
> > This helps a waking task to select a CPU where a longer slice runs
> > instead of one where a task with the same or shorter slice already runs.
> >
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >  kernel/sched/core.c |   2 +-
> >  kernel/sched/fair.c | 157 ++++++++++++++++++++++++++++----------------
> >  2 files changed, 102 insertions(+), 57 deletions(-)
> >
> > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > index 031efe7d49fb..d71da9069218 100644
> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -9012,7 +9012,7 @@ void __init sched_init(void)
> >               rq->sd = NULL;
> >               rq->rd = NULL;
> >               rq->cpu_capacity = SCHED_CAPACITY_SCALE;
> > -             rq->min_slice = ULONG_MAX;
> > +             rq->min_slice = 0;
> >               rq->balance_callback = &balance_push_callback;
> >               rq->active_balance = 0;
> >               rq->next_balance = jiffies;
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index cfc99b94d9ce..039dce244aaa 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -8842,11 +8842,25 @@ static inline int sched_balance_find_dst_cpu(struct sched_domain *sd, struct tas
> >       return new_cpu;
> >  }
> >
> > -static inline int __select_idle_cpu(int cpu, struct task_struct *p)
> > +static inline bool choose_sched_slice_rq(struct rq *rq, struct task_struct *p)
> >  {
> > -     if (choose_idle_cpu(cpu, p) && sched_cpu_cookie_match(cpu_rq(cpu), p))
> > +     if (p->se.slice < get_rq_min_slice(rq))
> > +             return true;
> > +
> > +     return false;
> > +}
> > +
> > +static inline int __select_idle_cpu(int cpu, struct task_struct *p, int *slice_cpu)
> > +{
> > +     if (!sched_cpu_cookie_match(cpu_rq(cpu), p))
> > +             return -1;
> > +
> > +     if (choose_idle_cpu(cpu, p))
> >               return cpu;
> >
> > +     if (*slice_cpu == -1 && choose_sched_slice_rq(cpu_rq(cpu), p))
> > +             *slice_cpu = cpu;
> > +
> >       return -1;
> >  }
>
>
> Look here:
>
> CPU1: CPU2:
> FA    RA
>       FC
>
> CPU2 has 1 RT and 1 Fair tasks named RA and FC.
> Let's say RA is running on CPU2 and FC's slice is 10 ms.
>
> And let's say FA has 8 ms slice, and a fair task named TC is waking up
> with 9 ms slice:
>
> * We look to CPU1, 9 < 8 is false so we return false
>
> * We look to CPU2, 9 < 10 is true so we return it.
>
> But the problem is, CPU2 has a RT task running and we are going to
> compete with the RT task. In that case it can be worse than CPU1.

Yes, but we don't really know. The only thing we are sure of is that
TC will be the 1st fair task to run on CPU2 whereas it will wait
before running on CPU1. I tested more changes on top of patch 20 to
handle the case where the task is enqueued on a cpu chich run higher
sched class task, but I was not yet convinced by the result vs
complexity.

>
> So, I would suggest something like this or so:
>
>
> (My editor got crazy, so I had to copy this diff :<)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 262626455497..8b0dd858f332 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -8876,10 +8876,8 @@ static inline int sched_balance_find_dst_cpu(struct sched_domain *sd, struct tas
>
>  static inline bool choose_sched_slice_rq(struct rq *rq, struct task_struct *p)
>  {
> -       if (p->se.slice < get_rq_min_slice(rq))
> -               return true;
> -
> -       return false;
> +       return p->se.slice < get_rq_min_slice(rq) &&
> +               READ_ONCE(rq->curr)->sched_class == &fair_sched_class;
>  }
>
>  static inline int __select_idle_cpu(int cpu, struct task_struct *p, int *slice_cpu)
> @@ -9193,7 +9191,6 @@ select_idle_capacity(struct task_struct *p, struct sched_domain *sd, int target)
>         bool has_idle_core = sched_smt_active() && test_idle_cores(target);
>         unsigned long task_util, util_min, util_max, best_cap = 0;
>         int fits, best_fits = ASYM_IDLE_THREAD_MISFIT;
> -       unsigned long task_slice;
>         int cpu, best_cpu = -1;
>         struct cpumask *cpus;
>         int nr = INT_MAX;
> @@ -9204,7 +9201,6 @@ select_idle_capacity(struct task_struct *p, struct sched_domain *sd, int target)
>         task_util = task_util_est(p);
>         util_min = uclamp_eff_value(p, UCLAMP_MIN);
>         util_max = uclamp_eff_value(p, UCLAMP_MAX);
> -       task_slice = p->se.slice;
>
>         if (sched_feat(SIS_UTIL) && sd->shared) {
>                 /*
> @@ -9260,7 +9256,7 @@ select_idle_capacity(struct task_struct *p, struct sched_domain *sd, int target)
>                         else if (fits > 0)
>                                 fits = ASYM_IDLE_THREAD_FITS;
>
> -               } else if (fits > 0 && task_slice < get_rq_min_slice(cpu_rq(cpu))) {
> +               } else if (fits > 0 && choose_sched_slice_rq(cpu_rq(cpu), p)) {
>                         fits = ASYM_BUSY_THREAD_FITS;
>                         cpu_cap = get_actual_cpu_capacity(cpu);
>                 } else {
>
>
>
> Cheers,
>
> Kayra :-)
