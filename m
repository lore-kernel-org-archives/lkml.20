Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284B239DBC9;
	Sat,  3 Oct 2026 20:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791060669; cv=none; b=JuCe18q2yE2lnMm6An4Ko8i0ssvDWwSfsQY+NIB/Q8BznXyPP8jBYnnq94FIOAN5RnO9x62RWY3buwcIukhAoExQ39m6YAgkPmdDt5UwnfKDMzfV7cs7cGOhfx5+9Sqs67U8Ul/woQmdm+WWwrljtm+DldlNeoQSNm0MnoVDF24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791060669; c=relaxed/simple;
	bh=p9kUDQC+liQdhVRC2vDNz0MNG47XUhNV1FWnW0LOitU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rLkx8T2R2BQ26Sp1Cn3BIsW1cgh/XvywFBLtpDHlFWAZdsxL83h+vd2/HWg3oVxZufgHUlZiTy4I7OaCTqP5gfWnhK0FPlHrvvNYs2S/GZzu+9tpbgeC5n/zc5Qi+8tze+4kQbHG55bl0R9QGidZxw3aGAnczv1pg9ptZOv/jAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZPbAgDGr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZPbAgDGr"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B14AEC4AF12;
	Sat,  3 Oct 2026 20:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791060668;
	bh=p9kUDQC+liQdhVRC2vDNz0MNG47XUhNV1FWnW0LOitU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZPbAgDGrEawgyV5BOB/dXOowV3JSA6xEsvCP6fLTRls/Jv/ICZ2Py0liPHqGxsgXO
	 Qgmk1LawwQ1ARMtiJFznxX1w4VW6eKQS9uZKxVJoE291bNpK59JbRlVmYAudF+yQ2F
	 Jas2qx96KAuBifciEz3LJIv5OriwaUk3eVyIhToBPj4x/omSsypsZydQCoig5df3i8
	 jXqWptZlUSTAiys/OWy6ZsoR5sLh1aXFbSqv8sjHmXytFul3M7zBRCvYKhCDhQCjQV
	 YoDtGP3YabROLgbfW/RABXC2KgmFmSGq0lT1kAZsXkYgqiai73Ajb8wpmHgfr7y5LN
	 eJzUK7WXLRUaQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FCF9CA5FEC;
	Sat,  3 Oct 2026 20:51:08 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sat, 03 Oct 2026 22:51:01 +0200
Subject: [PATCH v3 2/3] reset: Add Apple SoC CIO reset driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-b4-cio-reset-v3-2-e605f9e5c8a4@kernel.org>
References: <20261003-b4-cio-reset-v3-0-e605f9e5c8a4@kernel.org>
In-Reply-To: <20261003-b4-cio-reset-v3-0-e605f9e5c8a4@kernel.org>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Joshua Peisach <jpeisach@ubuntu.com>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8719; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=p9kUDQC+liQdhVRC2vDNz0MNG47XUhNV1FWnW0LOitU=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9bBrJ1fZXWWT1jAEqWV9omFjyf9Xaku552ilR0BL14Fm
 myxPKXcUcrCIMbFICumyLJ9v73pk4dvBJduuvQeZg4rE8gQBi5OAZjI03WMDD2XvZjm/2dn/3Fb
 7eIP01cN+wMfnSqT+lrHVtD7yv6qny7DP+tp/L1XJx/8/lepNlvtuud1tXK3viTtqcyt1zt2q1l
 EcgEA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

Add a driver for the reset of the CIO (USB4/Thunderbolt) blocks on
Apple Silicon SoCs which has to be deasserted before their
co-processor can be booted. On t8103 each port comes with a dedicated
register page while t600x uses a single register with one request bit
per port shared by all ports of a die inside the PMGR MMIO region.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 MAINTAINERS                     |   1 +
 drivers/reset/Kconfig           |  10 ++
 drivers/reset/Makefile          |   1 +
 drivers/reset/reset-apple-cio.c | 200 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 212 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e333c7863460..096fe7535c02 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2685,6 +2685,7 @@ F:	drivers/pinctrl/pinctrl-apple-gpio.c
 F:	drivers/power/reset/macsmc-reboot.c
 F:	drivers/power/supply/macsmc-power.c
 F:	drivers/pwm/pwm-apple.c
