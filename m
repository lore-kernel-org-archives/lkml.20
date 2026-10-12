Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1D34B5CA2
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791823443; cv=none; b=NWfo2px8HZUPL9MfN/nPAZwhTw5RYKBIOB0Tf6Lk6C1oqiMSEKdLnXhF5HM/etoMskQLycEDMhrjkSwxa+msOhUXYT54PHL2tfY2lwXsgp6Ocfus9P5yDHy1OeWlX0yXFMQ118tDzSgm8wLQuze6j1LplgzeTEFM7VlGQTeI5LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791823443; c=relaxed/simple;
	bh=quQwnIj6OIrZnBodtas8IUiIPPeHDprJ/iM/6DxR2UY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c28cgJroHx8yAO0DwOdBe3H63PVAv07vcSyerXGo9RSHyX5DlqoIpTolwjnp4rqOAUiqItx3yPyQxSfs1z7LZHBkdojoZuz6XxKOXChPbf0GHOJ3asG/zisgzC4ofB0OKMNBA/wBMBjPpoVZAcuXo43DFLbgAJ/LafX1KzRUoJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=RknHItLs; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="RknHItLs"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-917997ab0d9so28190456d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791823439; x=1792428239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8gdCTGKWsCIcwZXjnFbmDDgPCpqAVnX/FbE20RWWDCc=;
        b=RknHItLswxJh7MSUdPfJMzf6kNyJcN27EkV91MD5gP8QiI31AL06SCPoGbqQk2OcG3
         0EHOhQjClRZjJ3uEBOVjx7hoDHHdnggMM8VKu5OU6teALls5Aa63X5hcluwcb5jFuaJQ
         0NkqQHYja/upnwXno4GLzdRx00vPi84aXJXQWQK2VsuUXOFyEr19F+MbeECFoWr1W9g1
         iiAP0JT/vx4JTu7aS/YfodRU9Bmu0BQmXBN3XdlX7ZEkkcqmH567yQ4RGW+eTrSkGq2+
         HhXad1c2CX1BnVXgXLdsQfVf40yHHGFmNlnZyBNILRNe+V9X+T4v2Y3DUHDSe6uPsevH
         Yvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791823439; x=1792428239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8gdCTGKWsCIcwZXjnFbmDDgPCpqAVnX/FbE20RWWDCc=;
        b=mD2NXippznol3e6l3nalpVyS54ktsmQQtzkdjznSLGJBnDIVlowXq8RPpy9xKRofk2
         FvTmjHNUtZNYxbKwRuFaRpwz4UYYjvyAEdBigmK+dj5JFTpk9lWzS+sDQSIUOHqRVwHc
         uB4bZzPNvz0PooN5hJNUpVyYUt4dp+fTvsKsMsQ8cFqmY6Jd7xjDr5GhyhnlLZD3kb0+
         EZGPAmwsjob5D+0qNXzklAy1PqFk14AClwUEu0E8/Q50AseXQ+a2Fzm1HhuyWCSBS0zB
         hsTZc9nKdHcvdtZiF3n/CQezwnUqCAd/UEoMr/5nDfWVtThjNZgfJHroefgXWgvSF2W3
         dEsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbiPvDkkq9SXkRLqJ3xD7/IprqO4iE38WS4IkMSsSwTgAGWrO6bGEckI+N8ozUIwLUF4zf60HNoJlFkRk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLINRzP9YXYeSmV2fQqyq/iXmv/KjoBcsNrZCNTtlAqke4+fkuU
	LhvJQjj8eqtkktOLaq+yxDnMwZqFeZJw4vL5/vWGdJxzSucKLTRhYhFPZoIDya1OBnI=
