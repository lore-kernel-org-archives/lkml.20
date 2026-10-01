Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A73E51CF78
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790864878; cv=none; b=akHTEQyU8p498wUmF+DFAVKZr+5KjtsRBzvps1pVaHhRibvuGC7q1D6ytxHInqtTgZdSnQn1VkhhhRMoikeJV/xQ+aNSV4FoLUyDUy6FfKpJ7c27aJysWZ41JAJ7o00XFOku97qSIGZ8cb1ldxuf2nS7pC2lYQkcHXzJbYTQpSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790864878; c=relaxed/simple;
	bh=lGTWoCUD+NvY/ajA1xzLUt9nWaVl9EgxwLH11fB7VJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=STDIk3mtno97ww+KkeaXnENdLhbyWzwUgRfl98y1kU/snA4IpI2gHRiVsZmuSm59qAsRTFTZK5qxDBGIeatWc3JGbe+AFdfMo8C9bR/jxnR5hA4qFm+Z7M1k9Zhs2YoyHcja3ccTn7YNZAT34KTA86KXSVNaByJCM4JuJ9DNq1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=m3z8yCze; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="m3z8yCze"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ODK/rwsj1af9g4j9MwU4zS8hN51G2L65QGmzv7iEF9U=; b=m3z8yCze4jfO+FtsTUnybZobhA
	R3iB8cCA6S+Bbf+la+qrRxjAVi2wG9qjTYSrMCi8AxkuH2h0pJEycV7A5CBW2U3NA41aa756a7JDC
	t1qHDyT+rHkbm64voMP/f1pNuZz/onTTmXDT463UU2My3CGs9DfjI9WE9/54K/qxaAOMwCRHGO+Rd
	piJkV7D4ylDiRX5h1VETVpQ3rsol7VSdO18b7YsSN7NH/Sfqa8uUUMZMLsQJ1hQDnOocSMagynWQR
	o+QF6vGaTJ8whN5nmB8oEraQoP/ZinqTTXZzg68tPUDpP2eH/HntncyCqpwX4YUrxmdfLO54swbTr
	qCaMU1MA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHl2-000000081ro-3zPJ;
	Thu, 01 Oct 2026 14:27:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 09E143006FA; Thu, 01 Oct 2026 16:27:36 +0200 (CEST)
Date: Thu, 1 Oct 2026 16:27:35 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Andrea Righi <arighi@nvidia.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	linux-kernel@vger.kernel.org,
	David Haufe <dhaufe@simplextrading.com>,
	Cao Ruichuang <create0818@163.com>,
	Furkan =?utf-8?B?w4dhbMSxxZ9rYW4=?= <frn1furkan10@gmail.com>
Subject: Re: [PATCH v2] sched/deadline: Make dl-server nohz full aware
Message-ID: <20261001142735.GT2009045@noisy.programming.kicks-ass.net>
References: <20260513-upstream-fix-dlserver-nohzfull-b4-v2-1-d3e9cbe5c845@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513-upstream-fix-dlserver-nohzfull-b4-v2-1-d3e9cbe5c845@redhat.com>

On Wed, May 13, 2026 at 11:13:03AM +0200, Juri Lelli wrote:
> The dl_server_timer() originally caused spurious IPIs on nohz_full
> cores, breaking isolation guarantees. While such IPIs cannot be observed
> on recent kernels, dl-server timers for tick-stopped isolated CPUs still
> fire unnecessarily on housekeeping cores.
> 
> The problem is that dl-servers are not coordinated with nohz_full tick
> state. Even when the tick stops on an isolated CPU, its dl-server timer
> continues to fire on housekeeping, wasting cycles and potentially
> affecting housekeeping CPU performance.
> 
> Fix by managing servers in sched_can_stop_tick():
> 
> - When RT tasks run with CFS/SCX tasks, start the appropriate server(s)
>   and keep the tick running
> - When only RT tasks remain, stop all servers and allow tick to stop
>   (except for >1 RR tasks which need the tick for round-robin)
> - When only CFS/SCX tasks remain, stop all servers before stopping tick
> 
> Introduce dl_servers_stop_all() to reduce duplication and abstract
> server management from core.c. Unify RT handling into one block that
> handles both RR and FIFO cases.
> 
> Note on SCX: While SCX is incompatible with isolcpus=domain, it does
> support nohz_full. The ext_server handling in this patch targets
> nohz_full configurations without domain isolation.
> 
> Fixes: 557a6bfc662c ("sched/fair: Add trivial fair server")
> Reported-by: David Haufe <dhaufe@simplextrading.com>
> Closes: https://lore.kernel.org/lkml/CAKJHwtOw_G67edzuHVtL1xC5Vyt6StcZzihtDd0yaKudW=rwVw@mail.gmail.com
> Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
> ---

I was most confused with this IPI talk, since dl-server are strictly
per-cpu and was thinking you must be meaning timer interrupts.

But AFAICT the normal dl timers are ABS_HARD, and !PINNED, so the whole
NOHZ_FULL muck will move them around for no win. Oh well. Do we want the
below?

