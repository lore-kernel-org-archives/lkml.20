Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A34374E73
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 20:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788555196; cv=none; b=am065m7FIifOyvAOY/vifYhF7jOhfY3XCfhl0AZwm6tcLkerxiDsLeYwGOJ7p57DpIzAl06vLp4Qs4DEDZiqJzxa6nlv74ER9BiVHZvjx6di6fP4ULXHUXfCS36tXz4GA+B+V+Tv8Xd7NLB/JTKEnT7MB8KUtjrX0pPfTf4bFWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788555196; c=relaxed/simple;
	bh=1g+e7mb6vTWdWFByuMlWxDvZXUn6trDEtzyH5cynH+k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l34VzklFMGdvL9XZ+7bwlUoqkSZukfeJnCeilnXhN4M7I5ZcnisYow9yNImyJVCq8m8IQV6rC/aw4DcB5mceSfhQ1UjIPjcEcv2VgesUZV4LYiTzMVHlbSAIMcc/BwE7Yyf861uEByNXBTFp8+zygR/4wNYkzDRmebTgZspM2WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JF/quzMy; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JF/quzMy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788555193; x=1820091193;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=1g+e7mb6vTWdWFByuMlWxDvZXUn6trDEtzyH5cynH+k=;
  b=JF/quzMy2szaMOVN5fjGGGZBCkGqaSgKQtTmO6cknCYoygAbAI7vxGUy
   B76k1uJkF2OyL04YYxt3Ww/z1eFihiCFJvjYQ+/I2YLFy32YlnYy5nQrd
   cB7VFik19DkAwuxqfEiPcBOMHT/6eV5WSzy5OLcvhZjLQm9EHQlX9Pu91
   BSvaPraAxhZ/JuUEY/vIBGNutcjNzIej1Z9woTsZ/JzdV3ibPjTR9s3r7
   DL5440KEK+9JLzkB+kPCJA6Je68ZTzvJ5r6vpCYZMBjebT/ZAbZea2SqI
   xUDZHwVEB2bm0Tu/dOW82QuV7LEKsi44dRv6W00+eluEu9zb31xV/xZre
   Q==;
X-CSE-ConnectionGUID: zaEOa91+TES+mJIF/aEo+g==
X-CSE-MsgGUID: 3b+0FatgTSiRg3rt4D+4Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="92759748"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="92759748"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 13:53:12 -0700
X-CSE-ConnectionGUID: WhYujCjjQv2PhbiitwvgOA==
X-CSE-MsgGUID: KSywzletScmu9vls+lx7LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="267560368"
Received: from schen9-mobl4.amr.corp.intel.com (HELO [10.125.111.11]) ([10.125.111.11])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 13:53:10 -0700
Message-ID: <2b0a35122ee615c6fa51076e5d79330e633755ac.camel@linux.intel.com>
Subject: Re: sched/fair: which tasks should nr_pref_llc_running be compared
 against?
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Chen Yu <yu.c.chen@intel.com>
Cc: Chen Yu <chen.yu@linux.dev>, Zhan Xusheng <zhanxusheng1024@gmail.com>, 
	peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
 kprateek.nayak@amd.com, 	linux-kernel@vger.kernel.org,
 zhanxusheng@xiaomi.com
Date: Fri, 04 Sep 2026 13:53:10 -0700
In-Reply-To: <apmQaelH5Y7czrOM@fengwei-dev>
References: <20260827135000.735138-1-zhanxusheng@xiaomi.com>
		 <59e2b8265fc650266b93d8f523c366edfa912428.camel@linux.intel.com>
		 <apPnJaUS5vq2f85J@three-body>
		 <06ed8af87506f858176a81a4c29acf92d24b6dc7.camel@linux.intel.com>
		 <apmQaelH5Y7czrOM@fengwei-dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-09-03 at 23:21 +0800, Chen Yu wrote:
> On Tue, Sep 01, 2026 at 01:42:58PM -0700, Tim Chen wrote:
> >=20
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 8dff37059faf..84c068f1deec 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -1549,7 +1549,13 @@ static void account_llc_enqueue(struct rq *rq, s=
truct task_struct *p)
> > =20
> >  	pref_llc_queued =3D (pref_llc =3D=3D task_llc(p));
> >  	rq->nr_llc_running++;
> > -	rq->nr_pref_llc_running +=3D pref_llc_queued;
>=20
> Since the logic in
> account_llc_enqueue()/account_llc_dequeue()/
> account_llc_delayed()/account_llc_requeue_delayed() are very
> similar, can we introduce one helper for them:
> static void account_llc_pref_running(struct rq *rq, struct task_struct *p=
, int delta)
> {
>        if (p->pref_llc_queued && !p->se.sched_delayed)
>                rq->nr_pref_llc_running +=3D delta;
> }
>=20


