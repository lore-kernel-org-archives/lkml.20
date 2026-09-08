Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA43C3AA1BF
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 10:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788864516; cv=none; b=HQeg4B3FssTf7BUl+dqTBzdFTaaVfuGqPA3QEInnloHlL3cy1kCH7TB6TaUDXZG+tLNLdp/rLyTAjDWwLeXyL/UA/2rvN1RtT4SmiBFSMWcc4mdXXAm9y0JODOqyqW62Po7gLSJcxPjlPpxvHB48HN+kNB4MLHXgZNh/iS/EDtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788864516; c=relaxed/simple;
	bh=BX5zn+rMHE7pGmzvmojlkJ67vDQGZlvBti/jycmjrKo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YutkKBdEAfFz+aXoeJ9WDSyLz1/MWj9tIL1mAuC2E1Lct/9MOz/KZi84TEmvNtRERhE2kJhxzaO1sT9NIVd6fM6eHJ+oWgZZAmPjUjD5MfRC9ckFeTXSlJehugtNJ5E+zjTjfAYH67cdjwNLOZgKMMRivXZAwrf8DEXWX1C+QiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=kbSDDCWA; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="kbSDDCWA"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F29751476;
	Tue,  8 Sep 2026 03:48:28 -0700 (PDT)
Received: from e143943.arm.com (unknown [10.57.5.233])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8FD423F528;
	Tue,  8 Sep 2026 03:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788864512; bh=BX5zn+rMHE7pGmzvmojlkJ67vDQGZlvBti/jycmjrKo=;
	h=From:To:Cc:Subject:Date:From;
	b=kbSDDCWA41+ZjWvKptj4jp8JU5m7JDGepXxYDy4LEAzy2CpxK0bwRXJoKZf5cuPKF
	 kFiwTLRlvYChljmo26DAEUuBmlAciofl4Bge2jkAe0ZOKC5RESczeSPGYT9b8vbr/Y
	 Sx8+ZIoR93qgcbh52d+9LiJ+9QbvcOP0luuZHQx0=
From: Beata Michalska <beata.michalska@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	suzuki.poulose@arm.com,
	James.Morse@arm.com,
	xuewen.yan94@gmail.com,
	seanwang1@lenovo.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: errata: Add Cortex-A725 erratum 3821522 workaround
Date: Tue,  8 Sep 2026 12:47:08 +0200
Message-ID: <20260908104800.3744507-1-beata.michalska@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cortex-A725 erratum 3821522 affects the CNT_CYCLES event, which can
incur a significant increment error when a CPU enters and subsequently
exits WFE or WFI, and may no longer track the system counter frequency.

The AMEVCNTR01_EL0 counter is being used as the AMU constant counter for
frequency invariance and CPPC FFH feedback counters. Treat the affected
AMU counter as unavailable by returning zero in the AMU counter paths,
matching the existing convention used when the counter is disabled or
unusable. This prevents the broken counter from being used as a reference
source.

The erratum can also affect PMUv3 users of the CNT_CYCLES event, but this
workaround intentionally does not change PMU event handling. Hiding or
rejecting the PMU event from the erratum code would change the perf-visible
PMU event interface, including raw event selection, and would need
separate PMU specific approach rather than being folded into the AMU
reference-counter workaround.

