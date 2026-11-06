Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793961106;
	b=WZRdOXMsglCi/floYtA7f9D4Bp/m8QlC8ycgtb9LXZgWAqPC9WyXNRCCgsCn9byqEYk8
	 1t60yUYUlC+smHfApCTIbCF+VpSYkO5wUOQbk/R6jnevL1ADnnX7VEJZ5vo7nRU3MQ21T
	 mEnqNt22ngJvjZk13woMFu/kHJdzEmcqu/ZKCEHhqO8AfTKQx44NQD7V09AP/po0qa00o
	 jDBo3CI+OllEPNqWQUPXTodbOAXWXlIgXkfjeovP4RqDwtd8rSXgeW13k1hSKBYXBCQha
	 TiNreHRKGnl6LRMzldmkBWOXf4cRHgEU1gjPqbcGeXjP2BfiilxjWJ7PzyI6vUBpjgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793961106;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=W8gbXlORENK4ikt/dPw0/QnpSui7XjDU3zxopNlagNk=;
	b=0BMptqtzGJC1toMw/ok4DHXb3edWTQyKcqDyU77g7g40LT4MN8Dd3K9LXoLEUKki9oLu
	 c/xiELKIXsyO4VAHy0XKCzXXtQgPDjlnEb702In7JUgPqF00ypkoFIUCWLTkHMp+tGSvQ
	 0DI+q4njHFm1P9yovf9IUGnpUpay3HqMxwBVEr6Ce+SomxESIrMUUNIHMMoYp1QtSVwai
	 NjRvVeO7G9gm3NMjxwCNT/pN+/zdeqvKCeR31oHmAbJqs/lJ8DGQPX6V4zqc95z9DddS8
	 gqloig59k976ezaGEMTMCs+YVbijVs0UCM6pYqkEEvDeoWcmDfNlqe2Bamb6+fRJgsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=eCiarAGp;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C11606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88C11606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=eCiarAGp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=W8gbXlORENK4ikt/dPw0/QnpSui7XjDU3zxopNlagNk=; b=eCiarAGpYiUi8LYy6stxGlPGNp
	+to9y5O162Ib51tqjOuhv59FoMEL2LWyuWpZ45EG6bPG5JXdsexTMIS6DeS3QSiavkHaPIsZVTXY2
	aI9B3QO9w+TUTL7rFixJ/4po9qZF6SbbCszaGsJpFZrqBgduuGUCWHFpag7X0Zwzz8vFiAZtqQ0MC
	TOI9/TwbYzX4DLeG7Irn1POOwbq2BWYrb9ExOv8oZxF0xpSk8RbwJ6soS3E/C+pjGmzb+4pKMFKTh
	LPL0EeY19lOLLxnAJTvVqW9emUGwkKW5hUA6GaRX5B6Y8skCXVzPojxAi5M2hsbxcmpvTmUuyxqHt
	XLEG5iAA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHET-000000046oT-23iE;
	Fri, 06 Nov 2026 10:31:41 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5934D300302; Fri, 06 Nov 2026 11:31:40 +0100 (CET)
Date: Fri, 6 Nov 2026 11:31:40 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Peng Wang <peng_wang@linux.alibaba.com>
Cc: vincent.guittot@linaro.org, mingo@redhat.com, mgorman@suse.de,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/fair: Fix the runtime check in preempt_sync()
Message-ID: <20261106103140.GE1779021@noisy.programming.kicks-ass.net>
References: <20261106085001.36135-1-peng_wang@linux.alibaba.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106085001.36135-1-peng_wang@linux.alibaba.com>

On Fri, Nov 06, 2026 at 04:50:00PM +0800, Peng Wang wrote:
> With NEXT_BUDDY enabled, preempt_sync() only lets a WF_SYNC wakeup
> force a reschedule once the current task has run long enough.  It
> computes the runtime as rq_clock_task() - se->exec_start, but
> wakeup_preempt_fair() has already called update_curr_fair() at that
> point, which sets se->exec_start to rq_clock_task().  The result is
> always 0.
> 
> Use sum_exec_runtime - prev_sum_exec_runtime instead, which is the time
> the task has run since it was picked, and drop the now unused rq
> argument.
> 
> Fixes: e837456fdca8 ("sched/fair: Reimplement NEXT_BUDDY to align with EEVDF goals")
> Signed-off-by: Peng Wang <peng_wang@linux.alibaba.com>
> ---
>  kernel/sched/fair.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index cfc9822..6164cb7 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -10090,8 +10090,8 @@ static inline bool set_short_buddy(struct cfs_rq *cfs_rq, struct sched_entity *p
>   * multiple tasks must be woken up.
>   */
>  static inline enum preempt_wakeup_action
> -preempt_sync(struct rq *rq, int wake_flags,
> -	     struct sched_entity *pse, struct sched_entity *se)
> +preempt_sync(int wake_flags, struct sched_entity *pse,
> +	     struct sched_entity *se)
>  {
>  	u64 threshold, delta;
>  
> @@ -10102,7 +10102,7 @@ preempt_sync(struct rq *rq, int wake_flags,
>  	WARN_ON_ONCE(!(wake_flags & WF_TTWU));
>  
>  	threshold = sysctl_sched_migration_cost;
> -	delta = rq_clock_task(rq) - se->exec_start;
> +	delta = se->sum_exec_runtime - se->prev_sum_exec_runtime;
>  	if ((s64)delta < 0)
>  		delta = 0;
>  
> @@ -10226,7 +10226,7 @@ static void wakeup_preempt_fair(struct rq *rq, struct task_struct *p, int wake_f
>  		 * waker and less likely to be cache hot.
>  		 */
>  		if (wake_flags & WF_SYNC)
> -			preempt_action = preempt_sync(rq, wake_flags, pse, se);
> +			preempt_action = preempt_sync(wake_flags, pse, se);
>  	}
>  
>  	switch (preempt_action) {

Well yes. Would you also happen to have some number on how this fix
affects performance of WF_SYNC workloads?
