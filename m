Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793156059;
	b=eE8UwVTX8XVzynmJGqBJjPUF5+eoAWvw7GzEi0pDb5MQYsMRkKVHtVNsQZp2v4uRl4QG
	 dvV8URTYeUZIGJt4UXXE64PreQzR0IlzEhyhxQ9OWH2+V+6L45hVVOE4t7cjT/jS+mg/L
	 hUjtCG8PP70nOOLhodlhe4x0oJhrO9n4qE6jYPdc7dSsSBFxOFWLHA5sJTgov264vZ3yN
	 T/hOc/N0Ctu+fC9lfmKprQK8mLSCc7nqfqi2Q7Ee4shHU3qTRxjQLUtutmt2SDALctcG9
	 xsJPY+h5AhaK8ld59MYNunV65QFq03u0qrjfcgYx2+b3UxuyTWM5NVaSPwjjaFlOCog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156059;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:Subject:To:Cc:References:
	 From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=az3xinfVNcIc4DtU/JNbSKU+IB6AT32kgEgKNdK8F8s=;
	b=VNi3/0gEc7y6ltQie2MUq51rKQiL1C2FFSRV6M4SeZL634+vhpE5PiDZhnxBRlJjKnr+
	 2IfPRN8NcgGuhfHzC3+RPRFQG4cVBYaKiw+3hR8FcnnkYzWbK8ZFZMnNanTACp0zQNmVC
	 c717kD+8+KTicLn/dCzrpi3SWzJ1KZSc8zzDIxZR0baB7TnEPO4cMCsanuD7Yv31s8dWQ
	 C+bjzajYzaZ+7gdx3M+9q4psglrhAtwn2LJvPql3h7fC6wGD0fy+I1g3TWABDiDvXK854
	 Jec39BFYSIXJdikQhZcW9Xu90DMEpIXGt46m7tSsz5UzCK/XEhw7Xys2nN8kK6VDlUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.123
