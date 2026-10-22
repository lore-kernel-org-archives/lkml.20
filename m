Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792679821;
	b=Ki0PZOrTymvI8VM/ZTmwD/jxaQdcdCCtH+pIPsIAkJ1/7VepY416hEvQzZcLdWQW/GVJ
	 6bnbU2IidQLcqpEDldaOHQrI6yLk4k4C558Usu4Eb7yQ/FgjZwSkeXDWrUba4Z/irQBq4
	 HmNTDH5/Xd51F7xk1wuLzyfo6/qFUErmss8wbpBs+Zpr1lEkeZbUI6a10Twr2aa9XXL0Z
	 tukQ/r/v25ueQLAt6OCHTrxDwiFoBPuRSrcn9NPvVCt5YoD9DDM3lyFzHIzplb2D77qXg
	 bPkUX8MvykOakP8luURogCGGyNDekUv7T/8AXLrYqgmoyRTwYVuLlF5yoHnhg+qP5sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792679821;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=E9aQ/TMWhOBekN504Wv2i/Y7aT2bYwi2d7pdDGRmaqk=;
	b=HzMqRknR8mnDcjaa8liFw7g/Yhr6ZyLyZKssymmeFU1N4uU5ZDOVs2aX8gZtdSpuNm7D
	 EsmUoAtA4ymmS7C4JBJqBGry118uBRHyB+BqyPdnzsOy5NTMWjyCU2rb5LplTi8NpEmxN
	 FTNFVW85USmeN7jRwpayBXdQgE38Oc+kXTSL4QLObLuRSorvvq/YoPxAp2IUHIq5PdUKa
	 GBPjEyYF2ft4rL7tsAMa0eYd3HYGvQcvmavGyTDvX2Jm5q+QudRSHBIc3OYig47VnkWOq
	 7yyKFsIecGhEqaav2WUdimy9g19dpnmsjCd1RneLt97M4j5g5QZ2BBal/2SD05RwGzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IQyKkrcq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B754606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IQyKkrcq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E21D1F000CF;
	Thu, 22 Oct 2026 14:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792679820;
	bh=E9aQ/TMWhOBekN504Wv2i/Y7aT2bYwi2d7pdDGRmaqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IQyKkrcqMdIaEASUNiwl+8al+wT6tNOEMw/fAhiafLWz97sM4BgZFa4RdM+0WAuXF
	 4L/pQTkLPnEpiT/b9Uv6xne4g4HpdOTglTW/7mejn+N2Mcky0dppSPd7qahxcj6TkA
	 RBLNzgFcWp+bMJoJldbpzBlXH3KKeFPTtDk+qY1r60zzT/5d/EPSn9+H674RLPIQle
	 HIkMX5vmzg3kxLZbflvxl1mf1eJ7H1u3JuDMdnTS7vv3MTWifP6Q+YV0tIiduBnkK7
	 j3uU5UHeE3DRe3/SHZBRNMoZSOEeWZmPZVh8QjX4eWU7RnyWdRDFmW0UbX2EVPRIaF
	 VQKhsG6v+k4Pg==
Date: Thu, 22 Oct 2026 16:36:57 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Peng Wang <peng_wang@linux.alibaba.com>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	He Rongguang <herongguang@linux.alibaba.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tick/nohz: Requeue kicks flushed outside hardirq context
Message-ID: <atofid9HivdbUuj2@localhost.localdomain>
References: <43668cf88d976084e2865ec07dea82b64ad402ba.1792240863.git.peng_wang@linux.alibaba.com>
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
In-Reply-To: <43668cf88d976084e2865ec07dea82b64ad402ba.1792240863.git.peng_wang@linux.alibaba.com>

Le Sat, Oct 17, 2026 at 08:59:00PM +0800, Peng Wang a écrit :
> A remote nohz kick can be flushed from task context after idle exit
> has checked tick dependencies. If polling suppressed the IPI, the empty
> callback is consumed without an IRQ exit to reevaluate the tick. A newly
> set dependency can then leave the non-idle tick stopped until another
> interrupt arrives.
> 
> Requeue the work locally when it runs outside hardirq context on an
> online CPU. This raises the IRQ needed for the existing tick reevaluation
> path. Skip offline CPUs whose pending work is being drained during
> teardown.
> 
> Fixes: 4b44a21dd640 ("irq_work, smp: Allow irq_work on call_single_queue")
> Fixes: a5183862e76f ("tick/nohz: Conditionally restart tick on idle exit")
> Co-developed-by: He Rongguang <herongguang@linux.alibaba.com>
> Signed-off-by: He Rongguang <herongguang@linux.alibaba.com>
> Signed-off-by: Peng Wang <peng_wang@linux.alibaba.com>
> ---
>  kernel/time/tick-sched.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
> index 6c3fea386713..87e2a7a87526 100644
> --- a/kernel/time/tick-sched.c
> +++ b/kernel/time/tick-sched.c
> @@ -402,7 +402,12 @@ static bool can_stop_full_tick(int cpu, struct tick_sched *ts)
>  
>  static void nohz_full_kick_func(struct irq_work *work)
>  {
> -	/* Empty, the tick restart happens on tick_nohz_irq_exit() */
> +	/*
> +	 * Remote irq_work may be flushed from task context. Force an IRQ
> +	 * exit to reevaluate the tick unless this CPU is going offline.
> +	 */
> +	if (!in_hardirq() && cpu_online(smp_processor_id()))
> +		irq_work_queue(work);

Good catch but instead of requeuing, why not restarting the tick directly from
here instead of from IRQ exit?

Thanks.

>  }
>  
>  static DEFINE_PER_CPU(struct irq_work, nohz_full_kick_work) =
> 
> base-commit: 70dd4ee72eb2d5793c62e71c14e3aba78e5a4e56
> -- 
> 2.47.0
> 

-- 
Frederic Weisbecker
SUSE Labs
