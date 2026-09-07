Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27E451FCA4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799254; cv=none; b=japAlHwkIPauWtFmHNk2M3JNu9cgym/MqMuh1siaSabb6HkrJ2KHqN/a/FEoQ5BhSA4jNsPNOojRjFCrZrNVlEcx1jTthVXwmFWw4cs9ffp4F0Oq87GASo12lfPNmraH5i45N+lHVbX/K6ZucWCx2YVCyUJLc5VAvLFiZ1pbC30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799254; c=relaxed/simple;
	bh=LrvXE1raeDbjqxcZRef3F3YWyzEGkfHLlBd1keSAddQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iRefuYHPD2hm9cBlJHnOuzIxcFN3u9gz2ScZZT0rzKR1f/W6jn+YEgUeNktfOGG8beIjTffPDGFUkFr7QkWCuYsW6EPde9sbwXVUsFHzF+uGDK6JZGDj5tsGDxbHr6Sg3Hjy7W8rwwqz/sUzhT9X07jBU/ZxWfHm/uHaOI4u9bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ATZKoBJ6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ATZKoBJ6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1478A1F00A3A;
	Mon,  7 Sep 2026 16:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799252;
	bh=At9LJdU5cgvv7ZJbfKjHKjwlaWl9OU0fIElfasVAlIk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ATZKoBJ6yED1rP5d6J8G3v3sB24Zd+iIkkfd6VIIjXAdkxKL7Iq/Kd6QuqbjOVd5q
	 GBOSIAxxaCK4TCVnMtbvH6at6Wfggfqeokn41oSz9y33aNmrLICEIoVjzFzBzvDRDP
	 AHzpESl2SwUm8TNCuF9XnX/52yNMClhxtdOKnfxTKWXniB706SKnpcOkbqTP2qp+IK
	 Mr6QzXePojRAOTAZDA0DPFmQIi7m/FBDcFOEYMX49H12JBLNzcxzkF9gkC++MZqOKM
	 TiEQSQLVISk/w7oIsbEIU5uGwZBDhFDxSWfIXHFmX/eZZr6xK1yQCBntrBECnkK9Gf
	 GkfCVIfYYf4xQ==
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
Subject: [PATCH 06/19] arm64: smp: Tidy up cpuinfo init and cpufeature updates
Date: Mon,  7 Sep 2026 17:40:09 +0100
Message-ID: <20260907164024.17164-7-will@kernel.org>
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

Populating the 'cpuinfo_arm64' structure during CPU bringup and
subsequently checking/updating cpufeature structures is slightly
convoluted and differs unnecessarily between the boot CPU and secondary
CPUs.

Rework the code so that cpuinfo_store_cpu() is used to populate the
'cpuinfo_arm64' structure for each CPU, with secondary CPUs then calling
update_cpu_features() to update the global view of the available
features. This allows us to internalise the 'boot_cpu_data' in
cpufeature.c and paves the way for parallelising the ID register probing
during bring-up of secondary CPUs.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/cpu.h   |  7 +++----
 arch/arm64/kernel/cpufeature.c | 21 +++++++++++++++++----
 arch/arm64/kernel/cpuinfo.c    | 11 -----------
 arch/arm64/kernel/smp.c        |  3 ++-
 4 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/include/asm/cpu.h b/arch/arm64/include/asm/cpu.h
