Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794563828;
	b=RG5T9PCnp8iO4wrAdluueWCnSb+0lUdna/lLKpMDzN9DAKNQlZbVwciwQdQzVIPfBe+y
	 rc0I2qruNF0qIq/fjm6ZEuUgJ2MQPalLENOaLJ76YRvY2PTgL8R/RLx8DfbCxs57oI+sL
	 0Ro/eo1/aBc/oWBRj1MtgU0/mJDWdu84IWzJg7XqiTjTkwufX4wur6HEEyLrIQ/D+5h2k
	 tEo0Z/DZiWIWufjjOON+5lmIz/lDcW6Kgs9/ZPXt6dnNCZ/XOXOvTayYtNSowU2sMZhrz
	 Ax8sl1fmQK+2QDIKxYQiY7nJxw2RSuHedQLkpRYLe216F3kBZtWIWA8V6uchDnknJEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563828;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=mDCrY3T+VfZdtZlaxXLBeMjsbFqx3DNTndl6jA165tY=;
	b=Q7O3/4IETgeUWDUh6z5zZecViJQ1qfl+r1FliOel/FsuW3RmmJVF9ISR4wIU26xi7ByZ
	 cAEvMzC53nSJU2LDie28rCJykl+OmPA/tfGW3Nc7KNgd7OHaahylrvNqZB8T+RWRrNGrp
	 kyXYALYEZENDwV/3ZSTraj83YYEUrtDEsvEULpeTr5Spd+trZ3EBP4FgflJPTzzCzFQYz
	 pf9fPFFiR88I2/QdLZocNOYOWAU0e6vLSQn6NvievTjqGh4gq/Ykf1zy2dDTmhMCTbDtg
	 LTCx2LqgYCsN/3dOWN2DEDuUi0er/tNhDzwzg3Kznxq6s+fFXtZ3dlIQulu8k/wVfdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ERhw5e7X;
	arc=none smtp.remote-ip=91.218.175.3
Received: from mta0.migadu.com (out-3.mta0.migadu.com [91.218.175.3])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26BA606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A26BA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ERhw5e7X
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=lOsW+kFmaNLmxVVYY/0ykrsQLE9+KLi12EdY2vBuJyg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794563824; v=1; x=1795168624;
 b=ERhw5e7XrXdCNhbB0G9amRhzx9HP44fEGZN0/+aNbQxXV3shm5fOYU7bMAhWeniBqoEoI+cn
 P0+EjyXPl1sdFM0vsOw4W/otv2kvhNK/PNt6gMw8wjp26TEF32F7wqdiF4Q5c+RD4e03EYYSfpj
 VfjPq3tKjtAXjTrmqSEs9muI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9aff9a9311754da3;
	Fri, 13 Nov 2026 09:57:04 +0000
X-Mizu-Trace-ID: 9aff9a9311754da3
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH] arm64: cpufeature: Check the override in __read_sysreg_by_encoding()
Date: Fri, 13 Nov 2026 09:57:01 +0000
Message-ID: <20261113095701.2042858-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
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

__read_sysreg_by_encoding() backs the capability checks a secondary
runs before its cpuinfo is stored, and folds an ID register override
into the value it reads without checking it against that CPU. A
secondary whose field is below an override the boot CPU accepted
passes verification and comes online without the feature.

Apply the override through arm64_ftr_reg_override(), as the cpuinfo
store does, so that it only applies where it is safe against that CPU's
value.

Fixes: b3341ae0efa2 ("arm64: cpufeature: Use IDreg override in __read_sysreg_by_encoding()")
Reported-by: Catalin Marinas <catalin.marinas@arm.com>
Link: https://lore.kernel.org/all/abwXl35xQ2ze1XwJ@arm.com/
Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---

Notes:
    Based on v7.4-rc1 (6628e7d4c6b2), where arm64_ftr_reg_override() was
    added.

 arch/arm64/kernel/cpufeature.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 34c5c03c0c9b4..3980acdd6e1b7 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1415,7 +1415,6 @@ EXPORT_SYMBOL_GPL(read_sanitised_ftr_reg);
  */
 u64 __read_sysreg_by_encoding(u32 sys_id)
 {
-	struct arm64_ftr_reg *regp;
 	u64 val;
 
 	switch (sys_id) {
@@ -1468,13 +1467,7 @@ u64 __read_sysreg_by_encoding(u32 sys_id)
 		return 0;
 	}
 
-	regp  = get_arm64_ftr_reg(sys_id);
-	if (regp) {
-		val &= ~regp->override->mask;
-		val |= (regp->override->val & regp->override->mask);
-	}
-
-	return val;
+	return arm64_ftr_reg_override(sys_id, val);
 }
 
 #include <linux/irqchip/arm-gic-v3.h>

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3

