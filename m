Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677848;
	b=iUX4J8FaE7FZH7mC5IYiIsyI49WGthIwLnaYRbWrE24pmM3D5bcmkpVBWld1EABIQLkx
	 hrW5fRoMubmKvgXecPpyKTrXjqx0cRPPR1xyQX4J5ufDblEl2Yew03S/l1GtMsHHaRLHZ
	 jbx0k6P9Sqy6Yr982cNWIgHCoi2HRjERgd3+AB1emaLxnn1gBa4YbtK761M2UOPHePcBi
	 7GUkJaLMEgrj4gSj4BpKvoG9EGNAUVUyI46UNG7ojGDf/qG+lcD/URsyyLAIYe09yQvsL
	 cDx3d43DVVA9Q8RgFAfG5/5Dr+r1DXPDYK3qkiH6WPkqhOnJV6o/XGhws9fd+ktL6RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=rZQzdeTjnMwxqQ/ZV/ubzxapbQCVU5F2aGfwkiwNIfU=;
	b=mU52UE4gwu2WR3u4EJB5hIQRrG7lp8SBlLCgBP970dPkqSQpdHLOGhh2GUiDcENHfFOq
	 v6YwQs7+a21zLAu+XGx04nOSuUO8T6VRkLVo/lxVM5iBUYs4hqfrONLFuOGvdPaeSoanO
	 e0ukuYi9h+myGcbn2ZkTOQpnqn29BNHaGXWT5Vv1FywuBvtEV9f2BT9AJdQ4fV3lAQMct
	 2Nc+27XfmLrir2v3po5mia4qmj6XjsMML1doghoZGWq8MpfwbWtI3VyCjyhtq8TFOzwIz
	 2cUXE5yMn8flxNJrEEK863P7eNnfyxq8m+ww4Yi5Ivcrijk8u6IL1LkIqWmtM2aRU1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BB9B9d6a;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C290606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C290606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BB9B9d6a
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c3fae9338f0so26905366b.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792677846; x=1793282646; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rZQzdeTjnMwxqQ/ZV/ubzxapbQCVU5F2aGfwkiwNIfU=;
        b=BB9B9d6aR6kcgWHDYraqRl89uJ5blPgxMajaCSLINjVcxIX9QWsZmV04rC5rFcz5pp
         05ocd1F3ZfiG9reswdnedSi2Bi2B4bWXmLKRw2sO9BLkta+cV2JOs/CNDiC7cjA6ZWb/
         TNM1SjQAp5WltgQFpdvQvjEMdyIGeoWJ/DuvPHq3jCl1QF4lHsjpKtsqAL/JfGXSdI5f
         W5FwuMSqh2BrNEI+kqX2VQ7svMuK3STxyUqN5oJxLita3IDK2qt3SBYAQkEXkWIAmRkI
         WUyI3PyA8KiNRMbs/IuyGHopC4TgIdItWAGKmi7Mhc8iCXawo08JGSczJ7su2+ut9+bQ
         xW8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792677846; x=1793282646;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rZQzdeTjnMwxqQ/ZV/ubzxapbQCVU5F2aGfwkiwNIfU=;
        b=FDPJCSBvPbDROCWOblhBZYKm7hjpSKBgethdulWpNk9NZCw8OyRA/nkIFNEpl4BWow
         H899jyZVlD8s4FnTPapzLIwXB8agTPDG7nBi8YsfwBPKKYjNotCAiEGN6+/NbCvB795v
         nKqV55/KYsPoVMhs9pvYoM+SWKfMDh3jLQRQM19uU3u0xrW5deqrOvzJ1C1Ij9/mL+YJ
         8RYIGNGZJrSVNcNanzKlZLgbRIfbIFCaZLUqRx7YCQGz42DAhjhUsaExcS6VWrOfktFx
         XuRwVpfOBvydkCljZd0bGdjtvR+iy/AfOCM9cP2ONhd/DOOXPZ+G7VQlFReQNyNWkfBr
         7l9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwMZwxJsSOUm+mVbi8eiB9PX2NI+X8ATBjklii5bX8/94NuE4Vqp41WgMEe4iDBUajF/MOMdDTFeXHs264=@vger.kernel.org
X-Gm-Message-State: AFq9FYKneI3n+DVG14jL0/iW+UHjg+C5Vbsnz/w1BQnJpJrZiBMyON4G
	Pm5VYgAR2ZvCbJQjvqduNC635El+l1RDljXz/8IGz1bR0Z26vKAXdrfN
