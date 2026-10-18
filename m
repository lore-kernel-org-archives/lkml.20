Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8729F39E6F8;
	Sun, 18 Oct 2026 16:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792339689; cv=none; b=d0LFK2IZZgayAmQR2pzUV9W6rNIcA8uBiqoEx008TcXD6ukiuxGrDe1ukscasTtso6cYea88RdPAKT4j6E7kxCLLwuM+ILu2K84naGpyv9sQqZV8wqcDajDljSjm5nq8MCbijRuk/IZum6+M1GPG4TiMfGCHtougYfWABTS7TPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792339689; c=relaxed/simple;
	bh=Wsr6bXNmZRkZP+EAo65pdu+n2DgWCx8LmeI+fM+gN9s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SBSqQmIYPRYormiI7ZiWcM8g6tUqNzQ2dpPb3R6w7ciKDksY4zPVcWgmcFnWiTD98+aT0+aBovseTzEwQzj3/mzar6rV6+N2cjjNwZtNTPmDam88FXxvabEf8DzQCFEnOEaxqustQ++RYlm03XBCRCeufwIDZF3ZiuyZ+izzGZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=pQ3cZvF4; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="pQ3cZvF4"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 69IG6rssE1115124, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1792339614; bh=FsRmFlz9ZRObrfMNJVu6TCNHRLgfKJUWa3/EYFyN+Ws=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=pQ3cZvF4IKJo93T2LNQRcnNtQEw/NI4AUYABx1JpFaqGyzyKJjCXmJkyDulEwS7Ed
	 yyLA6WWGxF40a1X5dfUPS4w+X1DNRO+pKxcK7hnqOHW5VkyQQDheFgMsR/4CalF4YW
	 fBzHLN2mlX1DCleZBfP9mLBzy3VvRLR0ChG0NGeXpvA9QcOA73zSBqql1ZsW6tuttq
	 7ENYoDP4yJdH4gth1jdRFxttTvys7TD64sSCl+NQ2sQLK+SOUr235yYRd0Tu9gXer2
	 9C04gwz9Prr7uRh/JiHU5f6HPbywu5D3JZOZda7i1vGMaZM6ZEqOeEbwhP9Bk5vQ4v
	 JnyxfnjXUVsPA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 69IG6rssE1115124
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Oct 2026 00:06:53 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 00:06:54 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 19 Oct 2026 00:06:54 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <tglx@kernel.org>, <radu@rendec.net>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <lee@kernel.org>,
	<afaerber@suse.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<mfd@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v5 4/8] irqchip/realtek-intc-common: Add basic support for Realtek DHC SoCs
Date: Mon, 19 Oct 2026 00:06:49 +0800
Message-ID: <20261018160653.3940371-5-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261018160653.3940371-1-eleanor.lin@realtek.com>
References: <20261018160653.3940371-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: James Tai <james.tai@realtek.com>

Realtek DHC (Digital Home Center) SoCs share a common interrupt controller
design. Introduce a universal interrupt controller driver to provide
support for various variants within the Realtek DHC SoC family.

The common code introduces 'struct realtek_intc_desc' to describe one or
more sets of interrupt status and enable registers and allow the common
code to support both single- and multi-bank interrupt controllers.

There is a unique hardware routing quirk:
Some peripherals have their interrupt lines routed directly to the GIC but
still share the same status register within this IRQ MUX. To prevent the
MUX handler from clearing and stealing these interrupts from the direct
GIC handler, the driver employs a mask mapping array
('isr_to_scpu_int_en_mask').

In addition, to handle Wire-OR shared interrupts, this driver introduces a
'shared_irq_mask' in 'struct realtek_intc_desc'. It allows the driver to
dynamically register shared lines using devm_request_irq() with
'IRQF_SHARED | IRQF_NO_THREAD'.

Signed-off-by: James Tai <james.tai@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 MAINTAINERS                               |   1 +
 drivers/irqchip/Kconfig                   |   5 +
 drivers/irqchip/Makefile                  |   1 +
 drivers/irqchip/irq-realtek-intc-common.c | 353 ++++++++++++++++++++++
 drivers/irqchip/irq-realtek-intc-common.h |  93 ++++++
 5 files changed, 453 insertions(+)
 create mode 100644 drivers/irqchip/irq-realtek-intc-common.c
 create mode 100644 drivers/irqchip/irq-realtek-intc-common.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 782389bd5cd3..aae6d91fe39e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3485,6 +3485,7 @@ F:	Documentation/devicetree/bindings/arm/realtek.yaml
 F:	arch/arm/boot/dts/realtek/
 F:	arch/arm/mach-realtek/
 F:	arch/arm64/boot/dts/realtek/
