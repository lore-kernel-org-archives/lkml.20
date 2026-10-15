Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E914548562
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792094971; cv=none; b=VvE7Ouh70NQdoO21tvlMHKAayuDR43+JmFEAAriLyvimz6EW/+bJZhpSwuq5d4tJsvnJQQvmeRIs39liq33rZm1i/J3p2sYCrhrh3FN6sM1AFtVZWZYGYVQb3qiWQJ4ajUzmzJURY+A8hSwzaHv8tLha2toDJXm6ZfNXpQDQNzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792094971; c=relaxed/simple;
	bh=hMNpCYihSvV4R6sPhQV6qnrtxA6hcUizJETpMZs37M0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gAmfqu/mUKl1xE1IDX8HxuAOVH+pZW1U7aDEktg2+bh83b/qKYGn3yuPQBrYJvnjbDqYKk6o7WWSKZzvDg3xFsBV15SgDY7NgLlQ620lqGaxuaXlEhjQ8a5HHgl1vSmW7tBs5K+JtsrVwxiZ+Bc9bwhwdt84ZPN/H3SfvrjbSqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pY87Jo4q; arc=none smtp.client-ip=209.85.218.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pY87Jo4q"
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c3f88d2ff28so81592766b.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792094966; x=1792699766; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3u/Wwfq4O359uWiEJsBsS49XBNpLbBfsGX6z5I3CMkU=;
        b=pY87Jo4qqFjxZd+axX2FoIOJM297mh+KP2oUOvoc8Qo9HiDtN1hsp+5n1R5qUU9rMI
         HSzMzO3EIH8LJwQGRG3x9Xhyf5e6ZW2v6Og2fQ+Sc1q/nGn8cpT9AafD8puOsOfmQdq9
         MJr5uaS4Q+MKc5/6j5qonEwbCxx1DsR4QQqCxkK864hHUhX0WDlGILnQVijEemB9qXzp
         gZaTeKNnmS4+WjnlxYBanjuo9nUfzqJzn9ewiSyUICEGtnON7zKwWTUkSlRikGiq9Ifd
         4Y/WpffwhZtCnQGu8+oKJV8WrexDQ3Uh4dTmK4lgRtUYU/XPgPbDFfiDqnFeuIAIiGRP
         PvoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094966; x=1792699766;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3u/Wwfq4O359uWiEJsBsS49XBNpLbBfsGX6z5I3CMkU=;
        b=y4lz3pNcmCxn5hIuEGRlgACN6v6H9rge+QFbx3OM5b62w8AhfsnLqgsDApSX6kEv0/
         R8Q+JYt6OrE3E8lBxMzYUvQcsxe+kLsukC2rie1StSQpLthS9N2EJhhnaRcIsDWJr5fF
         VVKCS5k4oM7m/E+gm23eCyvsxhxSqBLDEeK779E4m1emy8R38hh8hPmOALyc+N7hMf9N
         3jINAWpgkG1pPQ1nGW5xbjvarfhYH5yaXiIY80kOwTOKpP/V8THgX9/CdUKJIb6BWeJA
         1rIckyjniqU8wUGYAxjLY/VVWsfedjnmJ2MZhYU2HK0C+KSbTk5IaqMbph2Cvl3aAIck
         yxPA==
X-Forwarded-Encrypted: i=1; AKwUvBxye8qQBfLeGUHFcvgRM8ygV4vhta4DaNsVxKoBYUMFbMVk5hSeirotS9RCY5LwI3Nj1A3PnK/0j5ynb/Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0B0WVAZpzLNgUYMEZ7Q8QW8hqhw3C5g4K/7q0rjlvghr7y6tn
	wl72QM2szkXYjvFmmDSOw6WNMmnZEC1CiIJzxT3YNH9eD2xfouYjATl+fleWeM+Assx7BOmdc+w
	uIcCznqBI2CyLYQ==
X-Received: from edfz6.prod.google.com ([2002:a05:6402:a406:b0:6b1:b15e:791f])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:9720:b0:c26:337e:7e05 with SMTP id a640c23a62f3a-c31a9a29d50mr1794237266b.4.1792094966321;
 Thu, 15 Oct 2026 13:09:26 -0700 (PDT)
