Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929043BB9E0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476759; cv=none; b=PiEbvqDd7RFANADSLNF97rHvqf1WmjpcYGmtK+bp7KyrWCVPnxJO3oW7lGrgoHU6XrMEmEHFZWIMFhe/ZSfuwdi6sa0diBIejJ84OmurcdUALAjTxe6CudpvfuiUPePOvqZ/h4pBQNNpkgOy/gWJwT8bPU6sIPZHj6KEI4tHc60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476759; c=relaxed/simple;
	bh=TKosStvcDTO5obgERHr8Bfw8JxgQBt7ikfSUeiQSvgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gmjajP5jv+C774wJY1Krsg4VBx27UzM7E5WXeXSNs2EnA37ZzxgDyxplR/bqODs/noe8y/r6ujuTveyQRbpHHP4QlHdCNEo23LogV+3UnEvYRQcUc1q8LV6LMvZc0hjRXu4DBxY/NHUpWTpXzJ+/8NVKHOUTI7vf4m8C3t+8BfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MlNNc2r+; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MlNNc2r+"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c294496989aso562183966b.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789476755; x=1790081555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2C8z0u16/ATPXIQwJTUgp1EH2ZZxhLUD/YnSweKb5A4=;
        b=MlNNc2r+H7YUUJiXWzeuM2F7GY/pNMaWk3+I7M+sSBdGZc5LbMaCAjBkiF2PUhNEf6
         lL0WFVi+lgA/oUdAsz0HOemVVI7+qhqf0HMqpwKQzQGitGXHwDKFyVtFcwQ/pTINwssi
         9TG9cOBTZtrbtk16HR+3pyPMXHN2A1vQhEZ3rmMDrg7Vli5BYQV1uSM5MLFjF2E3TSqz
         MMa3a7fH7t0wmcyKEoNlo8SNUNXHzI3StpvNLUMZBaG/bkdMkMmbY3CYmirF6Dv6ub+R
         eD6CQwlgMue8ysv9lrAeqQUpx5HEKPJD+N4ehSHsIfwp8NWFW5ghP8YtK7SF1Z8lBQbT
         iB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476755; x=1790081555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2C8z0u16/ATPXIQwJTUgp1EH2ZZxhLUD/YnSweKb5A4=;
        b=e9AWKYwj7L96Nbkzwh0QUbIqzPkQDLnJgcairlKgrbM7ERC3I2WaMvkeGyou/VyadX
         jHNmgQ2o+E6zPPLiAEwj9s6fi8aGo/uJGD0gJIaKwNAUD+vMsyGdjK9B66pvHQT+BBXK
         mrQrojUG4tFLyxDcXvoYQrBGFOjkxtOEKsOkTxsKXxaoT0Rvijx2bfJay/NAg3CpzBp4
         wqz+drWUWFqn1ImdA2gaZ4x55x/SXJBmcwWCF0y8P/8o/vTrXXWp598UtCaRten8s23z
         j9hSwt34I6rtJjU3dIOA0qnY00F3WXS3ZXQAeCOvVnDjVllTc+4yFpsNDwMSVhtARGqI
         hCSw==
X-Forwarded-Encrypted: i=1; AKwUvByb1X1pT3gRROEUjrcnqJXSXoaMxEFsTFB163WKbBg5L0J3oDErb59VYel3hqvtz8nX5S4QBEnwFX8ETgo=@vger.kernel.org
X-Gm-Message-State: AFuF++lfNp+LMGh2NzV/y8vhLOjw7tIxCT767TNXHbWx0qLRjEcE+sIa
	XKoON2ceUxQyPkmgI/dlhVXkyos5/vunfOF1RyD2fqhKtJrLbNEbHHeE
X-Gm-Gg: AYBFou0YvIniFt6pgq4hLVK9ecIE03fDHA+BpGdQZsS5b/ddLlxGdetGr0NyGfgOf3e
	nd1vYUgTuxEMUwvcS5hzaqKofHkZSI61DcsdSvJ6TIiKcQE31fn7P1S9S/DSNDN/UI60xqnWeY6
	eu995feqbfNdzdPwF4501tIo85TYI4NpUtnE4GuNKelqIYlKvprTnQjCMrbqrihIEzl9y9yavKj
	TOez0Qt+QXInMQxUG4luGGcnP/cM1+oj6n9TOKc9YZNWJUrW5L+zVYoxrTNkmzCtTPZADSGByRm
	wb8s1FqfuFIFJWzqUddeZ3Blg/8aH5BIlSHHS/PkqxL3WBLRVi4YNyd3xOpv7NzjkUeA6A4VZvv
	EMqsiBWVXNTu0b9VxkQ2u2FXgBil/1IHLIJRJh8v4soDCD8o/VvhUD+yKPtzogmHF/aI0Qt6C6R
	lzddIcudcFiog9Yx6lpq029EdbbelEQK8hRszI0OrDhyn9jCYWZRyvUz08hnPXSRoKwOCE756LL
	y6+6HHeSITS/oSC82tImdcAJEAdHXP5IgIryjj2I+Q27TpQ/gC6jPKDovjLVtCO1A==
