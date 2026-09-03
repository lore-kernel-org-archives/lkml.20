Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3774B5CC7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 14:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788445596; cv=none; b=jdOj4mzA8R2+2qfX/riRRidf/gZ7odh1RMQ783oUnXe0FcptrWbNHwx4ilVFnG8OeGqC2o++uCKZqE7YoPIX1E270lFpwjA3PTwzv7NmTuUBeyA7emRu5Q8kDgOpP5NgagvgfPxwH4quQT09n1ATDzI6LPnyCx4e80wDj3hhSAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788445596; c=relaxed/simple;
	bh=lVz4HULCAzBVIalNKvgEC+4z/m93RLJ7OINCHnbMdBw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tsK4ikZ6DfbWMEt/N3TmQHodo6BGB5xtKfR8CL627soIME12FWER56C6nQhnBdHWUpgD7/ti6A6gFdc0g/WvQt/iWACpoWQwtYZcODbsMBQOvNkJZVkMP4vno2FVvNYuEGrdN93211vr3DGZ8mU8Uueep4hKxnwjowY38yDhVFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qyXi7CYf; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qyXi7CYf"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d6d28aa26cso15716935ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788445576; x=1789050376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iTShN6j0+aHl4I4HNQsyKguWeFeAIHOKSF4VwR+YH/8=;
        b=qyXi7CYfPbF309eX+sM8szC5kw2K4nwOIBdGORt5AtS/NciW3uJBp7ZIriM1ll3kfm
         o7jegFGoGIG91sv+6VZLvxwfAH323JSmXAWqCBmLbYfLnWLl6e5Hbx/aZEU+xS47LYRJ
         u/APL/Ac0caC1ZDF7QsayA8pk7mFf3ZEeoGu7scBLynquhxL0oAAetR4xY2d4hISM9RQ
         7QkjiDvR6E0+UXDwGD9sENCI1d8XIgbC8bSwg9AOQX99ta3QhESI1X/uT2sEdenlAKKl
         uPx3Tu3J7c5HezyZq3/RimjZIHaZXtGUdt9WqYWlx93kZifEHcIzIYhHDXjVKKw9AB1n
         hbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788445576; x=1789050376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iTShN6j0+aHl4I4HNQsyKguWeFeAIHOKSF4VwR+YH/8=;
        b=gnpRDp9X3avjk3HY4HO6izYReg3YeoW7bRKtzYr5IZ8gZ7EqJHlQaHm3ZmBNK7suv+
         wqShJSmVfRldD5pY4IRzPP002YDtT2BMJTW1ogcqK64/Wpdc74eKiwIotZy5v8qGU2ze
         W/lKNeljMSak+cNLn/KndzKY3KLeqdtTFktU8VRmlhfm4KvB3o+/rBd4pqmXn7CljnD/
         vEauEJemFM+rn0wrFcNnDUfJV9okttEl2CDsRDOk75VVELVezmQRTpqOwkakV96jq/zq
         dcFqZ3m4LEpbOggXTns5FiBUFB4UBfvN463IQbCsAouosoq5d+/hG7y04x4elI5iWxPy
         51GA==
X-Forwarded-Encrypted: i=1; AKwUvBzkiFJ2Dk/cGXkvv3JrzGStbCcNQ3AMJw3QFD95i6jYsxFWc3qLIHvp0hJeJ8e/QckRO9ZaUCNl8I2jYO8=@vger.kernel.org
X-Gm-Message-State: AFuF++lW2PdLegQaYbSJq8f+OduYruOr7+YKNTrCF6a+XaFJ7GzKR/BS
	B8yNpFbOqNiEQE+T6xnFzOHLJbKx/stmR+hcHS73e8KhnvEl0EL7u7QW
X-Gm-Gg: AYBFou3qvZ7GLhUwAZWmLfBOc+4k/2BSkJQ5OuLj+7+WyngnIRxt7T3wdaga02mc24V
	JN1pHtjDnpV1AB0Ma2gbR1Ig+u2GYZsx4vlJkFxRy2mtBxDkMOG4Ev8dFd9F2N6lK1585H7n/nN
	GkzwXKgeadyZRSkzVNAEe9/r0WciIkH4IZJycPEfx9Xu3rAMG10egYBJ8pp+PTszDuk/PNtA+b0
	3eKq5tgUgxB9hIxAkuzLVxSlCOSnu7uJPt0iqZC9CLw1eGGtx/sqgbJ7BHYNMGaWg6xv4buSZR6
	4+7LMIdBCBsVF9FNqDHwOm+kbSvlAUy5uZWygEmz5EGSJdkY11ZdrPWxZi7aV25idv/MgsAcJWb
	WI0n5BATHnmE5Gm4S+yNC6gbU6GtlH3n4zbImQLa72sccooSog521p/KZW6iPsNe8bkADsmMm78
	a0jzwcxL93N+Itg0/5OlxSHg855zmeIwpyus3w6xR+ZK+ex+HzFuaPDKz341XWhI/FigK06+Uu7
	lMDRM6IbNh6
