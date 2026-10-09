Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26773AEF58
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 14:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791555484; cv=pass; b=Qq5wTyWvph3SsfeQae+8GgxhLNG/xKZexS+XHfuXFMGthGCAzS7VpMcyQKWoJWuurv86MJiKvtl8UQ87LZWw7mwbIFMbN3fiRzlKNrRlCkhhh/HehWjKuJche97abRuvnPVRUr2kGUSos73O5pMMtuk9wwDefB2jrnO+U08PN6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791555484; c=relaxed/simple;
	bh=yXkOOHEp5xbA8RyWHIG6SKO9apysMTvV+h4+HDrM66E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F34Ui2xwxSqD22XKDVh3gclU37YIaeCYkpDg81x7hzLRlzjrZld/jPydlumPu1N7n+hMYYlmsn7rZrEZVHKJkjM1ojtai3UZdV6EgiBAP9CwfynNul/gMRenE5Eh6sLojoNpsEW/CnStTkkP7YPh1/3c3pmPKbb8HOlUMiiMhzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yoJiEh7r; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yoJiEh7r"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b13fb95060so2739425a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:18:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791555480; cv=none;
        d=google.com; s=arc-20260327;
        b=Wl6AenT4YFj/AY8LxxMd6IRytd/iuIYjRVFbchB0cv5GuPH+Yo1E3P5zAIczVAWmsR
         +L37iREueO/fooZq2MQdvsGWOCJXncdCObjR1lWFfnnQiAW854FnKsDer1wzxnQxt3lN
         uZrAvodgK4awggiQrODi5MFQdVw6Qot/o2bdR1jVn4hDSvtdent2+KOcGZqIaujst6m2
         K0UMKNjTKpch9bVoIhUFaT1X13oGSrn4jTf/FPmNQxpYOGDXNJiIyDIKXDE5nor4C1if
         uFqyM8Xgp6vy04DMnRvzJp1NiHlORKy5cP3cqPRAy6kRyru61VDjzbpqbxn86wR8SoGE
         I8KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mjfQzImx89RahkOfgksZ5+FFpeca3hXEAlgOHPVxIY4=;
        fh=3gBqbIP52qqDBFWF7SSRvGor5FDrwUtXJN9c3CrfVXk=;
        b=JWdmQlTj0qqAeQ9q+Nj3Z6TqlaMvcE8YzapyCDMHsBU2P5evgSpnaL9RbDcsL49xUv
         5XsU9+e9Qch/+yoDUyevmKTpUUmJk1v1m0gOXLbo+O7k28Ix0LaDnk43HODpsoMUh6JK
         gFCdLFNzzLh3nOpIlx2WxthcIxXsJldVM3cwlbHOnpBL3KHEFNubZsjhGjxyk0R6FVbV
         B+Tl9Ui4O85JT+l12PjXN23dhUGdhkF54eFmwuiKdKihIS7QedVWViizO/EyBPsXFS1+
         zwnt9AyOfRZz83PkcUoWdmGTlZBfMZ8Xh6I/gyqfKKnt/P0Za2YbAOGhqy0e+NqYuw+Y
         PI0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791555480; x=1792160280; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mjfQzImx89RahkOfgksZ5+FFpeca3hXEAlgOHPVxIY4=;
        b=yoJiEh7rMJUI9DCeWnhkOq0rD2LIzXJD0M9JkRjaZcpTncnI8bNNNuC1WeeogM3C2w
         3M54CMRBazJK/CiB32AHVkSanB15eJhkW5i65Ld+KiljyurVuy3PsqH6VbUg0WQIh2gE
         OLiRwWFhh8W4UAKPip4l3eoYA8cEqT9BgVxWD/w9okmaNOjOXZjW+/PRLGwStqWHlM0e
         RT1uUFss+8UKUa4km50vDQYvr8DFzqOVneYbO/UxvkbsAhwUkNJYliM65N+QTCObNQJv
         ypRchJNlCQKnJ3khuqoLSM4dKhVmVcInZEd/3wSLU4E7hogc/aTWuNeRqEu813Voui86
         y6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791555480; x=1792160280;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mjfQzImx89RahkOfgksZ5+FFpeca3hXEAlgOHPVxIY4=;
        b=GhVCriqftue/3la6CtwPEWR6OYlvvhxe7o3FS2gNV6ZjjbITiqDd/UKOTmFRkk/WSU
         jkmGzg9zUX+/CpBM9Fs6bmQuH2Hvt5r9UyZIaKQU+oMeBl6MtTrAauq3irRaSSww3Yox
         gs4efxbdCnXtRkbHAbdhXgPHIy9Rp8/jeT2jwkTWpsXt59W0M948WOLMm6BN/j7U1HOh
         oEGC020kFk3L6f5UNSpUviLDPoAzvH/NFFuxfERem65cofb1pWFuKKI29stIC5yaFx27
         RKEmyshKroXf4/O5enWt294oaEDYFHY1ipYDO/+MyxH9GT1wOU0UJ8LnbRt+O6PWSiXJ
         /PAg==
