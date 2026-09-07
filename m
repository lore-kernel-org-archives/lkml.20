Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A395E519914
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799259; cv=none; b=sjhvdeVAMfDZs1SX8lgaoXyNpXO8N844HS/ADMjMcCVlvgSE/o8ngNCEOEhg3RZxT284VhgD7yw891YXUiLJov0G5gkP7yVMnfD5EZvPJSJsYCjjPMnkFRp/BVV02iYdY/kEO5ZOm0ky072qE+uk10cFlNzFCRQU6jSnHsIXNAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799259; c=relaxed/simple;
	bh=Cbo7edR0u4Ntl50z+0N6x5hHPp6wTLUe5ca/xMW2TRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ijxVvLpEpYpKJSceOIxD7Kzlw/NhLYD0X5LsVYNX64Oye2gcj7tbY3nDRtTV/WlrrqOaMBYOW5T0YzZ7rry4FsDn/xeredgB9nZfFcYbWBqQaQXV00ICb4I+FA5j/KNDllSHYhMC2wqciCR10G383ebMLHVCy8KkWjbQhnyOSYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BhUr78NX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BhUr78NX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E66F31F00A3A;
	Mon,  7 Sep 2026 16:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799258;
	bh=sUkfRfE9yNyBzalxMx3/89AuUQW9k7kD7LJuIN09w18=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BhUr78NXijbJVLVkM69gB/h8NgBlzzcHr8oX4s2y3NPVMtU3IAVjR5zEPMg2NNDCg
	 2yDO+i3ySKuMyaNqrgNny+n7QrhcmIFNXN641mG2UkkLLZg75XjHHvVVQ03+9MpvZF
	 33Hl4vWCHOGExdmjdhl0l/FtPRGEwfd8XCHEBUYshKk+WwfhpoUgFX8savPgljwh38
	 PjvMvAGvblRyQg8huBMuQ78dK0uVDAXHpAFIFdMxUoNpzEcNjp92E+pjXRKA3+tqvZ
	 O10M0mhQum9kPN/+iCPjSmtCfm4lOhGfCTqj/nAw/RAM0FTqSoBeHzgjyvwpR1Reol
	 ItzJNfDrIeqtw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH 08/19] arm64: smp: Don't bother printing the I-cache policy for each CPU
Date: Mon,  7 Sep 2026 17:40:11 +0100
Message-ID: <20260907164024.17164-9-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907164024.17164-1-will@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The I-cache policy isn't particularly interesting but printing it early
can result in unnecessary serialisation of onlining CPUs.

Remove the pointless print.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/cpuinfo.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index b423301a13cc..6dbea3a8bb23 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -31,19 +31,6 @@
  * values depending on configuration at or after reset.
  */
 DEFINE_PER_CPU(struct cpuinfo_arm64, cpu_data);
-
-static inline const char *icache_policy_str(int l1ip)
-{
-	switch (l1ip) {
-	case CTR_EL0_L1Ip_VIPT:
-		return "VIPT";
-	case CTR_EL0_L1Ip_PIPT:
-		return "PIPT";
-	default:
-		return "RESERVED/UNKNOWN";
-	}
-}
-
 unsigned long __icache_flags;
 
 static const char *const hwcap_str[] = {
@@ -424,7 +411,6 @@ device_initcall(cpuinfo_regs_init);
 
 static void cpuinfo_detect_icache_policy(struct cpuinfo_arm64 *info)
 {
-	unsigned int cpu = smp_processor_id();
 	u32 l1ip = CTR_L1IP(info->reg_ctr);
 
 	switch (l1ip) {
@@ -436,8 +422,6 @@ static void cpuinfo_detect_icache_policy(struct cpuinfo_arm64 *info)
 		set_bit(ICACHEF_ALIASING, &__icache_flags);
 		break;
 	}
-
-	pr_info("Detected %s I-cache on CPU%d\n", icache_policy_str(l1ip), cpu);
 }
 
 static void __cpuinfo_store_cpu_32bit(struct cpuinfo_32bit *info)
-- 
2.55.0.979.g7e5102b832-goog

