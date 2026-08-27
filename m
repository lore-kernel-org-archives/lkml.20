Received: from mta0.migadu.com (out-88.mta0.migadu.com [91.218.175.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72CC3914F0
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787857193; cv=none; b=pIkXaBSc/japc3D3ymD7V/r7jpnhmeydRZ8Ny8b3ot8CTiypdOaZH+/ln1INpAcgoSdqwnjfgKl8id6QdkjbxtNPQAeZF0BbF2JaT9YBCikK489Za2NL+eKuUIQH8GvxzBnyQhNJuIjz424xrfbDxNludh+/8mxRFmwc3NmA6EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787857193; c=relaxed/simple;
	bh=uKyFPMySg+ZdcSjFgmGmteIutliy7r49MnJ4aFTwets=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PixC/w6M7BDkpnWBBAsNRgUlp2Ngr9KXmuAIqCiolhH5HbvvRj/bMpXzcIZ46rU7AyTJf0uUYhv8bTC+CHK3z0c7qfk8zzA1tw5NPal+wRHPhlOGBbUhps9Q8RjpkQcGVYLLp5kJFqlaxYjmg+mTYrE+qjOnYvxEZcGt2VKhLis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lL7+11+0; arc=none smtp.client-ip=91.218.175.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lL7+11+0"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=uKyFPMySg+ZdcSjFgmGmteIutliy7r49MnJ4aFTwets=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787857187; v=1; x=1788461987;
 b=lL7+11+0a2Un64Yzv2/4QoUirmZXacYdwmh2Qa6RY4dzevcdWx4NGxQwbk13rZB3oIWjqN/4
 +Vy8T+4FHqYXiuFZIuFDg3EEs3Ww3e1C2+FzVdK4OJ8HD9QHEkJXvlumgPk2xpfCA8XD+3lxToh
 F6msYL5mX6A727KiS14Ll/3o=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f547417c01070e20;
	Thu, 27 Aug 2026 18:59:37 +0000
X-Mizu-Trace-ID: f547417c01070e20
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Brown <broonie@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v5] arm64: Don't read GMID_EL1 when MTE is disabled
Date: Thu, 27 Aug 2026 19:59:37 +0100
Message-Id: <20260827185937.1369099-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__cpuinfo_store_cpu() gates the GMID_EL1 read on the raw
ID_AA64PFR1_EL1, so it reads the register even when the kernel has
disabled MTE (CONFIG_ARM64_MTE=n or arm64.nomte). KVM sets HCR_EL2.TID5
in that case, and pKVM injects an UNDEF the host cannot handle:

  Internal error: Oops - Undefined instruction: 0000000002000000 [#1]  SMP
  pc : __cpuinfo_store_cpu+0xf4/0x264
  Kernel panic - not syncing: Attempted to kill the idle task!

Only pKVM reaches it, and only after a CPU is offlined and brought back
online: its CPU_ON relay sets the host HCR before the CPU enters EL1,
while plain nVHE sets it at CPUHP_AP_KVM_ONLINE.

Gate the read on the CPU's own ID_AA64PFR1_EL1 with the command-line
override applied, and on CONFIG_ARM64_MTE, which no register reflects.
The boot CPU stores its registers before init_cpu_features() strips an
unsafe override, so clamp against the hardware value here too.

Fixes: f35abcbb8a084 ("KVM: arm64: Trap MTE access and discovery when MTE is disabled")
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---

Notes:
    Changes since v4:
    - Gate on the ID_AA64PFR1_EL1 that __cpuinfo_store_cpu() has already
      read, clamping the override against it in cpufeature.c, rather than
      adding a __read_sysreg_by_encoding() caller in the header (Will). The
      register is not read a second time.
    - Dropped Suzuki's override clamp, which this no longer needs. It is
      worth having on its own, so I'll post it separately with the Fixes:
      tag and without the update_cpu_ftr_reg() hunk (Catalin).
    
    Tested on QEMU under pKVM, with -machine virt,mte=on.
    
    Offline/online CPU1 with arm64.nomte: unpatched panics in
    __cpuinfo_store_cpu(), patched does not. Same with CONFIG_ARM64_MTE=n
    and no override on the command line. And with id_aa64pfr1.mte=2 on a
    CPU without FEAT_MTE2, where the clamp keeps the gate false and
    init_cpu_ftr_reg() drops the override afterwards.

 arch/arm64/include/asm/cpu.h        |  1 +
 arch/arm64/include/asm/cpufeature.h |  7 ------
 arch/arm64/kernel/cpufeature.c      | 33 +++++++++++++++++++++++++----
 arch/arm64/kernel/cpuinfo.c         |  2 +-
 4 files changed, 31 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/cpu.h b/arch/arm64/include/asm/cpu.h
index 71493b760b839..3c008821219c2 100644
--- a/arch/arm64/include/asm/cpu.h
+++ b/arch/arm64/include/asm/cpu.h
@@ -78,5 +78,6 @@ void __init cpuinfo_store_boot_cpu(void);
 void __init init_cpu_features(struct cpuinfo_arm64 *info);
 void update_cpu_features(int cpu, struct cpuinfo_arm64 *info,
 				 struct cpuinfo_arm64 *boot);
+bool gmid_el1_accessible(const struct cpuinfo_arm64 *info);
 
 #endif /* __ASM_CPU_H */
diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index a57870fa96db5..f6a7200700ccf 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -627,13 +627,6 @@ static inline bool id_aa64pfr1_mpamfrac(u64 pfr1)
 	return val > 0;
 }
 
-static inline bool id_aa64pfr1_mte(u64 pfr1)
-{
-	u32 val = cpuid_feature_extract_unsigned_field(pfr1, ID_AA64PFR1_EL1_MTE_SHIFT);
-
-	return val >= ID_AA64PFR1_EL1_MTE_MTE2;
-}
-
 void __init setup_boot_cpu_features(void);
 void __init setup_system_features(void);
 void __init setup_user_features(void);
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 9a22df0c5120f..103e70d683ca2 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1176,6 +1176,33 @@ static bool detect_ftr_has_mpam(void)
 	return id_aa64pfr0_mpam(pfr0) || id_aa64pfr1_mpamfrac(pfr1);
 }
 
