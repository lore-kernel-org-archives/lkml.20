Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA608486E43
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792395364; cv=none; b=oDin3LCHp96wDEDGbndeo+vabWCi1n+xhSCv+AXW7GvVjtFpcYFBUooBpSzHeC3mGI8PlPx4KwD4T7CtJVhqONu4CFT0ZPu9qf8tk9hMsEExbQAUpN+aMPPeUNznCEKcz5jY88RWu58AD+WTAOc88OOCzXmO8B76LQRROSesG0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792395364; c=relaxed/simple;
	bh=xTNIiTNCBzWV2fgCQi0H5EufqJmfK9ng0leUBk2cXEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ubXHcLDCB4ivAdQFaDGYs+TSwaocGJ9HAI4iNSficC8moCf/wZh2rsa6rY/66lx/h1yUzwMq6bkpeKfGfsGckV7RX9+bpbgNHlS7GxcK9wNF/h8YvHMZBeo6ZQinqeT4fRof/UCOiW9D3FB/LlSVrmoEeFLtakR/ug9K+k3NAxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GEmUTuFS; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GEmUTuFS"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3B101477;
	Mon, 19 Oct 2026 00:35:56 -0700 (PDT)
Received: from [10.0.128.106] (unknown [10.0.128.106])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E78933F7D8;
	Mon, 19 Oct 2026 00:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792395360; bh=xTNIiTNCBzWV2fgCQi0H5EufqJmfK9ng0leUBk2cXEE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GEmUTuFS+m955QCsvimqAR+MinQbGx7uTvF3WFnmzAxNMP1tHno8aimPwHSWJ6+3g
	 2naap6R9fo+sLa0Nzw3P4lJ0G8aUrCuTPW6oEqnWqp14aQKH7Ixk9alE5ABH1lPJO0
	 eQOUY8K6C5f1yGu7mLMoWp56Rikq4CcKL8fgg1zI=
Message-ID: <da0b23f4-78f5-4dea-b588-af19f1c77fcb@arm.com>
Date: Mon, 19 Oct 2026 08:35:54 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] sched/rt,dl: Remove unreachable migration-disabled
 push checks
To: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>,
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>,
 Shubhang Kaushik <shubhang@os.amperecomputing.com>,
 "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: linux-kernel@vger.kernel.org
