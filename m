Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793784870;
	b=B2RpVLAKYpeVB5RU1/8ij4J5ARsDyDykICQdHWy0BS7QSSgFu2PfRitCi48Y+jafeVOA
	 hPSGLvbou0w6fRzAvxFNJi2L7xhy1UzaZ8/bNy8roe9KqbEsJH3wXtatAeEev7kPtx5n8
	 lcxQmW2vUL1Zq00emYJnpSf3tVw4UB/XoH2NDF/roOXaqxCdTr2m1tdyic27YPEmMldHP
	 p4m4edgnVEDpTJ+eVePVE4S82aMIBX2iuYXvjYREWV48oF/V0qAhFFdjupWOwbUxumDor
	 Jjzk7XX1zXgj7Y/E2YHoDpi6NIqVF3Ps8vugHmK/TKbx3tf5nhzchVe/XHWnZMqReSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784870;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=octsOUMawrJvFIX2xnFR9DFweDuJeM/qHNIovTu+sps=;
	b=i2CBBzaH3JIPzE1AUfLInYz6m8Yx11wuMcTkrCaYCaW1SmrVAPlp7h8m698jwAlDd40v
	 tDMAZPGxLdWDgArRu09LmOd6C+jjRiUeDrkQRz48gDOvIgJKErn1w3lmyr2zBDEG4mCF9
	 5pDp7L8BW7ssjuAQtrAnjtV9WqupJuZkeBzhrKKcQzOW9d7FaPU8YNGiQV6tsxKbRU/wh
	 gU2rCEhwhW/8vRKQWvQiNKKEuYJ9bVRrv/NMy/8e5fhJb3Y8xHBKY51ahvnbDbKYg9VPQ
	 /Ng93INQL0RG/zLSiulgv+mVa1kPQ7eDbH5gI6zV1knPvFnlEqpDYJUwC94ZNOhO1hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ZZtax5mt;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C80606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:34:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1C80606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ZZtax5mt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=octsOUMawrJvFIX2xnFR9DFweDuJeM/qHNIovTu+sps=; b=ZZtax5mtAm61ocVR9xBbwFADWy
	WPsF07O1NkQimGmIll6mtsOXvg1yvXokiHzXDHAMcqaD1j0Bvg7qfZMubyEFBKXYFkvYqnj+r7ar9
	yEmSsICM7O00tvi2XIKx4QHSn5KFs5DyEn13gH4ZO8sxrcCSnDF8WrRom0hGD4g3EuSOLBlSmZp10
	N8Mayrry3Ai2Y5U+vn4lq6hWm1q7FlBtj4M7hFoOQZub1jXNYykr7+KqP1D6R49fLRnur985buKzI
	Z3VpmsDwuZVo2IJoLBiBPZrxrJtGyhRyCY0rjoRECqw2B29hWOPRRasD1RU7n+YDgGR0oB/quxOVG
	hhGvCnBQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOXNs-00000001QOx-1yjU;
	Wed, 04 Nov 2026 09:34:20 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5F1DA3002D9; Wed, 04 Nov 2026 10:34:18 +0100 (CET)
Date: Wed, 4 Nov 2026 10:34:18 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Seiji Nishikawa <snishika@redhat.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Josh Don <joshdon@google.com>, linux-kernel@vger.kernel.org,
	syzbot+681e729b2cf0d4860042@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	Ahmed Abdelraoof <araoof@amazon.de>
Subject: Re: [PATCH RESEND] sched/core: Do not touch SMT siblings that have
 not joined the core yet
Message-ID: <20261104093418.GA1779021@noisy.programming.kicks-ass.net>
References: <20261104022004.3810619-1-snishika@redhat.com>
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
In-Reply-To: <20261104022004.3810619-1-snishika@redhat.com>

