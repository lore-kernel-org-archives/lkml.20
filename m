Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FECA45DF43
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345470; cv=pass; b=AcaTKEc7eNgINnCi7tSMje9urr8ZWve21Cnd0e5qnB4KSs4s/MuQ4wxr5ZKXKP1slCn6u0Oz3iy98letpF5I/2MO2SLCLwD+3pPLhw6RnXUeUc+/J9u0YENcoIB7sj16qwFucunVLj5T1UP0KZpvIvMeL8uwMJkjAukeRf13akA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345470; c=relaxed/simple;
	bh=JQzCMpWO1uwdwQt3Rgszfrp+KPdYDgxMxWWDx+VCbIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZLbYfLXGhB0iJwAkRICUWMPPiWFfaw8nmMoa0nwueDeTzs2Rj7g9OYYlsji6QCnZHcSdIggliPhNJLXPFkVEbYqXZRGJHJuyc11xtbG+qEcRPzWR35/g65NdMZv4U2tEcN91SGvlPy1Ff0jy9DNig+hvZWHykFnjzAoTrLZ0NV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q82ODC4b; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q82ODC4b"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a65e66555cso1206173a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:37:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788345462; cv=none;
        d=google.com; s=arc-20260327;
        b=P8EBHWL6xfevhgd0WXFIOlBsow3MQrElTjkeKmhswT4VJ5kCePdzv5aLTl3Tz10U52
         5VXMo8NIJcYBM2h09ApOlMk2gnblsCJHebovpc8V1nVzqB6De7LkwzlAjfZgOR1jZ/qy
         CzpfOeQys/K3DvK8A50+CwNXgPxYZBw9cbgAyDyagXzxapkKcaqw8SWuyWg1dodmB1ce
         NOQYNexg2bWfPN/vPIGDK76Gest3VZTRUZ3LIRHIiQ42pL+9yGE4f4PiGPiejs9M6FOD
         Z1o9ZHHaMWPJOwCT9j+DVxVAJKvQLy82qum6F6fNkJRzcqpQ56PTYq4R5A53GkWH5NeN
         2Tfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gonY2C6r6BySZPhvnuyVfk3lCSqNsWiiVgQVXyXCEZI=;
        fh=O2rcIsajywTm573XqLoOr1zhU7tRfQt7dBX4hhyPIkc=;
        b=B3BHJWOL5yhDfuPX1Ie1vK8C4tHJ3zCsQxIHLDMrVLg9mXMZfvR6E7n77QJ02cCgbu
         3hC9xs71BCK8t5uIWuY84sLE79yBhJbivS96I3aqaolUdyDrS/Xb4cgGgr86q1Sx1yxj
         bvqCLd3WgBgrB9+TUDhHJOZC/IDeixQm4TCxFzue4MWQZWMzNOYbnpiY6JtkmxbUv/Da
         gXKlCCGJ36CsGrYaluW+DgxeZhfw9+TSVBvwIDKpteolZQBVE7yOp7yx/ZsPOv+/ftYB
         ST/mXCaPF5M25BfE1cGBEIWUVlCMZ0pFaQY+I7wxNSFmqbqpPyGTETQnA10EFnMtTpIC
         sLow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788345462; x=1788950262; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gonY2C6r6BySZPhvnuyVfk3lCSqNsWiiVgQVXyXCEZI=;
        b=q82ODC4brHajp/BGTGnmCE/NuqvTWI0Ew9XzzDzUhJaXJfQCTqVBS7GBooUU20l4cj
         yVOxT27oy1zxrZWTQ1AWv3BfYJk024hL0RuV3ZJb3YMmTEr1Ivo/Ieqa9+Mzd7yZwSAU
         elYUt58OIlv/tDUL0RA7t4QCGcgWG2HKMzr3kBGziWvO1uJb5CI2pGTnuQwpM/uSZJ2t
         BPzNMATPl/Y6kxvCcNsfNcf7iScUFKcK6nrRoaQqUFD/kF8NEC9B/2wUaXbPMtZw3F7j
         Ho4TRnXf9x1+lB1bCytp3vmVhAHoNtX8dsYZ/MkOKDDIH5MyOjkfiWIj7ZgRqRj5WV9t
         +v1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788345462; x=1788950262;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gonY2C6r6BySZPhvnuyVfk3lCSqNsWiiVgQVXyXCEZI=;
        b=pm9hBoxcTAlM4wNN+PkzacazMn2MIoK6PxsjTlxgiDyC9FQJQ6S4oJyMbvZJ0uefJS
         xEvoMcy5AHvEsbaMn0ERscFG6UaRR5LKtr6cXELCIfvzUh7cuZXyzfcAxBk3Bs0OzRy0
         tD+WSz8ZnZv6I5mzLsd/HEntGSFGrTcS3mwgtnS2plubYeXpUdViWK7urhGcbxYqEs0h
         nAXSlMk1TpbkvzdgbsN/sarkJSbtJQCXEx0KnKDVz/NccaWuqVPj5y06RrDqBvYdUtPs
         FuDHx8JCyTUWZbprbGT3zMsnqN4CaiWeaDOuNpStqA/H70Ke8z5r1TGHaB5zmR70UB5V
         dbeQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4kAxgGr5x7eEJNdB8nQNt24Wil/RAc1N3Yb7D19r+I/J/GJ6FIbzS7TalEZhjdaowy56+t9DSzVxdgdI=@vger.kernel.org
