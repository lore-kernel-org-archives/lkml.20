Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.207.212.86
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793194236;
	b=Y3JjpZ4x2OgKxIkBR+svBjV5l9GYif8BC7TgmNOZv8/hvytXx8D00fgFyEc6KDDAv63x
	 bV7wMqrLIZ7FbHi2l5e9PV3Xx7S3rSD7Q/91sNAYUeLDWLnmPqwQF5Ep2hH6Q3Oma3hWV
	 FQUcwnKvBspWgIY0c3A3zfsAZdX/8aHnny9yXGXVaVri2mcohF/NDZUnjwJdXDH7roU0t
	 Pmr6TYjU6aYo6+X4HYFJ6Ccodw/8NgIWuKqvd5eIpm9DQRbpa0x+4RvvdiCxCT26KsGKt
	 NWh907Z5lKkbwo3VySJp7rpQMQnFChW6SPAg/wmUjne8xyp6NbF83Z76MPxhhxaJzww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793194236;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:CC:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Originating-IP:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info;
	bh=kWH4kqMA2A8aiSQUqCfbxJ5YWjjJXlG3eJSHCgnDOcI=;
	b=KENnq6vzfwFbAdnA43xpiDlBAiOnDKIhzrc5oxpZiFT9ylp4MHeJBqPEYa+epHRNKsGt
	 BMPMklNCZPV6Ul1UNJfwNPgaf0vjz5koC6FMjEzVL4xu3K3fwTR+dzKJhovE0VFZDkdgL
	 NT4KdoztzMtbbPNC8zQvE5Xf+VDy0Akn1KLzkKbT8WPG20XHpnF4iBds8DIdtKUD4Lf+K
	 8XumzOLXMY1dEN8Xg2N1Sk8hsXneCEj3s61Da3JZSwDdTaAfUIsVcRd75aOn63SgDmFvq
	 0IifXkOKZJslk2qJvch0/051xa+3uJLvKu5SNqlRymnyRd9CHyGp+z8/OW01kzznIhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=imgtec.com;
	spf=pass smtp.mailfrom=imgtec.com;
	dkim=pass header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=AjGOvJJo;
	arc=none smtp.remote-ip=91.207.212.86
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE671606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:30:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE671606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=AjGOvJJo
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBfMHK1071312;
	Wed, 28 Oct 2026 13:30:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=k
	WH4kqMA2A8aiSQUqCfbxJ5YWjjJXlG3eJSHCgnDOcI=; b=AjGOvJJoNZAcY/uzl
	HNQTPGaYHA/7NLnrLwFYVeUfsbwPNbO0JHpYvonXTRuFLG4R5LmtSKGv5V60hMAS
	NHRj0MpwnWJW3F89UKvmp6zYi+hboPMWYbTqaq1SeJzcTgpinuOsoU1XG6SidVmn
	mG8L1miTR+RHhEPEU4SLlbNAb6/HRktsYclR0NzQ3K+lXqXfFHvKDikEUaAkzEGg
	nS8WhTEuiOOoMteEpiRCIhI1keTLPGdIwRn6CmCzTO2BPV0hoTQkDxSs3Vz6LXwT
	atDWXQO6bAQ/sHHp5VbGodQN9gVSD2v8cMreExb5nI09T/siqe1hUMKYFLSjFBP8
	8pa+g==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4hk4168gkd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Oct 2026 13:30:09 +0000 (GMT)
Received: from [127.0.1.1] (172.25.10.25) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 28 Oct
 2026 13:30:08 +0000
From: Alexandru Dadu <alexandru.dadu@imgtec.com>
Date: Wed, 28 Oct 2026 15:29:35 +0200
Subject: [PATCH 3/5] drm/imagination: Update RISC-V firmware header
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
Message-ID: <20261028-prep-meta-fw-arch-independent-v1-3-73e116f02172@imgtec.com>
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
 Dadu" <alexandru.dadu@imgtec.com>,
        Matt Coster <opensource@mtcoster.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793194203; l=4133;
 i=alexandru.dadu@imgtec.com; s=20260304; h=from:subject:message-id;
 bh=CzVnCrwojz31yUbIEpa0IDfIQGbjQOXKR+nFd2MUPLA=;
 b=5pUAWshV3FzC3ecWLTuF054N7wbPvhT15Zyq1Liq+BcG7yuMPyMcxaqL20ToArN6upC5jfBi2
 yzs7kA2OZp5DQgSCzJ0ao6wjSIx7e8Tk5a0PkSrp4Vn+uFDGyIJ+kfr
X-Developer-Key: i=alexandru.dadu@imgtec.com; a=ed25519;
 pk=FU07SyNrYGwhahqSxbWEuzyXlUh47xBXvLvOR7UA6+U=
X-Proofpoint-GUID: o14I_E_2Rh4_t7skdp8mNiGDrgS_T3KJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX7ycPMx08/Khi
 yTV7ofwy7iUKEN2DI41J2pv/enYuxOwTkKRPf6gdUNKWMtQBD8r4T8h/k+idhqDgb4hGqRrLJYJ
 bFbFmy7zRDo9eTAbvB7mvs11jPBnUIVSAa6PTbg2U86+g0XcaPyIqOqnV9fh7AO72GsXxMtPRI5
 JSMG6If3aEw0/CvAzQhexg/Fn8+Tg0TeSlXomh9XakQ7Hh9tckQbQaTW6ytzS2bISmI1zkEy974
 OxqvQMEfsgnYB1XCo7q/52EeCoeMxaskX4p7dp9ysMMV7UdMCdBXbHM5fnzx51E5Es5DfCAB+av
 mSBj+VV8dT3PYecjUHfHj+u4IwzDXzEulAkGrBtcTo0cNoSdZXLXUKHeKd1KMUUUBDII6mrV9AT
 tGutfuLErjL1gF1tGtwFXVIwB9x3zT8OGuMPbX28NPdJWupDgD3AMVQDcwkofBxd9Zxelvi7xba
 zJP8cYTqLvInm1OvO+g==
X-Authority-Analysis: v=2.4 cv=apQnmiZV c=1 sm=1 tr=0 ts=6ae1f8e2 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=1spURiKJc90A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=r_1tXGB3AAAA:8 a=EfI9ILzK087OCRd7xdYA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: o14I_E_2Rh4_t7skdp8mNiGDrgS_T3KJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX7/1aUtz+o24x
 YHs/D35gr6VrfaXCkbzfmXPocfgvkx376m+W6eb1G7nHtHvc+1rNHI0sc5tERjoIDhzi1qh5emN
 7Ln0QJCeYVXnX99MVcejH4SoMEvEtiA=

From: Alessio Belle <alessio.belle@imgtec.com>

Make RISC-V firmware header arch-independent. This header file contains
definitions common to all PowerVR architectures starting from Rogue, so
rename both the file and its contents to reflect this.
Add a _fw_ component to the filenames of risc-v internal firmware
headers to ensure that firmware-related files have the pvr_fw_ prefix.

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

