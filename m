Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0274756BC
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 19:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791143447; cv=none; b=Pi4x4/zOL4cRpF5eASwoMiuB5YHA8oaxlaVGJ5VQ3K80e6KOoH/Je5Cz/ag76r94OlGhBlctD75DbsVFQQSsdyn7p7jU8+qj6vE6Qv7BVQnUzWgab46957zhWKKyDzrmyjQ+dfboF42Ykwmn/urLxFuO43uU3hfMlANnEE59rOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791143447; c=relaxed/simple;
	bh=SHw9kMnxKKwhY3CM5Kg8GrEdHVMXUmjxOrNJxpjRzB0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ugx9gjmftKkNPHFTZGVd1rWGWLUdZAoKRn6W0z117PpzPr+QNZV0x3X7zBq1M1ZGVURSIgqCj/6j90sDVltD9PYMeJHKRzc/jeb79WNkTGJQUyqvb51dhj1ybyFF6zdBpq7VLUWeoLYgRliwtDYX7iYDsl1lUNSZOUzk78J5ZNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--danielmentz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R4zQKPeS; arc=none smtp.client-ip=74.125.82.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--danielmentz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R4zQKPeS"
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1855082eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 12:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791143445; x=1791748245; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/0+8/7+L8DONYJQ3fWVSioDtnywAJwCJWEJlOMQxkV4=;
        b=R4zQKPeSdzuWlMTLi4kbQvc2NJlK1X0aNpHZ0QyGlopngIfDtlCaZ2JNN/A33Y/Gv2
         Qid2dXDaEkqi3R8vcJ9KMb1RFbIMVgI8TI++Mw1fbKptkfhRej8xYNWZZe88DWKh78Tu
         KqjBXLo5GyziKuhRBW7p2YhecQle8L/Cc54Es8p19wGPKcGpuFSMWtazBGetACwYvcQx
         +fYvKGuf3FLF0llmYP2cxshiGS2aPgM8MjOSVdGkksuyMItmvZ8oIOIaKL2ZWj0GlNJg
         RlSDcCwxOkkNZ6NKcIw8w9HW+dfksBIpnYAA5kexLenBqL6f9zE2pvTNrhvK0VU5dI5z
         /OnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791143445; x=1791748245;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/0+8/7+L8DONYJQ3fWVSioDtnywAJwCJWEJlOMQxkV4=;
        b=nwsftEPUYrtGsWpYPrpNsng/DQdAyPUA5MaePBLdjRa6kd90ytA0dFiYO1V4DNf0Le
         eHfbskVd8Yh3Wj/ffcFyea6OxmTm55Vl42ZqCcmQmkVWoamFubE4RGGmgazvTtPcHTTu
         jnPHNIC1C+dhzfaGJUTZKiN/sDGCYtCgDaEV7d5jZCrnAC6oWoQc/OIAnOxEBhyQrstG
         MLnULNUlNZYlumNFu/VV5I0TLskutUIcEmPqYZxnDadz59+EdFTjuBqmzjoki2odWMU3
         symmvSaqtfDWM3dpO8y/exZR3Ui6UTxMzBy+zOf4Wuwx4HCkcMRxvLZxhfkiUui+7L8H
         7yTQ==
X-Forwarded-Encrypted: i=1; AKwUvByEekq2koSSREs8xlAvrfJpN7mejWMVicL4lqPMwEQJAGBJIKHwbsrFbSCy6wk6XCcik/8hUnSq/nm10is=@vger.kernel.org
X-Gm-Message-State: AFuF++kQ7HCpjcUp4rHMVJlJBXokFkbWtMGsKJrMugWcROswkSz3bqbv
	My8PW+m2hexzSVirv5Z+Uaa4/oQ5qJj+ovw2cFQxc1268MyT7fKIVaE12hyAmr9YTFP9SzX3IDE
	UEpXRsAW+eUMWkrktXel0v3zTHg==
