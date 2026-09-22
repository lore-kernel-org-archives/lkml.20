Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82B4549376
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790082790; cv=none; b=fzXLj8nFIKbXT9gNcb+E+pCTpUXMXKweImWA4JvsmGqk1F5ldYhOUNyleNGVEC4+HckKiq/1V3liBJruEdH3zhmPpkj8fT/pKR9k9yM51JtHz/IxSifgOY7ZD0lVE33bAoIXm7U66rPN/Zyl9qm8tC7epNIwmMBbl+bVvl6vh90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790082790; c=relaxed/simple;
	bh=luLSOTHVLEObN8tzhXds8oVGFsNxhXERxuJM3hmQONU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=o9uCkmfvxm43UZ5s3tHtyDOuWzkypyVeUeF5Y6RU4W7fNhS8HEZf/cSimWoAwhn33fbM3SasaTgNpQYthyI6+czMkJqc+PKog2FKG4REfhGloiAfdJVRl2U/Rb77BVQKkYy4MfEASP97KrC3nwWr8ikvxEtw68n1h2O3MqJZykQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c1k2gTh2; arc=none smtp.client-ip=209.85.208.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c1k2gTh2"
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6a91d818528so4856413a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790082787; x=1790687587; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KBu9oh+TkSTLVV9ZYrPVk83cxnj3jVdJUheu3Z2jp4I=;
        b=c1k2gTh2XfQsYjxuvgz67H/m08DaIXcMUd1Bj5DFCelmWT7ps3wZyslsXcoyP1+M0g
         coZiQkNNi8Ml7YaFlRL4402e582R2WcdGK4ule21ZpKLjHQ4jEknjscOtC94RmcxOOdj
         oRz4cGZMOtbIhPEcL1yJrx432UZtGWRc+0JsQSacIYwYx1CGFDruXfzCsr2pzFHda1tT
         m02zHAvl/4VrjfD3F9zXGUdDfQwIW0jhMl6JNbkUluDK3Y0K9DSBb0FAREou2Z4JWSMg
         Tfxyt6R1zwsWVhsZWxj7fxkfjZW4dPQQ/VJRC0UIG0G3GqtnWfLmxFfJx7t/ROufF5ai
         dQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082787; x=1790687587;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KBu9oh+TkSTLVV9ZYrPVk83cxnj3jVdJUheu3Z2jp4I=;
        b=tbSjVehoo2qT7/DhZQlvp/vDex09IJxo02lYQGx7VFThaJ0/5Z+uBrw7+U06gDCQ/c
         pk7aPFxfKjzGVnl4HrN2erAJLvYXkpHN+2sdebQNfDLs7upkJo/yreskMS+anpEzWb/a
         Y/qEGTAr6Qb+prX6jynKyHfrvF5E1cFQibcTk+I5/aoZkiufN6Ef2JpIHrJ1yEF4+AHb
         YBCj7ZpPopcmZ2bVQ/KBBg8J1l4QFsLMcfC3E9RHERhz/1rljzHZlX33jvlKEW9r2M39
         3M4nIbJhFBD8J4bMSJiU6r8ZPsirtIOt/08XbVDzhDOHYm4nf1bzRcRz71HAUpxVoaUz
         qwqg==
X-Forwarded-Encrypted: i=1; AKwUvByuOfRNhPUODSNf7KLQxy0u3cV8zZTSiWkLmXAKq7bfDroO2K2SBr/5MKC9VK7Cp12P/7DoAuvXba4rbhM=@vger.kernel.org
X-Gm-Message-State: AFuF++lBP/18pOHgSUL5En0LB/qfF2u3xzxenbBdsREycG1eFb0enAg0
	ZxLq5zdsgX5Y9aFbAL33CK4ZqCtCON2MIyJ/+bEy7bFSRyDV3ZK6yU24DRRJjKSTSxtvSf+pk6K
	2LuoFesjbszDhlw==
X-Received: from edxz22.prod.google.com ([2002:aa7:cf96:0:b0:6a9:8583:17bd])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:e08:b0:6a9:5669:9b77 with SMTP id 4fb4d7f45d1cf-6aa569b484dmr983240a12.44.1790082786225;
 Tue, 22 Sep 2026 06:13:06 -0700 (PDT)
Date: Tue, 22 Sep 2026 13:12:36 +0000
In-Reply-To: <20260922131259.2975334-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260922131259.2975334-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922131259.2975334-4-smostafa@google.com>
Subject: [PATCH v8 03/25] iommu/arm-smmu-v3: Introduce RangeInval encoding helpers
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	sebastianene@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

