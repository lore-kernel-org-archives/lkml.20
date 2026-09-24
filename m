Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9677D407CF1
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240420; cv=none; b=EKWNZaMMdS9xxP2HTIk0Ov18V1/Xg2j+jxtv0WD4vJF5knuBWp7+FDb3bXpC9iaeb6qNtlQTAh7wyJlhOSnWb1mEsnO/1EBuawnprxLN3TLLWmFSRP9rT/a20JbHg6hshjgxHQAhlvGE68uUo3rkSRr5d0RyUtXun6FAZMDNW8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240420; c=relaxed/simple;
	bh=BdJXDvaKOh5OFt5dORHMsd035xcZfYc4LlAUx/3VIZw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XatRtVwXcd7U3OP7YtnUqkwBsuMprhG1PkfHEUuPc7sdCqdMjuBH2pxUZb+9c3KqThvEgWQqtbC+CRsK7glxmPB48vgFjmdm6TgADanNbw7haekqrzACXh91ncytaornpGQpdslBEb82tXdzMEOxeCJe1pzycH5K9j8NedNIX6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GFucZx6S; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GFucZx6S"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so1277364f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790240416; x=1790845216; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3mz1zAfbdgLMlTpPSTC2s+r3ackw98q6OqF4ufc8tI0=;
        b=GFucZx6S8kj3Y4uK/vJbi4AP8CETI6TW7ZR4mHOtKMgw2tG/Ycn4pHuln1cAQP4Av9
         GNaVcPeQt3YjRes9XGgrr3mt6y52aY00yHbHyQxCLwPq0Mfv0sWCyx0Nd+SjLfet1o2i
         OhCBrduqDdyMsP3BrPd2XcnA5OGkoD9t4KO4eqZaRLwifTjNZfVn5BSK+FRC5uiKZer9
         6JNBW52hwR6nrvRMjDfgtqXLZFXP6kkIokbell07RzooMOStwSTHL7Z+7zUWCR7uvpA5
         veeQUV5Xkf5UuvgjzKAtaCt9Pp1iqVForb5e3mP0oUYNaU8u/rDnqj189PPLl972fzZE
         c0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240416; x=1790845216;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3mz1zAfbdgLMlTpPSTC2s+r3ackw98q6OqF4ufc8tI0=;
        b=0lnOKX/+VsWMjnp7lhPz3Umly1jLUalVc4ep18Vc18miUU+VBz0055L97uQzlYwiVo
         ZPb0K1sgLgohaDqlG6ARCKpjNUbwYJHf9lkpBqITM3RyDzhDkuwJjWE9EPihAX3bJziu
         3ga0/g+5z9YKgVyQC7fr5lCrMqEJQ350H7BgmWjZhMCYRq9k6+bqKegQhR/1iEKSBCV0
         XllXsp5MLk/onXWafZIHJHt0P/qSPBOkof5/+fsPD9ze4NsGoSHacHej1VO2ti4Xbjad
         8jJKCsl9qyygTcMB5xCo8RU6IIKn7VGlFUAIlhHfmAMhwj/AmelNdzxEvS8MxeDzbJRZ
         m+mg==
X-Forwarded-Encrypted: i=1; AKwUvBxQ8lZR3rg4yWYmGh69NLz4yujpQR07Sp3ITuKOBi7cQ4uRJGlrjhxOBHwa3qium+eYf4YE3Y7y4Oky54M=@vger.kernel.org
X-Gm-Message-State: AFuF++ksciePcR86Z5wfr1HvbJDd0/6jXnCNsBoVMCTlN2cMGJ01zsrS
	/c/GCNfpXqRyRnRgcZ0bYlRx+bpmCwwjKBODaF2Bpe0BsLyojQz6ZrnMRcVNlLg7MTw=
X-Gm-Gg: AYBFou2bnh1P1+Imhrzl8eeLaoOr9N52wNGq04dxl7SabknVaX4kTQ1x844O+0hZMlv
	9dY4+dnz4i25bARyCX2+dDr8iMu0+XAnZue48KbRvXXCfICMgIP7UzI0b/qH3s3nGtqLxuQIAPA
	CTeONG808CPHaQfH3HRfrSaklMtGdkQMISUs7HhxfdZj2JRV6nx6QFDdxsyOO7DONQ/my7855ZN
	5zZphJtDG2Eg+E8q7ufuUwBuZooow8iDt+yT/6GuPmL4HT3OPseQCmvVgI3yjgPzhBlwwbwbnTd
	HESQu2QuMYvxGvco9bbqLwKB0nZNSNo4Z5Bas4t3KYwSN18dHUU+8AG5gIfPQz7O9S82sMTGqAi
	ivlevL5UZaIRLkdYP31oJri3Oz5r6iF0DfwxW1t6fvazsNVqJs5Oz+cPHkuOLbLQBoCNufh6rEN
	o45jswrrPY3Ewv5y0aPw+GDTcvglO+8lYijI8MBZ7f14V0FrSOyl+ruL82mpf84c/FryGA6Pc=
X-Received: by 2002:a05:6000:40e1:b0:487:62d:37d9 with SMTP id ffacd0b85a97d-488716a5e3amr2905347f8f.27.1790240415781;
        Thu, 24 Sep 2026 02:00:15 -0700 (PDT)
