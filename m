Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7C851E43D;
	Thu, 15 Oct 2026 10:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058448; cv=none; b=t74AgkX/KQddak2eYqPt4cOwNwCGF0DDzavcC/ZzJ+upJ3YEdxD+yI7h878ks+xmWv+CPo1f/funeutySe93lcZXLJ3cNoGnvyJMF5H70WwxbTazvYgYGFmTvGtMa/AMlCcVT0LMb5j+1nTYS67R+7FCXaOFctsLp5/xMP8QYyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058448; c=relaxed/simple;
	bh=du/D4JNlU35Y/S6GGjUFEdak+Eg3T7mex0iiVue+QLM=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=jqEZW8mg8QNx2OoM3wAXk3l6XwplJGw6gF6T/Kp6+xFV45h0dDQIXEg3I7k9TZAVD0mYll8dgCkNQi65fZWQTgxAcjgObJI4v9z/tN4MkmWne4ewYUrYVC8farW3zBJttxC/umcy8Y40ac/2FTPADPQsi6VVHE4/L6zoKZUq+Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0O3MnmMQ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JflUnWjM; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0O3MnmMQ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JflUnWjM"
Date: Thu, 15 Oct 2026 10:00:31 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792058433;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X0HOU7V8/REYzv6hGABQJH800A/LkYY3bix8imvFQiA=;
	b=0O3MnmMQSacYXWgJZ9LmZhVo+JzRkoM4Fvj3yhFkCkwK08zmy1p+tE+JsZKMbls91kJDKh
	Um3SFw8R1ghhY8Yy0QzensBEMMDQ7o52neEbK2J01lTJpajrMhjN9YIUWQMYj37BCDrJb4
	t/uB5+LHxdi2pWFBEaV8yFqY2tbvGi0WIo2jzojW2BM185CbYjK7hL2x1UywGeO+yyIggY
	l+qNkt5UM1/gvXExRlJraBM3IUckKGN7C/IlO9qYyl7fAjrvw/y+zd/6xBnn3ccawooVTH
	A8pEPUODuumQvC9eyY0vjNJ2rL3cdIJeYJ/O/xTsVwE8YmlcTUN747Yq1iSKHA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792058433;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X0HOU7V8/REYzv6hGABQJH800A/LkYY3bix8imvFQiA=;
	b=JflUnWjMX0FZ1RicQjr5Y5Gm+wgG8KDntOhT6yJ4w78taiiHhpoY+xBMIb/XiXU+U44f3s
	0i1aPn79exO64ICQ==
From: "tip-bot2 for Anirudha Sarangi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip: Add Xilinx Versal NET SMMU CSR interrupt
 controller driver
Cc: Anirudha Sarangi <anirudha.sarangi@amd.com>,
 Tushar Nimkar <tushar.nimkar@amd.com>, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260928-smmu-changes-v2-v4-2-3c79a14cd806@amd.com>
References: <20260928-smmu-changes-v2-v4-2-3c79a14cd806@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179205843104.2666988.8540107425602010674.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     3cbc11fcefc85093965f2b5bb0c4b205b02fd071
Gitweb:        https://git.kernel.org/tip/3cbc11fcefc85093965f2b5bb0c4b205b02=
fd071
Author:        Anirudha Sarangi <anirudha.sarangi@amd.com>
AuthorDate:    Mon, 28 Sep 2026 15:03:04 +05:30
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 11:59:22 +02:00

irqchip: Add Xilinx Versal NET SMMU CSR interrupt controller driver

The Xilinx Versal NET SoC implements a Control and Status Register (CSR)
block in front of the ARM SMMUv3 to manage EVENTQ, PRIQ and GLOBAL
interrupts. Interrupts are enabled, cleared, and acknowledged
through this block by writing to the relevant registers. Once an
interrupt is acknowledged, it is forwarded to the parent interrupt
controller for further processing.

Add an irqchip driver for the CSR block. The driver registers as an
interrupt controller and chains to the upstream SMMUv3 driver, so
that the standard SMMUv3 driver does not require modification while still
supporting Xilinx SoCs.

The CSR block can also gate the SMMUv3 CMDQ_SYNC completion interrupt
(bit 1), but it is intentionally left unsupported. The Linux arm-smmu-v3
driver signals CMDQ_SYNC completion via polling or MSI and never requests
a wired CMD_SYNC interrupt, so there is no in-kernel consumer for it.
Exposing it as a child line would only risk spurious, never-acked
interrupts, and it is omitted from the DT binding for the same reason.

