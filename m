Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838524;
	b=FUgo/4x3jq2wgm3eWd6cAhOgbiEYm8Xk/ULkjpHXlI0xkg3n16E7aaVwczvLZNiEhsnX
	 xHQ/Us/cKWz4z4rTx0j/f2rxcAeJ5OW/6B5hzMJ/rQ6qBuP5ROFXy925WAB30uwDzj10E
	 3BNU9WscQc+jNq647vPelJnNm0o3xSDK44ko3xwHwkAjFrSHsWRWpfhUJiuNQORm/5JAr
	 sKC1/Jn3Z/03f7jaVmBMH1tR4EAQ/Sl/mFQjm275bcKAhuI9CXojYlFq0lERHU/MCklct
	 oQ9QYQ3kJfDptPfdcieUYqKn7pcIIb3IGdw2m0qiT0loQ/KlH7SSclBzVr30+Wq44rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838524;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=rWs4H6vt3oOj0DVbcxQ48oJIrZ+cy4RFgQO8xRAG8RE=;
	b=WIjJ0muDcWEs5vbkcsRHLh3CxvXNgFX5ZY5dRZ6IXJ3SLId4g3EHUh0ROWj3KGxHMm1/
	 7ec4pmUH+xcfAQcp9/QKf2AzKWiBVpzGJCEED+vbhiD9iWza+/W8H1zKi3am8hwIwSxKH
	 sh9GS2Yzmbz4CnzXsAsB/uNhAQpx1qQI42nO96/MnJDnC+dys3WmmdXRmz5LEzZtBhzZK
	 EWTITBm8/q5diQHqRlPM74FMvYXgpLkVkYjfv54hkq03+PEWbsRv0i3UfYI/1AmCw3VbH
	 hrhE/CScivhKk4bmT6wDxbITiZnRpD3EHqkxxjuRizzPGQkR5F603nWfNYTFFf4z8zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UaM5tGF2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE800606A323;
	Mon, 16 Nov 2026 14:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UaM5tGF2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD9281F000CE;
	Mon, 16 Nov 2026 14:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794838524;
	bh=rWs4H6vt3oOj0DVbcxQ48oJIrZ+cy4RFgQO8xRAG8RE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UaM5tGF2OsM6QZFo1iEwCEof8sxDoBogHd5u5FE1qcPnm9QV8Y53aEwKBKW6hT0yN
	 ddfWd6fNUa+KWw2829JwD1TSCgoRRIhNH3uJXxTmz7Ny7Syjoi5g4B979JrVN8DWnN
	 k+mOULB9X0bWIhhfezNtrMPTX+RpdSw1ey0mZu5iKP5Nb5mTRrwJYUSzfvJZJRml4N
	 nycgt2fiqkyRhsh7PCQlzpS5/omn88WP0Z/RCmhyBUleGc1rivRNG3G3g3hbPIRyay
	 gDToFtY8WtzRo6WCJaeDyiKrBcySpx2nOgivWKAJNqpm1hCNvzTS/wplAy9nIYPOt3
	 WZpOqytQ5N1Rw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/8] net: stmmac: Add glue layer for Synaptics SL2610 SoC
