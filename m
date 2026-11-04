Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793815825;
	b=s7AnV1L+fuY6Mc4nGwd+z5ZoI+xHkLIT4SGYHJRlO9+pNGPSxyO7PIvgqQ8AB+4xvtmd
	 tPEkWG6x6qCsbzAVqBrez2J9QGoqfVwUMUS/lEY2wVu23iDvpmwnUcI150kQI/Akbr+so
	 7c7tONSXG3g+mCK2yLkY/KJEay0pOm25H8EfaVNVxr656Py4FedIwhFEmPzHGI06tyzGs
	 Co2fXUUOY5Gj3m7TKurlrpdQZeUu9Kz88MpHKI2z9oF6IGOErY4xQZjrsCuTOuBWqjPP8
	 pYGjt1pe42hhHTIX3QxnFqF9De82tOr7HNxqBn7KfgVcifbQ435v3+vdMsspGxBQLtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=A1fQxrfrIqAj2C/s0zsWitRVxoDYs1vi7ETfy0pYPY8=;
	b=ngVF+lte0cRRFoszMwoFMtxGRJBgsHWNutjeYN6aoJygsvCEUNwduKYTVc8QIqNoEosq
	 3JAMATOXVDCEYOk8DFEOuU+6lOxzsUMnNQN0KElJW5wRJppEi6kFXdJJPSPQgr5XlhGqJ
	 WBEBrFGwjSTTCv1KUfejOY/kfeiXPiaSYusvRwNNyX+TzyYR/74olc39o3St14i+Ep5Td
	 7CrRyzys+vyurPZbGNZKPK3d6yfOmr1CzCTkh/V/wCfdj7XpHEN/Sw67i2v0S/epVvWbR
	 ZjriUGfDdjH3V5rRmh0IfcTBQ/5Mko7juWgJ9i/eA0hSzqAiDMvDFtmDqr9HySTweFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CpjbkA9Q;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29046606A334
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29046606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CpjbkA9Q
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4af52002471so2126465e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793815823; x=1794420623; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A1fQxrfrIqAj2C/s0zsWitRVxoDYs1vi7ETfy0pYPY8=;
        b=CpjbkA9QSGZzW67a1OZV6KJfPYUtNP+D5jqADt/3lo42HbwNjPiC8q9F2962V0cIc0
         WHcd8hIR9DKawu4gCObDLC+u4wPZS09UxLGRLaFBFjZsMFj87QLQS2+CwYIFM3ApLoE6
         uZb9FNZlO6hExf1JOj0TdSaaTMw4nn+YJq3HFAVukq8tiDwmXoM5kikKQBP4pPauNkly
         Qte+GGtWA945rsJvgjK53cs1hKAHYgwuH8KNpXGpO7oVFFSLp0hnRQhb4Z2xDrORf+7Z
         i/zcF71k0b3HSf/a9qhJADp1uK4pSGr2l5omMWW/VDgeeQYn2CgYfrgG1SG0sxGRQose
         nIDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793815823; x=1794420623;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A1fQxrfrIqAj2C/s0zsWitRVxoDYs1vi7ETfy0pYPY8=;
        b=yYveUe9oq6j8QgCcK3ZjhKPi3IvBsLpdeDByGs8/s+btkCERiwWlZnKwRC3qWP1/Sa
         /fM9WJVUOvoeco9IofGNFVRgHpOZliP7HTdRvctLnUTviG4ESorNfg6IpGj8rT86+l+I
         3P0Cj2GoanUDaJlIeIIbQ8q6b58EVOq++roGvyhfbJXlFJVEY11v0pqjSw2xqFjY7J14
         Qv3CNVi/5NscT1vIdE3l08iXyuQbou7G1U06OVd1U79LeIj1DqsL6lXKyZO4mT71jwSp
         ouBAGuif4Bvvm8xGxyEjPC/U2NI2bE7cXsChspkybvXAHy67e6Fwc3p3h3jaLHesxv15
         3DJw==
X-Forwarded-Encrypted: i=1; AKwUvByv3cCmTDcdlcpir/fhRxNMFsIibQjVP3ZnaHh/QkR2DgbSckQWC+tEqHCscQJpH64/qbBOxFclYsYMUOE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+Q6P9MLylnhclz/2WKp+M9ZNtlnSc7sEA9pdb80/1wocTdSRo
	9/5ABL+noWvwj1V8q21s6gttozLFAtQkDaif9HYn3lKjTCBcSZjqYMS5vXF2xw==
