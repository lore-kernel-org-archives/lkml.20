Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0286F414401
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789069928; cv=none; b=mCRC/Eb8ZeUcjNJQnCKQ7L4AerlK1Vq7Kp0eH1dpJaSgdZDjV+7KPDVdRNdLNgQIqvN1qPM+AU9hrDYuaDcv+DIlAmRXGHrTfhcA5I40PCbjVSZBf4Ng5gOHIBzqrmdTgKemdYYXP1/7ImNFcOlEF3d3f8im3iWPhZ8oYzRkddU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789069928; c=relaxed/simple;
	bh=EHLb4SmpU1oE83O+JN2X5ysdCnu2fpkD52HArv2bBeg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OZnrdrBinTc/YuIrnWfIZ/15oekkO8/jBJIZoHmhqBtGcfUwUXW+u6Jp5Zm1BON5RsNxxjN/ZW2ZnOamLFJvfyyUCnYr4lqAC5o8oBm1AgLwb9WpVnAvyt3XLngz3OtmOBEDLkCLq7QKRq7BWtNXYS/JRMUGcVbKb2hJZxo6YD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GGIL8Jb8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GGIL8Jb8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3F51F000FF;
	Thu, 10 Sep 2026 19:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789069925;
	bh=+Jp06JalmIDfS2oWH9CgU7PxD6G7wEdQ/aBTCpsKVrw=;
	h=From:Date:Subject:To:Cc;
	b=GGIL8Jb8jYuJqDbfAO2qnNJiN36GsXfNYqqJzrELgGUrwLEacNbIA4D74tIq+Rjlx
	 9SCuSw0BgspsNJWc253hZFwFqjMacru1v1thVRB1uRtXd9YCv7A2S5AobKCnxRY0ep
	 rJewaADTKrCwXlb91gAcWuxmH8sFcAfrU+gS9DYEOIh+/1v22O7sjUFynHw6WTBVDG
	 fud+HNKxLWF2kaWd48SacwH6bzAzt4keFhmDhsRabbMVSQdj+4kDyMrK1lOL7jXxPo
	 cap6s5YohQ2OH4944MT2l8BxbKaQ5qMavxKsG/0cNRkFtYat5vJr++2w20nLnBrzsd
	 PGWljUy+vplvQ==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 10 Sep 2026 21:52:00 +0200
Subject: [PATCH v3] ARM: entry: Convert IRQ handling to generic IRQ entry
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-arm-generic-irq-entry-v7-1-v3-1-5fd90f6859e1@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NzQ6CMBAGX8X0bE1boAVPvofxAGWB+lN0i42E8
 O62GGO8cNlkkm9nJuIADTiy30wEwRtnehsg2W6I7krbAjV1YCKYkEwKQUu80RZs+NLU4IOCHXC
 kXlFOm0ZqXktd6DQnQXBHaMxrkR9PH3bP6gx6iMa46IwbehyXuudx9w0layHPY01kulRMFZBUh
 wugheuux5bEkhc/V87kqkuEk9S1UqmqRCbVn2ue5zfsvVNvIwEAAA==
X-Change-ID: 20260622-arm-generic-irq-entry-v7-1-ff6c1d6c9c48
To: "Paul E. McKenney" <paulmck@kernel.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>, Arnd Bergmann <arnd@arndb.de>, 
 Russell King <linux@armlinux.org.uk>, Oleg Nesterov <oleg@redhat.com>, 
 Thomas Gleixner <tglx@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

Bring ARM to the same level of generic-ness as ARM64 by enabling
GENERIC_IRQ_ENTRY.

Route ARM IRQ entry through C wrappers that use the generic IRQ entry
helpers. Conversely put the FIQ entry under the generic NMI-style entry
helpers.

Select GENERIC_IRQ_ENTRY, add the ARM entry prototypes, and provide
regs_irqs_disabled() for the generic IRQ entry return path.

The kernel-mode IRQ return path relies on the generic IRQ entry
preemption handling, matching the arm64 structure and avoiding the old
assembly reschedule check.

The reschedule check is now done in raw_irqentry_exit_cond_resched()
in kernel/entry/common.c.

User-mode IRQs __irq_usr is neither calling ct_user_exit/enter
or asm_trace_hardirqs_off/on anymore. The corresponding calls happen on
irqentry_enter/exit() call paths, e.g the irq-disabled C variants
__ct_user_exit/enter() are called instead.

As __irq_usr no longer returns by jumping to ret_to_user_from_irq,
the corresponding code has been inlined, except the slow_work_pending
part, which is now also handled by generic entry. ret_to_user_from_irq
is only called from v7m so it has been renamed accordingly.

