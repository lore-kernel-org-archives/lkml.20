Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0ACF54938A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790082793; cv=none; b=NUYnmhOPZ/VE0NNbzj+JnFCvi3e6QTSVr1nR7jXFtdAcMO9kzYbpmgBAiUsGhcATE+4vfddLPQIjz7/se66sR/1eJUCqQgkDo67xUircwJSMBV4eUPvx64GhpgH7d1yTM8N7g2SOOMGx+ol3pt0zn91KbHThAQB9moRGlvDl2c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790082793; c=relaxed/simple;
	bh=fG07lfgn52DXa6FnO9p/78Jx4+Rv4v4pJq3fW36XdgY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MbHlniqELW7RlT5QpCLuMK+/5lMgwt9A7W9tQDttMmW0ViRUv9HrhDa8DIXWRklM0hZMEgJnOXDIYSffpRRCNO1Kuq6brlqxX6tMnJEq+DbqLag3bor2jslPSvWWqulPb9C9jA9R5fMRQrx8lqkpNEP5xVHjANyic/rl714Q1UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K2rRdRFp; arc=none smtp.client-ip=209.85.218.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K2rRdRFp"
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c294ae16988so506266866b.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790082788; x=1790687588; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T/o0bec9X3I7+VNchlVkHN6BCB/ZUzPviX5kSqQ8ND0=;
        b=K2rRdRFpfJoXM5FiqjqhYO1zRKbOHYxR53yikbYy0VraYBTBy0bmDmirpj71z2CTOq
         5jjm70K/OWwvLBYyHMc7lf8ZGpVlf6LSMpZN4YPbrU9Vt/bIfQfRHAiovpIBk+u7kNl1
         C23G0NClhGfMsbPSMWMLpOTP36rTEfFufA2QfKRYfqVkcb+z2V1Lcusdk+MKAbQEoM0M
         2Zhi00ls+EiPX2yZD3OTfS+4Hfy6dXlDoaisbFDstE/KMgvruXYATRxZrPx0d+oVtL2B
         3iPnIcpfzjMC9XGlrCgIYJxFVX8DspfnlkeXoRG8Cl8X1ncQU/i1O7nymhHHqXj6c73h
         taDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082788; x=1790687588;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T/o0bec9X3I7+VNchlVkHN6BCB/ZUzPviX5kSqQ8ND0=;
        b=pzxHfVX/cAlB9qGDJsCQkjqYqJZ327iigHn2WZX/gCWdNBVT3jXjH8B6i1bf8Tq/rO
         92yVIMZdHKOcvzvxot/9YEypj3/Sd8VztazDCSMycchEl2fUJGHNZgfCBp9oDqVP/u8D
         w6Vz6nFqvy2+f3ZrjXbablLFV3MLZSqB8kOvo6zSlfGF43RzPcfB79LV8WsKXJIrBw/i
         AQb1/SjFsnt9kUMpBaA2iubiP6ePMhhuaj53LM6xw5puu1uVcfI2ktSkAhke+RxA9JCq
         gQe3Rz9oCrHJxbcmnleW8jc/SZ48oDg0BNgkGtmGpswEWqzCZt/Ib6MR3xYvFWGkB9Qf
         cUUA==
X-Forwarded-Encrypted: i=1; AKwUvBz0/fl/q22Gk+sOJwqRJ04jHWBK3QKH4ZjNBWSmeXZIFImav1J3e/s4ykv+rOXhZvVRdyM0d/HJF6iQupY=@vger.kernel.org
X-Gm-Message-State: AFuF++nhDZXrTTRuHT4Lknc3D3rRhN8sz42amm/WJ/WbHnRH1o6f9VfZ
	paFQTR2pxdlmG9mTcDULzpyaJykPr/+x4M9ew4ynP2+40cSs1gHlSmSXAwMFfX3YoV8AKOIw25s
	EM4bJS3HPAwREkA==
X-Received: from ejcr14.prod.google.com ([2002:a17:906:280e:b0:c29:770e:1128])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:a909:b0:c29:3838:dd5e with SMTP id a640c23a62f3a-c2a15e3d384mr1179040166b.40.1790082787507;
 Tue, 22 Sep 2026 06:13:07 -0700 (PDT)
Date: Tue, 22 Sep 2026 13:12:37 +0000
In-Reply-To: <20260922131259.2975334-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260922131259.2975334-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922131259.2975334-5-smostafa@google.com>
Subject: [PATCH v8 04/25] iommu/arm-smmu-v3: Move IDR parsing to common functions
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	sebastianene@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

