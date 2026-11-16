Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870965;
	b=0vxsAR4gP2G9oenrF17YslGZr4TKw2vnRZ48DD1iQotz8ncIWJ3/mJ3luVerAzf2CjmT
	 dDNmJbgeqs507x/cAA9xePvFfHsrX7ok0M7OGQt0d6UVXXUIU4nox5NGAF449uVgvw/Jz
	 ZnZnb3qpPYIO3Jnfmo4pXbFz7ox49WwfWF/RLThtstK7hc+EHQVhma2QJnQXVIdlrwaDe
	 jCcyc08lmySP+Gx6pnfnUCgMaSOA+c/GayboEK93MHiXpL2gb+/8BJAM5gbg0uJ465axF
	 5q5xY493hIyvgT6ln1xrQKaeRPFOklMzYNa1eZvLLBL/4xmgQ2cUB8RK1k1smoNkUAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870965;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=A0vTYAJ4I4uVzvJZq9EKufP5Zv6XUc+PvY0HasQ0/NU=;
	b=ZeKk7p9hPO97aKJnP6zEM41osyWk1Tpn38W12zkDjFiEhBSFbG4RIAFCCISjSe1e93p1
	 61ge112q23xFnVkrZNtFAKSWDlP2ZyPEnWuv9WN/gMiVyEix+pW6F6Y5PMOQVwCiL4U1+
	 uANID0WFKGscFBTcjDp/U5SJXgVl2FlBzlZvDBw9MrOp72yOxt/ywF8xZwIhPLpsxKL7+
	 Tw7ORNqV0lksFoB0qCtmD8Nz1bM/Ql4TQPv5tiRqVsAhsJX5AICR8aj0R3NxNq9GLw1wu
	 oWU0h2TTeMaNMJQHNNg/CWN/NRUmOrb6cwaufrrZgy1yejojPF2UEWO5tFSf8upJsHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OgAxe8yD;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FE4606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:16:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30FE4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OgAxe8yD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794870964; x=1826406964;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=5ZzoHK/gWk6Dq0AUhrjQjMZ0iIBu2fM2pFReaAN/vls=;
  b=OgAxe8yDSafqpDKu65nxzyasVTKB2HDqoBGo1mrRkLW8LjXWb7yFmqyq
   BZdCBk9fEVlSoyiWdL7zgY767qtlQXxziJws2aaNOSoN4ann+mLmyiJ74
   UchJjxTkeiqDhi/NgIPGIUjjuhsVpFgg4FdrEWLPhcCWjL5s9EewYdbau
   XHwXZRmdD78wQUWg3UgMu05YBeswbGygIFamWr2DeSGCRGYrVuzVxV69s
   N5vj9YBQnHtAgyX3cWRos/Zwk3mTzK3ATbQocYu9AwafH86fVXUmtGvEd
   egNRftkegaZ6wAJWjDoYp7RNJCLIvyHWktKrs6nEqXEp5U47D09LipxpL
   A==;
