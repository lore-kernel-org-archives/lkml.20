Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497594;
	b=PIQMUhu4nBh9uMV4kAglSoW0auxMs745hlrJkQGSbB10vUklwLeR/A0XL+Mfu9jTsIPr
	 3LLrajLIie1uTLcyy/j27OAtoHO+JUYlQPP9WZyw64lJzI+2vhR68WbQB6ySk/+/yjKt3
	 TXkzvpOTZQd6+BnOIlCSviRGVeBxHcLaYgsGqI6FVXx+K2TIGsrXELfpPRAvT+LHh74WQ
	 RYD3+K5kN+bn+mDEcSnLxS/wE3pUOOIhvQDF5mC8VpuELulS5dQ1rPuZzilN1ltDkZDuH
	 IyDefpSyyrEYjUGYnb1cINfvukNmQCvCg4aH+DPzLQek6zGGdnqiI/PAC4T7YcDNDYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497594;
	h=DMARC-Filter:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-ID:References:
	 In-Reply-To:To:CC:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ZwuBZPzr/d7UakNagbyIhvgD3/DszpJHEC07fn4iPnQ=;
	b=CXRX9wpb4iRqb17KSKFEkI7T9BFzLPT7EkiZ+JnaXZmo8GfcVeofGg5Zh5jXtD2bCb3Q
	 /Bb8mwe12IKRf0ODFVim+tc6fRefY3An0dJPNP0sItPax841nXB2mckpnvyC9o761j1EA
	 GwgyKtTN3sweM87vo8+FcDZp4MFUSCXvExY78ncIzyva7/EB2OXVo1ynTE4rky7SVqGFY
	 QpFGf031Pe+Kkuxt1p/idLpJ4o0nC8YD85ONHKkCe/jH4IfTm5GgOZXV7lD41uZnenGaZ
	 ptGA/APFm++z39Q+JaD+9mnDKJNIvu03w3HlbDt+XAmBLSnhwb2wXF+8M/XPI5FMHsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aspeedtech.com;
	spf=pass smtp.mailfrom=aspeedtech.com;
	arc=none smtp.remote-ip=211.20.114.72
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B868760A2600;
	Tue, 20 Oct 2026 11:59:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B868760A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 20 Oct
 2026 19:59:50 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 20 Oct 2026 19:59:50 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Date: Tue, 20 Oct 2026 19:59:50 +0800
Subject: [PATCH v10 2/3] phy: aspeed: Add ASPEED PCIe PHY driver
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261020-upstream_pcie_rc-v10-2-fba209af8656@aspeedtech.com>
References: <20261020-upstream_pcie_rc-v10-0-fba209af8656@aspeedtech.com>
In-Reply-To: <20261020-upstream_pcie_rc-v10-0-fba209af8656@aspeedtech.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>
CC: <linux-aspeed@lists.ozlabs.org>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Jacky Chou <jacky_chou@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792497590; l=8221;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=NZKk6v8Pk+q4284AonRT0NvxfyO5VH+gAn3/T/0vAHc=;
 b=z/2X7aVu0+9vLtmTttI1FaBSCI6MWZA2i/wdTIbBJd4hxaqN2tq29tiXY4scijc9PXDEoYXTQ
 zwv4JesNwqnBvex9u4lkjBLUin440dUGmrVeO4Moc6YFfkS0L6zHDQr
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=

Introduce support for Aspeed PCIe PHY controller available in
AST2600/2700.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 drivers/phy/aspeed/Kconfig           |  12 +-
 drivers/phy/aspeed/Makefile          |   1 +
 drivers/phy/aspeed/phy-aspeed-pcie.c | 230 +++++++++++++++++++++++++++++++++++
 3 files changed, 242 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/aspeed/Kconfig b/drivers/phy/aspeed/Kconfig
index 7b5f48db2be8..b5903cf06268 100644
--- a/drivers/phy/aspeed/Kconfig
+++ b/drivers/phy/aspeed/Kconfig
@@ -1,9 +1,19 @@
 # SPDX-License-Identifier: GPL-2.0-only
-
 #
 # PHY drivers for ASPEED
 #
 
+config PHY_ASPEED_PCIE
+	tristate "ASPEED PCIe PHY driver"
+	select GENERIC_PHY
+	depends on (ARCH_ASPEED || COMPILE_TEST)
+	help
+	  This option enables support for the ASPEED PCIe PHY driver.
+	  The driver provides the necessary interface to control and
+	  configure the PCIe PHY hardware found on ASPEED SoCs.
+	  It is required for proper operation of PCIe devices on
+	  platforms using ASPEED chips.
+
 config PHY_ASPEED_USB3
 	tristate "ASPEED USB3 PHY driver"
 	select GENERIC_PHY
