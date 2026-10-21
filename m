Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792589593;
	b=X6df8SxhvY2WwtzzS/uQQTo0xGG5v9OhzB4OVvdM5j8wj/7Q865AT+//Klf+olgqsGUM
	 gI0ghXhwhr/j6Iew4ie1JQsjX+4c3pt/06s5Rm6DZNUJk/6V1CyUd07Vvn7RMFg00UNV3
	 GzX+hA0773+MkaAN01qoBm5NQv+M1Yp4gOFPOvZY3gWbL+hQqS0ryNiD/p4JoQ32DM1r+
	 HaaFJ9c8/EyTV+2TEteZD+TBhFvqfIrnbK5+joPnAwtsZJkWKIVA/sEQmS6j3cqq+PWgX
	 CuL1Ivmm+jq1mWH4G5jpXud2KSBfPzG1RU6V3jbe05XVo4/Omlc7uV0LF4m+SQvlWJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792589593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=mzhN59aUdpFqksyzkN0log26xHQWNSCFpleWOq4jTQY=;
	b=pKjWurDGSaxKecemQkpsR0VI0RTa3A/+SxqGXla6BVKzRDnuz24r9b/3IvIC0TWsrmt8
	 uRBVVvEJtlgFoq/Ri3iHaLyVtG5PU6NgASghh0F4KrF/pui79eklWd6KkXemyOCSS4MqJ
	 77B2KbPEJ3a8nFUug5ng4BZnG/WIdqymEfmosNo42hSjhVXn1uqIAdppNSBaGfUMdb/+H
	 EWCKUkucu8Zs4MDGoAGhvZ/jsKNKLl9/g/W5PKWj5wk1ZsZpk5p8ymUZA2xox3jXRkJ/7
	 bCpKaKtuee9DJqiPFdUFFp1rZAcmWDw4JQCq9mYiPYEhV+1b3H+AZzigZAhKrvFN6nA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pgnaMBle;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77AA606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:33:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E77AA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pgnaMBle
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c263415982eso91583966b.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:33:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792589591; cv=none;
        d=google.com; s=arc-20260327;
        b=DY+JWUCV4Xbh35FF9cecNZvZ3G2JS+uqx4JgckfFY8eBhVSkI4MGwZI0zQNfG3UhBu
         fRsLHqjuDm+0m4L2XNiiwc2Pz2PL533aAQ0n/gIxi/wRK79M/xFQvBiu20jR7Um/RYJd
         xjoiieI9204iO+su6DEg+9yPYFNP2661T9hklzkijRfnkrlxreKZDfepXxdQq0z88bz1
         kekVC6MUfHg4oo1YrL3Lc5WHhhHN5Bh2U0TH/tZ78oKSk7oljkgGGeH4nXgJAOr7qYrC
         Nr3O1YWX2NoZTETlMYij+2h6xgP9KQstQIo35+lG2dvOEjMmDiZ33Dx3KwOGs4F/kI7V
         piqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mzhN59aUdpFqksyzkN0log26xHQWNSCFpleWOq4jTQY=;
        fh=AzXwj8WVz1hyJGFmhcGbrI2eTR0psThxk72ROC9Di8g=;
        b=gR5SlZCAySBna/JiM4vefRD/6grjLEQELIQaxwxNFTmKadjsO8LbTWRTkZXjIl9jr4
         BZ1IG6M1pdzUrzQW1X5oPwTucDXnNSCoa5KniLc0wrSNSyTlOWMk3+64EStZ9MmSqwAE
         ieo37K1thO4giDvinsEFl4PqcsVruz6WeAJLrZOByXS9huNknpPcniHa1mkYekykvSIQ
         EsWGG4lC2MYl1U/PY0dHmT48JNxywpn4aKb4eY7eIE/4tvnN2CzWSJ7vMf9V5Jw+RLMz
         H+7DTIewL1NUAcE3iLsWTtqK2gEvVn37326c2bUMzlPKpkgpVoR45lbd5/Rnj61seSfl
         SxVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792589591; x=1793194391; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mzhN59aUdpFqksyzkN0log26xHQWNSCFpleWOq4jTQY=;
        b=pgnaMBleCn1rfiMKktiiqR8q/NIjJ1erjX1yzrhggkxq5nGGK78/YPQeAZkUV1eIeB
         07hJdMzOQrCFiwO7Pd0amXWgZuSgL/IRqvUO7v4lWJrPhsZGOPc0jlih7fGk/72eMU1W
         F55kr311v3V3FO/whuRxnJRuxfEMhaxGER815OYXj6M8Y92jTNgJMOksKxisuGEgOOzr
         RLqyc13IixpmZxOC0t6Fl1ymbeerFKNbn8QCv7Lldz9HZUN0IkvFgsukWZFPANw5PuRl
         e/iTd3WHxKbG7lbiuT/Z5nKayPhXa1CPDMP6vkE5Oft8KQWKn7jnqWbXro5X+E2OmfcJ
         AGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792589591; x=1793194391;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mzhN59aUdpFqksyzkN0log26xHQWNSCFpleWOq4jTQY=;
        b=vL642se2WjvS5j3L4DPDT0zIdu9EmI7m6mSCffCvcvw9vrgtw2iSJYL06biwsF9kVb
         Y6C1BTMAOZiXJrDxWJXb2vqxGUdSYl/AO+lyNtVswX9obfiaDZcAx7i75uGHVmeoSm1F
         Ot9c5HIer1Tjcw9bPAtrNkNLj2VC2UdHqtonsgVjlesvAYRzOUoVi6TQbPv+NLzIDpBZ
         Oe3kPR/Oqn3zQmzrnHn7H7S2COyIClZlWJatrWxipTGclxkbmOFVOqpwh3eK1ASDPtGJ
         1TdDnFdcDBYuRaA5xk6h/WE4Sgt7GXVVtgNndbeICtDSWoa4sa3BgFa+H0xv8MIeY03D
         3vFw==
