Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581448;
	b=KSx0k2A71iN6Z0bkl0dpePJX4pokcvba1rd5C1ibWt7orrWf19oLA+9RkYa6/UTkMnS/
	 rvYbzWQkD3aFJX8IlCTCr2m52ULnj/aK5W6WgeOabIalmU8IXd3SD7KU9uwHfk7Ke4KmH
	 +RAMpTmGUefnNxd/nrHbiOTWHx5lzJlY2weuhgQHEJkN/fLbHGGNj/EHryGZBkIxIGKwR
	 TRcnSce30i5I1MgzlsW2XiGnvInhbJzS82OJ52j1XR4XdbOgnjE71FPiW356DsG372AtX
	 iLM0Hv58eN8/oPgI8qb+xHrFxfxAhb84oT3d80k03FNu47s9b43w+37QL+RK3hvjw/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581448;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SKLh7NaPcZMHnOU2sm1eukz8SXtZxHzml55UTzZOPaA=;
	b=HOomsm+A/OXCGSv+NqPJBQa5gyXXqU0zYpI0SnXuz5fpUIWhRlzg4jZCv6pCvgSEJrza
	 w6udVs9+gbBb/g453kl46j2QfXF+0PrG2qu5f4plbfzAVPEDCAqdTgKtNHYg/wQ7kSf4a
	 btVj2UxovzNO3XkqZgS6UO9NKFOgXZy7x/Z5AiNSNoEHpXS0CxmVwR5moUe16I2wuP5vw
	 1NJwb7mxPHIWc451VAtGj+4ijkh3yz0OjMnvvkBfEsyumzeu3PMMsBu/UQ04DOFMhqifQ
	 V/IzhR4SRX98YuoKBtrB+gDHelYsG2wcM22OFNVqAWpRcwlzcJXXMLfVxQ84A91HQ7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="P6/pgzNi";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDB11606A33D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:50:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDB11606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=P6/pgzNi
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 692971516;
	Fri, 13 Nov 2026 06:50:44 -0800 (PST)
Received: from e144440.cambridge.arm.com (e144440.arm.com [10.2.199.104])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 436043F673;
	Fri, 13 Nov 2026 06:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794581447; bh=a5m4ysPdwyGSGObjocs16GCukbgNzqxTIp8ZFTo6HQM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P6/pgzNiwR+xiURr+QOsFiJdBfXTAhOC/+4fkQIbldKvz0MfrC/9QvoeZB1g5DPZh
	 kF0Kk9MuNqoybN/vhUDTdNVOdzKfgktHv5w1Dq5cAEVXTg6ORNiMV5weP4eJMyuz/I
	 aKf3eovyxiHjRhwE5JHUFMJrRIPpiyGbwos1qiiY=
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Linu Cherian <linu.cherian@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 6/6] arm64: cpufeature: Enable BBML3 on Cortex-A320, A520 and A720
Date: Fri, 13 Nov 2026 14:50:20 +0000
Message-ID: <20261113145022.2592454-7-ryan.roberts@arm.com>
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

Cortex-A320, Cortex-A520 and Cortex-A720 advertise BBML2 and are known
not to raise conflict aborts for mapping-granularity changes. They can
therefore use the BBML3 semantics, but their MIDRs are missing from the
allow list.

Commit a7ac60414475 ("arm64: cpufeature: Extend bbml2_noabort support
list") named A520(AE) and A720(AE), but added only the AE MIDRs. The
non-AE CPUs have distinct MIDRs and need their own entries. Cortex-A320
can now be identified using its new MIDR definition.

Add all revisions of these three CPUs to the allow list. The reviewed
SDENs identify no BBML3 exclusion erratum for them.

Cortex-A510 remains excluded because it can raise conflict aborts.

Link: https://support.arm.com/documentation/SDEN-2877630/0000?lang=en&rev=0000-06
Link: https://support.arm.com/documentation/SDEN-2444153/0000?lang=en&rev=0000-12
Link: https://support.arm.com/documentation/SDEN-2439421/0000?lang=en&rev=0000-17
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/kernel/cpufeature.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index aa6f4c8c1052..de2d2bd686d8 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2015,11 +2015,14 @@ bool cpu_supports_bbml3(void)
 		MIDR_ALL_VERSIONS(MIDR_NVIDIA_RIGEL),
 		MIDR_ALL_VERSIONS(MIDR_AMPERE1),
 		MIDR_ALL_VERSIONS(MIDR_AMPERE1A),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A320),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A520),
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A520AE),
 #ifndef CONFIG_ARM64_ERRATUM_3696244
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A710),
 #endif
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A715),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A720),
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A720AE),
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A725),
 #ifndef CONFIG_ARM64_ERRATUM_3696244
-- 
2.43.0

