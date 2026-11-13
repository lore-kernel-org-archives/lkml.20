Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581443;
	b=tUCAH8IKCfihbOo0YI+Ow6yn5PrB/UHruSJ4gDs62rPv7cZgMg5W1PBoMbdxPeWmS+5A
	 1mhohmkuBK+RSy193dj5S7D09mbh+iFZE4GMAeZr+ILRD9T7UYTjNAHheN9edMmGf29dD
	 l4P5AJz3tvnT33NkaHWzLaSC0O/oEzSzWHxmdHqnnjUzLb/5EBWQhEaaHnQ9Gh41uVHLY
	 bYk0vcx2MLh4HN/zItmaGHtOCpwCxCtULRR9ddMSwN4EBSniSGzQxd2D2rJB+e57PDHMu
	 syl9u2Cy4uI9f8ZtvLldTXJYj08aiwYIkrAE6o995xkmrjbUM0ku1sfGNUWC/BDpHcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581443;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EW6O7IX+lZj9zLE/PiayELXWaVWN1Nbov8vCucdwVl4=;
	b=Q1SKfSndwL1hUqgk+XBHAb0/1APsmcpzXkuV98nM3eGLcns2QTSiIWslNqTmF9n5h46y
	 LoOXdEMYbh6hsJ9XupwdYPLQT3RzxciWmDB4ihXNr5ImfcXZg5bMTVWd5F4lBd+dFM4Lm
	 skghRhMSZHfe8BQ/hPPLSAAdi4l0NJtMj0nS+v1yVQiGHyFSR0WwZ3cCLRK0SW2UcUaFq
	 rjdRc5FfBaOzGPVfk0NQL7amx1e96f2XCYAQovi1DpmbAlzB3DGz0J20oEG7WDMB5ll2X
	 TceHc1T4wyjuTEZrUnNrC78oBWFUHurfUaD1Zu6+W5DGZBRhNRl9dAhyd9aDPp4uMEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=PkeGE4In;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D52606A89F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79D52606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=PkeGE4In
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D823E153B;
	Fri, 13 Nov 2026 06:50:39 -0800 (PST)
Received: from e144440.cambridge.arm.com (e144440.arm.com [10.2.199.104])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B1B5D3F673;
	Fri, 13 Nov 2026 06:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794581442; bh=CqJyYJhYvd31ezVbNyoKavdQzrZfJ6U+MBqZ2Ikozgo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PkeGE4Inm/n03a5yqmov9es2UtYkChOW+VnizQ8ryjmlmnGsH988HlNCkjvTLA+Z3
	 TafguOT0bwf7RH3XHtCIzx02NN3tk/c0z1zt533SWdSTM1yOn7vXjNdodTLwcGrriU
	 HMQh8rG2flRxB8NDSPVkJbT9Qn7vkWJGjjD6T9xg=
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Linu Cherian <linu.cherian@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/6] arm64: cputype: Add Cortex-A320 definitions
Date: Fri, 13 Nov 2026 14:50:17 +0000
Message-ID: <20261113145022.2592454-4-ryan.roberts@arm.com>
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

Add the Cortex-A320 part number and MIDR definition. The MIDR_EL1
description in the Cortex-A320 Technical Reference Manual specifies
implementer 0x41 and part number 0xd8f.

These definitions will be used to identify Cortex-A320 in the BBML3
allow list.

Link: https://support.arm.com/documentation/109551/0002?lang=en&rev=0002-04
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/cputype.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
index 6002d1d5f55f..abff1ba1c305 100644
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -103,6 +103,7 @@
 #define ARM_CPU_PART_C1_NANO		0xD8A
 #define ARM_CPU_PART_C1_PRO		0xD8B
 #define ARM_CPU_PART_C1_PREMIUM		0xD90
+#define ARM_CPU_PART_CORTEX_A320	0xD8F
 
 #define APM_CPU_PART_XGENE		0x000
 #define APM_CPU_VAR_POTENZA		0x00
@@ -200,6 +201,7 @@
 #define MIDR_C1_NANO MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_C1_NANO)
 #define MIDR_C1_PRO MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_C1_PRO)
 #define MIDR_C1_PREMIUM MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_C1_PREMIUM)
+#define MIDR_CORTEX_A320 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A320)
 #define MIDR_THUNDERX	MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX)
 #define MIDR_THUNDERX_81XX MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX_81XX)
 #define MIDR_THUNDERX_83XX MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX_83XX)
-- 
2.43.0

