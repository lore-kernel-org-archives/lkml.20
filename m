Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFDD4EF145;
	Tue, 22 Sep 2026 09:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070423; cv=none; b=OMqg6+X3gtCRKLKTJjjDVhJfUYiSFdsU2PFIwTRuHCpz5X5xjwEHIOK1/EmYdW758ulDu9RgHyRZ4A6mjrLYj503ISdxXQtJ7Q8MwFtRl8p/O44tyKWBxy/qb+WOwfwvw8OhCw2D+qL3/68uAWEUpLqZW0zalRqymPml6Mrfvl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070423; c=relaxed/simple;
	bh=rl4wJDrutRS7gyCTRuqJf4rPhisViw9Pv/4Y6uqMv4Q=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=orBaHb4Is1ONpGXnGYeD03z7I4wdqf3+pwc/cnFkm/zyPG3or1oz+cGzd/sUJi7YPacz8PImxvJoqL2D1TRzm+Lqh6daQFtiJpYZDQWOAhhua14OpyWV80houzA3KOA+09IdEtAtGHs+SpbzLcvZ+M5n2UcdxaH+Af/nEkFq3Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NeaTdjHB; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3KYMAJ5o; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NeaTdjHB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3KYMAJ5o"
Date: Tue, 22 Sep 2026 09:46:58 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790070420;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Amohl00PuIOcz13PkrcaSETnHXciNQ+f/asL64utCEk=;
	b=NeaTdjHBskTlbXyPeEXmP72SlkzJbzTU5XS0dZdzJ9DW2u03ylN/waantVP5JjQus8azML
	ivXnt9p1zJfNFz6NmRN2+LfeOuYg3tT7mg7wdFOYTzfF3u+PW3WcuduKwT/4pVcqV3sNC5
	YPaZoPnLQcXhsG5b+CiKVKn2EBCVobWQ5+FOxB40EF4IlxPs7TH6kKTxVtmXmb7nJ4n0Nf
	x4J9ZgnWuiCHC0YVpRTPkQlA94c2wlhxztbDzTqxcMHmmk5+RIIvQaySiJn7CPPJik3Hxa
	vpk920RYS6uN5BSpdoKFVpYRWkop7IYZA5zO/JOki7hWGTNnHob/M9EaSkGjtQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790070420;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Amohl00PuIOcz13PkrcaSETnHXciNQ+f/asL64utCEk=;
	b=3KYMAJ5oW3PPKFZ7BTRkHIUE/qk0AxyRUHn7VAq9ZJWl48PSTJOxI1aLT5hv4lOsBXS+IH
	2ywfjWSEgGrEIrDA==
From: "tip-bot2 for Tim Chen" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/urgent] sched/cache: Keep nr_pref_llc_running in the
 runnable domain, to fix LLC mis-scheduling bug
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>, Chen Yu <yu.c.chen@intel.com>,
 Tim Chen <tim.c.chen@linux.intel.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Kayra Cizmeci <kayracizmeci@gmail.com>,
  <stable@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: =?utf-8?q?=3C06af61afedac32e6477f57feb4d658f6c411c3af=2E1790035?=
 =?utf-8?q?273=2Egit=2Etim=2Ec=2Echen=40linux=2Eintel=2Ecom=3E?=
References: =?utf-8?q?=3C06af61afedac32e6477f57feb4d658f6c411c3af=2E17900352?=
 =?utf-8?q?73=2Egit=2Etim=2Ec=2Echen=40linux=2Eintel=2Ecom=3E?=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179007041857.2819794.4887724509537112932.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     0d6526f82c3cdefcca47f73f5fc08dc6f335eac6
Gitweb:        https://git.kernel.org/tip/0d6526f82c3cdefcca47f73f5fc08dc6f33=
5eac6
Author:        Tim Chen <tim.c.chen@linux.intel.com>
AuthorDate:    Mon, 21 Sep 2026 17:37:22 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Tue, 22 Sep 2026 10:49:53 +02:00

sched/cache: Keep nr_pref_llc_running in the runnable domain, to fix LLC mis-=
scheduling bug

alb_break_llc() decides whether to break LLC preference during active
load balance. It does so by testing that every runnable fair task on the
source rq prefers its LLC:

	env->src_rq->nr_pref_llc_running =3D=3D env->src_rq->cfs.h_nr_runnable

But the two counters cover different sets. nr_pref_llc_running is updated
in account_llc_enqueue()/account_llc_dequeue(), next to cfs_rq->nr_queued,
so it follows queued tasks. h_nr_runnable is updated in set_delayed()/
clear_delayed() and drops delay-dequeued tasks.

So under DELAY_DEQUEUE, a preferring task that goes to sleep stays counted
in nr_pref_llc_running while h_nr_runnable falls. The equality then breaks,
alb_break_llc() returns false, and active balance is free to pull a task
off its preferred LLC. Active balance only moves runnable tasks, and this
is the only LLC check it consults: once the stopper runs, LBF_ACTIVE_LB
skips the per-task test in can_migrate_task(). The runnable set is the one
we want.

Fix it on the counter side. A task should be counted in
nr_pref_llc_running exactly while it is both queued on its preferred LLC
(pref_llc_queued) and runnable (!sched_delayed). Define that membership
once in task_pref_llc_runnable(), and adjust the counter only through
pref_llc_running_inc()/pref_llc_running_dec() from the four sites that
change either input: account_llc_enqueue(), account_llc_dequeue(),
set_delayed() and clear_delayed(). Gating every update on the same
predicate keeps the delay, wake and dequeue paths from double-counting
or underflowing; see the comments at those sites for the ordering.

nr_llc_running and sd->llc_counts are not touched and stay on queued
semantics.

