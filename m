Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBA23ABDA4
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354910; cv=none; b=l81DQPFCygy0mYxw1j+/ocFBdJbEnAY+nem8ToAxYpg1r0JTwPb7B3JsaCgyZPO1xVLWiAEizyhFY5fBZx+WrSuwC7akBhk/2dWccUd+54hLCWtBE7kSapItLaGhVVHiaxkIWXVxhJ/9zWRsANp5xuLTm7/eYU/lpy4wDyJEIG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354910; c=relaxed/simple;
	bh=6AH9lozz+h0v5ix4g+a5hCHlDovpivLOjagsv853pS0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KfP2NbWJouOeWKIE/vK1DmydbLu9kq09JveJTttTZTxaQnrpp2YmJIugrcjWOhyNFamV9/E+dYlKZFu/XZY1nH8KJOmuQnIvP2OZrpw1IhR+r3mKG+B/nAtoFsQqZi3JX5LLMAs5avm0Bf5ex45WoKh1lRCKD+MMOYvTNkW10OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XimquGfj; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XimquGfj"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49e735659b7so8020175e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790354896; x=1790959696; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SoHbwWe9K5LOxh0u09I3TmR+NtCZrXUe3iRj5q2dAH4=;
        b=XimquGfj/hWI+EAyx4WE1NVXmnxC9QqeLQ2UZ6bMgNfzwvAFXhqx2u2wLqNysFBsPj
         L0qLpiR1Z7uPavb3AsG2Jcsfdc1Eu7pyAoIG17s5QmprVwymc2ize7bOiIktn+Q0qFwX
         f+7lySJEuOGxWlAfRsUhfBs7Odqpo4acmPUQpgfM2gnfaMoojnFxaAo0t8TRz9tAIswT
         Begk/pSd1aHaiSUO/x75/MaopdkULUhDvRywVqrZlfnyvE9V/2YqTMV/l78s51tqtHKi
         9CyK4hxID/I2ik3kb+bf7xPsiuQRKAYESJq+qDUDVYZ3JdoQoABui1KAjPTwm8gLurP4
         i9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790354896; x=1790959696;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SoHbwWe9K5LOxh0u09I3TmR+NtCZrXUe3iRj5q2dAH4=;
        b=kk+j9IXvC036EYEJD/eSJ0QM1veH+yR6p1dvw/Q18H9z/MlTPnU6ZQkZm5pF6JpeYT
         5AQgHT6hS2CTEb4uO/Pf+Kc9K4xWpEitr24Z2mIu4hHuc9kA43n9JOtTygdJAHb2kchl
         ocGRVuax0Bwu4tkdDFsOjlbzK0claH0YWwOnCfu5RVGgYfNyzBlZD5K8SMsbQtariSqN
         wlM7THtktyTExxUSbXU2E/4M0Bo1ICjzVI6eQYFNufDiIMB4Vlf1K4Dpy5rOkgos1FwE
         W2mSHhEDA2nfK/e3KO4x0UUASKXWGrE4dxZlsAzhwhxuIX0K7xNGNVfC+2QiSSQwJyx8
         +iBA==
X-Gm-Message-State: AFuF++mZLGl1CJ4/a3KHc5IhZ/BVJTjBw5MhZ//J6b5+yVwHd4Gl3fBt
	UgiUXVQOkh4p8Bxgk15GBB8d+y+iUn8+QJ6M21+3CcGzx3riL/sQOhASIrkH3/MCTa3qluJ9ZQ=
	=
X-Received: from wmpr42.prod.google.com ([2002:a05:600c:322a:b0:49f:e2ec:9676])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4ec6:b0:49f:e4b0:fe40
 with SMTP id 5b1f17b1804b1-49fe66e657bmr108707875e9.16.1790354895634; Fri, 25
 Sep 2026 09:48:15 -0700 (PDT)
Date: Fri, 25 Sep 2026 18:47:55 +0200
In-Reply-To: <20260925164801.4047844-4-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260925164801.4047844-4-ardb+git@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260925164801.4047844-6-ardb+git@google.com>
Subject: [PATCH v2 2/2] PCI: Allow non-prefetchable BARs in prefetchable windows
From: Ard Biesheuvel <ardb+git@google.com>
To: 0001-PCI-Tolerate-non-prefetchable-64-bit-BARs-in-prefetc.patch@google.com
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	"=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ilpo.jarvinen@linux.intel.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

