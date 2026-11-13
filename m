Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581446;
	b=xQj8FQ/ix0fvU51fnvDbRNOkIKNdsXMjPk88D9oo5fmCslJJ1arz+lLzlQpFbbplV3nV
	 EfNaKcInX3LX8C2wByvkgMP4zk8/C0xZN737Ngc95awl1XUi66lwVJlWSQHMZzx0/EOGQ
	 5OrVHe6K3v91ek8GCcUfL+DNuPc4yUnRE9QSsmtZ01fTpMiByw5ktNFPuhmntcFVXPPrn
	 nGp6PxY210M4dD5wOTXQRhbgZyUBcsUYAMiQaCyEXuHtInFlWYKoAk2ZDqZdkip+Ot/jh
	 iNRnnJ9SyMgQWIj76t15C6sqEaHxSenUgkYSYp6o6Od0dAyWp7lPTvS9aue7ersNRQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581446;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yGy/MjJek+blUtH0RdTGSLJXE9F/EI3KT1eEX9Gp/Pw=;
	b=L7Cekjdaqko2Gr6tvnvbfKLppgvANo6Vb69gC1gXO/RF4VBp8XbyaEndwNPslVzsVC+0
	 kFXdNO42ypTaqDOLJmMZMA3ooVKJjhz/9A8Z7DrkxLiDVD5PeXxFDEP1Fn1xheXaWLUde
	 UK5VZOoxr8x+VaAywmDj8ml7FIUXXAHIpZfjxRo1tZNi3tPbJI98H4l4bnEwxmZKROoYg
	 USfAaTaIin7bLFJfu93bZ9DrcTSKYiydAn5XU/UghSvzC4o98YlQA6eGt/rhziQEX3fkY
	 c8/B8HmmVOGdzPEFpBnzxUAbF4MxKNXe0K1KV8/sWPxetLelqPxinFLwU+IG1LFHBYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=lkvF5HWP;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CBDD606A8BF
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CBDD606A8BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=lkvF5HWP
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6FCE1595;
	Fri, 13 Nov 2026 06:50:42 -0800 (PST)
Received: from e144440.cambridge.arm.com (e144440.arm.com [10.2.199.104])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A42BF3F673;
	Fri, 13 Nov 2026 06:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794581445; bh=Pq5es0bVHSK7K9svG1M0AoJ6RjFDe3Pgn+FfZHNNnVE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lkvF5HWPJACYwbJ1FIqeQfky4qUmACwn5iNj2QZIChjquyYjlSLoo0BFF/DzW31nM
	 6MwJD10A2tWyvYkLoAQPE39CasP8fdjd/idRp++ueVraTWkdiKYrQI491XS9uf6fES
	 eSJgjQQr2lPuasiiagQsxxjUBZlvsBsg1ViJWhMw=
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Linu Cherian <linu.cherian@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/6] arm64: cpufeature: Track BBML3 exclusions with erratum options
Date: Fri, 13 Nov 2026 14:50:19 +0000
Message-ID: <20261113145022.2592454-6-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113145022.2592454-1-ryan.roberts@arm.com>
References: <20261113145022.2592454-1-ryan.roberts@arm.com>
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

Several CPUs implementing the BBML3 no-abort semantics advertise only
BBML2, but cannot safely use those semantics because of hardware errata.
Omitting their MIDRs from the allow list hides the reason for the
exclusion and makes the relevant workarounds difficult to track.

Add a default-enabled Kconfig option for each of the following errata,
and include the affected CPUs in the BBML3 allow list only when the
corresponding workaround is disabled:

  3043240  Cortex-X925
  3043263  Cortex-X4
  3053180  Neoverse-V3 and Neoverse-V3AE
  3683289  C1-Ultra and C1-Premium
  3696239  Cortex-X3
  3696242  Neoverse-V2
  3696244  Cortex-A710 and Cortex-X2
  3696250  Neoverse-N2
  3696285  Neoverse-V1
  4196850  C2-Ultra

These errata can cause a load or store to livelock when mapping size
changes without break-before-make or contiguous hints are inconsistent.
For CPUs with no documented fixed revision, exclude all revisions while
the workaround is enabled.

Preserve the C1-Ultra and C1-Premium entries from r1p1, where erratum
3683289 is fixed. Disabling that workaround additionally allows their
earlier revisions.

Note that Cortex-A510 advertises BBML2 and is not subject to any errata,
but it can generate conflict aborts, and so does not meet the
requirements of BBML3. It is therefore not included in the list.

