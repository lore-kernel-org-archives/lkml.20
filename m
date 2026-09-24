Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1944303C97;
	Thu, 24 Sep 2026 13:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790257301; cv=none; b=lfzFKPRdQqsLdxBhd8ETNDvdnxCYNnvd08pTMjFqGg6wNkxHRplhHc3EMr8upLh4iweBqGS6BT5rhPZB9LIInGI2oyS3QRtPQfQNSEBwdznd0WTqT+hAV0cMYp0ssJ6mppvoCnDNy3uLOoC+pih4O4jpxN/THp+SUxbCsNmbaeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790257301; c=relaxed/simple;
	bh=Wotvzpf+tO+GO3zb7vB9hCvjcd/ZZy9oIL04GBOQfIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cNGGXNrjbR+LQw8+Ti0JljI57/fVsSl41X3uU55slskZlU1HDSlYMH/JTQ1U/nghEMJveYhAE+7aotva6fk/i7mJCQ6iSOhZeL5vh9nPYflVZwipWO7WRnNLG06qRwwhpDy3JZ3J/nBObdjZp5/Wjd9YG2jX5WFw2Jt2CFlJ2MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DI6LlIDT; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DI6LlIDT"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 972D44E4105E;
	Thu, 24 Sep 2026 13:41:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6331460341;
	Thu, 24 Sep 2026 13:41:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C177103294A2;
	Thu, 24 Sep 2026 15:41:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790257291; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fA0sJENE1WQriZkcwhcpdf0F853voDSlB0eog/7mMN8=;
	b=DI6LlIDT6wTSVaQS3NXA1RUa4zotLr98wKlcwgPEw62wp1WVSA1K9OMDp49dVI9qwrUzij
	LbcFtw3aDFuA1WFiG89TJ+2Kh/+5B2YX4ggFyIonHn9jG100rtWTTNWne8z4nIsfamMc8Y
	6Q+DrthOOyJjyjyaD6m7WphTPIsCWzGD8JMoliLsuOohxyU8bQI6sNZhxBJfyH+dor8nRV
	B7XuFR9/A4o9NKmZJYEkeJVn4yHctRjNnv4I8X93w1FiHFx6p2bj7R8Zi4fJ/jgCdLismQ
	NW4k+SBumvYNrzP7U7+cYKJd+0Or6xJte9JSnW7KYDeIcgyNSvQyikJSORDURw==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Thu, 24 Sep 2026 15:41:13 +0200
Subject: [PATCH v2 2/3] EDAC/cadence: Add Cadence DDR EDAC driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-paul-v7-3-rc1-edac-v2-2-bc1406161ecc@bootlin.com>
References: <20260924-paul-v7-3-rc1-edac-v2-0-bc1406161ecc@bootlin.com>
In-Reply-To: <20260924-paul-v7-3-rc1-edac-v2-0-bc1406161ecc@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790257282; l=12733;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=Wotvzpf+tO+GO3zb7vB9hCvjcd/ZZy9oIL04GBOQfIg=;
 b=y/AtYUBOldj4vDkFA9ykVs972RdKL1q0p9/QNo/r3J8MW1iTkKavhoVHkN7EpViOoNGcTs5qz
 MsiU6RWXSDWC3G77CvtJfZ4SXfJryyTfA8ygkuXauVdNxu1J6Uu6Okg
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
 drivers/edac/cadence_edac.c | 340 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 352 insertions(+)

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
index a37534300ab9..0d66a072b15c 100644
--- a/drivers/edac/Makefile
+++ b/drivers/edac/Makefile
@@ -82,6 +82,7 @@ obj-$(CONFIG_EDAC_SYNOPSYS)		+= synopsys_edac.o
 obj-$(CONFIG_EDAC_XGENE)		+= xgene_edac.o
 obj-$(CONFIG_EDAC_TI)			+= ti_edac.o
 obj-$(CONFIG_EDAC_QCOM)			+= qcom_edac.o
+obj-$(CONFIG_EDAC_CADENCE)		+= cadence_edac.o
 obj-$(CONFIG_EDAC_ASPEED)		+= aspeed_edac.o
 obj-$(CONFIG_EDAC_BLUEFIELD)		+= bluefield_edac.o
 obj-$(CONFIG_EDAC_DMC520)		+= dmc520_edac.o
