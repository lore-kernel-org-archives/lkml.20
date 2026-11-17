Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917213;
	b=PpzeDXMVzyqoh3SuD2ixEWmmBLi4QzeJYHPCUw4lpuqlFpWulpONgXQJyN0fPW8rGflh
	 LgGq0CEh9v0TgScb5OdTSrnKvcIpfr2vogwtyWi2VMqwC6ONEG3TDAWrZitwRYkFTsNYI
	 85O8mlD6u+BcIJJBA0gvSC6TPB2UNExQ/boNj3Ek5etCT9mvs6A/QK7cZIZAiwSkPWimP
	 76IrQjVANm2ezSf5kNlIynss1NLjZ9vm/ahBTl2ozkhYJC+zFanET/kHQmIcGWqxeTfJD
	 RigVfl5bj6aODF6LW+VmbysHDBGYxPFM12VW6XNHpw4/xekR95co/h6xBv7lgH3rq0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917213;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=R2b9dK1miiu94f2/ukvKLaZFFXNwGsSyrYNxx785f8g=;
	b=zvs+7uQ4wL6JA84tIqwAftQsjaeaBpxgx2PA+u22YqQ5XfuFuE+5L3WDq2Gp94BB8sUU
	 2sl0Pe10mUWNw48+IXVrZjVINNyn7yinSwihCT+6HeNdtWJY9QrHusxegpOojpiUxodly
	 5fm9GxCpxlTyEZxrjiiB7H2iJ9j9axmYvvf3B+I36Qo4Ee5uo/XVroovBv32zhW4gKUkK
	 4WVK139h0z8tg0VEjdsyuqFwdgyOzMP1W0WRb3oOULqAYrqFSctAr72Et0ZFGvDKlGCzN
	 nL6q6kKwbuls9GqV79wBpyx4WYF4l1Gd6C2krCrdVSG+UTGlU4VLCN1SCXyN0jt1vMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BXEB0e3s;
	arc=none smtp.remote-ip=95.215.58.8
