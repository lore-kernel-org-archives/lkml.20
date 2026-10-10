Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7B74AA028
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637250; cv=none; b=jc1rTDWv2+uzOFgL8ZOwQwkB50ydbWxX3p6yN9ul9pmLvQKz8/1Nf62u7N9wMkU4J8zN+2Avt23DHQyheruXT/A8ewAF69DmybOxqsrGdofJ9bIpGVbcyTfyUoPBJJB6HODz9+LoFijTUu2y0zUa1xZNl0VqYmDEZyC3b+jr1ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637250; c=relaxed/simple;
	bh=QJZVtdKmhkFlg+fowDlyB5mJJYCvltiDUGuMuER60vk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AQ9BVXsl6bVUmALEN8FnSdmTiwf40vBIm6Qjwn7/agGYCfrmnFBlFFO/HqaGnwESZ4WxG34gWAvnD4b9BNcEOj2Gu3TqgKQQMWdMdH1X7G/pSKDCMW+nSPcrVaY4rQTRAsUxxGZD1zmhDTqs7GYaC83nvp6OJ5rKX2ve6+eA7SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fsxDnMpW; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fsxDnMpW"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso2764135e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637244; x=1792242044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ON0MFr8eOk4lIfhGI46AGmWJn585om57WClZUKBxXg=;
        b=fsxDnMpWjmYaBLe11IROX/gK0mFtZ8YWVDivDeJTcVl3SjuFu4HpJMuvftuirdEP8/
         2asO+iZN38NoNb14dq1TTgUyXqP2wyNPDrIlReZcX2amsrCaturaelWN65dJrsy4asnf
         gBLpvvgQNgRwZ6Vn2VaimfrnCn+T2ZZHmHL1lJXpRzkGdW5Qp2pPhht93PJB4azZvDfk
         mjsKI0Ny2QJSpHuG5pItrn88LskR/UTomP15MpC2p9xRAcYFs7J9Cb1785AwO5bx28aQ
         xatpUtj0IJzSP8zNnmd24CqfMYk4cTSP3WnL6pVcErFDEoHrKDUXDasnm+oCxzIOoUJd
         S40g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637244; x=1792242044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/ON0MFr8eOk4lIfhGI46AGmWJn585om57WClZUKBxXg=;
        b=v6KlsM2dEh4ti7KeKleC2VykjJduTQBmezHeKVAN1O1CQ47CFjblq238kTmszBzd/h
         2VTt2kXWgPHti9NgW5iLy5Cu65aLYN7u+P/2FmoFOrGgMKWqWDhGm/lr6WGxhQCXAOPb
         Yqy28tTUUou1gB11dXdUWhSlq/P1HHScAJIAH2hnOsElbMWbHFFA17jDWhUc9d6r7blx
         rwe8cQFwKXgIU3zJH1bOAjTPED4QIHVrYe2oIngVchWAAZPv+Ohh8zm4tbUojb3Y+HNS
         XIhLWzb/N1r2m5byxnN8rA6ycxzXJZaywDWX9dC60vT17b2q4PyV5decrCAxO+dXiRDE
         S67A==
X-Forwarded-Encrypted: i=1; AKwUvBy9M2TxT/qyQHyPJEei8otv33TktRtEfkU3DLL7FHfB7w2bEVFqKl75VKAaG3hbhrmwNCmA6vKsysR2WHw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3JdJtDlBRlkwXSQu/I585p0wy4gBBrUFNq97TPQCpIf/CfANp
	1i9G2KVBPCp+pQKrXmIRtldW9B8OJbYcYkoHlTZ9WeGXyxatj9TbVJ6P
X-Gm-Gg: AYBFou1gxQ/1ifmeUmb/L4cnp4wZDpALrrp2SKlhEm+rijG3eRpdzKsXj21axatjNDJ
	iG/buzOXkC7zMZLyfZecXRoXX1ZqWXIS90NyaXKGe6dmBUXT+vjrXVJAskP5/3nZRbbmEPwfR81
	b9NBykbQXZP+H+UIQGjx9HUNCxns52SN+7dJrl0oXQHEaNRZs1M9q5xvAGtDE2fnBu5pD3RA9NU
	q4bB3NLwVCkyNXIZPj8GB6z8+kAIjacNGUDLjqrlOdExqi2VBZVjIXKT0iWlSfa8La5r9LRn2ku
	9qbFU8shDvK7ZO8qPxNt0npX50BPNJwhqwpJ8yKhBiLr1rzVHT0+2jn2XQmrSW5ZanvyZkXjeow
	5S4KvepBZmLzw1yXbZKrFG3n9HK+SZgzsNOWAzK7jHPKt3Udjn8T4P+8BOATy/NIzUHUceaiP8X
	7DwNL+8vMAozd92/OuiLNP9VrJYHuSSa4DbZ4vqgE0oWhwnkusPdqsGNW+bm9I4lvtqZvfR7EZq
	jql6k82rITiOgPS50DzSL52ldINYOZpkrQFpqyR9OfeUostF/iGAxcr3W2CPbBnlkVZXOiTX+cm
	mH8hk4LpElLBq43mTZ72HZiqS4jKB7d4HUmec+TKoUt5wjvyz0iBL5rej2th6Vo=