On Wed, Nov 04, 2026 at 11:20:04AM +0900, Seiji Nishikawa wrote:
> When a CPU comes online, it is added to cpu_smt_mask() of its siblings
> before sched_core_cpu_starting() sets its rq->core to the core leader.
> For example, on x86, ap_starting() calls set_cpu_sibling_map() first,
> and calls notify_cpu_starting() after that. This order is intended.
> 
> Before sched_core_cpu_starting() runs, rq->core of the new CPU still
> points to its own rq. But rq->core_enabled of the new CPU is already
> set. __sched_core_flip() sets it for all possible CPUs, also for
> offline CPUs, and CPU offline does not clear it. So __rq_lockp() of the
> new CPU returns its own rq->__lock. It does not return the core wide
> lock.
> 
> If a sibling CPU runs pick_next_task() for SCHED_CORE at this time, it
> checks all CPUs in cpu_smt_mask(). It calls update_rq_clock() and
> pick_task() for the rq of the new CPU. But it holds only its own core
> lock, not the lock of the new CPU. Then lockdep shows this warning in
> update_rq_clock().
> 
>   debug_locks && !(lock_is_held(&(__rq_lockp(rq))->dep_map) != 0)
>   WARNING: kernel/sched/sched.h:1666 at update_rq_clock+0x40a/0xd20 kernel/sched/core.c:875, CPU#0: syz-executor251/5712
>   Call Trace:
>    <TASK>
>    pick_next_task kernel/sched/core.c:6375 [inline]
>    __schedule+0x1c69/0x6920 kernel/sched/core.c:7199
>    preempt_schedule_irq+0x4e/0x90 kernel/sched/core.c:7606
> 
> The next loops in pick_next_task() also change rq_i->core_pick of this
> rq, and can call resched_curr() for it, without its lock.
> resched_curr() has the same lockdep_assert_rq_held() check.
> __sched_core_account_forceidle() also checks all CPUs in the same mask.
> 
> CPU offline does not have this problem. remove_siblinginfo() and
> sched_core_cpu_dying() both run in take_cpu_down() under stop_machine.
> So no sibling CPU can be in pick_next_task() at that time.
> 
> Fix this. In these loops, skip a sibling CPU if its rq->core is
> different from our rq->core. At run time, rq->core of a CPU is changed
> by sched_core_cpu_starting(), sched_core_cpu_deactivate() and
> sched_core_cpu_dying(). The first two hold sched_core_lock(), and
> sched_core_lock() takes the rq locks of all CPUs in the SMT mask. The
> last one runs under stop_machine, as written above. So while we hold
> our core lock, the result of this check does not change. A CPU that is
> not in the core yet will pick its own tasks. The comment in the
> reschedule loop of pick_next_task() already expects this case.
> 
> I tested this with the syzbot C reproducer in QEMU. The two vCPUs were
> SMT siblings (-smp 2,sockets=1,cores=1,threads=2). Without this patch,
> the warning came after about 100 seconds. Just before the warning, a
> debug print showed that the loop on CPU 0 saw CPU 1 with rq->core
> pointing to CPU 1 itself, and cpu_online() was false for CPU 1. With
> this patch, the same state still happened, but there was no warning
> in more than 2 hours.
> 
> Fixes: 3c474b3239f1 ("sched: Fix Core-wide rq->lock for uninitialized CPUs")
> Reported-by: syzbot+681e729b2cf0d4860042@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=681e729b2cf0d4860042
> Cc: stable@vger.kernel.org
> Signed-off-by: Seiji Nishikawa <snishika@redhat.com>

Hmm, so I hadn't seen the previous one; but I did see this one:

  https://lore.kernel.org/all/20261101221219.118052-1-araoof@amazon.de/

And I'm thinking you're both tripping over the same issue.

Now, I asked Ahmed if we couldn't consistently do:

 -     for_each_cpu(i, smt_mask) {
 +     for_each_cpu_and(i, smt_mask, cpu_online_mask) {

Does that work for you?

>  kernel/sched/core.c       |  7 +++++++
>  kernel/sched/core_sched.c |  3 +++
>  kernel/sched/sched.h      | 11 +++++++++++
>  3 files changed, 21 insertions(+)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 04b62c16fa8c..7d9f0989eaad 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -6414,6 +6414,8 @@ pick_next_task(struct rq *rq, struct rq_flags *rf)
>  	max = NULL;
>  	for_each_cpu_wrap(i, smt_mask, cpu) {
>  		rq_i = cpu_rq(i);
> +		if (!sched_core_sibling(rq, rq_i))
> +			continue;
>  
>  		/*
>  		 * Current cpu always has its clock updated on entrance to
> @@ -6447,6 +6449,9 @@ pick_next_task(struct rq *rq, struct rq_flags *rf)
>  	 */
>  	for_each_cpu(i, smt_mask) {
>  		rq_i = cpu_rq(i);
> +		if (!sched_core_sibling(rq, rq_i))
> +			continue;
> +
>  		p = rq_i->core_pick;
>  
>  		if (!cookie_equals(p, cookie)) {
> @@ -6492,6 +6497,8 @@ pick_next_task(struct rq *rq, struct rq_flags *rf)
>  	 */
>  	for_each_cpu(i, smt_mask) {
>  		rq_i = cpu_rq(i);
> +		if (!sched_core_sibling(rq, rq_i))
> +			continue;
>  
>  		/*
>  		 * An online sibling might have gone offline before a task
> diff --git a/kernel/sched/core_sched.c b/kernel/sched/core_sched.c
> index 43e0bde3038e..b21eade02c23 100644
> --- a/kernel/sched/core_sched.c
> +++ b/kernel/sched/core_sched.c
> @@ -275,6 +275,9 @@ void __sched_core_account_forceidle(struct rq *rq)
>  
>  	for_each_cpu(i, smt_mask) {
>  		rq_i = cpu_rq(i);
> +		if (!sched_core_sibling(rq, rq_i))
> +			continue;
> +
>  		p = rq_i->core_pick ?: rq_i->curr;
>  
>  		if (p == rq_i->idle)
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 6c7c5633524a..bd0eb5fe6270 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -1534,6 +1534,17 @@ static inline raw_spinlock_t *__rq_lockp(struct rq *rq)
>  	return &rq->__lock;
>  }
>  
> +/*
> + * A CPU coming online is set in cpu_smt_mask() before
> + * sched_core_cpu_starting() links its rq->core to the core leader.
> + * Until then it does not share the core-wide lock, so it must not be
> + * touched as part of the core.
> + */
> +static inline bool sched_core_sibling(struct rq *rq, struct rq *rq_i)
> +{
> +	return rq_i->core == rq->core;
> +}
> +
>  extern bool
>  cfs_prio_less(const struct task_struct *a, const struct task_struct *b, bool fi);
>  
> -- 
> 2.56.0
> 