X-Gm-Gg: AYBFou0F0icl7cqXljUv/8zPOWE8qmG5h/iF6i2+Xq+csff5GE1KPO+U+ex6BCeob+Z
	oyHlRAfZpV6dVz8dOFn50NQtRLeYxTkadT+lCDfFIYyEtTzz8XQuA6oik0cJk1kKAelIS31/mxu
	YoGk6hVQNpbsQuqIRkMtpR/5Nm3UF4qt2VQud/bZ4x/Er3dRUuAUIopYH4zGxrMApSLHaknkugD
	/r/VNvXoBWkMEZicit+doVQ+qQek+rrddcc0+0oRE1+tOEHLVTL1X0LVRBTNkQy2RYLqCyy0b7T
	a3ivgdJ8feAbcf1NJ3JlF6QJ9uuqXPT3aHsxS1VJyCpoQBPh3iF4oVxB9Z2+jfgGy0n5RKQz3HV
	RbGoqGC2XVXpu3m2dAPxyGhTAcy+/InJJbRGu79vRbwtpta2Jyt6nywEaweCX2YnnpkFmmNE6KS
	yDUBaDljAnD/6k8RH3eCPX983PZnBPyRttUvSHufJ7fkGihku3sy+09Gy2LZUSsk1v/rfrum9a0
	ClLc7c9HMjihSJc5s5JXATqkV/GfGctSvVxF6QPWJd51/WmSKNoZSfqQjigPRbgAK+gy/Xr0xZ3
	6uAN1G0=
X-Received: by 2002:a17:907:60d3:b0:c43:f1ab:167c with SMTP id a640c23a62f3a-c467919de7cmr581618566b.1.1792677845500;
        Thu, 22 Oct 2026 07:04:05 -0700 (PDT)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a1eecbcsm110132766b.7.2026.10.22.07.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:04:04 -0700 (PDT)
Date: Thu, 22 Oct 2026 17:04:00 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Josh Don <joshdon@google.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, mingo@redhat.com, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, 
	vschneid@redhat.com, kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, 
	jakub@okonski.org, longman@redhat.com, tj@kernel.org, hannes@cmpxchg.org, 
	mkoutny@suse.com, cgroups@vger.kernel.org, jstultz@google.com, qyousef@layalina.io
Subject: Re: [PATCH v2] sched/eevdf: Fix sched idle task group preemption
Message-ID: <atoPmKeaneMLOYCJ@scheduler.schedules>
References: <20261019182622.1584454-1-vincent.guittot@linaro.org>
 <20261021131313.GM2823843@noisy.programming.kicks-ass.net>
 <CAKfTPtDOZ0=nrQe1-WSTamgU0qqdJVvD3KZPtnsqwwnE53BSKA@mail.gmail.com>
 <ati_o5c-SoiOp529@scheduler.schedules>
 <20261021145042.GQ2823843@noisy.programming.kicks-ass.net>
 <CABk29Nv2ZzB1KGEuPmx4VmxTJ6pKmikGMr8cvzzDhHZSKpkgvg@mail.gmail.com>
 <20261022114705.GW88198@noisy.programming.kicks-ass.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261022114705.GW88198@noisy.programming.kicks-ass.net>

