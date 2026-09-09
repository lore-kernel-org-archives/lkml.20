Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C48569F3C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964979; cv=pass; b=BTCRSNWPpjmvXCTMESLd5AFzLA7RhD1pLg+k7P3zJLZAaqVOiPdjrUPmex7Blbgv38EHNeCkAA9BRCzgzUrJILKykUhbfT/fEfb6zGHpj1wqaQIo8U0u/6p9ldfo2MLnP26oqygMQH8QX7kTTz1b6pWekB8SOi+096+Fe4fYG5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964979; c=relaxed/simple;
	bh=60CfKjl1SjfXLPoCq7yLyVRe9jSTj9TBF6BRBtHNxA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GqVFMAG3oKidPMliCrRsEaitQR7ohIdw7q2GUHkSfkTg4BeYkSa1KhqeS99tqXj3BJp7SBZlCYeFhxE9Gh6tcR4NmDE3teZEKr9wfElOyaY/LKNk9COF04dpeZLthdt8h1rdC6qTpmv4u1nwSu8f9NBIvNG3cApZ3OXiVudafQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tRd+kdlO; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tRd+kdlO"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c262204cc80so681618466b.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:42:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788964976; cv=none;
        d=google.com; s=arc-20260327;
        b=l+8NZogyin/LaU8qVBUQpH4z6b8Iz7eK4lI2j5nfWHZLqsLUkqNqKRIcJ0Qhpv+G1V
         0BL7XhA9MMYeb/Pg0PIOXo4LR01OxlL10qBqlSFM5+Vk2D6v9wojBv+lZIvyKzbB2PAK
         CAp6RVpL8jznHYS+ZwW8hDC99ceoe+I6CYAKjApEBBBS2taOHrqmzUM+GAJaIYO+A37g
         5LoYPKU/WQayJZ6TEB3G3ghzwL09PJY+d1bGWPOAqy2RN/XSWpLgjY3rMqQY0S+hJY6N
         V5PEHhBLe4ARZQZ0bFlSZu2eG6GQL8UPTXSzkffpGv9+doNdBUeE4/EWOZsHmSC1nCo8
         W0Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zX6oE4JMTzNjx3EDIF+YBoN0OI0vIMt2+Gqe1CNAmzU=;
        fh=h4RZEUbKy4+EFP4bmr29xYAsZYv2nfFqcK9HbJcbI3I=;
        b=p/GaihUk5RRL1RYjZHZKnATU/rI9jRcH2M1EAzulNZlhRBDlIc63E8aE4IaScnkfav
         rcnrmZjgRYURVi6hL8hTP8LTLgIe24sdLQN+A+lUkt30k1O/rHGEr8TGI7WbMa6b7X+E
         c41TdraVBPMt2mFr94xwln2pEhySIvCDRqcQ7aS34tJka5pqTCqsr5ZDe612IUEaGO1S
         FAZiuZ89JCFQNQlbAhvJkaKk0dRoSndpp12TDRRGuMtpOjWTEyJM0f3rMeHJ+fEvtX1p
         73EXm8vUNTCWnRamyDdkOwU3jLLmQ0w8Y3wDOLl6dX+Dq8dB1ixmimM+PoS7Yw55NH+v
         K7eA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788964976; x=1789569776; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zX6oE4JMTzNjx3EDIF+YBoN0OI0vIMt2+Gqe1CNAmzU=;
        b=tRd+kdlOEjHoWCIvCGttvh5Y/WJ87v3LrXhBQxiUm2WGGbgrRnKvFYaxyOc5N2oQSx
         kuIqz2eUGJe/JIvGc/DmZIBdiYHQRzclNjOapWECDcEQzK0Gh5TOVHYhBgrO4Qk0HKAd
         IZlWluCgybFmlfwmxjYB9TXu+5FfpBvrWuRt6/yieNSO71z7qfEEuidFlLa3cf2/ZGa+
         o1MI83ILiQzO/5cja1v3AOlVfblFOyoX7IkbC5QnTurpaDFqP9hW0qPYAg6xl3D78/hj
         bLk8Wb5+PXkzTrJSgDRJG9UXSFFku4IgxdDaxU2R9ZFWjqPx33F3i4GYSRUilVdkStS2
         vmTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788964976; x=1789569776;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zX6oE4JMTzNjx3EDIF+YBoN0OI0vIMt2+Gqe1CNAmzU=;
        b=W4mbl/OVpIgI7B1fPKYhu68eOIh97WpygoMXzYgAw2v8qULficqcPtnhbH1kMpdeZS
         bBFug9dbWsAkrC4dukSFUQ+XGALqJaDPDmbUNGW5LVBy9NB70Oq/BxO7IMTu12gYcxHe
         dMrsQOdzn/nNTSlXJA3EH+56u9cca1NsfRU2OonT7Jg9dtZZT8mD4Z0kgpTjHB/Zzp8x
         Z3ysylKkww17134WfABF2q0Sg7dB3l2iXzOWqiOkrSz/AhRtjet0BLb6d/uQpQ4vW+nu
         trYmlsRBMlX077NxgXbxyFOdndKqpf2GXUdEcRKXuB7x5s17FMTFZpD8CHhEN1/e4t1h
         wn6w==