X-Gm-Gg: AYBFou003nOfHTaJLMOiD9gx+jXiEEkK6LiNZnbhVQSyfF3Itiv0jc0n64idjBr7O3O
	/XrEFF9dY6sOebeW3CMQdYD6DjSMyB7/fp0ElgacDjfslo+36JoMU8/b9WXXlribdYHgRRjRjZr
	DrnPk1RQBb2OVUcs6rnNIrBCddOVlHe0yNJ8ZOQ5FC8m0jcSYHQDuxeq4DlA3HFrUwe/jwEgQ0z
	jj5EIbtsAqWtQJy7w2CMizhzpmTvD7ZRf/WOEX8Tk7bCkut9Fp9on3YsM4ymMWW70LYyRgpzbz8
	XypN/n2XVvaQFRPcp9o/6pF0LCc3jzEsJDXEx7WZjlqnX7ysNvmQO2oJEFNWxfwCBYuHsdQd+Mv
	6t3bhvyOgxkUMbH8IIFyv6+z+L+6GXsPDhMef/Vb6DJH88McGA7EoEbDHpkZCjwYd9zaX0cLnyF
	Tp5hlvdglyoxUd5f1/S9HLHSS/ZCUgNdgeRiUmdn+hn/RaxjsG2tCKRMQ2SH/iyIcK6aM4I3a7A
	Kp8
X-Received: by 2002:a05:620a:3720:b0:93e:5dcb:eb9b with SMTP id af79cd13be357-93ebd24ecabmr1839177685a.42.1791823439341;
        Mon, 12 Oct 2026 09:43:59 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef5090050sm24998885a.40.2026.10.12.09.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 09:43:59 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	danielt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Thompson <daniel@riscstar.com>
Subject: [PATCH 2/2] reset: toshiba: introduce a TC9564 SoC reset driver
Date: Mon, 12 Oct 2026 11:43:53 -0500
Message-ID: <20261012164354.3872326-3-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012164354.3872326-1-elder@riscstar.com>
References: <20261012164354.3872326-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define a new platform driver that manages reset signals implemented by
the Toshiba TC9564 SoC.  There are 13 reset signals available, although
only 11 can be controlled.

Two registers manage the state of the resets.  The registers are
accessed via a regmap supplied by a system controller, because the
region of memory accessed is shared with other drivers.

Access to the memory region is provided via a BAR on a PCIe endpoint
function embedded in the TC9564 SoC.  For that reason the PCIe reset
cannot be manipulated by this driver (it is assumed to be deasserted).
Similarly, control is not available for the I2C reset, because the
PCIe subsystem on the TC9564 relies on I2C.

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 MAINTAINERS                  |   1 +
 drivers/reset/Kconfig        |  12 +++
 drivers/reset/Makefile       |   1 +
 drivers/reset/reset-tc9564.c | 192 +++++++++++++++++++++++++++++++++++
 4 files changed, 206 insertions(+)
 create mode 100644 drivers/reset/reset-tc9564.c

diff --git a/MAINTAINERS b/MAINTAINERS
index d0eb44079fe17..a8f4982ed1a43 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28185,6 +28185,7 @@ M:	Alex Elder <elder@kernel.org>
 M:	Daniel Thompson <danielt@kernel.org>
 S:	Maintained
 F:	Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml
+F:	drivers/reset/reset-tc9564.c
 F:	include/dt-bindings/reset/toshiba,tc9564.h
 
 TOSHIBA WMI HOTKEYS DRIVER
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index eda9c698a95f3..b40736368894c 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -358,6 +358,18 @@ config RESET_SUNXI
 	help
 	  This enables the reset driver for Allwinner SoCs.
 