Good idea - the four sites really are one operation ("if the task is
queued on its preferred LLC and runnable, move the counter"), and
folding the two conditions into one place is what keeps them from
drifting apart later. I've adopted it in v3; account_llc_delayed() and
account_llc_requeue_delayed() are gone.

I split it slightly differently: a membership predicate

        static bool task_pref_llc_runnable(struct task_struct *p)
        {
                return p->pref_llc_queued && !p->se.sched_delayed;
        }

with pref_llc_running_inc()/pref_llc_running_dec() wrappers over it, so
the call sites read as inc/dec rather than passing a +1/-1 delta.

Two things to note:

1) I kept the call site comments of pref_llc_running_inc/dec().
   The helper name says *what* happens,
   but not *why* it is safe across the delay-dequeue transition - that
   set_delayed() already did the decrement, so account_llc_dequeue()
   must skip it, and that clearing pref_llc_queued there is what
   neutralizes the following clear_delayed().=20

2) The pref_llc_running_dec() placement in set_delayed()
   is subtle. It has to be before se->sched_delayed =3D 1 or
   decrement would not happen. That deserves a comment so no
   one would move sched_delayed =3D 1 before the decrement.

Tim
---
From: Tim Chen <tim.c.chen@linux.intel.com>
Date: Wed, 3 Sep 2026 09:00:00 -0700
Subject: [PATCH v3] sched/cache: Keep nr_pref_llc_running in the runnable d=
omain
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>
Cc: Zhan Xusheng <zhanxusheng1024@gmail.com>, peterz@infradead.org, juri.le=
lli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, roste=
dt@goodmis.org, bsegall@google.com,
mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, linux-kernel@=
vger.kernel.org, zhanxusheng@xiaomi.com

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

Reported-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Closes: https://lore.kernel.org/lkml/20260827135000.735138-1-zhanxusheng@xi=
aomi.com/
Suggested-by: Chen Yu <yu.c.chen@intel.com>
Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
---
Based on v7.3-rc1.

Changes in v3:
- Route every nr_pref_llc_running adjustment through a single membership
  predicate task_pref_llc_runnable(), with pref_llc_running_inc()/
  pref_llc_running_dec() wrappers, instead of four open-coded sites
  (Chen Yu). Keep the per-site comments that explain the delay-dequeue
  interaction, and note that set_delayed() must adjust the counter
  before setting se->sched_delayed.

Changes in v2:
- Prevent a delay-dequeued task from being counted as running in the
  enqueue path (Chen Yu).

 kernel/sched/fair.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++++=
+--
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 8dff37059faf..72aae7a50b8b 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1538,6 +1538,28 @@ static bool invalid_llc_nr(struct mm_struct *mm, str=
uct task_struct *p,
 			(scale * per_cpu(sd_llc_size, cpu)));
 }
=20
+/*
+ * A task counts in nr_pref_llc_running while it is queued on its preferre=
d
+ * LLC (pref_llc_queued) and runnable (!sched_delayed), keeping the counte=
r in
+ * the runnable domain so alb_break_llc() can compare it with h_nr_runnabl=
e.
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
@@ -1549,7 +1571,6 @@ static void account_llc_enqueue(struct rq *rq, struct=
 task_struct *p)
=20
 	pref_llc_queued =3D (pref_llc =3D=3D task_llc(p));
 	rq->nr_llc_running++;
-	rq->nr_pref_llc_running +=3D pref_llc_queued;
=20
 	/*
 	 * Record whether p is enqueued on its preferred
@@ -1567,6 +1588,9 @@ static void account_llc_enqueue(struct rq *rq, struct=
 task_struct *p)
 	 */
 	p->pref_llc_queued =3D pref_llc_queued;
=20
+	/* Skipped while delayed; clear_delayed() adds it back on wake. */
+	pref_llc_running_inc(rq, p);
+
 	sd =3D rcu_dereference_all(rq->sd);
 	if (sd && (unsigned int)pref_llc < sd->llc_max)
 		sd->llc_counts[pref_llc]++;
@@ -1583,7 +1607,12 @@ static void account_llc_dequeue(struct rq *rq, struc=
t task_struct *p)
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
@@ -2008,6 +2037,10 @@ static void account_llc_enqueue(struct rq *rq, struc=
t task_struct *p) {}
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
@@ -6382,6 +6415,14 @@ static __always_inline void return_cfs_rq_runtime(st=
ruct cfs_rq *cfs_rq);
=20
 static void set_delayed(struct sched_entity *se)
 {
+	/*
+	 * Drop a task leaving the runnable set. Must run before sched_delayed
+	 * is set, or task_pref_llc_runnable() would already exclude it;
+	 * clear_delayed() mirrors this after clearing the flag.
+	 */
+	if (entity_is_task(se))
+		pref_llc_running_dec(rq_of(cfs_rq_of(se)), task_of(se));
+
 	se->sched_delayed =3D 1;
=20
 	/*
@@ -6412,6 +6453,13 @@ static void clear_delayed(struct sched_entity *se)
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
--=20
2.32.0



