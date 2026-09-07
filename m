Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E152B524AED
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799288; cv=none; b=FtCtE2ADhwlvDyQo6AK4m1YFrjmcCe3G45pXYXhVLMax4QLBRfuWrRy8q+Au+LjucC1jkKuAhxGsxpOYihz0PuJEUrTCDcf/O01F6ijIDze7XCvi/rtAxE4xCRgoy55chw+GJxO5xmdqVjpTNQDTuuG1Q/abbG/PJjOGiQUlrwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799288; c=relaxed/simple;
	bh=Hbfz4D+KE8aJfVBAhc2XsoSSEZJ6mfkNmWmxvv4ytPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gMqAsq3h8L0gHABekJ8eHhnLzGXlBJL5zh7vNqFxur77rBSONcp2p8mrHalvPT3P8BeLL8nnGMA7EYwqLvjopD1vGUtiYwkRKOg8z2PlYbcjEdbz8QPgjRPx/KlJESBxLnqk7+adMsGj9MoqabP+l3ImPXLE2Yy8Zm0ErdhiX6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IpuGX1WI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IpuGX1WI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B3E71F00A3D;
	Mon,  7 Sep 2026 16:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799286;
	bh=TS0d+Qcb5U7cCVHfErBywRPREk4NWc1936JWNuG9+Kw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IpuGX1WImTGcOp6VG3QT4xD/Suwr3ntAXeUskBtmTO+PpDhkAaadE8qJiXTbiUZb0
	 B5+3I17hPKRTOB5jxlYF28DRVRfbjAVVhyefFEg0/dfEo9ljuj5iNtUnrrUqtfh01J
	 gXxmw/MwSNkgqL5FA7TePJP57V9kDRS4+zMKBwW1HXuvjbAS/jEMI4pLrORMf9Nlfk
	 2dZ47ElPWL3gjFHor6Y/bQJWJ1f7ILld0Sdv2/niR8zVq+rjqQk4ozYqnwqhkhyy7W
	 bYj1tO5rmc6XVR0hnaUKdNxqMCOLjjW1eir3Gu3HBUxvrjWqXT9PL+wIfL8Sbl6Fc4
	 wp7D/llYIZJXQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH 18/19] arm64: smp: Use generic HOTPLUG_PARALLEL machinery for CPU onlining
Date: Mon,  7 Sep 2026 17:40:21 +0100
Message-ID: <20260907164024.17164-19-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907164024.17164-1-will@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the move from HOTPLUG_SPLIT_STARTUP to HOTPLUG_PARALLEL and
enable parallel CPU bringup on systems with PSCI v0.2 or later.

The fiddly part of all this is the error handling if a CPU fails to
come up, as we can no longer rely on a single global 'status' flag to
capture the details. Instead, the secondary_data::status field is
replaced with a zero-initialised byte array, with each byte representing
an error reason, so the total set of failures can be accurately captured
by the primary CPU.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/Kconfig                |  2 +-
 arch/arm64/include/asm/smp.h      | 35 +++++++------
 arch/arm64/include/asm/topology.h |  2 +
 arch/arm64/kernel/head.S          | 15 +++---
 arch/arm64/kernel/smp.c           | 81 ++++++++++++++++---------------
 arch/arm64/mm/mmu.c               |  2 +-
 6 files changed, 72 insertions(+), 65 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index fd8cf792b7fd..8d963cec7189 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -230,7 +230,7 @@ config ARM64
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_KPROBES
 	select HAVE_KRETPROBES
-	select HOTPLUG_SPLIT_STARTUP
+	select HOTPLUG_PARALLEL
 	select HOTPLUG_SMT if HOTPLUG_CPU
 	select IRQ_DOMAIN
 	select IRQ_FORCED_THREADING
diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
index 7f2cd84b7785..3decb42164aa 100644
--- a/arch/arm64/include/asm/smp.h
+++ b/arch/arm64/include/asm/smp.h
@@ -7,20 +7,15 @@
 
 #include <linux/const.h>
 
