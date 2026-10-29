Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.132.180.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793255421;
	b=QI6zKE7ROj5Rr58ipVbRezD8cm+Bp/WUoT8HuPVD5FcEqF3V6te+9wyrhgbW8A1tdhGB
	 20J7XfGqWWl2Zj30ekq7yLaiZXAgG9ShONbeKClSoVIgbV4tBsutbjkn4nW3bN8XsCoCJ
	 LLpqQbS9N2SYCPOKd1ySvMA+0Z8Apg2QdSVwIEztOA/NL8DqXq+6E6yeTV3SppHVME22c
	 qLSjgcN5rjTC/1biLBLIdgt3sSsHOnhO1kfiNvfP6UE7NnDg2l3OVjUccHU6xHpcAqkxe
	 ezjGqEYXmvGefaL0I/5cYgPqKJIT2+LaKth8UqC75eKyPZ5YxpOQI3WEJmhjzqz8IKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793255421;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:CC:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Originating-IP:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis;
	bh=Alre/IHPJ8k5mOkK/a+YYsD1HXKHoZakyw5kYUyBP90=;
	b=islRtIsJ0pCms+owpg+l4QCLB+p4j/GOBDkmLL4z8zB+a6nVsiNwU8kRmrdQhKxEVAUo
	 9rP9Fwn2DnO7PnWXYVlZp86BkauzyBG1vm+OSfIvMjoYoPFbNOLmzVxNgPdsVcvcprYrO
	 ay5JEXTw+jT25NdQBh7EMmC32xHVBd3u35DH5APBpTkYg0TqSHNzEjB6Uj34Hm0AdLiOv
	 X7DdBjU6xNbEUvJTK56KhhNO+Yi0jKT/zfJBpEr2eqnK6N5ilBtvL5IX8aac/6UFsM07p
	 h9UJfpgwLYIXmYlvY+E64uPAp6+E+uD5c8n0ceLElHtCVrFNSUhELITz9/lerqq6pZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=imgtec.com;
	spf=pass smtp.mailfrom=imgtec.com;
	dkim=pass header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b="fo4BAhF/";
	arc=none smtp.remote-ip=185.132.180.163
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4243A606A324
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4243A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=fo4BAhF/
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5qRTq1893761;
	Thu, 29 Oct 2026 06:29:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=A
	lre/IHPJ8k5mOkK/a+YYsD1HXKHoZakyw5kYUyBP90=; b=fo4BAhF/+ol0QHyHA
	HPAwoSPwgU6o0eBX/8d+071ye5qxAYSYTmQyDC/G/cmlf9qz/X9QNjPpt/GBXWQt
	YgFJm3kIRwxmBe85sbcKOpYIkaSDm1MM9lU+Jzkb3/xitf/kMecu4KVAdzOgmkfN
	8o5CEgaueHYkZRjheGDLAI8SpRqHOCf59PKiZhv1PaTbU8UY2rVlpcIvyBqwj72F
	uvdazxUbWmiOwBxAMyEM8nC96rG/kc+zwfHrNIC4AXfvKSYzcO31ToCuSM758Zu8
	ZnpoPurrOzhPJe3E0e9iHX0tdkdKb1rtznrVsRpCyHvCTSIcif2ZGrrMWX0EhvxM
	BV/fA==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4hkvbj85ap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Oct 2026 06:29:46 +0000 (GMT)
Received: from [127.0.1.1] (172.25.10.25) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 29 Oct
 2026 06:29:44 +0000
From: Alexandru Dadu <alexandru.dadu@imgtec.com>
Date: Thu, 29 Oct 2026 08:29:24 +0200
Subject: [PATCH v2 3/5] drm/imagination: Make the RISC-V firmware header
 arch-independent
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
Message-ID: <20261029-prep-meta-fw-arch-independent-v2-3-b9f5d69b7a52@imgtec.com>
References: <20261029-prep-meta-fw-arch-independent-v2-0-b9f5d69b7a52@imgtec.com>
In-Reply-To: <20261029-prep-meta-fw-arch-independent-v2-0-b9f5d69b7a52@imgtec.com>
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
 Dadu" <alexandru.dadu@imgtec.com>,
        Matt Coster <opensource@mtcoster.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793255380; l=3948;
 i=alexandru.dadu@imgtec.com; s=20260304; h=from:subject:message-id;
 bh=xaDxJsckcKXS2GV1K4jHcoAaZKs+PzJ4HMQyaTe7cq4=;
 b=gdBxhSWrYUfUk6D4vvSXzZHjpspY5u35sA3v6b0qe/2UbCSMPMGL8v6mXhI+LEfTF5ldMU0GB
 PnQOHL2tviXDMQHtiVjOEqHzv0csg0tGd5y9iNf2QZ4Ov0gEbWWTdTx
