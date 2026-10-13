Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F6C3E49D7
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791910578; cv=pass; b=kam4mtF2Do1Mnd2z6/JTTlICEDOJo486oh3gOEbc01rrtFnVk5woS92xq2g9hIdCvzywizxTY7nIgJxcCvP3ocT9qOFic4EtAGqEn4X9rkR8voAq7NYZMAWQzswQp/gxSMo55ixSao1lNkcyV3LuBo051dFxixUv5/Hlf61WGx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791910578; c=relaxed/simple;
	bh=vgZAJZYbetFjV8eUR4ZHppCk+qnMUzLvVtWQf1Xk6Qw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qkxUrkotLvxEdfimIlOFj19ZpG+Na0Xr9ssSXjBfhrgwfx8FZ0NOeRilLepEmlwCBWgP3G06C9wKNjtmdjZS2hizUCRtaxAMbpyyARGWeXfmBqGxXmg2iwDPQ9I93Tk/5mdUfMpEAsbd1L7AV8018581UbND10rkI0YFSdQt5FY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gT46Iep5; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gT46Iep5"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b1aa4d71e7so75216a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:56:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791910575; cv=none;
        d=google.com; s=arc-20260327;
        b=Ug+7ke0g5i/RzMg3BrOTvLWWlRIT5yGgNPyOkjC8skcBNS2P78CFuzScp83aIi6+ZF
         FX4EX+JszaDSmtSgv9pX2ERc0qrDCM9uvLPxQbZLa90KkOk9G5H8/+dZptQcz/DkxotT
         twZaG+PC40+DdDEiN4D46vvg0eUUq3pCSUE2BWzTpKqiqv2awRGc43ejtmClvS4Jp6at
         Yb2v5t5o/lZiZ0aFiPPmPjQY+nowUU9eqbJtOa58Ubi4Ia1QcXvn1mkcDE7jqss9cUVW
         hvbFbo3aCxkuK2ypNjkrfku3SsfJVEQEl2dv5SndQUlHe7mIE2NBFFnmeDUH6ZJn8ONK
         9NNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jRJGqlCpD5rZFNZSdCWtntDsM6hP5Y50NhmG83eeOxE=;
        fh=QnxUiNqls8gOI2GC3Owx1sL5hCT9cUNBQUHAM8Bdk/k=;
        b=JKFH+y/qVH+CVb3dVwtyawKMnJoxoT0PN+/Mw2d5RbjEurriOATkbpNlcxGNRiPZtQ
         wYrD3uwtqhGNOZu5q9Oucg80GQoM+yZZCxvLvFT9AqTksdsNKsfU6YlxRgf/1YCH4mo3
         mX+YQiWQ63IQnnx2j3K1wJOfKGcg1R527sUvfnvyC3djk0bUXT4KsdSNX46zy6W6s5j5
         kXA1V90geyaF4djvVmA+8HN1wkuAU+R9vkyN7Hrg5/fWP8eBfADb6HG+7kGlhoQ7yPED
         2OoSVrKBsATc1dbTcd1narJt9tMA8TMY00rYlT+ZKCT0kDiX9Ol0DR3iHLiv8mE50Tw/
         4yuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791910575; x=1792515375; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jRJGqlCpD5rZFNZSdCWtntDsM6hP5Y50NhmG83eeOxE=;
        b=gT46Iep5Wm/QFi/3YYOlh/VdXWK27JntfiQZxlrcA9fDGtsFCO4+sL96T71C0Vb3Bi
         cShogBr9EwD96AVGZUoWZhmCvw5KdBfBbSeyytYX3gIHVTb1EK4HqXavQGykMnJUEq7p
         oEl6Ryjht0g2hXCKNASJdhieLWzYACDx5yzzpi8WDb6XuVQVjS31rCAsPWlzls/Fu6ou
         qLUz3M2hjlVzwWibe2F5aMuzsG0XpfEm6ENVcwb4EQy7bM09TPvi0+yRJPjCQ2bbqLzj
         rnkabH1kA+EK5Ux8MsOqn8NikTCJmXuveppsuUFOXmknj+0a5LW2DzYgnc6kt6TU6khU
         S60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791910575; x=1792515375;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jRJGqlCpD5rZFNZSdCWtntDsM6hP5Y50NhmG83eeOxE=;
        b=tI4lctz+BgRbYg+GDouhBEPd7fmJfCcB7+Uyccuxeh818PklevU7y5slbrW0+DO71o
         4O06e6jle9A8z1+96aUgQtkieNz0y5bEIi4wLZ0bmVQAYcxXcQ1xPeR4ZV/HYde8BJAL
         ArtyqI1xGvVN6LvK7KuzXTS+/s4ZzNv6fcgZBWR7ZpcziVoXEmMMmWO78aUZ09+En2Q6
         0Vsn3Y+2Jvhdo/JVlQEUf9QZWbbcHcCFDCvM6LXLXdV6Vtb8i6j8ksFRMJ/dgXJks8eX
         rTui94MLN1Gt8nDyrWKgrb7gTCmGdy0De9MNS2GrDTdv6DL7ucvMC2Qlyt+mN6gLplki
         WwPw==
