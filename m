Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5854EF132;
	Tue, 22 Sep 2026 09:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070421; cv=none; b=SBmbOjrpL4OE+oqFCkt8noD92dI9q9HrOPZaie/MS7zy2wUNbtV2GttiNGZ0XRaE63eFCoRV6aaRtXl/4UUFp+sHXCoTUIgVfjo9arrcq7ydUKX9VDOst8yZe5Ml9JFoDqBEIj/88jjorHdDztYgMcdBpf6RGLgE/NE9CgatBEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070421; c=relaxed/simple;
	bh=4ztc6VPicsnFWDtLkvs7DZkbyh8wUYdyfybR6hDSIFc=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=alFf4ukoOCe92NG7JLX3vB4xWhRLjrHO+n4mcpyuTYoRfgJN6DTtHPvvpOA6X+j+wGJmZhHTaL4SN3uny+JEXISlPbAwUwTUZ6+6raola9LHKkrLoQmPO8228sS90bBYv1G2ZZO8OYTmTC+vg3pWUumRh6Eq7TyqchfX2yBOZ0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tsXswcaN; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vsW+Tysp; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tsXswcaN";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vsW+Tysp"
Date: Tue, 22 Sep 2026 09:46:55 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790070417;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qC/glAHdt423IfomEMUX7OvDVzoKv50dDX/3yp9L3y4=;
	b=tsXswcaNotuXKnsW8keUBnfBCNRhYPBC15A+LI5u1XUJyTNPfSf4Hcnf0/C8eYCyW6fm0B
	YQ5XY/siJvTCi9JGx2fiH8NVJ2wcYWPS88320WBBv6fHkcYle7qyAsncwzmCWtknpSJVgq
	UPdFXgNUPmRd3Zm7tsqLe9ev6LL8vZDfXJzs6YR/t5nPMfb3TcXum9wUNvOt4RVVJYrbXs
	LWTJF5aj7l9NsvpTHSOx8y2bHUZqizvo/6TIiWqgw6HkZQGnkm/IlUn8oCi1FA6JyH2Me3
	bt3JzFL0qwi/gjhotuk2gk6f3sHuba/o2vffwmOas3DXS/keUeD3Rph6mkqyxg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790070417;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qC/glAHdt423IfomEMUX7OvDVzoKv50dDX/3yp9L3y4=;
	b=vsW+TyspHJ7ZIN2gK27YM4KjKuhI+Qa1715/GZd1eW0CiGDX32uH59ukDiliPmgDDKl3GE
	MwUOascDNuX1xVCg==
From: "tip-bot2 for Tim Chen" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/urgent] sched/cache: Decouple sched_cache_group from mm
 to fix UAF
Cc: Hyunwoo Kim <imv4bel@gmail.com>,
 "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>, Chen Yu <yu.c.chen@intel.com>,
 Tim Chen <tim.c.chen@linux.intel.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>,  <stable@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: =?utf-8?q?=3C91fd1e3266707c865bc9abecfb3e17bc676712df=2E1790035?=
 =?utf-8?q?273=2Egit=2Etim=2Ec=2Echen=40linux=2Eintel=2Ecom=3E?=
References: =?utf-8?q?=3C91fd1e3266707c865bc9abecfb3e17bc676712df=2E17900352?=
 =?utf-8?q?73=2Egit=2Etim=2Ec=2Echen=40linux=2Eintel=2Ecom=3E?=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179007041535.2819794.10683874459063094183.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     28f9c0e0a0b94c5d3e1b634db545f6e1f94858c5
Gitweb:        https://git.kernel.org/tip/28f9c0e0a0b94c5d3e1b634db545f6e1f94=
858c5
Author:        Tim Chen <tim.c.chen@linux.intel.com>
AuthorDate:    Mon, 21 Sep 2026 17:37:24 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Tue, 22 Sep 2026 10:50:35 +02:00

sched/cache: Decouple sched_cache_group from mm to fix UAF

Currently the sched cache grouping is by mm and the scheduling statistics
sched_cache_stat lives in the mm structure.  This ties the life cycle
of scheduling stats with mm.

