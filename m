Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794807922;
	b=oEiHUmHTyY4sKjhdw6A5Pk8ZwegLBp/Noq6MMjACoHVPby3KbiB2La3FK/CzRWmQAFVv
	 OQiF/gKRiKOHMIHd7/boJiLwaiEMJVLgsJ4CwgnB0ZFYMkDG/oqSbMaqaNJyj3rMMs4eV
	 RULc20i0yHvGjAjIkEh+3volwyhon3yCQF2DWDYQpXGFPKxfRbZbhjxmXnt1+b0PlC7g7
	 5gX/Qi2sjEWRlYcYq7gJE8TKQh8ZyDKXA6CrqITKFgeX8bW3KkU6ioB3Jf44JGUGcMviO
	 /323bS3ztTuIlZ3HZ5CqABuRYgMacmzDI651RjiDnFof3Sk7otW8OAXveYwWCb2P55w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794807922;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=OFNhNOmKAMzSDCt0ukTQZXLoXe5f8iTr6DZkUFKJ0G0=;
	b=x0lMa7I4rZJsXa3DuKIOyr0aSpqsp4jKc1IK/Ha7cS/1Ib6xG/1MTz5eAWNJ87+OdpzC
	 hdSFZY5C9lUZuDedV39cEIo48TrBf7BaWuHGQJzjV0Bf/ev6oGtAsiz7RV5Htxjgpa/uB
	 FIRW7nOeGWWolhlyxDA/1LQQQFL+yFQjk8Fqkw/be87t+CMS+SByG/bUdbBTTcF3v00YF
	 6UTbKuWyEqYCFIxS7eBDu4tzphQp0RFKCRE1LCtAUaZGrCHpTnbbWGAteYi3CiTP60giF
	 iZgk49tgNsYSaUQ7TiAJsAOjzqmp1/axYAVXKmlsIdfuP+Fo4HNL3KL4XOf/JZvsieQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OsaDB+3c;
	arc=none smtp.remote-ip=95.215.58.132
