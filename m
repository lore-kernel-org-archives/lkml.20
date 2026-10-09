Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A3D30BB80
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540491; cv=none; b=P0XdkoMbPhUkogn6r7kPGLX67RQgW15GDLCSsf4r7jqAYqKHFnwtjZnRSrPDUKCQzOcFUUPyxWWarANu7IMgOD1S08fY9d3sjUCsYBrUGuDIUj1gC9VaZjXN+sACvclJjqJnXSLRhzvCzsALJ23dbAPJmQ9xnTRZcS1wkYFpzX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540491; c=relaxed/simple;
	bh=o5QHD1fTn/r0X8+KilbnQ9Mc1bK/xfpxcIJRDtmERIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s4cZz8FgWS1vA9hPBP54B8T1hrmKG43lb67b6xbRsBJ18SIsH1MINqB3I0ABVRxj16XN5zunwUKuNcdCXWSaezpvSV/J79DVOXlFwO36MFRfDsWsacroSD9WB0h0WhXItxNf4jKgNT+e1pPN+WfPvKQiPitwIea2reW9Zo1/g6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OJjM8YYT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OJjM8YYT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B64DE1F000FF;
	Fri,  9 Oct 2026 10:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540490;
	bh=9aiQS54snPXf3I+B0TRzhUd8u5IPUgONlHz2qHueAw8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OJjM8YYTn0+rtY0Mu/NhE49uRXZd6LTCKlF60Rmy3sLY/PEdK6curkl+xuh9ITx2E
	 Wm857ZPHuY+2ywd823NhcRIgjW3EqKj2HPqZfSYquaZzPiBsyUtfi41yCB2QSOJRe/
	 ZVm0NETXwBr50m3yGehs6bRGDqgSfIZ+BZ9WdrRsgtcnKxzZE9A2QtwSm2vauSQZyz
	 S212dYKwnLfGhohB01Cgth4meXqQ6i15l53trPflIvNQKw9xu0pj/wavRj65H9VYyB
	 SYlWgpz0Q7bnquvl8k5hCEZn5BME4p7VkuA+ak4qDIbO/dVgTrQKtALGqd57NRVSzH
	 IAgcS6aHAeD2g==
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
	Marc Zyngier <maz@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v2 06/23] arm64: cpufeature: Add read_cpuid_with_overrides()
Date: Fri,  9 Oct 2026 11:07:17 +0100
Message-ID: <20261009100738.31288-7-will@kernel.org>
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

__cpuinfo_store_cpu() stores the ID registers raw. Its gates on reading
a feature's register test those raw values. The exception is
gmid_el1_accessible(), which open-codes MTE's command-line override. It
checks the override with arm64_ftr_safe_value(), since
init_cpu_features() hasn't yet removed an unsafe one. The other gates
still read a feature's register when the command line disabled it. That's
the read that trapped on GMID_EL1.

Add read_cpuid_with_overrides(), which applies every valid override to
any register in arm64_ftr_regs[]. An override is valid when
arm64_ftr_safe_value() returns it unchanged. validate_ftr_regs() has
checked the table by the first store, so the lookup is safe there.
arm64_apply_feature_override() can't do this: it takes one field and no
descriptor to check the override against.

Store ID_AA64PFR1_EL1 through it, and replace gmid_el1_accessible()
with a test on the stored value at its three callers, as for SME.

Other readers of the stored value see the override too. With
arm64.nosme, __cpuinfo_store_cpu() no longer reads SMIDR_EL1. CPUs that
differ only in an ID_AA64PFR1_EL1 field the command line turned off no
longer taint the kernel. init_cpu_ftr_reg() logs a valid override as
"already set" rather than "forced".

