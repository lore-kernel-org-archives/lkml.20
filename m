Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE0C52B1D3
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689290; cv=none; b=L3ApGfPMvcQ+G44NyJMJgdDA/Vh5Gq+cZ7gyoGeWE+UXDRYYkW9n8rvWUjsCiUMO6ornlf/a8iIOordEfIYGSnaAaSLm6Gbw3SVb815H6NNJpWlavNuOOropqwVkq1CxtibCYRVved//fxoxjZABTyJzQ9OYw/wEc0uQi8VUxtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689290; c=relaxed/simple;
	bh=8OuCG/fl2EYuiKnuarntipcfkB/aqIWXIhmS9rQ5/Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DMpVkshUpmQjdu9aErJ5VYNXlZJwLLjW5cRA9+5oYtQDKaRgIQihmx51fTclQ1Rasdpwsb//19kTzBvXw1poYubyHKahhol/2/Le5FnrqYhC5ccazjxzdnhmsK2K7aGrXCJikRh7sm1SIWvlWZTiu7pw6ETLn+Gdbxos/6TSxjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=CIjSgt/N; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="CIjSgt/N"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 818241476;
	Tue, 29 Sep 2026 06:41:24 -0700 (PDT)
Received: from e143943.arm.com (unknown [10.57.78.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D0B2C3F85F;
	Tue, 29 Sep 2026 06:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790689288; bh=8OuCG/fl2EYuiKnuarntipcfkB/aqIWXIhmS9rQ5/Dk=;
	h=From:To:Cc:Subject:Date:From;
	b=CIjSgt/NEuiTjwVz+wTF2qCVYipZPNRI6e7m9YeKahionIxixbkSD5re8+n8STTYJ
	 nw4z545BeRBdTcZCqx+QM1aj9uyYB86ZiFk1G7rEnaFx+yMPha8LCcECmsjKg8CuHH
	 dbKVaGXXVZTmxsoWWG95T11v2+4uKKa9l41YiMj8=
From: Beata Michalska <beata.michalska@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	suzuki.poulose@arm.com,
	James.Morse@arm.com,
	xuewen.yan94@gmail.com,
	seanwang1@lenovo.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: errata: Add Cortex-A725 erratum 3821522 workaround
Date: Tue, 29 Sep 2026 15:40:36 +0200
Message-ID: <20260929134055.3241587-1-beata.michalska@arm.com>
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

This also folds the per-erratum workarounds for ARM errata 2457168 and
3821522 into a single AMU constant-counter capability, as both require
treating AMEVCNTR01 as unreliable and unavailable.

CC: <stable@vger.kernel.org>
Signed-off-by: Beata Michalska <beata.michalska@arm.com>
---
 Documentation/arch/arm64/silicon-errata.rst |  2 ++
 arch/arm64/Kconfig                          | 30 +++++++++++++++++++++
 arch/arm64/include/asm/cpucaps.h            |  3 ++-
 arch/arm64/kernel/cpu_errata.c              | 29 +++++++++++++++-----
 arch/arm64/kernel/cpufeature.c              |  2 +-
 arch/arm64/kernel/topology.c                | 16 ++++++-----
 arch/arm64/tools/cpucaps                    |  2 +-
 7 files changed, 68 insertions(+), 16 deletions(-)

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
index b5a51b0ef9440..cab741a695f52 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1040,9 +1040,17 @@ config ARM64_ERRATUM_1902691
 
 	  If unsure, say Y.
 
+config ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
+	bool
+	# Targeting errata affecting AMEVCNTR01, the AMU constant counter.
+	# On affected CPUs the counter may not increment at the expected rate,
+	# making it unreliable. As a result, AMU users should treat it as
+	# unavailable rather than relying on misleading counter values.
+
 config ARM64_ERRATUM_2457168
 	bool "Cortex-A510: 2457168: workaround for AMEVCNTR01 incrementing incorrectly"
 	depends on ARM64_AMU_EXTN
+	select ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
 	default y
 	help
 	  This option adds the workaround for ARM Cortex-A510 erratum 2457168.
@@ -1073,6 +1081,28 @@ config ARM64_ERRATUM_2645198
 
 	  If unsure, say Y.
 
+config ARM64_ERRATUM_3821522
+	bool "Cortex-A725: 3821522: workaround for possible CNT_CYCLES increment error due to WFE/WFI"
+	depends on ARM64_AMU_EXTN
+	select ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
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
 
diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
index 76350b38f0d7a..120c5dc3c11d7 100644
--- a/arch/arm64/include/asm/cpucaps.h
+++ b/arch/arm64/include/asm/cpucaps.h
@@ -75,8 +75,9 @@ cpucap_is_possible(const unsigned int cap)
 		return IS_ENABLED(CONFIG_HW_PERF_EVENTS);
 	case ARM64_HAS_LSUI:
 		return IS_ENABLED(CONFIG_ARM64_LSUI);
+	case ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT:
+		return IS_ENABLED(CONFIG_ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT);
 	}
-
 	return true;
 }
 #endif /* __ASSEMBLER__ */
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 5db8f0619e4bc..42a6fff8c3f44 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -381,6 +381,24 @@ static const struct arm64_cpu_capabilities arm64_repeat_tlbi_list[] = {
 };
 #endif
 
