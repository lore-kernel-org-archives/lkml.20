Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794003356;
	b=JSvAe5ikRmSPnEzUfnQ39QP3AHrS53NAZETkzcr6XUqbL+Kxd21UgN+2HC5cE/QqFkXG
	 xE0+X0ZBa2qItK4RicNSyRz5mTxn8KFqvBFZ0fL6ZSgq8g0oWczq5TnqSQQikT/GgHfAS
	 vTar1t0QV9Tc6GU3T3RrmKx6ppcUOjJwb4G0vcVZJpp1WojGYNyq6IbtNHlx494cPEup8
	 OIVopfbGxgdZ3prjwFISUfBsETdqaJlN5sGTxhDtaIT1v5z4U8z7Vem3PfWylGhOfOJck
	 U3iLmP2Wf7lTC+oPdq9odeDmXfXhsVgxp2XOKdrzbFksv9RcUsnPs+evW2pq294maPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794003356;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=eb/h6OpEiem7irOaFqKzJ0H8WLUMnDBlfsgGt6v9c0o=;
	b=sV8cKrP7kiDyNZ+FXfFGpEfB8Pm3Dt5OstTsAZJn4W+c6+/7OCIyS0+Iaw7DEoVZYYGN
	 z1AGRWMayVxJXHzCTXv6x2zttFFt77XREpR5v2SL5Tu3wFxuC4Av/GyBgYnYNfseTbvC4
	 AbxIyzQhgUAsCYFJNbniHMNysqvcKb5vs/42E8bHQV4Ib83nDSzqSxsevrjgImj0iNbJS
	 82gpRzKinX5laD+EGyZ6GWdleF+bIurzFmHppMvIIRabsopTDTa1QKK8c6a7Eui5FKaCj
	 SXDfzAWl5rx22ADuYGqoV69zXcR5mk3t2OYKALBQm2XG8Zj/MWKwK4Bu1S8kLzaTItA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TTEirSm5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B3D606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 22:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TTEirSm5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B35A51F0089F;
	Fri,  6 Nov 2026 22:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794003355;
	bh=eb/h6OpEiem7irOaFqKzJ0H8WLUMnDBlfsgGt6v9c0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TTEirSm5U3hLF9KDZraW1iseFyI1YmmYJI8eAgIiPyFp+GecZjC+1zNKZ8kacYSAi
	 XPblzqrx3/FnHnpcXC1ZDvkMqEsmM6EkeR/bRCLauj4P/dInnYqoz8/VLgqCX4PhPb
	 WJ2z6ptMhJfzQ/pbnkRvwOR0lxOmjPqVC2fr02ctiLy4W724lKMEpovV1lscTJKMIL
	 g9CuGMsBwLBL1pTQmNo9nRdPz7Vbdo7FV9K/5xrdH9VqBpMTuGFLNo+u6quAS4feVz
	 E9C4VmgDX7plwa6DZUFi9EbQp54Y3CKOtoPXOb59vrgZJK6280UWl0UXjRdie25jMo
	 8AAX611MQMdwA==
Date: Fri, 6 Nov 2026 23:15:52 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, "Paul E . McKenney" <paulmck@kernel.org>,
	Ingo Molnar <mingo@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH 1/3] tick/nohz: Re-evaluate the tick on polling idle and
 on user entry
Message-ID: <au5RmN37RlOCp2m9@pavilion.home>
References: <20261106160621.347228-1-marco.crivellari@suse.com>
 <20261106160621.347228-2-marco.crivellari@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261106160621.347228-2-marco.crivellari@suse.com>

