Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA6852120D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 20:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788552924; cv=none; b=GEn93Yjo5kmzncBIOrMYUHSzG6QEWf0rO/3wlP2o2z/1RZJjII0srK1wOSqduzhhOE4NQYkAqHjUBWBh2j4PUPkTotfS+NLJ4p14AG/PU7E705KT/I0vQnkPwkiLgiYgUpWQ6mJhdWY4O+VaboqXdjz9DjucXHqe+JjYTpvHwSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788552924; c=relaxed/simple;
	bh=UqoD6C3p7qOmCDZjN4TxCLH47u7gKLb+82E7YLFInPw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Dy0YMxQxQthohXQ/55wAKp0vAZId7i/wuczY93GzB/3bcBFpJYyDCc+s3SwmyvzddDwEUaTPW5iwvZcrB9gedyKQ/+e8c/spqXJbOxCQawBCDScM4nlHLBmy39yvBD0Mu1BZ2+ihWfSRcbA0NMe3srqd+rTAvjeMJhPJg365q0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mLq7rwX7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mLq7rwX7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788552922; x=1820088922;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=UqoD6C3p7qOmCDZjN4TxCLH47u7gKLb+82E7YLFInPw=;
  b=mLq7rwX7QU0PFkLXA35avnaafX1bWIdHYn2FnbyZS3v31fjnlNGXNcA7
   O2M3jBQ4Gp46mnP2QqRZ5s+sox9a5voTjZEZmXEyq/zJ8nyW33egiuCCo
   o2mxdFKNOtR79zQPnYFYtI+nsg8ePRZ5vzs25Q4vvBexznGWVlzye2J9p
   li1WJrSLcWpRneORKrSb34+QVawDFarAFotzX3mITN3b4HSXoelBMLHJZ
   dprfOk3kQcb3uDbGOyAU5w7mHAt8lQfNQwR1X/CyS4dRjWxeQZrMtTjx8
   hkNMxCmO2fy++bUTbJGyTqmBJso+bec6Mn6FHHxwiNU7NQ28xujEJroJB
   g==;
X-CSE-ConnectionGUID: wjL9IfmOSEGL7UfMT3KtsQ==
X-CSE-MsgGUID: pqYUCIeJSTa+TGsDZ+jyEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="88824897"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="88824897"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 13:15:22 -0700
X-CSE-ConnectionGUID: SuK8zXpxRCam2aTNBAUinA==
X-CSE-MsgGUID: 5OocnIOGTlGF2qpG9FRO0g==
X-ExtLoop1: 1
Received: from schen9-mobl4.amr.corp.intel.com (HELO [10.125.111.11]) ([10.125.111.11])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 13:15:21 -0700
Message-ID: <0d6117e597e6ca3ab3179c6304d6e5e454f53759.camel@linux.intel.com>
Subject: Re: [PATCH v2 1/2] sched/numa: Drive NUMA task tick from execution
 context
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Hui Su <sh_def@163.com>, "Chen, Yu C" <yu.c.chen@intel.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>, Juri Lelli
 <juri.lelli@redhat.com>,  Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Valentin Schneider	
 <vschneid@redhat.com>, John Stultz <jstultz@google.com>, Ingo Molnar	
 <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org
Date: Fri, 04 Sep 2026 13:15:21 -0700
In-Reply-To: <20260904141017.1512404-1-sh_def@163.com>
References: <20260903041154.2479761-1-sh_def@163.com>
		 <20260903041154.2479761-2-sh_def@163.com>
		 <4593a7a4-cde1-499c-bba8-2fbe24f35422@intel.com>
		 <08f682ba75a4700694d6f94719b367b4d26c032f.camel@linux.intel.com>
	 <20260904141017.1512404-1-sh_def@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-09-04 at 22:10 +0800, Hui Su wrote:

[...]
>=20
> Hi Tim, Chen Yu,
>=20
> Thanks for pointing out this separate issue and for the prototype.
>=20
> I tested the deadline-based calculation from the prototype with the
> same proxy-execution and core-scheduling reproducer. The reproducer has
> a FAIR donor proxy-executing a task on an SMT CPU while the sibling is
> force-idled.
>=20
> The relevant ordering in the current code is:
>=20
>         update_curr()
>                 -> vruntime +=3D delta
>                 -> update_deadline()
>         ...
>         task_tick_core()
>=20
> When update_deadline() advances the deadline before
> __entity_slice_used() is called, the prototype observes the newly
> advanced deadline. Since the new deadline is based on the current
> vruntime plus a new virtual slice, deadline - vruntime is reset to
> approximately vslice. Consequently, the reconstructed vused becomes
> small even though the donor has consumed scheduling service since it was
> selected.

Yes, you have a good point. The code I proposed just look at whether
we have consumed our allotment in the current slice.

What we should have looked at is whether the donor's total run time has
exceeded its quota when doing core scheduling.  And we may happen to
hit __entity_slice_used() at the front of the slice after advancing
the deadline and __entity_slice_used()
returns false instead of true, even though I have consumed more than
my fair share when looking at longer time period across multiple slices.

This breaks the lone task case that Chen Yu has raised as it could
just keep running as __entity_slice_used() returns false.

