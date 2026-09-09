Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB294233722
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968580; cv=pass; b=kX0YQNiMkib1xcbaG5oZYputGbibhHd4QCr9wddye/47WhI9ryOUiN4E6Qxh2Izr7xHeBuhcIfzh+jNZFL9HkGaPJom2lZukuxPmcPGNo7CDRlvaLOSjE91H9efjdx3cvFAwJwNEMm/+fTgVeGPbBE2IhhtvoKnONx8FqIgY21U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968580; c=relaxed/simple;
	bh=OzxwjqScUV85IgjxSzrhF2r0BKjzgbR43lPdreX/BvE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A5FvyJ8+nAmBI+hztUoQEdfQPGidJ7YqCRXMFZ9zMND7cBRRUPfAQW0JXF/30FEOP0UHTe0R3CioxGjP3tuq/SkHAyg68dkdahdOXhY1tujdbbL7Qz3D5M60krAD52QLzbkT6Fsl8tRuNdRt5NkHPhasG47wBRRi0ZFrH1Onlog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FWTbuCh4; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FWTbuCh4"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a8814f93e0so542915a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:42:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788968576; cv=none;
        d=google.com; s=arc-20260327;
        b=mLyCu1WqRrkCXViVihQUkJhhclbUPqJgJRpHzwmcH5FafpINC+7ikUuMPL5Q9LQA9d
         oMrBOX9BC/Hgw8anjg3ATYw7OLGlb5iiTg7dE99aMFexW5LMWYWLVI1XTLg6FcqKqamZ
         hWnO+Say5C2EACkTfq4vAoesbqBVK1L9+a1pfrEl3Z5hAvKQcE4pkBSTPmz5zQk4RX5R
         MngtDBvNUgL3sbm72UhmdBj5/M+IUPxyE8A95XdFiuq7M8pofCOKxMI0cWKMT6LoRQRw
         KPRAxK1NaL+2qHGZeW0Od1WB+o+dlUqLw4jpZ0Y78KPTt/Rs+Dsofg7HzHCvMxeAO+T9
         A/fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=S2m1QvsK2UVPVTQ9fA20HFfbroOfurxqiB9XG3yA/pw=;
        fh=tUhrwODm2OFnGGVCitqWD+aeN7FMrgpdC0hwEm67VHs=;
        b=YbftX0ItjVUMA46gHKOASQOHPiT6VE9yFpO+Mlhz6fmWTRpOkWj4Mc1zlFaenCAV0j
         AdUAW5GxbB1RVP77XrGmjgUlb0G7XRJqT69fO0wgZUu6qPe1+r5a+/1SUPUqkrUhxiYc
         ljUIFWajBjuxbNE7Jlo1jladnARENVYPiO0cAAQk3rAsYNppwVEUnILMh6BscaljwFIw
         ooBnN8Pb/revG3I8b/f4sx6Km6xBBK5jUZ8fTI6EyNb/mnTIVWT2y71q10lmiaAf/JaD
         3xIkjZM6AjuW4vQChnkF/x5wF9Mm4Gvzpozwkwex28cq4rW8WYudrtm7BLvd5Pgtm/qO
         gOjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788968576; x=1789573376; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S2m1QvsK2UVPVTQ9fA20HFfbroOfurxqiB9XG3yA/pw=;
        b=FWTbuCh4WO1/JSP1E0MUZXzG4d4ixtYy5mZmdRhTwbfBws7ho3BJJ/ykeQ+icny4TF
         iDPQ1eBjUkgiNQ+RIQ9Bg+avmmpW4PmxzWB0y8EbsL5VNWg6uzi9ihn9Mk+mS1+sdBrW
         QknMZZVl5aIIVeVTgeI9aL+MhrqJJ5TuW+xycM2N/7rcyCpETzU8y+cGTnX/AA85U2UW
         KAqlhshpEolJYkhY4Q2qTJzUwos2QiiVQxf0E87khwjLjlWx786vn0r50yqewKmHBpjN
         ukV7wePRHtZIYEk83fOknGyAWu/LiZ1CFYRciyIuFDdcol4QFjTp1gkCkxrYwYErHFK2
         medg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788968576; x=1789573376;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S2m1QvsK2UVPVTQ9fA20HFfbroOfurxqiB9XG3yA/pw=;
        b=XUt+n3pujOVEQEEbmr49JzQPKSr74BOvOL6vLV7+lJSqBFNbD2UTxSw8XeGrYvE+Vd
         NDyyYCFQE+GNUpX8dk7Y1lIoO/UXOf7cufRS5hDcwtquiE9UeEdCgNlN2d3CRZs1TT1j
         JhFYpQIyaqLG39zBrD8Yp9xxTZyduq/jVubRrQr3X2GOHWuLyBFm1mVJTsjZ6en4EiI5
         CcLwVBWamlqOsvU46FJ4Wdasm6B2P1vJFhzLMsUEKDoN5/UXpSQNu2+YnX9MYVn8i7Xy
         92XtFPUE44ZUBHPjjAtQVkfv1oEzMEgI1z1GtAmZvV/jjhtT6wlYFEGjNXhKaXMO0KVh
         A0/A==
