Received: from mail-ed2-f39.google.com (mail-ed2-f39.google.com [74.125.228.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1ACB3C2786
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080284; cv=pass; b=e7wiKpnZFFEFeHEfvOUoXr8w5GhaIzVweH52gk5IgPy2qCm0fYbkhtWTzKp/Tim3s9aPBnNAmNo4Yi/sG8qDtunljM5ahkNy5MMnmnErb8g+A8XmUje5yMdt/vCfOAVLdfbN1+gyVCFkPk2hHeiZbFQnSNM5bFrtJYe8br9ykkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080284; c=relaxed/simple;
	bh=hgXbCsBrfyiA3Mn/0rWvbOtO9t7XE++nmWybyUynzYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E8UKgBlArF5r09VP7b8ItDYY6im9kkrcnE3T9Q/Z9DJJ/vJydUlUNwbNlXhyFy+l+EoQI1XlsdwxwPUdM2n2k87cbtBiUIQg+vnmE/uWg94qPgkRk3l8xCSDfORQHxm+bIlPn5zTXvZKY44sxm+BBZgTog12GLISldbjLyvOsnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mi/rrmlx; arc=pass smtp.client-ip=74.125.228.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mi/rrmlx"
Received: by mail-ed2-f39.google.com with SMTP id 4fb4d7f45d1cf-6aa0ee64afdso4807580a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:31:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790080281; cv=none;
        d=google.com; s=arc-20260327;
        b=pf43/eLVR78e0HE1nuazpJ3JplHtdBCB4Qaoc4MXdby9O+lzuiodXl5VzL0MwWxplZ
         u+uPHZQ1cEL637/+NRd919Pmwvggsdq4uEy7yaPO9e9jJFcZ5GunIH4WwCjTdu7zbgRR
         PGWo27/OSzhGwDmW2FhVYc1q2fmWub+sOkWEy64JucGKo8UUliHtz0VXaA6hkkMcZNcr
         3VDyBBgOWi5ucojKeE46ViAd8SauYRM8J2hZe759dO1qtfBwssFl8fwejXl/JsN4Jga1
         5tMBCAXJn8tMZ8NenDDujyZuou9ZhZePy902EqjFYJqzwqcUxetvYW4jcAd3vmDQVqRK
         zPLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FofQQhtIv4GuN4oNItP8/hetkP0RbBdslQgTp07UuQQ=;
        fh=6WZx7vZeYEREZ5ubV+i6OqtVnjik8Os3AKDZDMIpx3I=;
        b=jQtPIARTTbZ5ErLbAH4qSs0LmbO980r3RAeV/as8bc+hWeryzoOOWRmzO7xbcDGOVd
         nhdBuykhYX87oCznGwCF08OnbZCDhv27Y0f7rAMtEWoj6Y8GoEt/Ne2GD9Nbu2efNC/G
         CI57LbIeunm+iPYyirKWqWjkNFOwc0wyetM/MdfBneQ1YqZigoB8xi3GyijC+SYoace1
         JMtzZW8bad6T+p+55HLViZ5JfgtxxWQzv5NerbnvY9x/wDLbwIgYOeAtLwYLGcypUHOJ
         Wx/FPzn49yOkBUgLwwGcUrpbc3mQjBbYswZqDEwrjbJLLKa71H6WJh0ndvJaT7cohsI6
         i6tg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790080281; x=1790685081; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FofQQhtIv4GuN4oNItP8/hetkP0RbBdslQgTp07UuQQ=;
        b=mi/rrmlxJyMnBkhGP/MaO5RpRp51yvl+msyfB7Z9ujQb3oZiLvmjjaPPKWnH67O5r0
         N5aN4Qawy7uLL9DGeNDJWosmu/JzOH9ktPu/oBAu1vt5a6yY6uYsYxFO767zXeHs+A54
         Axfh0zXU/Nd9C6x1rkD4ZOMkMPB44zT6KEUk37I8LFY8hjyBr6RrMama2nQH1giKEeQZ
         SCBnyAUUKM0QQzGtnaL/iPWem7sJbMVaiiTi4lIfJGkO4opr3jrfkObDcWDZiiWuze5Z
         mY6TVeFUWPdCoXLbLu8z+RyyhwUAa5jZIpl6yUkHUhz72j414ht01jzRBZZKTy5nU37u
         eLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790080281; x=1790685081;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FofQQhtIv4GuN4oNItP8/hetkP0RbBdslQgTp07UuQQ=;
        b=NhmYiCnIkTewPFqRNMZo954M3HnXkHZp9MEj+PFCo+HwladMSKD363238Fhcn2MD8Y
         GN5YXczBSLgaDncennxrg/m1E9sEPrc4qNmaXSBK+udiOkTRVBD4CAz7X4nPIOjnfOjf
         pIFCJaSMehMCuUCePp/KrV1L5rm7brOm0/rRNdRxYLnftRrR23GW1FbowoBusmn8ckPY
         6H4w3Blrm5g7hEOSOhvjkVaXDd7ZtJV90RNWxJfJ5H9CeDLbiDIDiKhDQKFTRKEGKyYe
         TjNV9N+QhtnPGeF5mZE+6ZYKvXyrNfy96h03JWscgmX+Ais7BQm74sUdGYtElczUKw3N
         M9ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzF8xD+L1mDOZBSHxGMz0MDx0f/WmbLieOyscVBRBTzYDSSW3XLBf77hRD4thzReql/FbKZFoJkUJUuTBA=@vger.kernel.org
X-Gm-Message-State: AFuF++mKdeTTmprl8Rsc2XXjlSXO3b285TAZpatmsM9kHY66JlDZoxq5
	I1gtA3JILxSX9BbQwrqhuPc5jD6PTih5ySHGcK5B+Seqalpy70muwcE/cRKElq9rQM0DAg+M9JN
	wybqhljueN/fqdIJxo6Bv17sTrDoQwElPMZMMTHlcEA==
X-Gm-Gg: AYBFou3SBUaqSETulr7AeEWymPL0/+8jdzoUQ1NGB7UI0jtl8f0jJMzzhRIWM2KLB9M
	te4YtJr3945thU80+Y0o6kqMMHpro3kiW+/kmRYvSWayNwCEcYvDiUPQhILYrCJu+pgqTUaLzoU
	GZ1SmwoaZxLoA8PN4tNq/kaUOLUwkshOZFh07dl58S0d7rg+SvasCPl4tv0ZRTetXVAsRyx/KdU
	o5sU3ZTjltGgetS7GkyDU3/X45nJvyEcYXK8YLPYetfBcqFhbATkcCAiJw0MN19Ar1mlKlTm0wR
	cJKZjcCYxVhF9G5eagPZvd7gOzsw1IhXhJNWJMk0UW1gWCABLlTDlWHPcwo5CaE1dG0rsZgyOMH
	JJQlTyp9I
X-Received: by 2002:a17:906:c114:b0:c29:f5d5:5a9a with SMTP id
 a640c23a62f3a-c2a1584328amr1115750866b.36.1790080280833; Tue, 22 Sep 2026
 05:31:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921152238.3804392-1-vincent.guittot@linaro.org>
 <20260921152238.3804392-9-vincent.guittot@linaro.org> <20260922104609.GS776954@noisy.programming.kicks-ass.net>
In-Reply-To: <20260922104609.GS776954@noisy.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 22 Sep 2026 14:31:09 +0200
X-Gm-Features: AcwNN1UUpn67pNEGe8r2RDfryMLN5JxKDvsQsF_uzOumlue_x4ijks3W1Vxlq8Y
Message-ID: <CAKfTPtBAhMVa02Z23=nNZkx7Qum0x=U_KDCn=Gr6Pnf-SG4N5Q@mail.gmail.com>
Subject: Re: [PATCH 8/8] sched/eevdf: Add min slice check when selecting CPU
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, qyousef@layalina.io
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sept 2026 at 12:46, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Mon, Sep 21, 2026 at 05:22:38PM +0200, Vincent Guittot wrote:
> > Add a new level for selecting CPU when select_task_rq_fair() fails to find
> > an idle CPU. This last level will compare the slice to select a CPU where
> > the task could run 1st.
> > This helps a waking task to select a CPU where a longer slice runs
> > instead of one where a task with the same or shorter slice already runs.
> >
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >  kernel/sched/fair.c | 63 ++++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 62 insertions(+), 1 deletion(-)
> >
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 452da94289fe..5c9add3e853c 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -9023,6 +9023,59 @@ static inline bool asym_fits_cpu(unsigned long util,
> >       return true;
> >  }
> >
> > +static int select_slice_cpu(struct task_struct *p, struct sched_domain *sd, int target)
> > +{
> > +     unsigned long task_util, util_min, util_max;
> > +     int cpu, nr = INT_MAX;
> > +     u64 slice = p->se.slice;
> > +     struct cpumask *cpus;
> > +
> > +     if (sched_feat(SIS_UTIL) && sd->shared) {
> > +             /*
> > +              * Same nr_idle_scan hint as select_idle_cpu(), nr only limits
> > +              * the scan when not preferring an idle core.
> > +              */
> > +             nr = READ_ONCE(sd->shared->nr_idle_scan) + 1;
> > +             /* overloaded domain is unlikely to have idle cpu/core */
> > +             if (nr == 1)
> > +                     return -1;
> > +     }
> > +
> > +     cpus = this_cpu_cpumask_var_ptr(select_rq_mask);
> > +     cpumask_and(cpus, sched_domain_span(sd), p->cpus_ptr);
> > +
> > +     if (sched_asym_cpucap_active()) {
> > +             task_util = task_util_est(p);
> > +             util_min = uclamp_eff_value(p, UCLAMP_MIN);
> > +             util_max = uclamp_eff_value(p, UCLAMP_MAX);
> > +     }
>
> This all seems duplicated from select_idle_siblings(), and while I

Yes it is

> appreciated the breaking into functions, I do worry about the duplicate
> work done too.

I agree that this can fold into the current loops instead of a new one
but I wanted to show the changes for this version instead of mixing
them into the current loops. I'd like to even merge
select_idle_capacity, select_idle_cpu and select_slice_cpu into one
loop because they are all the same loop in order ot not duplicate the
slice selection in select_idle_capacity and select_idle_cpu

>
> > +     /* Those CPUs have been tested not being idle and fiting */
> > +     for_each_cpu_wrap(cpu, cpus, target) {
> > +             /*
> > +              * Stop when the nr_idle_scan is exhausted (mirrors
> > +              * select_idle_cpu() logic).
> > +              */
> > +             if (--nr <= 0)
> > +                     return -1;
> > +
> > +             if (slice >= get_rq_min_slice(cpu_rq(cpu)))
> > +                     continue;
> > +
> > +             if (sched_asym_cpucap_active()) {
> > +                     int fits = util_fits_cpu(task_util, util_min, util_max, cpu);
> > +
> > +                     /* Perfect fit: capacity satisfies util + uclamp */
> > +                     if (fits > 0)
> > +                             return cpu;
> > +             } else {
> > +                     return cpu;
> > +             }
> > +     }
>
> And it does seem like a waste to re-scan the CPUs we've already visited.
> Can't we keep track of the minimal slice CPU that was not idle during
> our initial scan?
>
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 2ad46fb2eafe..d3ab945f50ba 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -9179,6 +9179,7 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>         struct sched_domain *sd;
>         unsigned long task_util, util_min, util_max;
>         int i, recent_used_cpu, prev_aff = -1;
> +       int best = target;
>
>         /*
>          * On asymmetric system, update task utilization because we will check
> @@ -9263,8 +9264,10 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>                  * capacity path.
>                  */
>                 if (sd) {
> -                       i = select_idle_capacity(p, sd, target);
> -                       return ((unsigned)i < nr_cpumask_bits) ? i : target;
> +                       i = select_idle_capacity(p, sd, target, &best)
> +                       if ((unsigned)i < nr_cpumask_bits)
> +                               return i;
> +                       return best;
>                 }
>         }
>
> @@ -9282,7 +9285,7 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>                 }
>         }
>
> -       i = select_idle_cpu(p, sd, has_idle_core, target);
> +       i = select_idle_cpu(p, sd, has_idle_core, target, &best);
>         if ((unsigned)i < nr_cpumask_bits)
>                 return i;
>
> @@ -9297,7 +9300,7 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>         if ((unsigned int)recent_used_cpu < nr_cpumask_bits)
>                 return recent_used_cpu;
>
> -       return target;
> +       return best;
>  }
>
>  /**