Received: from mta1.migadu.com (out-132.mta1.migadu.com [95.215.58.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83944606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:45:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83944606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OsaDB+3c
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=EjBhrIumqE/sEoDFElRhvyR8Zwtd1b0nM+HuMtfpfZg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794807918; v=1; x=1795412718;
 b=OsaDB+3cMWSacFCT4eYJfMb4Czya0K7xCCysTK5ESWXIodJB56klQZkbIp2/MvgWDVaYdpY0
 Xqb60S3Y4gFn+7l/26fJdWrg9e/n1f5GO0uOWhiKQpuPAqnQZg3h0FZJCd8yd76MSemEkZttxcZ
 //Adz+HZY7xIf5+tuHAjIN6Q=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id eb29d59122beb561;
	Mon, 16 Nov 2026 05:45:11 +0000
X-Mizu-Trace-ID: eb29d59122beb561
X-Migadu-Flow: FLOW_OUT
Date: Mon, 16 Nov 2026 13:46:17 +0800
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
Message-ID: <avqYbuJPHo4zLDOd@three-body>
References: <cover.1775065312.git.tim.c.chen@linux.intel.com>
 <339bb2636c7306e17540268a9295a8e673b92804.1775065312.git.tim.c.chen@linux.intel.com>
 <20260409124642.GC3126523@noisy.programming.kicks-ass.net>
 <a2d7e7b2-5a4c-48bc-b567-61e3cbd17786@intel.com>
 <20260410092057.GG3126523@noisy.programming.kicks-ass.net>
 <CAE4VaGAZavgRWDf=ukaj_EJvOO52hTpAYKPe1JEtUE3E2q0y0w@mail.gmail.com>
 <13d982ce42116f876f01a77bae7f02d3800f08fc.camel@linux.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <13d982ce42116f876f01a77bae7f02d3800f08fc.camel@linux.intel.com>

Hi Jirka, Tim,

On Fri, Nov 13, 2026 at 03:06:58PM -0800, Tim Chen wrote:
> On Fri, 2026-11-13 at 17:29 +0100, Jirka Hladky wrote:
> > Hi Peter, Chen Yu, Tim,
> > 
> > 
> > 
> 
> [snip]
> 
> > THE FOOTPRINT ESTIMATE NEVER LEAVES ZERO (MG class D, 64 threads)
> >   Traced live on the stock kernel with bpftrace (comm-filtered),
> >   across three CAS-on runs:
> > 
> >     - grp->footprint: 0 in 44,670 and 40,638 task_cache_work()
> >       samples over two full runs (min = max = 0), while ~7M pages
> >       (26.4 GiB) were resident. NUMA balancing was active: 8k-20k
> >       hint faults and up to 3.3M pages migrated per run.
> >     - In those two runs the footprint write never executed: all
> >       ~8k-13k task_numa_placement() calls per run (one per hint
> >       fault, via task_numa_fault()) returned at the scan_seq gate.
> > 
> >   WHY THE SIGNAL NEVER ACCUMULATES
> >   1. grp->footprint is only written in task_numa_placement(),
> >      which runs only when mm->numa_scan_seq changes. That counter
> >      increments only in reset_ptenuma_scan(): when the NUMA scanner
> >      has wrapped the whole address space.
> >   2. The scanner walks the 26.4 GiB of mappings at ~0.3-1 GiB/s
> >      (traced via mm->numa_scan_offset and change_prot_numa()
> >      return values), so one sweep takes 30-40s or more. The 43s
> >      benchmark completed 0 sweeps in two runs, 1 sweep (at t=33s)
> >      in a third. The accounting runs at most once per task per
> >      run.
> >   3. The signal is also small: a run accumulates only 8k-20k
> >      hint-fault events, 0.1-0.3% of the working set, below the
> >      108 MiB threshold even when a sweep does complete.
> >   4. And it is a rate signal, not a size: the increment is
> >      diff = numa_faults[MEMBUF] - numa_faults[MEM] / 2, which is
> >      zero at any steady fault rate.
> > 
> >   Cadence, coverage and formula each independently hold the
> >   footprint orders of magnitude below the resident set.
> > 
> >   exceed_llc_capacity() is evaluated on every tick and every scan
> >   epoch, but with footprint at 0 the comparison
> > 
> >       llc_bytes * scale  <  footprint * PAGE_SIZE
> > 
> >   is never true, so grp->cpu is never reset. After a 1.8s warm-up it
> >   pointed at the same LLC for all 44,661 remaining samples.
> > 
> >   Without NUMA balancing the check never triggers, as sched-cache.rst
> >   documents. With CAS on and numa_balancing=0 the same run takes
> >   42.2s, the same as with NUMA balancing on (42.0s).
> > 
> > WHAT THE AGGREGATION COSTS (MG class D, 64 threads)
> >   - With CAS on, 97% of thread-samples are on one node. The 26.4 GiB
> >     working set starts ~50/50 across the nodes and NUMA balancing
> >     then pulls it to the busy node (numa_maps 3.3M/2.7M pages ->
> >     6.7M/0.2M; 1.42M pages migrated during the run).
> >   - The cost is not on the CPU side: average CPU utilization is
> >     essentially unchanged (6164% vs 6029% - about 61 of the 64
> >     threads on-CPU in both configurations), and wakeup latency is
> >     49us on average, 0.73ms max (perf sched). What grows is
> >     UserTime, +48%: the threads keep running, each operation just
> >     stalls longer on memory.
> >   - The cost is the placement itself, not migration or remote
> >     accesses:
> >       a) 32 threads: memory fully converges to the busy node well
> >          before the run ends, and the run is still 46% slower;
> >       b) CAS on with numa_balancing=0: no migrations, pages stay
> >          65/35, and the runtime is unchanged (42.2s);
> >       c) CAS off with the process simply taskset-pinned to one
> >          socket (memory 100% local from first touch, no
> >          migrations): 40.3s, within the CAS-on range (40.6-42.9s).
> >     64 memory-streaming threads on one socket get about two thirds
> >     of the throughput they get spread across both sockets (Mop/s
> >     -34%), wherever the pages live. So the only effective fix is to
> >     not aggregate such a process in the first place.
> > 
> 
> Thanks for your detailed analysis of the regression on NAS MG
> and its root cause. Much appreciated.
> 
> > QUESTIONS
> >   1. Was the sweep-boundary gating of this accounting known or
> >      intended? For a workload with a large address space it means
> >      the footprint sees at most one update per run; for a shorter
> >      one, none at all.
> 
> Not intended. Your reading of the code is right. The footprint is
> only written from task_numa_placement(), and that function returns
> early unless mm->numa_scan_seq has moved, which happens once per full
> sweep of the address space. The cadence is fine for NUMA placement.
> But it may be too long for large footprints. The tests we
> validated against had a small enough RSS that the first sweep finished
> within the first seconds of the run.
> 
> One correction to your point 3. numa_faults counts pages, not fault
> events. A THP hint fault adds HPAGE_PMD_NR (512) pages per fault. Your
> 3.3M migrated pages from 8k-20k faults suggests THP was in use. If so,
> one completed sweep would push the footprint to millions of pages, far
> above the 27.6k pages that equal a 108 MiB LLC. Two things would help
> confirm this:
> 
>   - Was THP enabled for the MG run?
>   - In the third run, did grp->footprint become non-zero after the
>     sweep completed at t=33s?
> 
> If both are yes, then sweep cadence is the problem and the size
> estimate is not.
> 
> >   2. Could the check fail closed when there is no usable estimate
> >      (warm-up, footprint still 0, NUMA balancing off)? RSS is a poor
> >      estimate of the working set, as Peter said, but it is an upper
> >      bound: if RSS fits in the LLC, so does the working set. Using it
> >      only on the permit side - aggregate without a footprint estimate
> >      only if RSS fits - would keep the gains for small processes and
> >      not aggregate the ones we cannot judge. The costs are
> >      asymmetric: a missed aggregation forfeits a gain, a wrong one
> >      cost 65% here.
> 
> I think you have a point. I see two ways to fix this issue,
> and they are complementary.
> 
> Fix 1:
> 
>   - When footprint is 0, or NUMA balancing is off, compare the RSS of
>     the mm against llc_bytes * scale. Aggregate only if RSS fits.
>   - Once a footprint estimate exists, use it as today.
> 
> RSS is not used as the estimate here, only as an upper bound while
> there is no footprint from the sweep. That is consistent with Peter's
> objection in April. It also closes the NUMA-balancing-off gap that
> sched-cache.rst documents.
> 
> The downside: a process with a large RSS but a small hot set will not
> be aggregated until an estimate exists, and with a very large RSS that
> can be the whole run. A process that runs for less than one sweep
> never gets an estimate at all.
>

