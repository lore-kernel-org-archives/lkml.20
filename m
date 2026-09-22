Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2BC54EEBD
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790082805; cv=none; b=nwUBFqil/RCu9IMJMarErNbgcJXFRXuQuEu65GkzZm66iX8ONPb9ugOwYLqu9mRrmTP3wxyTdvyeMJH5iWpOxEQ6p79XYHmVQL5K+6cLMFUe5JwPsArb4cqqUVfIx+IxSbhCZTOEDekuEd8do0oKIS32aEDPoj8ntG3sZs5r8XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790082805; c=relaxed/simple;
	bh=p5qpbVKyHUQdBt1ZWE/Etjxj1ndlFV8SDlH8oV9nRxs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NiCSdflnB4IvZC85tvyN/CUEIV2ii/b79aiw837Z3GwzKnYZI/BUGe9LhScscI63UR7nfQRFvNpO3hhtnHPN1beVORkmkJQBIcewOsDRy5g48DTkAjnJuZsVf3D2KjX0iU0UVXCO2fS3Tfd+HLpDv41i0bRBRxzKZvByBslTdYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VCi0h3Bx; arc=none smtp.client-ip=209.85.221.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VCi0h3Bx"
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-486f768517dso2940421f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790082798; x=1790687598; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/hThxK9oWqmxlAW/I6V9d0fEEgR3CjLPBt+Zl9hODDc=;
        b=VCi0h3Bxm4vfvVhTgASrz2ABMUVIqj68eX0Tc95YRiL6YNsO8KT8LWRoR/mTAk+48a
         wtVbut5unhqWts8kXn0qqtiHXravOajmoas+um3EuiHc8laSDtkoDIS1Q7iy0LAmdZO2
         Sgb18ckGgZqLU3ckQc1K2fOrYR5OpcD+W1NhMDRt3CAhEFnOIhMWB7u9cdfPVVg/EwGY
         RP6ZWSpALm6M9Zet1QnGq6t2LXT4OYYE91tmxoab2CG8UGf674FzPlTSp4JqmwgAfYS2
         g7I5gFOD+Y9a9ASMNyvjZE2b3UcbmnHy9tiO34CYlENTXSY1Cw4VjEZ4w7vLcTl8GG1F
         sI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082798; x=1790687598;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/hThxK9oWqmxlAW/I6V9d0fEEgR3CjLPBt+Zl9hODDc=;
        b=Rc12jzZaTp/saFkYKGbNdB3txfxGN89mO4R55rynnFtr6uwAVBaZQ9L3epV0n7txAc
         eh4keuuZe+uTgXUssLObdD8abuBuVGAN6xsvjFtBQJCp8tcJtl4qwbSKyqWIWCTw2U/p
         9Uyz8yt7URGvjuwp2goO9h/3PR5keRdENV3vrQ9Nn2bjk7VYXxFprdSeTfVBTkrrHlUx
         BuqMa3Vogbd1ewdv/OKQ+9h1XyLgoQ4wbtGNhrKQP8MYWGgbQXTk9xNYRBlX3N24vQXv
         NVINJhEKsVQ7VxI5IgZ5BzfIpVGiWNL76CE1cSQs7rfTQk/33GYYe81ZDWw0v0/ZuXCw
         HTwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwq80IzVH1k4bGU+65V8uziDscPGXMHptkih8kKzlC9syMSDf8lQhSaQXuNCtzfkIOELFga4QwIL2KG460=@vger.kernel.org
X-Gm-Message-State: AFuF++lPpsTwzk6jRhxLSN0i9pNR+XDRVm51Jyq2ahscITau+Cq3FGWz
	C0eAPq9PzkBnP/EAhWXBum00kCV3ETSFtiJSNVkfpFF44zb6ne4EnGtz5Pg+wyRJoa/cUg+jHBx
	Hu/O0AyohYt8edg==
X-Received: from wrbfq4.prod.google.com ([2002:a05:6000:2a04:b0:485:b062:3aa2])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:608:b0:485:ac96:7251 with SMTP id ffacd0b85a97d-4871e376c01mr24499522f8f.21.1790082798294;
 Tue, 22 Sep 2026 06:13:18 -0700 (PDT)
Date: Tue, 22 Sep 2026 13:12:46 +0000
In-Reply-To: <20260922131259.2975334-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260922131259.2975334-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922131259.2975334-14-smostafa@google.com>
Subject: [PATCH v8 13/25] iommu/arm-smmu-v3-kvm: Add MMIO emulation
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

Add data abort handler for the SMMUs, at the moment most registers
are just passthrough.
In the next patches CMDQ/STE emulation will be added which inserts
logic to some register access.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h    |  14 ++
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 159 ++++++++++++++++++
 2 files changed, 173 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
