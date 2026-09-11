Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF95E486417
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 21:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789161678; cv=none; b=NV84PmVaFQT+X7ih1EMKUpjcfI6gSPtXq9jw/20U7dYO0fAyVh/k3M/KEYZ8tpY9Hoi7ftACdlLq5EKu6vv+BtQ4pqs2yDk+NMqZVmC2hFR+ptr9MRlqd6ceDEoU3jirC6eWnVIDkwLU7K891lqByIHQU4Guc0xsBtaE+KvV9g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789161678; c=relaxed/simple;
	bh=VB6oO/0/aP3anKWJoqBgbBJ4sY9p6fnK67zg5+eEZ9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=glHzkmhfQ03/ylE73sMDSWKWDwW637s4HWRAghxC0FQE0SGuup8gs3TR5TUIOzXDmzkEdPBI9Pb35Gh/utTWLUnKa1ngMDDzilUcXV5CgVMtbclrVGPQbVqXcZNTh7PoCYXG6yw9PF8EFdTt+VpleLac+hVriftptzL/lg7Xsr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k8p1HoRn; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k8p1HoRn"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a64c7cdb46so702197a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789161675; x=1789766475; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uvm+btPrQRBTuu8+5mSNLZIT1wcR2MM1QR5DtKY3sJA=;
        b=k8p1HoRnaGyXp+rSHR6w231YkQr6zotPCEiEI+9LkJo4tw3BLSbRwXJczGJ4O6AEeY
         jzd0dHadFRpY+Xpa/9mWeHSLwASSjxskzZ9T4wadLOIyDA3CJaELTayKRKdfMLuRTLan
         oD+H/tVZ38cGGHPYLA/RiJGnxjauMOLOIEZRom6rbeq4Ku801xP7VKVW31IHg6/ZW3YD
         eyWo6FLfjC5Tvd2AHpwqmtdq335afqPX2znZanTy7e5JzskdSDIgOJeEKKY+BTQAci5x
         aHK/HI+HIZKDgHYER6EInSDuEc5tLitvLtwURe5px5ww+xdI2zti25Tu1iw53iLCleFe
         gjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789161675; x=1789766475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uvm+btPrQRBTuu8+5mSNLZIT1wcR2MM1QR5DtKY3sJA=;
        b=I7+07tuoIBZgEarRNN2SZFSaUKoQnzNZkgdMaa1JBzlcer6Ui1pJouzRzK+OR5enbQ
         M8VkLKjZ9+amZYxEBqFCArtvM162J4c2Q4fzrEqnJRPmbuNokC0O1mkFzaq8ihDl8P4w
         Ept/FMdJ4yc+Ul3eSmTm8tmbJeYjO9ykB8blJtrKHb/Ng2sIhopEXlPE95jLeh7z0qBs
         6bzhuRhMNnXexkDj4JHEeuiSeOdiKgWZjeWNgeEZfDVf+NmXV/9B+BinfxtClwngGvKn
         QdimDaDxLZiWcQrVCJIO4uwW0oDVcdiMW7+uYEEhf3f2pe9W2DSZ3yoNnKm/9Aqc4eZM
         r+XQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDaV9f25EP+uA7OcE8GbHNksbxTeeMup7XItZM4PoGxc/5iqkkThcHQCqMNR2zTzB6T6jyxN/I71oKLwg=@vger.kernel.org
X-Gm-Message-State: AFuF++k7FR0MftFkX2+qltcxKyAHfnR7nc2SocJqJBa/OJXnAgvC0+9U
	pamfh8XB5XwW+XtQi0HtXvVmFfVC/x8CPvxJT0oF2haoes+l8X72hb5A1e+B1SbyBJs=