Fixes: 714059f79ff0 ("sched/cache: Handle moving single tasks to/from their p=
referred LLC")
Closes: https://lore.kernel.org/lkml/20260827135000.735138-1-zhanxusheng@xiao=
mi.com/
Reported-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Suggested-by: Chen Yu <yu.c.chen@intel.com>
Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: <stable@kernel.org> # v7.2.x
Link: https://patch.msgid.link/06af61afedac32e6477f57feb4d658f6c411c3af.17900=
35273.git.tim.c.chen@linux.intel.com
---
 kernel/sched/fair.c | 63 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 58 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 7455a83..de3d589 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1546,6 +1546,28 @@ static bool invalid_llc_nr(struct mm_struct *mm, struc=
t task_struct *p,
 			(scale * per_cpu(sd_llc_size, cpu)));
 }
=20
+/*
+ * A task counts in nr_pref_llc_running while it is queued on its preferred
+ * LLC (pref_llc_queued) and runnable (!sched_delayed), keeping the counter =
in
+ * the runnable domain so alb_break_llc() can compare it with h_nr_runnable.
+ */
+static bool task_pref_llc_runnable(struct task_struct *p)
+{
+	return p->pref_llc_queued && !p->se.sched_delayed;
+}
+
+static void pref_llc_running_inc(struct rq *rq, struct task_struct *p)
+{
+	if (task_pref_llc_runnable(p))
+		rq->nr_pref_llc_running++;
+}
+
+static void pref_llc_running_dec(struct rq *rq, struct task_struct *p)
+{
+	if (task_pref_llc_runnable(p))
+		rq->nr_pref_llc_running--;
+}
+
 static void account_llc_enqueue(struct rq *rq, struct task_struct *p)
 {
 	int pref_llc, pref_llc_queued;
@@ -1557,7 +1579,6 @@ static void account_llc_enqueue(struct rq *rq, struct t=
ask_struct *p)
=20
 	pref_llc_queued =3D (pref_llc =3D=3D task_llc(p));
 	rq->nr_llc_running++;
-	rq->nr_pref_llc_running +=3D pref_llc_queued;
=20
 	/*
 	 * Record whether p is enqueued on its preferred
@@ -1575,6 +1596,9 @@ static void account_llc_enqueue(struct rq *rq, struct t=
ask_struct *p)
 	 */
 	p->pref_llc_queued =3D pref_llc_queued;
=20
+	/* Skipped while delayed; clear_delayed() adds it back on wake. */
+	pref_llc_running_inc(rq, p);
+
 	sd =3D rcu_dereference_all(rq->sd);
 	if (sd && (unsigned int)pref_llc < sd->llc_max)
 		sd->llc_counts[pref_llc]++;
@@ -1591,7 +1615,12 @@ static void account_llc_dequeue(struct rq *rq, struct =
task_struct *p)
=20
 	rq->nr_llc_running--;
 	if (p->pref_llc_queued) {
-		rq->nr_pref_llc_running--;
+		/*
+		 * Skipped if still delayed (set_delayed() already removed it);
+		 * clearing pref_llc_queued below also stops clear_delayed()
+		 * from re-adding it.
+		 */
+		pref_llc_running_dec(rq, p);
 		/*
 		 * Update the status in case
 		 * other logic might query
@@ -1995,6 +2024,7 @@ void init_sched_mm(struct task_struct *p)
 	 * polluting account_llc_enqueue().
 	 */
 	p->preferred_llc =3D -1;
+	p->pref_llc_queued =3D 0;
 }
=20
 #else /* CONFIG_SCHED_CACHE */
@@ -2016,6 +2046,10 @@ static void account_llc_enqueue(struct rq *rq, struct =
task_struct *p) {}
=20
 static void account_llc_dequeue(struct rq *rq, struct task_struct *p) {}
=20
+static void pref_llc_running_inc(struct rq *rq, struct task_struct *p) {}
+
+static void pref_llc_running_dec(struct rq *rq, struct task_struct *p) {}
+
 #endif /* CONFIG_SCHED_CACHE */
=20
 /*
@@ -6390,15 +6424,27 @@ static __always_inline void return_cfs_rq_runtime(str=
uct cfs_rq *cfs_rq);
=20
 static void set_delayed(struct sched_entity *se)
 {
-	se->sched_delayed =3D 1;
-
 	/*
 	 * Delayed se of cfs_rq have no tasks queued on them.
 	 * Do not adjust h_nr_runnable since __dequeue_task()
 	 * will account it for blocked tasks.
+	 *
+	 * This check can be removed because when flat pick
+	 * patches get merged as only task can get delayed,
+	 * same for clear_delayed().
 	 */
-	if (!entity_is_task(se))
+	if (!entity_is_task(se)) {
+		se->sched_delayed =3D 1;
 		return;
+	}
+
+	/*
+	 * Drop a task leaving the runnable set.
+	 * Needs to be called before sched_delayed is set.
+	 * clear_delayed() mirrors this after clearing the flag.
+	 */
+	pref_llc_running_dec(rq_of(cfs_rq_of(se)), task_of(se));
+	se->sched_delayed =3D 1;
=20
 	for_each_sched_entity(se) {
 		struct cfs_rq *cfs_rq =3D cfs_rq_of(se);
@@ -6420,6 +6466,13 @@ static void clear_delayed(struct sched_entity *se)
 	if (!entity_is_task(se))
 		return;
=20
+	/*
+	 * Re-add on wake, after sched_delayed is cleared. On a final delayed
+	 * dequeue account_llc_dequeue() already cleared pref_llc_queued, so
+	 * this does nothing.
+	 */
+	pref_llc_running_inc(rq_of(cfs_rq_of(se)), task_of(se));
+
 	for_each_sched_entity(se) {
 		struct cfs_rq *cfs_rq =3D cfs_rq_of(se);
=20