>=20
> In the CONFIG_HZ=3D1000, nice-0 run, instrumentation showed:
>=20
>         existing runtime delta =3D=3D 0
>         vslice                 =3D=3D 2100000
>         reconstructed vused in the tens or hundreds of thousands
>         used                   =3D=3D 0
>=20
> For comparison, I tested a selection-time vruntime snapshot:
>=20
>         set_next_entity():
>                 core_prev_vruntime =3D se->vruntime;
>=20
>         __entity_slice_used():
>                 vused =3D se->vruntime - se->core_prev_vruntime;
>=20
> I then repeated the test with CONFIG_HZ=3D1000, 250 and 100, and also
> with a nice -10 FAIR donor at HZ=3D250 and HZ=3D100.
>=20
> For the counts below I only included ticks where rq->donor !=3D rq->curr,
> core force-idle was active, rq->cfs.h_nr_queued =3D=3D 1, and the donor's
> existing runtime delta =3D=3D 0.
>=20
> The observed behavior was consistent across these runs:
>=20
>         configuration           deadline prototype   vruntime snapshot
>         HZ=3D1000, nice 0            10/10 used=3D0       8/8 used=3D1
>         HZ=3D250,  nice 0            10/10 used=3D0       6/6 used=3D1
>         HZ=3D100,  nice 0            14/14 used=3D0      16/16 used=3D1
>         HZ=3D250,  nice -10          30/30 used=3D0       6/6 used=3D1
>         HZ=3D100,  nice -10          15/15 used=3D0      17/17 used=3D1
>=20
> The number of ticks in each window is timing-dependent and can change
> when a successful slice check triggers rescheduling. The comparison
> above is based on the per-tick result, rather than on equal window
> lengths.
>=20
> I also compared the existing runtime-based predicate with the snapshot
> predicate on the non-proxy path. In a CONFIG_HZ=3D1000 run, the decisions
> matched for all 83 observed force-idle ticks with rq->donor =3D=3D rq->cu=
rr.
> For all 177 matching proxy ticks in the same run, the existing predicate
> was false while the snapshot predicate was true.
>=20
> In these runs, the snapshot version tracked the donor's vruntime
> progress across deadline rollovers and triggered the force-idle
> reschedule. It returned used =3D=3D 1 for every matching tick observed in
> the proxy windows listed above. This also matches the previous
> sum_exec_runtime - prev_sum_exec_runtime semantics more closely: the
> measurement starts when the scheduling context is selected and is not
> tied to the current EEVDF request after a deadline rollover.
>=20
> These tests suggest that reconstructing the consumed service from the
> current deadline may lose the original selection-time semantics across
> a deadline rollover. The virtual-time direction still looks
> appropriate, while the consumed service appears to need a
> selection-time baseline rather than being reconstructed from a
> deadline that update_deadline() may already have advanced.

The accumulated run time of the donor since it was picked for running
should be used for selection time baseline.

So maybe a patch like the following instead.

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 8b3d47a325cc..bf105f436808 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -590,6 +590,10 @@ struct sched_entity {
 	u64				sum_exec_runtime;
 	u64				prev_sum_exec_runtime;
 	u64				vruntime;
+#ifdef CONFIG_SCHED_CORE
+	/* vruntime at the last pick, for the force-idle slice check: */
+	u64				core_slice_vruntime;
+#endif
 	/* Approximated virtual lag: */
 	s64				vlag;
 	/* 'Protected' deadline, to give out minimum quantums: */
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index f78275192036..dde1f45051e3 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4580,6 +4580,9 @@ static void __sched_fork(u64 clone_flags, struct task=
_struct *p)
 	p->se.prev_sum_exec_runtime	=3D 0;
 	p->se.nr_migrations		=3D 0;
 	p->se.vruntime			=3D 0;
+#ifdef CONFIG_SCHED_CORE
+	p->se.core_slice_vruntime	=3D 0;
+#endif
 	p->se.vlag			=3D 0;
 	p->se.rel_deadline		=3D 0;
 	INIT_LIST_HEAD(&p->se.group_node);
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 8dff37059faf..ee06ee62e8dc 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -6502,6 +6502,9 @@ set_next_entity(struct cfs_rq *cfs_rq, struct sched_e=
ntity *se)
 	}
=20
 	se->prev_sum_exec_runtime =3D se->sum_exec_runtime;
+#ifdef CONFIG_SCHED_CORE
+	se->core_slice_vruntime =3D se->vruntime;
+#endif
 }
=20
 static bool __dequeue_task(struct rq *rq, struct task_struct *p, int flags=
);
@@ -14748,10 +14751,21 @@ static void rq_offline_fair(struct rq *rq)
 static inline bool
 __entity_slice_used(struct sched_entity *se, int min_nr_tasks)
 {
-	u64 rtime =3D se->sum_exec_runtime - se->prev_sum_exec_runtime;
-	u64 slice =3D se->slice;
+	u64 vused, vslice;
+
+	/*
+	 * @se is the scheduling context (rq->donor), which under proxy
+	 * execution may not be the running task; its sum_exec_runtime is then
+	 * not advanced. Use vruntime instead -- update_curr() advances it with
+	 * the proxy runtime -- measured from a baseline taken at pick time in
+	 * set_next_entity(). Being pick-based rather than per-slice, it stays
+	 * correct when the tick period exceeds the slice, and matches the old
+	 * rtime/slice test in the non-proxy case (same weight scaling).
+	 */
+	vused =3D se->vruntime - se->core_slice_vruntime;
+	vslice =3D calc_delta_fair(se->slice, se);
=20
-	return (rtime * min_nr_tasks > slice);
+	return (vused * min_nr_tasks > vslice);
 }
=20
 #define MIN_NR_TASKS_DURING_FORCEIDLE	2

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935

>=20
> I am keeping this as a separate patch from the execution-context tick
> series. I will continue validating the snapshot approach with
> fair-group scheduling before posting it.


Tim

>=20
> Thanks,
> Hui
>=20
