Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53AC3A1685
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791878320; cv=pass; b=DRLPTxDOH5TeTdnhuMl4Arydkg+A46sgjM/p99n/4mb2xVl9IGUsDf8511nvzJEjru3bwSo9ceAxt18ZHAidc3S7CIHOUFnWMr3/hEgY+0AA818HYtfuXJL7a6yT0xet2nFiMzS2EI5CBFi7vitfqBWSgvjtbixgtfGhRgbTCm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791878320; c=relaxed/simple;
	bh=vNp49wadhCyKSF1m1qU6P8mKiYTomG6dKJ+OnIMl/gU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AFkbpVBopueL+TccMle/yqHlLjrF0rnWi7FpLNo+mnzUbN4yQhSFP7aKLQ+Dr6zNyEWQPu0GR70rSmirySAKMZKtvLuV/BZlCmvFcOWkqEfdkg39smc6VtZZvaNXdQbLcBbkT3NgoULRCoG6BWwN7zFBLzrBn8kJyO6JfDBLmT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nhrjQesj; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nhrjQesj"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c2afa22e1dcso368307266b.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:58:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791878317; cv=none;
        d=google.com; s=arc-20260327;
        b=ZualN7s4GIhNLmEuf6nRvI5jAhoIKv6aIL2xjo1AIuYDzgOq+4gKfjjstCapJjhl7G
         fQA/znzlZzHBmJx0OHygG284knDbW8+64ou0BUaHnRk7wPJEFe2UWbDwjBoS3TQJMXLK
         jT7ETUp71S7wc6aB7ap/qKAHxZUslNL5NymvLp5v15VxW/uD0oxbbLXGLYOt+m5KmTuB
         hiRAwdY/t+QvmPv7xlKNQYLZlHMng1vpP+Pa+OgWMhJXjyc7XRRfHC48yZMIPMlqwz3o
         3/KTCXhFQ+ZsqpeYn3pG8DHiV6tYitNnvb+BfvGOyfrt/FY5X78Z2kVkSozlKmoJwrNs
         Ft3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=L+QLlHRQXQf5lsk8RqoHBERYMxWpafP+2BPykSM1NBk=;
        fh=9C4Pq4dzDP3yJi/lfiuoy7biMcU/9gT69dnv2bm4lCE=;
        b=r5N3f+oIXH6+IfoO9C6/SN8dd1xBrCpBpKq/SVQBrDnzHqRqn5r7HfFmKEQwgUsIcA
         qTgEr+0qgzXVW0mU0/A9/zmN3rgv9hZUeUkJc+wx6dVmfmfRFXAjVn7N/js0Jb8Wie7J
         jGh0LygFi/YD/SZ1sTNPvp+8RCRawKqvoMYVpxedzFiUwlR4Be3fZfIkomYa1S/f9xVR
         pdlInmM5hJpNOqwb5X5iDu5gmVqf8f7SF6YJqLLb7nH1zVY26jBAAzAcctHfHSg/KAnv
         HIpENgzbcotGweNFbaUBFn8F6N9PtxX8nbdIf3/V6S4gaR+nhQi9Z8/CH47pzOS+Ryu+
         GeYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791878317; x=1792483117; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L+QLlHRQXQf5lsk8RqoHBERYMxWpafP+2BPykSM1NBk=;
        b=nhrjQesjbfyNezbzg+sjjVC3hSAth3SyLJbbvh3YxmHIE7sIlluuqUJTqx61oLv5zM
         lGsId0276WuksCKHNFs3Wxr63e2VY8Da457NXC9mXMKJ4WdqkvKIRPGINWuc69U9KpnA
         qV8hVz1DviPoX61seDwd/UDg69FSKXCGHW9Ga/0Kc5Kor66wp11k9ziOdR4WNgvG/Gcs
         uRE+O9Pp0AKDiADWFgK7TdpD3rdQ3Hc5OFG/NmkhX9DSjB8WHxitGo0bGXM/PCpayWOY
         FdMDeIdrEvPZkme9oKcstizUtP3XOosXo0ko7P/6LpIOiJQRYcze0CRc15UMsiuORx3k
         hhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791878317; x=1792483117;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L+QLlHRQXQf5lsk8RqoHBERYMxWpafP+2BPykSM1NBk=;
        b=Pv9WUTr7IukQQfpnATa48oyrJw9et2jcEDrzvMF9xDUQAbrqKJZ2lqwAsVLi4xDww6
         lsn05gdOaTSsEAlP2be6BAMOU+togG369bQd8yEECeZgGsaEh06SnYD7PuvmNpP67D5X
         z9AF2yw2BR+6XzCUZSi0jsWpbn2dYecIV6fdc1+UE78sq6Dw+f5irvLGSpR5KXsLcP9y
         BymQVpus0b3zHWXXwCcCMm4OdgYlfmFPm/7VYdS+PV0qSBYqr/Xrf0BGP+T6NvbSnzhT
         wjOO9TU8s4w6aZjnjm+BK/DGrFk9ZiN6C7iwVRzswAxuqSdp4qBmMBUMquannoC9uSE7
         JuJQ==