index 91177f00fa97..58fa14c239e3 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
@@ -4,6 +4,10 @@
 
 #include <asm/kvm_asm.h>
 
+#ifdef __KVM_NVHE_HYPERVISOR__
+#include <nvhe/spinlock.h>
+#endif
+
 /*
  * Parameters from the trusted host:
  * @mmio_addr		base address of the SMMU registers
@@ -14,6 +18,9 @@
  * @oas			PA size
  * @pgsize_bitmap	Supported page sizes
  * @sid_bits		Max number of SID bits supported
+ * @lock		Lock to protect SMMU emulation
+ * @hw_lock		Lock to protect SMMU HW (as CMDQ)
+ *			Order smmu.lock => host_mmu.lock => smmu.hw_lock
  */
 struct hyp_arm_smmu_v3_device {
 	phys_addr_t		mmio_addr;
@@ -24,6 +31,13 @@ struct hyp_arm_smmu_v3_device {
 	unsigned long		oas;
 	unsigned long		pgsize_bitmap;
 	unsigned int		sid_bits;
+#ifdef __KVM_NVHE_HYPERVISOR__
+	hyp_spinlock_t		lock;
+	hyp_spinlock_t		hw_lock;
+#else
+	u32			lock;
+	u32			hw_lock;
+#endif
 };
 
 extern size_t kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count);
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index f8b7c5406017..7a51cb70205f 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -8,6 +8,7 @@
 
 #include <nvhe/iommu.h>
 #include <nvhe/mem_protect.h>
+#include <nvhe/trap_handler.h>
 
 #include "arm-smmu-v3-hyp.h"
 #include "../arm-smmu-v3.h"
@@ -78,6 +79,9 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 	if (!PAGE_ALIGNED(smmu->mmio_addr | smmu->mmio_size))
 		return -EINVAL;
 
+	hyp_spin_lock_init(&smmu->lock);
+	hyp_spin_lock_init(&smmu->hw_lock);
+
 	ret = __pkvm_host_donate_hyp_mmio(hyp_phys_to_pfn(smmu->mmio_addr),
 					  smmu->mmio_size >> PAGE_SHIFT, &haddr);
 	if (ret)
@@ -117,6 +121,8 @@ static int smmu_init(void)
 			goto out_reclaim_smmu;
 	}
 
+	BUILD_BUG_ON(sizeof(hyp_spinlock_t) != sizeof(u32));
+
 	return 0;
 
 out_reclaim_smmu:
@@ -126,6 +132,158 @@ static int smmu_init(void)
 	return ret;
 }
 
