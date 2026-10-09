Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E8E2D2381
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540499; cv=none; b=eIc8BykFuaqBV7VfuFutvbaX2OBUACUTRoUKdIRNv/MyjHckSZfnytvNSKwGv4jAp63VwLCNDPgriA71WAOGzgZr8M0RS2nR5p+GdfB3fQj6FleiKV15Tnq3CdbvIRTX1CS8tF9snk2+jgTgtZBEehQ1gWgTGR3esJr5Uq/6kEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540499; c=relaxed/simple;
	bh=FicgNtHW7scGwHIVnJjis50CCv5Xe1142hmt0Gr2pGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YtMgvhjnoPyHalUqyZ7aHU5IuV9zcUnAXTo8vbvvIfoOjsIcbnWph3RAIkTRjQ+ZlG+C+wGqJ/8vy2zihdIza2CB29Jf0Jk0/eOoWcLvQW0IwHu9rQfac3hhD5h67475zDosCruzsLmIxXZJ8z6G2sB88zTntuZ5WzcnT1YQD3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C51QQS50; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C51QQS50"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75F491F000FF;
	Fri,  9 Oct 2026 10:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540497;
	bh=+Qrvc+rt0o6O4osWbgiCSiDo37PvAMXuhQ7GuDZ5Zt8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=C51QQS506QUQ+J0WayZL8GLVwyxNRjpeqnypt+MEB4z5TbEnJC/jSslDGvM93ZBwo
	 b0T+xFbdQlVpRxivtSLN1Fadts3Wiq3axsJRDPdHw9oKOdN7FTwmUWog29DQPed366
	 kb90mtiz9hHYG3cmeun3TM/G3Ny72C7OneAkRyVqktVWpqae578RDXMqbNZrR1O/NS
	 Ea3e8KzCqQoXd4myostkMzyHO9l6SkRMUcg11EaR0EI2FFtwi3/KBbfUOPzRPY3uJJ
	 kpuJzVbaf0xp5GeDpbY+boDs1BACt8CwP4syQHhNoX10Dy3fWqNwOVqgvNrss2gNxg
	 aLxz1Mtp5uj+w==
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
Subject: [PATCH v2 08/23] arm64: cpufeature: Store every ID register with its overrides applied
Date: Fri,  9 Oct 2026 11:07:19 +0100
Message-ID: <20261009100738.31288-9-will@kernel.org>
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

From: Fuad Tabba <fuad.tabba@linux.dev>

__cpuinfo_store_cpu() stores ID_AA64PFR0_EL1 and ID_AA64PFR1_EL1 with
their overrides applied and every other register raw. Store the rest
the same way. Everything read with read_cpuid() goes through
read_cpuid_with_overrides(). CTR_EL0 and CNTFRQ_EL0, which are read
otherwise, go through arm64_ftr_reg_override(). It returns a register
with no override unchanged, so an override added to one later takes
effect without a change here.

init_cpu_ftr_reg() then gets values that already carry every valid
override, so its code to apply one is dead. Remove that code.
init_cpu_ftr_reg() still removes an unsafe override, so the same
overrides are rejected and sys_val is unchanged. Only its log changes.
The raw value is gone, so it logs an override equal to that value as
"forced" rather than "already set".

Secondaries are compared with the boot CPU on their stored values, so
CPUs that differ only in a field the command line turned off no longer
taint the kernel.

Suggested-by: Will Deacon <will@kernel.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 17 +++----
 arch/arm64/kernel/cpuinfo.c    | 82 +++++++++++++++++-----------------
 2 files changed, 46 insertions(+), 53 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 9212f10c1d1a..d69a5b8304b6 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1043,6 +1043,8 @@ void __init validate_ftr_regs(void)
  * Also initialises the strict_mask for the register.
  * Any bits that are not covered by an arm64_ftr_bits entry are considered
  * RES0 for the system-wide value, and must strictly match.