References: <20261014-sched-rt-dead-md-push-v2-1-9f57f1a530dc@gentwo.org>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <20261014-sched-rt-dead-md-push-v2-1-9f57f1a530dc@gentwo.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/14/26 23:32, Shubhang Kaushik (Ampere) wrote:
> push_rt_task() and push_dl_task() select their candidates with
> pick_next_pushable_task() and pick_next_pushable_dl_task(),
> respectively. Both helpers skip migration-disabled tasks.
> 
> The source rq lock is held after candidate selection. The selected task
> is queued, not executing, and cannot enter a migration-disabled region
> while that lock is held.
> 
> find_lock_lowest_rq() and find_lock_later_rq() can drop the source rq
> lock. If that happens, they recheck is_migration_disabled() after
> reacquiring the locks and reject a task that changed state. Their
> callers then either exit or retry with a task selected by the same
> helper, which again excludes migration-disabled tasks.
> 
> The migration-disabled fallback in push_rt_task() and the corresponding
> check in push_dl_task() are therefore unreachable. Remove them. The RT
> fallback is the only user of the @pull argument, so remove that
> argument too.
> 
> This does not change the migration-disabled handling in pull_rt_task()
> or pull_dl_task(), which use different candidate selectors and retain
> their existing donor-push recovery.
> 
> Signed-off-by: Shubhang Kaushik (Ampere) <sh@gentwo.org>
> ---
> Tested on 80-core SMP, non-SMT Ampere Altra system:
> 
>   - Built and booted with CONFIG_IRQ_WORK=y.
>   - Ran repeated SCHED_FIFO affinity changes among CPUs 78 and 79 with
>     RT_PUSH_IPI enabled and disabled; both runs completed and cleaned
>     up all worker tasks.
>   - With RT_PUSH_IPI enabled, function tracing confirmed repeated
>     execution of rto_push_irq_work_func() via irq_work_single().
> 
> Changes in v2:
>   - Also remove the unreachable migration-disabled check in push_dl_task().
>   - Clarify that both push paths exclude migration-disabled tasks.
> 
> Link to v1: https://lore.kernel.org/r/20261014-sched-rt-dead-md-push-v1-1-5f9757be3c80@gentwo.org
> ---
>  kernel/sched/deadline.c |  3 ---
>  kernel/sched/rt.c       | 48 +++---------------------------------------------
>  2 files changed, 3 insertions(+), 48 deletions(-)
> 
> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index 0663c00c41c04213fda2ebaf16a0bdf34e0849a8..e9d952853f14aaf48cdca6f89135090adee5f6ba 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -3158,9 +3158,6 @@ static int push_dl_task(struct rq *rq)
>  		return 0;
>  	}
>  
> -	if (is_migration_disabled(next_task))
> -		return 0;
> -
>  	if (WARN_ON(next_task == rq->curr))
>  		return 0;
>  
> diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
> index 85303add726df4c2da846c427aab2d627fca9589..f85edc6f896c72d2251b5eb59ee7ffd0e23934f5 100644
> --- a/kernel/sched/rt.c
> +++ b/kernel/sched/rt.c
> @@ -1957,7 +1957,7 @@ static struct rq *find_lock_lowest_rq(struct task_struct *task, struct rq *rq)
>   * running task can migrate over to a CPU that is running a task
>   * of lesser priority.
>   */
> -static int push_rt_task(struct rq *rq, bool pull)
> +static int push_rt_task(struct rq *rq)
>  {
>  	struct task_struct *next_task;
>  	struct rq *lowest_rq;
> @@ -1981,48 +1981,6 @@ static int push_rt_task(struct rq *rq, bool pull)
>  		return 0;
>  	}
>  
> -	if (is_migration_disabled(next_task)) {
> -		struct task_struct *push_task = NULL;
> -		int cpu;
> -
> -		if (!pull || rq->push_busy)
> -			return 0;
> -
> -		/*
> -		 * Invoking find_lowest_rq() on anything but an RT task doesn't
> -		 * make sense. Per the above priority check, curr has to
> -		 * be of higher priority than next_task, so no need to
> -		 * reschedule when bailing out.
> -		 *
> -		 * Note that the stoppers are masqueraded as SCHED_FIFO
> -		 * (cf. sched_set_stop_task()), so we can't rely on rt_task().
> -		 */
> -		if (rq->donor->sched_class != &rt_sched_class)
> -			return 0;
> -
> -		cpu = find_lowest_rq(rq->curr);
> -		if (cpu == -1 || cpu == rq->cpu)
> -			return 0;
> -
> -		/*
> -		 * Given we found a CPU with lower priority than @next_task,
> -		 * therefore it should be running. However we cannot migrate it
> -		 * to this other CPU, instead attempt to push the current
> -		 * running task on this CPU away.
> -		 */
> -		push_task = get_push_task(rq);
> -		if (push_task) {
> -			preempt_disable();
> -			raw_spin_rq_unlock(rq);
> -			stop_one_cpu_nowait(rq->cpu, push_cpu_stop,
> -					    push_task, &rq->push_work);
> -			preempt_enable();
> -			raw_spin_rq_lock(rq);
> -		}
> -
> -		return 0;
> -	}
> -
>  	if (WARN_ON(next_task == rq->curr))
>  		return 0;
>  
> @@ -2078,7 +2036,7 @@ static int push_rt_task(struct rq *rq, bool pull)
>  static void push_rt_tasks(struct rq *rq)
>  {
>  	/* push_rt_task will return true if it moved an RT */
> -	while (push_rt_task(rq, false))
> +	while (push_rt_task(rq))
>  		;
>  }
>  
> @@ -2236,7 +2194,7 @@ void rto_push_irq_work_func(struct irq_work *work)
>  	 */
>  	if (has_pushable_tasks(rq)) {
>  		raw_spin_rq_lock(rq);
> -		while (push_rt_task(rq, true))
> +		while (push_rt_task(rq))
>  			;
>  		raw_spin_rq_unlock(rq);
>  	}
> 
> ---
> base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
> change-id: 20261014-sched-rt-dead-md-push-c88b47c3e2f0
> 
> Best regards,

FWIW I also cannot reproduce the code path
Tested-by: Christian Loehle <christian.loehle@arm.com>

Sorry, let me try and convince myself it is actually true
too, or try and find out why this code was introduced in the first
place...