In the original patch that leverages RSS[1], it uses the per-mm RSS:
get_mm_counter(mm, MM_ANONPAGES) + get_mm_counter(mm, MM_SHMEMPAGES). In,
the future we do not want cache-aware scheduling to be tied to mm_struct,
it will be turned into per-sched_cache_group, and we might need to support
per-sched_cache_group RSS.
 
> Fix 2:
> 
> On the cadence side: accumulate the pages reported by
> task_numa_fault() into the footprint as they arrive within the
> current sweep, instead of waiting for task_numa_placement().

Do you mean accumulate the pages into the group in task_numa_fault()? As we are trying
to convert the footprint into atomic[2], this might increase the overhead since multiple
threads write this counter in parallel. A workaround is to accumulate the pages every N
pages into the group to mitigate the overhead.

> The footprint then grows during the first sweep and the check trips
> quickly for your MG run. At the sweep boundary task_numa_placement()
> only applies the decay of the previous window,

Would this decay cause a jitter of the footprint? Anyway, I thought what you suggested is the
following for fix2(although this version racy with concurrent updates from other threads sharing this
mm). BTW, with this mechanism, I don't think we need to subtract the footprint during
exit() or exec(), because the footprint will decay gradually?

[1] https://lore.kernel.org/all/339bb2636c7306e17540268a9295a8e673b92804.1775065312.git.tim.c.chen@linux.intel.com/
[2] https://lore.kernel.org/all/20261022031933.46869-1-jemmywong512@gmail.com/

thanks,
Chenyu

diff --git a/include/linux/sched.h b/include/linux/sched.h
index e4f6323d7855..c3cda7b51e66 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1444,6 +1444,7 @@ struct task_struct {
 	int				preferred_llc;
 	/* 1: task was enqueued to its preferred LLC, 0 otherwise */
 	int				pref_llc_queued;
+	unsigned long			total_footprint;
 #endif
 
 	struct rseq_data		rseq;
diff --git a/init/init_task.c b/init/init_task.c
index ce7c2b07d855..24bac99dab8a 100644
--- a/init/init_task.c
+++ b/init/init_task.c
@@ -231,6 +231,7 @@ struct task_struct init_task __aligned(L1_CACHE_BYTES) = {
 #ifdef CONFIG_SCHED_CACHE
 	.preferred_llc  = -1,
 	.pref_llc_queued  = 0,
+	.total_footprint = 0;
 #endif
 #if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
 	.kasan_depth	= 1,
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 79f6b3a4fd7f..470ba0dc6719 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1730,19 +1730,6 @@ void sched_cache_exit_mm(struct task_struct *p)
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
 
@@ -2125,6 +2112,7 @@ void init_sched_mm(struct task_struct *p)
 	 */
 	p->preferred_llc = -1;
 	p->pref_llc_queued = 0;
+	p->total_footprint = 0;
 }
 
 #else /* CONFIG_SCHED_CACHE */
@@ -3826,6 +3814,43 @@ static int preferred_group_nid(struct task_struct *p, int nid)
 	return nid;
 }
 