X-Gm-Gg: AYBFou20olqIsVREhxSy+NnacEy0sydA7UKKDuQ/bFrKxpvcQtaOfHPoJcsCUnjxx57
	GIWe9sUcYGTEm3kJtsWOoqwZylTPYucOn75cgiS//BvOiZ68y4hKPT4jbANnaSFKgOTjXcK2PYj
	TWiFpCU7kLgz+vgrvXqvwKFkd01GQe3RDLH6c7xcyL/R61OxKnGTRvChk461l2/m7lGYXPK1+Ll
	5L4iw/EoVUgmkTSDVUDSSoZUEvrriwfxofB+sxdObVcfffIxbCp6vOaS+fx03UOBxoM7ArWUD8f
	ZRQofI3mt2I0OCYAytAmJbKPdFdDtojIPY3cGsMBDWEXVyidy+QfxzbbURGixk+ADgsjVe1Wx2e
	synKhgP3JLYRiRqeNST02W9sE7bPj4u0lbCjFOkaq4kib2DGEaKM6ORK7oHVkjSB+hRrOqWIV/l
	OrVKQDHqRwHEQJzplxW9kuXfH4i0SS54AecXgTczY8aELT6XSuVRUio3adM5r6mgdhn+Bx6ifO5
	4qKOgOL7BvY85Q/2j3g2VfzIMtDYT0xlfFv5FTw8tQeMlA2rAxTACXHwwoMWR4raw==
X-Received: by 2002:a17:907:6d0f:b0:c25:1b4f:6d95 with SMTP id a640c23a62f3a-c296650ef6bmr266540666b.6.1789161675053;
        Fri, 11 Sep 2026 14:21:15 -0700 (PDT)
