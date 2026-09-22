Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFFC54CF71
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790082799; cv=none; b=BntoxtX8KKvBs6/UpeKWruB5Vl86wFIcn/Rqwz16TUWtiMffta5yzFtRdJBmOH/l0fp0G5dpNqMHwEOoOZ3OXRMA5R6nCtwE/7bbh9m4pWNoXo2W2RXpVrgH4E9r7bOcSmCBf/yrdrOd+7Ndaj9/axFIXn9Zy2YULt9NwCcX3xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790082799; c=relaxed/simple;
	bh=f9ndF5NIUxVBabnNMbAoHyl3S0PxQvJrocqr6hQ1HNo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=seKw1wjVQWbN21w9fIv3BhGadA7OKwAtQACIwkuEXOXgkEe9njTou5l8FZRMhkj9ReRsPFeTrm6JxeKNPZHjn8KhEFJK4D5ropOhvMibUyMLMOT4bFMS0AgEXgROSCt+gZE+len9zfKG7j887UXWqMUOhmAKzEMOBg6SxTo6yn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dTQK52EG; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dTQK52EG"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49ccfad90f1so27433405e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790082795; x=1790687595; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c8srb9JROZiTs+JP8OWXShbxiJ2Ux4ZLOqIdBK2bxck=;
        b=dTQK52EG9YczkVpyVutVu0EJNsG1FVZnU9YqVfCpvts9Mu+qnLA2Wlqk2+UNyaBzIY
         if1+ZJoiakbaWyrHS4CN2DAchqUEq4DMMYtfGc9X+6id5q3zhdTiFOgg4xM2NpzbQKtn
         EYoCQCk6DC+brbwzePlvE47OepJSihsaJLzpVQDizBfWEtkH/+WYL8QrqqbtL/rFWjtd
         7ZRo2Wq8umiXeMSQ/ZlGTmAJGx8LewUXrlGMJzv3NP9AaOcHxcZtFcYDs8vaZxWXRYn5
         FbqYNKpPPPaoRBchg7W9JwbkULvFu8ddf70zBe5ykZBxDAWrWiZQrn0lUOxW/4pMdbPg
         IjXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082795; x=1790687595;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c8srb9JROZiTs+JP8OWXShbxiJ2Ux4ZLOqIdBK2bxck=;
        b=Uy8YKvxOcdow+zEWnlr91nXldhLtnDYFmwKw9Msae+2WxVpLq+Xc83vIZNklqrm71e
         yQPzxY5jnl5zjpnxQW4F1CVlck6UN+ksA6kNe9yLVbfpSCtY21vbSo0yqoUV5P7bheOa
         On0nfqdOlKVm80JIbx5M2IO+hzoYlotMPDTgzApIL1eRbeRs4EDXof/mO6EiugLJJrVB
         icXQY38b9oGoRIxYr4XAF566zIwQdRQPN2iw2nL/xXfYzysGMLxCN224TF5ZVXdXFyt8
         apMZndBZnQAHnopuG0Z0LoVVsQZ0q6AkwcaFDf5yiZvW8il3Xf3nAuhPfY623b0018Vh
         YCRA==
X-Forwarded-Encrypted: i=1; AKwUvBxX3GNnx5XgdRFgWAd8Lh0EP4ZNVUhOE+PlqbzhkBwzlZkTQ2H4FkGVyvT/BSdFMVE0iIOMeAK74LPIgXU=@vger.kernel.org
X-Gm-Message-State: AFuF++n8ZYNg5Te/OKFftKY8hy5S7YOBYSaSGIzupVUKDDPCj8VLgr2E
	IMwgaLiz1mTDjylgppgA1YlOcKK94JQ8OvvTkWjgWMbP8i/bReJtMZYK4ZfOayikwhBH+ucRlio
	74I9kE3LG4emqIg==
X-Received: from wmsm35.prod.google.com ([2002:a05:600c:3b23:b0:49e:6cae:132])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e0a:b0:49e:7c7e:274c with SMTP id 5b1f17b1804b1-49fc5724061mr172422615e9.14.1790082794394;
 Tue, 22 Sep 2026 06:13:14 -0700 (PDT)
Date: Tue, 22 Sep 2026 13:12:43 +0000
In-Reply-To: <20260922131259.2975334-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260922131259.2975334-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922131259.2975334-11-smostafa@google.com>
Subject: [PATCH v8 10/25] iommu/arm-smmu-v3-kvm: Add SMMUv3 driver
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	sebastianene@google.com, keirf@google.com, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Add the skeleton for an Arm SMMUv3 driver at EL2.

The driver rely on an array of SMMUv3s on the system, where at
init it will donate the array and the resources of the SMMUv3s
so they can't be changed by the host after de-privilege.