X-Received: by 2002:a05:600c:3b8b:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4a18e4a7cfcmr108085995e9.26.1791637243732;
        Sat, 10 Oct 2026 06:00:43 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:43 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 15/24] net: mdio: Add ZTE ZX279128S MDIO controller
Date: Sat, 10 Oct 2026 13:59:53 +0100
Message-ID: <20261010130024.177503-16-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide bounded Clause 22 transactions and managed clock and MDIO-bus
registration.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 drivers/net/mdio/Kconfig          |  11 +++
 drivers/net/mdio/Makefile         |   1 +
 drivers/net/mdio/mdio-zx279128s.c | 158 ++++++++++++++++++++++++++++++
 3 files changed, 170 insertions(+)
 create mode 100644 drivers/net/mdio/mdio-zx279128s.c

diff --git a/drivers/net/mdio/Kconfig b/drivers/net/mdio/Kconfig
index a05229838c..59812a082a 100644
--- a/drivers/net/mdio/Kconfig
+++ b/drivers/net/mdio/Kconfig
@@ -199,6 +199,17 @@ config MDIO_THUNDER
 	  ThunderX SoCs when the MDIO bus device appears as a PCI
 	  device.
 
+config MDIO_ZX279128S
+	tristate "ZTE zx279128s MDIO bus controller"
+	depends on ARCH_ZTE || COMPILE_TEST
+	depends on HAS_IOMEM && OF_MDIO
+	help
+	  This driver supports the MDIO controller of the ZTE zx279128s
+	  SoC. It reaches the PHYs of the integrated switch and, on boards
+	  such as the ZTE ZXHN H3600, an external PHY.
+
+	  To compile this driver as a module, choose M here.
+
 menu "MDIO Multiplexers"
 
 config MDIO_BUS_MUX
diff --git a/drivers/net/mdio/Makefile b/drivers/net/mdio/Makefile
index 0485867460..ce21e1496c 100644
--- a/drivers/net/mdio/Makefile
+++ b/drivers/net/mdio/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_MDIO_REGMAP)		+= mdio-regmap.o
 obj-$(CONFIG_MDIO_SUN4I)		+= mdio-sun4i.o
 obj-$(CONFIG_MDIO_THUNDER)		+= mdio-thunder.o
 obj-$(CONFIG_MDIO_XGENE)		+= mdio-xgene.o
+obj-$(CONFIG_MDIO_ZX279128S)		+= mdio-zx279128s.o
 
 obj-$(CONFIG_MDIO_BUS_MUX)		+= mdio-mux.o
 obj-$(CONFIG_MDIO_BUS_MUX_BCM6368)	+= mdio-mux-bcm6368.o
