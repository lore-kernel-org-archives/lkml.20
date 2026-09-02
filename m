Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB86472075
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788346290; cv=none; b=b3Yh6OVUAjcqhTgGIGNeMHBfW5yzHpWGNuA+M1Gl1qknRmfEIABeGE8ckhMm47udyXzSp6x0PYxdFdC2yy6u96DkmXAxNHfkRHYdSHOYF+Md7DXuapR24qxEvcaD3RUIzGmn2qkFaTUTaD3cW1Q63HRMEW+3v4i3FI/0lehmPBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788346290; c=relaxed/simple;
	bh=kTw+a5cGg9fTfwWcDo0uZpH7mwb0/GZmgWLGcOqsPDM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Cg2wtuszzdjhfGJCkKk8ICUPUmNyV5aZIV7PIT8h5LUSrbtCd79i2WkUpZa5MtPm5UKEjpgEcpsdaHgAq2d2Z02STyjk6QlX3tb91Ekumi9fRGT1Q3RPHhEgFxhRIiU1jqpacR4Je3CaqD/3jP6dNALl6D6ZNPvflHOcGg4n8/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UC+bVqb+; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UC+bVqb+"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49cd74fc1aaso4706325e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788346277; x=1788951077; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xnnAKTx0rWFGRttv0vRYvbBX3qhJSeyXfYhwCY9t/xQ=;
        b=UC+bVqb+EofhB5NYpXaXML6PEgtAE8Dndt7tsWfldqIHii9FV6g+Ry3Ns3Su4SR+rU
         aYy16Nv8puKhdlz9XO/28vxrPJ6ijDvBX7At8LWjV6yUOJSm7MPR6x8n5pDTV0zLyoBE
         BrOKHCOwXc9hIRLVcygdCLQhyaMFirQv5BQ2yMmXn5bIV/py6TXrunQxEiNxE3eSHIMp
         S/5kWKge6ziv83eGGMGfRAL32g0sw9tK9p6vlJ8GNcnwFOisAWkp0GnaxA+IGt86f0rz
         MkZ7536jutQn3tvUfL/XBNnYApjZ0VP40Uf+WcKPLpdQQe8vhX9cMFGUTjwHKI+66JPV
         01xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788346277; x=1788951077;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xnnAKTx0rWFGRttv0vRYvbBX3qhJSeyXfYhwCY9t/xQ=;
        b=ZT3d/cl6WtL/x5ghJ+Tw2PjxfSTqefR/iRag8kDQKKx76vMNiYHIxUqmzIRDuZMlq4
         ZE8b/fYbR+OI+nxlXhSkEyZoqxlUt1gW1Ldrg8wDXcdhmCvfD2HSKlr00E13b6MkRGvr
         ZHWdvviCA6iEPY6w0hsAvQfJUAMettosGD0WO/ZLp/KKpzcykMEzm8rhLxTgzMeh6svq
         9JYtCmp2s6mxxQ48G4WD2Rffea9ccmlCCapEqe+ytfjioWBiMblU96cJo2fNY0jK8mgN
         MI9cWhOoOCya3uilE0j0e63WoR9FmB2Qvw4b6JdbPLnSQTHaNinp56tNAqlIyUqgbGCC
         Z3YQ==
X-Forwarded-Encrypted: i=1; AHgh+RqaFVE2UMAXyvnTby2AbbYa8gUjWoJaNdutpZ4Doe+2kK1/dzCWGezI+WaevUE++b0FtfKtEJokY7MmkrA=@vger.kernel.org
X-Gm-Message-State: AFuF++mw2OOCN1fKHETc91RP72G73x87ae0QsGGVeUWATa8+pqSldA4q
	iPI7Tg2/XVS3Qn6T5yQtn4t3z3KFmOC/JAk728AaOu8vJIdSf6eJdi4MuCEH0X3AyrINR5H48lX
	utnjo+TqqdrydjEwIXEk81w==
