Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158787;
	b=ET65XkXu4Uh8bJJv/8UXr4M1k3AVcooKp6c0wHEUm/sPd7BVmhIolsd/qyu89oWen1rq
	 TeMfFZS64vs6Z137RGMuRm0pyLuWdH9GXgT/OPTJP1gRmVTZ3rCTRKnSYMPgzgKpeX6oh
	 wz2U0uKbtSQ2AuK+IlhLQTTpJI4WXJyPvu5QiFTr6Jr41PZ9yu3DtKPCGLPSRJL1ooMyG
	 oJfmizIhoIyvWkNGVFsSy+QcYsDEwSSRvBZWDiRO71p1e5/mcuqFNiixxrTt0j9SIer7A
	 3IIYOcA9m46wuZvOqANNg0UB0phGwyxJzHFGbn87HZwvPmxOddPR0ttFWWKetmR3Xkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158787;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:Subject:To:Cc:References:
	 From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Yp9YcBMTKfBUjdM3fQCB7f0U5zN7iN1SUrrwzPwaaco=;
	b=5M5EfhH84fffty5vhRR2bkS0UaJ3tcRfSa57MO2HdjoT1sJDIYZcywnCRdClyezczVU1
	 OdsGM36EZvROG07Mgk9G2LDcNLqDFtAOHDfiBYA1vc29mn3NS+Rx7nxuNLwf3K61vrzSY
	 Pm96aCC1wljOGqYFgyAHWjBWNZu82ydW41sbQ4+TF8Uih1d3QHLNa0Sa5cn49lGm951FH
	 OPibRSDhj7CMcSL9VL5vSWIymcWx4UahURka2aqeEwvQfaaQIFhNlAZZf4OQS8GC3CqG3
	 vgRtZGLS18VCXKKSVNlO6uX+Lp1moC2TlBE1O1POy7CpxOl95F/lhmFOyd1SHUzZmDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.124