This driver is intended to operate in conjunction with the ARM SMMUv3
driver and the kernel's IOMMU DMA infrastructure. These dependencies
are not selected directly in Kconfig to avoid introducing dependency
recursion.

Co-developed-by: Tushar Nimkar <tushar.nimkar@amd.com>
Signed-off-by: Anirudha Sarangi <anirudha.sarangi@amd.com>
Signed-off-by: Tushar Nimkar <tushar.nimkar@amd.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20260928-smmu-changes-v2-v4-2-3c79a14cd806@amd=
.com
---
 MAINTAINERS                           |  10 +-
 drivers/irqchip/Kconfig               |  10 +-
 drivers/irqchip/Makefile              |   1 +-
 drivers/irqchip/irq-xilinx-smmu-csr.c | 244 +++++++++++++++++++++++++-
 4 files changed, 265 insertions(+)
 create mode 100644 drivers/irqchip/irq-xilinx-smmu-csr.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da7..f6007e7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29913,6 +29913,16 @@ F:	Documentation/misc-devices/xilinx_sdfec.rst
 F:	drivers/misc/xilinx_sdfec.c
 F:	include/uapi/misc/xilinx_sdfec.h
=20
+XILINX SMMU CSR IRQ DRIVER
+M:	Anirudha Sarangi <anirudha.sarangi@amd.com>
+M:	Tushar Nimkar <tushar.nimkar@amd.com>
+L:	git@amd.com
+L:	linux-arm-kernel@lists.infradead.org
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/interrupt-controller/xlnx,versal-net-sm=
mu-csr.yaml
+F:	drivers/irqchip/irq-xilinx-smmu-csr.c
+
 XILINX TRNG DRIVER
 M:	Mounika Botcha <mounika.botcha@amd.com>
 M:	Harsh Jain <h.jain@amd.com>
diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 06d5cbf..136bab4 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -842,4 +842,14 @@ config SUNPLUS_SP7021_INTC
 	  chained controller, routing all interrupt source in P-Chip to
 	  the primary controller on C-Chip.
=20
+config IRQCHIP_XILINX_SMMU_CSR
+	bool "Xilinx SMMU CSR Interrupt Driver"
+	depends on ARCH_ZYNQMP
+	select IRQ_DOMAIN
+	help
+	  This driver does the initial handling of SMMU interrupts before
+	  forwarding them to the ARM SMMU v3 driver.  It is intended for
+	  ZynqMP-class platforms where a vendor CSR block mediates SMMU
+	  interrupts.
+
 endmenu
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index ab33ccc..16a5fd1 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -135,3 +135,4 @@ obj-$(CONFIG_APPLE_AIC)			+=3D irq-apple-aic.o
 obj-$(CONFIG_MCHP_EIC)			+=3D irq-mchp-eic.o
 obj-$(CONFIG_SOPHGO_SG2042_MSI)		+=3D irq-sg2042-msi.o
 obj-$(CONFIG_SUNPLUS_SP7021_INTC)	+=3D irq-sp7021-intc.o
