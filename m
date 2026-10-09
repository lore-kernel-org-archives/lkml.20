Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B25380FC1
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540514; cv=none; b=btLSk6quykuiIddybPPpCQ396Wn/rFARkherc5MAMBxeLJW0cF2HLbnvYEJVHT/r1xbaq8rnTWkpIqQD1h16ogDhpSJ01pshpnAlqfOthIjdtmiR7qs+/mOZz+3PkTXhUdMcTNMdaXHIHazWYZAcXF5zPH+FY1nY6Bdyr19FY9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540514; c=relaxed/simple;
	bh=zsF+CHxmDIWi+0W28aOKtOiMYhY3g2zwPtcy27vgxo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hJgSe2DkKqGjSPb4q8ucC7E2SNKaTpTM8casKW6lNI2EBQG1tkOvIzacOgFboHevpJhXmGWRDr7E4t21m/xNZAFXNOEmPRtGNV2p20wEYoChLzFeD26LE6yZGLUajnxpKSA7pKsAjHVJXFCols9Cw9rw13cbiTo7Oy0D5kA/pEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YjSBBrgZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YjSBBrgZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA2311F00899;
	Fri,  9 Oct 2026 10:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540513;
	bh=xH2XprgQ00wXZBykl621LlJAXXNb9rHtvI/kD08mEM4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YjSBBrgZ9Y5Xej7VdopzxeB9b6XJf9N0iJEaBw5aI5XI6IxGuoWA2aAl954kiBROG
	 HM2uSybTH70MynGW0n9aI1fuLbS6ccoNzLo1kWUPUgt+Cb5sM9Dr9G5lF3AvGrMPpi
	 NzIdvbh3HAPH+9CFdtx3uJFCh6f+VqLsKkui8ZeSxCpgc7IlawVCq/ikyX2kQUegsj
	 neE/bF0BZBZq5Cj9CKvvRjgprjVBUbkTU8BaJ6qZ/r6sHkw3GJrS8WlQlLdunXPbH4
	 sw116k1NaTL2pRo4GItoVjYtmlJElRFUY8KEwaGyAEQ2sujHIh5cXT2CayGdrXo4iA
	 CQ2wYZka8g/hA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	=?UTF-8?q?=C8=98tefania=20Ion?= <stefion@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Tarun Sahu <tarunsahu@google.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 12/23] arm64: smp: Don't bother printing the I-cache policy for each CPU
Date: Fri,  9 Oct 2026 11:07:23 +0100
Message-ID: <20261009100738.31288-13-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009100738.31288-1-will@kernel.org>
References: <20261009100738.31288-1-will@kernel.org>
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

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/cpuinfo.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index dfb21bf5541d..94e6cd211d70 100644
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
2.56.0.385.gd3acb90ef8-goog

