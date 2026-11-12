Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794510753;
	b=LpXPhskF8YgfnuuqkwgbrKRpQjGeQJRAwswOZ4BdaaeznYUuliExj0gpzaUwf5iZQ+ye
	 jSU5apIp40sgZt/6rp3Z5LCqP3j8zx6bCnno4tew9iDicRSLesW4pG3SHGfBJ2H6OabR7
	 zP1mG6yCsvb6A8o59BDl+1Ft5XGzalHJq/iloS7EFHHcbWpBajQf36RJP98pAc7Yvk1l3
	 1jMWb8AQI94q8ooIDoYMJNbLNX/jmWxAa38Q53XRZZFFaQfssrIxS6fuzc+nVJWJ1HMZy
	 NLZJKLNkPQLSUCsI2ivKYzRiuBJ2pJ4tLm9ZghTmLHseBI/exOMGucWPZk3PmI9GAdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794510753;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=C2odGeLZEmGKKS+pPQWO+gnDXflT3SuRERn2bLK128Q=;
	b=DrpZD2+TXUnTlH2CICy1jvXpUllXphVf++FaNPpcxS9TxHvjvKAlBvCfJXpJhamT1rRx
	 8QkXINjkUFahkXz0iKqTqgmotu2myJecH7XfRzPpnQj40U5mN2ON1vmwCi/gcDQ4TpZHy
	 yqLc8EYQSOmIOgy/CgnVzW4wMHdn9Rh29qsPk8wYokKjMbf5esOr7+VKpgw5R/4/BcxWy
	 ugvtS5PsD849HKlU91kisJiJgKNNOyEVuqEUtTLfvbdZnuuyfKiM+d8YsNgyr6YTQnVMi
	 pvs0QpHonklGOs1D9NqdY7yIB4FhiqegJc1HYV7F6Dn3iH94HRO8DLWJWWNyQwl8szg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QReUpAgC;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB960606A8BF
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:12:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB960606A8BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QReUpAgC
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C4E81576;
	Thu, 12 Nov 2026 11:12:29 -0800 (PST)
