Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0C0053979C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169729; cv=none; b=X03T4OM61m49k3GHGMBLaG9xnJ86mCqDwUOyEAD8eah1W5onLmUae5q/kHVKhXVSejXKky/bHoVP6inEQim+METBl8UAdfeIrP6EqtSsfK1iQ5y93Yzp2cpLcMty2KecoFmyCxbMyGrEdxrGQ14Ai1jtvY8TVPRrfJ0/kM/CiEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169729; c=relaxed/simple;
	bh=+jqZzyhV5ag+2Smp2FCcR5UxrniIfKBgwDp/ueibgVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WO/efrifrHGr8ddVLyYGAGdWkiStsjSJi4jPuLaY8nWeg9gjTVrCz+HCfPPeqenm3l1ThL6FIzqqKugr3qguDHvUC/RKEvoOWdzfMheZNlIgHgw9JqVmFldA1xkv1p+szaUmVe1PCPooQooJx6+doF6jiUhQLoHywvU0ceKKwTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=aV+SESzm; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="aV+SESzm"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D7C41477;
	Fri, 16 Oct 2026 09:55:23 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23E1D3F7B4;
	Fri, 16 Oct 2026 09:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169726; bh=+jqZzyhV5ag+2Smp2FCcR5UxrniIfKBgwDp/ueibgVI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aV+SESzmbE/EsF0WcbUyJvly90WShwFBCZ69ahJfPSSB/Q6v/o/zA41RlOA+nHK1T
	 ISqHvKJbn1NzzJOxtO3yGsPpp9IhryVX0WfBq2rsC9MnZBKCTsrThQmhMYX7g00mjs
	 SqjNQUDg9DF55wHEUuccRpKv3TxM9UOHRUvHZDoI=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:06 +0100
Subject: [PATCH v2 08/23] coresight: trbe: Clear stale external abort
 status
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-8-3f57cf3199b1@arm.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=1173;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=+jqZzyhV5ag+2Smp2FCcR5UxrniIfKBgwDp/ueibgVI=;
 b=SrX2DqNJ7y//tJqyorcceEhD0AK2v8h4Q9zCYwAk5s4OOEYUpVshUNaW+45Ge7zDM4V3sg/hb
 gIggxSN99ryDt9wds6AQL+1NiIWh6YK/32Iue2BavwXCfH9IilR3Wzm
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

clr_trbe_status() clears the buffer status and syndrome fields, but
leaves TRBSR_EL1.EA unchanged. After an external abort, this indication
can survive into a later perf session on the same CPU.

Clear EA along with the other status fields while TRBE is disabled.
The status captured for the current fault remains available for
classification, so external aborts are still handled as fatal.

Fixes: 3fbf7f011f24 ("coresight: sink: Add TRBE driver")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 9dfc6bb7afb4c42dfdec643ee7e4f2f193e2b70c..26e7554d6bdd31f8a55a8bc3a7b6d4c49b984b9b 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -608,6 +608,7 @@ static void clr_trbe_status(void)
 	trbsr &= ~TRBSR_EL1_IRQ;
 	trbsr &= ~TRBSR_EL1_TRG;
 	trbsr &= ~TRBSR_EL1_WRAP;
+	trbsr &= ~TRBSR_EL1_EA;
 	trbsr &= ~TRBSR_EL1_EC_MASK;
 	trbsr &= ~TRBSR_EL1_BSC_MASK;
 	trbsr &= ~TRBSR_EL1_S;

-- 
2.34.1