X-Forwarded-Encrypted: i=1; AKwUvBzn6MQQfgbbClai/5oPbaziNJYwhSTKqvrKmdzDnovHAA5aERwcjC7av/WLhfplICuY3vj2LQn6q3CTH+s=@vger.kernel.org
X-Gm-Message-State: AFuF++nbCX7sJb2WRBiER9UcoLLOGqVyedMQkkL34VIZ48jyHEAlcubJ
	DPdr48e+6SYEHC2s5Go5aIV9oSns5grT+NDflHRvjqhLuDK9rd7UV2xyULQLhHgupZYMEYsHFb4
	HAAcM4C2aWgMCenh72D/E42nSe6Hzv4OEl+D+Ez6xSw==
X-Gm-Gg: AYBFou3f2bIsFeKnnVSMOfB6smPUv0JJKLRuJxuKSJUIQPACgVO4/EmGlKV9HL5nQlp
	pepcQA2VdueJPX81aVtJMKu+vJF5H/z9p9PcRxGwS8ER56XmZSMaIthuj7PnskFB71DLxEPx4at
	QmSW7FJ40/1qA3FtwIhhsZ0qHkMCAnSJQrAVUlqIHrr/zSGHbTkIZA2e0prJs5trAMthBZmxa6u
	/1pa84LI5pmC50oKE9CY9Z7elk/iH2RKdiVLbzsoFsz+YYITk9/72ZbS7/idqJpkuIk0aldrNA2
	eHVG4TJvFeFs1ODCFNKcv1hRILctX+ejFzhuT+P25bYYrymzKIoR1kDP15bhRNWHCnJiTESlAUu
	cc8uwvJBIcAIg
X-Received: by 2002:a17:907:805:b0:c25:2c70:50ed with SMTP id
 a640c23a62f3a-c260c6ab6c4mr1433834966b.5.1788964975840; Wed, 09 Sep 2026
 07:42:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908082345.103087-1-arighi@nvidia.com> <20260908082345.103087-3-arighi@nvidia.com>
In-Reply-To: <20260908082345.103087-3-arighi@nvidia.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 9 Sep 2026 16:42:44 +0200
X-Gm-Features: AcwNN1WUvcq4choY-C1_blVRgCRrlhEispGupqnG6SrJ3Mcc_nmksOnFuJ0lc98
Message-ID: <CAKfTPtAQh6ZndkHC+njYvX0hoDafaC+PX2EBfafDumTHvvgFcg@mail.gmail.com>
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

