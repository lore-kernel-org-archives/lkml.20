Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE76595750
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792094981; cv=none; b=LJT+StkFyPG3PWGODn5ZymKHWP94V1HU7l1p2/mwoXFaLEvdStyvfHYRZbWlNJiARPJaEhE8Z6aa4OX0sT4jCuhlFFVziJm4KG+eqxgFyfI/i2K9jjphy5tAYSQ33Bec0Pe9A2enHjTXPQ0hZ+LpOT6gFX30W4JyzA3zLdOt/jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792094981; c=relaxed/simple;
	bh=hu8Ca3NAu0Ymk1meYbnbfYAPWUvoT1ANrBH1t0G+/hU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lcbqJ4vglwNkhn1whgPRgyAW/6gIXaOVfrzQAZcXEQnGOSZAI/lomxSSC6G8RrISZ3zQxjzCYVOe7oS3i3xGLCSwYBXfUkK4sUwY+8I5LcIu0hKomTA1VUy6MFMa2jDCgfNY2Egk5yJK0wsWHa6HjvAfSZ+yPkiwbgSZHPUXLJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f+pgb33H; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f+pgb33H"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a0761224e1so21972035e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792094974; x=1792699774; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OrEOEPSGJdrT+r8ut9ZMnt1QbUsQgQecPDrsSjFG450=;
        b=f+pgb33Hxkp+aLH7JXzlUVd3+M2+IQ3Gb2AXWNA8Ohu+SEza2dWLNKTqjRCSZpiWIF
         Qb9hqFY3o+uwy4U628F+bDPdsS3RWgYxXpvhnXzWtFJxTNB2PyvqmJ/o1SPAblneCnqS
         mKGHEQKSFsFGvxJOuZVNgxXhWdW/HDYgFXtVmHgxs8DE2cy+2X7LPsGXj0klvFESxgu9
         avy9fV+1kKXZCKBbvcTQNDqADVS+sTMssYhekfv/EOdillorQL2G9ehynYr7AJg5389i
         Gu8zR2M4JugfabFPWLZggIv0Io5Dy2v6n04l40icq7dwbhNFdF5tZqGoXTS5jL4mv4zn
         lD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094974; x=1792699774;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OrEOEPSGJdrT+r8ut9ZMnt1QbUsQgQecPDrsSjFG450=;
        b=18H8FDJjDLAlicj2ewkaWjIrXQDxEWt1FNxJkacjTPqcLGraotAadPlG3fg3moOm/k
         O76CtvyqquHZyXaNHu0OQ7nar4nmiMkvTaqxOAOrsd2gVsJDZ5+db/N7/TZf4FbqB4jF
         iKmKgb4W55SANPNkKxokIejJ9QwL/IVHLEzzkSaL1Qpl77cZs1CEyG10wMXm3kwxWyg/
         AEOJ58mGBIx9f/9JxhEXQ171HA6MmvhKKpQ3nguEaXkqFs+aLWDUjVO5iCzrLJPU9ICE
         tRt2e8mCVcd8ilZkokW1Y189FWPPmThNdQKRwQyczu0vbFbaHugHVZVX3eukDJYHpdwg
         aBEA==
X-Forwarded-Encrypted: i=1; AKwUvBzvRGn6Ja5goKyZ13MxD9O7DnSANO668Fwp7my7fUTB2T3ZGuJnWI5iO5vgxTbBfMgriY9lM8Y1a2lrLCk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0hamxYwiOn53oinig+Xb9sITCuC1Nzp+4MTstHakscCEYF1+K
	AthzhkCtlymreV7OHkk8cJ4GIdpVBess3XlVIi17Uo3OOwaaaw3KwJC5VxC1srNhEyFvzJMaU5X
	zSCBzBRPCE0M1TA==
