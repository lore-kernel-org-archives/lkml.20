Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E473E3F105E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787864258; cv=none; b=pVOZOkQ2QCFSvBdFGt+BjkLHqK/3+2UFOAk/1ITFof4qrzP8rIO1/WfDFSzU+9J5qurzR9WfYj8h+sXQV7cs2jcftwVOFd9ABwDZNgANFl3hyBJ05ZPCD3vLjt4SffuHrprcQDKSI1LDwDofbnPD1vnP8ZbDFqAB43NGyQWxz/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787864258; c=relaxed/simple;
	bh=Donu65/36kGS+VqA2Oyp0PEnRCBi7gvEikgAyWaik5M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vn+cOAgFanO/pxQPJmpixGSL2m0ltEkmC4vvbMWUMPrk15gCbO3VdCqvc5olrg9IkpDqMipTKhMYS5F7PrKT4v3v9n9JdkyB4KQHLt20Ulf7tFMix8FrK+fQZHuWdUbJlWumrNgoAhEczvwiMXCOOIRhQA6soanh3/J/ZY94q9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=knUwSWnx; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="knUwSWnx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787864256; x=1819400256;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=Donu65/36kGS+VqA2Oyp0PEnRCBi7gvEikgAyWaik5M=;
  b=knUwSWnxzxfvsVVx8A4jxjCRWs0uPk7I+CaYldBtM/4PJU8IxeT/9SRA
   bVGsKkF7hPkD+yP91AExv1Mqaqds50Dy5abFfSBBR3DHjK7VhbOEqupZc
   osGxrvxAs0N0AXHtzDhAsob7zQtXMPh1xO2WdrbsNbc6hRTfCGZYTq220
   jWvrNjaCFIchVNzKynMjnqwnQnXmIjls6fz62PR0HK5LYv+ZjNNT+xR7m
   RSkrgPOKAIMPdbY7H+o5td2oMg6D+Q7dAC1r5WgBkKOGWEZlFmyTaGIMz
   D/n3q9jY0b19JBO4NUasGCCjWqJVTKj13vcgMCarrGcjGGJ9o/osQ70RP
   Q==;
X-CSE-ConnectionGUID: ljd1Uc/QQmKzvpLODaiRWw==
X-CSE-MsgGUID: A8jpj4HjTkCuIOQ79412fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="87318140"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="87318140"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 13:57:35 -0700
X-CSE-ConnectionGUID: U58TKUZeQz+4XAVvmcm88Q==
X-CSE-MsgGUID: PxdcLiFgTdeetol7BLC/qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="264210967"
Received: from unknown (HELO [10.241.243.185]) ([10.241.243.185])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 13:57:34 -0700
Message-ID: <59e2b8265fc650266b93d8f523c366edfa912428.camel@linux.intel.com>
Subject: Re: sched/fair: which tasks should nr_pref_llc_running be compared
 against?
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>, yu.c.chen@intel.com
Cc: peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
 kprateek.nayak@amd.com, 	linux-kernel@vger.kernel.org,
 zhanxusheng@xiaomi.com