+F:	drivers/reset/reset-apple-cio.c
 F:	drivers/rtc/rtc-macsmc.c
 F:	drivers/soc/apple/*
 F:	drivers/spi/spi-apple.c
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 3168ab1eea88..2111d79cbdb2 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -22,6 +22,16 @@ config RESET_A10SR
 	  This option enables support for the external reset functions for
 	  peripheral PHYs on the Altera Arria10 System Resource Chip.
 
+config RESET_APPLE_CIO
+	tristate "Apple SoC CIO block reset driver"
+	depends on ARCH_APPLE || COMPILE_TEST
+	select MFD_SYSCON
+	help
+	  This enables the reset driver for the CIO (USB4/Thunderbolt) blocks
+	  found on Apple Silicon SoCs. It is required to start the blocks
+	  before the USB4/Thunderbolt host routers inside them can be brought
+	  up by the thunderbolt driver.
+
 config RESET_ASPEED
 	tristate "ASPEED Reset Driver"
 	depends on ARCH_ASPEED || COMPILE_TEST
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 45ad17062462..eb2b9d553d7a 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -7,6 +7,7 @@ obj-y += starfive/
 obj-y += sti/
 obj-y += tegra/
 obj-$(CONFIG_RESET_A10SR) += reset-a10sr.o
+obj-$(CONFIG_RESET_APPLE_CIO) += reset-apple-cio.o
 obj-$(CONFIG_RESET_ASPEED) += reset-aspeed.o
 obj-$(CONFIG_RESET_ATH79) += reset-ath79.o
 obj-$(CONFIG_RESET_AXS10X) += reset-axs10x.o
diff --git a/drivers/reset/reset-apple-cio.c b/drivers/reset/reset-apple-cio.c
new file mode 100644
index 000000000000..5727c608f82f
--- /dev/null
+++ b/drivers/reset/reset-apple-cio.c
@@ -0,0 +1,200 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Apple SoC CIO (USB4/Thunderbolt) block reset driver
+ *
+ * Copyright The Asahi Linux Contributors
+ *
+ * The CIO blocks have a reset inside the power manager (PMGR) that
+ * has to be deasserted before their co-processor can be booted. On
+ * t8103 each port comes with a dedicated register page while t600x
+ * uses a single register shared by all ports of a die inside the PMGR
+ * MMIO region.
+ */
+
+#include <linux/bits.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+
+#define APPLE_CIO_RESET_POLL_US 100
+#define APPLE_CIO_RESET_TIMEOUT_US 100000
+
+#define T8103_CIO_CTRL_STRIDE 0x4000
+#define T8103_CIO_CTRL_INIT_REQ BIT(0)
+#define T8103_CIO_CTRL_INIT_DONE BIT(2)
+
+#define T6000_CIO_CTRL_INIT_REQ(port) BIT(port)
+#define T6000_CIO_CTRL_INIT_BUSY(port) BIT(16 + (port))
+
+struct apple_cio_reset;
+
+struct apple_cio_reset_variant {
+	unsigned int nr_resets;
+	bool pmgr_child;
+	int (*deassert)(struct apple_cio_reset *priv, unsigned long id);
+};
+
+struct apple_cio_reset {
+	struct reset_controller_dev rcdev;
+	const struct apple_cio_reset_variant *variant;
+	struct regmap *regmap;
+	u32 offset;
+	struct mutex lock; /* serializes access to the shared t600x register */
+};
+
+static int t8103_cio_deassert(struct apple_cio_reset *priv, unsigned long id)
+{
+	u32 offset = priv->offset + id * T8103_CIO_CTRL_STRIDE;
+	u32 val;
+	int ret;
+
+	/*
+	 * After writing BIT(0) the reset is deasserted and the CIO block comes up.
+	 * Once the sequence is done BIT(0) is cleared automatically and then BIT(2)
+	 * is set. There's no way to assert the reset again other than cutting the power
+	 * to the entire CIO block. Writing the bit again has no effect.
+	 */
+	ret = regmap_write(priv->regmap, offset, T8103_CIO_CTRL_INIT_REQ);
+	if (ret)
+		return ret;
+
+	return regmap_read_poll_timeout(priv->regmap, offset, val,
+					val == T8103_CIO_CTRL_INIT_DONE,
+					APPLE_CIO_RESET_POLL_US,
+					APPLE_CIO_RESET_TIMEOUT_US);
+}
+
+static int t6000_cio_deassert(struct apple_cio_reset *priv, unsigned long id)
+{
+	u32 val;
+	int ret;
+
+	/*
+	 * Note that even the mutex is likely paranoid and not actually required
+	 * here: The way this controller works is that setting bit N immediately
+	 * results in bit 16+n being set. Once the reset is fully released both
+	 * bits are cleared again but macOS specifically waits for the upper one
+	 * to clear before continuing.
+	 * Manually clearing bits is ignored and has no effect, the only way to
+	 * put the block into reset again is shut down its power domains.
+	 * Thus, there's no need to either RMW here or wait before polling.
+	 */
+	guard(mutex)(&priv->lock);
+
+	ret = regmap_write(priv->regmap, priv->offset, T6000_CIO_CTRL_INIT_REQ(id));
+	if (ret)
+		return ret;
+
+	return regmap_read_poll_timeout(priv->regmap, priv->offset, val,
+					!(val & T6000_CIO_CTRL_INIT_BUSY(id)),
+					APPLE_CIO_RESET_POLL_US,
+					APPLE_CIO_RESET_TIMEOUT_US);
+}
+
+static const struct apple_cio_reset_variant apple_t8103_cio_reset = {
+	.nr_resets = 2,
+	.deassert = t8103_cio_deassert,
+};
+
+static const struct apple_cio_reset_variant apple_t6000_cio_reset = {
+	.nr_resets = 4,
+	.pmgr_child = true,
+	.deassert = t6000_cio_deassert,
+};
+
+static int apple_cio_reset_deassert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct apple_cio_reset *priv =
+		container_of(rcdev, struct apple_cio_reset, rcdev);
+
+	return priv->variant->deassert(priv, id);
+}
+
+static const struct reset_control_ops apple_cio_reset_ops = {
+	.deassert = apple_cio_reset_deassert,
+};
+
+static const struct regmap_config apple_cio_reset_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+};
+
+static int apple_cio_reset_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct apple_cio_reset *priv;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->variant = of_device_get_match_data(dev);
+	if (!priv->variant)
+		return -ENODEV;
+
+	ret = devm_mutex_init(dev, &priv->lock);
+	if (ret)
+		return ret;
+
+	if (priv->variant->pmgr_child) {
+		priv->regmap = syscon_node_to_regmap(dev->of_node->parent);
+		if (IS_ERR(priv->regmap))
+			return dev_err_probe(dev, PTR_ERR(priv->regmap),
+					     "Failed to get parent regmap\n");
+
+		ret = of_property_read_u32(dev->of_node, "reg", &priv->offset);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to read reg offset\n");
+	} else {
+		void __iomem *base;
+
+		base = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(base))
+			return PTR_ERR(base);
+
+		priv->regmap = devm_regmap_init_mmio(dev, base,
+						     &apple_cio_reset_regmap_config);
+		if (IS_ERR(priv->regmap))
+			return dev_err_probe(dev, PTR_ERR(priv->regmap),
+					     "Failed to init MMIO regmap\n");
+	}
+
+	priv->rcdev.owner = THIS_MODULE;
+	priv->rcdev.ops = &apple_cio_reset_ops;
+	priv->rcdev.of_node = dev->of_node;
+	priv->rcdev.nr_resets = priv->variant->nr_resets;
+
+	return devm_reset_controller_register(dev, &priv->rcdev);
+}
+
+static const struct of_device_id apple_cio_reset_match[] = {
+	{
+		.compatible = "apple,t8103-cio-reset",
+		.data = &apple_t8103_cio_reset,
+	},
+	{
+		.compatible = "apple,t6000-cio-reset",
+		.data = &apple_t6000_cio_reset,
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, apple_cio_reset_match);
+
+static struct platform_driver apple_cio_reset_driver = {
+	.driver = {
+		.name = "apple-cio-reset",
+		.of_match_table = apple_cio_reset_match,
+	},
+	.probe = apple_cio_reset_probe,
+};
+module_platform_driver(apple_cio_reset_driver);
+
+MODULE_AUTHOR("Sven Peter <sven@kernel.org>");
+MODULE_DESCRIPTION("Apple SoC CIO block reset driver");
+MODULE_LICENSE("Dual MIT/GPL");

-- 
2.55.0


