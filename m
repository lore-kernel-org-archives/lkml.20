Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6624448B9B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 20:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788295383; cv=none; b=jiYJzTBnTAYzJ8FRuQEqRLvU8Whmzwm4ny6Emopr8GeI4Y32IGfnKvsznHjUImRNrGMHvqFYgDjqjAvFykleepjddwmt+rnCTAwnTMmqo/eDGkpLk3q2VFfTPrG0XSpFR+8pPEYVHLDZryuJN3Msv8VbXP6dMQS44ds1vfofEGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788295383; c=relaxed/simple;
	bh=K9qV321kv5/v2NGUIm1euDEutRs79l3TjH4BzWCPGu0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z2tFOhFHcpBj6+5pu0hd1pMjygSNfNhMRAswdgJcF1CNe4/TDJEvqRbh7exS5YUx3Qrpi1Pe33bpS2/8KgUhRFiLeXGjfQLw/LlcgI0N8o1GXNIuawFV6tiQqeCbOywZ8dXRaArNYDC0ubDZbUZZYFQB7d12AU6MEnqVh1c00lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VftbaNnY; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VftbaNnY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788295381; x=1819831381;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=K9qV321kv5/v2NGUIm1euDEutRs79l3TjH4BzWCPGu0=;
  b=VftbaNnYI9srx1CsGRZMCf6exe1bh6xQV+hYjlXv8mR/jeLTFsZPmQMA
   cifwUs+njqTnLlDxkqDVzOiPsEa7TnDRkSmJl1GvLptQeAOP1kfFKtxw2
   ouuxd1mwreDEeAITpgqoBCGlHokMmHF38jvh4TkUIgg+O+Il4pKOB1hbl
   LdghWuNBmQXwJXgX67EAYtjD6anOiB3fKgLrc5cRmYZAvpZsIUKbw728Y
   Ywdm8bwy3hWC3zX4TnFpiFR2DV2SlKgFBTXf3kV9h8ZBXAvhez1GuYtA3
   MkS42BGxjZLafFVeDe9es/GOF+OjTO0EAR9W5o69jvIVm6vi8kiYCiE4/
   A==;
X-CSE-ConnectionGUID: x5KdIXz5Syql013r554y9Q==
X-CSE-MsgGUID: MRxAfyS/SIWaz4s9Ptmu5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="92438518"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="92438518"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 13:42:59 -0700
X-CSE-ConnectionGUID: ++pcQsB3TSuoLZKnh2TbeQ==
X-CSE-MsgGUID: HrMpB6OZQA2SiJ660uBBMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="269243795"
Received: from unknown (HELO [10.241.243.185]) ([10.241.243.185])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 13:42:59 -0700
Message-ID: <06ed8af87506f858176a81a4c29acf92d24b6dc7.camel@linux.intel.com>
Subject: Re: sched/fair: which tasks should nr_pref_llc_running be compared
 against?
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Chen Yu <chen.yu@linux.dev>
Cc: Zhan Xusheng <zhanxusheng1024@gmail.com>, yu.c.chen@intel.com, 
	peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
 kprateek.nayak@amd.com, 	linux-kernel@vger.kernel.org,
 zhanxusheng@xiaomi.com
Date: Tue, 01 Sep 2026 13:42:58 -0700
In-Reply-To: <apPnJaUS5vq2f85J@three-body>
References: <20260827135000.735138-1-zhanxusheng@xiaomi.com>
	 <59e2b8265fc650266b93d8f523c366edfa912428.camel@linux.intel.com>
	 <apPnJaUS5vq2f85J@three-body>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2026-08-30 at 16:17 +0800, Chen Yu wrote:
> On Thu, Aug 27, 2026 at 01:57:33PM -0700, Tim Chen wrote:
> > On Thu, 2026-08-27 at 21:50 +0800, Zhan Xusheng wrote:
> > Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
> > ---
> >  kernel/sched/fair.c | 45 ++++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 44 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index d78467ec6ee1..1673b17273c5 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -1544,7 +1544,14 @@ static void account_llc_dequeue(struct rq *rq, s=
truct task_struct *p)
> > =20
> >  	rq->nr_llc_running--;
> >  	if (p->pref_llc_queued) {
> > -		rq->nr_pref_llc_running--;
> > +		/*
> > +		 * If the task is being finally dequeued while still delayed,
> > +		 * set_delayed() already removed it from nr_pref_llc_running;
> > +		 * skip here to avoid underflow. Clearing pref_llc_queued also
> > +		 * stops the subsequent clear_delayed() from re-adding it.
> > +		 */
> > +		if (!p->se.sched_delayed)
> > +			rq->nr_pref_llc_running--;
>=20
> Should we also do similar check in account_llc_enqueue()? It is possible =
during
> load balance migration, a migrate_load allows the task to be migrated acr=
oss
> CPUs. And load balance leverages detach_tasks()/attach_tasks() to move ta=
sks.
> During this stage the p->se.sched_delayed remained unchanged:
> In enqueue_task_fair(), only when if (se->on_rq && se->sched_delayed) is =
true,
> p->se.sched_delayed will be cleared by requeue_delayed_entity() - during =
migration,
> se->on_rq is false.

Yes, you're right.  We should extend the sched_delayed check also to enqueu=
e.

>=20
> As a result, attach_tasks -> enqueue_hierarchy -> enqueue_entity -> accou=
nt_llc_enqueue(rq, p)
> incorrectly increase rq->nr_pref_llc_running - even that task is in delay=
ed state, and
> not runnable.
>=20
> >  		/*
> >  		 * Update the status in case
> >  		 * other logic might query
> > @@ -1572,6 +1579,24 @@ static void account_llc_dequeue(struct rq *rq, s=
truct task_struct *p)
> >  	}
> >  }
> > =20
> > +/*
> > + * A task becoming delay-dequeued leaves the runnable set while stayin=
g
> > + * queued. Keep nr_pref_llc_running in the runnable domain (like
> > + * h_nr_runnable) so alb_break_llc() can compare the two directly.
> > + */
> >=20
>=20
> Regarding alb_break_llc(), since we have compared nr_pref_llc_running vs=
=20
> nr_runnable, I wonder if we should also change the code?
> 	if (env->src_rq->nr_pref_llc_running &&
>  	    env->src_rq->nr_pref_llc_running =3D=3D env->src_rq->cfs.h_nr_runna=
ble)
> 		unsigned long util =3D 0;
> 		struct task_struct *cur;
> =20
>                 if (env->src_rq->cfs.h_nr_runnable <=3D 1)
>                         return true;

We already know that there is at least a cfs running task
preferring src LLC.

And if there is only 1 running task, (i.e. env->src_rq->nr_running <=3D 1)
then env->src_rq->>cfs.h_nr_runnable should be also 1 here. So switching
the check to use cfs.h_nr_runnable should have the same effect.

So I'll leave that change out for now.

The patch is updated as below.  Chen Yu and Xusheng,
please add your reviewed by if the updated patch looks good.

Thanks.

Tim

---
From 05d33ae88ba1348ec53ede00c405e1100747f028 Mon Sep 17 00:00:00 2001
Message-Id: <05d33ae88ba1348ec53ede00c405e1100747f028.1788294281.git.tim.c.=
chen@linux.intel.com>
From: Tim Chen <tim.c.chen@linux.intel.com>
Date: Thu, 27 Aug 2026 11:20:31 -0700
Subject: [PATCH v2] sched/cache: Keep nr_pref_llc_running in the runnable d=
omain

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
Suggested-by: Chen Yu <yu.c.chen@intel.com>
Assisted-By: claude-opus-4.8
Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
---
Changes in v2:
- Prevent delay dequeued task from counted as running task in enqueue
  operation.
---
 kernel/sched/fair.c | 53 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 8dff37059faf..84c068f1deec 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1549,7 +1549,13 @@ static void account_llc_enqueue(struct rq *rq, struc=
t task_struct *p)
=20
 	pref_llc_queued =3D (pref_llc =3D=3D task_llc(p));
 	rq->nr_llc_running++;
-	rq->nr_pref_llc_running +=3D pref_llc_queued;
+	/*
+	 * If the task is being migrated while delay dequeued, keep it out
+	 * of the runnable-domain nr_pref_llc_running; clear_delayed() ->
+	 * account_llc_requeue_delayed() re-adds it when it wakes.
+	 */
+	if (!p->se.sched_delayed)
+		rq->nr_pref_llc_running +=3D pref_llc_queued;
=20
 	/*
 	 * Record whether p is enqueued on its preferred
@@ -1583,7 +1589,14 @@ static void account_llc_dequeue(struct rq *rq, struc=
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
@@ -1611,6 +1624,24 @@ static void account_llc_dequeue(struct rq *rq, struc=
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
@@ -2008,6 +2039,10 @@ static void account_llc_enqueue(struct rq *rq, struc=
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
@@ -6392,6 +6427,13 @@ static void set_delayed(struct sched_entity *se)
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
@@ -6412,6 +6454,13 @@ static void clear_delayed(struct sched_entity *se)
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
--=20
2.32.0