+#ifdef CONFIG_ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
+static const struct arm64_cpu_capabilities arm64_repeat_amu_constcnt_list[] = {
+#ifdef CONFIG_ARM64_ERRATUM_2457168
+	{
+		/* Cortex-A510 r0p0-r1p1 */
+		CAP_MIDR_RANGE(MIDR_CORTEX_A510, 0, 0, 1, 1)
+	},
+#endif
+#ifdef CONFIG_ARM64_ERRATUM_3821522
+	{
+		/* Cortex-A725 r0p0 - r0p2 */
+		CAP_MIDR_RANGE(MIDR_CORTEX_A725, 0, 0, 0, 2)
+	},
+#endif
+	{}
+};
+#endif /* CONFIG_ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT */
+
 #ifdef CONFIG_CAVIUM_ERRATUM_23154
 static const struct midr_range cavium_erratum_23154_cpus[] = {
 	MIDR_ALL_VERSIONS(MIDR_THUNDERX),
@@ -916,14 +934,13 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
 		ERRATA_MIDR_REV_RANGE(MIDR_CORTEX_A510, 0, 0, 2)
 	},
 #endif
-#ifdef CONFIG_ARM64_ERRATUM_2457168
+#ifdef CONFIG_ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
 	{
-		.desc = "ARM erratum 2457168",
-		.capability = ARM64_WORKAROUND_2457168,
+		.desc = "Broken AMU AMEVCNTR01 (const counter)",
+		.capability = ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT,
 		.type = ARM64_CPUCAP_WEAK_LOCAL_CPU_FEATURE,
-
-		/* Cortex-A510 r0p0-r1p1 */
-		CAP_MIDR_RANGE(MIDR_CORTEX_A510, 0, 0, 1, 1)
+		.matches = cpucap_multi_entry_cap_matches,
+		.match_list = arm64_repeat_amu_constcnt_list
 	},
 #endif
 #ifdef CONFIG_ARM64_ERRATUM_2038923
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 17b83a2518a8f..1569f84214763 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2064,7 +2064,7 @@ static void cpu_amu_enable(struct arm64_cpu_capabilities const *cap)
 		cpumask_set_cpu(smp_processor_id(), &amu_cpus);
 
 		/* 0 reference values signal broken/disabled counters */
-		if (!this_cpu_has_cap(ARM64_WORKAROUND_2457168))
+		if (!this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT))
 			update_freq_counters_refs();
 	}
 }
diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index d28438f8b83f1..fc5d3abd12905 100644
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
+	*(u64 *)val = this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT) ?
 		      0UL : read_constcnt();
 }
 
@@ -463,8 +464,9 @@ static void amu_read_core_const_ctrs(void *val)
 
 	/*
 	 * cpu_read_constcnt() incurs slight latency due to the
-	 * ARM64_WORKAROUND_2457168 check. Read it first to minimize
-	 * the sampling skew between the const and core counters.
+	 * ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT check.
+	 * Read it first to minimize the sampling skew between the const
+	 * and core counters.
 	 */
 	cpu_read_constcnt(&ctrs->constcnt);
 	cpu_read_corecnt(&ctrs->corecnt);
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 2775ba3359cfe..58b6c084f9f25 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -105,7 +105,6 @@ WORKAROUND_1902691
 WORKAROUND_2038923
 WORKAROUND_2064142
 WORKAROUND_2077057
-WORKAROUND_2457168
 WORKAROUND_2645198
 WORKAROUND_2658417
 WORKAROUND_4193714
@@ -132,3 +131,4 @@ WORKAROUND_REPEAT_TLBI_SYNC
 WORKAROUND_SPECULATIVE_AT
 WORKAROUND_SPECULATIVE_SSBS
 WORKAROUND_SPECULATIVE_UNPRIV_LOAD
+WORKAROUND_BROKEN_AMU_CONSTCNT
-- 
2.43.0

