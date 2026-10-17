Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FAC3B7B79
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 02:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792205674; cv=none; b=bYsNk8W4uMgk9TJz4V5O5UO2OPreeWx4Ew5BboM8jcA+2yAAPF1CRG32Y76hArRhRCRxdoPJwyGsRc7+YGDjwTMc4IyxZKXhyKuITeAwNRr5FC64ZOJ5zdbWh18ADNXq3yxJiS8giSr41hD+kWqr8wR8v9/wJl0VONqZxLUL2hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792205674; c=relaxed/simple;
	bh=8V4KEEoD051nOMGpLrxMUSDSwZLv8SijsOKAy9BqOto=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IlV3qoCVIf4YnkmwGFMIQMWkD6iJ2L0RoWGUSag8BrutghZeHxH2PPDFVGf5ahu3+J7ngx5ehJsqG9WirSrsUtFR6kqAvNIokzVmfw9fCFW6rNz1M2iCjlMGepFv/2PJ+4aq1QLqBSyDsb3Qd4c433lk9szY1IDRWgoV7Ph5jak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xHuYu-00HXl9-Hx;
	Fri, 16 Oct 2026 22:54:20 -0400
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	Anup Patel <apatel@ventanamicro.com>,
	linux-kernel@vger.kernel.org,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH v1] genirq/msi: Fix the mapping race of wire to MSI interrupts
