Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151CF330307
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789818106; cv=none; b=OytbU+UcViGYQ/+57U4wvEIsjRccAZYxfChMUbrK0lgihDxqo0W/zJJD98CgH3a4gH9BwfxmU/Tzel86k/UvNwoGip0OVPHCjF9zqUBqDeZHWt9BmFFmEzTlG/jHZvm6yKRRs2I2mcFRetrWJ9SNvbbrcxl/F6MbiFkDopik/Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789818106; c=relaxed/simple;
	bh=BzVd5STcjlzjcsJleY+rcB1QWUPXuW2KHggJUyrtVX4=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=Io+QB+XBkrppzxdLJciUHG6nz6S+PwKlAiLKgb9sVMJo0+qKLI4S2xKSjLNrlYJckyLb9CU+ONtgFWlYGklCBlg2E3QeV+8MZ/923Nl0Jfy/iAnFWyQcfrqecLAK2xbuSFCEJA9L6ELySjGESfdTyFOFzTQPGyYrs9s8L4eaqbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=KD0Nek7e; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=++Xk0d77; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="KD0Nek7e";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="++Xk0d77"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1789818087; bh=8bYQnCsebfj4gqtKaU+bL6p
	oZ9H1ZaWhiAaWQhC3h+U=; b=KD0Nek7eLljXr4oxwOJ5WCgz3V3lzDrfTI6iPq68fA3lCyfFny
	orMm7Luv1AUqh6DpXtcHVnJehewPZNzj75UhgmgufqLfOAs9ltFQpUVO73hsguZaKdFq7WS3H1V
	VHfqGCay7xrYnvtXGVwPso/5GgFosNVlYUv3gAmYDIkt3ujPAvsTXXA7/rik+z3SBOldcOOXtJR
	8tybkmxloGFWO+ndff3VV5cnEKkhW1Zt+XA6YQX9T/g3+F1PbOStBHYlMunJBV9TkzsIiI+vLNW
	e7jg8GtcbqEKgEXwLrTOCxY6BGAI11DLlA2v82IOWF4uN6eXCzCP6eCp/PpdI/cSOtg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1789818087; bh=8bYQnCsebfj4gqtKaU+bL6p
	oZ9H1ZaWhiAaWQhC3h+U=; b=++Xk0d77hYyCmRvpe+Rac3hHO2idiUdcqXPHnlXefjPZSgDleC
	Q0qRwfsmlCNaWgbb7DvRXmBojbJ0/kmhnIBQ==;
Date: Sat, 19 Sep 2026 12:41:28 +0100
From: Bradley Morgan <brads@mainlining.org>
To: will@kernel.org
CC: ada.coupriediaz@arm.com, ardb@kernel.org, arnd@arndb.de,
 catalin.marinas@arm.com, david@kernel.org, linusw@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ljs@kernel.org, mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org,
 smostafa@google.com, vladimir.murzin@arm.com
Subject: Re: [PATCH v2 19/21] arm64: entry: The great stack switcheroo
In-Reply-To: <20260918161407.2300-20-will@kernel.org>
Message-ID: <18D0FCAB-2B5D-40C7-805F-78E5275C0701@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 18 September 2026 17:14:03 BST, Will Deacon <will@kernel.org> wrote:
>With the kernel stack pointer in SP_EL1 and the overflow stack pointer
>in SP_EL0, it is now straightforward to switch between the two on
>exception entry from EL1 by writing to SPSel. However, since exception
>entry sets PSTATE.SP to 1 (selecting SP_EL1 as the stack pointer),
>repurposing the overflow stack as a more general kernel exception stack
>would require writing to SPSel on every exception entry from the kernel.
>
>Switch things around so that the overflow stack resides in SP_EL1, with
>the kernel stack residing in SP_EL0.

Hi will, sigh.

https://lore.kernel.org/all/20260804143517.17524-1-include@grrlz.net/

Please be careful this won't conflict, I'll resubmit this.


