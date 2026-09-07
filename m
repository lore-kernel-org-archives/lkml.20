Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C8E5221C0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799274; cv=none; b=s5b9SKFJ6hhGKT/C7IjjhYmADgNip0lPqMfWf2u1Nffs+PJbM0KITFusmVtcHMFNKJR4eTDFJQeCbB4NPNvQLcBT0Fkb/XuI4M6Ra7tk519D07brZYVp8TkACy3PJiCEdyBon3EawVQsqdVOU18mOqSiU4GPrN9ZvyQoFwdXNhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799274; c=relaxed/simple;
	bh=OAJiIKD1N1j/cScevb9eqWToHp4DxASBEb1Rg4Xgxp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m8WkI3ZTA+5XjSn7jwuP+bFLc+Z3FEVudgHce0xPdAekDqP6N7jhogp8VTqtHhm2RV8MXF3COQzfmIGaEqW14e6XMfeQVgmmeT9tre4Fe/wZZ7KBRIS0OLcMzaw/VyClcIgIXW5LgwaXf0w+KWoCIhbFMJje7kGJC2zFA+ZJr+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NbyzKcmF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NbyzKcmF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E38D1F00A3F;
	Mon,  7 Sep 2026 16:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799272;
	bh=n0w3iQzXGo6gJeBOFFPeG8YoxiowoM54dI9r5vI+0Yg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NbyzKcmF10RlZINRWL1FRhKqgh0mCjzT7LwUmCoNK4NmCQ3qS70T3ajRbvs37twft
	 LRXpUjYNlMjJPGz9VJEpayDvGqC1V8sfXNb3iuynWiRXAlaHwAk04RWL5O1UbYGvRl
	 BLs4eBgJ2Nf7IZwR/LPB/pkfW9lqjaR9km9B1+LIoqipZ64uS6SW6q8PZ1MzdK+uWd
	 BXMsFu5ChjDJ5bV/n0ZcB2bKKsKLDn1pI9STv6y/swnCu1qhw9nJCzK42dZ8g8AsCi
	 8znmuefFOlk2NYetnziamWmReI6Kf6BxgSS4Hu/h2YrazFQ0HJlFcOJ/lVU7ORUXtB
	 4DvX5M/utLrSA==
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
Subject: [PATCH 13/19] arm64: cpu_ops: Introduce get_secondary_cpu_ops()
Date: Mon,  7 Sep 2026 17:40:16 +0100
Message-ID: <20260907164024.17164-14-will@kernel.org>
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

Introduce get_secondary_cpu_ops() to retrieve a pointer to the
'cpu_operations' structure for the non-boot CPUs and use it instead of
get_cpu_ops() where we are dealing with secondary CPUs.

This is a pre-requisite for enabling parallel CPU bring-up.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/cpu_ops.h |  1 +
 arch/arm64/kernel/cpu_ops.c      |  5 +++++
 arch/arm64/kernel/smp.c          | 19 +++++++------------
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/cpu_ops.h b/arch/arm64/include/asm/cpu_ops.h
index a444c8915e88..cd298a8710d8 100644
--- a/arch/arm64/include/asm/cpu_ops.h
+++ b/arch/arm64/include/asm/cpu_ops.h
@@ -48,6 +48,7 @@ struct cpu_operations {
 
 int __init init_cpu_ops(int cpu);
 extern const struct cpu_operations *get_cpu_ops(int cpu);
+extern const struct cpu_operations *get_secondary_cpu_ops(void);
 
 static inline void __init init_bootcpu_ops(void)
 {
diff --git a/arch/arm64/kernel/cpu_ops.c b/arch/arm64/kernel/cpu_ops.c
index eacfb88a0c0c..7d183ca31dc8 100644
--- a/arch/arm64/kernel/cpu_ops.c
+++ b/arch/arm64/kernel/cpu_ops.c
@@ -127,3 +127,8 @@ const struct cpu_operations *get_cpu_ops(int cpu)
 
 	return NULL;
 }
+
+const struct cpu_operations *get_secondary_cpu_ops(void)
+{
+	return cpu_ops;
+}
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index c5e9d5d5e003..2e98a92eb764 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -100,7 +100,7 @@ static inline int op_cpu_kill(unsigned int cpu)
  */
 static int boot_secondary(unsigned int cpu, struct task_struct *idle)
 {
-	const struct cpu_operations *ops = get_cpu_ops(cpu);
+	const struct cpu_operations *ops = get_secondary_cpu_ops();
 
 	if (ops->cpu_boot)
 		return ops->cpu_boot(cpu);
@@ -220,7 +220,7 @@ asmlinkage notrace void secondary_start_kernel(void)
 	 */
 	check_local_cpu_capabilities();
 
-	ops = get_cpu_ops(cpu);
+	ops = get_secondary_cpu_ops();
 	if (ops->cpu_postboot)
 		ops->cpu_postboot();
 
@@ -327,7 +327,7 @@ int __cpu_disable(void)
 
 static int op_cpu_kill(unsigned int cpu)
 {
-	const struct cpu_operations *ops = get_cpu_ops(cpu);
+	const struct cpu_operations *ops = get_secondary_cpu_ops();
 
 	/*
 	 * If we have no means of synchronising with the dying CPU, then assume
@@ -368,7 +368,7 @@ void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
 void __noreturn cpu_die(void)
 {
 	unsigned int cpu = smp_processor_id();
-	const struct cpu_operations *ops = get_cpu_ops(cpu);
+	const struct cpu_operations *ops = get_secondary_cpu_ops();
 
 	idle_task_exit();
 
@@ -492,7 +492,7 @@ static int __init smp_cpu_setup(int cpu)
 	if (init_cpu_ops(cpu))
 		return -ENODEV;
 
-	ops = get_cpu_ops(cpu);
+	ops = get_secondary_cpu_ops();
 	if (ops->cpu_init(cpu))
 		return -ENODEV;
 
@@ -776,7 +776,7 @@ void __init smp_init_cpus(void)
 
 void __init smp_prepare_cpus(unsigned int max_cpus)
 {
-	const struct cpu_operations *ops;
+	const struct cpu_operations *ops = get_secondary_cpu_ops();
 	unsigned int cpu;
 	int err;
 
@@ -802,10 +802,6 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 		if (cpu == 0)
 			continue;
 
-		ops = get_cpu_ops(cpu);
-		if (!ops)
-			continue;
-
 		err = ops->cpu_prepare(cpu);
 		if (err)
 			continue;
@@ -1341,8 +1337,7 @@ bool smp_crash_stop_failed(void)
 static bool have_cpu_die(void)
 {
 #ifdef CONFIG_HOTPLUG_CPU
-	int any_cpu = raw_smp_processor_id();
-	const struct cpu_operations *ops = get_cpu_ops(any_cpu);
+	const struct cpu_operations *ops = get_secondary_cpu_ops();
 
 	if (ops && ops->cpu_die)
 		return true;
-- 
2.55.0.979.g7e5102b832-goog