The non-prefetchable memory window of a PCI-to-PCI bridge can only
decode 32-bit addresses, and so non-prefetchable BARs of devices below a
bridge can only be allocated from the part of the host bridge memory
space below 4 GB. This is the case even for 64-bit BARs, which could
easily be placed above 4 GB if there was a bridge window to put them in,
and on many platforms, 32-bit addressable MMIO space is scarce.

The PCIe spec addresses this in the implementation note "Additional
Guidance on the Prefetchable Bit in Memory Space BARs" (PCIe r7.0, sec
7.5.1.2.1): on PCIe, setting the Prefetchable bit of a BAR still permits
correct operation even if the range has read side effects or cannot
tolerate write merging, as long as the entire path from the host to the
device is PCIe, given that PCIe Memory Reads always carry an explicit
length, and PCIe Switches never prefetch or merge writes. The same
reasoning applies when it is the OS that places a non-prefetchable BAR
in a prefetchable bridge window: PCIe Root Ports and Switch Ports
forward requests that hit either window in exactly the same way.

This reasoning does not extend to the host bridge, though: how it treats
the windows that firmware describes as prefetchable is platform
specific. For instance, the V3 Semiconductor V360EPC (pci-v3-semi)
enables prefetching for its prefetchable window, the MPC52xx uses Memory
Read Multiple for it, and Freescale PCI/PCIe host bridges (fsl_pci)
enable relaxed ordering for it. However, if the host bridge has no
prefetchable windows at all (as appears to be the case with many x86
PCs), all prefetchable bridge windows are carved out of its
non-prefetchable windows, and so the host bridge does not treat them any
differently.

Note that this only concerns where a BAR is placed. How it is mapped is
decided by the driver and by the attributes of the BAR itself (e.g.,
pci_iomap_wc() and the sysfs resource<N>_wc files only honour
IORESOURCE_PREFETCH on the BAR), and this change does not modify the
flags of any BAR.

So add pci_resource_placement_flags(), which returns the flags of a
device resource with IORESOURCE_PREFETCH set if it is a non-prefetchable
memory BAR (including SR-IOV VF BARs), unless there is a bridge between
the device and the root bus that is not a PCIe Root Port or PCIe Switch
Port, or the host bridge has a prefetchable memory window, and use it
wherever the resource allocator decides which bridge window a device
resource belongs in:

- when sizing bridge windows, via pbus_select_window(), which now takes
  the device rather than its bus;
- when allocating the resource in __pci_assign_resource(), by passing
  its result to __pci_bus_alloc_resource();
- when claiming a resource assigned by firmware, in
  pci_find_parent_resource();
- when releasing bridge windows to retry failed assignments, or to
  resize a BAR.

As a result, an eligible non-prefetchable BAR is handled exactly like a
prefetchable BAR of the same width: a 64-bit BAR is placed in the 64-bit
prefetchable window of the upstream bridge, which may be above 4 GB,
while a 32-bit BAR only ends up in the prefetchable window if that
window is 32-bit only. As before, allocation falls back to the
non-prefetchable window if the prefetchable one has no space.

Bridge windows are not affected, and neither are devices below
conventional PCI or CardBus bridges, or below PCIe to PCI/PCI-X bridges
(in either direction), or below host bridges that have a prefetchable
window. Devices on a root bus are not affected either, as there is no
prefetchable window for their BARs to go to.

Tested on QEMU arm64 'virt' (DT, all resources assigned by Linux) with a
qemu-xhci below a Root Port, an NVMe below a Switch, a qemu-xhci below a
PCIe-to-PCI bridge and another qemu-xhci on the root bus: the 64-bit
non-prefetchable BARs of the first two (and of the PCIe-to-PCI bridge
itself) move from the 32-bit non-prefetchable windows into the 64-bit
prefetchable windows above 4 GB, while the others stay where they were.
When the 64-bit host bridge window is marked prefetchable in the DT, all
resources are assigned exactly as without this patch.  Both drivers
work, also after hot removal and rescan of the endpoints and of the
Switch. Also tested on QEMU x86_64 q35 with SeaBIOS, which assigns all
resources itself: the firmware assignment is claimed as before, and
after hot removal and rescan, the eligible BARs are placed in the
prefetchable windows.

Assisted-by: LLM sparse
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/pci/pci.c       | 115 +++++++++++++++++++++++++++++++++++++++-
 drivers/pci/pci.h       |   5 +-
 drivers/pci/setup-bus.c |  58 +++++++++++++-------
 drivers/pci/setup-res.c |  29 ++++++----
 4 files changed, 174 insertions(+), 33 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index b2879a6be5..dfaeb3104b 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -736,6 +736,111 @@ static bool pci_dev_config_accessible(struct pci_dev *dev, char *msg)
 	return true;
 }
 
