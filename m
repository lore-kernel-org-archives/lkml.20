Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF41D556BB1
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790082817; cv=none; b=T5kepFkkZTnk+HwnzhkEnvzQO2CqWozn4cxf/ekbgDBacQWqzYKx/Nf6zA1OFShPDHh7qKTYWx6WOHW6cl07IXBByhe3+7J9raFAypwytdZUCKPZS+l3tXvlEMbPRQCsja0BmBbxKCDAp1Bk2XI/EFVvEulhQKxFzCqppr/wyXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790082817; c=relaxed/simple;
	bh=Bte3U2jNr8h2l27CX0mTcKAn2nQG5DqHbW3dMoRJgUk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kW5BjJtMO8zEKjEJSFczD2djnV+7eOcAMjN9asatfIDsE+0FC2rJL6a4UqrVTFB4e68LBiQES2j6Dv2/2j8SwfuoWNQCdFRBebQrWSLTqw+DeBcgXEzLJeZ7qR2hAcmbD3lhPfeNt01Bg8MwTcVUV8qpLL6ksUJrRHTK4CKtMSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mM6j3DTy; arc=none smtp.client-ip=209.85.208.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mM6j3DTy"
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6a98e5d6e49so5757008a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790082808; x=1790687608; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Rl6CILqO70QDksOqY0Bp+kvCcZlw9/1DWfpX87Gkto=;
        b=mM6j3DTyMI3vWk1OV0a04vI1/ZsF4cNbMDjdoC6gmMsWaOw8gwVW/jGF9ldmjIpFmp
         1ZMGxw03vYZzIoM82x+1z0xYK+/6YEKT93zg0oLjB39Zak71G+Bl/snRaT/Wm+y01QPu
         6edYuTK2LD3kEOkm6anDYsGz1NN2Xo+OlxblNm6ad516wtp1ViyKyfhrDJablmjXREPl
         IlWO/MhRPwnpmjqvS453/SOjc4O/4MLFOdRVMheZTOa8LH9MNAp1KA9mDIuszuPmjerW
         wmDoXqDbK3bZvF4ru3EcAS2sBzxCtVOhQGcn88d63g6g1w9AUpAs3UPFO0Ruo8LyjF6j
         RhTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082808; x=1790687608;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Rl6CILqO70QDksOqY0Bp+kvCcZlw9/1DWfpX87Gkto=;
        b=GRizFZ9M2rDT4VXvNedOTplgC1dWNhHaQODE1jo53VxuFbzIMkOsZFQ072Yrvi3UVQ
         fS1I1hKyqRoJI8dzFoLrZEggpnnsC9JjTM96FTUpZz4P4DMHzjbMIJ5ZjPsOeTqCsbOQ
         50KLqyQ3JeZ5g8mcSJPnYyDHoGRPzJVNnXQy1OQpUNWLKuqxf0txO/NQ+98H+1mVaXkm
         6Izh2suUCkvr8drJIqVyvYeRu19+xLlrqbQYYjBpf0LW5VbAL+iue0PdXQnk21G02+ZG
         d4CoSFvuU19O8WytaYgIVDA/vIxVSnWFQzYkpZ1I1tvDGnaBFftj4QjnWHG1CpEMayC9
         Faqw==
X-Forwarded-Encrypted: i=1; AKwUvBx/e2ZOUPoSbFPBwvJY5Dpyh69lnEkTO5r1YsgeDiizHFdC+aD/1HaxCgBOaJzXE1B8jRzd2engAv5l1FQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mtugknIL+krIEIE4UQjmxiN4cFgnypDdfgDlghUhpE9YgWCKqB
	E6MwOaCQzAosbH/SQf6B9YgWUb+Nb7rytfeY8ANlg8RN8M+d11yPDt185V7BM35J3lpbO39fL/9
	3FHaZiJb+zRY8BQ==
X-Received: from edyg23.prod.google.com ([2002:a05:6402:1817:b0:6a7:4541:3de3])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:400e:b0:6aa:ad13:40bc with SMTP id 4fb4d7f45d1cf-6aaad1345f1mr269989a12.37.1790082808295;
 Tue, 22 Sep 2026 06:13:28 -0700 (PDT)
