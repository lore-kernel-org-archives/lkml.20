Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEDE4CB8B8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 21:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788471029; cv=none; b=lZ4FX7FmwuqwCD3FNq8eAvhp1A4s8YChPOIMpqcV/LM7whHWtznaU05MzRPGNaC7xgU2iN4bUhPfpenPSzQFIZl0L6CJvIea5LSE7RRa/l6vnDHx63DNzTJknIyE6sDY/yb2cZ4Aw47CY0Rkz66MxNO4uZVt41loVPndCZYjcFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788471029; c=relaxed/simple;
	bh=LCs/WS/iwpCl3dwgor+VyiwmaUBucGq3PGFpTOBvfGQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N3e0EnVlALg7U02+b28As2zKwrraGxYAuIH1Yx3RwaC26oS77GytopdA0sczeXtC1yeV8z3uQBsoq3RWb33QewUwT1iSD9QJr309YTSn6g/rZtvfiMW0hH2lqDq7+1ckjeiaaosHTgHI6g/b81hT/jeMsLkhmbRS7oLjZ/D2e34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U8Yk9fJF; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U8Yk9fJF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788471027; x=1820007027;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=LCs/WS/iwpCl3dwgor+VyiwmaUBucGq3PGFpTOBvfGQ=;
  b=U8Yk9fJFl/GNXnXkVNFz0DpouZ3YgzEBmCqAlpKQs4NYHgIGOWusREei
   CLLgy8Xvcvq3lWkcDx+L5nFHqRjULLbl05O2GTPtFzpjQI7DhPlf2Mcaw
   4c182fLsXk3TKcUtl38B+tpwrKj6cZi5ZcFN6AbISocqWZ0LyJcPcY+US
   ElN5MRk6mmNfC/P5RlQVxt7LMbb313ffVDK0oW6szPTgvtAT4A1MUmyIY
   w3aaQr1FhARUAi4LCaaQdU8HHNWOqiyRwv8EQARnIg5KOcUIIkTq5Jw0t
   VzsNfygj1h/DYqFo14DaL5E7Uf4OZudJi7HJWQTGQjql0AhUnuZmhGlKF
   w==;
X-CSE-ConnectionGUID: TH8VxypAQEyeP4maprCzMw==
X-CSE-MsgGUID: fMal2UquRBKu5K5a90lCpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="87907384"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="87907384"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 14:30:26 -0700
X-CSE-ConnectionGUID: ymqbGoxDQ4eejM0mlLQprA==
X-CSE-MsgGUID: p3dSVGSuQdqnUWgDhpi1GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="293365284"
Received: from unknown (HELO [10.241.243.185]) ([10.241.243.185])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 14:30:26 -0700
Message-ID: <08f682ba75a4700694d6f94719b367b4d26c032f.camel@linux.intel.com>
Subject: Re: [PATCH v2 1/2] sched/numa: Drive NUMA task tick from execution
 context
From: Tim Chen <tim.c.chen@linux.intel.com>
To: "Chen, Yu C" <yu.c.chen@intel.com>, Hui Su <sh_def@163.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>, Juri Lelli
 <juri.lelli@redhat.com>,  Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Valentin Schneider	
 <vschneid@redhat.com>, John Stultz <jstultz@google.com>, Ingo Molnar	
 <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, "chen.yu@linux.dev" <chen.yu@linux.dev>
Date: Thu, 03 Sep 2026 14:30:25 -0700
In-Reply-To: <4593a7a4-cde1-499c-bba8-2fbe24f35422@intel.com>
References: <20260903041154.2479761-1-sh_def@163.com>
	 <20260903041154.2479761-2-sh_def@163.com>
	 <4593a7a4-cde1-499c-bba8-2fbe24f35422@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-09-03 at 20:41 +0800, Chen, Yu C wrote:
> Hi Su,
>=20
> On 9/3/2026 12:11 PM, Hui Su wrote:
> > Proxy execution separates the scheduling context in rq->donor from the
> > execution context in rq->curr. sched_tick() invokes task_tick() for the
> > donor's scheduling class.
> >=20
> > task_tick_numa() is currently called from task_tick_fair(). This works
> > when the donor is a fair task, but not when a fair task executes on
> > behalf of an RT or deadline donor. In that case the donor's task_tick()
> > still updates the execution task's sum_exec_runtime through
> > update_curr_common(), but task_tick_fair() is not invoked and NUMA scan
> > work for the execution task is not driven.
>=20
> Thanks for bringing this up. Previously Prateek has suggested to fix the=
=20
> rq->donor
> issue [1] and unfortunately I missed the task_tick_cache() part.
>=20
> Regarding above line in the commit log, although I agree that=20
> task_tick_numa()
> should be moved one level up, I did not quite get the reason why=20
> sum_exec_runtime
> is mentioned here, could you please elaborate a little more?
> I guess what you mean is that, in task_tick_numa(), the=20
> curr->se.sum_exec_runtime
> is used to check if there is a timeout to launch the task_numa_work(), so
> curr->se.sum_exec_runtime has to be up-to-date. With proxy execution, the
> se.sum_exec_runtime is only accumulated in rq->curr rather than rq->donor=
,
> so passing a "paused" rq->donor.sum_exec_runtime to task_tick_numa() is
> inaccurate?
>=20
> But I also see that in task_tick_core(), the sum_exec_runtime is also=20
> leveraged
> to calculate the delta "wall time" via __entity_slice_used():
> se->sum_exec_runtime - se->prev_sum_exec_runtime
> does it mean task_tick_core() also needs to be bring one level up to=20
> sched_tick()
> and passed with rq->curr?

I think task_tick_core() needs to stay with the donor's context
as it is the scheduling context.

task_tick_core() is not about the execution context --=C2=A0
it decides whether the current scheduling context has used
up enough of its slice to let a force-idled SMT sibling run. That
slice belongs to the donor, so the donor is the right task to pass.

There is a separate issue lurking here, task_tick_core() measures consumed =
slice as
se->sum_exec_runtime - se->prev_sum_exec_runtime. Under proxy the
donor's sum_exec_runtime does not advance (update_se() charges the
runtime to rq->curr instead), so that delta stays near zero and the
force-idle resched may never trigger.=C2=A0

Passing rq->curr does not fix it either. __entity_slice_used() takes
the runtime and the slice from the same entity, so passing rq->curr
just compares the running task against its own slice. But this check
is about the donor: it asks whether the scheduling context that owns
the CPU has used up its slice. The running task is only borrowing the
CPU through proxy, so its slice is not the one we care about here.

Maybe something like below (only compile tested) to fix the issue.
That said, this is somewhat orthogonal to the issue that the execution cont=
ext
series is trying to solve. It should be fixed separately.

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 8dff37059faf..cd240bf52d03 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -14748,10 +14748,29 @@ static void rq_offline_fair(struct rq *rq)
 static inline bool
 __entity_slice_used(struct sched_entity *se, int min_nr_tasks)
 {
-	u64 rtime =3D se->sum_exec_runtime - se->prev_sum_exec_runtime;
-	u64 slice =3D se->slice;
+	u64 vslice, vused;
=20
-	return (rtime * min_nr_tasks > slice);
+	/*
+	 * @se is the scheduling context (rq->donor). Under proxy execution
+	 * it need not be the task executing on the CPU, so its
+	 * sum_exec_runtime is not advanced and cannot be used to tell how
+	 * much of its slice it has consumed. Its vruntime, however, is
+	 * advanced by update_curr() with the proxy runtime, and its EEVDF
+	 * deadline reflects the granted slice, so measure the consumed
+	 * fraction in virtual time instead.
+	 *
+	 * This is equivalent to the previous real-time comparison in the
+	 * non-proxy case: both @vused and @vslice are scaled by the same
+	 * weight factor, so the ratio (and thus the min_nr_tasks test) is
+	 * unchanged.
+	 */
+	if (vruntime_cmp(se->vruntime, ">=3D", se->deadline))
+		return true;
+
+	vslice =3D calc_delta_fair(se->slice, se);
+	vused =3D vslice - (se->deadline - se->vruntime);
+
+	return (vused * min_nr_tasks > vslice);
 }
=20
 #define MIN_NR_TASKS_DURING_FORCEIDLE	2

>=20
> On the other hand, as Prateek mentioned in [1], it seems that=20
> sum_exec_runtime
> might not the reason for passing rq->curr, but it could be:
> "with "rq->curr->mm" being the one that is being used on CPU",
> both sched_cache and NUMA balance fit Prateek's conclusion.

I agree with you on this.

Thanks.

Tim