Link: https://support.arm.com/documentation/109180/13-0/?lang=en
Link: https://support.arm.com/documentation/111077/10-0/?lang=en
Link: https://support.arm.com/documentation/111078/10-0/?lang=en
Link: https://support.arm.com/documentation/111287/10-0/?lang=en
Link: https://support.arm.com/documentation/SDEN-2055130/18-0?lang=en&rev=18.0
Link: https://support.arm.com/documentation/SDEN-2332927/13-0?lang=en&rev=13.0
Link: https://support.arm.com/documentation/SDEN-1775101/23-0?lang=en&rev=23.0
Link: https://support.arm.com/documentation/SDEN-1775100/23-0?lang=en&rev=23.0
Link: https://support.arm.com/documentation/SDEN-1982442/21-0?lang=en&rev=21.0
Link: https://support.arm.com/documentation/SDEN-1401781/23-0?lang=en&rev=23.0
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 Documentation/arch/arm64/silicon-errata.rst |  26 +++-
 arch/arm64/Kconfig                          | 163 ++++++++++++++++++++
 arch/arm64/kernel/cpufeature.c              |  37 ++++-
 3 files changed, 220 insertions(+), 6 deletions(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index 9d6d13045a55..a515d01266ae 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -159,6 +159,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A78C     | #4193794        | ARM64_ERRATUM_4118414       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Cortex-A710     | #3696244        | ARM64_ERRATUM_3696244       |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A710     | #2119858        | ARM64_ERRATUM_2119858       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A710     | #2054223        | ARM64_ERRATUM_2054223       |
@@ -189,6 +191,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X1C      | #4193792        | ARM64_ERRATUM_4118414       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Cortex-X2       | #3696244        | ARM64_ERRATUM_3696244       |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X2       | #2119858        | ARM64_ERRATUM_2119858       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X2       | #2224489        | ARM64_ERRATUM_2224489       |
@@ -197,16 +201,20 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X2       | #4193788        | ARM64_ERRATUM_4118414       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Cortex-X3       | #3696239        | ARM64_ERRATUM_3696239       |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X3       | #3324335        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X3       | #4193786        | ARM64_ERRATUM_4118414       |
 +----------------+-----------------+-----------------+-----------------------------+
-| ARM            | Cortex-X4       | #3043263        | N/A                         |
+| ARM            | Cortex-X4       | #3043263        | ARM64_ERRATUM_3043263       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X4       | #3194386        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X4       | #4118414        | ARM64_ERRATUM_4118414       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Cortex-X925     | #3043240        | ARM64_ERRATUM_3043240       |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X925     | #3324334        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X925     | #4193781        | ARM64_ERRATUM_4118414       |
@@ -223,6 +231,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-N1     | #4193800        | ARM64_ERRATUM_4118414       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Neoverse-N2     | #3696250        | ARM64_ERRATUM_3696250       |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-N2     | #2139208        | ARM64_ERRATUM_2139208       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-N2     | #2067961        | ARM64_ERRATUM_2067961       |
@@ -235,38 +245,44 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-N3     | #3456111        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Neoverse-V1     | #3696285        | ARM64_ERRATUM_3696285       |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V1     | #1619801        | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V1     | #3324341        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V1     | #4193790        | ARM64_ERRATUM_4118414       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Neoverse-V2     | #3696242        | ARM64_ERRATUM_3696242       |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V2     | #3324336        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V2     | #4193787        | ARM64_ERRATUM_4118414       |
 +----------------+-----------------+-----------------+-----------------------------+
-| ARM            | Neoverse-V3     | #3053180        | N/A                         |
+| ARM            | Neoverse-V3     | #3053180        | ARM64_ERRATUM_3053180       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V3     | #3312417        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V3     | #4193784        | ARM64_ERRATUM_4118414       |
 +----------------+-----------------+-----------------+-----------------------------+
-| ARM            | Neoverse-V3AE   | #3053180        | N/A                         |
+| ARM            | Neoverse-V3AE   | #3053180        | ARM64_ERRATUM_3053180       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V3AE   | #3312417        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V3AE   | #4193784        | ARM64_ERRATUM_4118414       |
 +----------------+-----------------+-----------------+-----------------------------+
-| ARM            | C1-Premium      | #3683289        | N/A                         |
+| ARM            | C1-Premium      | #3683289        | ARM64_ERRATUM_3683289       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | C1-Premium      | #4193780        | ARM64_ERRATUM_4118414       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | C1-Pro          | #4193714        | ARM64_ERRATUM_4193714       |
 +----------------+-----------------+-----------------+-----------------------------+
-| ARM            | C1-Ultra        | #3683289        | N/A                         |
+| ARM            | C1-Ultra        | #3683289        | ARM64_ERRATUM_3683289       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | C1-Ultra        | #4193780        | ARM64_ERRATUM_4118414       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | C2-Ultra        | #4196850        | ARM64_ERRATUM_4196850       |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | MMU-500         | #562869,        | ARM_SMMU_MMU_500_CPRE_ERRATA|
 |                |                 | #841119,        |                             |
 |                |                 | #826419,        |                             |
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 1075bc661833..79c92805c694 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1248,6 +1248,169 @@ config ARM64_ERRATUM_4118414
 
 	  If unsure, say Y.
 
+config ARM64_ERRATUM_3043240
+	bool "Cortex-X925: 3043240: BBM-related livelock"
+	default y
+	help
+	  This option adds the workaround for Arm Cortex-X925 erratum 3043240,
+	  which affects r0p0, r0p1 and r0p2. No fixed revision is known.
+
+	  Changing mapping size without break-before-make or using inconsistent
+	  contiguous hints can cause a load or store to livelock.
+
+	  Work around this by excluding all revisions of Cortex-X925 from the
+	  BBML3 allow list, so Linux uses break-before-make. Disabling this
+	  option allows BBML3 to be used on these CPUs.
+
+	  If unsure, say Y.
+
+config ARM64_ERRATUM_3043263
+	bool "Cortex-X4: 3043263: BBM-related livelock"
+	default y
+	help
+	  This option adds the workaround for Arm Cortex-X4 erratum 3043263,
+	  which affects r0p0, r0p1, r0p2 and r0p3. No fixed revision is known.
+
+	  Changing mapping size without break-before-make or using inconsistent
+	  contiguous hints can cause a load or store to livelock.
+
+	  Work around this by excluding all revisions of Cortex-X4 from the
+	  BBML3 allow list, so Linux uses break-before-make. Disabling this
+	  option allows BBML3 to be used on these CPUs.
+
+	  If unsure, say Y.
+
+config ARM64_ERRATUM_3053180
+	bool "Neoverse-V3/V3AE: 3053180: BBM-related livelock"
+	default y
+	help
+	  This option adds the workaround for Arm Neoverse-V3 and Neoverse-V3AE
+	  erratum 3053180, which affects r0p0, r0p1 and r0p2. Contrary to earlier
+	  errata notices, r0p2 is affected. No fixed revision is known.
+
+	  Changing mapping size without break-before-make or using inconsistent
+	  contiguous hints can cause a load or store to livelock.
+
+	  Work around this by excluding all revisions of Neoverse-V3 and
+	  Neoverse-V3AE from the BBML3 allow list, so Linux uses break-before-make.
+	  Disabling this option allows BBML3 to be used on these CPUs.
+
+	  If unsure, say Y.
+
+config ARM64_ERRATUM_3683289
+	bool "C1-Ultra/Premium: 3683289: BBM-related livelock"
+	default y
+	help
+	  This option adds the workaround for Arm C1-Ultra and C1-Premium erratum
+	  3683289, which affects r0p0 and r1p0 and is fixed in r1p1.
+
+	  Changing mapping size without break-before-make or using inconsistent
+	  contiguous hints can cause a load or store to livelock.
+
+	  Work around this by excluding revisions earlier than r1p1 from the
+	  BBML3 allow list, so Linux uses break-before-make on affected CPUs.
+	  Disabling this option allows BBML3 to be used on all revisions.
+
+	  If unsure, say Y.
+
+config ARM64_ERRATUM_3696239
+	bool "Cortex-X3: 3696239: BBM-related livelock"
+	default y
+	help
+	  This option adds the workaround for Arm Cortex-X3 erratum 3696239,
+	  which affects r0p0, r1p0, r1p1 and r1p2. No fixed revision is known.
+
+	  Changing mapping size without break-before-make or using inconsistent
+	  contiguous hints can cause a load or store to livelock.
+
+	  Work around this by excluding all revisions of Cortex-X3 from the
+	  BBML3 allow list, so Linux uses break-before-make. Disabling this
+	  option allows BBML3 to be used on these CPUs.
+
+	  If unsure, say Y.
+
+config ARM64_ERRATUM_3696242
+	bool "Neoverse-V2: 3696242: BBM-related livelock"
+	default y
+	help
+	  This option adds the workaround for Arm Neoverse-V2 erratum 3696242,
+	  which affects r0p0, r0p1 and r0p2. No fixed revision is known.
+
+	  Changing mapping size without break-before-make or using inconsistent
+	  contiguous hints can cause a load or store to livelock.
+
+	  Work around this by excluding all revisions of Neoverse-V2 from the
+	  BBML3 allow list, so Linux uses break-before-make. Disabling this
+	  option allows BBML3 to be used on these CPUs.
+
+	  If unsure, say Y.
+
+config ARM64_ERRATUM_3696244
+	bool "Cortex-A710/X2: 3696244: BBM-related livelock"
+	default y
+	help
+	  This option adds the workaround for Arm Cortex-A710 and Cortex-X2
+	  erratum 3696244, which affects r0p0, r1p0, r2p0 and r2p1. No fixed
+	  revision is known.
+
+	  Changing mapping size without break-before-make or using inconsistent
+	  contiguous hints can cause a load or store to livelock.
+
+	  Work around this by excluding all revisions of Cortex-A710 and
+	  Cortex-X2 from the BBML3 allow list, so Linux uses break-before-make.
+	  Disabling this option allows BBML3 to be used on these CPUs.
+
+	  If unsure, say Y.
+
+config ARM64_ERRATUM_3696250
+	bool "Neoverse-N2: 3696250: BBM-related livelock"
+	default y
+	help
+	  This option adds the workaround for Arm Neoverse-N2 erratum 3696250,
+	  which affects r0p0, r0p1, r0p2 and r0p3. No fixed revision is known.
+
+	  Changing mapping size without break-before-make or using inconsistent
+	  contiguous hints can cause a load or store to livelock.
+
+	  Work around this by excluding all revisions of Neoverse-N2 from the
+	  BBML3 allow list, so Linux uses break-before-make. Disabling this
+	  option allows BBML3 to be used on these CPUs.
+
+	  If unsure, say Y.
+
+config ARM64_ERRATUM_3696285
+	bool "Neoverse-V1: 3696285: BBM-related livelock"
+	default y
+	help
+	  This option adds the workaround for Arm Neoverse-V1 erratum 3696285,
+	  which affects r0p0, r1p0, r1p1 and r1p2. No fixed revision is known.
+
+	  Changing mapping size without break-before-make or using inconsistent
+	  contiguous hints can cause a load or store to livelock.
+
+	  Work around this by excluding all revisions of Neoverse-V1 from the
+	  BBML3 allow list, so Linux uses break-before-make. Disabling this
+	  option allows BBML3 to be used on these CPUs.
+
+	  If unsure, say Y.
+
+config ARM64_ERRATUM_4196850
+	bool "C2-Ultra: 4196850: BBM-related livelock"
+	default y
+	help
+	  This option adds the workaround for Arm C2-Ultra erratum 4196850,
+	  which affects r0p0 and r0p1. Contrary to earlier errata notices, r0p1
+	  is affected. No fixed revision is known.
+
+	  Changing mapping size without break-before-make or using inconsistent
+	  contiguous hints can cause a load or store to livelock.
+
+	  Work around this by excluding all revisions of C2-Ultra from the
+	  BBML3 allow list, so Linux uses break-before-make. Disabling this
+	  option allows BBML3 to be used on these CPUs.
+
+	  If unsure, say Y.
+
 config CAVIUM_ERRATUM_22375
 	bool "Cavium erratum 22375, 24313"
 	default y
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 8819652a67ed..aa6f4c8c1052 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2016,15 +2016,50 @@ bool cpu_supports_bbml3(void)
 		MIDR_ALL_VERSIONS(MIDR_AMPERE1),
 		MIDR_ALL_VERSIONS(MIDR_AMPERE1A),
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A520AE),
+#ifndef CONFIG_ARM64_ERRATUM_3696244
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A710),
+#endif
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A715),
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A720AE),
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A725),
+#ifndef CONFIG_ARM64_ERRATUM_3696244
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_X2),
+#endif
+#ifndef CONFIG_ARM64_ERRATUM_3696239
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_X3),
+#endif
+#ifndef CONFIG_ARM64_ERRATUM_3043263
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_X4),
+#endif
+#ifndef CONFIG_ARM64_ERRATUM_3043240
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_X925),
+#endif
+#ifndef CONFIG_ARM64_ERRATUM_3696250
+		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N2),
+#endif
 		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N3),
