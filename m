Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.132.180.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793194238;
	b=LQBvysv+INZij+iSPspwITHkj3o7GqSxtL/QlWSEGH6B8fa9fUPMxuJR8tw3kYO1s/39
	 ydVa3Kik0VgVIZ2dUtepzJhK9A+1gBplG2Yx60wEtzEaAth5BZm9RKNEqd19UBPr3gM/z
	 DbWynXXQq3XC3hdjbRuq2LGry8IiPhEVSl37Nzr1DqOXeT3qcmoXRnFZIg4scq9OnPONX
	 /0aEf1n6sw6X1VcfmB+fCfESufArjxtMmxBFZ6os2Qe2tqdb+Jee/m0wgi5cqxHhfGhvp
	 PxwjHJ5GszOtrktpJNUgS0oP4EkYuB3a6KZPmfDZ+gZ90zzCj8yrnusOuHWNHGYg6vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793194238;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:CC:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Originating-IP:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID;
	bh=aIu6pEYpp53YfCiyYllM4lyrdWdbqBwyNFhZJ0QDrzY=;
	b=KEm4/igBp1ILIr9jbu40Ug5ojNVr62emALUG4kg/deMy5djFXDHXtNX/z/SBuSPXrzku
	 GUFl39rP7aBnKnlaQjts5weU3Lnj3GtbViXgjz9s4J9eXOaWNh/pB3ze2eBvziXlqNxpf
	 pFLmEt1059q5JT8w6zLefS5+JrI2EfUHwnso1HsXT7ugVU/NV60HpLkjORLt/YSTJ+ZGw
	 iQpotoiugD4jEqMO2k5GPGYtsRPrl8oJud5gg7fJf+KtGhWC6CNN7L+/wCjFJ9QC8XlbT
	 GMlcS3HDdPcfERuBZTerjkSVVcRoKLLVia68t5KAqR8WsBrUM4dTuk9XBdSbHMLqkIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=imgtec.com;
	spf=pass smtp.mailfrom=imgtec.com;
	dkim=pass header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b="s/2XS/wV";
	arc=none smtp.remote-ip=185.132.180.163
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FF3606A339
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:30:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80FF3606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=s/2XS/wV
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBfAnJ4125914;
	Wed, 28 Oct 2026 13:30:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=a
	Iu6pEYpp53YfCiyYllM4lyrdWdbqBwyNFhZJ0QDrzY=; b=s/2XS/wVt/cxrhAbq
	D3P9HqYb8RecY9fHo1knADrKI2hPDmpoXA2tkwht6bWJCVix9HAvp7nPPgZ8VtCe
	wUEFMgUG9Faerz3mnm4oIpN4z/MikWyt8w+GxM9h0i8IWkkeZ5NJulm4FORz1YNl
	DNBMAiLyqPPWF7kYvjiu9rv5fM1D5HskByty4af9f+Bq8cQ/9iOvJ+MfrMO3bWo9
	EZ8uG4zpE9KZCwTHgxhUsm9vZnmXTlErbS9MXTWS1J4buQfaVXvu39Xgf6SM4FXD
	/atAMPxk0VHUzHWqvdVt9d1+sKkyOFRmzBfCTYUrMlZlgBxRm2pdoi1FGPE/MBoL
	3AFfw==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4hk414ghyw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Oct 2026 13:30:08 +0000 (GMT)
Received: from [127.0.1.1] (172.25.10.25) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 28 Oct
 2026 13:30:06 +0000
From: Alexandru Dadu <alexandru.dadu@imgtec.com>
Date: Wed, 28 Oct 2026 15:29:34 +0200
Subject: [PATCH 2/5] drm/imagination: Limit access to the RISC-V firmware
 interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261028-prep-meta-fw-arch-independent-v1-2-73e116f02172@imgtec.com>
References: <20261028-prep-meta-fw-arch-independent-v1-0-73e116f02172@imgtec.com>
In-Reply-To: <20261028-prep-meta-fw-arch-independent-v1-0-73e116f02172@imgtec.com>
To: Alessio Belle <alessio.belle@imgtec.com>,
        Luigi Santivetti
	<luigi.santivetti@imgtec.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Paul Walmsley <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>
CC: <imagination@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Alexandru
 Dadu" <alexandru.dadu@imgtec.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793194203; l=2210;
 i=alexandru.dadu@imgtec.com; s=20260304; h=from:subject:message-id;
 bh=wDgtp6LBF/C29pe2CVlQTKRn+Z/Fia+UZ37qNopawhs=;
 b=/bKOQRF9rkngOQdeG3CDKdiekM7C24uG6CoYcadHpwRmuobhX/32gCAuVvwKEhStbL7FZ2zdi
 hoCZqihrRpAC5bWJHqtvqwcf/o9dKVoMrcLf0MvkfZAEpDK+f6UF8tD
