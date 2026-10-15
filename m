Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72344413796
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792094969; cv=none; b=ZCrbn50+RZYZrnFIpW8TwOLHBvXXmhZYw3joz0hgFLP7F6cBUWkRQeTA3+YjV2GcUuTzIiHVGtj2CmLCjzkySI4XBUcXwWgw1mhj0+qCS2DwY7K+Jh2Wld8a844oR0lK0wDWutE/NLIi1Nd2ljAe3k96bBVo8UxISyglvi+KBbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792094969; c=relaxed/simple;
	bh=AuMop6iv85sEbIDnkg7iHftbM8s83ZooxPppN5Nau7U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=larOuag9UobHdvIZ/Rr+LSSya908/xZIwOSkIlvOu/y9nqprksB06Ef1kVnuWURfAiQVXTcI953E/dCe6UttYX0XrxZIiObwuyAtCF6nnEWhEYjqBKYqRM7fDifLB/kgthcHw291G2iCykTOse+y9cJTike7I7oWuRXJO6HXXfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gytamOUe; arc=none smtp.client-ip=209.85.221.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gytamOUe"
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48df02b91f9so173336f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792094962; x=1792699762; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8UA46w466axNh+PriFGrOQFaeqWdmA8tYPa6OW//CU8=;
        b=gytamOUeaBlcSnXJs2Ts4LTliT9Sb6ajcJa6UcYM9CglN0kmD9S9/tuw6cuf2SL3/b
         lI/rhN1M/YHwUNp1vH1ppaF5FLbhvnmYgCxgPIcs3/qaWt5h4SD9QsyoeTGcPaMSgMF6
         A2OBalQ9s1EETzSJ20YTv6LeBjjUIxpAS0QlsSjSjR6J9rZqI6jjRMlEk0xRv6NPXS5+
         Z1Q5LbI2G2yD6p8P/2ryJRFdA7or/0F+lNaFDnnrP+IwRXF+1aKg3GV/vHsMCfffAUTt
         EZVRc3Ub0H9K1Nb4AG+AU7E338iuFqxhKxuLWy+sfGXRa9qlYXmVUD5WNqpUB2wg+f/W
         YK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094962; x=1792699762;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8UA46w466axNh+PriFGrOQFaeqWdmA8tYPa6OW//CU8=;
        b=I5uCPSnHGoM+WxncgqbTSMrIgj30PzHLEJExOU4TJ+BWZX/aPWfJbVEt6j/SEliLIV
         08Vd8apqH1Qbq8+z57AiJ82n7fXg3E94SzweOELIZyMdYR9LbPFCGW3ogC4Cmy+Ld0PY
         KSr/yh3L0D+xyD3m7B0jiRpIsKI81g7q9yyiPM8QmIuRDIXHzuPVCRv3p70u+Ap07S9R
         wpVdRg/Fl/wHUl+slAB4xM+aIRo62aAsCgZCx+Q2Q7xJXtc/RGr1wZxoyl5ZGef7/JEw
         ofaLJmyQQgSPiVlex3w3VQ9BJT8GkIIGsvQ1LjAtxjTYRS2Ji2WiCK6IkQxxrXDL8AuH
         1pHg==
X-Forwarded-Encrypted: i=1; AKwUvBw2HcOcA7wL/aGaWuoRdXo5lmP1KH8hHYEG4Se8z6ElBR7KOszhj9EH4nw87QJbuBf+7OqMx73n24IHWnc=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8IM+6WGSBgfOYrT+2tN5hkAt/oFwuU77vnMz8rKmco00zng0T
	tOfIJaG6W7GbuvHFJgWTUekLYQO1AhRB2jP3zfI1kcuQtz3AnOAxm3ox8Wan4441aTeAt4RZXH7
	l+JaThSIvNKsnUQ==
X-Received: from wmbgz3.prod.google.com ([2002:a05:600c:8883:b0:4a1:b6f1:344b])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a407:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4a1c665f687mr21139025e9.8.1792094962450;
 Thu, 15 Oct 2026 13:09:22 -0700 (PDT)
Date: Thu, 15 Oct 2026 20:08:41 +0000
In-Reply-To: <20261015200903.2735565-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261015200903.2735565-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261015200903.2735565-11-smostafa@google.com>
Subject: [PATCH v9 10/25] iommu/arm-smmu-v3-kvm: Add SMMUv3 driver
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	nicolinc@nvidia.com, Jean-Philippe Brucker <jean-philippe@linaro.org>, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Add the skeleton of the Arm SMMUv3 driver at EL2, and build the shared
IDR/STE code and lib/hweight.o into the hypervisor.