+#ifndef CONFIG_ARM64_ERRATUM_3696285
+		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V1),
+#endif
+#ifndef CONFIG_ARM64_ERRATUM_3696242
+		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V2),
+#endif
+#ifndef CONFIG_ARM64_ERRATUM_3053180
+		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V3),
+		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V3AE),
+#endif
 		MIDR_ALL_VERSIONS(MIDR_C1_NANO),
 		MIDR_ALL_VERSIONS(MIDR_C1_PRO),
-		/* Erratum 3683289 fixed in r1p1 */
+#ifndef CONFIG_ARM64_ERRATUM_3683289
+		MIDR_ALL_VERSIONS(MIDR_C1_ULTRA),
+		MIDR_ALL_VERSIONS(MIDR_C1_PREMIUM),
+#else
 		MIDR_RANGE(MIDR_C1_ULTRA, 1, 1, 0xf, 0xf),
 		MIDR_RANGE(MIDR_C1_PREMIUM, 1, 1, 0xf, 0xf),
+#endif
+#ifndef CONFIG_ARM64_ERRATUM_4196850
+		MIDR_ALL_VERSIONS(MIDR_C2_ULTRA),
+#endif
 		{}
 	};
 	u64 mmfr2 = __read_sysreg_by_encoding(SYS_ID_AA64MMFR2_EL1);
-- 
2.43.0