X-Gm-Gg: AYBFou3fjujSwVPst66caq0ZXGPq9igVozfryq6GpZRUq0016Z3yg168U3VZ31AmtXS
	lnNynqwfJ/Wrx0kryU0IPA7UVLfjSqXjXtbH7KcEITxuWqq7ZejaGAR/QtUnomRkb+tKBQCPD2f
	LvpShcoZTBFH544bXjx7VZMDrvvH0ZK02OvJMcwT8Tr+iKw7hA2uF6h5I12sY9e+IAB/QA1vKL+
	mSGLxnAjn74j+R228D/kXIeYEWIS8IclkR4h1XrqocsImW5mCcSGcDfuC9JM1HeNMd8HoF4mjf6
	vgaXA6U6u+ZCmVMYTFbfHRiKVsoFCNiteOgDzFxjpH7bztNf4URJNCDhF04lwMLqAqkVVYaVjpa
	G82lPXnL11DMvl8TQhXHVnzq3YZB395CHuh6GFMXBgR6P9umT1vk+PVe8wCdZcZglZhK44/9n7F
	PmeyhyBcMvxQj7BHxOWzEiu2IWLzaK3XviXyC3BfbUpuPAjt2qOwmP464VeIP+dqPMaZcakGu4w
	hiKdE5GishR9NPNV3xVUe3o9tAOCoJhCVzZYDLOuOb/4Uj/C1PgFKOlk+gClltKdEiqhZaGOQeK
	1E2oV6y3e2Do8AoABPt/0/U53wV7rfcbP8+wHjGdcJ2KtA73ssjuF+E=
X-Received: by 2002:a05:600c:2604:b0:4a1:b027:99ef with SMTP id 5b1f17b1804b1-4ac16acfa8emr281006995e9.2.1793815823331;
        Wed, 04 Nov 2026 10:10:23 -0800 (PST)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b414b170d0sm48985275e9.1.2026.11.04.10.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:10:22 -0800 (PST)
Date: Wed, 4 Nov 2026 21:10:19 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Li kunyu <likunyu@open-hieco.net>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/fair: Distribute burst-woken tasks when rq depth
 reaches 3x average
Message-ID: <autCBv3-foLXkZss@scheduler.schedules>
References: <20261104091842.266273-1-likunyu@open-hieco.net>
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
In-Reply-To: <20261104091842.266273-1-likunyu@open-hieco.net>


Hi!

On Wed, Nov 04, 2026 at 05:18:42PM +0800, Li kunyu wrote:

FWIW, This doesn't apply to the mainline:

Patch failed at 0001 sched/fair: Distribute burst-woken tasks when rq depth reaches 3x average
error: patch failed: kernel/sched/fair.c:9972
error: kernel/sched/fair.c: patch does not apply

