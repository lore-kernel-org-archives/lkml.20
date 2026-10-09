Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2A34A2071
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540555; cv=none; b=VDXI8aoaIrlDVYBPW9lW17dNR3kLdim3cM5C+YFIiFeg3lYEDP6OKXK4/EJ3iplRM5JzTPID9cdBzklDTusyixbKnv8dSpn0bD4PKrWgV2FaH7tHTuSkUGXIKvrGBGxIxIbXyAdRVezt+6N0D1UmteKPTsxxJkU0+OZibZlm3pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540555; c=relaxed/simple;
	bh=80JMJ1ZB5BCkPHDajIp/eQWwjUqEveXbvMLKkAgc5xk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E7YUeXUemWyJSO8OdUMj4o2Xoclg+t14Or3CL4uZk3O6qv1cDsnEQSky1O+CSHt6qHzqbJqkPqHP/1EUnTh4QhInzGJSfAlQtV5ewNB6txvUYNn+i7u2YSzG3plZUwDUaub3LK4/MHT8i2eeQW3xJhe5Zvm6dgOXShNcWVrXQ58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TkS9hMq7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TkS9hMq7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 663CB1F000FF;
	Fri,  9 Oct 2026 10:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540554;
	bh=0B6Rv4V30uFrtqOQmWLG/0uKLOtpWfY3Io13djMRxbc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TkS9hMq77092ejUjU9Ta5+8tT2HLkW1kgnot8ANqzruEAaffiUlAOgyZ6y3bssZTe
	 jC74jTRNJQq5mfPhegE/ff9L3d7OBIFldAOL6BQhBzuaH0dlrWdw/gpNdA4scLqYiM
	 nA6+l4xejrpx/BO86J1y3XyY1sMcWkhVibMEPdTP5JCN1tUYw3L7aaZAU7cKl4gPO5
	 v1zn2DJTKzgoAv0Qc74kDbUAxJK5IFOukxEfMXSE/Ijx+RvnqfgIJOfix5cr1DcPlJ
	 n5bLCypJgtOQgU6no9d/+pODUNeIWCHvAPYRbGR/b8nWpMkUYNpNiun01yHCIqQ0nX
	 uHQnzYLu4RFmw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	=?UTF-8?q?=C8=98tefania=20Ion?= <stefion@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Tarun Sahu <tarunsahu@google.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 23/23] arm64: smp: Harden parallel CPU bringup against broken PSCI firmware
Date: Fri,  9 Oct 2026 11:07:34 +0100
Message-ID: <20261009100738.31288-24-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009100738.31288-1-will@kernel.org>
References: <20261009100738.31288-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since firmware has occasionally been known to get things wrong, harden
our parallel CPU bringup code against a PSCI implementation that passes
the CPU_ON argument to an incorrect CPU.

The primary CPU writes the MPIDR of the incoming CPU to the penultimate
slot of its task stack and this is then checked against the MPIDR_EL1
register during early kernel entry. A mismatch is reported via the
existing failure reporting mechanism and the CPU is not brought online.

Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/smp.h    |  4 +++-
 arch/arm64/kernel/asm-offsets.c |  1 +
 arch/arm64/kernel/head.S        | 39 ++++++++++++++++++++++++++++-----
 arch/arm64/kernel/smp.c         | 12 ++++++++--
 4 files changed, 47 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
index 3decb42164aa..1ecfa4fa4f82 100644
--- a/arch/arm64/include/asm/smp.h
+++ b/arch/arm64/include/asm/smp.h
@@ -15,7 +15,9 @@
 /* Offsets for late (i.e. MMU-enabled) CPU boot reasons */
 /* Fatal system error detected by secondary CPU, crash the system */
 #define CPU_PANIC_KERNEL			(0)
-#define CPU_STATUS_FLAGS_MAX			(1)
+/* The PSCI v0.2+ implementation passed the wrong argument */
+#define CPU_BROKEN_PSCI_ARG			(1)
+#define CPU_STATUS_FLAGS_MAX			(2)
 
 #ifndef __ASSEMBLER__
 
diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-offsets.c
index 9c853ed3ceab..0cbd10af13ac 100644
--- a/arch/arm64/kernel/asm-offsets.c
+++ b/arch/arm64/kernel/asm-offsets.c
@@ -97,6 +97,7 @@ int main(void)
   BLANK();
 #endif
   DEFINE(CPU_BOOT_TASK,		offsetof(struct secondary_data, task));