X-Forwarded-Encrypted: i=1; AKwUvBzYN4pkdQaecwBrOrMHcN2D90cevRC7vnaAHCWftr2+/qWFQhsjnX0Ql+uffSurUd7YrH/tg6TqBqfX4SE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0Jq+p+2gXh4XbFR6ePVwIjrmAvnczK/0KSK4DPGoR/EzpnSgP
	zwQPTMF1OMhY8gqhvTlOfPAF3tDvutkNgFxj/F1LQtHVt5VXClx52Rtycm7to8B2ii/eWfuuPdx
	fEa3pi+UcwdizEy61r4BQngtkgZftZlVd52ZAwxa2xw==
X-Gm-Gg: AYBFou0n9fFO2wivIq04S9KePBCTsBJMe9ZvyNPcg7UCSHh/EePN/lqrNDFziBHrcpE
	Yb1oQzFc65AsJpPxnw0s+WSjCq17KkGY+SuYDDH/5I0S0l0qFLl/9BxbdjKuTeZyuS5/Yw5sACy
	rN1bVTZDjWh9fWCbASx4SjqFsD3eiuwrWkBWIcEz0S4n1kRmr0vKpXY4iTtCjzDJIpGtpSaIYJY
	ZDMWjCT7TKCtxsRvd59YP4lmqd88QX6hXuq41VDg6p2CVCOoKW8NQBZEYRAJRa4H2/ewhD61knQ
	ezvVtKy2bYZNDM2Gn4FwMG6jFEouOZvh7j1vTU3oGuKjyQjp0hjzi7bzhOVHLrMVF/01Pv6S8Y/
	vp2ulTaLF0SFuJVhgum5MoQ==
X-Received: by 2002:a05:6402:4006:b0:6b1:c526:afcd with SMTP id
 4fb4d7f45d1cf-6b1c526bc10mr5197676a12.11.1791910574753; Tue, 13 Oct 2026
 09:56:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929084923.092062266@infradead.org> <20260929085320.337703476@infradead.org>
In-Reply-To: <20260929085320.337703476@infradead.org>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 13 Oct 2026 18:56:03 +0200
X-Gm-Features: AclHuK-FYzf4pngjYTg0wFNT6rCXT2QOp7saIR0M--LRSjiA8Tamx74pMsMEnD4
Message-ID: <CAKfTPtCrb4_JkH=-hnoabrqix14B+kizwLDWnuOaLa6374tfxw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] sched/fair: Rework/fix task_h_load()
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@kernel.org, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, tj@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Sept 2026 at 10:55, Peter Zijlstra <peterz@infradead.org> wrote:
>
> There are a number of issues with task_h_load():
>
>  - its hierarchy traversal is racy to the point of being broken; where
>    originally it was meant to be used under rq->lock, but lacking an assertion
>    for that fact, its use spread and violated this. The result is that the
>    back-link state is prone to races.
>
>  - it is rate-limited on jiffies, which is HZ, not the underlying PELT decay.
>
>  - since its update is tied to task_h_load() usage, the cfs_rq->h_load numbers are
>    not often 'up-to-date', rendering their output in sched/debug near useless.
>
> Rework the whole thing to keep a more up-to-date and less broken cfs_rq->h_load
> number.
>
> Move the back-link tracking into for_each_sched_entity(), such that any such
> loop sets up a path back. Use this to (optionally) re-compute cfs_rq->h_load on
> enqueue, dequeue, set_next and tick, all sites that hold rq->lock.
>
> This ensures that 'active' cgroups have reasonably up-to-date cfs_rq->h_load.
> Additionally, have __update_blocked_fair() update cfs_rq->h_load for all
> cgroups.
>
> Finally, replace the jiffy rate-limit with one that is tied to the PELT decay.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>

