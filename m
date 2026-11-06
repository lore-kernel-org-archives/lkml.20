Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794002138;
	b=lxXS/Yr3jG5VqgmU3AZP5IPucocuGuDGl+DHaNQZk5LVGuc2U+vSm8Y0V1rWUO84N/2i
	 UqwLX47dWazv0G72R/0Gfk2Bl3xPrFKfzKaZKsJzEG33liRS62xdNnCLoXRMxJ/MrM6UB
	 yJ9RDEiYYi17ZItEU51EKlfSbgdklnwXNJ8D7911VuOBCO85Lq789zOuwc/aszIbyPElM
	 ek1BqriPjmQ+m9aGaFkjYn9tMsfUh1k9+KJ8a5bUQQgBGte6wMZ+t8Urw6K9T022qC+2D
	 CUGmezp8LYjomyfiu0K+SxOBr8eSdKyEjjtV6+eJ64pLObyPf3FyxcZAzIRzCqukO+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794002138;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=nleZva/lewGL/J2qDKTlMtt/n8/hsBcLEHwXA0FRZLg=;
	b=02xqqExImBYc2RNRsEvb21cXmCLq9riP5m002DPg/ORgzbpc+XaJ1OguyJQEDiuvfodi
	 AgEamWjnP9hhgEEzFlArtmkqDW3du6FcVRDFR17oWNENGK4zan25OVweVdgKNvnW6vT1x
	 ycuQlseot77QVj0PmAvuiMFYF1wUqIEyB8k3xHcHIEsPZOZ/cfVgfX2Z5V6y1vc7fayvo
	 6emutOWkncmkH3IlvF91/9c6CFTvChhTTRJbbqM89tCNBzE4h1Wcco6jcTRvHt8Bd2Ifg
	 F2/hGWWXFsLy6tC/lSjMdqlhMb4MrzAw4j3OGPBgPuRL66h+0gLuP0BLZOJfkNR1zbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TgZsi+BF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35F2606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 21:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TgZsi+BF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15B841F0089F;
	Fri,  6 Nov 2026 21:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794002137;
	bh=nleZva/lewGL/J2qDKTlMtt/n8/hsBcLEHwXA0FRZLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TgZsi+BF0qEUgVNvkWN5p7D++RlR6dZhHfMss1WVgfLtB+dQfmwlE0Id0IVAwf6SI
	 gaum2S2IWv0yUYDDpOyGPgzJMhJnCz0U7VKaJ1jfgIf7bTHGqKRHr8ox+tlwLU6bCh
	 osyJ/nYyK9ib/Mgxr0GX5B+PpjdvDO0fpZgSWRiCYPJfrTR7JYnOuTHAnAEx22brKD
	 g71v2d1alUK/oYCn8utIcM6A7A/Ueo2724NyD1O6zAO/Rx6pHmVmm7qJ6zPCEXnOhj
	 h7LOr6toaaTDhWH7J2oMVftkOwyuKP0mg35ZDxsiY+sshpdTO+w27ijph/tEc2TcXK
	 7pzQBqaj4nQKg==
Date: Fri, 6 Nov 2026 22:55:34 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, "Paul E . McKenney" <paulmck@kernel.org>,
	Ingo Molnar <mingo@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Subject: Re: [PATCH 2/3] sched/idle: Stop the tick on polling idle on
 nohz_full CPUs
Message-ID: <au5M1hKb2QuNd5bl@pavilion.home>
References: <20261106160621.347228-1-marco.crivellari@suse.com>
 <20261106160621.347228-3-marco.crivellari@suse.com>
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
In-Reply-To: <20261106160621.347228-3-marco.crivellari@suse.com>