In account_mm_sched(), the scheduling stats are accessed by
task->mm->sc_stat.  However, a task may be switching mm on one CPU when
another CPU is running account_mm_sched(), and possibly accessing the
old mm that was freed.  This problem was found when running tests with
KASAN by Hyunwoo:

  https://lore.kernel.org/lkml/apPb-Dr4nPYuHQOK@v4bel/

Instead of serializing the mm access by introducing extra acquisition of
rq lock in the mm free path, extract sched_cache_stat from mm_struct,
rename it as sched_cache_group and manage its life cycle apart from
mm_struct with its own ref counting.  This allows us in the next patch
access sched_cache_group directly from task, and add a refcount
on sched_cache_group when a task links to it. This prevents the use
after free issue when accessing stale and released old mm and its
sched cache stat a task switches to a new mm while account_mm_sched()
is done elsewhere.

The other benefit of this restructure is in the future, the grouping of
tasks to a LLC would have the flexibility to be associated with a user
defined grouping, or cgroup, cookie group, numa_group or others instead
of just with a single mm address space.

Rename sched_cache_stat to sched_cache_group and turn it into a refcounted
object allocated from mm_struct.  The mm_struct now holds a pointer
(sched_cache_grp) to this object instead of embedding it.

Fixes: df0d98475954 ("sched/cache: Introduce infrastructure for cache-aware l=
oad balancing")
Closes: https://lore.kernel.org/lkml/apPb-Dr4nPYuHQOK@v4bel/
Closes: https://lore.kernel.org/all/343a7e07-7fad-4979-9c9b-82ec038c293c@linu=
x.dev/
Reported-by: Hyunwoo Kim <imv4bel@gmail.com>
Reported-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
Co-developed-by: Chen Yu <yu.c.chen@intel.com>
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: <stable@kernel.org> #7.2.x
Link: https://patch.msgid.link/91fd1e3266707c865bc9abecfb3e17bc676712df.17900=
35273.git.tim.c.chen@linux.intel.com
---
 include/linux/mm_types.h |  15 +--
 include/linux/sched.h    |   6 +-
 kernel/exit.c            |  11 +-
 kernel/sched/fair.c      | 173 +++++++++++++++++++++++++++-----------
 4 files changed, 144 insertions(+), 61 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 6d815f6..f3e5a2f 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1226,7 +1226,7 @@ struct mm_struct {
 		struct mm_mm_cid mm_cid;
=20
 		/* sched_cache related statistics */
-		struct sched_cache_stat sc_stat;
+		struct sched_cache_group *sched_cache_grp;
 #ifdef CONFIG_MMU
 		atomic_long_t pgtables_bytes;	/* size of all page tables */
 #endif
@@ -1624,8 +1624,9 @@ static inline unsigned int mm_cid_size(void)
 #endif /* CONFIG_SCHED_MM_CID */
=20
 #ifdef CONFIG_SCHED_CACHE
-void mm_init_sched(struct mm_struct *mm,
-		   struct sched_cache_time __percpu *pcpu_sched);
+int mm_init_sched(struct mm_struct *mm,
+		  struct sched_cache_time __percpu *pcpu_sched);
+void mm_destroy_sched(struct mm_struct *mm);
=20
 static inline int mm_alloc_sched_noprof(struct mm_struct *mm)
 {
@@ -1635,17 +1636,11 @@ static inline int mm_alloc_sched_noprof(struct mm_str=
uct *mm)
 	if (!pcpu_sched)
 		return -ENOMEM;
=20
-	mm_init_sched(mm, pcpu_sched);
-	return 0;
+	return mm_init_sched(mm, pcpu_sched);
 }
=20
 #define mm_alloc_sched(...)	alloc_hooks(mm_alloc_sched_noprof(__VA_ARGS__))
=20
-static inline void mm_destroy_sched(struct mm_struct *mm)
-{
-	free_percpu(mm->sc_stat.pcpu_sched);
-	mm->sc_stat.pcpu_sched =3D NULL;
-}
 #else /* !CONFIG_SCHED_CACHE */
=20
 static inline int mm_alloc_sched(struct mm_struct *mm) { return 0; }
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 705970d..e14ad43 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2405,7 +2405,7 @@ struct sched_cache_time {
 	unsigned long epoch;
 };
=20
-struct sched_cache_stat {
+struct sched_cache_group {
 	struct sched_cache_time __percpu *pcpu_sched;
 	raw_spinlock_t lock;
 	unsigned long epoch;
@@ -2413,11 +2413,13 @@ struct sched_cache_stat {
 	unsigned long next_scan;
 	unsigned long footprint;
 	int cpu;
+	refcount_t refcnt;
+	struct rcu_head rcu;
 } ____cacheline_aligned_in_smp;
=20
 #else
=20
-struct sched_cache_stat { };
+struct sched_cache_group { };
=20
 #endif
=20
diff --git a/kernel/exit.c b/kernel/exit.c
index 424c44a..024350e 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -558,18 +558,23 @@ void mm_update_next_owner(struct mm_struct *mm)
  */
 static void exit_mm_sched_cache(struct mm_struct *mm)
 {
+	struct sched_cache_group *grp;
 	unsigned long fp, sub;
=20
 	if (!current->total_numa_faults)
 		return;
 	/*
 	 * No lock protection due to performance considerations.
-	 * Make sure mm->sc_stat.footprint does not become
+	 * Make sure the group footprint does not become
 	 * negative.
 	 */
-	fp =3D READ_ONCE(mm->sc_stat.footprint);
+	grp =3D READ_ONCE(mm->sched_cache_grp);
+	if (!grp)
+		return;
+
+	fp =3D READ_ONCE(grp->footprint);
 	sub =3D min(fp, current->total_numa_faults);
-	WRITE_ONCE(mm->sc_stat.footprint, fp - sub);
+	WRITE_ONCE(grp->footprint, fp - sub);
 }
 #else
 static inline void exit_mm_sched_cache(struct mm_struct *mm)
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 514bd54..f0a9586 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1492,12 +1492,17 @@ static bool exceed_llc_capacity(struct mm_struct *mm,=
 int cpu)
 		return true;
=20
 	if (static_branch_likely(&sched_numa_balancing)) {
+		struct sched_cache_group *grp =3D READ_ONCE(mm->sched_cache_grp);
+
+		if (!grp)
+			return true;
+
 		/*
 		 * TBD: RDT exclusive LLC ways reserved should be
 		 * excluded.
 		 */
 		llc =3D sd->llc_bytes;
-		footprint =3D READ_ONCE(mm->sc_stat.footprint);
+		footprint =3D READ_ONCE(grp->footprint);
=20
 		/*
 		 * Scale the LLC size by 256*llc_aggr_tolerance
@@ -1529,6 +1534,7 @@ static bool exceed_llc_capacity(struct mm_struct *mm, i=
nt cpu)
 static bool invalid_llc_nr(struct mm_struct *mm, struct task_struct *p,
 			   int cpu)
 {
+	struct sched_cache_group *grp;
 	int scale;
=20
 	if (get_nr_threads(p) <=3D 1)
@@ -1542,7 +1548,11 @@ static bool invalid_llc_nr(struct mm_struct *mm, struc=
t task_struct *p,
 	if (scale =3D=3D INT_MAX)
 		return false;
=20
-	return !fits_capacity((mm->sc_stat.nr_running_avg * cpu_smt_num_threads),
+	grp =3D READ_ONCE(mm->sched_cache_grp);
+	if (!grp)
+		return true;
+
+	return !fits_capacity((READ_ONCE(grp->nr_running_avg) * cpu_smt_num_threads=
),
 			(scale * per_cpu(sd_llc_size, cpu)));
 }
=20
@@ -1648,12 +1658,20 @@ static void account_llc_dequeue(struct rq *rq, struct=
 task_struct *p)
 	}
 }
=20
-void mm_init_sched(struct mm_struct *mm,
-		   struct sched_cache_time __percpu *_pcpu_sched)
+int mm_init_sched(struct mm_struct *mm,
+		  struct sched_cache_time __percpu *_pcpu_sched)
 {
+	struct sched_cache_group *grp;
 	unsigned long epoch =3D 0;
 	int i;
=20
+	grp =3D kzalloc_obj(*grp);
+	if (!grp) {
+		free_percpu(_pcpu_sched);
+		mm->sched_cache_grp =3D NULL;
+		return -ENOMEM;
+	}
+
 	for_each_possible_cpu(i) {
 		struct sched_cache_time *pcpu_sched =3D per_cpu_ptr(_pcpu_sched, i);
 		struct rq *rq =3D cpu_rq(i);
@@ -1664,18 +1682,51 @@ void mm_init_sched(struct mm_struct *mm,
 		epoch =3D rq->cpu_epoch;
 	}
=20
-	raw_spin_lock_init(&mm->sc_stat.lock);
-	mm->sc_stat.epoch =3D epoch;
-	mm->sc_stat.cpu =3D -1;
-	mm->sc_stat.next_scan =3D jiffies;
-	mm->sc_stat.nr_running_avg =3D 0;
-	mm->sc_stat.footprint =3D 0;
+	raw_spin_lock_init(&grp->lock);
+	grp->epoch =3D epoch;
+	grp->cpu =3D -1;
+	grp->next_scan =3D jiffies;
+	grp->nr_running_avg =3D 0;
+	grp->footprint =3D 0;
+	refcount_set(&grp->refcnt, 1);
 	/*
-	 * The update to mm->sc_stat should not be reordered
-	 * before initialization to mm's other fields, in case
+	 * The update to grp->pcpu_sched should not be reordered
+	 * before initialization to grp's other fields, in case
 	 * the readers may get invalid mm_sched_epoch, etc.
 	 */
-	smp_store_release(&mm->sc_stat.pcpu_sched, _pcpu_sched);
+	smp_store_release(&grp->pcpu_sched, _pcpu_sched);
+	/*
+	 * Publish the group last.  Not every reader qualifies it by
+	 * grp->pcpu_sched - can_migrate_llc_task() only checks that the
+	 * pointer is non-NULL before reading grp->footprint and
+	 * grp->nr_running_avg - so a reachable group must already be
+	 * fully initialized.
+	 */
+	smp_store_release(&mm->sched_cache_grp, grp);
+	return 0;
+}
+
+static void sched_cache_group_free_rcu(struct rcu_head *rcu)
+{
+	struct sched_cache_group *grp =3D
+		container_of(rcu, struct sched_cache_group, rcu);
+
+	free_percpu(grp->pcpu_sched);
+	kfree(grp);
+}
+
+static void sched_cache_group_put(struct sched_cache_group *grp)
+{
+	if (!grp || !refcount_dec_and_test(&grp->refcnt))
+		return;
+
+	call_rcu(&grp->rcu, sched_cache_group_free_rcu);
+}
+
+void mm_destroy_sched(struct mm_struct *mm)
+{
+	sched_cache_group_put(mm->sched_cache_grp);
+	mm->sched_cache_grp =3D NULL;
 }
=20
 /* because why would C be fully specified */
@@ -1729,11 +1780,16 @@ static unsigned long fraction_mm_sched(struct rq *rq,
 static int get_pref_llc(struct task_struct *p, struct mm_struct *mm)
 {
 	int mm_sched_llc =3D -1, mm_sched_cpu;
+	struct sched_cache_group *grp;
=20
 	if (!mm)
 		return -1;
=20
-	mm_sched_cpu =3D READ_ONCE(mm->sc_stat.cpu);
+	grp =3D READ_ONCE(mm->sched_cache_grp);
+	if (!grp)
+		return -1;
+
+	mm_sched_cpu =3D READ_ONCE(grp->cpu);
 	if (mm_sched_cpu !=3D -1) {
 		mm_sched_llc =3D llc_id(mm_sched_cpu);
=20
@@ -1764,6 +1820,7 @@ static inline
 void account_mm_sched(struct rq *rq, struct task_struct *p, s64 delta_exec)
 {
 	struct sched_cache_time *pcpu_sched;
+	struct sched_cache_group *grp;
 	struct mm_struct *mm =3D p->mm;
 	int mm_sched_llc =3D -1;
 	unsigned long epoch;
@@ -1777,10 +1834,14 @@ void account_mm_sched(struct rq *rq, struct task_stru=
ct *p, s64 delta_exec)
 	 * init_task, kthreads and user thread created
 	 * by user_mode_thread() don't have mm.
 	 */
-	if (!mm || !mm->sc_stat.pcpu_sched)
+	if (!mm)
+		return;
+
+	grp =3D READ_ONCE(mm->sched_cache_grp);
+	if (!grp || !grp->pcpu_sched)
 		return;
=20
-	pcpu_sched =3D per_cpu_ptr(mm->sc_stat.pcpu_sched, cpu_of(rq));
+	pcpu_sched =3D per_cpu_ptr(grp->pcpu_sched, cpu_of(rq));
=20
 	scoped_guard (raw_spinlock, &rq->cpu_epoch_lock) {
 		__update_mm_sched(rq, pcpu_sched);
@@ -1793,11 +1854,11 @@ void account_mm_sched(struct rq *rq, struct task_stru=
ct *p, s64 delta_exec)
 	 * If this process hasn't hit task_cache_work() for a while invalidate
 	 * its preferred state.
 	 */
-	if ((long)(epoch - READ_ONCE(mm->sc_stat.epoch)) > llc_epoch_affinity_timeo=
ut ||
+	if ((long)(epoch - READ_ONCE(grp->epoch)) > llc_epoch_affinity_timeout ||
 	    invalid_llc_nr(mm, p, cpu_of(rq)) ||
 	    exceed_llc_capacity(mm, cpu_of(rq))) {
-		if (READ_ONCE(mm->sc_stat.cpu) !=3D -1)
-			WRITE_ONCE(mm->sc_stat.cpu, -1);
+		if (READ_ONCE(grp->cpu) !=3D -1)
+			WRITE_ONCE(grp->cpu, -1);
 	}
=20
 	mm_sched_llc =3D get_pref_llc(p, mm);
@@ -1814,30 +1875,35 @@ void account_mm_sched(struct rq *rq, struct task_stru=
ct *p, s64 delta_exec)
 static void task_tick_cache(struct rq *rq, struct task_struct *p)
 {
 	struct callback_head *work =3D &p->cache_work;
+	struct sched_cache_group *grp;
 	struct mm_struct *mm =3D p->mm;
 	unsigned long epoch;
=20
 	if (!sched_cache_enabled())
 		return;
=20
-	if (!mm || p->flags & PF_KTHREAD ||
-	    !mm->sc_stat.pcpu_sched)
+	if (!mm || p->flags & PF_KTHREAD)
+		return;
+
+	grp =3D READ_ONCE(mm->sched_cache_grp);
+	if (!grp || !grp->pcpu_sched)
 		return;
=20
 	epoch =3D rq->cpu_epoch;
 	/* avoid moving backwards */
-	if (time_after_eq(mm->sc_stat.epoch, epoch))
+	if (time_after_eq(grp->epoch, epoch))
 		return;
=20
-	guard(raw_spinlock)(&mm->sc_stat.lock);
+	guard(raw_spinlock)(&grp->lock);
=20
 	if (work->next =3D=3D work) {
 		task_work_add(p, work, TWA_RESUME);
-		WRITE_ONCE(mm->sc_stat.epoch, epoch);
+		WRITE_ONCE(grp->epoch, epoch);
 	}
 }
=20
-static void get_scan_cpumasks(cpumask_var_t cpus, struct task_struct *p)
+static void get_scan_cpumasks(cpumask_var_t cpus, struct task_struct *p,
+			      struct sched_cache_group *grp)
 {
 #ifdef CONFIG_NUMA_BALANCING
 	int cpu, curr_cpu, nid, pref_nid;
@@ -1845,7 +1911,7 @@ static void get_scan_cpumasks(cpumask_var_t cpus, struc=
t task_struct *p)
 	if (!static_branch_likely(&sched_numa_balancing))
 		goto out;
=20
-	cpu =3D READ_ONCE(p->mm->sc_stat.cpu);
+	cpu =3D READ_ONCE(grp->cpu);
 	if (cpu !=3D -1)
 		nid =3D cpu_to_node(cpu);
 	curr_cpu =3D task_cpu(p);
@@ -1906,6 +1972,7 @@ static void task_cache_work(struct callback_head *work)
 	unsigned long next_scan, now =3D jiffies;
 	struct task_struct *p =3D current, *cur;
 	unsigned long curr_m_a_occ =3D 0;
+	struct sched_cache_group *grp;
 	struct mm_struct *mm =3D p->mm;
 	unsigned long m_a_occ =3D 0;
 	cpumask_var_t cpus;
@@ -1917,12 +1984,16 @@ static void task_cache_work(struct callback_head *wor=
k)
 	if (p->flags & PF_EXITING)
 		return;
=20
-	next_scan =3D READ_ONCE(mm->sc_stat.next_scan);
+	grp =3D READ_ONCE(mm->sched_cache_grp);
+	if (!grp)
+		return;
+
+	next_scan =3D READ_ONCE(grp->next_scan);
 	if (time_before(now, next_scan))
 		return;
=20
 	/* only 1 thread is allowed to scan */
-	if (!try_cmpxchg(&mm->sc_stat.next_scan, &next_scan,
+	if (!try_cmpxchg(&grp->next_scan, &next_scan,
 			 now + max_t(unsigned long,
 				     READ_ONCE(llc_epoch_period), 1)))
 		return;
@@ -1930,8 +2001,8 @@ static void task_cache_work(struct callback_head *work)
 	curr_cpu =3D task_cpu(p);
 	if (invalid_llc_nr(mm, p, curr_cpu) ||
 	    exceed_llc_capacity(mm, curr_cpu)) {
-		if (READ_ONCE(mm->sc_stat.cpu) !=3D -1)
-			WRITE_ONCE(mm->sc_stat.cpu, -1);
+		if (READ_ONCE(grp->cpu) !=3D -1)
+			WRITE_ONCE(grp->cpu, -1);
=20
 		return;
 	}
@@ -1942,7 +2013,7 @@ static void task_cache_work(struct callback_head *work)
 	scoped_guard (cpus_read_lock) {
 		guard(rcu)();
=20
-		get_scan_cpumasks(cpus, p);
+		get_scan_cpumasks(cpus, p, grp);
=20
 		for_each_cpu(cpu, cpus) {
 			/* XXX sched_cluster_active */
@@ -1955,7 +2026,7 @@ static void task_cache_work(struct callback_head *work)
=20
 			for_each_cpu(i, sched_domain_span(sd)) {
 				occ =3D fraction_mm_sched(cpu_rq(i),
-							per_cpu_ptr(mm->sc_stat.pcpu_sched, i));
+							per_cpu_ptr(grp->pcpu_sched, i));
 				a_occ +=3D occ;
 				if (occ > m_occ) {
 					m_occ =3D occ;
@@ -1988,7 +2059,7 @@ static void task_cache_work(struct callback_head *work)
 				m_a_cpu =3D m_cpu;
 			}
=20
-			if (llc_id(cpu) =3D=3D llc_id(READ_ONCE(mm->sc_stat.cpu)))
+			if (llc_id(cpu) =3D=3D llc_id(READ_ONCE(grp->cpu)))
 				curr_m_a_occ =3D a_occ;
=20
 			cpumask_andnot(cpus, cpus, sched_domain_span(sd));
@@ -1997,7 +2068,7 @@ static void task_cache_work(struct callback_head *work)
=20
 	if (m_a_occ > (2 * curr_m_a_occ)) {
 		/*
-		 * Avoid switching sc_stat.cpu too fast.
+		 * Avoid switching sched_cache_grp->cpu too fast.
 		 * The reason to choose 2X is because:
 		 * 1. It is better to keep the preferred LLC stable,
 		 *    rather than changing it frequently and cause migrations
@@ -2006,10 +2077,10 @@ static void task_cache_work(struct callback_head *wor=
k)
 		 * 3. 2X is chosen based on test results, as it delivers
 		 *    the optimal performance gain so far.
 		 */
-		WRITE_ONCE(mm->sc_stat.cpu, m_a_cpu);
+		WRITE_ONCE(grp->cpu, m_a_cpu);
 	}
=20
-	update_avg_scale(&mm->sc_stat.nr_running_avg, nr_running);
+	update_avg_scale(&grp->nr_running_avg, nr_running);
 	free_cpumask_var(cpus);
 }
=20
@@ -3726,6 +3797,7 @@ static int preferred_group_nid(struct task_struct *p, i=
nt nid)
 static void task_numa_placement(struct task_struct *p)
 	__context_unsafe(/* conditional locking */)
 {
+	struct sched_cache_group __maybe_unused *grp;
 	int seq, nid, max_nid =3D NUMA_NO_NODE;
 	unsigned long max_faults =3D 0;
 	unsigned long fault_types[2] =3D { 0, 0 };
@@ -3818,19 +3890,23 @@ static void task_numa_placement(struct task_struct *p)
 			 * heuristic and occasional lost updates are tolerable.
 			 *
 			 * If a task exits, its corresponding footprint must
-			 * be subtracted from the mm->sc_stat.footprint, otherwise
-			 * the mm->sc_stat.footprint will not converge:
-			 * the exiting thread's footprint remains unchanged/undecayed
-			 * in mm->sc_stat.footprint. See exit_mm().
+			 * be subtracted from the mm->sched_cache_grp->footprint,
+			 * otherwise the mm->sched_cache_grp->footprint will not
+			 * converge: the exiting thread's footprint remains
+			 * unchanged/undecayed in mm->sched_cache_grp->footprint.
+			 * See exit_mm().
 			 *
 			 * Lost updates and unsynchronized subtraction
 			 * in exit_mm() can cause footprint + diff to
 			 * go negative. Clamp to zero to prevent the
 			 * unsigned footprint from wrapping.
 			 */
-			new_fp =3D (long)READ_ONCE(p->mm->sc_stat.footprint) + diff;
-			WRITE_ONCE(p->mm->sc_stat.footprint,
-				   max(new_fp, 0L));
+			grp =3D READ_ONCE(p->mm->sched_cache_grp);
+			if (!grp)
+				continue;
+
+			new_fp =3D (long)READ_ONCE(grp->footprint) + diff;
+			WRITE_ONCE(grp->footprint, max(new_fp, 0L));
 #endif
 		}
=20
@@ -10778,6 +10854,7 @@ static inline bool task_misfits_asym_cpu(struct lb_en=
v *env, struct task_struct=20
 static enum llc_mig can_migrate_llc_task(struct lb_env *env,
 					 struct task_struct *p)
 {
+	struct sched_cache_group *grp;
 	struct mm_struct *mm;
 	bool to_pref;
 	int cpu, src_cpu, dst_cpu;
@@ -10791,15 +10868,19 @@ static enum llc_mig can_migrate_llc_task(struct lb_=
env *env,
 	if (!mm)
 		return mig_unrestricted;
=20
-	cpu =3D READ_ONCE(mm->sc_stat.cpu);
+	grp =3D READ_ONCE(mm->sched_cache_grp);
+	if (!grp)
+		return mig_unrestricted;
+
+	cpu =3D READ_ONCE(grp->cpu);
 	if (cpu < 0 || cpus_share_cache(src_cpu, dst_cpu))
 		return mig_unrestricted;
=20
 	/* skip cache aware load balance for too many threads */
 	if (invalid_llc_nr(mm, p, dst_cpu) ||
 	    exceed_llc_capacity(mm, dst_cpu)) {
-		if (READ_ONCE(mm->sc_stat.cpu) !=3D -1)
-			WRITE_ONCE(mm->sc_stat.cpu, -1);
+		if (READ_ONCE(grp->cpu) !=3D -1)
+			WRITE_ONCE(grp->cpu, -1);
 		return mig_unrestricted;
 	}
=20
