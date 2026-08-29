Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14AA33DEE9;
	Sat, 29 Aug 2026 08:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787990721; cv=none; b=nsQ6H6CEr8/JPdpf1q5Bm9skxbOWnE5YDD030dzD09q6jygerwESgFIzFJiU2XsqwbXwGQw1IJOIXKiYAHfcv8uxqvMER5O0442B+6q/GRvpdaAlg1jBaGKA8VNj23dqlbEb8zv7GXadwogLmKQ49PA7HhUZYKxxN6E+JrJKiRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787990721; c=relaxed/simple;
	bh=1jFbuKOB8eCQyKbQOb1lync2m2VXCjOAehTZUC+Enuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qijc2ylNY2u1otI3e1m8BeDHu2LtcNfpAKxFMx1tIlULNIv8njomAhzD7a0lBIA9evtiOdQbr0wXXL1e7drtgacq4PGxZkTJAzdQ3tizmAnaOUBnJktWCnKtDLU98HxlEAxPPYpifUaex90Idex+hPwRBmOVwiggfJq6JKHv/LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=caY3ZmUW; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="caY3ZmUW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fRvENnMc1vkD4kyVeYfQxEiyCBKhU7YOhef+9x2m7Ec=; b=caY3ZmUWdEaTMPXRXFTuPIEnEX
	qPxBhhs5vcdegs/UDyZay9YHCXXTagAUxq5HcYcP4NjaTnBuZTd8DytIV/sBJJOHnDSYPh4xIVnJQ
	oRT2Z37FY6X/D6kmcokwynPToB3WKE6kTCUewOp61jjA0XmOs6yTmTRJZYaAC5qE3cL6nnDefuSWx
	J8wZkty3/kFNiCQ6dyytNhAbboipu+BUSdoIgXtNObpJ2/ZJtQ9w/6i9v/ZsxfMQV+loogZ+lHFeY
	Hn4U1g7lVXbmqIekeDLTEXTNv4hu/HSzcmblPr4JFWdjQkjcsqiJp6mSQovY/PQfCFe3WJdE97WRW
	x1RyqLaA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x0E3l-00000008l8I-3nad;
	Sat, 29 Aug 2026 08:05:06 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id AA09F300382; Sat, 29 Aug 2026 10:05:03 +0200 (CEST)
Date: Sat, 29 Aug 2026 10:05:03 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, linux-kernel@vger.kernel.org,
	linux-tip-commits@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] locking: Revert switching guards to
 _irq_{disable,enable}()
Message-ID: <20260829080503.GX776954@noisy.programming.kicks-ass.net>
References: <877bldhkmq.ffs@fw13>
 <ao4lO7U7L-7Zice1@tardis.local>
 <87v78wezid.ffs@fw13>
 <apA4M7Asz0mV9uaw@tardis.local>
 <87jypbfu1t.ffs@fw13>
 <apBrZuxU8bmCgG8h@tardis.local>
 <87bjanfmzz.ffs@fw13>
 <apCS3T63WUxHd1GH@tardis.local>
 <87wltbdvmd.ffs@fw13>
 <87mru5et6r.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mru5et6r.ffs@fw13>

On Sat, Aug 29, 2026 at 01:11:56AM +0200, Thomas Gleixner wrote:

> diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
> index 346c438ac880..b0be24a386f3 100644
> --- a/arch/x86/kernel/process.c
> +++ b/arch/x86/kernel/process.c
> @@ -824,7 +824,7 @@ void __noreturn stop_this_cpu(void *dummy)
>  	struct cpuinfo_x86 *c = this_cpu_ptr(&cpu_info);
>  	unsigned int cpu = smp_processor_id();
>  
> -	local_irq_disable();
> +	raw_force_local_irq_disable();
>  
>  	/*
>  	 * Remove this CPU from the online mask and disable it
> diff --git a/arch/x86/kernel/reboot.c b/arch/x86/kernel/reboot.c
> index 0fed6d0d7e32..40104170be24 100644
> --- a/arch/x86/kernel/reboot.c
> +++ b/arch/x86/kernel/reboot.c
> @@ -98,7 +98,7 @@ static int __init set_efi_reboot(const struct dmi_system_id *d)
>  
>  void __noreturn machine_real_restart(unsigned int type)
>  {
> -	local_irq_disable();
> +	raw_force_local_irq_disable();
>  
>  	/*
>  	 * Write zero to CMOS register number 0x0f, which the BIOS POST
> @@ -535,7 +535,7 @@ static inline void nmi_shootdown_cpus_on_restart(void);
>  #if IS_ENABLED(CONFIG_KVM_X86)
>  static void emergency_reboot_disable_virtualization(void)
>  {
> -	local_irq_disable();
> +	raw_force_local_irq_disable();
>  
>  	/*
>  	 * Disable virtualization on all CPUs before rebooting to avoid hanging
> @@ -699,7 +699,7 @@ void native_machine_shutdown(void)
>  	 * not receive the per-cpu timer interrupt which may trigger
>  	 * scheduler's load balance.
>  	 */
> -	local_irq_disable();
> +	raw_force_local_irq_disable();
>  	stop_other_cpus();
>  #endif
>  
> @@ -823,7 +823,8 @@ static int crash_nmi_callback(unsigned int val, struct pt_regs *regs)
>  	 */
>  	if (cpu == crashing_cpu)
>  		return NMI_HANDLED;
> -	local_irq_disable();
> +
> +	raw_force_local_irq_disable();
>  
>  	if (shootdown_callback)
>  		shootdown_callback(cpu, regs);
> @@ -865,7 +866,7 @@ void nmi_shootdown_cpus(nmi_shootdown_cb callback)
>  {
>  	unsigned long msecs;
>  
> -	local_irq_disable();
> +	raw_force_local_irq_disable();
>  
>  	/*
>  	 * Avoid certain doom if a shootdown already occurred; re-registering

> diff --git a/drivers/acpi/sleep.c b/drivers/acpi/sleep.c
> index 132a9df98471..f13e88fb7a78 100644
> --- a/drivers/acpi/sleep.c
> +++ b/drivers/acpi/sleep.c
> @@ -1095,7 +1095,7 @@ static int acpi_power_off(struct sys_off_data *data)
>  {
>  	/* acpi_sleep_prepare(ACPI_STATE_S5) should have already been called */
>  	pr_debug("%s called\n", __func__);
> -	local_irq_disable();
> +	raw_force_local_irq_disable();
>  	acpi_enter_sleep_state(ACPI_STATE_S5);
>  	return NOTIFY_DONE;
>  }

> diff --git a/include/linux/irqflags.h b/include/linux/irqflags.h
> index 57b074e0cfbb..dd55786768d1 100644
> --- a/include/linux/irqflags.h
> +++ b/include/linux/irqflags.h

> +static __always_inline void raw_force_local_irq_disable(void)
> +{
> +	arch_local_irq_disable();
> +	__preempt_count_add(HARDIRQ_DISABLE_OFFSET);
> +}

So this thing is on all sorts of don't care, we're going down paths. It
needs to ensure IRQs really are off, and preempt_count has at least one
DISABLE_OFFSET on.

*However* if something like acpi_power_off() were to 'fail' to enter S5
and continue on with the notifier, things are now unbalanced. Probably
not a problem, since the next handler will likely do
raw_force_load_irq_disable() again.

At the least this wants a comment I suppose.


> diff --git a/init/main.c b/init/main.c
> index 2613d3f9b3ce..fa84ce260b04 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -991,7 +991,6 @@ void start_kernel(void)
>  
>  	cgroup_init_early();
>  
> -	local_irq_disable();
>  	early_boot_irqs_disabled = true;

If we want to preserve the paranoia of having that statement in the
first place, it could be replaced with something like:

	WARN_ON_ONCE(!irqs_disabled());

I suppose (lockdep isn't available yet).
