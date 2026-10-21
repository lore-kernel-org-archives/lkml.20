Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792612304;
	b=wp42hVcQUW5Q0SqoP0RkGgj5EmmND7pS4rxsHNHbsPeUwPMXTUY9NZC7ANBK7x86rpKD
	 0KfLEE+OeoHk9EIk1ROdOtgb9HHti1J8xBGQKUOMKjjB5S9QGgf4N2aQYZ8Lca0hb/k33
	 R8SC1JvQroMHx797EfV9yNhI+i3l6wr9SfA0faQpSn/90sTQOJZQwTenISWUXSUidji6z
	 Ut0RsqEJSzuSs7kSQ2jIjaFOy0nz+RrRPCvyuamx8kExS62E5vod6+sBiigEYtu7lVMVX
	 4e/5KQ5sp+0A12LLe2Kv5oUGI/nMrIx/nJwnWY4CquAc4MvZv8u8SYg2Vi+FHdIXzWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612304;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Subject:To:Cc:From:
	 Date:References:In-Reply-To:Message-Id;
	bh=CMd/HW2pW0yVVi6pmIPRORmq6whHKPez7Zkei9lYWnk=;
	b=i7fuBGwrlFVb+OVDHG5wcC7XFBz/ZjtQ2UeQIiaJpLB5JLnqoeehAsUyNB0L11CfyBGt
	 9B5Dn5mkuSzcagzZk4TJN2bVymTD3mNzALR5H4RhJNanHYQWViihwj8wrPRQsBbFQrFn6
	 MaOsIdslUR7dopTk7bU6TbaheUACKk78TyrOg72/UGvoaxYMpaj1OLQ8iBu4f1K4GKTx1
	 NzJdzzYal5IVx1Su8Z1ptiBdT6mim7BpjzRVOUMlvA1cufcfEiYqpftoHLc1WRTY4fU8w
	 RyvtJJfDjSPYOFikJFLSJY4JU8M9audgU6DgQsFg2c2TQ+61S2vI+M1K2tfQW39NTmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eJvkyfF2;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111B560A2602
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:51:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 111B560A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eJvkyfF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792612304; x=1824148304;
  h=subject:to:cc:from:date:references:in-reply-to:
   message-id;
  bh=D/CAo1/W8SnbOOrpFBj1NA9A9DSuO0dZpoccbJXxjJk=;
  b=eJvkyfF2q3WbTKRok2TwpYatElVYgrHKrQSEGKcZAFkPGS887oU72GST
   ShkiD52Lr0okoooXcvJ39uvMGvhjKKzmRg3oKqUkQ6+15L9oAFs7TW18M
   nnXkbwnkJcNWl6tEWXY55olhHEGgJVQrjPSj70HT50PEjRK4E8Xg9e6/z
   ZBMo17BmB6aoRA7IrJ2jyd6l4IS/OJWlJ4Ivaj3zPKFZ/sk7Q8d/KAjMl
   2Z/OY4mBU19bOdze1PdHx5aP+JG3/UNvChf74Y/zqnNSbzLprFVDZ0ECP
   QIfVSL2xIgWa9l5WWZJWL/ukqkneYa0G02sSNfAOyF9+OqfSHzBSKIJxN
   g==;
X-CSE-ConnectionGUID: Tt39cycXS7e9tqQLI36i0w==
X-CSE-MsgGUID: bGAGCSS2Rwuaydlvy+K0yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1230215"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1230215"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:51:44 -0700
X-CSE-ConnectionGUID: okksbNhtTuasA2Jb2DD/eg==
X-CSE-MsgGUID: QS0mwX57QC2+/kPEtsAAvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3092198"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by orviesa007.jf.intel.com with ESMTP; 21 Oct 2026 12:51:43 -0700
Subject: [RFC][PATCH 17/24] x86/task: Context switch the kernel shadow stack register value
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Edgecombe, Rick P <rick.p.edgecombe@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, the arch/x86 maintainers <x86@kernel.org>, Kees Cook <kees@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Wed, 21 Oct 2026 12:51:43 -0700
References: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
In-Reply-To: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
Message-Id: <20261021195143.2C8D21DD@davehans-spike.ostc.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list


This is the spot where things go off the rails. As I look at this, I
think it may be a mistake to permit a shadow-stack kernel to have non
shadow-stack tasks. It would just be too easy to leverage turn the
ability to set kshstk_ssp=0 into a control flow hijack.

This is also *not* the way the architecture intended context switching
to go. Feedback here would be much appreciated.

I'll continue on describing what is here.