diff --git a/drivers/edac/cadence_edac.c b/drivers/edac/cadence_edac.c
new file mode 100644
index 000000000000..7edac7795fa7
--- /dev/null
+++ b/drivers/edac/cadence_edac.c
@@ -0,0 +1,340 @@
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
+#include <linux/bits.h>
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/edac.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/mm.h>
+#include <linux/mutex.h>
+#include <linux/of_address.h>
+#include <linux/string.h>
+#include <linux/platform_device.h>
+
+#include "edac_mc.h"
+
+#define DRV_NAME "cdns_edac"
+
+#define REG_BYTE_SZ 4
+#define DDR_CTL(n) ((n) * REG_BYTE_SZ)
+
+#define CDNS_DDR_DDR_STAT DDR_CTL(0)
+#define CDNS_DDR_DDR_STAT_DRAM_CLASS GENMASK_U32(11, 8)
+#define CDNS_DDR_DDR_STAT_DRAM_DDR2 BIT(2)
+#define CDNS_DDR_DDR_STAT_GET_DRAM_CLASS(reg) FIELD_GET(CDNS_DDR_DDR_STAT_DRAM_CLASS, reg)
+
+#define CDNS_DDR_ECC_STAT DDR_CTL(36)
+#define CDNS_DDR_ECC_STAT_ENABLED BIT(16)
+#define CDNS_DDR_ECC_STAT_IS_ENABLED(reg) FIELD_GET(CDNS_DDR_ECC_STAT_ENABLED, reg)
+#define CDNS_DDR_ECC_STAT_FWC BIT(24)
+
+#define CDNS_DDR_ECC_XOR DDR_CTL(37)
+#define CDNS_DDR_ECC_XOR_CHECK_BITS GENMASK_U32(13, 0)
+
+#define CDNS_DDR_BUS_CTRL DDR_CTL(54)
+#define CDNS_DDR_BUS_CTRL_REDUC BIT(1)
+
+/* DDR Controller Error Registers */
+
+#define CDNS_DDR_ECC_U_ERR_ADDR DDR_CTL(38)
+#define CDNS_DDR_ECC_U_ERR_STAT DDR_CTL(39)
+
+#define CDNS_DDR_ECC_C_ERR_ADDR DDR_CTL(41)
+#define CDNS_DDR_ECC_C_ERR_STAT DDR_CTL(42)
+
+#define CDNS_DDR_ECC_ERR_STAT_GET_SYNDROME(reg) FIELD_GET(GENMASK(6, 0), reg)
+
+#define CDNS_DDR_PORT_CMD_ERR_ADDR DDR_CTL(61)
+#define CDNS_DDR_PORT_CMD_ERR_TYPE DDR_CTL(62)
+#define CDNS_DDR_PORT_CMD_ERR_TYPE_GET(reg) FIELD_GET(GENMASK_U32(10, 8), reg)
+
+/* DDR Controller Interrupt Registers */
+
+#define CDNS_DDR_ECC_INT_STAT DDR_CTL(56)
+#define CDNS_DDR_ECC_INT_STAT_CE BIT(3)
+#define CDNS_DDR_ECC_INT_STAT_MULTIPLE_CE BIT(4)
+#define CDNS_DDR_ECC_INT_STAT_UE BIT(5)
+#define CDNS_DDR_ECC_INT_STAT_MULTIPLE_UE BIT(6)
+#define CDNS_DDR_ECC_INT_STAT_PORT_CMD_CHAN BIT(7)
+
+#define CDNS_DDR_ECC_INT_ACK DDR_CTL(57)
+#define CDNS_DDR_ECC_INT_ACK_MASK GENMASK_U32(21, 0)
+
+#define CDNS_DDR_ECC_INT_CTRL DDR_CTL(58)
+#define CDNS_DDR_ECC_INT_CTRL_MASK GENMASK_U32(21, 0)
+#define CDNS_DDR_ECC_INT_CTRL_MASK_ALL BIT(22)
+#define CDNS_DDR_ECC_INT_CTRL_UNMASK(i) ((~(i)) & CDNS_DDR_ECC_INT_CTRL_MASK)
+
+struct cdns_mc_priv {
+	void __iomem *io_base;
+	struct mutex lock;
+};
+
+static void cdns_rmw(struct cdns_mc_priv *priv, u32 reg, u32 mask, u32 val)
+{
+	u32 regval;
+
+	mutex_lock(&priv->lock);
+	regval = readl(priv->io_base + reg);
+	FIELD_MODIFY(mask, &regval, val);
+	writel(regval, priv->io_base + reg);
+	mutex_unlock(&priv->lock);
+}
+
+static irqreturn_t cdns_mc_err_handler(int irq, void *dev_id)
+{
+	struct mem_ctl_info *mci = dev_id;
+	struct cdns_mc_priv *priv = mci->pvt_info;
+	u32 addr, status, err_addr, syndrome, reg;
+	char other_details_str[32];
+	u8 type;
+
+	/* Read the interrupt status register */
+	status = readl(priv->io_base + CDNS_DDR_ECC_INT_STAT);
+	if (!status)
+		return IRQ_NONE;
+
+	/*
+	 * We can't know how many CE / UE occurred since last ACK in case of
+	 * multiple errors. Just report it.
+	 */
+
+	if ((status & CDNS_DDR_ECC_INT_STAT_UE) || (status & CDNS_DDR_ECC_INT_STAT_MULTIPLE_UE)) {
+		reg = readl(priv->io_base + CDNS_DDR_ECC_U_ERR_STAT);
+		syndrome = CDNS_DDR_ECC_ERR_STAT_GET_SYNDROME(reg);
+
+		err_addr = readl(priv->io_base + CDNS_DDR_ECC_U_ERR_ADDR);
+
+		edac_mc_handle_error(HW_EVENT_ERR_UNCORRECTED, mci, 1, err_addr >> PAGE_SHIFT,
+				     err_addr & ~PAGE_MASK, syndrome, 0, 0, -1, mci->ctl_name, "");
+	}
+
+	if ((status & CDNS_DDR_ECC_INT_STAT_CE) || (status & CDNS_DDR_ECC_INT_STAT_MULTIPLE_CE)) {
+		reg = readl(priv->io_base + CDNS_DDR_ECC_C_ERR_STAT);
+		syndrome = CDNS_DDR_ECC_ERR_STAT_GET_SYNDROME(reg);
+
+		err_addr = readl(priv->io_base + CDNS_DDR_ECC_C_ERR_ADDR);
+
+		edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci, 1, err_addr >> PAGE_SHIFT,
+				     err_addr & ~PAGE_MASK, syndrome, 0, 0, -1, mci->ctl_name, "");
+	}
+
+	if (status & CDNS_DDR_ECC_INT_STAT_PORT_CMD_CHAN) {
+		addr = readl(priv->io_base + CDNS_DDR_PORT_CMD_ERR_ADDR);
+		reg = readl(priv->io_base + CDNS_DDR_PORT_CMD_ERR_TYPE);
+		type = CDNS_DDR_PORT_CMD_ERR_TYPE_GET(reg);
+
+		snprintf(other_details_str, sizeof(other_details_str), "type 0x%02x", type);
+
+		edac_mc_handle_error(HW_EVENT_ERR_INFO, mci, 1, addr >> PAGE_SHIFT,
+				     addr & ~PAGE_MASK, 0, 0, 0, -1, mci->ctl_name,
+				     other_details_str);
+	}
+
+	/* clear the error, clears the interrupt */
+	writel(status & CDNS_DDR_ECC_INT_ACK_MASK, priv->io_base + CDNS_DDR_ECC_INT_ACK);
+
+	return IRQ_HANDLED;
+}
+
+static void cdns_mc_err_inject(struct mem_ctl_info *mci, u16 synd)
+{
+	struct cdns_mc_priv *priv = mci->pvt_info;
+
+	cdns_rmw(priv, CDNS_DDR_ECC_XOR, CDNS_DDR_ECC_XOR_CHECK_BITS, synd);
+	cdns_rmw(priv, CDNS_DDR_ECC_STAT, CDNS_DDR_ECC_STAT_FWC, 1);
+}
+
+static ssize_t inject_ctrl_store(struct device *dev, struct device_attribute *attr, const char *buf,
+				 size_t count)
+{
+	struct mem_ctl_info *mci = to_mci(dev);
+	u16 synd;
+
+	if (kstrtou16(buf, 16, &synd))
+		return -EINVAL;
+
+	cdns_mc_err_inject(mci, synd);
+
+	return count;
+}
+
+static DEVICE_ATTR_WO(inject_ctrl);
+
+static struct attribute *cdns_edac_attrs[] = { &dev_attr_inject_ctrl.attr, NULL };
+
+ATTRIBUTE_GROUPS(cdns_edac);
+
+static void devm_cdns_edac_free(void *data)
+{
+	edac_mc_free(data);
+}
+
+static void devm_cdns_edac_del(void *data)
+{
+	edac_mc_del_mc(data);
+}
+
+static int cdns_get_mem_sz(resource_size_t *mem_sz)
+{
+	struct device_node *np;
+	struct resource res;
+	int ret;
+
+	np = of_find_node_by_name(NULL, "memory");
+	if (!np)
+		return -ENODEV;
+
+	ret = of_address_to_resource(np, 0, &res);
+
+	of_node_put(np);
+
+	if (ret)
+		return ret;
+
+	*mem_sz = resource_size(&res);
+
+	return 0;
+}
+
+static int cdns_mc_probe(struct platform_device *pdev)
+{
+	struct edac_mc_layer layers[2];
+	struct cdns_mc_priv *priv;
+	struct mem_ctl_info *mci;
+	struct dimm_info *dimm;
+	resource_size_t mem_sz;
+	struct clk *clk;
+	int ret, irq;
+	u32 reg;
+
+	layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
+	layers[0].size = 1;
+	layers[0].is_virt_csrow = true;
+	layers[1].type = EDAC_MC_LAYER_CHANNEL;
+	layers[1].size = 1;
+	layers[1].is_virt_csrow = false;
+	mci = edac_mc_alloc(0, ARRAY_SIZE(layers), layers, sizeof(struct cdns_mc_priv));
+	if (!mci)
+		return dev_err_probe(&pdev->dev, -ENOMEM, "unable to allocate edac mc\n");
+
+	ret = devm_add_action_or_reset(&pdev->dev, devm_cdns_edac_free, mci);
+	if (ret)
+		return ret;
+
+	mci->pdev = &pdev->dev;
+	priv = mci->pvt_info;
+
+	priv->io_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->io_base))
+		return dev_err_probe(&pdev->dev, PTR_ERR(priv->io_base), "unable to map regs\n");
+
+	clk = devm_clk_get_enabled(&pdev->dev, "ddrc");
+	if (IS_ERR(clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(clk), "unable to get ddrc\n");
+
+	clk = devm_clk_get_enabled(&pdev->dev, "pclk");
+	if (IS_ERR(clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(clk), "unable to get pclk\n");
+
+	reg = readl(priv->io_base + CDNS_DDR_ECC_STAT);
+	if (!CDNS_DDR_ECC_STAT_IS_ENABLED(reg))
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
+	ret = cdns_get_mem_sz(&mem_sz);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "unable to get memory size\n");
+
+	dimm = *mci->dimms;
+	dimm->nr_pages = PFN_UP(mem_sz);
+	dimm->grain = 4;
+	dimm->edac_mode = EDAC_SECDED;
+
+	/* Check if half datapath feature of the controller is active. */
+	reg = readl(priv->io_base + CDNS_DDR_BUS_CTRL);
+	if (reg & CDNS_DDR_BUS_CTRL_REDUC)
+		dimm->dtype = DEV_X8;
+	else
+		dimm->dtype = DEV_X16;
+
+	strscpy(dimm->label, "Channel#0_DIMM#0", sizeof(dimm->label));
+
+	reg = readl(priv->io_base + CDNS_DDR_DDR_STAT);
+	if (CDNS_DDR_DDR_STAT_GET_DRAM_CLASS(reg) == CDNS_DDR_DDR_STAT_DRAM_DDR2)
+		dimm->mtype = MEM_DDR2;
+	else
+		dimm->mtype = MEM_DDR3;
+
+	ret = edac_mc_add_mc_with_groups(mci, cdns_edac_groups);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to add mc\n");
+
+	ret = devm_add_action_or_reset(&pdev->dev, devm_cdns_edac_del, &pdev->dev);
+	if (ret)
+		return ret;
+
+	writel(CDNS_DDR_ECC_INT_CTRL_MASK_ALL, priv->io_base + CDNS_DDR_ECC_INT_CTRL);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return dev_err_probe(&pdev->dev, irq, "unable to get irq\n");
+
+	ret = devm_request_irq(&pdev->dev, irq, cdns_mc_err_handler, 0, dev_name(&pdev->dev), mci);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "unable to request irq %d\n", irq);
+
+	/*
+	 * Unmask ECC recoverable and unrecoverable interrupts, and port
+	 * command errors.
+	 */
+	writel(CDNS_DDR_ECC_INT_CTRL_UNMASK(
+		       CDNS_DDR_ECC_INT_STAT_CE | CDNS_DDR_ECC_INT_STAT_MULTIPLE_CE |
+		       CDNS_DDR_ECC_INT_STAT_UE | CDNS_DDR_ECC_INT_STAT_MULTIPLE_UE |
+		       CDNS_DDR_ECC_INT_STAT_PORT_CMD_CHAN),
+	       priv->io_base + CDNS_DDR_ECC_INT_CTRL);
+
+	edac_mc_chipset_printk(mci, KERN_DEBUG, DRV_NAME, "ECC %s",
+			       (mci->edac_cap == EDAC_FLAG_NONE) ? "disabled" : "enabled");
+
+	return 0;
+}
+
+static const struct of_device_id cdns_ddr_ctrl_of_match[] = {
+	{ .compatible = "cdns,ddr-edac" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, cdns_ddr_ctrl_of_match);
+
+static struct platform_driver cdns_mc_edac_driver = {
+	.probe = cdns_mc_probe,
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
2.55.0