X-Forwarded-Encrypted: i=1; AKwUvBw3zRxYPqZRLHOe+cDKNCOQuPJS9awArJXJOCMWZH9pJQiQbRuhj1EdATtTmQyEpf08YV47EJMTMdtzMOw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8VtTdjdnVPuB+5S/6Lm1MMI6LlhC/b9UFhHVGNSaggk0a13Im
	rhZpWIojcg9UocjoHt6E4SwY/+HP1m7hcQ9kLEjclUXll+D6fE9cLk+Q4e+US1p0M7Kgt1zwuhx
	1Cdrj6zBIJ1fYM3Wtvvnve39+74JAg4zYkqU/roUvUw+dIqy0U8ei
X-Gm-Gg: AYBFou2CjDmqqLtJART+1952xq7090yzy5q1ZyicpUq9KdYff8kK9wObEeiUkGqtSw0
	2uAqSbQyNUwQKp7PSPKZ3SenkR6Al1q+AS8B3eTkaW2HNCB+2RrOZ+70BJIBKoEdj6ZpKwPO3RT
	OiZX5O8kkFrO2IWFSZN1QFPHrAvqI1lXlWGm3Tji4sC8zY/eYubCtm3jFo5XPlBIyWo47hw2DhW
	9dWIy8n+sj75N5HhUpyuEso4aOP7e0ZwudI4zsJLQW8pH5geipzRI+MtjEbgKsFBNQuvaqf3hun
	hr7yULJx0HgLpGbwysKNhaZcPvm922vye8Ni4d0jc+jU2yRHGPmnZdNd+q4ShhcjctL1yGJ5S34
	wP9WQFfskHgRV0DYn0YLM8lWCnsIwWvhy/ZWeX/yP9vMrnnwTY0+WVSL2nAMhYgdusxFcNw==
X-Received: by 2002:a17:907:6d24:b0:c2e:808a:f78a with SMTP id
 a640c23a62f3a-c46796e73a9mr181786666b.32.1792589591100; Wed, 21 Oct 2026
 06:33:11 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019182622.1584454-1-vincent.guittot@linaro.org> <20261021131313.GM2823843@noisy.programming.kicks-ass.net>
