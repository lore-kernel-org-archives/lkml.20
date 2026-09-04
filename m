Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE464A8FEA
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788531102; cv=none; b=SN9D5z9O86pyNfGSdXAbwSxVgQbZtkPRkNgJjEfTamNmJfYRWcv6hA0JBh6U9qDVC4bEyNxC7D5RZZY06pEBb2yNuvxl4CAEMalU3ROrr5dNazXtIbr5eTsWOeOq37tYeBRO/SbgJaAh0cPvvqYq5lHvZuULuZJ65A5CMcO1K9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788531102; c=relaxed/simple;
	bh=9Nm2pq+DuNB3kYHi1tRHDZH5RmtGnjGgbmVJxTMZxX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MgN87tCR5hand2m7KprNUPPAWREB7PZLtroQ6+v0f7ePgPnhHxisHio0ANTpW8pxyIZ7cs0f9s+0W4rbIbfWDbnInQ+Nz+Jg+iM54+wxy2tgOrVFUuD2lOHdpnndA/NrZUKzBjnDSJ2hBz2cqOreN2+No4buZBQ4enYFwMd7Ro4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=cz12ZThf; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="cz12ZThf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=paOcrSfwidWruSN9p++6/CYQwJGAumq3f9YCIvoMbww=;
	b=cz12ZThfVj6qXYZQ//zrWp0svv7WGYUsg86qosFDnGn2HMyQsFRNTwx496BAmS
	Dbq3ZIJvpc5P9+9OxxDwaHsiGiFcvM88ftg/XPZ1hrtV2HzQKY+DGZnrTbbi0iak
	0CtPoiTLrDayw2H676fpV6Lay6Mh6pfc/BYRpdux3Tky4=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDnL8pJ0ZpqrT2lAg--.46599S2;
	Fri, 04 Sep 2026 22:10:18 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: Tim Chen <tim.c.chen@linux.intel.com>,
	"Chen, Yu C" <yu.c.chen@intel.com>
Cc: Hui Su <sh_def@163.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	John Stultz <jstultz@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] sched/numa: Drive NUMA task tick from execution context
Date: Fri,  4 Sep 2026 22:10:17 +0800
Message-ID: <20260904141017.1512404-1-sh_def@163.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <08f682ba75a4700694d6f94719b367b4d26c032f.camel@linux.intel.com>
References: <20260903041154.2479761-1-sh_def@163.com> <20260903041154.2479761-2-sh_def@163.com> <4593a7a4-cde1-499c-bba8-2fbe24f35422@intel.com> <08f682ba75a4700694d6f94719b367b4d26c032f.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnL8pJ0ZpqrT2lAg--.46599S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3WF48CFWrZr4fKw17Jr1UJrb_yoW3ur1xpF
	Z09F12qrs7Ja45tr4DZwsxXa4S9393Aw1UWr4DK34kCr15Jw18tFWFqr4YvFWYvr1vkF1j
	vr40v3s7Gw4qy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUVT5dUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbCwQrHJ2qa0Urc4AAA38

On Thu, 2026-09-03 at 14:30 -0700, Tim Chen wrote:
> On Thu, 2026-09-03 at 20:41 +0800, Chen, Yu C wrote:
> > Hi Su,
> >
> > On 9/3/2026 12:11 PM, Hui Su wrote:
> > > Proxy execution separates the scheduling context in rq->donor from the
> > > execution context in rq->curr. sched_tick() invokes task_tick() for the
> > > donor's scheduling class.
> > >
> > > task_tick_numa() is currently called from task_tick_fair(). This works
> > > when the donor is a fair task, but not when a fair task executes on
> > > behalf of an RT or deadline donor. In that case the donor's task_tick()
> > > still updates the execution task's sum_exec_runtime through
> > > update_curr_common(), but task_tick_fair() is not invoked and NUMA scan
> > > work for the execution task is not driven.
> >
> > Thanks for bringing this up. Previously Prateek has suggested to fix the
> > rq->donor issue [1] and unfortunately I missed the task_tick_cache() part.
> >
> > Regarding above line in the commit log, although I agree that
> > task_tick_numa() should be moved one level up, I did not quite get the
> > reason why sum_exec_runtime is mentioned here, could you please elaborate
> > a little more?
> > I guess what you mean is that, in task_tick_numa(), the
> > curr->se.sum_exec_runtime is used to check if there is a timeout to launch
> > the task_numa_work(), so curr->se.sum_exec_runtime has to be up-to-date.
> > With proxy execution, the se.sum_exec_runtime is only accumulated in
> > rq->curr rather than rq->donor, so passing a "paused" rq->donor.sum_exec_runtime
> > to task_tick_numa() is inaccurate?
> >
> > But I also see that in task_tick_core(), the sum_exec_runtime is also
> > leveraged to calculate the delta "wall time" via __entity_slice_used():
> > se->sum_exec_runtime - se->prev_sum_exec_runtime
> > does it mean task_tick_core() also needs to be bring one level up to
> > sched_tick() and passed with rq->curr?
>
> I think task_tick_core() needs to stay with the donor's context
> as it is the scheduling context.
>
> task_tick_core() is not about the execution context --
> it decides whether the current scheduling context has used
> up enough of its slice to let a force-idled SMT sibling run. That
> slice belongs to the donor, so the donor is the right task to pass.
>
> There is a separate issue lurking here, task_tick_core() measures consumed slice as
> se->sum_exec_runtime - se->prev_sum_exec_runtime. Under proxy the
> donor's sum_exec_runtime does not advance (update_se() charges the
> runtime to rq->curr instead), so that delta stays near zero and the
> force-idle resched may never trigger.
>
> Passing rq->curr does not fix it either. __entity_slice_used() takes
> the runtime and the slice from the same entity, so passing rq->curr
> just compares the running task against its own slice. But this check
> is about the donor: it asks whether the scheduling context that owns
> the CPU has used up its slice. The running task is only borrowing the
> CPU through proxy, so its slice is not the one we care about here.
>
> Maybe something like below (only compile tested) to fix the issue.
> That said, this is somewhat orthogonal to the issue that the execution
> context series is trying to solve. It should be fixed separately.
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 8dff37059faf..cd240bf52d03 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -14748,10 +14748,29 @@ static void rq_offline_fair(struct rq *rq)
>  static inline bool
>  __entity_slice_used(struct sched_entity *se, int min_nr_tasks)
>  {
> -	u64 rtime = se->sum_exec_runtime - se->prev_sum_exec_runtime;
> -	u64 slice = se->slice;
> +	u64 vslice, vused;
> 
> -	return (rtime * min_nr_tasks > slice);
> +	/*
> +	 * @se is the scheduling context (rq->donor). Under proxy execution
> +	 * it need not be the task executing on the CPU, so its
> +	 * sum_exec_runtime is not advanced and cannot be used to tell how
> +	 * much of its slice it has consumed. Its vruntime, however, is
> +	 * advanced by update_curr() with the proxy runtime, and its EEVDF
> +	 * deadline reflects the granted slice, so measure the consumed
> +	 * fraction in virtual time instead.
> +	 *
> +	 * This is equivalent to the previous real-time comparison in the
> +	 * non-proxy case: both @vused and @vslice are scaled by the same
> +	 * weight factor, so the ratio (and thus the min_nr_tasks test) is
> +	 * unchanged.
> +	 */
> +	if (vruntime_cmp(se->vruntime, ">=", se->deadline))
> +		return true;
> +
> +	vslice = calc_delta_fair(se->slice, se);
> +	vused = vslice - (se->deadline - se->vruntime);
> +
> +	return (vused * min_nr_tasks > vslice);
>  }
>
> Thanks.
> Tim

