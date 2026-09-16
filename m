Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5287CEEC0
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789537912; cv=none; b=W3BywBW7JeVI6OxlFg9tv449dQmUEp/5ITNGE9NJSkbFm38H9aOXlHhc4+VIncor0AVVuIrc3HVV1jkgGlyNe8/sy5X1RsrMNHogFvjY+zcBQUBM1tRJT/o7IC9qFh/PrhbmVJPEvsPuhNmEU+tBWskVz5kQxQdIAONsY7318S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789537912; c=relaxed/simple;
	bh=eVbFWNjui3f6RsC9RSFYFqpFfBkLBBW1TiTcOIGgLmc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P9OmC+ZgSiwFWxpe0KCCr4/b6Yx7WKmvxLQYzcqiOv0LpFIN8PpcoPjcPp5CoFT81ZRys9PCThNtzIlq1tUFvj9MaaSgDvL2QRSIFwUiKnc5t0JI5iIs0TpDfJIdP+fOUyvjtziNCd+EE7rlWIhFHNvv8OzH25qPsUMRwBDHXdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=W8dyi54h; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="W8dyi54h"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DB6A152B;
	Tue, 15 Sep 2026 22:51:44 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CC653F86F;
	Tue, 15 Sep 2026 22:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789537908; bh=eVbFWNjui3f6RsC9RSFYFqpFfBkLBBW1TiTcOIGgLmc=;
	h=From:To:Cc:Subject:Date:From;
	b=W8dyi54hYTplNiTNQpahZzW3Bl+gbg9Pf9InR/Y9a+CEL6LSViuNxmZ8HkijYZnKv
	 0JMAe8CNESZ/6tqa8f+5MJ0jkGm88oOTN8PS2vFMi/2e5lwaokSRMVJ7PhPpw+GBbQ
	 mZWTcecaxyBPdvjHHDpfx0FV2i1TXzJFnTOr7b3E=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64/cpufeature: Change description for ARM64_HAS_LPA2
Date: Wed, 16 Sep 2026 11:21:41 +0530
Message-ID: <20260916055141.2702145-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ARM64_HAS_LPA2 represents CPU capability detection for FEAT_LPA2 both in S1
and S2, regardless whether KVM gets enabled and uses the same subsequently.
ARM64_HAS_LPA2 in itself is not really anything KVM specific, although the
description suggests otherwise. Drop 'KVM' from the description and update
it appropriately.

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
index 9a22df0c5120..c63c1050a32d 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -3068,7 +3068,7 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.matches = has_bbml2_noabort,
 	},
 	{
-		.desc = "52-bit Virtual Addressing for KVM (LPA2)",
+		.desc = "52-bit Virtual-Physical Addressing in S1 and S2 (LPA2)",
 		.capability = ARM64_HAS_LPA2,
 		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
 		.matches = has_lpa2,
-- 
2.43.0