X-Forwarded-Encrypted: i=1; AKwUvBysOWd1wwroHZX4suPy3WUAj0iLXQY8SZvHO1lUAnypQQ5n5Gt0QFwPDxmVCq3DKcDJ22MXtxVd5FegmcU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjJOqPHlSoRg9AfpB4KXQZWyJ7qydB/3h6nmy3Hl4/Bm0mc62Q
	vQAIRYAqR41SEzQWAiScjATV5YymY2z56ubsGUzd6PAcxP5/QTGs9rfnqRy32U6aw58rSO23IKB
	1px7pNBjrmKYTT7NOk/EUFZBG/gcJwLjLmO/5RVkJMQ==
X-Gm-Gg: AYBFou2spZCuJUlNGmej53CDIWIZi0MgypINm8I436vdNUP2zusYI5fcZqFVw/6optC
	DEGYTTBrtcMR2lRrJjqJugKn9dDJEeQT7GZYRnDiR+CuS2NqJMLjbyuyAIK5cbLLQ8xANDId5eD
	SG7gOhAMKV2U22ZSClPfmK5WCatpyV0jqtjeIaStzKeNF0ZttMNvV1VUNt0/cpaWA9YMRtvL64Q
	ikKzJTLfXfEZvKcwd7+jNoWfsTdlAt36w1K/W29vaIdVLvaVQMoWnF0Of3c65g9dBm9QyBk+3gN
	yWPbZEzYWbd+3mEDCkCNZw7fmtciGljJXEXhBX73K2w3tNpXs2SHwihPJyYbWmjZpI8WfJpNENa
	Ev2QXowjBlkxD
X-Received: by 2002:a17:906:f5aa:b0:c26:19de:9ac5 with SMTP id
 a640c23a62f3a-c31aa0960bamr1072385066b.29.1791878316702; Tue, 13 Oct 2026
 00:58:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <8fa7f795-518c-4507-b684-60b0c1cac2c5@paulmck-laptop>
 <b2dd8374-63d4-4b04-9e2c-f6a84728f092@amd.com> <69622916-cc8a-44d5-b776-6e25f79aceda@amd.com>