X-Received: by 2002:a17:907:dab:b0:c26:1648:a065 with SMTP id a640c23a62f3a-c29b87267demr463483366b.32.1789476755376;
        Tue, 15 Sep 2026 05:52:35 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c296605b9a6sm587969266b.25.2026.09.15.05.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:52:34 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Brian Masney <bmasney@redhat.com>
Subject: [PATCH v2 2/2] clk: en7523: Add support for selecting the Serdes port in SCU
Date: Tue, 15 Sep 2026 14:52:24 +0200
Message-ID: <20260915125226.20579-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915125226.20579-1-ansuelsmth@gmail.com>
References: <20260915125226.20579-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the SCU register for clock and reset, there are also some register to
select the Serdes port mode. The Airoha AN7581 SoC have 4 different Serdes
that can switch between PCIe, USB or Ethernet mode.

Add a simple PHY provider that expose the .set_mode OP to toggle the
requested mode for the Serdes port.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/Kconfig      |   1 +
 drivers/clk/clk-en7523.c | 218 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 216 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 252f6a1f21b8..e0cc4ebafb5e 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -221,6 +221,7 @@ config COMMON_CLK_EN7523
 	bool "Clock driver for Airoha/EcoNet SoC system clocks"
 	depends on OF
 	depends on ARCH_AIROHA || ECONET || COMPILE_TEST
+	select GENERIC_PHY
 	default ARCH_AIROHA
 	help
 	  This driver provides the fixed clocks and gates present on Airoha
diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 5c45aacb6409..24fdec2e6198 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -6,14 +6,18 @@
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
 #include <linux/platform_device.h>
+#include <linux/phy.h>
+#include <linux/phy/phy.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/reset-controller.h>
+#include <linux/spinlock.h>
 #include <dt-bindings/clock/en7523-clk.h>
 #include <dt-bindings/reset/airoha,en7523-reset.h>
 #include <dt-bindings/reset/airoha,en7581-reset.h>
 #include <dt-bindings/clock/econet,en751221-scu.h>
 #include <dt-bindings/reset/econet,en751221-scu.h>
+#include <dt-bindings/soc/airoha,scu-ssr.h>
 
 #define RST_NR_PER_BANK			32
 
@@ -40,9 +44,22 @@
 #define   REG_HIR_MASK			GENMASK(31, 16)
 /* EN7581 */
 #define REG_NP_SCU_PCIC			0x88
+#define REG_NP_SCU_SSR3			0x94
+#define REG_SSUSB_HSGMII_SEL_MASK	BIT(29)
+#define REG_SSUSB_HSGMII_SEL_HSGMII	FIELD_PREP_CONST(REG_SSUSB_HSGMII_SEL_MASK, 0x0)
+#define REG_SSUSB_HSGMII_SEL_USB	FIELD_PREP_CONST(REG_SSUSB_HSGMII_SEL_MASK, 0x1)
 #define REG_NP_SCU_SSTR			0x9c
 #define REG_PCIE_XSI0_SEL_MASK		GENMASK(14, 13)
+#define REG_PCIE_XSI0_SEL_PCIE		FIELD_PREP_CONST(REG_PCIE_XSI0_SEL_MASK, 0x0)
+#define REG_PCIE_XSI0_SEL_XFI		FIELD_PREP_CONST(REG_PCIE_XSI0_SEL_MASK, 0x1)
+#define REG_PCIE_XSI0_SEL_HSGMII	FIELD_PREP_CONST(REG_PCIE_XSI0_SEL_MASK, 0x2)
 #define REG_PCIE_XSI1_SEL_MASK		GENMASK(12, 11)
+#define REG_PCIE_XSI1_SEL_PCIE		FIELD_PREP_CONST(REG_PCIE_XSI1_SEL_MASK, 0x0)
+#define REG_PCIE_XSI1_SEL_XFI		FIELD_PREP_CONST(REG_PCIE_XSI1_SEL_MASK, 0x1)
+#define REG_PCIE_XSI1_SEL_HSGMII	FIELD_PREP_CONST(REG_PCIE_XSI1_SEL_MASK, 0x2)
+#define REG_USB_PCIE_SEL_MASK		BIT(3)
+#define REG_USB_PCIE_SEL_PCIE		FIELD_PREP_CONST(REG_USB_PCIE_SEL_MASK, 0x0)
+#define REG_USB_PCIE_SEL_USB		FIELD_PREP_CONST(REG_USB_PCIE_SEL_MASK, 0x1)
 #define REG_CRYPTO_CLKSRC2		0x20c
 /* EN751221 */
 #define EN751221_REG_SPI_DIV		0x0cc