Received: from mta1.migadu.com (out-8.mta1.migadu.com [95.215.58.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74302606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74302606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BXEB0e3s
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=T1pJg+zc7Cln2nnXfiDvzqH/16sN+OZVcgUlre4Qi1Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794917209; v=1; x=1795522009;
 b=BXEB0e3sQU/G94oTAdQNFxIg4qV45+5Wpf8twxMBjoY6Yai7JVeT8H/mksf3ylDLLqpB9Zrp
 4JkRkXnJUoKG3d8XLIE7VW+naUL53smJtFCrKiI+1+qkQrsDI3pbN4AVxAQcdl145a7ksz8yC/s
 v59M90rBWt/xA7Tc6gP73Kqw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e4f84d572d2071ae;
	Tue, 17 Nov 2026 12:06:49 +0000
X-Mizu-Trace-ID: e4f84d572d2071ae
X-Migadu-Flow: FLOW_OUT
Date: Tue, 17 Nov 2026 20:07:52 +0800
From: Chen Yu <chen.yu@linux.dev>
To: Tim Chen <tim.c.chen@linux.intel.com>,
	Jirka Hladky <jhladky@redhat.com>
Cc: Jirka Hladky <jhladky@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Chen, Yu C" <yu.c.chen@intel.com>, Ingo Molnar <mingo@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	"Gautham R . Shenoy" <gautham.shenoy@amd.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
	Hillf Danton <hdanton@sina.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Jianyong Wu <jianyong.wu@outlook.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Tingyin Duan <tingyin.duan@gmail.com>,
	Vern Hao <vernhao@tencent.com>, Vern Hao <haoxing990@gmail.com>,
	Len Brown <len.brown@intel.com>, Aubrey Li <aubrey.li@intel.com>,
	Zhao Liu <zhao1.liu@intel.com>, Chen Yu <yu.chen.surf@gmail.com>,
	Adam Li <adamli@os.amperecomputing.com>,
	Aaron Lu <ziqianlu@bytedance.com>, Tim Chen <tim.c.chen@intel.com>,
	Josh Don <joshdon@google.com>, Gavin Guo <gavinguo@igalia.com>,
	Qais Yousef <qyousef@layalina.io>,
	Libo Chen <libchen@purestorage.com>, linux-kernel@vger.kernel.org,
	"Luck, Tony" <tony.luck@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Philip Auld <pauld@redhat.com>, Joe Mario <jmario@redhat.com>
Subject: Re: [Patch v4 17/22] sched/cache: Avoid cache-aware scheduling for
 memory-heavy processes
Message-ID: <avxDmPs4rs39NC9O@three-body>
References: <cover.1775065312.git.tim.c.chen@linux.intel.com>
 <339bb2636c7306e17540268a9295a8e673b92804.1775065312.git.tim.c.chen@linux.intel.com>
 <20260409124642.GC3126523@noisy.programming.kicks-ass.net>
 <a2d7e7b2-5a4c-48bc-b567-61e3cbd17786@intel.com>
 <20260410092057.GG3126523@noisy.programming.kicks-ass.net>
 <CAE4VaGAZavgRWDf=ukaj_EJvOO52hTpAYKPe1JEtUE3E2q0y0w@mail.gmail.com>
 <13d982ce42116f876f01a77bae7f02d3800f08fc.camel@linux.intel.com>
 <avqYbuJPHo4zLDOd@three-body>
 <CAE4VaGAL5FPGUrG76pzf=9pJTaMWa60pbkLv-ZXCFjr5H2JpDg@mail.gmail.com>
 <879c23213859f24b12a23530d6ae849bbe504b6b.camel@linux.intel.com>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <879c23213859f24b12a23530d6ae849bbe504b6b.camel@linux.intel.com>

Hi Tim, Jirka,

On Mon, Nov 16, 2026 at 03:16:01PM -0800, Tim Chen wrote:
> On Mon, 2026-11-16 at 15:35 +0100, Jirka Hladky wrote:
> 
> Hi Jirka,
> 
> Thanks for testing Chen Yu's sketch patch so quickly.
> 
> 
> > Hi Chen Yu, Tim,
> > 
> > > Do you mean accumulate the pages into the group in task_numa_fault()?
> > > ...
> > > Would this decay cause a jitter of the footprint? Anyway, I thought
> > > what you suggested is the following for fix2 ...
> > 
> > I built and tested the sketch on the Sierra Forest box: a kernel built
> > from the same 7.4.0-0.rc2.19.eln159 source as my baselines, patched
> > with your sketch plus the fixes needed to compile it, and with one
> > change: the decay is applied once per group per sweep via a
> > last_decay_seq stamp, since decaying per task would halve the group
> > footprint once per thread per sweep.
> > 
> > The accounting mechanism works exactly as designed:
> > 
> > - The footprint accumulates during the sweep and crosses the
> >   27,648-page LLC threshold at t=4.4 s; the aggregation is withdrawn
> >   and stays withdrawn (grp->cpu = -1 in 96% of 27,796 samples). To
> >   answer the jitter question: with once-per-sweep decay I saw no
> >   oscillation in a run whose footprint reached ~3.95M pages.
> > - Removing the exit()/exec() subtraction held up fine as well.
> > 
> > But the regression is not fixed. NAS MG class D, 1x64 threads, n=5,
> > median time:
> > 
> >     stock rc2.19, CAS off      26.45 s
> >     stock rc2.19, CAS on      41.78 s   (+58%)
> >     sketch,          CAS off      26.57 s
> >     sketch,          CAS on      39.19 s   (+47.5%)
> > 
> > The regression drops from +58% to +47.5%: 2.6 s of the 15.3 s gap,
> > about one sixth, and the reason is placement hysteresis. The 2.1 s
> > window between the aggregation settling
> > and the gate tripping has already shaped the run: the threads re-spread
> > at only ~1 thread per second (4/60 across the two nodes at t=5 s,
> > 20/44 at t=28 s), and the memory first-touched during the window is
> > 59/41 toward the aggregated node, with NUMA balancing then pulling even
> > more memory there as the run continues. Withdrawing grp->cpu stops the
> > steering but does not undo the placement, the fault statistics, or the
> > page layout.
> 
> It does seem like the hysteresis is too strong, and takes too long to 
> even out on the MG workload. 
>

Agreed, it seems that the window before the first full-scan round is still
noticeable for MG. 

> > 
> > A few observations for the design:
> > 
> > 1. Fix 1 (the RSS gate) looks critical for this workload class. MG's
> >    RSS crosses the 108 MiB LLC size within ~0.1 s of the allocation
> >    phase, so an RSS gate would refuse aggregation almost immediately,
> >    before first-touch lays down the skewed layout.
> > 
> 
> Yeah, perhaps some form of Fix 1 is needed.  However
> fix 1 benefits mostly workload where aggregation is unhelpful.
> 
> There is a downside for Fix 1 for processes that actually benefit
> from aggregation.
> 
> RSS gate is an upper bound on the cache footprint for the default
> case where cache group is a process.  It tends to over estimate and
> it will take several scan windows to shed its effect and we could miss
> aggregation in the mean time. 
> 
> Chen Yu, on your point that a cache group will no longer be one mm
> and that we have no per-group RSS: I do not think we need one.
> I think mm's RSS serves more as a bound of the footprint when we are
> just starting our scan. For a group spanning several processes 
> we can use the largest member, which still refuses when any one member
> cannot fit.  It is just an initial value that will get decayed away.
>

OK, this makes sense.
 
> One more thing about the decay, mostly for Chen Yu. The once-per-group
> version halves the whole footprint, including the sweep that just
> closed. The NUMA fault statistics do not: per node they compute
> mem = mem / 2 + membuf, so the new window is added in full and only
> the history is halved. With B pages per sweep the two settle at 2B
> and B respectively depending on your sample time.
>

OK - mem = mem / 2 + membuf can be used to keep it consistent with the current
NUMA balancing fault statistic. Although I'm not sure why the original NUMA balancing
code uses this strategy, normally, for an EWMA, it should be
mem = p * mem + (1 - p) * membuf, where p is in (0, 1).
 
> A group whose per sweep footprint sits between
> one and two LLC sizes would flip in and out of aggregation at every
> sweep with the current form.
> 
> I have a small patch on top of Chen Yu's patch to mitigate this issue.
> It keeps a count in the scan window and a history count, and combine
> the two when sampled to smooth out any jump.
> 
> I also generated another test patch on top to test the RSS gate idea. 
> 
> > 2. Fix 2's trip time is bounded below by the scanner, not by the fault
> >    count: the 4.4 s crossing decomposes into the 1 s scan delay plus
> >    the 2-3 s the scanner needs to reach the large VMAs of a 26.4 GiB
> >    address space. Even the theoretical ~1.8 s would arrive after ~60%
> >    of the working set is first-touched.
> > 
> > 3. One caveat on the withdrawal path, shared by both fixes: whenever
> >    the gate trips after aggregation has been in effect, passive
> >    withdrawal (clearing grp->cpu) recovers almost nothing on this
> >    workload; the tasks re-spread at ~1 per second. An effective
> >    withdrawal would need to actively re-spread the tasks or reset
> >    their NUMA preferences. With Fix 1 in place this matters less for
> >    the regression class I reported, since aggregation is refused
> >    before it settles; it applies to workloads that grow past the LLC
> >    mid-run.
> 
> This is a good find and I think it deserves its own thread. One
> suspect: while the threads were aggregated, NUMA balancing moved
> their pages to that node, so numa_preferred_nid points there. After
> grp->cpu is cleared the load balancer can move a thread out, but
> numa_migrate_preferred() pulls it back toward its pages. On a system
> where the LLC is the node, the two mechanisms reinforce each other.
> 
> Wonder if NUMA balancing is preventing the re-spread?
> If your traces have numa_preferred_nid and task_numa_migrate activity
> after the trip, that would confirm or rule it out.
> 
>

This seems to be another issue of NUMA balancing fighting with generic load
balancing, independent of the current footprint issue.
 
> > 
> > Happy to re-test when the next revision is posted. The exact version I
> > tested, on top of your sketch with the changes above, is below. The diff
> > is against v7.4-rc2; the hunks are in code my downstream patchset does
> > not touch, so it should apply to your tree as well.
> > 
> > Thanks,
> > Jirka
> > 
> 
> Two patches on top of Chen Yu's sketch patch below.  Thanks.
> 
> Tim
> 
> --->8----
> From: Tim Chen <tim.c.chen@linux.intel.com>
> Subject: [PATCH 1/2] sched/cache: Keep the footprint flat across sweep
>  boundaries
> 
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index cf2d9dac959f..f528be926ab0 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -2392,7 +2392,15 @@ struct sched_cache_group {
>  	unsigned long epoch;
>  	u64 nr_running_avg;
>  	unsigned long next_scan;
> +	/*
> +	 * Footprint estimate in pages. footprint is the decayed history of
> +	 * the completed scan sweeps, written by one task per sweep.
> +	 * footprint_cur collects the hint faults of the current sweep from
> +	 * all tasks. The estimate is max(footprint, footprint / 2 +
> +	 * footprint_cur), see sched_cache_footprint_decay().
> +	 */
>  	unsigned long footprint;
> +	atomic_long_t footprint_cur;
>  	unsigned long last_decay_seq;
>  	int cpu;
>  	refcount_t refcnt;
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 44b016cd999e..0e0e8f6fd011 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1424,7 +1424,7 @@ static inline int get_sched_cache_scale(int mul)
>  static bool exceed_llc_capacity(struct sched_cache_group *grp, int cpu)
>  {
>  #ifdef CONFIG_NUMA_BALANCING
> -	unsigned long llc, footprint;
> +	unsigned long llc, footprint, hist, cur;
>  	struct sched_domain *sd;
>  	int scale;
>  
> @@ -1440,7 +1440,14 @@ static bool exceed_llc_capacity(struct sched_cache_group *grp, int cpu)
>  		 * excluded.
>  		 */
>  		llc = sd->llc_bytes;
> -		footprint = READ_ONCE(grp->footprint);
> +		/*
> +		 * The history, or what it becomes at the next sweep
> +		 * boundary if no more faults arrive, whichever is larger.
> +		 * See sched_cache_footprint_decay().
> +		 */
> +		hist = READ_ONCE(grp->footprint);
> +		cur = atomic_long_read(&grp->footprint_cur);
> +		footprint = max(hist, hist / 2 + cur);
>  
>  		/*
>  		 * Scale the LLC size by 256*llc_aggr_tolerance
> @@ -1621,6 +1628,7 @@ int mm_init_sched(struct mm_struct *mm,
>  	grp->next_scan = jiffies;
>  	grp->nr_running_avg = 0;
>  	grp->footprint = 0;
> +	atomic_long_set(&grp->footprint_cur, 0);
>  	grp->last_decay_seq = 0;
>  	refcount_set(&grp->refcnt, 1);
>  	/*
> @@ -3817,42 +3825,58 @@ static int preferred_group_nid(struct task_struct *p, int nid)
>  
>  #if defined(CONFIG_SCHED_CACHE) && defined(CONFIG_NUMA_BALANCING)
>  /*
> - * Fix 2 (Chen Yu sketch, test build): accumulate the pages reported by
> - * task_numa_fault() into the group footprint as they arrive within the
> - * current sweep, instead of waiting for task_numa_placement() at the sweep
> - * boundary. Batched per task to limit writes to the shared counter.
> + * Accumulate the pages reported by task_numa_fault() into the footprint of
> + * the current sweep as they arrive, instead of waiting for
> + * task_numa_placement() at the sweep boundary. A sweep of a large address
> + * space can take longer than the workload runs.
> + *
> + * The pages are batched per task before they are added to the shared
> + * counter. One THP hint fault reports HPAGE_PMD_NR pages, so the batch is
> + * one THP, or 512 base pages. task_numa_placement() flushes the batch
> + * once per sweep, so pages below the threshold are missing from the
> + * window for at most the sweep in progress.
>   */
> -#define SCHED_CACHE_FP_THRESHOLD 10
> -static void sched_cache_footprint_accum(struct task_struct *p, int pages)
> +#define SCHED_CACHE_FP_THRESHOLD 512
> +static void sched_cache_footprint_flush(struct task_struct *p)
>  {
>  	struct sched_cache_group *grp;
>  
> -	p->total_footprint += pages;
> -
> -	if (p->total_footprint < SCHED_CACHE_FP_THRESHOLD)
> +	if (!p->total_footprint)
>  		return;
>  
>  	guard(rcu)();
>  	grp = rcu_dereference(p->sched_cache_grp);
> -	if (!grp)
> -		return;
> -
> -	/* drain the per-task footprint into the group */
> -	WRITE_ONCE(grp->footprint, READ_ONCE(grp->footprint) + p->total_footprint);
> +	if (grp)
> +		atomic_long_add(p->total_footprint, &grp->footprint_cur);
>  	p->total_footprint = 0;
>  }
>  
> +static void sched_cache_footprint_accum(struct task_struct *p, int pages)
> +{
> +	p->total_footprint += pages;
> +
> +	if (p->total_footprint >= SCHED_CACHE_FP_THRESHOLD)
> +		sched_cache_footprint_flush(p);
> +}
> +
>  /*
> - * Decay once per group per sweep: the first task whose placement() observes
> - * a new scan sequence halves the accumulated window. (Decaying per task, as
> - * in the original sketch, would halve the group footprint once per thread
> - * per sweep.)
> + * Close the window at the sweep boundary, once per group per sweep: the
> + * first task whose task_numa_placement() observes a new scan sequence
> + * folds the current window into the history.
> + *
> + * Only the history is decayed. The window that just closed is added in
> + * full, like the per node update of the NUMA fault statistics:
> + *
> + *	mem = mem / 2 + membuf
> + *
> + * With B pages touched per sweep the history settles at 2B, the value
> + * the fault statistics report.
>   */
>  static void sched_cache_footprint_decay(struct task_struct *p)
>  {
>  	struct sched_cache_group *grp;
>  	unsigned long seq = p->numa_scan_seq;
> -	unsigned long old;
> +	unsigned long old, cur;
>  
>  	guard(rcu)();
>  	grp = rcu_dereference(p->sched_cache_grp);
> @@ -3862,12 +3886,16 @@ static void sched_cache_footprint_decay(struct task_struct *p)
>  	old = READ_ONCE(grp->last_decay_seq);
>  	if (old == seq)
>  		return;
> -	if (cmpxchg(&grp->last_decay_seq, old, seq) == old)
> -		WRITE_ONCE(grp->footprint, READ_ONCE(grp->footprint) / 2);
> +	if (cmpxchg(&grp->last_decay_seq, old, seq) != old)
> +		return;

I'm not sure if we should introduce this per-group last_decay_seq. The grp->last_decay_seq is
assigned the current p->numa_scan_seq, which is derived from p->mm->numa_scan_seq. In the current
implementation, cache-aware scheduling is per-mm, so this is OK. But soon, after we introduce
cross-process/mm cache-aware scheduling via prctl, assigning different mm->numa_scan_seq values to
the shared grp->last_decay_seq might cause last_decay_seq to bounce between different mms' numa_scan_seq,
which could decay the grp->footprint very fast.

That is to say, since we need a "global" sequence across different mm, can we use jiffies in
task_cache_work() to decay the footprint periodically, rather than decay it in task_numa_placement()?
Besides, task_numa_placement() might only be invoked after a full scan, and only if there are NUMA page
faults. If we put the decay in task_cache_work(), only 1 task of the group is allowed to decay the footprint,
and it might be more reliable to invoked? I wonder if the following method would work, similar to what your
patch does for RSS gating(just compiled)?

diff --git a/include/linux/sched.h b/include/linux/sched.h
index e4f6323d7855..8a54335e4fa9 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2394,6 +2394,8 @@ struct sched_cache_group {
 	u64 nr_running_avg;
 	unsigned long next_scan;
 	unsigned long footprint;
+	atomic_long_t footprint_cur;
+	unsigned long footprint_timeout;
 	int cpu;
 	refcount_t refcnt;
 	struct rcu_head rcu;
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 79f6b3a4fd7f..477b8b5b7229 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1393,6 +1393,7 @@ static s64 update_se(struct rq *rq, struct sched_entity *se)
  * tunable or so.
  */
 #define EPOCH_PERIOD	(HZ / 100)	/* 10 ms */
+#define SCHED_CACHE_FP_TIMEOUT_PERIOD	(4 * HZ)
 #define EPOCH_LLC_AFFINITY_TIMEOUT	5	/* 50 ms */
 __read_mostly unsigned int llc_aggr_tolerance	= 1;
 __read_mostly unsigned int llc_epoch_period	= EPOCH_PERIOD;
@@ -1424,7 +1425,7 @@ static inline int get_sched_cache_scale(int mul)
 static bool exceed_llc_capacity(struct sched_cache_group *grp, int cpu)
 {
 #ifdef CONFIG_NUMA_BALANCING
-	unsigned long llc, footprint;
+	unsigned long llc, footprint, hist;
 	struct sched_domain *sd;
 	int scale;
 
@@ -1440,7 +1441,8 @@ static bool exceed_llc_capacity(struct sched_cache_group *grp, int cpu)
 		 * excluded.
 		 */
 		llc = sd->llc_bytes;
-		footprint = READ_ONCE(grp->footprint);
+		hist = READ_ONCE(grp->footprint);
+		footprint = max(hist, hist / 2 + atomic_long_read(&grp->footprint_cur));
 
 		/*
 		 * Scale the LLC size by 256*llc_aggr_tolerance
@@ -1621,6 +1623,8 @@ int mm_init_sched(struct mm_struct *mm,
 	grp->next_scan = jiffies;
 	grp->nr_running_avg = 0;
 	grp->footprint = 0;
+	atomic_long_set(&grp->footprint_cur, 0);
+	grp->footprint_timeout = jiffies + SCHED_CACHE_FP_TIMEOUT_PERIOD;
 	refcount_set(&grp->refcnt, 1);
 	/*
 	 * The update to grp->pcpu_sched should not be reordered
@@ -1730,19 +1734,6 @@ void sched_cache_exit_mm(struct task_struct *p)
 {
 	struct sched_cache_group *grp = sched_cache_replace_grp(p, NULL);
 
-#ifdef CONFIG_NUMA_BALANCING
-	/*
-	 * Subtract this task's footprint from the group before dropping the
-	 * reference, so the group footprint converges as its threads exit.
-	 * Unlocked for performance; clamp to avoid underflow.
-	 */
-	if (grp && p->total_numa_faults) {
-		unsigned long fp = READ_ONCE(grp->footprint);
-		unsigned long sub = min(fp, p->total_numa_faults);
-
-		WRITE_ONCE(grp->footprint, fp - sub);
-	}
-#endif
 	sched_cache_group_put(grp);
 }
 
@@ -2017,6 +2008,15 @@ static void task_cache_work(struct callback_head *work)
 				     READ_ONCE(llc_epoch_period), 1)))
 		return;
 
+	if (time_after_eq(now, grp->footprint_timeout)) {
+		unsigned long hist, cur;
+
+		cur = atomic_long_xchg(&grp->footprint_cur, 0);
+		hist = READ_ONCE(grp->footprint) / 2 + cur;
+		WRITE_ONCE(grp->footprint, hist);
+		grp->footprint_timeout = now + SCHED_CACHE_FP_TIMEOUT_PERIOD;
+	}
+
 	curr_cpu = task_cpu(p);
 	if (invalid_llc_nr(grp, p, curr_cpu) ||
 	    exceed_llc_capacity(grp, curr_cpu)) {
@@ -3829,14 +3829,12 @@ static int preferred_group_nid(struct task_struct *p, int nid)
 static void task_numa_placement(struct task_struct *p)
 	__context_unsafe(/* conditional locking */)
 {
-	struct sched_cache_group __maybe_unused *grp;
 	int seq, nid, max_nid = NUMA_NO_NODE;
 	unsigned long max_faults = 0;
 	unsigned long fault_types[2] = { 0, 0 };
 	unsigned long total_faults;
 	u64 runtime, period;
 	spinlock_t *group_lock = NULL;
-	long __maybe_unused new_fp;
 	struct numa_group *ng;
 
 	/*
@@ -3911,36 +3909,6 @@ static void task_numa_placement(struct task_struct *p)
 				ng->total_faults += diff;
 				group_faults += ng->faults[mem_idx];
 			}
-#ifdef CONFIG_SCHED_CACHE
-			/*
-			 * Per task p->numa_faults[mem_idx] converges,
-			 * so the accumulation of each task's faults
-			 * converges too - Given the number of threads,
-			 * it cannot overflow an unsigned long.
-			 * Racy with concurrent updates from other threads
-			 * sharing this mm. Acceptable since footprint is a
-			 * heuristic and occasional lost updates are tolerable.
-			 *
-			 * If a task exits, its corresponding footprint must
-			 * be subtracted from p->sched_cache_grp->footprint,
-			 * otherwise the footprint will not converge: the
-			 * exiting thread's footprint remains unchanged/undecayed.
-			 * See exit_mm().
-			 *
-			 * Lost updates and unsynchronized subtraction
-			 * in exit_mm() can cause footprint + diff to
-			 * go negative. Clamp to zero to prevent the
-			 * unsigned footprint from wrapping.
-			 */
-			scoped_guard(rcu) {
-				grp = rcu_dereference(p->sched_cache_grp);
-
-				if (grp) {
-					new_fp = (long)READ_ONCE(grp->footprint) + diff;
-					WRITE_ONCE(grp->footprint, max(new_fp, 0L));
-				}
-			}
-#endif
 		}
 
 		if (!ng) {
@@ -4210,6 +4178,15 @@ void task_numa_fault(int last_cpupid, int mem_node, int pages, int flags)
 	p->numa_faults[task_faults_idx(NUMA_MEMBUF, mem_node, priv)] += pages;
 	p->numa_faults[task_faults_idx(NUMA_CPUBUF, cpu_node, priv)] += pages;
 	p->numa_faults_locality[local] += pages;
+
+#ifdef CONFIG_SCHED_CACHE
+	scoped_guard(rcu) {
+		struct sched_cache_group *grp = rcu_dereference(p->sched_cache_grp);
+
+		if (grp)
+			atomic_long_add(pages, &grp->footprint_cur);
+	}
+#endif
 }
 
 static void reset_ptenuma_scan(struct task_struct *p)
-- 
2.43.0

> +
> +	cur = atomic_long_xchg(&grp->footprint_cur, 0);
> +	WRITE_ONCE(grp->footprint, READ_ONCE(grp->footprint) / 2 + cur);
>  }
>  
>  #else
>  static inline void sched_cache_footprint_accum(struct task_struct *p, int pages) { }
> +static inline void sched_cache_footprint_flush(struct task_struct *p) { }
>  static inline void sched_cache_footprint_decay(struct task_struct *p) { }
>  #endif
>  
> @@ -3985,6 +4013,12 @@ static void task_numa_placement(struct task_struct *p)
>  	}
>  
>  	update_task_scan_period(p, fault_types[0], fault_types[1]);
> +
> +	/*
> +	 * Once per sweep: add this task's pending pages to the window
> +	 * before the window may be closed below.
> +	 */
> +	sched_cache_footprint_flush(p);
>  	sched_cache_footprint_decay(p);
>  }
>  
> -- 
> 
> From: Tim Chen <tim.c.chen@linux.intel.com>
> Date: Mon, 16 Nov 2026 14:05:45 -0800
> Subject: [PATCH 2/2] sched/cache: Use the RSS as an upper bound while there is
>  no footprint
> 
> The footprint check of exceed_llc_capacity() needs NUMA balancing hint
> faults. Until the first scan sweep of the address space completes there
> is no estimate, and without NUMA balancing there never is one. In both
> cases the check passes and a process of any size can be aggregated.
> 
> Use the RSS of the mm as the footprint while there is no estimate. The
> RSS is a poor estimate of the working set, but it is an upper bound: if
> the RSS fits in the LLC, so does the working set. If it does not fit,
> we cannot tell, and refuse to aggregate.
> 
> Not-yet-signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
> ---
>  include/linux/sched.h |  6 +++
>  kernel/sched/fair.c   | 95 ++++++++++++++++++++++++++++---------------
>  2 files changed, 68 insertions(+), 33 deletions(-)
> 
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index f528be926ab0..9924a781c9dc 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -2402,6 +2402,12 @@ struct sched_cache_group {
>  	unsigned long footprint;
>  	atomic_long_t footprint_cur;
>  	unsigned long last_decay_seq;
> +	/*
> +	 * RSS of the mm of the last task that scanned for the group, in
> +	 * pages. An upper bound of the working set, used while there is no
> +	 * footprint estimate yet. See exceed_llc_capacity().
> +	 */
> +	unsigned long rss_bound;
>  	int cpu;
>  	refcount_t refcnt;
>  	struct rcu_head rcu;
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 0e0e8f6fd011..ef2af7a0c082 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1423,8 +1423,7 @@ static inline int get_sched_cache_scale(int mul)
>  
>  static bool exceed_llc_capacity(struct sched_cache_group *grp, int cpu)
>  {
> -#ifdef CONFIG_NUMA_BALANCING
> -	unsigned long llc, footprint, hist, cur;
> +	unsigned long llc, footprint = 0;
>  	struct sched_domain *sd;
>  	int scale;
>  
> @@ -1434,46 +1433,67 @@ static bool exceed_llc_capacity(struct sched_cache_group *grp, int cpu)
>  	if (!sd)
>  		return true;
>  
> +	/*
> +	 * Scale the LLC size by 256*llc_aggr_tolerance
> +	 * and compare it to the task's footprint.
> +	 *
> +	 * Suppose the L3 size is 32MB. If the
> +	 * llc_aggr_tolerance is 1:
> +	 * When the footprint is larger than 32MB, the
> +	 * process is regarded as exceeding the LLC
> +	 * capacity. If the llc_aggr_tolerance is 99:
> +	 * When the footprint is larger than 784GB, the
> +	 * process is regarded as exceeding the LLC
> +	 * capacity:
> +	 * 784GB = (1 + (99 - 1) * 256) * 32MB
> +	 * If the llc_aggr_tolerance is 100:
> +	 * ignore the footprint and do the aggregation
> +	 * anyway.
> +	 */
> +	scale = get_sched_cache_scale(256);
> +	if (scale == INT_MAX)
> +		return false;
> +
> +	/*
> +	 * TBD: RDT exclusive LLC ways reserved should be
> +	 * excluded.
> +	 */
> +	llc = sd->llc_bytes;
> +
> +#ifdef CONFIG_NUMA_BALANCING
>  	if (static_branch_likely(&sched_numa_balancing)) {
> -		/*
> -		 * TBD: RDT exclusive LLC ways reserved should be
> -		 * excluded.
> -		 */
> -		llc = sd->llc_bytes;
> +		unsigned long hist, cur;
> +
>  		/*
>  		 * The history, or what it becomes at the next sweep
>  		 * boundary if no more faults arrive, whichever is larger.
>  		 * See sched_cache_footprint_decay().
> +		 *
> +		 * The history is 0 until the first scan sweep of the
> +		 * address space completes. Until then the window alone
> +		 * is not an estimate of the working set, only a lower
> +		 * bound of it, so fall back to the RSS bound below.
>  		 */
>  		hist = READ_ONCE(grp->footprint);
> -		cur = atomic_long_read(&grp->footprint_cur);
> -		footprint = max(hist, hist / 2 + cur);
> -
> -		/*
> -		 * Scale the LLC size by 256*llc_aggr_tolerance
> -		 * and compare it to the task's footprint.
> -		 *
> -		 * Suppose the L3 size is 32MB. If the
> -		 * llc_aggr_tolerance is 1:
> -		 * When the footprint is larger than 32MB, the
> -		 * process is regarded as exceeding the LLC
> -		 * capacity. If the llc_aggr_tolerance is 99:
> -		 * When the footprint is larger than 784GB, the
> -		 * process is regarded as exceeding the LLC
> -		 * capacity:
> -		 * 784GB = (1 + (99 - 1) * 256) * 32MB
> -		 * If the llc_aggr_tolerance is 100:
> -		 * ignore the footprint and do the aggregation
> -		 * anyway.
> -		 */
> -		scale = get_sched_cache_scale(256);
> -		if (scale == INT_MAX)
> -			return false;
> -
> -		return ((llc * (u64)scale) < (footprint * PAGE_SIZE));
> +		if (hist) {
> +			cur = atomic_long_read(&grp->footprint_cur);
> +			footprint = max(hist, hist / 2 + cur);
> +		}
>  	}
>  #endif
> -	return false;
> +	/*
> +	 * No footprint estimate: the first sweep has not completed, or
> +	 * NUMA balancing is off. Fall back to the RSS of the mm. It is a
> +	 * poor estimate of the working set but an upper bound of it: if
> +	 * the RSS fits in the LLC, so does the working set. If it does
> +	 * not fit, we cannot tell, and refuse to aggregate. A missed
> +	 * aggregation forfeits a gain. A wrong one on a memory bandwidth
> +	 * bound process costs far more.
> +	 */
> +	if (!footprint)
> +		footprint = READ_ONCE(grp->rss_bound);
> +
> +	return ((llc * (u64)scale) < (footprint * PAGE_SIZE));
>  }
>  
>  static bool invalid_llc_nr(struct sched_cache_group *grp, struct task_struct *p,
> @@ -1630,6 +1650,7 @@ int mm_init_sched(struct mm_struct *mm,
>  	grp->footprint = 0;
>  	atomic_long_set(&grp->footprint_cur, 0);
>  	grp->last_decay_seq = 0;
> +	grp->rss_bound = 0;
>  	refcount_set(&grp->refcnt, 1);
>  	/*
>  	 * The update to grp->pcpu_sched should not be reordered
> @@ -2013,6 +2034,14 @@ static void task_cache_work(struct callback_head *work)
>  				     READ_ONCE(llc_epoch_period), 1)))
>  		return;
>  
> +	/*
> +	 * Sample the RSS of our own mm once per epoch, for the check
> +	 * below and for the tick and load balancer paths, which must
> +	 * not touch the mm of a task that is not current.
> +	 */
> +	if (p->mm)
> +		WRITE_ONCE(grp->rss_bound, get_mm_rss(p->mm));

MM_FILEPAGES includes some shared library, which was excluded by NUMA balancing, so
we might also want to exclude it from the RSS. Maybe with above footprint timeout decay
applied, we can decay the rss_bound as well, or use update_avg() to smooth it,
otherwise it never shrink if we use max():

@@ -2014,9 +2019,18 @@ static void task_cache_work(struct callback_head *work)
                cur = atomic_long_xchg(&grp->footprint_cur, 0);
                hist = READ_ONCE(grp->footprint) / 2 + cur;
                WRITE_ONCE(grp->footprint, hist);
+               WRITE_ONCE(grp->rss_bound, READ_ONCE(grp->rss_bound) / 2);
                grp->footprint_timeout = now + SCHED_CACHE_FP_TIMEOUT_PERIOD;
        }
 
+       if (p->mm) {
+               unsigned long rss;
+
+               rss = get_mm_counter(p->mm, MM_ANONPAGES) +
+                     get_mm_counter(p->mm, MM_SHMEMPAGES);
+               WRITE_ONCE(grp->rss_bound, max(READ_ONCE(grp->rss_bound), rss));
+       }
+

After a second thought, if we apply RSS based Fix2, do we still need Fix1？

thanks,
Chenyu

> +
>  	curr_cpu = task_cpu(p);
>  	if (invalid_llc_nr(grp, p, curr_cpu) ||
>  	    exceed_llc_capacity(grp, curr_cpu)) {
> -- 
> 2.53.0
> 
> 
> 
> 