In-Reply-To: <20261021131313.GM2823843@noisy.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 21 Oct 2026 15:32:59 +0200
X-Gm-Features: AclHuK_wglfPwgvmED2Zs7zk8TF7VCrlIgIH4q9AzKzQdRiB6v4sIHacjNMHvTU
Message-ID: <CAKfTPtDOZ0=nrQe1-WSTamgU0qqdJVvD3KZPtnsqwwnE53BSKA@mail.gmail.com>
Subject: Re: [PATCH v2] sched/eevdf: Fix sched idle task group preemption
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, jakub@okonski.org, 
	longman@redhat.com, tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com, 
	cgroups@vger.kernel.org, jstultz@google.com, qyousef@layalina.io
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2026 at 15:13, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Mon, Oct 19, 2026 at 08:26:22PM +0200, Vincent Guittot wrote:
> > Even with flat hierarchy which puts all runnable tasks in the same cfs rq,
> > we need to parse the hierarchy to check for sched_idle task group.
>
> I F'ing hate cgroups :-(
>
>
> > +static void
> > +find_matching_se(struct sched_entity **se, struct sched_entity **pse)
> > +{
> > +     int se_depth, pse_depth;
> > +
> > +     /*
> > +      * preemption test can be made between sibling entities who are in the
> > +      * same cfs_rq i.e who have a common parent. Walk up the hierarchy of
> > +      * both tasks until we find their ancestors who are siblings of common
> > +      * parent.
> > +      */
> > +
> > +     /* First walk up until both entities are at same depth */
> > +     se_depth = (*se)->depth;
> > +     pse_depth = (*pse)->depth;
> > +
> > +     while (se_depth > pse_depth) {
> > +             se_depth--;
> > +             *se = parent_entity(*se);
> > +     }
> > +
> > +     while (pse_depth > se_depth) {
> > +             pse_depth--;
> > +             *pse = parent_entity(*pse);
> > +     }
> > +
> > +     while (!is_same_group(*se, *pse)) {
> > +             *se = parent_entity(*se);
> > +             *pse = parent_entity(*pse);
> > +     }
> > +}
> > +
> >  static int tg_is_idle(struct task_group *tg)
> >  {
> >       return tg->idle > 0;
> > @@ -476,6 +508,11 @@ static inline struct sched_entity *parent_entity(struct sched_entity *se)
> >       return NULL;
> >  }
> >
> > +static inline void
> > +find_matching_se(struct sched_entity **se, struct sched_entity **pse)
> > +{
> > +}
> > +
> >  static inline int tg_is_idle(struct task_group *tg)
> >  {
> >       return 0;
> > @@ -10129,7 +10166,35 @@ preempt_sync(struct rq *rq, int wake_flags,
> >  }
> >
> >  /*
> > - * Preempt the current task with a newly woken task if needed:
> > + * Preempt an idle entity in favor of a non-idle entity (and don't preempt
> > + * in the inverse case).
> > + */
> > +static inline enum preempt_wakeup_action
> > +wakeup_preempt_sched_idle(struct sched_entity *cse, struct sched_entity *pse)
> > +{
> > +     int cse_is_idle, pse_is_idle;
> > +
> > +     find_matching_se(&cse, &pse);
> > +     WARN_ON_ONCE(!pse);
> > +
> > +     cse_is_idle = se_is_idle(cse);
> > +     pse_is_idle = se_is_idle(pse);
> > +
> > +     /*
> > +      * Preempt an idle entity in favor of a non-idle entity (and don't preempt
> > +      * in the inverse case).
> > +      */
> > +     if (cse_is_idle && !pse_is_idle)
> > +             return PREEMPT_WAKEUP_RESCHED;
> > +
> > +     if (cse_is_idle != pse_is_idle)
> > +             return PREEMPT_WAKEUP_NONE;
> > +
> > +     return PREEMPT_WAKEUP_PICK;
> > +}
> > +
> > +/*
> > + * Preempt the current task with a newly woken task if needed.
> >   */
> >  static void wakeup_preempt_fair(struct rq *rq, struct task_struct *p, int wake_flags)
> >  {
> > @@ -10137,7 +10202,6 @@ static void wakeup_preempt_fair(struct rq *rq, struct task_struct *p, int wake_f
> >       struct task_struct *donor = rq->donor;
> >       struct sched_entity *nse, *se = &donor->se, *pse = &p->se;
> >       struct cfs_rq *cfs_rq = &rq->cfs;
> > -     int cse_is_idle, pse_is_idle;
> >
> >       /*
> >        * XXX Getting preempted by higher class, try and find idle CPU?
> > @@ -10174,22 +10238,14 @@ static void wakeup_preempt_fair(struct rq *rq, struct task_struct *p, int wake_f
> >       if (!sched_feat(WAKEUP_PREEMPTION))
> >               return;
> >
> > -     WARN_ON_ONCE(!pse);
> > -
> > -     cse_is_idle = se_is_idle(se);
> > -     pse_is_idle = se_is_idle(pse);
> > +     preempt_action = wakeup_preempt_sched_idle(se, pse);
> >
> > -     nse = se;
> > -     /*
> > -      * Preempt an idle entity in favor of a non-idle entity (and don't preempt
> > -      * in the inverse case).
> > -      */
> > -     if (cse_is_idle && !pse_is_idle)
> > +     if (preempt_action == PREEMPT_WAKEUP_RESCHED)
> >               goto preempt;
> >
> >       update_curr_fair(rq);
> >
> > -     if (cse_is_idle != pse_is_idle)
> > +     if (preempt_action == PREEMPT_WAKEUP_NONE)
> >               goto update;
> >
> >       /*
>
> What is the actual semantics of cpu.idle nonsense? Why do we care about
> this common ancestor?

AFAICT, cpu.idle applied to one level and against entities at the same level

>
> Can't we do any of:
>
>  - propagate cfs_rq->idle to all child groups in sched_group_set_idle(); or
>
>  - have se_is_idle() walk up and report true if any of the ancestors is
>    idle?

I'm fine with either way but this will change the behavior.

>
> I despise this find_matching_se() thing and was so very glad to have
> deleted it.

+1

>
