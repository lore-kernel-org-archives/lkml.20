Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B388137F313
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788976034; cv=none; b=HA6KZRyPaDxxC+s+hhzmJjhYMYSGU/Akdn4T1b1BNjHeQImRUQ2zkOb4hdvss86uHYHw3n4ony+Hr7/Ge7kk6k5tAk35bGint+lk70cJ/j3kzIcYfvAF83Y0kBjFj+Ln45mOB3/gVVLZBoUFKuYNafXz9Jt9rfHC1y+jIrXXIBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788976034; c=relaxed/simple;
	bh=lVa4Fcz3ShlHaGUegcUo0c0RSFB/uR9Gg92pFEkiK3k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Kxit9VvgqLxoXUD16JVd+Tx354D2hMm03oNQbgrb+siDzSoFGHGa1Te0dgK1fpKUVggdNhr8DsVOkPLtns2IoHmAD1dgT6/KAZ/sR5ygp8GvSqUknZCuQg+k2vMcxHQpjj5hYCavdoM1mCtuJMxW+1zN4ABBLrX3vlmgoHoeErg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UYpAcutQ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UYpAcutQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788976033; x=1820512033;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=lVa4Fcz3ShlHaGUegcUo0c0RSFB/uR9Gg92pFEkiK3k=;
  b=UYpAcutQhJvlXUfaBV6uwkg7IqJuls6WeULyJaqtmIWow9ubRuxRqDHV
   ZtGw7RX1QfWpzhkjcAV2OKl3rwVOdqveF74KeGlbBkLgbQHTdGUzQ1uWE
   LS/JkJAGsIAjAg5gx1sQtySJaiaekgjV0o432C/Wv3daCes5piir3R98r
   FxJPGBuDy6AM+zc+TQBrfvv0Kb/xXPtw2Hrgf2xJgO1/7UfpiiW4Jr0An
   eYmhxdjFxhlREtMRTrJUlma5n4tOxz2/WNuYUwHf69hP/8sxwjVD6eyRF
   8xBJKqbhdFoYwiE0C8ptB1je/yNzV1Hy/SlPEOgM2hN13D1v6SQKNOnSO
   w==;
X-CSE-ConnectionGUID: 48hyyKY4RGG4RN3MOehlyA==
X-CSE-MsgGUID: q96ffjWISbqQlIca9wrCUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="106783206"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="106783206"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 10:47:12 -0700
X-CSE-ConnectionGUID: ki7I5mXKTFidWs/ZKNSk/A==
X-CSE-MsgGUID: oWMyoKhoSfScLbnWRwmBPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="275528619"
Received: from unknown (HELO [10.241.243.185]) ([10.241.243.185])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 10:47:12 -0700
Message-ID: <a1b1d5f9a58895b65217671678c6e02bd711241a.camel@linux.intel.com>
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
Date: Wed, 09 Sep 2026 10:47:11 -0700
In-Reply-To: <aqFFu1Xo52cQV3iy@fengwei-dev>
References: <20260827135000.735138-1-zhanxusheng@xiaomi.com>
	 <59e2b8265fc650266b93d8f523c366edfa912428.camel@linux.intel.com>
	 <apPnJaUS5vq2f85J@three-body>
	 <06ed8af87506f858176a81a4c29acf92d24b6dc7.camel@linux.intel.com>
	 <apmQaelH5Y7czrOM@fengwei-dev>
	 <2b0a35122ee615c6fa51076e5d79330e633755ac.camel@linux.intel.com>
	 <aqFFu1Xo52cQV3iy@fengwei-dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-09-09 at 19:40 +0800, Chen Yu wrote:
