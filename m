Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94255486BAB
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962590; cv=none; b=cHZLZudefcpVoR3q5925g0pucrIjX67yeocJ2zFuaXvMDkXWhdlL3MGReoi7rTC4EXcRe5wHcGlhLqlxQa+6JJ8oeiTOVHYE1eJyR2Vfe1/DYPzl7e5MLaDojVor52RLkQyOMl/uTdVqnBgiGLD1GaA0i7HDAG9ZmsAjM0OV9QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962590; c=relaxed/simple;
	bh=mHhSEslP0EqP9BLQfbu6NTQkBgNOvcb0OxIddOwk/AU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HaEZQCHMETujnGhO+0t7Rmn5/X0J2T7DKnzvQ8AEvWFgxVHvmLkWaDkGv2fYQFRZ7h0tFqdk5Sx2EZjjrEe4PJMtYVge2oz0TDxoFk6o4u7E6kvRx5echjg6AIglOI7LlVjdkNkqDygvI49JzmL7JkEBRWLlmXaW7jgUHsrixGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZbHZL9kP; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbHZL9kP"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso34871055e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962583; x=1792567383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rI7TsTerh3v+6374ARnTnPJ5az3i60OfV5pa17I1CSc=;
        b=ZbHZL9kPK1j2NsOU6gaNJiGUpQa3u0IH68qs7fC59VcVl4+LCljAUq0ceCj8K0KY/a
         W/0K3JDiJPpfXPc74eAi7zxlcyRl3Qk6xxocRYG85Z66LDrDAlXWtVwz8vKpGdCxfR3h
         qDWgPBkQQbl+g+gz1F6uMLWC2LsgiqDWE0QOCRmBYU9EMzvoOjyen4DNiEwmg+YC1yD3
         OnvDRVCeZiPoRRdzvU/9Bz8ZypFJhJ7MuWaJYYrL/YKp2af70s1sgqQCaX+XVbvpkZrF
         q/QYofqCZI810goAA2/vtBZwBvxPYMi3RyG/Ysw4hM2RiRiAodGrCprlmfD2T+JgLjYH
         RDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962583; x=1792567383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rI7TsTerh3v+6374ARnTnPJ5az3i60OfV5pa17I1CSc=;
        b=Z9H24W56n1ALP7lF7WYaG4wfYikXxtvcHF+IVAAfdvjn5TfAf1Qyjm1482+XlLKG8T
         EDwWmJv2UeN8gvO+/iAOzjbstX2hjfAdQ9VN7JJZ4+w1e9NBUOwjwHvIgJOkKXzGJWFf
         DdXWNuHqHJvDEw/PRQ/y/WcIYsxZUfdkDbC3Efuar0TV/aAdUagHNLi9MM/+zEahENzb
         p1rKCLIKzYzcu/0g3dMHiFYzeKeg5yawehUK9z+XZM3hxtOYzF6GTNzWlZVNxEFXl0rN
         D4pAohPdtKwT6bAGqYZI7GVZ8cduqowYzqy0TVdtg8cnM++kEs6gf30XOUAHdixLjQez
         OYqA==
X-Forwarded-Encrypted: i=1; AKwUvBz/n1kgslEM5SsHuldolubMSeXfel2z4xMiIkLxzAsGYQ9MarSI3/beHjOnw5qqICm5Ir0XOiioGpvu4KI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIH34NlNhK0/8txw3qJMDPDhNaNI5f0Cb1xUo2PnYfTTq5n/EiK
	MQQFyer9GFAMlRXHBFTvJzlBAeRTjELxriarAA3eqSMRYd2pcUUPUHm+
X-Gm-Gg: AYBFou1JLq4rfbiwHT5s+QkY/eRoVCnM6QxTJzX8disLQQ0Wz4s5PvbGRBTqM+WmJwz
	aqTtsEQWfciGWHtgEOBmnUVLaHGTOOAIJrs91vofzGVitNEUyjp03vjWYK5XUhL1Xna8c8xvgAa
	gtFiAtcPDgA2n8A7T9zSPCLtVj9fWfjR3hhRbMSIQrvQhbNRcidy3Tl6AWMCEdVzZodAU/qt5ln
	Ne5yixw/fHG9LtPlQYssOPbH7akPz7Zf17bC1VY4UubcjxEnzeOurJbOQKR7DjHI3PRBxUd3Aq8
	S+HJy0MfEtN1dZWydNdWk0mfdvbkbIxQRC0k9BkQAWZeuZP+5ScHbJraNszGncpTGH6iarvC5GM
	ceOM+ydq+CHDGIeGKrXLCqy9wfo0frV2gJYer9VKbv9iFfv8h1VC75qGGUovUI3t+F8sMZOU1RZ
	+4Wc3Iow2pJkyLfi/zp7/9FxvzcE9WQcCfFzZZSHCx9A2QQy/uo3YL+iEnkiFjacEuUErg4MZ6x
	z4BIRhjvr3FJtuC42TNCVYrKn5BiKkoSBoz1KMTSJhUo8WuX9V+32glPYmJOGEDVlgUnhKyWOBn
	hyOec3fCAGbP7REkswkl2BnvD9pFDY6E2lBDoqbLHJvHZ9jm0AQR8tivOLf+JA==
