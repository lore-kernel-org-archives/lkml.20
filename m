Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991F42F25E4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 20:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788553467; cv=none; b=gBZL7V+x5uFIAcEpikSnk8txp1tzf8IZmntOHHr3zkEfRKhSJUoTDqd6x+DRG1jNbnRTF+VeWy3GDi/TAWX2uuSXEQANTRLJiuslRt/h582RZ7Iy86pIYSImgXXH0wZgH4KIQtKz09aG812GZjww849xKn5l/dsP/VQs7VbJa7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788553467; c=relaxed/simple;
	bh=LcTFM5IYU3ra6J5gcCu5Mo7K1uFYEyNrCEwXt7ie2O4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LvFrgM1Grn+kw1O0sIhVztGQbfcQ+hGIuujVyXKtY7Y6aUhAu7yk1pFKKkNtCqjloxkMj1AIfkV46p+qLibtZMGWR9RxGjd4jvr4WeQiDfZUkPGDGzvkQ5Drz1q3aAtLNi+kh7ZHWkj0MsJELt3HCBOMBSI4SYlgeh2qJ+TzvIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JX+ZJ3mc; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JX+ZJ3mc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788553464; x=1820089464;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=LcTFM5IYU3ra6J5gcCu5Mo7K1uFYEyNrCEwXt7ie2O4=;
  b=JX+ZJ3mcTeyJQWxAViCA3FMBKGFeAzF67SVNyboW33a4+uA21lM7ZJ3l
   MUFAYfJVy/Fp10nFngu7pNzOrIprHYHvD6EYOrE1LaEe2RDc1pZLEJFUK
   x+3siuCiLoPSKQppJtdJgPFQufMoWMzpveslElBTWCXZHoKYzc9D5ZGZ9
   NtpqnhDNVKJAN7SLkhR9go9uD0RkfhzbDeiKYkXrRzmiRVdDNx/MuxDAf
   sGnyNI/AuCKCzF0RMfc8MoiEwnEGCvqGjadTwvhXDmNHexSSwS73CzPjd
   9TRh+AzSfKcRJ3aPwGxG+xyMhlK4f7ngkg2ejr0nxNUngd4nql5pVmjbU
   w==;
X-CSE-ConnectionGUID: UOr5BXpyTLCMgTsXH2TyWA==
X-CSE-MsgGUID: tOyfPRSARo6kEDEiwtU1sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89094285"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="89094285"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 13:24:22 -0700
X-CSE-ConnectionGUID: 2URm3n/MSc2NIi8fuqnWfw==
X-CSE-MsgGUID: wuF9o97VSFuU7ONprwCHrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="295012439"
Received: from schen9-mobl4.amr.corp.intel.com (HELO [10.125.111.11]) ([10.125.111.11])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 13:24:22 -0700
Message-ID: <2addce151853395f10ea3a3fda8188776dc1c15a.camel@linux.intel.com>
Subject: Re: [PATCH v2 1/2] sched/numa: Drive NUMA task tick from execution
 context
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Chen Yu <yu.c.chen@intel.com>
Cc: Hui Su <sh_def@163.com>, K Prateek Nayak <kprateek.nayak@amd.com>, Juri
 Lelli <juri.lelli@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Dietmar Eggemann	 <dietmar.eggemann@arm.com>,
 Valentin Schneider <vschneid@redhat.com>, John Stultz <jstultz@google.com>,
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, "chen.yu@linux.dev" <chen.yu@linux.dev>
Date: Fri, 04 Sep 2026 13:24:22 -0700
In-Reply-To: <aprtc9-xD2qCZeW0@fengwei-dev>
References: <20260903041154.2479761-1-sh_def@163.com>
	 <20260903041154.2479761-2-sh_def@163.com>
	 <4593a7a4-cde1-499c-bba8-2fbe24f35422@intel.com>
	 <08f682ba75a4700694d6f94719b367b4d26c032f.camel@linux.intel.com>
	 <aprtc9-xD2qCZeW0@fengwei-dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2026-09-05 at 00:10 +0800, Chen Yu wrote:
> On Thu, Sep 03, 2026 at 02:30:25PM -0700, Tim Chen wrote:
> > On Thu, 2026-09-03 at 20:41 +0800, Chen, Yu C wrote:
>=20
> [ ... ]
>=20
> > > But I also see that in task_tick_core(), the sum_exec_runtime is also=
=20
> > > leveraged
> > > to calculate the delta "wall time" via __entity_slice_used():
> > > se->sum_exec_runtime - se->prev_sum_exec_runtime
> > > does it mean task_tick_core() also needs to be bring one level up to=
=20
> > > sched_tick()
> > > and passed with rq->curr?
> >=20
> > I think task_tick_core() needs to stay with the donor's context
> > as it is the scheduling context.
> >=20
> > task_tick_core() is not about the execution context --=C2=A0
> > it decides whether the current scheduling context has used
> > up enough of its slice to let a force-idled SMT sibling run. That
> > slice belongs to the donor, so the donor is the right task to pass.
> >=20
> > There is a separate issue lurking here, task_tick_core() measures consu=
med slice as
> > se->sum_exec_runtime - se->prev_sum_exec_runtime. Under proxy the
> > donor's sum_exec_runtime does not advance (update_se() charges the
> > runtime to rq->curr instead), so that delta stays near zero and the
> > force-idle resched may never trigger.=C2=A0
> >=20
> > Passing rq->curr does not fix it either. __entity_slice_used() takes
> > the runtime and the slice from the same entity, so passing rq->curr
> > just compares the running task against its own slice. But this check
> > is about the donor: it asks whether the scheduling context that owns
> > the CPU has used up its slice. The running task is only borrowing the
> > CPU through proxy, so its slice is not the one we care about here.
> >=20
>=20
> Got it, I see.
>=20
> > Maybe something like below (only compile tested) to fix the issue.
> > That said, this is somewhat orthogonal to the issue that the execution =
context
> > series is trying to solve. It should be fixed separately.
> >=20
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 8dff37059faf..cd240bf52d03 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -14748,10 +14748,29 @@ static void rq_offline_fair(struct rq *rq)
> >  static inline bool
> >  __entity_slice_used(struct sched_entity *se, int min_nr_tasks)
> >  {
> > -	u64 rtime =3D se->sum_exec_runtime - se->prev_sum_exec_runtime;
> > -	u64 slice =3D se->slice;
> > +	u64 vslice, vused;
> > =20
> > -	return (rtime * min_nr_tasks > slice);
> > +	/*
> > +	 * @se is the scheduling context (rq->donor). Under proxy execution
> > +	 * it need not be the task executing on the CPU, so its
> > +	 * sum_exec_runtime is not advanced and cannot be used to tell how
> > +	 * much of its slice it has consumed. Its vruntime, however, is
> > +	 * advanced by update_curr() with the proxy runtime, and its EEVDF
> > +	 * deadline reflects the granted slice, so measure the consumed
> > +	 * fraction in virtual time instead.
> > +	 *
> > +	 * This is equivalent to the previous real-time comparison in the
> > +	 * non-proxy case: both @vused and @vslice are scaled by the same
> > +	 * weight factor, so the ratio (and thus the min_nr_tasks test) is
> > +	 * unchanged.
> > +	 */
> > +	if (vruntime_cmp(se->vruntime, ">=3D", se->deadline))
> > +		return true;
> > +
> > +	vslice =3D calc_delta_fair(se->slice, se);
> > +	vused =3D vslice - (se->deadline - se->vruntime);
> > +
> > +	return (vused * min_nr_tasks > vslice);
> >  }
>=20
> This fix looks good to me. And just one minor question that I'm
> trying to figure out:
>=20
> Consider that there is only one running task p on one of the SMT siblings=
.
> The original comparison is between:
> se->sum_exec_runtime - se->prev_sum_exec_runtime vs slice,
> and since there is only one runnable task, p continues to run
> without any preemption, so se->prev_sum_exec_runtime remains
> unchanged, while se->sum_exec_runtime moves forward. Therefore,
> the duration delta of se->sum_exec_runtime - se->prev_sum_exec_runtime
> could expand to many slices in theory.
> After switching to the vruntime-based comparison, even
> if p has not been preempted, se->deadline together with se->vruntime
> will move forward by update_dealine(). That is to say, we now only
> consider the delta within one slice.=C2=A0
>=20

You raised a good point. And coupled with Hui's comment make me realize
that the deadline advancement in each slice means that I am only checking
whether I am using up my quota in the current slice.

I should check the run time since the task was picked to run to
see if the donor has exceeded its allotment if it keeps running
across slices in the lone task case.

I replied to Hui's email with a new proposal.

Tim

> This seems to tighten the
> restriction for task_tick_core() to trigger a force reschedule.
> But Overall I think it should not be a good deal to check
> within a slice period.
>=20
> thanks,
> Chenyu