X-Forwarded-Encrypted: i=1; AKwUvBwhNorfElWyNXV6uID+3QRLBjY7wnqV1ry/oIs9nnqS8UShOJeQYInACl1/z/r/6a07PvfGMBeuzABnx3I=@vger.kernel.org
X-Gm-Message-State: AFuF++n8Y22hzKDH+C1dAuXTA41G15oZi3VNIltHl00k6Es0k0LSh7gR
	t7SfaVJ8MGCMONJFghe+v4V0Tf2/BnBQc6ftQvQ9OSv083N/ybJv18DFMNmJ+6QKCdeZzF8QoCG
	r8ZIH/lMOYG6n4qEdizNLzIZdVYKBEsW6xpJWILevoQ==
X-Gm-Gg: AYBFou1tIBODtHAWX4eqViSgzUVIHOS+DCgzJ72NpDw3bjNGPbt7W5O1CJV2offyosU
	XgaKoVM+xWE5kJQ1bKh5a2XUaHaN1v3ByClQzRMBZDSIrxSZ7DqnkRLHGVc1YcFHjY4MoF8NFsd
	3hp5hHpT+Oe/ESiYl41tnhv5rOMDePPFqeNP3hmCrXvkjObCzszpypFPKiXSoIhBAL5lCiHAnEw
	m6yqq8SMTQvYR/3ztXiU90ysU8ZB8AS/Etniq805oMQDxiRoHBv6rvkpqI4wZIWUM6nJqbgPHPv
	46WF+xLKIpXYJtrKjJMRJ7DG00AJo4zo5gg5cI5b61/RX30+PhbENfoMILwe+JbzrCzxUimc35g
	2ibMdd3bxr0cL
X-Received: by 2002:a17:906:f5aa:b0:c16:84dc:9607 with SMTP id
 a640c23a62f3a-c2941b4be10mr141897166b.19.1788968575694; Wed, 09 Sep 2026
 08:42:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908082345.103087-1-arighi@nvidia.com> <20260908082345.103087-3-arighi@nvidia.com>
 <CAKfTPtAQh6ZndkHC+njYvX0hoDafaC+PX2EBfafDumTHvvgFcg@mail.gmail.com> <aqF4sqhjpYjIPgQF@gpd4>
In-Reply-To: <aqF4sqhjpYjIPgQF@gpd4>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 9 Sep 2026 17:42:43 +0200
X-Gm-Features: AcwNN1UV05JQkcUWg6uO4db95fK2YGtk8j3YGV2sIr2FYSgIHdwjsvNp_LI-72M
Message-ID: <CAKfTPtASXty5hOOgmXokCh95w0idU0y12UDua1_vg9m8teF9Rg@mail.gmail.com>
Subject: Re: [PATCH 2/2] sched/fair: Honor asymmetric SMT priority in idle selection
To: Andrea Righi <arighi@nvidia.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Mark Rutland <mark.rutland@arm.com>, Christian Loehle <christian.loehle@arm.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Phil Auld <pauld@redhat.com>, 
	Breno Leitao <leitao@debian.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Sept 2026 at 17:18, Andrea Righi <arighi@nvidia.com> wrote:
