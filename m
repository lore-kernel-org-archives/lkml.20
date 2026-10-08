Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDF43E4111
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791444593; cv=none; b=IzFDSod6VkLrX0N+rXlNtKvrBr7qOkKXPiPV9qVoL9xVbmZtViBZsk8hOyy5dEk5rZmz65HPi2LAt1W9n8xhCb8N5XF34vdFUQ4tbO64CiPtIbkYdqqo/981QrwfeLc6Xn6CeMaiEq/7IPVQsKnXf480p5bQug355e2cPoIC43U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791444593; c=relaxed/simple;
	bh=ovM0o5ZgCJzR+aix2/0EhxC6bMkng7yjJofXLt1aGF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QpRIi8Vv2DkbEmWVUw32Wm28h3rNnaKo3E4vpNamVRjUST8FMqbGTPFHI7api4KA2FQXXtPOhJ56feSgofdwCNZ0eNOq0Vh3nuTUE5xeo9bj/hVNRNLraeb5xM/T9Zp6aQTLs5vvVJOjVSg36lIaIDfb+/NsAynaI3iEzUvn9ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=5AJw1kpa; arc=none smtp.client-ip=113.46.200.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="5AJw1kpa"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=5h4RUDwLl6q6NNkyyXSv+HLvqprnezmOD4oTYZHfjVs=;
	b=5AJw1kpaY19uBNgU1HPv2tYu+t0ne/hllqei+jqs0d+IN/XkgZ6fVg1HF+3dffPywB61qacDM
	HNlsE6amyfLO1+CQWp7+sz4OYb3/wJvqXhHLeqsx2uXeCtamXXYUibYg43k96Hpw1yex/ohIf2n
	MaP9lBvw6ANs85/Ruk9h4gM=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4j0hCZ1mzXz12LHh;
	Thu,  8 Oct 2026 15:17:46 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id C37B040575;
	Thu,  8 Oct 2026 15:29:43 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 8 Oct
 2026 15:29:42 +0800
Message-ID: <479c4658-3c29-4a65-8c5b-36aad0bbb568@huawei.com>
Date: Thu, 8 Oct 2026 15:29:41 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/21] arm64: Store 'current' in TPIDRRO_EL0 instead of
 SP_EL0
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Ard
 Biesheuvel <ardb@kernel.org>, Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	David Hildenbrand <david@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Mostafa Saleh <smostafa@google.com>, Lorenzo
 Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Linus Walleij
	<linusw@kernel.org>, Marc Zyngier <maz@kernel.org>
References: <20260918161407.2300-1-will@kernel.org>
 <20260918161407.2300-7-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260918161407.2300-7-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/9/19 0:13, Will Deacon 写道:
> To make SP_EL0 available to point at the per-cpu kernel overflow stack,
> we must relocate 'current' elsewhere. With TPIDRRO_EL0 now restored late
> in the return-to-user path, we can otherwise use it to hold 'current'
> and update the various accessors accordingly.
> 
> Move 'current' from SP_EL0 to TPIDRRO_EL0.
> 
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/assembler.h |  2 +-
>  arch/arm64/include/asm/current.h   |  6 +++---
>  arch/arm64/kernel/entry.S          | 20 ++++++++++----------
>  arch/arm64/kernel/head.S           |  2 +-
>  arch/arm64/kernel/process.c        |  5 +++--
>  arch/arm64/mm/proc.S               |  6 +++++-
>  arch/arm64/net/bpf_jit_comp.c      |  4 ++--
>  7 files changed, 25 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
> index 0b58b550e8dc..fd1ae5337935 100644
> --- a/arch/arm64/include/asm/assembler.h
> +++ b/arch/arm64/include/asm/assembler.h
> @@ -587,7 +587,7 @@ alternative_else_nop_endif
>   * Return the current task_struct.
>   */
>  	.macro	get_current_task, rd
> -	mrs	\rd, sp_el0
> +	mrs	\rd, tpidrro_el0
>  	.endm
>  
>  /*
> diff --git a/arch/arm64/include/asm/current.h b/arch/arm64/include/asm/current.h
> index c92912eaf186..8c7efac05394 100644
> --- a/arch/arm64/include/asm/current.h
> +++ b/arch/arm64/include/asm/current.h
> @@ -14,11 +14,11 @@ struct task_struct;
>   */
>  static __always_inline struct task_struct *get_current(void)
>  {
> -	unsigned long sp_el0;
> +	unsigned long tpidrro_el0;
>  
> -	asm ("mrs %0, sp_el0" : "=r" (sp_el0));
> +	asm ("mrs %0, tpidrro_el0" : "=r" (tpidrro_el0));
>  
> -	return (struct task_struct *)sp_el0;
> +	return (struct task_struct *)tpidrro_el0;
>  }
>  
>  #define current get_current()
> diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
> index b5d8277f608a..a45be0a837c8 100644
> --- a/arch/arm64/kernel/entry.S
> +++ b/arch/arm64/kernel/entry.S
> @@ -81,9 +81,9 @@
>  	/* Stash the original SP (minus PT_REGS_SIZE) in tpidr_el0. */
>  	msr	tpidr_el0, x0
>  
> -	/* Recover the original x0 value and stash it in tpidrro_el0 */
> +	/* Recover the original x0 value and stash it in sp_el0 */
>  	sub	x0, sp, x0
> -	msr	tpidrro_el0, x0
> +	msr	sp_el0, x0
>  
>  	/* Switch to the overflow stack */
>  	adr_this_cpu sp, overflow_stack + OVERFLOW_STACK_SIZE, x0
> @@ -99,7 +99,7 @@
>  
>  	/* We were already on the overflow stack. Restore sp/x0 and carry on. */
>  	sub	sp, sp, x0
> -	mrs	x0, tpidrro_el0
> +	mrs	x0, sp_el0
>  	b	el\el\ht\()_\regsize\()_\label
>  	.endif
>  .org .Lventry_start\@ + 128	// Did we overflow the ventry slot?
> @@ -226,7 +226,7 @@ alternative_cb_end
>  	clear_gp_regs
>  	mrs	x21, sp_el0
>  	ldr_this_cpu	tsk, __entry_task, x20
> -	msr	sp_el0, tsk
> +	msr	tpidrro_el0, tsk
>  
>  	/*
>  	 * Ensure MDSCR_EL1.SS is clear, since we can unmask debug exceptions
> @@ -548,7 +548,7 @@ SYM_CODE_START_LOCAL(__bad_stack)
>  	 */
>  
>  	/* Restore the original x0 value */
> -	mrs	x0, tpidrro_el0
> +	mrs	x0, sp_el0
>  
>  	/*
>  	 * Store the original GPRs to the new stack. The orginal SP (minus
> @@ -843,7 +843,7 @@ SYM_FUNC_START(cpu_switch_to)
>  	ldp	x29, x9, [x8], #16
>  	ldr	lr, [x8]
>  	mov	sp, x9
> -	msr	sp_el0, x1
> +	msr	tpidrro_el0, x1
>  	ptrauth_keys_install_kernel x1, x8, x9, x10
>  	scs_save x0
>  	scs_load_current
> @@ -1031,11 +1031,11 @@ SYM_CODE_START(__sdei_asm_handler)
>  
>  	/*
>  	 * We may have interrupted userspace, or a guest, or exit-from or
> -	 * return-to either of these. We can't trust sp_el0, restore it.
> +	 * return-to either of these. We can't trust tpidrro_el0, restore it.
>  	 */
> -	mrs	x28, sp_el0
> +	mrs	x28, tpidrro_el0
>  	ldr_this_cpu	dst=x0, sym=__entry_task, tmp=x1
> -	msr	sp_el0, x0
> +	msr	tpidrro_el0, x0
>  
>  	/* If we interrupted the kernel point to the previous stack/frame. */
>  	and     x0, x3, #0xc
> @@ -1051,7 +1051,7 @@ SYM_CODE_START(__sdei_asm_handler)
>  	mov	x1, x19
>  	bl	__sdei_handler
>  
> -	msr	sp_el0, x28
> +	msr	tpidrro_el0, x28
>  	/* restore regs >x17 that we clobbered */
>  	mov	x4, x19         // keep x4 for __sdei_asm_exit_trampoline
>  	ldp	x28, x29, [x4, #SDEI_EVENT_INTREGS + 16 * 14]
> diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
> index 87a822e5c4ca..c33551ee6572 100644
> --- a/arch/arm64/kernel/head.S
> +++ b/arch/arm64/kernel/head.S
> @@ -193,7 +193,7 @@ SYM_CODE_END(preserve_boot_args)
>  	 * for consistency with user tasks and kthreads.
>  	 */
>  	.macro	init_cpu_task tsk, tmp1, tmp2
> -	msr	sp_el0, \tsk
> +	msr	tpidrro_el0, \tsk
>  
>  	ldr	\tmp1, [\tsk, #TSK_STACK]
>  	add	sp, \tmp1, #THREAD_SIZE
> diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> index bfdc12166895..79a19be88ced 100644
> --- a/arch/arm64/kernel/process.c
> +++ b/arch/arm64/kernel/process.c
> @@ -551,8 +551,9 @@ static void ssbs_thread_switch(struct task_struct *next)
>  }
>  
>  /*
> - * We store our current task in sp_el0, which is clobbered by userspace. Keep a
> - * shadow copy so that we can restore this upon entry from userspace.
> + * We store our current task in tpidrro_el0, which is clobbered when returning
> + * to userspace. Keep a shadow copy so that we can restore this upon entry from
> + * userspace.
>   *
>   * This is *only* for exception entry from EL0, and is not valid until we
>   * __switch_to() a user task.
> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
> index 12aacc74f764..ad4965d34978 100644
> --- a/arch/arm64/mm/proc.S
> +++ b/arch/arm64/mm/proc.S
> @@ -129,6 +129,10 @@ SYM_FUNC_START(cpu_do_resume)
>  	ldp	x9, x10, [x0, #48]
>  	ldp	x11, x12, [x0, #64]
>  	ldp	x13, x14, [x0, #80]
> +
> +	/* Move 'current' somewhere safe */
> +	mov	x15, x3
> +
>  	/*
>  	 * Restore x18, as it may be used as a platform register, and clear
>  	 * the buffer to minimize the risk of exposure when used for shadow
> @@ -176,7 +180,7 @@ alternative_if ARM64_HAS_GIC_PRIO_MASKING
>  alternative_else_nop_endif
>  #endif
>  
> -	ptrauth_keys_install_kernel_nosync x14, x1, x2, x3
> +	ptrauth_keys_install_kernel_nosync x15, x1, x2, x3
>  	isb
>  	ret
>  SYM_FUNC_END(cpu_do_resume)
> diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
> index c18e005a41db..51d853b92443 100644
> --- a/arch/arm64/net/bpf_jit_comp.c
> +++ b/arch/arm64/net/bpf_jit_comp.c
> @@ -1694,7 +1694,7 @@ static int build_insn(const struct bpf_verifier_env *env, const struct bpf_insn
>  		if (insn->src_reg == 0 && insn->imm == BPF_FUNC_get_smp_processor_id) {
>  			cpu_offset = offsetof(struct thread_info, cpu);
>  
> -			emit(A64_MRS_SP_EL0(tmp), ctx);
> +			emit(A64_MRS_TPIDRRO_EL0(tmp), ctx);
>  			if (is_lsi_offset(cpu_offset, 2)) {
>  				emit(A64_LDR32I(r0, tmp, cpu_offset), ctx);
>  			} else {
> @@ -1707,7 +1707,7 @@ static int build_insn(const struct bpf_verifier_env *env, const struct bpf_insn
>  		/* Implement helper call to bpf_get_current_task/_btf() inline */
>  		if (insn->src_reg == 0 && (insn->imm == BPF_FUNC_get_current_task ||
>  					   insn->imm == BPF_FUNC_get_current_task_btf)) {
> -			emit(A64_MRS_SP_EL0(r0), ctx);
> +			emit(A64_MRS_TPIDRRO_EL0(r0), ctx);

Since A64_MRS_SP_EL0 is no longer used after this, can it be removed?

>  			break;
>  		}
>  

-- 
Best regards,
Jinjie