Le Fri, Nov 06, 2026 at 05:06:13PM +0100, Marco Crivellari a écrit :
> On nohz_full CPUs the tick is re-evaluated on IRQ exit and on idle exit.
> There are three places where this is not enough:
> 
> - A kick handled while the CPU is in polling idle: in idle,
>   tick_nohz_irq_exit() only does accounting and relies on the idle loop
>   iterating again. HLT and MWAIT return on any IRQ, but cpu_idle_poll()
>   only returns on TIF_NEED_RESCHED. The tick always runs in polling idle
>   for now, but once the next patch stops it there, a timer enqueued from
>   an interrupt on the polling CPU would not be programmed until something
>   else wakes the CPU up.
> 
>   Set TIF_NEED_RESCHED on the idle task when the kick is handled in idle,
>   so that cpu_idle_poll() returns and tick_nohz_idle_exit() re-evaluates
>   the tick.
> 
> - The return to userspace: if the tick is left running in the kernel,
>   for example because a tick dependency was cleared (tick_nohz_dep_clear*()
>   don't kick the CPU) or a timer that kept it running was cancelled, it
>   fires at least once in userspace before tick_nohz_irq_exit() stops it.
> 
>   Stop it from context tracking right before resuming userspace. When the
>   tick is already stopped, the common case, this costs a few flag tests
>   on each return to userspace.

This patch should only be about the return to userspace. Sorry if I
confused you about that.

> 
> - The expiry of a stopped tick in polling idle: a stopped tick is
>   programmed for the next timer only, and reprogramming it for the
>   following one is left to the idle loop, which doesn't run again while
>   cpu_idle_poll() spins. Timers that were already queued would then wait
>   for an unrelated wakeup.
> 
>   Set TIF_NEED_RESCHED in tick_nohz_handler() when the stopped tick
>   fires in idle on a nohz_full CPU.
> 
> Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---
>  include/linux/tick.h      |  8 ++++++++
>  kernel/context_tracking.c |  9 +++++++++
>  kernel/time/tick-sched.c  | 41 ++++++++++++++++++++++++++++++++++++++-
>  3 files changed, 57 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/tick.h b/include/linux/tick.h
> index b121c5d53e30..8bfbb053f4fd 100644
> --- a/include/linux/tick.h
> +++ b/include/linux/tick.h
> @@ -269,6 +269,7 @@ static inline void tick_dep_clear_signal(struct signal_struct *signal,
>  extern void tick_nohz_full_kick_cpu(int cpu);
>  extern void __tick_nohz_task_switch(void);
>  extern void __init tick_nohz_full_setup(cpumask_var_t cpumask);
> +extern void __tick_nohz_user_enter(void);
>  #else
>  static inline bool tick_nohz_full_enabled(void) { return false; }
>  static inline bool tick_nohz_full_cpu(int cpu) { return false; }
> @@ -294,6 +295,7 @@ static inline void tick_dep_clear_signal(struct signal_struct *signal,
>  static inline void tick_nohz_full_kick_cpu(int cpu) { }
>  static inline void __tick_nohz_task_switch(void) { }
>  static inline void tick_nohz_full_setup(cpumask_var_t cpumask) { }
> +static inline void __tick_nohz_user_enter(void) { }
>  #endif
>  
>  static inline void tick_nohz_task_switch(void)
> @@ -302,6 +304,12 @@ static inline void tick_nohz_task_switch(void)
>  		__tick_nohz_task_switch();
>  }
>  
> +static inline void tick_nohz_user_enter(void)
> +{
> +	if (tick_nohz_full_enabled())
> +		__tick_nohz_user_enter();
> +}
> +
>  static inline void tick_nohz_user_enter_prepare(void)
>  {
>  	if (tick_nohz_full_cpu(smp_processor_id()))
> diff --git a/kernel/context_tracking.c b/kernel/context_tracking.c
> index a743e7ffa6c0..d4274698d6f3 100644
> --- a/kernel/context_tracking.c
> +++ b/kernel/context_tracking.c
> @@ -24,6 +24,7 @@
>  #include <linux/export.h>
>  #include <linux/kprobes.h>
>  #include <trace/events/rcu.h>
> +#include <linux/tick.h>
>  
>  
>  DEFINE_PER_CPU(struct context_tracking, context_tracking) = {
> @@ -466,10 +467,18 @@ void noinstr __ct_user_enter(enum ctx_state state)
>  			 */
>  			if (state == CT_STATE_USER) {
>  				instrumentation_begin();
> +				/*
> +				 * On nohz_full CPUs the tick may have been left running in the
> +				 * kernel, e.g. kept by a tick dependency that is now gone.
> +				 * Stop it now rather than let it interrupt userspace once
> +				 * more before the next IRQ exit notices.
> +				 */
> +				tick_nohz_user_enter();
>  				trace_user_enter(0);
>  				vtime_user_enter(current);
>  				instrumentation_end();
>  			}
> +
>  			/*
>  			 * Other than generic entry implementation, we may be past the last
>  			 * rescheduling opportunity in the entry code. Trigger a self IPI
> diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
> index c6d86e4da8a9..a9f622fdeb12 100644
> --- a/kernel/time/tick-sched.c
> +++ b/kernel/time/tick-sched.c
> @@ -323,8 +323,17 @@ static enum hrtimer_restart tick_nohz_handler(struct hrtimer *timer)
>  	 * - to the idle task if in dynticks-idle
>  	 * - to IRQ exit if in full-dynticks.
>  	 */
> -	if (unlikely(tick_sched_flag_test(ts, TS_FLAG_STOPPED)))
> +	if (unlikely(tick_sched_flag_test(ts, TS_FLAG_STOPPED))) {
> +		/*
> +		 * In polling idle on nohz_full the idle loop doesn't iterate on
> +		 * interrupts, so it would never reprogram the tick for the next
> +		 * timer. Make cpu_idle_poll() return.
> +		 */
> +		if (tick_sched_flag_test(ts, TS_FLAG_INIDLE) &&
> +		    tick_nohz_full_cpu(smp_processor_id()))
> +			set_tsk_need_resched(current);
>  		return HRTIMER_NORESTART;
> +	}

I don't think we need this. The change in nohz_full_kick_func() should be
enough.

>  
>  	hrtimer_forward(timer, now, TICK_NSEC);
>  
> @@ -414,6 +423,12 @@ static void nohz_full_kick_func(struct irq_work *work)
>  		if (WARN_ON_ONCE(tick_sched_flag_test(ts, TS_FLAG_INIDLE)))
>  			return;
>  		tick_nohz_full_update_tick(ts);
> +	} else if (tick_sched_flag_test(ts, TS_FLAG_INIDLE)) {
> +		/*
> +		 * In idle, tick_nohz_irq_exit() doesn't re-evaluate the tick, and
> +		 * cpu_idle_poll() only returns on need_resched().
> +		 */
> +		set_tsk_need_resched(current);

And this part should move to the next patch.

Thanks.

>  	}
>  }
>  
> @@ -1071,6 +1086,30 @@ static void tick_nohz_full_update_tick(struct tick_sched *ts)
>  	__tick_nohz_full_update_tick(ts, ktime_get());
>  }
>  
> +#ifdef CONFIG_NO_HZ_FULL
> +void __tick_nohz_user_enter(void)
> +{
> +	struct tick_sched *ts;
> +	int cpu;
> +
> +	lockdep_assert_irqs_disabled();
> +
> +	cpu = smp_processor_id();
> +	if (!tick_nohz_full_cpu(cpu))
> +		return;
> +
> +	ts = this_cpu_ptr(&tick_cpu_sched);
> +	if (!tick_sched_flag_test(ts, TS_FLAG_NOHZ))
> +		return;
> +
> +	if (tick_sched_flag_test(ts, TS_FLAG_STOPPED))
> +		return;
> +
> +	if (can_stop_full_tick(cpu, ts))
> +		tick_nohz_full_stop_tick(ts, cpu);
> +}
> +#endif
> +
>  /*
>   * A pending softirq outside an IRQ (or softirq disabled section) context
>   * should be waiting for ksoftirqd to handle it. Therefore we shouldn't
> -- 
> 2.56.0
> 

-- 
Frederic Weisbecker
SUSE Labs