> When a task burst-wakes a large number of tasks in a short period, tasks
> can pile up on a single CPU regardless of whether the system has idle
> CPUs or NO_HZ enabled.
> 
> Track the average runqueue depth (scaled by SCHED_CAPACITY_SCALE to
> preserve fractional precision) in root_domain during the periodic
> load-balance pass.
> 
> In select_task_rq_fair(), when the target runqueue depth reaches 3x the
> system-wide average, fall back to cpumask_any_and_distribute(p->cpus_ptr,
> cpu_active_mask) to rotate waking tasks across allowed CPUs and reset the
> periodic load balance intervals so regular load balancing can promptly
> smooth out the distribution.
> 
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> Link: https://lore.kernel.org/all/20261021125419.GK2823843@noisy.programming.kicks-ass.net/
> Signed-off-by: Li kunyu <likunyu@open-hieco.net>
> ---
>  kernel/sched/fair.c     | 70 ++++++++++++++++++++++++++++++++++++++---
>  kernel/sched/sched.h    |  3 ++
>  kernel/sched/topology.c |  2 ++
>  3 files changed, 71 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 6e005f1e8dc9..e4d278ac46c4 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -9903,6 +9903,38 @@ static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu)
>  	return target;
>  }
>  
> +/*
> + * Check if a CPU's rq depth reaches 3x the system-wide average tracked
> + * in root_domain (scaled by SCHED_CAPACITY_SCALE, floored at 1 task).
> + */
> +static inline bool rq_burst_overloaded(int cpu)
> +{
> +	struct rq *rq = cpu_rq(cpu);
> +	unsigned long avg;
> +
> +	if (unlikely(!rq->rd))
> +		return false;
> +
> +	avg = max_t(unsigned long, READ_ONCE(rq->rd->avg_nr_running),
> +		    SCHED_CAPACITY_SCALE);
> +
> +	return (READ_ONCE(rq->nr_running) << SCHED_CAPACITY_SHIFT) >= avg * 3;
> +}
> +
> +static inline void reset_periodic_lb_interval(int cpu)
> +{
> +	struct sched_domain *sd;
> +
> +	/*
> +	 * Only the most basic values are updated here to avoid excessive
> +	 * cost.
> +	 */
> +	for_each_domain(cpu, sd) {
> +		if (READ_ONCE(sd->balance_interval) > sd->min_interval)
> +			WRITE_ONCE(sd->balance_interval, sd->min_interval);
> +	}
> +}
> +
>  /*
>   * select_task_rq_fair: Select target runqueue for the waking task in domains
>   * that have the relevant SD flag set. In practice, this is SD_BALANCE_WAKE,
> @@ -9972,11 +10004,19 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>  
>  	/* Slow path */
>  	if (unlikely(sd))
> -		return sched_balance_find_dst_cpu(sd, p, cpu, prev_cpu, sd_flag);
> -
> +		new_cpu = sched_balance_find_dst_cpu(sd, p, cpu, prev_cpu, sd_flag);
>  	/* Fast path */
> -	if (wake_flags & WF_TTWU)
> -		return select_idle_sibling(p, prev_cpu, new_cpu);
> +	else if (wake_flags & WF_TTWU)
> +		new_cpu = select_idle_sibling(p, prev_cpu, new_cpu);
> +
> +	if (unlikely(rq_burst_overloaded(new_cpu))) {
> +		int dist_cpu = cpumask_any_and_distribute(p->cpus_ptr, cpu_active_mask);
> +
> +		if (likely(dist_cpu < nr_cpumask_bits)) {
> +			reset_periodic_lb_interval(new_cpu);

Why are we calling this for new_cpu?

> +			return dist_cpu;
> +		}
> +	}
>  
>  	return new_cpu;
>  }
> @@ -11685,6 +11725,7 @@ struct sg_lb_stats {
>  struct sd_lb_stats {
>  	struct sched_group *busiest;		/* Busiest group in this sd */
>  	struct sched_group *local;		/* Local group in this sd */
> +	unsigned long total_nr_running;		/* Sum of nr_running in this sd */
>  	unsigned long total_load;		/* Total load of all groups in sd */
>  	unsigned long total_capacity;		/* Total capacity of all groups in sd */
>  	unsigned long avg_load;			/* Average load across all groups in sd */
> @@ -12964,6 +13005,7 @@ static inline void update_sd_lb_stats(struct lb_env *env, struct sd_lb_stats *sd
>  		/* Now, start updating sd_lb_stats */
>  		sds->total_load += sgs->group_load;
>  		sds->total_capacity += sgs->group_capacity;
> +		sds->total_nr_running += sgs->sum_nr_running;
>  
>  		sum_util += sgs->group_util;
>  		sg = sg->next;
> @@ -12982,11 +13024,31 @@ static inline void update_sd_lb_stats(struct lb_env *env, struct sd_lb_stats *sd
>  		env->fbq_type = fbq_classify_group(&sds->busiest_stat);
>  
>  	if (!env->sd->parent) {
> +		unsigned int weight = env->sd->span_weight;

Uh-oh. There's something wrong, no?

span_weight equals all of the CPU's in the domain.
So in sched_balance_rq() we call sched_balance_find_src_group() and that
calls update_sd_lb_stats().

But it just retries balancing when all of the tasks
in the rq is pinned. In that case the CPU is cleared from the env->cpus
bitmap. But sum_nr_running is calculated for all env->cpus while
span_weight is for all of the CPU's in that domain.

BTW, in theory this could happen multiple times in a row and
it could make things even worse.


Or am I missing something?


> +
>  		/* update overload indicator if we are at root domain */
>  		set_rd_overloaded(env->dst_rq->rd, sg_overloaded);
>  
>  		/* Update over-utilization (tipping point, U >= 0) indicator */
>  		set_rd_overutilized(env->dst_rq->rd, sg_overutilized);
> +
> +		/*
> +		 * We update the average task count at the top-level (root)
> +		 * domain, as this incurs the least overhead and comes
> +		 * closest to the ideal scenario. The trade-off is that we
> +		 * must accept some temporary data inaccuracy.
> +		 */
> +		if (weight) {
> +			unsigned long cur_avg;
> +			unsigned long old_avg;
> +
> +			cur_avg = (sds->total_nr_running << SCHED_CAPACITY_SHIFT) / weight;
> +			old_avg = READ_ONCE(env->dst_rq->rd->avg_nr_running);
> +			if (old_avg)
> +				cur_avg = (old_avg * 7 + cur_avg) >> 3;
> +
> +			WRITE_ONCE(env->dst_rq->rd->avg_nr_running, cur_avg);
> +		}
>  	} else if (sg_overutilized) {
>  		set_rd_overutilized(env->dst_rq->rd, sg_overutilized);
>  	}
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index e656c7059bf8..4147e043407c 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -1077,6 +1077,9 @@ struct root_domain {
>  	cpumask_var_t		rto_mask;
>  	struct cpupri		cpupri;
>  
> +	/* Scaled (SCHED_CAPACITY_SCALE) average per-CPU rq depth */
> +	unsigned long		avg_nr_running;
> +
>  	/*
>  	 * NULL-terminated list of performance domains intersecting with the
>  	 * CPUs of the rd. Protected by RCU.
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index 3dab0253976f..41c3b9e30d65 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -558,6 +558,8 @@ static int init_rootdomain(struct root_domain *rd)
>  
>  	if (cpupri_init(&rd->cpupri) != 0)
>  		goto free_cpudl;
> +
> +	rd->avg_nr_running = SCHED_CAPACITY_SCALE;
>  	return 0;
>  
>  free_cpudl:
> -- 
> 2.47.3
> 

BTW, if we are looking to nr_running for this how about atleast looking
at our dist_cpu and not returning it if its nr_running is bigger
than the other CPU. Right now we are looking only at the average.

Would this work for you? Peter/Li?


Thanks,

Kayra