+#ifdef CONFIG_SCHED_CACHE
+
+#define SCHED_CACHE_FP_THRESHOLD 10
+static void sched_cache_footprint_accum(struct task_struct *p, int pages)
+{
+	p->total_footprint += pages;
+
+	if (p->total_footprint < SCHED_CACHE_FP_THRESHOLD)
+		return;
+
+	guard(rcu);
+	grp = rcu_dereference(p->sched_cache_grp);
+
+	if (!grp)
+		return;
+
+	/*drain the per task footprint into group */
+	WRITE_ONCE(grp->footprint, (long)READ_ONCE(grp->footprint) + p->total_footprint);
+	p->total_footprint = 0;
+}
+
+static void sched_cache_footprint_decay(struct task_struct *p)
+{
+	WRITE_ONCE(grp->footprint, (long)READ_ONCE(grp->footprint) / 2);
+}
+
+#else
+static void sched_cache_footprint_accum(struct task_struct *p, int pages)
+{
+}
+
+static void sched_cache_footprint_decay(struct task_struct *p)
+{
+}
+
+#endif
+
 static void task_numa_placement(struct task_struct *p)
 	__context_unsafe(/* conditional locking */)
 {
@@ -3911,36 +3936,6 @@ static void task_numa_placement(struct task_struct *p)
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
@@ -3970,6 +3965,7 @@ static void task_numa_placement(struct task_struct *p)
 	}
 
 	update_task_scan_period(p, fault_types[0], fault_types[1]);
+	sched_cache_footprint_decay(p);
 }
 
 static inline int get_numa_group(struct numa_group *grp)
@@ -4210,6 +4206,7 @@ void task_numa_fault(int last_cpupid, int mem_node, int pages, int flags)
 	p->numa_faults[task_faults_idx(NUMA_MEMBUF, mem_node, priv)] += pages;
 	p->numa_faults[task_faults_idx(NUMA_CPUBUF, cpu_node, priv)] += pages;
 	p->numa_faults_locality[local] += pages;
+	sched_cache_footprint_accum(p, pages);
 }
 
 static void reset_ptenuma_scan(struct task_struct *p)
-- 
2.43.0
> so the steady state
> value is unchanged.
> 
> The downside: for a workload like yours there is still a short window
> where we aggregate before the footprint crosses the LLC size. With
> THP each hint fault adds 512 pages, so the 27.6k pages of a 108 MiB
> LLC are reached after about 54 faults. At the few hundred faults per
> second you measured that is under a second once scanning starts, and
> scanning starts after the 1s scan delay. That is about the 1.8s
> warm-up you saw before grp->cpu settled.
> 
> Fix 2 depends on NUMA balancing. Fix 1 also covers
> your numa_balancing=0 run.
> 
> I lean toward doing both: Fix 2 for the cadence, Fix 1 for NUMA
> balancing off and for the first sweep. Peter, is the RSS bound
> acceptable when it is used only as a gate and never as the estimate?
> 
>
> >   3. Our data supports Peter's point that LLC hit/miss information
> >      would be the better signal: the damage is purely memory-side
> >      (UserTime +59% at flat CPU% in the 112-thread run), and a
> >      memory-streaming process would show a low hit rate regardless
> >      of how well its footprint is estimated. Is anyone looking at
> >      that?
> 
> I am not aware of patches posted along these lines. 
> 
> The two possible routes are RDT (CMT llc_occupancy and MBM bandwidth per RMID)
> and PMU miss counters. RDT needs an RMID per cache group, which
> resctrl owns.  Mixing RMID management with scheduler will be tricky.
> 
> The scheduler does not own the PMU, so the PMU route is
> unlikely to be accepted. Near term the usable signals are the RSS
> bound above and user hints through prctl to enable/disable
> cache aware scheduling or modify tuning knobs per sched group.
> 
> 
> >   4. Chen Yu mentioned that you are reworking the footprint
> >      accounting for the prctl v2 series [2]. Could the detection fix
> >      be part of that rework?
> > 
> 
> The v2 work on footprint is about correctness, not cadence. 
> 
> Fix 2 I mentioned above touches the same footprint code that the 
> v2 series reworks, so the two are not independent. I think we
> would consider whether to add the proposed fixes in the same
> series or leave it as a follow on.
> 
> Would you consider testing the patches when we post them?
> We will CC you.
> 
> Tim
> 
> > [1] <50a8055e38958cdc39e07435aaad56e4719b2bd3.1794507151.git.tim.c.chen@linux.intel.com>
> > [2] <5c912bd3-8701-4395-a118-4ee6e09233e2@intel.com>
> > [3] NAS Parallel Benchmarks: https://www.nas.nasa.gov/software/npb.html
> >     MG is the multigrid kernel: four V-cycles of 27-point stencil
> >     sweeps over a 3D grid hierarchy (finest grid 512^3 for class C,
> >     1024^3 for class D) solving a Poisson equation. Each sweep
> >     streams through a few double-precision arrays - a 3.3 GiB working
> >     set for class C, 26.4 GiB for class D - far beyond any LLC, with
> >     little reuse between sweeps: the kernel is memory-bandwidth-bound
> >     by construction.
> > 
> > The per-run logs, the placement/migration/sweep traces, and the
> > bpftrace scripts behind them are available if useful.
> > 
> > Regards,
> > Jirka Hladky
> > Red Hat
> > 