Le Fri, Nov 06, 2026 at 05:06:14PM +0100, Marco Crivellari a écrit :
> With idle=poll, the tick fires while in user space, interrupting the task
> running there. This is a problem when the CPU is nohz_full, as it
> introduces noise into the workload.
> 
> To fix this, stop the tick when entering polling idle on nohz_full CPUs,
> while on other CPUs keep restarting it.
> 
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Juri Lelli <juri.lelli@redhat.com>
> Cc: Vincent Guittot <vincent.guittot@linaro.org>
> Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Ben Segall <bsegall@google.com>
> Cc: Mel Gorman <mgorman@suse.de>
> Cc: Valentin Schneider <vschneid@redhat.com>
> Cc: K Prateek Nayak <kprateek.nayak@amd.com>
> Link: https://lore.kernel.org/all/aQiWfnnSzxsnwa2o@tpad/
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---
>  include/linux/tick.h     |  2 ++
>  kernel/sched/idle.c      |  5 ++++-
>  kernel/time/tick-sched.c | 18 ++++++++++++++++++
>  3 files changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/tick.h b/include/linux/tick.h
> index 8bfbb053f4fd..be4940f76777 100644
> --- a/include/linux/tick.h
> +++ b/include/linux/tick.h
> @@ -129,6 +129,7 @@ extern bool tick_nohz_is_active(void);
>  extern bool tick_nohz_tick_stopped(void);
>  extern bool tick_nohz_tick_stopped_cpu(int cpu);
>  extern void tick_nohz_idle_stop_tick(void);
> +extern void tick_nohz_full_idle_stop_tick(void);
>  extern void tick_nohz_idle_retain_tick(void);
>  extern void tick_nohz_idle_restart_tick(void);
>  extern void tick_nohz_idle_enter(void);
> @@ -144,6 +145,7 @@ static inline bool tick_nohz_is_active(void) { return false; }
>  static inline int tick_nohz_tick_stopped(void) { return 0; }
>  static inline int tick_nohz_tick_stopped_cpu(int cpu) { return 0; }
>  static inline void tick_nohz_idle_stop_tick(void) { }
> +static inline void tick_nohz_full_idle_stop_tick(void) { }
>  static inline void tick_nohz_idle_retain_tick(void) { }
>  static inline void tick_nohz_idle_restart_tick(void) { }
>  static inline void tick_nohz_idle_enter(void) { }
> diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
> index e0c10a5dbda2..226d02d24c73 100644
> --- a/kernel/sched/idle.c
> +++ b/kernel/sched/idle.c
> @@ -349,7 +349,10 @@ static void do_idle(void)
>  		 * idle as we know that the IPI is going to arrive right away.
>  		 */
>  		if (cpu_idle_force_poll || tick_check_broadcast_expired()) {
> -			tick_nohz_idle_restart_tick();
> +			if (cpu_idle_force_poll)
> +				tick_nohz_full_idle_stop_tick();
> +			else
> +				tick_nohz_idle_restart_tick();
>  			cpu_idle_poll();
>  		} else {
>  			cpuidle_idle_call(got_tick);
> diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
> index a9f622fdeb12..3625ad9d2268 100644
> --- a/kernel/time/tick-sched.c
> +++ b/kernel/time/tick-sched.c
> @@ -1179,6 +1179,24 @@ static bool can_stop_idle_tick(int cpu, struct tick_sched *ts)
>  	return true;
>  }
>  
> +/**
> + * tick_nohz_full_idle_stop_tick - stop the tick on polling idle on NOHZ
> + *
> + * On nohz_full CPUs the tick restarted for polling idle would keep
> + * running after idle exit and interrupt userspace once more; so stop it
> + * instaed. On other CPUs, keep restarting it as before. Must be called

*instead

Also it should mention that we want to stop the tick before polling
and not after because we don't want the tick stop induced latency after
the task wake-up.

> + * with interrupts disabled.
> + */
> +void tick_nohz_full_idle_stop_tick(void)

I would rather call that tick_nohz_idle_poll_enter() because it is
very specific and it's not just about stopping the nohz_full tick
in idle, it's also restarting the tick if in dynticks-idle.

Thanks.

> +{
> +	lockdep_assert_irqs_disabled();
> +
> +	if (tick_nohz_full_cpu(smp_processor_id()))
> +		tick_nohz_idle_stop_tick();
> +	else
> +		tick_nohz_idle_restart_tick();
> +}
> +
>  /**
>   * tick_nohz_idle_stop_tick - stop the idle tick from the idle task
>   *
> -- 
> 2.56.0
> 

-- 
Frederic Weisbecker
SUSE Labs
