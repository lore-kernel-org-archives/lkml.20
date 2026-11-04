Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793802827;
	b=yFQe9whHS2M5EvDb79ATCiqhFlZnJuIjqm6Rkopro9xNQG+BJ7QfdKkMOZ++XMYKYpI+
	 OfE9Hh2gL0T02+XJb6V34OSWTV0US7nR8faVKL/6zOFJqdxIpNifHjOMworQ0ylvTmwpc
	 6HycobFpab7azLUwK/M5QFrH/y0em67d6xenS49MwZ1hzAeek7P9ZdvzNZij7nR7us8Gj
	 GkPf9stZ6bvknxrpaR5jZCxJ3xe6r7zOzm+VNodyVUX9gmm39xjXkGGEyD6il4rUBo+85
	 MUx+QRdmXYE3F2YhPJsTRg04GEK4hZ1RltmZucDOFzjYBHqQ1AsDxkEbF7FHVxg5B5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793802827;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=sLPCt4GPj/IQMu9WABIBmE3xRBAlfAsKfx5s040ddmA=;
	b=DxUbJhRDg7dRsx7TxIZPa1BEZnbqhsw67cw2TDSokRVKetmISNRriuVG7dgOb/vjP+D7
	 7N7ZkHNWkoZA+Q2kc63FTIhpQ15Ga8o4TQwQIkbZZXujmXzqAn15JfKuH2bEfNNbz/hUY
	 ZEz/SwpXruSZ7v7exJJ8bbWIUJ37gffZdEa7mJMA8tlH4UJF1F33Kh5RqYz7WF0EQGn+7
	 z3miFxF2qggwrZ3dLDR74EfsDqZkKNqVIJw1z4TR8Lv7G4gPfEpt0/yJN1g35XBLkoly9
	 VTZ4QpDpdMu/KbIGAUV99Vw7pLrrK60hzgqWEVyLacTDhRwabi+uhL5JRKbsg/5dXWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=E95HoxsD;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90793606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90793606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=E95HoxsD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sLPCt4GPj/IQMu9WABIBmE3xRBAlfAsKfx5s040ddmA=; b=E95HoxsDvcWEsvuRyHSMh0oHhI
	xAMEa75IPmm3cBR9QJXjznxqsNZulu7CLAKiywbeKKmRPZExrNYrUqzXQiFvvYoCmifn+OJqR8ZJZ
	4CIq1DhjH7dlRq8RteBmeVTV9wz5Q19wNTAJpwgltwShmLyJ787Xja7J8GL5aLW+n5drx2l0gjQS5
	ysVh3JgNmWpgDRw7SQgjqzJ/tjpueWkkQSujffq/NkkJRBiA9npGJpTaUeanqYse7D9Hvk3eAP1Tq
	iDzWiYM69V5SsKIHdkZp1efpnELcOlPz0f4m0H+qKBdJBYdWZf18LK5sddaLkjbm6i4Kq5jkt8IqH
	xZcyfbfQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xOc3T-007n9a-2J;
	Wed, 04 Nov 2026 14:33:35 +0000
Date: Wed, 4 Nov 2026 06:33:30 -0800
From: Breno Leitao <leitao@debian.org>
To: John Ogness <john.ogness@linutronix.de>
Cc: Marco Elver <elver@google.com>, Petr Mladek <pmladek@suse.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>, 
	Dmitry Vyukov <dvyukov@google.com>, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	kernel-team@meta.com
Subject: Re: [PATCH v2] kcsan: Don't enter an nbcon emergency section for
 verbose reports
Message-ID: <autB8IxyWgtaH_oE@gmail.com>
References: <20261104-kcsan-irqtrace-emergency-v2-1-ceafc0098a25@debian.org>
 <87v76cahn2.fsf@jogness.linutronix.de>
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
In-Reply-To: <87v76cahn2.fsf@jogness.linutronix.de>
X-Debian-User: leitao

On Wed, Nov 04, 2026 at 01:52:41PM +0106, John Ogness wrote:
> On 2026-11-04, Breno Leitao <leitao@debian.org> wrote:
> > Since commit 59cd94ef8009 ("lockdep: Mark emergency sections in lockdep
> > splats"), print_irqtrace_events() runs inside an nbcon emergency
> > section. It is not only used by lockdep splats, though: verbose KCSAN
> > reports call it too, and a data race report is not an emergency. Yet in
> > an emergency section, every printk() flushes all pending records to the
> > nbcon consoles from the calling context, instead of leaving them to the
> > printk threads.
> 
> Wouldn't the below diff be the proper fix?
> 
> John
> 
> diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
> index c3dc84a7cef26..71f1b4b8f06d5 100644
> --- a/kernel/locking/lockdep.c
> +++ b/kernel/locking/lockdep.c
> @@ -4245,8 +4245,6 @@ void print_irqtrace_events(struct task_struct *curr)
>  {
>  	const struct irqtrace_events *trace = &curr->irqtrace;
>  
> -	nbcon_cpu_emergency_enter();
> -
>  	printk("irq event stamp: %u\n", trace->irq_events);
>  	printk("hardirqs last  enabled at (%u): [<%px>] %pS\n",
>  		trace->hardirq_enable_event, (void *)trace->hardirq_enable_ip,
> @@ -4260,8 +4258,6 @@ void print_irqtrace_events(struct task_struct *curr)
>  	printk("softirqs last disabled at (%u): [<%px>] %pS\n",
>  		trace->softirq_disable_event, (void *)trace->softirq_disable_ip,
>  		(void *)trace->softirq_disable_ip);
> -
> -	nbcon_cpu_emergency_exit();
>  }
>  
>  static int HARDIRQ_verbose(struct lock_class *class)
> @@ -5797,8 +5793,11 @@ static noinstr void check_flags(unsigned long flags)
>  	}
>  #endif
>  
> -	if (!debug_locks)
> +	if (!debug_locks) {
> +		nbcon_cpu_emergency_enter();
>  		print_irqtrace_events(current);
> +		nbcon_cpu_emergency_exit();
> +	}
>  
>  	instrumentation_end();
>  #endif

Yes, but it was unclear to me what were the invocations of
print_irqtrace_events() that needed the emergency turned on.

how did you decided that only check_flags() needed it?

Thanks for the review,
--breno