>
> Hi Vincent,
>
> On Wed, Sep 09, 2026 at 04:42:44PM +0200, Vincent Guittot wrote:
> > On Tue, 8 Sept 2026 at 10:24, Andrea Righi <arighi@nvidia.com> wrote:
> > >
> > > POWER7 and NVIDIA Olympus use SD_ASYM_PACKING at the shared-capacity SMT
> > > level to order hardware threads. Idle CPU selection does not consult
> > > that order, so a task can wake on an arbitrary sibling and remain there
> > > until load balancing corrects the placement. On these systems, that
> > > initial choice can prevent the core from entering its preferred
> > > lower-thread resource mode and cause a large and persistent performance
> > > loss.
> > >
> > > When idle selection finds an available CPU in an SMT core, choose the
> > > highest-priority available sibling. On SMT2 Olympus this only changes
> > > selection on fully idle cores. A partially idle core has only one
> > > available CPU. On wider SMT systems such as POWER7, it also fills
> > > available siblings in priority order while the core is partially busy.
> > >
> > > Apply the preference to idle-core and idle-CPU scans,
> > > asymmetric-capacity scans, target, previous, recently-used CPU fast
> > > paths and the slow path. Inspect the lowest scheduling domain directly,
> > > but require both CPUs to share its span because isolcpus can split
> > > hardware siblings across scheduling domains.
> > >
> > > Keep physical-core capacity selection independent from SMT sibling
> > > ordering. SD_ASYM_CPUCAPACITY first selects among cores with different
> > > maximum capacities, then SD_ASYM_PACKING selects the preferred available
> > > sibling inside the chosen core, whose siblings continue to share equal
> > > capacity.
> > >
> > > Reviewed-by: Srikar Dronamraju <srikar@linux.ibm.com>
> > > Signed-off-by: Andrea Righi <arighi@nvidia.com>
> > > ---
> > >  kernel/sched/fair.c     | 85 ++++++++++++++++++++++++++++++++---------
> > >  kernel/sched/sched.h    |  6 +++
> > >  kernel/sched/topology.c | 36 +++++++++++++++++
> > >  3 files changed, 110 insertions(+), 17 deletions(-)
> > >
> > > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > > index b8bd308c2d5b1..37837c36288a0 100644
> > > --- a/kernel/sched/fair.c
> > > +++ b/kernel/sched/fair.c
> > > @@ -8587,6 +8587,35 @@ static inline bool test_idle_cores(int cpu)
> > >         return false;
> > >  }
> > >
> > > +/*
> > > + * Redirect a CPU to a higher-priority available sibling in its SMT domain,
> > > + * subject to task affinity.
> > > + */
> > > +static inline int select_idle_smt_cpu(struct task_struct *p, int cpu)
> > > +{
> > > +       struct sched_domain *sd;
> > > +       int best = cpu;
> > > +       int sibling;
> > > +
> > > +       if (!sched_smt_asym_active())
> >
> > I wonder if it's worth creating a new static key. All other pieces
> > related to asym packing use sched_smt_active() to opt out the related
> > code
>
> The intent was to keep the additional sd dereference and flag checks out of the
> wakeup path for the more common symmetric SMT systems; sched_smt_active()
> remains enabled on those systems, the new key lets them return immediately.
>
> Without it, the additional cost should be small when everything is cache-hot
> (roughly a couple of dependent loads, flag tests and branches), but this is a
> hot path and a cache miss could make it more noticeable. I haven't measured
> whether the saving is significant, though. If the extra key and its topology
> accounting are not considered worth the potential saving, we can remove it and
> use sched_smt_active() instead.

If we start having a static key per sub part of a feature like the
asym packing, that can quickly become unmanageable. In this case we
should better have a a static key for whole asym_packing feature
instead

Vincent

>
> Thanks for looking at this!
> -Andrea
>
> >
> > Other than that looks good to me
> >
> > > +               return cpu;
> > > +
> > > +       sd = rcu_dereference_all(cpu_rq(cpu)->sd);
> > > +       if (!sd || !(sd->flags & SD_SHARE_CPUCAPACITY) ||
> > > +           !(sd->flags & SD_ASYM_PACKING))
> > > +               return cpu;
> > > +
> > > +       for_each_cpu_and(sibling, sched_domain_span(sd), p->cpus_ptr) {
> > > +               if (sibling == best || !choose_idle_cpu(sibling, p))
> > > +                       continue;
> > > +
> > > +               if (sched_asym_prefer(sibling, best))
> > > +                       best = sibling;
> > > +       }
> > > +
> > > +       return best;
> > > +}
> > > +
> > >  /*
> > >   * Scans the local SMT mask to see if the entire core is idle, and records this
> > >   * information in sd_balance_shared->has_idle_cores.
> > > @@ -8971,7 +9000,7 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
> > >
> > >         if (choose_idle_cpu(target, p) &&
> > >             asym_fits_cpu(task_util, util_min, util_max, target))
> > > -               return target;
> > > +               goto select_smt_priority;
> > >
> > >         /*
> > >          * If the previous CPU is cache affine and idle, don't be stupid:
> > > @@ -8981,8 +9010,10 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
> > >             asym_fits_cpu(task_util, util_min, util_max, prev)) {
> > >
> > >                 if (!static_branch_unlikely(&sched_cluster_active) ||
> > > -                   cpus_share_resources(prev, target))
> > > -                       return prev;
> > > +                   cpus_share_resources(prev, target)) {
> > > +                       target = prev;
> > > +                       goto select_smt_priority;
> > > +               }
> > >
> > >                 prev_aff = prev;
> > >         }
> > > @@ -9000,7 +9031,8 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
> > >             prev == smp_processor_id() &&
> > >             this_rq()->nr_running <= 1 &&
> > >             asym_fits_cpu(task_util, util_min, util_max, prev)) {
> > > -               return prev;
> > > +               target = prev;
> > > +               goto select_smt_priority;
> > >         }
> > >
> > >         /* Check a recently used CPU as a potential idle candidate: */
> > > @@ -9014,8 +9046,10 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
> > >             asym_fits_cpu(task_util, util_min, util_max, recent_used_cpu)) {
> > >
> > >                 if (!static_branch_unlikely(&sched_cluster_active) ||
> > > -                   cpus_share_resources(recent_used_cpu, target))
> > > -                       return recent_used_cpu;
> > > +                   cpus_share_resources(recent_used_cpu, target)) {
> > > +                       target = recent_used_cpu;
> > > +                       goto select_smt_priority;
> > > +               }
> > >
> > >         } else {
> > >                 recent_used_cpu = -1;
> > > @@ -9037,7 +9071,11 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
> > >                  */
> > >                 if (sd) {
> > >                         i = select_idle_capacity(p, sd, target);
> > > -                       return ((unsigned)i < nr_cpumask_bits) ? i : target;
> > > +                       if ((unsigned int)i < nr_cpumask_bits) {
> > > +                               target = i;
> > > +                               goto select_smt_priority;
> > > +                       }
> > > +                       return target;
> > >                 }
> > >         }
> > >
> > > @@ -9050,14 +9088,18 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
> > >
> > >                 if (!has_idle_core && cpus_share_cache(prev, target)) {
> > >                         i = select_idle_smt(p, sd, prev);
> > > -                       if ((unsigned int)i < nr_cpumask_bits)
> > > -                               return i;
> > > +                       if ((unsigned int)i < nr_cpumask_bits) {
> > > +                               target = i;
> > > +                               goto select_smt_priority;
> > > +                       }
> > >                 }
> > >         }
> > >
> > >         i = select_idle_cpu(p, sd, has_idle_core, target);
> > > -       if ((unsigned)i < nr_cpumask_bits)
> > > -               return i;
> > > +       if ((unsigned int)i < nr_cpumask_bits) {
> > > +               target = i;
> > > +               goto select_smt_priority;
> > > +       }
> > >
> > >         /*
> > >          * For cluster machines which have lower sharing cache like L2 or
> > > @@ -9065,12 +9107,19 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
> > >          * first. But prev_cpu or recent_used_cpu may also be a good candidate,
> > >          * use them if possible when no idle CPU found in select_idle_cpu().
> > >          */
> > > -       if ((unsigned int)prev_aff < nr_cpumask_bits)
> > > -               return prev_aff;
> > > -       if ((unsigned int)recent_used_cpu < nr_cpumask_bits)
> > > -               return recent_used_cpu;
> > > +       if ((unsigned int)prev_aff < nr_cpumask_bits) {
> > > +               target = prev_aff;
> > > +               goto select_smt_priority;
> > > +       }
> > > +       if ((unsigned int)recent_used_cpu < nr_cpumask_bits) {
> > > +               target = recent_used_cpu;
> > > +               goto select_smt_priority;
> > > +       }
> > >
> > >         return target;
> > > +
> > > +select_smt_priority:
> > > +       return select_idle_smt_cpu(p, target);
> > >  }
> > >
> > >  /**
> > > @@ -9747,8 +9796,10 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
> > >         }
> > >
> > >         /* Slow path */
> > > -       if (unlikely(sd))
> > > -               return sched_balance_find_dst_cpu(sd, p, cpu, prev_cpu, sd_flag);
> > > +       if (unlikely(sd)) {
> > > +               new_cpu = sched_balance_find_dst_cpu(sd, p, cpu, prev_cpu, sd_flag);
> > > +               return select_idle_smt_cpu(p, new_cpu);
> > > +       }
> > >
> > >         /* Fast path */
> > >         if (wake_flags & WF_TTWU)
> > > diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> > > index 6c3ad70e58b8e..568cb1ed2dd6b 100644
> > > --- a/kernel/sched/sched.h
> > > +++ b/kernel/sched/sched.h
> > > @@ -2240,6 +2240,7 @@ DECLARE_PER_CPU(struct sched_domain __rcu *, sd_asym_packing);
> > >  DECLARE_PER_CPU(struct sched_domain __rcu *, sd_asym_cpucapacity);
> > >
> > >  extern struct static_key_false sched_asym_cpucapacity;
> > > +extern struct static_key_false sched_smt_asym_packing;
> > >  extern struct static_key_false sched_cluster_active;
> > >
> > >  static __always_inline bool sched_asym_cpucap_active(void)
> > > @@ -2247,6 +2248,11 @@ static __always_inline bool sched_asym_cpucap_active(void)
> > >         return static_branch_unlikely(&sched_asym_cpucapacity);
> > >  }
> > >
> > > +static __always_inline bool sched_smt_asym_active(void)
> > > +{
> > > +       return static_branch_unlikely(&sched_smt_asym_packing);
> > > +}
> > > +
> > >  struct sched_group_capacity {
> > >         atomic_t                ref;
> > >         /*
> > > diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> > > index 0248227d983a7..06c40eb5932af 100644
> > > --- a/kernel/sched/topology.c
> > > +++ b/kernel/sched/topology.c
> > > @@ -683,8 +683,24 @@ DEFINE_PER_CPU(struct sched_domain __rcu *, sd_asym_packing);
> > >  DEFINE_PER_CPU(struct sched_domain __rcu *, sd_asym_cpucapacity);
> > >
> > >  DEFINE_STATIC_KEY_FALSE(sched_asym_cpucapacity);
> > > +DEFINE_STATIC_KEY_FALSE(sched_smt_asym_packing);
> > >  DEFINE_STATIC_KEY_FALSE(sched_cluster_active);
> > >
> > > +static bool has_asym_smt_domain(int cpu)
> > > +{
> > > +       struct sched_domain *sd;
> > > +
> > > +       for_each_domain(cpu, sd) {
> > > +               if (!(sd->flags & SD_SHARE_CPUCAPACITY))
> > > +                       break;
> > > +
> > > +               if (sd->flags & SD_ASYM_PACKING)
> > > +                       return true;
> > > +       }
> > > +
> > > +       return false;
> > > +}
> > > +
> > >  static void update_top_cache_domain(int cpu)
> > >  {
> > >         struct sched_domain_shared *sds = NULL;
> > > @@ -3084,6 +3100,7 @@ build_sched_domains(const struct cpumask *cpu_map, struct sched_domain_attr *att
> > >         struct rq *rq = NULL;
> > >         int i, ret = -ENOMEM;
> > >         bool has_asym = false;
> > > +       bool has_asym_smt = false;
> > >         bool has_cluster = false;
> > >
> > >         if (WARN_ON(cpumask_empty(cpu_map)))
> > > @@ -3202,6 +3219,9 @@ build_sched_domains(const struct cpumask *cpu_map, struct sched_domain_attr *att
> > >
> > >                 cpu_attach_domain(sd, d.rd, i);
> > >
> > > +               if (has_asym_smt_domain(i))
> > > +                       has_asym_smt = true;
> > > +
> > >                 if (lowest_flag_domain(i, SD_CLUSTER))
> > >                         has_cluster = true;
> > >         }
> > > @@ -3210,6 +3230,9 @@ build_sched_domains(const struct cpumask *cpu_map, struct sched_domain_attr *att
> > >         if (has_asym)
> > >                 static_branch_inc_cpuslocked(&sched_asym_cpucapacity);
> > >
> > > +       if (has_asym_smt)
> > > +               static_branch_inc_cpuslocked(&sched_smt_asym_packing);
> > > +
> > >         if (has_cluster)
> > >                 static_branch_inc_cpuslocked(&sched_cluster_active);
> > >
> > > @@ -3310,11 +3333,24 @@ int __init sched_init_domains(const struct cpumask *cpu_map)
> > >  static void detach_destroy_domains(const struct cpumask *cpu_map)
> > >  {
> > >         unsigned int cpu = cpumask_any(cpu_map);
> > > +       bool has_asym_smt = false;
> > >         int i;
> > >
> > > +       rcu_read_lock();
> > > +       for_each_cpu(i, cpu_map) {
> > > +               if (has_asym_smt_domain(i)) {
> > > +                       has_asym_smt = true;
> > > +                       break;
> > > +               }
> > > +       }
> > > +       rcu_read_unlock();
> > > +
> > >         if (rcu_access_pointer(per_cpu(sd_asym_cpucapacity, cpu)))
> > >                 static_branch_dec_cpuslocked(&sched_asym_cpucapacity);
> > >
> > > +       if (has_asym_smt)
> > > +               static_branch_dec_cpuslocked(&sched_smt_asym_packing);
> > > +
> > >         if (static_branch_unlikely(&sched_cluster_active))
> > >                 static_branch_dec_cpuslocked(&sched_cluster_active);
> > >
> > > --
> > > 2.55.0
> > >