X-Forwarded-Encrypted: i=1; AKwUvBzEcB3BiHHFT2Sw6JFW1Pnu3CifhSPmkHBOj5njIHL/3UEoSvv1DUlisIZMoGuCs6qfRc61FJt4/0ZZQRE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJtIfOJbVbpa9RvhPx76ahfw2UaMFC0Mklvlr1ziOuoZ7bz8XD
	Dwm8lANtxGlxyPCr/8KcxOO5F5B3gTuPU6V3hZiT0mp5RvAPfSEifmxyTYsGJp13OMZ2PRdbTb4
	Fe5UlUJu+BWXIZDN3iXKLOw5aXmMCCnu4rPN2qrdT3A==
X-Gm-Gg: AYBFou3owoJZcp9UMvGU1WhcCcOuqnpXnpJLV8yjhgW4gfudJnfAr9vi9f62njDFpp5
	/zin3L1k4l3Q67bbbS1i0FqgW0ymNUv99zO1hIvhZKN4fGWYM9J+fJefzYACJefFNZTGVPRgr/l
	PFsNTZaNHAhYRM84jnUIa+Fxp7EoI4Ei8amJq5GOW0bbamir11/rvm7t8xkDQ+bpKAZZjx9IkLE
	fItI81NSRllpwerlLp6d41dRAs0mloOSZoUaq8zRZFY9/ErKjso2U3rpTI0rAXoHlLxAQRfQ5vM
	JYq2iYlCUeA48HU1LFW9kG0u6wbnO2/D7QshP+oKiIoWGz10GqVSv1Nxd/W4aXbhznFu8L3L+I0
	yWWY+vANJlgY=
X-Received: by 2002:a05:6402:4606:b0:6ac:6b18:345b with SMTP id
 4fb4d7f45d1cf-6b17c24e477mr1307684a12.17.1791555479602; Fri, 09 Oct 2026
 07:17:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002154415.2270586-1-vincent.guittot@linaro.org>
 <20261002154415.2270586-19-vincent.guittot@linaro.org> <179bcb50be21f834423f9b5c068b5fce4cb65871.camel@linux.intel.com>
In-Reply-To: <179bcb50be21f834423f9b5c068b5fce4cb65871.camel@linux.intel.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 9 Oct 2026 16:17:48 +0200
X-Gm-Features: AclHuK8Pboa48bG0Ygkxu5EGL_q1lSvm8cRTKP-bJ5A1NhoyUuVzmn0zHI8xqpo
Message-ID: <CAKfTPtDcw6J72dJkbemySR1WKE_sWB0exXp_X1=DZSdO9BbrQA@mail.gmail.com>
Subject: Re: [PATCH 18/18 v2] sched/fair: Take into account slice in EAS
To: Tim Chen <tim.c.chen@linux.intel.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-kernel@vger.kernel.org, lukasz.luba@arm.com, rafael@kernel.org, 
	linux-pm@vger.kernel.org, tj@kernel.org, void@manifault.com, 
	arighi@nvidia.com, changwoo@igalia.com, sched-ext@lists.linux.dev, 
	qyousef@layalina.io, christian.loehle@arm.com, pierre.gondois@arm.com, 
	sshegde@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Oct 2026 at 00:53, Tim Chen <tim.c.chen@linux.intel.com> wrote:
