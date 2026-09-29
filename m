Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE945218B9
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790685598; cv=pass; b=N+rFwL/fPLrqO5sziXQrHvll25gJgEcUPaNMwv1E+sQilC7PPFLlcVxO7Rtlo8fYd+KV66NgSc4zcGOIBNGRCpXa6Z5zgbvR0ZDWyuPJZ2zYx+PnbvsPvTbcPho4LqPen+XdxVsws6QBQa8C7+8ytqErTO8NptB4I+dLGtHEgG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790685598; c=relaxed/simple;
	bh=BVT4vOA0XPKBx0j10RxW3KaC3zHI2s/xPJmQsp0n6U0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OUip0BBgbilGH+pXBmcKzngx2yeHXELi74DBkYlTzDjOhtdgd9QnbjKqkKefWCHlI0dpUa/V0ptHHwT3+rCiI3CexEugkH4HI5m59mbQFPW2YW+kaI+1TIESRCi+EKJBDMW3rkYU3ugnvzrOQYVauTgX5HoJ4Tg3BoOPThrh6QY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Eusvh86J; arc=pass smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Eusvh86J"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aae359e2c0so6142556a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:39:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790685595; cv=none;
        d=google.com; s=arc-20260327;
        b=rbi4m5f9XUXGWGAXBoqMgFGIv6MhpaK33XI3Cnp05i5awrmR3HlqEruBxnv+Vkduei
         7a/r+BXAiLwNj/6PGhW8TjpTCkLltlCIIfRVjc2b/brXNGws+xt8gddJ4bZdYveTC8EU
         GVIBldWLOmSG6CMS8mkVXKHowZ9Cgvm4JMWl2WFNvlbU6H+KQ0xX+2Cy9o8U07hIqMBb
         9KyCYZfWfFH7mbvcaXFKPBOHQf/gkzm6DPC0uY8Osk2g/FZXqAthyTok37WBv3VSqR3r
         bAubHwQp2mLJRHjyH6eNW7mqrR8YRt4gXnyZUV55bK1FQV60Hc8OsCwI4qj99uQVyGmi
         eH1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gPuNo9oA5qHQptAKd2NDJZ0X28vnvu9C3fOQcej8WQw=;
        fh=XP+zsswFNWbSH5GoAVq/3SfJ/7JgTEs55zdkfP85b7A=;
        b=hR/9Trhp4DfjB0/gTWmbslNjPCnuIppleoAK01Qa4kt8ebMsIQWezsKhASf4MtyR5O
         c0y0wcybqsTn01BE8Ano6Yjlm3DEBPAwcaiXH8ZYvrViCVOCYrnqxSJY+MBJoTB7gJ6z
         obzk/7HWr4HLFLCP/XNeugbabEbYAZNVq1GzWzC6Mk6GZ73vmm/2XL4reHrl4vtxqJUf
         cYVitQBOBXMuTpQ8nQhdja8xglguRFyHy5r3UV8npZn4tHs91Kvl88wZQGGmUC5cLioM
         REalP2e0zzMwjYLLpz05FxwzzQtlPJps+3S0nGXzKUP+bVHAWh02YIm4Ma0hBa91rt7z
         uDYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790685595; x=1791290395; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gPuNo9oA5qHQptAKd2NDJZ0X28vnvu9C3fOQcej8WQw=;
        b=Eusvh86JnhvAFHxImYtzAJu0M7Bd46P7IyOK3JIZ6d+KpupCOc3W+5i8Cmki6/37Mj
         t0VIVz9rXsZDp/q3rIwS1WfqjvthhrqQbxSTakcP37HUcnfX+DBXxAnOKu15iI/VxLOe
         0uWTNshldtYypDIoLcGoWNel7HXXzO1x8l8HAgSimUIwRtl5wm/2oBUsWvibk0TZdvJs
         Vt1uxOuCh45O8MeJXZjvwlo6j1oUa3s968GpXQcYi4ZxfdvnNwSGPkw584fp7zV+XFmk
         CwVuIyVZnO2lkT5wAikEcaYUgLsj112TmvNd8FMrMUlPR8oOmXA9LOAr1AV+ULLB/LCa
         SnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790685595; x=1791290395;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gPuNo9oA5qHQptAKd2NDJZ0X28vnvu9C3fOQcej8WQw=;
        b=jMwy8w2EiD3+N9Sc6+jP2ZYgDXO09VDcPdTroAAk4a/807mds9l0IdnDr3B6NHPUVG
         6xeg/IjyL9efnQD6MZcnBtK96+vGuw+Vk0IemiHPCCXUWF518qgcW0A7j+8JjTc1iwIY
         CMd2pTRBMmfiXeQm713vR2Sn+0LFLJHsqC2r1PK3pBEquah1J6vHC//N+Feq0vzXbLOe
         6eIZqtfjbmedNKk6vVC62qOXKvenx1P1eZekrK0toywxzrPjcn3V31brznvSoaswiJH7
         ZmyxfhEBFcfawWzJh1z/KVvvHgJqElnwGJq3U33YdvGgOhZw4xGyl9o+BPc9S2DrDtJI
         KjOg==
X-Forwarded-Encrypted: i=1; AKwUvBzu/wkdQ/CZCXX4qwnQAEOoxF21YyYyR+pdTPGhz4nlKUCAduxMW65cam9ftsaAJAyGCGuhYggqS0UgFUw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIv1WLGMXeJsHdBxxAIgducLGso6GRfr+bYuxTwuCZwbl3xcznx
	M0JyOPxf0qCPOprOeGVf2NwBWcXVSFBRevYZ6ahHhBPUO6tuFtqBZGcAey4kkbE/4jEgV3+Bi+U
	FYTCWIEigb6i1oExpBD+7TCxykNz1MU3So+ToWVF6EA==
