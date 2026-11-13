Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581445;
	b=KyQTph3AwHF6mmIRXrC/r70qUchyV/efW0JZIQkzICVh+mOuf79+1MMTKUYyjir0NeWB
	 mJNRbZI3Blp91TT2QqlqWjFODPCcJDSBRV8l1GY+BFcL7VC3T7CefVXvkcL8cFLWe43cq
	 cHHy7SUOfiAZkHDtgHZ+Jtb+3x1oIgrcfRcB8Zhx2AW/RPQXrcNIKXxOjWTbZ7vyaa2sI
	 oz4CXhbI+Lx1QK3cW8wixmf4WYrvLpRYFeF6jvldNVYVYGGL438K1+MBwq6EBFLRQL8Zs
	 Pdrc4a7ZS9pvyd657jxJFBKqotVJIe6hkhiFKZ83XwK37Myp+Xy0ZuyX0hx2aiAfYnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581445;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iPw+rE2Uc0+f2QO/Bmk5DxjcUgLAgTCNG01JNYLDzSY=;
	b=fv2AZu6RIexkxm1NiMQKgdMiZKqjEXc7kIv2TMyFV+DJFshE2W0mOotw3EGiBWy/OFTn
	 ayZPYl56VUE3Ij8YjkY5jPQgAsUicTBji26GDegEV4MAafrPvZN2uWDt2zDqI2NCS/VkO
	 HEZ5c68o9owaRzN8125EBwV3ljB3MXT2J4exA9GUVJ7AAPxtOAz98pQCvfgMQduE8SSy7
	 50SPndMSufhTkEeMb8aUd8VCLRvdNIB8bsMMRCbtPgulwIpxveknkyyb90MDzQ5HXpoGC
	 /aPPUxBjgzQr0hTGSu2wB3u7BXPo8zEqJFGf7MSwcGfhgxYf2YKOjPD8mdDaa2jj+yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=SWftCDPY;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2084606A8AE
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2084606A8AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=SWftCDPY
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 556841576;
	Fri, 13 Nov 2026 06:50:41 -0800 (PST)
Received: from e144440.cambridge.arm.com (e144440.arm.com [10.2.199.104])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 30D5F3F673;
	Fri, 13 Nov 2026 06:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794581444; bh=g4tVmyvNqyscAXWxIbsOz98wvJc4+4piUxxDN1ozCdM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SWftCDPY7fWN4qJFZ1qCq5a0Tg7HpjOrO0Fo+ME8O7OArsbQaXmNw4aQ0FrvFDVAJ
	 LVHxoWWqPBE2yMTe9GBffiejJCN1U5DG0+i+OVmppIoDgqu3uKmW7wwolwEDRmri/3
	 bWjBEgAuCKhZDOqlbgaqHXjCSFk0xqfQd6tMX0h4=
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Linu Cherian <linu.cherian@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/6] arm64: cputype: Add C2-Ultra definitions
Date: Fri, 13 Nov 2026 14:50:18 +0000
Message-ID: <20261113145022.2592454-5-ryan.roberts@arm.com>
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

Add the C2-Ultra part number and MIDR definition. The MIDR_EL1
description in the C2-Ultra Technical Reference Manual specifies
implementer 0x41 and part number 0xd96.

These definitions will be used to identify C2-Ultra in the BBML3 allow
list.

Link: https://support.arm.com/documentation/109736/0001?lang=en&rev=0001-05
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/cputype.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
index abff1ba1c305..55493e01009e 100644
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -104,6 +104,7 @@
 #define ARM_CPU_PART_C1_PRO		0xD8B
 #define ARM_CPU_PART_C1_PREMIUM		0xD90
 #define ARM_CPU_PART_CORTEX_A320	0xD8F
+#define ARM_CPU_PART_C2_ULTRA		0xD96
 
 #define APM_CPU_PART_XGENE		0x000
 #define APM_CPU_VAR_POTENZA		0x00
@@ -202,6 +203,7 @@
 #define MIDR_C1_PRO MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_C1_PRO)
 #define MIDR_C1_PREMIUM MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_C1_PREMIUM)
 #define MIDR_CORTEX_A320 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A320)
+#define MIDR_C2_ULTRA MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_C2_ULTRA)
 #define MIDR_THUNDERX	MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX)
 #define MIDR_THUNDERX_81XX MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX_81XX)
 #define MIDR_THUNDERX_83XX MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX_83XX)
-- 
2.43.0

