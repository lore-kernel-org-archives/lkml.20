Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216532;
	b=GYFZdRr56NVp2yDkWcs4Y+b/mk8Jol4tDvpnOnfz30h3XK2PnfqTwMRUjDE7Atol/rIF
	 ccG+rVc0T0OLR3OwEO6SEOdswvzQWtlRUjfSCFsvKjjA5oUTsCqyM5e+dR3nFQ97ZG0Rx
	 HOVdpLHwnA4qOLWKcVXmmiKoYC3yDaKl6+wA+O0HcQQzTzxeTNlXAHSRWae3SG4YDZgeA
	 Nfv9yUfgRp1ZPdD2E8Mx5MgQtDP85eG/u6/lGQcjv0UhIMVGD/3hcbQH5XpPJ+J9bkOod
	 u0Pa3Qdrg1t7m/jVuAKQQeIU8sNcf9qOwrY64Ngz7WFM/+0dtnAUwdjw08pU9Ee3rDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216532;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=YCWI+3k5wn5SLFosyjmC1HIutbE8Jso4HSSjAIMjCDU=;
	b=vl4z0NYzql9eTAVkPHRiqHK3bziLVaJdCvHGiJFk+PEGyI+EvHrVv0cFlHdZFTzYBZ4z
	 vIogcN3EeeqxiNtYI/BVDmTDnGwO3cfE5tbsyuMvA0FhZL1SMiHbLSDyCPHKW/TNx66NK
	 wbBuHZhZSjyUC4KdsJWuSaGy2Ci+UiKr9j4EsWrsEb9r04Q6ieqfQHO35CdeIZZlLmyA7
	 EUa0DrdDvaVwA8T4VoEbJzLGbAruJ9b6PUhoTN3GQqAxMnRhhSc1sJYben52dGD553F9a
	 GOt7wbEwKPZ9qULgw+tpCmbscBv8Nu3ITTf0m4CkgUA1H0RVylDuLoJcI/3nO2vF/PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="cK/a7rm0";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=rZC9Dklu;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032B2606A32A;
	Mon,  9 Nov 2026 09:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 032B2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=cK/a7rm0;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=rZC9Dklu
Date: Mon, 09 Nov 2026 09:28:47 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794216529;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YCWI+3k5wn5SLFosyjmC1HIutbE8Jso4HSSjAIMjCDU=;
	b=cK/a7rm0CdELKI8gSrTmsFrpkfIgZpa26D9ypHIJqHW1tqjcqMok6lmIiBk0NNn+Sccq6j
	0tqqc7UEMavCyjM8EpeB3sSXivOfj1pMGVvQKZFSZHdUIo9TwdB3ki7RBzO6uwpfnhT3fN
	XHW7kMpm/4C6NEZwcctF8eqDf+dIrpRsEsvT36j+3ZPA6ZkhY115rObtAS1+A7c8PyoG73
	baU6GQ8trA0vlMx3MrG8KdVQ9ubDgVZ1oPpEhqJuCoGu5uMjP/oNuFL9xZXTrDfGKoABUg
	vrkzfpEQ1lAOA8zDPnvp9hCB1OyqcEg8/TPj3nCe8eZEAorCmR02VVxUkTcbKg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794216529;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YCWI+3k5wn5SLFosyjmC1HIutbE8Jso4HSSjAIMjCDU=;
	b=rZC9DklucV7AXORrWaiSPOESDBI1ylGHFTMYcL7bG6FxbbXjtzUltnCUH5l+3PkaoZ1Giu
	64WuoXfyl6fC3WDg==
From: "tip-bot2 for Aaron Tomlin" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched/core: Annotate rq->rd with __rcu and update
 lockless readers
Cc: Aaron Tomlin <atomlin@atomlin.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261030151307.768523-2-atomlin@atomlin.com>
References: <20261030151307.768523-2-atomlin@atomlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179421652748.2093942.18391044874212871939.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     0b528431c3d50389e75b839c4662a3bc4b630c44
Gitweb:        https://git.kernel.org/tip/0b528431c3d50389e75b839c4662a3bc4b6=
30c44
Author:        Aaron Tomlin <atomlin@atomlin.com>
AuthorDate:    Fri, 30 Oct 2026 11:13:02 -04:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 09 Nov 2026 10:18:01 +01:00

sched/core: Annotate rq->rd with __rcu and update lockless readers

The root_domain pointer rd field in struct rq is updated dynamically
using RCU, and its memory reclamation is deferred via call_rcu() in
rq_attach_root(). However, struct rq's rd field was missing the __rcu
compiler annotation, and several lockless readers across the scheduler
subsystem accessed rq->rd directly without using RCU dereference
primitives.