X-Received: from wmbf10.prod.google.com ([2002:a05:600c:594a:b0:4a1:b4c7:1ef2])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e07:b0:4a1:8627:aec7 with SMTP id 5b1f17b1804b1-4a18e4987abmr362157685e9.5.1792094974491;
 Thu, 15 Oct 2026 13:09:34 -0700 (PDT)
Date: Thu, 15 Oct 2026 20:08:50 +0000
In-Reply-To: <20261015200903.2735565-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261015200903.2735565-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261015200903.2735565-20-smostafa@google.com>
Subject: [PATCH v9 19/25] iommu/arm-smmu-v3-kvm: Share other queues
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	nicolinc@nvidia.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

The event and PRI queues are written by the SMMU, not read by the
hypervisor, so they are not shadowed. They still must not be pointed at
protected memory: when the host enables a queue, share and pin its
memory, which fails unless the host owns it and keeps the host from
donating it afterwards.

The queues stay shared once enabled, as the SMMU may keep writing until
CR0ACK reflects the disable, and the base may not change once shared.
The kernel driver programs each base once and never changes it.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c    | 81 +++++++++++++++++--
 .../arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h    |  8 ++
 2 files changed, 84 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
index 132f3a9ba308..1972df1d2a8d 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
@@ -82,6 +82,16 @@ static bool is_smmu_enabled(struct hyp_arm_smmu_v3_device *smmu)
 	return FIELD_GET(CR0_SMMUEN, smmu->cr0);
 }
 
+static bool is_evtq_enabled(struct hyp_arm_smmu_v3_device *smmu)
+{
+	return FIELD_GET(CR0_EVTQEN, smmu->cr0);
+}
+
+static bool is_priq_enabled(struct hyp_arm_smmu_v3_device *smmu)
+{
+	return FIELD_GET(CR0_PRIQEN, smmu->cr0);
+}
+
 /*
  * Host structures the hypervisor reads (CMDQ, STE) are shared and pinned:
  * - Prevent the host from donating this memory.
@@ -663,6 +673,20 @@ static void smmu_emulate_cmdq_disable(struct hyp_arm_smmu_v3_device *smmu)
 				   cmdq_size(&smmu->cmdq_host)));
 }
 
+static void smmu_share_queue(struct hyp_arm_smmu_v3_device *smmu,
+			     unsigned long q_base, size_t ent_size_shift)
+{
+	/* Q_BASE_ADDR_MASK is not enough as the SMMU also ignores bits > OAS */
+	phys_addr_t base = q_base & Q_BASE_ADDR_MASK & ((1ULL << smmu->oas) - 1);
+	size_t size = 1UL << (FIELD_GET(Q_BASE_LOG2SIZE, q_base) + ent_size_shift);
+
+	/* The host must program the base first and it must be aligned to size. */
+	if (WARN_ON(!q_base || (base & (size - 1))))
+		return;
+
+	WARN_ON(smmu_share_pages(base, size));
+}
+
 static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 			     struct user_pt_regs *regs,
 			     u64 esr, u32 off)
