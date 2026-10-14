Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 256BC52F288
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791991222; cv=none; b=mp8AFbBvoxisR591E20JbqqvtS7t33xDKxcXoBap5EIFhT/pXqO4+8LNkbWYpuf+oCfCAVMRXvYw3b5ks/2mjxA1keGvWv+ChenlqJcPA+P7uqVcRvCfBnZ1pQYEawGUPtm5a7iq+CCywuQX1eCBQQJV+nPO1McKllypeYXesLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791991222; c=relaxed/simple;
	bh=SbceqxxFvvqYVvHWplukOj4U+7uWu1BHBRtp5k7Q0w4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WME7CH+FGICFm1VKeKgrolIYtBIOub4jtKiLVC8wV4QnwV477SqfIXPmfNyo83obEDfE4PndHC9kMEQUk3WN3z56S5FAG+WRV/3PQCN6SLhgVuplf/kgnLPR6wb4UKdjK9H39/EyLMPZtV/73dycmH8z41rg7a8SpxY+DqO+9cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=h0cwflFi; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="h0cwflFi"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D41FC1570;
	Wed, 14 Oct 2026 08:20:15 -0700 (PDT)
Received: from [10.57.88.29] (unknown [10.57.88.29])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC87B3F7B4;
	Wed, 14 Oct 2026 08:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791991219; bh=SbceqxxFvvqYVvHWplukOj4U+7uWu1BHBRtp5k7Q0w4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h0cwflFi0Z8nB5N3GxAkIhPuc8OTHsyP6jIbU3s/LLTUbUgpW57vZjeMHqPmp04kl
	 Khaa2m/3yNgjzLcUPbHy7MS+ByT4mj6y4IyfwnsRvdF9y4pYY49NhYEMDi7XHHMJed
	 Js7la6B5ACKgLJHw38zNyAc9Q+xCWcGJ7Wt/pEYA=
Message-ID: <fab66e31-7c7e-4a81-be59-1a4c1458ff43@arm.com>
Date: Wed, 14 Oct 2026 16:20:14 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] delayacct: Account blkio start on the correct task
To: Zhan Xusheng <zhanxusheng1024@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>
Cc: Balbir Singh <bsingharora@gmail.com>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Valentin Schneider <vschneid@redhat.com>, Josh Snyder <joshs@netflix.com>,
 linux-kernel@vger.kernel.org, Zhan Xusheng <zhanxusheng@xiaomi.com>
