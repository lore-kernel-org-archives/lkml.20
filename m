Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE47471437;
	Fri, 28 Aug 2026 15:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929682; cv=none; b=dG2dFnyrglc4oBg1SJxe1f8j+64O1P9Nmhlr5ybeMwFGjOqtL5UMne+Ss8zRCeHIEr/uIxopn0E4as+bw0kABLLwzrLtrT5ATptDv9VZOdRbDPR8AWzzQCSlEgPuUbTZzT/BQODvPqzxBGW7uyGOoc47bceLcZ8R88sxgQKwFmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929682; c=relaxed/simple;
	bh=DeKYEjL7UyE2KXWtytt4NrrpxX3Uo5FHjxx6u4WT540=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FlduZJ/PxHt6ijP/3wN1IaIm7jNtbqDgSajIjaM4YMCuI7pvORg8/e4Am8H8F2er2NdC3liSSJtFIQCjxidr/0IfHuCvwBk9+9Qthr5o8twCjoEPf7xMjAiOlGefy4Gny8OQHl/MXzdnxdGQnpwQXNRgb/VcdozAfrAfjTyvdvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=b4fRGr4W; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="b4fRGr4W"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E964011D0F6;
	Fri, 28 Aug 2026 17:07:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787929673; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=GNZHlfu6UdzNKO0+8Q56ktHvv/VBnO/DXQ93lde3I+s=;
	b=b4fRGr4W9rKlID6TvUMhron9/HbgsTDywTVgNhqOrAL391exHc4iMAeyR2kkse94ajeCrL
	BqotSoJqXdIGT7TTu74HSbSlIXrZQ1X0zjEfYwGxVqzIzr0d0ZjQtZOvz02szB3NKEItDf
	QY8hvzf6QF2/ad4G6VkSS8YqwH6wm158WXHzEUuHCZN5fEigxWwNszVAvixFh52XU3Cg+P
	T+2nmtdsj6D8ZaDp4nyRLcdRJIAC5MRkzWzTUcwmv9PD+xFf2nSs0NSG2mZB9c0Hydk3J+
	6mexZdMX+XtdqMxAvPgRk2DiARaJ2/SU4mxxQ5Ammh8hVxDoErsZ9V1uMNiBlA==
From: Marek Vasut <marex@nabladev.com>
To: linux-phy@lists.infradead.org
Cc: Pankaj Dev <pankaj.dev@st.com>,
	Rahul Kumar <rahul.kumar05@st.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v4 2/2] phy: stm32: Add support for ST STM32MP25 USB2-FEMTO PHY
Date: Fri, 28 Aug 2026 17:06:57 +0200
Message-ID: <20260828150739.174460-2-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828150739.174460-1-marex@nabladev.com>
References: <20260828150739.174460-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Pankaj Dev <pankaj.dev@st.com>

Add USB2 PHY driver for STM32MP25 USB2 controllers, which includes the
USB2.0 host-only controller and USB 2.0 part of the DWC3 controller.
Two such PHYs in total are present in STM32MP25 SoC, they both are
slightly different, therefore they use different compatible string
to discern them.

Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
Co-developed-by: Rahul Kumar <rahul.kumar05@st.com>
Signed-off-by: Rahul Kumar <rahul.kumar05@st.com>
Co-developed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Co-developed-by: Christian Bruel <christian.bruel@foss.st.com>
Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
Co-developed-by: Marek Vasut <marex@nabladev.com>
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christian Bruel <christian.bruel@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Pankaj Dev <pankaj.dev@st.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Rahul Kumar <rahul.kumar05@st.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Rosen Penev <rosenp@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
V2: - Fix up Sob/Cdb lines
    - Operate PHY as a syscon subnode
V3: - Update copyright years
    - Register two sets of clock, one 480 MHz PLL and one CMN
    - Split PHY ops per PHY, since the PHY2 does not have set mode ops
    - Fix up Sob/Cdb lines further
V4: - Split this from series arm64: dts: phy: st: usb: Add STM32MP2 USB support
      https://lore.kernel.org/all/20260822074816.548662-1-marex@nabladev.com/
---
 drivers/phy/st/Kconfig             |  10 +
 drivers/phy/st/Makefile            |   1 +
 drivers/phy/st/phy-stm32-usb2phy.c | 406 +++++++++++++++++++++++++++++
 3 files changed, 417 insertions(+)
 create mode 100644 drivers/phy/st/phy-stm32-usb2phy.c