index 3c008821219c..733178520c45 100644
--- a/arch/arm64/include/asm/cpu.h
+++ b/arch/arm64/include/asm/cpu.h
@@ -73,11 +73,10 @@ struct cpuinfo_arm64 {
 DECLARE_PER_CPU(struct cpuinfo_arm64, cpu_data);
 
 void cpuinfo_store_cpu(void);
-void __init cpuinfo_store_boot_cpu(void);
 
-void __init init_cpu_features(struct cpuinfo_arm64 *info);
-void update_cpu_features(int cpu, struct cpuinfo_arm64 *info,
-				 struct cpuinfo_arm64 *boot);
+void __init init_cpu_features(void);
+void update_cpu_features(int cpu);
+
 bool gmid_el1_accessible(const struct cpuinfo_arm64 *info);
 
 #endif /* __ASM_CPU_H */
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 32102c3912fa..33279a264145 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -117,6 +117,7 @@ EXPORT_SYMBOL(system_cpucaps);
 static struct arm64_cpu_capabilities const __ro_after_init *cpucap_ptrs[ARM64_NCAPS];
 
 DECLARE_BITMAP(boot_cpucaps, ARM64_NCAPS);
+static struct cpuinfo_arm64 boot_cpu_data;
 
 /*
  * arm64_use_ng_mappings must be placed in the .data section, otherwise it
@@ -1205,11 +1206,19 @@ bool gmid_el1_accessible(const struct cpuinfo_arm64 *info)
 	return mte >= ID_AA64PFR1_EL1_MTE_MTE2;
 }
 
-void __init init_cpu_features(struct cpuinfo_arm64 *info)
+void __init init_cpu_features(void)
 {
+	struct cpuinfo_arm64 *info = &per_cpu(cpu_data, 0);
+
 	/* Before we start using the tables, make sure it is sorted */
 	sort_ftr_regs();
 
+	/*
+	 * We keep a copy of the boot CPU registers so that physical hotplug
+	 * of CPU 0 can still be properly checked.
+	 */
+	boot_cpu_data = *info;
+
 	init_cpu_ftr_reg(SYS_CTR_EL0, info->reg_ctr);
 	init_cpu_ftr_reg(SYS_DCZID_EL0, info->reg_dczid);
 	init_cpu_ftr_reg(SYS_CNTFRQ_EL0, info->reg_cntfrq);
@@ -1404,12 +1413,14 @@ static int update_32bit_cpu_features(int cpu, struct cpuinfo_32bit *info,
  * non-boot CPU. Also performs SANITY checks to make sure that there
  * aren't any insane variations from that of the boot CPU.
  */
-void update_cpu_features(int cpu,
-			 struct cpuinfo_arm64 *info,
-			 struct cpuinfo_arm64 *boot)
+void update_cpu_features(int cpu)
 {
+	struct cpuinfo_arm64 *boot, *info;
 	int taint = 0;
 
+	boot = &boot_cpu_data;
+	info = per_cpu_ptr(&cpu_data, cpu);
+
 	/*
 	 * The kernel can handle differing I-cache policies, but otherwise
 	 * caches should look identical. Userspace JITs will make use of
@@ -3978,6 +3989,8 @@ static void __init setup_boot_cpu_capabilities(void)
 
 void __init setup_boot_cpu_features(void)
 {
+	init_cpu_features();
+
 	/*
 	 * Initialize the indirect array of CPU capabilities pointers before we
 	 * handle the boot CPU.
diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index 45c63f3d75c5..b423301a13cc 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -31,7 +31,6 @@
  * values depending on configuration at or after reset.
  */
 DEFINE_PER_CPU(struct cpuinfo_arm64, cpu_data);
-static struct cpuinfo_arm64 boot_cpu_data;
 
 static inline const char *icache_policy_str(int l1ip)
 {
@@ -531,14 +530,4 @@ void cpuinfo_store_cpu(void)
 {
 	struct cpuinfo_arm64 *info = this_cpu_ptr(&cpu_data);
 	__cpuinfo_store_cpu(info);
-	update_cpu_features(smp_processor_id(), info, &boot_cpu_data);
-}
-
-void __init cpuinfo_store_boot_cpu(void)
-{
-	struct cpuinfo_arm64 *info = &per_cpu(cpu_data, 0);
-	__cpuinfo_store_cpu(info);
-
-	boot_cpu_data = *info;
-	init_cpu_features(&boot_cpu_data);
 }
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index ff045080ca1b..f4cabf9e19e6 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -235,6 +235,7 @@ asmlinkage notrace void secondary_start_kernel(void)
 	 * Log the CPU info before it is marked online and might get read.
 	 */
 	cpuinfo_store_cpu();
+	update_cpu_features(cpu);
 	store_cpu_topology(cpu);
 
 	/*
@@ -455,7 +456,7 @@ void __init smp_prepare_boot_cpu(void)
 	 */
 	set_my_cpu_offset(per_cpu_offset(smp_processor_id()));
 
-	cpuinfo_store_boot_cpu();
+	cpuinfo_store_cpu();
 	setup_boot_cpu_features();
 
 	/* Conditionally switch to GIC PMR for interrupt masking */
-- 
2.55.0.979.g7e5102b832-goog