On Tue, 8 Sept 2026 at 10:24, Andrea Righi <arighi@nvidia.com> wrote:
>
> POWER7 and NVIDIA Olympus use SD_ASYM_PACKING at the shared-capacity SMT
> level to order hardware threads. Idle CPU selection does not consult
> that order, so a task can wake on an arbitrary sibling and remain there
> until load balancing corrects the placement. On these systems, that
> initial choice can prevent the core from entering its preferred
> lower-thread resource mode and cause a large and persistent performance
> loss.
>
> When idle selection finds an available CPU in an SMT core, choose the
> highest-priority available sibling. On SMT2 Olympus this only changes
> selection on fully idle cores. A partially idle core has only one
> available CPU. On wider SMT systems such as POWER7, it also fills
> available siblings in priority order while the core is partially busy.
>
> Apply the preference to idle-core and idle-CPU scans,
> asymmetric-capacity scans, target, previous, recently-used CPU fast
> paths and the slow path. Inspect the lowest scheduling domain directly,
> but require both CPUs to share its span because isolcpus can split
> hardware siblings across scheduling domains.
>
> Keep physical-core capacity selection independent from SMT sibling
> ordering. SD_ASYM_CPUCAPACITY first selects among cores with different
> maximum capacities, then SD_ASYM_PACKING selects the preferred available
> sibling inside the chosen core, whose siblings continue to share equal
> capacity.
>
> Reviewed-by: Srikar Dronamraju <srikar@linux.ibm.com>
> Signed-off-by: Andrea Righi <arighi@nvidia.com>
> ---
>  kernel/sched/fair.c     | 85 ++++++++++++++++++++++++++++++++---------
>  kernel/sched/sched.h    |  6 +++
>  kernel/sched/topology.c | 36 +++++++++++++++++
>  3 files changed, 110 insertions(+), 17 deletions(-)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index b8bd308c2d5b1..37837c36288a0 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -8587,6 +8587,35 @@ static inline bool test_idle_cores(int cpu)
>         return false;
>  }
>
> +/*
> + * Redirect a CPU to a higher-priority available sibling in its SMT domain,
> + * subject to task affinity.
> + */
> +static inline int select_idle_smt_cpu(struct task_struct *p, int cpu)
> +{
> +       struct sched_domain *sd;
> +       int best = cpu;
> +       int sibling;
> +
> +       if (!sched_smt_asym_active())

I wonder if it's worth creating a new static key. All other pieces
related to asym packing use sched_smt_active() to opt out the related
code

Other than that looks good to me

> +               return cpu;
> +
> +       sd = rcu_dereference_all(cpu_rq(cpu)->sd);
> +       if (!sd || !(sd->flags & SD_SHARE_CPUCAPACITY) ||
> +           !(sd->flags & SD_ASYM_PACKING))
> +               return cpu;
> +
> +       for_each_cpu_and(sibling, sched_domain_span(sd), p->cpus_ptr) {
> +               if (sibling == best || !choose_idle_cpu(sibling, p))
> +                       continue;
> +
> +               if (sched_asym_prefer(sibling, best))
> +                       best = sibling;
> +       }
> +
> +       return best;
> +}
> +
>  /*
>   * Scans the local SMT mask to see if the entire core is idle, and records this
>   * information in sd_balance_shared->has_idle_cores.
> @@ -8971,7 +9000,7 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>
>         if (choose_idle_cpu(target, p) &&
>             asym_fits_cpu(task_util, util_min, util_max, target))
> -               return target;
> +               goto select_smt_priority;
>
>         /*
>          * If the previous CPU is cache affine and idle, don't be stupid:
> @@ -8981,8 +9010,10 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>             asym_fits_cpu(task_util, util_min, util_max, prev)) {
>
>                 if (!static_branch_unlikely(&sched_cluster_active) ||
> -                   cpus_share_resources(prev, target))
> -                       return prev;
> +                   cpus_share_resources(prev, target)) {
> +                       target = prev;
> +                       goto select_smt_priority;
> +               }
>
>                 prev_aff = prev;
>         }
> @@ -9000,7 +9031,8 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>             prev == smp_processor_id() &&
>             this_rq()->nr_running <= 1 &&
>             asym_fits_cpu(task_util, util_min, util_max, prev)) {
> -               return prev;
> +               target = prev;
> +               goto select_smt_priority;
>         }
>
>         /* Check a recently used CPU as a potential idle candidate: */
> @@ -9014,8 +9046,10 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>             asym_fits_cpu(task_util, util_min, util_max, recent_used_cpu)) {
>
>                 if (!static_branch_unlikely(&sched_cluster_active) ||
> -                   cpus_share_resources(recent_used_cpu, target))
> -                       return recent_used_cpu;
> +                   cpus_share_resources(recent_used_cpu, target)) {
> +                       target = recent_used_cpu;
> +                       goto select_smt_priority;
> +               }
>
>         } else {
>                 recent_used_cpu = -1;
> @@ -9037,7 +9071,11 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>                  */
>                 if (sd) {
>                         i = select_idle_capacity(p, sd, target);
> -                       return ((unsigned)i < nr_cpumask_bits) ? i : target;
> +                       if ((unsigned int)i < nr_cpumask_bits) {
> +                               target = i;
> +                               goto select_smt_priority;
> +                       }
> +                       return target;
>                 }
>         }
>
> @@ -9050,14 +9088,18 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>
>                 if (!has_idle_core && cpus_share_cache(prev, target)) {
>                         i = select_idle_smt(p, sd, prev);
> -                       if ((unsigned int)i < nr_cpumask_bits)
> -                               return i;
> +                       if ((unsigned int)i < nr_cpumask_bits) {
> +                               target = i;
> +                               goto select_smt_priority;
> +                       }
>                 }
>         }
>
>         i = select_idle_cpu(p, sd, has_idle_core, target);
> -       if ((unsigned)i < nr_cpumask_bits)
> -               return i;
> +       if ((unsigned int)i < nr_cpumask_bits) {
> +               target = i;
> +               goto select_smt_priority;
> +       }
>
>         /*
>          * For cluster machines which have lower sharing cache like L2 or
> @@ -9065,12 +9107,19 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>          * first. But prev_cpu or recent_used_cpu may also be a good candidate,
>          * use them if possible when no idle CPU found in select_idle_cpu().
>          */
> -       if ((unsigned int)prev_aff < nr_cpumask_bits)
> -               return prev_aff;
> -       if ((unsigned int)recent_used_cpu < nr_cpumask_bits)
> -               return recent_used_cpu;
> +       if ((unsigned int)prev_aff < nr_cpumask_bits) {
> +               target = prev_aff;
> +               goto select_smt_priority;
> +       }
> +       if ((unsigned int)recent_used_cpu < nr_cpumask_bits) {
> +               target = recent_used_cpu;
> +               goto select_smt_priority;
> +       }
>
>         return target;
> +
> +select_smt_priority:
> +       return select_idle_smt_cpu(p, target);
>  }
>
>  /**
> @@ -9747,8 +9796,10 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>         }
>
>         /* Slow path */
> -       if (unlikely(sd))
> -               return sched_balance_find_dst_cpu(sd, p, cpu, prev_cpu, sd_flag);
> +       if (unlikely(sd)) {
> +               new_cpu = sched_balance_find_dst_cpu(sd, p, cpu, prev_cpu, sd_flag);
> +               return select_idle_smt_cpu(p, new_cpu);
> +       }
>
>         /* Fast path */
>         if (wake_flags & WF_TTWU)
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 6c3ad70e58b8e..568cb1ed2dd6b 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -2240,6 +2240,7 @@ DECLARE_PER_CPU(struct sched_domain __rcu *, sd_asym_packing);
>  DECLARE_PER_CPU(struct sched_domain __rcu *, sd_asym_cpucapacity);
>
>  extern struct static_key_false sched_asym_cpucapacity;
> +extern struct static_key_false sched_smt_asym_packing;
>  extern struct static_key_false sched_cluster_active;
>
>  static __always_inline bool sched_asym_cpucap_active(void)
> @@ -2247,6 +2248,11 @@ static __always_inline bool sched_asym_cpucap_active(void)
>         return static_branch_unlikely(&sched_asym_cpucapacity);
>  }
>
> +static __always_inline bool sched_smt_asym_active(void)
> +{
> +       return static_branch_unlikely(&sched_smt_asym_packing);
> +}
> +
>  struct sched_group_capacity {
>         atomic_t                ref;
>         /*
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index 0248227d983a7..06c40eb5932af 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -683,8 +683,24 @@ DEFINE_PER_CPU(struct sched_domain __rcu *, sd_asym_packing);
>  DEFINE_PER_CPU(struct sched_domain __rcu *, sd_asym_cpucapacity);
>
>  DEFINE_STATIC_KEY_FALSE(sched_asym_cpucapacity);
> +DEFINE_STATIC_KEY_FALSE(sched_smt_asym_packing);
>  DEFINE_STATIC_KEY_FALSE(sched_cluster_active);
>
> +static bool has_asym_smt_domain(int cpu)
> +{
> +       struct sched_domain *sd;
> +
> +       for_each_domain(cpu, sd) {
> +               if (!(sd->flags & SD_SHARE_CPUCAPACITY))
> +                       break;
> +
> +               if (sd->flags & SD_ASYM_PACKING)
> +                       return true;
> +       }
> +
> +       return false;
> +}
> +
>  static void update_top_cache_domain(int cpu)
>  {
>         struct sched_domain_shared *sds = NULL;
> @@ -3084,6 +3100,7 @@ build_sched_domains(const struct cpumask *cpu_map, struct sched_domain_attr *att
>         struct rq *rq = NULL;
>         int i, ret = -ENOMEM;
>         bool has_asym = false;
> +       bool has_asym_smt = false;
>         bool has_cluster = false;
>
>         if (WARN_ON(cpumask_empty(cpu_map)))
> @@ -3202,6 +3219,9 @@ build_sched_domains(const struct cpumask *cpu_map, struct sched_domain_attr *att
>
>                 cpu_attach_domain(sd, d.rd, i);
>
> +               if (has_asym_smt_domain(i))
> +                       has_asym_smt = true;
> +
>                 if (lowest_flag_domain(i, SD_CLUSTER))
>                         has_cluster = true;
>         }
> @@ -3210,6 +3230,9 @@ build_sched_domains(const struct cpumask *cpu_map, struct sched_domain_attr *att
>         if (has_asym)
>                 static_branch_inc_cpuslocked(&sched_asym_cpucapacity);
>
> +       if (has_asym_smt)
> +               static_branch_inc_cpuslocked(&sched_smt_asym_packing);
> +
>         if (has_cluster)
>                 static_branch_inc_cpuslocked(&sched_cluster_active);
>
> @@ -3310,11 +3333,24 @@ int __init sched_init_domains(const struct cpumask *cpu_map)
>  static void detach_destroy_domains(const struct cpumask *cpu_map)
>  {
>         unsigned int cpu = cpumask_any(cpu_map);
> +       bool has_asym_smt = false;
>         int i;
>
> +       rcu_read_lock();
> +       for_each_cpu(i, cpu_map) {
> +               if (has_asym_smt_domain(i)) {
> +                       has_asym_smt = true;
> +                       break;
> +               }
> +       }
> +       rcu_read_unlock();
> +
>         if (rcu_access_pointer(per_cpu(sd_asym_cpucapacity, cpu)))
>                 static_branch_dec_cpuslocked(&sched_asym_cpucapacity);
>
> +       if (has_asym_smt)
> +               static_branch_dec_cpuslocked(&sched_smt_asym_packing);
> +
>         if (static_branch_unlikely(&sched_cluster_active))
>                 static_branch_dec_cpuslocked(&sched_cluster_active);
>
> --
> 2.55.0
>
