Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA20751FCAD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799257; cv=none; b=emJqgcuq2trO3e0KpROas97VdEAoeEZTAx88ckW8BQsdK0ekteWebIW73puamcN8/nk0inaB+jqwEIyq1veb0hWzRlREcp6IHBXKdmop7w88NZff5rpr7EqEV1Dp+TALlDnQHYSylksW4PwRpq8d3n9jo24RaqbfgeOWZXFlQis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799257; c=relaxed/simple;
	bh=unB9HLg/A52hjV9RXAp9bO5R7C9p4LOr3SHaG1NcH4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nMWUGD/ke0DqhgWR46l2OuVKLYNGcxED+BAb9EAcXtDHb2NGx0A+UkQ+W3J7r6nYYAlEr2KRlmlFstmVHdfP9FV1vju1fYrCzTT128FSZwGmx1B2IiR4UJQbkLW09KKZar1BHTQdXgT0otBgAK8HuQT2Ac/FJcwU2JycIf/mbkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CxoXJiCk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CxoXJiCk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E69981F00A3D;
	Mon,  7 Sep 2026 16:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799255;
	bh=puRxUS2/XAPl8zTD4NIPKVxwBIteg8DAERZVvuIbp4I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CxoXJiCk9jy52gzQo1fE0/EPtcgByPb2aekDRwGXIUBCStgxq0xf039Huc/1cqpZ/
	 YdXujKVw/hqR8aIgKejJbvd7qFGnEL++OUIe/88ADEB2AOMdHiMhZKxXzkOTqXd5Tz
	 D6gsZ8VrZ0wht8v2ko5b4tDabq6dTf9py7C9V3OGkKNjyYE38NyXYf0utw3mwJNLnT
	 hH9yGQcAJaBZRjFmGuoAB+8SIUnDp32kyY0QvSMXRewnGqdNdvfqm66J6F+DhSIvIp
	 JlZnBaeK5TUm6kXgbrtk2w31qKGRCfBMUaOhX8Iean3Ry5jL53uXo6LLqS2ihoDgmD
	 W7ErQ0s2ac3vQ==
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
Subject: [PATCH 07/19] arm64: smp: Defer update of secondary CPU capabilities
Date: Mon,  7 Sep 2026 17:40:10 +0100
Message-ID: <20260907164024.17164-8-will@kernel.org>
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

check_local_cpu_capabilities() runs relatively early during the boot of
each secondary CPU and, despite its name, calls update_cpu_capabilities()
to manipulate the global 'system_cpucaps' based on the features detected
by the incoming CPU.

In preparation for parallel bringup of secondary CPUs, move the call
to update_cpu_capabilities() into update_cpu_features(), allowing
check_local_cpu_capabilities() to run concurrently in future, as it now
only performs local verification of the incoming CPU.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 311 +++++++++++++++++----------------
 1 file changed, 157 insertions(+), 154 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 33279a264145..fadc36cdff99 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1408,156 +1408,6 @@ static int update_32bit_cpu_features(int cpu, struct cpuinfo_32bit *info,
 	return taint;
 }
 