Hi Tim, Chen Yu,

Thanks for pointing out this separate issue and for the prototype.

I tested the deadline-based calculation from the prototype with the
same proxy-execution and core-scheduling reproducer. The reproducer has
a FAIR donor proxy-executing a task on an SMT CPU while the sibling is
force-idled.

The relevant ordering in the current code is:

        update_curr()
                -> vruntime += delta
                -> update_deadline()
        ...
        task_tick_core()

When update_deadline() advances the deadline before
__entity_slice_used() is called, the prototype observes the newly
advanced deadline. Since the new deadline is based on the current
vruntime plus a new virtual slice, deadline - vruntime is reset to
approximately vslice. Consequently, the reconstructed vused becomes
small even though the donor has consumed scheduling service since it was
selected.

In the CONFIG_HZ=1000, nice-0 run, instrumentation showed:

        existing runtime delta == 0
        vslice                 == 2100000
        reconstructed vused in the tens or hundreds of thousands
        used                   == 0

For comparison, I tested a selection-time vruntime snapshot:

        set_next_entity():
                core_prev_vruntime = se->vruntime;

        __entity_slice_used():
                vused = se->vruntime - se->core_prev_vruntime;

I then repeated the test with CONFIG_HZ=1000, 250 and 100, and also
with a nice -10 FAIR donor at HZ=250 and HZ=100.

For the counts below I only included ticks where rq->donor != rq->curr,
core force-idle was active, rq->cfs.h_nr_queued == 1, and the donor's
existing runtime delta == 0.

The observed behavior was consistent across these runs:

        configuration           deadline prototype   vruntime snapshot
        HZ=1000, nice 0            10/10 used=0       8/8 used=1
        HZ=250,  nice 0            10/10 used=0       6/6 used=1
        HZ=100,  nice 0            14/14 used=0      16/16 used=1
        HZ=250,  nice -10          30/30 used=0       6/6 used=1
        HZ=100,  nice -10          15/15 used=0      17/17 used=1

The number of ticks in each window is timing-dependent and can change
when a successful slice check triggers rescheduling. The comparison
above is based on the per-tick result, rather than on equal window
lengths.

I also compared the existing runtime-based predicate with the snapshot
predicate on the non-proxy path. In a CONFIG_HZ=1000 run, the decisions
matched for all 83 observed force-idle ticks with rq->donor == rq->curr.
For all 177 matching proxy ticks in the same run, the existing predicate
was false while the snapshot predicate was true.

In these runs, the snapshot version tracked the donor's vruntime
progress across deadline rollovers and triggered the force-idle
reschedule. It returned used == 1 for every matching tick observed in
the proxy windows listed above. This also matches the previous
sum_exec_runtime - prev_sum_exec_runtime semantics more closely: the
measurement starts when the scheduling context is selected and is not
tied to the current EEVDF request after a deadline rollover.

These tests suggest that reconstructing the consumed service from the
current deadline may lose the original selection-time semantics across
a deadline rollover. The virtual-time direction still looks
appropriate, while the consumed service appears to need a
selection-time baseline rather than being reconstructed from a
deadline that update_deadline() may already have advanced.

I am keeping this as a separate patch from the execution-context tick
series. I will continue validating the snapshot approach with
fair-group scheduling before posting it.

Thanks,
Hui