CC: <stable@vger.kernel.org>
Signed-off-by: Beata Michalska <beata.michalska@arm.com>
---
 Documentation/arch/arm64/silicon-errata.rst |  2 ++
 arch/arm64/Kconfig                          | 21 +++++++++++++++++++++
 arch/arm64/include/asm/topology.h           |  6 ++++++
 arch/arm64/kernel/cpu_errata.c              | 10 ++++++++++
 arch/arm64/kernel/cpufeature.c              |  2 +-
 arch/arm64/kernel/topology.c                | 14 ++++++++------
 arch/arm64/tools/cpucaps                    |  1 +
 7 files changed, 49 insertions(+), 7 deletions(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index ac3248b9f2f3b..99a1eb4b833dd 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -174,6 +174,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A725     | #3456106        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Cortex-A725     | #3821522        | ARM64_ERRATUM_3821522       |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X1       | #1502854        | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X1       | #3324344        | ARM64_ERRATUM_3194386       |
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b5a51b0ef9440..721173103c0d7 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1073,6 +1073,27 @@ config ARM64_ERRATUM_2645198
 
 	  If unsure, say Y.
 
+config ARM64_ERRATUM_3821522
+	bool "Cortex-A725: 3821522: workaround for possible CNT_CYCLES increment error due to WFE/WFI"
+	depends on ARM64_AMU_EXTN
+	default y
+	help
+	  This option adds the workaround for ARM Cortex-A725 erratum 3821522.
+
+	  On affected A725 cores, the CNT_CYCLES event may incur a significant
+	  increment error when entering and subsequently exiting WFx.
+	  As a result, the CNT_CYCLES may diverge from the system counter
+	  frequency at which it is expected to increment.
+	  This renders the AMU counter AMEVCNTR01, that implements CNT_CYCLES,
+	  being unreliable and unsuitable for use.
+
+	  Since there is no hardware workaround, reads of the affected CNT_CYCLES
+	  counter return 0 in the relevant paths. This causes users of the counter
+	  to treat it as unavailable and is functionally equivalent to firmware
+	  disabling the affected counter.
+
+	  If unsure, say Y.
+
 config ARM64_WORKAROUND_SPECULATIVE_UNPRIV_LOAD
 	bool
 
diff --git a/arch/arm64/include/asm/topology.h b/arch/arm64/include/asm/topology.h
index b9eaf4ad70850..93f33ee078638 100644
--- a/arch/arm64/include/asm/topology.h
+++ b/arch/arm64/include/asm/topology.h
@@ -17,6 +17,12 @@ int pcibus_to_node(struct pci_bus *bus);
 
 #include <linux/arch_topology.h>
 
+static inline bool this_cpu_has_broken_amu_constcnt(void)
+{
+	return this_cpu_has_cap(ARM64_WORKAROUND_2457168) ||
+	       this_cpu_has_cap(ARM64_WORKAROUND_3821522);
+}
+
 void update_freq_counters_refs(void);
 
 /* Replace task scheduler's default frequency-invariant accounting */
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 5db8f0619e4bc..fb4e7cb02e458 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -926,6 +926,16 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
 		CAP_MIDR_RANGE(MIDR_CORTEX_A510, 0, 0, 1, 1)
 	},
 #endif
+#ifdef CONFIG_ARM64_ERRATUM_3821522
+	{
+		.desc = "ARM erratum 3821522",
+		.capability = ARM64_WORKAROUND_3821522,
+		.type = ARM64_CPUCAP_WEAK_LOCAL_CPU_FEATURE,
+
+		/* Cortex-A725 r0p0 - r0p2 */
+		CAP_MIDR_RANGE(MIDR_CORTEX_A725, 0, 0, 0, 2)
+	},
+#endif
 #ifdef CONFIG_ARM64_ERRATUM_2038923
 	{
 		.desc = "ARM erratum 2038923",
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 17b83a2518a8f..1c0a4671cb711 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2064,7 +2064,7 @@ static void cpu_amu_enable(struct arm64_cpu_capabilities const *cap)
 		cpumask_set_cpu(smp_processor_id(), &amu_cpus);
 
 		/* 0 reference values signal broken/disabled counters */
-		if (!this_cpu_has_cap(ARM64_WORKAROUND_2457168))
+		if (!this_cpu_has_broken_amu_constcnt())
 			update_freq_counters_refs();
 	}
 }
diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index d28438f8b83f1..f288b85bf4afb 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -397,12 +397,13 @@ static void cpu_read_corecnt(void *val)
 static void cpu_read_constcnt(void *val)
 {
 	/*
-	 * Return 0 if the current CPU is affected by erratum 2457168. A value
-	 * of 0 is also returned if the current CPU does not support AMUs or if
-	 * the counter is disabled. A return value of 0 at counter read is
-	 * properly handled as an error case by the users of the counter.
+	 * Return 0 if the current CPU is affected by either erratum 2457168
+	 * or erratum 3821522. A value of 0 is also returned if the current
+	 * CPU does not support AMUs or if the counter is disabled. A return
+	 * value of 0 at counter read is properly handled as an error case
+	 * by the users of the counter.
 	 */
-	*(u64 *)val = this_cpu_has_cap(ARM64_WORKAROUND_2457168) ?
+	*(u64 *)val = this_cpu_has_broken_amu_constcnt() ?
 		      0UL : read_constcnt();
 }
 
@@ -463,7 +464,8 @@ static void amu_read_core_const_ctrs(void *val)
 
 	/*
 	 * cpu_read_constcnt() incurs slight latency due to the
-	 * ARM64_WORKAROUND_2457168 check. Read it first to minimize
+	 * ARM64_WORKAROUND_2457168/ARM64_WORKAROUND_3821522
+	 * check. Read it first to minimize
 	 * the sampling skew between the const and core counters.
 	 */
 	cpu_read_constcnt(&ctrs->constcnt);
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 2775ba3359cfe..2302a93452a09 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -108,6 +108,7 @@ WORKAROUND_2077057
 WORKAROUND_2457168
 WORKAROUND_2645198
 WORKAROUND_2658417
+WORKAROUND_3821522
 WORKAROUND_4193714
 WORKAROUND_4311569
 WORKAROUND_AMPERE_AC03_CPU_38
-- 
2.43.0