arch_do_signal_or_restart() is required, but we only need a very small
stub, since we keep the existing syscall restart code around in
assembly.

Selecting GENERIC_IRQ_ENTRY also enables optimized handling for extended
rseq registrations. Record non-syscall user entry for data aborts,
prefetch aborts and undefined instructions with
rseq_note_user_irq_entry() so signal delivery aborts an interrupted
rseq critical section. Clear the rseq events on the legacy return path
after pending work completes, before returning to userspace, so
user_irq cannot leak into a later syscall. Keep the existing assembly
context-tracking calls on these paths.

Tested with a multi_v7_defconfig-based configuration on QEMU
vexpress-a15 using vexpress-v2p-ca15-tc1.dtb. Extended-rseq signal-frame
tests pass for data aborts, prefetch aborts and undefined instructions
(100 cases each). Legacy rseq and ARM/Thumb userspace entry tests also
pass, as does a Debian boot and clean poweroff.

A note on V7M: the reason we cannot switch the V7M entry over to generic
entry is that it raises a "pendable service call" ("pendv") exception to
process deferred work at the end of the interrupt handler. This is done
so higher priority work can come in. This has no corresponding structure
in other ARM cores.

This is a reduced patch based on the earlier generic entry series
avoiding all the syscall handling changes.

Link: https://lore.kernel.org/linux-arm-kernel/20250420-arm-generic-entry-v6-0-95f1fcdfeeb2@linaro.org/
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Changes in v3:
- Rebased on v7.3-rc1.
- Fix rseq abort handling for synchronous userspace exceptions.
- Link to v2: https://patch.msgid.link/20260806-arm-generic-irq-entry-v7-1-v2-1-3dd7747b2567@kernel.org

Changes in v2:
- Rebase on v7.2-rc1
- Select GENERIC_IRQ_ENTRY also for V7M even if this platform is not
  using it, in order to properly link the image.
- Link to v1: https://patch.msgid.link/20260623-arm-generic-irq-entry-v7-1-v1-1-f25ca7079e3b@kernel.org
---
 arch/arm/Kconfig                    |  1 +
 arch/arm/include/asm/entry-common.h |  7 ++++
 arch/arm/include/asm/entry.h        | 12 ++++++
 arch/arm/include/asm/ptrace.h       |  7 +++-
 arch/arm/kernel/Makefile            |  2 +-
 arch/arm/kernel/entry-armv.S        | 78 +++++++++----------------------------
 arch/arm/kernel/entry-common.S      |  8 +++-
 arch/arm/kernel/entry-header.S      |  7 +++-
 arch/arm/kernel/entry-v7m.S         |  2 +-
 arch/arm/kernel/entry.c             | 61 +++++++++++++++++++++++++++++
 arch/arm/kernel/irq.c               |  6 +++
 arch/arm/kernel/irq.h               |  2 +
 arch/arm/kernel/signal.c            |  6 +++
 13 files changed, 134 insertions(+), 65 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index ffbc7f386131..da177b212ce1 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -72,6 +72,7 @@ config ARM
 	select GENERIC_CPU_AUTOPROBE
 	select GENERIC_CPU_DEVICES
 	select GENERIC_EARLY_IOREMAP
+	select GENERIC_IRQ_ENTRY
 	select GENERIC_IDLE_POLL_SETUP
 	select GENERIC_IRQ_MULTI_HANDLER
 	select GENERIC_IRQ_PROBE
