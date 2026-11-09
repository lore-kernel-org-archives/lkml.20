Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.71.93.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794208851;
	b=QsHFrwe11w1qGEAdCrKPsAz/VPKARVmyJT3lePIa22t43gIYKWZ7Oj134OtX4MuXJdne
	 Ixy0z2iR6eCla76F5qsbIH/juyGe4Rww5iK7aUv2n65NOwYOdZmHzOHUuuGppuzmGKzFl
	 r/brXXRhaX/cOeSzcbP65fV8qghXRI0OinEWzszeskwiTxtTCF1DuEM3pd+hcrZBPlkkn
	 gLo7SyD9PF0DoSDdTlxo5JkB8tSuOA+9IZNAG7Z2eUa6UQ0J8mOoXmTXpNA4RdYyZRX/8
	 OD8hphkYwOmGtbrBguxTyR8QTt5y5uus7faLfZF1YweKta1OiWL8saGsmQ0OBeiB4SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208851;
	h=DMARC-Filter:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=V8RdJPFfRdn/QdIWEus1x3l0+GJvVbau+an72HsK+PQ=;
	b=tx5bMjRPcJSwaGLQmeUJd3E4GXERGMv4eeekrp35i1LKDGU5Id0sH4ZSJM9sS+JHHQry
	 GVG/4b+T6yi1UfhoWuknoU/n6h1wqqvsGZMgJsuFvkjjiMmowOpa5qJgxzoUDMeFJVLif
	 k01fUXNRWBum+inuvRlO/reRhh5Vrwl2T6sa3Zp2ydfjYBbfOMN7ggwrI0VpLsP/jkSMi
	 SvzF5rOLzcYkOSSTpUps00ilGJLdjD776sizMFoH/xmADq9/KVWzGtNeVSzEvdf0NKKUo
	 RULhZ7fQPFqe8AnxblnK6ZrK+yqc0ziGC5cC6R+ZLEmAZHNcCbV4RjY7kx3nFg6sM0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=huaweicloud.com;
	spf=pass smtp.mailfrom=huaweicloud.com;
	arc=none smtp.remote-ip=124.71.93.112