Received: from e143943.arm.com (unknown [10.57.66.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 15A983F632;
	Thu, 12 Nov 2026 11:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794510752; bh=cUISQqJ6bIH9uxhCbIo672a2b5JutTHIBbB+Bd8wS1w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QReUpAgCmpiG5ELToV7wja4dmXT5kMZsEHjGLoM7euQLkO7At1FjmiEuGgysx32lB
	 fHmgnVD6iVLhYWmWqPD7jr/M0cnDvvw7qj6EhLfGissQqbB2A0j41E6kNq61QN+woA
	 gRbImwK2ZB2sfZr3xnIcUyisVU8YPesjUMAL4zY8=
From: Beata Michalska <beata.michalska@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Vladimir.Murzin@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	christian.loehle@arm.com,
	suzuki.poulose@arm.com,
	xuewen.yan94@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] arm64: errata: Add Cortex-A715/A720 AMU core counter workaround
Date: Thu, 12 Nov 2026 20:12:08 +0100
Message-ID: <20261112191211.3336725-3-beata.michalska@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112191211.3336725-1-beata.michalska@arm.com>
References: <20261112191211.3336725-1-beata.michalska@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Cortex-A715 (erratum 2738462) and Cortex-A720 (erratum 2738461),
the AMEVCNTR00 counter may continue incrementing while the core
remains in WFE with the clocks being enabled. The resulting core
cycle count may become unreliable.

Add a workaround that effectively treats the AMU counter
as unavailable.

Cc: stable@vger.kernel.org
Signed-off-by: Beata Michalska <beata.michalska@arm.com>
---
 Documentation/arch/arm64/silicon-errata.rst |  4 +++
 arch/arm64/Kconfig                          | 32 +++++++++++++++++++++
 arch/arm64/kernel/cpu_errata.c              | 20 +++++++++++++
 arch/arm64/kernel/cpufeature.c              |  3 +-
 arch/arm64/kernel/topology.c                |  3 +-
 arch/arm64/tools/cpucaps                    |  1 +
 6 files changed, 61 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index 09fe032e1aea..5801597a387c 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -171,8 +171,12 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A715     | #2645198        | ARM64_ERRATUM_2645198       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Cortex-A715     | #2738462        |  ARM64_ERRATUM_2738461      |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A715     | #3456084        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Cortex-A720     | #2738461        | ARM64_ERRATUM_2738461       |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A720     | #3456091        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A720     | #4689339        | ARM64_ERRATUM_3821522       |
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index cf50f3051edc..afc6226689be 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1051,6 +1051,38 @@ config ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
 	# making it unreliable. As a result, AMU users should treat it as
 	# unavailable rather than relying on misleading counter values.
 
+config ARM64_WORKAROUND_BROKEN_AMU_CORECNT
+	bool
+	# Targeting errata affecting AMEVCNTR00, the AMU core cycle counter.
+	# On affected CPUs the counter may continue incrementing while core
+	# remains in WFE with the clocks enabled.
+	# This may lead to readings of said counter being unreliable.
+	# How much though depends on the sampling intervals.
+
+config ARM64_ERRATUM_2738461
+	bool "Cortex-A715/Cortex-A720: workaround for AMEVCNTR00 incrementing incorrectly"
+	depends on ARM64_AMU_EXTN
+	select ARM64_WORKAROUND_BROKEN_AMU_CORECNT
+	default y
+	help
+	   This option adds the workaround for the following errata:
+
+	   * ARM Cortex-A715 erratum 2738462
+	   * ARM Cortex-A720 erratum 2738461
+
+	   On affected cores the AMEVCNTR00 counter (AMU core frequency cycles
+	   counter) may continue incrementing while the core remains in WFE
+	   with the clocks being enabled.
+	   This may result in inaccurate counter readings, with the magnitude
+	   of the discrepancy depending on the sampling interval.
+
+	   With this workaround, reads of the affected counter return 0 in
+	   the relevant paths. This causes users of the counter to treat it
+	   as unavailable and is functionally equivalent to firmware disabling
+	   the affected counter.
+
+	   If unsure, say Y.
+
 config ARM64_ERRATUM_2457168
 	bool "Cortex-A510: 2457168: workaround for AMEVCNTR01 incrementing incorrectly"
 	depends on ARM64_AMU_EXTN
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index b20da8b24be3..957917cfab70 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -436,6 +436,18 @@ static const struct midr_range workaround_amu_constcnt_list[] = {
 };
 #endif /* CONFIG_ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT */
 
+#ifdef CONFIG_ARM64_WORKAROUND_BROKEN_AMU_CORECNT
+static const struct midr_range workaround_amu_corecnt_list[] = {
+#ifdef CONFIG_ARM64_ERRATUM_2738461
+	/* Cortex-A715 r0p0 - r1p3 */
+	MIDR_RANGE(MIDR_CORTEX_A715, 0, 0, 1, 3),
+	/* Cortex-A720 r0p0 - r0p1 */
+	MIDR_RANGE(MIDR_CORTEX_A720, 0, 0, 0, 1),
+#endif
+	{}
+};
+#endif /* CONFIG_ARM64_WORKAROUND_BROKEN_AMU_CORECNT */
+
 #ifdef CONFIG_CAVIUM_ERRATUM_23154
 static const struct midr_range cavium_erratum_23154_cpus[] = {
 	MIDR_ALL_VERSIONS(MIDR_THUNDERX),
@@ -979,6 +991,14 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
 		CAP_MIDR_RANGE_LIST(workaround_amu_constcnt_list)
 	},
 #endif
+#ifdef CONFIG_ARM64_WORKAROUND_BROKEN_AMU_CORECNT
+	{
+		.desc = "Broken AMU AMEVCNTR00 (core cycle counter)",
+		.capability = ARM64_WORKAROUND_BROKEN_AMU_CORECNT,
+		.type = ARM64_CPUCAP_WEAK_LOCAL_CPU_FEATURE,
+		CAP_MIDR_RANGE_LIST(workaround_amu_corecnt_list)
+	},
+#endif
 #ifdef CONFIG_ARM64_ERRATUM_2038923
 	{
 		.desc = "ARM erratum 2038923",
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 34c5c03c0c9b..0e8a9aedb84b 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1938,7 +1938,8 @@ static void cpu_amu_enable(struct arm64_cpu_capabilities const *cap)
 		cpumask_set_cpu(smp_processor_id(), &amu_cpus);
 
 		/* 0 reference values signal broken/disabled counters */
-		if (!this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT))
+		if (!this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT)
+		    && !this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CORECNT))
 			update_freq_counters_refs();
 	}
 }
diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index 44305b997a02..30a52659f15c 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -389,7 +389,8 @@ static void cpu_read_corecnt(void *val)
 	 * counter read is properly handled as an error case by the users of the
 	 * counter.
 	 */
-	*(u64 *)val = read_corecnt();
+	*(u64 *)val = this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CORECNT) ?
+		      0UL : read_corecnt();
 }
 
 static void cpu_read_constcnt(void *val)
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 20cc185649f9..3125695122a0 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -133,3 +133,4 @@ WORKAROUND_SPECULATIVE_AT
 WORKAROUND_SPECULATIVE_SSBS
 WORKAROUND_SPECULATIVE_UNPRIV_LOAD
 WORKAROUND_BROKEN_AMU_CONSTCNT
+WORKAROUND_BROKEN_AMU_CORECNT
-- 
2.43.0