-/* Values for secondary_data.status */
-#define CPU_STUCK_REASON_SHIFT		(8)
-#define CPU_BOOT_STATUS_MASK		((UL(1) << CPU_STUCK_REASON_SHIFT) - 1)
+/* Offsets for early CPU boot reasons */
+#define EARLY_CPU_STUCK_REASON_52_BIT_VA	(0)
+#define EARLY_CPU_STUCK_REASON_NO_GRAN		(1)
+#define EARLY_CPU_STUCK_REASON_MAX		(2)
 
-#define CPU_MMU_OFF			(-1)
-/* The cpu invoked ops->cpu_die, synchronise it with cpu_kill */
-#define CPU_KILL_ME			(1)
-/* The cpu couldn't die gracefully and is looping in the kernel */
-#define CPU_STUCK_IN_KERNEL		(2)
+/* Offsets for late (i.e. MMU-enabled) CPU boot reasons */
 /* Fatal system error detected by secondary CPU, crash the system */
-#define CPU_PANIC_KERNEL		(3)
-
-#define CPU_STUCK_REASON_52_BIT_VA	(UL(1) << CPU_STUCK_REASON_SHIFT)
-#define CPU_STUCK_REASON_NO_GRAN	(UL(2) << CPU_STUCK_REASON_SHIFT)
+#define CPU_PANIC_KERNEL			(0)
+#define CPU_STATUS_FLAGS_MAX			(1)
 
 #ifndef __ASSEMBLER__
 
@@ -81,6 +76,14 @@ static inline void set_smp_ipi_range(int ipi_base, int n)
  */
 asmlinkage void secondary_start_kernel(void);
 
+union secondary_status {
+	u64	val;
+	union {
+		u8	flags[CPU_STATUS_FLAGS_MAX];
+		u8	early_flags[EARLY_CPU_STUCK_REASON_MAX];
+	};
+};
+
 /*
  * Initial data for bringing up a secondary CPU.
  * @status - Result passed back from the secondary CPU to
@@ -88,7 +91,7 @@ asmlinkage void secondary_start_kernel(void);
  */
 struct secondary_data {
 	struct task_struct *task;
-	long status;
+	union secondary_status status;
 	cpumask_t cpu_died_early_mask;
 };
 
@@ -123,9 +126,11 @@ static inline void __noreturn cpu_park_loop(void)
 	}
 }
 
-static inline void update_cpu_boot_status(int val)
+static inline void update_cpu_boot_status(const unsigned int val)
 {
-	WRITE_ONCE(secondary_data.status, val);
+	BUILD_BUG_ON(val >= CPU_STATUS_FLAGS_MAX);
+
+	WRITE_ONCE(secondary_data.status.flags[val], 1);
 	/* Ensure the visibility of the status update */
 	dsb(ishst);
 }
diff --git a/arch/arm64/include/asm/topology.h b/arch/arm64/include/asm/topology.h
index b9eaf4ad7085..f1ff9e40b7cd 100644
--- a/arch/arm64/include/asm/topology.h
+++ b/arch/arm64/include/asm/topology.h
@@ -41,4 +41,6 @@ void update_freq_counters_refs(void);
 
 #include <asm-generic/topology.h>
 
+#define cpu_primary_thread_mask	cpu_none_mask
+
 #endif /* _ASM_ARM_TOPOLOGY_H */
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index 17868b497d7c..bec4bc1b12db 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -393,7 +393,6 @@ SYM_FUNC_START_LOCAL(__secondary_switched)
 	mov	x0, x20
 	bl	finalise_el2
 
-	str_l	xzr, __early_cpu_boot_status, x3
 	adr_l	x5, vectors
 	msr	vbar_el1, x5
 	isb