Received: from out28-123.mail.aliyun.com (out28-123.mail.aliyun.com [115.124.28.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16DB606A325
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:54:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E16DB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.08831345|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0101372-0.00127542-0.988587;FP=3834068421359482106|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033045038069;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.jr3fTIQ_1793156044;
Received: from 172.18.25.145(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.jr3fTIQ_1793156044 cluster:ay29)
          by smtp.aliyun-inc.com;
          Wed, 28 Oct 2026 10:54:07 +0800
Subject: Re: [RFC PATCH 5/6] sched/fair: Add task burst threshold for
 large-scale bursts
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
 linux-kernel@vger.kernel.org, "Li Wang (Hieco)" <li.wang@linux.dev>
References: <20261020083746.37068-1-likunyu@open-hieco.net>
 <20261020083746.37068-6-likunyu@open-hieco.net>
 <20261021125419.GK2823843@noisy.programming.kicks-ass.net>
From: Li kunyu <likunyu@open-hieco.net>
Message-ID: <48262bd7-8748-bb87-2a49-736b320c5b0f@open-hieco.net>
Date: Wed, 28 Oct 2026 10:54:07 +0800
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
In-Reply-To: <20261021125419.GK2823843@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 2026/10/21 20:54, Peter Zijlstra wrote:
> On Tue, Oct 20, 2026 at 04:37:45PM +0800, Li kunyu wrote:
> 
>> +#ifdef CONFIG_NO_HZ_COMMON
>> +	/*
>> +	 * In practice, bursty tasks can lead to uneven task distribution.
>> +	 * For example, some CPUs may have kernel-mode utilization above 50%,
>> +	 * while more than 10% of CPUs in the system remain idle.
>> +	 * Therefore, we define a task burst threshold:
>> +	 *
>> +	 * 1. For a task to be woken up, the scheduler first follows the
>> +	 * original wake-up logic (such as wake-up on the current CPU or
>> +	 * affinity wake-up) to return a CPU. If no CPU is returned, it
>> +	 * then checks the task burst threshold of new_cpu.
>> +	 * 2. Newly created child processes or threads have fewer
>> +	 * considerations; only the task burst threshold needs to be checked.
>> +	 */
>> +	if (sched_feat(SMT_BUDDY_ASSIST) && cpu_rq(new_cpu)->nr_running >=
>> +			sysctl_smt_buddy_balance_task)
>> +		for_each_cpu_wrap(nohz_idle_cpu,  nohz.idle_cpus_mask, new_cpu + 1) {
>> +			if (!idle_cpu(nohz_idle_cpu))
>> +				continue;
>> +
>> +			/*
>> +			 * In general-purpose scenarios, the CPU can
>> +			 * typically meet task requirements.
>> +			 */
>> +			if (!cpumask_test_cpu(nohz_idle_cpu, p->cpus_ptr))
>> +				continue;
>> +
>> +		/*
>> +		 * Simply returning nohz_idle_cpu is sufficient, since the
>> +		 * subsequent NOHZ kick will clear the corresponding bit in
>> +		 * nohz.idle_cpus_mask.
>> +		 */
>> +		return nohz_idle_cpu;
>> +	}
>> +#endif
> I don't understand why this depends on NO_HZ. I also don't understand
> why this only considers idle CPUs.
> 
> Also, static thresholds are horrible.
> 
> 
> Someone that burst wakes a ton of tasks, even on a non-idle system, will
> cause an uneven task distribution. Irrespective of there being idle CPUs
> in the system or NOHZ whatever.
> 
> So how about we track an average rq-depth in the periodic load-balance
> pass, in say the root domain or so. And then, when the the local
> rq-depth reaches some multiple (3 sounds like a good number?) of that,
> we'll fall back and do something utterly dumb like:
> 
> 	cpu = cpumask_any_distribute(p->cpus_ptr);
> 
> Eg, simply start rotating new tasks around the system *and* reset the
> periodic load balance period.

During testing, I found issues with the behavior described above - for example,
about 10% of idle CPUs remained unused because tasks were not successfully
migrated to idle CPUs through the NOHZ KICK. I tried checking for task storms
(where the number of tasks exceeded a quarter of the total CPU count) and
triggering the NOHZ KICK   earlier, but this did not actually alleviate the
problem. I therefore considered how to use NOHZ idle CPUs more reasonably and
promptly.

In select_task_rq_fair(), both task wake-ups and newly created tasks invoke this
function. After multiple attempts, selecting the number of idle CPUs based on
the task threshold proved to be the most reasonable approach: once idle CPUs
receive tasks, they enter the normal load-balancing process, which can quickly
distribute tasks from other high-load CPUs. In actual tests, user-space and
kernel-space load across all CPUs quickly reached overall balance.

The overall average improvement from this patch is over 13% (which seems too
high to be plausible, so I will verify the optimized patch code over several
more rounds). The test items are as follows:


type            pct
hackbench	+3.79%
tbench	        +8.45%
schbench	-4.89%
STREAM	        +58.96%
unixBench	+2.04%
overall average	+13.67%


hackbench:
group   base    patch5  pct
g1	0.262	0.265	-1.15%
g2	0.288	0.311	-8.13%
g4	0.407	0.374	+8.06%
g8	0.567	0.493	+13.02%
g16	0.836	0.720	+13.88%
g32	1.411	1.277	+9.48%
g64	2.473	2.564	-3.68%
g128	4.502	4.554	-1.16%


tbench(throughput):
clients   base          patch5          pct
1	475.97	        475.46	        -0.11%
2	714.48	        709.10	        -0.75%
4	1349.73	        1389.51	        +2.95%
8	2059.00	        2220.22	        +7.83%
16	4364.25	        4315.82	        -1.11%
32	8325.17	        8821.86	        +5.96%
64	12614.20	15186.43	+20.39%
128	15845.07	19653.97	+24.04%
256	20837.93	27263.20	+30.83%
512	29820.67	27037.03	-9.33%
1024	25969.93	29164.13	+12.30%


schbench(99th):
threads base    patch5  pct
t1	10.75	10.80	-0.47%
t2	11.20	11.80	-5.36%
t4	12.80	13.20	-3.13%
t8	13.80	16.60	-20.29%
t16	14.80	17.20	-16.22%
t32	17.00	17.00	0.00%
t64	27.20	23.00	+15.44%
t128	2844.00	2844.00	0.00%
t256	5656.00	5643.20	+0.23%
t512	9680.00	9564.80	+1.19%


stream-10:
operation base          patch5          pct
Copy	103034.5	160527.1	+55.80%
Scale	100012.0	156769.2	+56.75%
Add	128469.0	182293.1	+41.90%
Triad	114401.2	173172.1	+51.37%


stream-100:
operation base          patch5          pct
Copy	122156.6	226728.8	+85.60%
Scale	127074.8	214951.2	+69.15%
Add	140021.5	209541.0	+49.65%
Triad	136455.4	220304.1	+61.45%


unixbench:
cpu     base      patch5        pct
1	1808.3	  1783.3	-1.38%
384     113834.2  120040.7	+5.45%


-- 
thanks,
kunyu
