Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DB051DDE3
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790178108; cv=none; b=rhCIOtgnh1xOE1EqI/snbAaEaQ5O3QQ9BLOTkiANnr24wcuu0XqnYsI8oztUrtNboVYhU7bFRLk12t005WYVtY2JLMX3FNathNS7+Uhyz6YO2mv64UeKzk7A6EfnkXCcJqrjH2KBltSxCwSp1ZrGmnafmrmfOLQMnOB9bc0f5ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790178108; c=relaxed/simple;
	bh=MvYjnAyiO4k8raG5oAa9G1mAaSfsL0OySlj3qn3xbZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pz0VAscCqOW+fTd+wtvKD2kp9sWoqj1DdAQj9xzcdjOzgAL5/iZzCdF6L86OLaBHqUDGmQrBAJBgpzccyZJPKdwlt9o3Rd2O/g3n8Jr/tohkNMsOtvqkLUDvrZ7K+FVSiHNiIHqhDLnecc/zbcR2ucUpwkPh6Qk6QGzJeC1Zq0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oUYNcPTJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oUYNcPTJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10C0D1F000FF;
	Wed, 23 Sep 2026 15:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790178107;
	bh=ykqrz8DrrE8onYC7AFaq41Bu3k6Q9XyPBzxfGsLzksg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oUYNcPTJ9kLnJrGmKa00IQAQBUF6UUp+1Y8JZkRJUZ8Ud5nJiS3WPbvrP7VCI4NJk
	 Zgc+9OgFsiDMIynjjCzYmmDikaqt+QiazTRloG3v019HyOSgDku0hzfdy3HYXRjNwj
	 aJJz5mqI+HIF3hTgeNwpvTDL2QknzZxTnQJlqIIxs6PML3AN7gjJ2JNzIjjOc3NqlL
	 ZJpuHziuHTmYgVCSNVa9sTtK4FaqgUtTyNdPUY5CIOyab+Fr62zunCk8WScTKlIojt
	 q/tt3mHWOQDHjUDoR0nNk0SJycW3aabZNCvk6r1ZOCpmt0RgoYktetM66VgjR1rZQI
	 /Shc+fZrDcJZQ==
Date: Wed, 23 Sep 2026 16:41:42 +0100
From: Will Deacon <will@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	maz@kernel.org
Subject: Re: [PATCH] arm64: smp: Signal EOI after handling IPI_CPU_STOP*
Message-ID: <arPzNkDD69ZKFT99@willie-the-truck>
References: <20260922140109.12780-1-andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922140109.12780-1-andrea.porta@suse.com>

[+Marc]

On Tue, Sep 22, 2026 at 04:01:09PM +0200, Andrea della Porta wrote:
> On kdump/kexec, the boot CPU triggers an IPI_CPU_STOP (and subsequently
> an IPI_CPU_STOP_NMI if the first one does not respond) to the secondary
> CPUs, and the IPI handler eventually calls the firmware to shut down
> each CPU. Since the IPI is never acknowledged via EOI, the interrupt
> remains in an active state when the CPU goes idle.
> 
> In a virtualized environment, if the hypervisor does not reset the
> interrupt state, this causes the crashkernel (with cmdline option
> maxcpus > 1) to be unable to synchronize between the boot CPU and
> secondary CPUs via IPI_CALL_FUNC, leading the kernel to wait indefinitely
> for the CPUs to respond. This has been observed with the Hyper-V
> implementation.

Hmm, how is this different from panic()ing inside an interrupt handler?

> Both the Linux kernel and the Hyper-V firmware appear to violate the
> PSCI specification:
> 
> - The PSCI spec states that the OS kernel must migrate any interrupt away
> from the CPU that is about to be shut down via CPU_OFF, which by extension
> implies that no active interrupts are allowed. The kernel does not
> currently do this in the kdump crash path.
> 
> - The PSCI spec also states that the PSCI firmware must reset the CPU
> registers to their default values when turning on a CPU via the CPU_ON
> command.
> 
> Fixing this on the kernel side has the advantage of being
> hypervisor-agnostic.
> 
> Signal EOI at the end of the crash handler to prevent the subsequent
> crashkernel from hanging.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>  arch/arm64/kernel/smp.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index a61dc3016a117..cc7f3261fe537 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -988,6 +988,27 @@ void kgdb_roundup_cpus(void)
>  }
>  #endif
>  
> +static void ipi_eoi(int ipinr)
> +{
> +	unsigned int cpu = smp_processor_id();
> +	struct irq_desc *desc;
> +	struct irq_chip *chip;
> +	struct irq_data *d;
> +
> +	if (ipinr >= MAX_IPI)
> +		return;
> +
> +	desc = get_ipi_desc(cpu, ipinr);
> +
> +	if (desc) {
> +		chip = irq_desc_get_chip(desc);
> +		d = irq_desc_get_irq_data(desc);
> +
> +		if (chip && chip->irq_eoi)
> +			chip->irq_eoi(d);
> +	}
> +}

Doesn't this hard-code the flow handler for the irqchip? It feels like it
would be better for the GIC driver to get a callback during the kexec
sequence (if it doesn't already) to prepare itself.

Will

>  /*
>   * Main handler for inter-processor interrupts
>   */
> @@ -1009,6 +1030,7 @@ static void do_handle_IPI(int ipinr)
>  
>  	case IPI_CPU_STOP:
>  	case IPI_CPU_STOP_NMI:
> +		ipi_eoi(ipinr);
>  		arm64_nmi_cpu_stop(get_irq_regs(), true);
>  		break;
>  
> -- 
> 2.35.3
> 