The kernel driver, added next, fills an array describing the SMMUv3s in
the system and hands it to the hypervisor. At init the hypervisor takes
ownership of the array and of the SMMU MMIO regions, so the host cannot
change either after de-privilege.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/Makefile              |  5 +
 drivers/iommu/arm/Kconfig                     | 12 +++
 .../arm/arm-smmu-v3/arm-smmu-v3-common-lib.h  |  7 ++
 .../arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c    | 96 +++++++++++++++++++
 .../arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h    | 41 ++++++++
 5 files changed, 161 insertions(+)
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h

diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index 7cb79db9bc47..ee86e4b3436f 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -33,6 +33,11 @@ hyp-obj-$(CONFIG_LIST_HARDENED) += list_debug.o
 hyp-obj-$(CONFIG_NVHE_EL2_TRACING) += clock.o trace.o events.o
 hyp-obj-y += $(lib-objs)
 
+HYP_SMMU_V3_DRV_PATH := ../../../../../drivers/iommu/arm/arm-smmu-v3
+
+hyp-obj-$(CONFIG_ARM_SMMU_V3_PKVM) += $(HYP_SMMU_V3_DRV_PATH)/pkvm/arm-smmu-v3-hyp.o \
+	$(HYP_SMMU_V3_DRV_PATH)/arm-smmu-v3-common-lib.o ../../../../../lib/hweight.o
+
 # Path to simple_ring_buffer.c
 CFLAGS_trace.nvhe.o += -I$(srctree)/kernel/trace/
 
diff --git a/drivers/iommu/arm/Kconfig b/drivers/iommu/arm/Kconfig
index 5fac08b89dee..82fbc729563e 100644
--- a/drivers/iommu/arm/Kconfig
+++ b/drivers/iommu/arm/Kconfig
@@ -128,6 +128,18 @@ config TEGRA241_CMDQV
 
 	  Say Y here if your system is NVIDIA Tegra241 (Grace) or it has the same
 	  CMDQ-V extension.
+
+config ARM_SMMU_V3_PKVM
+	bool "ARM SMMUv3 support for protected Virtual Machines"
+	depends on KVM && ARM_SMMU_V3=y && OF
+	help
+	  Enable SMMUv3 driver in the KVM hypervisor, to protect VMs against
+	  memory accesses from devices owned by the host.
+	  This works alongside ARM_SMMU_V3 where the kernel driver manages the
+	  SMMUv3 stage-1, and the hypervisor driver manages the stage-2
+	  transparently through trap and emulate.
+
+	  Say Y here if you intend to enable KVM in protected mode.
 endif
 
 config QCOM_IOMMU
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.h
index 9f6949a60fe8..74b6c05b8f8f 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.h
@@ -20,6 +20,13 @@ typedef struct arm_smmu_device ARM_SMMU_OBJ;
 
 #define arm_smmu_err(smmu, fmt, ...)	dev_err((smmu)->dev, fmt, ##__VA_ARGS__)
 #define arm_smmu_info(smmu, fmt, ...)	dev_info((smmu)->dev, fmt, ##__VA_ARGS__)
