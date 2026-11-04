Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.194
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793784865;
	b=RHsYKKuBfJlyT7zx2rMUvincqrO7jScaW6jEDKN+pfcDdMQxPmlU4Ma4aGIfyJa7+BvE
	 eHai9Lv/HE3aYRfAH4RHpO2Mi5E60iA7y6f02As2xhCljprneizI01BEM4yJO6wrkMjoE
	 Q1p3x49N16vQIvzNvhG+eHm9JKf8yDqeTnIgHlTm5aIkOVrX1J3QejEnkp5Vuyp6yclS4
	 TH9YfOvS3cpgNa3YuV81hI2jIwvgQk5ZFnHb2wYc+xIP51HIodklpjgJ3Gt4n7BRhtYZ+
	 IJRVoIaWpVsH2z6vE4KohxXgpbd4thSipbtnL6iingKKj+ydFe11V+n3dW9ZUcgPJIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784865;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:Subject:To:Cc:References:
	 From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=/hbPdXBha6nBDFQ8LAmK466OmnWOluaenC9AL0XNqTs=;
	b=ti6YAn0BBMMDICMvmG0zMJIzIyOUTBsJfmdM/qkg9APTNbGG01nJf41zThAhG2e8bPYn
	 ntXJ6iWOsaIKGAveIpJuBJKPmRRuVcmBESH6WGDM/E+hC9WpodWG7R2wSW4kvYwgPli/Q
	 AVo2q8/oXutZ0UesRh9Mus7iTt/NSgDQPyshfeGFds5X5oJ9fZzPzzsFE7U1ngEHRsK9n
	 horZmB9ozze6BGsO4515/NE8y8/pY2OIoo8WQexP75qwOmTd2zXAGW5prr1G4wjpmEbXR
	 bRsn7klXh7uVpTva69J7BzPewzmZVcxgFhv+QGyovdJbRb0H06W5Za/VOQh4einJsvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.194
Received: from out28-194.mail.aliyun.com (out28-194.mail.aliyun.com [115.124.28.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22577606A331
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:34:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22577606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436259|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.142377-0.0232716-0.834351;FP=11153015351543416059|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033023087102;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=11;RT=11;SR=0;TI=SMTPD_---.jwgrKdR_1793784852;
Received: from 172.18.25.145(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.jwgrKdR_1793784852 cluster:ay29)
          by smtp.aliyun-inc.com;
          Wed, 04 Nov 2026 17:34:13 +0800
Subject: Re: [PATCH] sched/fair: Distribute burst-woken tasks when rq depth
 reaches 3x average
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
 bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
 kprateek.nayak@amd.com
Cc: linux-kernel@vger.kernel.org
References: <20261104091842.266273-1-likunyu@open-hieco.net>
From: Li kunyu <likunyu@open-hieco.net>
Message-ID: <d01895ff-6f83-4cb2-2968-a3df5684e60e@open-hieco.net>
Date: Wed, 4 Nov 2026 17:34:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261104091842.266273-1-likunyu@open-hieco.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 2026/11/4 17:18, Li kunyu wrote:
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
> 


Based on the suggestions from RFC patch 5, I independently developed a patch.
Verification showed highly satisfactory results: performance improved in the
vast majority of tests. The test comparison is provided below:


type            pct
hackbench	+12.2%
tbench	+7.9%
schbench 99th	+2.6%
stream-10	+38.5%
stream-100	+52.0%
unixbench	+2.1%
overall average	+19.2%


hackbench:
group   base    patch  pct
-g 1	0.262	0.232	+11.5%
-g 2	0.288	0.299	-4.0%
-g 4	0.407	0.353	+13.3%
-g 8	0.567	0.467	+17.8%
-g 16	0.836	0.667	+20.2%
-g 32	1.411	1.164	+17.5%
-g 64	2.473	2.250	+9.0%


tbench(throughput):
clients   base          patch          pct
1	475.97	        487.16	        +2.4%
2	714.48	        757.36	        +6.0%
4	1349.73	        1484.51	        +10.0%
8	2059.00	        2193.00	        +6.5%
16	4364.25	        4305.11	        -1.4%
32	8325.17	        8102.79	        -2.7%
64	12614.20	15140.07	+20.0%
128	15845.07	21614.20	+36.4%
256	20837.93	23567.93	+13.1%
512	29820.67	28243.37	-5.3%
1024	25969.93	26559.50	+2.3%


schbench(99th):
threads base    patch   pct
1	14.2	12.0	+15.5%
2	16.6	16.8	−1.2%
4	21.0	20.6	+1.9%
8	33.4	33.4	0.0%
16	54.6	50.4	+7.7%
32	93.4	79.0	+15.4%
64	196.4	219.6	−11.8%
128	4753.6	4804.8	−1.1%
256	7900.8	7822.4	+1.0%
512	11177.6	11318.4	−1.3%


stream-10:
operation base          patch           pct
Copy	  126408	188733	        +49.3%
Scale	  124057	184036	        +48.4%
Add	  160037	203560	        +27.2%
Triad	  156224	201937	        +29.3%


stream-100:
operation base          patch           pct
Copy	  172068	275389	        +60.1%
Scale	  156385	248252	        +58.7%
Add	  158850	231243	        +45.6%
Triad	  162271	232983	        +43.6%


unixbench:
cpu     base      patch        pct
1  	1808.3	  1847.5       +2.2%
384 	113834.2  116173.0     +2.1%


-- 
thanks,
kunyu
