Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B80481FB7;
	Tue, 13 Oct 2026 10:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888336; cv=none; b=AR3tt8WktJNVKLkjpveGtl0M0a32Dy2AnpDWEcnwIEdK0KHrr5tT0511XK+aK1KrO1FhWT3UXptFXz1BS4wByFhkQMx6/dolKyUhXTw1kuWfhff0ziZuQEPdf1KkSTng+i9/+PJGrQaII1U44uISEevenN89A3GArv0O7J5t5go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888336; c=relaxed/simple;
	bh=wZ8hPGylYKUtyWFg69Xv28IQVhIKVEDkho8Am7bz5vk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AECUtXUV/xYrKRKSc1u+nZe7A0+m44azR0ThIkaYKFguo5mvK/nnxZ+a+Uz4gB1koFlsizDxheput7C2TViuz1CXsDeVmig5w+nruu4hTiuxFeD5lDi188DbWL4pw5U4JnFQbawDzoFF/jJDL36daIizVRkwAGNhUHhJGvUINSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=x70Yb9Lp; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="x70Yb9Lp"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 36E324E4120A;
	Tue, 13 Oct 2026 10:45:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0353860362;
	Tue, 13 Oct 2026 10:45:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6135311D70DAE;
	Tue, 13 Oct 2026 12:45:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791888331; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9h77yPVnnGRtwKUj7UeWyGGq2bQ7qoHDbmTmeY23XPA=;
	b=x70Yb9Lpe5IpNOWrGalRidnYDeAtk02PlFr2sfOFaXQJVtyr9thwMleQjApnOWQ2yKl1IL
	46txY/aJWjas6v6/3x/oT9OIFi59w4iiaoXlVaT9DHEByrtOQcGDjXpjcV2Z2TX7qONHId
	OkFwrQDvLK/lNWKn1fnx5GosONq5yLv+vIxTIXNpCVTvGD5FMx8cs6olF+IMfS9SQAlv7C
	7Cqo2plb2nRlpvFshZYqK76F/wPHCLDm23sU85MWNv2sWVmrPZz5eQI9MBHJkwCWi2yJEa
	uQpKm86RhUaWPMAIbIf5VD/GnIuKvqW1AaAhZLBJh4GkyZSYksg39HcKwLKI8A==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Tue, 13 Oct 2026 12:44:59 +0200
Subject: [PATCH v6 2/3] EDAC/cadence: Add Cadence DDR EDAC driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-paul-v7-3-rc1-edac-v6-2-2f1d6f2f74db@bootlin.com>
References: <20261013-paul-v7-3-rc1-edac-v6-0-2f1d6f2f74db@bootlin.com>
In-Reply-To: <20261013-paul-v7-3-rc1-edac-v6-0-2f1d6f2f74db@bootlin.com>
To: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-edac@vger.kernel.org, devicetree@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 "Paul Louvel (Schneider Electric)" <paul.louvel@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791888321; l=13102;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=wZ8hPGylYKUtyWFg69Xv28IQVhIKVEDkho8Am7bz5vk=;
 b=BRYRtHuPfpAvA6MCJYklWjcoXF0c4lUGbwYQDMxdpMCsWpkEa6JbzFHk5mUnCNr0qGRixSnbE
 ct19zQuC+EXBetwREJddmsY/qJAA4e0T4dMT0PfpmYP/kiZIqslj4cN
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

Add the Cadence EDAC driver found on Renesas RZ/N1x SoC.
The memory controller supports ECC, software scrubbing, and SECDED.

Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>
---
 MAINTAINERS                 |   1 +
 drivers/edac/Kconfig        |  10 ++
 drivers/edac/Makefile       |   1 +
 drivers/edac/cadence_edac.c | 377 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 389 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 60db3734df5b..0c7ab1d22172 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5765,6 +5765,7 @@ M:	Paul Louvel <paul.louvel@bootlin.com>
 L:	linux-edac@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/edac/cdns,ddr-edac.yaml
+F:	drivers/edac/cadence_edac.c
 
 CADENCE MIPI-CSI2 BRIDGES
 M:	Maxime Ripard <mripard@kernel.org>
diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index a44b85c440ca..1707fe76b53c 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -503,6 +503,16 @@ config EDAC_QCOM
 	  For debugging issues having to do with stability and overall system
 	  health, you should probably say 'Y' here.
 
