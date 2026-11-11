Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794379647;
	b=optzBEUWwQUJ3sLriC39ZUbokNHmEbLdTQswLD0XV0BL8szG9qIy9GjrpgHi0Qr2YlC5
	 agD1EX7GK6zhnIarA3d233LUOv7+jd98oykaDI9K2x1RiYhVnV3XHfFXqGBMQWTLVVOla
	 mGITacd5LgOw7lpjXqTJjkm+eSBIrdZsOvRCHdyZGs272ICyYFTpF599dn87qdlUVP64F
	 v5HZCXTvggaOyTyVupch2xuMuUOrNE4UpZXMcYCpAJZxwdU1V/8QRoqvGjYTekwFrMKrX
	 crBfG/qdYXv3vHasQN8Dcvtb7iO+o/fhZ+WWZXhGZa3Q28JBb3GT+4m7ywc3ZyFc4IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379647;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:Subject:To:Cc:References:
	 From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=i+pOyF1nFbKZAdOxODrFDRzAlnZ5cSpexdzprMP8u0k=;
	b=rFWt8bkTE7xdAjg0J1djBRpphhKriN60tcj178uN+CvQytJJU12/6T9jimdabG62beqC
	 kAnhaBIYFai1Csmw1jMPXclVrSxhZfE+Ii9p23W0U5KrkPtQJoczfmAEh0zjP91vS5/Zf
	 c4QTXR+WNKfXUHc3N8AzcrKzahknTZHL4YbZld57iWukvJH05t1O3KzdY7fr3Ebg34yKF
	 Q86FtZrlZg1k2mFzu4jj+gVJoUWM3qC+KYBIwgo7/K8pOaywalyumgAudGrvD5u7UOu39
	 ym+xYurC6kGSgtgYgYDTHYVfso+io1AAIMCzzPKSXq1aqerpy+kpKQWfGC1zO8zkMCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.219
