Received: from mta0.migadu.com (out-211.mta0.migadu.com [91.218.175.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052ED46A600
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789408269; cv=none; b=suG4CoOA3dHEkSfR5u/zfU3Ec8EOH2GRhzwTyORMfTlcGBXrgz7vcads1fU8+/QPOziyKpUqFAprvQjUQNruwVEt9AKYrbvVVOkj9l6x36Oq7AAYdWEVigFDWuaoa3+DvBctmf0sZQwtL8Gi9Fa2QBFlh/UhXEtiCppdCApwWpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789408269; c=relaxed/simple;
	bh=7Gb7NShCbXtzVxjsSJBXvYPu28GuIXkEBCK6ZRiodeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A/ZdafZdNqqPyQZoNVPBPZWjfZyH0TwLrYQ3E6ijcYIUV5JeZmLWlc4dwsZvp22szYTA86VGwmd9c335sVAJDcpjV6wE8dEAgeYeSR92S5WXK1DYoB32WpWilWrR4ZdT34VKTsgw1Gu0qqpMPhvadFsQZsGcMl/wLQZNB7YZIYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lHpw32O9; arc=none smtp.client-ip=91.218.175.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lHpw32O9"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7Gb7NShCbXtzVxjsSJBXvYPu28GuIXkEBCK6ZRiodeU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789408263; v=1; x=1790013063;
 b=lHpw32O9Rpr8StbjRBZwfdHGp1aZBmOBJ26C8fS3YONqrlehSQqaIzmYNw2WPSl5XOQpfO44
 o3DmdW+AVgaCFSmLM0fHI0uHBPSNbQvzPzyWg+QuKuRVteu1pLWIkO/57MvqxI/jZM8XslTzg/9
 +mzMCY8R12E5EkDGpZ7MrSGs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c9f74cb3ef45f3cc;
	Mon, 14 Sep 2026 17:51:03 +0000
X-Mizu-Trace-ID: c9f74cb3ef45f3cc
X-Migadu-Flow: FLOW_OUT
Message-ID: <343a7e07-7fad-4979-9c9b-82ec038c293c@linux.dev>
Date: Tue, 15 Sep 2026 01:50:51 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v4 01/22] sched/cache: Introduce infrastructure for
 cache-aware load balancing
To: Tim Chen <tim.c.chen@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>,
 "Gautham R . Shenoy" <gautham.shenoy@amd.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
 Hillf Danton <hdanton@sina.com>, Shrikanth Hegde <sshegde@linux.ibm.com>,
 Jianyong Wu <jianyong.wu@outlook.com>, Yangyu Chen <cyy@cyyself.name>,
 Tingyin Duan <tingyin.duan@gmail.com>, Vern Hao <vernhao@tencent.com>,
 Vern Hao <haoxing990@gmail.com>, Len Brown <len.brown@intel.com>,
 Aubrey Li <aubrey.li@intel.com>, Zhao Liu <zhao1.liu@intel.com>,
 Chen Yu <yu.chen.surf@gmail.com>, Chen Yu <yu.c.chen@intel.com>,
 Adam Li <adamli@os.amperecomputing.com>, Aaron Lu <ziqianlu@bytedance.com>,
 Tim Chen <tim.c.chen@intel.com>, Josh Don <joshdon@google.com>,
 Gavin Guo <gavinguo@igalia.com>, Qais Yousef <qyousef@layalina.io>,
 Libo Chen <libchen@purestorage.com>, linux-kernel@vger.kernel.org
References: <cover.1775065312.git.tim.c.chen@linux.intel.com>
 <6269a53221b9439b9ca00d18a9d1946fb64d8cff.1775065312.git.tim.c.chen@linux.intel.com>
Content-Language: en-US
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <6269a53221b9439b9ca00d18a9d1946fb64d8cff.1775065312.git.tim.c.chen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/2/26 5:52 AM, Tim Chen wrote:
> From: "Peter Zijlstra (Intel)" <peterz@infradead.org>
> 
> Adds infrastructure to enable cache-aware load balancing,
> which improves cache locality by grouping tasks that share resources
> within the same cache domain. This reduces cache misses and improves
> overall data access efficiency.
> 
> In this initial implementation, threads belonging to the same process
> are treated as entities that likely share working sets. The mechanism
> tracks per-process CPU occupancy across cache domains and attempts to
> migrate threads toward cache-hot domains where their process already
> has active threads, thereby enhancing locality.
> 
> This provides a basic model for cache affinity. While the current code
> targets the last-level cache (LLC), the approach could be extended to
> other domain types such as clusters (L2) or node-internal groupings.
> 
> At present, the mechanism selects the CPU within an LLC that has the
> highest recent runtime. Subsequent patches in this series will use this
> information in the load-balancing path to guide task placement toward
> preferred LLCs.
> 
> In the future, more advanced policies could be integrated through NUMA
> balancing-for example, migrating a task to its preferred LLC when spare
> capacity exists, or swapping tasks across LLCs to improve cache affinity.
> Grouping of tasks could also be generalized from that of a process
> to be that of a NUMA group, or be user configurable.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
> ---
> 
> Notes:
>     v3->v4:
>        No change.
> 
>  include/linux/mm_types.h |  32 +++++
>  include/linux/sched.h    |  24 ++++
>  init/Kconfig             |  11 ++
>  kernel/fork.c            |   6 +
>  kernel/sched/core.c      |   6 +
>  kernel/sched/fair.c      | 266 +++++++++++++++++++++++++++++++++++++++
>  kernel/sched/sched.h     |  14 +++
>  7 files changed, 359 insertions(+)
> 
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 3cc8ae722886..67b2dfcc71ea 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -1173,6 +1173,8 @@ struct mm_struct {
>  		/* MM CID related storage */
>  		struct mm_mm_cid mm_cid;
>  
> +		/* sched_cache related statistics */
> +		struct sched_cache_stat sc_stat;
>  #ifdef CONFIG_MMU
>  		atomic_long_t pgtables_bytes;	/* size of all page tables */
>  #endif
> @@ -1575,6 +1577,36 @@ static inline unsigned int mm_cid_size(void)
>  # define MM_CID_STATIC_SIZE	0
>  #endif /* CONFIG_SCHED_MM_CID */
>  
> +#ifdef CONFIG_SCHED_CACHE
> +void mm_init_sched(struct mm_struct *mm,
> +		   struct sched_cache_time __percpu *pcpu_sched);
> +
> +static inline int mm_alloc_sched_noprof(struct mm_struct *mm)
> +{
> +	struct sched_cache_time __percpu *pcpu_sched =
> +		alloc_percpu_noprof(struct sched_cache_time);
> +
> +	if (!pcpu_sched)
> +		return -ENOMEM;
> +
> +	mm_init_sched(mm, pcpu_sched);
> +	return 0;
> +}
> +
> +#define mm_alloc_sched(...)	alloc_hooks(mm_alloc_sched_noprof(__VA_ARGS__))
> +
> +static inline void mm_destroy_sched(struct mm_struct *mm)
> +{
> +	free_percpu(mm->sc_stat.pcpu_sched);
> +	mm->sc_stat.pcpu_sched = NULL;
> +}
> +#else /* !CONFIG_SCHED_CACHE */
> +
> +static inline int mm_alloc_sched(struct mm_struct *mm) { return 0; }
> +static inline void mm_destroy_sched(struct mm_struct *mm) { }
> +
> +#endif /* CONFIG_SCHED_CACHE */
> +
>  struct mmu_gather;
>  extern void tlb_gather_mmu(struct mmu_gather *tlb, struct mm_struct *mm);
>  extern void tlb_gather_mmu_fullmm(struct mmu_gather *tlb, struct mm_struct *mm);
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index a7b4a980eb2f..bd33f5b9096b 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -1406,6 +1406,10 @@ struct task_struct {
>  	unsigned long			numa_pages_migrated;
>  #endif /* CONFIG_NUMA_BALANCING */
>  
> +#ifdef CONFIG_SCHED_CACHE
> +	struct callback_head		cache_work;
> +#endif
> +
>  	struct rseq_data		rseq;
>  	struct sched_mm_cid		mm_cid;
>  
> @@ -2376,6 +2380,26 @@ static __always_inline int task_mm_cid(struct task_struct *t)
>  }
>  #endif
>  
> +#ifdef CONFIG_SCHED_CACHE
> +
> +struct sched_cache_time {
> +	u64 runtime;
> +	unsigned long epoch;
> +};
> +
> +struct sched_cache_stat {
> +	struct sched_cache_time __percpu *pcpu_sched;
> +	raw_spinlock_t lock;
> +	unsigned long epoch;
> +	int cpu;
> +} ____cacheline_aligned_in_smp;
> +
> +#else
> +
> +struct sched_cache_stat { };
> +
> +#endif
> +
>  #ifndef MODULE
>  #ifndef COMPILE_OFFSETS
>  
> diff --git a/init/Kconfig b/init/Kconfig
> index 444ce811ea67..d1f3579d6ea4 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1005,6 +1005,17 @@ config NUMA_BALANCING
>  
>  	  This system will be inactive on UMA systems.
>  
> +config SCHED_CACHE
> +	bool "Cache aware load balance"
> +	default y
> +	depends on SMP
> +	help
> +	  When enabled, the scheduler will attempt to aggregate tasks from
> +	  the same process onto a single Last Level Cache (LLC) domain when
> +	  possible. This improves cache locality by keeping tasks that share
> +	  resources within the same cache domain, reducing cache misses and
> +	  lowering data access latency.
> +
>  config NUMA_BALANCING_DEFAULT_ENABLED
>  	bool "Automatically enable NUMA aware memory/task placement"
>  	default y
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 65113a304518..98ef5c997cc3 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -724,6 +724,7 @@ void __mmdrop(struct mm_struct *mm)
>  	cleanup_lazy_tlbs(mm);
>  
>  	WARN_ON_ONCE(mm == current->active_mm);
> +	mm_destroy_sched(mm);
>  	mm_free_pgd(mm);
>  	mm_free_id(mm);
>  	destroy_context(mm);
> @@ -1124,6 +1125,9 @@ static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
>  	if (mm_alloc_cid(mm, p))
>  		goto fail_cid;
>  
> +	if (mm_alloc_sched(mm))
> +		goto fail_sched;
> +
>  	if (percpu_counter_init_many(mm->rss_stat, 0, GFP_KERNEL_ACCOUNT,
>  				     NR_MM_COUNTERS))
>  		goto fail_pcpu;
> @@ -1133,6 +1137,8 @@ static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
>  	return mm;
>  
>  fail_pcpu:
> +	mm_destroy_sched(mm);
> +fail_sched:
>  	mm_destroy_cid(mm);
>  fail_cid:
>  	destroy_context(mm);
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index b7f77c165a6e..eff8695000e7 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -4437,6 +4437,7 @@ static void __sched_fork(u64 clone_flags, struct task_struct *p)
>  	init_numa_balancing(clone_flags, p);
>  	p->wake_entry.u_flags = CSD_TYPE_TTWU;
>  	p->migration_pending = NULL;
> +	init_sched_mm(p);
>  }
>  
>  DEFINE_STATIC_KEY_FALSE(sched_numa_balancing);
> @@ -8749,6 +8750,11 @@ void __init sched_init(void)
>  
>  		rq->core_cookie = 0UL;
>  #endif
> +#ifdef CONFIG_SCHED_CACHE
> +		raw_spin_lock_init(&rq->cpu_epoch_lock);
> +		rq->cpu_epoch_next = jiffies;
> +#endif
> +
>  		zalloc_cpumask_var_node(&rq->scratch_mask, GFP_KERNEL, cpu_to_node(i));
>  	}
>  
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index bf948db905ed..eb3cfb852a93 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1228,6 +1228,8 @@ void post_init_entity_util_avg(struct task_struct *p)
>  	sa->runnable_avg = sa->util_avg;
>  }
>  
> +static inline void account_mm_sched(struct rq *rq, struct task_struct *p, s64 delta_exec);
> +
>  static s64 update_se(struct rq *rq, struct sched_entity *se)
>  {
>  	u64 now = rq_clock_task(rq);
> @@ -1250,6 +1252,7 @@ static s64 update_se(struct rq *rq, struct sched_entity *se)
>  
>  		trace_sched_stat_runtime(running, delta_exec);
>  		account_group_exec_runtime(running, delta_exec);
> +		account_mm_sched(rq, running, delta_exec);
>  
>  		/* cgroup time is always accounted against the donor */
>  		cgroup_account_cputime(donor, delta_exec);
> @@ -1271,6 +1274,267 @@ static s64 update_se(struct rq *rq, struct sched_entity *se)
>  
>  static void set_next_buddy(struct sched_entity *se);
>  
> +#ifdef CONFIG_SCHED_CACHE
> +
> +/*
> + * XXX numbers come from a place the sun don't shine -- probably wants to be SD
> + * tunable or so.
> + */
> +#define EPOCH_PERIOD	(HZ / 100)	/* 10 ms */
> +#define EPOCH_LLC_AFFINITY_TIMEOUT	5	/* 50 ms */
> +
> +static int llc_id(int cpu)
> +{
> +	if (cpu < 0)
> +		return -1;
> +
> +	return per_cpu(sd_llc_id, cpu);
> +}
> +
> +void mm_init_sched(struct mm_struct *mm,
> +		   struct sched_cache_time __percpu *_pcpu_sched)
> +{
> +	unsigned long epoch = 0;
> +	int i;
> +
> +	for_each_possible_cpu(i) {
> +		struct sched_cache_time *pcpu_sched = per_cpu_ptr(_pcpu_sched, i);
> +		struct rq *rq = cpu_rq(i);
> +
> +		pcpu_sched->runtime = 0;
> +		/* a slightly stale cpu epoch is acceptible */
> +		pcpu_sched->epoch = rq->cpu_epoch;
> +		epoch = rq->cpu_epoch;
> +	}
> +
> +	raw_spin_lock_init(&mm->sc_stat.lock);
> +	mm->sc_stat.epoch = epoch;
> +	mm->sc_stat.cpu = -1;
> +
> +	/*
> +	 * The update to mm->sc_stat should not be reordered
> +	 * before initialization to mm's other fields, in case
> +	 * the readers may get invalid mm_sched_epoch, etc.
> +	 */
> +	smp_store_release(&mm->sc_stat.pcpu_sched, _pcpu_sched);
> +}
> +
> +/* because why would C be fully specified */
> +static __always_inline void __shr_u64(u64 *val, unsigned int n)
> +{
> +	if (n >= 64) {
> +		*val = 0;
> +		return;
> +	}
> +	*val >>= n;
> +}
> +
> +static inline void __update_mm_sched(struct rq *rq,
> +				     struct sched_cache_time *pcpu_sched)
> +{
> +	lockdep_assert_held(&rq->cpu_epoch_lock);
> +
> +	unsigned long n, now = jiffies;
> +	long delta = now - rq->cpu_epoch_next;
> +
> +	if (delta > 0) {
> +		n = (delta + EPOCH_PERIOD - 1) / EPOCH_PERIOD;
> +		rq->cpu_epoch += n;
> +		rq->cpu_epoch_next += n * EPOCH_PERIOD;
> +		__shr_u64(&rq->cpu_runtime, n);
> +	}
> +
> +	n = rq->cpu_epoch - pcpu_sched->epoch;
> +	if (n) {
> +		pcpu_sched->epoch += n;
> +		__shr_u64(&pcpu_sched->runtime, n);
> +	}
> +}
> +
> +static unsigned long fraction_mm_sched(struct rq *rq,
> +				       struct sched_cache_time *pcpu_sched)
> +{
> +	guard(raw_spinlock_irqsave)(&rq->cpu_epoch_lock);
> +
> +	__update_mm_sched(rq, pcpu_sched);
> +
> +	/*
> +	 * Runtime is a geometric series (r=0.5) and as such will sum to twice
> +	 * the accumulation period, this means the multiplcation here should
> +	 * not overflow.
> +	 */
> +	return div64_u64(NICE_0_LOAD * pcpu_sched->runtime, rq->cpu_runtime + 1);
> +}
> +
> +static inline
> +void account_mm_sched(struct rq *rq, struct task_struct *p, s64 delta_exec)
> +{
> +	struct sched_cache_time *pcpu_sched;
> +	struct mm_struct *mm = p->mm;
> +	unsigned long epoch;
> +
> +	if (!sched_cache_enabled())
> +		return;
> +
> +	if (p->sched_class != &fair_sched_class)
> +		return;
> +	/*
> +	 * init_task, kthreads and user thread created
> +	 * by user_mode_thread() don't have mm.
> +	 */
> +	if (!mm || !mm->sc_stat.pcpu_sched)
> +		return;
> +
> +	pcpu_sched = per_cpu_ptr(p->mm->sc_stat.pcpu_sched, cpu_of(rq));
> +
> +	scoped_guard (raw_spinlock, &rq->cpu_epoch_lock) {
> +		__update_mm_sched(rq, pcpu_sched);
> +		pcpu_sched->runtime += delta_exec;
> +		rq->cpu_runtime += delta_exec;
> +		epoch = rq->cpu_epoch;
> +	}
> +
> +	/*
> +	 * If this process hasn't hit task_cache_work() for a while, or it
> +	 * has only 1 thread, invalidate its preferred state.
> +	 */
> +	if (time_after(epoch,
> +		       READ_ONCE(mm->sc_stat.epoch) + EPOCH_LLC_AFFINITY_TIMEOUT) ||
> +	    get_nr_threads(p) <= 1) {
> +		if (mm->sc_stat.cpu != -1)
> +			mm->sc_stat.cpu = -1;
> +	}
> +}

I sporadically hit the SLUB "Poison overwritten" reports on the mm_struct
cache while running mm-new:

 [Poison overwritten] 0xffff8001076ec8e8-0xffff8001076ec8eb @offset=51432. First byte 0xff instead of 0x6b
 =============================================================================
 BUG mm_struct (Tainted: G                 N ): Object corrupt
 -----------------------------------------------------------------------------

 Allocated in copy_process+0x1e48/0x2078 age=2 cpu=7 pid=11866
  copy_process+0x1e48/0x2078
  kernel_clone+0xa4/0x498
  __do_sys_clone+0x5c/0x88
  __arm64_sys_clone+0x1c/0x28
  invoke_syscall+0x54/0x110
  el0_svc_common.constprop.0+0x40/0xe0
  do_el0_svc+0x1c/0x28
  el0_svc+0x54/0x424
  el0t_64_sync_handler+0xa0/0xe4
  el0t_64_sync+0x1b0/0x1b4
 Freed in __mmdrop+0x108/0x180 age=2 cpu=3 pid=11955
  kmem_cache_free+0x290/0x53c
  __mmdrop+0x108/0x180
  __mmput+0x150/0x154
  mmput+0x50/0x5c
  exec_mm_put_old+0x74/0x84
  setup_new_exec+0x7c/0x90
  load_elf_binary+0x4b0/0x1914
  bprm_execve+0x300/0x83c
  do_execveat_common+0x168/0x1cc
  __arm64_sys_execve+0x44/0x68
  invoke_syscall+0x54/0x110
  el0_svc_common.constprop.0+0x40/0xe0
  do_el0_svc+0x1c/0x28
  el0_svc+0x54/0x424
  el0t_64_sync_handler+0xa0/0xe4
  el0t_64_sync+0x1b0/0x1b4
 Slab 0xffffffbfc1076e00 objects=23 used=18 fp=0xffff8001076e2140 flags=0x13fffe0000000240(workingset|head|node=1|zone=0|lastcpupid=0x1ffff)
 Object 0xffff8001076ec640 @offset=50752 fp=0xffff8001076e2140

 [...]

The corruption is always exactly 4 bytes (0xffffffff) with everything
around still being intact poison.  The in-object offset (51432 - 50752 =
680) resolves to &mm->sc_stat.cpu, and 0xffffffff is just -1.  My AI model
points me to this write in account_mm_sched():

	if (READ_ONCE(mm->sc_stat.cpu) != -1)
		WRITE_ONCE(mm->sc_stat.cpu, -1);

and helps with analyzing and fixing the issue like below :-) .  Please have
a look.