X-Gm-Gg: AYBFou0iaxmk+aFdwN5jdi72AyaW8gB2dAI59/EitCgrB2tvpy2Su3sZBIBV5wWnQ3w
	qZZyXSLe1HhTcq6pYMfvOScmj4fBQlpuVErjt75CFIVIeK/wE9vpT1NMPC3ElSSeyC3Agdd59r+
	kK4/K1ljOhSaIa27LlAGufBmiB8L6eCuiLp6eMld7RNFrGwWmEmZqdmGj+sJ1ES15VRzoqEyJcr
	ZIgY3Zuy55d+xk/KnbKiB4N7nIjEXu5GHBUWqjxQlk/0phTtFj64GqOgFijI91Vu6XK6Og35ndi
	N/KaJvRNxUI5Pe8U/GZ17O2TtGX64KcCGurWLS4vLhtaqf80NJ+tIFZj3Ool2HSe3piGBDqqmRo
	rzHc/6aA8E3UBQg==
X-Received: by 2002:a05:6402:3904:b0:6ac:b8f4:20d3 with SMTP id
 4fb4d7f45d1cf-6acb8f43170mr1283365a12.27.1790685594614; Tue, 29 Sep 2026
 05:39:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921152238.3804392-8-vincent.guittot@linaro.org> <20260926181840.3107-1-kayracizmeci@gmail.com>
In-Reply-To: <20260926181840.3107-1-kayracizmeci@gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 29 Sep 2026 14:39:43 +0200
X-Gm-Features: AclHuK8CVwlC3W_XhfT507pUPpDzvwzJXiv_HvP67LgsPmDT3YsakC2t31HmhmQ
Message-ID: <CAKfTPtDq-JeM=_MkYyx-HfUad529qdQbkTbVhCfFCtsdFGrU7g@mail.gmail.com>
Subject: Re: [PATCH 7/8] sched/eevdf: Compare min slice during wake_affine
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	linux-kernel@vger.kernel.org, qyousef@layalina.io
Content-Type: text/plain; charset="UTF-8"

On Sat, 26 Sept 2026 at 20:19, Kayra Cizmeci <kayracizmeci@gmail.com> wrote:
>
> Hi Vincent,
>
> > Add a new level in wake affine where we check on which CPU the task
> > would most probably run 1st between this and prev CPUs.
>
> > @@ -8402,6 +8402,9 @@ static int wake_wide(struct task_struct *p)
> >   * wake_affine_idle() - only considers 'now', it check if the waking CPU is
> >   *                   cache-affine and is (or will be) idle.
> >   *
> > + * wake_affine_slice() - only considers 'now', it check if the waking CPU can
> > + *                    be preempted because using longer slice.
> > + *
> >   * wake_affine_weight() - considers the weight to reflect the average
> >   *                     scheduling latency of the CPUs. This seems to work
> >   *                     for the overloaded case.
> > @@ -8437,6 +8440,20 @@ wake_affine_idle(int this_cpu, int prev_cpu, int sync)
> >       return nr_cpumask_bits;
> >  }
>
> > +static int
> > +wake_affine_slice(struct task_struct *p, int this_cpu, int prev_cpu)
> > +{
> > +     struct sched_entity *se = &p->se;
> > +
> > +     if (se->slice < get_rq_min_slice(cpu_rq(prev_cpu)))
> > +             return prev_cpu;
> > +
> > +     if (se->slice < get_rq_min_slice(cpu_rq(this_cpu)))
> > +             return this_cpu;
> > +
> > +     return nr_cpumask_bits;
> > +}
> > +
> >  static int
> >  wake_affine_weight(struct sched_domain *sd, struct task_struct *p,
> >                  int this_cpu, int prev_cpu, int sync)
> > @@ -8488,6 +8505,9 @@ static int wake_affine(struct sched_domain *sd, struct task_struct *p,
> >       if (sched_feat(WA_IDLE))
> >               target = wake_affine_idle(this_cpu, prev_cpu, sync);
> >
> > +     if (sched_feat(PREEMPT_SHORT) && target == nr_cpumask_bits)
> > +             target = wake_affine_slice(p, this_cpu, prev_cpu);
> > +
> >       if (sched_feat(WA_WEIGHT) && target == nr_cpumask_bits)
> >               target = wake_affine_weight(sd, p, this_cpu, prev_cpu, sync);
> >
> > --
> > 2.53.0
>
> this_cpu has min_slice of 7 while prev_cpu has min_slice of 5.
> se->slice == 4, so on wake_affine_slice() prev_cpu is chosen.
>
> Ain't getting onto a cpu with bigger min_slice is better for us?
> If so, is this works for you?

For wake affine , we try to favor prev cpu if possible

>
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 09f0667e97a2..e50c339e5c2d 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -8444,14 +8444,13 @@ static int
>  wake_affine_slice(struct task_struct *p, int this_cpu, int prev_cpu)
>  {
>         struct sched_entity *se = &p->se;
> +       u64 min_prev = get_rq_min_slice(cpu_rq(prev_cpu));
> +       u64 min_this = get_rq_min_slice(cpu_rq(this_cpu));
>
> -       if (se->slice < get_rq_min_slice(cpu_rq(prev_cpu)))
> -               return prev_cpu;
> -
> -       if (se->slice < get_rq_min_slice(cpu_rq(this_cpu)))
> -               return this_cpu;
> +       if (se->slice >= max(min_prev, min_this))
> +               return nr_cpumask_bits;
>
> -       return nr_cpumask_bits;
> +       return min_prev >= min_this ? prev_cpu : this_cpu;
>  }
>
>  static int
>
> Thanks,
> Kayra
>
>