Received: from petegriffin.c.googlers.com (116.118.90.34.bc.googleusercontent.com. [34.90.118.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660234f2sm126375166b.12.2026.09.11.14.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 14:21:14 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 11 Sep 2026 21:21:06 +0000
Subject: [PATCH v2 2/2] iommu/arm-smmu-v3: Add support for
 arm,instdata-override DT property
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-arm-smmu-v3-instcfg-override-v2-2-5804e4f400b5@linaro.org>
References: <20260911-arm-smmu-v3-instcfg-override-v2-0-5804e4f400b5@linaro.org>
In-Reply-To: <20260911-arm-smmu-v3-instcfg-override-v2-0-5804e4f400b5@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Pranjal Shrivastava <praan@google.com>, 
 Daniel Mentz <danielmentz@google.com>, Mostafa Saleh <smostafa@google.com>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
 willmcvicker@google.com, jyescas@google.com, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5946;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=VB6oO/0/aP3anKWJoqBgbBJ4sY9p6fnK67zg5+eEZ9M=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqpHDHzEijWCf5mE/ywG6gZ00CigmowyI36StKG
 HawX3dSwmWJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaqRwxwAKCRDO6LjWAjRy
 unoJD/9g5EpIQMsuKWJGdcGUJ/1Q3cLmc5iRMaXFcXKRRNNlmQyfwhjwmdzrUqjc/GzrWrWRqFA
 mk9NTrlWN0G/ZnnfBltZmYjJxgnqcEKXQo0SjN5kG0q2kvr40lu/nlbzx0rX0nxK+UVKfXeiHPY
 ttvXD+QErU05cm5EOIJXOiarJ5rCk+9UeDfdLBjmdn+T7wL2nfuEXW3kNAiTpY+JFyzL3skLOtk
 cnaLW7wXEL0TO6dBFtT5EzeXlF50ayjk31yafAiv08ncNMaO8OkO5FjKpay69TklnRP6Cw0a6Yz
 BPOYvVNiGRV+Al4hDtGlvrsC42hrfP6ct9ByLxOuR8Q9O5aME5HXCk/q6vrlmsbK2HYxSU/kmsj
 i1Y0a3zBceTr/GDtEijxlo1X89vAb31W6Mpixr80/KgpO4UHrNXZJB3Dmd7nydt7z/yUpzfuznz
 xPJNBPniX7Mz6XLciY4Nb9dev99DHTpFTw97okrfPUg3VmkVjDFixKYoA0/05SHz4yFVWk2g0cF
 R+x4kfEGIk+j3b34vAArwX46HNB8O57zU2FF3q9pms/VU+ulA7eYMXVDItuC6Bh1athAkXoO+V5
 4X9EPSOmO8ncYqj9VzhXH80guhjWpBeBHnCs4pPcoZp9SzM0ZTmSE6B5wpCCistAkcs59xTyuRO
 W5m1PFSqOy2/Ivg==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

The Google Tensor G5 SoC (Laguna) has a silicon errata with the SMMU
integration where the AxPROT[2] signal is always 1, which makes all
transactions appear as instructions.

To avoid F_PERMISSION faults (due to the VMSAv8-64 requirement that
unprivilieged writable buffers are treated as Privileged Execute-Never
(PXN)), as a software workaround we make use of the INSTCFG override
feature to force all incoming traffic to data.

To enable this workaround, the "arm,instdata-override" DT property can be
provided in the device tree entry for the SMMU, similar to how existing
errata workarounds are handled by this driver.

Note this is added for "stage-1" and "stage-2" but we intentionally leave
out "bypass" as nothing is downstream of the SMMU that makes use of the
Instruction/Data attribute.

Signed-off-by: Pranjal Shrivastava <praan@google.com>
[peter.griffin: ported to upstream, updated commit message, remove
feature flag]
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v2
 - Fixup incorrect bracket (Sashiko / Nicolin)
 - Add more verbose description of the issue (Will/Robin)
 - Add note about why "bypass" is not required (Nicolin)
 - Remove ARM_SMMU_FEAT_PERMS_OVR flag (Nicolin)
 - Move check closer to IDR1_ATTR_TYPES_OVR read
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 25 +++++++++++++++++++++----
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  6 ++++++
 2 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 5732f3ba0122d..f88647be94475 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -91,6 +91,7 @@ DEFINE_MUTEX(arm_smmu_asid_lock);
 static struct arm_smmu_option_prop arm_smmu_options[] = {
 	{ ARM_SMMU_OPT_SKIP_PREFETCH, "hisilicon,broken-prefetch-cmd" },
 	{ ARM_SMMU_OPT_PAGE0_REGS_ONLY, "cavium,cn9900-broken-page1-regspace"},
+	{ ARM_SMMU_OPT_OVR_INSTCFG_DATA, "arm,instdata-override"},
 	{ 0, NULL},
 };
 
@@ -1271,7 +1272,8 @@ void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits)
 			cpu_to_le64(STRTAB_STE_1_S1DSS | STRTAB_STE_1_S1CIR |
 				    STRTAB_STE_1_S1COR | STRTAB_STE_1_S1CSH |
 				    STRTAB_STE_1_S1STALLD | STRTAB_STE_1_STRW |
-				    STRTAB_STE_1_EATS | STRTAB_STE_1_MEV);
+				    STRTAB_STE_1_EATS | STRTAB_STE_1_MEV |
+				    STRTAB_STE_1_INSTCFG);
 		used_bits[2] |= cpu_to_le64(STRTAB_STE_2_S2VMID);
 
 		/*
@@ -1287,7 +1289,8 @@ void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits)
 	if (cfg & BIT(1)) {
 		used_bits[1] |=
 			cpu_to_le64(STRTAB_STE_1_S2FWB | STRTAB_STE_1_EATS |
-				    STRTAB_STE_1_SHCFG | STRTAB_STE_1_MEV);
+				    STRTAB_STE_1_SHCFG | STRTAB_STE_1_MEV |
+				    STRTAB_STE_1_INSTCFG);
 		used_bits[2] |=
 			cpu_to_le64(STRTAB_STE_2_S2VMID | STRTAB_STE_2_VTCR |
 				    STRTAB_STE_2_S2AA64 | STRTAB_STE_2_S2ENDI |
@@ -1900,7 +1903,11 @@ void arm_smmu_make_cdtable_ste(struct arm_smmu_ste *target,
 			 STRTAB_STE_1_S1STALLD :
 			 0) |
 		FIELD_PREP(STRTAB_STE_1_EATS,
-			   ats_enabled ? STRTAB_STE_1_EATS_TRANS : 0));
+			   ats_enabled ? STRTAB_STE_1_EATS_TRANS : 0) |
+		FIELD_PREP(STRTAB_STE_1_INSTCFG,
+			   smmu->options & ARM_SMMU_OPT_OVR_INSTCFG_DATA ?
+				   STRTAB_STE_1_INSTCFG_DATA :
+				   STRTAB_STE_1_INSTCFG_INCOMING));
 
 	if ((smmu->features & ARM_SMMU_FEAT_ATTR_TYPES_OVR) &&
 	    s1dss == STRTAB_STE_1_S1DSS_BYPASS)
@@ -1952,7 +1959,11 @@ void arm_smmu_make_s2_domain_ste(struct arm_smmu_ste *target,
 
 	target->data[1] = cpu_to_le64(
 		FIELD_PREP(STRTAB_STE_1_EATS,
-			   ats_enabled ? STRTAB_STE_1_EATS_TRANS : 0));
+			   ats_enabled ? STRTAB_STE_1_EATS_TRANS : 0) |
+		FIELD_PREP(STRTAB_STE_1_INSTCFG,
+			   smmu->options & ARM_SMMU_OPT_OVR_INSTCFG_DATA ?
+				   STRTAB_STE_1_INSTCFG_DATA :
+				   STRTAB_STE_1_INSTCFG_INCOMING));
 
 	if (pgtbl_cfg->quirks & IO_PGTABLE_QUIRK_ARM_S2FWB)
 		target->data[1] |= cpu_to_le64(STRTAB_STE_1_S2FWB);
@@ -5155,6 +5166,12 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 	if (reg & IDR1_ATTR_TYPES_OVR)
 		smmu->features |= ARM_SMMU_FEAT_ATTR_TYPES_OVR;
 
+	if ((smmu->options & ARM_SMMU_OPT_OVR_INSTCFG_DATA) &&
+	    !(reg & IDR1_ATTR_PERMS_OVR)) {
+		dev_err(smmu->dev, "Inst/Data attribute override not supported\n");
+		return -ENXIO;
+	}
+
 	/* Queue sizes, capped to ensure natural alignment */
 	smmu->cmdq.q.llq.max_n_shift = min_t(u32, CMDQ_MAX_SZ_SHIFT,
 					     FIELD_GET(IDR1_CMDQS, reg));
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index dd2fee2f560e6..efbac8ca6d7a0 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -52,6 +52,7 @@ struct arm_vsmmu;
 #define IDR1_QUEUES_PRESET		(1 << 29)
 #define IDR1_REL			(1 << 28)
 #define IDR1_ATTR_TYPES_OVR		(1 << 27)