References: <20261014081731.1068794-1-zhanxusheng@xiaomi.com>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <20261014081731.1068794-1-zhanxusheng@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/14/26 09:17, Zhan Xusheng wrote:
> __block_task(rq, p) tests p->in_iowait and bumps rq->nr_iowait, but the
> third statement in that block takes neither argument:
> 
> 	if (p->in_iowait) {
> 		atomic_inc(&rq->nr_iowait);
> 		delayacct_blkio_start();
> 	}
> 
> delayacct_blkio_start() stamps current->delays->blkio_start.
> 
> That was fine when commit e8901061ca0c ("sched: Split DEQUEUE_SLEEP from
> deactivate_task()") introduced __block_task(), because its only caller
> was block_task() out of __schedule(), where prev == current.  Commit
> 152e11f6df29 ("sched/fair: Implement delayed dequeue") added a second
> call, at the point the delayed entity is finally dequeued:
> 
> 	/*
> 	 * Fix-up what block_task() skipped.
> 	 *
> 	 * Must be last, @p might not be valid after this.
> 	 */
> 	__block_task(rq, p);
> 
> The paths that reach it do not run as @p:
> 
>   - pick_next_entity() -> __dequeue_task(DEQUEUE_DELAYED), inside the
>     __schedule() of whatever task is prev on that CPU
>   - wait_task_inactive(), in the task doing the waiting
>   - switching_from_fair(), via sched_setscheduler() or rt_mutex_setprio(),
>     which may or may not be @p itself
> 
> So the stamp lands on an unrelated task, and @p keeps whatever
> blkio_start it had.  When the I/O completes, delayacct_blkio_end(p)
> computes local_clock() - p->delays->blkio_start and adds that to @p's
> blkio_delay and blkio_count, and may overwrite blkio_delay_max and
> blkio_delay_max_ts.  The error is however long it has been since @p's
> blkio_start was last written, so it is unbounded.  ->delays is
> kmem_cache_zalloc()'d, so if it was never written the delta is the time
> since boot.
> 
> Measured on an 8-vCPU guest, 2.5 GB file on f2fs over virtio, one task
> alternating a 1 MiB O_DIRECT read with two seconds of pure CPU work,
> pinned to CPU 0 against three CPU hogs so that the reader gets
> delay-dequeued.  Reading delayacct_blkio_ticks from /proc/self/stat
> around the second read:
> 
>   DELAY_DEQUEUE    18 runs, 4 wrong: 206, 20316, 20729, 21968 ticks
>                    reported for reads that took 25-50 ms
>   NO_DELAY_DEQUEUE 12 runs, 0 wrong, all 1-3 ticks
> 
> The 206 case is the two seconds of CPU work swept in; the 20000+ cases
> are blkio_start still at zero.  In a separate run under the same
> conditions, a kprobe on __delayacct_blkio_start() caught it being called
> with current == "sh" and current == "kworker/0:2", neither of which
> issues any I/O.
> 
> Consumers are delayacct_blkio_ticks in /proc/pid/stat, taskstats
> (getdelays, iotop, delaytop) and the per-task blkio_delay_max peak.  The
> error also goes the other way: a task woken while still delayed goes
> through ttwu_runnable() and has that sleep dropped entirely.
> 
> Pass the task to delayacct_blkio_start(), the same way commit
> c96f5471ce7d ("delayacct: Account blkio completion on the correct task")
> did for the end side when commit e33a9bba85a8 ("sched/core: move IO
> scheduling accounting from io_schedule_timeout() into scheduler") moved
> that call into ttwu().
> 
> Note this only makes blkio_start agree with the existing deferral: both
> the stamp and rq->nr_iowait are still taken at __block_task() time, so
> the interval a task spends delayed is counted by neither.  Whether that
> interval should count as iowait is a separate question.
> 
> Fixes: 152e11f6df29 ("sched/fair: Implement delayed dequeue")
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>

2 iowait patches in one day? Wow
For the task-pointer fix:
Reviewed-by: Christian Loehle <christian.loehle@arm.com>

BUT FWIW I don't think this is correct in the first place, why would delayacct_blkio
only start after delayed dequeue? This means a task waking up within
delayed dequeue is invisible to the accounting (as you note).
Let me try to move this to the actual block/wakeup...


> ---
>  include/linux/delayacct.h | 10 +++++-----
>  kernel/delayacct.c        |  4 ++--
>  kernel/sched/sched.h      |  2 +-
>  3 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/include/linux/delayacct.h b/include/linux/delayacct.h
> index ecb06f16d22c5..e595d51699377 100644
> --- a/include/linux/delayacct.h
> +++ b/include/linux/delayacct.h
> @@ -92,7 +92,7 @@ extern void delayacct_init(void);
>  
>  extern void __delayacct_tsk_init(struct task_struct *);
>  extern void __delayacct_tsk_exit(struct task_struct *);
> -extern void __delayacct_blkio_start(void);
> +extern void __delayacct_blkio_start(struct task_struct *p);
>  extern void __delayacct_blkio_end(struct task_struct *);
>  extern int delayacct_add_tsk(struct taskstats *, struct task_struct *);
>  extern __u64 __delayacct_blkio_ticks(struct task_struct *);
> @@ -126,13 +126,13 @@ static inline void delayacct_tsk_free(struct task_struct *tsk)
>  	tsk->delays = NULL;
>  }
>  
> -static inline void delayacct_blkio_start(void)
> +static inline void delayacct_blkio_start(struct task_struct *p)
>  {
>  	if (!static_branch_unlikely(&delayacct_key))
>  		return;
>  
> -	if (current->delays)
> -		__delayacct_blkio_start();
> +	if (p->delays)
> +		__delayacct_blkio_start(p);
>  }
>  
>  static inline void delayacct_blkio_end(struct task_struct *p)
> @@ -257,7 +257,7 @@ static inline void delayacct_tsk_init(struct task_struct *tsk)
>  {}
>  static inline void delayacct_tsk_free(struct task_struct *tsk)
>  {}
> -static inline void delayacct_blkio_start(void)
> +static inline void delayacct_blkio_start(struct task_struct *p)
>  {}
>  static inline void delayacct_blkio_end(struct task_struct *p)
>  {}
> diff --git a/kernel/delayacct.c b/kernel/delayacct.c
> index 479e860aff705..d6158ecbe0be5 100644
> --- a/kernel/delayacct.c
> +++ b/kernel/delayacct.c
> @@ -126,9 +126,9 @@ static void delayacct_end(raw_spinlock_t *lock, u64 *start, u64 *total, u32 *cou
>  	}
>  }
>  
> -void __delayacct_blkio_start(void)
> +void __delayacct_blkio_start(struct task_struct *p)
>  {
> -	current->delays->blkio_start = local_clock();
> +	p->delays->blkio_start = local_clock();
>  }
>  
>  /*
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 7d2ec527b8a25..5bba703160e58 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -3106,7 +3106,7 @@ static inline void __block_task(struct rq *rq, struct task_struct *p)
>  
>  	if (p->in_iowait) {
>  		atomic_inc(&rq->nr_iowait);
> -		delayacct_blkio_start();
> +		delayacct_blkio_start(p);
>  	}
>  
>  	ASSERT_EXCLUSIVE_WRITER(p->on_rq);
> 
> base-commit: 4a3b51aab6e25244d97936aa65e6d5425adf98e1

