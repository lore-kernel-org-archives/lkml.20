Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E1F5519A6
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790082809; cv=none; b=QCrd+kpLXlLXsWg9q0sIFXhuUuxHhiFjRWUK3wDWLNi+67zWBa/Ixvn7ZqMFJgT0ng9G7i7y4WzF3ztbAoieo4KHZvPUvtYmOrFRoZJEdHC1tZ/mSlseXXHLvpoRt8jC3acjL7NCYZurhDdku751nFSkCFN7igjq1UYdHG+/DqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790082809; c=relaxed/simple;
	bh=SDlatHrQDm3u2/GILmSmdipnZmcn0kcwzdwaLFS/+sA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tQPJE0DOBXWJ6nsJVcIkhf0YrXU07bRteqMSDuQWU6sUXATl7f47HX6Iw7weQFyQPxpZx5fabNGIguBgcMMqDxbSMeD8fFblhLrmrgWxdcez5AqvFUUp8fAN/qU9IChd5dvdy/rJNw/3hIh6f4s83HnSTrcXUtm7P+LUBNQdfGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O8QqiGQw; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O8QqiGQw"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49e6422198fso29032025e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790082802; x=1790687602; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=00AhV3k+li4lYucaDcO3o5UE2oHbgVQJ9mR0kZROZeQ=;
        b=O8QqiGQwvddN/e0D+KIw4V45fnXciDnej1EbMz3dONntz4VIrpbwaacMmcjl6K4eYq
         FWSVeHgEZAizonGKLdfXnLkly97kdtz9B088Iaa2QrHOMGp08pgsmDV1FhvaTfuRghZF
         uD8/lQeb/CiFGtdRHAYzoxa6T6Pg9Go5o0ISbCEswE5MjwitaFBcGbyn+dTTA/3miHO4
         CJQjyPYJNlBrlr5ZT/o4LFANSs/Hd3k3Gqmm+Y89ww4JAjyXBbhwA1kQhW8F0tjYJCjZ
         ueFJpOtRwBxVQVWaKR8l0RUbmpJ8ra8//jaRG/W9Y9I4lSNO7/dcpUMpSnKfIY6sbWX5
         oFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082802; x=1790687602;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=00AhV3k+li4lYucaDcO3o5UE2oHbgVQJ9mR0kZROZeQ=;
        b=JPcphiKJ9BHBZlpKM/sTEOQ5jejIr347zrLh/TvGzs1JYpnGw/9PFPK0A30zu0/Pr9
         Ggcpwis6lsZzfzeqwUM5PRW3ONb670EXPOh1/sYmra7OgaoNekzWxyldZvhjGGs/asBB
         EhMZoRyU4F+dD3r7zasB5QTs8QowHqBSsOclYnSSqCwgl57L9ql5f4zrLkWk2XMaTcyg
         ExDFrRR1VA6qKMGWQKosIFrIRCS3c3me5y38SKglvDUAX/7yQAynJ7gzT6EdOLhRg2nZ
         af+U/cALPXctZe/MvxW7i2Z6zMDup/ghiLg92jBYzNGKfS64c7/y2Hn47J8qlLRJvYzv
         vrQA==
X-Forwarded-Encrypted: i=1; AKwUvBzWhtdPiHyhwh0I55t9l6r1LZu5VI9PzksFq7KqjwYmTWxDw56X2CrceTEAzxO+OG8hJJtNh4psIBbDx9k=@vger.kernel.org
X-Gm-Message-State: AFuF++nOcQ6hrOZH72PmKzNy0j4IteowIDVxABp/O30IdpQJOCnfduKc
	x8DVRNkB+q66WeghBAwJ7JYKVK8owYhe4znY+V1EYabP/nAfcisugWs5b/auz20+dlwk9SILAun
	FZF9ZeVOPmsc6XA==
X-Received: from wmqy9.prod.google.com ([2002:a05:600c:3649:b0:49c:d3c6:97b4])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:4441:10b0:49f:ce78:3572 with SMTP id 5b1f17b1804b1-49fce783674mr94578205e9.35.1790082802190;
 Tue, 22 Sep 2026 06:13:22 -0700 (PDT)
Date: Tue, 22 Sep 2026 13:12:49 +0000
In-Reply-To: <20260922131259.2975334-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260922131259.2975334-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922131259.2975334-17-smostafa@google.com>
Subject: [PATCH v8 16/25] iommu/arm-smmu-v3-kvm: Emulate CMDQ for host
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