Thanks,
Zenghui

---8<---

From 992b515f18710e77308cf5f88943cc3ce918a525 Mon Sep 17 00:00:00 2001
From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
Date: Mon, 14 Sep 2026 22:00:18 +0800
Subject: [PATCH] sched/cache: Fix use-after-free of mm in account_mm_sched()

account_mm_sched() accounts runtime against rq->curr and dereferences its
->mm: it updates the percpu chunk mm->sc_stat.pcpu_sched and may write
mm->sc_stat.cpu = -1.

update_se(), which samples rq->curr and calls account_mm_sched(), is not
only called from local contexts (tick, context switch) but also through
update_curr() from enqueue/dequeue paths, which frequently run on a remote
CPU while holding this rq's lock (cross-CPU try_to_wake_up(), load
balancing).

In those remote contexts rq->curr is a task concurrently running on its
home CPU.  The rq lock guarantees that rq->curr's identity does not change,
but it says nothing about the lifetime of rq->curr->mm: that task does not
need the rq lock to execute execve or exit, and switches and drops its ->mm
under task_lock() and mmput(), neither of which orders against the remote
CPU.  A remote CPU can therefore sample a valid mm pointer right before it
is freed and write to it afterwards, corrupting the freed mm_struct (and
the pcpu_sched percpu chunk, which mm_destroy_sched() frees even earlier).

Observed with CONFIG_SLUB_DEBUG=y as a sporadic "Poison overwritten" report
on the mm_struct cache, with the overwritten bytes resolving to
&mm->sc_stat.cpu.

Only account the physically running task (p == current), whose ->mm cannot
go away while it is the one executing this code.  Local tick, context
switch and sched_ttwu_pending() paths are unaffected; updates skipped in
remote contexts only cause minor under-accounting of the sc_stat runtime
heuristics.

Fixes: df0d98475954 ("sched/cache: Introduce infrastructure for cache-aware load balancing")
Assisted-by: GLM-5.3 OpenCode
Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
---
 kernel/sched/fair.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index ade1eceb39b8..2bbf59370d23 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1731,6 +1731,9 @@ void account_mm_sched(struct rq *rq, struct task_struct *p, s64 delta_exec)
 	int mm_sched_llc = -1;
 	unsigned long epoch;
 
+	if (p != current)
+		return;
+
 	if (!sched_cache_enabled())
 		return;
 
-- 
2.53.0