+config RESET_TC9564
+	tristate "Toshiba TC9564 reset support"
+	depends on TC9564_PCI
+	select MFD_SYSCON
+	default TC9564_PCI
+	help
+	  This enables support for the reset controller embedded in the
+	  Toshiba TC9564 SoC.  The state of reset lines is controlled
+	  via MMIO to a region managed by a system controller; this
+	  ensures access to the region is coordinated between this and
+	  the clock and XGMAC (stmmac) drivers.
+
 config RESET_TENSTORRENT_ATLANTIS
 	tristate "Tenstorrent atlantis reset driver"
 	depends on ARCH_TENSTORRENT || COMPILE_TEST
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 489fafd6bbe3f..6ddded26309ef 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -45,6 +45,7 @@ obj-$(CONFIG_RESET_SKY1_AUDSS) += reset-sky1-audss.o
 obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
 obj-$(CONFIG_RESET_SUNPLUS) += reset-sunplus.o
 obj-$(CONFIG_RESET_SUNXI) += reset-sunxi.o
+obj-$(CONFIG_RESET_TC9564) += reset-tc9564.o
 obj-$(CONFIG_RESET_TENSTORRENT_ATLANTIS) += reset-tenstorrent-atlantis.o
 obj-$(CONFIG_RESET_TH1520) += reset-th1520.o
 obj-$(CONFIG_RESET_TI_SCI) += reset-ti-sci.o
