Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9975A4EB853
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169717; cv=none; b=Iz0LVkHG9jiObHHn7v9YGBgVGbJ5cGdzQpkTiz3+HUywLF0+oyDC2zYy96XIA2Vq+bXSUiodNpx8UQFTIzNioC6Tk+0tvs3oLsoXGpsRM+gKjANiF1HsvilIelB1xcLlVCHaS9aOCqfX9qE78YeyRmjHfm/Zmbow0QIMdLeSX8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169717; c=relaxed/simple;
	bh=nuMYLWsXSkVj59xCivvGswe2XeIr4HgV4fiUDKr9Amk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NlbVWa6PSGd7hj4UFGUM/RpG+1cR+w3MMBlBh3gikuVWpJQYN0kgZ10HFwzkXO6aNrZ+M+/JykyOOKg4273rntpYsToodgOraC1USQAP2edw1KRey2XSSJziN90wCzcsAXxars7b90k7lRfGp+S59G6tzSstcsA8hRE0CXTGWkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=prkYZVcs; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="prkYZVcs"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FD251516;
	Fri, 16 Oct 2026 09:55:10 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4824D3F7B4;
	Fri, 16 Oct 2026 09:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169713; bh=nuMYLWsXSkVj59xCivvGswe2XeIr4HgV4fiUDKr9Amk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=prkYZVcsGewFBMtpbCXuSyCClwdZ8guDXkRa1jd9jRckR3nCeBP/BaLl4Ws1K7YxP
	 NHy0eBgDm60RCdpGSCshxoK79CnzYP9QBcnVDYTmjYJkpzuFnW6NGF0NBSQ9n9tXAy
	 5Dq32tnL6O4vz3u4glw+YbT8tNPysiiFwPjT0vVU=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:54:59 +0100
Subject: [PATCH v2 01/23] arm64/sysreg: Define TRBSR_EL1.EC event classes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-1-3f57cf3199b1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=1134;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=nuMYLWsXSkVj59xCivvGswe2XeIr4HgV4fiUDKr9Amk=;
 b=pqsdx0G+FRiKYCNN5GLVRb+kDXvwgJ+qMyyx2cmgePesg3gnlBt+ZfzIT3fy/xnvMYmRbgYUy
 dEnIPBkMcWEDwPwq0faa3+0CbbY4s2fd1xe3LhPu9/68pCUywcpV7N2
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

TRBSR_EL1.EC identifies the cause of a trace buffer management event,
but the sysreg description does not name its architected values. Define
the five encodings as an unsigned enum so TRBE status handling can
refer to each cause by name.

The values cover other events, Granule Protection Check faults,
implementation-defined events, and stage 1 and stage 2 Data Aborts on
writes to the trace buffer, as specified by Arm ARM (ARM DDI 0487 M.c).

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 arch/arm64/tools/sysreg | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 94bf065c8ac71f20f482c91a5147cb6e001dfba2..f68c23dd4e83ee4d00610e097d9188d3a2c9ed15 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -5834,7 +5834,13 @@ EndSysreg
 Sysreg	TRBSR_EL1	3	0	9	11	3
 Res0	63:56
 Field	55:32	MSS2
-Field	31:26	EC
+UnsignedEnum	31:26	EC
+	0b000000	OTHER
+	0b011110	FAULT_GPC
+	0b011111	IMP_DEF
+	0b100100	FAULT_WRITE_S1
+	0b100101	FAULT_WRITE_S2
+EndEnum
 Res0	25:24
 Field	23	DAT
 Field	22	IRQ

-- 
2.34.1

