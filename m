Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E353112B2
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787813675; cv=pass; b=iwlXgS08CX3gzKlIh3sEO9CjGF2sw+8AQg9sDLmXsCHQTK9oQAOsYrHaqAT7THl5zAmpYz8bcn37NYwBowfsWnQz/cHldgOySHYYpDL8t79bJfOAn2LCH3uVIosae7v/ZP9iUxAkfRn+zga0V/GGehUGr2/PhSB8nBCfSHLcUJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787813675; c=relaxed/simple;
	bh=+IPCu3SD+HuYtxPkJxlXvwtdttZnUbuuCVagRQnYVa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hSyuv6JRwkkXP28u331vyDrSPaRXDwEwU2FqqXPRRunMY10J2KSO36IHzgI/1E1smo7e+uUtdfQh2juRTrYRP4xe0Azk8Gp9umTLriG7IuErcB++OT8YGbdGv5VPGBjm4+rTupYkYixne3YZwwL4Dox2cUh/1F+eTll615RE1aw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nD3oQbcm; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nD3oQbcm"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a0de062db5so3176005a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:54:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787813671; cv=none;
        d=google.com; s=arc-20260327;
        b=T2iojjte4iWxS1rH5kKz2sDLC203D4zga3k6UcyUiD5SmCXLa6abVP4sTuCpPLIpIq
         EnThKNjxRERqa5NUBXqmb07Rg705ndCaIidGLvBJcW7n28yolawWAUs+5gkdBQBpG2ec
         iyB3gwNDUTIQmZ8wx1/VnB4BY8Yvl6Q+cyTUozSJy2/XPKmxVJUztXDwAL8aNQFBOxHg
         JT9qQNKxBBQkG89+onqw/KqNAF0sLPC+PmgV5aUShhe6P+jy/PQvqaLnGo4X+SFvmSa7
         BMLPQ6GyaiYHSHPf2QavBsHAh4lQzJJKIUxRXB+iGu3VfezdiFiFGJ0Xba7HTcy/T8Qf
         Dk4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=R+2FiSa9xRitquYqpzhJyaruYhaN5lznJ4YR/YEXapE=;
        fh=q+lD8Mx662FJyn75Z/mIATGH/Snv2BiPQtHnYjPINc8=;
        b=I9FY2eMFomJM6E7JL8A+XmW9yIgi+MnVsI80LehCfvRRkB+CMTDyhZpLwGB8ksi//C
         iRL32NznL7qoTFcyMsQsj0p07Xq1ksMTOpw7LvQMu3U0reTKwb8+dKdF6QLRYzcd+uVJ
         ssRfvEziqa1zNB9hF2Jl4R2T/J9IXo/DCjbUbk+T6bUZcG9fM+h6X+MxtIW8o7WR+QTT
         2iYJE+nAFT39zk+sFZdwGPxIt7EgTJZQv3Uv7Lf0EtFZtpYvVNVII1lYd9VM9sVLQm88
         c7fW8+Gu9heYs9a8x4s4lQ6BI26ULRuGIZDb9emDgdNswSurk2YWJcVdzc77RTBOjiZD
         +jhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787813671; x=1788418471; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R+2FiSa9xRitquYqpzhJyaruYhaN5lznJ4YR/YEXapE=;
        b=nD3oQbcmTY6uCBzeq6IS15ZMTiKtc3fz2yyoWGepWmdsXIE9C8ta47CKzwBJbyULmU
         SdabA+MjdlQpHk7DUZdMFvaSflFFOF3iquHQzhPWDNhQp69NuU2+tu39rt1vdOGmIKEJ
         gmbr/hu7BcVxXcAkp14/bryRhiVZfvWaIjt339fLWAMwbyVI44DNJVaAOQTZv896pKXl
         vja/yt3CPvx2d/BShFX6UEyuRVThkDkPX9Pq7ngRw2X2GPpoTsvzvWILOlVWqYtV2YmN
         e//LAaOllr1fQMktdZnTHa+T7jWKdMuWYY5Tu9VgDJDucjlJZV257hHqMC3ZuYn89TKO
         eucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787813671; x=1788418471;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R+2FiSa9xRitquYqpzhJyaruYhaN5lznJ4YR/YEXapE=;
        b=QDK6KGnJu8X2tUcW+yxmNnxikImowCt2xwJJi7Y6iWdK0QDtVOw29SibAcGv0UQ0ao
         pIY1AYsnXIpuu3/wfN83YBMRah6YLt1r7EVtS0VBNRJWLDCF2T+/VyurdLWs+tlZTwcv
         bCyE4MHNFAvY2YXyHkwJDnP/pWoCtph4OLAnkbVYD08D8sKimw/0jF+0ukzWn+uXu1ou
         l4voW0nTnKAS8+VUgPIRfCT0BCL5Lfx7IleyxhcakNcEKWzcfbWxfZNiNbNyqowQsXNt
         HV97Vir/g6bWLpIf1dI7WIDfthYNCCwprbVg6FGGGy3zkmIA/3oYb9qnj13TNonIPrHv
         G1AA==