+F:	drivers/irqchip/irq-realtek-intc-common.*
 F:	drivers/pinctrl/realtek/
 
 ARM/RISC-V/RENESAS ARCHITECTURE
diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 20b77fbc51ee..cddbf9915510 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -282,6 +282,11 @@ config RDA_INTC
 	bool
 	select IRQ_DOMAIN
 
+config REALTEK_DHC_INTC
+	tristate
+	select IRQ_DOMAIN
+	select MFD_SYSCON
+
 config RENESAS_INTC_IRQPIN
 	bool "Renesas INTC External IRQ Pin Support" if COMPILE_TEST
 	select IRQ_DOMAIN
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index ab33cccd8471..bc8f5c534a4a 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -48,6 +48,7 @@ obj-$(CONFIG_IRQ_MIPS_CPU)		+= irq-mips-cpu.o
 obj-$(CONFIG_IXP4XX_IRQ)		+= irq-ixp4xx.o
 obj-$(CONFIG_JCORE_AIC)			+= irq-jcore-aic.o
 obj-$(CONFIG_RDA_INTC)			+= irq-rda-intc.o
+obj-$(CONFIG_REALTEK_DHC_INTC)		+= irq-realtek-intc-common.o
 obj-$(CONFIG_RENESAS_INTC_IRQPIN)	+= irq-renesas-intc-irqpin.o
 obj-$(CONFIG_RENESAS_IRQC)		+= irq-renesas-irqc.o
 obj-$(CONFIG_RENESAS_RZA1_IRQC)		+= irq-renesas-rza1.o