X-Received: by 2002:a17:902:fdab:b0:2c8:f34c:82c0 with SMTP id d9443c01a7336-2db1024d79cmr2448925ad.2.1788445576213;
        Thu, 03 Sep 2026 07:26:16 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.mshome.net ([104.43.2.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dafed6ec65sm11040885ad.77.2026.09.03.07.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 07:26:14 -0700 (PDT)
From: Tianyu Lan <ltykernel@gmail.com>
X-Google-Original-From: Tianyu Lan <tiala@microsoft.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	longli@microsoft.com
Cc: Tianyu Lan <tiala@microsoft.com>,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	aik@amd.com,
	hch@infradead.org,
	robin.murphy@arm.com,
	vdso@hexbites.dev,
	aneesh.kumar@kernel.org,
	mhklinux@outlook.com
Subject: [RFC V2 PATCH 1/1] x86/VMBus: DMA transfer with encrypted memory in Coco VM
Date: Thu,  3 Sep 2026 10:26:03 -0400
Message-Id: <20260903142603.2149-1-tiala@microsoft.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In CoCo VMs, system memory is encrypted by default.
Device drivers typically rely on the DMA core's
SWIOTLB as a bounce buffer for DMA operations, providing
decrypted memory that can be shared between the guest and
host.

For PCI devices with T-Disp support and Confidential
VMBus devices (https://lkml.org/lkml/2026/7/27/1733) can
perform DMA transfers directly with private/encrypted
memory in a CoCo VM.

To support DMA transfer with encrypted memory, Hyper-V
DMA ops are introduced and bypass some API which may
use swiotlb as bounce buffer.

The DMA ops used is global data structure(see get_arch_
dma_ops() and get_dma_ops() for details). There is no
need to set up for each device individually.

Signed-off-by: Tianyu Lan <tiala@microsoft.com>
---
Change since RFC v1:
    * Fix warning, code style issues and make the code
    of reference dma ops under CONFIG_ARCH_HAS_DMA_OPS.
---
 drivers/hv/Kconfig        |   9 +++
 drivers/hv/Makefile       |   1 +
 drivers/hv/hv_dma_ops.c   | 138 ++++++++++++++++++++++++++++++++++++++
 drivers/hv/hyperv_vmbus.h |   1 +
 drivers/hv/vmbus_drv.c    |  19 +++++-
 5 files changed, 167 insertions(+), 1 deletion(-)
 create mode 100644 drivers/hv/hv_dma_ops.c

diff --git a/drivers/hv/Kconfig b/drivers/hv/Kconfig
index 2d0b3fcb0ff87..fbbeb67cb2cab 100644
--- a/drivers/hv/Kconfig
+++ b/drivers/hv/Kconfig
@@ -7,6 +7,7 @@ config HYPERV
 	depends on (X86 && X86_LOCAL_APIC && HYPERVISOR_GUEST) \
 		|| (ARM64 && !CPU_BIG_ENDIAN)
 	select PARAVIRT
+	select HYPERV_DMA_OPS
 	select X86_HV_CALLBACK_VECTOR if X86
 	select OF_EARLY_FLATTREE if OF
 	select IRQ_MSI_LIB if X86
@@ -14,6 +15,13 @@ config HYPERV
 	  Select this option to run Linux as a Hyper-V client operating
 	  system.
 
+config HYPERV_DMA_OPS
+	bool "Enable Microsoft Hyper-V DMA ops support"
+	depends on ARCH_HAS_DMA_OPS
+	help
+	  Select this option to enable DMA with encrypt
+	  memory in CoCo VM.
+
 config HYPERV_VTL_MODE
 	bool "Enable Linux to boot in VTL context"
 	depends on (X86_64 && HAVE_STATIC_CALL) || ARM64
@@ -62,6 +70,7 @@ config HYPERV_VMBUS
 	depends on HYPERV
 	default HYPERV
 	select SYSFB if EFI && !HYPERV_VTL_MODE
+	default y if HYPERV_DMA_OPS
 	help
 	  Select this option to enable Hyper-V Vmbus driver.
 
diff --git a/drivers/hv/Makefile b/drivers/hv/Makefile
index 888a748cc7cb9..b4d23c88b9eb0 100644
--- a/drivers/hv/Makefile
+++ b/drivers/hv/Makefile
@@ -2,6 +2,7 @@
 obj-$(CONFIG_HYPERV_VMBUS)	+= hv_vmbus.o
 obj-$(CONFIG_HYPERV_UTILS)	+= hv_utils.o
 obj-$(CONFIG_HYPERV_BALLOON)	+= hv_balloon.o
+obj-$(CONFIG_HYPERV_DMA_OPS)	+= hv_dma_ops.o
 obj-$(CONFIG_MSHV_ROOT)		+= mshv_root.o
 obj-$(CONFIG_MSHV_VTL)          += mshv_vtl.o
 
diff --git a/drivers/hv/hv_dma_ops.c b/drivers/hv/hv_dma_ops.c
new file mode 100644
index 0000000000000..4cd9bbb887221
--- /dev/null
+++ b/drivers/hv/hv_dma_ops.c
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026, Microsoft Corporation.
+ *
+ */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/hyperv.h>
+#include <linux/smpboot.h>
+
+#include <linux/kernel.h>
+#include <linux/dma-map-ops.h>
+#include <linux/export.h>
+#include <asm/mshyperv.h>
+#include "hyperv_vmbus.h"
+#include "../../kernel/dma/direct.h"
+
+const struct dma_map_ops *dma_ops;
+bool is_vmbus_dev(struct device *dev);
+
+static bool hyperv_private_memory_dma(struct device *dev)
+{
+	struct hv_device *hv_dev = device_to_hv_device(dev);
+
+	if (is_vmbus_dev(dev) && hv_dev && hv_dev->channel
+	    && hv_dev->channel->co_external_memory)
+		return true;
+
+	/* Todo: Check TDisp capability of PCI device here */
+
+	return false;
+}
+
+static int hyperv_dma_map_sg(struct device *dev, struct scatterlist *sgl,
+		int nelems, enum dma_data_direction dir,
+		unsigned long attrs)
+{
+	struct scatterlist *sg;
+	dma_addr_t dma_addr;
+	int i;
+
+	if (hyperv_private_memory_dma(dev)) {
+		for_each_sg(sgl, sg, nelems, i) {
+			dma_addr = phys_to_dma(dev, sg_phys(sg));
+			sg_dma_address(sg) = dma_addr;
+			sg_dma_len(sg) = sg->length;
+		}
+
+		return nelems;
+	} else {
+		return dma_direct_map_sg(dev, sgl, nelems, dir, attrs);
+	}
+}
+
+static void hyperv_dma_unmap_sg(struct device *dev, struct scatterlist *sgl,
+		int nelems, enum dma_data_direction dir, unsigned long attrs)
+{
+	if (!hyperv_private_memory_dma(dev))
+		dma_direct_unmap_sg(dev, sgl, nelems, dir, attrs);
+}
+
+static int hyperv_dma_supported(struct device *dev, u64 mask)
+{
+	return 1;
+}
+
+static size_t hyperv_dma_max_mapping_size(struct device *dev)
+{
+	if (hyperv_private_memory_dma(dev))
+		return SIZE_MAX;
+	else
+		return swiotlb_max_mapping_size(dev);
+}
+
+/* allocate and map a coherent mapping */
+static void *
+hyperv_dma_alloc_coherent(struct device *dev, size_t size, dma_addr_t *dma_handle,
+		    gfp_t flag, unsigned long attrs)
+{
+	phys_addr_t phys;
+	void *ret;
+
+	if (!hyperv_private_memory_dma(dev))
+		return dma_alloc_coherent(dev, size, dma_handle, flag);
+
+	size = ALIGN(size, PAGE_SIZE);
+	ret = (void *)__get_free_pages(flag, get_order(size));
+	if (!ret)
+		return ret;
+	phys = virt_to_phys(ret);
+
+	if (hyperv_private_memory_dma(dev))
+		*dma_handle = dma_addr_encrypted(__phys_to_dma(dev, phys));
+	else
+		*dma_handle = phys_to_dma_unencrypted(dev, phys);
+
+	memset(ret, 0, size);
+	return ret;
+}
+
+/* free a coherent mapping */
+static void
+hyperv_dma_free_coherent(struct device *dev, size_t size, void *vaddr,
+		   dma_addr_t dma_addr, unsigned long attrs)
+{
+	if (hyperv_private_memory_dma(dev))
+		dmam_free_coherent(dev, size, vaddr, dma_addr);
+	else
+		free_pages((unsigned long)vaddr, get_order(size));
+}
+
+static dma_addr_t hyperv_dma_map_phys(struct device *dev, phys_addr_t phys,
+		size_t size, enum dma_data_direction dir,
+		unsigned long attrs)
+{
+	if (hyperv_private_memory_dma(dev))
+		return __phys_to_dma(dev, phys);
+	else
+		return dma_direct_map_phys(dev, phys, size, dir, attrs, true);
+}
+
+static void hyperv_dma_unmap_phys(struct device *dev, dma_addr_t dma_handle,
+		size_t size, enum dma_data_direction dir, unsigned long attrs)
+{
+	if (!hyperv_private_memory_dma(dev))
+		dma_direct_unmap_phys(dev, dma_handle, size, dir, attrs, true);
+}
+
+const struct dma_map_ops hyperv_dma_ops = {
+	.alloc			= hyperv_dma_alloc_coherent,
+	.free			= hyperv_dma_free_coherent,
+	.map_phys               = hyperv_dma_map_phys,
+	.unmap_phys             = hyperv_dma_unmap_phys,
+	.map_sg                 = hyperv_dma_map_sg,
+	.unmap_sg               = hyperv_dma_unmap_sg,
+	.dma_supported          = hyperv_dma_supported,
+	.max_mapping_size	= hyperv_dma_max_mapping_size,
+};
diff --git a/drivers/hv/hyperv_vmbus.h b/drivers/hv/hyperv_vmbus.h
index 05a36854389af..94f16382bba7b 100644
--- a/drivers/hv/hyperv_vmbus.h
+++ b/drivers/hv/hyperv_vmbus.h
@@ -356,6 +356,7 @@ extern const struct vmbus_channel_message_table_entry
 /* General vmbus interface */
 
 bool vmbus_is_confidential(void);
+bool is_vmbus_dev(struct device *dev);
 
 #if IS_ENABLED(CONFIG_HYPERV_VMBUS)
 /* Free the message slot and signal end-of-message if required */
diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index d28ff45d4cfdd..a45a1d010a1cd 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -40,6 +40,12 @@
 #include <clocksource/hyperv_timer.h>
 #include <asm/mshyperv.h>
 #include "hyperv_vmbus.h"
+#include "../../kernel/dma/direct.h"
+
+#ifdef CONFIG_ARCH_HAS_DMA_OPS
+const struct dma_map_ops *dma_ops;
+const struct dma_map_ops hyperv_dma_ops;
+#endif
 
 struct vmbus_dynid {
 	struct list_head node;
@@ -62,6 +68,7 @@ int vmbus_interrupt;
  * visible to either the host or the hypervisor.
  */
 static bool is_confidential;
+static const struct bus_type  hv_bus;
 
 bool vmbus_is_confidential(void)
 {
@@ -69,6 +76,11 @@ bool vmbus_is_confidential(void)
 }
 EXPORT_SYMBOL_GPL(vmbus_is_confidential);
 
+bool is_vmbus_dev(struct device *dev)
+{
+	return dev->bus == &hv_bus;
+}
+
 /*
  * The panic notifier below is responsible solely for unloading the
  * vmbus connection, which is necessary in a panic event.
@@ -1523,8 +1535,13 @@ static int vmbus_bus_init(void)
 	 * doing that on each VP while initializing SynIC's wastes time.
 	 */
 	is_confidential = ms_hyperv.confidential_vmbus_available;
-	if (is_confidential)
+	if (is_confidential) {
+#ifdef CONFIG_ARCH_HAS_DMA_OPS
+		dma_ops = &hyperv_dma_ops;
+#endif
 		pr_info("Establishing connection to the confidential VMBus\n");
+	}
+
 	hv_para_set_sint_proxy(!is_confidential);
 	ret = vmbus_alloc_synic_and_connect();
 	if (ret)
-- 
2.53.0

