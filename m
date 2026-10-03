Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6E7345EAB;
	Sat,  3 Oct 2026 20:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791058773; cv=none; b=apof67P0oSomrBYEja+7kVrZDPoYtAgEBFZGo85S3/HvXWJT3EPfzQ6qjYVwF01jiJznqn/bJsBWD3t037QtrxzX0l4u3i3jbyO7675yoJR3qbyT+PyM1SplbYjcdC8vfnEkXMrkXO02PpXRvlRm6PKTMX87QJrq2F3ds1H0Aj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791058773; c=relaxed/simple;
	bh=d+Pu2Dq/AbIds9W2PsGwZC/UUTv4eRbM2K6Si6cx+EE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IMaCdEsV2mNXsBaYU1sUByPEEkKSs7WR0zuMh19n2Zywoi9Il/TmX1rK+w4pbrvalEdnOlr2vbw26ZgfaKRbPAat4C/u7IJAMcd4tyBrs1Dzja22nnXrD8THdYTxYK2YqxATutb6B+M9ERNvLKnr4vTo5qadU4Pb/XZ6b/qO6YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dK5SMMjI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dK5SMMjI"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64156C4AF14;
	Sat,  3 Oct 2026 20:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791058773;
	bh=d+Pu2Dq/AbIds9W2PsGwZC/UUTv4eRbM2K6Si6cx+EE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dK5SMMjIXA1wT3Na6NyW3agKZrplbIgb+h4KeADBTMc4AmP/v8cXUnhSTCSumKQXf
	 o/hoOJwuuE1ab3DaNY0AZ4Rp1lNk9JnXCHnzM1+hd+nDHzjXe15fbX9U7nczjds2C1
	 /Y0Cq7kywXa3CHDf0LZxAtG3/QaWjEJOaUSdZUY+FggZLLQ7WKbwPgYx4nksX8eeFl
	 wQaSRzBGiY4YSk8P/FvC7XpDjEeRGaPgFbW9HFNr36QpcDgMPGgrZoWbidVSu8hJl3
	 FpVHoDxcB8ciyCAhJfyiexnVjVWooZ7YwVtgAUPmmZYBZsp9MZMop17vgqvtwx7bOe
	 vxx21xTOzBv6w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43919CA5FE4;
	Sat,  3 Oct 2026 20:19:33 +0000 (UTC)
From: Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org>
Date: Sat, 03 Oct 2026 20:19:20 +0000
Subject: [PATCH 2/2] bus: add Altera timeout bridge driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-feature-timeout-ip-v1-2-8837c311d571@bruker.com>
References: <20261003-feature-timeout-ip-v1-0-8837c311d571@bruker.com>
In-Reply-To: <20261003-feature-timeout-ip-v1-0-8837c311d571@bruker.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>, 
 Vyacheslav Yurkov <uvv.mail@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791058772; l=8394;
 i=V.Yurkov.EXT@bruker.com; s=20260318; h=from:subject:message-id;
 bh=ay/MZFMkkNGZ3NCHm6d4sqZeF0z/c4FtI8+IFU78nM0=;
 b=XD5b3Dk7Mh11dDpSeHJHWE1//VOK2tdVJQZPZZQXwRmp2OkDHfYBil9JyJ5wfOnNlwy+C5FuJ
 oQOOZeiqCyPBYsHpzvQ5BGTm045FLcErW1tiChoP54Kjv4mBAMYGZBJ
X-Developer-Key: i=V.Yurkov.EXT@bruker.com; a=ed25519;
 pk=snJmgYVOKlp7aQtK9tWnEI7QTYxpPpJJvxdVsnxA7Fk=
X-Endpoint-Received: by B4 Relay for V.Yurkov.EXT@bruker.com/20260318 with
 auth_id=686
X-Original-From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Reply-To: V.Yurkov.EXT@bruker.com

From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>

Add support for the Altera timeout bridge IP.

The bridge connects an Avalon bus to the HPS and monitors accesses for
timeouts. When a timeout occurs the interrupt communicates the event via
sysfs, which user space can monitor to handle it accordingly. The
address with the timeout is reported as well.

Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
---
 drivers/bus/Kconfig                 |  10 ++
 drivers/bus/Makefile                |   1 +
 drivers/bus/altera-timeout-bridge.c | 219 ++++++++++++++++++++++++++++++++++++
 3 files changed, 230 insertions(+)

diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index e4b1db809187..8a4ad96742e5 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -247,6 +247,16 @@ config DA8XX_MSTPRI
 	  configuration. Allows to adjust the priorities of all master
 	  peripherals.
 
+config ALTERA_TIMEOUT_BRIDGE
+	tristate "Altera AXI Timeout Bridge bus"
+	depends on OF
+	default n
+	help
+	  Driver for Altera AXI Timeout Bridge, which can be used a bus.
+	  The subordinate devices can be connected to the bridge, which
+	  detects frozen read/write requests and notifies user space by
+	  means of a sysfs interrupt flag.
+
 source "drivers/bus/fsl-mc/Kconfig"
 source "drivers/bus/mhi/Kconfig"
 
diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
index a01f97fef3e8..ad4e6d7b1e49 100644
--- a/drivers/bus/Makefile
+++ b/drivers/bus/Makefile
@@ -39,6 +39,7 @@ obj-$(CONFIG_UNIPHIER_SYSTEM_BUS)	+= uniphier-system-bus.o
 obj-$(CONFIG_VEXPRESS_CONFIG)	+= vexpress-config.o
 
 obj-$(CONFIG_DA8XX_MSTPRI)	+= da8xx-mstpri.o
+obj-$(CONFIG_ALTERA_TIMEOUT_BRIDGE)	+= altera-timeout-bridge.o
 
 # MHI
 obj-y				+= mhi/
