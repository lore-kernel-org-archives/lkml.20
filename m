Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB6E4A8406
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540548; cv=none; b=YSIfcZFd6a1fSRBCu1jLY6tgQJ+UV3yP2YbXVPlDOpST6PhRIpwiBeB3m1Xk7FX65fBK3LvupFK9LVePAgtlrZ1K7PjfnLLGsP3o7tDM2nQLzSpiWpk3Yg5Sa0r2NJiDUDH7ZYOM554TXio37lpZjcH6XUR+BLGmpcJ21TsMdm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540548; c=relaxed/simple;
	bh=ejOMQTqcgGTNe4Q7muCsfqK6WNlpAh1DPAY/xTNCUYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hSDlMS9N+dZammUHQna5Mf2A59366QgkjWb9UE8oXt1wJNs/SqxiUbqpsoRU1PXKExC4F1D/WE44bH8EZK5AeGshHqc0rZD10SQyiBXwh44tVtQIKR/O71eSxyXESGsE+uHpGcT+gwUijD7YNzsfIMICSsk/rTxkj62bpy3qyl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e7Gh36tY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e7Gh36tY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D45361F00893;
	Fri,  9 Oct 2026 10:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540547;
	bh=0deMOOkKM1Zzx2mLD7YuJf2kxSlJNqIuFqXW0gdc4ZI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e7Gh36tYXmNMCo57ukPodpx+NI4nz02QHrmC/H2uelnyXVa89ybr8dBWww0y2rjEO
	 HdUn0OYm2vZnz1hWyp+JJ6qfS77WI0V7FsSVXqvG3HraxSxCeeahTcUHgsienkjhcy
	 /33O39I49Jl/PL4hWRzL7lYov0mwqSEU3KmiV4IUXMrvimGYGkD3E5JZ1zyWi7+8VB
	 gdUEOp9hoDuzmcOE+V5L3uZPkHdZZBSX8KZUjL49qe2UTU2Cys/9KnM1px1da7GBno
	 f2aNdZVUPZF7tO+ImMOkQZX/2lBYKQKyclkfxW4CcOQPSvR9g1MMREMlaGIiAiUDqE
	 mDNQIPJF7X2IA==
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
Subject: [PATCH v2 21/23] arm64: smp: Pass secondary CPU boot parameters via firmware if possible
Date: Fri,  9 Oct 2026 11:07:32 +0100
Message-ID: <20261009100738.31288-22-will@kernel.org>
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

In preparation for parallel bringup of secondary CPUs, the global
'secondary_data' structure used for initial paramater passing must be
localised.

Pass the idle 'task_struct' pointer for secondary CPUs directly to
->cpu_boot() if the backend supports it.

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/smp.h |  1 +
 arch/arm64/kernel/head.S     | 12 +++++++++++-
 arch/arm64/kernel/psci.c     |  4 ++--
 arch/arm64/kernel/smp.c      | 25 +++++++++++--------------
 4 files changed, 25 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
