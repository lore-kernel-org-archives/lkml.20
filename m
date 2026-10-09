Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92C546D2B3;
	Fri,  9 Oct 2026 09:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791536712; cv=none; b=GPHr+vtuhN4GoMXSy9rdIBTzgqe7ONdMP6Jd7vk6nn/spVonQ/dqh9/rG3dpYz6G6yu5yOV8DTd1Xn2wgwSJnB6IvfFLmEbPRgYAYL0K3JKe6S+hNDebrRqOc0lYjw0jHDri9rHjg5sbSTfO+QOY//nl+pjDvzNveXtL3rcv3V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791536712; c=relaxed/simple;
	bh=uEz6oWu5dJMtVCXMWKaJmrXkpMUOyMTzsuEcwOqxg6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nhaSVhB7f5mVP3nH/fy/ZcYLJui6UPSBBFC0nO0tdBnt5qd6VSgkJwZvgREdq4bVg6j5nh6RmYHnvwkcl0dhJEkHvPevq8Iz7RNCd9P1knthWP1aNCqxV/CgzyngUHp/IjGCh335BNAdZz1RhGc6JGqyziMmYv3fv+nsjEhiH1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.127])
	by APP-03 (Coremail) with SMTP id rQCowADn5zUyrshqvgohCg--.407S4;
	Fri, 09 Oct 2026 17:04:57 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wei Fu <wefu@redhat.com>,
	Drew Fustini <dfustini@tenstorrent.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>,
	Han Gao <rabenda.cn@gmail.com>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH v3 2/2] phy: add a driver for T-Head TH1520 USB PHY
Date: Fri,  9 Oct 2026 17:04:44 +0800
Message-ID: <20261009090444.3319517-3-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009090444.3319517-1-zhengxingda@iscas.ac.cn>
References: <20261009090444.3319517-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowADn5zUyrshqvgohCg--.407S4
X-Coremail-Antispam: 1UD129KBjvJXoW3GrykAry8trWkAF1DKw1xZrb_yoW3urW3pa
	9xCFWrtr4ktFsIgw4xJr1UCF4Sqay7ta4aqry7G3WrZa43Gryrua98WFW5Zryvvrs7ZrWf
	tr98GFW2kF1UK37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
	vjDU0xZFpf9x0JUQXo7UUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

The USB PHY on T-Head TH1520 SoC is a Synopsys USB 3.0 FemtoPHY, with
some PHY parameters exported as another system controller along with it.

A few PHY parameters have unusable defaults. Add a driver that programs
them before releasing the PHY from reset in addition to
clock/reset/regulator management.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
Changes in v3:
- Use fsleep() to replace udelay(), and add proper inclusion of
  linux/delay.h for this function. (fsleep() suggested by Drew and
  inclusion suggested by Sashiko)
- Adapt Drew's suggestion on the wording of the commit message's 2nd
  paragraph.
Changes in v2:
- Removed unreferenced register names.
- Changed the behavior to leaving bus clock on instead of binding it to
  the regmap.
- Removed early return for reset deassert failure in phy exit callback.
- Tweaked the Kconfig item (removed default value and added "select
  REGMAP_MMIO).

 drivers/phy/Kconfig                |   1 +
 drivers/phy/Makefile               |   1 +
 drivers/phy/thead/Kconfig          |  12 ++
 drivers/phy/thead/Makefile         |   2 +
 drivers/phy/thead/phy-th1520-usb.c | 181 +++++++++++++++++++++++++++++
 5 files changed, 197 insertions(+)
 create mode 100644 drivers/phy/thead/Kconfig
 create mode 100644 drivers/phy/thead/Makefile
 create mode 100644 drivers/phy/thead/phy-th1520-usb.c

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 19f3b7d12b7d4..a05019020ee09 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -200,6 +200,7 @@ source "drivers/phy/st/Kconfig"
 source "drivers/phy/starfive/Kconfig"
 source "drivers/phy/sunplus/Kconfig"
 source "drivers/phy/tegra/Kconfig"