+ * @new has been through arm64_ftr_reg_override(), so a valid override is
+ * already applied to it. Only an unsafe one is left to remove here.
  */
 static void init_cpu_ftr_reg(u32 sys_reg, u64 new)
 {
@@ -1063,29 +1065,20 @@ static void init_cpu_ftr_reg(u32 sys_reg, u64 new)
 		s64 ftr_ovr = arm64_ftr_value(ftrp, reg->override->val);
 
 		if ((ftr_mask & reg->override->mask) == ftr_mask) {
-			s64 tmp = arm64_ftr_safe_value(ftrp, ftr_ovr, ftr_new);
-			char *str = NULL;
+			char *str = "forced";
 
-			if (ftr_ovr != tmp) {
+			if (arm64_ftr_safe_value(ftrp, ftr_ovr, ftr_new) != ftr_ovr) {
 				/* Unsafe, remove the override */
 				reg->override->mask &= ~ftr_mask;
 				reg->override->val &= ~ftr_mask;
-				tmp = ftr_ovr;
 				str = "ignoring override";
-			} else if (ftr_new != tmp) {
-				/* Override was valid */
-				ftr_new = tmp;
-				str = "forced";
-			} else {
-				/* Override was the safe value */
-				str = "already set";
 			}
 
 			pr_warn("%s[%d:%d]: %s to %llx\n",
 				reg->name,
 				ftrp->shift + ftrp->width - 1,
 				ftrp->shift, str,
-				tmp & (BIT(ftrp->width) - 1));
+				ftr_ovr & (BIT(ftrp->width) - 1));
 		} else if ((ftr_mask & reg->override->val) == ftr_mask) {
 			reg->override->val &= ~ftr_mask;
 			pr_warn("%s[%d:%d]: impossible override, ignored\n",
diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index 0ae40b0c7b2f..1b92e52989b1 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -443,33 +443,33 @@ static void cpuinfo_detect_icache_policy(struct cpuinfo_arm64 *info)
 
 static void __cpuinfo_store_cpu_32bit(struct cpuinfo_32bit *info)
 {
-	info->reg_id_dfr0 = read_cpuid(ID_DFR0_EL1);
-	info->reg_id_dfr1 = read_cpuid(ID_DFR1_EL1);
-	info->reg_id_isar0 = read_cpuid(ID_ISAR0_EL1);
-	info->reg_id_isar1 = read_cpuid(ID_ISAR1_EL1);
-	info->reg_id_isar2 = read_cpuid(ID_ISAR2_EL1);
-	info->reg_id_isar3 = read_cpuid(ID_ISAR3_EL1);
-	info->reg_id_isar4 = read_cpuid(ID_ISAR4_EL1);
-	info->reg_id_isar5 = read_cpuid(ID_ISAR5_EL1);
-	info->reg_id_isar6 = read_cpuid(ID_ISAR6_EL1);
-	info->reg_id_mmfr0 = read_cpuid(ID_MMFR0_EL1);
-	info->reg_id_mmfr1 = read_cpuid(ID_MMFR1_EL1);
-	info->reg_id_mmfr2 = read_cpuid(ID_MMFR2_EL1);
-	info->reg_id_mmfr3 = read_cpuid(ID_MMFR3_EL1);
-	info->reg_id_mmfr4 = read_cpuid(ID_MMFR4_EL1);
-	info->reg_id_mmfr5 = read_cpuid(ID_MMFR5_EL1);
-	info->reg_id_pfr0 = read_cpuid(ID_PFR0_EL1);
-	info->reg_id_pfr1 = read_cpuid(ID_PFR1_EL1);
-	info->reg_id_pfr2 = read_cpuid(ID_PFR2_EL1);
+	info->reg_id_dfr0 = read_cpuid_with_overrides(ID_DFR0_EL1);
+	info->reg_id_dfr1 = read_cpuid_with_overrides(ID_DFR1_EL1);
+	info->reg_id_isar0 = read_cpuid_with_overrides(ID_ISAR0_EL1);
+	info->reg_id_isar1 = read_cpuid_with_overrides(ID_ISAR1_EL1);
+	info->reg_id_isar2 = read_cpuid_with_overrides(ID_ISAR2_EL1);
+	info->reg_id_isar3 = read_cpuid_with_overrides(ID_ISAR3_EL1);
+	info->reg_id_isar4 = read_cpuid_with_overrides(ID_ISAR4_EL1);
+	info->reg_id_isar5 = read_cpuid_with_overrides(ID_ISAR5_EL1);
+	info->reg_id_isar6 = read_cpuid_with_overrides(ID_ISAR6_EL1);
+	info->reg_id_mmfr0 = read_cpuid_with_overrides(ID_MMFR0_EL1);
+	info->reg_id_mmfr1 = read_cpuid_with_overrides(ID_MMFR1_EL1);
+	info->reg_id_mmfr2 = read_cpuid_with_overrides(ID_MMFR2_EL1);
+	info->reg_id_mmfr3 = read_cpuid_with_overrides(ID_MMFR3_EL1);
+	info->reg_id_mmfr4 = read_cpuid_with_overrides(ID_MMFR4_EL1);
+	info->reg_id_mmfr5 = read_cpuid_with_overrides(ID_MMFR5_EL1);
+	info->reg_id_pfr0 = read_cpuid_with_overrides(ID_PFR0_EL1);
+	info->reg_id_pfr1 = read_cpuid_with_overrides(ID_PFR1_EL1);
+	info->reg_id_pfr2 = read_cpuid_with_overrides(ID_PFR2_EL1);
 
-	info->reg_mvfr0 = read_cpuid(MVFR0_EL1);
-	info->reg_mvfr1 = read_cpuid(MVFR1_EL1);
-	info->reg_mvfr2 = read_cpuid(MVFR2_EL1);
+	info->reg_mvfr0 = read_cpuid_with_overrides(MVFR0_EL1);
+	info->reg_mvfr1 = read_cpuid_with_overrides(MVFR1_EL1);
+	info->reg_mvfr2 = read_cpuid_with_overrides(MVFR2_EL1);
 }
 
 static void __cpuinfo_store_cpu(struct cpuinfo_arm64 *info)
 {
-	info->reg_cntfrq = arch_timer_get_cntfrq();
+	info->reg_cntfrq = arm64_ftr_reg_override(SYS_CNTFRQ_EL0, arch_timer_get_cntfrq());
 	/*
 	 * Use the effective value of the CTR_EL0 than the raw value
 	 * exposed by the CPU. CTR_EL0.IDC field value must be interpreted
@@ -478,35 +478,35 @@ static void __cpuinfo_store_cpu(struct cpuinfo_arm64 *info)
 	 * effective value of the CTR_EL0 in our internal records for
 	 * accurate sanity check and feature enablement.
 	 */
-	info->reg_ctr = read_cpuid_effective_cachetype();
-	info->reg_dczid = read_cpuid(DCZID_EL0);
+	info->reg_ctr = arm64_ftr_reg_override(SYS_CTR_EL0, read_cpuid_effective_cachetype());
+	info->reg_dczid = read_cpuid_with_overrides(DCZID_EL0);
 	info->reg_midr = read_cpuid_id();
 	info->reg_revidr = read_cpuid(REVIDR_EL1);
 	info->reg_aidr = read_cpuid(AIDR_EL1);
 
-	info->reg_id_aa64dfr0 = read_cpuid(ID_AA64DFR0_EL1);
-	info->reg_id_aa64dfr1 = read_cpuid(ID_AA64DFR1_EL1);
-	info->reg_id_aa64isar0 = read_cpuid(ID_AA64ISAR0_EL1);
-	info->reg_id_aa64isar1 = read_cpuid(ID_AA64ISAR1_EL1);
-	info->reg_id_aa64isar2 = read_cpuid(ID_AA64ISAR2_EL1);
-	info->reg_id_aa64isar3 = read_cpuid(ID_AA64ISAR3_EL1);
-	info->reg_id_aa64mmfr0 = read_cpuid(ID_AA64MMFR0_EL1);
-	info->reg_id_aa64mmfr1 = read_cpuid(ID_AA64MMFR1_EL1);
-	info->reg_id_aa64mmfr2 = read_cpuid(ID_AA64MMFR2_EL1);
-	info->reg_id_aa64mmfr3 = read_cpuid(ID_AA64MMFR3_EL1);
-	info->reg_id_aa64mmfr4 = read_cpuid(ID_AA64MMFR4_EL1);
+	info->reg_id_aa64dfr0 = read_cpuid_with_overrides(ID_AA64DFR0_EL1);
+	info->reg_id_aa64dfr1 = read_cpuid_with_overrides(ID_AA64DFR1_EL1);
+	info->reg_id_aa64isar0 = read_cpuid_with_overrides(ID_AA64ISAR0_EL1);
+	info->reg_id_aa64isar1 = read_cpuid_with_overrides(ID_AA64ISAR1_EL1);
+	info->reg_id_aa64isar2 = read_cpuid_with_overrides(ID_AA64ISAR2_EL1);
+	info->reg_id_aa64isar3 = read_cpuid_with_overrides(ID_AA64ISAR3_EL1);
+	info->reg_id_aa64mmfr0 = read_cpuid_with_overrides(ID_AA64MMFR0_EL1);
+	info->reg_id_aa64mmfr1 = read_cpuid_with_overrides(ID_AA64MMFR1_EL1);
+	info->reg_id_aa64mmfr2 = read_cpuid_with_overrides(ID_AA64MMFR2_EL1);
+	info->reg_id_aa64mmfr3 = read_cpuid_with_overrides(ID_AA64MMFR3_EL1);
+	info->reg_id_aa64mmfr4 = read_cpuid_with_overrides(ID_AA64MMFR4_EL1);
 	info->reg_id_aa64pfr0 = read_cpuid_with_overrides(ID_AA64PFR0_EL1);
 	info->reg_id_aa64pfr1 = read_cpuid_with_overrides(ID_AA64PFR1_EL1);
-	info->reg_id_aa64pfr2 = read_cpuid(ID_AA64PFR2_EL1);
-	info->reg_id_aa64zfr0 = read_cpuid(ID_AA64ZFR0_EL1);
-	info->reg_id_aa64smfr0 = read_cpuid(ID_AA64SMFR0_EL1);
-	info->reg_id_aa64fpfr0 = read_cpuid(ID_AA64FPFR0_EL1);
+	info->reg_id_aa64pfr2 = read_cpuid_with_overrides(ID_AA64PFR2_EL1);
+	info->reg_id_aa64zfr0 = read_cpuid_with_overrides(ID_AA64ZFR0_EL1);
+	info->reg_id_aa64smfr0 = read_cpuid_with_overrides(ID_AA64SMFR0_EL1);
+	info->reg_id_aa64fpfr0 = read_cpuid_with_overrides(ID_AA64FPFR0_EL1);
 
 	if (IS_ENABLED(CONFIG_ARM64_MTE) && id_aa64pfr1_mte(info->reg_id_aa64pfr1))
-		info->reg_gmid = read_cpuid(GMID_EL1);
+		info->reg_gmid = read_cpuid_with_overrides(GMID_EL1);
 
 	if (id_aa64pfr0_mpam(info->reg_id_aa64pfr0) || id_aa64pfr1_mpamfrac(info->reg_id_aa64pfr1))
-		info->reg_mpamidr = read_cpuid(MPAMIDR_EL1);
+		info->reg_mpamidr = read_cpuid_with_overrides(MPAMIDR_EL1);
 
 	if (id_aa64pfr0_32bit_el0(info->reg_id_aa64pfr0))
 		__cpuinfo_store_cpu_32bit(&info->aarch32);
-- 
2.56.0.385.gd3acb90ef8-goog