Received: from dggmsgout12.his.huawei.com (dggmsgout12.his.huawei.com [124.71.93.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C30606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:20:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18C30606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggmsgout12.his.huawei.com (SkyGuard) with ESMTP id 4jNLlZ3qmfz20LD
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:20:10 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 5405F4056B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:20:45 +0800 (CST)
Received: from [10.67.109.234] (unknown [10.67.109.234])
	by APP1 (Coremail) with UTF8SMTPA id cCh0CgDnN81LdPFq2A5yDg--.45807S2;
	Mon, 09 Nov 2026 15:20:45 +0800 (CST)
Message-ID: <8a494e8f-c30b-4cfa-af08-a0a641bdd6a5@huaweicloud.com>
Date: Mon, 9 Nov 2026 15:20:43 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/2] sched/cache: Reduce the overhead of
 task_cache_work by only scan the visisted cpus
Content-Language: en-US
To: Tim Chen <tim.c.chen@linux.intel.com>, peterz@infradead.org,
 mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 yu.c.chen@intel.com
Cc: dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
 linux-kernel@vger.kernel.org
References: <20261009032943.95091-1-luogengkun@huaweicloud.com>
 <20261009032943.95091-2-luogengkun@huaweicloud.com>
 <995dc27d9bd27276c1fbf729ed88b7e6c91172f7.camel@linux.intel.com>
From: Luo Gengkun <luogengkun@huaweicloud.com>
In-Reply-To: <995dc27d9bd27276c1fbf729ed88b7e6c91172f7.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:cCh0CgDnN81LdPFq2A5yDg--.45807S2
X-Coremail-Antispam: 1UD129KBjvJXoW3JrWUCw4kJF4UXrWDtry5Arb_yoWDJr4rpF
	WDuFW5tF4kJryUW3yYva1DXr13K3s3tr9rKw13GF1rAFn2kr18KF1Dtw43ZryjkrnIka1S
	vr4DKasrWF10yFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8
	ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUb
	mii3UUUUU==
X-CM-SenderInfo: 5oxrwvpqjn3046kxt4xhlfz01xgou0bp/

On 2026/10/22 5:46, Tim Chen wrote:
> On Fri, 2026-10-09 at 03:29 +0000, Luo Gengkun wrote:
>> The overhead of task_cache_work() is high, especially in multi-NUMA systems.
>> Currently, task_cache_work() tries to find the pref_llc by scanning all CPUs
>> in the system. However, most of these scans are meaningless, such as those
>> for CPUs that have never been visited or were accessed a long time ago.
>>
>> To address this problem, introduce visited_cpus to track the visited CPUs
>> and evict them once they have not been accessed for a duration exceeding
>> llc_epoch_affinity_timeout.
>>
>> Now that we know exactly which CPUs to scan from visited_cpus, we can remove
>> get_scan_cpumasks().
> 
> The patch mostly looks good.  Some minor nits below.
> 
>>
>> Signed-off-by: Luo Gengkun <luogengkun@huaweicloud.com>
>> ---
>>   include/linux/sched.h |   2 +
>>   kernel/sched/fair.c   | 117 +++++++++++++++++++-----------------------
>>   2 files changed, 55 insertions(+), 64 deletions(-)
>>
>> diff --git a/include/linux/sched.h b/include/linux/sched.h
>> index d35ae49a991f..09bd18c7a667 100644
>> --- a/include/linux/sched.h
>> +++ b/include/linux/sched.h
>> @@ -2404,6 +2404,7 @@ static __always_inline int task_mm_cid(struct task_struct *t)
>>   struct sched_cache_time {
>>   	u64 runtime;
>>   	unsigned long epoch;
>> +	unsigned long epoch_last_visit;
>>   };
>>   
>>   struct sched_cache_group {
>> @@ -2416,6 +2417,7 @@ struct sched_cache_group {
>>   	int cpu;
>>   	refcount_t refcnt;
>>   	struct rcu_head rcu;
>> +	cpumask_var_t visited_cpus;
>>   } ____cacheline_aligned_in_smp;
>>   
>>   struct sched_cache_group *sched_cache_group_get(struct sched_cache_group *grp);
>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>> index 57360f5cdde4..691b4ecdb2e7 100644
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -1656,11 +1656,11 @@ int mm_init_sched(struct mm_struct *mm,
>>   	int i;
>>   
>>   	grp = kzalloc_obj(*grp);
>> -	if (!grp) {
>> -		free_percpu(_pcpu_sched);
>> -		mm->sched_cache_grp = NULL;
>> -		return -ENOMEM;
>> -	}
>> +	if (!grp)
>> +		goto err_free_pcpu;
>> +
>> +	if (!zalloc_cpumask_var(&grp->visited_cpus, GFP_KERNEL))
>> +		goto err_free_grp;
>>   
>>   	for_each_possible_cpu(i) {
>>   		struct sched_cache_time *pcpu_sched = per_cpu_ptr(_pcpu_sched, i);
>> @@ -1669,6 +1669,7 @@ int mm_init_sched(struct mm_struct *mm,
>>   		pcpu_sched->runtime = 0;
>>   		/* a slightly stale cpu epoch is acceptible */
>>   		pcpu_sched->epoch = rq->cpu_epoch;
>> +		pcpu_sched->epoch_last_visit = rq->cpu_epoch;
>>   		epoch = rq->cpu_epoch;
>>   	}
>>   
>> @@ -1694,6 +1695,14 @@ int mm_init_sched(struct mm_struct *mm,
>>   	 */
>>   	smp_store_release(&mm->sched_cache_grp, grp);
>>   	return 0;
>> +
>> +err_free_grp:
>> +	kfree(grp);
>> +
>> +err_free_pcpu:
>> +	free_percpu(_pcpu_sched);
>> +	mm->sched_cache_grp = NULL;
>> +	return -ENOMEM;
>>   }
>>   
>>   static void sched_cache_group_free_rcu(struct rcu_head *rcu)
>> @@ -1702,6 +1711,7 @@ static void sched_cache_group_free_rcu(struct rcu_head *rcu)
>>   		container_of(rcu, struct sched_cache_group, rcu);
>>   
>>   	free_percpu(grp->pcpu_sched);
>> +	free_cpumask_var(grp->visited_cpus);
>>   	kfree(grp);
>>   }
>>   
>> @@ -1842,13 +1852,23 @@ static inline void __update_mm_sched(struct rq *rq,
>>   	}
>>   }
>>   
>> -static unsigned long fraction_mm_sched(struct rq *rq,
>> -				       struct sched_cache_time *pcpu_sched)
>> +static unsigned long fraction_mm_sched(int cpu,
>> +				       struct sched_cache_group *grp)
>>   {
>> +	struct sched_cache_time *pcpu_sched =
>> +		per_cpu_ptr(grp->pcpu_sched, cpu);
>> +	struct rq *rq = cpu_rq(cpu);
>> +
>>   	guard(raw_spinlock_irqsave)(&rq->cpu_epoch_lock);
>>   
>>   	__update_mm_sched(rq, pcpu_sched);
>>   
>> +	/* Skip the rq that has not been hit for a long time */
>> +	if ((rq->cpu_epoch - pcpu_sched->epoch_last_visit) > llc_epoch_affinity_timeout) {
> 
> Suggest updating comment to below as it does more than
> skip: it clears the visited cpus bit.  Also break the long line.
> 
>         /* Evict the CPU if this sched group has not run on it for a while */
>         if ((rq->cpu_epoch - pcpu_sched->epoch_last_visit) >
>             llc_epoch_affinity_timeout) {
> 
>> +		cpumask_clear_cpu(cpu, grp->visited_cpus);
>> +		return 0;
>> +	}
>> +
>>   	/*
>>   	 * Runtime is a geometric series (r=0.5) and as such will sum to twice
>>   	 * the accumulation period, this means the multiplcation here should
>> @@ -1924,6 +1944,9 @@ void account_mm_sched(struct rq *rq, struct task_struct *p, s64 delta_exec)
>>   		pcpu_sched->runtime += delta_exec;
>>   		rq->cpu_runtime += delta_exec;
>>   		epoch = rq->cpu_epoch;
>> +		pcpu_sched->epoch_last_visit = epoch;
>> +		if (!cpumask_test_cpu(cpu_of(rq), grp->visited_cpus))
>> +			cpumask_set_cpu(cpu_of(rq), grp->visited_cpus);
>>   	}
>>   
>>   	/*
>> @@ -1974,52 +1997,6 @@ static void task_tick_cache(struct rq *rq, struct task_struct *p)
>>   	}
>>   }
>>   
>> -static void get_scan_cpumasks(cpumask_var_t cpus, struct task_struct *p,
>> -			      struct sched_cache_group *grp)
>> -{
>> -#ifdef CONFIG_NUMA_BALANCING
>> -	int cpu, curr_cpu, nid, pref_nid;
>> -
>> -	if (!static_branch_likely(&sched_numa_balancing))
>> -		goto out;
>> -
>> -	cpu = READ_ONCE(grp->cpu);
>> -	if (cpu != -1)
>> -		nid = cpu_to_node(cpu);
>> -	curr_cpu = task_cpu(p);
>> -
>> -	/*
>> -	 * Scanning in the preferred NUMA node is ideal. However, the NUMA
>> -	 * preferred node is per-task rather than per-process. It is possible
>> -	 * for different threads of the process to have distinct preferred
>> -	 * nodes; consequently, the process-wide preferred LLC may bounce
>> -	 * between different nodes. As a workaround, maintain the scan
>> -	 * CPU mask to also cover the process's current preferred LLC and the
>> -	 * current running node to mitigate the bouncing risk.
>> -	 * TBD: numa_group should be considered during task aggregation.
>> -	 */
>> -	pref_nid = p->numa_preferred_nid;
>> -	/* honor the task's preferred node */
>> -	if (pref_nid == NUMA_NO_NODE)
>> -		goto out;
>> -
>> -	cpumask_or(cpus, cpus, cpumask_of_node(pref_nid));
>> -
>> -	/* honor the task's preferred LLC CPU */
>> -	if (cpu != -1 && !cpumask_test_cpu(cpu, cpus) && nid != NUMA_NO_NODE)
>> -		cpumask_or(cpus, cpus, cpumask_of_node(nid));
>> -
>> -	/* make sure the task's current running node is included */
>> -	if (!cpumask_test_cpu(curr_cpu, cpus))
>> -		cpumask_or(cpus, cpus, cpumask_of_node(cpu_to_node(curr_cpu)));
>> -
>> -	return;
>> -
>> -out:
>> -#endif
>> -	cpumask_copy(cpus, cpu_online_mask);
>> -}
>> -
>>   static inline void update_avg_scale(u64 *avg, u64 sample)
>>   {
>>   	int factor = per_cpu(sd_llc_size, raw_smp_processor_id());
>> @@ -2068,7 +2045,7 @@ static void task_cache_work(struct callback_head *work)
>>   	if (time_before(now, next_scan))
>>   		return;
>>   
>> -	/* only 1 thread is allowed to scan */
>> +	/* elect a single scanner per epoch */
>>   	if (!try_cmpxchg(&grp->next_scan, &next_scan,
>>   			 now + max_t(unsigned long,
>>   				     READ_ONCE(llc_epoch_period), 1)))
>> @@ -2089,7 +2066,18 @@ static void task_cache_work(struct callback_head *work)
>>   	scoped_guard (cpus_read_lock) {
>>   		guard(rcu)();
>>   
>> -		get_scan_cpumasks(cpus, p, grp);
>> +		/*
>> +		 * Data race: While evaluating the visited_cpus without
>> +		 * a lock, a CPU could be concurrently set by
>> +		 * account_mm_sched(), meaning the scan might skip the newly
>> +		 * visited CPU if the bit changes during the scan. This is
>> +		 * a deliberate trade-off between accuracy and efficiency:
>> +		 * locking would prevent this race but incur extra overhead.
>> +		 * The missed runtime contribution is negligible because it
>> +		 * implies this process hasn't run on that CPU for a long
>> +		 * time, and will be captured in the next cycle.
>> +		 */
> 
> Maybe we can shorten the comments to:
> 
> 	       /*
>                  * account_mm_sched() can set a bit in visited_cpus while
>                  * it is read here locklessly for efficiency. A CPU missed this way has
>                  * only just been used by this sched group, so its share is
>                  * small, and the next scan will include it.
> 		*/
> 
> 
>> +		cpumask_and(cpus, cpu_online_mask, grp->visited_cpus);
>>   
>>   		for_each_cpu(cpu, cpus) {
>>   			/* XXX sched_cluster_active */
>> @@ -2100,15 +2088,7 @@ static void task_cache_work(struct callback_head *work)
>>   			if (!sd)
>>   				continue;
>>   
>> -			for_each_cpu(i, sched_domain_span(sd)) {
>> -				occ = fraction_mm_sched(cpu_rq(i),
>> -							per_cpu_ptr(grp->pcpu_sched, i));
>> -				a_occ += occ;
>> -				if (occ > m_occ) {
>> -					m_occ = occ;
>> -					m_cpu = i;
>> -				}
>> -
>> +			for_each_cpu_and(i, sched_domain_span(sd), cpus) {
>>   				/*
>>   				 * rcu_access_pointer() is used because the
>>   				 * pointer is only compared, never dereferenced.
>> @@ -2117,6 +2097,15 @@ static void task_cache_work(struct callback_head *work)
>>   				if (cur && !(cur->flags & (PF_EXITING | PF_KTHREAD)) &&
>>   				    rcu_access_pointer(cur->sched_cache_grp) == grp)
>>   					nr_running++;
>> +
>> +				occ = fraction_mm_sched(i, grp);
>> +				if (occ == 0)
>> +					continue;
>> +				a_occ += occ;
>> +				if (occ > m_occ) {
> 
> The continue does nothing. When occ is 0, "a_occ += occ" adds nothing
> and "occ > m_occ" is false. If you remove it, the nr_running block can
> stay where it was, and this hunk becomes just a two-line change.
> 
> -                       for_each_cpu_and(i, sched_domain_span(sd), cpus) {
> -                               occ = fraction_mm_sched(i, grp);
> +                       for_each_cpu(i, sched_domain_span(sd)) {
> +                               occ = fraction_mm_sched(cpu_rq(i),
> +                                                       per_cpu_ptr(grp->pcpu_sched, i));
> 
> 
> Thanks.
> 
> Tim


Hi Tim,

Thank you for your review and suggestions!

I will update the comments, and remove the redundant 'continue' to
simplify the logic as you suggested in the next version.

Best regards,
Luo Gengkun
> 
>> +					m_occ = occ;
>> +					m_cpu = i;
>> +				}
>>   			}
>>   
>>   			/*

