Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0413F86EF
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791910429; cv=pass; b=VxxoOouTvt+fAxtbx7lmiBePaCJj1VgA6JO9LOYTy9JYYe4da9PaR7wwkJOprI0y8oKsp9HPxmL8Mx6bbF5aX7oq70+HfI3fe9aDV3QvVE9LxdM8h5Vx7pbP2H+e+LD0KG1OnFNeoTtGbom/CoHqPEzw2BYre9X28G6REboFbdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791910429; c=relaxed/simple;
	bh=AY9YD0/b/8R9lFtKy4ICoPzlss4hWFhf45zB/DbIkrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cfeV3a8EHkFMMgRYXiItYSaxIHNFVBZMwBxRYQJpTyBPpkv8Izjxjfg8i3FwKGPZrw40z1LCzQnm5SF4EY8xWE/lfEfjVabOOQkNMJQxzJ9/EyQlLf+RWSYAhzSoTC3SAFxIpMb3If/K7bwCMuRDPAvadMNxuLrMFtVOoIa6qYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hJ2z8qzE; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hJ2z8qzE"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b1cc392d8bso107018a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:53:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791910425; cv=none;
        d=google.com; s=arc-20260327;
        b=Q/8vAscS1lRzQog9DyCpS4WYxvVCX/xO91GX4tiTiUeQO0YL1cfjAqt8VeaH50qI/m
         iFsTvyKZ5OmpF8wxK/rxgZwtVtuzfq92U/Sbc32FGxDWEeWwwTkS/O+k7Z2l5cNhGU+I
         wDd7kN/yroo6bTPtOTHxaxfU3x2pI+24Z+72PWzC5om0vxr6drN9A6iWqcNy1F0rH2S3
         ZrQV8KVVObgPmav30jQL6kfoTy06MWufmAanqbaEO0VrQQssH/qoAewTEGesluZ9lvG8
         6KjwK4TbqXXKPQaAejgH3bdvRpuH9g1S40HklrjnsFiIcgmcxPKj8zbthSL+a2ZmV4PJ
         PTRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xNoDXs3twyCLyDHgewKBxLXHCeo+IbQqM8tnWpkQlVg=;
        fh=+vGcbd137et6lEBoKX65k7eC3AW5Jgxv2FjhBOWknrs=;
        b=hgg1WK2SqGfxlC0zqk9tHIW4av5AwQ15LElbzDQMDzfgBVbexnbSF6rHQfrbzrzABQ
         EEMQtZkC9Kr9UX/jpNQBcKUXv3p1ciiTrrRprRZKwdrwtGFF9satpS1q8Npp3pcAadh7
         vOx+5mN2kYAFimGr9aYzZGKlE5usHuqRZ+BAchakdIfezMGGnzT8eJjFMZWq0cCEfv8M
         Awr8lmISnombRds6UGVulk654ZMxfNMSFoQ40OPi15hjQ0ZjFh4qY8ske5Q4J6isGoJ7
         zx7bcdJy/uk1t671cgsd/oomjcLupgvepKSY509SjlOgkgS+2ypGkxB1kDIymVrXeShY
         RE9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791910425; x=1792515225; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xNoDXs3twyCLyDHgewKBxLXHCeo+IbQqM8tnWpkQlVg=;
        b=hJ2z8qzEZnGE5jW1BXi6en9BEufDxCxOxUh8P5YBQnUySjI2S5DXfAeZmcIx1a4WQJ
         k2pmp20GM+wxmGLsg8t9bqXtYMQ7ZmoF1iCXeU8YA4RpmEu5KYvNQsQoL+HvDOcgJvwI
         sAv2kAVIckkLt7alyEbnrAsxBUlK+sus6vS+dRryqJ7Fr8obfWRUiDmQ/ggFe9gUUWHF
         0R7xNiWNBxHbxt8w+5VLfx/JfOILWFxbFDc288D2cJ0uXIZyuFH/ueChrv1JNIPmYgeC
         Lyk9wxLFzHtllNCqrxA/eQfGF9gXruKplArgA/ge4cX0hZYJK+YN/+AbFtz5zSIAA76r
         4yeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791910425; x=1792515225;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xNoDXs3twyCLyDHgewKBxLXHCeo+IbQqM8tnWpkQlVg=;
        b=Hul5LXv9ypgeW9KWJ+k6pF3fj1mlRzUX1LVCynQ38ApOHF0/As9/tOCDUPx24rS/4n
         XiVVGVlj+a+BlFr6Mbuy370W2ARCW6riOPTw+gltNr3cLedzwwtXo6ThQcYTCzAq9E/i
         N9PPUQh/QNv5/M3zVdqKZ4WjJjPC0/hb3MRwdbFZkfNzj8LGyBvJtb9K7Al0IcBcd4zP
         5ZSYq5ZLj3F5+97I1IAfWLtOqAUEFWOJTRfRWUWAAn4RIxPBSbyOxQnVCVO+i40Vw3BU
         U2wTlGvnVT8p2u/w+gMJDSDXBGBhhHXR5V7I1l8itnW4oAzoRM8Qeigif7sJ5M5f8ZoP
         Pcaw==