Date: Mon, 16 Nov 2026 21:54:38 +0800
Message-ID: <20261116135442.4827-5-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116135442.4827-1-jszhang@kernel.org>
References: <20261116135442.4827-1-jszhang@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dwmac glue driver to support the DesignWare-based GMAC controllers
in the Synaptics SL2610 SoC.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 MAINTAINERS                                   |   2 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../net/ethernet/stmicro/stmmac/dwmac-syna.c  | 116 ++++++++++++++++++
 4 files changed, 130 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-syna.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 430758242906..dba0288bf4da 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3808,12 +3808,14 @@ M:	Jisheng Zhang <jszhang@kernel.org>
 M:	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/net/syna,sl2610-dwmac.yaml
 F:	Documentation/devicetree/bindings/soc/synaptics/
 F:	arch/arm/boot/dts/synaptics/
 F:	arch/arm/mach-berlin/
 F:	arch/arm64/boot/dts/synaptics/
 F:	drivers/clk/berlin/*sl2610*
 F:	drivers/clk/berlin/sl-*
+F:	drivers/net/ethernet/stmicro/stmmac/dwmac-syna.c
 F:	drivers/pinctrl/berlin/pinctrl-sl2610.c
 F:	drivers/reset/reset-sl2610.c
 F:	drivers/soc/synaptics/
diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index c6559e749c0c..79ffebcaba0e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -310,6 +310,17 @@ config DWMAC_SUN55I
 	  stmmac device driver. This driver is used for A523/T527
 	  GMAC200 ethernet controller.
 
+config DWMAC_SYNA
+	tristate "Synaptics SL2610 DWMAC support"
+	depends on OF && HAS_DMA && (ARCH_BERLIN || COMPILE_TEST)
+	select MFD_SYSCON
+	help
+	  Support for the Synaptics SL2610 DesignWare Ethernet MAC glue.
+	  This configures the PHY interface through the system controller.
+
+	  To compile this driver as a module, choose M here. The module
+	  will be called dwmac-syna.
+
 config DWMAC_THEAD
 	tristate "T-HEAD dwmac support"
 	depends on OF && (ARCH_THEAD || COMPILE_TEST)
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index b16a456b730e..d132353e9403 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -35,6 +35,7 @@ obj-$(CONFIG_DWMAC_STM32)	+= dwmac-stm32.o
 obj-$(CONFIG_DWMAC_SUNXI)	+= dwmac-sunxi.o
 obj-$(CONFIG_DWMAC_SUN8I)	+= dwmac-sun8i.o
 obj-$(CONFIG_DWMAC_SUN55I)	+= dwmac-sun55i.o
+obj-$(CONFIG_DWMAC_SYNA)	+= dwmac-syna.o
 obj-$(CONFIG_DWMAC_THEAD)	+= dwmac-thead.o
 obj-$(CONFIG_DWMAC_ULTRARISC)	+= dwmac-ultrarisc.o
 obj-$(CONFIG_DWMAC_DWC_QOS_ETH)	+= dwmac-dwc-qos-eth.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-syna.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-syna.c
new file mode 100644
index 000000000000..c4bc895b29da
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-syna.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Synaptics DWMAC platform driver
+ *
+ * Copyright (C) 2026 Jisheng Zhang <jszhang@kernel.org>
+ *
+ */
+
+#include <linux/bitfield.h>
+#include <linux/module.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_net.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include "stmmac_platform.h"
+
+#define CTL_PHY_INTF_SEL	GENMASK(4, 1)
+#define CTL_PHY_INTF_RGMII	FIELD_PREP(CTL_PHY_INTF_SEL, 1)
+#define CTL_PHY_INTF_RMII	FIELD_PREP(CTL_PHY_INTF_SEL, 4)
+
+struct syna_dwmac {
+	struct plat_stmmacenet_data *plat;
+	struct regmap *regmap;
+	u32 rgmii_ctl;
+	struct device *dev;
+};
+
+static int syna_dwmac_set_phy_if(struct plat_stmmacenet_data *plat)
+{
+	struct syna_dwmac *dwmac = plat->bsp_priv;
+	u32 phyif;
+
+	switch (plat->phy_interface) {
+	case PHY_INTERFACE_MODE_RMII:
+		phyif = CTL_PHY_INTF_RMII;
+		break;
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+		phyif = CTL_PHY_INTF_RGMII;
+		break;
+	default:
+		dev_err(dwmac->dev, "unsupported phy interface %s\n",
+			phy_modes(plat->phy_interface));
+		return -EINVAL;
+	}
+
+	return regmap_update_bits(dwmac->regmap, dwmac->rgmii_ctl, CTL_PHY_INTF_SEL, phyif);
+}
+
+static int syna_dwmac_init(struct device *dev, void *priv)
+{
+	struct syna_dwmac *dwmac = priv;
+
+	return syna_dwmac_set_phy_if(dwmac->plat);
+}
+
+static int syna_dwmac_probe(struct platform_device *pdev)
+{
+	struct stmmac_resources stmmac_res;
+	struct plat_stmmacenet_data *plat;
+	struct syna_dwmac *dwmac;
+	int ret;
+
+	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to get resources\n");
+
+	plat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	if (IS_ERR(plat))
+		return dev_err_probe(&pdev->dev, PTR_ERR(plat),
+				     "dt configuration failed\n");
+
+	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
+	if (!dwmac)
+		return -ENOMEM;
+
+	dwmac->regmap = syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node,
+							     "syna,syscon", 1,
+							     &dwmac->rgmii_ctl);
+	if (IS_ERR(dwmac->regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->regmap),
+				     "Failed to get syscon regmap\n");
+
+	dwmac->dev = &pdev->dev;
+	dwmac->plat = plat;
+	plat->bsp_priv = dwmac;
+	plat->init = syna_dwmac_init;
+
+	return devm_stmmac_pltfr_probe(pdev, plat, &stmmac_res);
+}
+
+static const struct of_device_id syna_dwmac_match[] = {
+	{ .compatible = "syna,sl2610-dwmac" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, syna_dwmac_match);
+
+static struct platform_driver syna_dwmac_driver = {
+	.probe = syna_dwmac_probe,
+	.driver = {
+		.name = "syna-dwmac",
+		.pm = &stmmac_pltfr_pm_ops,
+		.of_match_table = syna_dwmac_match,
+	},
+};
+module_platform_driver(syna_dwmac_driver);
+
+MODULE_AUTHOR("Jisheng Zhang <jszhang@kernel.org>");
+MODULE_DESCRIPTION("Synaptics DWMAC platform driver");
+MODULE_LICENSE("GPL");
-- 
2.55.0

