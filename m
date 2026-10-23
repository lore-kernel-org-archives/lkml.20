Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762290;
	b=HPws9S7FEQuDONmQorURHN6IEaDQBF1NKuDoVtDQ06fLfdns9KGkToHRRnr2EqrLZ2Fg
	 KzKQIWzmXYuwXo/sBGC+0aIwAhs1yRe2IeMsZ4c0iUsDYxgjFNVUcD+h/MV9EmmeC3aYW
	 NmUYj4GX6TnlwKgbyLn4OtbMi1wczc2jCZLLyorAT0UavIXBEf32AKJue3U3sdOwfYINz
	 7ZPJ8L0N1PhkrhL/kv/ODTzIVhv3L8rcbUNU6/ggVI0YkLYaaLxrI6F0DCZylLqpb9NZ+
	 wMHuai2RkawchOka5gC6pG4TnK8Nu2t/s2Zpht8tE0gYcNq/DxjbfnBIgs2TcjF7W3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762290;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=2WvI4fwTkfjqkPVTmW8l6edz7EjA83sUtMLiWbm6O04=;
	b=rQKYTy1E44Ic15S1h3xXaVhioXvadC8gewzQrpubFezr+cTI0SC5D8B7XCUiUZfzL65C
	 B36fRULJb84aHlKMd71dsc0hurd2q9NqaZ2NvvaLNagCC70+jPKl0vdvqOcJouPljT8GI
	 GCTAdElU8yCm75fPwmjn/s6XqOXazegDD9NuwD2zELbtlSYbZ3Wt/NZR5AuBJUw5yVKn9
	 FIXQA8CHU/7dxfX5lOB1xanssmt3xKKCnQlrIH4ivFHyzatMxN+PWWjM4tjtzba91yF7Q
	 zn+Tl1wOc71mDuQnm4YhJIrwo3m1y8LVTrYcypLtB64cVn78c69CDvSz2wVN4Hh1q+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cJjN6ITC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD6E606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cJjN6ITC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBF631F01825;
	Fri, 23 Oct 2026 13:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792762289;
	bh=2WvI4fwTkfjqkPVTmW8l6edz7EjA83sUtMLiWbm6O04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cJjN6ITCrKGp/Zt9vSLOMvG+/9Jn1YUjCSVtWOgD1YQUQEaLudL3DbVrEobl+/CdF
	 zMnpf8PfHajhhgJuYqaIkQwzTH7X48UCNltVpRUVJ+z5BrinS4OB7+AxCfjHmy7ERE
	 VyT7yzNeytZs6/vIWH4ap7qm0avTm7AGJHNyKoxxJAxQ4VUp1H6KUFKSnI6KC8Cgif
	 1Z1t5meazWmwmCtftA46ZqOapfMDSsHJLOBHO8c1g+Ut1G0xR7f19qhlP1pEjFT1jL
	 fSbp0ym6IgF2Ou1umoKZ9VKEwzruXAluK3sgWGHEHufglt8pQS70izjsRWOEr/AC7v
	 kX89URuEka2yw==
Date: Fri, 23 Oct 2026 15:31:26 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Peng Wang <peng_wang@linux.alibaba.com>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	He Rongguang <herongguang@linux.alibaba.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] tick/nohz: Reevaluate the tick for kicks flushed
 outside hardirq
Message-ID: <atthrrwRchO2FL8g@localhost.localdomain>
References: <atofid9HivdbUuj2@localhost.localdomain>
 <20261022175500.15940-1-peng_wang@linux.alibaba.com>
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
In-Reply-To: <20261022175500.15940-1-peng_wang@linux.alibaba.com>

Le Fri, Oct 23, 2026 at 01:54:57AM +0800, Peng Wang a écrit :
> The nohz full kick relies on IRQ exit to reevaluate the tick. However,
> a remote kick can also be flushed from task context without an IRQ
> exit guaranteed to follow. If a tick dependency is set or an earlier
> timer is queued after the idle-exit reevaluation, the required tick
> update can be delayed until another interrupt.
> 
> Reevaluate the tick directly from the callback outside hardirq context.
> Keep the existing IRQ-exit handling for hardirq callbacks. The offline
> flush remains harmless because tick_sched_timer_dying() has already
> cleared TS_FLAG_NOHZ.
> 
> Fixes: 4b44a21dd640 ("irq_work, smp: Allow irq_work on call_single_queue")
> Fixes: a5183862e76f ("tick/nohz: Conditionally restart tick on idle exit")
> Suggested-by: Frederic Weisbecker <frederic@kernel.org>
> Co-developed-by: He Rongguang <herongguang@linux.alibaba.com>
> Signed-off-by: He Rongguang <herongguang@linux.alibaba.com>
> Signed-off-by: Peng Wang <peng_wang@linux.alibaba.com>
> ---
> Changes in v2:
> - Reevaluate the tick directly outside hardirq instead of requeueing,
>   as suggested by Frederic.
> - Use the full update for both dependencies and timer deadlines. Keep
>   IRQ-exit handling for hardirq callbacks and the existing NOHZ guard
>   for CPU teardown.
> 
> v1: https://lore.kernel.org/all/43668cf88d976084e2865ec07dea82b64ad402ba.1792240863.git.peng_wang@linux.alibaba.com/
> 
>  kernel/time/tick-sched.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
> index 6c3fea386713..ece2c21cec84 100644
> --- a/kernel/time/tick-sched.c
> +++ b/kernel/time/tick-sched.c
> @@ -400,9 +400,13 @@ static bool can_stop_full_tick(int cpu, struct tick_sched *ts)
>  	return true;
>  }
>  
> +static void tick_nohz_full_update_tick(struct tick_sched *ts);
> +
>  static void nohz_full_kick_func(struct irq_work *work)
>  {
> -	/* Empty, the tick restart happens on tick_nohz_irq_exit() */
> +	/* Task-context flushes may not be followed by an IRQ exit. */
> +	if (!in_hardirq())
> +		tick_nohz_full_update_tick(this_cpu_ptr(&tick_cpu_sched));

Just in case, even though it shouldn't happen, just have the following sanity
checks to return early:

if (WARN_ON_ONCE(!tick_nohz_full_cpu(smp_processor_id())))
    return;

if (!in_hardirq()) {
    if (WARN_ON_ONCE(tick_sched_flag_test(ts, TS_FLAG_INIDLE)))
       return;
    tick_nohz_full_update_tick(this_cpu_ptr(&tick_cpu_sched));
}

Thanks!

>  }
>  
>  static DEFINE_PER_CPU(struct irq_work, nohz_full_kick_work) =
> 
> base-commit: 70dd4ee72eb2d5793c62e71c14e3aba78e5a4e56
> -- 
> 2.47.3
> 

-- 
Frederic Weisbecker
SUSE Labs