diff --git a/drivers/phy/aspeed/Makefile b/drivers/phy/aspeed/Makefile
index d96d9d73a009..9d43790fdda8 100644
--- a/drivers/phy/aspeed/Makefile
+++ b/drivers/phy/aspeed/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_PHY_ASPEED_PCIE)		+= phy-aspeed-pcie.o
 obj-$(CONFIG_PHY_ASPEED_USB3)		+= phy-aspeed-usb3.o
diff --git a/drivers/phy/aspeed/phy-aspeed-pcie.c b/drivers/phy/aspeed/phy-aspeed-pcie.c
new file mode 100644
index 000000000000..0a18c0eb35cf
--- /dev/null
+++ b/drivers/phy/aspeed/phy-aspeed-pcie.c
@@ -0,0 +1,230 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2025 Aspeed Technology Inc.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/phy/pcie.h>
+#include <linux/phy/phy.h>
+
+/* AST2600 PCIe Host Controller Registers */
+#define PEHR_GLOBAL		0x30
+#define  AST2600_PORT_TYPE_MASK		GENMASK(5, 4)
+#define PEHR_LOCK		0x7c
+#define  PCIE_UNLOCK			0xa8
+
+/* AST2700 PEHR */
+#define PEHR_MISC_58		0x58
+#define  LOCAL_SCALE_SUP		BIT(0)
+#define PEHR_MISC_5C		0x5c
+#define  CONFIG_RC_DEVICE		BIT(30)
+#define PEHR_MISC_60		0x60
+#define  AST2700_PORT_TYPE_MASK		GENMASK(7, 4)
+#define  PORT_TYPE_ROOT			0x4
+#define PEHR_MISC_70		0x70
+#define  POSTED_DATA_CREDITS(x)		FIELD_PREP(GENMASK(15, 0), x)
+#define  POSTED_HEADER_CREDITS(x)	FIELD_PREP(GENMASK(27, 16), x)
+#define PEHR_MISC_78		0x78
+#define  COMPLETION_DATA_CREDITS(x)	FIELD_PREP(GENMASK(15, 0), x)
+#define  COMPLETION_HEADER_CREDITS(x)	FIELD_PREP(GENMASK(27, 16), x)
+#define PEHR_MISC_278		0x278
+#define  SET_TO_DOWNSTREAM		BIT(22)
+#define  ASSERT_INTERNAL_RESET		BIT(31)
+#define PEHR_MISC_280		0x280
+#define  SEL_INTERNAL_RESET		BIT(0)
+
+/**
+ * struct aspeed_pcie_phy - PCIe PHY information
+ * @reg: PCIe host register base address
+ * @clk: PCIe reference clock
+ * @phy: pointer to PHY structure
+ * @platform: platform specific information
+ */
+struct aspeed_pcie_phy {
+	void __iomem *reg;
+	struct clk *clk;
+	struct phy *phy;
+	const struct aspeed_pcie_phy_platform *platform;
+};
+
+/**
+ * struct aspeed_pcie_phy_platform - Platform information
+ * @phy_ops: phy operations
+ */
+struct aspeed_pcie_phy_platform {
+	const struct phy_ops *phy_ops;
+};
+
+static int ast2600_phy_init(struct phy *phy)
+{
+	struct aspeed_pcie_phy *pcie_phy = phy_get_drvdata(phy);
+	int ret;
+
+	ret = clk_prepare_enable(pcie_phy->clk);
+	if (ret)
+		return ret;
+
+	writel(PCIE_UNLOCK, pcie_phy->reg + PEHR_LOCK);
+
+	return 0;
+}
+
+static int aspeed_pcie_phy_exit(struct phy *phy)
+{
+	struct aspeed_pcie_phy *pcie_phy = phy_get_drvdata(phy);
+
+	clk_disable_unprepare(pcie_phy->clk);
+
+	return 0;
+}
+
+static int ast2600_phy_set_mode(struct phy *phy, enum phy_mode mode,
+				int submode)
+{
+	struct aspeed_pcie_phy *pcie_phy = phy_get_drvdata(phy);
+	u32 cfg_val;
+
+	switch (submode) {
+	case PHY_MODE_PCIE_RC:
+		cfg_val = readl(pcie_phy->reg + PEHR_GLOBAL);
+		FIELD_MODIFY(AST2600_PORT_TYPE_MASK, &cfg_val, 0x3);
+		writel(cfg_val, pcie_phy->reg + PEHR_GLOBAL);
+		break;
+	default:
+		dev_err(&phy->dev, "Unsupported submode %d\n", submode);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct phy_ops ast2600_phy_ops = {
+	.init		= ast2600_phy_init,
+	.exit		= aspeed_pcie_phy_exit,
+	.set_mode	= ast2600_phy_set_mode,
+	.owner		= THIS_MODULE,
+};
+
+static int ast2700_phy_init(struct phy *phy)
+{
+	struct aspeed_pcie_phy *pcie_phy = phy_get_drvdata(phy);
+
+	return clk_prepare_enable(pcie_phy->clk);
+}
+
+static int ast2700_phy_set_mode(struct phy *phy, enum phy_mode mode,
+				int submode)
+{
+	struct aspeed_pcie_phy *pcie_phy = phy_get_drvdata(phy);
+	u32 cfg_val;
+
+	switch (submode) {
+	case PHY_MODE_PCIE_RC:
+		writel(0, pcie_phy->reg + PEHR_MISC_278);
+		writel(SEL_INTERNAL_RESET, pcie_phy->reg + PEHR_MISC_280);
+		writel(POSTED_DATA_CREDITS(0xc0) | POSTED_HEADER_CREDITS(0xa),
+		       pcie_phy->reg + PEHR_MISC_70);
+		writel(COMPLETION_DATA_CREDITS(0x30) | COMPLETION_HEADER_CREDITS(0x8),
+		       pcie_phy->reg + PEHR_MISC_78);
+		writel(LOCAL_SCALE_SUP, pcie_phy->reg + PEHR_MISC_58);
+		writel(CONFIG_RC_DEVICE, pcie_phy->reg + PEHR_MISC_5C);
+		cfg_val = readl(pcie_phy->reg + PEHR_MISC_60);
+		FIELD_MODIFY(AST2700_PORT_TYPE_MASK, &cfg_val,
+			     PORT_TYPE_ROOT);
+		writel(cfg_val, pcie_phy->reg + PEHR_MISC_60);
+		writel(ASSERT_INTERNAL_RESET | SET_TO_DOWNSTREAM,
+		       pcie_phy->reg + PEHR_MISC_278);
+		break;
+	default:
+		dev_err(&phy->dev, "Unsupported submode %d\n", submode);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct phy_ops ast2700_phy_ops = {
+	.init		= ast2700_phy_init,
+	.exit		= aspeed_pcie_phy_exit,
+	.set_mode	= ast2700_phy_set_mode,
+	.owner		= THIS_MODULE,
+};
+
+static const struct aspeed_pcie_phy_platform pcie_phy_ast2600 = {
+	.phy_ops = &ast2600_phy_ops,
+};
+
+static const struct aspeed_pcie_phy_platform pcie_phy_ast2700 = {
+	.phy_ops = &ast2700_phy_ops,
+};
+
+static int aspeed_pcie_phy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct phy_provider *phy_provider;
+	struct aspeed_pcie_phy *pcie_phy;
+	const struct aspeed_pcie_phy_platform *md;
+
+	md = of_device_get_match_data(dev);
+	if (!md)
+		return -ENODEV;
+
+	pcie_phy = devm_kzalloc(dev, sizeof(*pcie_phy), GFP_KERNEL);
+	if (!pcie_phy)
+		return -ENOMEM;
+
+	pcie_phy->reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pcie_phy->reg))
+		return PTR_ERR(pcie_phy->reg);
+
+	pcie_phy->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(pcie_phy->clk))
+		return dev_err_probe(dev, PTR_ERR(pcie_phy->clk),
+				     "failed to get clock\n");
+
+	pcie_phy->platform = md;
+
+	pcie_phy->phy = devm_phy_create(dev, dev->of_node,
+					pcie_phy->platform->phy_ops);
+	if (IS_ERR(pcie_phy->phy))
+		return dev_err_probe(dev, PTR_ERR(pcie_phy->phy),
+				     "failed to create PHY\n");
+
+	phy_set_drvdata(pcie_phy->phy, pcie_phy);
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static const struct of_device_id aspeed_pcie_phy_of_match_table[] = {
+	{
+		.compatible = "aspeed,ast2600-pcie-phy",
+		.data = &pcie_phy_ast2600,
+	},
+	{
+		.compatible = "aspeed,ast2700-pcie-phy",
+		.data = &pcie_phy_ast2700,
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, aspeed_pcie_phy_of_match_table);
+
+static struct platform_driver aspeed_pcie_driver = {
+	.probe		= aspeed_pcie_phy_probe,
+	.driver = {
+		.name	= "aspeed-pcie-phy",
+		.of_match_table = aspeed_pcie_phy_of_match_table,
+	},
+};
+
+module_platform_driver(aspeed_pcie_driver);
+
+MODULE_AUTHOR("Jacky Chou <jacky_chou@aspeedtech.com>");
+MODULE_DESCRIPTION("ASPEED PCIe PHY");
+MODULE_LICENSE("GPL");

-- 
2.34.1