X-Received: by 2002:a05:600c:3e8d:b0:4a1:7701:f863 with SMTP id 5b1f17b1804b1-4a18e4aeae4mr269940335e9.15.1791962583469;
        Wed, 14 Oct 2026 00:23:03 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:23:03 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v2 11/24] phy: zte: Add ZTE ZX279128S PCIe PHY driver
Date: Wed, 14 Oct 2026 08:20:51 +0100
Message-ID: <20261014072109.1759502-12-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a generic PHY driver for the PCIe SerDes PHY inside the Top CRM
block of the ZTE ZX279128S SoC. This driver encapsulates PLL power
and analog SerDes calibration for the two PCIe ports, isolating
these hardware details from the PCIe host controller driver.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 drivers/phy/Kconfig              |  12 +++
 drivers/phy/Makefile             |   1 +
 drivers/phy/phy-zx279128s-pcie.c | 156 +++++++++++++++++++++++++++++++
 3 files changed, 169 insertions(+)
 create mode 100644 drivers/phy/phy-zx279128s-pcie.c

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 19f3b7d12b..3518d384be 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -91,6 +91,18 @@ config PHY_ECONET_PCIE
 	  callback for PCIe GEN1 and GEN2 ports. This PHY is found on
 	  EcoNet SoCs including EN751221 and EN7528.
 
+config PHY_ZX279128S_PCIE
+	tristate "ZTE ZX279128S PCIe PHY driver"
+	depends on ARCH_ZTE || COMPILE_TEST
+	depends on OF
+	select GENERIC_PHY
+	select MFD_SYSCON
+	help
+	  Enable support for the PCIe SerDes PHY found inside the Top CRM
+	  of ZTE ZX279128S SoCs. This driver configures PLL power and analog
+	  calibration for the two PCIe ports.
+	  If you say Y or M here, you will enable PCIe PHY initialization.
+
 config PHY_GOOGLE_USB
 	tristate "Google Tensor SoC USB PHY driver"
 	select GENERIC_PHY
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index d7aa516bcc..1323aa817f 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -19,6 +19,7 @@ obj-$(CONFIG_PHY_NXP_TJA1145)		+= phy-nxp-tja1145.o
 obj-$(CONFIG_PHY_PISTACHIO_USB)		+= phy-pistachio-usb.o
 obj-$(CONFIG_PHY_SNPS_EUSB2)		+= phy-snps-eusb2.o
 obj-$(CONFIG_PHY_XGENE)			+= phy-xgene.o
+obj-$(CONFIG_PHY_ZX279128S_PCIE)	+= phy-zx279128s-pcie.o
 
 obj-$(CONFIG_GENERIC_PHY)		+= allwinner/	\
 					   amlogic/	\