X-Gm-Message-State: AFuF++kA4FBfOk9YKdIYkf4Rv7BiexkOTvOU9WjxYCwGnyAreFLQ/Oa/
	Aq7xC44JgS94SzYF3sgZA/JJcnKSGzFSCfOPzCh0t8f/KGMI1xHCqnHDuhXp3Pa/y0GhWYI1xh7
	GAOK6Ua0TGMhiTWAsECKQSLSP/3s2lpgUAXAcw8kcaQ==
X-Gm-Gg: AYBFou11jc3gU5PLjam67lTSAvM29WSRwUrcCZ/NGr0YBja2AbGeJ4zuAB7KLIAf1SS
	KQrlCqGSkTJPILfkufIL+vvqK4JkAQtSZererUyAh4rjADKAj8fXAItZURdZeCZcVEjWGmlkNOp
	IeM+QOVd7IvHJY3vTdaSvU96bNk+fjSXA4uhESI2ld/s1RdvVCKg/cHg7eJOc7+mLdB6WUyBeZN
	3Nkee+DEI4pF9chxtvfWftm66QwotejvuWrfmrWzYvz87BsTSGWkwVOEbVomkaINRM7Yc4a0wzC
	MiZNWbhn7vhlvStkv4rYISOPWPeIFRGKqfppoAzTDWIonPQOI2JDcWs+vO0jK8LOY76z/iMGz1G
	pH4XYz3uYYzA/
X-Received: by 2002:a05:6402:504c:b0:6a6:306c:cceb with SMTP id
 4fb4d7f45d1cf-6a6829aeffamr2386967a12.12.1788345462341; Wed, 02 Sep 2026
 03:37:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828074059.232353141@infradead.org> <20260828075558.660152190@infradead.org>
 <apezcsScwu5hdNrr@fengwei-dev> <CAKfTPtBNAGQUQZbaDKYU7+Nsrcnj4M4p=54XkeML7rrLy+x+ZQ@mail.gmail.com>
 <20260902081301.GS4120091@noisy.programming.kicks-ass.net>
In-Reply-To: <20260902081301.GS4120091@noisy.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 2 Sep 2026 12:37:30 +0200
X-Gm-Features: AcwNN1VU7wJ3Pv4bIR1IR4vDV6MslUsXyTpZI-I9dHZYxeU4_Ix4-LHbO7M-8a8
Message-ID: <CAKfTPtA2Xew+F9EAbmyz8ke5vU9wNTLzi7h2rtFNZ2qYdUiGhA@mail.gmail.com>
Subject: Re: [PATCH 4/4] sched/fair: Rework/fix task_h_load()
To: Peter Zijlstra <peterz@infradead.org>
Cc: Chen Yu <yu.c.chen@intel.com>, mingo@kernel.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, tj@kernel.org, 
	linux-kernel@vger.kernel.org, chen.yu@linux.dev, tim.c.chen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Sept 2026 at 10:13, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Wed, Sep 02, 2026 at 09:55:49AM +0200, Vincent Guittot wrote:
> > On Wed, 2 Sept 2026 at 07:39, Chen Yu <yu.c.chen@intel.com> wrote:
> > >
> > > On Fri, Aug 28, 2026 at 09:41:03AM +0200, Peter Zijlstra wrote:
> > >
> > > [ ... ]
> > >
> > > > @@ -15230,6 +15255,9 @@ static void set_next_task_fair(struct rq
> > > >                       weight = __calc_prop_weight(cfs_rq, se, weight);
> > > >       }
> > > >
> > > > +     for_each_sched_entity_bl(se, cfs_rq)
> > > > +             update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
> > > > +
> > >
> > > It panics during bootup on a 192 Cores system,
> > > [    9.445362][ T1687] Oops: general protection fault, kernel NULL pointer dereference 0x69: 0000 [#1] SMP NOPTI
> > > [   18.987940][ T1687] CPU: 58 UID: 0 PID: 1687 Comm: systemd-udevd Not tainted 7.3.0-rc1-flat-hload+ #9 PREEMPTLAZY
> > > [   19.022374][ T1687] RIP: 0010:pick_task_fair+0x43/0xd0
> > > [   19.175316][ T1687]  <TASK>
> > > [   19.181239][ T1687]  __pick_next_task+0x49/0x1b0
> > > [   19.189229][ T1687]  __schedule+0x14b/0x6b0
> > > [   19.196711][ T1687]  preempt_schedule+0x3a/0x60
> > > [   19.204543][ T1687]  preempt_schedule_thunk+0x16/0x40
> > > [   19.212931][ T1687]  _raw_spin_unlock_irqrestore+0x2b/0x30
> > > [   19.221833][ T1687]  autogroup_move_group+0xc5/0x160
> > > [   19.230124][ T1687]  sched_autogroup_create_attach+0xa7/0x180
> > > [   19.239280][ T1687]  ksys_setsid+0x12c/0x170
> > > [   19.246753][ T1687]  __do_sys_setsid+0xe/0x20
> > > [   19.254292][ T1687]  do_syscall_64+0xbc/0x470
> > > [   19.307858][ T1687]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > > [   19.316405][ T1687] RIP: 0033:0x7f347bfbcb9b
> > >
> > > It seems that the crash is a read of se->sched_delayed on a NULL se inside
> > > pick_next_entity(), so pick_eevdf() return NULL
> >
> > I faced the same crash while testing
>
> Weirdly that crash didn't show up for me :-(, I had a few others that I
> cured.

Some of my platforms didn't crash until I added +cpu in cgroup.sub_controller

>
> > >
> > > After the following top->down backlink traverse,
> > > for_each_sched_entity_bl(se, cfs_rq)
> > >     update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
> > >
> > > cfs_rq is not the root->cfs_rq anymore, but a middle cfs_rq(autogroup
> > > in above example). Meanwhile rq->cfs.curr remains NULL because the
> > > rq->cfs.curr has been dequeued if the task is runnable and queued:
> > > if (on_rq)
> > >         __dequeue_entity(cfs_rq, se)
> > >
> > > se = &p->se;
> > > cfs_rq->curr = se; /*wrong cfs_rq*/
> > >
> > > Then later _raw_spin_unlock_irqrestore triggers the scheduling
> > > it picks from rq->cfs_rq.curr with a NULL tree.
> > >
> > > Maybe we need to restore the rq->cfs_rq after the
> > > for_each_sched_entity_bl()?
> > > se = &p->se;
> > > cfs_rq = &rq->cfs; <--
> >
> > Yes, this fixes it for me too
>
> So I had this issue in task_tick_fair(), where
> for_each_sched_entity_bl() clobbered cfs_rq, and fixed that by moving
> things after reweight_eevdf() (which is what uses cfs_rq).

Yeah, all eevdf related things aim to use root cfs

>
> I at point I did actually look to see if anybody else would suffer that
> same problem, but clearly I missed one.
>
> I'm thinking the problem here is set_next_task_fair() ? I think I
> misread the:
>
>         se = &p->se;
>         cfs_rq->curr = se;
>
> to reset both se and cfs_rq, but clearly it doesn't. The below should
> fix I suppose. Let me go and try and reproduce.

it doesn't boot witht he below

>
>
> ---
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -15287,9 +15287,6 @@ static void set_next_task_fair(struct rq
>                         weight = __calc_prop_weight(cfs_rq, se, weight);
>         }
>
> -       for_each_sched_entity_bl(se, cfs_rq)
> -               update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
> -
>         if (throttled)
>                 task_throttle_setup_work(p);
>
> @@ -15302,6 +15299,9 @@ static void set_next_task_fair(struct rq
>                         set_protect_slice(cfs_rq, se);
>         }
>
> +       for_each_sched_entity_bl(se, cfs_rq)

Doesn't for_each_sched_entity_bl assume to start from root cfs as well ?


> +               update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
> +

This modifies se, which is then used below in
list_move(se->group_node, &rq->cfs_tasks);
and
WARN_ON_ONCE(se->sched_delayed); below

Might be good to save pse = p->se


>         if (task_on_rq_queued(p)) {
>                 /*
>                  * Move the next running task to the front of the list, so our