Received: from out28-124.mail.aliyun.com (out28-124.mail.aliyun.com [115.124.28.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6DB606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB6DB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.0743999|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.00450589-0.000628966-0.994865;FP=1400567662398514298|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033071099199;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.jrFM-gz_1793158779;
Received: from 172.18.25.145(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.jrFM-gz_1793158779 cluster:ay29)
          by smtp.aliyun-inc.com;
          Wed, 28 Oct 2026 11:39:40 +0800
Subject: Re: [RFC PATCH 0/6] sched/fair: Introduce the SMT_BUDDY_ASSIST
 feature
To: Tim Chen <tim.c.chen@linux.intel.com>, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com
Cc: linux-kernel@vger.kernel.org
References: <20261020083746.37068-1-likunyu@open-hieco.net>
 <6d8ff4593cc93c0033c6537eeac281085726c220.camel@linux.intel.com>
 <709db04c-eec7-db96-acca-81cb2ed7265f@open-hieco.net>
 <6b637582edf72e2e013136be0ac979095fd5faed.camel@linux.intel.com>
From: Li kunyu <likunyu@open-hieco.net>
Message-ID: <325d5471-7a1a-07dd-371f-b0e14ebcf2fd@open-hieco.net>
Date: Wed, 28 Oct 2026 11:39:43 +0800
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
In-Reply-To: <6b637582edf72e2e013136be0ac979095fd5faed.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 2026/10/28 4:59, Tim Chen wrote:
> On Tue, 2026-10-27 at 18:44 +0800, Li kunyu wrote:
>> Hi Tim,
>>
>> On 2026/10/23 4:25, Tim Chen wrote:
>>> On Tue, 2026-10-20 at 16:37 +0800, Li kunyu wrote:
>>>> [Background]
>>>>
>>>> In high-performance computing (HPC) and cloud computing scenarios,
>>>> maximizing overall compute throughput and sustaining peak CPU capacity
>>>> remain critical optimization goals. Within the scheduling domain, the
>>>> primary optimization focuses include:
>>>>
>>>> 1. Timely responsiveness for task wakeup and execution startup.
>>>>
>>>> 2. Fast and balanced distribution of CPU utilization across cores.
>>>>
>>>> 3. Preferring task migration within shared-cache domains (e.g., L3)
>>>> before burst workloads arrive, so as to reduce cross-die or
>>>> cross-node overhead.
>>>>
>>>> During development, the following issues were encountered. The above
>>>> approach ultimately yielded measurable performance improvements.
>>>>
>>>>
>>>> [Problem]
>>>>
>>>> It was found that on servers equipped with the Hygon 7447v CPU (Model 7,
>>>> 384 logical cores), migrating tasks across LLC scheduling domains during
>>>> load balancing caused significant performance degradation:
>>>>
>>>> 1. A low L3 cache hitting rate (due to factors such as non-shared L3
>>>> caches).
>>>>
>>>> 2. The traversal overhead of higher-level scheduling domains (e.g.,
>>>> cross-NUMA scheduling domains).
>>>>
>>>> Similar issues were also observed on CPUs from other vendors during
>>>> testing, though the degree of memory bandwidth increase and other
>>>> latency effects varied. Consequently, a series of patches was developed
>>>> to address and improve these issues.
>>>>
>>>>
>>>> [Solution]
>>>>
>>>> This RFC patch series introduces the SMT_BUDDY_ASSIST scheduling
>>>> feature. The main work is as follows:
>>>>
>>>> 1. Push CFS tasks to SMT sibling CPUs during periodic load balancing.
>>>>
>>>> 2. Skip SMT-domain balancing after a successful push and avoid pulling
>>>> the pushed task back.
>>>>
>>>> 3. Restrict newidle balancing so it does not pull from higher-level
>>>> scheduling domains.
>>> Kunyu,
>>>
>>> Have you tried to set relax_domain_level= in boot parameter to
>>> prevent new idle balance across NUMA nodes?
>>>
>>> grep . /sys/kernel/debug/sched/domains/cpu0/domain*/{name,level,flags}
>>>
>>> to find the right level for NUMA and also if the SD_BALANCE_NEWIDLE
>>> is turned off for NUMA after you set relax_domain_level.
>>>
>>> Wonder how much this will improve things for you.
>>
>> I conducted a comparative test between patch4 and relax_domain_level=4
>> (scheduling domain levels 3, SMT, LLC, and node). Their effective scheduling
>> levels were the same, and their overall averages were quite close (+3.28%). The
>> trends for each item were consistent.
> Kunyu,
> 
> Thanks for running this quickly.
> 
>> At present, relax_domain_level has not solved the problems encountered. It
>> merely serves as a reference for patch4. Subsequent versions of patch4 will be
>> optimized following the style of relax_domain_level.
>>
>> I would like to seek your opinion on the modification of patch4. Please review
>> the following:
>>
>> 1. If relax_domain_level is set, patch4 is disabled.
>>
>> 2. If relax_domain_level is not set and the feature is enabled, patch4 takes effect.
>>
>> The overall average values and the data for each test are shown below. Here,
>> smt_buddy denotes the patch4 code, and relax denotes the relax_domain_level = 4
>> code:
>>
>>
>> type           smt_buddy_pct  relax_pct
>> hackbench	-14.94%	       -17.65%
>> tbench	        +12.54%	       +8.70%
>> schbench	-4.27%	       +0.48%
>> STREAM	        +21.80%	       +23.29%
>> unixBench	+1.19%	       +1.58%
>> overall average	+3.27%	       +3.28%
>>
>>
> From the data below, relax_domain_level=4 and the buddy patches give
> similar results, including the STREAM gain and the hackbench
> regression. To me patch4 duplicates what relax_domain_level
> is trying to do, preventing new idle balance across NUMA
> so I would drop it rather than add a mode that switches between the two.
> That is also what Peter suggested about tweaking SD_BALANCE_NEWIDLE.
> 
> If this restriction should be the default on the Hygon 7447v
> platform, that can be proposed separately as a topology/flags change
> for it.

I think it is more reasonable and convenient to modify patch 4 so that it works
together with this feature as described above. For example, if the user has not
explicitly limited relax_domain_level and this feature is enabled, it is
worthwhile to restrict task acquisition to the scheduling domain of the shared
LLC (shared L3) in this way.

In this way, periodic load balancing and the newidle CPU path serve two distinct
purposes. Periodic load balancing is responsible for balancing tasks across all
CPUs overall, while the newidle CPU path is used only to quickly acquire tasks
with less interference (while also reducing traversal overhead).

> I am not convinced that patches 1-3, 5 are helpful.
> 
> The scenarios targeted by patch 1 should be handled mostly
> by newidle balance at SMT and nohz-idle balance. That is
> fairly frequent (~sd_weight or 2*sd_weight , i.e. 2ms-4ms for SMT2).
> While patch1's task push fires at the frequency of SMT domain balance, which
> is ~31 msec from get_sd_balance_interval() with busy factor and
> 8x to 16x less frequent than idle balance.
> 
> Please try Vincent's push task implementation
> that is a more comprehensive implementation to quickly
> send tasks that need to be run to available CPU:
> https://lore.kernel.org/all/20261002154415.2270586-8-vincent.guittot@linaro.org/
> 
> patch 2-3 are mostly to prevent patch 1 from being undone,
> and do not improve performance on their own.

Patch 1 has extremely low overhead in actual operation (only a simple check is
needed when the migration conditions are not met), and its overhead is directly
proportional to the number of successfully migrated tasks. In particular, after
modifying the rq->cfs.hnr_unrunnable check method (without considering sleeping
tasks), only running or queued tasks will be migrated.

Patch 1 generally succeeds in migrating tasks only in a small number of
burst-task scenarios (such as hackbench -g 8 and above), so it does not conflict
with the patches in the list—each addresses its own area, and they can be made
compatible and adapted in the future. Patches 1–3 can be considered for use
together with cgroup CPU masks and other restriction masks to achieve more
timely CPU dispersion when burst tasks occur.

The clear implementation advantage of patch 1 is that it does not require task
queues or the associated lock overhead, and the migration cost is extremely low.

> On patch 5: the burst wakeup problem is real, but I think Peter's
> idea (track average rq depth in periodic balance, and spread with
> cpumask_any_distribute() when the local depth is well above it) is a
> better direction than scanning nohz.idle_cpus_mask in the wakeup
> path. That scan ignores LLC/NUMA locality, which goes against what
> the series wants to achieve. It may be worth doing as a standalone
> patch to deal with this issue.

I have replied to Peter's email regarding the rationale for Patch 5. The main
points are as follows:


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
more rounds).

https://lore.kernel.org/all/48262bd7-8748-bb87-2a49-736b320c5b0f@open-hieco.net

-- 
thanks,
kunyu
