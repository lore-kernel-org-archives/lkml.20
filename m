Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DE23264DA
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883287; cv=none; b=V9f0EBc4e2vmfjpGcreuN3E/dW1hPtWVc1fo6LY5q7vK9M9YFIIpeLHdltCzIKJfA5BkTW0ykatucKQxBkKH4EMAqj9nt1M8imQiS2t1vhblZAn4OeRNBwvMaPfdghyREb7BGaopFXVvAXpXKvxgeQ/S5GPdhRJaMR+L1t59R6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883287; c=relaxed/simple;
	bh=RLvQyx4EI9iD+rWQkMKp4in9i/cOvdHXvZMV3pU4frA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vvqhd0wAcWn6i4lnqRHvYD0D/EmKXT1p+sXGhchjnsjItDtD1RlTzA+o45ZMlVIsPP81q1uhIKOMpG0xUIkIg9S/pM8yZi3h9kS62WWkaycDDDilDYMgkb2NGgdeQdtfRDVnR+X3kxVD0LvP2XdwGZIOGuzF1BjWhGRdpU3leWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N7Lx2hqr; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N7Lx2hqr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788883286; x=1820419286;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=RLvQyx4EI9iD+rWQkMKp4in9i/cOvdHXvZMV3pU4frA=;
  b=N7Lx2hqr7IAmjzYkKgW7oc9R8mNWwj3rUc/pARBJjijT/6X4I+pMbMdf
   nVIyg9O9WdPefcPBaz+7Rg2dHexHQ/JAVlxP8J4888l0FcnA5v++e/ghl
   Z37Mt5QRvR4p2tA6M5wVkO2oHQUmCSpPrSHdEZ6DX2C4IaESFiab3qIMU
   h8RPjewexZ8bdFh1B4VnmbA9bZCoUwoaDjSPKk5qGiO2WAhA4vCLYU5S2
   dy+yMqYUds275VH/qo8jgmtwPeW90xFcxMaxYfxc6Z2l1kYcM88DfhDvy
   jCYmlW66dQ5HcY9kRjT0bgqQs+4ACJnuuqCVP0GCqTN/gkkMp523v4ObJ
   w==;
X-CSE-ConnectionGUID: Xop/YXrTTtyLMthr1bdiLw==
X-CSE-MsgGUID: YOf0QC2AQyaJEVktgU4SZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="88442628"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="88442628"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 09:01:25 -0700
X-CSE-ConnectionGUID: k8E/yl+NTaOd/Ha2JOroWw==
X-CSE-MsgGUID: BlkxKaJ/RAKqWw4fcn3AiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="272986375"
Received: from schen9-mobl4.amr.corp.intel.com (HELO [10.125.111.100]) ([10.125.111.100])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 09:01:16 -0700
Message-ID: <e91848b651fbe163676813fffff76970d6895cf9.camel@linux.intel.com>
Subject: Re: [PATCH v2 1/2] sched/numa: Drive NUMA task tick from execution
 context
From: Tim Chen <tim.c.chen@linux.intel.com>
To: "Chen, Yu C" <yu.c.chen@intel.com>, Hui Su <sh_def@163.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>, Juri Lelli
 <juri.lelli@redhat.com>,  Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Valentin Schneider	
 <vschneid@redhat.com>, John Stultz <jstultz@google.com>, Ingo Molnar	
 <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org
Date: Tue, 08 Sep 2026 09:01:16 -0700
In-Reply-To: <57833d3b-bf10-42b9-ae28-82d65a22a6af@intel.com>
References: <20260903041154.2479761-1-sh_def@163.com>
	 <20260903041154.2479761-2-sh_def@163.com>
	 <4593a7a4-cde1-499c-bba8-2fbe24f35422@intel.com>
	 <08f682ba75a4700694d6f94719b367b4d26c032f.camel@linux.intel.com>
	 <20260904141017.1512404-1-sh_def@163.com>
	 <0d6117e597e6ca3ab3179c6304d6e5e454f53759.camel@linux.intel.com>
	 <20260905135843.2818510-1-sh_def@163.com>
	 <57833d3b-bf10-42b9-ae28-82d65a22a6af@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-09-08 at 13:38 +0800, Chen, Yu C wrote:
> On 9/5/2026 9:58 PM, Hui Su wrote:
> > On Fri, Sep 4, 2026 at 1:15 PM, Tim Chen wrote:
> > > Yes, you have a good point. The code I proposed just look at whether
> > > we have consumed our allotment in the current slice.
> > >=20
> > > What we should have looked at is whether the donor's total run time h=
as
> > > exceeded its quota when doing core scheduling. And we may happen to
> > > hit __entity_slice_used() at the front of the slice after advancing
> > > the deadline and __entity_slice_used()
> > > returns false instead of true, even though I have consumed more than
> > > my fair share when looking at longer time period across multiple slic=
es.
> > >=20
> > > The accumulated run time of the donor since it was picked for running
> > > should be used for selection time baseline.
> > >=20
> > > So maybe a patch like the following instead.
> >=20
>=20
> [ ... ]
>=20
> >=20
> > In this example reweight_eevdf() did not change se->vruntime, so the
> > divergence does not depend on a vruntime coordinate adjustment. The
> > weight change alone is enough for the accumulated vused and the
> > current-weight vslice to no longer necessarily use the same scale.
> >=20
>=20
> Makes sense. In the current kernel with a flat cgroup(commit 85570f10a4c6
> ("sched/eevdf: Move to a single runqueue")), task_tick_fair()
> tries to re-calculate the task's h_load.weight - if the cgroup changes
> its share at runtime, the task se's h_load.weight changes accordingly.
> Thus comparing the delta derived from the snapshot vruntime and the
> slice using the latest weight is unreliable. (While before the flat cgrou=
p
> was introduced, a task's se->load.weight will not be re-evaluated during=
=20
> the tick, even if the cgroup changes its share at runtime.
> > diff --git a/include/linux/sched.h b/include/linux/sched.h
> > index 8b3d47a325cc..c32d9931129f 100644
> > --- a/include/linux/sched.h
> > +++ b/include/linux/sched.h
> > @@ -590,6 +590,9 @@ struct sched_entity {
> >   	u64				sum_exec_runtime;
> >   	u64				prev_sum_exec_runtime;
> >   	u64				vruntime;
> > +#ifdef CONFIG_SCHED_CORE
> > +	u64				core_sched_start;
> > +#endif
> >   	/* Approximated virtual lag: */
> >   	s64				vlag;
> >   	/* 'Protected' deadline, to give out minimum quantums: */
> > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > index f78275192036..22ae5dc57337 100644
> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -4580,6 +4580,9 @@ static void __sched_fork(u64 clone_flags, struct =
task_struct *p)
> >   	p->se.prev_sum_exec_runtime	=3D 0;
> >   	p->se.nr_migrations		=3D 0;
> >   	p->se.vruntime			=3D 0;
> > +#ifdef CONFIG_SCHED_CORE
> > +	p->se.core_sched_start		=3D 0;
> > +#endif
> >   	p->se.vlag			=3D 0;
> >   	p->se.rel_deadline		=3D 0;
> >   	INIT_LIST_HEAD(&p->se.group_node);
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 8dff37059faf..1bd05c906d3a 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -6502,6 +6502,9 @@ set_next_entity(struct cfs_rq *cfs_rq, struct sch=
ed_entity *se)
> >   	}
> >  =20
> >   	se->prev_sum_exec_runtime =3D se->sum_exec_runtime;
> > +#ifdef CONFIG_SCHED_CORE
> > +	se->core_sched_start =3D se->exec_start;
>=20
> if (entity_is_task(se)) ?
>=20
> > +#endif
> >   }
> >  =20
> >   static bool __dequeue_task(struct rq *rq, struct task_struct *p, int =
flags);
> > @@ -14748,10 +14751,9 @@ static void rq_offline_fair(struct rq *rq)
> >   static inline bool
> >   __entity_slice_used(struct sched_entity *se, int min_nr_tasks)
> >   {
> > -	u64 rtime =3D se->sum_exec_runtime - se->prev_sum_exec_runtime;
> > -	u64 slice =3D se->slice;
> > +	u64 rtime =3D se->exec_start - se->core_sched_start;
> >=20
> > -	return (rtime * min_nr_tasks > slice);
> > +	return (rtime * min_nr_tasks > se->slice);
> >   }
> >  =20
> >   #define MIN_NR_TASKS_DURING_FORCEIDLE	2
> >=20
> > The task-clock version has matched the existing predicate in the
> > non-proxy tests so far and fixes the proxy reproducer as well. I am
> > still validating reselection, migration, and the remaining proxy
> > boundary cases, so I have not posted either implementation.
> >=20
> > Do you think keeping the check in the original real-time/task-clock
> > domain is a reasonable direction here, or would you prefer preserving
> > the vruntime approach by carrying the accumulated service across
> > reweights?
> >=20
>=20
> I would vote for the real-time comparison. What do you think, Tim?
>=20

Agree, I think keeping the real-time comparison makes sense.


Tim
