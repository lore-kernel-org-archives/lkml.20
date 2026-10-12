Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CDA4252AE
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831774; cv=none; b=Hy596zb1u3sko7jfmK0p4WZZLxQ1jwHfgEv+9TXFPWqM/AohXtNYR/4VwsNvVhcAN1o5HsW7mwsUqRTZKYtwiEukwL6a5wNnlGzM3ai2CX8ucpX7RHm1Nm438oiwRmYlcu9Yue4dv+RNOqCCbC9AZboXSFsM6FaVWy7jKp5Vvhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831774; c=relaxed/simple;
	bh=SziUQvDzD7ZQ/U///ztVCbNPZ+kIshJV+7jRMVgrdAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JBkE3zllv9RkT44iJ0vty8HFOAAagv+Zr6uvIILtWpDBALAw5TvhnRkSIt45udCCtD8Fr7XYgTP7FC5Al1foIf68BV+GgjEvik0hPnNRvclHSfn1unwolhrCGdYFShAMj+hyPJv6floGJ6nME5oKSierXpgE7uV8EvO23IrvxGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=lKs6T3rL; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="lKs6T3rL"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-917aca1aee5so30557416d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791831771; x=1792436571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oemHihsVJiMRnCtBvfBHVGRwo6ucLr4U3MKr2a3J/eo=;
        b=lKs6T3rL6FNa1Wezj5or7cro62QR2c250+YZZF6SJLH4JZiAKYBeuc2tmZ/EuDPX5E
         zfZ0iMa1ytI7JhdA6LarbQwDKwvKxotuDNHpL1nF99CetdCY75Rag2aWN1zMDOfywKcY
         4JRjJ6oOzojpxagITL3iKmJmKFwdTEQ9cm9376fDgUJefQWB31r/ZWdluaeYFgplbu2c
         6Cph025MbcdZZ/C/QsGU3PdzPeaSfJEjQLfX2n0y0TBCnm6sRdZeNxx7H8DaaZz2+48p
         UDmJs7KXe0jxQBTUt5GKqE5AHEX8ROufZMI/f+xFWJBPTx+/DcYsR7XAqMGBb+8YDEQL
         DafA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791831771; x=1792436571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oemHihsVJiMRnCtBvfBHVGRwo6ucLr4U3MKr2a3J/eo=;
        b=rRd/YvDArJOo5YSsL/oYlCcG5C9WGkT9XC9H5aiO4/qfYJaXXNO9InSyWdcKlsTVg2
         GYW85onXY/b5tNrTHNsUBCjC/RU/uswra7EhJfCjcrs1T1YbpnO5vES+hpHzM8RTfWik
         RjlYq+EFDVqRaDfRegoMMH3vkCfg9R+tkENkfICgKuvotYytACeO5xMywYSyG2Meptfx
         Gcyp3Ij9v5isguNJOtbE/XqC8SmPozgcok9XbMdzAfor+nsq5LDsZ8Hdg4RvHuJeq0xP
         fUGplJELh3mepSmUlYkRqSk/eiAe0fpIRYPiMpmtgxTkf2YIO8OBM52h4qBkiHjNDoxd
         qZ3w==
X-Forwarded-Encrypted: i=1; AKwUvByubw7kYJsfSspiksjwaqpoF0hktDy6+sWq5WFARTLPWfRZ0nPImZx4/eHIfOmbMmZAVffr0kwCuhabnMw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFG+K7s42EbSevXFY1QtUFGNIimw6VJRq8LkzD394mIxJQ1XcF
	6V3SkUgUnD1KYFbSJRdtlI8HURj1ppgjaJ09jdGENi1AgGYAtKI6hf6Jg6zbsTwISHA=