Move some of the RIL encodings into helpers so the hypervisor can
reuse them.
The hypervisor is going to have its own algorithm to determine the
sequence of RIL commands needed.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
I removed the refactoring from this patch as this code would be
deleted anyway.
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 14 +++-------
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 30 +++++++++++++++++++++
 2 files changed, 34 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index df1924969212..2e54d1ba2566 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2418,8 +2418,7 @@ static void arm_smmu_cmdq_batch_add_range(struct arm_smmu_device *smmu,
 	if (smmu->features & ARM_SMMU_FEAT_RANGE_INV) {
 		num_pages = size >> tg;
 
-		/* Convert page size of 12,14,16 (log2) to 1,2,3 */
-		tg_enc = (tg - 10) / 2;
+		tg_enc = arm_smmu_tlb_inv_tg_enc(tg);
 
 		/*
 		 * Determine what level the granule is at. For non-leaf, both
@@ -2430,7 +2429,7 @@ static void arm_smmu_cmdq_batch_add_range(struct arm_smmu_device *smmu,
 		 * where both scale and num could be 0 as well.
 		 */
 		if (leaf)
-			ttl = 4 - ((ilog2(granule) - 3) / (tg - 3));
+			ttl = arm_smmu_tlb_inv_ttl(granule, tg);
 		else if ((num_pages & CMDQ_TLBI_RANGE_NUM_MAX) == 1)
 			num_pages++;
 	}
@@ -2452,10 +2451,8 @@ static void arm_smmu_cmdq_batch_add_range(struct arm_smmu_device *smmu,
 			/* Determine how many chunks of 2^scale size we have */
 			num = (num_pages >> scale) & CMDQ_TLBI_RANGE_NUM_MAX;
 
-			/* Keep the pre-DS 5-bit truncation when scale > 31 */
 			cmd->data[0] = orig_data0 |
-				FIELD_PREP(CMDQ_TLBI_0_NUM, num - 1) |
-				FIELD_PREP(CMDQ_TLBI_0_SCALE, scale & 0x1f);
+				arm_smmu_tlb_inv_range_enc(num, scale);
 
 			/* range is num * 2^scale * pgsize */
 			inv_range = num << (scale + tg);
@@ -2469,10 +2466,7 @@ static void arm_smmu_cmdq_batch_add_range(struct arm_smmu_device *smmu,
 		 * command and something would be very broken if iova had them
 		 * set.
 		 */
-		cmd->data[1] = FIELD_PREP(CMDQ_TLBI_1_LEAF, leaf) |
-			       FIELD_PREP(CMDQ_TLBI_1_TTL, ttl) |
-			       FIELD_PREP(CMDQ_TLBI_1_TG, tg_enc) |
-			       (iova & ~GENMASK_U64(11, 0));
+		cmd->data[1] = arm_smmu_tlb_inv_addr(iova, leaf, ttl, tg_enc);
 
 		arm_smmu_cmdq_batch_add_cmd_p(smmu, cmds, cmd);
 		iova += inv_range;
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 5b23f6ee78d4..f3e80d103ba1 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1285,6 +1285,36 @@ static inline void arm_smmu_write_strtab_l1_desc(struct arm_smmu_strtab_l1 *dst,
 	WRITE_ONCE(dst->l2ptr, cpu_to_le64(val));
 }
 
+/* Convert page size of 12,14,16 (log2) to 1,2,3 */
+static inline u8 arm_smmu_tlb_inv_tg_enc(size_t tg)
+{
+	return (tg - 10) / 2;
+}
+
+/* Only valid for leaf invalidations, non-leaf must use TTL=0 */
+static inline u8 arm_smmu_tlb_inv_ttl(size_t granule, size_t tg)
+{
+	return 4 - ((ilog2(granule) - 3) / (tg - 3));
+}
+
+static inline u64 arm_smmu_tlb_inv_addr(unsigned long iova, bool leaf, u8 ttl, u8 tg_enc)
+{
+	return FIELD_PREP(CMDQ_TLBI_1_LEAF, leaf) |
+		FIELD_PREP(CMDQ_TLBI_1_TTL, ttl) |
+		FIELD_PREP(CMDQ_TLBI_1_TG, tg_enc) |
+		(iova & ~GENMASK_U64(11, 0));
+}
+
+/*
+ * @num: Number of 2^scale granules, must be >= 1.
+ */
+static inline u64 arm_smmu_tlb_inv_range_enc(u8 num, u8 scale)
+{
+	/* Keep the pre-DS 5-bit truncation when scale > 31 */
+	return FIELD_PREP(CMDQ_TLBI_0_NUM, num - 1) |
+		FIELD_PREP(CMDQ_TLBI_0_SCALE, scale & 0x1f);
+}
+
 #ifdef CONFIG_ARM_SMMU_V3_SVA
 bool arm_smmu_sva_supported(struct arm_smmu_device *smmu);
 void arm_smmu_sva_notifier_synchronize(void);
-- 
2.55.0.1082.g2b9226bbc0-goog