> On Fri, Sep 04, 2026 at 01:53:10PM -0700, Tim Chen wrote:
> > Good idea - the four sites really are one operation ("if the task is
> > queued on its preferred LLC and runnable, move the counter"), and
> > folding the two conditions into one place is what keeps them from
> > drifting apart later. I've adopted it in v3; account_llc_delayed() and
> > account_llc_requeue_delayed() are gone.
> >=20
> > I split it slightly differently: a membership predicate
> >=20
> >         static bool task_pref_llc_runnable(struct task_struct *p)
> >         {
> >                 return p->pref_llc_queued && !p->se.sched_delayed;
> >         }
> >=20
> > with pref_llc_running_inc()/pref_llc_running_dec() wrappers over it, so
> > the call sites read as inc/dec rather than passing a +1/-1 delta.
> >=20
> > Two things to note:
> >=20
> > 1) I kept the call site comments of pref_llc_running_inc/dec().
> >    The helper name says *what* happens,
> >    but not *why* it is safe across the delay-dequeue transition - that
> >    set_delayed() already did the decrement, so account_llc_dequeue()
> >    must skip it, and that clearing pref_llc_queued there is what
> >    neutralizes the following clear_delayed().=20
> >=20
> > 2) The pref_llc_running_dec() placement in set_delayed()
> >    is subtle. It has to be before se->sched_delayed =3D 1 or
> >    decrement would not happen. That deserves a comment so no
> >    one would move sched_delayed =3D 1 before the decrement.
> >=20
> >=20
> > alb_break_llc() decides whether to break LLC preference during active
> > load balance. It does so by testing that every runnable fair task on th=
e
> > source rq prefers its LLC:
> >=20
> > 	env->src_rq->nr_pref_llc_running =3D=3D env->src_rq->cfs.h_nr_runnable
> >=20
> > But the two counters cover different sets. nr_pref_llc_running is updat=
ed
> > in account_llc_enqueue()/account_llc_dequeue(), next to cfs_rq->nr_queu=
ed,
> > so it follows queued tasks. h_nr_runnable is updated in set_delayed()/
> > clear_delayed() and drops delay-dequeued tasks.
> >=20
> > So under DELAY_DEQUEUE, a preferring task that goes to sleep stays coun=
ted
> > in nr_pref_llc_running while h_nr_runnable falls. The equality then bre=
aks,
> > alb_break_llc() returns false, and active balance is free to pull a tas=
k
> > off its preferred LLC. Active balance only moves runnable tasks, and th=
is
> > is the only LLC check it consults: once the stopper runs, LBF_ACTIVE_LB
> > skips the per-task test in can_migrate_task(). The runnable set is the =
one
> > we want.
> >=20
> > Fix it on the counter side. A task should be counted in
> > nr_pref_llc_running exactly while it is both queued on its preferred LL=
C
> > (pref_llc_queued) and runnable (!sched_delayed). Define that membership
> > once in task_pref_llc_runnable(), and adjust the counter only through
> > pref_llc_running_inc()/pref_llc_running_dec() from the four sites that
> > change either input: account_llc_enqueue(), account_llc_dequeue(),
> > set_delayed() and clear_delayed(). Gating every update on the same
> > predicate keeps the delay, wake and dequeue paths from double-counting
> > or underflowing; see the comments at those sites for the ordering.
> >=20
> > nr_llc_running and sd->llc_counts are not touched and stay on queued
> > semantics.
> >=20
> > Reported-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> > Closes: https://lore.kernel.org/lkml/20260827135000.735138-1-zhanxushen=
g@xiaomi.com/
> > Suggested-by: Chen Yu <yu.c.chen@intel.com>
> > Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
> > ---
> > Based on v7.3-rc1.
> >=20
> > Changes in v3:
> > - Route every nr_pref_llc_running adjustment through a single membershi=
p
> >   predicate task_pref_llc_runnable(), with pref_llc_running_inc()/
> >   pref_llc_running_dec() wrappers, instead of four open-coded sites
> >   (Chen Yu). Keep the per-site comments that explain the delay-dequeue
> >   interaction, and note that set_delayed() must adjust the counter
> >   before setting se->sched_delayed.
> >=20
> > Changes in v2:
> > - Prevent a delay-dequeued task from being counted as running in the
> >   enqueue path (Chen Yu).
> >=20
> >  kernel/sched/fair.c | 52 +++++++++++++++++++++++++++++++++++++++++++++=
+++++--
> >  1 file changed, 50 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 8dff37059faf..72aae7a50b8b 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -1538,6 +1538,28 @@ static bool invalid_llc_nr(struct mm_struct *mm,=
 struct task_struct *p,
> >  			(scale * per_cpu(sd_llc_size, cpu)));
> >  }
> > =20
> > +/*
> > + * A task counts in nr_pref_llc_running while it is queued on its pref=
erred
> > + * LLC (pref_llc_queued) and runnable (!sched_delayed), keeping the co=
unter in
> > + * the runnable domain so alb_break_llc() can compare it with h_nr_run=
nable.
> > + */
> > +static bool task_pref_llc_runnable(struct task_struct *p)
> > +{
> > +	return p->pref_llc_queued && !p->se.sched_delayed;
> > +}
> > +
> > +static void pref_llc_running_inc(struct rq *rq, struct task_struct *p)
> > +{
> > +	if (task_pref_llc_runnable(p))
> > +		rq->nr_pref_llc_running++;
> > +}
> > +
> > +static void pref_llc_running_dec(struct rq *rq, struct task_struct *p)
> > +{
> > +	if (task_pref_llc_runnable(p))
> > +		rq->nr_pref_llc_running--;
> > +}
> > +
> >  static void account_llc_enqueue(struct rq *rq, struct task_struct *p)
> >  {
> >  	int pref_llc, pref_llc_queued;
> > @@ -1549,7 +1571,6 @@ static void account_llc_enqueue(struct rq *rq, st=
ruct task_struct *p)
> > =20
> >  	pref_llc_queued =3D (pref_llc =3D=3D task_llc(p));
> >  	rq->nr_llc_running++;
> > -	rq->nr_pref_llc_running +=3D pref_llc_queued;
> > =20
> >  	/*
> >  	 * Record whether p is enqueued on its preferred
> > @@ -1567,6 +1588,9 @@ static void account_llc_enqueue(struct rq *rq, st=
ruct task_struct *p)
> >  	 */
> >  	p->pref_llc_queued =3D pref_llc_queued;
> > =20
> > +	/* Skipped while delayed; clear_delayed() adds it back on wake. */
> > +	pref_llc_running_inc(rq, p);
> > +
> >  	sd =3D rcu_dereference_all(rq->sd);
> >  	if (sd && (unsigned int)pref_llc < sd->llc_max)
> >  		sd->llc_counts[pref_llc]++;
> > @@ -1583,7 +1607,12 @@ static void account_llc_dequeue(struct rq *rq, s=
truct task_struct *p)
> > =20
> >  	rq->nr_llc_running--;
> >  	if (p->pref_llc_queued) {
> > -		rq->nr_pref_llc_running--;
> > +		/*
> > +		 * Skipped if still delayed (set_delayed() already removed it);
> > +		 * clearing pref_llc_queued below also stops clear_delayed()
> > +		 * from re-adding it.
> > +		 */
> > +		pref_llc_running_dec(rq, p);
> >  		/*
> >  		 * Update the status in case
> >  		 * other logic might query
> > @@ -2008,6 +2037,10 @@ static void account_llc_enqueue(struct rq *rq, s=
truct task_struct *p) {}
> > =20
> >  static void account_llc_dequeue(struct rq *rq, struct task_struct *p) =
{}
> > =20
> > +static void pref_llc_running_inc(struct rq *rq, struct task_struct *p)=
 {}
> > +
> > +static void pref_llc_running_dec(struct rq *rq, struct task_struct *p)=
 {}
> > +
> >  #endif /* CONFIG_SCHED_CACHE */
> > =20
> >  /*
> > @@ -6382,6 +6415,14 @@ static __always_inline void return_cfs_rq_runtim=
e(struct cfs_rq *cfs_rq);
> > =20
> >  static void set_delayed(struct sched_entity *se)
> >  {
> > +	/*
> > +	 * Drop a task leaving the runnable set. Must run before sched_delaye=
d
> > +	 * is set, or task_pref_llc_runnable() would already exclude it;
> > +	 * clear_delayed() mirrors this after clearing the flag.
> > +	 */
> > +	if (entity_is_task(se))
> > +		pref_llc_running_dec(rq_of(cfs_rq_of(se)), task_of(se));
> > +
> >  	se->sched_delayed =3D 1;
> > =20
> >  	/*
> > @@ -6412,6 +6453,13 @@ static void clear_delayed(struct sched_entity *s=
e)
> >  	if (!entity_is_task(se))
> >  		return;
> > =20
> > +	/*
> > +	 * Re-add on wake, after sched_delayed is cleared. On a final delayed
> > +	 * dequeue account_llc_dequeue() already cleared pref_llc_queued, so
> > +	 * this does nothing.
> > +	 */
> > +	pref_llc_running_inc(rq_of(cfs_rq_of(se)), task_of(se));
> > +
> >  	for_each_sched_entity(se) {
> >  		struct cfs_rq *cfs_rq =3D cfs_rq_of(se);
> > =20
> > --=20
> > 2.32.0
> >=20
> >=20
> >=20
>=20
> Yes, I think this version looks good now. While looking back at Xusheng's=
 proposal,
> I noticed there is another option:
> if (env->src_rq->nr_pref_llc_running =3D=3D env->src_rq->cfs.h_nr_queued)=
 {
> 	...
> }
> May I know why we did not choose this approach, is it because of the foll=
owing
> scenario?

The reason is that a common condition we are trying to avoid in
alb_break_llc() is the following: We have one task T1 running on cpu prefer=
ring
src LLC and another delay queued task T2 not preferring src LLC and delayed=
 queued.

- runnable domain (current fix): h_nr_runnable =3D=3D 1, nr_pref_llc_runnin=
g =3D=3D 1 =E2=86=92 equal =E2=86=92 alb_break_llc() true =E2=86=92 suppres=
s.
  Correct: the only thing actually running here wants to be here; don't rip=
 it away.
- h_nr_queued alternative: h_nr_queued =3D=3D 2, nr_pref(queued) =3D=3D 1 =
=E2=86=92 not equal =E2=86=92 alb_break_llc() false =E2=86=92 proceed to ac=
tive balance,=C2=A0
  which would then break T1's locality to relieve an "imbalance"
  that is really just a sleeping T2.


> Suppose there are 3 queued tasks: p1 and p2 prefer the src_rq, while p3 i=
s a delayed
> task that also prefers src_rq. In the current implementation, nr_pref_llc=
_running is 3
> and h_nr_runnable is 2, so alb_break_llc() might return false. As a resul=
t, active load
> balance would be triggered, and p1 or p2 might be migrated away, which is=
 undesirable.
> However, would this still be a problem after Lu Wang's active load balanc=
e guard patch
> has been applied?
> https://lore.kernel.org/lkml/20260903020656.3793626-1-wanglu.priv@gmail.c=
om/

Lu Wang's patch only mitigate the migrate_llc case but not other migration =
reasons.
We shouldn't have done active balance in the example I gave if we are doing
migration for other non migrate_llc reasons.

Tim

>=20
> thanks,
> Chenyu
