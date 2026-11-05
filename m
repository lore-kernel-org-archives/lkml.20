Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793842999;
	b=zibGQ/5qeNwxJ6hMtDG6osLyA2BXifK5YDI4jrou56kZet3VCDIaAzAT2FsX6XsYi2Gg
	 eFLrd3Wy4/qEP7DDlkHcFmpX155uUT2M3jiAcHaYe47pGHr2ADjvG+MG3/Rn+VZB53Rvj
	 gWCMzRSZ2+WmSthBO18VIeOX/g9R78gW8r6ybu9hvAjV/uKp51AZBDyqCfQeYlSHh3mW4
	 Ts10ZvKYb/kkKRBOjAVqSoEOA7s89vmROTI+L1G2vEz/rZEUx43gvDXtnsvsl5VeRneyU
	 ynC52eHVrSUUcGvRLbyvP6WuQ9Ac8sDCBgALxa5SVpGYndWO7KhF63YDq3beaAG8NTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793842999;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:Subject:To:Cc:References:
	 From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Mb9/UGsodxNUX4bADbw3W2V4VNg/PTLJMPoe+rezOqk=;
	b=tPPWiiNUaxMU4DxkShB4afrZT/o68bQ5uTikXIc7VlvXFbdyauJz68Iysadhwlz8EwHj
	 wrA1goj+f1OeowtGsMQWjSVN5U/aG8K6i/Nnpspul8vRhPn8zW1ZfxTk8Ny5kEjung9jf
	 KSG2OHDGAyh+g5kEV1VOknPMsyI2VWJe5pERobHIZB77+v2eBSa2TZstunfz0QnJMgjBM
	 /Ekfmph/kYll5lGDrCkgIPd/u3JdIFYlxjfIBAhr7cFrrv47M4ABKbX9Eijwbr2YM0zXb
	 Owy2vwpAI5Hsy6Z0hwf8i6ENREamVtpP9yDKu2nZW98Oy7nCwrr08HzdtsQb7nQW75g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.124