+source "drivers/phy/thead/Kconfig"
 source "drivers/phy/ti/Kconfig"
 source "drivers/phy/xilinx/Kconfig"
 
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index d7aa516bcc49e..0ac5b21477619 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -52,5 +52,6 @@ obj-$(CONFIG_GENERIC_PHY)		+= allwinner/	\
 					   starfive/	\
 					   sunplus/	\
 					   tegra/	\
+					   thead/	\
 					   ti/		\
 					   xilinx/
diff --git a/drivers/phy/thead/Kconfig b/drivers/phy/thead/Kconfig
new file mode 100644
index 0000000000000..ba0ceac54c1b0
--- /dev/null
+++ b/drivers/phy/thead/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config PHY_TH1520_USB
+	tristate "USB PHY driver for T-Head TH1520 SoC"
+	depends on ARCH_THEAD || COMPILE_TEST
+	depends on COMMON_CLK
+	depends on HAS_IOMEM
+	depends on OF
+	depends on RESET_CONTROLLER
+	select GENERIC_PHY
+	select REGMAP_MMIO
+	help
+	  Enable support for the USB PHY on the T-Head TH1520 SoC.
diff --git a/drivers/phy/thead/Makefile b/drivers/phy/thead/Makefile
new file mode 100644
index 0000000000000..5b459bc7004bd
--- /dev/null
+++ b/drivers/phy/thead/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_PHY_TH1520_USB) += phy-th1520-usb.o
diff --git a/drivers/phy/thead/phy-th1520-usb.c b/drivers/phy/thead/phy-th1520-usb.c
new file mode 100644
index 0000000000000..6cb0e51401374
--- /dev/null
+++ b/drivers/phy/thead/phy-th1520-usb.c
@@ -0,0 +1,181 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Institute of Software, Chinese Academy of Sciences (ISCAS)
+ *
+ * Authors:
+ * Icenowy Zheng <zhengxingda@iscas.ac.cn>
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/reset.h>
+
+#define USB_SYSCON_OFFSET		0xf000
+
+/* All the below registers are in the USB syscon region */
+#define USB_SSP_EN			0x34
+#define USB_SSP_EN_REF_SSP_EN		BIT(0)
+
+#define USB_SYS				0x3c
+#define USB_SYS_COMMONONN		BIT(0)
+
+/* The last register according to the manual */
+#define USB_TEST_REG3			0x5c
+
+struct th1520_usb_phy {
+	struct platform_device *pdev;
+	struct phy *phy;
+	struct regmap *regmap;
+	struct clk *ref_clk;
+	struct reset_control *phy_reset;
+};
+
+static int th1520_usb_phy_init(struct phy *phy)
+{
+	struct th1520_usb_phy *th1520_phy = phy_get_drvdata(phy);
+	int ret;
+
+	ret = clk_prepare_enable(th1520_phy->ref_clk);
+	if (ret)
+		return ret;
+
+	ret = reset_control_assert(th1520_phy->phy_reset);
+	if (ret)
+		goto err_disable_clk;
+
+	/*
+	 * Do some initial PHY setup:
+	 * - Set COMMONONN to allow the PHY to automatically power down.
+	 * - Set REF_SSP_EN to enable feeding reference clock to SuperSpeed
+	 *   PHY clock PLL.
+	 */
+	regmap_set_bits(th1520_phy->regmap, USB_SYS, USB_SYS_COMMONONN);
+	regmap_set_bits(th1520_phy->regmap, USB_SSP_EN, USB_SSP_EN_REF_SSP_EN);
+
+	ret = reset_control_deassert(th1520_phy->phy_reset);
+	if (ret)
+		goto err_disable_clk;
+
+	fsleep(10);
+
+	return 0;
+
+err_disable_clk:
+	clk_disable_unprepare(th1520_phy->ref_clk);
+	return ret;
+}
+
+static int th1520_usb_phy_exit(struct phy *phy)
+{
+	struct th1520_usb_phy *th1520_phy = phy_get_drvdata(phy);
+	int ret;
+
+	ret = reset_control_assert(th1520_phy->phy_reset);
+	clk_disable_unprepare(th1520_phy->ref_clk);
+
+	return ret;
+}
+
+static const struct phy_ops th1520_usb_phy_ops = {
+	.init		= th1520_usb_phy_init,
+	.exit		= th1520_usb_phy_exit,
+	.owner		= THIS_MODULE,
+};
+
+static const struct regmap_config phy_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = USB_TEST_REG3,
+};
+
+static int th1520_usb_phy_probe(struct platform_device *pdev)
+{
+	struct phy_provider *phy_provider;
+	struct device *dev = &pdev->dev;
+	struct th1520_usb_phy *th1520_phy;
+	struct reset_control *bus_reset;
+	struct clk *bus_clk;
+	void __iomem *base;
+	int ret;
+
+	th1520_phy = devm_kzalloc(dev, sizeof(*th1520_phy), GFP_KERNEL);
+	if (!th1520_phy)
+		return -ENOMEM;
+
+	th1520_phy->pdev = pdev;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	th1520_phy->ref_clk = devm_clk_get(dev, "ref");
+	if (IS_ERR(th1520_phy->ref_clk))
+		return PTR_ERR(th1520_phy->ref_clk);
+
+	/* Enable the bus clock and leave it that way */
+	bus_clk = devm_clk_get_enabled(dev, "bus");
+	if (IS_ERR(bus_clk))
+		return PTR_ERR(bus_clk);
+
+	/* De-assert the bus reset and leave it that way */
+	bus_reset = devm_reset_control_get_exclusive_deasserted(dev, "bus");
+	if (IS_ERR(bus_reset))
+		return PTR_ERR(bus_reset);
+
+	th1520_phy->phy_reset = devm_reset_control_get_exclusive(dev, "phy");
+	if (IS_ERR(th1520_phy->phy_reset))
+		return PTR_ERR(th1520_phy->phy_reset);
+
+	/*
+	 * Schematics of several boards (Lichee Module 4A/Milk-V Meles)
+	 * describe this power rail as always-on.
+	 */
+	ret = devm_regulator_get_enable(dev, "avdd33-usb3");
+	if (ret)
+		return ret;
+
+	th1520_phy->regmap = devm_regmap_init_mmio(dev,
+						   base + USB_SYSCON_OFFSET,
+						   &phy_regmap_config);
+	if (IS_ERR(th1520_phy->regmap))
+		return dev_err_probe(dev, PTR_ERR(th1520_phy->regmap),
+				     "Failed to init regmap\n");
+
+	th1520_phy->phy = devm_phy_create(dev, dev->of_node, &th1520_usb_phy_ops);
+	if (IS_ERR(th1520_phy->phy)) {
+		dev_err(dev, "failed to create PHY\n");
+		return PTR_ERR(th1520_phy->phy);
+	}
+
+	phy_set_drvdata(th1520_phy->phy, th1520_phy);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static const struct of_device_id th1520_usb_phy_of_table[] = {
+	{ .compatible = "thead,th1520-usb-phy" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, th1520_usb_phy_of_table);
+
+static struct platform_driver th1520_usb_phy_driver = {
+	.driver = {
+		.name = "th1520-usb-phy",
+		.of_match_table = th1520_usb_phy_of_table,
+	},
+	.probe = th1520_usb_phy_probe,
+};
+
+module_platform_driver(th1520_usb_phy_driver);
+
+MODULE_DESCRIPTION("T-Head TH1520 USB PHY driver");
+MODULE_LICENSE("GPL");
-- 
2.55.0