@@ -82,6 +99,8 @@ enum en_hir {
 	HIR_MAX		= 14,
 };
 
+#define EN_SERDES_PHY_NUM		4
+
 struct en_clk_desc {
 	int id;
 	const char *name;
@@ -114,6 +133,18 @@ struct en_rst_data {
 	struct reset_controller_dev rcdev;
 };
 
+struct en_serdes_phy_instance {
+	struct phy *phy;
+	unsigned int serdes_port;
+};
+
+struct en_clk_priv {
+	void __iomem *base;
+	/* protect SCU register */
+	spinlock_t lock;
+	struct en_serdes_phy_instance *serdes_phys[EN_SERDES_PHY_NUM];
+};
+
 struct en_clk_soc_data {
 	u32 num_clocks;
 	const struct clk_ops pcie_ops;
@@ -847,12 +878,179 @@ static int en7581_reset_register(struct device *dev, void __iomem *base,
 	return devm_reset_controller_register(dev, &rst_data->rcdev);
 }
 
+static int en7581_serdes_phy_set_mode(struct phy *phy, enum phy_mode mode,
+				      int submode)
+{
+	struct en_serdes_phy_instance *instance = phy_get_drvdata(phy);
+	struct en_clk_priv *priv = dev_get_drvdata(phy->dev.parent);
+	u32 reg, mask, sel, val;
+	unsigned long flags;
+
+	switch (instance->serdes_port) {
+	case AIROHA_SCU_SERDES_PCIE1:
+		reg = REG_NP_SCU_SSTR;
+		mask = REG_PCIE_XSI0_SEL_MASK;
+
+		if (mode != PHY_MODE_ETHERNET && mode != PHY_MODE_PCIE)
+			return -EINVAL;
+
+		if (mode == PHY_MODE_ETHERNET) {
+			switch (submode) {
+			case PHY_INTERFACE_MODE_USXGMII:
+			case PHY_INTERFACE_MODE_10GBASER:
+				sel = REG_PCIE_XSI0_SEL_XFI;
+				break;
+			case PHY_INTERFACE_MODE_SGMII:
+			case PHY_INTERFACE_MODE_1000BASEX:
+			case PHY_INTERFACE_MODE_2500BASEX:
+				sel = REG_PCIE_XSI0_SEL_HSGMII;
+				break;
+			default:
+				return -EINVAL;
+			}
+		} else {
+			sel = REG_PCIE_XSI0_SEL_PCIE;
+		}
+
+		break;
+	case AIROHA_SCU_SERDES_PCIE2:
+		reg = REG_NP_SCU_SSTR;
+		mask = REG_PCIE_XSI1_SEL_MASK;
+
+		if (mode != PHY_MODE_ETHERNET && mode != PHY_MODE_PCIE)
+			return -EINVAL;
+
+		if (mode == PHY_MODE_ETHERNET) {
+			switch (submode) {
+			case PHY_INTERFACE_MODE_USXGMII:
+			case PHY_INTERFACE_MODE_10GBASER:
+				sel = REG_PCIE_XSI1_SEL_XFI;
+				break;
+			case PHY_INTERFACE_MODE_SGMII:
+			case PHY_INTERFACE_MODE_1000BASEX:
+			case PHY_INTERFACE_MODE_2500BASEX:
+				sel = REG_PCIE_XSI1_SEL_HSGMII;
+				break;
+			default:
+				return -EINVAL;
+			}
+		} else {
+			sel = REG_PCIE_XSI1_SEL_PCIE;
+		}
+
+		break;
+	case AIROHA_SCU_SERDES_USB1:
+		reg = REG_NP_SCU_SSR3;
+		mask = REG_SSUSB_HSGMII_SEL_MASK;
+
+		if (mode != PHY_MODE_ETHERNET && mode != PHY_MODE_USB_DEVICE &&
+		    mode != PHY_MODE_USB_DEVICE_SS)
+			return -EINVAL;
+
+		if (mode == PHY_MODE_ETHERNET)
+			sel = REG_SSUSB_HSGMII_SEL_HSGMII;
+		else
+			sel = REG_SSUSB_HSGMII_SEL_USB;
+
+		break;
+	case AIROHA_SCU_SERDES_USB2:
+		reg = REG_NP_SCU_SSTR;
+		mask = REG_USB_PCIE_SEL_MASK;
+
+		if (mode != PHY_MODE_PCIE && mode != PHY_MODE_USB_DEVICE &&
+		    mode != PHY_MODE_USB_DEVICE_SS)
+			return -EINVAL;
+
+		if (mode == PHY_MODE_PCIE)
+			sel = REG_USB_PCIE_SEL_PCIE;
+		else
+			sel = REG_USB_PCIE_SEL_USB;
+
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	spin_lock_irqsave(&priv->lock, flags);
+	val = readl(priv->base + reg);
+	val &= ~mask;
+	val |= sel;
+	writel(val, priv->base + reg);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	return 0;
+}
+
+static const struct phy_ops en7581_serdes_phy_ops = {
+	.set_mode	= en7581_serdes_phy_set_mode,
+	.owner		= THIS_MODULE,
+};
+
+static struct phy *en7581_serdes_phy_xlate(struct device *dev,
+					   const struct of_phandle_args *args)
+{
+	struct en_clk_priv *priv = dev_get_drvdata(dev);
+	struct en_serdes_phy_instance *instance;
+	unsigned int serdes_port;
+
+	if (args->args_count != 1) {
+		dev_err(dev, "invalid number of cells in 'phy' property\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	serdes_port = args->args[0];
+	if (serdes_port >= EN_SERDES_PHY_NUM) {
+		dev_err(dev, "invalid serdes port: %d\n", serdes_port);
+		return ERR_PTR(-EINVAL);
+	}
+
+	instance = priv->serdes_phys[serdes_port];
+	if (!instance) {
+		dev_err(dev, "failed to find appropriate serdes phy\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	return instance->phy;
+}
+
+static int en7581_serdes_phy_register(struct device *dev)
+{
+	struct en_clk_priv *priv = dev_get_drvdata(dev);
+	struct phy_provider *phy_provider;
+	int i;
+
+	for (i = 0; i < EN_SERDES_PHY_NUM; i++) {
+		struct en_serdes_phy_instance *instance;
+
+		instance = devm_kzalloc(dev, sizeof(*instance),
+					GFP_KERNEL);
+		if (!instance)
+			return -ENOMEM;
+
+		instance->phy = devm_phy_create(dev, NULL,
+						&en7581_serdes_phy_ops);
+		if (IS_ERR(instance->phy))
+			return dev_err_probe(dev, PTR_ERR(instance->phy), "failed to create phy\n");
+
+		instance->serdes_port = i;
+		priv->serdes_phys[i] = instance;
+
+		phy_set_drvdata(instance->phy, instance);
+	}
+
+	phy_provider = devm_of_phy_provider_register(dev, en7581_serdes_phy_xlate);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
 static int en7581_clk_hw_init(struct platform_device *pdev,
 			      struct clk_hw_onecell_data *clk_data)
 {
+	struct en_clk_priv *priv = platform_get_drvdata(pdev);
 	struct regmap *map;
 	void __iomem *base;
 	u32 val;
+	int ret;
 
 	map = syscon_regmap_lookup_by_compatible("airoha,en7581-chip-scu");
 	if (IS_ERR(map))
@@ -862,6 +1060,8 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
+	priv->base = base;
+
 	en7581_register_clocks(&pdev->dev, clk_data, map, base);
 
 	val = readl(base + REG_NP_SCU_SSTR);
@@ -876,9 +1076,12 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
 	val &= ~REG_PCIE_HB_RST;
 	writel(val, base + REG_RST_CTRL1);
 
-	return en7581_reset_register(&pdev->dev, base, en7581_rst_map,
-				     ARRAY_SIZE(en7581_rst_map),
-				     en7581_rst_ofs);
+	ret = en7581_reset_register(&pdev->dev, base, en7581_rst_map,
+				    ARRAY_SIZE(en7581_rst_map), en7581_rst_ofs);
+	if (ret)
+		return ret;
+
+	return en7581_serdes_phy_register(&pdev->dev);
 }
 
 static enum en_hir get_hw_id(void __iomem *np_base)
@@ -985,16 +1188,25 @@ static int en7523_clk_probe(struct platform_device *pdev)
 	struct device_node *node = pdev->dev.of_node;
 	const struct en_clk_soc_data *soc_data;
 	struct clk_hw_onecell_data *clk_data;
+	struct en_clk_priv *priv;
 	int r;
 
 	soc_data = device_get_match_data(&pdev->dev);
 
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	spin_lock_init(&priv->lock);
+
 	clk_data = devm_kzalloc(&pdev->dev,
 				struct_size(clk_data, hws, soc_data->num_clocks),
 				GFP_KERNEL);
 	if (!clk_data)
 		return -ENOMEM;
 
+	platform_set_drvdata(pdev, priv);
+
 	clk_data->num = soc_data->num_clocks;
 	r = soc_data->hw_init(pdev, clk_data);
 	if (r)
-- 
2.53.0