+  DEFINE(CPU_BOOT_STATUS_FLAGS,	offsetof(struct secondary_data, status.flags));
   BLANK();
   DEFINE(FTR_OVR_VAL_OFFSET,	offsetof(struct arm64_ftr_override, val));
   DEFINE(FTR_OVR_MASK_OFFSET,	offsetof(struct arm64_ftr_override, mask));
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index 031ff1d4fd29..3f005e226547 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -192,11 +192,21 @@ SYM_CODE_END(preserve_boot_args)
 	 * its location in the task stack. We reserve the entire pt_regs space
 	 * for consistency with user tasks and kthreads.
 	 */
-	.macro	init_cpu_task tsk, tmp1, tmp2
+	.macro	init_cpu_task tsk, tmp1, tmp2, check_mpidr=
 	msr	sp_el0, \tsk
 
 	ldr	\tmp1, [\tsk, #TSK_STACK]
-	add	sp, \tmp1, #THREAD_SIZE
+	mov	sp, \tmp1
+	.ifnb	\check_mpidr
+	mov_q	\tmp1, MPIDR_HWID_BITMASK
+	mrs	\tmp2, mpidr_el1
+	and	\tmp2, \tmp2, \tmp1
+	ldr	\tmp1, [sp, #8]
+	sub	\tmp1, \tmp1, \tmp2
+	cbnz	\tmp1, __cpu_secondary_broken_psci_arg
+	.endif
+
+	add	sp, sp, #THREAD_SIZE
 	sub	sp, sp, #PT_REGS_SIZE
 
 	stp	xzr, xzr, [sp, #S_STACKFRAME]
@@ -397,15 +407,16 @@ SYM_FUNC_START_LOCAL(__secondary_switched)
 	msr	vbar_el1, x5
 	isb
 
+	cbz	x19, 1f
 	mov	x2, x19
-	cbnz	x2, 1f
+	init_cpu_task x2, x1, x3, check_mpidr=1
+	b	2f
+1:
 	adr_l	x0, secondary_data
 	ldr	x2, [x0, #CPU_BOOT_TASK]
 	cbz	x2, __secondary_too_slow
-
-1:
 	init_cpu_task x2, x1, x3
-
+2:
 #ifdef CONFIG_ARM64_PTR_AUTH
 	ptrauth_keys_init_cpu x2, x3, x4, x5
 #endif
@@ -451,6 +462,22 @@ SYM_FUNC_END(set_cpu_boot_mode_flag)
 	dc	ivac, \tmp1			// Invalidate potentially stale cache line
 	.endm
 
+	.macro	update_cpu_boot_status status, tmp1, tmp2
+	adr_l	\tmp1, secondary_data
+	add	\tmp1, \tmp1, #CPU_BOOT_STATUS_FLAGS + \status
+	mov	\tmp2, #1
+	strb	w\tmp2, [\tmp1]
+	.endm
+
+SYM_FUNC_START_LOCAL(__cpu_secondary_broken_psci_arg)
+	update_cpu_boot_status CPU_BROKEN_PSCI_ARG, x0, x1
+1:
+	wfe
+	wfi
+	b	1b
+SYM_FUNC_END(__cpu_secondary_broken_psci_arg)
+
+
 /*
  * Enable the MMU.
  *
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index b3023557d789..8dc29bdef1a1 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -119,10 +119,13 @@ int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *idle)
 	 * We need to tell the secondary core where to find its stack and the
 	 * page tables.
 	 */
-	if (smp_parallel_bringup)
+	if (smp_parallel_bringup) {
+		/* Avoid clobbering STACK_END_MAGIC */
+		*(end_of_stack(idle) + 1) = cpu_logical_map(cpu);
 		arg = idle;
-	else
+	} else {
 		secondary_data.task = idle;
+	}
 
 	/* Now bring the CPU into our world */
 	if (ops->cpu_boot)
@@ -158,6 +161,11 @@ void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive)
 	}
 
 	status = READ_ONCE(secondary_data.status);
+	if (status.flags[CPU_BROKEN_PSCI_ARG]) {
+		pr_crit_once("CPU%u detected broken PSCI v0.2+ CPU_ON argument passing\n",
+			     cpu);
+	}
+
 	if (status.flags[CPU_PANIC_KERNEL])
 		panic("CPU%u detected unsupported configuration\n", cpu);
 
-- 
2.56.0.385.gd3acb90ef8-goog

