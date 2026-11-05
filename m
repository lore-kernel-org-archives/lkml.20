Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877906;
	b=EENfEBp6ofT0cRnxCsAjZlgZKZsE+2v53rcJbFRNUlt2vDlnn55ShR5pzCsFPQJeaGld
	 H9eCVVVNzxn9lWqxQ5zLoSBgJgfgDpKvIHDALK3xtsQUR56KVMeDOI6tEQKbb4im+bgj0
	 WL/eZzWk5EK7CYVwZAMgQSrQ5UqajcJrwWsXEn7tv81+Wsw+1UWRAs6FQFe/VGNiarAb2
	 8TNT8orYVhJq21OGXHossFqb7ZJC3uMGnr2uc1CipoDITbyvzuK+RpyEExCM3xDjtcm/S
	 ZJJsEM/ejV74Uh6HrAOkrQzPd3OL9kcb+S/8W9b747fWxxNetlnj7z7NAadTAxIFzlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877906;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:Subject:To:Cc:References:
	 From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=01DUIvb1IJuENO9EdWMmyv2FrnNG3AfV/+JsaWuI+qA=;
	b=Uea4EteYAJ8rZlGTG2Aef4XJPo4/ofX1GboQcNHvwUzSvv8fPBduVgSKIUP/ORG1F+R5
	 O8nJlXVQyTS/1qCZrYGgf2sIS6G/xnV/9eAs8QQpNTuviEchk3CzMN+HNG2iOw1DU9mW5
	 hajl1gLdQta+4eSH6eCiPIU0MMyotMPhYFYk9DJabbnYthOsdduELq4kHYb6pWRiIElDd
	 46OiCSs3xovI8M1T1PSk/j9BJC9pB7tENN0gcfv+R8YwvMYa2q+yW4ZeADhagjMG+g96g
	 7VoZTPssvn5nhdFye3qE1Nj3xRNJOBzHyJcIbbbu8AiQG/LsLjYmxOql9FQacJiat7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.146
Received: from out28-146.mail.aliyun.com (out28-146.mail.aliyun.com [115.124.28.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91417606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91417606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436259|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0120184-0.00112337-0.986858;FP=1569355884121404667|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033071099199;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=11;RT=11;SR=0;TI=SMTPD_---.jxTdn7z_1793877889;
Received: from 172.18.25.145(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.jxTdn7z_1793877889 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 05 Nov 2026 19:24:50 +0800
Subject: Re: [PATCH] sched/fair: Distribute burst-woken tasks when rq depth
 reaches 3x average
To: K Prateek Nayak <kprateek.nayak@amd.com>, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com
Cc: linux-kernel@vger.kernel.org
References: <20261104091842.266273-1-likunyu@open-hieco.net>
 <7269c4e1-1e58-4600-bd01-94dc92e0f2b7@amd.com>
From: Li kunyu <likunyu@open-hieco.net>
Message-ID: <e81ddaea-6245-dc67-765b-c24f892e9a9f@open-hieco.net>
Date: Thu, 5 Nov 2026 19:24:54 +0800
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
In-Reply-To: <7269c4e1-1e58-4600-bd01-94dc92e0f2b7@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Prateek,

On 2026/11/5 11:44, K Prateek Nayak wrote:
> On 11/4/2026 2:48 PM, Li kunyu wrote:
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
> You can just store (avg * 3) >> SCHED_CAPACITY_SHIFT in rd and skip
> this math all the time.

Thanks for pointing this out; this part has been updated in the new code.

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
> Isn't 'sd->balance_interval' only stretched for LBF_ALL_PINNED cases?
> Why does this make a difference?

I don't quite understand this part. Should we remove the assignment to
sd->balance_interval?

Besides LBF_ALL_PINNED and active_balance, sd->balance_interval is also doubled
in the out_balanced / out_all_pinned /out_one_pinned paths when the system was
previously idle or balanced (if (sd->balance_interval < sd->max_interval)
sd->balance_interval *= 2;).

The assignment to sd->balance_interval has now been removed here, and the
following code has been added:

if (time_after(READ_ONCE(rq->next_balance), now))
        WRITE_ONCE(rq->next_balance, now);

The test results are quite good.

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
> Why even do select_idle_sibling() if you are not going to use that
> data? Can't we check rq_burst_overloaded() beforehand?

The code has already been placed at this location, as follows:

@@ -9942,6 +9963,17 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu,
int wake_flags)
                want_affine = !wake_wide(p) && cpumask_test_cpu(cpu, p->cpus_ptr);
        }

+       target_rq = want_affine ? this_rq() : cpu_rq(prev_cpu);
+       if (unlikely(rq_burst_overloaded(target_rq))) {
+               int dist_cpu = cpumask_any_and_distribute(p->cpus_ptr,
cpu_active_mask);
+
+               if (likely(dist_cpu < nr_cpumask_bits &&
cpu_rq(dist_cpu)->nr_running <
+                          target_rq->nr_running)) {
+                       reset_periodic_lb_interval(dist_cpu);
+                       return dist_cpu;
+               }
+       }
+
        for_each_domain(cpu, tmp) {


>> +
>> +	if (unlikely(rq_burst_overloaded(new_cpu))) {
>> +		int dist_cpu = cpumask_any_and_distribute(p->cpus_ptr, cpu_active_mask);
>> +
>> +		if (likely(dist_cpu < nr_cpumask_bits)) {
>> +			reset_periodic_lb_interval(new_cpu);
> This runs for every successful selection? Is that right? Why?

Here, the call has been updated to reset_periodic_lb_interval(dist_cpu);.

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
> On a large, busy system, load balancing at topmost domain is only
> done once ever couple seconds and keeping the 'avg_nr_running' the
> same for that long seems dodgy.
> 
> An overshoot shouldn't be worse than what it is now, and an
> undershoot would at-least wait till 3 tasks on the CPU so it should
> be fine?
> 
>> +		unsigned int weight = env->sd->span_weight;
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
> Is this an open-coded update_avg()?

It has been changed to the following:

+               if (weight) {
+                       unsigned long thresh;
+
+                       thresh = max_t(unsigned long,
+                                      (sds->total_nr_running * 3) / weight, 3);
+
+                       if (READ_ONCE(env->dst_rq->rd->overload_nr_threshold) !=
thresh)
+
WRITE_ONCE(env->dst_rq->rd->overload_nr_threshold, thresh);
+               }
        } else if (sg_overutilized) {

>> +
>> +			WRITE_ONCE(env->dst_rq->rd->avg_nr_running, cur_avg);
> Can you do this selectively when old_avg != new_avg?
> 
> Also since you compare it with,
> 
> 	READ_ONCE(rq->nr_running) << SCHED_CAPACITY_SHIFT
> 
> Checking if (cur_avg * 3) >> SCHED_CAPACITY_SHIFT has changed and caching that
> would be better and save on computation during wakeup.
> 
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

-- 
thanks,
kunyu