Received: from localhost ([195.94.147.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488682676c7sm12445415f8f.3.2026.09.24.02.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:00:15 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 24 Sep 2026 11:03:56 +0200
To: Marc Zyngier <maz@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: smp: Signal EOI after handling IPI_CPU_STOP*
Message-ID: <arTnfHPBf2qLDLOT@apocalypse>
References: <20260922140109.12780-1-andrea.porta@suse.com>
 <arPzNkDD69ZKFT99@willie-the-truck>
 <86se2z4yje.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86se2z4yje.wl-maz@kernel.org>

Hi Will and Marc,

On 19:23 Wed 23 Sep     , Marc Zyngier wrote:
> On Wed, 23 Sep 2026 16:41:42 +0100,
> Will Deacon <will@kernel.org> wrote:
> > 
> > [+Marc]
> > 
> > On Tue, Sep 22, 2026 at 04:01:09PM +0200, Andrea della Porta wrote:
> > > On kdump/kexec, the boot CPU triggers an IPI_CPU_STOP (and subsequently
> > > an IPI_CPU_STOP_NMI if the first one does not respond) to the secondary
> > > CPUs, and the IPI handler eventually calls the firmware to shut down
> > > each CPU. Since the IPI is never acknowledged via EOI, the interrupt
> > > remains in an active state when the CPU goes idle.
> > > 
> > > In a virtualized environment, if the hypervisor does not reset the
> > > interrupt state, this causes the crashkernel (with cmdline option
> > > maxcpus > 1) to be unable to synchronize between the boot CPU and
> > > secondary CPUs via IPI_CALL_FUNC, leading the kernel to wait indefinitely
> > > for the CPUs to respond. This has been observed with the Hyper-V
> > > implementation.
> > 
> > Hmm, how is this different from panic()ing inside an interrupt
> > handler?

It is not, in fact I should have put the EOI in all cases, but I just
focused on the crash driver by IPI only. The patch should be extended
but from the following discussion it does not seem relevant anymore.

> 
> Also, what is the architectural requirement for the hypervisor to do
> *anything* on the state of the interrupts? This doesn't happen on HW,
> and there is no reason to impose this on a hypervisor either.
> 
> The expectations are that the guest kernel should reset the interrupt
> state on boot, and it feels that this is missing somehow, see below.

Ack.

> 
> > 
> > > Both the Linux kernel and the Hyper-V firmware appear to violate the
> > > PSCI specification:
> > > 
> > > - The PSCI spec states that the OS kernel must migrate any interrupt away
> > > from the CPU that is about to be shut down via CPU_OFF, which by extension
> > > implies that no active interrupts are allowed. The kernel does not
> > > currently do this in the kdump crash path.
> 
> No. This is strictly about affinity, nothing else. It is there so that
> global devices can continue to have their interrupts handled. This
> evidently can't affect CPU-local interrupts.

Noted.

> 
> > > 
> > > - The PSCI spec also states that the PSCI firmware must reset the CPU
> > > registers to their default values when turning on a CPU via the CPU_ON
> > > command.
> 
> CPU registers. Not external peripherals such as the GIC.

True. Those are distributor related.

> 
> > > 
> > > Fixing this on the kernel side has the advantage of being
> > > hypervisor-agnostic.
> > > 
> > > Signal EOI at the end of the crash handler to prevent the subsequent
> > > crashkernel from hanging.
> > > 
> > > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > > ---
> > >  arch/arm64/kernel/smp.c | 22 ++++++++++++++++++++++
> > >  1 file changed, 22 insertions(+)
> > > 
> > > diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> > > index a61dc3016a117..cc7f3261fe537 100644
> > > --- a/arch/arm64/kernel/smp.c
> > > +++ b/arch/arm64/kernel/smp.c
> > > @@ -988,6 +988,27 @@ void kgdb_roundup_cpus(void)
> > >  }
> > >  #endif
> > >  
> > > +static void ipi_eoi(int ipinr)
> > > +{
> > > +	unsigned int cpu = smp_processor_id();
> > > +	struct irq_desc *desc;
> > > +	struct irq_chip *chip;
> > > +	struct irq_data *d;
> > > +
> > > +	if (ipinr >= MAX_IPI)
> > > +		return;
> > > +
> > > +	desc = get_ipi_desc(cpu, ipinr);
> > > +
> > > +	if (desc) {
> > > +		chip = irq_desc_get_chip(desc);
> > > +		d = irq_desc_get_irq_data(desc);
> > > +
> > > +		if (chip && chip->irq_eoi)
> > > +			chip->irq_eoi(d);
> > > +	}
> > > +}
> > 
> > Doesn't this hard-code the flow handler for the irqchip? It feels like it
> > would be better for the GIC driver to get a callback during the kexec
> > sequence (if it doesn't already) to prepare itself.
> 
> Yeah, that's not an acceptable approach.

We're in a non returning handler which is about to shutdown the CPU in a few
instructions, so I'm not sure how to callback into the GIC driver.

> 
> The other observation is that the GIC drivers already clear the active
> state at boot time (gic_cpu_init()). So what isn't that working?
> 
> Could it be that the hypervisor doesn't correctly handle the writes to
> GICR_ICACTIVER0 to nuke the active state? Because this works correctly
> on KVM as is.

That's what I suppose, but obviously I have no access to the implementation
so I canot add more. This is currently under investigation by the folks who
can, though...

So the bottom line is that we need to wait for a patch from the hypervisor 
vendor (and from any vendor that *could* suffer from the same issue), I guess?

Many thanks,
Andrea

> 
> Thanks,
> 
> 	M.
> 
> 
> -- 
> Without deviation from the norm, progress is not possible.