Move parsing of IDRs to functions so that it can be re-used
from the hypervisor.

As the new functions operate on structs from both the hypervisor
and the kernel which would be different, we rely on the compilation
unit to having ARM_SMMU_OBJ point to the correct struct; some
best-effort static asserts were added .

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/Makefile        |   2 +-
 .../arm/arm-smmu-v3/arm-smmu-v3-common-lib.c  | 176 +++++++++++++++++
 .../arm/arm-smmu-v3/arm-smmu-v3-common-lib.h  |  31 +++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 179 ++----------------
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |   6 +
 5 files changed, 228 insertions(+), 166 deletions(-)
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.c
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.h

diff --git a/drivers/iommu/arm/arm-smmu-v3/Makefile b/drivers/iommu/arm/arm-smmu-v3/Makefile
index 493a659cc66b..c9ce392e6d31 100644
--- a/drivers/iommu/arm/arm-smmu-v3/Makefile
+++ b/drivers/iommu/arm/arm-smmu-v3/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_ARM_SMMU_V3) += arm_smmu_v3.o
-arm_smmu_v3-y := arm-smmu-v3.o
+arm_smmu_v3-y := arm-smmu-v3.o arm-smmu-v3-common-lib.o
 arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_IOMMUFD) += arm-smmu-v3-iommufd.o
 arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_SVA) += arm-smmu-v3-sva.o
 arm_smmu_v3-$(CONFIG_TEGRA241_CMDQV) += tegra241-cmdqv.o
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.c
new file mode 100644
index 000000000000..a341974e7aaf
--- /dev/null
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.c
@@ -0,0 +1,176 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2015 ARM Limited
+ * Arm SMMUv3 driver functions shared with hypervisor.
+ */
+
+#include "arm-smmu-v3.h"
+#include "arm-smmu-v3-common-lib.h"
+
+void arm_smmu_device_iidr_probe(ARM_SMMU_OBJ *smmu)
+{
+	u32 reg;
+	unsigned int implementer, productid, variant, revision;
+
+	reg = readl_relaxed(smmu->base + ARM_SMMU_IIDR);
+	implementer = FIELD_GET(IIDR_IMPLEMENTER, reg);
+	productid = FIELD_GET(IIDR_PRODUCTID, reg);
+	variant = FIELD_GET(IIDR_VARIANT, reg);
+	revision = FIELD_GET(IIDR_REVISION, reg);
+
+	switch (implementer) {
+	case IIDR_IMPLEMENTER_ARM:
+		switch (productid) {
+		case IIDR_PRODUCTID_ARM_MMU_600:
+			/* Arm erratum 1076982 */
+			if (variant == 0 && revision <= 2)
+				smmu->features &= ~ARM_SMMU_FEAT_SEV;
+			/* Arm erratum 1209401 */
+			if (variant < 2)
+				smmu->features &= ~ARM_SMMU_FEAT_NESTING;
+			break;
+		case IIDR_PRODUCTID_ARM_MMU_700:
+			/* Many errata... */
+			smmu->features &= ~ARM_SMMU_FEAT_BTM;
+			if (variant < 1 || revision < 1) {
+				/* Arm erratum 2812531 */
+				smmu->options |= ARM_SMMU_OPT_CMDQ_FORCE_SYNC;
+				/* Arm errata 2268618, 2812531 */
+				smmu->features &= ~ARM_SMMU_FEAT_NESTING;
+			}
+			break;
+		case IIDR_PRODUCTID_ARM_MMU_L1:
+		case IIDR_PRODUCTID_ARM_MMU_S3:
+			/* Arm errata 3878312/3995052 */
+			smmu->features &= ~ARM_SMMU_FEAT_BTM;
+			break;
+		}
+		break;
+	}
+}
+
+u32 arm_smmu_idr0_probe(ARM_SMMU_OBJ *smmu)
+{
+	u32 reg = readl_relaxed(smmu->base + ARM_SMMU_IDR0);
+
+	/* 2-level structures */
+	if (FIELD_GET(IDR0_ST_LVL, reg) == IDR0_ST_LVL_2LVL)
+		smmu->features |= ARM_SMMU_FEAT_2_LVL_STRTAB;
+
+	if (reg & IDR0_CD2L)
+		smmu->features |= ARM_SMMU_FEAT_2_LVL_CDTAB;
+
+	/*
+	 * Translation table endianness.
+	 * We currently require the same endianness as the CPU, but this
+	 * could be changed later by adding a new IO_PGTABLE_QUIRK.
+	 */
+	switch (FIELD_GET(IDR0_TTENDIAN, reg)) {
+	case IDR0_TTENDIAN_MIXED:
+		smmu->features |= ARM_SMMU_FEAT_TT_LE | ARM_SMMU_FEAT_TT_BE;
+		break;
+#ifdef __BIG_ENDIAN
+	case IDR0_TTENDIAN_BE:
+		smmu->features |= ARM_SMMU_FEAT_TT_BE;
+		break;
+#else
+	case IDR0_TTENDIAN_LE:
+		smmu->features |= ARM_SMMU_FEAT_TT_LE;
+		break;
+#endif
+	}
+
+	/* Boolean feature flags */
+	if (IS_ENABLED(CONFIG_PCI_PRI) && reg & IDR0_PRI)
+		smmu->features |= ARM_SMMU_FEAT_PRI;
+
+	if (IS_ENABLED(CONFIG_PCI_ATS) && reg & IDR0_ATS)
+		smmu->features |= ARM_SMMU_FEAT_ATS;
+
+	if (reg & IDR0_SEV)
+		smmu->features |= ARM_SMMU_FEAT_SEV;
+
+	if (reg & IDR0_MSI)
+		smmu->features |= ARM_SMMU_FEAT_MSI;
+
+	if (reg & IDR0_HYP)
+		smmu->features |= ARM_SMMU_FEAT_HYP;
+
+	switch (FIELD_GET(IDR0_STALL_MODEL, reg)) {
+	case IDR0_STALL_MODEL_FORCE:
+		smmu->features |= ARM_SMMU_FEAT_STALL_FORCE;
+		fallthrough;
+	case IDR0_STALL_MODEL_STALL:
+		smmu->features |= ARM_SMMU_FEAT_STALLS;
+	}
+
+	if (reg & IDR0_S1P)
+		smmu->features |= ARM_SMMU_FEAT_TRANS_S1;
+
+	if (reg & IDR0_S2P)
+		smmu->features |= ARM_SMMU_FEAT_TRANS_S2;
+
+	if ((smmu->features & ARM_SMMU_FEAT_TRANS_S1) &&
+	    (smmu->features & ARM_SMMU_FEAT_TRANS_S2))
+		smmu->features |= ARM_SMMU_FEAT_NESTING;
+
+	return reg;
+}
+
+void arm_smmu_idr3_probe(ARM_SMMU_OBJ *smmu)
+{
+	u32 reg = readl_relaxed(smmu->base + ARM_SMMU_IDR3);
+
+	if (FIELD_GET(IDR3_RIL, reg))
+		smmu->features |= ARM_SMMU_FEAT_RANGE_INV;
+	if (FIELD_GET(IDR3_FWB, reg))
+		smmu->features |= ARM_SMMU_FEAT_S2FWB;
+	if (FIELD_GET(IDR3_BBM, reg) == 2)
+		smmu->features |= ARM_SMMU_FEAT_BBML2;
+}
+
+u32 arm_smmu_idr5_probe(ARM_SMMU_OBJ *smmu)
+{
+	u32 reg = readl_relaxed(smmu->base + ARM_SMMU_IDR5);
+
+	if (reg & IDR5_DS)
+		smmu->features |= ARM_SMMU_FEAT_DS;
+
+	if (reg & IDR5_GRAN64K)
+		smmu->pgsize_bitmap |= SZ_64K | SZ_512M;
+	if (reg & IDR5_GRAN16K)
+		smmu->pgsize_bitmap |= SZ_16K | SZ_32M;
+	if (reg & IDR5_GRAN4K)
+		smmu->pgsize_bitmap |= SZ_4K | SZ_2M | SZ_1G;
+
+	/* Input address size */
+	if (FIELD_GET(IDR5_VAX, reg) == IDR5_VAX_52_BIT)
+		smmu->features |= ARM_SMMU_FEAT_VAX;
+
+	switch (FIELD_GET(IDR5_OAS, reg)) {
+	case IDR5_OAS_32_BIT:
+		smmu->oas = 32;
+		break;
+	case IDR5_OAS_36_BIT:
+		smmu->oas = 36;
+		break;
+	case IDR5_OAS_40_BIT:
+		smmu->oas = 40;
+		break;
+	case IDR5_OAS_42_BIT:
+		smmu->oas = 42;
+		break;
+	case IDR5_OAS_44_BIT:
+		smmu->oas = 44;
+		break;
+	case IDR5_OAS_48_BIT:
+		smmu->oas = 48;
+		break;
+	case IDR5_OAS_52_BIT:
+		smmu->oas = 52;
+		smmu->pgsize_bitmap |= 1ULL << 42; /* 4TB */
+		break;
+	}
+
+	return reg;
+}
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.h
new file mode 100644
index 000000000000..e736b6a8c78c
--- /dev/null
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ARM_SMMU_V3_COMMON_LIB_H
+#define __ARM_SMMU_V3_COMMON_LIB_H
+
+#include <linux/build_bug.h>
+#include <linux/compiler_types.h>
+#include <linux/kernel.h>
+
+/*
+ * The IDR probe functions are used by the kernel and the
+ * hypervisor drivers where ARM_SMMU_OBJ might be defined
+ * differently.
+ * Ensure fields used by them are defined and has the correct
+ * types.
+ */
+#ifndef __KVM_NVHE_HYPERVISOR__
+typedef struct arm_smmu_device ARM_SMMU_OBJ;
+#endif
+
+static_assert(__same_type(typeof_member(ARM_SMMU_OBJ, features), u32));
+static_assert(__same_type(typeof_member(ARM_SMMU_OBJ, options), u32));
+static_assert(__same_type(typeof_member(ARM_SMMU_OBJ, oas), unsigned long));
+static_assert(__same_type(typeof_member(ARM_SMMU_OBJ, pgsize_bitmap), unsigned long));
+static_assert(__same_type(typeof_member(ARM_SMMU_OBJ, base), void __iomem *));
+
+void arm_smmu_device_iidr_probe(ARM_SMMU_OBJ *smmu);
+u32 arm_smmu_idr0_probe(ARM_SMMU_OBJ *smmu);
+void arm_smmu_idr3_probe(ARM_SMMU_OBJ *smmu);
+u32 arm_smmu_idr5_probe(ARM_SMMU_OBJ *smmu);
+
+#endif /* __ARM_SMMU_V3_COMMON_LIB_H */
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 2e54d1ba2566..c4c652431ee0 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -33,6 +33,7 @@
 #include <uapi/linux/iommufd.h>
 
 #include "arm-smmu-v3.h"