diff --git a/drivers/irqchip/irq-realtek-intc-common.c b/drivers/irqchip/irq-realtek-intc-common.c
new file mode 100644
index 000000000000..cc08535217bd
--- /dev/null
+++ b/drivers/irqchip/irq-realtek-intc-common.c
@@ -0,0 +1,353 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Realtek DHC SoCs interrupt controller driver
+ *
+ * Copyright (c) 2023-2026 Realtek Semiconductor Corporation
+ */
+
+#include <linux/interrupt.h>
+#include <linux/irqdomain.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+
+#include "irq-realtek-intc-common.h"
+
+static bool realtek_intc_dispatch(struct realtek_intc_subset_data *subset_data)
+{
+	const struct realtek_intc_info *bank_info = subset_data->bank_info;
+	struct realtek_intc_data *data = subset_data->common;
+	u32 ints, inte, mask, val;
+	irq_hw_number_t hwirq;
+	bool handled = false;
+	int irq;
+
+	if (regmap_read(data->base, bank_info->isr_offset, &val))
+		return false;
+
+	ints = val & subset_data->subset_mask->ints_mask;
+
+	if (!ints)
+		return false;
+
+	if (regmap_read(data->base, bank_info->scpu_int_en_offset, &inte))
+		return false;
+
+	while (ints) {
+		irq = __ffs(ints);
+		ints &= ~BIT(irq);
+
+		mask = bank_info->isr_to_scpu_int_en_mask[irq];
+		if (mask != IRQ_ALWAYS_ENABLED && !(inte & mask))
+			continue;
+
+		hwirq = (subset_data->bank_idx * 32) + irq;
+
+		if (!generic_handle_domain_irq(data->domain, hwirq))
+			handled = true;
+
+		regmap_write(data->base, bank_info->isr_offset, BIT(irq) & CLEAN_INTC_STATUS);
+	}
+
+	return handled;
+}
+
+static void realtek_intc_handler(struct irq_desc *desc)
+{
+	struct realtek_intc_subset_data *subset_data = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+
+	chained_irq_enter(chip, desc);
+
+	realtek_intc_dispatch(subset_data);
+
+	chained_irq_exit(chip, desc);
+}
+
+static irqreturn_t realtek_intc_shared_handler(int irq, void *dev_id)
+{
+	struct realtek_intc_subset_data *subset_data = dev_id;
+
+	if (realtek_intc_dispatch(subset_data))
+		return IRQ_HANDLED;
+
+	return IRQ_NONE;
+}
+
+static void realtek_intc_mask_irq(struct irq_data *data)
+{
+	struct realtek_intc_data *intc_data = irq_data_get_irq_chip_data(data);
+	const struct realtek_intc_desc *desc = intc_data->desc;
+	const struct realtek_intc_info *bank_info;
+	int bank_idx, bit_idx;
+	u32 mask;
+
+	bank_idx = data->hwirq / 32;
+	bit_idx  = data->hwirq % 32;
+
+	bank_info = &desc->banks[bank_idx];
+
+	mask = bank_info->isr_to_scpu_int_en_mask[bit_idx];
+	if (!mask || mask == IRQ_ALWAYS_ENABLED)
+		return;
+
+	regmap_assign_bits(intc_data->base, bank_info->scpu_int_en_offset, mask, false);
+}
+
+static void realtek_intc_unmask_irq(struct irq_data *data)
+{
+	struct realtek_intc_data *intc_data = irq_data_get_irq_chip_data(data);
+	const struct realtek_intc_desc *desc = intc_data->desc;
+	const struct realtek_intc_info *bank_info;
+	int bank_idx, bit_idx;
+	u32 mask;
+
+	bank_idx = data->hwirq / 32;
+	bit_idx  = data->hwirq % 32;
+
+	bank_info = &desc->banks[bank_idx];
+	mask = bank_info->isr_to_scpu_int_en_mask[bit_idx];
+	if (!mask || mask == IRQ_ALWAYS_ENABLED)
+		return;
+
+	regmap_set_bits(intc_data->base, bank_info->scpu_int_en_offset, mask);
+}
+
+static const struct irq_chip realtek_intc_chip = {
+	.name	     = "realtek-intc",
+	.irq_mask    = realtek_intc_mask_irq,
+	.irq_unmask  = realtek_intc_unmask_irq,
+};
+
+static int realtek_intc_domain_map(struct irq_domain *d, unsigned int irq, irq_hw_number_t hw)
+{
+	struct realtek_intc_data *data = d->host_data;
+
+	irq_set_chip_and_handler(irq, &realtek_intc_chip, handle_level_irq);
+	irq_set_chip_data(irq, data);
+
+	return 0;
+}
+
+static int realtek_intc_xlate(struct irq_domain *d, struct device_node *ctrlr,
+			      const u32 *intspec, unsigned int intsize,
+			      unsigned long *out_hwirq, unsigned int *out_type)
+{
+	if (intsize < 1) {
+		return -EINVAL;
+	} else if (intsize < 2) {
+		*out_hwirq = intspec[0];
+	} else {
+		if (intspec[1] >= 32)
+			return -EINVAL;
+
+		*out_hwirq = (intspec[0] * 32) + intspec[1];
+	}
+
+	*out_type = IRQ_TYPE_NONE;
+
+	return 0;
+}
+
+static const struct irq_domain_ops realtek_intc_domain_ops = {
+	.xlate = realtek_intc_xlate,
+	.map   = realtek_intc_domain_map,
+};
+
+static int realtek_intc_subset(struct platform_device *dev, struct realtek_intc_data *data,
+			       unsigned int bank_idx, unsigned int subset_idx,
+			       unsigned int parent_irq_idx)
+{
+	struct realtek_intc_subset_data *subset_data = &data->subset_data[parent_irq_idx];
+	const struct realtek_intc_info *bank_info = &data->desc->banks[bank_idx];
+	const struct realtek_intc_mask *mask = &bank_info->subset_mask[subset_idx];
+	int irq, ret;
+	bool is_shared;
+
+	irq = platform_get_irq(dev, parent_irq_idx);
+	if (irq < 0)
+		return irq;
+
+	subset_data->common = data;
+	subset_data->subset_mask = mask;
+	subset_data->bank_info = bank_info;
+	subset_data->bank_idx = bank_idx;
+	subset_data->parent_irq = irq;
+
+	is_shared = !!(data->desc->shared_irq_mask & BIT(parent_irq_idx));
+
+	if (is_shared) {
+		ret = devm_request_irq(&dev->dev, irq, realtek_intc_shared_handler,
+				       IRQF_SHARED | IRQF_NO_THREAD, dev_name(&dev->dev),
+				       subset_data);
+		if (ret)
+			dev_err(&dev->dev, "failed to request shared irq %d\n", irq);
+
+		return ret;
+	}
+
+	irq_set_chained_handler_and_data(irq, realtek_intc_handler, subset_data);
+
+	return 0;
+}
+
+int realtek_intc_suspend(struct device *dev)
+{
+	struct realtek_intc_data *data = dev_get_drvdata(dev);
+	const struct realtek_intc_desc *desc = data->desc;
+	unsigned int i = 0;
+	int ret;
+
+	for (; i < desc->bank_num; i++) {
+		const struct realtek_intc_info *info = &desc->banks[i];
+
+		ret = regmap_read(data->base, info->scpu_int_en_offset, &data->saved_en[i]);
+		if (ret)
+			goto err;
+
+		ret = regmap_write(data->base, info->scpu_int_en_offset, DISABLE_INTC);
+		if (ret)
+			goto err;
+
+		ret = regmap_write(data->base, info->isr_offset, CLEAN_INTC_STATUS);
+		if (ret)
+			goto err;
+	}
+
+	return 0;
+
+err:
+	dev_err(dev, "Failed to suspend bank %u (ret = %d)\n", i, ret);
+
+	while (i--) {
+		const struct realtek_intc_info *info = &desc->banks[i];
+
+		regmap_write(data->base, info->scpu_int_en_offset, data->saved_en[i]);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(realtek_intc_suspend);
+
+int realtek_intc_resume(struct device *dev)
+{
+	struct realtek_intc_data *data = dev_get_drvdata(dev);
+	const struct realtek_intc_desc *desc = data->desc;
+	unsigned int i = 0;
+	int ret;
+
+	for (; i < desc->bank_num; i++) {
+		const struct realtek_intc_info *info = &desc->banks[i];
+
+		ret = regmap_write(data->base, info->isr_offset, CLEAN_INTC_STATUS);
+		if (ret)
+			goto err;
+
+		ret = regmap_write(data->base, info->scpu_int_en_offset, data->saved_en[i]);
+		if (ret)
+			goto err;
+	}
+
+	return 0;
+
+err:
+	dev_err(dev, "Failed to resume bank %u (ret = %d)\n", i, ret);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(realtek_intc_resume);
+
+static void realtek_intc_teardown_irqs(struct realtek_intc_data *data,
+				       struct device *dev,
+				       unsigned int count)
+{
+	for (unsigned int i = 0; i < count; i++) {
+		if (data->desc->shared_irq_mask & BIT(i)) {
+			devm_free_irq(dev, data->subset_data[i].parent_irq,
+				      &data->subset_data[i]);
+		} else {
+			irq_set_chained_handler_and_data(data->subset_data[i].parent_irq,
+							 NULL, NULL);
+		}
+	}
+}
+
+int realtek_intc_probe(struct platform_device *pdev, const struct realtek_intc_desc *desc)
+{
+	struct realtek_intc_data *data;
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->of_node;
+	unsigned int total_subset_num = 0;
+	int ret, parent_irq = 0;
+
+	for (unsigned int i = 0; i < desc->bank_num; i++)
+		total_subset_num += desc->banks[i].subset_num;
+
+	data = devm_kzalloc(dev, struct_size(data, subset_data, total_subset_num),
+			    GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->saved_en = devm_kcalloc(dev, desc->bank_num, sizeof(*data->saved_en), GFP_KERNEL);
+	if (!data->saved_en)
+		return -ENOMEM;
+
+	data->base = syscon_node_to_regmap(node->parent);
+	if (IS_ERR(data->base))
+		return PTR_ERR(data->base);
+
+	data->desc = desc;
+
+	data->domain = irq_domain_create_linear(of_fwnode_handle(node),
+						32 * desc->bank_num,
+						&realtek_intc_domain_ops, data);
+	if (!data->domain)
+		return -ENOMEM;
+
+	for (unsigned int i = 0; i < desc->bank_num; i++) {
+		const struct realtek_intc_info *info = &desc->banks[i];
+
+		for (unsigned int j = 0; j < info->subset_num; j++) {
+			ret = realtek_intc_subset(pdev, data, i, j, parent_irq);
+			if (ret < 0) {
+				dev_err(dev, "failed to init bank %u subset %u: %d\n",
+					i, j, ret);
+				goto irq_domain_cleanup;
+			}
+
+			parent_irq++;
+		}
+	}
+
+	platform_set_drvdata(pdev, data);
+
+	return 0;
+
+irq_domain_cleanup:
+	realtek_intc_teardown_irqs(data, dev, parent_irq);
+	irq_domain_remove(data->domain);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(realtek_intc_probe);
+
+void realtek_intc_remove(struct platform_device *pdev)
+{
+	struct realtek_intc_data *data = platform_get_drvdata(pdev);
+	const struct realtek_intc_desc *desc = data->desc;
+	struct device *dev = &pdev->dev;
+	unsigned int count = 0;
+
+	for (unsigned int i = 0; i < desc->bank_num; i++)
+		count += desc->banks[i].subset_num;
+
+	realtek_intc_teardown_irqs(data, dev, count);
+	irq_domain_remove(data->domain);
+}
+EXPORT_SYMBOL_GPL(realtek_intc_remove);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Realtek DHC SoC Interrupt Controller Driver");
diff --git a/drivers/irqchip/irq-realtek-intc-common.h b/drivers/irqchip/irq-realtek-intc-common.h
new file mode 100644
index 000000000000..8ea34416d036
--- /dev/null
+++ b/drivers/irqchip/irq-realtek-intc-common.h
@@ -0,0 +1,93 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2023-2026 Realtek Semiconductor Corporation
+ */
+
+#ifndef _IRQ_REALTEK_INTC_COMMON_H
+#define _IRQ_REALTEK_INTC_COMMON_H
+
+#include <linux/bits.h>
+#include <linux/limits.h>
+#include <linux/types.h>
+
+/**
+ * struct realtek_intc_mask - The mask of an interrupt subset.
+ * @ints_mask: The interrupt mask.
+ */
+struct realtek_intc_mask {
+	u32	ints_mask;
+};
+
+/**
+ * struct realtek_intc_info - Configuration information for a single interrupt bank.
+ * @subset_mask:		The masks of the interrupt subsets.
+ * @subset_num:			The number of interrupt subsets.
+ * @isr_offset:			The offset of the interrupt status register.
+ * @scpu_int_en_offset:		The offset of the interrupt enable register.
+ * @isr_to_scpu_int_en_mask:	The array mapping ISR bit indices to the SCPU interrupt
+ *				enable masks. Use IRQ_ALWAYS_ENABLED for interrupt
+ *				that do not require an enable check.
+ */
+struct realtek_intc_info {
+	const struct realtek_intc_mask	*subset_mask;
+	int				subset_num;
+	unsigned int			isr_offset;
+	unsigned int			scpu_int_en_offset;
+	const u32			*isr_to_scpu_int_en_mask;
+};
+
+/**
+ * struct realtek_intc_subset_data - The data of interrupt subset.
+ * @parent_irq:		The upstream interrupt source number.
+ * @bank_idx:		The index of the interrupt bank this subset belongs to.
+ * @bank_info:		The configuration information of the specific interrupt bank.
+ * @subset_mask:	The subset interrupt masks.
+ * @common:		The configuration data of the main interrupt controller.
+ */
+struct realtek_intc_subset_data {
+	int				parent_irq;
+	unsigned int			bank_idx;
+	const struct realtek_intc_info *bank_info;
+	const struct realtek_intc_mask	*subset_mask;
+	struct realtek_intc_data	*common;
+};
+
+/**
+ * struct realtek_intc_desc - Hardware description.
+ * @banks:		Array of interrupt bank configurations.
+ * @bank_num:		The number of interrupt banks.
+ * @shared_irq_mask:	Bitmask indicating which parent interrupts are shared.
+ *			(e.g., BIT(0) means parent IRQ index 0 is shared)
+ */
+struct realtek_intc_desc {
+	const struct realtek_intc_info	*banks;
+	unsigned int			bank_num;
+	u32				shared_irq_mask;
+};
+
+/**
+ * struct realtek_intc_data - The configuration data for interrupt controller driver.
+ * @base:		Regmap for the interrupt registers.
+ * @desc:		The hardware description of this interrupt controller instance.
+ * @domain:		Interrupt domain of the interrupt controller.
+ * @saved_en:		Array storing the state of the interrupt enable registers for each bank.
+ * @subset_data:	The data for the interrupt subset.
+ */
+struct realtek_intc_data {
+	struct regmap				*base;
+	const struct realtek_intc_desc		*desc;
+	struct irq_domain			*domain;
+	unsigned int				*saved_en;
+	struct realtek_intc_subset_data		subset_data[];
+};
+
+#define IRQ_ALWAYS_ENABLED	U32_MAX
+#define DISABLE_INTC		0
+#define CLEAN_INTC_STATUS	GENMASK(31, 1)
+
+int realtek_intc_probe(struct platform_device *pdev, const struct realtek_intc_desc *desc);
+void realtek_intc_remove(struct platform_device *pdev);
+int realtek_intc_suspend(struct device *dev);
+int realtek_intc_resume(struct device *dev);
+
+#endif /* _IRQ_REALTEK_INTC_COMMON_H */
-- 
2.43.0