The basic problem set:
 1. SSP needs to be context-switched just like RSP:
  1a. The kernel SSP value is discrete from the user SSP value
  1b. The kernel SSP value needs storage space
 2. At *least* the init task does not have a shadow stack mapping. The
    expectation is that there will be other tasks. For instance, a
    "permissive" mode after a shadow stack violation where the kernel
    warns and keeps on running.

== Solution ==

First, establish and maintain kernel SSP storage at:

	thread_struct->kshstk_ssp

A 0 value means that the task does not use kernel shadow stacks.

Second, drive MSR_IA32_S_CET from that value. If it is 0, then
clear CET_SHSTK_EN|CET_WRSS_EN during the context switch. If it
is non-zero set those bits.

Third, save and restore the kernel SSP value. This is substantially
more complicated than RSP switching because SSP is not directly
accessible and needs to be loaded with RSTORSSP, which is picky.
It's not picky for no reason. It is *intentionally* picky to foil
stack pivoting attacks. Before it will write SSP, it requires an
in-memory "restore token" be present on the shadow stack.

Just like the regular stack, this switch *must* be done in
assembly.

== Optimizations ==

    <<<
    These are probably all silly to talk about at this point if a
    over over to the more correct RSTORSSP/SAVEPREVSSP is made.
    >>>

First, TASK_thread_kshstk_ssp() will always be 0 when kernel shadow
stacks are disabled. This could be ALTERNATIVE()'d out to a plain
jump without the MOV and TEST.

Second, the ENABLE/DISABLE macros could avoid the WRMSR when it is
not changing values.

It might be possible to move the assembly logic like the
MSR_IA32_S_CET or restore token calculations out to C.

---

 b/arch/x86/entry/entry_64.S        |   87 +++++++++++++++++++++++++++++++++++++
 b/arch/x86/include/asm/processor.h |    4 +
 b/arch/x86/include/asm/shstk.h     |    3 +
 b/arch/x86/kernel/asm-offsets.c    |    3 +
 4 files changed, 97 insertions(+)

diff -puN arch/x86/entry/entry_64.S~per-task-ssp-storage arch/x86/entry/entry_64.S
--- a/arch/x86/entry/entry_64.S~per-task-ssp-storage	2026-10-21 12:36:40.914886779 -0700
+++ b/arch/x86/entry/entry_64.S	2026-10-21 12:36:40.948886844 -0700
@@ -34,6 +34,7 @@
 #include <asm/percpu.h>
 #include <asm/asm.h>
 #include <asm/smap.h>
+#include <asm/shstk.h>
 #include <asm/pgtable_types.h>
 #include <asm/frame.h>
 #include <asm/trapnr.h>