diff --git a/drivers/phy/st/Kconfig b/drivers/phy/st/Kconfig
index 49206185e5633..2835bb67bca9e 100644
--- a/drivers/phy/st/Kconfig
+++ b/drivers/phy/st/Kconfig
@@ -58,3 +58,13 @@ config PHY_STM32_USBPHYC
 	  used by an HS USB Host controller, and the second one is shared
 	  between an HS USB OTG controller and an HS USB Host controller,
 	  selected by a USB switch.
+
+config PHY_STM32_USB2PHY
+	tristate "STMicroelectronics STM32MP25 USB2.0 PHY Controller driver"
+	depends on ARCH_STM32 || COMPILE_TEST
+	depends on COMMON_CLK
+	select GENERIC_PHY
+	help
+	  Enable this to support the High-Speed USB 2.0 transceivers that are
+	  part of the STMicroelectronics STM32MP25 SoCs. The PHY itself is a
+	  Synopsys FEMTO-PHY.
diff --git a/drivers/phy/st/Makefile b/drivers/phy/st/Makefile
index cb80e954ea9f0..4945df5ed78a8 100644
--- a/drivers/phy/st/Makefile
+++ b/drivers/phy/st/Makefile
@@ -5,3 +5,4 @@ obj-$(CONFIG_PHY_ST_SPEAR1340_MIPHY)	+= phy-spear1340-miphy.o
 obj-$(CONFIG_PHY_STIH407_USB)		+= phy-stih407-usb.o
 obj-$(CONFIG_PHY_STM32_COMBOPHY)	+= phy-stm32-combophy.o
 obj-$(CONFIG_PHY_STM32_USBPHYC) 	+= phy-stm32-usbphyc.o