Date: Tue, 22 Sep 2026 13:12:54 +0000
In-Reply-To: <20260922131259.2975334-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260922131259.2975334-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922131259.2975334-22-smostafa@google.com>
Subject: [PATCH v8 21/25] iommu/io-pgtable-arm: Support io-pgtable-arm in the hypervisor
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

To be able to populate the shadow stage-2 in the hypervisor, compile
io-pgtable-arm object for the hypervisor.

That requires the hypervisor to provide the iommu-pages allocator,
redefine the address conversion helpers, and stub out the DMA API.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/Makefile              |  3 +-
 .../arm/arm-smmu-v3/pkvm/io-pgtable-arm-hyp.h | 86 +++++++++++++++++++
 drivers/iommu/io-pgtable-arm.c                | 14 +--
 drivers/iommu/io-pgtable-arm.h                |  9 ++
 4 files changed, 104 insertions(+), 8 deletions(-)
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm-hyp.h

diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index aa76c0f3f147..64bfd9992d9e 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -36,7 +36,8 @@ hyp-obj-y += $(lib-objs)
 HYP_SMMU_V3_DRV_PATH = ../../../../../drivers/iommu/arm/arm-smmu-v3
 
 hyp-obj-$(CONFIG_ARM_SMMU_V3_PKVM) += $(HYP_SMMU_V3_DRV_PATH)/pkvm/arm-smmu-v3.o \
-	$(HYP_SMMU_V3_DRV_PATH)/arm-smmu-v3-common-lib.o ../../../../../lib/hweight.o
+	$(HYP_SMMU_V3_DRV_PATH)/arm-smmu-v3-common-lib.o ../../../../../lib/hweight.o \
+	$(HYP_SMMU_V3_DRV_PATH)/../../io-pgtable-arm.o
 
 # Path to simple_ring_buffer.c
 CFLAGS_trace.nvhe.o += -I$(srctree)/kernel/trace/
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm-hyp.h b/drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm-hyp.h
new file mode 100644
index 000000000000..16313814e5f8
--- /dev/null
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm-hyp.h
@@ -0,0 +1,86 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef IO_PGTABLE_ARM_HYP_H_
+#define IO_PGTABLE_ARM_HYP_H_
+
+#include <nvhe/memory.h>
+#include <nvhe/iommu.h>
+
+#undef WARN_ONCE
+#define WARN_ONCE(condition, format...) WARN_ON(condition)
+
+static inline void *iommu_alloc_pages_node_sz(int nid, gfp_t gfp, size_t size)
+{
+	return pkvm_iommu_alloc_pages(get_order(size));
+}
+
+static inline void iommu_free_pages(void *virt)
+{
+	pkvm_iommu_free_pages(virt);
+}
+
+#define arm_lpae_alloc_data(type)	pkvm_iommu_alloc_pages(get_order(sizeof(type)))
+#define arm_lpae_free_data(p)		pkvm_iommu_free_pages(p)
+
+#undef phys_to_virt
+#define phys_to_virt(x)		hyp_phys_to_virt(x)
+
+#undef virt_to_phys
+#define virt_to_phys(x)		hyp_virt_to_phys(x)
+
+/* Stubs used by io-pgtable-arm but no relevant for hypervisor object. */
+#undef dma_map_single
+#define dma_map_single(d, p, s, dir) (virt_to_phys(p))
+
+#undef dma_unmap_single
+#define dma_unmap_single(d, a, s, r) \
+	do { (void)(d); (void)(a); (void)(s); (void)(r); } while (0)
+
+#define dma_sync_single_for_device(d, a, s, r) \
+	do { (void)(d); (void)(a); (void)(s); (void)(r); } while (0)
+
+#undef dma_mapping_error
+#define dma_mapping_error(...) (0)
+
+#undef dev_err
+#define dev_err(dev, format, ...)
+
+#undef iommu_dirty_bitmap_record
+#define iommu_dirty_bitmap_record(d, i, l) \
+	do { (void)(d); (void)(i); (void)(l); } while (0)
+
+static inline int iommu_pages_start_incoherent(void *virt, struct device *dma_dev)
+{
+	return 0;
+}
+
+static inline void iommu_pages_free_incoherent(void *virt,
+					       struct device *dma_dev)
+{
+}
+
+static inline void iommu_pages_flush_incoherent(struct device *dma_dev,
+						void *virt, size_t offset,
+						size_t len)
+{
+}
+
+static inline struct io_pgtable_ops *kvm_alloc_io_pgtable_ops(enum io_pgtable_fmt fmt,
+							      struct io_pgtable_cfg *cfg,
+							      void *cookie)
+{
+	struct io_pgtable *iop;
+
+	if (fmt != ARM_64_LPAE_S2)
+		return NULL;
+
+	iop = io_pgtable_arm_64_lpae_s2_init_fns.alloc(cfg, cookie);
+	if (!iop)
+		return NULL;
+
+	iop->fmt	= fmt;
+	iop->cookie	= cookie;
+	iop->cfg	= *cfg;
+
+	return &iop->ops;
+}
+#endif /* IO_PGTABLE_ARM_HYP_H_ */
diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 476c0e25631a..6b2668c2ef44 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -20,7 +20,6 @@
 #include <asm/barrier.h>
 
 #include "io-pgtable-arm.h"
