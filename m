Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068A247DF90
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131430; cv=none; b=stIYi2aFdIJIovnW2+AgSmDI9HeJrvOFpgGPFhG7/gnMpttKKiGhcIr0zseH4FUvnxrffv2SEimNgMrLNbvKL4RNznbYfhZRoPGWaGb95I8xq5AjDzfJrFu1jtu6bcK1C9OGu+T37lOyNECNrBjDehnM8hXVj6NbT3NvjEJWpAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131430; c=relaxed/simple;
	bh=X/OH0zK8JtY2c/VLGUiRv7XUSxwfqhS8cnSrX/7nDh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X+y/CxG+ZJXl6wbOI8OpeF0lPOEiaCk5acTrvITAJVm/POX9pGzvfh1EnxkM5KcVdixSqa22Iy91B5Jz8z0GSix8Bpmq6ftY2DQ/5G9h+qd+7VRhfd6Rt3z+FLUXkt90Q5nXxRXYBn/yw3o+0Kw5eCkyxrYF2WAf2++kgL8GUrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fT92RkC+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fT92RkC+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 788291F000FF;
	Fri, 11 Sep 2026 12:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789131415;
	bh=26RWSptk/C63igaxaf9XNA+m7yprosJiCw82r9jduVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fT92RkC+ibTCcn9cCVhyDl4u/8y0VNLIm9tYZNJL9HCP9aOe52WAqpLSRJpgxO7FA
	 IK9GVZqYgru/xUYeIPop5kiDiMW8xzZ2kGNTsHHChcPhuIdo90bT/0XQI4x7o1L4K9
	 aGi0EBWUz7jFwrpYP6gW2KJqZKDOa9h8zcSy3bl6RIjsQ0dnHPHIzbvZ3A6Ot/+A5U
	 spvnwG0EWVVnszLQc1NCzEr/di7vRDdxQmlD/Sc09MmLZpUJmXfpL+9YKyGqWqphAS
	 QlCK7UBhXCNSYwZUFL+dtP4dmhrFA73nM+zAv5OpWBqYNF2sRMSuqKpss3EFOypyKg
	 HUeR7MwIWbc+w==
Date: Fri, 11 Sep 2026 13:56:50 +0100
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
Subject: Re: [PATCH 18/19] arm64: smp: Use generic HOTPLUG_PARALLEL machinery
 for CPU onlining
Message-ID: <aqP6kv9ZfNRWmngj@willie-the-truck>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-19-will@kernel.org>
 <23be2187-4618-400d-b817-023e6bc8f4bc@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23be2187-4618-400d-b817-023e6bc8f4bc@huawei.com>

On Tue, Sep 08, 2026 at 09:05:18PM +0800, Jinjie Ruan wrote:
> 在 2026/9/8 0:40, Will Deacon 写道:
> > diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
> > index 17868b497d7c..bec4bc1b12db 100644
> > --- a/arch/arm64/kernel/head.S
> > +++ b/arch/arm64/kernel/head.S
> > @@ -393,7 +393,6 @@ SYM_FUNC_START_LOCAL(__secondary_switched)
> >  	mov	x0, x20
> >  	bl	finalise_el2
> >  
> > -	str_l	xzr, __early_cpu_boot_status, x3
> >  	adr_l	x5, vectors
> >  	msr	vbar_el1, x5
> >  	isb
> > @@ -439,15 +438,15 @@ SYM_FUNC_END(set_cpu_boot_mode_flag)
> >   * with MMU turned off.
> >   *
> >   * update_early_cpu_boot_status tmp, status
> > - *  - Corrupts tmp1, tmp2
> > - *  - Writes 'status' to __early_cpu_boot_status and makes sure
> > + *  - Corrupts tmp1
> 
> Corrupts tmp1, tmp2 ?

Well spotted, thanks.

> > @@ -125,45 +135,42 @@ int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *idle)
> >  
> >  void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive)
> >  {
> > -	long status;
> > +	union secondary_status status;
> >  
> >  	if (is_alive)
> >  		return;
> >  
> > -	secondary_data.task = NULL;
> > -	status = READ_ONCE(secondary_data.status);
> > -	if (status == CPU_MMU_OFF)
> > -		status = READ_ONCE(__early_cpu_boot_status);
> > -
> >  	/* A CPU has failed to boot. Try to figure out what happened. */
> > -	switch (status & CPU_BOOT_STATUS_MASK) {
> > -	default:
> > -		pr_err("CPU%u: failed in unknown state : 0x%lx\n",
> > -		       cpu, status);
> > -		cpus_stuck_in_kernel++;
> > -		break;
> > -	case CPU_KILL_ME:
> > -		if (cpumask_test_cpu(cpu, &secondary_data.cpu_died_early_mask))
> > -			set_cpu_present(cpu, false);
> > +	if (smp_parallel_bringup)
> > +		pr_warn_once("Parallel CPU bringup failed; consider passing \"cpuhp.parallel=off\" for a more accurate diagnosis.\n");
> 
> For some production systems, restarting to reproduce the issue may be
> troublesome.

These errors _really_ shouldn't happen with production systems. They are
caused by critical, deterministic errors such as the secondary CPU not
supporting the system page size. If you can't reboot in that situation,
then you have no system!

The parallel bringup code will detect the issue, it just won't be able
to tell you which CPU caused which issue.

> > +	if (cpumask_test_cpu(cpu, &secondary_data.cpu_died_early_mask)) {
> > +		set_cpu_present(cpu, false);
> >  		if (!op_cpu_kill(cpu)) {
> >  			pr_crit("CPU%u: died during early boot\n", cpu);
> > -			break;
> > +			return;
> >  		}
> > -		pr_crit("CPU%u: may not have shut down cleanly\n", cpu);
> > -		fallthrough;
> > -	case CPU_STUCK_IN_KERNEL:
> > -		pr_crit("CPU%u: is stuck in kernel\n", cpu);
> > -		if (status & CPU_STUCK_REASON_52_BIT_VA)
> > -			pr_crit("CPU%u: does not support 52-bit VAs\n", cpu);
> > -		if (status & CPU_STUCK_REASON_NO_GRAN) {
> > -			pr_crit("CPU%u: does not support %luK granule\n",
> > -				cpu, PAGE_SIZE / SZ_1K);
> > -		}
> > -		cpus_stuck_in_kernel++;
> > -		break;
> > -	case CPU_PANIC_KERNEL:
> > -		panic("CPU%u detected unsupported configuration\n", cpu);
> >  	}
> > +
> > +	pr_crit_once("CPUs may be stuck in kernel\n");
> 
> Need we print the "cpu"

You should already get something like:

  CPUn: will not boot

so I don't think we need anything extra (as, as above, we don't know
exactly which CPUs are stuck).

> >  static void init_gic_priority_masking(void)
> > @@ -407,12 +414,8 @@ void __noreturn cpu_die_early(void)
> >  
> >  	cpumask_set_cpu(cpu, &secondary_data.cpu_died_early_mask);
> 
> It seems unsafe for multiple secondary CPUs to update
> cpu_died_early_mask concurrently.

Why? cpumask_set_cpu() is atomic and each CPU only sets their own bit.

Will
