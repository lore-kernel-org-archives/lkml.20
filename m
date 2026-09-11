Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B81324B33
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789098427; cv=none; b=FxuHrIJOQcy994ugfiOYNr1yRkadHqk7yk1ZaxwqEafmlPTtMW8M5L5AJvKptYsdzNXnPGz6ecRx8q2DlX+sLG9vel6WpGWK/QrJASAcbgsWqpTbwvhuleBVNt08xWAOFCv2PLE62dImNCdV4w0lAGAyRya4bknTAjLoPgGTicY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789098427; c=relaxed/simple;
	bh=XYIvPbhp92CRatcbm3d4u5G/EeYoPSrEv6i9HoBu2XA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=K2nMq9SDb3onUpXaUPgsItWmI2bpzxBhxs5P5RQWDPiYVR6R8TMU3F7iz3ayhc4Mw1+v5VzAoOGkvz1gVLOLD+QTA72r8yRytBFmbcG6drFX2AkAjnFtbJU0AYyf7gCRsTFfYFfM+WrTPZH+FZH2YLS5eUcekMVqCe99XiToHws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=ZZNb24wI; arc=none smtp.client-ip=113.46.200.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="ZZNb24wI"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=BlrJLdpM3zMWFk1fkLx4AY3ejbX+yyxGhDPieEUikHo=;
	b=ZZNb24wI75scTSGGZgnJi+SRLnerJs249M8+emuPWbFbGaYf+nB6cAQ3tHksHNzfpFIwmNGHQ
	/T0Om+q4ukfg9wDYOrnqENavpDbH4PC1U6ZLMq1ObfA/vZBBjm9rdqmeiRc9Oo9KpeRaqQwN1/y
	vfAJHtUr1R6vBiOt7A1rTa4=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4hh0Z313gvzmVBZ;
	Fri, 11 Sep 2026 11:35:55 +0800 (CST)
Received: from whupemk200005.china.huawei.com (unknown [7.152.185.164])
	by mail.maildlp.com (Postfix) with ESMTPS id B554340563;
	Fri, 11 Sep 2026 11:46:50 +0800 (CST)
Received: from [10.67.108.244] (10.67.108.244) by
 whupemk200005.china.huawei.com (7.152.185.164) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 11 Sep 2026 11:46:49 +0800
Message-ID: <2f3b90e5-c626-4de9-84a7-ad9e25320906@huawei.com>
Date: Fri, 11 Sep 2026 11:46:48 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/2] sched/cache: Reduce the overhead of
 task_cache_work by only scan the visisted cpus
Content-Language: en-US
From: Luo Gengkun <luogengkun2@huawei.com>
To: <peterz@infradead.org>
CC: <dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>,
	<mgorman@suse.de>, <vschneid@redhat.com>, <kprateek.nayak@amd.com>,
	<linux-kernel@vger.kernel.org>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <tim.c.chen@linux.intel.com>,
	<yu.c.chen@intel.com>, <mingo@redhat.com>
References: <20260731024417.1106503-1-luogengkun2@huawei.com>
 <20260731024417.1106503-2-luogengkun2@huawei.com>
 <b9f1e2cf-aebc-4239-b938-0f7a46da6d1d@huawei.com>
In-Reply-To: <b9f1e2cf-aebc-4239-b938-0f7a46da6d1d@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 whupemk200005.china.huawei.com (7.152.185.164)



On 2026/8/11 10:27, Luo Gengkun wrote:
> 
> 
> On 2026/7/31 10:44, Luo Gengkun wrote:
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
>>
>> Tested-by: Chen Yu <yu.c.chen@intel.com>
>> Reviewed-by: Tim Chen <tim.c.chen@linux.intel.com>
>> Signed-off-by: Luo Gengkun <luogengkun2@huawei.com>
> Hi Peter,
> 
> Friendly ping on this patch.
> 
> It has accumulated Reviewed-by and Tested-by tags, and there are no further
> comments. Please let me know your thoughts when you have a moment.
> 
> Thanks,
> Gengkun.

Friendly ping.

All comments have been addressed and there are no outstanding issues.

Let me know if this looks good to pick up, or if anything else is needed.