X-Received: from dlbti5.prod.google.com ([2002:a05:7022:1b05:b0:159:4114:9dd])
 (user=danielmentz job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:f90b:b0:149:c766:3629 with SMTP id a92af1059eb24-14f5c5e9661mr13770215c88.23.1791143444306;
 Sun, 04 Oct 2026 12:50:44 -0700 (PDT)
Date: Sun,  4 Oct 2026 19:50:27 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261004195027.227748-1-danielmentz@google.com>
Subject: [PATCH v2] iommu/arm-smmu-v3: Align memory attributes for
 SMMU-originated accesses
From: Daniel Mentz <danielmentz@google.com>
To: iommu@lists.linux.dev
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, 
	nicolinc@nvidia.com, smostafa@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dawei.li@linux.dev, jgg@ziepe.ca, praan@google.com, 
	Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="UTF-8"

The SMMU specification defines several types of SMMU-originated memory
accesses, including Stage 1 and Stage 2 translation table walks, stream
table accesses (L1STD and STE fetches), CD table accesses (L1CD and CD
fetches), and queue accesses (CMDQ fetch, EVENTQ write, PRIQ write).

While the memory attributes used for Stage 1 and Stage 2 translation
table walks are configured in io-pgtable-arm based on whether the SMMU
is coherent (ARM_SMMU_FEAT_COHERENCY), the attributes for stream tables,
CD tables, and queues are currently hardcoded to Inner Shareable,
Write-Back.

On non-coherent systems, however, memory for stream tables, CD tables,
and queues is allocated via dma_alloc_coherent() /
dmam_alloc_coherent(), which provides CPU mappings with Normal
Non-Cacheable attributes. Having a non-coherent SMMU access these
buffers with Inner Shareable, Write-Back attributes results in
mismatched memory attributes between the CPU and the SMMU.

Configure the memory attributes for tables and queues in
arm_smmu_device_reset() and arm_smmu_make_cdtable_ste() based on
ARM_SMMU_FEAT_COHERENCY, matching the attributes used for translation
table walks:

- In SMMU_CR1, use Outer Shareable, Non-Cacheable for non-coherent
  SMMUs, while retaining Inner Shareable, Write-Back for coherent SMMUs.
  This applies to stream table accesses as well as queue accesses (CMDQ
  fetch, EVENTQ write, PRIQ write).
- In STE.{S1CIR, S1COR, S1CSH}, use Outer Shareable, Non-Cacheable for
  non-coherent SMMUs, while retaining Inner Shareable, Write-Back
  Read-Allocate for coherent SMMUs. This applies to CD table accesses.

Assisted-by: LLM
Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Daniel Mentz <danielmentz@google.com>
---
Changes in v2:
- Rename local variables 'cache' and 'sh' to 'cr1_cache' and 'cr1_sh' in
  arm_smmu_device_reset() (Nicolin, Will)
- Collect Reviewed-by from Nicolin
- Link to v1: https://lore.kernel.org/linux-iommu/20260929032229.3532247-1-danielmentz@google.com/

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 37 +++++++++++++++------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 34e916ea339f..02cc6fb83461 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1905,6 +1905,15 @@ void arm_smmu_make_cdtable_ste(struct arm_smmu_ste *target,
 {
 	struct arm_smmu_ctx_desc_cfg *cd_table = &master->cd_table;
 	struct arm_smmu_device *smmu = master->smmu;
+	u64 s1c, s1csh;
+
+	if (smmu->features & ARM_SMMU_FEAT_COHERENCY) {
+		s1c = STRTAB_STE_1_S1C_CACHE_WBRA;
+		s1csh = ARM_SMMU_SH_ISH;
+	} else {
+		s1c = STRTAB_STE_1_S1C_CACHE_NC;
+		s1csh = ARM_SMMU_SH_OSH;
+	}
 
 	memset(target, 0, sizeof(*target));
 	target->data[0] = cpu_to_le64(
@@ -1916,9 +1925,9 @@ void arm_smmu_make_cdtable_ste(struct arm_smmu_ste *target,
 
 	target->data[1] = cpu_to_le64(
 		FIELD_PREP(STRTAB_STE_1_S1DSS, s1dss) |
-		FIELD_PREP(STRTAB_STE_1_S1CIR, STRTAB_STE_1_S1C_CACHE_WBRA) |
-		FIELD_PREP(STRTAB_STE_1_S1COR, STRTAB_STE_1_S1C_CACHE_WBRA) |
-		FIELD_PREP(STRTAB_STE_1_S1CSH, ARM_SMMU_SH_ISH) |
+		FIELD_PREP(STRTAB_STE_1_S1CIR, s1c) |
+		FIELD_PREP(STRTAB_STE_1_S1COR, s1c) |
+		FIELD_PREP(STRTAB_STE_1_S1CSH, s1csh) |
 		((smmu->features & ARM_SMMU_FEAT_STALLS &&
 		  !master->stall_enabled) ?
 			 STRTAB_STE_1_S1STALLD :
@@ -5102,7 +5111,7 @@ static void arm_smmu_write_strtab(struct arm_smmu_device *smmu)
 static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 {
 	int ret;
-	u32 reg, enables;
+	u32 reg, enables, cr1_cache, cr1_sh;
 
 	/* Clear CR0 and sync (disables SMMU and queue processing) */
 	reg = readl_relaxed(smmu->base + ARM_SMMU_CR0);
@@ -5116,12 +5125,20 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 		return ret;
 
 	/* CR1 (table and queue memory attributes) */
-	reg = FIELD_PREP(CR1_TABLE_SH, ARM_SMMU_SH_ISH) |
-	      FIELD_PREP(CR1_TABLE_OC, CR1_CACHE_WB) |
-	      FIELD_PREP(CR1_TABLE_IC, CR1_CACHE_WB) |
-	      FIELD_PREP(CR1_QUEUE_SH, ARM_SMMU_SH_ISH) |
-	      FIELD_PREP(CR1_QUEUE_OC, CR1_CACHE_WB) |
-	      FIELD_PREP(CR1_QUEUE_IC, CR1_CACHE_WB);
+	if (smmu->features & ARM_SMMU_FEAT_COHERENCY) {
+		cr1_cache = CR1_CACHE_WB;
+		cr1_sh = ARM_SMMU_SH_ISH;
+	} else {
+		cr1_cache = CR1_CACHE_NC;
+		cr1_sh = ARM_SMMU_SH_OSH;
+	}
+
+	reg = FIELD_PREP(CR1_TABLE_SH, cr1_sh) |
+	      FIELD_PREP(CR1_TABLE_OC, cr1_cache) |
+	      FIELD_PREP(CR1_TABLE_IC, cr1_cache) |
+	      FIELD_PREP(CR1_QUEUE_SH, cr1_sh) |
+	      FIELD_PREP(CR1_QUEUE_OC, cr1_cache) |
+	      FIELD_PREP(CR1_QUEUE_IC, cr1_cache);
 	writel_relaxed(reg, smmu->base + ARM_SMMU_CR1);
 
 	/* CR2 (random crap) */
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