Don't allow access to the command queue from the host:
- ARM_SMMU_CMDQ_BASE: Only allowed to be written when CMDQ is disabled, we
  use it to keep track of the host command queue base.
  Reads return the saved value.
- ARM_SMMU_CMDQ_PROD: Writes trigger command queue emulation which sanitise
  and filters the whole range. Reads returns the host copy.
- ARM_SMMU_CMDQ_CONS: Writes move the sw copy of the cons, but the host
  can't skip commands once submitted. Reads return the emulated value and
  the error bits in the actual cons.

Also add emulation for IDR1.CMDQS to return the hypervisor command queue
size which can be equal to or smaller to the HW size.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 151 +++++++++++++++++-
 1 file changed, 146 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index 38b8ecc5cc10..8c67e348f4a3 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -111,7 +111,6 @@ static int smmu_unshare_pages(phys_addr_t addr, size_t size)
 	return 0;
 }
 
-__maybe_unused
 static bool smmu_cmdq_has_space(struct arm_smmu_queue *cmdq, u32 n)
 {
 	struct arm_smmu_ll_queue *llq = &cmdq->llq;
@@ -340,6 +339,105 @@ static int smmu_init(void)
 	return ret;
 }
 
+static bool smmu_filter_command(struct hyp_arm_smmu_v3_device *smmu, u64 *command)
+{
+	u64 type = FIELD_GET(CMDQ_0_OP, command[0]);
+
+	switch (type) {
+	case CMDQ_OP_CFGI_STE:
+		/* TBD: SHADOW_STE*/
+		break;
+	case CMDQ_OP_CFGI_ALL:
+	{
+		/*
+		 * Linux doesn't use range STE invalidation, and only use this
+		 * for CFGI_ALL, which is done on reset and not on an new STE
+		 * being used.
+		 * Although, this is not architectural we rely on the current Linux
+		 * implementation.
+		 */
+		if ((FIELD_GET(CMDQ_CFGI_1_RANGE, command[1]) != 31))
+			return true;
+		break;
+	}
+	case CMDQ_OP_TLBI_NH_ASID:
+	case CMDQ_OP_TLBI_NH_VA:
+	case CMDQ_OP_TLBI_NH_ALL:
+	case 0x13: /* CMD_TLBI_NH_VAA: Not used by Linux */
+	{
+		/* Only allow VMID = 0 */
+		if (FIELD_GET(CMDQ_TLBI_0_VMID, command[0]) != 0)
+			return true;
+		break;
+	}
+	case CMDQ_OP_PREFETCH_CFG:
+	case CMDQ_OP_CFGI_CD:
+	case CMDQ_OP_CFGI_CD_ALL:
+	case CMDQ_OP_TLBI_NSNH_ALL:
+	case CMDQ_OP_PRI_RESP:
+	case CMDQ_OP_RESUME:
+		break;
+	case CMDQ_OP_CMD_SYNC:
+		if (FIELD_GET(CMDQ_SYNC_0_CS, command[0]) == CMDQ_SYNC_0_CS_IRQ) {
+			/* Do not allow MSI */
+			command[0] &= ~CMDQ_SYNC_0_CS;
+			command[0] |= FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_SEV);
+			command[1] &= ~CMDQ_SYNC_1_MSIADDR_MASK;
+		}
+		break;
+	default:
+		/* Deny unknown commands */
+		return true;
+	}
+
+	return false;
+}
+
+static int smmu_emulate_cmdq_insert(struct hyp_arm_smmu_v3_device *smmu)
+{
+	u64 *host_cmdq = hyp_phys_to_virt(smmu->cmdq_host.base_dma);
+	bool use_wfe = smmu->features & ARM_SMMU_FEAT_SEV;
+	u64 cmd[CMDQ_ENT_DWORDS];
+	int idx, ret;
+	u32 pending;
+	bool skip;
+
+	if (!is_cmdq_enabled(smmu))
+		return 0;
+
+	pending = (1 << (smmu->cmdq_host.llq.max_n_shift)) - queue_space(&smmu->cmdq_host.llq);
+
+	hyp_spin_lock(&smmu->hw_lock);
+	/* Wait for the command queue to have some space. */
+	ret = smmu_wait(use_wfe, smmu_cmdq_has_space(&smmu->cmdq, pending));
+	if (ret) {
+		hyp_spin_unlock(&smmu->hw_lock);
+		return ret;
+	}
+
+	while (pending--) {
+		int i;
+
+		idx = Q_IDX(&smmu->cmdq_host.llq, smmu->cmdq_host.llq.cons);
+		queue_inc_cons(&smmu->cmdq_host.llq);
+
+		/* Copy the command to local buffer avoiding TOCTOU */
+		for (i = 0; i < CMDQ_ENT_DWORDS; ++i)
+			cmd[i] = le64_to_cpu(READ_ONCE(host_cmdq[idx * CMDQ_ENT_DWORDS + i]));
+
+		skip = smmu_filter_command(smmu, cmd);
+		if (WARN_ON(skip))
+			continue;
+		smmu_add_cmd_raw(smmu, cmd);
+	}
+
+	writel(smmu->cmdq.llq.prod, smmu->cmdq.prod_reg);
+
+	ret = smmu_wait(use_wfe, smmu_cmdq_empty(&smmu->cmdq));
+	hyp_spin_unlock(&smmu->hw_lock);
+	return ret;
+}
+
 static void smmu_emulate_cmdq_enable(struct hyp_arm_smmu_v3_device *smmu)
 {
 	u32 shift = smmu->cmdq_host.q_base & Q_BASE_LOG2SIZE;
@@ -381,18 +479,51 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 		 */
 		mask = read_only & ~(IDR0_S2P | IDR0_VMID16 | IDR0_MSI | IDR0_HYP | IDR0_ATS);
 		break;
-	/* Passthrough the register access for bisectability, handled later */
 	case ARM_SMMU_CMDQ_BASE:
+		/*
+		 * Although allowed to use smaller size, we rely on the SMMUv3 driver
+		 * using 64-bit store instruction for simplicity.
+		 */
+		if (len != sizeof(u64))
+			break;
 		if (is_write) {
 			/* Not allowed by the architecture */
 			if (is_cmdq_enabled(smmu))
 				break;
 			smmu->cmdq_host.q_base = val;
+			goto out_ret;
+		} else {
+			val = smmu->cmdq_host.q_base;
+			goto out_update_regs;
 		}
-		mask = read_write;
-		break;
 	case ARM_SMMU_CMDQ_PROD:
+		if (len != sizeof(u32))
+			break;
+		if (is_write) {
+			smmu->cmdq_host.llq.prod = val;
+			WARN_ON(smmu_emulate_cmdq_insert(smmu));
+			goto out_ret;
+		} else {
+			val = smmu->cmdq_host.llq.prod;
+			goto out_update_regs;
+		}
 	case ARM_SMMU_CMDQ_CONS:
+		if (len != sizeof(u32))
+			break;
+		if (is_write) {
+			if (WARN_ON(is_cmdq_enabled(smmu)))
+				break;
+
+			smmu->cmdq_host.llq.cons = val;
+			goto out_ret;
+		} else {
+			/* Propagate errors back to the host.*/
+			u32 cons = readl_relaxed(smmu->base + ARM_SMMU_CMDQ_CONS);
+
+			val = smmu->cmdq_host.llq.cons | (CMDQ_CONS_ERR & cons);
+			goto out_update_regs;
+		}
+	/* Passthrough the register access for bisectability, handled later */
 	case ARM_SMMU_STRTAB_BASE:
 	case ARM_SMMU_STRTAB_BASE_CFG:
 	case ARM_SMMU_GBPA:
@@ -468,10 +599,20 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 		mask = read_write;
 		break;
 	/* Allowed RO 32 bit registers. */
+	case ARM_SMMU_IDR1:
+		if (len != sizeof(u32))
+			break;
+		/* Cap CMDQS to the shadow queue size. */
+		if (!is_write) {
+			val = readl_relaxed(smmu->base + ARM_SMMU_IDR1);
+			val &= ~IDR1_CMDQS;
+			val |= FIELD_PREP(IDR1_CMDQS, smmu->cmdq.llq.max_n_shift);
+			goto out_update_regs;
+		}
+	fallthrough;
 	case ARM_SMMU_IIDR:
 	case ARM_SMMU_IDR5:
 	case ARM_SMMU_IDR3:
-	case ARM_SMMU_IDR1:
 	case ARM_SMMU_GERROR:
 		if (len != sizeof(u32))
 			break;
-- 
2.55.0.1082.g2b9226bbc0-goog