-/*
- * Update system wide CPU feature registers with the values from a
- * non-boot CPU. Also performs SANITY checks to make sure that there
- * aren't any insane variations from that of the boot CPU.
- */
-void update_cpu_features(int cpu)
-{
-	struct cpuinfo_arm64 *boot, *info;
-	int taint = 0;
-
-	boot = &boot_cpu_data;
-	info = per_cpu_ptr(&cpu_data, cpu);
-
-	/*
-	 * The kernel can handle differing I-cache policies, but otherwise
-	 * caches should look identical. Userspace JITs will make use of
-	 * *minLine.
-	 */
-	taint |= check_update_ftr_reg(SYS_CTR_EL0, cpu,
-				      info->reg_ctr, boot->reg_ctr);
-
-	/*
-	 * Userspace may perform DC ZVA instructions. Mismatched block sizes
-	 * could result in too much or too little memory being zeroed if a
-	 * process is preempted and migrated between CPUs.
-	 */
-	taint |= check_update_ftr_reg(SYS_DCZID_EL0, cpu,
-				      info->reg_dczid, boot->reg_dczid);
-
-	/* If different, timekeeping will be broken (especially with KVM) */
-	taint |= check_update_ftr_reg(SYS_CNTFRQ_EL0, cpu,
-				      info->reg_cntfrq, boot->reg_cntfrq);
-
-	/*
-	 * The kernel uses self-hosted debug features and expects CPUs to
-	 * support identical debug features. We presently need CTX_CMPs, WRPs,
-	 * and BRPs to be identical.
-	 * ID_AA64DFR1 is currently RES0.
-	 */
-	taint |= check_update_ftr_reg(SYS_ID_AA64DFR0_EL1, cpu,
-				      info->reg_id_aa64dfr0, boot->reg_id_aa64dfr0);
-	taint |= check_update_ftr_reg(SYS_ID_AA64DFR1_EL1, cpu,
-				      info->reg_id_aa64dfr1, boot->reg_id_aa64dfr1);
-	/*
-	 * Even in big.LITTLE, processors should be identical instruction-set
-	 * wise.
-	 */
-	taint |= check_update_ftr_reg(SYS_ID_AA64ISAR0_EL1, cpu,
-				      info->reg_id_aa64isar0, boot->reg_id_aa64isar0);
-	taint |= check_update_ftr_reg(SYS_ID_AA64ISAR1_EL1, cpu,
-				      info->reg_id_aa64isar1, boot->reg_id_aa64isar1);
-	taint |= check_update_ftr_reg(SYS_ID_AA64ISAR2_EL1, cpu,
-				      info->reg_id_aa64isar2, boot->reg_id_aa64isar2);
-	taint |= check_update_ftr_reg(SYS_ID_AA64ISAR3_EL1, cpu,
-				      info->reg_id_aa64isar3, boot->reg_id_aa64isar3);
-
-	/*
-	 * Differing PARange support is fine as long as all peripherals and
-	 * memory are mapped within the minimum PARange of all CPUs.
-	 * Linux should not care about secure memory.
-	 */
-	taint |= check_update_ftr_reg(SYS_ID_AA64MMFR0_EL1, cpu,
-				      info->reg_id_aa64mmfr0, boot->reg_id_aa64mmfr0);
-	taint |= check_update_ftr_reg(SYS_ID_AA64MMFR1_EL1, cpu,
-				      info->reg_id_aa64mmfr1, boot->reg_id_aa64mmfr1);
-	taint |= check_update_ftr_reg(SYS_ID_AA64MMFR2_EL1, cpu,
-				      info->reg_id_aa64mmfr2, boot->reg_id_aa64mmfr2);
-	taint |= check_update_ftr_reg(SYS_ID_AA64MMFR3_EL1, cpu,
-				      info->reg_id_aa64mmfr3, boot->reg_id_aa64mmfr3);
-	taint |= check_update_ftr_reg(SYS_ID_AA64MMFR4_EL1, cpu,
-				      info->reg_id_aa64mmfr4, boot->reg_id_aa64mmfr4);
-
-	taint |= check_update_ftr_reg(SYS_ID_AA64PFR0_EL1, cpu,
-				      info->reg_id_aa64pfr0, boot->reg_id_aa64pfr0);
-	taint |= check_update_ftr_reg(SYS_ID_AA64PFR1_EL1, cpu,
-				      info->reg_id_aa64pfr1, boot->reg_id_aa64pfr1);
-	taint |= check_update_ftr_reg(SYS_ID_AA64PFR2_EL1, cpu,
-				      info->reg_id_aa64pfr2, boot->reg_id_aa64pfr2);
-
-	taint |= check_update_ftr_reg(SYS_ID_AA64ZFR0_EL1, cpu,
-				      info->reg_id_aa64zfr0, boot->reg_id_aa64zfr0);
-
-	taint |= check_update_ftr_reg(SYS_ID_AA64SMFR0_EL1, cpu,
-				      info->reg_id_aa64smfr0, boot->reg_id_aa64smfr0);
-
-	taint |= check_update_ftr_reg(SYS_ID_AA64FPFR0_EL1, cpu,
-				      info->reg_id_aa64fpfr0, boot->reg_id_aa64fpfr0);
-
-	/* Probe vector lengths */
-	if (IS_ENABLED(CONFIG_ARM64_SVE) &&
-	    id_aa64pfr0_sve(read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1))) {
-		if (!system_capabilities_finalized()) {
-			unsigned long cpacr = cpacr_save_enable_kernel_sve();
-
-			vec_update_vq_map(ARM64_VEC_SVE);
-
-			cpacr_restore(cpacr);
-		}
-	}
-
-	if (IS_ENABLED(CONFIG_ARM64_SME) &&
-	    id_aa64pfr1_sme(read_sanitised_ftr_reg(SYS_ID_AA64PFR1_EL1))) {
-		unsigned long cpacr = cpacr_save_enable_kernel_sme();
-
-		/* Probe vector lengths */
-		if (!system_capabilities_finalized())
-			vec_update_vq_map(ARM64_VEC_SME);
-
-		cpacr_restore(cpacr);
-	}
-
-	if (detect_ftr_has_mpam()) {
-		info->reg_mpamidr = read_cpuid(MPAMIDR_EL1);
-		taint |= check_update_ftr_reg(SYS_MPAMIDR_EL1, cpu,
-					info->reg_mpamidr, boot->reg_mpamidr);
-	}
-
-	/*
-	 * The kernel uses the LDGM/STGM instructions and the number of tags
-	 * they read/write depends on the GMID_EL1.BS field. Check that the
-	 * value is the same on all CPUs.
-	 */
-	if (gmid_el1_accessible(info))
-		taint |= check_update_ftr_reg(SYS_GMID_EL1, cpu,
-					      info->reg_gmid, boot->reg_gmid);
-
-	/*
-	 * If we don't have AArch32 at all then skip the checks entirely
-	 * as the register values may be UNKNOWN and we're not going to be
-	 * using them for anything.
-	 *
-	 * This relies on a sanitised view of the AArch64 ID registers
-	 * (e.g. SYS_ID_AA64PFR0_EL1), so we call it last.
-	 */
-	if (id_aa64pfr0_32bit_el0(info->reg_id_aa64pfr0)) {
-		lazy_init_32bit_cpu_features(info, boot);
-		taint |= update_32bit_cpu_features(cpu, &info->aarch32,
-						   &boot->aarch32);
-	}
-
-	/*
-	 * Mismatched CPU features are a recipe for disaster. Don't even
-	 * pretend to support them.
-	 */
-	if (taint) {
-		pr_warn_once("Unsupported CPU feature variation detected.\n");
-		add_taint(TAINT_CPU_OUT_OF_SPEC, LOCKDEP_STILL_OK);
-	}
-}
-
 u64 read_sanitised_ftr_reg(u32 id)
 {
 	struct arm64_ftr_reg *regp = get_arm64_ftr_reg(id);
@@ -3902,16 +3752,169 @@ void check_local_cpu_capabilities(void)
 	 */
 	check_early_cpu_features();
 
+	/*
+	 * Verify that this CPU has all the system advertised
+	 * capabilities.
+	 */
+	if (system_capabilities_finalized())
+		verify_local_cpu_capabilities();
+}
+
+/*
+ * Update system wide CPU feature registers with the values from a
+ * non-boot CPU. Also performs SANITY checks to make sure that there
+ * aren't any insane variations from that of the boot CPU.
+ */
+void update_cpu_features(int cpu)
+{
+	struct cpuinfo_arm64 *boot, *info;
+	int taint = 0;
+
 	/*
 	 * If we haven't finalised the system capabilities, this CPU gets
 	 * a chance to update the errata work arounds and local features.
-	 * Otherwise, this CPU should verify that it has all the system
-	 * advertised capabilities.
 	 */
 	if (!system_capabilities_finalized())
 		update_cpu_capabilities(SCOPE_LOCAL_CPU);
-	else
-		verify_local_cpu_capabilities();
+
+	boot = &boot_cpu_data;
+	info = per_cpu_ptr(&cpu_data, cpu);
+
+	/*
+	 * The kernel can handle differing I-cache policies, but otherwise
+	 * caches should look identical. Userspace JITs will make use of
+	 * *minLine.
+	 */
+	taint |= check_update_ftr_reg(SYS_CTR_EL0, cpu,
+				      info->reg_ctr, boot->reg_ctr);
+
+	/*
+	 * Userspace may perform DC ZVA instructions. Mismatched block sizes
+	 * could result in too much or too little memory being zeroed if a
+	 * process is preempted and migrated between CPUs.
+	 */
+	taint |= check_update_ftr_reg(SYS_DCZID_EL0, cpu,
+				      info->reg_dczid, boot->reg_dczid);
+
+	/* If different, timekeeping will be broken (especially with KVM) */
+	taint |= check_update_ftr_reg(SYS_CNTFRQ_EL0, cpu,
+				      info->reg_cntfrq, boot->reg_cntfrq);
+
+	/*
+	 * The kernel uses self-hosted debug features and expects CPUs to
+	 * support identical debug features. We presently need CTX_CMPs, WRPs,
+	 * and BRPs to be identical.
+	 * ID_AA64DFR1 is currently RES0.
+	 */
+	taint |= check_update_ftr_reg(SYS_ID_AA64DFR0_EL1, cpu,
+				      info->reg_id_aa64dfr0, boot->reg_id_aa64dfr0);
+	taint |= check_update_ftr_reg(SYS_ID_AA64DFR1_EL1, cpu,
+				      info->reg_id_aa64dfr1, boot->reg_id_aa64dfr1);
+	/*
+	 * Even in big.LITTLE, processors should be identical instruction-set
+	 * wise.
+	 */
+	taint |= check_update_ftr_reg(SYS_ID_AA64ISAR0_EL1, cpu,
+				      info->reg_id_aa64isar0, boot->reg_id_aa64isar0);
+	taint |= check_update_ftr_reg(SYS_ID_AA64ISAR1_EL1, cpu,
+				      info->reg_id_aa64isar1, boot->reg_id_aa64isar1);
+	taint |= check_update_ftr_reg(SYS_ID_AA64ISAR2_EL1, cpu,
+				      info->reg_id_aa64isar2, boot->reg_id_aa64isar2);
+	taint |= check_update_ftr_reg(SYS_ID_AA64ISAR3_EL1, cpu,
+				      info->reg_id_aa64isar3, boot->reg_id_aa64isar3);
+
+	/*
+	 * Differing PARange support is fine as long as all peripherals and
+	 * memory are mapped within the minimum PARange of all CPUs.
+	 * Linux should not care about secure memory.
+	 */
+	taint |= check_update_ftr_reg(SYS_ID_AA64MMFR0_EL1, cpu,
+				      info->reg_id_aa64mmfr0, boot->reg_id_aa64mmfr0);
+	taint |= check_update_ftr_reg(SYS_ID_AA64MMFR1_EL1, cpu,
+				      info->reg_id_aa64mmfr1, boot->reg_id_aa64mmfr1);
+	taint |= check_update_ftr_reg(SYS_ID_AA64MMFR2_EL1, cpu,
+				      info->reg_id_aa64mmfr2, boot->reg_id_aa64mmfr2);
+	taint |= check_update_ftr_reg(SYS_ID_AA64MMFR3_EL1, cpu,
+				      info->reg_id_aa64mmfr3, boot->reg_id_aa64mmfr3);
+	taint |= check_update_ftr_reg(SYS_ID_AA64MMFR4_EL1, cpu,
+				      info->reg_id_aa64mmfr4, boot->reg_id_aa64mmfr4);
+
+	taint |= check_update_ftr_reg(SYS_ID_AA64PFR0_EL1, cpu,
+				      info->reg_id_aa64pfr0, boot->reg_id_aa64pfr0);
+	taint |= check_update_ftr_reg(SYS_ID_AA64PFR1_EL1, cpu,
+				      info->reg_id_aa64pfr1, boot->reg_id_aa64pfr1);
+	taint |= check_update_ftr_reg(SYS_ID_AA64PFR2_EL1, cpu,
+				      info->reg_id_aa64pfr2, boot->reg_id_aa64pfr2);
+
+	taint |= check_update_ftr_reg(SYS_ID_AA64ZFR0_EL1, cpu,
+				      info->reg_id_aa64zfr0, boot->reg_id_aa64zfr0);
+
+	taint |= check_update_ftr_reg(SYS_ID_AA64SMFR0_EL1, cpu,
+				      info->reg_id_aa64smfr0, boot->reg_id_aa64smfr0);
+
+	taint |= check_update_ftr_reg(SYS_ID_AA64FPFR0_EL1, cpu,
+				      info->reg_id_aa64fpfr0, boot->reg_id_aa64fpfr0);
+
+	/* Probe vector lengths */
+	if (IS_ENABLED(CONFIG_ARM64_SVE) &&
+	    id_aa64pfr0_sve(read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1))) {
+		if (!system_capabilities_finalized()) {
+			unsigned long cpacr = cpacr_save_enable_kernel_sve();
+
+			vec_update_vq_map(ARM64_VEC_SVE);
+
+			cpacr_restore(cpacr);
+		}
+	}
+
+	if (IS_ENABLED(CONFIG_ARM64_SME) &&
+	    id_aa64pfr1_sme(read_sanitised_ftr_reg(SYS_ID_AA64PFR1_EL1))) {
+		unsigned long cpacr = cpacr_save_enable_kernel_sme();
+
+		/* Probe vector lengths */
+		if (!system_capabilities_finalized())
+			vec_update_vq_map(ARM64_VEC_SME);
+
+		cpacr_restore(cpacr);
+	}
+
+	if (detect_ftr_has_mpam()) {
+		info->reg_mpamidr = read_cpuid(MPAMIDR_EL1);
+		taint |= check_update_ftr_reg(SYS_MPAMIDR_EL1, cpu,
+					info->reg_mpamidr, boot->reg_mpamidr);
+	}
+
+	/*
+	 * The kernel uses the LDGM/STGM instructions and the number of tags
+	 * they read/write depends on the GMID_EL1.BS field. Check that the
+	 * value is the same on all CPUs.
+	 */
+	if (gmid_el1_accessible(info))
+		taint |= check_update_ftr_reg(SYS_GMID_EL1, cpu,
+					      info->reg_gmid, boot->reg_gmid);
+
+	/*
+	 * If we don't have AArch32 at all then skip the checks entirely
+	 * as the register values may be UNKNOWN and we're not going to be
+	 * using them for anything.
+	 *
+	 * This relies on a sanitised view of the AArch64 ID registers
+	 * (e.g. SYS_ID_AA64PFR0_EL1), so we call it last.
+	 */
+	if (id_aa64pfr0_32bit_el0(info->reg_id_aa64pfr0)) {
+		lazy_init_32bit_cpu_features(info, boot);
+		taint |= update_32bit_cpu_features(cpu, &info->aarch32,
+						   &boot->aarch32);
+	}
+
+	/*
+	 * Mismatched CPU features are a recipe for disaster. Don't even
+	 * pretend to support them.
+	 */
+	if (taint) {
+		pr_warn_once("Unsupported CPU feature variation detected.\n");
+		add_taint(TAINT_CPU_OUT_OF_SPEC, LOCKDEP_STILL_OK);
+	}
 }
 
 bool this_cpu_has_cap(unsigned int n)
-- 
2.55.0.979.g7e5102b832-goog

