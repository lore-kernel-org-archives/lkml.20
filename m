Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0AB52121F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799268; cv=none; b=Mp+ycXDnyZTMf1FuH3SKGCMZSYC3GwlxyQ4nzjx39Mc9X/drS4fn2dRLQafT+FBe0eXrTpxFwAcmW3vBsoG+qL0TGbjR2r8yde0wvY3XwL6EWvitE2jTrvELYYzBT4/WM0RpKXgbJDZpC3szPRvokUocoIC7v7Ikwd4Aud9tUFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799268; c=relaxed/simple;
	bh=zq1NTUJXe6gRBk7GXPljzwtMW/+LkxPVf5mJuuWkV+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RcVUL6TqiGpnxakCKD2SXA3WY0EubZ/PePKcI9lBv8QBf3yoFZIvekQcd1fzaxxauV6jtFI8Z4MbNWB2bj1PEfgZcRG/JsXN0sq+NW9MO9L2NUjYSEaQ/GfJTQxMfpdtWdW/z+c0KhkCIFHyAH1uFC6JPR5/zKOkK0ppyJ6BYNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cl6u/ywB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cl6u/ywB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8351E1F00A3F;
	Mon,  7 Sep 2026 16:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799266;
	bh=IrTLbOTuuMQ4L6f9zvoUGhlf4wkNs5/PIEKC6sIRKzw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Cl6u/ywB2DKdlUfB00LGseaWWQeZTgxCSacs6+G9B2GLgrcRdNqVSfBdgAGDki+cP
	 pRVU96/X2jGIRvB24yRvH7MGvvgLZTne8ceL3es+phtgtgaFn4ylSIgtvJ2mNdN8hM
	 IpZwPAENDmZ5ZkL2k3en4xblqBTjDtOU8SSO4RdVIgAKHGHwVmMau1gVQXLzLxrMIb
	 ev8n+hrFdyud9E7/79AoKY0LUtAVy3lfM1Dgn7Ir3QVGm8QAFgkn4/9yRxKWA7SKm0
	 l7qslGovC2LRdlg9leogMDNSvgxU5cZfHzjBDKzb+Vd4FZCAaSlLLd96RVyvlPodd9
	 idk9CX2H4Jujg==
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
Subject: [PATCH 11/19] arm64: smp: Use generic HOTPLUG_SPLIT_STARTUP machinery for CPU onlining
Date: Mon,  7 Sep 2026 17:40:14 +0100
Message-ID: <20260907164024.17164-12-will@kernel.org>
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

In preparation for enabling parallel bringup of secondary CPUs on arm64,
take the baby step of moving from HOTPLUG_CORE_SYNC_FULL to
HOTPLUG_SPLIT_STARTUP.

Rework the cpu_die_early() path to use a private cpumask, otherwise
clearing the incoming CPU from the present mask in the 'kick' stage will
prevent the hotplug stage machine from progressing and
arch_cpuhp_cleanup_kick_cpu() will not be called.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/Kconfig           | 2 +-
 arch/arm64/include/asm/smp.h | 1 +
 arch/arm64/kernel/smp.c      | 9 +++++----
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 89d1f0f2269c..fd8cf792b7fd 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -230,7 +230,7 @@ config ARM64
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_KPROBES
 	select HAVE_KRETPROBES
-	select HOTPLUG_CORE_SYNC_FULL
+	select HOTPLUG_SPLIT_STARTUP
 	select HOTPLUG_SMT if HOTPLUG_CPU
 	select IRQ_DOMAIN
 	select IRQ_FORCED_THREADING
diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
index fe343c30d620..7b986a6a765b 100644
--- a/arch/arm64/include/asm/smp.h
+++ b/arch/arm64/include/asm/smp.h
@@ -89,6 +89,7 @@ asmlinkage void secondary_start_kernel(void);
 struct secondary_data {
 	struct task_struct *task;
 	long status;
+	cpumask_t cpu_died_early_mask;
 };
 
 extern struct secondary_data secondary_data;
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 00362ed6e1ab..c5e9d5d5e003 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -62,7 +62,7 @@
  * so we need some other way of telling a new secondary core
  * where to place its SVC stack
  */
-struct secondary_data secondary_data;
+struct secondary_data secondary_data = {};
 /* Number of CPUs which aren't online, but looping in kernel text. */
 static int cpus_stuck_in_kernel;
 
@@ -108,7 +108,7 @@ static int boot_secondary(unsigned int cpu, struct task_struct *idle)
 	return -EOPNOTSUPP;
 }
 
-int __cpu_up(unsigned int cpu, struct task_struct *idle)
+int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *idle)
 {
 	int ret;
 
@@ -146,6 +146,8 @@ void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive)
 		cpus_stuck_in_kernel++;
 		break;
 	case CPU_KILL_ME:
+		if (cpumask_test_cpu(cpu, &secondary_data.cpu_died_early_mask))
+			set_cpu_present(cpu, false);
 		if (!op_cpu_kill(cpu)) {
 			pr_crit("CPU%u: died during early boot\n", cpu);
 			break;
@@ -406,8 +408,7 @@ void __noreturn cpu_die_early(void)
 
 	pr_crit("CPU%d: will not boot\n", cpu);
 
-	/* Mark this CPU absent */
-	set_cpu_present(cpu, 0);
+	cpumask_set_cpu(cpu, &secondary_data.cpu_died_early_mask);
 
 	if (IS_ENABLED(CONFIG_HOTPLUG_CPU)) {
 		update_cpu_boot_status(CPU_KILL_ME);
-- 
2.55.0.979.g7e5102b832-goog