+/*
+ * Return true if there is a bridge between @bus and the root bus that is not a
+ * PCIe Root Port or PCIe Switch Port, such as a conventional PCI or CardBus
+ * bridge, or a PCIe to PCI/PCI-X bridge in either direction.
+ */
+static bool pci_bus_behind_non_pcie_port(struct pci_bus *bus)
+{
+	for (; !pci_is_root_bus(bus); bus = bus->parent) {
+		struct pci_dev *bridge = bus->self;
+
+		/* Virtual buses for SR-IOV VFs have no bridge of their own */
+		if (!bridge)
+			continue;
+
+		if (!pci_is_pcie(bridge))
+			return true;
+
+		switch (pci_pcie_type(bridge)) {
+		case PCI_EXP_TYPE_ROOT_PORT:
+		case PCI_EXP_TYPE_UPSTREAM:
+		case PCI_EXP_TYPE_DOWNSTREAM:
+			break;
+		default:
+			/* PCIe to PCI/PCI-X bridges, in either direction */
+			return true;
+		}
+	}
+
+	return false;
+}
+
+/*
+ * Return true if the host bridge above @bus has a prefetchable memory window.
+ */
+static bool pci_host_bridge_has_pref_window(struct pci_bus *bus)
+{
+	struct resource *r;
+
+	while (!pci_is_root_bus(bus))
+		bus = bus->parent;
+
+	pci_bus_for_each_resource(bus, r) {
+		if (r && resource_type(r) == IORESOURCE_MEM &&
+		    (r->flags & IORESOURCE_PREFETCH))
+			return true;
+	}
+
+	return false;
+}
+
+/**
+ * pci_resource_placement_flags - Get the flags to use for placing a resource
+ * @dev: PCI device
+ * @res: Resource of @dev
+ * @flags: Resource flags of @res (which may have been cleared in @res itself)
+ *
+ * Non-prefetchable memory BARs are normally only placed in non-prefetchable
+ * bridge windows. However, the PCIe spec notes that setting the Prefetchable
+ * bit of a BAR permits correct operation even if the range has read side
+ * effects or cannot tolerate write merging, as long as the entire path from
+ * the host to the device is PCIe: PCIe Memory Reads always carry an explicit
+ * length, and PCIe Switches never prefetch or merge writes (PCIe r7.0, sec
+ * 7.5.1.2.1, Implementation Note "Additional Guidance on the Prefetchable Bit
+ * in Memory Space BARs").
+ *
+ * So treat non-prefetchable memory BARs of @dev as prefetchable when choosing,
+ * sizing and allocating bridge windows, unless there is a bridge between @dev
+ * and the root bus that is not a PCIe Root Port or PCIe Switch Port, such as a
+ * conventional PCI bridge, which may prefetch from its prefetchable window.
+ * This permits 64-bit non-prefetchable BARs to be placed in a 64-bit
+ * prefetchable window, which may be above 4GB, rather than competing for space
+ * in the non-prefetchable window of a PCI-to-PCI bridge, which is always below
+ * 4GB. This only affects where a BAR is placed, not how it is mapped.
+ *
+ * How a host bridge treats the windows that firmware describes as prefetchable
+ * is platform specific, however, and some prefetch from them, or relax the
+ * ordering of accesses to them. So only do this if the host bridge has no
+ * prefetchable windows at all, in which case all prefetchable bridge windows
+ * are carved out of its non-prefetchable windows. As a consequence, the
+ * non-prefetchable BARs of devices on a root bus are never placed in a
+ * prefetchable window. Bridge windows are never treated as prefetchable.
+ *
+ * Return: @flags, with IORESOURCE_PREFETCH set if @res may be placed in a
+ * prefetchable bridge window.
+ */
+unsigned long pci_resource_placement_flags(const struct pci_dev *dev,
+					   const struct resource *res,
+					   unsigned long flags)
+{
+	if ((flags & (IORESOURCE_TYPE_BITS | IORESOURCE_PREFETCH)) !=
+	    IORESOURCE_MEM)
+		return flags;
+
+	if (pci_resource_is_bridge_win(pci_resource_num(dev, res)))
+		return flags;
+
+	if (pci_bus_behind_non_pcie_port(dev->bus))
+		return flags;
+
+	if (pci_host_bridge_has_pref_window(dev->bus))
+		return flags;
+
+	return flags | IORESOURCE_PREFETCH;
+}
+
 /**
  * pci_find_parent_resource - return resource region of parent bus of given
  *			      region
@@ -749,8 +854,13 @@ struct resource *pci_find_parent_resource(const struct pci_dev *dev,
 					  struct resource *res)
 {
 	const struct pci_bus *bus = dev->bus;
+	unsigned long flags = res->flags;
 	struct resource *r;
 
+	/* @res is not necessarily one of @dev's resources */
+	if (res >= &dev->resource[0] && res < &dev->resource[PCI_NUM_RESOURCES])
+		flags = pci_resource_placement_flags(dev, res, flags);
+
 	pci_bus_for_each_resource(bus, r) {
 		if (!r)
 			continue;
@@ -758,10 +868,11 @@ struct resource *pci_find_parent_resource(const struct pci_dev *dev,
 
 			/*
 			 * If the window is prefetchable but the BAR is
-			 * not, the allocator made a mistake.
+			 * not (and may not be treated as such), the
+			 * allocator made a mistake.
 			 */
 			if (r->flags & IORESOURCE_PREFETCH &&
-			    !(res->flags & IORESOURCE_PREFETCH))
+			    !(flags & IORESOURCE_PREFETCH))
 				return NULL;
 
 			/*
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 8297cfb5dc..3fdb1fbd41 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -567,6 +567,9 @@ static inline int pci_resource_num(const struct pci_dev *dev,
 	return resno;
 }
 
+unsigned long pci_resource_placement_flags(const struct pci_dev *dev,
+					   const struct resource *res,
+					   unsigned long flags);
 int __pci_bus_alloc_resource(struct pci_bus *bus, struct resource *res,
 			     unsigned long flags, resource_size_t size,
 			     resource_size_t align, resource_size_t min,
@@ -574,7 +577,7 @@ int __pci_bus_alloc_resource(struct pci_bus *bus, struct resource *res,
 			     void *alignf_data);
 
 void pbus_validate_busn(struct pci_bus *bus);
-struct resource *pbus_select_window(struct pci_bus *bus,
+struct resource *pbus_select_window(const struct pci_dev *dev,
 				    const struct resource *res);
 void pci_reassigndev_resource_alignment(struct pci_dev *dev);
 void pci_disable_bridge_window(struct pci_dev *dev);
diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index ed16ef7c26..e700a39878 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -253,15 +253,17 @@ static struct resource *pbus_select_window_for_type(struct pci_bus *bus,
 
 /**
  * pbus_select_window - Select bridge window for a resource
- * @bus: PCI bus
+ * @dev: PCI device owning @res
  * @res: Resource
  *
- * Select the bridge window for @res. If the resource is already assigned,
- * return the current bridge window.
+ * Select the bridge window on the bus of @dev for @res. If the resource is
+ * already assigned, return the current bridge window.
  *
  * For memory resources, the selection is done as follows:
  *
- * Any non-prefetchable resource is put into the non-prefetchable window.
+ * Any non-prefetchable resource is put into the non-prefetchable window,
+ * unless it may be treated as prefetchable according to
+ * pci_resource_placement_flags().
  *
  * If there is no prefetchable MMIO window, put all memory resources into the
  * non-prefetchable window.
@@ -274,13 +276,16 @@ static struct resource *pbus_select_window_for_type(struct pci_bus *bus,
  *
  * Return: the bridge window resource or NULL if no bridge window is found.
  */
-struct resource *pbus_select_window(struct pci_bus *bus,
+struct resource *pbus_select_window(const struct pci_dev *dev,
 				    const struct resource *res)
 {
+	unsigned long flags;
+
 	if (resource_assigned(res))
 		return res->parent;
 
-	return pbus_select_window_for_type(bus, res->flags);
+	flags = pci_resource_placement_flags(dev, res, res->flags);
+	return pbus_select_window_for_type(dev->bus, flags);
 }
 
 static bool pdev_resources_assignable(struct pci_dev *dev)
@@ -514,6 +519,13 @@ static void assign_requested_resources_sorted(struct list_head *head,
 	}
 }
 
+/* Get the placement flags of a tracked resource */
+static unsigned long pci_dev_res_placement_flags(struct pci_dev_resource *dev_res)
+{
+	return pci_resource_placement_flags(dev_res->dev, dev_res->res,
+					    dev_res->flags);
+}
+
 static unsigned long pci_fail_res_type_mask(struct list_head *fail_head)
 {
 	struct pci_dev_resource *fail_res;
@@ -521,7 +533,7 @@ static unsigned long pci_fail_res_type_mask(struct list_head *fail_head)
 
 	/* Check failed type */
 	list_for_each_entry(fail_res, fail_head, list)
-		mask |= fail_res->flags;
+		mask |= pci_dev_res_placement_flags(fail_res);
 
 	/*
 	 * One pref failed resource will set IORESOURCE_MEM, as we can
@@ -564,8 +576,9 @@ static bool pci_required_resource_failed(struct list_head *fail_head,
 
 	list_for_each_entry(fail_res, fail_head, list) {
 		int idx = pci_resource_num(fail_res->dev, fail_res->res);
+		unsigned long flags = pci_dev_res_placement_flags(fail_res);
 
-		if (type && (fail_res->flags & PCI_RES_TYPE_MASK) != type)
+		if (type && (flags & PCI_RES_TYPE_MASK) != type)
 			continue;
 
 		if (!pci_resource_is_optional(fail_res->dev, idx))
@@ -1307,7 +1320,7 @@ static void pbus_size_mem(struct pci_bus *bus, struct resource *b_res,
 			if (!pdev_resources_assignable(dev) ||
 			    !pdev_resource_should_fit(dev, r))
 				continue;
-			if (b_res != pbus_select_window(bus, r))
+			if (b_res != pbus_select_window(dev, r))
 				continue;
 
 			align = pci_resource_alignment(dev, r);
@@ -1942,7 +1955,7 @@ static void remove_dev_resources(struct pci_dev *dev,
 	int idx;
 
 	pci_dev_for_each_resource(dev, res) {
-		b_win = pbus_select_window(dev->bus, res);
+		b_win = pbus_select_window(dev, res);
 		if (!b_win)
 			continue;
 
@@ -2158,10 +2171,11 @@ static void pci_prepare_next_assign_round(struct list_head *fail_head,
 	 * enough to contain child device resources.
 	 */
 	list_for_each_entry(fail_res, fail_head, list) {
+		unsigned long flags = pci_dev_res_placement_flags(fail_res);
 		struct pci_bus *bus = fail_res->dev->bus;
 		struct resource *b_win;
 
-		b_win = pbus_select_window_for_type(bus, fail_res->flags);
+		b_win = pbus_select_window_for_type(bus, flags);
 		if (!b_win)
 			continue;
 		pci_bus_release_bridge_resources(bus, b_win, rel_type);
@@ -2301,16 +2315,18 @@ void pci_assign_unassigned_bridge_resources(struct pci_dev *bridge)
 EXPORT_SYMBOL_GPL(pci_assign_unassigned_bridge_resources);
 
 /*
- * Walk to the root bus, find the bridge window relevant for @res and
- * release it when possible. If the bridge window contains assigned
+ * Walk to the root bus, find the bridge window relevant for @res of @pdev
+ * and release it when possible. If the bridge window contains assigned
  * resources, it cannot be released.
  */
-static int pbus_reassign_bridge_resources(struct pci_bus *bus, struct resource *res,
+static int pbus_reassign_bridge_resources(struct pci_dev *pdev,
+					  struct resource *res,
 					  struct list_head *saved)
 {
-	unsigned long type = res->flags;
+	unsigned long type = pci_resource_placement_flags(pdev, res, res->flags);
+	struct pci_dev *bridge = NULL, *owner = pdev;
+	struct pci_bus *bus = pdev->bus;
 	struct pci_dev_resource *dev_res;
-	struct pci_dev *bridge = NULL;
 	LIST_HEAD(add_list);
 	LIST_HEAD(failed);
 	unsigned int i;
@@ -2318,7 +2334,7 @@ static int pbus_reassign_bridge_resources(struct pci_bus *bus, struct resource *
 
 	while (!pci_is_root_bus(bus)) {
 		bridge = bus->self;
-		res = pbus_select_window(bus, res);
+		res = pbus_select_window(owner, res);
 		if (!res)
 			break;
 
@@ -2339,6 +2355,8 @@ static int pbus_reassign_bridge_resources(struct pci_bus *bus, struct resource *
 				 res_name, res);
 		}
 
+		/* @res is now a window of @bridge */
+		owner = bridge;
 		bus = bus->parent;
 	}
 
@@ -2386,7 +2404,7 @@ int pci_do_resource_release_and_resize(struct pci_dev *pdev, int resno, int size
 	unsigned int i;
 	int old, ret;
 
-	b_win = pbus_select_window(bus, res);
+	b_win = pbus_select_window(pdev, res);
 	if (!b_win)
 		return -EINVAL;
 
@@ -2407,7 +2425,7 @@ int pci_do_resource_release_and_resize(struct pci_dev *pdev, int resno, int size
 		if (exclude_bars & BIT(i))
 			continue;
 
-		if (b_win != pbus_select_window(bus, r))
+		if (b_win != pbus_select_window(pdev, r))
 			continue;
 
 		ret = pci_dev_res_add_to_list(&saved, pdev, r, 0, 0);
@@ -2419,7 +2437,7 @@ int pci_do_resource_release_and_resize(struct pci_dev *pdev, int resno, int size
 	pci_resize_resource_set_size(pdev, resno, size);
 
 	if (bridge) {
-		ret = pbus_reassign_bridge_resources(bus, res, &saved);
+		ret = pbus_reassign_bridge_resources(pdev, res, &saved);
 		if (ret)
 			goto restore;
 	} else {
diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
index 376f09630a..0aea68ec45 100644
--- a/drivers/pci/setup-res.c
+++ b/drivers/pci/setup-res.c
@@ -315,11 +315,19 @@ static int __pci_assign_resource(struct pci_bus *bus, struct pci_dev *dev,
 		int resno, resource_size_t size, resource_size_t align)
 {
 	struct resource *res = pci_resource_n(dev, resno);
+	unsigned long flags;
 	resource_size_t min;
 	int ret;
 
 	min = (res->flags & IORESOURCE_IO) ? PCIBIOS_MIN_IO : PCIBIOS_MIN_MEM;
 
+	/*
+	 * A non-prefetchable BAR may be placed as if it were prefetchable
+	 * (see pci_resource_placement_flags()), in which case any upstream
+	 * bridge windows were sized accordingly, so use the same flags here.
+	 */
+	flags = pci_resource_placement_flags(dev, res, res->flags);
+
 	/*
 	 * First, try exact prefetching match.  Even if a 64-bit
 	 * prefetchable bridge window is below 4GB, we can't put a 32-bit
@@ -327,9 +335,9 @@ static int __pci_assign_resource(struct pci_bus *bus, struct pci_dev *dev,
 	 * 64-bit window will contain no 32-bit resources.  If we assign
 	 * things differently than they were sized, not everything will fit.
 	 */
-	ret = pci_bus_alloc_resource(bus, res, size, align, min,
-				     IORESOURCE_PREFETCH | IORESOURCE_MEM_64,
-				     pcibios_align_resource, dev);
+	ret = __pci_bus_alloc_resource(bus, res, flags, size, align, min,
+				       IORESOURCE_PREFETCH | IORESOURCE_MEM_64,
+				       pcibios_align_resource, dev);
 	if (ret == 0)
 		return 0;
 
@@ -337,11 +345,11 @@ static int __pci_assign_resource(struct pci_bus *bus, struct pci_dev *dev,
 	 * If the prefetchable window is only 32 bits wide, we can put
 	 * 64-bit prefetchable resources in it.
 	 */
-	if ((res->flags & (IORESOURCE_PREFETCH | IORESOURCE_MEM_64)) ==
+	if ((flags & (IORESOURCE_PREFETCH | IORESOURCE_MEM_64)) ==
 	     (IORESOURCE_PREFETCH | IORESOURCE_MEM_64)) {
-		ret = pci_bus_alloc_resource(bus, res, size, align, min,
-					     IORESOURCE_PREFETCH,
-					     pcibios_align_resource, dev);
+		ret = __pci_bus_alloc_resource(bus, res, flags, size, align,
+					       min, IORESOURCE_PREFETCH,
+					       pcibios_align_resource, dev);
 		if (ret == 0)
 			return 0;
 	}
@@ -352,9 +360,10 @@ static int __pci_assign_resource(struct pci_bus *bus, struct pci_dev *dev,
 	 * non-prefetchable, the first call already tried the only possibility
 	 * so we don't need to try again.
 	 */
-	if (res->flags & (IORESOURCE_PREFETCH | IORESOURCE_MEM_64))
-		ret = pci_bus_alloc_resource(bus, res, size, align, min, 0,
-					     pcibios_align_resource, dev);
+	if (flags & (IORESOURCE_PREFETCH | IORESOURCE_MEM_64))
+		ret = __pci_bus_alloc_resource(bus, res, flags, size, align,
+					       min, 0, pcibios_align_resource,
+					       dev);
 
 	return ret;
 }
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