In-Reply-To: <69622916-cc8a-44d5-b776-6e25f79aceda@amd.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 13 Oct 2026 09:58:25 +0200
X-Gm-Features: AclHuK9g15YDV-yHRM5uL2DgWogsr1gbJ5sCUnbM48tOY-bQf9aIPbrLsDo25b4
Message-ID: <CAKfTPtDz35egMZEVz+wb5kytgVrv7APcVOYBkCByvzPSCH7Meg@mail.gmail.com>
Subject: Re: [BUG] Apparent lost wakeups
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: paulmck@kernel.org, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Oct 2026 at 08:46, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
>
> On 10/13/2026 11:36 AM, K Prateek Nayak wrote:
> >> The following command reproduces the lost-wakeup problem, which shows
> >> up as RCU CPU stall warnings caused by rcu_torture_reader() kthreads:
> >>
> >> tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 20m --configs '19*TREE01' --bootargs "nohz=off rcutorture.onoff_interval=0 rcutorture.nocbs_nthreads=0 rcutorture.shuffle_interval=0" --trust-make
> >
> > tl;dr
> >
> > I could hit that WARN_ON() from your debug patch with the above test
> > even under rq_lock. Seemed like a missing resched_curr() but it
> > turned out to also be related to rq->next_class interaction.
> >
> > I haven't been able to hit the warnings with the below diff. Could
> > you please try this:
> >
> > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > index 0f63c30b4324..f2f8af3cdfb5 100644
> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -11239,6 +11245,11 @@ void sched_change_end(struct sched_change_ctx *ctx)
> >               if (p->sched_class->switched_to)
> >                       p->sched_class->switched_to(rq, p);
> >
> > +             if (ctx->queued && sched_class_above(p->sched_class, rq->next_class)) {
> > +                     rq->next_class = p->sched_class;
> > +                     resched_curr(rq);
> > +             }
> > +
> >               if (ctx->running) {
> >                       /*
> >                        * If this was a class promotion; let the old class
> > ---
>
> And now that I've finally woken up just like that task, it can be
> simplified to:
>
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 0f63c30b4324..b37c771c41ad 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -11256,6 +11262,9 @@ void sched_change_end(struct sched_change_ctx *ctx)
                 if (ctx->running) {
                         /*
                         * If this was a class promotion; let the old class
                         * know it got preempted. Note that none of the
                         * switch*_from() methods know the new class and none
                         * of the switch*_to() methods know the old class.
                         */
                         if (sched_class_above(p->sched_class, ctx->class)) {
                                 rq->next_class->wakeup_preempt(rq, p, 0);
                                 rq->next_class = p->sched_class;
                         }
                         /*
                         * If this was a degradation in class; make sure to
                         * reschedule.
>                          */
>                         if (sched_class_above(ctx->class, p->sched_class))
>                                 resched_curr(rq);
> +               } else if (ctx->queued) {
> +                       /* Check if we need can preempt the current task. */
> +                       wakeup_preempt(rq, p, 0);

Isn't what we have for ctx->running above what we also want in this case ?
Then sched_balance_newidle() will detect it with

                 /* If a higher prio class was modified, restart the pick */
                if (rq_modified_above(this_rq, &fair_sched_class))
                         pulled_task = -1;

>                 }
>         } else {
>                 p->sched_class->prio_changed(rq, p, ctx->prio);
> ---
>
> Peter, what do you think?
> > Lightly tested with TREE01 which passes without complains after
> > adding the above diff. Your mileage may vary :-)
>
> That disclaimer still applies.
>
> P.S. This is the output I see with the fix on my 512 CPUs machine
> and 64*TREE01. I hope this is the expected stuff:
>
>   TREE01 ------- 34879 GPs (29.0658/s) [rcu: g238089 f0x0 total-gps=59806]
>   TREE01.10 ------- 33788 GPs (28.1567/s) [rcu: g234153 f0x0 total-gps=58824]
>   TREE01.11 ------- 35987 GPs (29.9892/s) [rcu: g245677 f0x0 total-gps=61702]
>   TREE01.12 ------- 34864 GPs (29.0533/s) [rcu: g239025 f0x0 total-gps=60039]
>   TREE01.13 ------- 34143 GPs (28.4525/s) [rcu: g234145 f0x0 total-gps=58821]
>   TREE01.14 ------- 34603 GPs (28.8358/s) [rcu: g238249 f0x0 total-gps=59848]
>   TREE01.15 ------- 34654 GPs (28.8783/s) [rcu: g236633 f0x0 total-gps=59444]
>   TREE01.16 ------- 34714 GPs (28.9283/s) [rcu: g236617 f0x0 total-gps=59438]
>   TREE01.17 ------- 33838 GPs (28.1983/s) [rcu: g233041 f0x0 total-gps=58545]
>   TREE01.18 ------- 34119 GPs (28.4325/s) [rcu: g232869 f0x0 total-gps=58502]
>   TREE01.19 ------- 34087 GPs (28.4058/s) [rcu: g234413 f0x0 total-gps=58888]
>   TREE01.2 ------- 33669 GPs (28.0575/s) [rcu: g231649 f0x0 total-gps=58198]
>   TREE01.20 ------- 33240 GPs (27.7/s) [rcu: g228757 f0x0 total-gps=57475]
>   TREE01.21 ------- 33656 GPs (28.0467/s) [rcu: g230577 f0x0 total-gps=57929]
>   TREE01.22 ------- 34505 GPs (28.7542/s) [rcu: g233817 f0x0 total-gps=58741]
>   TREE01.23 ------- 35031 GPs (29.1925/s) [rcu: g239141 f0x0 total-gps=60071]
>   TREE01.24 ------- 34771 GPs (28.9758/s) [rcu: g237589 f0x0 total-gps=59683]
>   TREE01.25 ------- 33751 GPs (28.1258/s) [rcu: g229969 f0x0 total-gps=57778]
>   TREE01.26 ------- 35695 GPs (29.7458/s) [rcu: g244333 f0x0 total-gps=61369]
>   TREE01.27 ------- 33001 GPs (27.5008/s) [rcu: g227229 f0x0 total-gps=57093]
>   TREE01.28 ------- 33399 GPs (27.8325/s) [rcu: g230181 f0x0 total-gps=57830]
>   TREE01.29 ------- 34602 GPs (28.835/s) [rcu: g235361 f0x0 total-gps=59125]
>   TREE01.3 ------- 35795 GPs (29.8292/s) [rcu: g243365 f0x0 total-gps=61126]
>   TREE01.30 ------- 34129 GPs (28.4408/s) [rcu: g233673 f0x0 total-gps=58704]
>   TREE01.31 ------- 34713 GPs (28.9275/s) [rcu: g236941 f0x0 total-gps=59521]
>   TREE01.32 ------- 33953 GPs (28.2942/s) [rcu: g233017 f0x0 total-gps=58540]
>   TREE01.33 ------- 34353 GPs (28.6275/s) [rcu: g234397 f0x0 total-gps=58885]
>   TREE01.34 ------- 34836 GPs (29.03/s) [rcu: g238653 f0x0 total-gps=59948]
>   TREE01.35 ------- 33714 GPs (28.095/s) [rcu: g232241 f0x0 total-gps=58344]
>   TREE01.36 ------- 34704 GPs (28.92/s) [rcu: g236349 f0x0 total-gps=59373]
>   TREE01.37 ------- 34205 GPs (28.5042/s) [rcu: g232549 f0x0 total-gps=58424]
>   TREE01.38 ------- 33833 GPs (28.1942/s) [rcu: g232017 f0x0 total-gps=58292]
>   TREE01.39 ------- 34001 GPs (28.3342/s) [rcu: g233089 f0x0 total-gps=58558]
>   TREE01.4 ------- 35768 GPs (29.8067/s) [rcu: g243141 f0x0 total-gps=61069]
>   TREE01.40 ------- 35209 GPs (29.3408/s) [rcu: g239941 f0x0 total-gps=60272]
>   TREE01.41 ------- 34950 GPs (29.125/s) [rcu: g237825 f0x0 total-gps=59743]
>   TREE01.42 ------- 34396 GPs (28.6633/s) [rcu: g234305 f0x0 total-gps=58863]
>   TREE01.43 ------- 33162 GPs (27.635/s) [rcu: g227049 f0x0 total-gps=57046]
>   TREE01.44 ------- 34965 GPs (29.1375/s) [rcu: g238837 f0x0 total-gps=59994]
>   TREE01.45 ------- 33531 GPs (27.9425/s) [rcu: g229529 f0x0 total-gps=57665]
>   TREE01.46 ------- 34167 GPs (28.4725/s) [rcu: g235829 f0x0 total-gps=59242]
>   TREE01.47 ------- 34538 GPs (28.7817/s) [rcu: g236357 f0x0 total-gps=59375]
>   TREE01.48 ------- 34491 GPs (28.7425/s) [rcu: g235029 f0x0 total-gps=59042]
>   TREE01.49 ------- 36278 GPs (30.2317/s) [rcu: g245997 f0x0 total-gps=61784]
>   TREE01.5 ------- 35415 GPs (29.5125/s) [rcu: g240741 f0x0 total-gps=60471]
>   TREE01.50 ------- 34928 GPs (29.1067/s) [rcu: g236977 f0x0 total-gps=59529]
>   TREE01.51 ------- 33065 GPs (27.5542/s) [rcu: g226573 f0x0 total-gps=56929]
>   TREE01.52 ------- 34111 GPs (28.4258/s) [rcu: g234373 f0x0 total-gps=58878]
>   TREE01.53 ------- 35627 GPs (29.6892/s) [rcu: g242797 f0x0 total-gps=60985]
>   TREE01.54 ------- 33155 GPs (27.6292/s) [rcu: g227505 f0x0 total-gps=57160]
>   TREE01.55 ------- 34386 GPs (28.655/s) [rcu: g233137 f0x0 total-gps=58571]
>   TREE01.56 ------- 35130 GPs (29.275/s) [rcu: g237817 f0x0 total-gps=59740]
>   TREE01.57 ------- 34660 GPs (28.8833/s) [rcu: g236409 f0x0 total-gps=59389]
>   TREE01.58 ------- 34901 GPs (29.0842/s) [rcu: g236937 f0x0 total-gps=59521]
>   TREE01.59 ------- 34915 GPs (29.0958/s) [rcu: g238425 f0x0 total-gps=59892]
>   TREE01.6 ------- 35682 GPs (29.735/s) [rcu: g239305 f0x0 total-gps=60112]
>   TREE01.60 ------- 34643 GPs (28.8692/s) [rcu: g235361 f0x0 total-gps=59126]
>   TREE01.61 ------- 34343 GPs (28.6192/s) [rcu: g234857 f0x0 total-gps=58999]
>   TREE01.62 ------- 34592 GPs (28.8267/s) [rcu: g233665 f0x0 total-gps=58703]
>   TREE01.63 ------- 35315 GPs (29.4292/s) [rcu: g239865 f0x0 total-gps=60250]
>   TREE01.64 ------- 34793 GPs (28.9942/s) [rcu: g240109 f0x0 total-gps=60311]
>   TREE01.7 ------- 34171 GPs (28.4758/s) [rcu: g233977 f0x0 total-gps=58779]
>   TREE01.8 ------- 33806 GPs (28.1717/s) [rcu: g233497 f0x0 total-gps=58659]
>   TREE01.9 ------- 34083 GPs (28.4025/s) [rcu: g237765 f0x0 total-gps=59727]
>    --- Done at Tue Oct 13 06:44:58 AM UTC 2026 (22:16.0) exitcode 0
>
> I miss those days where I could just turn around and ask Neeraj
> if this was correct at the office!
>
> --
> Thanks and Regards,
> Prateek
>