Anyway, yes, I think this is more or less the best we can hope for. In
the down-thread case where someone is running both FIFO and CFS tasks,
they get to keep the pieces, since that is violating NOHZ_FULL premise
anyway.

>  kernel/sched/core.c     | 46 +++++++++++++++++++++++++++-------------------
>  kernel/sched/deadline.c | 14 ++++++++++++++
>  kernel/sched/sched.h    |  1 +
>  3 files changed, 42 insertions(+), 19 deletions(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index b905805bbcbe4..6d05ce9b1dfe6 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -1414,30 +1414,40 @@ static inline bool __need_bw_check(struct rq *rq, struct task_struct *p)
>  
>  bool sched_can_stop_tick(struct rq *rq)
>  {
> -	int fifo_nr_running;
> -
>  	/* Deadline tasks, even if single, need the tick */
>  	if (rq->dl.dl_nr_running)
>  		return false;
>  
>  	/*
> -	 * If there are more than one RR tasks, we need the tick to affect the
> -	 * actual RR behaviour.
> +	 * If there are RT tasks, we may need the tick (for >1 RR tasks),
> +	 * but we must also service lower-priority CFS/SCX tasks via dl-servers.
>  	 */
> -	if (rq->rt.rr_nr_running) {
> -		if (rq->rt.rr_nr_running == 1)
> -			return true;
> -		else
> +	if (rq->rt.rt_nr_running) {
> +		bool cfs_or_scx_queued = false;
> +
> +		if (rq->cfs.h_nr_queued) {
> +			dl_server_start(&rq->fair_server);
> +			cfs_or_scx_queued = true;
> +		}
> +#ifdef CONFIG_SCHED_CLASS_EXT
> +		if (rq->scx.nr_running) {
> +			dl_server_start(&rq->ext_server);
> +			cfs_or_scx_queued = true;
> +		}
> +#endif
> +		if (cfs_or_scx_queued)
>  			return false;
> -	}
>  
> -	/*
> -	 * If there's no RR tasks, but FIFO tasks, we can skip the tick, no
> -	 * forced preemption between FIFO tasks.
> -	 */
> -	fifo_nr_running = rq->rt.rt_nr_running - rq->rt.rr_nr_running;
> -	if (fifo_nr_running)
> +		/*
> +		 * Only RT tasks, no CFS/SCX. Stop servers to prevent spurious
> +		 * wakeups. Tick can stop for single RR or any FIFO, but must
> +		 * run for multiple RR (round-robin behavior).
> +		 */
> +		dl_servers_stop_all(rq);
> +		if (rq->rt.rr_nr_running > 1)
> +			return false;

I don't see why we would stop the dl-server in the false case. If we
don't stop the tick, nobody should be caring about those timers anyway.

It would make more sense to me to have dl_server_stop_all() only in this
true case.

>  		return true;
> +	}
>  
>  	/*
>  	 * If there are no DL,RR/FIFO tasks, there must only be CFS or SCX tasks


diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 0663c00c41c0..5388bde93410 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -401,6 +401,7 @@ static void __dl_clear_params(struct sched_dl_entity *dl_se);
  */
 static void task_non_contending(struct sched_dl_entity *dl_se, bool dl_task)
 {
+	enum hrtimer_mode mode = HRTIMER_MODE_REL_HARD;
 	struct hrtimer *timer = &dl_se->inactive_timer;
 	struct rq *rq = rq_of_dl_se(dl_se);
 	struct dl_rq *dl_rq = &rq->dl;
@@ -459,8 +460,10 @@ static void task_non_contending(struct sched_dl_entity *dl_se, bool dl_task)
 	dl_se->dl_non_contending = 1;
 	if (!dl_server(dl_se))
 		get_task_struct(dl_task_of(dl_se));
+	else
+		mode |= HRTIMER_MODE_PINNED;
 
-	hrtimer_start(timer, ns_to_ktime(zerolag_time), HRTIMER_MODE_REL_HARD);
+	hrtimer_start(timer, ns_to_ktime(zerolag_time), mode);
 }
 
 static void task_contending(struct sched_dl_entity *dl_se, int flags)
@@ -1061,6 +1064,7 @@ static inline u64 dl_next_period(struct sched_dl_entity *dl_se)
  */
 static int start_dl_timer(struct sched_dl_entity *dl_se)
 {
+	enum hrtimer_mode mode = HRTIMER_MODE_ABS_HARD;
 	struct hrtimer *timer = &dl_se->dl_timer;
 	struct dl_rq *dl_rq = dl_rq_of_se(dl_se);
 	struct rq *rq = rq_of_dl_rq(dl_rq);
@@ -1112,7 +1116,9 @@ static int start_dl_timer(struct sched_dl_entity *dl_se)
 	if (!hrtimer_is_queued(timer)) {
 		if (!dl_server(dl_se))
 			get_task_struct(dl_task_of(dl_se));
-		hrtimer_start(timer, act, HRTIMER_MODE_ABS_HARD);
+		else
+			mode |= HRTIMER_MODE_PINNED;
+		hrtimer_start(timer, act, mode);
 	}
 
 	return 1;