+#define IDR1_ATTR_PERMS_OVR		(1 << 26)
 #define IDR1_CMDQS			GENMASK(25, 21)
 #define IDR1_EVTQS			GENMASK(20, 16)
 #define IDR1_PRIQS			GENMASK(15, 11)
@@ -285,6 +286,10 @@ static inline u32 arm_smmu_strtab_l2_idx(u32 sid)
 #define STRTAB_STE_1_SHCFG		GENMASK_ULL(45, 44)
 #define STRTAB_STE_1_SHCFG_INCOMING	1UL
 
+#define STRTAB_STE_1_INSTCFG		GENMASK_ULL(51, 50)
+#define STRTAB_STE_1_INSTCFG_INCOMING	0UL
+#define STRTAB_STE_1_INSTCFG_DATA	2UL
+
 #define STRTAB_STE_2_S2VMID		GENMASK_ULL(15, 0)
 #define STRTAB_STE_2_VTCR		GENMASK_ULL(50, 32)
 #define STRTAB_STE_2_VTCR_S2T0SZ	GENMASK_ULL(5, 0)
@@ -934,6 +939,7 @@ struct arm_smmu_device {
 #define ARM_SMMU_OPT_MSIPOLL		(1 << 2)
 #define ARM_SMMU_OPT_CMDQ_FORCE_SYNC	(1 << 3)
 #define ARM_SMMU_OPT_TEGRA241_CMDQV	(1 << 4)
+#define ARM_SMMU_OPT_OVR_INSTCFG_DATA	(1 << 5)
 	u32				options;
 
 	struct arm_smmu_cmdq		cmdq;

-- 
2.55.0.1007.g17ff1f9808-goog