index 7b986a6a765b..7f2cd84b7785 100644
--- a/arch/arm64/include/asm/smp.h
+++ b/arch/arm64/include/asm/smp.h
@@ -95,6 +95,7 @@ struct secondary_data {
 extern struct secondary_data secondary_data;
 extern long __early_cpu_boot_status;
 extern void secondary_entry(void);
+extern void secondary_entry_with_arg(void);
 
 extern void arch_send_call_function_single_ipi(int cpu);
 extern void arch_send_call_function_ipi_mask(const struct cpumask *mask);
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index 87a822e5c4ca..17868b497d7c 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -335,6 +335,7 @@ SYM_FUNC_END(init_kernel_el)
 	 * cores are held until we're ready for them to initialise.
 	 */
 SYM_FUNC_START(secondary_holding_pen)
+	mov	x19, xzr
 	mov	x0, xzr
 	bl	init_kernel_el			// w0=cpu_boot_mode
 	mrs	x2, mpidr_el1
@@ -353,10 +354,16 @@ SYM_FUNC_END(secondary_holding_pen)
 	 * be used where CPUs are brought online dynamically by the kernel.
 	 */
 SYM_FUNC_START(secondary_entry)
+	mov	x0, xzr
+	b	secondary_entry_with_arg
+SYM_FUNC_END(secondary_entry)
+
+SYM_FUNC_START(secondary_entry_with_arg)
+	mov	x19, x0
 	mov	x0, xzr
 	bl	init_kernel_el			// w0=cpu_boot_mode
 	b	secondary_startup
-SYM_FUNC_END(secondary_entry)
+SYM_FUNC_END(secondary_entry_with_arg)
 
 SYM_FUNC_START_LOCAL(secondary_startup)
 	/*
@@ -391,10 +398,13 @@ SYM_FUNC_START_LOCAL(__secondary_switched)
 	msr	vbar_el1, x5
 	isb
 
+	mov	x2, x19
+	cbnz	x2, 1f
 	adr_l	x0, secondary_data
 	ldr	x2, [x0, #CPU_BOOT_TASK]
 	cbz	x2, __secondary_too_slow
 
+1:
 	init_cpu_task x2, x1, x3
 
 #ifdef CONFIG_ARM64_PTR_AUTH
diff --git a/arch/arm64/kernel/psci.c b/arch/arm64/kernel/psci.c
index 8cd74a77de2e..54aa91039b69 100644
--- a/arch/arm64/kernel/psci.c
+++ b/arch/arm64/kernel/psci.c
@@ -38,8 +38,8 @@ static int __init cpu_psci_cpu_prepare(unsigned int cpu)
 
 static int cpu_psci_cpu_boot(unsigned int cpu, unsigned long context)
 {
-	phys_addr_t pa_secondary_entry = __pa_symbol(secondary_entry);
-	int err = psci_ops.cpu_on(cpu_logical_map(cpu), pa_secondary_entry,
+	void *entry_va = context ? secondary_entry_with_arg : secondary_entry;
+	int err = psci_ops.cpu_on(cpu_logical_map(cpu), __pa_symbol(entry_va),
 				  context);
 	if (err && err != -EPERM)
 		pr_err("failed to boot CPU%d (%d)\n", cpu, err);
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 29c70616a107..fb3a93090a3c 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -93,34 +93,31 @@ static inline int op_cpu_kill(unsigned int cpu)
 }
 #endif
 
-
 /*
  * Boot a secondary CPU, and assign it the specified idle task.
  * This also gives us the initial stack to use for this CPU.
  */
-static int boot_secondary(unsigned int cpu, struct task_struct *idle)
-{
-	const struct cpu_operations *ops = get_secondary_cpu_ops();
-
-	if (ops->cpu_boot)
-		return ops->cpu_boot(cpu, 0);
-
-	return -EOPNOTSUPP;
-}
-
 int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *idle)
 {
-	int ret;
+	const struct cpu_operations *ops = get_secondary_cpu_ops();
+	int ret = -EOPNOTSUPP;
+	void *arg = NULL;
 
 	/*
 	 * We need to tell the secondary core where to find its stack and the
 	 * page tables.
 	 */
-	secondary_data.task = idle;
+	if (ops->cpu_boot_has_arg && ops->cpu_boot_has_arg())
+		arg = idle;
+	else
+		secondary_data.task = idle;
+
 	update_cpu_boot_status(CPU_MMU_OFF);
 
 	/* Now bring the CPU into our world */
-	ret = boot_secondary(cpu, idle);
+	if (ops->cpu_boot)
+		ret = ops->cpu_boot(cpu, (unsigned long)arg);
+
 	if (ret && ret != -EPERM)
 		pr_err("CPU%u: failed to boot: %d\n", cpu, ret);
 	return ret;
-- 
2.56.0.385.gd3acb90ef8-goog