+config EDAC_CADENCE
+	tristate "Cadence EDAC Controller"
+	depends on HAS_IOMEM && OF
+	depends on ARCH_RZN1 || COMPILE_TEST
+	help
+	  Support for error detection and correction on RZN1x SoCs. ECC must be
+	  configured by the bootloader.
+	  The controller supports single bit error correction, double bit error
+	  detection.
+
 config EDAC_ASPEED
 	tristate "Aspeed AST BMC SoC"
 	depends on ARCH_ASPEED
diff --git a/drivers/edac/Makefile b/drivers/edac/Makefile
index a37534300ab9..04ab4d038406 100644
--- a/drivers/edac/Makefile
+++ b/drivers/edac/Makefile
@@ -91,3 +91,4 @@ obj-$(CONFIG_EDAC_VERSAL)		+= versal_edac.o
 obj-$(CONFIG_EDAC_LOONGSON)		+= loongson_edac.o
 obj-$(CONFIG_EDAC_VERSALNET)		+= versalnet_edac.o
 obj-$(CONFIG_EDAC_CORTEX_A72)		+= a72_edac.o
+obj-$(CONFIG_EDAC_CADENCE)		+= cadence_edac.o
diff --git a/drivers/edac/cadence_edac.c b/drivers/edac/cadence_edac.c
new file mode 100644
index 000000000000..1c0e3bcbec9f
--- /dev/null
+++ b/drivers/edac/cadence_edac.c
@@ -0,0 +1,377 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2015 Renesas Electronics Europe Ltd.
+ * Copyright 2026 Bootlin
+ *
+ * Based on highbank EDAC driver:
+ *
+ * Copyright 2011-2012 Calxeda, Inc.
+ */
+
+#include <linux/array_size.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/edac.h>
+#include <linux/interrupt.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+#include <linux/string.h>
+
+#include "edac_mc.h"
+#include "edac_module.h"
+
+#define DRV_NAME				"cadence_edac"
+
+#define REG_BYTE_SZ				4
+#define DDR_CTL(n)				((n) * REG_BYTE_SZ)
+
+#define CDNS_DDR_STAT				DDR_CTL(0)
+#define CDNS_DDR_STAT_DRAM_CLASS		GENMASK_U32(11, 8)
+#define CDNS_DDR_STAT_DRAM_DDR2			BIT(2)
+#define CDNS_DDR_STAT_GET_DRAM_CLASS(reg)	FIELD_GET(CDNS_DDR_STAT_DRAM_CLASS, reg)
+
+#define CDNS_ECC_STAT				DDR_CTL(36)
+#define CDNS_ECC_STAT_ENABLED			BIT(16)
+#define CDNS_ECC_STAT_IS_ENABLED(reg)		FIELD_GET(CDNS_ECC_STAT_ENABLED, reg)
+#define CDNS_ECC_STAT_FWC			BIT(24)
+
+#define CDNS_ECC_XOR				DDR_CTL(37)
+#define CDNS_ECC_XOR_CHECK_BITS			GENMASK_U32(13, 0)
+
+#define CDNS_BUS_CTRL				DDR_CTL(54)
+#define CDNS_BUS_CTRL_REDUC			BIT(1)
+
+/* DDR Controller Error Registers */
+
+#define CDNS_ECC_U_ERR_ADDR			DDR_CTL(38)
+#define CDNS_ECC_U_ERR_STAT			DDR_CTL(39)
+
+#define CDNS_ECC_C_ERR_ADDR			DDR_CTL(41)
+#define CDNS_ECC_C_ERR_STAT			DDR_CTL(42)
+
+#define CDNS_ECC_ERR_STAT_GET_SYNDROME(reg)	FIELD_GET(GENMASK(6, 0), reg)
+
+#define CDNS_PORT_CMD_ERR_ADDR			DDR_CTL(61)
+#define CDNS_PORT_CMD_ERR_TYPE			DDR_CTL(62)
+#define CDNS_PORT_CMD_ERR_TYPE_GET(reg)		FIELD_GET(GENMASK_U32(10, 8), reg)
+
+/* DDR Controller Interrupt Registers */
+
+#define CDNS_ECC_INT_STAT			DDR_CTL(56)
+#define CDNS_ECC_INT_STAT_CE			BIT(3)
+#define CDNS_ECC_INT_STAT_MULTIPLE_CE		BIT(4)
+#define CDNS_ECC_INT_STAT_UE			BIT(5)
+#define CDNS_ECC_INT_STAT_MULTIPLE_UE		BIT(6)
+#define CDNS_ECC_INT_EDAC			(CDNS_ECC_INT_STAT_CE | \
+						 CDNS_ECC_INT_STAT_MULTIPLE_CE | \
+						 CDNS_ECC_INT_STAT_UE | \
+						 CDNS_ECC_INT_STAT_MULTIPLE_UE)
+
+#define CDNS_ECC_INT_ACK			DDR_CTL(57)
+#define CDNS_ECC_INT_ACK_MASK			GENMASK_U32(21, 0)
+
+#define CDNS_ECC_INT_CTRL			DDR_CTL(58)
+#define CDNS_ECC_INT_CTRL_MASK			GENMASK_U32(21, 0)
+#define CDNS_ECC_INT_CTRL_MASK_ALL		BIT(22)
+#define CDNS_ECC_INT_CTRL_UNMASK(i)		((~(i)) & CDNS_ECC_INT_CTRL_MASK)
+
+struct mc_priv {
+	int irq;
+	void __iomem *io_base;
+	struct dentry *debugfs;
+	spinlock_t lock;
+	u16 xor_check_bits;
+};
+
+static irqreturn_t cdns_mc_err_handler(int irq, void *dev_id)
+{
+	struct mem_ctl_info *mci = dev_id;
+	struct mc_priv *priv = mci->pvt_info;
+	u32 status, err_addr, syndrome, reg;
+
+	status = readl(priv->io_base + CDNS_ECC_INT_STAT);
+	if (!status)
+		return IRQ_NONE;
+
+	/*
+	 * Hardware is not exposing how many CE / UE occurred since last ACK in
+	 * case of multiple errors. Always set the error count to 1.
+	 */
+
+	if (status & (CDNS_ECC_INT_STAT_UE | CDNS_ECC_INT_STAT_MULTIPLE_UE)) {
+		reg = readl(priv->io_base + CDNS_ECC_U_ERR_STAT);
+		syndrome = CDNS_ECC_ERR_STAT_GET_SYNDROME(reg);
+
+		err_addr = readl(priv->io_base + CDNS_ECC_U_ERR_ADDR);
+
+		edac_mc_handle_error(HW_EVENT_ERR_UNCORRECTED, mci, 1, err_addr >> PAGE_SHIFT,
+				     err_addr & ~PAGE_MASK, syndrome, 0, 0, -1, mci->ctl_name, "");
+	}
+
+	if (status & (CDNS_ECC_INT_STAT_CE | CDNS_ECC_INT_STAT_MULTIPLE_CE)) {
+		reg = readl(priv->io_base + CDNS_ECC_C_ERR_STAT);
+		syndrome = CDNS_ECC_ERR_STAT_GET_SYNDROME(reg);
+
+		err_addr = readl(priv->io_base + CDNS_ECC_C_ERR_ADDR);
+
+		edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci, 1, err_addr >> PAGE_SHIFT,
+				     err_addr & ~PAGE_MASK, syndrome, 0, 0, -1, mci->ctl_name, "");
+	}
+
+	writel(status & CDNS_ECC_INT_ACK_MASK, priv->io_base + CDNS_ECC_INT_ACK);
+
+	return IRQ_HANDLED;
+}
+
+#ifdef CONFIG_EDAC_DEBUG
+
+static void cdns_rmw(struct mc_priv *priv, u32 reg, u32 mask, u32 val)
+{
+	u32 regval;
+
+	regval = readl(priv->io_base + reg);
+	regval &= ~mask;
+	regval |= (val << __bf_shf(mask)) & mask;
+	writel(regval, priv->io_base + reg);
+}
+
+static ssize_t cdns_force_ecc_error(struct file *file, const char __user *data, size_t count,
+				    loff_t *ppos)
+{
+	struct device *dev = file->private_data;
+	struct mem_ctl_info *mci = to_mci(dev);
+	struct mc_priv *priv = mci->pvt_info;
+
+	spin_lock(&priv->lock);
+
+	cdns_rmw(priv, CDNS_ECC_XOR, CDNS_ECC_XOR_CHECK_BITS, priv->xor_check_bits);
+	cdns_rmw(priv, CDNS_ECC_STAT, CDNS_ECC_STAT_FWC, 1);
+
+	spin_unlock(&priv->lock);
+
+	return count;
+}
+
+static const struct file_operations cdns_ecc_error_fops = {
+	.open = simple_open,
+	.write = cdns_force_ecc_error,
+	.llseek = generic_file_llseek,
+};
+
+static void cdns_setup_debugfs(struct mem_ctl_info *mci)
+{
+	struct mc_priv *priv = mci->pvt_info;
+
+	priv->debugfs = edac_debugfs_create_dir(DRV_NAME);
+	if (!priv->debugfs) {
+		dev_dbg(mci->pdev, "failed to create debugfs dir\n");
+		return;
+	}
+
+	edac_debugfs_create_x16("bits", 0644, priv->debugfs, &priv->xor_check_bits);
+	edac_debugfs_create_file("inject", 0200, priv->debugfs, &mci->dev, &cdns_ecc_error_fops);
+}
+
+static void cdns_remove_debugfs(struct mem_ctl_info *mci)
+{
+	struct mc_priv *priv = mci->pvt_info;
+
+	edac_debugfs_remove_recursive(priv->debugfs);
+}
+
+#else
+
+static void cdns_setup_debugfs(struct mem_ctl_info *mci) {}
+
+static void cdns_remove_debugfs(struct mem_ctl_info *mci) {}
+
+#endif
+
+static int cdns_setup_irq(struct platform_device *pdev, struct mem_ctl_info *mci)
+{
+	struct mc_priv *priv = mci->pvt_info;
+	int ret;
+
+	priv->irq = platform_get_irq(pdev, 0);
+	if (priv->irq < 0)
+		return dev_err_probe(&pdev->dev, priv->irq, "unable to get irq\n");
+
+	ret = devm_request_irq(&pdev->dev, priv->irq, cdns_mc_err_handler, 0, dev_name(&pdev->dev),
+			       mci);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "unable to request irq %d\n", priv->irq);
+
+	return 0;
+}
+
+static int cdns_setup_mc(struct platform_device *pdev, void __iomem *io_base)
+{
+	struct edac_mc_layer layers[2];
+	struct mem_ctl_info *mci;
+	resource_size_t mem_sz;
+	struct dimm_info *dimm;
+	struct device_node *np;
+	struct mc_priv *priv;
+	struct resource res;
+	int ret;
+	u32 reg;
+
+	layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
+	layers[0].size = 1;
+	layers[0].is_virt_csrow = true;
+	layers[1].type = EDAC_MC_LAYER_CHANNEL;
+	layers[1].size = 1;
+	layers[1].is_virt_csrow = false;
+
+	np = of_find_node_by_name(NULL, "memory");
+	if (!np)
+		return dev_err_probe(&pdev->dev, -ENODEV, "unable to find memory node\n");
+
+	ret = of_address_to_resource(np, 0, &res);
+
+	of_node_put(np);
+
+	if (ret)
+		return ret;
+
+	mem_sz = resource_size(&res);
+
+	mci = edac_mc_alloc(0, ARRAY_SIZE(layers), layers, sizeof(struct mc_priv));
+	if (!mci)
+		return dev_err_probe(&pdev->dev, -ENOMEM, "unable to allocate edac mc\n");
+
+	mci->pdev = &pdev->dev;
+	priv = mci->pvt_info;
+
+	priv->io_base = io_base;
+	spin_lock_init(&priv->lock);
+	priv->xor_check_bits = 0;
+	platform_set_drvdata(pdev, mci);
+
+	reg = readl(priv->io_base + CDNS_ECC_STAT);
+	if (!CDNS_ECC_STAT_IS_ENABLED(reg))
+		mci->edac_cap = EDAC_FLAG_NONE;
+	else
+		mci->edac_cap = EDAC_FLAG_SECDED;
+
+	mci->mtype_cap = MEM_FLAG_DDR2 | MEM_FLAG_DDR3;
+	mci->edac_ctl_cap = EDAC_FLAG_NONE | EDAC_FLAG_SECDED;
+	mci->mod_name = pdev->dev.driver->name;
+	mci->ctl_name = "cdns-ddr-ctrl";
+	mci->dev_name = dev_name(&pdev->dev);
+	mci->scrub_mode = SCRUB_SW_SRC;
+
+	dimm = *mci->dimms;
+	dimm->nr_pages = PFN_UP(mem_sz);
+	dimm->grain = 4;
+	dimm->edac_mode = EDAC_SECDED;
+
+	/* Check if half datapath feature of the controller is active. */
+	reg = readl(priv->io_base + CDNS_BUS_CTRL);
+	if (reg & CDNS_BUS_CTRL_REDUC)
+		dimm->dtype = DEV_X8;
+	else
+		dimm->dtype = DEV_X16;
+
+	strscpy(dimm->label, "Channel#0_DIMM#0", sizeof(dimm->label));
+
+	reg = readl(priv->io_base + CDNS_DDR_STAT);
+	if (CDNS_DDR_STAT_GET_DRAM_CLASS(reg) == CDNS_DDR_STAT_DRAM_DDR2)
+		dimm->mtype = MEM_DDR2;
+	else
+		dimm->mtype = MEM_DDR3;
+
+	ret = edac_mc_add_mc(mci);
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret, "failed to add mc\n");
+		goto free_edac_mc;
+	}
+
+	ret = cdns_setup_irq(pdev, mci);
+	if (ret)
+		goto del_edac_mc;
+
+	cdns_setup_debugfs(mci);
+
+	edac_mc_chipset_printk(mci, KERN_DEBUG, DRV_NAME, "ECC %s\n",
+			       (mci->edac_cap == EDAC_FLAG_NONE) ? "disabled" : "enabled");
+
+	return 0;
+
+del_edac_mc:
+	edac_mc_del_mc(&pdev->dev);
+free_edac_mc:
+	edac_mc_free(mci);
+	return ret;
+}
+
+static int cdns_mc_probe(struct platform_device *pdev)
+{
+	void __iomem *io_base;
+	struct clk *clk;
+	int ret;
+
+	io_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(io_base))
+		return dev_err_probe(&pdev->dev, PTR_ERR(io_base), "unable to map regs\n");
+
+	clk = devm_clk_get_enabled(&pdev->dev, "ddrc");
+	if (IS_ERR(clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(clk), "unable to get ddrc\n");
+
+	clk = devm_clk_get_enabled(&pdev->dev, "pclk");
+	if (IS_ERR(clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(clk), "unable to get pclk\n");
+
+	writel(CDNS_ECC_INT_CTRL_MASK_ALL, io_base + CDNS_ECC_INT_CTRL);
+
+	ret = cdns_setup_mc(pdev, io_base);
+	if (ret)
+		return ret;
+
+	writel(CDNS_ECC_INT_CTRL_UNMASK(CDNS_ECC_INT_EDAC),
+	       io_base + CDNS_ECC_INT_CTRL);
+
+	return 0;
+}
+
+static void cdns_mc_remove(struct platform_device *pdev)
+{
+	struct mem_ctl_info *mci = platform_get_drvdata(pdev);
+	struct mc_priv *priv = mci->pvt_info;
+
+	writel(CDNS_ECC_INT_CTRL_MASK_ALL, priv->io_base + CDNS_ECC_INT_CTRL);
+
+	/* Wait for any pending interrupt before releasing resources. */
+	devm_free_irq(&pdev->dev, priv->irq, mci);
+
+	cdns_remove_debugfs(mci);
+
+	edac_mc_del_mc(&pdev->dev);
+	edac_mc_free(mci);
+}
+
+static const struct of_device_id cdns_ddr_ctrl_of_match[] = { { .compatible = "cdns,ddr-edac" },
+							      {} };
+MODULE_DEVICE_TABLE(of, cdns_ddr_ctrl_of_match);
+
+static struct platform_driver cdns_mc_edac_driver = {
+	.probe = cdns_mc_probe,
+	.remove = cdns_mc_remove,
+	.driver = {
+		.name = DRV_NAME,
+		.of_match_table = cdns_ddr_ctrl_of_match,
+	},
+};
+
+module_platform_driver(cdns_mc_edac_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Renesas Electronics Europe Ltd.");
+MODULE_AUTHOR("Paul Louvel <paul.louvel@bootlin.com>");
+MODULE_DESCRIPTION("EDAC driver for Cadence DDR controller");

-- 
2.56.0

