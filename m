Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CDBF3515F0
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789612926; cv=none; b=s5Mj71bvl0B/aLTmJq+qkOhI1wmHLYou2Dp/Kg5O0E6C49jkPkMVJh8D7ju0laKNQ/AdShi6z/gb5exPTiBpptasdM4vvNoORC/EMUL3b8g9m3SBNk4o3+wUG7c94ei27DdcE6RoMc8HAsyxtVckpkf50JjvIrwJ0dLIr8JNoAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789612926; c=relaxed/simple;
	bh=FDZmO2UK3xOGgN+H/EPemPxpu+0UPh7BPuSq4qS3/uA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UnIxCHUKvKrpjzFZl33j2JsHUPwylaTj8KCkbKNTEjE5j55a1meTAAU7ReZZrbfz5PZ6skf9tGYCwcBK/hpcVqLfSu1ETuenEk+4ygS8pZ21yjPOdIwebMufRMM4FibRcZwZ1tKCIkVnwlZq4BR0y8sJeNkw9VsbVxySVoKVlvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=IRlnP6Ix; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="IRlnP6Ix"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5F8E1476;
	Wed, 16 Sep 2026 19:41:53 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7E1B3F882;
	Wed, 16 Sep 2026 19:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789612917; bh=FDZmO2UK3xOGgN+H/EPemPxpu+0UPh7BPuSq4qS3/uA=;
	h=From:To:Cc:Subject:Date:From;
	b=IRlnP6IxCzG+JXlTpQ/Ukq2S6WUlYBQK5GLqLiLjJZzEXZh2EosQJxCcvcMtmvn4x
	 TTYcHW025RsNFFBvUT9TlEMf7234DedHd4dhOcvh6FBe5yAl7xgyw/AbbEtA7JCcqs
	 oNCOBgH+17Dqcd9QhkUzda7BtTQ/3aMJAhtgs4To=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64/cpufeature: Drop redundant define(ID_AA64MMFR0..._SUPPORTED_LPA2)
Date: Thu, 17 Sep 2026 08:11:52 +0530
Message-ID: <20260917024152.3660794-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ID_AA64MMFR0_EL1_TGRAN_2_SUPPORTED_LPA2 is always defined as 0x3. Hence any
defined() test on the macro always going to be evaluated as true. Hence the
very test itself is redundant and can be dropped off safely.

Although similar defined(ID_AA64MMFR0_EL1_TGRAN_LPA2) test is retained back
as the macro does depend on the configured granule size.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This patch applies on v7.2-rc3

 arch/arm64/kernel/cpufeature.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 9a22df0c5120..e3be220ae45b 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1904,7 +1904,7 @@ static bool has_nv1(const struct arm64_cpu_capabilities *entry, int scope)
 		  is_midr_in_range_list(nv1_ni_list)));
 }
 
-#if defined(ID_AA64MMFR0_EL1_TGRAN_LPA2) && defined(ID_AA64MMFR0_EL1_TGRAN_2_SUPPORTED_LPA2)
+#if defined(ID_AA64MMFR0_EL1_TGRAN_LPA2)
 static bool has_lpa2_at_stage1(u64 mmfr0)
 {
 	unsigned int tgran;
-- 
2.43.0

