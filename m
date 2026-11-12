Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794510750;
	b=NBp1uVwaGvVD0Kte4kpu2CnjDyBsM2UcIxukxtO1M9622pbf5mGHeoXS5s4X6oCY6sBm
	 Jg6HRr6bzeFHIABO6natNi8s9uRbhcp/bC5fG1QdVnhmxqbzh7nD59Djk5p7jJfvgmQw2
	 mGJggzl4dLCo4qiroVJyvXL2ncNWwRG28PUnNKhXHvxxTWmvWdwhRKO4UVMLQ8z/Fr7p8
	 e53vZVuy3scM2VNhbYr/84cClADqq/QigwZZDSiDppwqX55qNw8OLPa4OVgF+II2PcxKs
	 4pK1d5gtRaSozeFetHS0FkK/f3ab/uq8TIl3HAaVHnJ7RNPYSwZMlIAV+ZLGNkL9zsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794510750;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Z6NBWQwq62WMsD9xHHX53MQarN+jYNfx0zd73mIJYDY=;
	b=yqy93GScgi8nrKg3xcXtw9xMcV7fFSYZfLmtYIixhFhM6Ir4snVQp7huFXYUMPYkId2+
	 wy+HsWPuyhPKp5tpbcCwaOgm1DCUpEGc+T69JVfBdnTN86npi+73gUd1pbvD04HldRyYS
	 InWBnBKVMaGo5z7iFtd4iCWKbV9AVgQ/9J9Tn8WeeiUk0lJbioSeJ5YGVgmDVIHtZEou1
	 67O//AZ/7f778lSXkGb34sv7aZqmz+SYH7G7OBABdWIo+l1DreGecjF2UZTUC0ZB3cDtQ
	 iSRSA6MHMbORzqJ2Jmf3Q+9+TwlvNHpjxVOXfyFe4j+My/bavA49QDouPMWViK63dAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hpOVg9QM;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92AB6606A33A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92AB6606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hpOVg9QM
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC6B5153B;
	Thu, 12 Nov 2026 11:12:25 -0800 (PST)
Received: from e143943.arm.com (unknown [10.57.66.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B316D3F632;
	Thu, 12 Nov 2026 11:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794510748; bh=vIBy4XHEmMq+a7WOcp8oCZYM/Nul7OGUwR27Mh+ImGc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hpOVg9QMNjN1btcdKr2AF4u56N1/CQ1Lwid6Q6l8zpLfYTrWzM+On8doaUIE9nyNG
	 021t1JmVJjVyrk9LfemrvEX9PUg3ldK0bPa2wQ10b4QuYwNp6obMDsQ5gYXisch0uv
	 3sfbEk9FSSPQyuvyNQ6bQpqBZILbDTDW2cGUBujM=
From: Beata Michalska <beata.michalska@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Vladimir.Murzin@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	christian.loehle@arm.com,
	suzuki.poulose@arm.com,
	xuewen.yan94@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] arm64: errata: Extend the workaround for broken AMEVCNTR01 counter
Date: Thu, 12 Nov 2026 20:12:07 +0100
Message-ID: <20261112191211.3336725-2-beata.michalska@arm.com>
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

The erratum causing significant inaccuracies in the AMU CNT_CYCLES
counter due to WFI/WFE has been identified in additional
microarchitectures.
Extend the existing workaround to cover these implementations,
which are affected by the following errata:

 - ARM Cortex-A725 erratum 3821522 (SDEN-2832921)
 - ARM Cortex-A720 erratum 4689339 (SDEN-2439421)
 - ARM Cortex-A720AE erratum 4689340 (SDEN-3090091)
 - ARM Neoverse N3 erratum 4689341 (SDEN-3050973)
 - ARM C1-Pro erratum 4689344 (SDEN-3273080)

Cc: stable@vger.kernel.org
Signed-off-by: Beata Michalska <beata.michalska@arm.com>
---
 Documentation/arch/arm64/silicon-errata.rst |  8 ++++++++
 arch/arm64/Kconfig                          | 12 +++++++++---
 arch/arm64/kernel/cpu_errata.c              |  9 +++++++++
 3 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index afe109afe692..09fe032e1aea 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -175,6 +175,10 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A720     | #3456091        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Cortex-A720     | #4689339        | ARM64_ERRATUM_3821522       |
++----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Cortex-A720AE   | #4689340        | ARM64_ERRATUM_3821522       |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A725     | #3456106        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A725     | #3821522        | ARM64_ERRATUM_3821522       |
@@ -233,6 +237,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-N3     | #3456111        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Neoverse-N3     | #4689341        | ARM64_ERRATUM_3821522       |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V1     | #1619801        | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V1     | #3324341        | ARM64_ERRATUM_3194386       |
@@ -257,6 +263,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | C1-Pro          | #4193714        | ARM64_ERRATUM_4193714       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | C1-Pro          | #4689344        | ARM64_ERRATUM_3821522       |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | C1-Ultra        | #3683289        | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | C1-Ultra        | #4193780        | ARM64_ERRATUM_4118414       |
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 1075bc661833..cf50f3051edc 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1086,14 +1086,20 @@ config ARM64_ERRATUM_2645198
 	  If unsure, say Y.
 
 config ARM64_ERRATUM_3821522
-	bool "Cortex-A725: 3821522: workaround for possible CNT_CYCLES increment error due to WFE/WFI"
+	bool "Cortex-*/Neoverse-*/C1-*: workaround for possible CNT_CYCLES increment error due to WFE/WFI"
 	depends on ARM64_AMU_EXTN
 	select ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
 	default y
 	help
-	  This option adds the workaround for ARM Cortex-A725 erratum 3821522.
+	  This option adds the workaround for the following errata:
+
+	  * ARM Cortex-A725 erratum 3821522
+	  * ARM Cortex-A720 erratum 4689339
+	  * ARM Cortex-A720AE erratum 4689340
+	  * ARM Neoverse N3 erratum 4689341
+	  * ARM C1-Pro erratum 4689344
 
-	  On affected A725 cores, the CNT_CYCLES event may incur a significant
+	  On affected cores, the CNT_CYCLES event may incur a significant
 	  increment error when entering and subsequently exiting WFx.
 	  As a result, the CNT_CYCLES may diverge from the system counter
 	  frequency at which it is expected to increment.
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 38abd123c740..b20da8b24be3 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -420,8 +420,17 @@ static const struct midr_range workaround_amu_constcnt_list[] = {
 	MIDR_RANGE(MIDR_CORTEX_A510, 0, 0, 1, 1),
 #endif
 #ifdef CONFIG_ARM64_ERRATUM_3821522
+	/* Cortex-A720 r0p0 - r0p2 */
+	MIDR_RANGE(MIDR_CORTEX_A720, 0, 0, 0, 2),
+	/* Cortex-A720AE r0p0 - r0p1 */
+	MIDR_RANGE(MIDR_CORTEX_A720AE, 0, 0, 0, 1),
 	/* Cortex-A725 r0p0 - r0p2 */
 	MIDR_RANGE(MIDR_CORTEX_A725, 0, 0, 0, 2),
+	/* Neoverse N3 r0p0 - r0p1 */
+	MIDR_RANGE(MIDR_NEOVERSE_N3, 0, 0, 0, 1),
+	/* C1-Pro r0p0 - r1p3 */
+	MIDR_RANGE(MIDR_C1_PRO, 0, 0, 1, 3),
+
 #endif
 	{}
 };
-- 
2.43.0