Date: Fri, 16 Oct 2026 22:54:20 -0400
Message-ID: <20261017025420.792976-1-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On every platform whose wired interrupts go through a wire to MSI bridge
(the RISC-V APLIC in MSI mode and the RPMI system MSI controller, the
HiSilicon MBIGEN and the GICv5 IWB on arm64, the Marvell ICU), two
devices which share an interrupt line and probe at the same time
(asynchronous probing, the deferred probe worker, parallel module
loading) race in irq_create_fwspec_mapping(), and the loser's probe
fails with a misleading error: platform_get_irq() returns -ENXIO ("IRQ
index 0 not found"), or request_irq() on irq 0 returns -EINVAL for a
PCI device. The bridges route every wired peripheral interrupt of their
platform through this path, and the mapping is created in driver probe
context: platform_get_irq() through of_irq_get(), and pci_device_probe()
through pci_assign_irq() for the legacy interrupt line of every PCI
device. On the QEMU RISC-V virt machine with aia=aplic-imsic, two
virtio-net-pci devices on the same INTx line (slots 1 and 5, MSI-X
disabled) booted with driver_async_probe=virtio-pci lose one of the two
devices in 17 of 20 boots, and in 0 of 20 with the patch:

  virtio_net virtio0: probe with driver virtio_net failed with error -22

Two kernel threads on two CPUs mapping the same unmapped APLIC wire at
the same moment lose one of the two callers for 6 of 30 wires without
any added delay and for 8 of 8 with a 100 ms delay in the window, for 0
of 30 and 0 of 8 with the patch. This exists since the wire to MSI
bridges moved to per device MSI domains in v6.9.

irq_create_fwspec_mapping() looks the hardware interrupt up under the
domain lock and allocates a new interrupt when there is none. For a
wire to MSI domain it has to drop the domain lock before invoking
msi_device_domain_alloc_wired(), because the MSI allocation takes the
device's MSI descriptor lock first and the domain lock below it. When
two callers map the same wire in that window, both find no mapping and
both allocate. msi_domain_alloc() detects the duplicate hardware
interrupt number for the second one and fails with -EEXIST,
msi_handle_pci_fail() turns that into -ENOSPC for a non-PCI domain, and
irq_create_fwspec_mapping() returns 0: the second caller sees no
interrupt for a wire which is mapped and working. The legacy and the
non-MSI hierarchical paths keep the domain lock across the allocation
and are not affected.

Repeat the lookup in msi_device_domain_alloc_wired() under the MSI
descriptor lock, which serializes all wired allocations of the device,
and return the mapping a concurrent caller created instead of
allocating a second one. The returned interrupt may already carry a
trigger type, so let irq_create_fwspec_mapping() apply the same trigger
type checks to it as to a mapping it found itself: the type handling
becomes common to both, and a newly created interrupt, which starts
with IRQ_TYPE_NONE, ends up with the requested type as before.

Found while formally verifying irq_create_fwspec_mapping() against the
kernel binary.

Fixes: e49312fe09df ("genirq/irqdomain: Reroute device MSI create_mapping")
Assisted-by: LLM
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
---

Notes:
    The duplicate is already caught deep in the allocation: msi_domain_alloc()
    returns -EEXIST when irq_resolve_mapping() finds the hardware interrupt,
    but msi_handle_pci_fail() maps that to -ENOSPC for every non-PCI bus
    token, so the error cannot be told apart in irq_create_fwspec_mapping()
    and the only place where the race can be resolved without an allocate-
    and-free cycle is under the descriptor lock, which every wired
    allocation and free of the device takes.
    
    Making the trigger type handling common to the found and the created
    interrupt is required by the change, not a cleanup: a type of
    IRQ_TYPE_NONE from the loser would otherwise clear the type the winner
    stored, and a differing type would overwrite it instead of being
    rejected as it is for a mapping found by the lookup. The WARN_ON on a
    missing irq_data after a fresh allocation goes away with it; the common
    path returns 0 for that case like the lookup path always did.
    
    Reproduced on riscv64 under QEMU only (TCG, 2 and 4 harts): with a
    kernel thread pair and with two virtio-net-pci devices sharing an INTx
    line probed asynchronously. With all eight slots populated the pairs
    sharing a line are four probes apart and the window was not hit in 11
    boots; with the two devices back to back it was hit in 17 of 20. Not
    reproduced on hardware.
    
    Reproducer (QEMU, no kernel change): two legacy-INTx PCI devices on one
    line, probed asynchronously; the loser's probe fails on the unpatched
    kernel in 17 of 20 boots, 0 of 20 with the patch:
    
      qemu-system-riscv64 -M virt,aia=aplic-imsic -smp 4 -m 1G -nographic \
        -kernel arch/riscv/boot/Image \
        -device virtio-net-pci,vectors=0,addr=1 \
        -device virtio-net-pci,vectors=0,addr=5 \
        -append "console=ttyS0 driver_async_probe=virtio-pci"
      # before: "virtio_net virtio0: probe with driver virtio_net failed with
      # error -22" and /proc/interrupts lists one device on line 33
      # after:  both devices on line 33 ("virtio0, virtio1")
    
    Deterministic variant (throwaway test, not in the series): a
    late_initcall_sync starting two kthreads on CPUs 0 and 1 that both call
    irq_create_fwspec_mapping() for the same unmapped APLIC source; 8 of 8
    wires lose a caller with a 100 ms delay in the window, 6 of 30 without,
    0 with the patch (repro/hook.sh, repro/run-kthread.sh).

 kernel/irq/irqdomain.c | 84 +++++++++++++++++++++---------------------
 kernel/irq/msi.c       | 18 +++++++--
 2 files changed, 56 insertions(+), 46 deletions(-)

diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 57c819da30c2..2a7868d71778 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -942,63 +942,61 @@ unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
 	 * don't do it again, or hell will break loose.
 	 */
 	virq = irq_find_mapping(domain, hwirq);
-	if (virq) {
-		/*
-		 * If the trigger type is not specified or matches the
-		 * current trigger type then we are done so return the
-		 * interrupt number.
-		 */
-		if (type == IRQ_TYPE_NONE || type == irq_get_trigger_type(virq))
-			goto out;
-
-		/*
-		 * If the trigger type has not been set yet, then set
-		 * it now and return the interrupt number.
-		 */
-		if (irq_get_trigger_type(virq) == IRQ_TYPE_NONE) {
-			irq_data = irq_get_irq_data(virq);
-			if (!irq_data) {
+	if (!virq) {
+		if (irq_domain_is_hierarchy(domain)) {
+			if (irq_domain_is_msi_device(domain)) {
+				/*
+				 * The MSI code takes the descriptor lock
+				 * before the domain lock and resolves a
+				 * concurrent mapping of the same wire, so
+				 * the returned interrupt may already be
+				 * configured.
+				 */
+				mutex_unlock(&domain->root->mutex);
+				virq = msi_device_domain_alloc_wired(domain, hwirq, type);
+				mutex_lock(&domain->root->mutex);
+			} else {
+				virq = irq_domain_alloc_irqs_locked(domain, -1, 1, NUMA_NO_NODE,
+								    fwspec, false, NULL);
+			}
+			if (virq <= 0) {
 				virq = 0;
 				goto out;
 			}
-
-			irqd_set_trigger_type(irq_data, type);
-			goto out;
+		} else {
+			/* Create mapping */
+			virq = irq_create_mapping_affinity_locked(domain, hwirq, NULL);
+			if (!virq)
+				goto out;
 		}
+	}
 
-		pr_warn("type mismatch, failed to map hwirq-%lu for %s!\n",
-			hwirq, of_node_full_name(to_of_node(fwspec->fwnode)));
-		virq = 0;
+	/*
+	 * If the trigger type is not specified or matches the
+	 * current trigger type then we are done so return the
+	 * interrupt number.
+	 */
+	if (type == IRQ_TYPE_NONE || type == irq_get_trigger_type(virq))
 		goto out;
-	}
 
-	if (irq_domain_is_hierarchy(domain)) {
-		if (irq_domain_is_msi_device(domain)) {
-			mutex_unlock(&domain->root->mutex);
-			virq = msi_device_domain_alloc_wired(domain, hwirq, type);
-			mutex_lock(&domain->root->mutex);
-		} else
-			virq = irq_domain_alloc_irqs_locked(domain, -1, 1, NUMA_NO_NODE,
-							    fwspec, false, NULL);
-		if (virq <= 0) {
+	/*
+	 * If the trigger type has not been set yet, then set
+	 * it now and return the interrupt number.
+	 */
+	if (irq_get_trigger_type(virq) == IRQ_TYPE_NONE) {
+		irq_data = irq_get_irq_data(virq);
+		if (!irq_data) {
 			virq = 0;
 			goto out;
 		}
-	} else {
-		/* Create mapping */
-		virq = irq_create_mapping_affinity_locked(domain, hwirq, NULL);
-		if (!virq)
-			goto out;
-	}
 
-	irq_data = irq_get_irq_data(virq);
-	if (WARN_ON(!irq_data)) {
-		virq = 0;
+		irqd_set_trigger_type(irq_data, type);
 		goto out;
 	}
 
-	/* Store trigger type */
-	irqd_set_trigger_type(irq_data, type);
+	pr_warn("type mismatch, failed to map hwirq-%lu for %s!\n",
+		hwirq, of_node_full_name(to_of_node(fwspec->fwnode)));
+	virq = 0;
 out:
 	mutex_unlock(&domain->root->mutex);
 
diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index fb5f372215bf..dac36ba6667b 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -1571,6 +1571,12 @@ struct msi_map msi_domain_alloc_irq_at(struct device *dev, unsigned int domid, u
  * msi_desc::cookie so the underlying interrupt chip and domain code can
  * retrieve it.
  *
+ * The caller looks @hwirq up before invoking this function, but it cannot
+ * hold the domain lock across the call. Allocations are serialized by the
+ * MSI descriptor lock, so the lookup is repeated under it and a mapping
+ * which a concurrent caller created in the meantime is returned instead
+ * of a second one.
+ *
  * Return: The Linux interrupt number (> 0) or an error code
  */
 int msi_device_domain_alloc_wired(struct irq_domain *domain, unsigned int hwirq,
@@ -1580,6 +1586,7 @@ int msi_device_domain_alloc_wired(struct irq_domain *domain, unsigned int hwirq,
 	union msi_instance_cookie icookie = { };
 	struct device *dev = domain->dev;
 	struct msi_map map = { };
+	unsigned int virq;
 
 	if (WARN_ON_ONCE(!dev || domain->bus_token != DOMAIN_BUS_WIRED_TO_MSI))
 		return -EINVAL;
@@ -1588,9 +1595,14 @@ int msi_device_domain_alloc_wired(struct irq_domain *domain, unsigned int hwirq,
 
 	guard(msi_descs_lock)(dev);
 	if (WARN_ON_ONCE(msi_get_device_domain(dev, domid) != domain))
-		map.index = -EINVAL;
-	else
-		map = __msi_domain_alloc_irq_at(dev, domid, MSI_ANY_INDEX, NULL, &icookie);
+		return -EINVAL;
+
+	/* Lost the race against a concurrent mapping of the same wire? */
+	virq = irq_find_mapping(domain, hwirq);
+	if (virq)
+		return virq;
+
+	map = __msi_domain_alloc_irq_at(dev, domid, MSI_ANY_INDEX, NULL, &icookie);
 	return map.index >= 0 ? map.virq : map.index;
 }
 

base-commit: 70dd4ee72eb2d5793c62e71c14e3aba78e5a4e56
-- 
2.53.0