@@ -439,15 +438,15 @@ SYM_FUNC_END(set_cpu_boot_mode_flag)
  * with MMU turned off.
  *
  * update_early_cpu_boot_status tmp, status
- *  - Corrupts tmp1, tmp2
- *  - Writes 'status' to __early_cpu_boot_status and makes sure
+ *  - Corrupts tmp1
+ *  - Writes 1 to the 'status' field of __early_cpu_boot_status and makes sure
  *    it is committed to memory.
  */
 
 	.macro	update_early_cpu_boot_status status, tmp1, tmp2
-	mov	\tmp2, #\status
 	adr_l	\tmp1, __early_cpu_boot_status
-	str	\tmp2, [\tmp1]
+	mov	\tmp2, #1
+	strb	w\tmp2, [\tmp1, #\status]
 	dmb	sy
 	dc	ivac, \tmp1			// Invalidate potentially stale cache line
 	.endm
@@ -495,8 +494,7 @@ SYM_FUNC_START(__cpu_secondary_check52bitva)
 	b.ge	2f
 #endif
 
-	update_early_cpu_boot_status \
-		CPU_STUCK_IN_KERNEL | CPU_STUCK_REASON_52_BIT_VA, x0, x1
+	update_early_cpu_boot_status EARLY_CPU_STUCK_REASON_52_BIT_VA, x0, x1
 1:	wfe
 	wfi
 	b	1b
@@ -507,8 +505,7 @@ SYM_FUNC_END(__cpu_secondary_check52bitva)
 
 SYM_FUNC_START_LOCAL(__no_granule_support)
 	/* Indicate that this CPU can't boot and is stuck in the kernel */
-	update_early_cpu_boot_status \
-		CPU_STUCK_IN_KERNEL | CPU_STUCK_REASON_NO_GRAN, x1, x2
+	update_early_cpu_boot_status EARLY_CPU_STUCK_REASON_NO_GRAN, x1, x2
 1:
 	wfe
 	wfi
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 95d5328c3f5a..d5da44949671 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -64,7 +64,7 @@
  */
 struct secondary_data secondary_data = {};
 /* Number of CPUs which aren't online, but looping in kernel text. */
-static int cpus_stuck_in_kernel;
+static bool cpus_stuck_in_kernel;
 
 static int ipi_irq_base __ro_after_init;
 static int nr_ipi __ro_after_init = NR_IPI;
@@ -93,6 +93,18 @@ static inline int op_cpu_kill(unsigned int cpu)
 }
 #endif
 
+static bool smp_parallel_bringup;
+
+bool arch_cpuhp_init_parallel_bringup(void)
+{
+	const struct cpu_operations *ops = get_secondary_cpu_ops();
+
+	smp_parallel_bringup = ops &&
+			       ops->cpu_boot_has_arg &&
+			       ops->cpu_boot_has_arg();
+	return smp_parallel_bringup;
+}
+
 /*
  * Boot a secondary CPU, and assign it the specified idle task.
  * This also gives us the initial stack to use for this CPU.
@@ -107,13 +119,11 @@ int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *idle)
 	 * We need to tell the secondary core where to find its stack and the
 	 * page tables.
 	 */
-	if (ops->cpu_boot_has_arg && ops->cpu_boot_has_arg())
+	if (smp_parallel_bringup)
 		arg = idle;
 	else
 		secondary_data.task = idle;
 
-	update_cpu_boot_status(CPU_MMU_OFF);
-
 	/* Now bring the CPU into our world */
 	if (ops->cpu_boot)
 		ret = ops->cpu_boot(cpu, (unsigned long)arg);