X-Gm-Gg: AYBFou3+ScVC9C0N5Nxm73WSyqKD6ACDa+cZr1r1okH4U0dvATgHDWGfXGo3eRWF+u4
	J08ja768hOYMKVckd+GuI8EnlgP9bz/Oo3ZiF7GXKEEeM1QYHU6Z2FvlySx0Mub15Gxapec4pUt
	/GiU+dvMVoUOEFzr/K8UVolOU6DZBzQgoVdJmy6J9ktlTUJ5R+R8B5bE8RKqTvgbedPLP9E/uBN
	HOZqkauM4oz+5u+Aow3b6tBM9sEEh01urvZaAPutkOOyM47NFXfypJ5aiNOaKEv4ECwFQDfDlx+
	4+XEy71OXlgEeUOcX/jCAko1JI36HfjsiFcfXYk8MeeaVB9LzBdw6tUoUd155n1B59JwgPOrU5S
	yTAlm9IaP2FjhfG3a+/+KdgI/otgQe0T9D+k+2u3ibcP0kv0B2H7K7IewX+k+xNCHaqaiG65oY/
	Utg1mj/BfJBFtmovTUoPHshqfuQ3koy2sBr3v91PANguFxJRhAdzIQD3r9ehMvdqWjm/tKMYirw
	hY=
X-Received: by 2002:ad4:5d6c:0:b0:915:e65d:3a99 with SMTP id 6a1803df08f44-91b5556ad36mr212172646d6.35.1791831770962;
        Mon, 12 Oct 2026 12:02:50 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97c4a7cesm4815216d6.48.2026.10.12.12.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 12:02:50 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: tglx@kernel.org,
	radu@rendec.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: Daniel Thompson <daniel@riscstar.com>,
	p.zabel@pengutronix.de,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	danielt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] irqchip: introduce TC9564 SoC MSIGEN support
Date: Mon, 12 Oct 2026 14:02:44 -0500
Message-ID: <20261012190245.3988619-3-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012190245.3988619-1-elder@riscstar.com>
References: <20261012190245.3988619-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Thompson <daniel@riscstar.com>

Define a new irqchip platform driver that represents the MSIGEN
functionality present in the TC9564 SoC.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Co-developed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 MAINTAINERS                         |   1 +
 drivers/irqchip/Kconfig             |  10 ++
 drivers/irqchip/Makefile            |   1 +
 drivers/irqchip/irq-tc9564-msigen.c | 203 ++++++++++++++++++++++++++++
 4 files changed, 215 insertions(+)
 create mode 100644 drivers/irqchip/irq-tc9564-msigen.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 9e73a912f0c0f..5b0ed7c1ab40a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28178,6 +28178,7 @@ M:	Alex Elder <elder@kernel.org>
 M:	Daniel Thompson <danielt@kernel.org>
 S:	Maintained
 F:	Documentation/devicetree/bindings/interrupt-controller/toshiba,tc9564-msigen.yaml
+F:	drivers/irqchip/irq-tc9564-msigen.c
 
 TOSHIBA TC9564 PCI DRIVER
 M:	Alex Elder <elder@kernel.org>
diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index a8f8c423b7957..205b5a167c805 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -842,4 +842,14 @@ config SUNPLUS_SP7021_INTC
 	  chained controller, routing all interrupt source in P-Chip to
 	  the primary controller on C-Chip.
 
+config TC9564_MSIGEN
+	tristate "Toshiba TC9564 MSI distributor"
+	depends on TC9564_PCI
+	depends on GENERIC_IRQ_CHIP
+	default TC9564_PCI
+	help
+	  This enables support for the "MSIGEN" MSI distributor embedded
+	  in the Toshiba TC9564.  This device receives wired interrupts
+	  within the TC9564 and raises them to the host using MSI.
+
 endmenu
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index ab33cccd84719..c82e00802c2b4 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -135,3 +135,4 @@ obj-$(CONFIG_APPLE_AIC)			+= irq-apple-aic.o
 obj-$(CONFIG_MCHP_EIC)			+= irq-mchp-eic.o
 obj-$(CONFIG_SOPHGO_SG2042_MSI)		+= irq-sg2042-msi.o
 obj-$(CONFIG_SUNPLUS_SP7021_INTC)	+= irq-sp7021-intc.o