The helper is Suzuki's override_cpu_ftr_reg(), without its other two
call sites.

Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Suggested-by: Will Deacon <will@kernel.org>
Link: https://lore.kernel.org/all/afc5bd00-28ca-413b-b047-ee53589c285d@arm.com/
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/cpu.h        |  1 -
 arch/arm64/include/asm/cpufeature.h | 11 ++++++
 arch/arm64/kernel/cpufeature.c      | 57 ++++++++++++++---------------
 arch/arm64/kernel/cpuinfo.c         |  4 +-
 4 files changed, 41 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/include/asm/cpu.h b/arch/arm64/include/asm/cpu.h
index f332fbd8e46d..6d2a5ac4c2f8 100644
--- a/arch/arm64/include/asm/cpu.h
+++ b/arch/arm64/include/asm/cpu.h
@@ -79,6 +79,5 @@ void __init validate_ftr_regs(void);
 void __init init_cpu_features(struct cpuinfo_arm64 *info);
 void update_cpu_features(int cpu, struct cpuinfo_arm64 *info,
 				 struct cpuinfo_arm64 *boot);
-bool gmid_el1_accessible(const struct cpuinfo_arm64 *info);
 
 #endif /* __ASM_CPU_H */
diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index 4f04ad82ea34..5a4d25325856 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -627,6 +627,13 @@ static inline bool id_aa64pfr1_mpamfrac(u64 pfr1)
 	return val > 0;
 }
 
+static inline bool id_aa64pfr1_mte(u64 pfr1)
+{
+	u32 val = cpuid_feature_extract_unsigned_field(pfr1, ID_AA64PFR1_EL1_MTE_SHIFT);
+
+	return val >= ID_AA64PFR1_EL1_MTE_MTE2;
+}
+
 void __init setup_boot_cpu_features(void);
 void __init setup_system_features(void);
 void __init setup_user_features(void);
@@ -957,6 +964,10 @@ static inline unsigned int get_vmid_bits(u64 mmfr1)
 
 s64 arm64_ftr_safe_value(const struct arm64_ftr_bits *ftrp, s64 new, s64 cur);
 struct arm64_ftr_reg *get_arm64_ftr_reg(u32 sys_id);
+u64 arm64_ftr_reg_override(u32 sys_id, u64 val);
+
+/* Read this CPU's ID register with each valid command-line override applied. */
+#define read_cpuid_with_overrides(reg)	arm64_ftr_reg_override(SYS_##reg, read_cpuid(reg))
 
 extern struct arm64_ftr_override id_aa64mmfr0_override;
 extern struct arm64_ftr_override id_aa64mmfr1_override;
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 727e1665c987..3161531ad401 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -962,6 +962,32 @@ s64 arm64_ftr_safe_value(const struct arm64_ftr_bits *ftrp, s64 new,
 	return ret;
 }
 
+u64 arm64_ftr_reg_override(u32 sys_id, u64 val)
+{
+	struct arm64_ftr_reg *reg = get_arm64_ftr_reg(sys_id);
+	const struct arm64_ftr_bits *ftrp;
+
+	if (!reg || !reg->override->mask)
+		return val;
+
+	for (ftrp = reg->ftr_bits; ftrp->width; ftrp++) {
+		u64 ftr_mask = arm64_ftr_mask(ftrp);
+		s64 ftr_new, ftr_ovr;
+
+		if ((ftr_mask & reg->override->mask) != ftr_mask)
+			continue;
+
+		ftr_new = arm64_ftr_value(ftrp, val);
+		ftr_ovr = arm64_ftr_value(ftrp, reg->override->val);
+
+		/* An unsafe override is left for init_cpu_ftr_reg() to remove. */
+		if (arm64_ftr_safe_value(ftrp, ftr_ovr, ftr_new) == ftr_ovr)
+			val = arm64_ftr_set_value(ftrp, val, ftr_ovr);
+	}
+
+	return val;
+}
+
 void __init validate_ftr_regs(void)
 {
 	unsigned int i;
@@ -1178,33 +1204,6 @@ static bool detect_ftr_has_mpam(void)
 	return id_aa64pfr0_mpam(pfr0) || id_aa64pfr1_mpamfrac(pfr1);
 }
 