X-Developer-Key: i=alexandru.dadu@imgtec.com; a=ed25519;
 pk=FU07SyNrYGwhahqSxbWEuzyXlUh47xBXvLvOR7UA6+U=
X-Proofpoint-ORIG-GUID: U5Y97TanqLtKxgpku0U06jYpENhwIqmU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAyNCBTYWx0ZWRfXz2JxlHvToJNN
 1MIOBxkvqdgSbN9ChIr2WXB/CxH6xSpF4Zz9iX3mCrKXrzauF/Meu75EkVUVTBkXM0+rQAYqn1t
 WT7nKnqRsEFcM9aubXbv4JqRqN9tbmB3csDW6Wju45+Ixm7Gv9iaKfPgQ3yqbJIf73V7fuazhxC
 lHfXOjCL1jpmKMf/RD7H6JUHFo3IETU9rSWIdPuOcjTQqSRo5DUvr+BQyzQvnE4BksHWj5enzkO
 UpHBG6E5C5LQcWtEcBZ2ehw0Stwd4OWQNIcHJ+lsPWMeNSZR5qALA008YFWKU4XgDq9tcDGNZlN
 8RiWSzkbVboXnPFFnIgbonE21Uo990S4C1Zbf2WUIfnCkysj6+wgllrwjmCgbuKj+lZrYvoSwE1
 VW3qDK37D0ntoyNV4xt267PWbWo2DLJnLB4EiVVT5ewn1m4k3gsxIuc0fH4eGx03F+qbkcPgTeV
 E1ShoY3ZKMnWw0KO4lg==
X-Proofpoint-GUID: U5Y97TanqLtKxgpku0U06jYpENhwIqmU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAyNCBTYWx0ZWRfX1uPXXy8aNTe1
 VkK7ahY9OEeFhX3gfEuofHaKkNQfEZwtJTQXvC6pAkKNi77uqZEgcyeU1nvjRUqTigmjDkxAvD2
 8oJIH0y4gFAr+CHt/TxIbHhkm6woV+g=
X-Authority-Analysis: v=2.4 cv=NvdE4MdJ c=1 sm=1 tr=0 ts=6ae2e7da cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=1spURiKJc90A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=3lCh05eebIrLBntq_2wA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22

From: Alessio Belle <alessio.belle@imgtec.com>

This header file contains definitions common to all PowerVR
architectures starting from Rogue, so rename both the file and its
contents to reflect this.

Signed-off-by: Alessio Belle <alessio.belle@imgtec.com>
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
Signed-off-by: Alexandru Dadu <alexandru.dadu@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_fw_riscv.c         | 14 +++----
 .../gpu/drm/imagination/pvr_fw_riscv_internal.h    | 43 ++++++++++++++++++++++
 2 files changed, 50 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_fw_riscv.c b/drivers/gpu/drm/imagination/pvr_fw_riscv.c
index 0d4dd45520a9..2b24c40bc20f 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_riscv.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_riscv.c
@@ -6,10 +6,10 @@
 #include "pvr_fw_info.h"
 #include "pvr_fw_mips.h"
 #include "pvr_gem.h"
+#define PVR_FW_RISCV_INTERNAL_H_EXPLICIT_INCLUDE
+#include "pvr_fw_riscv_internal.h"
+#undef PVR_FW_RISCV_INTERNAL_H_EXPLICIT_INCLUDE
 #include "pvr_rogue_cr_defs.h"
-#define PVR_ROGUE_RISCV_INTERNAL_H_EXPLICIT_INCLUDE
-#include "pvr_rogue_riscv_internal.h"
-#undef PVR_ROGUE_RISCV_INTERNAL_H_EXPLICIT_INCLUDE
 #include "pvr_vm.h"
 
 #include <linux/compiler.h>