+#else
+#include "pkvm/arm-smmu-v3-hyp.h"
+
+typedef struct hyp_arm_smmu_v3_device ARM_SMMU_OBJ;
+
+#define arm_smmu_err(smmu, fmt, ...)
+#define arm_smmu_info(smmu, fmt, ...)
 #endif
 
 static_assert(__same_type(typeof_member(ARM_SMMU_OBJ, features), u32));
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
new file mode 100644
index 000000000000..ba209951039f
--- /dev/null
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * pKVM hyp driver for the Arm SMMUv3
+ *
+ * Copyright (C) 2022 Linaro Ltd.
+ * Copyright (C) 2025 Google LLC
+ */
+#include <asm/kvm_hyp.h>
+
+#include <nvhe/iommu.h>
+#include <nvhe/mem_protect.h>
+
+#include "arm-smmu-v3-hyp.h"
+#include "../arm-smmu-v3.h"
+#include "../arm-smmu-v3-common-lib.h"
+
+size_t __ro_after_init kvm_hyp_arm_smmu_v3_count;
+struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
+
+#define for_each_smmu(smmu) \
+	for ((smmu) = kvm_hyp_arm_smmu_v3_smmus; \
+	     (smmu) != &kvm_hyp_arm_smmu_v3_smmus[kvm_hyp_arm_smmu_v3_count]; \
+	     (smmu)++)
+
+/* Put the device in a state that can be probed by the host driver. */
+static void smmu_deinit_device(struct hyp_arm_smmu_v3_device *smmu)
+{
+	WARN_ON(__pkvm_hyp_donate_host_mmio(hyp_phys_to_pfn(smmu->mmio_addr),
+					    smmu->mmio_size >> PAGE_SHIFT,
+					    (unsigned long)smmu->base));
+	smmu->base = NULL;
+}
+
+static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
+{
+	unsigned long haddr;
+	int ret;
+
+	if (!PAGE_ALIGNED(smmu->mmio_addr | smmu->mmio_size))
+		return -EINVAL;
+
+	ret = __pkvm_host_donate_hyp_mmio(hyp_phys_to_pfn(smmu->mmio_addr),
+					  smmu->mmio_size >> PAGE_SHIFT, &haddr);
+	if (ret)
+		return ret;
+
+	smmu->base = (void __iomem *)haddr;
+
+	return 0;
+}
+
+/* Called while the host is still trusted. */
+static int smmu_init(void)
+{
+	size_t smmu_arr_size = PAGE_ALIGN(sizeof(*kvm_hyp_arm_smmu_v3_smmus) *
+					  kvm_hyp_arm_smmu_v3_count);
+	struct hyp_arm_smmu_v3_device *smmu;
+	u64 pfn, nr_pages;
+	int ret;
+
+	if (!PAGE_ALIGNED(kvm_hyp_arm_smmu_v3_smmus))
+		return -EINVAL;
+
+	kvm_hyp_arm_smmu_v3_smmus = kern_hyp_va(kvm_hyp_arm_smmu_v3_smmus);
+	pfn = hyp_virt_to_pfn(kvm_hyp_arm_smmu_v3_smmus);
+	nr_pages = smmu_arr_size >> PAGE_SHIFT;
+
+	ret = __pkvm_host_donate_hyp(pfn, nr_pages);
+	if (ret)
+		return ret;
+
+	for_each_smmu(smmu) {
+		ret = smmu_init_device(smmu);
+		if (ret)
+			goto out_reclaim_smmu;
+	}
+
+	return 0;
+
+out_reclaim_smmu:
+	while (smmu != kvm_hyp_arm_smmu_v3_smmus)
+		smmu_deinit_device(--smmu);
+	WARN_ON(__pkvm_hyp_donate_host(pfn, nr_pages));
+	return ret;
+}
+
+static int smmu_host_stage2_idmap(phys_addr_t start, phys_addr_t end, int prot)
+{
+	return 0;
+}
+
+/* Shared with the kernel driver in EL1 */
+struct pkvm_iommu_ops smmu_ops = {
+	.init				= smmu_init,
+	.host_stage2_idmap		= smmu_host_stage2_idmap,
+};
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
new file mode 100644
index 000000000000..c2630397f57a
--- /dev/null
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __KVM_ARM_SMMU_V3_HYP_H
+#define __KVM_ARM_SMMU_V3_HYP_H
+
+#include <asm/kvm_asm.h>
+
+/**
+ * struct hyp_arm_smmu_v3_device - SMMUv3 instance owned by the hypervisor
+ * @mmio_addr:		Physical address of the SMMU registers
+ * @mmio_size:		Size of the register region
+ * @base:		Hypervisor virtual address of the registers
+ * @features:		ARM_SMMU_FEAT_* bits
+ * @options:		ARM_SMMU_OPT_* bits
+ * @oas:		Output address size
+ * @pgsize_bitmap:	Supported page sizes
+ * @sid_bits:		Number of StreamID bits
+ *
+ * @mmio_addr, @mmio_size and ARM_SMMU_FEAT_COHERENCY are filled by the host
+ * before de-privilege, the rest by the hypervisor driver.
+ */
+struct hyp_arm_smmu_v3_device {
+	phys_addr_t		mmio_addr;
+	size_t			mmio_size;
+	void __iomem		*base;
+	u32			features;
+	u32			options;
+	unsigned long		oas;
+	unsigned long		pgsize_bitmap;
+	unsigned int		sid_bits;
+};
+
+extern size_t kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count);
+#define kvm_hyp_arm_smmu_v3_count kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count)
+
+extern struct hyp_arm_smmu_v3_device *kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_smmus);
+#define kvm_hyp_arm_smmu_v3_smmus kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_smmus)
+
+struct pkvm_iommu_ops;
+extern struct pkvm_iommu_ops kvm_nvhe_sym(smmu_ops);
+
+#endif /* __KVM_ARM_SMMU_V3_HYP_H */
-- 
2.56.0.176.g3575e65682-goog