diff --git a/drivers/phy/phy-zx279128s-pcie.c b/drivers/phy/phy-zx279128s-pcie.c
new file mode 100644
index 0000000000..33bf0eaac8
--- /dev/null
+++ b/drivers/phy/phy-zx279128s-pcie.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ZTE zx279128s PCIe PHY driver
+ *
+ * Controls the analog SerDes and PLL for the two PCIe ports inside the
+ * Top CRM block.
+ *
+ * Copyright (C) 2026 Navid Ghahremani <ghahramani.navid@gmail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#define CRM1_PHY_CTRL		0x008
+#define CRM1_MISC		0x024
+#define CRM1_MISC_BIT26		BIT(26)
+#define CRM1_PHY1_CAL0		0x1b0
+#define CRM1_PHY1_CAL1		0x1b4
+
+struct zx_pcie_phy_port {
+	u32 phy_on[3];
+	bool has_cal;
+};
+
+static const struct zx_pcie_phy_port zx_phy_ports[] = {
+	[0] = {
+		.phy_on = { BIT(15), BIT(13), BIT(14) },
+	},
+	[1] = {
+		.phy_on = { BIT(27), BIT(25), BIT(26) },
+		.has_cal = true,
+	},
+};
+
+struct zx_pcie_phy {
+	struct regmap *regmap;
+	const struct zx_pcie_phy_port *port;
+	unsigned int port_id;
+};
+
+static int zx_pcie_phy_init(struct phy *phy)
+{
+	struct zx_pcie_phy *zphy = phy_get_drvdata(phy);
+	const struct zx_pcie_phy_port *port = zphy->port;
+	int i, ret;
+
+	for (i = 0; i < ARRAY_SIZE(port->phy_on); i++) {
+		ret = regmap_write_bits(zphy->regmap, CRM1_PHY_CTRL,
+					port->phy_on[i], port->phy_on[i]);
+		if (ret)
+			return ret;
+		fsleep(50);
+
+		if (i == 0 && port->has_cal) {
+			ret = regmap_write(zphy->regmap, CRM1_PHY1_CAL1, 0x00202d5a);
+			if (ret)
+				return ret;
+			ret = regmap_write(zphy->regmap, CRM1_PHY1_CAL0, 0x0046c24a);
+			if (ret)
+				return ret;
+		}
+	}
+
+	ret = regmap_write_bits(zphy->regmap, CRM1_MISC, CRM1_MISC_BIT26, 0);
+	if (ret)
+		return ret;
+	fsleep(50);
+
+	return 0;
+}
+
+static int zx_pcie_phy_exit(struct phy *phy)
+{
+	struct zx_pcie_phy *zphy = phy_get_drvdata(phy);
+	const struct zx_pcie_phy_port *port = zphy->port;
+	int i, ret;
+
+	for (i = ARRAY_SIZE(port->phy_on) - 1; i >= 0; i--) {
+		ret = regmap_write_bits(zphy->regmap, CRM1_PHY_CTRL,
+					port->phy_on[i], 0);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct phy_ops zx_pcie_phy_ops = {
+	.init = zx_pcie_phy_init,
+	.exit = zx_pcie_phy_exit,
+	.owner = THIS_MODULE,
+};
+
+static int zx_pcie_phy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct phy_provider *provider;
+	struct zx_pcie_phy *zphy;
+	struct phy *phy;
+	u32 port_id;
+	int ret;
+
+	zphy = devm_kzalloc(dev, sizeof(*zphy), GFP_KERNEL);
+	if (!zphy)
+		return -ENOMEM;
+
+	ret = of_property_read_u32(dev->of_node, "reg", &port_id);
+	if (ret)
+		return dev_err_probe(dev, ret, "missing reg property\n");
+
+	if (port_id >= ARRAY_SIZE(zx_phy_ports))
+		return dev_err_probe(dev, -EINVAL, "invalid port id %u\n", port_id);
+
+	zphy->port_id = port_id;
+	zphy->port = &zx_phy_ports[port_id];
+
+	zphy->regmap = syscon_node_to_regmap(dev->parent->of_node);
+	if (IS_ERR(zphy->regmap))
+		return dev_err_probe(dev, PTR_ERR(zphy->regmap),
+				     "failed to get parent topcrm regmap\n");
+
+	phy = devm_phy_create(dev, dev->of_node, &zx_pcie_phy_ops);
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, PTR_ERR(phy), "failed to create phy\n");
+
+	phy_set_drvdata(phy, zphy);
+
+	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	return PTR_ERR_OR_ZERO(provider);
+}
+
+static const struct of_device_id zx_pcie_phy_of_match[] = {
+	{ .compatible = "zte,zx279128s-pcie-phy" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, zx_pcie_phy_of_match);
+
+static struct platform_driver zx_pcie_phy_driver = {
+	.probe = zx_pcie_phy_probe,
+	.driver = {
+		.name = "zx279128s-pcie-phy",
+		.of_match_table = zx_pcie_phy_of_match,
+		.suppress_bind_attrs = true,
+	},
+};
+builtin_platform_driver(zx_pcie_phy_driver);
+
+MODULE_AUTHOR("Navid Ghahremani <ghahramani.navid@gmail.com>");
+MODULE_DESCRIPTION("ZTE ZX279128S PCIe PHY driver");
+MODULE_LICENSE("GPL");
-- 
2.55.0

