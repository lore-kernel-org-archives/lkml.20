Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13B4B43DEB9
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790085126; cv=none; b=UIHtPjBD1JU80rKryc2F515si+NgClz38DywgnAdQ41fZOZMQ+5/uA3BpZ7LQvmi6WKPLxYrZoCDnPzAFqNQus8NJp403naX7xUceXwC9VLeRNQbBmjz9lBX4r2tV8hzzlZukHLTLrPQOhMXEnPU78dwsu5pPwDCfFmKtmkEGUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790085126; c=relaxed/simple;
	bh=mN8FAnOCnbg4oeGxnqwzvzID0aysvHOiCajSlQITXVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ABYnuFM6TtqlDrnySjfTU87GKroPSjTFL9aRrfeJHbXxCdjiZQCy4d3cMq07a+SDlWNusOmIrVZaaJFesvTR2isnzRH68ZrOKBoqQmPBI4Jfw38472fz48MB1jYROtPjrtBtXw7zbrkcE87OKfPk0j5esSpKGapfVS4+Z6v1Wbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=sopNtH72; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="sopNtH72"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C863E152B;
	Tue, 22 Sep 2026 06:51:59 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 499823F86F;
	Tue, 22 Sep 2026 06:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790085123; bh=mN8FAnOCnbg4oeGxnqwzvzID0aysvHOiCajSlQITXVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sopNtH72i0s44RtNWpc9YyyyZmKWsJgDJyx3hZOJLFsLB3fbeg3hzrqFgCX3rjvXJ
	 XRSdQIwNf5DHhxFEDv0rca3FHUqtpQUT4RGX+yp1IMJfbgOInxXLi9XGT32MVPCM97
	 FAN0IAxHOJtrxdi65D4crKLgmMBNxAz3vtm5UvU0=
Date: Tue, 22 Sep 2026 14:51:58 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 19/21] arm64: entry: The great stack switcheroo
Message-ID: <arKH_pqMvtmPpjZM@arm.com>
References: <20260918161407.2300-1-will@kernel.org>
 <20260918161407.2300-20-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918161407.2300-20-will@kernel.org>

On Fri, Sep 18, 2026 at 05:14:03PM +0100, Will Deacon wrote:
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index 9738142780df..9d734cd09f62 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -327,7 +327,7 @@ static void debug_exception_exit(struct pt_regs *regs)
>  }
>  NOKPROBE_SYMBOL(debug_exception_exit);
>  
> -static void noinstr el1t_64_check_overflow_stack(struct pt_regs *regs)
> +static void noinstr el1h_64_check_overflow_stack(struct pt_regs *regs)
>  {
>  	unsigned long sp = kernel_stack_pointer(regs) - sizeof(*regs);
>  	unsigned long ovf_stack = (unsigned long)this_cpu_ptr(overflow_stack);
> @@ -343,28 +343,28 @@ static void noinstr el1t_64_check_overflow_stack(struct pt_regs *regs)
>  		cpu_park_loop();
>  }
>  
> -asmlinkage void noinstr el1t_64_sync_handler(struct pt_regs *regs)
> +asmlinkage void noinstr el1h_64_sync_handler(struct pt_regs *regs)
>  {
> -	el1t_64_check_overflow_stack(regs);
> -	el1h_64_sync_handler(regs);
> +	el1h_64_check_overflow_stack(regs);
> +	el1t_64_sync_handler(regs);
>  }

The code in el1h_64_check_overflow_stack() is introduced in patch 16 but
I thought I'd reply here as that's where the check becomes relevant. It
does:

	if (sp < ovf_stack || sp > ovf_stack + OVERFLOW_STACK_SIZE)
		cpu_park_loop();

What's missing in this check is the SDEI stacks. I guess not a
correctness problem but if we ever get a fault on this path we don't get
to print anything, just park the CPU. If we want this fixes, I think the
simplest is getting SDEI to use SPSel=0.

> diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
> index 38f9327e6a0a..afcd84510daf 100644
> --- a/arch/arm64/kernel/entry.S
> +++ b/arch/arm64/kernel/entry.S
> @@ -54,6 +54,12 @@
>  
>  	.macro kernel_ventry_el1h, regsize:req, label:req
>  	sub	sp, sp, #PT_REGS_SIZE
> +	b	el1h_\regsize\()_\label
> +	.endm
> +
> +	.macro kernel_ventry_el1t, regsize:req, label:req
> +	msr	spsel, #0			// Stay on the kernel stack
> +	sub	sp, sp, #PT_REGS_SIZE

Courtesy of an LLM - pKVM's inject_host_exception() (nVHE) doesn't take
the host mode into account and always delivers it to the EL1h vector
instead of EL1t (e.g. mem abort).

> diff --git a/arch/arm64/kvm/hyp/entry.S b/arch/arm64/kvm/hyp/entry.S
> index 4c89931a6a92..4d1205d04383 100644
> --- a/arch/arm64/kvm/hyp/entry.S
> +++ b/arch/arm64/kvm/hyp/entry.S
> @@ -31,6 +31,7 @@ SYM_FUNC_START(__guest_enter)
>  	save_callee_saved_regs x1
>  
>  	// Save hyp's sp_el0 and tpidrro_el0
> +	activate_exception_stack
>  	save_sp_el0	x1, x2
>  	save_tpidrro_el0 x1, x2
>  
> @@ -50,6 +51,7 @@ alternative_else_nop_endif
>  	// that would usually be synchonized by the ERET.
>  	isb
>  	mov	x0, #ARM_EXCEPTION_IRQ
> +	deactivate_exception_stack
>  	ret
>  
>  1:
> @@ -167,6 +169,7 @@ SYM_INNER_LABEL(__guest_exit, SYM_L_GLOBAL)
>  	// Restore hyp's sp_el0 and tpidrro_el0
>  	restore_sp_el0 x2, x3
>  	restore_tpidrro_el0 x2, x3
> +	deactivate_exception_stack

I almost got lost here but I think the LLMs may have a point. In
__guest_exit() we switch to the EL2t mode above and a bit further down
we unmask the SError. However, we haven't run __deactivate_traps() yet,
so the VBAR_EL2 still points to the kvm_hyp_vector which has the EL2t
entries as invalid.

It gets worse with el2t_error_invalid taken. __guest_exit_panic() goes
to hyp_panic() since we already did a set_loaded_vcpu xzr.

The easiest fix is to popluate the kvm_hyp_vector with valid EL2t
entries. I don't think deferring the SError enabling after the VBAR
restoring helps as we need to associate the SError with the guest, so
it makes sense to take it on the kvm_hyp_vector paths.

-- 
Catalin