Date: Thu, 27 Aug 2026 13:57:33 -0700
In-Reply-To: <20260827135000.735138-1-zhanxusheng@xiaomi.com>
References: <20260827135000.735138-1-zhanxusheng@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-08-27 at 21:50 +0800, Zhan Xusheng wrote:
> Reading alb_break_llc() I cannot tell which set of tasks the equality is
> meant to cover:
>=20
> 	/* kernel/sched/fair.c:10756 */
> 	if (env->src_rq->nr_pref_llc_running &&
> 	    env->src_rq->nr_pref_llc_running =3D=3D env->src_rq->cfs.h_nr_runnab=
le) {
>=20
> The two counters track different sets.  nr_pref_llc_running is maintained
> from account_entity_enqueue() and account_entity_dequeue() at fair.c:4522
> and 4538, beside cfs_rq->nr_queued++/-- at 4525 and 4541, so it follows
> queued tasks.  h_nr_runnable leaves out delay-dequeued entities:
> set_delayed() decrements it at 6398 while the entity stays queued and
> clear_delayed() restores it at 6418, neither going through
> account_entity_dequeue().
>=20
> So with DELAY_DEQUEUE a task that has just gone to sleep holds
> nr_pref_llc_running above h_nr_runnable until it is dequeued for real, th=
e
> equality cannot hold, and alb_break_llc() returns false, which stops
> active load balance from honouring the LLC preference.  The counter is a
> superset of the other, so the error is one-sided: the check can fail to
> protect but never protects wrongly.

Thank you for your review of this code.  You have a valid point that DELAY_=
DEQUEUE
could cause problem with the check in question. The intention of the check =
is to take
care of the situation where all running tasks prefer the source LLC, and
we should try not to do active balance that will break LLC locality.
And delayed dequeue of a task preferring source LLC could break the check
unintentionally, even though the rest of running tasks still prefer source =
LLC.

>=20
> Comparing against cfs.h_nr_queued would make both sides agree and read as
> "every queued fair task prefers this LLC".  Keeping runnable semantics
> would instead mean maintaining nr_pref_llc_running from set_delayed() and
> clear_delayed(), which may be the better fit, since only runnable tasks
> are candidates for active load balance and a task on its way to sleep is
> not one.  Which did you have in mind?

I think the proper thing to do is to make sure the nr_pref_llc_running acco=
unts correctly
the number of running tasks that prefer the source LLC.  And
exclude those that are delayed dequeued.  How about the following fix:

Tim

---
From de4acf2ec43a57d84aa301b50c4ab51965ac1f23 Mon Sep 17 00:00:00 2001
From: Tim Chen <tim.c.chen@linux.intel.com>
Date: Thu, 27 Aug 2026 11:20:31 -0700
Subject: [PATCH] sched/cache: Keep nr_pref_llc_running in the runnable doma=
in

alb_break_llc() decides whether to break LLC preference during active
load balance. It does so by testing that every runnable fair task on the
source rq prefers its LLC:

	env->src_rq->nr_pref_llc_running =3D=3D env->src_rq->cfs.h_nr_runnable

But the two counters cover different sets. nr_pref_llc_running is updated
in account_llc_enqueue()/account_llc_dequeue(), next to cfs_rq->nr_queued,
so it follows queued tasks. h_nr_runnable is updated in set_delayed()/
clear_delayed() and drops delay-dequeued tasks.

Say we start off with all running tasks preferring source LLC.
So under DELAY_DEQUEUE, a preferring task that goes to sleep stays counted
in nr_pref_llc_running while h_nr_runnable falls. The equality then breaks,
alb_break_llc() returns false, and active balance is free to pull a task
off its preferred LLC. Active balance only moves runnable tasks, and this
is the only LLC check it consults: once the stopper runs, LBF_ACTIVE_LB
skips the per-task test in can_migrate_task().

Fix it on the counter side. Adjust nr_pref_llc_running in set_delayed()
and clear_delayed(), the same places that adjust h_nr_runnable, so both
exclude delayed tasks.

This needs care to not count a task twice. set_delayed() removes the task
from nr_pref_llc_running when it sleeps. Later, when the task is really
dequeued, dequeue_entity() calls account_llc_dequeue() and then
clear_delayed(). Left as is, account_llc_dequeue() would remove the task a
second time and clear_delayed() would add it back. So account_llc_dequeue()
skips its decrement while the task is still delayed, and clears
pref_llc_queued so clear_delayed() also leaves the count alone.
nr_llc_running and sd->llc_counts are not touched and stay on queued
semantics.

Reported-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Assisted-By: Claude Opus 4.8 <noreply@anthropic.com>
Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
---
 kernel/sched/fair.c | 45 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index d78467ec6ee1..1673b17273c5 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1544,7 +1544,14 @@ static void account_llc_dequeue(struct rq *rq, struc=
t task_struct *p)
=20
 	rq->nr_llc_running--;
 	if (p->pref_llc_queued) {
-		rq->nr_pref_llc_running--;
+		/*
+		 * If the task is being finally dequeued while still delayed,
+		 * set_delayed() already removed it from nr_pref_llc_running;
+		 * skip here to avoid underflow. Clearing pref_llc_queued also
+		 * stops the subsequent clear_delayed() from re-adding it.
+		 */
+		if (!p->se.sched_delayed)
+			rq->nr_pref_llc_running--;
 		/*
 		 * Update the status in case
 		 * other logic might query
@@ -1572,6 +1579,24 @@ static void account_llc_dequeue(struct rq *rq, struc=
t task_struct *p)
 	}
 }
=20
+/*
+ * A task becoming delay-dequeued leaves the runnable set while staying
+ * queued. Keep nr_pref_llc_running in the runnable domain (like
+ * h_nr_runnable) so alb_break_llc() can compare the two directly.
+ */
+static void account_llc_delayed(struct rq *rq, struct task_struct *p)
+{
+	if (p->pref_llc_queued)
+		rq->nr_pref_llc_running--;
+}
+
+/* A delay-dequeued task becoming runnable again rejoins the count. */
+static void account_llc_requeue_delayed(struct rq *rq, struct task_struct =
*p)
+{
+	if (p->pref_llc_queued)
+		rq->nr_pref_llc_running++;
+}
+
 void mm_init_sched(struct mm_struct *mm,
 		   struct sched_cache_time __percpu *_pcpu_sched)
 {
@@ -1969,6 +1994,10 @@ static void account_llc_enqueue(struct rq *rq, struc=
t task_struct *p) {}
=20
 static void account_llc_dequeue(struct rq *rq, struct task_struct *p) {}
=20
+static void account_llc_delayed(struct rq *rq, struct task_struct *p) {}
+
+static void account_llc_requeue_delayed(struct rq *rq, struct task_struct =
*p) {}
+
 #endif /* CONFIG_SCHED_CACHE */
=20
 /*
@@ -6203,6 +6232,13 @@ static void set_delayed(struct sched_entity *se)
 	if (!entity_is_task(se))
 		return;
=20
+	/*
+	 * A delayed task is queued but no longer runnable. Drop it from
+	 * nr_pref_llc_running so that counter keeps runnable semantics and
+	 * stays comparable with h_nr_runnable in alb_break_llc().
+	 */
+	account_llc_delayed(rq_of(cfs_rq_of(se)), task_of(se));
+
 	for_each_sched_entity(se) {
 		struct cfs_rq *cfs_rq =3D cfs_rq_of(se);
=20
@@ -6223,6 +6259,13 @@ static void clear_delayed(struct sched_entity *se)
 	if (!entity_is_task(se))
 		return;
=20
+	/*
+	 * Re-add on wake (requeue_delayed_entity). On the final delayed
+	 * dequeue, account_llc_dequeue() has already cleared pref_llc_queued,
+	 * so this correctly does nothing.
+	 */
+	account_llc_requeue_delayed(rq_of(cfs_rq_of(se)), task_of(se));
+
 	for_each_sched_entity(se) {
 		struct cfs_rq *cfs_rq =3D cfs_rq_of(se);
=20

base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
--=20
2.53.0


