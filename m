Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9DE47CA82
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131348; cv=none; b=oC4ClLZHWBbuLMupmIsb11cmStpfSgraad97Iamfm/wfKiaUzQNvuHyiUn8cKhQNz0WwXUEyu32wX/iyQG+DO50skVzyGUR+82bYg8uFp5/rcweLeouP/CCE4L4g1LbbHCUh3Ldm+8iH9V/SaD8zt0y8ViQ9grSsHiBbqPeJMYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131348; c=relaxed/simple;
	bh=q610DSRKaR2GaLlSOTKR9Z1RwhA6CVlIuE0efD2k5Ec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TzB6GNoSZ3/p1lES/v6Fl7yJYSHhZSVKdSiBRIfsZqPgEEjZbF2yvyFsZah6VWuELBu3xPRJOZMlqS8btxfJPg18RRjET6V7Fq/B4oK0fTjPGifywSf5Rvkhd9M+jxGqnJytEwwIfVmOWQRFKY5CbkUM+niIRRq+LYSJwdpDrvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IvOQoMpe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IvOQoMpe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 120F91F00899;
	Fri, 11 Sep 2026 12:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789131339;
	bh=FX+ulTvKeH2tAXgFdwWmsnpZnFKY2vdgZHf6u/RdTO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IvOQoMpe8ugrrsDfGxDB3ZN+qFB9IZHhrpJWFvvHshfskJ7ECBSQdNCUU/LvgE6Hb
	 +5XWXw+RLRs/M0Gai2Q1WZfX9Idmq9soTOd7CDz8K7UzsqQRchMRKCsQozrj+n3Msj
	 ayvsbSv+M0GDuySwdwyT7+QQFuB0TMk5P8r8ZsmwTa/GSn6RhUbXCsXzQdrnRzACiE
	 zuEIi8oYM80BZX5sfPYcwnxiJmaFQAVgSk36iFj4cFCMwESzZKN18x2XZn3+mAjPVO
	 UsKieGMEQbsbn8sHrYR4stmAEC0ElsHTjXW9A3AcZs8qpHRftJoNoJ+cyUZ5uI1AOY
	 sTl3fn4b1SiNw==
Date: Fri, 11 Sep 2026 13:55:34 +0100
From: Will Deacon <will@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 11/19] arm64: smp: Use generic HOTPLUG_SPLIT_STARTUP
 machinery for CPU onlining
Message-ID: <aqP6Rjzk8XmGmQQp@willie-the-truck>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-12-will@kernel.org>
 <2f75098e-bc2c-4692-8325-809983042a9d@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f75098e-bc2c-4692-8325-809983042a9d@huawei.com>

On Tue, Sep 08, 2026 at 07:35:46PM +0800, Jinjie Ruan wrote:
> 
> 
> 在 2026/9/8 0:40, Will Deacon 写道:
> > In preparation for enabling parallel bringup of secondary CPUs on arm64,
> > take the baby step of moving from HOTPLUG_CORE_SYNC_FULL to
> > HOTPLUG_SPLIT_STARTUP.
> > 
> > Rework the cpu_die_early() path to use a private cpumask, otherwise
> > clearing the incoming CPU from the present mask in the 'kick' stage will
> > prevent the hotplug stage machine from progressing and
> > arch_cpuhp_cleanup_kick_cpu() will not be called.
> > 
> > Signed-off-by: Will Deacon <will@kernel.org>
> > ---
> >  arch/arm64/Kconfig           | 2 +-
> >  arch/arm64/include/asm/smp.h | 1 +
> >  arch/arm64/kernel/smp.c      | 9 +++++----
> >  3 files changed, 7 insertions(+), 5 deletions(-)
> > 
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index 89d1f0f2269c..fd8cf792b7fd 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -230,7 +230,7 @@ config ARM64
> >  	select HAVE_SYSCALL_TRACEPOINTS
> >  	select HAVE_KPROBES
> >  	select HAVE_KRETPROBES
> > -	select HOTPLUG_CORE_SYNC_FULL
> > +	select HOTPLUG_SPLIT_STARTUP
> >  	select HOTPLUG_SMT if HOTPLUG_CPU
> >  	select IRQ_DOMAIN
> >  	select IRQ_FORCED_THREADING
> > diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
> > index fe343c30d620..7b986a6a765b 100644
> > --- a/arch/arm64/include/asm/smp.h
> > +++ b/arch/arm64/include/asm/smp.h
> > @@ -89,6 +89,7 @@ asmlinkage void secondary_start_kernel(void);
> >  struct secondary_data {
> >  	struct task_struct *task;
> >  	long status;
> > +	cpumask_t cpu_died_early_mask;
> >  };
> >  
> >  extern struct secondary_data secondary_data;
> > diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> > index 00362ed6e1ab..c5e9d5d5e003 100644
> > --- a/arch/arm64/kernel/smp.c
> > +++ b/arch/arm64/kernel/smp.c
> > @@ -62,7 +62,7 @@
> >   * so we need some other way of telling a new secondary core
> >   * where to place its SVC stack
> >   */
> > -struct secondary_data secondary_data;
> > +struct secondary_data secondary_data = {};
> >  /* Number of CPUs which aren't online, but looping in kernel text. */
> >  static int cpus_stuck_in_kernel;
> >  
> > @@ -108,7 +108,7 @@ static int boot_secondary(unsigned int cpu, struct task_struct *idle)
> >  	return -EOPNOTSUPP;
> >  }
> >  
> > -int __cpu_up(unsigned int cpu, struct task_struct *idle)
> > +int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *idle)
> >  {
> >  	int ret;
> >  
> > @@ -146,6 +146,8 @@ void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive)
> >  		cpus_stuck_in_kernel++;
> >  		break;
> >  	case CPU_KILL_ME:
> > +		if (cpumask_test_cpu(cpu, &secondary_data.cpu_died_early_mask))
> > +			set_cpu_present(cpu, false);
> 
> Should we set_cpu_present(cpu, false) in CPU_STUCK_IN_KERNEL case, as we
> do not update to CPU_KILL_ME but CPU_STUCK_IN_KERNEL if
> CONFIG_HOTPLUG_CPU is not enabled

That's where we get to at the end of the series, but I can hoist this
check on 'secondary_data.cpu_died_early_mask' above the switch here to
keep that behaviour for bisection.

Will