@@ -169,6 +170,87 @@ SYM_INNER_LABEL(entry_SYSRETQ_end, SYM_L
 	int3
 SYM_CODE_END(entry_SYSCALL_64)
 
+.macro SAVE_KERNEL_SHADOW_STACK
+#ifdef CONFIG_X86_KERN_SHADOW_STACK
+	/* kshstk_ssp==0 means no kernel shadow stack, skip handling */
+	cmpq	$0, TASK_thread_kshstk_ssp(%rdi)
+	je	.Lprev_no_shstk\@
+	rdsspq	%rax
+	movq	%rax, TASK_thread_kshstk_ssp(%rdi)
+.Lprev_no_shstk\@:
+#endif
+.endm
+
+.macro ENABLE_KERNEL_SHADOW_STACK
+	movl	$MSR_IA32_S_CET, %ecx
+	rdmsr
+	orl	$(CET_SHSTK_EN | CET_WRSS_EN), %eax
+	wrmsr
+.endm
+
+.macro DISABLE_KERNEL_SHADOW_STACK
+	movl	$MSR_IA32_S_CET, %ecx
+	rdmsr
+	andl	$~(CET_SHSTK_EN | CET_WRSS_EN), %eax
+	wrmsr
+.endm
+
+/*
+ * Clobbers rax, rcx, rdx, r8, r9. rdi/rsi must survive for the rest
+ * of __switch_to_asm.
+ *
+ * Dumb and slow. Always does WRMSR, regardless of if changes need to
+ * be made.
+ */
+.macro LOAD_KERNEL_SHADOW_STACK
+#ifdef CONFIG_X86_KERN_SHADOW_STACK
+	movq	TASK_thread_kshstk_ssp(%rsi), %r8
+	testq	%r8, %r8
+	jz	.Lnext_no_shstk\@
+
+	ENABLE_KERNEL_SHADOW_STACK
+
+	/*
+	 * This should be just a:
+	 *
+	 * 	rstorssp
+	 * 	saveprevssp
+	 *
+	 * sequence. But, currently, the previous task might not
+	 * have a valid SSP, like the init_task. This needs fixing.
+	 * But, for now, just hack a Prev-SSP token in.
+	 *
+	 * The right fix is to give all tasks a valid SSP universally
+	 * and then initialize the token once at task creation time,
+	 * probably near the spot that ret_from_fork_asm is also
+	 * written to the shadow stack.
+	 */
+	leaq	-8(%r8), %r9
+	movq	%r8, %rax
+	/*
+	 * Set type=0. Indicates a "Restore token" to satisfy RSTORSSP:
+	 * Set mode=1. Indicates 64-bit mode.
+	 * */
+	orq	$SHSTK_TOKEN_MODE64, %rax
+	wrssq	%rax, (%r9)
+
+	rstorssp (%r9)
+
+	/*
+	 * Discard the Previous-SSP token left by RSTORSSP.
+	 *
+	 * This will go away once SAVEPREVSSP is being used properly.
+	 */
+	movl	$1, %eax
+	incsspq	%rax
+	jmp	.Lshstk_done\@
+
+.Lnext_no_shstk\@:
+	DISABLE_KERNEL_SHADOW_STACK
+.Lshstk_done\@:
+#endif
+.endm
+
 /*
  * %rdi: prev task
  * %rsi: next task
@@ -191,6 +273,8 @@ SYM_FUNC_START(__switch_to_asm)
 	movq	%rsp, TASK_threadsp(%rdi)
 	movq	TASK_threadsp(%rsi), %rsp
 
+	SAVE_KERNEL_SHADOW_STACK
+
 #ifdef CONFIG_STACKPROTECTOR
 	movq	TASK_stack_canary(%rsi), %rbx
 	movq	%rbx, PER_CPU_VAR(__stack_chk_guard)
@@ -205,6 +289,9 @@ SYM_FUNC_START(__switch_to_asm)
 	 */
 	FILL_RETURN_BUFFER %r12, RSB_CLEAR_LOOPS, X86_FEATURE_RSB_CTXSW
 
+	/* Note that this clobbers tons of stuff: */
+	LOAD_KERNEL_SHADOW_STACK
+
 	/* restore callee-saved registers */
 	popq	%r15
 	popq	%r14
diff -puN arch/x86/include/asm/processor.h~per-task-ssp-storage arch/x86/include/asm/processor.h
--- a/arch/x86/include/asm/processor.h~per-task-ssp-storage	2026-10-21 12:36:40.927886804 -0700
+++ b/arch/x86/include/asm/processor.h	2026-10-21 12:36:40.949886846 -0700
@@ -532,6 +532,10 @@ struct thread_struct {
 
 	struct thread_shstk	shstk;
 #endif
+#ifdef CONFIG_X86_KERN_SHADOW_STACK
+	/* Kernel shadow stack register: */
+	void *kshstk_ssp;
+#endif
 };
 
 #ifdef CONFIG_X86_DEBUG_FPU
diff -puN arch/x86/include/asm/shstk.h~per-task-ssp-storage arch/x86/include/asm/shstk.h
--- a/arch/x86/include/asm/shstk.h~per-task-ssp-storage	2026-10-21 12:36:40.943886835 -0700
+++ b/arch/x86/include/asm/shstk.h	2026-10-21 12:36:40.949886846 -0700
@@ -2,6 +2,9 @@
 #ifndef _ASM_X86_SHSTK_H
 #define _ASM_X86_SHSTK_H
 
+#define SHSTK_TOKEN_MODE64	BIT_ULL(0) /* Token created in 64-bit mode */
+#define SHSTK_TOKEN_TYPE	BIT_ULL(1) /* Types: Restore: 0, Prev-SSP: 1 */
+
 #ifndef __ASSEMBLER__
 #include <linux/types.h>
 
diff -puN arch/x86/kernel/asm-offsets.c~per-task-ssp-storage arch/x86/kernel/asm-offsets.c
--- a/arch/x86/kernel/asm-offsets.c~per-task-ssp-storage	2026-10-21 12:36:40.945886838 -0700
+++ b/arch/x86/kernel/asm-offsets.c	2026-10-21 12:36:40.949886846 -0700
@@ -43,6 +43,9 @@ static void __used common(void)
 
 	BLANK();
 	OFFSET(TASK_threadsp, task_struct, thread.sp);
+#ifdef CONFIG_X86_KERN_SHADOW_STACK
+	OFFSET(TASK_thread_kshstk_ssp, task_struct, thread.kshstk_ssp);
+#endif
 #ifdef CONFIG_STACKPROTECTOR
 	OFFSET(TASK_stack_canary, task_struct, stack_canary);
 #endif
_