On Thu, Oct 22, 2026 at 01:47:05PM +0200, Peter Zijlstra wrote:
> On Wed, Oct 21, 2026 at 09:39:52AM -0700, Josh Don wrote:
> > On Wed, Oct 21, 2026 at 7:50 AM Peter Zijlstra <peterz@infradead.org> wrote:
> > >
> > > On Wed, Oct 21, 2026 at 04:41:52PM +0300, Kayra Cizmeci wrote:
> > > > On Wed, Oct 21, 2026 at 03:32:59PM +0200, Vincent Guittot wrote:
> > > > > On Wed, 21 Oct 2026 at 15:13, Peter Zijlstra <peterz@infradead.org> wrote:
> > >
> > > > > > What is the actual semantics of cpu.idle nonsense? Why do we care about
> > > > > > this common ancestor?
> > > > >
> > > > > AFAICT, cpu.idle applied to one level and against entities at the same level
> > > > >
> > > >
> > > > Yeah. Like on here:
> > > >
> > > >     ROOT
> > > >      /\
> > > >     /  \
> > > >    /    \
> > > >   GA*   GB
> > > >    |    /\
> > > >    V   /  \
> > > >   TA  GC*  GD
> > > >       |    |
> > > >       V    V
> > > >       TB   TC
> > >
> > > (marked GA and GC with * to denote their 'idleness')
> > >
> > > > If GA is idle and GB is not, while GC is idle and were looking to TA and
> > > > TB we gotta choose TB. But if we just look to GC and GA we would choose
> > > > neither. .idle just applies to one level as Vincent says.
> > >
> > > Yeah, that's what we used to do, but the more I think about this, the
> > > less sense it makes!
> > >
> > > Josh added this (added to Cc now), but we have a number of Google folks
> > > on Cc already. It would be good to hear how this is actually used.
> > >
> > >
> > > So in your example TA and TB are both inside an idle group, and
> > > therefore one can argue their behaviour should be like !idle. But their
> > > common ancestor is root, and so the fact that they're contained in idle
> > > groups gets lost (which seems crazeh).
> > 
> > TA and TB have a matching se of GA and GB, since those entities are
> > siblings under the common ancestor. Since GB is not idle but GA is, I
> > would argue that TB should preempt TA.
> 
> So I find this 'weird', at the end both TA and TB are marked idle,
> albeit at different levels in the hierarchy. And yes, with the old code
> this would lead to TB preempting TA, but I really don't see why that's a
> good thing.
> 
> > Consider GA and GB as groups representing different users, and user GB
> > has internally decided to create an idle cgroup GC to adjust
> > competition between its own tasks (TB and TC). This should not affect
> > GB's overall preemption ability against other users.
> 
> It doesn't; TC is not idle and will preempt just fine. But by marking
> GB, and thus TB, as idle, we basically say we don't care about it, so
> preempting should also be irrelevant.
> 
> Consider this:
> 
>      ROOT
>       /\
>      /  \
>     /    \
>    GA*   GB
>     |    /\
>     V   /  \
>    TA  GC*  GD
>        |    |
>        v    V
>        GE   TB
>        /\
>       /  \
>      TC   TD
> 
> Suppose TC runs and TD wakes, with the strict LCA rules we'd find that
> neither is idle and have one preempt the other. Even though they're well
> part of an 'idle' sub-tree.

I'm late by 2 hours or smtg :-(.

If we do this, TA would be 1, and T{C,D} would be 1 too. But at the old
code we would choose one of T{C,D} since GB is the same level as GA and
GA is idle.

I think your case is really weird too. But can't we fix this with just
checking the two tasks are already in the same sub-tree and walk that
sub-tree to the top and if we find a idle one we just don't preempt?

We could also do this fastly with this cfs_rq->idle thingie.

> 
> > However in practice doing the exact computation to determine
> > preemption for relative idle properties (especially on wakeup) is
> > expensive and perhaps not strictly required. This is also why e.g. the
> > whole sched_idle_rq stuff is imprecise. We keep an overall tally of
> > the number of tasks that have a cpu.idle ancestor cgroup and use that
> > for wakeup placement, but if we were trying to be perfect we would
> > need to consider the matching_se stuff for that as well. What I'd say
> > there though is that imprecise placement is better than imprecise
> > preemption.
> > 
> > So overall, I would say the find_matching_se() stuff gives the more
> > ideal preemption decision; my first preference would be to keep it. It
> > avoids a regression with users who delegate cpu.idle internally within
> > their own cgroup hierarchy. FWIW wakeup preemption already does a
> > cgroup ancestor walk via update_curr; find_matching_se is similar in
> > spirit.
> 
> So its probably not the end of the world -- and we sort of still have
> one in put_prev_task_fair(), but still, I find the semantics weird.
> 
> > But to be clear I also don't think it would be terrible if we did
> > something like you suggest, cache whether a cgroup has _any_ cpu.idle
> > ancestor and then just make a single decision on wakeup comparing this
> > for the two tasks. The result of which is TC preempts T{AB}, but TA
> > and TB don't preempt each other. In which case I would suggest we
> > cache that as a part of updating cpu.idle so that we can avoid a
> > pointer chasing loop in se_is_idle().
> 
> Just so. Let me try and implement that, see how horrible it looks.
> 
> > Either of these two will at least also restore some semblance of
> > respecting cgroup cpu.idle in wakeup, as the flattening made it only
> > consider task level SCHED_IDLE.
> 
> Right; I agree the current situation is somewhat broken.
> 
> Something like so ...


I'm late by 2 hours or smtg :-(.

If we do this, TA would be 1, and T{C,D} would be 1 too. But at the old
code we would choose one of T{C,D} since GB is the same level as GA and
GA is idle.

I think your case is really weird too. But can't we fix this with just
checking the two tasks are already in the same sub-tree and walk that
sub-tree to the top and if we find a idle one we just don't preempt?

We could also do this fastly with this cfs_rq->idle thingie.

Still, this all wouldn't be needed if losing the difference between 
TA and T{C,D} is acceptable for us. Is it? Well IDK :-).

