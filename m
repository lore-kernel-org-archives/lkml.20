Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.207.212.86
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695070;
	b=iNKRnCS9eHVA9nJepRjRtNJu+31pH2MW88YqmZxvYG2Z3+/HaAiNqhXmzHNdMNaEs11W
	 a2TBocaiatzololOpau3xllPu/zdjLi1jm0rMz7QCPFnOnHCtmzy3sc058c7KwN/actU/
	 cB+YjPNUNPZAjYsg3aD7h0HPsB8xPiPNtF6SM4DsLRtBh7cMMq15PZDeGEcaC8F/yGWP6
	 C1FPRQDPXhDjbfaFeGohfcx0MYdTNC2HAPBaZcAKSHoHP6kheycuFy3AZygXyu/DgUlyA
	 UHQBLgotqABRUr/5h4vTw7D3RMJyuaaQtK6esgAg1px+085+9H7ya6P/npuXrih47dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695070;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:CC:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Originating-IP:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc;
	bh=aIu6pEYpp53YfCiyYllM4lyrdWdbqBwyNFhZJ0QDrzY=;
	b=aaRk1yXgZDoXJAudXsXHshQZsebx2TH6TD95WonDItCzKbCR6m24zE2WGpFeb8wSXGIr
	 Dg3a5Ib5Ljh0xkxLFVsglT7FmCN8zV11DzBD+kPgHA9M7TcnpMp45RJfLhnJbIOMa5YPY
	 FM4Z60oVD9H1rVWR54JzFV5ThYACG/k1oXRAlCsYzl4iZ6PfPt2Q8DsZk9PntoX/vEpLA
	 hCcG6sA0DjcUecemYyIXFs42edm8dQM72+xRcSkeamu9DDvPSV7FD9sHYMWOcqksA/r7+
	 7K4SzeB7SjfHHJFMRAbwFwHIjIPhWv6fatvpvIFYlOFmed5E8eOvh3fFwThOYGlYgVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=imgtec.com;
	spf=pass smtp.mailfrom=imgtec.com;
	dkim=pass header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=pAx46JpZ;
	arc=none smtp.remote-ip=91.207.212.86
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4FA606A94D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC4FA606A94D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=pAx46JpZ
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A37Pb293472577;
	Tue, 3 Nov 2026 08:36:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=a
	Iu6pEYpp53YfCiyYllM4lyrdWdbqBwyNFhZJ0QDrzY=; b=pAx46JpZrDqRu/evI
	Aq1MDV3s7qXci83vln0VfpLn86YkJxSdZk5HrL3S4IUdtPlNVFtRFbPOkRM5KLz2
	L/J882wXKhBZh6sT4BdkEhA74VTKhF1fJ8xpSffZnukqJ6nbk6c7ovUj+jxyug6R
	ag+TzyypwY4ageUGsgDGlxD0G8sJaD3oUEymlqfn1Lfqn+Q+rREEI4g5zYoIHdxN
	pgQYqf1fRnWlI/Jf95Z5B1ZjMYi1kjT5nh5WU9CHBXaoRMggw0n2fzClQe9NGezq
	TF8ny4FU0f7G941ktXWVbXZBWVdHqYABarOrkzKk3koKGCuciZCE5YHlWT8+H5wV
	9+AFw==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4hn7ft239c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Nov 2026 08:36:55 +0000 (GMT)
Received: from [127.0.1.1] (172.25.5.26) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 3 Nov
 2026 08:36:53 +0000
From: Alexandru Dadu <alexandru.dadu@imgtec.com>
Date: Tue, 3 Nov 2026 10:36:18 +0200
Subject: [PATCH v3 2/5] drm/imagination: Limit access to the RISC-V
 firmware interface
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
Message-ID: <20261103-prep-meta-fw-arch-independent-v3-2-563dbaf1b779@imgtec.com>
References: <20261103-prep-meta-fw-arch-independent-v3-0-563dbaf1b779@imgtec.com>
In-Reply-To: <20261103-prep-meta-fw-arch-independent-v3-0-563dbaf1b779@imgtec.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793695010; l=2210;
 i=alexandru.dadu@imgtec.com; s=20260304; h=from:subject:message-id;
 bh=wDgtp6LBF/C29pe2CVlQTKRn+Z/Fia+UZ37qNopawhs=;
 b=w+Gyv3TMuwx08RVtch0st92wmz/6eNI2KWeTPmwweMCdhYtrj340UsGsJhTiIPRV6BhUWady0
 OqGZzRkzTCKCbwOHmnSs4HYuLrR3CoEejAfUxvaO1BUJGUcUhhtFRyw
X-Developer-Key: i=alexandru.dadu@imgtec.com; a=ed25519;
 pk=FU07SyNrYGwhahqSxbWEuzyXlUh47xBXvLvOR7UA6+U=
X-Proofpoint-ORIG-GUID: mkaN-67E4oe6FEKjsKq0jtBvvKHKDx_v
X-Proofpoint-GUID: mkaN-67E4oe6FEKjsKq0jtBvvKHKDx_v
X-Authority-Analysis: v=2.4 cv=HaSB3SE8 c=1 sm=1 tr=0 ts=6ae99d27 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=h_3jC4m0AyQA:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=r_1tXGB3AAAA:8 a=xwwprR_ITuhyIuDbuUkA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzNCBTYWx0ZWRfX7XA1Fz5OQyaA
 /b/lKbyJaGC6WT29xFrwg87hyTMkU++GcLqs/0rDcWW3ybqYH/J+GnCKTOa/cDp6u7efZ9sIBYl
 lqO4sQcnQyNnOFlCTt5+OkQOToVlbBc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzNCBTYWx0ZWRfXwnLfLIbpGe8V
 sO8sen0vpRU/tKGfNMVZColhRT8stt2GN4uyw0yWq31crqPXMc8bXs8+agY/fvqq9Ddf1aOmk5h
 5sMsLDhK/rNqi2yo/snSplgpaw0qhIiqCcI4kWDILS8fLXWGt5+5VQV6xvQBo21ufmbuTwcEpuo
 BmkkNbjzDqm3TjJXvFuF+h0XpERdF21ZAi1XqM0AN37kqiC9R3WAJfAIE1xZNHQqWDQbUkJEXc0
 K4OxTFfzRmmNmO3gQohIVpJIh0ysJFBX4KPNe4Iml/Aj5ymkVZpShbiEiuU+m/yQo28QDMto9Ff
 wJrV1Pp9CMBgzA7MJfU0YIb5o5lsip5/OFxFBvQcLUA+81ZmQ5e/lBmPIORF2Cq++i/0HCbcQsC
 v4H8iG7dxSKuv122ssLciaeTMUksVArwz9XJaKUj7jTN0yWTqTkHglfnOiVKTOMIxYtp2SbNGWE
 R5N3lyq/2iX7Sqknx/g==

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