> ---
>  kernel/sched/fair.c  |  117 +++++++++++++++++++++++++++++++++------------------
>  kernel/sched/pelt.h  |    7 +++
>  kernel/sched/sched.h |    1
>  3 files changed, 84 insertions(+), 41 deletions(-)
>
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -5755,6 +5755,50 @@ static inline bool skip_blocked_update(s
>         return true;
>  }
>
> +static inline void __update_cfs_rq_h_load(struct cfs_rq *cfs_rq,
> +                                         struct sched_entity *se,
> +                                         struct cfs_rq *p_cfs_rq)
> +{
> +       unsigned long load = cfs_rq->avg.load_avg;
> +
> +       if (cfs_rq != &cfs_rq->rq->cfs) {
> +               /*
> +                * These last two arguments can be NULL when used outside of
> +                * the for_each_sched_entity() hierarchy iteration. Like in
> +                * __update_blocked_fair() where leaf_cfs_rq_list is iterated
> +                * instead.
> +                */
> +               if (!se)
> +                       se = &container_of(cfs_rq, struct cfs_tg_state, cfs_rq)->se;
> +               if (!p_cfs_rq)
> +                       p_cfs_rq = cfs_rq_of(se);
> +
> +               load = p_cfs_rq->h_load;
> +               load = div64_ul(load * se->avg.load_avg,
> +                               p_cfs_rq->avg.load_avg + 1);
> +       }
> +
> +       WRITE_ONCE(cfs_rq->h_load, load);
> +}
> +
> +static inline bool update_cfs_rq_h_load(struct cfs_rq *cfs_rq,
> +                                       struct sched_entity *se,
> +                                       struct cfs_rq *p_cfs_rq)
> +{
> +       /*
> +        * Mask out the segment bits, if the remaining bits match, then there
> +        * hasn't been a decay since the last time.
> +        */
> +       if ((cfs_rq->last_h_load_update & ~PELT_SEGMENT_MASK) ==
> +           (cfs_rq->avg.last_update_time & ~PELT_SEGMENT_MASK))
> +               return false;
> +
> +       __update_cfs_rq_h_load(cfs_rq, se, p_cfs_rq);
> +
> +       cfs_rq->last_h_load_update = cfs_rq->avg.last_update_time;
> +       return true;
> +}
> +
>  #else /* !CONFIG_FAIR_GROUP_SCHED: */
>
>  static inline void update_tg_load_avg(struct cfs_rq *cfs_rq) {}
> @@ -5768,6 +5812,10 @@ static inline int propagate_entity_load_
>
>  static inline void add_tg_cfs_propagate(struct cfs_rq *cfs_rq, long runnable_sum) {}
>
> +static inline bool update_cfs_rq_h_load(struct cfs_rq *cfs_rq,
> +                                       struct sched_entity *se,
> +                                       struct cfs_rq *p_cfs_rq) { return false; }
> +
>  #endif /* !CONFIG_FAIR_GROUP_SCHED */
>
>  #ifdef CONFIG_NO_HZ_COMMON
> @@ -8199,6 +8247,9 @@ static unsigned long enqueue_hierarchy(s
>                 flags = ENQUEUE_WAKEUP;
>         }
>
> +       for_each_sched_entity_bl(se, cfs_rq)
> +               update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
> +
>         return weight;
>  }
>
> @@ -8330,6 +8381,9 @@ static void dequeue_hierarchy(struct tas
>                 flags |= DEQUEUE_SLEEP;
>                 flags &= ~(DEQUEUE_DELAYED | DEQUEUE_SPECIAL);
>         }
> +
> +       for_each_sched_entity_bl(se, cfs_rq)
> +               update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
>  }
>
>  /*
> @@ -11547,51 +11601,23 @@ static bool __update_blocked_fair(struct
>                         *done = false;
>         }
>
> -       return decayed;
> -}
> -
> -/*
> - * Compute the hierarchical load factor for cfs_rq and all its ascendants.
> - * This needs to be done in a top-down fashion because the load of a child
> - * group is a fraction of its parents load.
> - */
> -static void update_cfs_rq_h_load(struct cfs_rq *cfs_rq)
> -{
> -       struct sched_entity *se = cfs_rq_se(cfs_rq);
> -       unsigned long now = jiffies;
> -       unsigned long load;
> -
> -       if (cfs_rq->last_h_load_update == now)
> -               return;
> -
> -       WRITE_ONCE(cfs_rq->h_load_next, NULL);
> -       for_each_sched_entity(se, cfs_rq) {
> -               WRITE_ONCE(cfs_rq->h_load_next, se);
> -               if (cfs_rq->last_h_load_update == now)
> -                       break;
> -       }
> -
> -       if (!se) {
> -               cfs_rq->h_load = cfs_rq_load_avg(cfs_rq);
> -               cfs_rq->last_h_load_update = now;
> -       }
> +       /*
> +        * The above (forward) leaf_cfs_rq_list traversal will have done
> +        * update_cfs_rq_load_avg() in a bottom-up fashion. Now iterate the
> +        * list backwards, such that we're ensured to have visited every
> +        * parent of the current group to update h_load in a top-down fashion.
> +        */
> +       list_for_each_entry_reverse(cfs_rq, &rq->leaf_cfs_rq_list, leaf_cfs_rq_list)
> +               update_cfs_rq_h_load(cfs_rq, NULL, NULL);
>
> -       while ((se = READ_ONCE(cfs_rq->h_load_next)) != NULL) {
> -               load = cfs_rq->h_load;
> -               load = div64_ul(load * se->avg.load_avg,
> -                               cfs_rq_load_avg(cfs_rq) + 1);
> -               cfs_rq = group_cfs_rq(se);
> -               cfs_rq->h_load = load;
> -               cfs_rq->last_h_load_update = now;
> -       }
> +       return decayed;
>  }
>
>  static unsigned long task_h_load(struct task_struct *p)
>  {
>         struct cfs_rq *cfs_rq = task_cfs_rq(p);
>
> -       update_cfs_rq_h_load(cfs_rq);
> -       return div64_ul(p->se.avg.load_avg * cfs_rq->h_load,
> +       return div64_ul(p->se.avg.load_avg * READ_ONCE(cfs_rq->h_load),
>                         cfs_rq_load_avg(cfs_rq) + 1);
>  }
>  #else /* !CONFIG_FAIR_GROUP_SCHED: */
> @@ -15331,6 +15357,11 @@ static void task_tick_fair(struct rq *rq
>
>                 se = &curr->se;
>                 reweight_eevdf(cfs_rq, se, weight, se->on_rq);
> +
> +               if (!hrtick) {
> +                       for_each_sched_entity_bl(se, cfs_rq)
> +                               update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
> +               }
>         }
>
>         if (hrtick)
> @@ -15545,11 +15576,15 @@ static void set_next_task_fair(struct rq
>                  */
>                 list_move(&se->group_node, &rq->cfs_tasks);
>         }
> -       if (!first)
> -               return;
>
>         WARN_ON_ONCE(se->sched_delayed);
>
> +       for_each_sched_entity_bl(se, cfs_rq)
> +               update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
> +
> +       if (!first)
> +               return;
> +
>         update_misfit_status(p, rq);
>         sched_fair_update_stop_tick(rq, p);
>
> @@ -15731,6 +15766,8 @@ static int __sched_group_set_shares(stru
>                         update_load_avg(cfs_rq, se, UPDATE_TG);
>                         update_cfs_group(se);
>                 }
> +               for_each_sched_entity_bl(se, cfs_rq)
> +                       update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
>                 rq_unlock_irqrestore(rq, &rf);
>         }
>
> --- a/kernel/sched/pelt.h
> +++ b/kernel/sched/pelt.h
> @@ -5,6 +5,13 @@
>
>  #include "sched-pelt.h"
>
> +/*
> + * Pelt uses apprixmate 'us' as ns/1024; and then uses time segments of 1024
> + * 'us'. As a result each segment is in fact '1<<20' ns.
> + */
> +#define PELT_SEGMENT_NS                (1<<20)
> +#define PELT_SEGMENT_MASK      (PELT_SEGMENT_NS-1)
> +
>  int __update_load_avg_blocked_se(u64 now, struct sched_entity *se);
>  int __update_load_avg_se(u64 now, struct cfs_rq *cfs_rq, struct sched_entity *se);
>  int __update_load_avg_cfs_rq(u64 now, struct cfs_rq *cfs_rq);
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -736,7 +736,6 @@ struct cfs_rq {
>          */
>         unsigned long           h_load;
>         u64                     last_h_load_update;
> -       struct sched_entity     *h_load_next;
>
>         struct rq               *rq;    /* CPU runqueue to which this cfs_rq is attached */
>
>
>