Thoughts?


> 
> ---
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index b5546cd27dba..779fcd5a2830 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -15767,6 +15767,40 @@ int sched_group_set_shares(struct task_group *tg, unsigned long shares)
>  	return ret;
>  }
>  
> +struct tg_set_idle_struct {
> +	long idle;
> +	int cpu;
> +};
> +
> +static int tg_set_idle_up(struct task_group *tg, void *data)
> +{
> +	struct tg_set_idle_struct *tsi = data;
> +	struct cfs_rq *grp_cfs_rq = tg_cfs_rq(tg, tsi->cpu);
> +	struct sched_entity *se = tg_se(tg, tsi->cpu);
> +	int old_idle = grp_cfs_rq->idle;
> +	long task_delta;
> +
> +	grp_cfs_rq->idle += tsi->idle;
> +
> +	if (!!old_idle == !!grp_cfs_rq->idle)
> +		return 0;
> +
> +	task_delta = grp_cfs_rq->h_nr_queued - grp_cfs_rq->h_nr_idle;
> +	if (!task_delta)
> +		return 0;
> +
> +	task_delta *= tsi->idle;
> +
> +	for_each_sched_entity(se) {
> +		if (!se->on_rq)
> +			break;
> +
> +		cfs_rq_of(se)->h_nr_idle += task_delta;
> +	}
> +
> +	return 0;
> +}
> +
>  int sched_group_set_idle(struct task_group *tg, long idle)
>  {
>  	int i;
> @@ -15777,49 +15811,22 @@ int sched_group_set_idle(struct task_group *tg, long idle)
>  	if (idle < 0 || idle > 1)
>  		return -EINVAL;
>  
> -	mutex_lock(&shares_mutex);
> -
> -	if (tg->idle == idle) {
> -		mutex_unlock(&shares_mutex);
> +	guard(mutex)(&shares_mutex);
> +	if (tg->idle == idle)
>  		return 0;
> -	}
>  
>  	tg->idle = idle;
>  
>  	for_each_possible_cpu(i) {
>  		struct rq *rq = cpu_rq(i);
> -		struct sched_entity *se = tg_se(tg, i);
> -		struct cfs_rq *grp_cfs_rq = tg_cfs_rq(tg, i);
> -		bool was_idle = cfs_rq_is_idle(grp_cfs_rq);
> -		long idle_task_delta;
> -		struct rq_flags rf;
>  
> -		rq_lock_irqsave(rq, &rf);
> +		guard(rq_lock_irqsave)(rq);
>  
> -		grp_cfs_rq->idle = idle;
> -		if (WARN_ON_ONCE(was_idle == cfs_rq_is_idle(grp_cfs_rq)))
> -			goto next_cpu;
> -
> -		idle_task_delta = grp_cfs_rq->h_nr_queued -
> -				  grp_cfs_rq->h_nr_idle;
> -		if (!cfs_rq_is_idle(grp_cfs_rq))
> -			idle_task_delta *= -1;
> -
> -		for_each_sched_entity(se) {
> -			struct cfs_rq *cfs_rq = cfs_rq_of(se);
> -
> -			if (!se->on_rq)
> -				break;
> -
> -			cfs_rq->h_nr_idle += idle_task_delta;
> -
> -			/* Already accounted at parent level and above. */
> -			if (cfs_rq_is_idle(cfs_rq))
> -				break;
> -		}
> -
> -next_cpu:
> -		rq_unlock_irqrestore(rq, &rf);
> +		struct tg_set_idle_struct tsi = {
> +			.idle = idle ? 1 : -1,
> +			.cpu = i,
> +		};
> +		walk_tg_tree_from(tg, tg_nop, tg_set_idle_up, &tsi);
>  	}
>  
>  	/* Idle groups have minimum weight. */
> @@ -15828,7 +15835,6 @@ int sched_group_set_idle(struct task_group *tg, long idle)
>  	else
>  		__sched_group_set_shares(tg, NICE_0_LOAD);
>  
> -	mutex_unlock(&shares_mutex);
>  	return 0;
>  }
>  
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 499a5649582e..06bcee5bb89f 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -751,7 +751,7 @@ struct cfs_rq {
>  	struct list_head	leaf_cfs_rq_list;
>  	struct task_group	*tg;	/* Group that "owns" this runqueue */
>  
> -	/* Locally cached copy of our task_group's idle value */
> +	/* Sum of all ancestor tg->idle. */
>  	int			idle;
>  
>  # ifdef CONFIG_CFS_BANDWIDTH