@@ -768,6 +792,8 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 		if (is_write) {
 			bool last_cmdq_en = is_cmdq_enabled(smmu);
 			bool last_smmu_en = is_smmu_enabled(smmu);
+			bool last_evtq_en = is_evtq_enabled(smmu);
+			bool last_priq_en = is_priq_enabled(smmu);
 
 			/* Enforce ATS checks. */
 			if (smmu->features & ARM_SMMU_FEAT_ATS)
@@ -777,6 +803,26 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 				smmu_emulate_cmdq_enable(smmu);
 			else if (last_cmdq_en && !is_cmdq_enabled(smmu))
 				smmu_emulate_cmdq_disable(smmu);
+
+			/*
+			 * Share PRI and EVTQ to avoid the host using them to write to
+			 * protected memory. However, do not unshare the queues at disable
+			 * as that is more complicated, unsharing from here can lead to
+			 * use-after-unshare issues, and requires ordering with cr0ack.
+			 * The host can disable those queues during shutdown, but it never
+			 * changes the base address (even with RPM), so leave the queue
+			 * shared and assert that multiple host writes do not change it.
+			 */
+			if (!last_evtq_en && is_evtq_enabled(smmu) && !smmu->evtq_shared) {
+				smmu_share_queue(smmu, smmu->evtq_base, EVTQ_ENT_SZ_SHIFT);
+				smmu->evtq_shared = true;
+			}
+
+			if (!last_priq_en && is_priq_enabled(smmu) && !smmu->priq_shared) {
+				smmu_share_queue(smmu, smmu->priq_base, PRIQ_ENT_SZ_SHIFT);
+				smmu->priq_shared = true;
+			}
+
 			if (!last_smmu_en && is_smmu_enabled(smmu))
 				smmu_emulate_enable(smmu);
 			else if (last_smmu_en && !is_smmu_enabled(smmu))
@@ -806,6 +852,34 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 
 		mask = read_write;
 		break;
+	case ARM_SMMU_EVTQ_BASE:
+		if (len != sizeof(u64))
+			break;
+
+		if (is_write) {
+			/* See ARM_SMMU_CR0 */
+			if (is_evtq_enabled(smmu) ||
+			    (smmu->evtq_shared && smmu->evtq_base != val))
+				break;
+			smmu->evtq_base = val;
+		}
+		mask = read_write;
+		break;
+
+	case ARM_SMMU_PRIQ_BASE:
+		if (len != sizeof(u64))
+			break;
+
+		if (is_write) {
+			/* See ARM_SMMU_CR0 */
+			if (is_priq_enabled(smmu) ||
+			    (smmu->priq_shared && smmu->priq_base != val))
+				break;
+			smmu->priq_base = val;
+		}
+		mask = read_write;
+		break;
+
 	/* Allowed 32 bit registers. */
 	case ARM_SMMU_EVTQ_IRQ_CFG1:
 	case ARM_SMMU_EVTQ_IRQ_CFG2:
@@ -833,15 +907,12 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 	case ARM_SMMU_EVTQ_IRQ_CFG0:
 	case ARM_SMMU_PRIQ_IRQ_CFG0:
 	case ARM_SMMU_GERROR_IRQ_CFG0:
+		if (len != sizeof(u64))
+			break;
 		/* These are RES0 as MSI support is hidden. */
 		val = 0;
 		if (!is_write)
 			goto out_update_regs;
-		fallthrough;
-	case ARM_SMMU_EVTQ_BASE:
-	case ARM_SMMU_PRIQ_BASE:
-		if (len != sizeof(u64))
-			break;
 		mask = read_write;
 		break;
 	/* Allowed RO 32 bit registers. */
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
index 31ab7a0335a8..2fb478e9233a 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
@@ -32,6 +32,10 @@
  * @strtab_cfg:		Stream table config as seen by HW
  * @strtab_dma:		Physical address of the shadow stream table
  * @strtab_size:	Size of the shadow stream table
+ * @evtq_base:		Host EVTQ_BASE value
+ * @priq_base:		Host PRIQ_BASE value
+ * @evtq_shared:	Whether the EVTQ was shared
+ * @priq_shared:	Whether the PRIQ was shared
  *
  * @mmio_addr, @mmio_size and ARM_SMMU_FEAT_COHERENCY are filled by the host
  * before de-privilege, the rest by the hypervisor driver.
@@ -61,6 +65,10 @@ struct hyp_arm_smmu_v3_device {
 	u64			host_ste_cfg;
 	u64			host_ste_base;
 	struct arm_smmu_strtab_cfg strtab_cfg;
+	u64			evtq_base;
+	u64			priq_base;
+	bool			evtq_shared;
+	bool			priq_shared;
 };
 
 #ifdef __KVM_NVHE_HYPERVISOR__
-- 
2.56.0.176.g3575e65682-goog