X-Developer-Key: i=alexandru.dadu@imgtec.com; a=ed25519;
 pk=FU07SyNrYGwhahqSxbWEuzyXlUh47xBXvLvOR7UA6+U=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfXwShFzDxdpDfD
 Ohd4bHtfCipK9ht65jkgF5s0ezSsGSNBh+bY5eI6rMDwu4T6LZDdQRFumXkCmsx9fs3wIPuDvB/
 9J39In6Vv8S5vXTweGB/VQU6mNfTX3A=
X-Authority-Analysis: v=2.4 cv=AMk9Hd7f c=1 sm=1 tr=0 ts=6ae1f8e0 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=1spURiKJc90A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=xwwprR_ITuhyIuDbuUkA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: P3ASNRDYR1aOcin1eKsr1NFPjELLItOH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX2uBts+RUEpjm
 OYW+qxF5TNcMxbW+HtZbpcHeUIvCCgnRenBBvzPfCKO/dl/aCHG1ahup75Fbfwoa+Q6qyIZ9bp6
 lX34mBPvDU0TWlbuPw1UuZmrI/khvPAHEq0cgnnJIZg2wy8kDpsUZaSb8zb8xg7L1jlsSzBQHGc
 6xOwK57ZavXzlqx9kRaxpZYdzC1kMTuaQbcIzSpIKbC29WoKcVZYWCSIK00LITg3CPZMF+NNASJ
 KYd1cgHDNydnKEpQITMLTIyrtqoR/OD/CXyXx4GLMh0TpM/0/cMfzkqtaiJXGQsAtxBB5si/mRj
 iRLoL+C0jl6+YeD1az8jP6q1RhAC02DHF5T/a5bIqEF4Ssf+ygVIEdoQAyxVu/6hKX/A0QIFEWN
 fse929fhTCbx/HXMso2ZvoVWsAuUa9doW0UHZ1NnOfokVBOpU9J9eEXeNQILa5mtiMxQv+V0Rj3
 c1ug/zJHDx9dWyJD+eA==
X-Proofpoint-GUID: P3ASNRDYR1aOcin1eKsr1NFPjELLItOH

From: Alessio Belle <alessio.belle@imgtec.com>

- Rename the RISC-V firmware processor header adding an "internal"
  suffix.
- Add guard to the RISC-V firmware processor header to prevent
  accidental inclusion outside of the RISC-V firmware specific logic.

Signed-off-by: Alessio Belle <alessio.belle@imgtec.com>
Signed-off-by: Alexandru Dadu <alexandru.dadu@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_fw_riscv.c                     |  4 +++-
 .../{pvr_rogue_riscv.h => pvr_rogue_riscv_internal.h}          | 10 +++++++---
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_fw_riscv.c b/drivers/gpu/drm/imagination/pvr_fw_riscv.c
index cd84635bb88d..0d4dd45520a9 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_riscv.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_riscv.c
@@ -7,7 +7,9 @@
 #include "pvr_fw_mips.h"
 #include "pvr_gem.h"
 #include "pvr_rogue_cr_defs.h"
-#include "pvr_rogue_riscv.h"
+#define PVR_ROGUE_RISCV_INTERNAL_H_EXPLICIT_INCLUDE
+#include "pvr_rogue_riscv_internal.h"
+#undef PVR_ROGUE_RISCV_INTERNAL_H_EXPLICIT_INCLUDE
 #include "pvr_vm.h"
 
 #include <linux/compiler.h>
diff --git a/drivers/gpu/drm/imagination/pvr_rogue_riscv.h b/drivers/gpu/drm/imagination/pvr_rogue_riscv_internal.h
similarity index 81%
rename from drivers/gpu/drm/imagination/pvr_rogue_riscv.h
rename to drivers/gpu/drm/imagination/pvr_rogue_riscv_internal.h
index d971729e18a4..ba18c2a82205 100644
--- a/drivers/gpu/drm/imagination/pvr_rogue_riscv.h
+++ b/drivers/gpu/drm/imagination/pvr_rogue_riscv_internal.h
@@ -1,8 +1,12 @@
 /* SPDX-License-Identifier: GPL-2.0 OR MIT */
 /* Copyright (c) 2024 Imagination Technologies Ltd. */
 
-#ifndef PVR_ROGUE_RISCV_H
-#define PVR_ROGUE_RISCV_H
+#ifndef PVR_ROGUE_RISCV_INTERNAL_H
+#define PVR_ROGUE_RISCV_INTERNAL_H
+
+#ifndef PVR_ROGUE_RISCV_INTERNAL_H_EXPLICIT_INCLUDE
+#error This file may only be included if explicitly defined
+#endif
 
 #include "pvr_rogue_cr_defs.h"
 
@@ -36,4 +40,4 @@ enum rogue_riscvfw_region {
 
 #define ROGUE_RISCVFW_REGION_BASE(r) ((u32)(ROGUE_RISCV_REGION_##r) << ROGUE_RISCVFW_REGION_SHIFT)
 
-#endif /* PVR_ROGUE_RISCV_H */
+#endif /* PVR_ROGUE_RISCV_INTERNAL_H */

-- 
2.43.0

