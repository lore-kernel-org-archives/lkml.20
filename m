Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3996B4582D3
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540533; cv=none; b=QfrmehMvCNhk4OQ7OH7Z/duCXk1pGkn7AiSmYmTFgs5F6mrPhyid9WGLTnu9TAnRA7GgFuEsj6BnguM83qOVOdyHNWkdfu98JJmnY+l/YEcaPVHl9tfh/RCgXa+2qeJRnEfQC4BOuhYqaQcquuJOfKH09ultaWxYEPWu3wjidG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540533; c=relaxed/simple;
	bh=OyUih27sFMvuK4J/ju0pEaDLVI/NOY1vwR/SYNFvfJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kkSxRiQ3q1fwhLMnjdUUcEUV/72Qr1YiqoiUoVTRFPycUMWQ0ATM/1FlZzFp8OzRvPOK9mbnwjE3H/ldDaGus25Q5Ddrqtw8ptwOE1ZX3FybRT63YRq9PVV54wI9yvMUlDRSVnuBhj5sj8M68gE3BVzy0f5/1Sq6ldnmkvY9keg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VV2WNtAS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VV2WNtAS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A927A1F000FF;
	Fri,  9 Oct 2026 10:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540531;
	bh=Gf3FKiGtI6KQvcd0GShYu0Q8rw5bxQGuG60R9wMsHvs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VV2WNtASTb2ywGrU+P4MagqzQJqSlcybnay65ivhhNFbICQvC4wYZdl74iX5p9Rfd
	 jIkMWR4TpDIzC1NUJmuPT8uxCapov3UFXt+32M6W/cMc02/mrDyGy/gZzCiagy2Wg5
	 bkBbYrcfYeFQGi6UARjSzRcKaDeAPf1FLLKfjwMxXWDbDJfibt2WqE2RILQpyd+E6b
	 /NKzj8/lnEYGX4NoqKalXw+d+jcWUlqvxhb6aVAxApBurH1n9YKkYB1Dqtfrr8vhe1
	 F8W0L7+03vjR3nj0F5hSVnurbAY3F8hm0RzQxqjctKtcRjQNF9SsDEW+L6eWP/FAuF
	 tN+pSm7bBspvQ==
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
Subject: [PATCH v2 17/23] arm64: cpu_ops: Introduce get_secondary_cpu_ops()
Date: Fri,  9 Oct 2026 11:07:28 +0100
Message-ID: <20261009100738.31288-18-will@kernel.org>
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

Introduce get_secondary_cpu_ops() to retrieve a pointer to the
'cpu_operations' structure for the non-boot CPUs and use it instead of
get_cpu_ops() where we are dealing with secondary CPUs.

This is a pre-requisite for enabling parallel CPU bring-up.

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
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
index 918b54d1c301..f7141ec18029 100644
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
@@ -221,7 +221,7 @@ asmlinkage notrace void secondary_start_kernel(void)
 	 */
 	check_local_cpu_capabilities();
 
-	ops = get_cpu_ops(cpu);
+	ops = get_secondary_cpu_ops();
 	if (ops->cpu_postboot)
 		ops->cpu_postboot();
 
@@ -329,7 +329,7 @@ int __cpu_disable(void)
 
 static int op_cpu_kill(unsigned int cpu)
 {
-	const struct cpu_operations *ops = get_cpu_ops(cpu);
+	const struct cpu_operations *ops = get_secondary_cpu_ops();
 
 	/*
 	 * If we have no means of synchronising with the dying CPU, then assume
@@ -370,7 +370,7 @@ void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
 void __noreturn cpu_die(void)
 {
 	unsigned int cpu = smp_processor_id();
-	const struct cpu_operations *ops = get_cpu_ops(cpu);
+	const struct cpu_operations *ops = get_secondary_cpu_ops();
 
 	idle_task_exit();
 
@@ -496,7 +496,7 @@ static int __init smp_cpu_setup(int cpu)
 	if (init_cpu_ops(cpu))
 		return -ENODEV;
 
-	ops = get_cpu_ops(cpu);
+	ops = get_secondary_cpu_ops();
 	if (ops->cpu_init(cpu))
 		return -ENODEV;
 
@@ -780,7 +780,7 @@ void __init smp_init_cpus(void)
 
 void __init smp_prepare_cpus(unsigned int max_cpus)
 {
-	const struct cpu_operations *ops;
+	const struct cpu_operations *ops = get_secondary_cpu_ops();
 	unsigned int cpu;
 	int err;
 
@@ -806,10 +806,6 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 		if (cpu == 0)
 			continue;
 
-		ops = get_cpu_ops(cpu);
-		if (!ops)
-			continue;
-
 		err = ops->cpu_prepare(cpu);
 		if (err)
 			continue;
@@ -1345,8 +1341,7 @@ bool smp_crash_stop_failed(void)
 static bool have_cpu_die(void)
 {
 #ifdef CONFIG_HOTPLUG_CPU
-	int any_cpu = raw_smp_processor_id();
-	const struct cpu_operations *ops = get_cpu_ops(any_cpu);
+	const struct cpu_operations *ops = get_secondary_cpu_ops();
 
 	if (ops && ops->cpu_die)
 		return true;
-- 
2.56.0.385.gd3acb90ef8-goog