diff --git a/drivers/bus/altera-timeout-bridge.c b/drivers/bus/altera-timeout-bridge.c
new file mode 100644
index 000000000000..bb44ff4a7591
--- /dev/null
+++ b/drivers/bus/altera-timeout-bridge.c
@@ -0,0 +1,219 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Altera Timeout Bridge Bus Driver
+ *
+ * Copyright (C) 2026 Bruker Corporation
+ */
+
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+
+#define ALTERA_TIMEOUT_BRIDGE_REG_TIMED_OUT_ADDRESS 0x08
+#define ALTERA_TIMEOUT_BRIDGE_REG_IRQ_STATUS_RESET 0x00
+
+struct altera_timeout_bridge_data {
+	struct device *dev;
+	struct resource *bridge_register_resource;
+	void __iomem *bridge_registers;
+	atomic_t irq_count;
+	struct kernfs_node *irq_node;
+};
+
+static ssize_t timeout_irq_show(struct device *dev, struct device_attribute *attr,
+			char *buf)
+{
+	return 0;
+}
+
+static ssize_t irq_count_show(struct device *dev,
+			      struct device_attribute *attr,
+			      char *buf)
+{
+	struct altera_timeout_bridge_data *driver_data = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%d\n", atomic_read(&driver_data->irq_count));
+}
+
+static DEVICE_ATTR_RO(timeout_irq);
+static DEVICE_ATTR_RO(irq_count);
+
+static struct attribute *altera_timeout_bridge_sysfs_attrs[] = {
+	&dev_attr_timeout_irq.attr,
+	&dev_attr_irq_count.attr,
+	NULL /* sentinel */
+};
+
+static const struct attribute_group altera_timeout_bridge_sysfs_group = {
+	.attrs = altera_timeout_bridge_sysfs_attrs,
+};
+
+static u32
+bridge_reg_read(struct altera_timeout_bridge_data *driver_data,
+		u32 offset)
+{
+	u32 result;
+
+	result = readl(driver_data->bridge_registers + offset);
+
+	return result;
+}
+
+static void bridge_reg_write(
+	struct altera_timeout_bridge_data *driver_data,
+	int offset, u32 value)
+{
+	writel(value, driver_data->bridge_registers + offset);
+}
+
+static irqreturn_t altera_timeout_bridge_isr(int irq, void *data)
+{
+	struct altera_timeout_bridge_data *driver_data = data;
+	u32 timed_out_address;
+	resource_size_t effective_base_address;
+	resource_size_t effective_timed_out_address;
+
+	atomic_inc(&driver_data->irq_count);
+
+	// Read and print the timed-out address (encoded in the lower nibble
+	// 0x8..0xF according to AXI Timeout Bridge IP (CSR Interrupt Status Information)
+	timed_out_address = bridge_reg_read(
+		driver_data,
+		ALTERA_TIMEOUT_BRIDGE_REG_TIMED_OUT_ADDRESS);
+	effective_base_address = driver_data->bridge_register_resource->start;
+	effective_timed_out_address = effective_base_address + timed_out_address;
+	pr_err("%s: timeout at address 0x%llx\n",
+		__func__, (unsigned long long)effective_timed_out_address);
+
+	// Reset IRQ status in the bridge
+	bridge_reg_write(
+		driver_data,
+		ALTERA_TIMEOUT_BRIDGE_REG_IRQ_STATUS_RESET,
+		0x1);
+	// notify the user space
+	sysfs_notify_dirent(driver_data->irq_node);
+
+	return IRQ_HANDLED;
+}
+static int altera_timeout_bridge_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	const struct of_device_id *match;
+	const struct of_dev_auxdata *lookup = dev_get_platdata(dev);
+	struct device_node *np = dev->of_node;
+	struct altera_timeout_bridge_data *driver_data;
+	int ret = 0;
+	int irq = -1;
+
+	/*
+	 * Allow user to use driver_override to bind this driver to a
+	 * transparent bus device which has a different compatible string
+	 * that's not listed in simple_pm_bus_of_match. We don't want to do any
+	 * of the simple-pm-bus tasks for these devices, so return early.
+	 */
+	if (device_has_driver_override(&pdev->dev))
+		return 0;
+
+	match = of_match_device(dev->driver->of_match_table, dev);
+
+	/* Use a fall back logic like in simple-pm-bus */
+	if (match && match->data) {
+		if (of_property_match_string(np, "compatible", match->compatible) == 0)
+			return 0;
+		else
+			return -ENODEV;
+	}
+
+	driver_data =
+		devm_kzalloc(&pdev->dev, sizeof(*driver_data), GFP_KERNEL);
+	if (!driver_data) {
+		dev_err(&pdev->dev,
+			"%s: kzalloc failed: no memory for the driver's data, returning ENOMEM\n",
+			__func__);
+		return -ENOMEM;
+	}
+
+	driver_data->dev = dev;
+	platform_set_drvdata(pdev, driver_data);
+
+	driver_data->bridge_register_resource =
+		platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!driver_data->bridge_register_resource) {
+		dev_err(dev,
+			"%s: missing required reg binding\n",
+			__func__);
+		return -ENOENT;
+	}
+	driver_data->bridge_registers =
+		devm_ioremap_resource(dev,
+				     driver_data->bridge_register_resource);
+	if (IS_ERR(driver_data->bridge_registers)) {
+		dev_err(dev,
+			"%s: ioremap_resource failed for bridge-status MMIO, returning PTR_ERR(%ld)\n",
+			__func__, PTR_ERR(driver_data->bridge_registers));
+		return PTR_ERR(driver_data->bridge_registers);
+	}
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		dev_err(dev,
+			"%s: platform_get_irq failed: %d\n", __func__, irq);
+		return irq;
+	}
+
+	ret = devm_request_irq(dev, irq,
+			       altera_timeout_bridge_isr,
+			       0,
+			       dev_name(dev),
+			       driver_data);
+	if (ret) {
+		dev_err(dev,
+			"%s: devm_request_irq failed for IRQ %d: %d\n",
+			__func__, irq, ret);
+		return ret;
+	}
+
+	ret = devm_device_add_group(dev, &altera_timeout_bridge_sysfs_group);
+	if (ret)
+		return ret;
+
+	driver_data->irq_node = sysfs_get_dirent(dev->kobj.sd, "timeout_irq");
+	if (!driver_data->irq_node)
+		return -ENOENT;
+
+	ret = devm_add_action_or_reset(dev, (void (*)(void *))sysfs_put, driver_data->irq_node);
+	if (ret)
+		return ret;
+
+	if (np)
+		of_platform_populate(np, NULL, lookup, &pdev->dev);
+
+	return 0;
+}
+
+#define ONLY_BUS	((void *) 1) /* Match if the device is only a bus. */
+
+static const struct of_device_id altera_timeout_bridge_of_match[] = {
+	{ .compatible = "altera-timeout-bridge", },
+	{ .compatible = "simple-bus",	.data = ONLY_BUS },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, altera_timeout_bridge_of_match);
+
+static struct platform_driver altera_timeout_bridge_driver = {
+	.probe = altera_timeout_bridge_probe,
+	.driver = {
+		.name = "altera-timeout-bridge",
+		.of_match_table = altera_timeout_bridge_of_match,
+	},
+};
+
+module_platform_driver(altera_timeout_bridge_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Avalon Timeout Bridge Bus");
+MODULE_AUTHOR("Vyacheslav Yurkov (V.Yurkov.EXT@bruker.com)");
+

-- 
2.34.1