X-CSE-ConnectionGUID: 6ufXM635TmCVRsWEGOo1NA==
X-CSE-MsgGUID: VwAleC6CQj+mesdHGVhstQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3516693"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3516693"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 15:16:03 -0800
X-CSE-ConnectionGUID: d78c739ZQV2X6YSOMRn0pg==
X-CSE-MsgGUID: zJ6zdSnnS2CTbFlnnUQ4Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9566020"
Received: from unknown (HELO [10.241.242.209]) ([10.241.242.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 15:16:02 -0800
Message-ID: <879c23213859f24b12a23530d6ae849bbe504b6b.camel@linux.intel.com>
Subject: Re: [Patch v4 17/22] sched/cache: Avoid cache-aware scheduling for
 memory-heavy processes
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Jirka Hladky <jhladky@redhat.com>, Chen Yu <chen.yu@linux.dev>
Cc: Peter Zijlstra <peterz@infradead.org>, "Chen, Yu C"
 <yu.c.chen@intel.com>,  Ingo Molnar <mingo@redhat.com>, K Prateek Nayak
 <kprateek.nayak@amd.com>, "Gautham R . Shenoy"	 <gautham.shenoy@amd.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Juri Lelli
 <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt	 <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel
 Gorman	 <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, Madadi
 Vineeth Reddy <vineethr@linux.ibm.com>, Hillf Danton <hdanton@sina.com>,
 Shrikanth Hegde	 <sshegde@linux.ibm.com>, Jianyong Wu
 <jianyong.wu@outlook.com>, Yangyu Chen	 <cyy@cyyself.name>, Tingyin Duan
 <tingyin.duan@gmail.com>, Vern Hao	 <vernhao@tencent.com>, Vern Hao
 <haoxing990@gmail.com>, Len Brown	 <len.brown@intel.com>, Aubrey Li
 <aubrey.li@intel.com>, Zhao Liu	 <zhao1.liu@intel.com>, Chen Yu
 <yu.chen.surf@gmail.com>, Adam Li	 <adamli@os.amperecomputing.com>, Aaron
 Lu <ziqianlu@bytedance.com>, Tim Chen	 <tim.c.chen@intel.com>, Josh Don
 <joshdon@google.com>, Gavin Guo	 <gavinguo@igalia.com>, Qais Yousef
 <qyousef@layalina.io>, Libo Chen	 <libchen@purestorage.com>,
 linux-kernel@vger.kernel.org, "Luck, Tony"	 <tony.luck@intel.com>, Reinette
 Chatre <reinette.chatre@intel.com>, Philip Auld	 <pauld@redhat.com>, Joe
 Mario <jmario@redhat.com>
Date: Mon, 16 Nov 2026 15:16:01 -0800
In-Reply-To: <CAE4VaGAL5FPGUrG76pzf=9pJTaMWa60pbkLv-ZXCFjr5H2JpDg@mail.gmail.com>
References: <cover.1775065312.git.tim.c.chen@linux.intel.com>
	 <339bb2636c7306e17540268a9295a8e673b92804.1775065312.git.tim.c.chen@linux.intel.com>
	 <20260409124642.GC3126523@noisy.programming.kicks-ass.net>
	 <a2d7e7b2-5a4c-48bc-b567-61e3cbd17786@intel.com>
	 <20260410092057.GG3126523@noisy.programming.kicks-ass.net>
	 <CAE4VaGAZavgRWDf=ukaj_EJvOO52hTpAYKPe1JEtUE3E2q0y0w@mail.gmail.com>
	 <13d982ce42116f876f01a77bae7f02d3800f08fc.camel@linux.intel.com>
	 <avqYbuJPHo4zLDOd@three-body>
	 <CAE4VaGAL5FPGUrG76pzf=9pJTaMWa60pbkLv-ZXCFjr5H2JpDg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, 2026-11-16 at 15:35 +0100, Jirka Hladky wrote:

Hi Jirka,

Thanks for testing Chen Yu's sketch patch so quickly.


> Hi Chen Yu, Tim,
>=20
> > Do you mean accumulate the pages into the group in task_numa_fault()?
> > ...
> > Would this decay cause a jitter of the footprint? Anyway, I thought
> > what you suggested is the following for fix2 ...
>=20
> I built and tested the sketch on the Sierra Forest box: a kernel built
> from the same 7.4.0-0.rc2.19.eln159 source as my baselines, patched
> with your sketch plus the fixes needed to compile it, and with one
> change: the decay is applied once per group per sweep via a
> last_decay_seq stamp, since decaying per task would halve the group
> footprint once per thread per sweep.
>=20
> The accounting mechanism works exactly as designed:
>=20
> - The footprint accumulates during the sweep and crosses the
>   27,648-page LLC threshold at t=3D4.4 s; the aggregation is withdrawn
>   and stays withdrawn (grp->cpu =3D -1 in 96% of 27,796 samples). To
>   answer the jitter question: with once-per-sweep decay I saw no
>   oscillation in a run whose footprint reached ~3.95M pages.
> - Removing the exit()/exec() subtraction held up fine as well.
>=20
> But the regression is not fixed. NAS MG class D, 1x64 threads, n=3D5,
> median time:
>=20
>     stock rc2.19, CAS off      26.45 s
>     stock rc2.19, CAS on      41.78 s   (+58%)
>     sketch,          CAS off      26.57 s
>     sketch,          CAS on      39.19 s   (+47.5%)
>=20
> The regression drops from +58% to +47.5%: 2.6 s of the 15.3 s gap,
> about one sixth, and the reason is placement hysteresis. The 2.1 s
> window between the aggregation settling
> and the gate tripping has already shaped the run: the threads re-spread
> at only ~1 thread per second (4/60 across the two nodes at t=3D5 s,
> 20/44 at t=3D28 s), and the memory first-touched during the window is
> 59/41 toward the aggregated node, with NUMA balancing then pulling even
> more memory there as the run continues. Withdrawing grp->cpu stops the
> steering but does not undo the placement, the fault statistics, or the
> page layout.

It does seem like the hysteresis is too strong, and takes too long to=20
even out on the MG workload.=20

>=20
> A few observations for the design:
>=20
> 1. Fix 1 (the RSS gate) looks critical for this workload class. MG's
>    RSS crosses the 108 MiB LLC size within ~0.1 s of the allocation
>    phase, so an RSS gate would refuse aggregation almost immediately,
>    before first-touch lays down the skewed layout.
>=20

Yeah, perhaps some form of Fix 1 is needed.  However
fix 1 benefits mostly workload where aggregation is unhelpful.

There is a downside for Fix 1 for processes that actually benefit
from aggregation.

RSS gate is an upper bound on the cache footprint for the default
case where cache group is a process.  It tends to over estimate and
it will take several scan windows to shed its effect and we could miss
aggregation in the mean time.=20

Chen Yu, on your point that a cache group will no longer be one mm
and that we have no per-group RSS: I do not think we need one.
I think mm's RSS serves more as a bound of the footprint when we are
just starting our scan. For a group spanning several processes=C2=A0
we can use the largest member, which still refuses when any one member
cannot fit.  It is just an initial value that will get decayed away.

One more thing about the decay, mostly for Chen Yu. The once-per-group
version halves the whole footprint, including the sweep that just
closed. The NUMA fault statistics do not: per node they compute
mem =3D mem / 2 + membuf, so the new window is added in full and only
the history is halved. With B pages per sweep the two settle at 2B
and B respectively depending on your sample time.

A group whose per sweep footprint sits between
one and two LLC sizes would flip in and out of aggregation at every
sweep with the current form.

I have a small patch on top of Chen Yu's patch to mitigate this issue.
It keeps a count in the scan window and a history count, and combine
the two when sampled to smooth out any jump.

I also generated another test patch on top to test the RSS gate idea.=20

> 2. Fix 2's trip time is bounded below by the scanner, not by the fault
>    count: the 4.4 s crossing decomposes into the 1 s scan delay plus
>    the 2-3 s the scanner needs to reach the large VMAs of a 26.4 GiB
>    address space. Even the theoretical ~1.8 s would arrive after ~60%
>    of the working set is first-touched.
>=20
> 3. One caveat on the withdrawal path, shared by both fixes: whenever
>    the gate trips after aggregation has been in effect, passive
>    withdrawal (clearing grp->cpu) recovers almost nothing on this
>    workload; the tasks re-spread at ~1 per second. An effective
>    withdrawal would need to actively re-spread the tasks or reset
>    their NUMA preferences. With Fix 1 in place this matters less for
>    the regression class I reported, since aggregation is refused
>    before it settles; it applies to workloads that grow past the LLC
>    mid-run.

This is a good find and I think it deserves its own thread. One
suspect: while the threads were aggregated, NUMA balancing moved
their pages to that node, so numa_preferred_nid points there. After
grp->cpu is cleared the load balancer can move a thread out, but
numa_migrate_preferred() pulls it back toward its pages. On a system
where the LLC is the node, the two mechanisms reinforce each other.

Wonder if NUMA balancing is preventing the re-spread?
If your traces have numa_preferred_nid and task_numa_migrate activity
after the trip, that would confirm or rule it out.


>=20
> Happy to re-test when the next revision is posted. The exact version I
> tested, on top of your sketch with the changes above, is below. The diff
> is against v7.4-rc2; the hunks are in code my downstream patchset does
> not touch, so it should apply to your tree as well.
>=20
> Thanks,
> Jirka
>=20

Two patches on top of Chen Yu's sketch patch below.  Thanks.

Tim

--->8----
From: Tim Chen <tim.c.chen@linux.intel.com>
Subject: [PATCH 1/2] sched/cache: Keep the footprint flat across sweep
 boundaries

diff --git a/include/linux/sched.h b/include/linux/sched.h
index cf2d9dac959f..f528be926ab0 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2392,7 +2392,15 @@ struct sched_cache_group {
 	unsigned long epoch;
 	u64 nr_running_avg;
 	unsigned long next_scan;
+	/*
+	 * Footprint estimate in pages. footprint is the decayed history of
+	 * the completed scan sweeps, written by one task per sweep.
+	 * footprint_cur collects the hint faults of the current sweep from
+	 * all tasks. The estimate is max(footprint, footprint / 2 +
+	 * footprint_cur), see sched_cache_footprint_decay().
+	 */
 	unsigned long footprint;
+	atomic_long_t footprint_cur;
 	unsigned long last_decay_seq;
 	int cpu;
 	refcount_t refcnt;
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 44b016cd999e..0e0e8f6fd011 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1424,7 +1424,7 @@ static inline int get_sched_cache_scale(int mul)
 static bool exceed_llc_capacity(struct sched_cache_group *grp, int cpu)
 {
 #ifdef CONFIG_NUMA_BALANCING
-	unsigned long llc, footprint;
+	unsigned long llc, footprint, hist, cur;
 	struct sched_domain *sd;
 	int scale;
=20
@@ -1440,7 +1440,14 @@ static bool exceed_llc_capacity(struct sched_cache_g=
roup *grp, int cpu)
 		 * excluded.
 		 */
 		llc =3D sd->llc_bytes;
-		footprint =3D READ_ONCE(grp->footprint);
+		/*
+		 * The history, or what it becomes at the next sweep
+		 * boundary if no more faults arrive, whichever is larger.
+		 * See sched_cache_footprint_decay().
+		 */
+		hist =3D READ_ONCE(grp->footprint);
+		cur =3D atomic_long_read(&grp->footprint_cur);
+		footprint =3D max(hist, hist / 2 + cur);
=20
 		/*
 		 * Scale the LLC size by 256*llc_aggr_tolerance
@@ -1621,6 +1628,7 @@ int mm_init_sched(struct mm_struct *mm,
 	grp->next_scan =3D jiffies;
 	grp->nr_running_avg =3D 0;
 	grp->footprint =3D 0;
+	atomic_long_set(&grp->footprint_cur, 0);
 	grp->last_decay_seq =3D 0;
 	refcount_set(&grp->refcnt, 1);
 	/*
@@ -3817,42 +3825,58 @@ static int preferred_group_nid(struct task_struct *=
p, int nid)
=20
 #if defined(CONFIG_SCHED_CACHE) && defined(CONFIG_NUMA_BALANCING)
 /*
- * Fix 2 (Chen Yu sketch, test build): accumulate the pages reported by
- * task_numa_fault() into the group footprint as they arrive within the
- * current sweep, instead of waiting for task_numa_placement() at the swee=
p
- * boundary. Batched per task to limit writes to the shared counter.
+ * Accumulate the pages reported by task_numa_fault() into the footprint o=
f
+ * the current sweep as they arrive, instead of waiting for
+ * task_numa_placement() at the sweep boundary. A sweep of a large address
+ * space can take longer than the workload runs.
+ *
+ * The pages are batched per task before they are added to the shared
+ * counter. One THP hint fault reports HPAGE_PMD_NR pages, so the batch is
+ * one THP, or 512 base pages. task_numa_placement() flushes the batch
+ * once per sweep, so pages below the threshold are missing from the
+ * window for at most the sweep in progress.
  */
-#define SCHED_CACHE_FP_THRESHOLD 10
-static void sched_cache_footprint_accum(struct task_struct *p, int pages)
+#define SCHED_CACHE_FP_THRESHOLD 512
+static void sched_cache_footprint_flush(struct task_struct *p)
 {
 	struct sched_cache_group *grp;
=20
-	p->total_footprint +=3D pages;
-
-	if (p->total_footprint < SCHED_CACHE_FP_THRESHOLD)
+	if (!p->total_footprint)
 		return;
=20
 	guard(rcu)();
 	grp =3D rcu_dereference(p->sched_cache_grp);
-	if (!grp)
-		return;
-
-	/* drain the per-task footprint into the group */
-	WRITE_ONCE(grp->footprint, READ_ONCE(grp->footprint) + p->total_footprint=
);
+	if (grp)
+		atomic_long_add(p->total_footprint, &grp->footprint_cur);
 	p->total_footprint =3D 0;
 }
=20
+static void sched_cache_footprint_accum(struct task_struct *p, int pages)
+{
+	p->total_footprint +=3D pages;
+
+	if (p->total_footprint >=3D SCHED_CACHE_FP_THRESHOLD)
+		sched_cache_footprint_flush(p);
+}
+
 /*
- * Decay once per group per sweep: the first task whose placement() observ=
es
- * a new scan sequence halves the accumulated window. (Decaying per task, =
as
- * in the original sketch, would halve the group footprint once per thread
- * per sweep.)
+ * Close the window at the sweep boundary, once per group per sweep: the
+ * first task whose task_numa_placement() observes a new scan sequence
+ * folds the current window into the history.
+ *
+ * Only the history is decayed. The window that just closed is added in
+ * full, like the per node update of the NUMA fault statistics:
+ *
+ *	mem =3D mem / 2 + membuf
+ *
+ * With B pages touched per sweep the history settles at 2B, the value
+ * the fault statistics report.
  */
 static void sched_cache_footprint_decay(struct task_struct *p)
 {
 	struct sched_cache_group *grp;
 	unsigned long seq =3D p->numa_scan_seq;
-	unsigned long old;
+	unsigned long old, cur;
=20
 	guard(rcu)();
 	grp =3D rcu_dereference(p->sched_cache_grp);
@@ -3862,12 +3886,16 @@ static void sched_cache_footprint_decay(struct task=
_struct *p)
 	old =3D READ_ONCE(grp->last_decay_seq);
 	if (old =3D=3D seq)
 		return;
-	if (cmpxchg(&grp->last_decay_seq, old, seq) =3D=3D old)
-		WRITE_ONCE(grp->footprint, READ_ONCE(grp->footprint) / 2);
+	if (cmpxchg(&grp->last_decay_seq, old, seq) !=3D old)
+		return;
+
+	cur =3D atomic_long_xchg(&grp->footprint_cur, 0);
+	WRITE_ONCE(grp->footprint, READ_ONCE(grp->footprint) / 2 + cur);
 }
=20
 #else
 static inline void sched_cache_footprint_accum(struct task_struct *p, int =
pages) { }
+static inline void sched_cache_footprint_flush(struct task_struct *p) { }
 static inline void sched_cache_footprint_decay(struct task_struct *p) { }
 #endif
=20
@@ -3985,6 +4013,12 @@ static void task_numa_placement(struct task_struct *=
p)
 	}
=20
 	update_task_scan_period(p, fault_types[0], fault_types[1]);
+
+	/*
+	 * Once per sweep: add this task's pending pages to the window
+	 * before the window may be closed below.
+	 */
+	sched_cache_footprint_flush(p);
 	sched_cache_footprint_decay(p);
 }
=20
--=20

From: Tim Chen <tim.c.chen@linux.intel.com>
Date: Mon, 16 Nov 2026 14:05:45 -0800
Subject: [PATCH 2/2] sched/cache: Use the RSS as an upper bound while there=
 is
 no footprint

The footprint check of exceed_llc_capacity() needs NUMA balancing hint
faults. Until the first scan sweep of the address space completes there
is no estimate, and without NUMA balancing there never is one. In both
cases the check passes and a process of any size can be aggregated.

Use the RSS of the mm as the footprint while there is no estimate. The
RSS is a poor estimate of the working set, but it is an upper bound: if
the RSS fits in the LLC, so does the working set. If it does not fit,
we cannot tell, and refuse to aggregate.

Not-yet-signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
---
 include/linux/sched.h |  6 +++
 kernel/sched/fair.c   | 95 ++++++++++++++++++++++++++++---------------
 2 files changed, 68 insertions(+), 33 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index f528be926ab0..9924a781c9dc 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2402,6 +2402,12 @@ struct sched_cache_group {
 	unsigned long footprint;
 	atomic_long_t footprint_cur;
 	unsigned long last_decay_seq;
+	/*
+	 * RSS of the mm of the last task that scanned for the group, in
+	 * pages. An upper bound of the working set, used while there is no
+	 * footprint estimate yet. See exceed_llc_capacity().
+	 */
+	unsigned long rss_bound;
 	int cpu;
 	refcount_t refcnt;
 	struct rcu_head rcu;
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 0e0e8f6fd011..ef2af7a0c082 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1423,8 +1423,7 @@ static inline int get_sched_cache_scale(int mul)
=20
 static bool exceed_llc_capacity(struct sched_cache_group *grp, int cpu)
 {
-#ifdef CONFIG_NUMA_BALANCING
-	unsigned long llc, footprint, hist, cur;
+	unsigned long llc, footprint =3D 0;
 	struct sched_domain *sd;
 	int scale;
=20
@@ -1434,46 +1433,67 @@ static bool exceed_llc_capacity(struct sched_cache_=
group *grp, int cpu)
 	if (!sd)
 		return true;
=20
+	/*
+	 * Scale the LLC size by 256*llc_aggr_tolerance
+	 * and compare it to the task's footprint.
+	 *
+	 * Suppose the L3 size is 32MB. If the
+	 * llc_aggr_tolerance is 1:
+	 * When the footprint is larger than 32MB, the
+	 * process is regarded as exceeding the LLC
+	 * capacity. If the llc_aggr_tolerance is 99:
+	 * When the footprint is larger than 784GB, the
+	 * process is regarded as exceeding the LLC
+	 * capacity:
+	 * 784GB =3D (1 + (99 - 1) * 256) * 32MB
+	 * If the llc_aggr_tolerance is 100:
+	 * ignore the footprint and do the aggregation
+	 * anyway.
+	 */
+	scale =3D get_sched_cache_scale(256);
+	if (scale =3D=3D INT_MAX)
+		return false;
+
+	/*
+	 * TBD: RDT exclusive LLC ways reserved should be
+	 * excluded.
+	 */
+	llc =3D sd->llc_bytes;
+
+#ifdef CONFIG_NUMA_BALANCING
 	if (static_branch_likely(&sched_numa_balancing)) {
-		/*
-		 * TBD: RDT exclusive LLC ways reserved should be
-		 * excluded.
-		 */
-		llc =3D sd->llc_bytes;
+		unsigned long hist, cur;
+
 		/*
 		 * The history, or what it becomes at the next sweep
 		 * boundary if no more faults arrive, whichever is larger.
 		 * See sched_cache_footprint_decay().
+		 *
+		 * The history is 0 until the first scan sweep of the
+		 * address space completes. Until then the window alone
+		 * is not an estimate of the working set, only a lower
+		 * bound of it, so fall back to the RSS bound below.
 		 */
 		hist =3D READ_ONCE(grp->footprint);
-		cur =3D atomic_long_read(&grp->footprint_cur);
-		footprint =3D max(hist, hist / 2 + cur);
-
-		/*
-		 * Scale the LLC size by 256*llc_aggr_tolerance
-		 * and compare it to the task's footprint.
-		 *
-		 * Suppose the L3 size is 32MB. If the
-		 * llc_aggr_tolerance is 1:
-		 * When the footprint is larger than 32MB, the
-		 * process is regarded as exceeding the LLC
-		 * capacity. If the llc_aggr_tolerance is 99:
-		 * When the footprint is larger than 784GB, the
-		 * process is regarded as exceeding the LLC
-		 * capacity:
-		 * 784GB =3D (1 + (99 - 1) * 256) * 32MB
-		 * If the llc_aggr_tolerance is 100:
-		 * ignore the footprint and do the aggregation
-		 * anyway.
-		 */
-		scale =3D get_sched_cache_scale(256);
-		if (scale =3D=3D INT_MAX)
-			return false;
-
-		return ((llc * (u64)scale) < (footprint * PAGE_SIZE));
+		if (hist) {
+			cur =3D atomic_long_read(&grp->footprint_cur);
+			footprint =3D max(hist, hist / 2 + cur);
+		}
 	}
 #endif
-	return false;
+	/*
+	 * No footprint estimate: the first sweep has not completed, or
+	 * NUMA balancing is off. Fall back to the RSS of the mm. It is a
+	 * poor estimate of the working set but an upper bound of it: if
+	 * the RSS fits in the LLC, so does the working set. If it does
+	 * not fit, we cannot tell, and refuse to aggregate. A missed
+	 * aggregation forfeits a gain. A wrong one on a memory bandwidth
+	 * bound process costs far more.
+	 */
+	if (!footprint)
+		footprint =3D READ_ONCE(grp->rss_bound);
+
+	return ((llc * (u64)scale) < (footprint * PAGE_SIZE));
 }
=20
 static bool invalid_llc_nr(struct sched_cache_group *grp, struct task_stru=
ct *p,
@@ -1630,6 +1650,7 @@ int mm_init_sched(struct mm_struct *mm,
 	grp->footprint =3D 0;
 	atomic_long_set(&grp->footprint_cur, 0);
 	grp->last_decay_seq =3D 0;
+	grp->rss_bound =3D 0;
 	refcount_set(&grp->refcnt, 1);
 	/*
 	 * The update to grp->pcpu_sched should not be reordered
@@ -2013,6 +2034,14 @@ static void task_cache_work(struct callback_head *wo=
rk)
 				     READ_ONCE(llc_epoch_period), 1)))
 		return;
=20
+	/*
+	 * Sample the RSS of our own mm once per epoch, for the check
+	 * below and for the tick and load balancer paths, which must
+	 * not touch the mm of a task that is not current.
+	 */
+	if (p->mm)
+		WRITE_ONCE(grp->rss_bound, get_mm_rss(p->mm));
+
 	curr_cpu =3D task_cpu(p);
 	if (invalid_llc_nr(grp, p, curr_cpu) ||
 	    exceed_llc_capacity(grp, curr_cpu)) {
--=20
2.53.0