+#include "arm-smmu-v3-common-lib.h"
 #include "../../dma-iommu.h"
 
 static bool disable_msipolling;
@@ -4907,54 +4908,6 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 	return 0;
 }
 
-#define IIDR_IMPLEMENTER_ARM		0x43b
-#define IIDR_PRODUCTID_ARM_MMU_600	0x483
-#define IIDR_PRODUCTID_ARM_MMU_700	0x487
-#define IIDR_PRODUCTID_ARM_MMU_L1	0x48a
-#define IIDR_PRODUCTID_ARM_MMU_S3	0x498
-
-static void arm_smmu_device_iidr_probe(struct arm_smmu_device *smmu)
-{
-	u32 reg;
-	unsigned int implementer, productid, variant, revision;
-
-	reg = readl_relaxed(smmu->base + ARM_SMMU_IIDR);
-	implementer = FIELD_GET(IIDR_IMPLEMENTER, reg);
-	productid = FIELD_GET(IIDR_PRODUCTID, reg);
-	variant = FIELD_GET(IIDR_VARIANT, reg);
-	revision = FIELD_GET(IIDR_REVISION, reg);
-
-	switch (implementer) {
-	case IIDR_IMPLEMENTER_ARM:
-		switch (productid) {
-		case IIDR_PRODUCTID_ARM_MMU_600:
-			/* Arm erratum 1076982 */
-			if (variant == 0 && revision <= 2)
-				smmu->features &= ~ARM_SMMU_FEAT_SEV;
-			/* Arm erratum 1209401 */
-			if (variant < 2)
-				smmu->features &= ~ARM_SMMU_FEAT_NESTING;
-			break;
-		case IIDR_PRODUCTID_ARM_MMU_700:
-			/* Many errata... */
-			smmu->features &= ~ARM_SMMU_FEAT_BTM;
-			if (variant < 1 || revision < 1) {
-				/* Arm erratum 2812531 */
-				smmu->options |= ARM_SMMU_OPT_CMDQ_FORCE_SYNC;
-				/* Arm errata 2268618, 2812531 */
-				smmu->features &= ~ARM_SMMU_FEAT_NESTING;
-			}
-			break;
-		case IIDR_PRODUCTID_ARM_MMU_L1:
-		case IIDR_PRODUCTID_ARM_MMU_S3:
-			/* Arm errata 3878312/3995052 */
-			smmu->features &= ~ARM_SMMU_FEAT_BTM;
-			break;
-		}
-		break;
-	}
-}
-
 static void arm_smmu_get_httu(struct arm_smmu_device *smmu, u32 reg)
 {
 	u32 fw_features = smmu->features & (ARM_SMMU_FEAT_HA | ARM_SMMU_FEAT_HD |
@@ -4987,59 +4940,18 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 	bool coherent = smmu->features & ARM_SMMU_FEAT_COHERENCY;
 
 	/* IDR0 */
-	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR0);
-
-	/* 2-level structures */
-	if (FIELD_GET(IDR0_ST_LVL, reg) == IDR0_ST_LVL_2LVL)
-		smmu->features |= ARM_SMMU_FEAT_2_LVL_STRTAB;
-
-	if (reg & IDR0_CD2L)
-		smmu->features |= ARM_SMMU_FEAT_2_LVL_CDTAB;
-
-	/*
-	 * Translation table endianness.
-	 * We currently require the same endianness as the CPU, but this
-	 * could be changed later by adding a new IO_PGTABLE_QUIRK.
-	 */
-	switch (FIELD_GET(IDR0_TTENDIAN, reg)) {
-	case IDR0_TTENDIAN_MIXED:
-		smmu->features |= ARM_SMMU_FEAT_TT_LE | ARM_SMMU_FEAT_TT_BE;
-		break;
-#ifdef __BIG_ENDIAN
-	case IDR0_TTENDIAN_BE:
-		smmu->features |= ARM_SMMU_FEAT_TT_BE;
-		break;
-#else
-	case IDR0_TTENDIAN_LE:
-		smmu->features |= ARM_SMMU_FEAT_TT_LE;
-		break;
-#endif
-	default:
+	reg = arm_smmu_idr0_probe(smmu);
+	if (!(smmu->features & (ARM_SMMU_FEAT_TT_LE | ARM_SMMU_FEAT_TT_BE))) {
 		dev_err(smmu->dev, "unknown/unsupported TT endianness!\n");
 		return -ENXIO;
 	}
+	if (coherent && !disable_msipolling &&
+	    smmu->features & ARM_SMMU_FEAT_MSI)
+		smmu->options |= ARM_SMMU_OPT_MSIPOLL;
 
-	/* Boolean feature flags */
-	if (IS_ENABLED(CONFIG_PCI_PRI) && reg & IDR0_PRI)
-		smmu->features |= ARM_SMMU_FEAT_PRI;
-
-	if (IS_ENABLED(CONFIG_PCI_ATS) && reg & IDR0_ATS)
-		smmu->features |= ARM_SMMU_FEAT_ATS;
-
-	if (reg & IDR0_SEV)
-		smmu->features |= ARM_SMMU_FEAT_SEV;
-
-	if (reg & IDR0_MSI) {
-		smmu->features |= ARM_SMMU_FEAT_MSI;
-		if (coherent && !disable_msipolling)
-			smmu->options |= ARM_SMMU_OPT_MSIPOLL;
-	}
-
-	if (reg & IDR0_HYP) {
-		smmu->features |= ARM_SMMU_FEAT_HYP;
-		if (cpus_have_cap(ARM64_HAS_VIRT_HOST_EXTN))
-			smmu->features |= ARM_SMMU_FEAT_E2H;
-	}
+	if (smmu->features & ARM_SMMU_FEAT_HYP &&
+	    cpus_have_cap(ARM64_HAS_VIRT_HOST_EXTN))
+		smmu->features |= ARM_SMMU_FEAT_E2H;
 
 	arm_smmu_get_httu(smmu, reg);
 
@@ -5051,21 +4963,7 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 		dev_warn(smmu->dev, "IDR0.COHACC overridden by FW configuration (%s)\n",
 			 str_true_false(coherent));
 
-	switch (FIELD_GET(IDR0_STALL_MODEL, reg)) {
-	case IDR0_STALL_MODEL_FORCE:
-		smmu->features |= ARM_SMMU_FEAT_STALL_FORCE;
-		fallthrough;
-	case IDR0_STALL_MODEL_STALL:
-		smmu->features |= ARM_SMMU_FEAT_STALLS;
-	}
-
-	if (reg & IDR0_S1P)
-		smmu->features |= ARM_SMMU_FEAT_TRANS_S1;
-
-	if (reg & IDR0_S2P)
-		smmu->features |= ARM_SMMU_FEAT_TRANS_S2;
-
-	if (!(reg & (IDR0_S1P | IDR0_S2P))) {
+	if (!(smmu->features & (ARM_SMMU_FEAT_TRANS_S1 | ARM_SMMU_FEAT_TRANS_S2))) {
 		dev_err(smmu->dev, "no translation support!\n");
 		return -ENXIO;
 	}
@@ -5123,62 +5021,17 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 		smmu->features &= ~ARM_SMMU_FEAT_2_LVL_STRTAB;
 
 	/* IDR3 */
-	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR3);
-	if (FIELD_GET(IDR3_RIL, reg))
-		smmu->features |= ARM_SMMU_FEAT_RANGE_INV;
-	if (FIELD_GET(IDR3_FWB, reg))
-		smmu->features |= ARM_SMMU_FEAT_S2FWB;
-
-	if (FIELD_GET(IDR3_BBM, reg) == 2)
-		smmu->features |= ARM_SMMU_FEAT_BBML2;
+	arm_smmu_idr3_probe(smmu);
 
 	/* IDR5 */
-	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR5);
+	reg = arm_smmu_idr5_probe(smmu);
 
 	/* Maximum number of outstanding stalls */
 	smmu->evtq.max_stalls = FIELD_GET(IDR5_STALL_MAX, reg);
 
-	if (reg & IDR5_DS)
-		smmu->features |= ARM_SMMU_FEAT_DS;
-
-	/* Page sizes */
-	if (reg & IDR5_GRAN64K)
-		smmu->pgsize_bitmap |= SZ_64K | SZ_512M;
-	if (reg & IDR5_GRAN16K)
-		smmu->pgsize_bitmap |= SZ_16K | SZ_32M;
-	if (reg & IDR5_GRAN4K)
-		smmu->pgsize_bitmap |= SZ_4K | SZ_2M | SZ_1G;
-
-	/* Input address size */
-	if (FIELD_GET(IDR5_VAX, reg) == IDR5_VAX_52_BIT)
-		smmu->features |= ARM_SMMU_FEAT_VAX;
-
-	/* Output address size */
-	switch (FIELD_GET(IDR5_OAS, reg)) {
-	case IDR5_OAS_32_BIT:
-		smmu->oas = 32;
-		break;
-	case IDR5_OAS_36_BIT:
-		smmu->oas = 36;
-		break;
-	case IDR5_OAS_40_BIT:
-		smmu->oas = 40;
-		break;
-	case IDR5_OAS_42_BIT:
-		smmu->oas = 42;
-		break;
-	case IDR5_OAS_44_BIT:
-		smmu->oas = 44;
-		break;
-	case IDR5_OAS_52_BIT:
-		smmu->oas = 52;
-		smmu->pgsize_bitmap |= 1ULL << 42; /* 4TB */
-		break;
-	default:
+	if (!smmu->oas) {
 		dev_info(smmu->dev,
-			"unknown output address size. Truncating to 48-bit\n");
-		fallthrough;
-	case IDR5_OAS_48_BIT:
+			 "unknown output address size. Truncating to 48-bit\n");
 		smmu->oas = 48;
 	}
 
@@ -5187,10 +5040,6 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 		dev_warn(smmu->dev,
 			 "failed to set DMA mask for table walker\n");
 
-	if ((smmu->features & ARM_SMMU_FEAT_TRANS_S1) &&
-	    (smmu->features & ARM_SMMU_FEAT_TRANS_S2))
-		smmu->features |= ARM_SMMU_FEAT_NESTING;
-
 	arm_smmu_device_iidr_probe(smmu);
 
 	if (arm_smmu_sva_supported(smmu))
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index f3e80d103ba1..d5963a01452f 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -86,6 +86,12 @@ struct arm_vsmmu;
 #define IIDR_REVISION			GENMASK(15, 12)
 #define IIDR_IMPLEMENTER		GENMASK(11, 0)
 
+#define IIDR_IMPLEMENTER_ARM		0x43b
+#define IIDR_PRODUCTID_ARM_MMU_600	0x483
+#define IIDR_PRODUCTID_ARM_MMU_700	0x487
+#define IIDR_PRODUCTID_ARM_MMU_L1	0x48a
+#define IIDR_PRODUCTID_ARM_MMU_S3	0x498
+
 #define ARM_SMMU_AIDR			0x1C
 
 #define ARM_SMMU_CR0			0x20
-- 
2.55.0.1082.g2b9226bbc0-goog