@@ -43,13 +43,13 @@ pvr_riscv_wrapper_init(struct pvr_device *pvr_dev)
 
 	pvr_cr_write64(pvr_dev,
 		       PVR_CR_REPEAT_X(ROGUE_CR_FWCORE_ADDR_REMAP_CONFIG,
-				       ROGUE_RISCV_REGION_BOOTLDR_CODE),
+				       PVR_RISCV_REGION_BOOTLDR_CODE),
 		       code_addr | common_opts |
 		       ROGUE_CR_FWCORE_ADDR_REMAP_CONFIGx_FETCH_EN_EN);
 
 	pvr_cr_write64(pvr_dev,
 		       PVR_CR_REPEAT_X(ROGUE_CR_FWCORE_ADDR_REMAP_CONFIG,
-				       ROGUE_RISCV_REGION_BOOTLDR_DATA),
+				       PVR_RISCV_REGION_BOOTLDR_DATA),
 		       data_addr | common_opts |
 		       ROGUE_CR_FWCORE_ADDR_REMAP_CONFIGx_LOAD_STORE_EN_EN);
 
@@ -132,9 +132,9 @@ pvr_riscv_get_fw_addr_with_offset(struct pvr_fw_object *fw_obj, u32 offset)
 
 	/* RISC-V cacheability is determined by address. */
 	if (fw_obj->gem->flags & PVR_BO_FW_FLAGS_DEVICE_UNCACHED)
-		fw_addr |= ROGUE_RISCVFW_REGION_BASE(SHARED_UNCACHED_DATA);
+		fw_addr |= PVR_RISCVFW_REGION_BASE(SHARED_UNCACHED_DATA);
 	else
-		fw_addr |= ROGUE_RISCVFW_REGION_BASE(SHARED_CACHED_DATA);
+		fw_addr |= PVR_RISCVFW_REGION_BASE(SHARED_CACHED_DATA);
 
 	return fw_addr;
 }
diff --git a/drivers/gpu/drm/imagination/pvr_fw_riscv_internal.h b/drivers/gpu/drm/imagination/pvr_fw_riscv_internal.h
new file mode 100644
index 000000000000..abcbb4ef06fe
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_fw_riscv_internal.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2024 Imagination Technologies Ltd. */
+
+#ifndef PVR_FW_RISCV_INTERNAL_H
+#define PVR_FW_RISCV_INTERNAL_H
+
+#ifndef PVR_FW_RISCV_INTERNAL_H_EXPLICIT_INCLUDE
+#error This file may only be included if explicitly defined
+#endif
+
+#include "pvr_rogue_cr_defs.h"
+
+#include <linux/bitops.h>
+#include <linux/sizes.h>
+#include <linux/types.h>
+
+#define PVR_RISCVFW_REGION_SIZE SZ_256M
+#define PVR_RISCVFW_REGION_SHIFT __ffs(PVR_RISCVFW_REGION_SIZE)
+
+enum pvr_riscvfw_region {
+	PVR_RISCV_REGION__RESERVED_0 = 0,
+	PVR_RISCV_REGION__RESERVED_1,
+	PVR_RISCV_REGION_SOCIF,
+	PVR_RISCV_REGION__RESERVED_3,
+	PVR_RISCV_REGION__RESERVED_4,
+	PVR_RISCV_REGION_BOOTLDR_DATA,
+	PVR_RISCV_REGION_SHARED_CACHED_DATA,
+	PVR_RISCV_REGION__RESERVED_7,
+	PVR_RISCV_REGION_COREMEM,
+	PVR_RISCV_REGION__RESERVED_9,
+	PVR_RISCV_REGION__RESERVED_A,
+	PVR_RISCV_REGION__RESERVED_B,
+	PVR_RISCV_REGION_BOOTLDR_CODE,
+	PVR_RISCV_REGION_SHARED_UNCACHED_DATA,
+	PVR_RISCV_REGION__RESERVED_E,
+	PVR_RISCV_REGION__RESERVED_F,
+
+	PVR_RISCV_REGION__COUNT,
+};
+
+#define PVR_RISCVFW_REGION_BASE(r) ((u32)(PVR_RISCV_REGION_##r) << PVR_RISCVFW_REGION_SHIFT)
+
+#endif /* PVR_FW_RISCV_INTERNAL_H */

-- 
2.43.0