+bool gmid_el1_accessible(const struct cpuinfo_arm64 *info)
+{
+	const struct arm64_ftr_bits *ftrp;
+	s64 mte, ovr;
+	u64 ftr_mask;
+
+	/* No ID register reflects CONFIG_ARM64_MTE. */
+	if (!IS_ENABLED(CONFIG_ARM64_MTE))
+		return false;
+
+	for (ftrp = ftr_id_aa64pfr1; ftrp->width; ftrp++) {
+		if (ftrp->shift == ID_AA64PFR1_EL1_MTE_SHIFT)
+			break;
+	}
+
+	ftr_mask = arm64_ftr_mask(ftrp);
+	mte = arm64_ftr_value(ftrp, info->reg_id_aa64pfr1);
+
+	/* The boot CPU runs before init_cpu_ftr_reg() strips unsafe overrides. */
+	if ((id_aa64pfr1_override.mask & ftr_mask) == ftr_mask) {
+		ovr = arm64_ftr_value(ftrp, id_aa64pfr1_override.val);
+		mte = arm64_ftr_safe_value(ftrp, ovr, mte);
+	}
+
+	return mte >= ID_AA64PFR1_EL1_MTE_MTE2;
+}
+
 void __init init_cpu_features(struct cpuinfo_arm64 *info)
 {
 	/* Before we start using the tables, make sure it is sorted */
@@ -1228,7 +1255,7 @@ void __init init_cpu_features(struct cpuinfo_arm64 *info)
 		init_cpu_ftr_reg(SYS_MPAMIDR_EL1, info->reg_mpamidr);
 	}
 
-	if (id_aa64pfr1_mte(info->reg_id_aa64pfr1))
+	if (gmid_el1_accessible(info))
 		init_cpu_ftr_reg(SYS_GMID_EL1, info->reg_gmid);
 }
 
@@ -1490,11 +1517,9 @@ void update_cpu_features(int cpu,
 	 * they read/write depends on the GMID_EL1.BS field. Check that the
 	 * value is the same on all CPUs.
 	 */
-	if (IS_ENABLED(CONFIG_ARM64_MTE) &&
-	    id_aa64pfr1_mte(info->reg_id_aa64pfr1)) {
+	if (gmid_el1_accessible(info))
 		taint |= check_update_ftr_reg(SYS_GMID_EL1, cpu,
 					      info->reg_gmid, boot->reg_gmid);
-	}
 
 	/*
 	 * If we don't have AArch32 at all then skip the checks entirely
diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index d50e2a9b066b3..45c63f3d75c53 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -502,7 +502,7 @@ static void __cpuinfo_store_cpu(struct cpuinfo_arm64 *info)
 	info->reg_id_aa64smfr0 = read_cpuid(ID_AA64SMFR0_EL1);
 	info->reg_id_aa64fpfr0 = read_cpuid(ID_AA64FPFR0_EL1);
 
-	if (id_aa64pfr1_mte(info->reg_id_aa64pfr1))
+	if (gmid_el1_accessible(info))
 		info->reg_gmid = read_cpuid(GMID_EL1);
 
 	if (id_aa64pfr0_32bit_el0(info->reg_id_aa64pfr0))
-- 
2.39.5