X-Forwarded-Encrypted: i=1; AKwUvBxdkHw4qALckZSDZ00tkKPZFfX7Jkab2CC14yv5sziwh8ieQqdoud9noRpFORcFwLG29v5SnOll3RhZQqU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2G9MdfLIGBhK4oNGQCysDvsc45M038Pbmg8fW/qWNX8LkKVvf
	3f8N0dy+QE9IifBI2QOGYrq2zg6ekL0/W/fa/umx1jZOP+eExskkA7TzGbFEcL/pafReQghYGik
	FOvkj1LSi00jzk8VvIFAmGGm4aGt5mhq+TbZ535Dl4w==
X-Gm-Gg: AYBFou3g5LrPD/p5rBwXvPh9MgdeYPmdvccIDkMu5wQ92wKSfwiUDqh5MyryOaPDJqp
	7jRmgJCXRObhrffo5omIqyKe42YYEFmCkmRXU+57UwM0F+ny/qxf3eZST+yvhv2Wm2dwyf7jcw5
	fhX1AXt0VOvLxiF9vn9i2Yis9TQ2id8uN+0FYQcq/z0gGssWx7rqNsnhzW9qGueoCtO1Yehcd3A
	pGuXbe9tQR3WeTMNQb2fqxxnjrV6ustE2yxyoU3pSA66Khp8Fx9Pr0p1ge2z3GCLy6bFQXr0dqV
	xF3/Eg7i5YJrK8g9grAMhP9kXX2GCAr/W55DLW4hCu4TCO4bnDq2LjccBsRTICj4etYpYOUDBvg
	gw5U25agzl6U=
X-Received: by 2002:a05:6402:501d:b0:6b1:e474:e0e2 with SMTP id
 4fb4d7f45d1cf-6b1e474eb97mr2522860a12.43.1791910425461; Tue, 13 Oct 2026
 09:53:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929084923.092062266@infradead.org> <20260929085320.091427386@infradead.org>
In-Reply-To: <20260929085320.091427386@infradead.org>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 13 Oct 2026 18:53:32 +0200
X-Gm-Features: AclHuK8KImSL686VS93YHhPBFm2v25-xSxco7zSC_CTWzPgg6kR_uYFWBwZcScs
Message-ID: <CAKfTPtC+AcOszLozpmj7Rd-tUqRbfs0z_=N-usEjwD2R9XoKpQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] sched/fair: Fold cfs_rq_of(se) into for_each_sched_entity()
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@kernel.org, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, tj@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Sept 2026 at 10:55, Peter Zijlstra <peterz@infradead.org> wrote:
>
> Pretty much every for_each_sched_entity() loop does: cfs_rq = cfs_rq_of(se) as
> the very first thing. Fold it into the for_each_sched_entity() macro.
>
> This paves the way to have the macro track a backlink transparantly.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>

