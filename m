Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794414304;
	b=ER74SAaNRqw9/cO82L0n/fSv7gcXDnp2w6LYEZiLs95vTneqJ6xk6lbz8xLfTU8IbVW/
	 JLU8rp2m/807As6cPr4TIccL1YegfsaqtsmnSBvRHHNd94B1bftTntcg8qrlJP7EXeCaJ
	 qGerRknf43/M/yB/zIkEm7tGcXoLNjsp76i/LCtIsSv4Km+rA28Tawk9gwoghugOACZCJ
	 fd8tHp72ckCYoaBzVJWCOjsbesxK8Z+T68FLacqb/juGRn2Ylpi4O2a83/f6iOJrehnBI
	 IQI6EhQugJfF+84th3bRBryef6k0b5lGp0xNKCfFmqc1ULrIB4RxgqEF6jrYUXuwCMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794414304;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=hyYB6LoS2U1xjzCyMtjFsNBPztOkeup14THpbIKKyRA=;
	b=XaLTbGyMUzsB0jdOzO+nPhcc8rUcuLOhxycXfjvCQsHBIInMFR1GqGOKbxTMwNRcbRKL
	 R5sb1HP8V40nFg9RHXSvboPC3Z/9R5sIGYFrk81vX0SHwHIkdhp7Ns81LMC8qfZKAlR5W
	 EjaCmqdE7dlJ+ntZ2A2aXF8W4cFh6YqVOJkEMSOha+nIjgmONTOGSmj+NiXmXf3YAdl6C
	 maI+DW7VudM6nB1pbofD2rjFPKTXDbC98h6dmo1rj7RknSHjAnxp9h3cB6C2qBWhJY88A
	 XJwLZPPprKYI1vE1m3AZphGG28y6XaxDCTqLzvZwc6sSG85ak5yfcfltuhXyC83tScA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bbYIACwK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF59D606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bbYIACwK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21EFB1F00A05;
	Wed, 11 Nov 2026 16:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794414304;
	bh=hyYB6LoS2U1xjzCyMtjFsNBPztOkeup14THpbIKKyRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bbYIACwKteLPnI8/ivKQuJNBxFXYvfpzSZL0poH1id1ZiSygIGItH7QxlQklh/k+t
	 SD0bmemJvlROmqQDDZkDF0yR1ZAqkW7YHbDw1Oiqy2qOGi32vjr4XBHY6om0VQXWG6
	 AT0wnJTQqwPrXCK9BpcZ3hoQxCMhUMxXo9gX7sxmJeoYw4WTRq3Z6QGKO/GuKbHOwG
	 6bBkTSzF7E5j/fUZHWfzsQqfEQggFQScRF419bUKjZoPyijJErCI/nlpoPxgkoi4QL
	 zPu05t3+jYthTHf2kWbyd9/R4dPVFvSRoWU9HIM4ArTmgzvCTv3wAelFOOKGx83z2B
	 hBoqrfQDF2LyA==
Date: Wed, 11 Nov 2026 17:25:01 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
	Michal Hocko <mhocko@suse.com>, Aaron Tomlin <atomlin@atomlin.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH v2 1/4] tick/nohz: Re-evaluate the tick on return to user
 space
Message-ID: <avSW3VBwd1Mym6rJ@localhost.localdomain>
References: <20261111114406.346953-1-marco.crivellari@suse.com>
 <20261111114406.346953-2-marco.crivellari@suse.com>
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
In-Reply-To: <20261111114406.346953-2-marco.crivellari@suse.com>

Le Wed, Nov 11, 2026 at 12:43:47PM +0100, Marco Crivellari a écrit :
> On nohz_full CPUs the tick is re-evaluated on IRQ exit and on idle exit.
> 
> This is not enough on return to user space. If the tick is left running in
> the kernel, for example because a tick dependency was cleared
> (tick_nohz_dep_clear*() don't kick the CPU) or a timer that kept it
> running was cancelled, it fires at least once in userspace before
> tick_nohz_irq_exit() stops it.
> 
> Stop it from context tracking right before resuming userspace. When the
> tick is already stopped, the common case, this costs a few flag tests on
> each return to userspace.
> 
> Cc: Paul E. McKenney <paulmck@kernel.org>
> Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Suggested-by: Frederic Weisbecker <frederic@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---
>  include/linux/tick.h      |  8 ++++++++
>  kernel/context_tracking.c |  8 ++++++++
>  kernel/time/tick-sched.c  | 24 ++++++++++++++++++++++++
>  3 files changed, 40 insertions(+)
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
> index a743e7ffa6c0..347f99e1880f 100644
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
> @@ -466,6 +467,13 @@ void noinstr __ct_user_enter(enum ctx_state state)
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

You can move that a little bit further, outside "state == CT_STATE_USER", right
before rcu_irq_work_resched(). This will need a new pair of
instrumentation_begin()/end().

This way it also applies before switching to guest.


>  				trace_user_enter(0);
>  				vtime_user_enter(current);
>  				instrumentation_end();
> diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
> index c6d86e4da8a9..645dba919386 100644
> --- a/kernel/time/tick-sched.c
> +++ b/kernel/time/tick-sched.c
> @@ -1071,6 +1071,30 @@ static void tick_nohz_full_update_tick(struct tick_sched *ts)
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

Looks like this can move right below the definition of
tick_nohz_full_stop_tick() to avoid more ifdef blocks.

Thanks.


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