Received: from out28-124.mail.aliyun.com (out28-124.mail.aliyun.com [115.124.28.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BEE606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 01:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89BEE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436259|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.191224-0.00351119-0.805265;FP=1929608129779721467|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037034184;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.jx6bl9K_1793842983;
Received: from 172.18.25.145(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.jx6bl9K_1793842983 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 05 Nov 2026 09:43:04 +0800
Subject: Re: [PATCH] sched/fair: Distribute burst-woken tasks when rq depth
 reaches 3x average
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
 bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
 kprateek.nayak@amd.com, linux-kernel@vger.kernel.org
References: <20261104091842.266273-1-likunyu@open-hieco.net>
 <autCBv3-foLXkZss@scheduler.schedules>
From: Li kunyu <likunyu@open-hieco.net>
Message-ID: <5e26b0b2-0b87-da79-9cb5-b471c9ebf77a@open-hieco.net>
Date: Thu, 5 Nov 2026 09:43:07 +0800
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
In-Reply-To: <autCBv3-foLXkZss@scheduler.schedules>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Kayra,

On 2026/11/5 2:10, Kayra Cizmeci wrote:
> 
> Hi!
> 
> On Wed, Nov 04, 2026 at 05:18:42PM +0800, Li kunyu wrote:
> 
> FWIW, This doesn't apply to the mainline:
> 
> Patch failed at 0001 sched/fair: Distribute burst-woken tasks when rq depth reaches 3x average
> error: patch failed: kernel/sched/fair.c:9972
> error: kernel/sched/fair.c: patch does not apply

Today, I updated the warehouse branch to the latest version, addressed the
identified issues, and performed another thorough test.

>> When a task burst-wakes a large number of tasks in a short period, tasks
>> can pile up on a single CPU regardless of whether the system has idle
>> CPUs or NO_HZ enabled.
>>
>> Track the average runqueue depth (scaled by SCHED_CAPACITY_SCALE to
>> preserve fractional precision) in root_domain during the periodic
>> load-balance pass.
>>
>> In select_task_rq_fair(), when the target runqueue depth reaches 3x the
>> system-wide average, fall back to cpumask_any_and_distribute(p->cpus_ptr,
>> cpu_active_mask) to rotate waking tasks across allowed CPUs and reset the
>> periodic load balance intervals so regular load balancing can promptly
>> smooth out the distribution.
>>
>> Suggested-by: Peter Zijlstra <peterz@infradead.org>
>> Link: https://lore.kernel.org/all/20261021125419.GK2823843@noisy.programming.kicks-ass.net/
>> Signed-off-by: Li kunyu <likunyu@open-hieco.net>
>> ---
>>  kernel/sched/fair.c     | 70 ++++++++++++++++++++++++++++++++++++++---
>>  kernel/sched/sched.h    |  3 ++
>>  kernel/sched/topology.c |  2 ++
>>  3 files changed, 71 insertions(+), 4 deletions(-)
>>
>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>> index 6e005f1e8dc9..e4d278ac46c4 100644
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -9903,6 +9903,38 @@ static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu)
>>  	return target;
>>  }
>>  
>> +/*
>> + * Check if a CPU's rq depth reaches 3x the system-wide average tracked
>> + * in root_domain (scaled by SCHED_CAPACITY_SCALE, floored at 1 task).
>> + */
>> +static inline bool rq_burst_overloaded(int cpu)
>> +{
>> +	struct rq *rq = cpu_rq(cpu);
>> +	unsigned long avg;
>> +
>> +	if (unlikely(!rq->rd))
>> +		return false;
>> +
>> +	avg = max_t(unsigned long, READ_ONCE(rq->rd->avg_nr_running),
>> +		    SCHED_CAPACITY_SCALE);
>> +
>> +	return (READ_ONCE(rq->nr_running) << SCHED_CAPACITY_SHIFT) >= avg * 3;
>> +}
>> +
>> +static inline void reset_periodic_lb_interval(int cpu)
>> +{
>> +	struct sched_domain *sd;
>> +
>> +	/*
>> +	 * Only the most basic values are updated here to avoid excessive
>> +	 * cost.
>> +	 */
>> +	for_each_domain(cpu, sd) {
>> +		if (READ_ONCE(sd->balance_interval) > sd->min_interval)
>> +			WRITE_ONCE(sd->balance_interval, sd->min_interval);
>> +	}
>> +}
>> +
>>  /*
>>   * select_task_rq_fair: Select target runqueue for the waking task in domains
>>   * that have the relevant SD flag set. In practice, this is SD_BALANCE_WAKE,
>> @@ -9972,11 +10004,19 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>>  
>>  	/* Slow path */
>>  	if (unlikely(sd))
>> -		return sched_balance_find_dst_cpu(sd, p, cpu, prev_cpu, sd_flag);
>> -
>> +		new_cpu = sched_balance_find_dst_cpu(sd, p, cpu, prev_cpu, sd_flag);
>>  	/* Fast path */
>> -	if (wake_flags & WF_TTWU)
>> -		return select_idle_sibling(p, prev_cpu, new_cpu);
>> +	else if (wake_flags & WF_TTWU)
>> +		new_cpu = select_idle_sibling(p, prev_cpu, new_cpu);
>> +
>> +	if (unlikely(rq_burst_overloaded(new_cpu))) {
>> +		int dist_cpu = cpumask_any_and_distribute(p->cpus_ptr, cpu_active_mask);
>> +
>> +		if (likely(dist_cpu < nr_cpumask_bits)) {
>> +			reset_periodic_lb_interval(new_cpu);
> 
> Why are we calling this for new_cpu?

Here, the existing logic is reused, with new_cpu used as the final return value.
It remains unclear whether this approach is appropriate. If it causes no
practical impact, it seems reasonable to keep it unchanged.

>> +			return dist_cpu;
>> +		}
>> +	}
>>  
>>  	return new_cpu;
>>  }
>> @@ -11685,6 +11725,7 @@ struct sg_lb_stats {
>>  struct sd_lb_stats {
>>  	struct sched_group *busiest;		/* Busiest group in this sd */
>>  	struct sched_group *local;		/* Local group in this sd */
>> +	unsigned long total_nr_running;		/* Sum of nr_running in this sd */
>>  	unsigned long total_load;		/* Total load of all groups in sd */
>>  	unsigned long total_capacity;		/* Total capacity of all groups in sd */
>>  	unsigned long avg_load;			/* Average load across all groups in sd */
>> @@ -12964,6 +13005,7 @@ static inline void update_sd_lb_stats(struct lb_env *env, struct sd_lb_stats *sd
>>  		/* Now, start updating sd_lb_stats */
>>  		sds->total_load += sgs->group_load;
>>  		sds->total_capacity += sgs->group_capacity;
>> +		sds->total_nr_running += sgs->sum_nr_running;
>>  
>>  		sum_util += sgs->group_util;
>>  		sg = sg->next;
>> @@ -12982,11 +13024,31 @@ static inline void update_sd_lb_stats(struct lb_env *env, struct sd_lb_stats *sd
>>  		env->fbq_type = fbq_classify_group(&sds->busiest_stat);
>>  
>>  	if (!env->sd->parent) {
>> +		unsigned int weight = env->sd->span_weight;
> 
> Uh-oh. There's something wrong, no?
> 
> span_weight equals all of the CPU's in the domain.
> So in sched_balance_rq() we call sched_balance_find_src_group() and that
> calls update_sd_lb_stats().
> 
> But it just retries balancing when all of the tasks
> in the rq is pinned. In that case the CPU is cleared from the env->cpus
> bitmap. But sum_nr_running is calculated for all env->cpus while
> span_weight is for all of the CPU's in that domain.
> 
> BTW, in theory this could happen multiple times in a row and
> it could make things even worse.
> 
> 
> Or am I missing something?

I have also noticed this. Let us optimize it based on the number of env->cpus.

>> +
>>  		/* update overload indicator if we are at root domain */
>>  		set_rd_overloaded(env->dst_rq->rd, sg_overloaded);
>>  
>>  		/* Update over-utilization (tipping point, U >= 0) indicator */
>>  		set_rd_overutilized(env->dst_rq->rd, sg_overutilized);
>> +
>> +		/*
>> +		 * We update the average task count at the top-level (root)
>> +		 * domain, as this incurs the least overhead and comes
>> +		 * closest to the ideal scenario. The trade-off is that we
>> +		 * must accept some temporary data inaccuracy.
>> +		 */
>> +		if (weight) {
>> +			unsigned long cur_avg;
>> +			unsigned long old_avg;
>> +
>> +			cur_avg = (sds->total_nr_running << SCHED_CAPACITY_SHIFT) / weight;
>> +			old_avg = READ_ONCE(env->dst_rq->rd->avg_nr_running);
>> +			if (old_avg)
>> +				cur_avg = (old_avg * 7 + cur_avg) >> 3;
>> +
>> +			WRITE_ONCE(env->dst_rq->rd->avg_nr_running, cur_avg);
>> +		}
>>  	} else if (sg_overutilized) {
>>  		set_rd_overutilized(env->dst_rq->rd, sg_overutilized);
>>  	}
>> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
>> index e656c7059bf8..4147e043407c 100644
>> --- a/kernel/sched/sched.h
>> +++ b/kernel/sched/sched.h
>> @@ -1077,6 +1077,9 @@ struct root_domain {
>>  	cpumask_var_t		rto_mask;
>>  	struct cpupri		cpupri;
>>  
>> +	/* Scaled (SCHED_CAPACITY_SCALE) average per-CPU rq depth */
>> +	unsigned long		avg_nr_running;
>> +
>>  	/*
>>  	 * NULL-terminated list of performance domains intersecting with the
>>  	 * CPUs of the rd. Protected by RCU.
>> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
>> index 3dab0253976f..41c3b9e30d65 100644
>> --- a/kernel/sched/topology.c
>> +++ b/kernel/sched/topology.c
>> @@ -558,6 +558,8 @@ static int init_rootdomain(struct root_domain *rd)
>>  
>>  	if (cpupri_init(&rd->cpupri) != 0)
>>  		goto free_cpudl;
>> +
>> +	rd->avg_nr_running = SCHED_CAPACITY_SCALE;
>>  	return 0;
>>  
>>  free_cpudl:
>> -- 
>> 2.47.3
>>
> 
> BTW, if we are looking to nr_running for this how about atleast looking
> at our dist_cpu and not returning it if its nr_running is bigger
> than the other CPU. Right now we are looking only at the average.
> 
> Would this work for you? Peter/Li?

I added this condition to the new patch to determine whether it improves the
test results or reduces the impact. Ideally, if the effect proves satisfactory,
this condition should be included.

> Thanks,
> 
> Kayra
> 

In the next round of testing, I will also follow up on the other suggestions to
ensure that the patch meets the quality bar.

-- 
thanks,
kunyu
