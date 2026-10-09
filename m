Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC553FD960
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540510; cv=none; b=ee5+UH99C01qzOJ5ZdECTB70R3ODSo5fUfq7YL3Rzblwjn3wvimxEvVEVIjw7J7op3QWsmhgYFrR3ji1hIcVJceZNaTzlt1QL44NKMtYqqK4H53xmB0QgAocnEq9wCqpKWpEoT1UHKV3iEHn0q+1RDw/15+j9SZnvohLpl7h/xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540510; c=relaxed/simple;
	bh=lHNtmrSnj0Jps8KNqGgXRTSVlIVyFceXU0r11mldyCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mS7cXS3auC40+dUmOod4Atsp8rWRcA1789khwnn6eni7w4HCkjuEIWeghorC4048UtkPkvmYcZ60AQ27sZH0eenp3qwUk9pYC3kBwiHJg1C1CkiERpIwwlKRBaoDyQia/gFaagPj1pdHJyLeB5Kv9qaqCjoHtFN1+kc7wCZtqYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JyfMMqMm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JyfMMqMm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAAD01F00893;
	Fri,  9 Oct 2026 10:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540509;
	bh=mTkXmgp1TDSFpKBTkG4Kb2S3vuNRVrB0jzrIvSP6ahA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JyfMMqMm53ndJlgRq/xIamw8UCagPNniFtc+3Jtos7hNRuzULt7RnEtvnLq6tYADM
	 e9FiGmyV4OiwVZWstRAIQxPsjiCnZyH1aE6UAnttUJfB6bLCbyj2msVcvfByQVo3X4
	 GYHPPB9F26cBfVd/im5q1+z6+z27a5zwpREes86+JZ3jH4SmaleYwmT4Dnhxlp6CAV
	 4nI7uTYgFKdsb5h/e6IE4dCxG34k4fkwKZ/owq30qJPDzFXMQvL7d915Sr98LHWDH6
	 CxqOAxSbiuBS6/U1RfOjocL+od8qktxyKtcLtIav6m7JQazyYVuh5YLfXW0YCvBKu8
	 RstpXyfTqJixA==
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
Subject: [PATCH v2 11/23] arm64: smp: Defer update of secondary CPU capabilities
Date: Fri,  9 Oct 2026 11:07:22 +0100
Message-ID: <20261009100738.31288-12-will@kernel.org>
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

check_local_cpu_capabilities() runs relatively early during the boot of
each secondary CPU and, despite its name, calls update_cpu_capabilities()
to manipulate the global 'system_cpucaps' based on the features detected
by the incoming CPU.

In preparation for parallel bringup of secondary CPUs, move the call
to update_cpu_capabilities() into update_cpu_features(), allowing
check_local_cpu_capabilities() to run concurrently in future, as it now
only performs local verification of the incoming CPU.

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 307 +++++++++++++++++----------------
 1 file changed, 155 insertions(+), 152 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 5db456884ffa..1cc189944141 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1395,154 +1395,6 @@ static int update_32bit_cpu_features(int cpu, struct cpuinfo_32bit *info,
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
-	if (id_aa64pfr0_mpam(info->reg_id_aa64pfr0) || id_aa64pfr1_mpamfrac(info->reg_id_aa64pfr1))
-		taint |= check_update_ftr_reg(SYS_MPAMIDR_EL1, cpu,
-					      info->reg_mpamidr, boot->reg_mpamidr);
-
-	/*
-	 * The kernel uses the LDGM/STGM instructions and the number of tags
-	 * they read/write depends on the GMID_EL1.BS field. Check that the
-	 * value is the same on all CPUs.
-	 */
-	if (IS_ENABLED(CONFIG_ARM64_MTE) && id_aa64pfr1_mte(info->reg_id_aa64pfr1))
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
@@ -3887,16 +3739,167 @@ void check_local_cpu_capabilities(void)
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
+	if (id_aa64pfr0_mpam(info->reg_id_aa64pfr0) || id_aa64pfr1_mpamfrac(info->reg_id_aa64pfr1))
+		taint |= check_update_ftr_reg(SYS_MPAMIDR_EL1, cpu,
+					info->reg_mpamidr, boot->reg_mpamidr);
+
+	/*
+	 * The kernel uses the LDGM/STGM instructions and the number of tags
+	 * they read/write depends on the GMID_EL1.BS field. Check that the
+	 * value is the same on all CPUs.
+	 */
+	if (IS_ENABLED(CONFIG_ARM64_MTE) && id_aa64pfr1_mte(info->reg_id_aa64pfr1))
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
2.56.0.385.gd3acb90ef8-goog