+obj-$(CONFIG_PHY_STM32_USB2PHY) 	+= phy-stm32-usb2phy.o
diff --git a/drivers/phy/st/phy-stm32-usb2phy.c b/drivers/phy/st/phy-stm32-usb2phy.c
new file mode 100644
index 0000000000000..8c68b2d208d73
--- /dev/null
+++ b/drivers/phy/st/phy-stm32-usb2phy.c
@@ -0,0 +1,406 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * STMicroelectronics STM32 USB2 PHY Controller driver
+ * Currently Only supported for STM32MP25
+ *
+ * Copyright (C) 2022-2026 STMicroelectronics
+ * Author(s): Pankaj Dev <pankaj.dev@st.com>.
+ */
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+#include <linux/usb/role.h>
+#include <linux/mfd/syscon.h>
+
+#define SYSCFG_USB2PHY2CR_USB2PHY2CMN		BIT(2)
+#define SYSCFG_USB2PHY2CR_VBUSVALID		BIT(4)
+#define SYSCFG_USB2PHY2CR_VBUSVLDEXTSEL		BIT(5)
+#define SYSCFG_USB2PHY2CR_VBUSVLDEXT		BIT(6)
+
+#define USBH_NUM_CLK				2
+
+struct stm32_usb2phy {
+	struct phy				*phy;
+	struct regmap				*regmap;
+	struct device				*dev;
+	struct reset_control			*rstc;
+	struct clk				*phyref;
+	struct regulator			*vdd33;
+	const struct stm32mp2_usb2phy_hw_data	*hw_data;
+	atomic_t				en_refcnt;
+	enum phy_mode				mode;
+	u32					cr_offset;
+	bool					is_init;
+	struct clk_hw				clkpll_hw;
+	struct clk_hw				clkcmn_hw;
+	/* Must be last */
+	struct clk_hw_onecell_data		onecell;
+};
+
+struct stm32mp2_usb2phy_hw_data {
+	u32			phyrefsel_mask;
+	const struct phy_ops	*phy_ops;
+};
+
+static int stm32_usb2phy_enable(struct stm32_usb2phy *phy_dev)
+{
+	const struct stm32mp2_usb2phy_hw_data *phy_data = phy_dev->hw_data;
+	unsigned int refsel;
+	unsigned long rate;
+	int ret;
+
+	/* Check if a phy is already init or clkpll in use */
+	if (atomic_inc_return(&phy_dev->en_refcnt) > 1)
+		return 0;
+
+	rate = clk_get_rate(phy_dev->phyref);
+	if (rate == 19200000)
+		refsel = 0;
+	else if (rate == 20000000)
+		refsel = 1;
+	else if (rate == 24000000)
+		refsel = 2;
+	else
+		return -EINVAL;
+
+	ret = regmap_update_bits(phy_dev->regmap,
+				 phy_dev->cr_offset,
+				 phy_data->phyrefsel_mask,
+				 field_prep(phy_data->phyrefsel_mask, refsel));
+	if (ret)
+		return ret;
+
+	ret = regulator_enable(phy_dev->vdd33);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(phy_dev->phyref);
+	if (ret)
+		goto error_regdis;
+
+	ret = reset_control_deassert(phy_dev->rstc);
+	if (ret)
+		goto error_clkdis;
+
+	return 0;
+
+error_clkdis:
+	clk_disable_unprepare(phy_dev->phyref);
+error_regdis:
+	regulator_disable(phy_dev->vdd33);
+
+	return ret;
+}
+
+static int stm32_usb2phy_disable(struct stm32_usb2phy *phy_dev)
+{
+	int ret;
+
+	/* Check if a phy is still init or clkpll in use */
+	if (atomic_dec_return(&phy_dev->en_refcnt) > 0)
+		return 0;
+
+	ret = reset_control_assert(phy_dev->rstc);
+	if (ret)
+		return ret;
+
+	clk_disable_unprepare(phy_dev->phyref);
+
+	return regulator_disable(phy_dev->vdd33);
+}
+
+static int stm32_usb2phy_set_mode(struct phy *phy, enum phy_mode mode, int submode)
+{
+	struct stm32_usb2phy *phy_dev = phy_get_drvdata(phy);
+	u32 mask = SYSCFG_USB2PHY2CR_USB2PHY2CMN |
+		   SYSCFG_USB2PHY2CR_VBUSVALID |
+		   SYSCFG_USB2PHY2CR_VBUSVLDEXT;
+	u32 val = 0;
+	int ret;
+
+	if (mode == PHY_MODE_USB_HOST) {
+		if (submode != USB_ROLE_NONE)
+			val = SYSCFG_USB2PHY2CR_VBUSVALID;
+	} else if (mode == PHY_MODE_USB_DEVICE) {
+		val = SYSCFG_USB2PHY2CR_USB2PHY2CMN |
+		      SYSCFG_USB2PHY2CR_VBUSVLDEXTSEL;
+		if (submode != USB_ROLE_NONE)
+			val |= SYSCFG_USB2PHY2CR_VBUSVLDEXT;
+		mask |= SYSCFG_USB2PHY2CR_VBUSVLDEXTSEL;
+	} else {
+		return -EINVAL;
+	}
+
+	ret = regmap_update_bits(phy_dev->regmap, phy_dev->cr_offset, mask, val);
+	if (ret)
+		return ret;
+
+	phy_dev->mode = mode;
+
+	return 0;
+}
+
+static int stm32_usb2phy1_init(struct phy *phy)
+{
+	struct stm32_usb2phy *phy_dev = phy_get_drvdata(phy);
+	int ret;
+
+	ret = stm32_usb2phy_enable(phy_dev);
+	if (ret)
+		return ret;
+
+	phy_dev->is_init = true;
+
+	return 0;
+}
+
+static int stm32_usb2phy2_init(struct phy *phy)
+{
+	struct stm32_usb2phy *phy_dev = phy_get_drvdata(phy);
+	int ret;
+
+	ret = stm32_usb2phy_enable(phy_dev);
+	if (ret)
+		return ret;
+
+	if (phy_dev->mode != PHY_MODE_INVALID) {
+		ret = stm32_usb2phy_set_mode(phy, phy_dev->mode, USB_ROLE_NONE);
+		if (ret) {
+			stm32_usb2phy_disable(phy_dev);
+			return ret;
+		}
+	}
+
+	phy_dev->is_init = true;
+
+	return 0;
+}
+
+static int stm32_usb2phy_exit(struct phy *phy)
+{
+	struct stm32_usb2phy *phy_dev = phy_get_drvdata(phy);
+	int ret;
+
+	ret = stm32_usb2phy_disable(phy_dev);
+	if (ret)
+		return ret;
+
+	phy_dev->is_init = false;
+
+	return 0;
+}
+
+static const struct phy_ops stm32_usb2phy1_data = {
+	.init = stm32_usb2phy1_init,
+	.exit = stm32_usb2phy_exit,
+	.owner = THIS_MODULE,
+};
+
+static const struct phy_ops stm32_usb2phy2_data = {
+	.init = stm32_usb2phy2_init,
+	.exit = stm32_usb2phy_exit,
+	.set_mode = stm32_usb2phy_set_mode,
+	.owner = THIS_MODULE,
+};
+
+static int stm32_usb2phy_clkpll_prepare(struct clk_hw *hw)
+{
+	struct stm32_usb2phy *phy_dev = container_of(hw, struct stm32_usb2phy,
+						     clkpll_hw);
+
+	return stm32_usb2phy_enable(phy_dev);
+}
+
+static void stm32_usb2phy_clkpll_unprepare(struct clk_hw *hw)
+{
+	struct stm32_usb2phy *phy_dev = container_of(hw, struct stm32_usb2phy,
+						     clkpll_hw);
+
+	stm32_usb2phy_disable(phy_dev);
+}
+
+static unsigned long stm32_usb2phy_clkpll_recalc_rate(struct clk_hw *hw,
+						      unsigned long parent_rate)
+{
+	return 480000000;
+}
+
+static const struct clk_ops stm32_usb2phy_clkpll_ops = {
+	.prepare = stm32_usb2phy_clkpll_prepare,
+	.unprepare = stm32_usb2phy_clkpll_unprepare,
+	.recalc_rate = stm32_usb2phy_clkpll_recalc_rate,
+};
+
+static int stm32_usb2phy_clkcmn_prepare(struct clk_hw *hw)
+{
+	struct stm32_usb2phy *phy_dev = container_of(hw, struct stm32_usb2phy,
+						     clkcmn_hw);
+
+	return regmap_clear_bits(phy_dev->regmap, phy_dev->cr_offset,
+				 SYSCFG_USB2PHY2CR_USB2PHY2CMN);
+}
+
+static void stm32_usb2phy_clkcmn_unprepare(struct clk_hw *hw)
+{
+	struct stm32_usb2phy *phy_dev = container_of(hw, struct stm32_usb2phy,
+						     clkcmn_hw);
+
+	regmap_set_bits(phy_dev->regmap, phy_dev->cr_offset,
+			SYSCFG_USB2PHY2CR_USB2PHY2CMN);
+}
+
+static const struct clk_ops stm32_usb2phy_clkcmn_ops = {
+	.prepare = stm32_usb2phy_clkcmn_prepare,
+	.unprepare = stm32_usb2phy_clkcmn_unprepare,
+};
+
+static int stm32_usb2phy_probe(struct platform_device *pdev)
+{
+	struct phy_provider *phy_provider;
+	struct device *dev = &pdev->dev;
+	struct stm32_usb2phy *phy_dev;
+	char *pllname, *cmnname;
+	const __be32 *offset;
+	struct phy *phy;
+	int ret;
+
+	phy_dev = devm_kzalloc(dev, struct_size(phy_dev, onecell.hws, USBH_NUM_CLK), GFP_KERNEL);
+	if (!phy_dev)
+		return -ENOMEM;
+
+	phy_dev->dev = dev;
+	dev_set_drvdata(dev, phy_dev);
+
+	phy_dev->rstc = devm_reset_control_get(dev, NULL);
+	if (IS_ERR(phy_dev->rstc))
+		return dev_err_probe(dev, PTR_ERR(phy_dev->rstc), "Failed to get USB2PHY reset\n");
+
+	phy_dev->phyref = devm_clk_get(dev, NULL);
+	if (IS_ERR(phy_dev->phyref))
+		return dev_err_probe(dev, PTR_ERR(phy_dev->phyref), "Failed to get phyref clk\n");
+
+	phy_dev->vdd33 = devm_regulator_get_optional(dev, "vdd33");
+	if (IS_ERR(phy_dev->vdd33))
+		return dev_err_probe(dev, PTR_ERR(phy_dev->vdd33), "Failed to get vdd3v3 supply\n");
+
+	phy_dev->regmap = syscon_node_to_regmap(dev->of_node->parent);
+	if (IS_ERR(phy_dev->regmap))
+		return dev_err_probe(dev, PTR_ERR(phy_dev->regmap), "Failed to get regmap\n");
+
+	offset = of_get_address(dev->of_node, 0, NULL, NULL);
+	if (!offset)
+		return dev_err_probe(dev, -EINVAL, "Failed to get regmap offset\n");
+
+	phy_dev->cr_offset = be32_to_cpu(*offset);
+
+	phy_dev->hw_data = device_get_match_data(dev);
+
+	phy = devm_phy_create(dev, NULL, phy_dev->hw_data->phy_ops);
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, PTR_ERR(phy), "Failed to create PHY\n");
+
+	phy_dev->phy = phy;
+	phy_set_drvdata(phy, phy_dev);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(phy_provider))
+		return PTR_ERR(phy_provider);
+
+	pllname = devm_kasprintf(dev, GFP_KERNEL, "clk_%s_48m",
+				 of_node_full_name(dev->of_node));
+	if (!pllname)
+		return -ENOMEM;
+
+	cmnname = devm_kasprintf(dev, GFP_KERNEL, "clk_%s_cmn",
+				 of_node_full_name(dev->of_node));
+	if (!cmnname)
+		return -ENOMEM;
+
+	phy_dev->onecell.num = USBH_NUM_CLK;
+	phy_dev->onecell.hws[0] = &phy_dev->clkpll_hw;
+	phy_dev->onecell.hws[1] = &phy_dev->clkcmn_hw;
+
+	phy_dev->clkpll_hw.init = CLK_HW_INIT_NO_PARENT(pllname, &stm32_usb2phy_clkpll_ops, 0);
+	ret = devm_clk_hw_register(phy_dev->dev, &phy_dev->clkpll_hw);
+	if (ret)
+		return dev_err_probe(phy_dev->dev, ret, "Failed to register PLL clock\n");
+
+	phy_dev->clkcmn_hw.init = CLK_HW_INIT_HW(cmnname, &phy_dev->clkpll_hw,
+						 &stm32_usb2phy_clkcmn_ops, 0);
+	ret = devm_clk_hw_register(phy_dev->dev, &phy_dev->clkcmn_hw);
+	if (ret)
+		return dev_err_probe(phy_dev->dev, ret, "Failed to register CMN clock\n");
+
+	ret = devm_of_clk_add_hw_provider(phy_dev->dev, of_clk_hw_onecell_get, &phy_dev->onecell);
+	if (ret)
+		return dev_err_probe(phy_dev->dev, ret, "Failed to add clock provider\n");
+
+	return 0;
+}
+
+static int stm32_usb2phy_suspend(struct device *dev)
+{
+	struct stm32_usb2phy *phy_dev = dev_get_drvdata(dev);
+
+	if (phy_dev->is_init)
+		return stm32_usb2phy_disable(phy_dev);
+
+	return 0;
+}
+
+static int stm32_usb2phy_resume(struct device *dev)
+{
+	struct stm32_usb2phy *phy_dev = dev_get_drvdata(dev);
+
+	if (phy_dev->is_init)
+		return stm32_usb2phy_enable(phy_dev);
+
+	return 0;
+}
+
+/* STM32MP25xx USB 2.0 PHY attached to USB 2.0 Host controller */
+static const struct stm32mp2_usb2phy_hw_data stm32mp25_usb2phy1_hwdata = {
+	.phyrefsel_mask = GENMASK(6, 4),
+	.phy_ops = &stm32_usb2phy1_data,
+};
+
+/* STM32MP25xx USB 2.0 PHY attached to USB 2.0 part of DWC3 controller */
+static const struct stm32mp2_usb2phy_hw_data stm32mp25_usb2phy2_hwdata = {
+	.phyrefsel_mask = GENMASK(14, 12),
+	.phy_ops = &stm32_usb2phy2_data,
+};
+
+static const struct of_device_id stm32_usb2phy_of_match[] = {
+	{ .compatible = "st,stm32mp25-usb2phy1", .data = &stm32mp25_usb2phy1_hwdata },
+	{ .compatible = "st,stm32mp25-usb2phy2", .data = &stm32mp25_usb2phy2_hwdata },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, stm32_usb2phy_of_match);
+
+static DEFINE_SIMPLE_DEV_PM_OPS(stm32_usb2phy_pm_ops,
+				stm32_usb2phy_suspend, stm32_usb2phy_resume);
+
+static struct platform_driver stm32_usb2phy_driver = {
+	.probe = stm32_usb2phy_probe,
+	.driver = {
+		.name = "stm32-usb2phy",
+		.of_match_table = stm32_usb2phy_of_match,
+		.pm = pm_sleep_ptr(&stm32_usb2phy_pm_ops)
+	}
+};
+
+module_platform_driver(stm32_usb2phy_driver);
+
+MODULE_AUTHOR("Pankaj Dev <pankaj.dev@st.com>");
+MODULE_DESCRIPTION("STMicroelectronics Generic USB2PHY driver for stm32");
+MODULE_LICENSE("GPL");
-- 
2.53.0