diff --git a/drivers/reset/reset-tc9564.c b/drivers/reset/reset-tc9564.c
new file mode 100644
index 0000000000000..0243c2e0efd54
--- /dev/null
+++ b/drivers/reset/reset-tc9564.c
@@ -0,0 +1,192 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
+ */
+
+#include <linux/bits.h>
+#include <linux/device-id/of.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+
+#include <dt-bindings/reset/toshiba,tc9564.h>
+
+#define RST_CTRL0_OFFSET	0x1008
+#define RST_CTRL1_OFFSET	0x1010
+
+struct tc9564_reset {
+	u32 offset;		/* RST_CTRL0_OFFSET or RST_CTRL1_OFFSET */
+	u32 mask;		/* Zero means undefined reset */
+};
+
+struct tc9564_resets {
+	struct regmap *regmap;
+	struct reset_controller_dev rcdev;
+};
+
+#define TC9564_RESET_INIT0(_name, _bit)	__TC9564_RESET_INIT(_name, 0, _bit)
+#define TC9564_RESET_INIT1(_name, _bit)	__TC9564_RESET_INIT(_name, 1, _bit)
+
+#define __TC9564_RESET_INIT(_name, _reg, _bit)		\
+	[RESET_##_name] = {				\
+		.offset	= RST_CTRL ## _reg ## _OFFSET,	\
+		.mask = BIT(_bit),			\
+	}
+
+/*
+ * The PCIe and I2C resets are controllable, but we depend on PCIe
+ * and that relies on I2C, so we don't allow them to be asserted.
+ */
+static const struct tc9564_reset tc9564_reset[] = {
+	TC9564_RESET_INIT0(MCU, 0),
+	TC9564_RESET_INIT0(MCU1, 1),
+	TC9564_RESET_INIT0(INTC, 4),
+	/* TC9564_RESET_INIT0(PCIE, 9), */
+	/* TC9564_RESET_INIT0(I2C, 12), */
+	TC9564_RESET_INIT0(UART, 16),
+	TC9564_RESET_INIT0(MSIGEN, 18),
+
+	TC9564_RESET_INIT0(MAC0_MAC, 7),
+	TC9564_RESET_INIT0(MAC0_PMA, 30),
+	TC9564_RESET_INIT0(MAC0_XPCS, 31),
+
+	TC9564_RESET_INIT1(MAC1_MAC, 7),
+	TC9564_RESET_INIT1(MAC1_PMA, 30),
+	TC9564_RESET_INIT1(MAC1_XPCS, 31),
+};
+#define TC9564_RESET_COUNT	ARRAY_SIZE(tc9564_reset)
+
+static const struct tc9564_resets *
+rcdev_to_tc9564_resets(struct reset_controller_dev *rcdev)
+{
+	return container_of_const(rcdev, struct tc9564_resets, rcdev);
+}
+
+static int tc9564_reset_manage(struct reset_controller_dev *rcdev,
+			       unsigned long id, bool assert)
+{
+	const struct tc9564_resets *resets = rcdev_to_tc9564_resets(rcdev);
+
+	if (id < rcdev->nr_resets) {
+		const struct tc9564_reset *reset = &tc9564_reset[id];
+		u32 mask = reset->mask;
+
+		if (mask)
+			return regmap_update_bits(resets->regmap,
+						  reset->offset, mask,
+						  assert ? mask : 0);
+	}
+
+	dev_err(rcdev->dev, "invalid reset (%s id %lu)\n",
+		assert ? "assert" : "deassert", id);
+
+	return -ENXIO;
+}
+
+static int tc9564_reset_assert(struct reset_controller_dev *rcdev,
+			       unsigned long id)
+{
+	return tc9564_reset_manage(rcdev, id, true);
+}
+
+static int tc9564_reset_deassert(struct reset_controller_dev *rcdev,
+				 unsigned long id)
+{
+	return tc9564_reset_manage(rcdev, id, false);
+}
+
+static const struct reset_control_ops tc9564_reset_control_ops = {
+	.assert = tc9564_reset_assert,
+	.deassert = tc9564_reset_deassert,
+};
+
+static void tc9564_reset_assert_all(struct tc9564_resets *resets)
+{
+	for (u32 id = 0; id < TC9564_RESET_COUNT; id++)
+		if (tc9564_reset[id].mask)
+			tc9564_reset_manage(&resets->rcdev, id, true);
+}
+
+static struct tc9564_resets *tc9564_reset_init(struct device *dev)
+{
+	struct reset_controller_dev *rcdev;
+	struct tc9564_resets *resets;
+	struct regmap *regmap;
+	int ret;
+
+	regmap = syscon_node_to_regmap(dev_of_node(dev->parent));
+	if (IS_ERR(regmap)) {
+		dev_err(dev, "failed to get config regmap\n");
+		return ERR_CAST(regmap);
+	}
+
+	resets = devm_kzalloc(dev, sizeof(*resets), GFP_KERNEL);
+	if (!resets)
+		return ERR_PTR(-ENOMEM);
+	resets->regmap = regmap;
+
+	rcdev = &resets->rcdev;
+	rcdev->ops = &tc9564_reset_control_ops;
+	rcdev->owner = THIS_MODULE;
+	rcdev->dev = dev;
+	rcdev->of_node = dev_of_node(dev);
+	rcdev->nr_resets = TC9564_RESET_COUNT;
+
+	ret = devm_reset_controller_register(dev, rcdev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return resets;
+}
+
+static int tc9564_reset_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct tc9564_resets *resets;
+
+	if (!dev_of_node(dev))
+		return dev_err_probe(dev, -EINVAL, "no devicetree node\n");
+
+	resets = tc9564_reset_init(dev);
+	if (IS_ERR(resets))
+		return dev_err_probe(dev, PTR_ERR(resets),
+				     "failed to initialize resets\n");
+
+	/* Force all resets to be initially asserted */
+	tc9564_reset_assert_all(resets);
+
+	platform_set_drvdata(pdev, resets);
+
+	return 0;
+}
+
+static void tc9564_reset_remove(struct platform_device *pdev)
+{
+	struct tc9564_resets *resets = platform_get_drvdata(pdev);
+
+	/* Leave all resets asserted when done */
+	tc9564_reset_assert_all(resets);
+}
+
+static const struct of_device_id tc9564_reset_ids[] = {
+	{ .compatible = "toshiba,tc9564-reset" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tc9564_reset_ids);
+
+static struct platform_driver tc9564_reset_driver = {
+	.probe = tc9564_reset_probe,
+	.remove = tc9564_reset_remove,
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = tc9564_reset_ids,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+};
+module_platform_driver(tc9564_reset_driver);
+
+MODULE_DESCRIPTION("Toshiba TC9564 Reset Driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0

