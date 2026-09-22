Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78784417340
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790065042; cv=none; b=Wez0fvBStkKEDXb4oY+TH5+QGCHjqy5rPuyHWLuC9vytf8qgJq6NR7Icc3txbVNIwMegPZn9RSrG++QrDpO/t7DpPVcPVJx1cf4Fw9MTSbz2/5wfwq9N1XQTY/U0eecb1mZZ0DaA2U0P5NUTal8Z4w4v/TJmqUUP5UM9gVh5j/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790065042; c=relaxed/simple;
	bh=KIQ7IN0bMoaTb8Bxsp9Sn4TMN3MWOxJYIHQZdVBoVWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QPJYWTHaFaUTTJgxvtwP3ElFJol2eeZMor1J6UelBDYy2KHizMIvMQ/puofLZS1W7WvV5Sp6bERo5fi91puSOaMKzyxUB4d1PuVIkcyiEVW85QLoeIldv1WI8WshTgzuHljIvdQyn/RyvbJJG2SPHSz6wWkMu0roBK3SNBNH9XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jmQBILqr; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jmQBILqr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6jLlFLO/Fg5yW4vvYQnf50txMvWhV+uL240xi237wsA=; b=jmQBILqrAf7hH9eiiNcEz2DjdF
	m5SrDCuaKYqZ3dag0o3qWBeEL6oGUm+citBMlau1NL4Ey5uoOCKzgqwQSQanULeA20Vuf+Mg+GMOj
	YN/r8Ib0nbnvx+RsVc84AShaqGfabi6IQ4Z9kBlhUrcLkVjQg+BPgRFAxfFfg/aBG2M/ZHN8I3rX/
	47dyA7kNzFOUr9Pqbc/TYx+DmtfKSjUkybFlTvYIfFxHS55OdZGs2jaoTGCatNLroS1+/ZaLRGp35
	sPqM3l/ro05uNGX95+CpQLVMbVrIx5RyE5i2SGdpnE+Aqb9PS+q3tOU6OywFNJmDTn31ooMuilgj5
	BV2vPR5Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8vgZ-0000000DFoD-49MN;
	Tue, 22 Sep 2026 08:17:08 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7591C300708; Tue, 22 Sep 2026 10:17:06 +0200 (CEST)
Date: Tue, 22 Sep 2026 10:17:06 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: mingo@redhat.com, hannes@cmpxchg.org, surenb@google.com,
	jstultz@google.com, connoro@google.com, metin.kaya@arm.com,
	sh_def@163.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org, zhanxusheng@xiaomi.com
Subject: Re: [PATCH] sched/core: Account PSI IRQ time to the execution context
Message-ID: <20260922081706.GE2009045@noisy.programming.kicks-ass.net>
References: <20260918132915.1236312-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918132915.1236312-1-zhanxusheng@xiaomi.com>

On Fri, Sep 18, 2026 at 09:29:15PM +0800, Zhan Xusheng wrote:
> psi_account_irqtime() has two callers which share rq->psi_irq_time, and
> they disagree about the context: __schedule() passes the outgoing rq->curr,
> sched_tick() passes rq->donor.  Under proxy execution the donor is blocked
> on a mutex while rq->curr burns the CPU.
> 
> The tick charges PSI_IRQ_FULL to the donor's cgroup and advances the
> timestamp, so the call from __schedule() then finds delta <= 0 and charges
> nothing.  The delta is not counted twice, it lands on the wrong cgroup.
> 
> Pass rq->curr, which is what the call read before commit af0c8b2bf67b
> ("sched: Split scheduler and execution contexts") renamed curr to donor
> across sched_tick().  Without CONFIG_SCHED_PROXY_EXEC the two rq members
> are a union, so this only changes anything where that option is set, and
> it depends on EXPERT.
> 
> Fixes: af0c8b2bf67b ("sched: Split scheduler and execution contexts")
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> ---
> Built and booted on x86_64 with CONFIG_SCHED_PROXY_EXEC=y, PSI and
> IRQ_TIME_ACCOUNTING enabled, under x86_debug.config and panic_on_warn.
> I did not construct a case where donor and curr differ.
>  kernel/sched/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 7885ff76e69f..2b48ae0ab372 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -5791,7 +5791,7 @@ void sched_tick(void)
>  	curr = rq->curr;
>  	donor = rq->donor;
>  
> -	psi_account_irqtime(rq, donor, NULL);
> +	psi_account_irqtime(rq, curr, NULL);
>  
>  	update_rq_clock(rq);
>  	hw_pressure = arch_scale_hw_pressure(cpu_of(rq));

Does not in fact apply. There is no curr in sched_tick anymore.