diff --git a/drivers/net/mdio/mdio-zx279128s.c b/drivers/net/mdio/mdio-zx279128s.c
new file mode 100644
index 0000000000..4c4a9ada68
--- /dev/null
+++ b/drivers/net/mdio/mdio-zx279128s.c
@@ -0,0 +1,158 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ZTE zx279128s MDIO controller
+ *
+ * Copyright (C) 2026 Navid Ghahremani <ghahramani.navid@gmail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of_mdio.h>
+#include <linux/phy.h>
+#include <linux/platform_device.h>
+
+#define ZX_MDIO_DATA_WR		0x04
+#define ZX_MDIO_DATA_RD		0x08
+#define ZX_MDIO_CFG		0x0c
+#define ZX_MDIO_STATUS		0x10
+#define  ZX_MDIO_STATUS_DONE	BIT(0)
+#define ZX_MDIO_CMD		0x14
+#define  ZX_MDIO_CMD_REG	GENMASK(4, 0)
+#define  ZX_MDIO_CMD_ADDR	GENMASK(9, 5)
+#define  ZX_MDIO_CMD_WR		BIT(10)
+#define  ZX_MDIO_CMD_RD		BIT(11)
+#define  ZX_MDIO_CMD_CLK_DIV	BIT(12)
+#define  ZX_MDIO_CMD_BIT13	BIT(13)
+#define  ZX_MDIO_CMD_START	BIT(14)
+#define  ZX_MDIO_CMD_BIT15	BIT(15)
+
+#define ZX_MDIO_POLL_US		10
+#define ZX_MDIO_TIMEOUT_US	2000
+
+struct zx279128s_mdio {
+	void __iomem *base;
+};
+
+static int zx279128s_mdio_xfer(struct mii_bus *bus, u32 op, int addr,
+			       int regnum, u16 data)
+{
+	struct zx279128s_mdio *priv = bus->priv;
+	void __iomem *base = priv->base;
+	u32 cmd, val;
+	int ret;
+
+	/* Clear the previous command and its status */
+	writel(readl(base + ZX_MDIO_CMD) & ~ZX_MDIO_CMD_START,
+	       base + ZX_MDIO_CMD);
+	writel(0, base + ZX_MDIO_STATUS);
+
+	cmd = readl(base + ZX_MDIO_CMD);
+	cmd &= ~(ZX_MDIO_CMD_WR | ZX_MDIO_CMD_RD | ZX_MDIO_CMD_ADDR |
+		 ZX_MDIO_CMD_REG);
+	cmd |= op | FIELD_PREP(ZX_MDIO_CMD_ADDR, addr) |
+	       FIELD_PREP(ZX_MDIO_CMD_REG, regnum);
+
+	if (op == ZX_MDIO_CMD_WR)
+		writel(data, base + ZX_MDIO_DATA_WR);
+	writel(cmd | ZX_MDIO_CMD_START, base + ZX_MDIO_CMD);
+
+	ret = readl_poll_timeout(base + ZX_MDIO_STATUS, val,
+				 val & ZX_MDIO_STATUS_DONE, ZX_MDIO_POLL_US,
+				 ZX_MDIO_TIMEOUT_US);
+	if (ret) {
+		dev_err_ratelimited(&bus->dev, "timeout (addr %d, reg %d)\n",
+				    addr, regnum);
+		return ret;
+	}
+
+	writel(0, base + ZX_MDIO_STATUS);
+	writel(readl(base + ZX_MDIO_CMD) & ~ZX_MDIO_CMD_START,
+	       base + ZX_MDIO_CMD);
+
+	return 0;
+}
+
+static int zx279128s_mdio_read(struct mii_bus *bus, int addr, int regnum)
+{
+	struct zx279128s_mdio *priv = bus->priv;
+	int ret;
+
+	ret = zx279128s_mdio_xfer(bus, ZX_MDIO_CMD_RD, addr, regnum, 0);
+	if (ret)
+		return ret;
+
+	return readl(priv->base + ZX_MDIO_DATA_RD) & 0xffff;
+}
+
+static int zx279128s_mdio_write(struct mii_bus *bus, int addr, int regnum,
+				u16 val)
+{
+	return zx279128s_mdio_xfer(bus, ZX_MDIO_CMD_WR, addr, regnum, val);
+}
+
+static int zx279128s_mdio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct zx279128s_mdio *priv;
+	struct mii_bus *bus;
+	struct clk *clk;
+	u32 val;
+
+	bus = devm_mdiobus_alloc_size(dev, sizeof(*priv));
+	if (!bus)
+		return -ENOMEM;
+
+	priv = bus->priv;
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	clk = devm_clk_get_enabled(dev, "pclk");
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "failed to get the register clock\n");
+	clk = devm_clk_get_enabled(dev, "wclk");
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "failed to get the work clock\n");
+
+	val = readl(priv->base + ZX_MDIO_CMD);
+	val &= ~(ZX_MDIO_CMD_START | ZX_MDIO_CMD_BIT15 | ZX_MDIO_CMD_BIT13);
+	val |= ZX_MDIO_CMD_CLK_DIV;
+	writel(val, priv->base + ZX_MDIO_CMD);
+	writel(0, priv->base + ZX_MDIO_STATUS);
+	writel(0, priv->base + ZX_MDIO_CFG);
+
+	bus->name = "zx279128s-mdio";
+	bus->read = zx279128s_mdio_read;
+	bus->write = zx279128s_mdio_write;
+	snprintf(bus->id, MII_BUS_ID_SIZE, "%s", dev_name(dev));
+	bus->parent = dev;
+
+	return devm_of_mdiobus_register(dev, bus, dev->of_node);
+}
+
+static const struct of_device_id zx279128s_mdio_of_match[] = {
+	{ .compatible = "zte,zx279128s-mdio" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, zx279128s_mdio_of_match);
+
+static struct platform_driver zx279128s_mdio_driver = {
+	.probe = zx279128s_mdio_probe,
+	.driver = {
+		.name = "zx279128s-mdio",
+		.of_match_table = zx279128s_mdio_of_match,
+	},
+};
+module_platform_driver(zx279128s_mdio_driver);
+
+MODULE_AUTHOR("Navid Ghahremani <ghahramani.navid@gmail.com>");
+MODULE_DESCRIPTION("ZTE zx279128s MDIO controller driver");
+MODULE_LICENSE("GPL");
-- 
2.55.0

