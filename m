Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D2A49B5C3
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540521; cv=none; b=gyGf5r+kBwp8Ww+fnLw2NB0d4BWNQph8y5Z6UCZUYIpo5xMfoIrvsWBkcdHCXkLPGwbFRJ9jTw+ngS0XH/LwaNueD2fPatPQ95+JdjX3XoTQw7O4fpO5vLygXBoWa+Cb2Yg4urGDRJOrbddBjCWVV6Uh+M5hasv6+2TfxLzqQc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540521; c=relaxed/simple;
	bh=SYLJTwuVBV7gzEU4OR4IQtvARl8eFPTxwnCz2PYU1+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KyrkkO/gz9AA0R3X98mC6POmTbcCE5jr82SfLmpFV1aUHaPQpPuB8iFKcq2scj3whdsju2Lqpel4CPSu02QuiZLMsYRJtdm1bIYiq9PYlrOpMKVjHKmSEJjR3/tlaOdrOBwqa+h2kmVcjjwF0Rnjdpaj7gRB/X8tH6XsvHYyNew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ejB5Aap7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ejB5Aap7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 535461F00898;
	Fri,  9 Oct 2026 10:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540520;
	bh=Ru0ZoHw/Kw/Oi/vluVCYpEmBr1d9awOz5x+e4Gf6Zco=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ejB5Aap7qJB0eLqC9SCRtQkfIzIVoxG+agEWiICmAbabgdIbGpLmahPjhX51KU6Ae
	 Mm65RyqPdlWxbdMsnt/+vHbaYgaYtxQzrwvMD0I6m8FzIkifN6QwgdMEuVLNePLVZU
	 QkoK6HuR00qeEbKKmCXOTreibk4W7VwYoZUbO2Y3CHJCF7rc0cyDMSwsi7m8d04goY
	 Og4U9Rxrm8Tz1Inp963L/xP2rm/M2s5DNs4+I3STE7TfP+tUPPHcFNhzQsmjDtUMMv
	 2G96mwGkmW974dA6X/FKOO8CdjuVFHfOQTIr4iL6OgZxc8evyrEyubuJnsdDM8Vkef
	 SS9Xk+mzxeJPA==
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
Subject: [PATCH v2 14/23] arm64: smp: Use generic HOTPLUG_CORE_SYNC_FULL machinery for CPU onlining
Date: Fri,  9 Oct 2026 11:07:25 +0100
Message-ID: <20261009100738.31288-15-will@kernel.org>
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

Select HOTPLUG_CORE_SYNC_FULL on arm64 to replace the 'cpu_running'
completion with the generic code for synchronising with secondary CPUs
during boot.

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/Kconfig           |  2 +-
 arch/arm64/include/asm/smp.h |  1 -
 arch/arm64/kernel/smp.c      | 39 +++++++++++++++++-------------------
 3 files changed, 19 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b5a51b0ef944..89d1f0f2269c 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -230,7 +230,7 @@ config ARM64
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_KPROBES
 	select HAVE_KRETPROBES
-	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
+	select HOTPLUG_CORE_SYNC_FULL
 	select HOTPLUG_SMT if HOTPLUG_CPU
 	select IRQ_DOMAIN
 	select IRQ_FORCED_THREADING
diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
index 10ea4f543069..fe343c30d620 100644
--- a/arch/arm64/include/asm/smp.h
+++ b/arch/arm64/include/asm/smp.h
@@ -12,7 +12,6 @@
 #define CPU_BOOT_STATUS_MASK		((UL(1) << CPU_STUCK_REASON_SHIFT) - 1)
 
 #define CPU_MMU_OFF			(-1)
-#define CPU_BOOT_SUCCESS		(0)
 /* The cpu invoked ops->cpu_die, synchronise it with cpu_kill */
 #define CPU_KILL_ME			(1)
 /* The cpu couldn't die gracefully and is looping in the kernel */
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 014b163ce658..d83ba5bbfd37 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -108,12 +108,9 @@ static int boot_secondary(unsigned int cpu, struct task_struct *idle)
 	return -EOPNOTSUPP;
 }
 
-static DECLARE_COMPLETION(cpu_running);
-
 int __cpu_up(unsigned int cpu, struct task_struct *idle)
 {
 	int ret;
-	long status;
 
 	/*
 	 * We need to tell the secondary core where to find its stack and the
@@ -124,27 +121,24 @@ int __cpu_up(unsigned int cpu, struct task_struct *idle)
 
 	/* Now bring the CPU into our world */
 	ret = boot_secondary(cpu, idle);
-	if (ret) {
-		if (ret != -EPERM)
-			pr_err("CPU%u: failed to boot: %d\n", cpu, ret);
-		return ret;
-	}
+	if (ret && ret != -EPERM)
+		pr_err("CPU%u: failed to boot: %d\n", cpu, ret);
+	return ret;
+}
 
-	/*
-	 * CPU was successfully started, wait for it to come online or
-	 * time out.
-	 */
-	wait_for_completion_timeout(&cpu_running,
-				    msecs_to_jiffies(5000));
-	if (cpu_online(cpu))
-		return 0;
+void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive)
+{
+	long status;
+
+	if (is_alive)
+		return;
 
-	pr_crit("CPU%u: failed to come online\n", cpu);
 	secondary_data.task = NULL;
 	status = READ_ONCE(secondary_data.status);
 	if (status == CPU_MMU_OFF)
 		status = READ_ONCE(__early_cpu_boot_status);
 
+	/* A CPU has failed to boot. Try to figure out what happened. */
 	switch (status & CPU_BOOT_STATUS_MASK) {
 	default:
 		pr_err("CPU%u: failed in unknown state : 0x%lx\n",
@@ -171,8 +165,6 @@ int __cpu_up(unsigned int cpu, struct task_struct *idle)
 	case CPU_PANIC_KERNEL:
 		panic("CPU%u detected unsupported configuration\n", cpu);
 	}
-
-	return -EIO;
 }
 
 static void init_gic_priority_masking(void)
@@ -234,6 +226,13 @@ asmlinkage notrace void secondary_start_kernel(void)
 	 * Log the CPU info before it is marked online and might get read.
 	 */
 	cpuinfo_store_cpu();
+
+	/*
+	 * Synchronise with the core bringing us online so that it knows
+	 * we made it into the kernel. We're still not 'online'.
+	 */
+	cpuhp_ap_sync_alive();
+
 	rcutree_report_cpu_starting(cpu);
 	update_cpu_features(cpu);
 	store_cpu_topology(cpu);
@@ -256,9 +255,7 @@ asmlinkage notrace void secondary_start_kernel(void)
 	pr_info("CPU%u: Booted secondary processor 0x%010lx [0x%08x]\n",
 					 cpu, (unsigned long)mpidr,
 					 read_cpuid_id());
-	update_cpu_boot_status(CPU_BOOT_SUCCESS);
 	set_cpu_online(cpu, true);
-	complete(&cpu_running);
 
 	/*
 	 * Secondary CPUs enter the kernel with all DAIF exceptions masked.
-- 
2.56.0.385.gd3acb90ef8-goog