-#include "iommu-pages.h"
 
 #define ARM_LPAE_MAX_ADDR_BITS		52
 #define ARM_LPAE_S2_MAX_CONCAT_PAGES	16
@@ -301,6 +300,7 @@ static void *__arm_lpae_alloc_pages(size_t size, gfp_t gfp,
 {
 	struct device *dev = cfg->iommu_dev;
 	void *pages;
+	int nid = dev ? dev_to_node(dev) : NUMA_NO_NODE;
 
 	/*
 	 * For very small starting-level translation tables the HW requires a
@@ -311,7 +311,7 @@ static void *__arm_lpae_alloc_pages(size_t size, gfp_t gfp,
 	if (cfg->alloc)
 		return __arm_lpae_cfg_alloc(size, gfp, cfg, cookie);
 
-	pages = iommu_alloc_pages_node_sz(dev_to_node(dev), gfp, size);
+	pages = iommu_alloc_pages_node_sz(nid, gfp, size);
 	if (!pages)
 		return NULL;
 
@@ -650,7 +650,7 @@ static void arm_lpae_free_pgtable(struct io_pgtable *iop)
 	struct arm_lpae_io_pgtable *data = io_pgtable_to_data(iop);
 
 	__arm_lpae_free_pgtable(data, data->start_level, data->pgd);
-	kfree(data);
+	arm_lpae_free_data(data);
 }
 
 static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
@@ -964,7 +964,7 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
 	if (cfg->oas > ARM_LPAE_MAX_ADDR_BITS)
 		return NULL;
 
-	data = kmalloc_obj(*data);
+	data = arm_lpae_alloc_data(*data);
 	if (!data)
 		return NULL;
 
@@ -1091,7 +1091,7 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
 	return &data->iop;
 
 out_free_data:
-	kfree(data);
+	arm_lpae_free_data(data);
 	return NULL;
 }
 
@@ -1187,7 +1187,7 @@ arm_64_lpae_alloc_pgtable_s2(struct io_pgtable_cfg *cfg, void *cookie)
 	return &data->iop;
 
 out_free_data:
-	kfree(data);
+	arm_lpae_free_data(data);
 	return NULL;
 }
 
@@ -1266,7 +1266,7 @@ arm_mali_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
 	return &data->iop;
 
 out_free_data:
-	kfree(data);
+	arm_lpae_free_data(data);
 	return NULL;
 }
 
diff --git a/drivers/iommu/io-pgtable-arm.h b/drivers/iommu/io-pgtable-arm.h
index ba7cfdf7afa0..ca765aea8745 100644
--- a/drivers/iommu/io-pgtable-arm.h
+++ b/drivers/iommu/io-pgtable-arm.h
@@ -27,4 +27,13 @@
 #define ARM_LPAE_TCR_PS_48_BIT		0x5ULL
 #define ARM_LPAE_TCR_PS_52_BIT		0x6ULL
 
+#ifndef __KVM_NVHE_HYPERVISOR__
+#include "iommu-pages.h"
+#define arm_lpae_alloc_data(type)	kmalloc_obj(type)
+#define arm_lpae_free_data(p)		kfree(p)
+
+#else
+#include "arm/arm-smmu-v3/pkvm/io-pgtable-arm-hyp.h"
+#endif
+
 #endif /* IO_PGTABLE_ARM_H_ */
-- 
2.55.0.1082.g2b9226bbc0-goog