+obj-$(CONFIG_IRQCHIP_XILINX_SMMU_CSR)	+=3D irq-xilinx-smmu-csr.o
diff --git a/drivers/irqchip/irq-xilinx-smmu-csr.c b/drivers/irqchip/irq-xili=
nx-smmu-csr.c
new file mode 100644
index 0000000..9bb6255
--- /dev/null
+++ b/drivers/irqchip/irq-xilinx-smmu-csr.c
@@ -0,0 +1,244 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Xilinx Versal Net SMMU CSR interrupt controller driver
+ *
+ * Copyright (C) 2026 Advanced Micro Devices, Inc.
+ *
+ * Vendor CSR block that gates the ARM SMMUv3 wired interrupts. Chains
+ * off the single GIC parent line and demultiplexes the CSR status into
+ * three children (eventq, gerror, priq), each enabled/acked
+ * via SMMU_CSR_IER/IDR/ISR that the ARM SMMUv3 driver requests individually.
+ */
+
+#include <linux/bitops.h>
+#include <linux/io.h>
+#include <linux/irqchip.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+/* Interrupt types */
+#define SMMU_INTR_EVENT		BIT(0)
+#define SMMU_INTR_GLOBAL	BIT(2)
+#define SMMU_INTR_PRI		BIT(3)
+
+/* Mask for the SMMU interrupts this driver demultiplexes */
+#define SMMU_INTR_ALL		(SMMU_INTR_EVENT | SMMU_INTR_GLOBAL | SMMU_INTR_PRI)
+
+/* Every interrupt source the CSR block implements (incl. unsupported CMD_SY=
NC) */
+#define SMMU_INTR_HW_ALL	GENMASK(3, 0)
+
+#define SMMU_CSR_ISR		0x24	/* Interrupt Status (raw, W1C)   */
+#define SMMU_CSR_MASK		0x28	/* Interrupt Mask (RO): 1 =3D masked */
+#define SMMU_CSR_IER		0x2c	/* Interrupt Enable (W1 to unmask) */
+#define SMMU_CSR_IDR		0x30	/* Interrupt Disable (W1 to mask)  */
+
+/**
+ * struct xilinx_smmu_csr - SMMU CSR interrupt controller context
+ * @base:	MMIO base address of the CSR registers
+ * @domain:	Interrupt domain for the child interrupts
+ * @parent_irq:	parent (GIC) interrupt this block is chained to
+ * @lock:	protects the SMMU_CSR_IER/IDR/ISR read and writes
+ */
+struct xilinx_smmu_csr {
+	void __iomem		*base;
+	struct irq_domain	*domain;
+	int			parent_irq;
+	raw_spinlock_t		lock;
+};
+
+enum xilinx_smmu_csr_irq {
+	SMMU_CSR_IRQ_EVENTQ	=3D 0,
+	SMMU_CSR_IRQ_GERROR	=3D 2,
+	SMMU_CSR_IRQ_PRIQ	=3D 3,
+	SMMU_CSR_IRQ_NR,
+};
+
+static u32 xilinx_smmu_csr_hwirq_mask(irq_hw_number_t hwirq)
+{
+	if (hwirq >=3D SMMU_CSR_IRQ_NR)
+		return 0;
+
+	return BIT(hwirq) & SMMU_INTR_ALL;
+}
+
+static void xilinx_smmu_csr_irq_mask(struct irq_data *d)
+{
+	struct xilinx_smmu_csr *csr =3D irq_data_get_irq_chip_data(d);
+	u32 mask =3D xilinx_smmu_csr_hwirq_mask(d->hwirq);
+
+	if (!mask)
+		return;
+
+	guard(raw_spinlock)(&csr->lock);
+	writel(mask, csr->base + SMMU_CSR_IDR);
+}
+
+static void xilinx_smmu_csr_irq_unmask(struct irq_data *d)
+{
+	struct xilinx_smmu_csr *csr =3D irq_data_get_irq_chip_data(d);
+	u32 mask =3D xilinx_smmu_csr_hwirq_mask(d->hwirq);
+
+	if (!mask)
+		return;
+
+	guard(raw_spinlock)(&csr->lock);
+	writel(mask, csr->base + SMMU_CSR_IER);
+}
+
+static void xilinx_smmu_csr_irq_eoi(struct irq_data *d)
+{
+	struct xilinx_smmu_csr *csr =3D irq_data_get_irq_chip_data(d);
+	u32 mask =3D xilinx_smmu_csr_hwirq_mask(d->hwirq);
+
+	if (!mask)
+		return;
+
+	guard(raw_spinlock)(&csr->lock);
+	writel(mask, csr->base + SMMU_CSR_ISR);
+}
+
+static struct irq_chip xilinx_smmu_csr_chip =3D {
+	.name		=3D "xlnx-smmu-csr",
+	.irq_mask	=3D xilinx_smmu_csr_irq_mask,
+	.irq_unmask	=3D xilinx_smmu_csr_irq_unmask,
+	.irq_eoi	=3D xilinx_smmu_csr_irq_eoi,
+	/* Defer sticky ISR clear until the threaded SMMU handler drains it. */
+	.flags		=3D IRQCHIP_EOI_THREADED,
+};
+
+static void xilinx_smmu_csr_irq_handler(struct irq_desc *desc)
+{
+	struct xilinx_smmu_csr *csr =3D irq_desc_get_handler_data(desc);
+	struct irq_chip *chip =3D irq_desc_get_chip(desc);
+	u32 status, mask, active, pending, spurious;
+
+	chained_irq_enter(chip, desc);
+
+	/*
+	 * SMMU_CSR_ISR latches raw, pre-mask status, so gate it with the mask
+	 * register to only act on sources that are actually enabled.
+	 */
+	status =3D readl(csr->base + SMMU_CSR_ISR);
+	mask =3D readl(csr->base + SMMU_CSR_MASK);
+	active =3D status & ~mask;
+
+	/*
+	 * Defend against any enabled source this driver does not demultiplex
+	 * (e.g. CMD_SYNC). It would never be acked and would livelock the
+	 * parent line, so mask and clear it here.
+	 */
+	spurious =3D active & ~SMMU_INTR_ALL;
+	if (spurious) {
+		writel(spurious, csr->base + SMMU_CSR_IDR);
+		writel(spurious, csr->base + SMMU_CSR_ISR);
+	}
+
+	pending =3D active & SMMU_INTR_ALL;
+
+	while (pending) {
+		irq_hw_number_t hwirq =3D __ffs(pending);
+
+		if (generic_handle_domain_irq(csr->domain, hwirq)) {
+			/*
+			 * No mapped consumer: mask and clear so an unexpected
+			 * source cannot spin the parent line.
+			 */
+			writel(BIT(hwirq), csr->base + SMMU_CSR_IDR);
+			writel(BIT(hwirq), csr->base + SMMU_CSR_ISR);
+		}
+
+		pending &=3D ~BIT(hwirq);
+	}
+
+	chained_irq_exit(chip, desc);
+}
+
+static int xilinx_smmu_csr_domain_map(struct irq_domain *d, unsigned int vir=
q,
+				      irq_hw_number_t hwirq)
+{
+	struct xilinx_smmu_csr *csr =3D d->host_data;
+
+	if (!xilinx_smmu_csr_hwirq_mask(hwirq))
+		return -EINVAL;
+
+	irq_set_chip_and_handler(virq, &xilinx_smmu_csr_chip, handle_fasteoi_irq);
+	irq_set_chip_data(virq, csr);
+	irq_set_status_flags(virq, IRQ_LEVEL);
+
+	return 0;
+}
+
+static const struct irq_domain_ops xilinx_smmu_csr_domain_ops =3D {
+	.map	=3D xilinx_smmu_csr_domain_map,
+	.xlate	=3D irq_domain_xlate_onecell,
+};
+
+static int __init xilinx_smmu_csr_init(struct device_node *node, struct devi=
ce_node *parent)
+{
+	struct xilinx_smmu_csr *csr;
+	int ret;
+
+	if (WARN_ON_ONCE(!parent))
+		return -EINVAL;
+
+	if (irq_find_matching_fwnode(of_fwnode_handle(node), DOMAIN_BUS_ANY))
+		return -ENODEV;
+
+	csr =3D kzalloc(sizeof(*csr), GFP_KERNEL);
+	if (!csr)
+		return -ENOMEM;
+
+	raw_spin_lock_init(&csr->lock);
+
+	csr->base =3D of_iomap(node, 0);
+	if (!csr->base) {
+		ret =3D -ENOMEM;
+		goto free;
+	}
+
+	/*
+	 * Start from a known state: mask and clear *every* source the block
+	 * implements, including CMD_SYNC (bit 1) which this driver does not
+	 * service. The CSR ORs (status & ~mask) onto a single parent line, so
+	 * a source left unmasked and latched by a prior boot stage (firmware,
+	 * kexec) would assert the line forever with no one to ack it. Masking
+	 * the whole set here makes that impossible; the ARM SMMUv3 driver
+	 * unmasks the sources it needs via the child irq_unmask() callbacks.
+	 */
+	writel(SMMU_INTR_HW_ALL, csr->base + SMMU_CSR_IDR);
+	writel(SMMU_INTR_HW_ALL, csr->base + SMMU_CSR_ISR);
+
+	csr->domain =3D irq_domain_create_linear(of_fwnode_handle(node), SMMU_CSR_I=
RQ_NR,
+					       &xilinx_smmu_csr_domain_ops, csr);
+	if (!csr->domain) {
+		pr_err("%pOF: failed to create irq domain\n", node);
+		ret =3D -ENOMEM;
+		goto unmap;
+	}
+
+	csr->parent_irq =3D irq_of_parse_and_map(node, 0);
+	if (!csr->parent_irq) {
+		pr_err("%pOF: failed to map parent irq\n", node);
+		ret =3D -EINVAL;
+		goto remove_domain;
+	}
+
+	irq_set_chained_handler_and_data(csr->parent_irq, xilinx_smmu_csr_irq_handl=
er, csr);
+
+	pr_debug("%pOF: Xilinx SMMU CSR interrupt controller registered\n", node);
+
+	return 0;
+
+remove_domain:
+	irq_domain_remove(csr->domain);
+unmap:
+	iounmap(csr->base);
+free:
+	kfree(csr);
+	return ret;
+}
+
+IRQCHIP_DECLARE(xilinx_smmu_csr, "xlnx,versal-net-smmu-csr", xilinx_smmu_csr=
_init);