X-Received: from wmqh12.prod.google.com ([2002:a05:600c:350c:b0:496:c04d:501e])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:310f:b0:49b:c8e:a211 with SMTP id 5b1f17b1804b1-49ce57f27e8mr57275175e9.5.1788346277042;
 Wed, 02 Sep 2026 03:51:17 -0700 (PDT)
Date: Wed,  2 Sep 2026 11:47:11 +0100
In-Reply-To: <20260902104712.2399797-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260902104712.2399797-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Message-ID: <20260902104712.2399797-10-vdonnefort@google.com>
Subject: [PATCH v9 09/10] firmware: arm_ffa: Introduce ffa-lend-pool
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
	akpm@linux-foundation.org, sudeep.holla@kernel.org, jenswi@kernel.org, 
	robh@kernel.org
Cc: mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org, 
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

When memory is lent to the Secure world via FF-A, fatal CPU speculative
reads from Non-Secure can still occur as long as it retains a cacheable
mapping to that memory. Introduce the "arm,ffa-lend-pool"
reserved-memory CMA driver to unmap pages before lending
(ffa_prepare_lend()) and restore them upon reclaim
(ffa_lend_reclaimed()). Devices bind to the pool via the "memory-region"
DT property or via ffa_lend_pool_attach().

  reserved-memory {
      #address-cells = <0x2>;
      #size-cells = <0x2>;
      ranges;

      ffa_lend: ffa-lend-pool {
          compatible = "arm,ffa-lend-pool";
          reusable;
          ll-map;
          size = <0x0 0x4000000>;
      };
  };

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/drivers/firmware/arm_ffa/Kconfig b/drivers/firmware/arm_ffa/Kconfig
index 5e3ae5cf82e8..66dbf74c37c3 100644
--- a/drivers/firmware/arm_ffa/Kconfig
+++ b/drivers/firmware/arm_ffa/Kconfig
@@ -19,3 +19,8 @@ config ARM_FFA_SMCCC
 	bool
 	default ARM_FFA_TRANSPORT
 	depends on ARM64 && HAVE_ARM_SMCCC_DISCOVERY
+
+config ARM_FFA_LEND_POOL
+	bool
+	default y
+	depends on ARM_FFA_TRANSPORT && CMA && OF_RESERVED_MEM
diff --git a/drivers/firmware/arm_ffa/Makefile b/drivers/firmware/arm_ffa/Makefile
index 168990a7e792..5ea3019c407b 100644
--- a/drivers/firmware/arm_ffa/Makefile
+++ b/drivers/firmware/arm_ffa/Makefile
@@ -6,3 +6,4 @@ ffa-core-objs := $(ffa-bus-y)
 ffa-module-objs := $(ffa-driver-y) $(ffa-transport-y)
 obj-$(CONFIG_ARM_FFA_TRANSPORT)  = ffa-core.o
 obj-$(CONFIG_ARM_FFA_TRANSPORT) += ffa-module.o