@@ -125,45 +135,42 @@ int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *idle)
 
 void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive)
 {
-	long status;
+	union secondary_status status;
 
 	if (is_alive)
 		return;
 
-	secondary_data.task = NULL;
-	status = READ_ONCE(secondary_data.status);
-	if (status == CPU_MMU_OFF)
-		status = READ_ONCE(__early_cpu_boot_status);
-
 	/* A CPU has failed to boot. Try to figure out what happened. */
-	switch (status & CPU_BOOT_STATUS_MASK) {
-	default:
-		pr_err("CPU%u: failed in unknown state : 0x%lx\n",
-		       cpu, status);
-		cpus_stuck_in_kernel++;
-		break;
-	case CPU_KILL_ME:
-		if (cpumask_test_cpu(cpu, &secondary_data.cpu_died_early_mask))
-			set_cpu_present(cpu, false);
+	if (smp_parallel_bringup)
+		pr_warn_once("Parallel CPU bringup failed; consider passing \"cpuhp.parallel=off\" for a more accurate diagnosis.\n");
+	else
+		secondary_data.task = NULL;
+
+	status.val = READ_ONCE(__early_cpu_boot_status);
+	if (status.early_flags[EARLY_CPU_STUCK_REASON_52_BIT_VA]) {
+		pr_crit_once("CPU%u detected lack of support for 52-bit VAs\n",
+			     cpu);
+	}
+
+	if (status.early_flags[EARLY_CPU_STUCK_REASON_NO_GRAN]) {
+		pr_crit_once("CPU%u detected lack of support for %luK granules\n",
+			     cpu, PAGE_SIZE / SZ_1K);
+	}
+
+	status = READ_ONCE(secondary_data.status);
+	if (status.flags[CPU_PANIC_KERNEL])
+		panic("CPU%u detected unsupported configuration\n", cpu);
+
+	if (cpumask_test_cpu(cpu, &secondary_data.cpu_died_early_mask)) {
+		set_cpu_present(cpu, false);
 		if (!op_cpu_kill(cpu)) {
 			pr_crit("CPU%u: died during early boot\n", cpu);
-			break;
+			return;
 		}
-		pr_crit("CPU%u: may not have shut down cleanly\n", cpu);
-		fallthrough;
-	case CPU_STUCK_IN_KERNEL:
-		pr_crit("CPU%u: is stuck in kernel\n", cpu);
-		if (status & CPU_STUCK_REASON_52_BIT_VA)
-			pr_crit("CPU%u: does not support 52-bit VAs\n", cpu);
-		if (status & CPU_STUCK_REASON_NO_GRAN) {
-			pr_crit("CPU%u: does not support %luK granule\n",
-				cpu, PAGE_SIZE / SZ_1K);
-		}
-		cpus_stuck_in_kernel++;
-		break;
-	case CPU_PANIC_KERNEL:
-		panic("CPU%u detected unsupported configuration\n", cpu);
 	}
+
+	pr_crit_once("CPUs may be stuck in kernel\n");
+	cpus_stuck_in_kernel = true;
 }
 
 static void init_gic_priority_masking(void)
@@ -407,12 +414,8 @@ void __noreturn cpu_die_early(void)
 
 	cpumask_set_cpu(cpu, &secondary_data.cpu_died_early_mask);
 
-	if (IS_ENABLED(CONFIG_HOTPLUG_CPU)) {
-		update_cpu_boot_status(CPU_KILL_ME);
+	if (IS_ENABLED(CONFIG_HOTPLUG_CPU))
 		__cpu_try_die(cpu);
-	}
-
-	update_cpu_boot_status(CPU_STUCK_IN_KERNEL);
 
 	cpu_park_loop();
 }
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 79d90226fd5d..59e572a09304 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -61,7 +61,7 @@ static bool rodata_is_rw __ro_after_init = true;
  * The booting CPU updates the failed status @__early_cpu_boot_status,
  * with MMU turned off.
  */
-long __section(".mmuoff.data.write") __early_cpu_boot_status;
+long __section(".mmuoff.data.write") __early_cpu_boot_status = 0;
 
 static DEFINE_SPINLOCK(swapper_pgdir_lock);
 static DEFINE_MUTEX(fixmap_lock);
-- 
2.55.0.979.g7e5102b832-goog

