Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3382154A7E1
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873600; cv=none; b=HIzJSRyh7QjEupd0m8qO9U1BFBx+t2Bl8b9w6nXU72A22ceiw5Fx4OBc1fQEgncR9BqA9b5iZdlkAK59Af2Uij2JtXb6pEMQ8yO0DrRKLmPBKNTd7+Xvq5orho+OYvOYpzEtU2OpU44wSBNlPQmZRbZj10vYEgdMYSNyp7DhftE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873600; c=relaxed/simple;
	bh=S/8sBHfxkXoO7mAPy6mrgj0LxG5JBw93vD99BL4bS8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rBr/uwS7dqM49/UbUzSe2D09p2O6vCUjfLt2FiD5Lr0RbEPsKs61ua784mp1DinodWLI6zX5VSNALLBS9AhDMbfmiOQAsKKe3JrfkBEHtOcarU51w4j3V6pWXxJ+eu/ZlMPApMJ+C6tBLMoQWZyN+F2xQnkkHcyNaC3pMXrMZ7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFyUsvBM; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFyUsvBM"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4843e397f74so5200995f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788873596; x=1789478396; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ipsIz6kdEtC3jqxSus30l0DuD/gaAm/0YMo8PCL8/fU=;
        b=CFyUsvBMRuzI0dMFujpupEMyfLp7NKcHvc4ujFj0w+0nKOjmEv0OkJtscLSDPkhBJD
         bJNSJrghJdzVj4WRB/QxLyWLslq/MAKsgggITmSIqx8+pQ1uJcxSwKXe4w30Hh0W+Rn2
         D7TpI/AIHgBn5qSbqu45eX0W/VIiht+ZPY9AKJ6Qh0OsZ2DK6eSgZLwT8dNQJRx1zRuz
         RCfqYN9+cmYbpMWiE5IHx+I/Hgslj9oqTLG2pYN4FhcgOV0p+awbGDTk7rZeVVKmOYzx
         VXFeTsDhAf5aO8tvElPes5V6lRNG960AQbFxu+ZXAg5RS5P0qynnAA2VPHdlgVBXowH4
         FMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788873596; x=1789478396;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ipsIz6kdEtC3jqxSus30l0DuD/gaAm/0YMo8PCL8/fU=;
        b=HmIZD0S3tlaKZExsRQDpfH5B63vfe0omM4H9wN9hxl/9TsyuHdXoji5sKg9ZJ0ipfy
         dVAplb0IjqIKGTS7/e2mCntmsSDWpHB55ozlSmolZmVKQG6aZh07fk7RKwVhY/8FakFa
         U6muw1hQKFNN0LDzqskboQG+OMaCx7UDkP2F8tI3ZgICIehKp85Xn2jZp/im/vsw3bZ7
         phOHd04zc2VDeuuC0R/22Q+uXCvvsHESbfcC6+pcvUInYJkek9+z0bmai9Al7bcl66KU
         dtTBdlNuRnyoFaNcHk05FpuvAdxJKs6reTRg9K/HktKUgO9rqbFuOjwRcsLwQmVWVWAm
         gn/A==
X-Forwarded-Encrypted: i=1; AKwUvBy7v2HUtBsgUTHvEWOYc+q4wppfF/0LXWOi0MF/RcRBBJspQ88TM1QfVYBhjzEVWzGkhVhUMVra1vu/AqM=@vger.kernel.org
X-Gm-Message-State: AFuF++kGRAhDW+9kELW+lD8AbU3iqpC1/rMXJ903jQZf8AjbdxVdff0t
	GXJYB3bww1wthdBP9dih8tm/WlQLjErvivq+Qf1MolOfsiTO/VO47Lxc
X-Gm-Gg: AYBFou1dD9aJ7PdOARi+SLmQ+JKrDTiiDEDRPqzCRSbuiCnWQY6a6LL8p1XJZflw1Om
	IaUrllCHz2yDclNTM9v78fkrZ1TLNXN7Fxior5HYCv/0/yRHK2T2l4FHxUqEq7lwTmI+3P9cbNU
	8X0+omRgKnqP1De/BPP24YAyQy30rjfVfGz+iUfrmB41oAeucejNzTZkhLMnu4yl+sx4ogR6niH
	G/P1GtIgChIb3HUAu/mA5wATHko/bWIiZvgQxUgYkGV1SGF8+XaZg8PQ1dF7NT31DneJIjwePn6
	vnhsyfcXAhvh6ZOujVhgJsiBpnlIFdESUHn8bkrYT9Hf8vVcZQWXofV/I71YEUW/ZZQln/+wIk/
	CZBoR337DbG3JpdLjseLXPis0u7QlunOoLR+75qEc7YIWB4auX/3ag9TlDkHR8Br4eUURCbGQkP
	uEKAtlJUtHQNDZsIWu/ScmAeHX0Y87fFI14SGNLQyETwsiIFur2Ys4xKl8s9ObQC7SMsDkfvUac
	3EQCqRujAljgI2BDyvLyt/2hZU=
X-Received: by 2002:adf:e011:0:20b0:485:8e0c:641e with SMTP id ffacd0b85a97d-4858e0c648bmr19675304f8f.22.1788873595165;
        Tue, 08 Sep 2026 06:19:55 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485881353e8sm36104336f8f.1.2026.09.08.06.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:19:54 -0700 (PDT)
Date: Tue, 8 Sep 2026 14:19:50 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Arnd
 Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>, Ada Couprie
 Diaz <ada.coupriediaz@arm.com>, David Hildenbrand <david@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Vladimir Murzin
 <vladimir.murzin@arm.com>, Mark Rutland <mark.rutland@arm.com>, Mostafa
 Saleh <smostafa@google.com>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton
 <oupton@kernel.org>, Linus Walleij <linusw@kernel.org>, Marc Zyngier
 <maz@kernel.org>
Subject: Re: [PATCH 06/21] arm64: Store 'current' in TPIDRRO_EL0 instead of
 SP_EL0
Message-ID: <20260908141950.37e9ed3d@pumpkin>
In-Reply-To: <20260907164247.17223-7-will@kernel.org>
References: <20260907164247.17223-1-will@kernel.org>
	<20260907164247.17223-7-will@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  7 Sep 2026 17:42:31 +0100
Will Deacon <will@kernel.org> wrote:

> To make SP_EL0 available to point at the per-cpu kernel overflow stack,
> we must relocate 'current' elsewhere. With TPIDRRO_EL0 now restored late
> in the return-to-user path, we can otherwise use it to hold 'current'
> and update the various accessors accordingly.
> 
> Move 'current' from SP_EL0 to TPIDRRO_EL0.

Is it worth having a #define for the name of the register that stores 'current'?
(And probably the other similar registers.)
That would avoid the bisection problems with the following two patches
and might make other code a bit more readable.

David

> 
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/assembler.h |  2 +-
>  arch/arm64/include/asm/current.h   |  6 +++---
>  arch/arm64/kernel/entry.S          | 20 ++++++++++----------
>  arch/arm64/kernel/head.S           |  2 +-
>  arch/arm64/kernel/process.c        |  5 +++--
>  arch/arm64/net/bpf_jit_comp.c      |  4 ++--
>  6 files changed, 20 insertions(+), 19 deletions(-)
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
>  			break;
>  		}
>  