Date: Thu, 15 Oct 2026 20:08:44 +0000
In-Reply-To: <20261015200903.2735565-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261015200903.2735565-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261015200903.2735565-14-smostafa@google.com>
Subject: [PATCH v9 13/25] iommu/arm-smmu-v3-kvm: Add MMIO emulation
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	nicolinc@nvidia.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

Add data abort handler for the SMMUs, at the moment most registers
are just passthrough.
In the next patches CMDQ/STE emulation will be added which inserts
logic to some register access.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c    | 169 ++++++++++++++++++
 .../arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h    |  18 ++
 2 files changed, 187 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
index 2b4a0f961a66..d95b459a796a 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
@@ -9,6 +9,7 @@
 
 #include <nvhe/iommu.h>
 #include <nvhe/mem_protect.h>
+#include <nvhe/trap_handler.h>
 
 #include "arm-smmu-v3-hyp.h"
 #include "../arm-smmu-v3.h"
@@ -80,6 +81,9 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 	if (!PAGE_ALIGNED(smmu->mmio_addr | smmu->mmio_size))
 		return -EINVAL;
 
+	hyp_spin_lock_init(&smmu->lock);
+	hyp_spin_lock_init(&smmu->hw_lock);
+
 	ret = __pkvm_host_donate_hyp_mmio(hyp_phys_to_pfn(smmu->mmio_addr),
 					  smmu->mmio_size >> PAGE_SHIFT, &haddr);
 	if (ret)
@@ -128,6 +132,170 @@ static int smmu_init(void)
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
+
+		if (is_write) {
+			/* Enforce ATS checks. */
+			if (smmu->features & ARM_SMMU_FEAT_ATS)
+				val |= CR0_ATSCHK;
+			mask = read_write;
+		} else {
+			mask = read_write & ~CR0_ATSCHK;
+		}
+		break;
+	case ARM_SMMU_CR0ACK:
+		if (len != sizeof(u32))
+			break;
+		mask = read_only & ~CR0_ATSCHK;
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
+	case ARM_SMMU_IRQ_CTRL:
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
+	case ARM_SMMU_IRQ_CTRLACK:
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
@@ -137,4 +305,5 @@ static int smmu_host_stage2_idmap(phys_addr_t start, phys_addr_t end, int prot)
 struct pkvm_iommu_ops smmu_ops = {
 	.init				= smmu_init,
 	.host_stage2_idmap		= smmu_host_stage2_idmap,
+	.dabt_handler			= smmu_dabt_handler,
 };
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
index c2630397f57a..afc3ca791583 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
@@ -4,6 +4,10 @@
 
 #include <asm/kvm_asm.h>
 
+#ifdef __KVM_NVHE_HYPERVISOR__
+#include <nvhe/spinlock.h>
+#endif
+
 /**
  * struct hyp_arm_smmu_v3_device - SMMUv3 instance owned by the hypervisor
  * @mmio_addr:		Physical address of the SMMU registers
@@ -14,6 +18,9 @@
  * @oas:		Output address size
  * @pgsize_bitmap:	Supported page sizes
  * @sid_bits:		Number of StreamID bits
+ * @lock:		Lock to protect SMMU emulation
+ * @hw_lock:		Lock to protect SMMU HW (e.g. CMDQ)
+ *			Order smmu.lock => host_mmu.lock => smmu.hw_lock
  *
  * @mmio_addr, @mmio_size and ARM_SMMU_FEAT_COHERENCY are filled by the host
  * before de-privilege, the rest by the hypervisor driver.
@@ -27,8 +34,19 @@ struct hyp_arm_smmu_v3_device {
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
 
+#ifdef __KVM_NVHE_HYPERVISOR__
+static_assert(sizeof(hyp_spinlock_t) == sizeof(u32));
+#endif
+
 extern size_t kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count);
 #define kvm_hyp_arm_smmu_v3_count kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count)
 
-- 
2.56.0.176.g3575e65682-goog