>
>Signed-off-by: Will Deacon <will@kernel.org>
>---
> arch/arm64/include/asm/kvm_asm.h | 16 +++++++++++++++
> arch/arm64/kernel/entry-common.c | 34 ++++++++++++++++----------------
> arch/arm64/kernel/entry.S        | 26 +++++++++++++-----------
> arch/arm64/kernel/head.S         |  5 ++++-
> arch/arm64/kernel/sleep.S        |  3 ++-
> arch/arm64/kernel/smp.c          |  8 +++++---
> arch/arm64/kvm/hyp/entry.S       |  3 +++
> arch/arm64/mm/proc.S             | 10 ++++++++--
> 8 files changed, 70 insertions(+), 35 deletions(-)
>
>diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
>index 1cfe9216a2ff..bde046c3ca79 100644
>--- a/arch/arm64/include/asm/kvm_asm.h
>+++ b/arch/arm64/include/asm/kvm_asm.h
>@@ -398,6 +398,22 @@ void __noreturn __cold nvhe_hyp_panic_handler(u64 esr, u64 spsr, u64 elr_virt,
> 	ldp	x29, lr,  [\ctxt, #CPU_XREG_OFFSET(29)]
> .endm
> 
>+#ifdef __KVM_VHE_HYPERVISOR__
>+.macro activate_exception_stack
>+msr	spsel, #1
>+.endm
>+
>+.macro deactivate_exception_stack
>+msr	spsel, #0
>+.endm
>+#else
>+.macro activate_exception_stack
>+.endm
>+
>+.macro deactivate_exception_stack
>+.endm
>+#endif
>+
> .macro save_sp_el0 ctxt, tmp
> 	mrs	\tmp,	sp_el0
> 	str	\tmp,	[\ctxt, #CPU_SP_EL0_OFFSET]
>diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
>index 9738142780df..9d734cd09f62 100644
>--- a/arch/arm64/kernel/entry-common.c
>+++ b/arch/arm64/kernel/entry-common.c
>@@ -327,7 +327,7 @@ static void debug_exception_exit(struct pt_regs *regs)
> }
> NOKPROBE_SYMBOL(debug_exception_exit);
> 
>-static void noinstr el1t_64_check_overflow_stack(struct pt_regs *regs)
>+static void noinstr el1h_64_check_overflow_stack(struct pt_regs *regs)
> {
> 	unsigned long sp = kernel_stack_pointer(regs) - sizeof(*regs);
> 	unsigned long ovf_stack = (unsigned long)this_cpu_ptr(overflow_stack);
>@@ -343,28 +343,28 @@ static void noinstr el1t_64_check_overflow_stack(struct pt_regs *regs)
> 		cpu_park_loop();
> }
> 
>-asmlinkage void noinstr el1t_64_sync_handler(struct pt_regs *regs)
>+asmlinkage void noinstr el1h_64_sync_handler(struct pt_regs *regs)
> {
>-	el1t_64_check_overflow_stack(regs);
>-	el1h_64_sync_handler(regs);
>+	el1h_64_check_overflow_stack(regs);
>+	el1t_64_sync_handler(regs);
> }
> 
>-asmlinkage void noinstr el1t_64_irq_handler(struct pt_regs *regs)
>+asmlinkage void noinstr el1h_64_irq_handler(struct pt_regs *regs)
> {
>-	el1t_64_check_overflow_stack(regs);
>-	el1h_64_irq_handler(regs);
>+	el1h_64_check_overflow_stack(regs);
>+	el1t_64_irq_handler(regs);
> }
> 
>-asmlinkage void noinstr el1t_64_fiq_handler(struct pt_regs *regs)
>+asmlinkage void noinstr el1h_64_fiq_handler(struct pt_regs *regs)
> {
>-	el1t_64_check_overflow_stack(regs);
>-	el1h_64_fiq_handler(regs);
>+	el1h_64_check_overflow_stack(regs);
>+	el1t_64_fiq_handler(regs);
> }
> 
>-asmlinkage void noinstr el1t_64_error_handler(struct pt_regs *regs)
>+asmlinkage void noinstr el1h_64_error_handler(struct pt_regs *regs)
> {
>-	el1t_64_check_overflow_stack(regs);
>-	el1h_64_error_handler(regs);
>+	el1h_64_check_overflow_stack(regs);
>+	el1t_64_error_handler(regs);
> }
> 
> static void noinstr el1_abort(struct pt_regs *regs, unsigned long esr)
>@@ -494,7 +494,7 @@ static void noinstr el1_fpac(struct pt_regs *regs, unsigned long esr)
> 	arm64_exit_to_kernel_mode(regs, state);
> }
> 
>-asmlinkage void noinstr el1h_64_sync_handler(struct pt_regs *regs)
>+asmlinkage void noinstr el1t_64_sync_handler(struct pt_regs *regs)
> {
> 	unsigned long esr = read_sysreg(esr_el1);
> 
>@@ -578,17 +578,17 @@ static void noinstr el1_interrupt(struct pt_regs *regs,
> 		__el1_irq(regs, handler);
> }
> 
>-asmlinkage void noinstr el1h_64_irq_handler(struct pt_regs *regs)
>+asmlinkage void noinstr el1t_64_irq_handler(struct pt_regs *regs)
> {
> 	el1_interrupt(regs, handle_arch_irq);
> }
> 
>-asmlinkage void noinstr el1h_64_fiq_handler(struct pt_regs *regs)
>+asmlinkage void noinstr el1t_64_fiq_handler(struct pt_regs *regs)
> {
> 	el1_interrupt(regs, handle_arch_fiq);
> }
> 
>-asmlinkage void noinstr el1h_64_error_handler(struct pt_regs *regs)
>+asmlinkage void noinstr el1t_64_error_handler(struct pt_regs *regs)
> {
> 	unsigned long esr = read_sysreg(esr_el1);
> 	irqentry_state_t state;
>diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
>index 38f9327e6a0a..afcd84510daf 100644
>--- a/arch/arm64/kernel/entry.S
>+++ b/arch/arm64/kernel/entry.S
>@@ -54,6 +54,12 @@
> 
> 	.macro kernel_ventry_el1h, regsize:req, label:req
> 	sub	sp, sp, #PT_REGS_SIZE
>+	b	el1h_\regsize\()_\label
>+	.endm
>+
>+	.macro kernel_ventry_el1t, regsize:req, label:req
>+	msr	spsel, #0			// Stay on the kernel stack
>+	sub	sp, sp, #PT_REGS_SIZE
> 
> 	/*
> 	 * Test whether the SP has overflowed, without corrupting a GPR.
>@@ -65,12 +71,6 @@
> 	tbnz	x0, #THREAD_SHIFT, __bad_stack
> 	sub	x0, sp, x0			// x0'' = sp' - x0' = (sp + x0) - sp = x0
> 	sub	sp, sp, x0			// sp'' = sp' - x0 = (sp + x0) - x0 = sp
>-	b	el1h_\regsize\()_\label
>-	.endm
>-
>-	.macro kernel_ventry_el1t, regsize:req, label:req
>-	msr	spsel, #0			// Stay on the overflow stack
>-	sub	sp, sp, #PT_REGS_SIZE
> 	b	el1t_\regsize\()_\label
> 	.endm
> 
>@@ -208,7 +208,10 @@ alternative_cb_end
> 	ldr_this_cpu	tsk, __entry_task, x20
> 	msr	tpidrro_el0, tsk
> 	adr_this_cpu	x19, overflow_stack + OVERFLOW_STACK_SIZE, x20
>-	msr	sp_el0, x19
>+	mov	x20, sp
>+	msr	sp_el0, x20
>+	mov	sp, x19
>+	msr	spsel, #0
> 
> 	/*
> 	 * Ensure MDSCR_EL1.SS is clear, since we can unmask debug exceptions
>@@ -346,6 +349,9 @@ alternative_else_nop_endif
> 
> 	.if	\el == 0
> 	ldr	x23, [sp, #S_SP]		// load return stack pointer
>+	mov	x0, sp
>+	msr	spsel, #1
>+	mov	sp, x0
> 	msr	sp_el0, x23
> 	msr	tpidrro_el0, xzr
> 	tst	x22, #PSR_MODE32_BIT		// native task?
>@@ -532,16 +538,14 @@ SYM_CODE_START_LOCAL(__bad_stack)
> 	add	sp, sp, #PT_REGS_SIZE
> 
> 	/* Switch to the overflow stack */
>-	msr	spsel, #0
>+	msr	spsel, #1
> 
> 	/* Stash the exception regs */
> 	sub	sp, sp, #PT_REGS_SIZE
> 	kernel_entry 1
> 
> 	/* Fix-up the saved SP */
>-	msr	spsel, #1
>-	mov	x0, sp
>-	msr	spsel, #0
>+	mrs	x0, sp_el0
> 	str	x0, [sp, #S_SP]
> 
> 	/* Stash the regs for handle_bad_stack */
>diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
>index 27a19e1a0ee6..7419e1d8b7ec 100644
>--- a/arch/arm64/kernel/head.S
>+++ b/arch/arm64/kernel/head.S
>@@ -211,8 +211,11 @@ SYM_CODE_END(preserve_boot_args)
> 	ldr	\tmp1, [\tmp1, \tmp2, lsl #3]
> 	set_this_cpu_offset \tmp1
> 
>-	adr_this_cpu	\tmp1, overflow_stack + OVERFLOW_STACK_SIZE, \tmp2
>+	mov	\tmp1, sp
> 	msr	sp_el0, \tmp1
>+	adr_this_cpu	\tmp1, overflow_stack + OVERFLOW_STACK_SIZE, \tmp2
>+	mov	sp, \tmp1
>+	msr	spsel, #0
> 	.endm
> 
> /*
>diff --git a/arch/arm64/kernel/sleep.S b/arch/arm64/kernel/sleep.S
>index f093cdf71be1..facf3f1cc3b1 100644
>--- a/arch/arm64/kernel/sleep.S
>+++ b/arch/arm64/kernel/sleep.S
>@@ -133,7 +133,8 @@ SYM_FUNC_START(_cpu_resume)
> 	add	x0, x0, #SLEEP_STACK_DATA_SYSTEM_REGS
> 	/* load sp from context */
> 	ldr	x2, [x0, #CPU_CTX_SP]
>-	mov	sp, x2
>+	msr	sp_el0, x2
>+
> 	/*
> 	 * cpu_do_resume expects x0 to contain context address pointer
> 	 */
>diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
>index 4c122d6598de..b2e778aae881 100644
>--- a/arch/arm64/kernel/smp.c
>+++ b/arch/arm64/kernel/smp.c
>@@ -447,14 +447,16 @@ void __init smp_cpus_done(unsigned int max_cpus)
> 	mark_linear_text_alias_ro();
> }
> 
>-static void __init set_boot_cpu_offset(void)
>+static void __init update_boot_cpu_offset_and_overflow_stack(void)
> {
> 	u64 ovf_sp = (u64)raw_cpu_ptr(overflow_stack) + OVERFLOW_STACK_SIZE;
> 
> 	asm volatile(
> 	"	msr	tpidr_el1, %1\n"
> 	"	add	%0, %0, %1\n"
>-	"	msr	sp_el0, %0" /* Update the overflow stack pointer */
>+	"	msr	spsel, #1\n"
>+	"	mov	sp, %0\n" /* Update the overflow stack pointer */
>+	"	msr	spsel, #0"
> 	: "+r" (ovf_sp)
> 	: "r" (per_cpu_offset(0))
> 	: "memory");
>@@ -467,7 +469,7 @@ void __init smp_prepare_boot_cpu(void)
> 	 * setup_per_cpu_areas(), and CPU0's boot time per-cpu area will be
> 	 * freed shortly, so we must move over to the runtime per-cpu area.
> 	 */
>-	set_boot_cpu_offset();
>+	update_boot_cpu_offset_and_overflow_stack();
> 
> 	cpuinfo_store_boot_cpu();
> 	setup_boot_cpu_features();
>diff --git a/arch/arm64/kvm/hyp/entry.S b/arch/arm64/kvm/hyp/entry.S
>index 4c89931a6a92..4d1205d04383 100644
>--- a/arch/arm64/kvm/hyp/entry.S
>+++ b/arch/arm64/kvm/hyp/entry.S
>@@ -31,6 +31,7 @@ SYM_FUNC_START(__guest_enter)
> 	save_callee_saved_regs x1
> 
> 	// Save hyp's sp_el0 and tpidrro_el0
>+	activate_exception_stack
> 	save_sp_el0	x1, x2
> 	save_tpidrro_el0 x1, x2
> 
>@@ -50,6 +51,7 @@ alternative_else_nop_endif
> 	// that would usually be synchonized by the ERET.
> 	isb
> 	mov	x0, #ARM_EXCEPTION_IRQ
>+	deactivate_exception_stack
> 	ret
> 
> 1:
>@@ -167,6 +169,7 @@ SYM_INNER_LABEL(__guest_exit, SYM_L_GLOBAL)
> 	// Restore hyp's sp_el0 and tpidrro_el0
> 	restore_sp_el0 x2, x3
> 	restore_tpidrro_el0 x2, x3
>+	deactivate_exception_stack
> 
> 	// Now restore the hyp regs
> 	restore_callee_saved_regs x2
>diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
>index ad4965d34978..bec7f858fae9 100644
>--- a/arch/arm64/mm/proc.S
>+++ b/arch/arm64/mm/proc.S
>@@ -87,6 +87,7 @@
>  * This must be kept in sync with struct cpu_suspend_ctx in <asm/suspend.h>.
>  */
> SYM_FUNC_START(cpu_do_suspend)
>+	msr	spsel, #1
> 	mrs	x2, tpidr_el0
> 	mrs	x3, tpidrro_el0
> 	mrs	x4, contextidr_el1
>@@ -98,7 +99,7 @@ SYM_FUNC_START(cpu_do_suspend)
> 	mrs	x10, oslsr_el1
> 	mrs	x11, sctlr_el1
> 	get_this_cpu_offset x12
>-	mrs	x13, sp_el0
>+	mov	x13, sp				// SP_EL1
> 	stp	x2, x3, [x0]
> 	stp	x4, x5, [x0, #16]
> 	stp	x6, x7, [x0, #32]
>@@ -114,6 +115,7 @@ alternative_if ARM64_HAS_TCR2
> 	mrs	x2, REG_TCR2_EL1
> 	str	x2, [x0, #104]
> alternative_else_nop_endif
>+	msr	spsel, #0
> 	ret
> SYM_FUNC_END(cpu_do_suspend)
> 
>@@ -121,6 +123,8 @@ SYM_FUNC_END(cpu_do_suspend)
>  * cpu_do_resume - restore CPU register context
>  *
>  * x0: Address of context pointer
>+ *
>+ * Entered with SPSel == 1, returns with SPSel == 0.
>  */
> SYM_FUNC_START(cpu_do_resume)
> 	ldp	x2, x3, [x0]
>@@ -159,7 +163,8 @@ alternative_else_nop_endif
> 
> 	msr	sctlr_el1, x12
> 	set_this_cpu_offset x13
>-	msr	sp_el0, x14
>+	mov	sp, x14				// SP_EL1
>+
> 	/*
> 	 * Restore oslsr_el1 by writing oslar_el1
> 	 */
>@@ -182,6 +187,7 @@ alternative_else_nop_endif
> 
> 	ptrauth_keys_install_kernel_nosync x15, x1, x2, x3
> 	isb
>+	msr	spsel, #0
> 	ret
> SYM_FUNC_END(cpu_do_resume)
> #endif
>

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