-bool gmid_el1_accessible(const struct cpuinfo_arm64 *info)
-{
-	const struct arm64_ftr_bits *ftrp;
-	s64 mte, ovr;
-	u64 ftr_mask;
-
-	/* No ID register reflects CONFIG_ARM64_MTE. */
-	if (!IS_ENABLED(CONFIG_ARM64_MTE))
-		return false;
-
-	for (ftrp = ftr_id_aa64pfr1; ftrp->width; ftrp++) {
-		if (ftrp->shift == ID_AA64PFR1_EL1_MTE_SHIFT)
-			break;
-	}
-
-	ftr_mask = arm64_ftr_mask(ftrp);
-	mte = arm64_ftr_value(ftrp, info->reg_id_aa64pfr1);
-
-	/* The boot CPU runs before init_cpu_ftr_reg() strips unsafe overrides. */
-	if ((id_aa64pfr1_override.mask & ftr_mask) == ftr_mask) {
-		ovr = arm64_ftr_value(ftrp, id_aa64pfr1_override.val);
-		mte = arm64_ftr_safe_value(ftrp, ovr, mte);
-	}
-
-	return mte >= ID_AA64PFR1_EL1_MTE_MTE2;
-}
-
 void __init init_cpu_features(struct cpuinfo_arm64 *info)
 {
 	init_cpu_ftr_reg(SYS_CTR_EL0, info->reg_ctr);
@@ -1254,7 +1253,7 @@ void __init init_cpu_features(struct cpuinfo_arm64 *info)
 		init_cpu_ftr_reg(SYS_MPAMIDR_EL1, info->reg_mpamidr);
 	}
 
-	if (gmid_el1_accessible(info))
+	if (IS_ENABLED(CONFIG_ARM64_MTE) && id_aa64pfr1_mte(info->reg_id_aa64pfr1))
 		init_cpu_ftr_reg(SYS_GMID_EL1, info->reg_gmid);
 }
 
@@ -1516,7 +1515,7 @@ void update_cpu_features(int cpu,
 	 * they read/write depends on the GMID_EL1.BS field. Check that the
 	 * value is the same on all CPUs.
 	 */
-	if (gmid_el1_accessible(info))
+	if (IS_ENABLED(CONFIG_ARM64_MTE) && id_aa64pfr1_mte(info->reg_id_aa64pfr1))
 		taint |= check_update_ftr_reg(SYS_GMID_EL1, cpu,
 					      info->reg_gmid, boot->reg_gmid);
 
diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index 45c63f3d75c5..d48167fe4218 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -496,13 +496,13 @@ static void __cpuinfo_store_cpu(struct cpuinfo_arm64 *info)
 	info->reg_id_aa64mmfr3 = read_cpuid(ID_AA64MMFR3_EL1);
 	info->reg_id_aa64mmfr4 = read_cpuid(ID_AA64MMFR4_EL1);
 	info->reg_id_aa64pfr0 = read_cpuid(ID_AA64PFR0_EL1);
-	info->reg_id_aa64pfr1 = read_cpuid(ID_AA64PFR1_EL1);
+	info->reg_id_aa64pfr1 = read_cpuid_with_overrides(ID_AA64PFR1_EL1);
 	info->reg_id_aa64pfr2 = read_cpuid(ID_AA64PFR2_EL1);
 	info->reg_id_aa64zfr0 = read_cpuid(ID_AA64ZFR0_EL1);
 	info->reg_id_aa64smfr0 = read_cpuid(ID_AA64SMFR0_EL1);
 	info->reg_id_aa64fpfr0 = read_cpuid(ID_AA64FPFR0_EL1);
 
-	if (gmid_el1_accessible(info))
+	if (IS_ENABLED(CONFIG_ARM64_MTE) && id_aa64pfr1_mte(info->reg_id_aa64pfr1))
 		info->reg_gmid = read_cpuid(GMID_EL1);
 
 	if (id_aa64pfr0_32bit_el0(info->reg_id_aa64pfr0))
-- 
2.56.0.385.gd3acb90ef8-goog