+static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
+			     struct user_pt_regs *regs,
+			     u64 esr, u32 off)
+{
+	bool is_write = esr & ESR_ELx_WNR;
+	unsigned int len = BIT((esr & ESR_ELx_SAS) >> ESR_ELx_SAS_SHIFT);
+	int rd = (esr & ESR_ELx_SRT_MASK) >> ESR_ELx_SRT_SHIFT;
+	const u64 read_write = -1ULL;
+	const u64 no_access = 0;
+	u64 mask = no_access;
+	const u64 read_only = is_write ? no_access : read_write;
+	bool is_xzr = (rd == 31);
+	u64 val = is_xzr ? 0 : regs->regs[rd];
+
+	switch (off) {
+	case ARM_SMMU_IDR0:
+		if (len != sizeof(u32))
+			break;
+		/*
+		 * Clear stage-2 support, hide MSI to avoid write back to cmdq,
+		 * and hide ATS as it is not emulated or handled in TLB invalidation.
+		 */
+		mask = read_only & ~(IDR0_S2P | IDR0_VMID16 | IDR0_MSI | IDR0_HYP | IDR0_ATS);
+		break;
+	/* Passthrough the register access for bisectability, handled later */
+	case ARM_SMMU_CMDQ_BASE:
+	case ARM_SMMU_CMDQ_PROD:
+	case ARM_SMMU_CMDQ_CONS:
+	case ARM_SMMU_STRTAB_BASE:
+	case ARM_SMMU_STRTAB_BASE_CFG:
+	case ARM_SMMU_GBPA:
+		mask = read_write;
+		break;
+	case ARM_SMMU_CR0:
+		if (len != sizeof(u32))
+			break;
+		mask = read_write;
+		break;
+	case ARM_SMMU_CR1:
+		if (len != sizeof(u32))
+			break;
+		/* Don't mess with shareability/cacheability. */
+		if (is_write &&
+		    (val != (FIELD_PREP(CR1_TABLE_SH, ARM_SMMU_SH_ISH) |
+			     FIELD_PREP(CR1_TABLE_OC, CR1_CACHE_WB) |
+			     FIELD_PREP(CR1_TABLE_IC, CR1_CACHE_WB) |
+			     FIELD_PREP(CR1_QUEUE_SH, ARM_SMMU_SH_ISH) |
+			     FIELD_PREP(CR1_QUEUE_OC, CR1_CACHE_WB) |
+			     FIELD_PREP(CR1_QUEUE_IC, CR1_CACHE_WB))))
+			break;
+
+		mask = read_write;
+		break;
+	/* Allowed 32 bit registers. */
+	case ARM_SMMU_EVTQ_IRQ_CFG1:
+	case ARM_SMMU_EVTQ_IRQ_CFG2:
+	case ARM_SMMU_GERROR_IRQ_CFG1:
+	case ARM_SMMU_GERROR_IRQ_CFG2:
+	case ARM_SMMU_PRIQ_IRQ_CFG1:
+	case ARM_SMMU_PRIQ_IRQ_CFG2:
+		/* These are RES0 as MSI support is hidden. */
+		val = 0;
+		if (!is_write)
+			goto out_update_regs;
+		fallthrough;
+	case ARM_SMMU_EVTQ_PROD + SZ_64K:
+	case ARM_SMMU_EVTQ_CONS + SZ_64K:
+	case ARM_SMMU_PRIQ_PROD + SZ_64K:
+	case ARM_SMMU_PRIQ_CONS + SZ_64K:
+	case ARM_SMMU_GERRORN:
+	case ARM_SMMU_IRQ_CTRLACK:
+	case ARM_SMMU_IRQ_CTRL:
+	case ARM_SMMU_CR0ACK:
+	case ARM_SMMU_CR2:
+		if (len != sizeof(u32))
+			break;
+		mask = read_write;
+		break;
+	/* Allowed 64 bit registers. */
+	case ARM_SMMU_EVTQ_IRQ_CFG0:
+	case ARM_SMMU_PRIQ_IRQ_CFG0:
+	case ARM_SMMU_GERROR_IRQ_CFG0:
+		/* These are RES0 as MSI support is hidden. */
+		val = 0;
+		if (!is_write)
+			goto out_update_regs;
+		fallthrough;
+	case ARM_SMMU_EVTQ_BASE:
+	case ARM_SMMU_PRIQ_BASE:
+		if (len != sizeof(u64))
+			break;
+		mask = read_write;
+		break;
+	/* Allowed RO 32 bit registers. */
+	case ARM_SMMU_IIDR:
+	case ARM_SMMU_IDR5:
+	case ARM_SMMU_IDR3:
+	case ARM_SMMU_IDR1:
+	case ARM_SMMU_GERROR:
+		if (len != sizeof(u32))
+			break;
+		mask = read_only;
+		break;
+	}
+
+	if (WARN_ON(!mask))
+		goto out_ret;
+
+	hyp_spin_lock(&smmu->hw_lock);
+	if (is_write) {
+		if (len == sizeof(u64))
+			writeq_relaxed(val & mask, smmu->base + off);
+		else
+			writel_relaxed(val & mask, smmu->base + off);
+
+		hyp_spin_unlock(&smmu->hw_lock);
+		return true;
+	}
+
+	if (len == sizeof(u64))
+		val = readq_relaxed(smmu->base + off) & mask;
+	else
+		val = readl_relaxed(smmu->base + off) & mask;
+	hyp_spin_unlock(&smmu->hw_lock);
+out_update_regs:
+	/*
+	 * Device might be read sensitive, so do it but ignore writing
+	 * back for xzr.
+	 */
+	if (!is_xzr)
+		regs->regs[rd] = val;
+
+out_ret:
+	return true;
+}
+
+static bool smmu_dabt_handler(struct user_pt_regs *regs, u64 esr, u64 addr)
+{
+	struct hyp_arm_smmu_v3_device *smmu;
+	bool ret;
+
+	for_each_smmu(smmu) {
+		if (addr < smmu->mmio_addr || addr >= smmu->mmio_addr + smmu->mmio_size)
+			continue;
+		hyp_spin_lock(&smmu->lock);
+		ret = smmu_dabt_device(smmu, regs, esr, addr - smmu->mmio_addr);
+		hyp_spin_unlock(&smmu->lock);
+		return ret;
+	}
+	return false;
+}
+
 static int smmu_host_stage2_idmap(phys_addr_t start, phys_addr_t end, int prot)
 {
 	return 0;
@@ -135,4 +293,5 @@ static int smmu_host_stage2_idmap(phys_addr_t start, phys_addr_t end, int prot)
 struct pkvm_iommu_ops smmu_ops = {
 	.init				= smmu_init,
 	.host_stage2_idmap		= smmu_host_stage2_idmap,
+	.dabt_handler			= smmu_dabt_handler,
 };
-- 
2.55.0.1082.g2b9226bbc0-goog