X-Forwarded-Encrypted: i=1; AHgh+RoaBsNFoyJYOvxgT/C1KmfLfkssQoW1sCgvfYxutGI6NIVTe7tRnn/1lwYQF2OUPcEEY5eUdYtkgugJAO8=@vger.kernel.org
X-Gm-Message-State: AFuF++kDpZefO5j7zSqpF63O3j0loVP5XG0P0Ov7hlFqt2XJAHKI/2XC
	mJ7Aik6DxVjSShmMw3Di2JEnJ4RSR3Z12WN8JXr1sQ+Lgj3/Nzu0Eour6Sb+4tkBAU5NuPm6832
	h2Pcd/ynAMS6ZpTOkiOwtQ2NSUsDyH1U/pHDHDPYTVw==
X-Gm-Gg: AR+sD13oYbGn+h8hDfG80HJbcEKdq0vDk6qaUvS181e/LCHzLcAIVUL0zwJGSoqF9mp
	lq9M8qhU4BoHcMiO3WBX3P21Un8M/LogVrc3YQbSjJypjmAAVuoZOJ4LSZAVBWWNpsbzZiqFMnY
	tL1QZDEtEV67ttK/EbKT0qKWFPFE9sL5wSXRnmYO68bCcYizbPS05MP9zlDlYY0vEOrGdAJ4A39
	VV5VbMsmQDOCsibOKsIJmedJjCt9Gyrh/txpzs+04H214dz/pN7A+WG1cLTPG0vL0wVXqTUXC8M
	KUKCQE+QHIGeorgjGW9DkiDAPoAv5JCotvKh7oCn2BOSJCayhQkdB2cbyK0zMus1KxV7ZAyKvUF
	8oQ==
X-Received: by 2002:a17:907:9626:b0:c25:3c0a:99fa with SMTP id
 a640c23a62f3a-c253c0aabb3mr199423066b.13.1787813670715; Wed, 26 Aug 2026
 23:54:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826224238.936456-1-atomlin@atomlin.com> <20260826224238.936456-2-atomlin@atomlin.com>
In-Reply-To: <20260826224238.936456-2-atomlin@atomlin.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 27 Aug 2026 08:54:18 +0200
X-Gm-Features: AcwNN1WFlyHNEOl8aue9WCRxHTUnjFSG7UN1Htm9zHLPmz_tj6w294Tvsv8SE0M
Message-ID: <CAKfTPtACUPezTdiJKUW8zdb0NoURZU2Of+AnMU5VvzXE0tmB2g@mail.gmail.com>
Subject: Re: [PATCH v7 1/6] sched: Annotate rq->rd with __rcu and update
 lockless readers
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	paulmck@kernel.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, zhanxusheng1024@gmail.com, neelx@suse.com, 
	chjohnst@mail.com, mproche@mail.com, sean@ashe.io, steve@abita.co, 
	rishil1999@outlook.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Aug 2026 at 00:42, Aaron Tomlin <atomlin@atomlin.com> wrote:
>
> The root_domain pointer rd field in struct rq is updated dynamically
> using RCU, and its memory reclamation is deferred via call_rcu() in
> rq_attach_root(). However, struct rq's rd field was missing the __rcu
> compiler annotation, and several lockless readers across the scheduler
> subsystem accessed rq->rd directly without using RCU dereference
> primitives.
>
> Add the __rcu annotation to struct rq's rd field in kernel/sched/sched.h.
> Update lockless readers across kernel/sched/ to use rcu_dereference(),
> rcu_dereference_sched() or rcu_access_pointer() appropriately. This
> ensures proper data-dependency barriers on all architectures, enables
> Sparse static analysis validation, and documents RCU read-side ownership
> contracts.
>
> Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
> ---
>  kernel/sched/core.c     | 24 ++++++++++-----
>  kernel/sched/deadline.c | 67 +++++++++++++++++++++++------------------
>  kernel/sched/fair.c     | 29 +++++++++---------
>  kernel/sched/rt.c       | 64 ++++++++++++++++++++++-----------------
>  kernel/sched/sched.h    |  2 +-
>  kernel/sched/topology.c | 11 ++++---
>  6 files changed, 113 insertions(+), 84 deletions(-)
>
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 2e7cde033a31..86de58f5825b 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -8547,8 +8547,10 @@ void set_rq_online(struct rq *rq)
>  {
>         if (!rq->online) {
>                 const struct sched_class *class;
> +               struct root_domain *rd;
>
> -               cpumask_set_cpu(rq->cpu, rq->rd->online);
> +               rd = rcu_dereference_protected(rq->rd, lockdep_is_held(&rq->__lock));
> +               cpumask_set_cpu(rq->cpu, rd->online);
>                 rq->online = 1;
>
>                 for_each_class(class) {
> @@ -8562,6 +8564,7 @@ void set_rq_offline(struct rq *rq)
>  {
>         if (rq->online) {
>                 const struct sched_class *class;
> +               struct root_domain *rd;
>
>                 update_rq_clock(rq);
>                 for_each_class(class) {
> @@ -8569,7 +8572,8 @@ void set_rq_offline(struct rq *rq)
>                                 class->rq_offline(rq);
>                 }
>
> -               cpumask_clear_cpu(rq->cpu, rq->rd->online);
> +               rd = rcu_dereference_protected(rq->rd, lockdep_is_held(&rq->__lock));
> +               cpumask_clear_cpu(rq->cpu, rd->online);
>                 rq->online = 0;
>         }
>  }
> @@ -8577,10 +8581,12 @@ void set_rq_offline(struct rq *rq)
>  static inline void sched_set_rq_online(struct rq *rq, int cpu)
>  {
>         struct rq_flags rf;
> +       struct root_domain *rd;
>
>         rq_lock_irqsave(rq, &rf);
> -       if (rq->rd) {
> -               BUG_ON(!cpumask_test_cpu(cpu, rq->rd->span));
> +       rd = rcu_dereference_protected(rq->rd, lockdep_is_held(&rq->__lock));
> +       if (rd) {
> +               BUG_ON(!cpumask_test_cpu(cpu, rd->span));
>                 set_rq_online(rq);
>         }
>         rq_unlock_irqrestore(rq, &rf);
> @@ -8589,10 +8595,12 @@ static inline void sched_set_rq_online(struct rq *rq, int cpu)
>  static inline void sched_set_rq_offline(struct rq *rq, int cpu)
>  {
>         struct rq_flags rf;
> +       struct root_domain *rd;
>
>         rq_lock_irqsave(rq, &rf);
> -       if (rq->rd) {
> -               BUG_ON(!cpumask_test_cpu(cpu, rq->rd->span));
> +       rd = rcu_dereference_protected(rq->rd, lockdep_is_held(&rq->__lock));
> +       if (rd) {
> +               BUG_ON(!cpumask_test_cpu(cpu, rd->span));
>                 set_rq_offline(rq);
>         }
>         rq_unlock_irqrestore(rq, &rf);
> @@ -9009,8 +9017,8 @@ void __init sched_init(void)
>  #endif
>                 rq->next_class = &idle_sched_class;
>
> -               rq->sd = NULL;
> -               rq->rd = NULL;
> +               RCU_INIT_POINTER(rq->sd, NULL);
> +               RCU_INIT_POINTER(rq->rd, NULL);
>                 rq->cpu_capacity = SCHED_CAPACITY_SCALE;
>                 rq->balance_callback = &balance_push_callback;
>                 rq->active_balance = 0;
> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index 857dbe3519a8..026d8b499dcf 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -122,12 +122,12 @@ static inline struct dl_bw *dl_bw_of(int i)
>  {
>         RCU_LOCKDEP_WARN(!rcu_read_lock_sched_held(),
>                          "sched RCU must be held");
> -       return &cpu_rq(i)->rd->dl_bw;
> +       return &rcu_dereference_sched(cpu_rq(i)->rd)->dl_bw;
>  }
>
>  static inline int dl_bw_cpus(int i)
>  {
> -       struct root_domain *rd = cpu_rq(i)->rd;
> +       struct root_domain *rd = rcu_dereference_sched(cpu_rq(i)->rd);
>
>         RCU_LOCKDEP_WARN(!rcu_read_lock_sched_held(),
>                          "sched RCU must be held");
> @@ -159,13 +159,13 @@ static inline unsigned long dl_bw_capacity(int i)
>                 RCU_LOCKDEP_WARN(!rcu_read_lock_sched_held(),
>                                  "sched RCU must be held");
>
> -               return __dl_bw_capacity(cpu_rq(i)->rd->span);
> +               return __dl_bw_capacity(rcu_dereference_sched(cpu_rq(i)->rd)->span);
>         }
>  }
>
>  bool dl_bw_visited(int cpu, u64 cookie)
>  {
> -       struct root_domain *rd = cpu_rq(cpu)->rd;
> +       struct root_domain *rd = rcu_dereference_sched(cpu_rq(cpu)->rd);
>
>         if (rd->visit_cookie == cookie)
>                 return true;
> @@ -533,15 +533,18 @@ void init_dl_rq(struct dl_rq *dl_rq)
>
>  static inline int dl_overloaded(struct rq *rq)
>  {
> -       return atomic_read(&rq->rd->dlo_count);
> +       return atomic_read(&rcu_dereference_sched(rq->rd)->dlo_count);
>  }
>
>  static inline void dl_set_overload(struct rq *rq)
>  {
> +       struct root_domain *rd;
> +
>         if (!rq->online)
>                 return;
>
> -       cpumask_set_cpu(rq->cpu, rq->rd->dlo_mask);
> +       rd = rcu_dereference_sched(rq->rd);
> +       cpumask_set_cpu(rq->cpu, rd->dlo_mask);
>         /*
>          * Must be visible before the overload count is
>          * set (as in sched_rt.c).
> @@ -549,16 +552,19 @@ static inline void dl_set_overload(struct rq *rq)
>          * Matched by the barrier in pull_dl_task().
>          */
>         smp_wmb();
> -       atomic_inc(&rq->rd->dlo_count);
> +       atomic_inc(&rd->dlo_count);
>  }
>
>  static inline void dl_clear_overload(struct rq *rq)
>  {
> +       struct root_domain *rd;
> +
>         if (!rq->online)
>                 return;
>
> -       atomic_dec(&rq->rd->dlo_count);
> -       cpumask_clear_cpu(rq->cpu, rq->rd->dlo_mask);
> +       rd = rcu_dereference_sched(rq->rd);
> +       atomic_dec(&rd->dlo_count);
> +       cpumask_clear_cpu(rq->cpu, rd->dlo_mask);
>  }
>
>  #define __node_2_pdl(node) \
> @@ -699,14 +705,14 @@ static struct rq *dl_task_offline_migration(struct rq *rq, struct task_struct *p
>          * since p is still hanging out in the old (now moved to default) root
>          * domain.
>          */
> -       dl_b = &rq->rd->dl_bw;
> +       dl_b = &rcu_dereference_sched(rq->rd)->dl_bw;
>         raw_spin_lock(&dl_b->lock);
> -       __dl_sub(dl_b, p->dl.dl_bw, cpumask_weight(rq->rd->span));
> +       __dl_sub(dl_b, p->dl.dl_bw, cpumask_weight(rcu_dereference_sched(rq->rd)->span));
>         raw_spin_unlock(&dl_b->lock);
>
> -       dl_b = &later_rq->rd->dl_bw;
> +       dl_b = &rcu_dereference_sched(later_rq->rd)->dl_bw;
>         raw_spin_lock(&dl_b->lock);
> -       __dl_add(dl_b, p->dl.dl_bw, cpumask_weight(later_rq->rd->span));
> +       __dl_add(dl_b, p->dl.dl_bw, cpumask_weight(rcu_dereference_sched(later_rq->rd)->span));
>         raw_spin_unlock(&dl_b->lock);
>
>         set_task_cpu(p, later_rq->cpu);
> @@ -2222,9 +2228,9 @@ static void inc_dl_deadline(struct dl_rq *dl_rq, u64 deadline)
>         if (dl_rq->earliest_dl.curr == 0 ||
>             dl_time_before(deadline, dl_rq->earliest_dl.curr)) {
>                 if (dl_rq->earliest_dl.curr == 0)
> -                       cpupri_set(&rq->rd->cpupri, rq->cpu, CPUPRI_HIGHER);
> +                       cpupri_set(&rcu_dereference_sched(rq->rd)->cpupri, rq->cpu, CPUPRI_HIGHER);
>                 dl_rq->earliest_dl.curr = deadline;
> -               cpudl_set(&rq->rd->cpudl, rq->cpu, deadline);
> +               cpudl_set(&rcu_dereference_sched(rq->rd)->cpudl, rq->cpu, deadline);
>         }
>  }
>
> @@ -2239,14 +2245,15 @@ static void dec_dl_deadline(struct dl_rq *dl_rq, u64 deadline)
>         if (!dl_rq->dl_nr_running) {
>                 dl_rq->earliest_dl.curr = 0;
>                 dl_rq->earliest_dl.next = 0;
> -               cpudl_clear(&rq->rd->cpudl, rq->cpu, rq->online);
> -               cpupri_set(&rq->rd->cpupri, rq->cpu, rq->rt.highest_prio.curr);
> +               cpudl_clear(&rcu_dereference_sched(rq->rd)->cpudl, rq->cpu, rq->online);
> +               cpupri_set(&rcu_dereference_sched(rq->rd)->cpupri, rq->cpu,
> +                          rq->rt.highest_prio.curr);
>         } else {
>                 struct rb_node *leftmost = rb_first_cached(&dl_rq->root);
>                 struct sched_dl_entity *entry = __node_2_dle(leftmost);
>
>                 dl_rq->earliest_dl.curr = entry->deadline;
> -               cpudl_set(&rq->rd->cpudl, rq->cpu, entry->deadline);
> +               cpudl_set(&rcu_dereference_sched(rq->rd)->cpudl, rq->cpu, entry->deadline);
>         }
>  }
>
> @@ -2686,12 +2693,14 @@ static void migrate_task_rq_dl(struct task_struct *p, int new_cpu __maybe_unused
>
>  static void check_preempt_equal_dl(struct rq *rq, struct task_struct *p)
>  {
> +       struct root_domain *rd = rcu_dereference_sched(rq->rd);
> +
>         /*
>          * Current can't be migrated, useless to reschedule,
>          * let's hope p can move out.
>          */
>         if (rq->curr->nr_cpus_allowed == 1 ||
> -           !cpudl_find(&rq->rd->cpudl, rq->donor, NULL))
> +           !cpudl_find(&rd->cpudl, rq->donor, NULL))
>                 return;
>
>         /*
> @@ -2699,7 +2708,7 @@ static void check_preempt_equal_dl(struct rq *rq, struct task_struct *p)
>          * see if it is pushed or pulled somewhere else.
>          */
>         if (p->nr_cpus_allowed != 1 &&
> -           cpudl_find(&rq->rd->cpudl, p, NULL))
> +           cpudl_find(&rd->cpudl, p, NULL))
>                 return;
>
>         resched_curr(rq);
> @@ -2948,7 +2957,7 @@ static int find_later_rq(struct task_struct *task)
>          * We have to consider system topology and task affinity
>          * first, then we can look for a suitable CPU.
>          */
> -       if (!cpudl_find(&task_rq(task)->rd->cpudl, task, later_mask))
> +       if (!cpudl_find(&rcu_dereference_sched(task_rq(task)->rd)->cpudl, task, later_mask))
>                 return -1;
>
>         /*
> @@ -3232,7 +3241,7 @@ static void pull_dl_task(struct rq *this_rq)
>          */
>         smp_rmb();
>
> -       for_each_cpu(cpu, this_rq->rd->dlo_mask) {
> +       for_each_cpu(cpu, rcu_dereference_sched(this_rq->rd)->dlo_mask) {
>                 if (this_cpu == cpu)
>                         continue;
>
> @@ -3358,7 +3367,7 @@ bool dl_task_needs_bw_move(struct task_struct *p,
>         if (!dl_task(p))
>                 return false;
>
> -       return !cpumask_intersects(task_rq(p)->rd->span, new_mask);
> +       return !cpumask_intersects(rcu_dereference_sched(task_rq(p)->rd)->span, new_mask);
>  }
>
>  /* Assumes rq->lock is held */
> @@ -3368,9 +3377,9 @@ static void rq_online_dl(struct rq *rq)
>                 dl_set_overload(rq);
>
>         if (rq->dl.dl_nr_running > 0)
> -               cpudl_set(&rq->rd->cpudl, rq->cpu, rq->dl.earliest_dl.curr);
> +               cpudl_set(&rcu_dereference_sched(rq->rd)->cpudl, rq->cpu, rq->dl.earliest_dl.curr);
>         else
> -               cpudl_clear(&rq->rd->cpudl, rq->cpu, true);
> +               cpudl_clear(&rcu_dereference_sched(rq->rd)->cpudl, rq->cpu, true);
>  }
>
>  /* Assumes rq->lock is held */
> @@ -3379,7 +3388,7 @@ static void rq_offline_dl(struct rq *rq)
>         if (rq->dl.overloaded)
>                 dl_clear_overload(rq);
>
> -       cpudl_clear(&rq->rd->cpudl, rq->cpu, false);
> +       cpudl_clear(&rcu_dereference_sched(rq->rd)->cpudl, rq->cpu, false);
>  }
>
>  void __init init_sched_dl_class(void)
> @@ -3440,10 +3449,10 @@ void dl_add_task_root_domain(struct task_struct *p)
>         cpu = cpumask_first_and(cpu_active_mask, msk);
>         BUG_ON(cpu >= nr_cpu_ids);
>         rq = cpu_rq(cpu);
> -       dl_b = &rq->rd->dl_bw;
> +       dl_b = &rcu_dereference_sched(rq->rd)->dl_bw;
>
>         raw_spin_lock(&dl_b->lock);
> -       __dl_add(dl_b, p->dl.dl_bw, cpumask_weight(rq->rd->span));
> +       __dl_add(dl_b, p->dl.dl_bw, cpumask_weight(rcu_dereference_sched(rq->rd)->span));
>         raw_spin_unlock(&dl_b->lock);
>         raw_spin_unlock_irqrestore(&p->pi_lock, rf.flags);
>  }
> @@ -3504,7 +3513,7 @@ void dl_clear_root_domain(struct root_domain *rd)
>
>  void dl_clear_root_domain_cpu(int cpu)
>  {
> -       dl_clear_root_domain(cpu_rq(cpu)->rd);
> +       dl_clear_root_domain(rcu_dereference_sched(cpu_rq(cpu)->rd));
>  }
>
>  static void switched_from_dl(struct rq *rq, struct task_struct *p)
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index f79fcba4afec..51b28440d05d 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -7865,13 +7865,10 @@ static inline void set_rd_overutilized(struct root_domain *rd, bool flag)
>
>  static inline void check_update_overutilized_status(struct rq *rq)
>  {
> -       /*
> -        * overutilized field is used for load balancing decisions only
> -        * if energy aware scheduler is being used
> -        */

There is no reason to remove the comment above

> +       struct root_domain *rd = rcu_dereference_sched(rq->rd);
>
> -       if (!is_rd_overutilized(rq->rd) && cpu_overutilized(rq->cpu))
> -               set_rd_overutilized(rq->rd, 1);
> +       if (rd && !is_rd_overutilized(rd) && cpu_overutilized(rq->cpu))
> +               set_rd_overutilized(rd, 1);
>  }
>
>  /* Runqueue only has SCHED_IDLE tasks enqueued */
> @@ -9500,7 +9497,7 @@ static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu)
>         unsigned long prev_delta = ULONG_MAX, best_delta = ULONG_MAX;
>         unsigned long p_util_min = uclamp_is_used() ? uclamp_eff_value(p, UCLAMP_MIN) : 0;
>         unsigned long p_util_max = uclamp_is_used() ? uclamp_eff_value(p, UCLAMP_MAX) : 1024;
> -       struct root_domain *rd = this_rq()->rd;
> +       struct root_domain *rd = rcu_dereference_sched(this_rq()->rd);
>         int cpu, best_energy_cpu, target = -1;
>         int prev_fits = -1, best_fits = -1;
>         unsigned long best_actual_cap = 0;
> @@ -9704,7 +9701,7 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>                     cpumask_test_cpu(cpu, p->cpus_ptr))
>                         return cpu;
>
> -               if (!is_rd_overutilized(this_rq()->rd)) {
> +               if (!is_rd_overutilized(rcu_dereference_sched(this_rq()->rd))) {
>                         new_cpu = find_energy_efficient_cpu(p, prev_cpu);
>                         if (new_cpu >= 0)
>                                 return new_cpu;
> @@ -12690,13 +12687,15 @@ static inline void update_sd_lb_stats(struct lb_env *env, struct sd_lb_stats *sd
>                 env->fbq_type = fbq_classify_group(&sds->busiest_stat);
>
>         if (!env->sd->parent) {
> +               struct root_domain *rd = rcu_dereference_sched(env->dst_rq->rd);
> +
>                 /* update overload indicator if we are at root domain */
> -               set_rd_overloaded(env->dst_rq->rd, sg_overloaded);
> +               set_rd_overloaded(rd, sg_overloaded);
>
>                 /* Update over-utilization (tipping point, U >= 0) indicator */
> -               set_rd_overutilized(env->dst_rq->rd, sg_overutilized);
> +               set_rd_overutilized(rd, sg_overutilized);
>         } else if (sg_overutilized) {
> -               set_rd_overutilized(env->dst_rq->rd, sg_overutilized);
> +               set_rd_overutilized(rcu_dereference_sched(env->dst_rq->rd), sg_overutilized);
>         }
>
>         update_idle_cpu_scan(env, sum_util);
> @@ -12942,8 +12941,10 @@ static struct sched_group *sched_balance_find_src_group(struct lb_env *env)
>         if (busiest->group_type == group_misfit_task)
>                 goto force_balance;
>
> -       if (!is_rd_overutilized(env->dst_rq->rd) &&
> -           rcu_dereference_all(env->dst_rq->rd->pd))
> +       struct root_domain *rd = rcu_dereference_sched(env->dst_rq->rd);
> +
> +       if (rd && !is_rd_overutilized(rd) &&
> +           rcu_dereference_all(rd->pd))
>                 goto out_balanced;
>
>         /* ASYM feature bypasses nice load balance check */
> @@ -14573,7 +14574,7 @@ static int sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
>         if (!sd)
>                 goto out;
>
> -       if (!get_rd_overloaded(this_rq->rd) ||
> +       if (!get_rd_overloaded(rcu_dereference_sched(this_rq->rd)) ||
>             this_rq->avg_idle < sd->max_newidle_lb_cost) {
>
>                 update_next_balance(sd, &next_balance);
> diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
> index e6e5f8a2caaf..cb87741420b7 100644
> --- a/kernel/sched/rt.c
> +++ b/kernel/sched/rt.c
> @@ -338,15 +338,18 @@ static inline bool need_pull_rt_task(struct rq *rq, struct task_struct *prev)
>
>  static inline int rt_overloaded(struct rq *rq)
>  {
> -       return atomic_read(&rq->rd->rto_count);
> +       return atomic_read(&rcu_dereference_sched(rq->rd)->rto_count);
>  }
>
>  static inline void rt_set_overload(struct rq *rq)
>  {
> +       struct root_domain *rd;
> +
>         if (!rq->online)
>                 return;
>
> -       cpumask_set_cpu(rq->cpu, rq->rd->rto_mask);
> +       rd = rcu_dereference_sched(rq->rd);
> +       cpumask_set_cpu(rq->cpu, rd->rto_mask);
>         /*
>          * Make sure the mask is visible before we set
>          * the overload count. That is checked to determine
> @@ -357,17 +360,20 @@ static inline void rt_set_overload(struct rq *rq)
>          * Matched by the barrier in pull_rt_task().
>          */
>         smp_wmb();
> -       atomic_inc(&rq->rd->rto_count);
> +       atomic_inc(&rd->rto_count);
>  }
>
>  static inline void rt_clear_overload(struct rq *rq)
>  {
> +       struct root_domain *rd;
> +
>         if (!rq->online)
>                 return;
>
> +       rd = rcu_dereference_sched(rq->rd);
>         /* the order here really doesn't matter */
> -       atomic_dec(&rq->rd->rto_count);
> -       cpumask_clear_cpu(rq->cpu, rq->rd->rto_mask);
> +       atomic_dec(&rd->rto_count);
> +       cpumask_clear_cpu(rq->cpu, rd->rto_mask);
>  }
>
>  static inline int has_pushable_tasks(struct rq *rq)
> @@ -580,7 +586,7 @@ static int rt_se_boosted(struct sched_rt_entity *rt_se)
>
>  static inline const struct cpumask *sched_rt_period_mask(void)
>  {
> -       return this_rq()->rd->span;
> +       return rcu_dereference_sched(this_rq()->rd)->span;
>  }
>
>  static inline
> @@ -608,7 +614,7 @@ bool sched_rt_bandwidth_account(struct rt_rq *rt_rq)
>  static void do_balance_runtime(struct rt_rq *rt_rq)
>  {
>         struct rt_bandwidth *rt_b = sched_rt_bandwidth(rt_rq);
> -       struct root_domain *rd = rq_of_rt_rq(rt_rq)->rd;
> +       struct root_domain *rd = rcu_dereference_sched(rq_of_rt_rq(rt_rq)->rd);
>         int i, weight;
>         u64 rt_period;
>
> @@ -659,7 +665,7 @@ static void do_balance_runtime(struct rt_rq *rt_rq)
>   */
>  static void __disable_runtime(struct rq *rq)
>  {
> -       struct root_domain *rd = rq->rd;
> +       struct root_domain *rd = rcu_dereference_sched(rq->rd);
>         rt_rq_iter_t iter;
>         struct rt_rq *rt_rq;
>
> @@ -1058,7 +1064,7 @@ inc_rt_prio_smp(struct rt_rq *rt_rq, int prio, int prev_prio)
>                 return;
>
>         if (rq->online && prio < prev_prio)
> -               cpupri_set(&rq->rd->cpupri, rq->cpu, prio);
> +               cpupri_set(&rcu_dereference_sched(rq->rd)->cpupri, rq->cpu, prio);
>  }
>
>  static void
> @@ -1073,7 +1079,8 @@ dec_rt_prio_smp(struct rt_rq *rt_rq, int prio, int prev_prio)
>                 return;
>
>         if (rq->online && rt_rq->highest_prio.curr != prev_prio)
> -               cpupri_set(&rq->rd->cpupri, rq->cpu, rt_rq->highest_prio.curr);
> +               cpupri_set(&rcu_dereference_sched(rq->rd)->cpupri, rq->cpu,
> +                          rt_rq->highest_prio.curr);
>  }
>
>  static void
> @@ -1575,8 +1582,10 @@ select_task_rq_rt(struct task_struct *p, int cpu, int flags)
>
>  static void check_preempt_equal_prio(struct rq *rq, struct task_struct *p)
>  {
> +       struct root_domain *rd = rcu_dereference_sched(rq->rd);
> +
>         if (rq->curr->nr_cpus_allowed == 1 ||
> -           !cpupri_find(&rq->rd->cpupri, rq->donor, NULL))
> +           !cpupri_find(&rd->cpupri, rq->donor, NULL))
>                 return;
>
>         /*
> @@ -1584,7 +1593,7 @@ static void check_preempt_equal_prio(struct rq *rq, struct task_struct *p)
>          * see if it is pushed or pulled somewhere else.
>          */
>         if (p->nr_cpus_allowed != 1 &&
> -           cpupri_find(&rq->rd->cpupri, p, NULL))
> +           cpupri_find(&rd->cpupri, p, NULL))
>                 return;
>
>         /*
> @@ -1793,12 +1802,12 @@ static int find_lowest_rq(struct task_struct *task)
>          */
>         if (sched_asym_cpucap_active()) {
>
> -               ret = cpupri_find_fitness(&task_rq(task)->rd->cpupri,
> +               ret = cpupri_find_fitness(&rcu_dereference_sched(task_rq(task)->rd)->cpupri,
>                                           task, lowest_mask,
>                                           rt_task_fits_capacity);
>         } else {
>
> -               ret = cpupri_find(&task_rq(task)->rd->cpupri,
> +               ret = cpupri_find(&rcu_dereference_sched(task_rq(task)->rd)->cpupri,
>                                   task, lowest_mask);
>         }
>
> @@ -2189,16 +2198,17 @@ static inline void rto_start_unlock(atomic_t *v)
>
>  static void tell_cpu_to_push(struct rq *rq)
>  {
> +       struct root_domain *rd = rcu_dereference_sched(rq->rd);
>         int cpu = -1;
>
>         /* Keep the loop going if the IPI is currently active */
> -       atomic_inc(&rq->rd->rto_loop_next);
> +       atomic_inc(&rd->rto_loop_next);
>
>         /* Only one CPU can initiate a loop at a time */
> -       if (!rto_start_trylock(&rq->rd->rto_loop_start))
> +       if (!rto_start_trylock(&rd->rto_loop_start))
>                 return;
>
> -       raw_spin_lock(&rq->rd->rto_lock);
> +       raw_spin_lock(&rd->rto_lock);
>
>         /*
>          * The rto_cpu is updated under the lock, if it has a valid CPU
> @@ -2206,17 +2216,17 @@ static void tell_cpu_to_push(struct rq *rq)
>          * update to loop_next, and nothing needs to be done here.
>          * Otherwise it is finishing up and an IPI needs to be sent.
>          */
> -       if (rq->rd->rto_cpu < 0)
> -               cpu = rto_next_cpu(rq->rd);
> +       if (rd->rto_cpu < 0)
> +               cpu = rto_next_cpu(rd);
>
> -       raw_spin_unlock(&rq->rd->rto_lock);
> +       raw_spin_unlock(&rd->rto_lock);
>
> -       rto_start_unlock(&rq->rd->rto_loop_start);
> +       rto_start_unlock(&rd->rto_loop_start);
>
>         if (cpu >= 0) {
>                 /* Make sure the rd does not get freed while pushing */
> -               sched_get_rd(rq->rd);
> -               irq_work_queue_on(&rq->rd->rto_push_work, cpu);
> +               sched_get_rd(rd);
> +               irq_work_queue_on(&rd->rto_push_work, cpu);
>         }
>  }
>
> @@ -2277,7 +2287,7 @@ static void pull_rt_task(struct rq *this_rq)
>
>         /* If we are the only overloaded CPU do nothing */
>         if (rt_overload_count == 1 &&
> -           cpumask_test_cpu(this_rq->cpu, this_rq->rd->rto_mask))
> +           cpumask_test_cpu(this_rq->cpu, rcu_dereference_sched(this_rq->rd)->rto_mask))
>                 return;
>
>  #ifdef HAVE_RT_PUSH_IPI
> @@ -2287,7 +2297,7 @@ static void pull_rt_task(struct rq *this_rq)
>         }
>  #endif
>
> -       for_each_cpu(cpu, this_rq->rd->rto_mask) {
> +       for_each_cpu(cpu, rcu_dereference_sched(this_rq->rd)->rto_mask) {
>                 if (this_cpu == cpu)
>                         continue;
>
> @@ -2392,7 +2402,7 @@ static void rq_online_rt(struct rq *rq)
>
>         __enable_runtime(rq);
>
> -       cpupri_set(&rq->rd->cpupri, rq->cpu, rq->rt.highest_prio.curr);
> +       cpupri_set(&rcu_dereference_sched(rq->rd)->cpupri, rq->cpu, rq->rt.highest_prio.curr);
>  }
>
>  /* Assumes rq->lock is held */
> @@ -2403,7 +2413,7 @@ static void rq_offline_rt(struct rq *rq)
>
>         __disable_runtime(rq);
>
> -       cpupri_set(&rq->rd->cpupri, rq->cpu, CPUPRI_INVALID);
> +       cpupri_set(&rcu_dereference_sched(rq->rd)->cpupri, rq->cpu, CPUPRI_INVALID);
>  }
>
>  /*
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 26ae13c86b69..13a437032855 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -1256,7 +1256,7 @@ struct rq {
>         int membarrier_state;
>  #endif
>
> -       struct root_domain              *rd;
> +       struct root_domain __rcu        *rd;
>         struct sched_domain __rcu       *sd;
>
>         struct balance_callback *balance_callback;
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index 21e816ad23ee..e6038effdf12 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -413,7 +413,8 @@ static bool build_perf_domains(const struct cpumask *cpu_map)
>         int i;
>         struct perf_domain *pd = NULL, *tmp;
>         int cpu = cpumask_first(cpu_map);
> -       struct root_domain *rd = cpu_rq(cpu)->rd;
> +       struct root_domain *rd = rcu_dereference_protected(cpu_rq(cpu)->rd,
> +                                                           lockdep_is_held(&sched_domains_mutex));
>
>         if (!sysctl_sched_energy_aware)
>                 goto free;
> @@ -478,9 +479,8 @@ void rq_attach_root(struct rq *rq, struct root_domain *rd)
>
>         rq_lock_irqsave(rq, &rf);
>
> -       if (rq->rd) {
> -               old_rd = rq->rd;
> -
> +       old_rd = rcu_dereference_protected(rq->rd, lockdep_is_held(&rq->__lock));
> +       if (old_rd) {
>                 if (cpumask_test_cpu(rq->cpu, old_rd->online))
>                         set_rq_offline(rq);
>
> @@ -3462,7 +3462,8 @@ static void partition_sched_domains_locked(int ndoms_new, cpumask_var_t doms_new
>         for (i = 0; i < ndoms_new; i++) {
>                 for (j = 0; j < n && !sched_energy_update; j++) {
>                         if (cpumask_equal(doms_new[i], doms_cur[j]) &&
> -                           cpu_rq(cpumask_first(doms_cur[j]))->rd->pd) {
> +                           rcu_dereference_protected(cpu_rq(cpumask_first(doms_cur[j]))->rd,
> +                                                     lockdep_is_held(&sched_domains_mutex))->pd) {
>                                 has_eas = true;
>                                 goto match3;
>                         }
> --
> 2.55.0
>