> ---
>  kernel/sched/fair.c |   81 +++++++++++++++++++++++-----------------------------
>  1 file changed, 37 insertions(+), 44 deletions(-)
>
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -318,8 +318,8 @@ const struct sched_class fair_sched_clas
>  #ifdef CONFIG_FAIR_GROUP_SCHED
>
>  /* Walk up scheduling entities hierarchy */
> -#define for_each_sched_entity(se) \
> -               for (; se; se = se->parent)
> +#define for_each_sched_entity(se, cfs_rq)                              \
> +       for (; (se) && ((cfs_rq) = cfs_rq_of(se)); (se) = (se)->parent)
>
>  static inline bool list_add_leaf_cfs_rq(struct cfs_rq *cfs_rq)
>  {
> @@ -453,8 +453,8 @@ static int se_is_idle(struct sched_entit
>
>  #else /* !CONFIG_FAIR_GROUP_SCHED: */
>
> -#define for_each_sched_entity(se) \
> -               for (; se; se = NULL)
> +#define for_each_sched_entity(se, cfs_rq) \
> +       for (; (se) && ((cfs_rq) = cfs_rq_of(se)); (se) = NULL)
>
>  static inline bool list_add_leaf_cfs_rq(struct cfs_rq *cfs_rq)
>  {
> @@ -2277,9 +2277,10 @@ static void update_curr(struct cfs_rq *c
>  static void update_curr_fair(struct rq *rq)
>  {
>         struct sched_entity *se = &rq->donor->se;
> +       struct cfs_rq *cfs_rq;
>
> -       for_each_sched_entity(se)
> -               update_curr(cfs_rq_of(se));
> +       for_each_sched_entity(se, cfs_rq)
> +               update_curr(cfs_rq);
>  }
>
>  static inline void
> @@ -5011,18 +5012,19 @@ static void reweight_task_fair(struct rq
>  {
>         struct sched_entity *se = &p->se;
>         unsigned long weight = NICE_0_LOAD;
> +       struct cfs_rq *cfs_rq = cfs_rq_of(se);
>
>         if (se->on_rq)
>                 update_curr_fair(rq);
>
> -       reweight_entity(cfs_rq_of(se), se, lw->weight);
> +       reweight_entity(cfs_rq, se, lw->weight);
>         se->load.inv_weight = lw->inv_weight;
>
>         if (!se->on_rq)
>                 return;
>
> -       for_each_sched_entity(se)
> -               weight = __calc_prop_weight(cfs_rq_of(se), se, weight);
> +       for_each_sched_entity(se, cfs_rq)
> +               weight = __calc_prop_weight(cfs_rq, se, weight);
>
>         reweight_eevdf(&rq->cfs, &p->se, weight, p->se.on_rq);
>  }
> @@ -6593,6 +6595,8 @@ static __always_inline void return_cfs_r
>
>  static void set_delayed(struct sched_entity *se)
>  {
> +       struct cfs_rq *cfs_rq;
> +
>         /*
>          * Delayed se of cfs_rq have no tasks queued on them.
>          * Do not adjust h_nr_runnable since __dequeue_task()
> @@ -6615,15 +6619,14 @@ static void set_delayed(struct sched_ent
>         pref_llc_running_dec(rq_of(cfs_rq_of(se)), task_of(se));
>         se->sched_delayed = 1;
>
> -       for_each_sched_entity(se) {
> -               struct cfs_rq *cfs_rq = cfs_rq_of(se);
> -
> +       for_each_sched_entity(se, cfs_rq)
>                 cfs_rq->h_nr_runnable--;
> -       }
>  }
>
>  static void clear_delayed(struct sched_entity *se)
>  {
> +       struct cfs_rq *cfs_rq;
> +
>         se->sched_delayed = 0;
>
>         /*
> @@ -6642,11 +6645,8 @@ static void clear_delayed(struct sched_e
>          */
>         pref_llc_running_inc(rq_of(cfs_rq_of(se)), task_of(se));
>
> -       for_each_sched_entity(se) {
> -               struct cfs_rq *cfs_rq = cfs_rq_of(se);
> -
> +       for_each_sched_entity(se, cfs_rq)
>                 cfs_rq->h_nr_runnable++;
> -       }
>  }
>
>  static void
> @@ -7308,14 +7308,16 @@ void unthrottle_cfs_rq(struct cfs_rq *cf
>         walk_tg_tree_from(cfs_rq->tg, tg_nop, tg_unthrottle_up, (void *)rq);
>
>         if (!cfs_rq->load.weight) {
> +               struct cfs_rq *cfs_rq_se;
> +
>                 if (!cfs_rq->on_list)
>                         return;
>                 /*
>                  * Nothing to run but something to decay (on_list)?
>                  * Complete the branch.
>                  */
> -               for_each_sched_entity(se) {
> -                       if (list_add_leaf_cfs_rq(cfs_rq_of(se)))
> +               for_each_sched_entity(se, cfs_rq_se) {
> +                       if (list_add_leaf_cfs_rq(cfs_rq_se))
>                                 break;
>                 }
>         }
> @@ -8161,13 +8163,12 @@ static unsigned long enqueue_hierarchy(s
>         struct sched_entity *se = &p->se;
>         int h_nr_idle = task_has_idle_policy(p);
>         int h_nr_runnable = 1;
> +       struct cfs_rq *cfs_rq;
>
>         if (task_new && se->sched_delayed)
>                 h_nr_runnable = 0;
>
> -       for_each_sched_entity(se) {
> -               struct cfs_rq *cfs_rq = cfs_rq_of(se);
> -
> +       for_each_sched_entity(se, cfs_rq) {
>                 update_curr(cfs_rq);
>
>                 if (!se->on_rq) {
> @@ -8286,16 +8287,15 @@ static void dequeue_hierarchy(struct tas
>         bool task_sleep = flags & DEQUEUE_SLEEP;
>         bool task_delayed = flags & DEQUEUE_DELAYED;
>         bool task_throttled = flags & DEQUEUE_THROTTLE;
> -       int h_nr_runnable = 0;
>         int h_nr_idle = task_has_idle_policy(p);
> +       int h_nr_runnable = 0;
> +       struct cfs_rq *cfs_rq;
>         bool dequeue = true;
>
>         if (task_sleep || task_delayed || !se->sched_delayed)
>                 h_nr_runnable = 1;
>
> -       for_each_sched_entity(se) {
> -               struct cfs_rq *cfs_rq = cfs_rq_of(se);
> -
> +       for_each_sched_entity(se, cfs_rq) {
>                 update_curr(cfs_rq);
>
>                 if (dequeue) {
> @@ -11557,8 +11557,7 @@ static void update_cfs_rq_h_load(struct
>                 return;
>
>         WRITE_ONCE(cfs_rq->h_load_next, NULL);
> -       for_each_sched_entity(se) {
> -               cfs_rq = cfs_rq_of(se);
> +       for_each_sched_entity(se, cfs_rq) {
>                 WRITE_ONCE(cfs_rq->h_load_next, se);
>                 if (cfs_rq->last_h_load_update == now)
>                         break;
> @@ -15237,9 +15236,9 @@ static inline void task_tick_core(struct
>  static void se_fi_update(const struct sched_entity *se, unsigned int fi_seq,
>                          bool forceidle)
>  {
> -       for_each_sched_entity(se) {
> -               struct cfs_rq *cfs_rq = cfs_rq_of(se);
> +       struct cfs_rq *cfs_rq;
>
> +       for_each_sched_entity(se, cfs_rq) {
>                 if (forceidle) {
>                         if (cfs_rq->forceidle_seq == fi_seq)
>                                 break;
> @@ -15317,10 +15316,8 @@ static void task_tick_fair(struct rq *rq
>                 unsigned long weight = NICE_0_LOAD;
>                 struct cfs_rq *cfs_rq;
>
> -               for_each_sched_entity(se) {
> -                       cfs_rq = cfs_rq_of(se);
> +               for_each_sched_entity(se, cfs_rq) {
>                         entity_tick(cfs_rq, se, hrtick);
> -
>                         weight = __calc_prop_weight(cfs_rq, se, weight);
>                 }
>
> @@ -15402,9 +15399,7 @@ static void propagate_entity_cfs_rq(stru
>         /* Start to propagate at parent */
>         se = se->parent;
>
> -       for_each_sched_entity(se) {
> -               cfs_rq = cfs_rq_of(se);
> -
> +       for_each_sched_entity(se, cfs_rq) {
>                 update_load_avg(cfs_rq, se, UPDATE_TG);
>
>                 if (!cfs_rq_pelt_clock_throttled(cfs_rq))
> @@ -15511,9 +15506,7 @@ static void set_next_task_fair(struct rq
>         if (on_rq)
>                 __dequeue_entity(cfs_rq, se);
>
> -       for_each_sched_entity(se) {
> -               cfs_rq = cfs_rq_of(se);
> -
> +       for_each_sched_entity(se, cfs_rq) {
>                 if (!IS_ENABLED(CONFIG_FAIR_GROUP_SCHED) ||
>                     !first || !cfs_rq->h_curr)
>                         set_next_entity(cfs_rq, se);
> @@ -15720,13 +15713,14 @@ static int __sched_group_set_shares(stru
>         for_each_possible_cpu(i) {
>                 struct rq *rq = cpu_rq(i);
>                 struct sched_entity *se = tg_se(tg, i);
> +               struct cfs_rq *cfs_rq;
>                 struct rq_flags rf;
>
>                 /* Propagate contribution to hierarchy */
>                 rq_lock_irqsave(rq, &rf);
>                 update_rq_clock(rq);
> -               for_each_sched_entity(se) {
> -                       update_load_avg(cfs_rq_of(se), se, UPDATE_TG);
> +               for_each_sched_entity(se, cfs_rq) {
> +                       update_load_avg(cfs_rq, se, UPDATE_TG);
>                         update_cfs_group(se);
>                 }
>                 rq_unlock_irqrestore(rq, &rf);
> @@ -15773,6 +15767,7 @@ int sched_group_set_idle(struct task_gro
>                 struct sched_entity *se = tg_se(tg, i);
>                 struct cfs_rq *grp_cfs_rq = tg_cfs_rq(tg, i);
>                 bool was_idle = cfs_rq_is_idle(grp_cfs_rq);
> +               struct cfs_rq *cfs_rq;
>                 long idle_task_delta;
>                 struct rq_flags rf;
>
> @@ -15787,9 +15782,7 @@ int sched_group_set_idle(struct task_gro
>                 if (!cfs_rq_is_idle(grp_cfs_rq))
>                         idle_task_delta *= -1;
>
> -               for_each_sched_entity(se) {
> -                       struct cfs_rq *cfs_rq = cfs_rq_of(se);
> -
> +               for_each_sched_entity(se, cfs_rq) {
>                         if (!se->on_rq)
>                                 break;
>
>
>