Add the __rcu annotation to struct rq's rd field. For code clarity,
introduce the rcu_dereference_root_domain() helper macro to validate
access under sched_domains_mutex or active RCU-sched read-side critical
sections. While mechanically identical to
rcu_dereference_sched_domain(), defining rcu_dereference_root_domain()
preserves the natural symmetry of rq->rd and rq->sd in struct rq, while
keeping grep-ability straightforward. Update readers and accessors
across kernel/sched/ to use rcu_dereference_root_domain().

This ensures proper memory ordering, enables Sparse static analysis
validation, and avoids false Lockdep warnings under CONFIG_PROVE_RCU.

Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20261030151307.768523-2-atomlin@atomlin.com
---
 kernel/sched/core.c     | 23 +++++++----
 kernel/sched/deadline.c | 82 ++++++++++++++++++++--------------------
 kernel/sched/fair.c     | 27 +++++++------
 kernel/sched/rt.c       | 64 +++++++++++++++++--------------
 kernel/sched/sched.h    |  7 ++-
 kernel/sched/syscalls.c |  4 +-
 kernel/sched/topology.c | 13 +++---
 7 files changed, 124 insertions(+), 96 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 5ed660f..175b52a 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8546,8 +8546,10 @@ void set_rq_online(struct rq *rq)
 {
 	if (!rq->online) {
 		const struct sched_class *class;
+		struct root_domain *rd;
=20
-		cpumask_set_cpu(rq->cpu, rq->rd->online);
+		rd =3D rcu_dereference_root_domain(rq->rd);
+		cpumask_set_cpu(rq->cpu, rd->online);
 		rq->online =3D 1;
=20
 		for_each_class(class) {
@@ -8560,6 +8562,7 @@ void set_rq_online(struct rq *rq)
 void set_rq_offline(struct rq *rq)
 {
 	if (rq->online) {
+		struct root_domain *rd =3D rcu_dereference_root_domain(rq->rd);
 		const struct sched_class *class;
=20
 		update_rq_clock(rq);
@@ -8568,18 +8571,20 @@ void set_rq_offline(struct rq *rq)
 				class->rq_offline(rq);
 		}
=20
-		cpumask_clear_cpu(rq->cpu, rq->rd->online);
+		cpumask_clear_cpu(rq->cpu, rd->online);
 		rq->online =3D 0;
 	}
 }
=20
 static inline void sched_set_rq_online(struct rq *rq, int cpu)
 {
+	struct root_domain *rd;
 	struct rq_flags rf;
=20
 	rq_lock_irqsave(rq, &rf);
-	if (rq->rd) {
-		BUG_ON(!cpumask_test_cpu(cpu, rq->rd->span));
+	rd =3D rcu_dereference_root_domain(rq->rd);
+	if (rd) {
+		BUG_ON(!cpumask_test_cpu(cpu, rd->span));
 		set_rq_online(rq);
 	}
 	rq_unlock_irqrestore(rq, &rf);
@@ -8587,11 +8592,13 @@ static inline void sched_set_rq_online(struct rq *rq,=
 int cpu)
=20
 static inline void sched_set_rq_offline(struct rq *rq, int cpu)
 {
+	struct root_domain *rd;
 	struct rq_flags rf;
=20
 	rq_lock_irqsave(rq, &rf);
-	if (rq->rd) {
-		BUG_ON(!cpumask_test_cpu(cpu, rq->rd->span));
+	rd =3D rcu_dereference_root_domain(rq->rd);
+	if (rd) {
+		BUG_ON(!cpumask_test_cpu(cpu, rd->span));
 		set_rq_offline(rq);
 	}
 	rq_unlock_irqrestore(rq, &rf);
@@ -9013,8 +9020,8 @@ void __init sched_init(void)
 #endif
 		rq->next_class =3D &idle_sched_class;
=20
-		rq->sd =3D NULL;
-		rq->rd =3D NULL;
+		RCU_INIT_POINTER(rq->sd, NULL);
+		RCU_INIT_POINTER(rq->rd, NULL);
 		rq->cpu_capacity =3D SCHED_CAPACITY_SCALE;
 		rq->balance_callback =3D &balance_push_callback;
 		rq->active_balance =3D 0;
diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 35345ae..61b6a6d 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -120,17 +120,12 @@ static inline u8 dl_get_type(struct sched_dl_entity *dl=
_se, struct rq *rq)
=20
 static inline struct dl_bw *dl_bw_of(int i)
 {
-	RCU_LOCKDEP_WARN(!rcu_read_lock_sched_held(),
-			 "sched RCU must be held");
-	return &cpu_rq(i)->rd->dl_bw;
+	return &rcu_dereference_root_domain(cpu_rq(i)->rd)->dl_bw;
 }
=20
 static inline int dl_bw_cpus(int i)
 {
-	struct root_domain *rd =3D cpu_rq(i)->rd;
-
-	RCU_LOCKDEP_WARN(!rcu_read_lock_sched_held(),
-			 "sched RCU must be held");
+	struct root_domain *rd =3D rcu_dereference_root_domain(cpu_rq(i)->rd);
=20
 	return cpumask_weight_and(rd->span, cpu_active_mask);
 }
@@ -156,16 +151,13 @@ static inline unsigned long dl_bw_capacity(int i)
 	    arch_scale_cpu_capacity(i) =3D=3D SCHED_CAPACITY_SCALE) {
 		return dl_bw_cpus(i) << SCHED_CAPACITY_SHIFT;
 	} else {
-		RCU_LOCKDEP_WARN(!rcu_read_lock_sched_held(),
-				 "sched RCU must be held");
-
-		return __dl_bw_capacity(cpu_rq(i)->rd->span);
+		return __dl_bw_capacity(rcu_dereference_root_domain(cpu_rq(i)->rd)->span);
 	}
 }
=20
 bool dl_bw_visited(int cpu, u64 cookie)
 {
-	struct root_domain *rd =3D cpu_rq(cpu)->rd;
+	struct root_domain *rd =3D rcu_dereference_root_domain(cpu_rq(cpu)->rd);
=20
 	if (rd->visit_cookie =3D=3D cookie)
 		return true;
@@ -533,15 +525,18 @@ void init_dl_rq(struct dl_rq *dl_rq)
=20
 static inline int dl_overloaded(struct rq *rq)
 {
-	return atomic_read(&rq->rd->dlo_count);
+	return atomic_read(&rcu_dereference_root_domain(rq->rd)->dlo_count);
 }
=20
 static inline void dl_set_overload(struct rq *rq)
 {
+	struct root_domain *rd;
+
 	if (!rq->online)
 		return;
=20
-	cpumask_set_cpu(rq->cpu, rq->rd->dlo_mask);
+	rd =3D rcu_dereference_root_domain(rq->rd);
+	cpumask_set_cpu(rq->cpu, rd->dlo_mask);
 	/*
 	 * Must be visible before the overload count is
 	 * set (as in sched_rt.c).
@@ -549,16 +544,19 @@ static inline void dl_set_overload(struct rq *rq)
 	 * Matched by the barrier in pull_dl_task().
 	 */
 	smp_wmb();
-	atomic_inc(&rq->rd->dlo_count);
+	atomic_inc(&rd->dlo_count);
 }
=20
 static inline void dl_clear_overload(struct rq *rq)
 {
+	struct root_domain *rd;
+
 	if (!rq->online)
 		return;
=20
-	atomic_dec(&rq->rd->dlo_count);
-	cpumask_clear_cpu(rq->cpu, rq->rd->dlo_mask);
+	rd =3D rcu_dereference_root_domain(rq->rd);
+	atomic_dec(&rd->dlo_count);
+	cpumask_clear_cpu(rq->cpu, rd->dlo_mask);
 }
=20
 #define __node_2_pdl(node) \
@@ -699,14 +697,15 @@ static struct rq *dl_task_offline_migration(struct rq *=
rq, struct task_struct *p
 	 * since p is still hanging out in the old (now moved to default) root
 	 * domain.
 	 */
-	dl_b =3D &rq->rd->dl_bw;
+	dl_b =3D &rcu_dereference_root_domain(rq->rd)->dl_bw;
 	raw_spin_lock(&dl_b->lock);
-	__dl_sub(dl_b, p->dl.dl_bw, cpumask_weight(rq->rd->span));
+	__dl_sub(dl_b, p->dl.dl_bw, cpumask_weight(rcu_dereference_root_domain(rq->=
rd)->span));
 	raw_spin_unlock(&dl_b->lock);
=20
-	dl_b =3D &later_rq->rd->dl_bw;
+	dl_b =3D &rcu_dereference_root_domain(later_rq->rd)->dl_bw;
 	raw_spin_lock(&dl_b->lock);
-	__dl_add(dl_b, p->dl.dl_bw, cpumask_weight(later_rq->rd->span));
+	__dl_add(dl_b, p->dl.dl_bw,
+		 cpumask_weight(rcu_dereference_root_domain(later_rq->rd)->span));
 	raw_spin_unlock(&dl_b->lock);
=20
 	set_task_cpu(p, later_rq->cpu);
@@ -2222,9 +2221,10 @@ static void inc_dl_deadline(struct dl_rq *dl_rq, u64 d=
eadline)
 	if (dl_rq->earliest_dl.curr =3D=3D 0 ||
 	    dl_time_before(deadline, dl_rq->earliest_dl.curr)) {
 		if (dl_rq->earliest_dl.curr =3D=3D 0)
-			cpupri_set(&rq->rd->cpupri, rq->cpu, CPUPRI_HIGHER);
+			cpupri_set(&rcu_dereference_root_domain(rq->rd)->cpupri, rq->cpu,
+				   CPUPRI_HIGHER);
 		dl_rq->earliest_dl.curr =3D deadline;
-		cpudl_set(&rq->rd->cpudl, rq->cpu, deadline);
+		cpudl_set(&rcu_dereference_root_domain(rq->rd)->cpudl, rq->cpu, deadline);
 	}
 }
=20
@@ -2239,14 +2239,15 @@ static void dec_dl_deadline(struct dl_rq *dl_rq, u64 =
deadline)
 	if (!dl_rq->dl_nr_running) {
 		dl_rq->earliest_dl.curr =3D 0;
 		dl_rq->earliest_dl.next =3D 0;
-		cpudl_clear(&rq->rd->cpudl, rq->cpu, rq->online);
-		cpupri_set(&rq->rd->cpupri, rq->cpu, rq->rt.highest_prio.curr);
+		cpudl_clear(&rcu_dereference_root_domain(rq->rd)->cpudl, rq->cpu, rq->onli=
ne);
+		cpupri_set(&rcu_dereference_root_domain(rq->rd)->cpupri, rq->cpu,
+			   rq->rt.highest_prio.curr);
 	} else {
 		struct rb_node *leftmost =3D rb_first_cached(&dl_rq->root);
 		struct sched_dl_entity *entry =3D __node_2_dle(leftmost);
=20
 		dl_rq->earliest_dl.curr =3D entry->deadline;
-		cpudl_set(&rq->rd->cpudl, rq->cpu, entry->deadline);
+		cpudl_set(&rcu_dereference_root_domain(rq->rd)->cpudl, rq->cpu, entry->dea=
dline);
 	}
 }
=20
@@ -2686,12 +2687,14 @@ static void migrate_task_rq_dl(struct task_struct *p,=
 int new_cpu __maybe_unused
=20
 static void check_preempt_equal_dl(struct rq *rq, struct task_struct *p)
 {
+	struct root_domain *rd =3D rcu_dereference_root_domain(rq->rd);
+
 	/*
 	 * Current can't be migrated, useless to reschedule,
 	 * let's hope p can move out.
 	 */
 	if (rq->curr->nr_cpus_allowed =3D=3D 1 ||
-	    !cpudl_find(&rq->rd->cpudl, rq->donor, NULL))
+	    !cpudl_find(&rd->cpudl, rq->donor, NULL))
 		return;
=20
 	/*
@@ -2699,7 +2702,7 @@ static void check_preempt_equal_dl(struct rq *rq, struc=
t task_struct *p)
 	 * see if it is pushed or pulled somewhere else.
 	 */
 	if (p->nr_cpus_allowed !=3D 1 &&
-	    cpudl_find(&rq->rd->cpudl, p, NULL))
+	    cpudl_find(&rd->cpudl, p, NULL))
 		return;
=20
 	resched_curr(rq);
@@ -2951,7 +2954,7 @@ static int find_later_rq(struct task_struct *task)
 	 * We have to consider system topology and task affinity
 	 * first, then we can look for a suitable CPU.
 	 */
-	if (!cpudl_find(&task_rq(task)->rd->cpudl, task, later_mask))
+	if (!cpudl_find(&rcu_dereference_root_domain(task_rq(task)->rd)->cpudl, tas=
k, later_mask))
 		return -1;
=20
 	/*
@@ -3235,7 +3238,7 @@ static void pull_dl_task(struct rq *this_rq)
 	 */
 	smp_rmb();
=20
-	for_each_cpu(cpu, this_rq->rd->dlo_mask) {
+	for_each_cpu(cpu, rcu_dereference_root_domain(this_rq->rd)->dlo_mask) {
 		if (this_cpu =3D=3D cpu)
 			continue;
=20
@@ -3358,10 +3361,8 @@ static void set_cpus_allowed_dl(struct task_struct *p,
 bool dl_task_needs_bw_move(struct task_struct *p,
 			   const struct cpumask *new_mask)
 {
-	if (!dl_task(p))
-		return false;
-
-	return !cpumask_intersects(task_rq(p)->rd->span, new_mask);
+	guard(rcu)();
+	return !cpumask_intersects(rcu_dereference_root_domain(task_rq(p)->rd)->spa=
n, new_mask);
 }
=20
 /* Assumes rq->lock is held */
@@ -3371,9 +3372,10 @@ static void rq_online_dl(struct rq *rq)
 		dl_set_overload(rq);
=20
 	if (rq->dl.dl_nr_running > 0)
-		cpudl_set(&rq->rd->cpudl, rq->cpu, rq->dl.earliest_dl.curr);
+		cpudl_set(&rcu_dereference_root_domain(rq->rd)->cpudl, rq->cpu,
+			  rq->dl.earliest_dl.curr);
 	else
-		cpudl_clear(&rq->rd->cpudl, rq->cpu, true);
+		cpudl_clear(&rcu_dereference_root_domain(rq->rd)->cpudl, rq->cpu, true);
 }
=20
 /* Assumes rq->lock is held */
@@ -3382,7 +3384,7 @@ static void rq_offline_dl(struct rq *rq)
 	if (rq->dl.overloaded)
 		dl_clear_overload(rq);
=20
-	cpudl_clear(&rq->rd->cpudl, rq->cpu, false);
+	cpudl_clear(&rcu_dereference_root_domain(rq->rd)->cpudl, rq->cpu, false);
 }
=20
 void __init init_sched_dl_class(void)
@@ -3443,10 +3445,10 @@ void dl_add_task_root_domain(struct task_struct *p)
 	cpu =3D cpumask_first_and(cpu_active_mask, msk);
 	BUG_ON(cpu >=3D nr_cpu_ids);
 	rq =3D cpu_rq(cpu);
-	dl_b =3D &rq->rd->dl_bw;
+	dl_b =3D &rcu_dereference_root_domain(rq->rd)->dl_bw;
=20
 	raw_spin_lock(&dl_b->lock);
-	__dl_add(dl_b, p->dl.dl_bw, cpumask_weight(rq->rd->span));
+	__dl_add(dl_b, p->dl.dl_bw, cpumask_weight(rcu_dereference_root_domain(rq->=
rd)->span));
 	raw_spin_unlock(&dl_b->lock);
 	raw_spin_unlock_irqrestore(&p->pi_lock, rf.flags);
 }
@@ -3507,7 +3509,7 @@ void dl_clear_root_domain(struct root_domain *rd)
=20
 void dl_clear_root_domain_cpu(int cpu)
 {
-	dl_clear_root_domain(cpu_rq(cpu)->rd);
+	dl_clear_root_domain(rcu_dereference_root_domain(cpu_rq(cpu)->rd));
 }
=20
 static void switched_from_dl(struct rq *rq, struct task_struct *p)
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 7f58c7b..395f0b3 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8114,13 +8114,14 @@ static inline void set_rd_overutilized(struct root_do=
main *rd, bool flag)
=20
 static inline void check_update_overutilized_status(struct rq *rq)
 {
+	struct root_domain *rd =3D rcu_dereference_root_domain(rq->rd);
+
 	/*
 	 * overutilized field is used for load balancing decisions only
 	 * if energy aware scheduler is being used
 	 */
-
-	if (!is_rd_overutilized(rq->rd) && cpu_overutilized(rq->cpu))
-		set_rd_overutilized(rq->rd, 1);
+	if (rd && !is_rd_overutilized(rd) && cpu_overutilized(rq->cpu))
+		set_rd_overutilized(rd, 1);
 }
=20
 /* Runqueue only has SCHED_IDLE tasks enqueued */
@@ -9796,7 +9797,7 @@ static int find_energy_efficient_cpu(struct task_struct=
 *p, int prev_cpu)
 	unsigned long prev_delta =3D ULONG_MAX, best_delta =3D ULONG_MAX;
 	unsigned long p_util_min =3D uclamp_is_used() ? uclamp_eff_value(p, UCLAMP_=
MIN) : 0;
 	unsigned long p_util_max =3D uclamp_is_used() ? uclamp_eff_value(p, UCLAMP_=
MAX) : 1024;
-	struct root_domain *rd =3D this_rq()->rd;
+	struct root_domain *rd =3D rcu_dereference_root_domain(this_rq()->rd);
 	int cpu, best_energy_cpu, target =3D -1;
 	int prev_fits =3D -1, best_fits =3D -1;
 	unsigned long best_actual_cap =3D 0;
@@ -10000,7 +10001,7 @@ select_task_rq_fair(struct task_struct *p, int prev_c=
pu, int wake_flags)
 		    cpumask_test_cpu(cpu, p->cpus_ptr))
 			return cpu;
=20
-		if (!is_rd_overutilized(this_rq()->rd)) {
+		if (!is_rd_overutilized(rcu_dereference_root_domain(this_rq()->rd))) {
 			new_cpu =3D find_energy_efficient_cpu(p, prev_cpu);
 			if (new_cpu >=3D 0)
 				return new_cpu;
@@ -13041,13 +13042,15 @@ static inline void update_sd_lb_stats(struct lb_env=
 *env, struct sd_lb_stats *sd
 		env->fbq_type =3D fbq_classify_group(&sds->busiest_stat);
=20
 	if (!env->sd->parent) {
+		struct root_domain *rd =3D rcu_dereference_root_domain(env->dst_rq->rd);
+
 		/* update overload indicator if we are at root domain */
-		set_rd_overloaded(env->dst_rq->rd, sg_overloaded);
+		set_rd_overloaded(rd, sg_overloaded);
=20
 		/* Update over-utilization (tipping point, U >=3D 0) indicator */
-		set_rd_overutilized(env->dst_rq->rd, sg_overutilized);
+		set_rd_overutilized(rd, sg_overutilized);
 	} else if (sg_overutilized) {
-		set_rd_overutilized(env->dst_rq->rd, sg_overutilized);
+		set_rd_overutilized(rcu_dereference_root_domain(env->dst_rq->rd), sg_overu=
tilized);
 	}
=20
 	update_idle_cpu_scan(env, sum_util);
@@ -13293,8 +13296,10 @@ static struct sched_group *sched_balance_find_src_gr=
oup(struct lb_env *env)
 	if (busiest->group_type =3D=3D group_misfit_task)
 		goto force_balance;
=20
-	if (!is_rd_overutilized(env->dst_rq->rd) &&
-	    rcu_dereference_all(env->dst_rq->rd->pd))
+	struct root_domain *rd =3D rcu_dereference_root_domain(env->dst_rq->rd);
+
+	if (rd && !is_rd_overutilized(rd) &&
+	    rcu_dereference_all(rd->pd))
 		goto out_balanced;
=20
 	/* ASYM feature bypasses nice load balance check */
@@ -14946,7 +14951,7 @@ static int sched_balance_newidle(struct rq *this_rq, =
struct rq_flags *rf)
 	if (!sd)
 		goto out;
=20
-	if (!get_rd_overloaded(this_rq->rd) ||
+	if (!get_rd_overloaded(rcu_dereference_root_domain(this_rq->rd)) ||
 	    this_rq->avg_idle < sd->max_newidle_lb_cost) {
=20
 		update_next_balance(sd, &next_balance);
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index adcf5f0..81a71aa 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -338,15 +338,18 @@ static inline bool need_pull_rt_task(struct rq *rq, str=
uct task_struct *prev)
=20
 static inline int rt_overloaded(struct rq *rq)
 {
-	return atomic_read(&rq->rd->rto_count);
+	return atomic_read(&rcu_dereference_root_domain(rq->rd)->rto_count);
 }
=20
 static inline void rt_set_overload(struct rq *rq)
 {
+	struct root_domain *rd;
+
 	if (!rq->online)
 		return;
=20
-	cpumask_set_cpu(rq->cpu, rq->rd->rto_mask);
+	rd =3D rcu_dereference_root_domain(rq->rd);
+	cpumask_set_cpu(rq->cpu, rd->rto_mask);
 	/*
 	 * Make sure the mask is visible before we set
 	 * the overload count. That is checked to determine
@@ -357,17 +360,20 @@ static inline void rt_set_overload(struct rq *rq)
 	 * Matched by the barrier in pull_rt_task().
 	 */
 	smp_wmb();
-	atomic_inc(&rq->rd->rto_count);
+	atomic_inc(&rd->rto_count);
 }
=20
 static inline void rt_clear_overload(struct rq *rq)
 {
+	struct root_domain *rd;
+
 	if (!rq->online)
 		return;
=20
+	rd =3D rcu_dereference_root_domain(rq->rd);
 	/* the order here really doesn't matter */
-	atomic_dec(&rq->rd->rto_count);
-	cpumask_clear_cpu(rq->cpu, rq->rd->rto_mask);
+	atomic_dec(&rd->rto_count);
+	cpumask_clear_cpu(rq->cpu, rd->rto_mask);
 }
=20
 static inline int has_pushable_tasks(struct rq *rq)
@@ -580,7 +586,7 @@ static int rt_se_boosted(struct sched_rt_entity *rt_se)
=20
 static inline const struct cpumask *sched_rt_period_mask(void)
 {
-	return this_rq()->rd->span;
+	return rcu_dereference_root_domain(this_rq()->rd)->span;
 }
=20
 static inline
@@ -608,7 +614,7 @@ bool sched_rt_bandwidth_account(struct rt_rq *rt_rq)
 static void do_balance_runtime(struct rt_rq *rt_rq)
 {
 	struct rt_bandwidth *rt_b =3D sched_rt_bandwidth(rt_rq);
-	struct root_domain *rd =3D rq_of_rt_rq(rt_rq)->rd;
+	struct root_domain *rd =3D rcu_dereference_root_domain(rq_of_rt_rq(rt_rq)->=
rd);
 	int i, weight;
 	u64 rt_period;
=20
@@ -659,7 +665,7 @@ next:
  */
 static void __disable_runtime(struct rq *rq)
 {
-	struct root_domain *rd =3D rq->rd;
+	struct root_domain *rd =3D rcu_dereference_root_domain(rq->rd);
 	rt_rq_iter_t iter;
 	struct rt_rq *rt_rq;
=20
@@ -1058,7 +1064,7 @@ inc_rt_prio_smp(struct rt_rq *rt_rq, int prio, int prev=
_prio)
 		return;
=20
 	if (rq->online && prio < prev_prio)
-		cpupri_set(&rq->rd->cpupri, rq->cpu, prio);
+		cpupri_set(&rcu_dereference_root_domain(rq->rd)->cpupri, rq->cpu, prio);
 }
=20
 static void
@@ -1073,7 +1079,8 @@ dec_rt_prio_smp(struct rt_rq *rt_rq, int prio, int prev=
_prio)
 		return;
=20
 	if (rq->online && rt_rq->highest_prio.curr !=3D prev_prio)
-		cpupri_set(&rq->rd->cpupri, rq->cpu, rt_rq->highest_prio.curr);
+		cpupri_set(&rcu_dereference_root_domain(rq->rd)->cpupri, rq->cpu,
+			   rt_rq->highest_prio.curr);
 }
=20
 static void
@@ -1575,8 +1582,10 @@ out:
=20
 static void check_preempt_equal_prio(struct rq *rq, struct task_struct *p)
 {
+	struct root_domain *rd =3D rcu_dereference_root_domain(rq->rd);
+
 	if (rq->curr->nr_cpus_allowed =3D=3D 1 ||
-	    !cpupri_find(&rq->rd->cpupri, rq->donor, NULL))
+	    !cpupri_find(&rd->cpupri, rq->donor, NULL))
 		return;
=20
 	/*
@@ -1584,7 +1593,7 @@ static void check_preempt_equal_prio(struct rq *rq, str=
uct task_struct *p)
 	 * see if it is pushed or pulled somewhere else.
 	 */
 	if (p->nr_cpus_allowed !=3D 1 &&
-	    cpupri_find(&rq->rd->cpupri, p, NULL))
+	    cpupri_find(&rd->cpupri, p, NULL))
 		return;
=20
 	/*
@@ -1796,12 +1805,12 @@ static int find_lowest_rq(struct task_struct *task)
 	 */
 	if (sched_asym_cpucap_active()) {
=20
-		ret =3D cpupri_find_fitness(&task_rq(task)->rd->cpupri,
+		ret =3D cpupri_find_fitness(&rcu_dereference_root_domain(task_rq(task)->rd=
)->cpupri,
 					  task, lowest_mask,
 					  rt_task_fits_capacity);
 	} else {
=20
-		ret =3D cpupri_find(&task_rq(task)->rd->cpupri,
+		ret =3D cpupri_find(&rcu_dereference_root_domain(task_rq(task)->rd)->cpupr=
i,
 				  task, lowest_mask);
 	}
=20
@@ -2192,16 +2201,17 @@ static inline void rto_start_unlock(atomic_t *v)
=20
 static void tell_cpu_to_push(struct rq *rq)
 {
+	struct root_domain *rd =3D rcu_dereference_root_domain(rq->rd);
 	int cpu =3D -1;
=20
 	/* Keep the loop going if the IPI is currently active */
-	atomic_inc(&rq->rd->rto_loop_next);
+	atomic_inc(&rd->rto_loop_next);
=20
 	/* Only one CPU can initiate a loop at a time */
-	if (!rto_start_trylock(&rq->rd->rto_loop_start))
+	if (!rto_start_trylock(&rd->rto_loop_start))
 		return;
=20
-	raw_spin_lock(&rq->rd->rto_lock);
+	raw_spin_lock(&rd->rto_lock);
=20
 	/*
 	 * The rto_cpu is updated under the lock, if it has a valid CPU
@@ -2209,17 +2219,17 @@ static void tell_cpu_to_push(struct rq *rq)
 	 * update to loop_next, and nothing needs to be done here.
 	 * Otherwise it is finishing up and an IPI needs to be sent.
 	 */
-	if (rq->rd->rto_cpu < 0)
-		cpu =3D rto_next_cpu(rq->rd);
+	if (rd->rto_cpu < 0)
+		cpu =3D rto_next_cpu(rd);
=20
-	raw_spin_unlock(&rq->rd->rto_lock);
+	raw_spin_unlock(&rd->rto_lock);
=20
-	rto_start_unlock(&rq->rd->rto_loop_start);
+	rto_start_unlock(&rd->rto_loop_start);
=20
 	if (cpu >=3D 0) {
 		/* Make sure the rd does not get freed while pushing */
-		sched_get_rd(rq->rd);
-		irq_work_queue_on(&rq->rd->rto_push_work, cpu);
+		sched_get_rd(rd);
+		irq_work_queue_on(&rd->rto_push_work, cpu);
 	}
 }
=20
@@ -2280,7 +2290,7 @@ static void pull_rt_task(struct rq *this_rq)
=20
 	/* If we are the only overloaded CPU do nothing */
 	if (rt_overload_count =3D=3D 1 &&
-	    cpumask_test_cpu(this_rq->cpu, this_rq->rd->rto_mask))
+	    cpumask_test_cpu(this_rq->cpu, rcu_dereference_root_domain(this_rq->rd)=
->rto_mask))
 		return;
=20
 #ifdef HAVE_RT_PUSH_IPI
@@ -2290,7 +2300,7 @@ static void pull_rt_task(struct rq *this_rq)
 	}
 #endif
=20
-	for_each_cpu(cpu, this_rq->rd->rto_mask) {
+	for_each_cpu(cpu, rcu_dereference_root_domain(this_rq->rd)->rto_mask) {
 		if (this_cpu =3D=3D cpu)
 			continue;
=20
@@ -2395,7 +2405,7 @@ static void rq_online_rt(struct rq *rq)
=20
 	__enable_runtime(rq);
=20
-	cpupri_set(&rq->rd->cpupri, rq->cpu, rq->rt.highest_prio.curr);
+	cpupri_set(&rcu_dereference_root_domain(rq->rd)->cpupri, rq->cpu, rq->rt.hi=
ghest_prio.curr);
 }
=20
 /* Assumes rq->lock is held */
@@ -2406,7 +2416,7 @@ static void rq_offline_rt(struct rq *rq)
=20
 	__disable_runtime(rq);
=20
-	cpupri_set(&rq->rd->cpupri, rq->cpu, CPUPRI_INVALID);
+	cpupri_set(&rcu_dereference_root_domain(rq->rd)->cpupri, rq->cpu, CPUPRI_IN=
VALID);
 }
=20
 /*
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index c8ddf1d..d5e1933 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1296,7 +1296,7 @@ struct rq {
 	int membarrier_state;
 #endif
=20
-	struct root_domain		*rd;
+	struct root_domain __rcu	*rd;
 	struct sched_domain __rcu	*sd;
=20
 	struct balance_callback *balance_callback;
@@ -2206,6 +2206,9 @@ queue_balance_callback(struct rq *rq,
 	rq->balance_callback =3D head;
 }
=20
+#define rcu_dereference_root_domain(p) \
+	rcu_dereference_all_check((p), lockdep_is_held(&sched_domains_mutex))
+
 #define rcu_dereference_sched_domain(p) \
 	rcu_dereference_all_check((p), lockdep_is_held(&sched_domains_mutex))
=20
@@ -3122,7 +3125,7 @@ static inline void add_nr_running(struct rq *rq, unsign=
ed count)
 	}
=20
 	if (prev_nr < 2 && rq->nr_running >=3D 2)
-		set_rd_overloaded(rq->rd, 1);
+		set_rd_overloaded(rcu_dereference_root_domain(rq->rd), 1);
=20
 	sched_update_tick_dependency(rq);
 }
diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
index 0ec401a..4e193a7 100644
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -621,7 +621,7 @@ change:
 #endif /* CONFIG_RT_GROUP_SCHED */
 		if (dl_bandwidth_enabled() && dl_policy(policy) &&
 				!(attr->sched_flags & SCHED_FLAG_SUGOV)) {
-			cpumask_t *span =3D rq->rd->span;
+			struct root_domain *rd =3D rcu_dereference_root_domain(rq->rd);
=20
 			/*
 			 * Don't allow tasks with an affinity mask smaller than
@@ -1131,7 +1131,7 @@ int dl_task_check_affinity(struct task_struct *p, const=
 struct cpumask *mask)
 	 * root_domain.
 	 */
 	guard(rcu)();
-	if (!cpumask_subset(task_rq(p)->rd->span, mask))
+	if (!cpumask_subset(rcu_dereference_root_domain(task_rq(p)->rd)->span, mask=
))
 		return -EBUSY;
=20
 	return 0;
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 9d3a1b8..99878da 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -427,7 +427,7 @@ static bool build_perf_domains(const struct cpumask *cpu_=
map)
 	int i;
 	struct perf_domain *pd =3D NULL, *tmp;
 	int cpu =3D cpumask_first(cpu_map);
-	struct root_domain *rd =3D cpu_rq(cpu)->rd;
+	struct root_domain *rd =3D rcu_dereference_root_domain(cpu_rq(cpu)->rd);
=20
 	if (!sysctl_sched_energy_aware)
 		goto free;
@@ -492,9 +492,8 @@ void rq_attach_root(struct rq *rq, struct root_domain *rd)
=20
 	rq_lock_irqsave(rq, &rf);
=20
-	if (rq->rd) {
-		old_rd =3D rq->rd;
-
+	old_rd =3D rcu_dereference_root_domain(rq->rd);
+	if (old_rd) {
 		if (cpumask_test_cpu(rq->cpu, old_rd->online))
 			set_rq_offline(rq);
=20
@@ -510,7 +509,7 @@ void rq_attach_root(struct rq *rq, struct root_domain *rd)
 	}
=20
 	atomic_inc(&rd->refcount);
-	rq->rd =3D rd;
+	rcu_assign_pointer(rq->rd, rd);
=20
 	cpumask_set_cpu(rq->cpu, rd->span);
 	if (cpumask_test_cpu(rq->cpu, cpu_active_mask))
@@ -3495,8 +3494,10 @@ match2:
 	/* Build perf domains: */
 	for (i =3D 0; i < ndoms_new; i++) {
 		for (j =3D 0; j < n && !sched_energy_update; j++) {
+			int cpu =3D cpumask_first(doms_cur[j]);
+
 			if (cpumask_equal(doms_new[i], doms_cur[j]) &&
-			    cpu_rq(cpumask_first(doms_cur[j]))->rd->pd) {
+			    rcu_dereference_root_domain(cpu_rq(cpu)->rd)->pd) {
 				has_eas =3D true;
 				goto match3;
 			}