diff --git a/arch/arm/include/asm/entry-common.h b/arch/arm/include/asm/entry-common.h
new file mode 100644
index 000000000000..c017df5f39d5
--- /dev/null
+++ b/arch/arm/include/asm/entry-common.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_ARM_ENTRY_COMMON_H
+#define __ASM_ARM_ENTRY_COMMON_H
+
+#include <asm/stacktrace.h>
+
+#endif
diff --git a/arch/arm/include/asm/entry.h b/arch/arm/include/asm/entry.h
new file mode 100644
index 000000000000..4a28e54b5bf3
--- /dev/null
+++ b/arch/arm/include/asm/entry.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_ENTRY_H__
+#define __ASM_ENTRY_H__
+
+struct pt_regs;
+
+void arm_rseq_user_enter(void);
+void arm_rseq_user_exit(void);
+void arm_irq_handler(struct pt_regs *regs, int mode);
+void arm_fiq_handler(struct pt_regs *regs);
+
+#endif /* __ASM_ENTRY_H__ */
diff --git a/arch/arm/include/asm/ptrace.h b/arch/arm/include/asm/ptrace.h
index 6eb311fb2da0..88ddb9371a02 100644
--- a/arch/arm/include/asm/ptrace.h
+++ b/arch/arm/include/asm/ptrace.h
@@ -46,8 +46,13 @@ struct svc_pt_regs {
 #define processor_mode(regs) \
 	((regs)->ARM_cpsr & MODE_MASK)
 
+static inline bool regs_irqs_disabled(const struct pt_regs *regs)
+{
+	return regs->ARM_cpsr & PSR_I_BIT;
+}
+
 #define interrupts_enabled(regs) \
-	(!((regs)->ARM_cpsr & PSR_I_BIT))
+	(!regs_irqs_disabled(regs))
 
 #define fast_interrupts_enabled(regs) \
 	(!((regs)->ARM_cpsr & PSR_F_BIT))
diff --git a/arch/arm/kernel/Makefile b/arch/arm/kernel/Makefile
index b36cf0cfd4a7..3b8a62f6f54d 100644
--- a/arch/arm/kernel/Makefile
+++ b/arch/arm/kernel/Makefile
@@ -17,7 +17,7 @@ CFLAGS_REMOVE_return_address.o = -pg
 
 # Object file lists.
 
-obj-y		:= elf.o entry-common.o irq.o opcodes.o \
+obj-y		:= elf.o entry.o entry-common.o irq.o opcodes.o \
 		   process.o ptrace.o reboot.o io.o \
 		   setup.o signal.o sigreturn_codes.o \
 		   stacktrace.o sys_arm.o time.o traps.o
diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
index 2d2ea3ca880c..36422f3ee018 100644
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@ -36,35 +36,6 @@
 #define RELOC_TEXT_NONE
 #endif
 
-/*
- * Interrupt handling.
- */
-	.macro	irq_handler, from_user:req
-	mov	r1, sp
-	ldr_this_cpu r2, irq_stack_ptr, r2, r3
-	.if	\from_user == 0
-	@
-	@ If we took the interrupt while running in the kernel, we may already
-	@ be using the IRQ stack, so revert to the original value in that case.
-	@
-	subs	r3, r2, r1		@ SP above bottom of IRQ stack?
-	rsbscs	r3, r3, #THREAD_SIZE	@ ... and below the top?
-#ifdef CONFIG_VMAP_STACK
-	ldr_va	r3, high_memory, cc	@ End of the linear region
-	cmpcc	r3, r1			@ Stack pointer was below it?
-#endif
-	bcc	0f			@ If not, switch to the IRQ stack
-	mov	r0, r1
-	bl	generic_handle_arch_irq
-	b	1f
-0:
-	.endif
-
-	mov_l	r0, generic_handle_arch_irq
-	bl	call_with_stack
-1:
-	.endm
-
 	.macro	pabt_helper
 	@ PABORT handler takes pt_regs in r2, fault address in r4 and psr in r5
 #ifdef MULTI_PABORT
@@ -224,34 +195,17 @@ ENDPROC(__dabt_svc)
 
 	.align	5
 __irq_svc:
-	svc_entry
-	irq_handler from_user=0
-
-#ifdef CONFIG_PREEMPTION
-	ldr	r8, [tsk, #TI_PREEMPT]		@ get preempt count
-	ldr	r0, [tsk, #TI_FLAGS]		@ get flags
-	teq	r8, #0				@ if preempt count != 0
-	movne	r0, #0				@ force flags to 0
-	tst	r0, #_TIF_NEED_RESCHED
-	blne	svc_preempt
-#endif
+	svc_entry trace=0
+	mov	r0, sp				@ regs
+	mov	r1, #0				@ from kernel mode
+	bl	arm_irq_handler
 
-	svc_exit r5, irq = 1			@ return from exception
+	svc_exit r5, irqentry = 1		@ return from exception
  UNWIND(.fnend		)
 ENDPROC(__irq_svc)
 
 	.ltorg
 
-#ifdef CONFIG_PREEMPTION
-svc_preempt:
-	mov	r8, lr
-1:	bl	preempt_schedule_irq		@ irq en/disable is done inside
-	ldr	r0, [tsk, #TI_FLAGS]		@ get new tasks TI_FLAGS
-	tst	r0, #_TIF_NEED_RESCHED
-	reteq	r8				@ go again
-	b	1b
-#endif
-
 __und_fault:
 	@ Correct the PC such that it is pointing at the instruction
 	@ which caused the fault.  If the faulting instruction was ARM
@@ -302,7 +256,7 @@ ENDPROC(__pabt_svc)
 __fiq_svc:
 	svc_entry trace=0
 	mov	r0, sp				@ struct pt_regs *regs
-	bl	handle_fiq_as_nmi
+	bl	arm_fiq_handler
 	svc_exit_via_fiq
  UNWIND(.fnend		)
 ENDPROC(__fiq_svc)
@@ -331,7 +285,7 @@ __fiq_abt:
 	stmfd	sp!, {r1 - r2}
 
 	add	r0, sp, #8			@ struct pt_regs *regs
-	bl	handle_fiq_as_nmi
+	bl	arm_fiq_handler
 
 	ldmfd	sp!, {r1 - r2}
  ARM(	msr	cpsr_c, #ABT_MODE | PSR_I_BIT | PSR_F_BIT )
@@ -407,6 +361,9 @@ ENDPROC(__fiq_abt)
 	bl	trace_hardirqs_off
 #endif
 	ct_user_exit save = 0
+#ifdef CONFIG_RSEQ
+	bl	arm_rseq_user_enter
+#endif
 	.endif
 	.endm
 
@@ -438,12 +395,15 @@ ENDPROC(__dabt_usr)
 
 	.align	5
 __irq_usr:
-	usr_entry
+	usr_entry trace=0
 	kuser_cmpxchg_check
-	irq_handler from_user=1
-	get_thread_info tsk
-	mov	why, #0
-	b	ret_to_user_from_irq
+	mov	r0, sp				@ regs
+	mov	r1, #1				@ from user mode
+	bl	arm_irq_handler
+#ifdef CONFIG_KSTACK_ERASE
+	bl	stackleak_erase_on_task_stack
+#endif
+	restore_user_regs fast = 0, offset = 0
  UNWIND(.fnend		)
 ENDPROC(__irq_usr)
 
@@ -498,7 +458,7 @@ __fiq_usr:
 	usr_entry trace=0
 	kuser_cmpxchg_check
 	mov	r0, sp				@ struct pt_regs *regs
-	bl	handle_fiq_as_nmi
+	bl	arm_fiq_handler
 	get_thread_info tsk
 	restore_user_regs fast = 0, offset = 0
  UNWIND(.fnend		)
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index 88336a1292bb..2b518dd217c9 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -110,11 +110,15 @@ ret_slow_syscall:
 	bl	do_rseq_syscall
 #endif
 	disable_irq_notrace			@ disable interrupts
-ENTRY(ret_to_user_from_irq)
+ENTRY(v7m_ret_to_user_from_irq)
+	/* Only the v7m jumps directly to v7m_ret_to_user_from_irq */
 	ldr	r1, [tsk, #TI_FLAGS]
 	movs	r1, r1, lsl #16
 	bne	slow_work_pending
 no_work_pending:
+#ifdef CONFIG_RSEQ
+	bl	arm_rseq_user_exit
+#endif
 	asm_trace_hardirqs_on save = 0
 
 	ct_user_enter save = 0
@@ -123,7 +127,7 @@ no_work_pending:
 	bl	stackleak_erase_on_task_stack
 #endif
 	restore_user_regs fast = 0, offset = 0
-ENDPROC(ret_to_user_from_irq)
+ENDPROC(v7m_ret_to_user_from_irq)
 ENDPROC(ret_to_user)
 
 /*
diff --git a/arch/arm/kernel/entry-header.S b/arch/arm/kernel/entry-header.S
index 99411fa91350..e83f2fb8a592 100644
--- a/arch/arm/kernel/entry-header.S
+++ b/arch/arm/kernel/entry-header.S
@@ -199,7 +199,11 @@
 	.endm
 
 
-	.macro	svc_exit, rpsr, irq = 0
+	.macro	svc_exit, rpsr, irq = 0, irqentry = 0
+	.if	\irqentry != 0
+	@ Generic IRQ entry already handled tracing and lockdep state.
+	disable_irq_notrace
+	.else
 	.if	\irq != 0
 	@ IRQs already off
 #ifdef CONFIG_TRACE_IRQFLAGS
@@ -216,6 +220,7 @@
 	tst	\rpsr, #PSR_I_BIT
 	blne	trace_hardirqs_off
 #endif
+	.endif
 	.endif
 	uaccess_exit tsk, r0, r1
 
diff --git a/arch/arm/kernel/entry-v7m.S b/arch/arm/kernel/entry-v7m.S
index 52bacf07ba16..49a3a34e2913 100644
--- a/arch/arm/kernel/entry-v7m.S
+++ b/arch/arm/kernel/entry-v7m.S
@@ -94,7 +94,7 @@ __pendsv_entry:
 	@ execute the pending work, including reschedule
 	get_thread_info tsk
 	mov	why, #0
-	b	ret_to_user_from_irq
+	b	v7m_ret_to_user_from_irq
 ENDPROC(__pendsv_entry)
 
 /*
diff --git a/arch/arm/kernel/entry.c b/arch/arm/kernel/entry.c
new file mode 100644
index 000000000000..42d9301bdf37
--- /dev/null
+++ b/arch/arm/kernel/entry.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/hardirq.h>
+#include <linux/irq-entry-common.h>
+#include <linux/irq.h>
+
+#include <asm/entry.h>
+#include <asm/stacktrace.h>
+#include <asm/traps.h>
+
+#include "irq.h"
+
+noinstr void arm_rseq_user_enter(void)
+{
+	rseq_note_user_irq_entry();
+}
+
+noinstr void arm_rseq_user_exit(void)
+{
+	rseq_irqentry_exit_to_user_mode();
+}
+
+static void noinstr handle_arm_irq(void *data)
+{
+	struct pt_regs *regs = data;
+	struct pt_regs *old_regs;
+
+	irq_enter_rcu();
+	old_regs = set_irq_regs(regs);
+
+	handle_arch_irq(regs);
+
+	set_irq_regs(old_regs);
+	irq_exit_rcu();
+}
+
+noinstr void arm_irq_handler(struct pt_regs *regs, int mode)
+{
+	irqentry_state_t state = irqentry_enter(regs);
+
+	/*
+	 * mode == 1 means we came from userspace, and then we
+	 * should just immediately switch to the irq stack.
+	 * Then we check of we are on the thread stack. If we are
+	 * not, then by definition we are already using the irq stack.
+	 */
+	if (mode == 1 || on_thread_stack())
+		call_on_irq_stack(handle_arm_irq, regs);
+	else
+		handle_arm_irq(regs);
+
+	irqentry_exit(regs, state);
+}
+
+noinstr void arm_fiq_handler(struct pt_regs *regs)
+{
+	irqentry_state_t state = irqentry_nmi_enter(regs);
+
+	handle_fiq_as_nmi(regs);
+
+	irqentry_nmi_exit(regs, state);
+}
diff --git a/arch/arm/kernel/irq.c b/arch/arm/kernel/irq.c
index e1993e28a9ec..f99d6b24d8ff 100644
--- a/arch/arm/kernel/irq.c
+++ b/arch/arm/kernel/irq.c
@@ -43,6 +43,7 @@
 #include <asm/mach/irq.h>
 #include <asm/mach/time.h>
 
+#include "irq.h"
 #include "reboot.h"
 
 unsigned long irq_err_count;
@@ -71,6 +72,11 @@ static void __init init_irq_stacks(void)
 	}
 }
 
+void call_on_irq_stack(void (*fn)(void *), void *arg)
+{
+	call_with_stack(fn, arg, __this_cpu_read(irq_stack_ptr));
+}
+
 #ifdef CONFIG_SOFTIRQ_ON_OWN_STACK
 static void ____do_softirq(void *arg)
 {
diff --git a/arch/arm/kernel/irq.h b/arch/arm/kernel/irq.h
new file mode 100644
index 000000000000..80dd5bfe6403
--- /dev/null
+++ b/arch/arm/kernel/irq.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+void call_on_irq_stack(void (*fn)(void *), void *arg);
diff --git a/arch/arm/kernel/signal.c b/arch/arm/kernel/signal.c
index 7be9188d83d9..9084c04c07f7 100644
--- a/arch/arm/kernel/signal.c
+++ b/arch/arm/kernel/signal.c
@@ -12,6 +12,7 @@
 #include <linux/resume_user_mode.h>
 #include <linux/uprobes.h>
 #include <linux/syscalls.h>
+#include <linux/irq-entry-common.h>
 
 #include <asm/elf.h>
 #include <asm/cacheflush.h>
@@ -599,6 +600,11 @@ static int do_signal(struct pt_regs *regs, int syscall)
 	return 0;
 }
 
+void arch_do_signal_or_restart(struct pt_regs *regs)
+{
+	do_signal(regs, 0);
+}
+
 asmlinkage int
 do_work_pending(struct pt_regs *regs, unsigned int thread_flags, int syscall)
 {

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260622-arm-generic-irq-entry-v7-1-ff6c1d6c9c48

Best regards,
--  
Linus Walleij <linusw@kernel.org>