Received: from out28-219.mail.aliyun.com (out28-219.mail.aliyun.com [115.124.28.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471B360A262D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:47:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 471B360A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436259|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0612151-0.00558383-0.933201;FP=3735542921565930747|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037034138;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=11;RT=11;SR=0;TI=SMTPD_---.k.Vs0wd_1794379635;
Received: from 172.18.25.145(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.k.Vs0wd_1794379635 cluster:ay29)
          by smtp.aliyun-inc.com;
          Wed, 11 Nov 2026 14:47:16 +0800
Subject: Re: [PATCH v4] sched/fair: Distribute burst-woken tasks when rq depth
 reaches 3x average
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
 bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
 kprateek.nayak@amd.com
Cc: linux-kernel@vger.kernel.org
References: <20261111061803.337042-1-likunyu@open-hieco.net>
From: Li kunyu <likunyu@open-hieco.net>
Message-ID: <b7635a7c-ebda-212f-575a-6d282997210f@open-hieco.net>
Date: Wed, 11 Nov 2026 14:47:19 +0800
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
In-Reply-To: <20261111061803.337042-1-likunyu@open-hieco.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 2026/11/11 14:18, Li kunyu wrote:
> When a task burst-wakes a large number of tasks in a short period, tasks
> can pile up on a single CPU regardless of whether the system has idle
> CPUs or NO_HZ enabled.
> 
> During the periodic load-balance pass at the top-level domain, compute
> and cache the 3x average runqueue depth threshold (floored at 3 tasks)
> in root_domain, updating it only when the value changes.
> 
> In select_task_rq_fair(), if the target runqueue depth reaches 3x the
> system average, fall back to cpumask_any_and_distribute() with
> housekeeping_cpumask(HK_TYPE_DOMAIN) to rotate waking tasks across
> allowed non-isolated CPUs. In addition, reset the periodic load-balance
> and scheduling-domain intervals so regular load balancing can promptly
> smooth out the distribution.
> 
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> Link: https://lore.kernel.org/all/20261021125419.GK2823843@noisy.programming.kicks-ass.net/
> Signed-off-by: Li kunyu <likunyu@open-hieco.net>
> ---
> Changes in v4:
> - Gate the scheduling-domain interval reset within the time_after()
>   conditional block.
> - Update the commit message to match the current implementation.
> - Only update overload_nr_threshold when env->cpus has complete CPU
>   statistics for the domain (Kayra Cizmeci).
> - Filter out isolated CPUs via housekeeping_cpumask(HK_TYPE_DOMAIN).
> 
> Changes in v3:
> - Move the overload check to the end of select_task_rq_fair() and verify
>   dist_cpu has fewer running tasks than new_cpu (Kayra Cizmeci).
> 
> Changes in v2:
> - Rebase onto latest mainline (Kayra Cizmeci).
> - Cache pre-calculated 3x threshold in root_domain and only WRITE_ONCE()
>   when the threshold changes to avoid hotpath math and cacheline dirtying
>   (K Prateek Nayak).
> - Expedite periodic balance via rq->next_balance gated by time_after()
>   (K Prateek Nayak, Kayra Cizmeci).
> ---
>  kernel/sched/fair.c     | 67 ++++++++++++++++++++++++++++++++++++++---
>  kernel/sched/sched.h    |  3 ++
>  kernel/sched/topology.c |  2 ++
>  3 files changed, 68 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index cfc982205b98..46ae9ab62a2d 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -9900,6 +9900,36 @@ static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu)
>  	return target;
>  }
>  
> +/*
> + * Check if a CPU's rq depth reaches the 3x system-wide average threshold
> + * cached in root_domain (floored at 3 tasks).
> + */
> +static inline bool rq_burst_overloaded(int cpu)
> +{
> +	struct rq *rq = cpu_rq(cpu);
> +
> +	if (unlikely(!rq->rd))
> +		return false;
> +
> +	return rq->nr_running >= rq->rd->overload_nr_threshold;
> +}
> +
> +static inline void reset_periodic_lb_interval(int cpu)
> +{
> +	struct sched_domain *sd;
> +	unsigned long next = jiffies + 1;
> +	struct rq *rq = cpu_rq(cpu);
> +
> +	if (time_after(rq->next_balance, next)) {
> +		rq->next_balance = next;
> +
> +		for_each_domain(cpu, sd) {
> +			if (sd->balance_interval > sd->min_interval)
> +				sd->balance_interval = sd->min_interval;
> +		}
> +	}
> +}
> +
>  /*
>   * select_task_rq_fair: Select target runqueue for the waking task in domains
>   * that have the relevant SD flag set. In practice, this is SD_BALANCE_WAKE,
> @@ -9970,12 +10000,22 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>  	/* Slow path */
>  	if (unlikely(sd)) {
>  		new_cpu = sched_balance_find_dst_cpu(sd, p, cpu, prev_cpu, sd_flag);
> -		return select_idle_smt_cpu(p, new_cpu);
> +		new_cpu = select_idle_smt_cpu(p, new_cpu);
> +	/* Fast path */
> +	} else if (wake_flags & WF_TTWU) {
> +		new_cpu = select_idle_sibling(p, prev_cpu, new_cpu);
>  	}
>  
> -	/* Fast path */
> -	if (wake_flags & WF_TTWU)
> -		return select_idle_sibling(p, prev_cpu, new_cpu);
> +	if (unlikely(rq_burst_overloaded(new_cpu))) {
> +		int dist_cpu = cpumask_any_and_distribute(p->cpus_ptr,
> +							  housekeeping_cpumask(HK_TYPE_DOMAIN));
> +
> +		if (likely(dist_cpu < nr_cpumask_bits && cpu_rq(dist_cpu)->nr_running <
> +			   cpu_rq(new_cpu)->nr_running && cpu_active(dist_cpu))) {
> +			reset_periodic_lb_interval(dist_cpu);
> +			return dist_cpu;
> +		}
> +	}
>  
>  	return new_cpu;
>  }
> @@ -11682,6 +11722,7 @@ struct sg_lb_stats {
>  struct sd_lb_stats {
>  	struct sched_group *busiest;		/* Busiest group in this sd */
>  	struct sched_group *local;		/* Local group in this sd */
> +	unsigned long total_nr_running;		/* Sum of nr_running in this sd */
>  	unsigned long total_load;		/* Total load of all groups in sd */
>  	unsigned long total_capacity;		/* Total capacity of all groups in sd */
>  	unsigned long avg_load;			/* Average load across all groups in sd */
> @@ -11705,6 +11746,7 @@ static inline void init_sd_lb_stats(struct sd_lb_stats *sds)
>  		.local = NULL,
>  		.total_load = 0UL,
>  		.total_capacity = 0UL,
> +		.total_nr_running = 0UL,
>  		.busiest_stat = {
>  			.idle_cpus = UINT_MAX,
>  			.group_type = group_has_spare,
> @@ -12977,6 +13019,7 @@ static inline void update_sd_lb_stats(struct lb_env *env, struct sd_lb_stats *sd
>  		/* Now, start updating sd_lb_stats */
>  		sds->total_load += sgs->group_load;
>  		sds->total_capacity += sgs->group_capacity;
> +		sds->total_nr_running += sgs->sum_nr_running;
>  
>  		sum_util += sgs->group_util;
>  		sg = sg->next;
> @@ -13000,6 +13043,22 @@ static inline void update_sd_lb_stats(struct lb_env *env, struct sd_lb_stats *sd
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
> +		if (env->sd->span_weight && cpumask_weight(env->cpus) == env->sd->span_weight) {
> +			unsigned long thresh;
> +
> +			thresh = max_t(unsigned long,
> +				       (sds->total_nr_running * 3) / env->sd->span_weight, 3);
> +
> +			if (READ_ONCE(env->dst_rq->rd->overload_nr_threshold) != thresh)
> +				WRITE_ONCE(env->dst_rq->rd->overload_nr_threshold, thresh);
> +		}
>  	} else if (sg_overutilized) {
>  		set_rd_overutilized(env->dst_rq->rd, sg_overutilized);
>  	}
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 6c7c5633524a..71d946da9600 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -1096,6 +1096,9 @@ struct root_domain {
>  	cpumask_var_t		rto_mask;
>  	struct cpupri		cpupri;
>  
> +	/* 3x average per-CPU rq depth threshold for burst wakeup distribution */
> +	unsigned long		overload_nr_threshold;
> +
>  	/*
>  	 * NULL-terminated list of performance domains intersecting with the
>  	 * CPUs of the rd. Protected by RCU.
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index 919d0fb00bd9..fe154dfdf23e 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -572,6 +572,8 @@ static int init_rootdomain(struct root_domain *rd)
>  
>  	if (cpupri_init(&rd->cpupri) != 0)
>  		goto free_cpudl;
> +
> +	rd->overload_nr_threshold = 3;
>  	return 0;
>  
>  free_cpudl:
> -- 2.47.3

This patch is intended to address all issues raised by the maintainers and to
provide corresponding solutions for the scenarios I can currently think of. The
test data is provided below:


type            pct
hackbench       +8.59%
tbench          +6.48%
schbench 99th   +3.93%
stream-10       +16.15%
stream-100      +18.28%
unixbench       +0.54%
overall average	+8.99%


hackbench:
group   base    patch   pct
g1	0.2304	0.2390	-3.73%
g2	0.2758	0.2922	-5.95%
g4	0.3966	0.3610	+8.98%
g8	0.5548	0.4632	+16.51%
g16	0.8486	0.6900	+18.69%
g32	1.4126	1.1802	+16.45%
g64	2.5856	2.2578	+12.68%
g128	4.4390	4.2116	+5.12%


tbench(throughput):
clients   base          patch           pct
1	485.384	        482.969	        -0.50%
2	811.836	        816.540	        +0.58%
4	1319.689	1362.127	+3.22%
8	2233.837	2402.797	+7.56%
16	4274.337	4795.843	+12.20%
32	9101.237	9326.590	+2.48%
64	15915.367	15527.100	-2.44%
128	27476.967	26524.433	-3.47%
256	30459.233	43098.467	+41.49%
512	39785.467	42592.233	+7.06%
1024	39214.600	40414.600	+3.06%


schbench(99th):
threads base    patch   pct
1	13.4	11.0	+17.91%
2	16.0	16.2	-1.25%
4	21.8	20.8	+4.59%
8	34.2	31.6	+7.60%
16	53.0	49.4	+6.79%
32	90.8	79.2	+12.78%
64	206.2	225.8	-9.51%
128	4568.0	4622.4	-1.19%
256	7915.2	7838.4	+0.97%
512	11382.4	11318.4	+0.56%


stream-10:
operation base          patch           pct
Copy	135092.48	158817.44	+17.56%
Scale	147163.94	167297.82	+13.68%
Add	160465.16	184023.22	+14.68%
Triad	161968.50	192191.64	+18.66%


stream-100:
operation base          patch           pct
Copy	135501.48	190089.78	+40.29%
Scale	146273.42	170908.94	+16.84%
Add	161264.04	176877.28	+9.68%
Triad	157809.52	167770.82	+6.31%


unixbench:
cpu     base      patch         pct
1 	1805.8	  1834.7	+1.60%
384	119849.8  119220.2	-0.53%


Thank you to all the maintainers for their guidance and support.

-- 
thanks,
kunyu