Thanks,
Gengkun
>> ---
>>   include/linux/mm_types.h |  6 +++
>>   include/linux/sched.h    |  2 +
>>   kernel/sched/fair.c      | 96 ++++++++++++++++------------------------
>>   3 files changed, 47 insertions(+), 57 deletions(-)
>>
>> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
>> index b18c2b2e7d2c..35559079e4d4 100644
>> --- a/include/linux/mm_types.h
>> +++ b/include/linux/mm_types.h
>> @@ -1620,6 +1620,11 @@ static inline int mm_alloc_sched_noprof(struct mm_struct *mm)
>>       if (!pcpu_sched)
>>           return -ENOMEM;
>> +    if (!zalloc_cpumask_var(&mm->sc_stat.visited_cpus, GFP_KERNEL)) {
>> +        free_percpu(pcpu_sched);
>> +        return -ENOMEM;
>> +    }
>> +
>>       mm_init_sched(mm, pcpu_sched);
>>       return 0;
>>   }
>> @@ -1630,6 +1635,7 @@ static inline void mm_destroy_sched(struct mm_struct *mm)
>>   {
>>       free_percpu(mm->sc_stat.pcpu_sched);
>>       mm->sc_stat.pcpu_sched = NULL;
>> +    free_cpumask_var(mm->sc_stat.visited_cpus);
>>   }
>>   #else /* !CONFIG_SCHED_CACHE */
>> diff --git a/include/linux/sched.h b/include/linux/sched.h
>> index 373bcc0598d1..b461a71a65da 100644
>> --- a/include/linux/sched.h
>> +++ b/include/linux/sched.h
>> @@ -2388,6 +2388,7 @@ static __always_inline int task_mm_cid(struct task_struct *t)
>>   struct sched_cache_time {
>>       u64 runtime;
>>       unsigned long epoch;
>> +    unsigned long epoch_last_visit;
>>   };
>>   struct sched_cache_stat {
>> @@ -2398,6 +2399,7 @@ struct sched_cache_stat {
>>       unsigned long next_scan;
>>       unsigned long footprint;
>>       int cpu;
>> +    cpumask_var_t visited_cpus;
>>   } ____cacheline_aligned_in_smp;
>>   #else
>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>> index d78467ec6ee1..2bb370b38b79 100644
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -1585,6 +1585,7 @@ void mm_init_sched(struct mm_struct *mm,
>>           pcpu_sched->runtime = 0;
>>           /* a slightly stale cpu epoch is acceptible */
>>           pcpu_sched->epoch = rq->cpu_epoch;
>> +        pcpu_sched->epoch_last_visit = rq->cpu_epoch;
>>           epoch = rq->cpu_epoch;
>>       }
>> @@ -1635,13 +1636,23 @@ static inline void __update_mm_sched(struct rq *rq,
>>       }
>>   }
>> -static unsigned long fraction_mm_sched(struct rq *rq,
>> -                       struct sched_cache_time *pcpu_sched)
>> +static unsigned long fraction_mm_sched(int cpu,
>> +                       struct mm_struct *mm)
>>   {
>> +    struct sched_cache_time *pcpu_sched =
>> +        per_cpu_ptr(mm->sc_stat.pcpu_sched, cpu);
>> +    struct rq *rq = cpu_rq(cpu);
>> +
>>       guard(raw_spinlock_irqsave)(&rq->cpu_epoch_lock);
>>       __update_mm_sched(rq, pcpu_sched);
>> +    /* Skip the rq that has not been hit for a long time */
>> +    if ((rq->cpu_epoch - pcpu_sched->epoch_last_visit) > llc_epoch_affinity_timeout) {
>> +        cpumask_clear_cpu(cpu, mm->sc_stat.visited_cpus);
>> +        return 0;
>> +    }
>> +
>>       /*
>>        * Runtime is a geometric series (r=0.5) and as such will sum to twice
>>        * the accumulation period, this means the multiplcation here should
>> @@ -1711,6 +1722,9 @@ void account_mm_sched(struct rq *rq, struct task_struct *p, s64 delta_exec)
>>           pcpu_sched->runtime += delta_exec;
>>           rq->cpu_runtime += delta_exec;
>>           epoch = rq->cpu_epoch;
>> +        pcpu_sched->epoch_last_visit = epoch;
>> +        if (!cpumask_test_cpu(cpu_of(rq), mm->sc_stat.visited_cpus))
>> +            cpumask_set_cpu(cpu_of(rq), mm->sc_stat.visited_cpus);
>>       }
>>       /*
>> @@ -1761,51 +1775,6 @@ static void task_tick_cache(struct rq *rq, struct task_struct *p)
>>       }
>>   }
>> -static void get_scan_cpumasks(cpumask_var_t cpus, struct task_struct *p)
>> -{
>> -#ifdef CONFIG_NUMA_BALANCING
>> -    int cpu, curr_cpu, nid, pref_nid;
>> -
>> -    if (!static_branch_likely(&sched_numa_balancing))
>> -        goto out;
>> -
>> -    cpu = READ_ONCE(p->mm->sc_stat.cpu);
>> -    if (cpu != -1)
>> -        nid = cpu_to_node(cpu);
>> -    curr_cpu = task_cpu(p);
>> -
>> -    /*
>> -     * Scanning in the preferred NUMA node is ideal. However, the NUMA
>> -     * preferred node is per-task rather than per-process. It is possible
>> -     * for different threads of the process to have distinct preferred
>> -     * nodes; consequently, the process-wide preferred LLC may bounce
>> -     * between different nodes. As a workaround, maintain the scan
>> -     * CPU mask to also cover the process's current preferred LLC and the
>> -     * current running node to mitigate the bouncing risk.
>> -     * TBD: numa_group should be considered during task aggregation.
>> -     */
>> -    pref_nid = p->numa_preferred_nid;
>> -    /* honor the task's preferred node */
>> -    if (pref_nid == NUMA_NO_NODE)
>> -        goto out;
>> -
>> -    cpumask_or(cpus, cpus, cpumask_of_node(pref_nid));
>> -
>> -    /* honor the task's preferred LLC CPU */
>> -    if (cpu != -1 && !cpumask_test_cpu(cpu, cpus) && nid != NUMA_NO_NODE)
>> -        cpumask_or(cpus, cpus, cpumask_of_node(nid));
>> -
>> -    /* make sure the task's current running node is included */
>> -    if (!cpumask_test_cpu(curr_cpu, cpus))
>> -        cpumask_or(cpus, cpus, cpumask_of_node(cpu_to_node(curr_cpu)));
>> -
>> -    return;
>> -
>> -out:
>> -#endif
>> -    cpumask_copy(cpus, cpu_online_mask);
>> -}
>> -
>>   static inline void update_avg_scale(u64 *avg, u64 sample)
>>   {
>>       int factor = per_cpu(sd_llc_size, raw_smp_processor_id());
>> @@ -1845,7 +1814,7 @@ static void task_cache_work(struct callback_head *work)
>>       if (time_before(now, next_scan))
>>           return;
>> -    /* only 1 thread is allowed to scan */
>> +    /* elect a single scanner per epoch */
>>       if (!try_cmpxchg(&mm->sc_stat.next_scan, &next_scan,
>>                now + max_t(unsigned long,
>>                        READ_ONCE(llc_epoch_period), 1)))
>> @@ -1866,7 +1835,18 @@ static void task_cache_work(struct callback_head *work)
>>       scoped_guard (cpus_read_lock) {
>>           guard(rcu)();
>> -        get_scan_cpumasks(cpus, p);
>> +        /*
>> +         * Data race: While evaluating the visited_cpus without
>> +         * a lock, a CPU could be concurrently set by
>> +         * account_mm_sched(), meaning the scan might skip the newly
>> +         * visited CPU if the bit changes during the scan. This is
>> +         * a deliberate trade-off between accuracy and efficiency:
>> +         * locking would prevent this race but incur extra overhead.
>> +         * The missed runtime contribution is negligible because it
>> +         * implies this process hasn't run on that CPU for a long
>> +         * time, and will be captured in the next cycle.
>> +         */
>> +        cpumask_and(cpus, cpu_online_mask, mm->sc_stat.visited_cpus);
>>           for_each_cpu(cpu, cpus) {
>>               /* XXX sched_cluster_active */
>> @@ -1877,19 +1857,21 @@ static void task_cache_work(struct callback_head *work)
>>               if (!sd)
>>                   continue;
>> -            for_each_cpu(i, sched_domain_span(sd)) {
>> -                occ = fraction_mm_sched(cpu_rq(i),
>> -                            per_cpu_ptr(mm->sc_stat.pcpu_sched, i));
>> +            for_each_cpu_and(i, sched_domain_span(sd), cpus) {
>> +                cur = rcu_dereference_all(cpu_rq(i)->curr);
>> +                if (cur && !(cur->flags & (PF_EXITING | PF_KTHREAD)) &&
>> +                    cur->mm == mm)
>> +                    nr_running++;
>> +
>> +                occ = fraction_mm_sched(i, mm);
>> +                if (occ == 0)
>> +                    continue;
>> +
>>                   a_occ += occ;
>>                   if (occ > m_occ) {
>>                       m_occ = occ;
>>                       m_cpu = i;
>>                   }
>> -
>> -                cur = rcu_dereference_all(cpu_rq(i)->curr);
>> -                if (cur && !(cur->flags & (PF_EXITING | PF_KTHREAD)) &&
>> -                    cur->mm == mm)
>> -                    nr_running++;
>>               }
>>               /*