+obj-$(CONFIG_TC9564_MSIGEN)		+= irq-tc9564-msigen.o
diff --git a/drivers/irqchip/irq-tc9564-msigen.c b/drivers/irqchip/irq-tc9564-msigen.c
new file mode 100644
index 0000000000000..a27edd5859e43
--- /dev/null
+++ b/drivers/irqchip/irq-tc9564-msigen.c
@@ -0,0 +1,203 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/clk.h>
+#include <linux/irqdomain.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+
+/**
+ * struct tc9564_msigen - Context for MSIGEN IRQ domain
+ * @ioaddr:	Pointer to mapped MSIGEN memory
+ * @irq:	IRQ number for MSIGEN
+ */
+struct tc9564_msigen {
+	void __iomem *ioaddr;
+	unsigned int irq;
+};
+
+#define HWIRQ_COUNT			25
+
+#define MSI_OUT_EN_OFFSET		0x0000
+#define MSI_MASK_CLR_OFFSET		0x000c
+#define MSI_MASK_VALUE			BIT(0)
+#define MSI_INT_STS_OFFSET		0x0010
+
+static void tc9564_msigen_irq_handler(struct irq_desc *desc)
+{
+	struct irq_domain *irq_domain = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	struct irq_chip_generic *gc;
+	unsigned long status;
+	unsigned long hwirq;
+
+	gc = irq_get_domain_generic_chip(irq_domain, 0);
+
+	chained_irq_enter(chip, desc);
+
+	status = irq_reg_readl(gc, MSI_INT_STS_OFFSET);
+	for_each_set_bit(hwirq, &status, HWIRQ_COUNT)
+		generic_handle_domain_irq(irq_domain, hwirq);
+
+	/*
+	 * Clear the MSI flag. Most interrupts within TC9564 are level-high
+	 * type. If any interrupts are still asserted then clearing this flag
+	 * will cause the (edge-triggered) MSI to be regenerated.
+	 */
+	irq_reg_writel(gc, MSI_MASK_VALUE, MSI_MASK_CLR_OFFSET);
+
+	chained_irq_exit(chip, desc);
+}
+
+static int tc9564_msigen_irq_chip_init(struct irq_chip_generic *gc)
+{
+	struct tc9564_msigen *msigen = gc->domain->host_data;
+
+	gc->reg_base = msigen->ioaddr;
+	gc->chip_types[0].regs.mask = MSI_OUT_EN_OFFSET;
+	gc->chip_types[0].chip.irq_mask = irq_gc_mask_clr_bit;
+	gc->chip_types[0].chip.irq_unmask = irq_gc_mask_set_bit;
+
+	/* Disable all interrupts */
+	irq_reg_writel(gc, 0, MSI_OUT_EN_OFFSET);
+
+	return 0;
+}
+
+static void tc9564_msigen_irq_chip_exit(struct irq_chip_generic *gc)
+{
+	irq_reg_writel(gc, 0, MSI_OUT_EN_OFFSET);
+}
+
+static int tc9564_msigen_irq_domain_init(struct irq_domain *irq_domain)
+{
+	struct tc9564_msigen *msigen = irq_domain->host_data;
+
+	irq_set_chained_handler_and_data(msigen->irq, tc9564_msigen_irq_handler,
+					 irq_domain);
+	return 0;
+}
+
+static void tc9564_msigen_irq_domain_exit(struct irq_domain *irq_domain)
+{
+	struct tc9564_msigen *msigen = irq_domain->host_data;
+
+	irq_set_chained_handler_and_data(msigen->irq, NULL, NULL);
+}
+
+/* Find the PCI device we're associated with (not necessarily the parent) */
+static struct pci_dev *tc9564_msigen_find_pci_dev(struct device *dev)
+{
+	struct device *ancestor;
+
+	for (ancestor = dev->parent; ancestor; ancestor = ancestor->parent) {
+		if (dev_is_pci(ancestor)) {
+			/* We currently only support physical functions */
+			if (!dev_is_pf(ancestor))
+				return ERR_PTR(-EINVAL);
+
+			return to_pci_dev(ancestor);
+		}
+	}
+
+	return ERR_PTR(-ENXIO);
+}
+
+static void tc9564_msigen_free_irq_vectors(void *pci_dev)
+{
+	pci_free_irq_vectors(pci_dev);
+}
+
+static int tc9564_msigen_probe(struct platform_device *pdev)
+{
+	struct irq_domain_chip_generic_info dgc_info;
+	struct device *dev = &pdev->dev;
+	struct irq_domain *irq_domain;
+	struct tc9564_msigen *msigen;
+	struct irq_domain_info info;
+	struct reset_control *reset;
+	struct pci_dev *pci_dev;
+	struct clk *clk;
+	int ret;
+
+	pci_dev = tc9564_msigen_find_pci_dev(dev);
+	if (IS_ERR(pci_dev))
+		return dev_err_probe(dev, PTR_ERR(pci_dev),
+				     "failed to find PCI device\n");
+
+	msigen = devm_kzalloc(dev, sizeof(*msigen), GFP_KERNEL);
+	if (!msigen)
+		return -ENOMEM;
+
+	msigen->ioaddr = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(msigen->ioaddr))
+		return dev_err_probe(dev, PTR_ERR(msigen->ioaddr),
+				     "failed to map registers\n");
+
+	clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "failed to get/enable clock\n");
+
+	reset = devm_reset_control_get_shared_deasserted(dev, NULL);
+	if (IS_ERR(reset))
+		return dev_err_probe(dev, PTR_ERR(reset),
+				     "failed to get/deassert reset\n");
+
+	ret = pci_alloc_irq_vectors(pci_dev, 1, 1, PCI_IRQ_MSI);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to alloc irq vector\n");
+
+	ret = devm_add_action_or_reset(dev, tc9564_msigen_free_irq_vectors,
+				       pci_dev);
+	if (ret)
+		return ret;
+
+	msigen->irq = pci_irq_vector(pci_dev, 0);
+
+	dgc_info.name = "tc9564-msigen";
+	dgc_info.handler = handle_level_irq;
+	dgc_info.irqs_per_chip = HWIRQ_COUNT;
+	dgc_info.num_ct = 1;
+	dgc_info.init = tc9564_msigen_irq_chip_init;
+	dgc_info.exit = tc9564_msigen_irq_chip_exit;
+
+	info.fwnode = of_fwnode_handle(dev->of_node);
+	info.domain_flags = IRQ_DOMAIN_FLAG_DESTROY_GC;
+	info.size = HWIRQ_COUNT;
+	info.hwirq_max = HWIRQ_COUNT;
+	info.ops = &irq_generic_chip_ops;
+	info.host_data = msigen;
+	info.dgc_info = &dgc_info;
+	info.init = tc9564_msigen_irq_domain_init;
+	info.exit = tc9564_msigen_irq_domain_exit;
+
+	irq_domain = devm_irq_domain_instantiate(dev, &info);
+	if (IS_ERR(irq_domain))
+		return dev_err_probe(dev, PTR_ERR(irq_domain),
+				     "failed to instantiate IRQ domain\n");
+
+	return 0;
+}
+
+static const struct of_device_id tc9564_msigen_of_match[] = {
+	{ .compatible = "toshiba,tc9564-msigen" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, tc9564_msigen_of_match);
+
+static struct platform_driver tc9564_msigen_driver = {
+	.probe = tc9564_msigen_probe,
+	.driver = {
+		.name		= KBUILD_MODNAME,
+		.of_match_table	= tc9564_msigen_of_match,
+	},
+};
+module_platform_driver(tc9564_msigen_driver);
+
+MODULE_AUTHOR("Daniel Thompson <danielt@kernel.org>");
+MODULE_DESCRIPTION("TC9564 MSIGEN IRQ Controller Driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0