This array will be populated in the next patch.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/Makefile              |  5 +
 drivers/iommu/arm/Kconfig                     | 12 +++
 .../arm/arm-smmu-v3/arm-smmu-v3-common-lib.h  |  4 +
 .../arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h    | 31 +++++++
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 91 +++++++++++++++++++
 5 files changed, 143 insertions(+)
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c

diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index 7cb79db9bc47..aa76c0f3f147 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -33,6 +33,11 @@ hyp-obj-$(CONFIG_LIST_HARDENED) += list_debug.o
 hyp-obj-$(CONFIG_NVHE_EL2_TRACING) += clock.o trace.o events.o
 hyp-obj-y += $(lib-objs)
 
+HYP_SMMU_V3_DRV_PATH = ../../../../../drivers/iommu/arm/arm-smmu-v3
+
+hyp-obj-$(CONFIG_ARM_SMMU_V3_PKVM) += $(HYP_SMMU_V3_DRV_PATH)/pkvm/arm-smmu-v3.o \
+	$(HYP_SMMU_V3_DRV_PATH)/arm-smmu-v3-common-lib.o ../../../../../lib/hweight.o
+
 # Path to simple_ring_buffer.c
 CFLAGS_trace.nvhe.o += -I$(srctree)/kernel/trace/
 
diff --git a/drivers/iommu/arm/Kconfig b/drivers/iommu/arm/Kconfig
index 5fac08b89dee..fdbed6a51224 100644
--- a/drivers/iommu/arm/Kconfig
+++ b/drivers/iommu/arm/Kconfig
@@ -141,3 +141,15 @@ config QCOM_IOMMU
 	select ARM_DMA_USE_IOMMU
 	help
 	  Support for IOMMU on certain Qualcomm SoCs.
+
+config ARM_SMMU_V3_PKVM
+	bool "ARM SMMUv3 support for protected Virtual Machines"
+	depends on KVM && ARM_SMMU_V3=y
+	help
+	  Enable a SMMUv3 driver in the KVM hypervisor, to protect VMs against
+	  memory accesses from devices owned by the host.
+	  This works along side ARM_SMMU_V3 where the kernel driver manages the
+	  stage-1 of the SMMUv3, and the hypervisor driver will manage the
+	  stage-2 transparently through trap and emulate.
+
+	  Say Y here if you intend to enable KVM in protected mode.
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.h
index 9a7064c8e879..3a9d72988942 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.h
@@ -15,6 +15,10 @@
  */
 #ifndef __KVM_NVHE_HYPERVISOR__
 typedef struct arm_smmu_device ARM_SMMU_OBJ;
+#else
+#include "pkvm/arm-smmu-v3-hyp.h"
+
+typedef struct hyp_arm_smmu_v3_device ARM_SMMU_OBJ;
 #endif
 
 static_assert(__same_type(typeof_member(ARM_SMMU_OBJ, features), u32));
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
new file mode 100644
index 000000000000..17b9454dab85
--- /dev/null
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __KVM_ARM_SMMU_V3_HYP_H
+#define __KVM_ARM_SMMU_V3_HYP_H
+
+#include <asm/kvm_asm.h>
+
+/*
+ * Parameters from the trusted host:
+ * @mmio_addr		base address of the SMMU registers
+ * @mmio_size		size of the registers resource
+ *
+ * Other members are filled and used at runtime by the SMMU driver.
+ * @base		Virtual address of SMMU registers
+ */
+struct hyp_arm_smmu_v3_device {
+	phys_addr_t		mmio_addr;
+	size_t			mmio_size;
+	void __iomem		*base;
+	u32			features;
+	u32			options;
+	unsigned long		oas;
+	unsigned long		pgsize_bitmap;
+};
+
+extern size_t kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count);
+#define kvm_hyp_arm_smmu_v3_count kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count)
+
+extern struct hyp_arm_smmu_v3_device *kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_smmus);
+#define kvm_hyp_arm_smmu_v3_smmus kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_smmus)
+
+#endif /* __KVM_ARM_SMMU_V3_HYP_H */
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
new file mode 100644
index 000000000000..7022d38e75c4
--- /dev/null
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * pKVM hyp driver for the Arm SMMUv3
+ *
+ * Copyright (C) 2022 Linaro Ltd.
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
+					    smmu->mmio_size >> PAGE_SHIFT));
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
+/* Called while is the host is still trusted. */
+static int smmu_init(void)
+{
+	size_t smmu_arr_size = PAGE_ALIGN(sizeof(*kvm_hyp_arm_smmu_v3_smmus) *
+					  kvm_hyp_arm_smmu_v3_count);
+	struct hyp_arm_smmu_v3_device *smmu;
+	u64 pfn, nr_pages;
+	int ret;
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
-- 
2.55.0.1082.g2b9226bbc0-goog