>
> On Fri, 2026-10-02 at 17:44 +0200, Vincent Guittot wrote:
> > When the cost is the same, take into account the slice of a task to try to
> > select a CPU where is will run first.
> >
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >  kernel/sched/fair.c | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> >
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 94554f165f42..d60bb6db4ce9 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -9598,8 +9598,17 @@ static int check_cpu_with_task(struct task_struct *p, int cpu)
> >   */
> >  static bool update_best_cpu(struct energy_cpu_stat *target,
> >                           struct energy_cpu_stat *min,
> > -                         int prev, struct sched_domain *sd)
> > +                         int prev, struct sched_domain *sd,
> > +                         struct task_struct *p)
> >  {
> > +     unsigned long task_slice = p->se.slice;
> > +
> > +     /*  Select the one where you can run first */
> > +     if (task_slice < get_rq_min_slice(cpu_rq(target->cpu)) &&
> > +         task_slice >= get_rq_min_slice(cpu_rq(min->cpu)))
> > +             return true;
> > +
> > +     /* Favor previous CPU */
> >       if (target->cpu == prev)
> >               return true;
>
> Hi Vincent,
>
> The slice check above comes before "Favor previous CPU", so I read the intent
> as: the CPU where the task can run first wins, even
> against prev_cpu. But the slice check can fail for prev CPU
> and we can skip to "Favor previous CPU" and pick prev CPU, even
> though the task can run on min CPU first but not
> necessarily on prev CPU first.

yes, I wil fix it

>
> Take an idle CPU X and a busy prev_cpu. Any task can
> run first on X, because an empty rq has min_slice == ULONG_MAX:
>
> - prev_cpu scanned first: when X is the target, the slice check
>   selects X.
> - X scanned first: when prev_cpu is the target, the slice check fails,
>   and "Favor previous CPU" then selects prev_cpu.
>
> In the second case the task is stacked on the busy prev_cpu even though
> it may not run first there.
>
> Perhaps something like the following is better.
>
> ---
>  kernel/sched/fair.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index a47c6521a411..3fe305d690eb 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -9830,11 +9830,15 @@ static bool update_best_cpu(struct energy_cpu_stat *target,
>                             struct task_struct *p)
>  {
>         unsigned long task_slice = p->se.slice;
> +       bool target_first = task_slice < get_rq_min_slice(cpu_rq(target->cpu));
> +       bool min_first = task_slice < get_rq_min_slice(cpu_rq(min->cpu));
>
> -       /*  Select the one where you can run first */
> -       if (task_slice < get_rq_min_slice(cpu_rq(target->cpu)) &&
> -           task_slice >= get_rq_min_slice(cpu_rq(min->cpu)))
> -               return true;
> +       /*
> +        * Select the one where you can run first. Check both ways, or the
> +        * result depends on the order of the CPUs in the PD.
> +        */
> +       if (target_first != min_first)
> +               return target_first;
>
>         /* Favor previous CPU */
>         if (target->cpu == prev)
>
>
> Tim
>
> >       if (min->cpu == prev)
> > @@ -9762,7 +9771,7 @@ static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu)
> >                        */
> >                       if (target_perf < min_stat.min_perf)
> >                               find_pd_cost(pd->em_pd, target_perf, &target_stat);
> > -                     else if (!update_best_cpu(&target_stat, &min_stat, prev_cpu, sd))
> > +                     else if (!update_best_cpu(&target_stat, &min_stat, prev_cpu, sd, p))
> >                               continue;
> >
> >                       /* Save the new most efficient CPU of the PD */