+obj-$(CONFIG_ARM_FFA_LEND_POOL) += lend_pool.o
diff --git a/drivers/firmware/arm_ffa/lend_pool.c b/drivers/firmware/arm_ffa/lend_pool.c
new file mode 100644
index 000000000000..67a36f5d5aa6
--- /dev/null
+++ b/drivers/firmware/arm_ffa/lend_pool.c
@@ -0,0 +1,223 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Arm FF-A Reserved Memory CMA driver for Memory Lending
+ *
+ * Prevents CPU speculative reads to secure memory by unmapping it from the
+ * kernel direct map. This only works if the reserved-memory is mapped at the
+ * last-level ("ll-map;" or "rodata=full") or if all CPUs in the system support
+ * BBML3.
+ *
+ * Copyright (C) 2026 Google LLC
+ * Author: Vincent Donnefort <vdonnefort@google.com>
+ */
+
+#include <linux/arm_ffa.h>
+#include <linux/cleanup.h>
+#include <linux/cma.h>
+#include <linux/dma-map-ops.h>
+#include <linux/init.h>
+#include <linux/mm.h>
+#include <linux/of.h>
+#include <linux/of_fdt.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/rcupdate.h>
+#include <linux/set_memory.h>
+#include <linux/xarray.h>
+
+static DEFINE_XARRAY(ffa_lend_devices);
+
+static bool ffa_lend_pool_contains(struct device *dev, phys_addr_t addr, size_t size)
+{
+	phys_addr_t base, end;
+
+	if (!dev)
+		return false;
+
+	guard(rcu)();
+
+	if (xa_load(&ffa_lend_devices, (unsigned long)dev) != dev)
+		return false;
+
+	if (WARN_ON_ONCE(!dev->cma_area))
+		return false;
+
+	base = cma_get_base(dev->cma_area);
+	end = base + cma_get_size(dev->cma_area);
+
+	return addr >= base && (addr + size) <= end;
+}
+
+/**
+ * ffa_prepare_lend() - Prepare a memory region to be lent in FF-A
+ * @dev:	Device attached to the lend pool
+ * @addr:	Physical start address of the memory region
+ * @size:	Size in bytes
+ *
+ * When memory is lent via FF-A, TrustZone transitions it to the secure state.
+ * As long as Arm CPUs retain a valid mapping to that now-secure memory, they
+ * can speculatively read it, which is fatal on some systems.
+ *
+ * ffa_prepare_lend() prevents this by unmapping the memory range from the
+ * kernel's direct map.
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+int ffa_prepare_lend(struct device *dev, phys_addr_t addr, size_t size)
+{
+	unsigned long nr_pages = size >> PAGE_SHIFT;
+	struct page *page;
+	unsigned long i;
+	int ret;
+
+	if (!ffa_lend_pool_contains(dev, addr, size))
+		return -ENODEV;
+
+	page = pfn_to_page(PHYS_PFN(addr));
+	for (i = 0; i < nr_pages; i++) {
+		ret = __set_direct_map_invalid_noflush(page + i);
+
+		if (ret) {
+			while (i--)
+				__set_direct_map_default_noflush(page + i);
+
+			return ret;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(ffa_prepare_lend);
+
+/**
+ * ffa_lend_reclaimed() - Restore a reclaimed FF-A memory region
+ * @dev:	Device attached to the lend pool
+ * @addr:	Physical start address of the memory region
+ * @size:	Size in bytes
+ *
+ * Restores a memory range into the kernel's direct mapping. It must be called
+ * after a successful FF-A memory reclaim invocation.
+ */
+void ffa_lend_reclaimed(struct device *dev, phys_addr_t addr, size_t size)
+{
+	unsigned long nr_pages = size >> PAGE_SHIFT;
+	struct page *page;
+	unsigned long i;
+
+	if (!ffa_lend_pool_contains(dev, addr, size))
+		return;
+
+	page = pfn_to_page(PHYS_PFN(addr));
+	for (i = 0; i < nr_pages; i++)
+		__set_direct_map_default_noflush(page + i);
+}
+EXPORT_SYMBOL_GPL(ffa_lend_reclaimed);
+
+/**
+ * ffa_lend_pool_attach() - Attach a device to the FF-A lend pool
+ * @dev:	Device to attach
+ *
+ * FF-A devices are dynamically discovered and might not have an associated
+ * device tree node with a "memory-region" phandle. In that case, drivers must
+ * use this function to attach to the "arm,ffa-lend-pool" reserved memory
+ * region.
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+int ffa_lend_pool_attach(struct device *dev)
+{
+	struct device_node *np;
+	struct reserved_mem *rmem;
+
+	np = of_find_compatible_node(NULL, NULL, "arm,ffa-lend-pool");
+	if (!np)
+		return -ENODEV;
+
+	rmem = of_reserved_mem_lookup(np);
+	of_node_put(np);
+	if (!rmem || !rmem->ops || !rmem->ops->device_init)
+		return -EINVAL;
+
+	return rmem->ops->device_init(rmem, dev);
+}
+EXPORT_SYMBOL_GPL(ffa_lend_pool_attach);
+
+/**
+ * ffa_lend_pool_detach() - Detach a device from the FF-A lend pool
+ * @dev:	Device to detach
+ *
+ * Releases the device from the "arm,ffa-lend-pool" reserved memory region.
+ */
+void ffa_lend_pool_detach(struct device *dev)
+{
+	struct device_node *np;
+	struct reserved_mem *rmem;
+
+	np = of_find_compatible_node(NULL, NULL, "arm,ffa-lend-pool");
+	if (!np)
+		return;
+
+	rmem = of_reserved_mem_lookup(np);
+	of_node_put(np);
+
+	if (rmem && rmem->ops && rmem->ops->device_release)
+		rmem->ops->device_release(rmem, dev);
+}
+EXPORT_SYMBOL_GPL(ffa_lend_pool_detach);
+
+static int __init ffa_lend_pool_setup(unsigned long node, struct reserved_mem *rmem)
+{
+	struct cma *cma;
+	int ret;
+
+	if (!of_get_flat_dt_prop(node, "reusable", NULL) ||
+	    of_get_flat_dt_prop(node, "no-map", NULL)) {
+		pr_err("FF-A lend pool: node must be 'reusable' and not 'no-map'\n");
+		return -EINVAL;
+	}
+
+	if (!IS_ALIGNED(rmem->base | rmem->size, CMA_MIN_ALIGNMENT_BYTES)) {
+		pr_err("FF-A lend pool: incorrect alignment of CMA region\n");
+		return -EINVAL;
+	}
+
+	ret = cma_init_reserved_mem(rmem->base, rmem->size, 0, rmem->name, &cma);
+	if (ret) {
+		pr_err("FF-A lend pool: unable to setup CMA region (%d)\n", ret);
+		return ret;
+	}
+
+	rmem->priv = cma;
+
+	return 0;
+}
+
+static int ffa_lend_pool_device_init(struct reserved_mem *rmem, struct device *dev)
+{
+	int ret;
+
+	if (!can_set_direct_map_range(pfn_to_page(PHYS_PFN(rmem->base)), rmem->size / PAGE_SIZE)) {
+		pr_err("FF-A lend pool: reserved memory cannot be unmapped in direct map\n");
+		return -EINVAL;
+	}
+
+	dev->cma_area = rmem->priv;
+
+	ret = xa_err(xa_store(&ffa_lend_devices, (unsigned long)dev, dev, GFP_KERNEL));
+	if (ret)
+		dev->cma_area = NULL;
+
+	return ret;
+}
+
+static void ffa_lend_pool_device_release(struct reserved_mem *rmem, struct device *dev)
+{
+	xa_erase(&ffa_lend_devices, (unsigned long)dev);
+	dev->cma_area = NULL;
+}
+
+static const struct reserved_mem_ops ffa_lend_pool_ops = {
+	.node_init	= ffa_lend_pool_setup,
+	.device_init	= ffa_lend_pool_device_init,
+	.device_release = ffa_lend_pool_device_release,
+};
+RESERVEDMEM_OF_DECLARE(ffa_lend_pool, "arm,ffa-lend-pool", &ffa_lend_pool_ops);
diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index e71d83ee0aef..fa3570f85ff7 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -519,4 +519,25 @@ struct ffa_ops {
 	const struct ffa_notifier_ops *notifier_ops;
 };
 
+#if IS_ENABLED(CONFIG_ARM_FFA_LEND_POOL)
+int ffa_lend_pool_attach(struct device *dev);
+void ffa_lend_pool_detach(struct device *dev);
+int ffa_prepare_lend(struct device *dev, phys_addr_t paddr, size_t size);
+void ffa_lend_reclaimed(struct device *dev, phys_addr_t paddr, size_t size);
+#else
+static inline int ffa_lend_pool_attach(struct device *dev)
+{
+	return -ENODEV;
+}
+static inline void ffa_lend_pool_detach(struct device *dev)
+{
+}
+static inline int ffa_prepare_lend(struct device *dev, phys_addr_t paddr, size_t size)
+{
+	return -ENODEV;
+}
+static inline void ffa_lend_reclaimed(struct device *dev, phys_addr_t paddr, size_t size)
+{
+}
+#endif
 #endif /* _LINUX_ARM_FFA_H */
-- 
2.55.0.970.g62bdec98f9-goog

