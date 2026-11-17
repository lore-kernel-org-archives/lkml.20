Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933717;
	b=CODisZCsTjOimYGpPNNOeLwZsCDauVXwOyCfAXyWH2Hvyw9wWosa9d0t+15mw87ctpSl
	 3XpuoHHyw0rruvUveJJp7kZWGYf6BWPSgysOFteULJ9crZ8a45iQF1eYI45Cx3SGJntPY
	 tvp9U++GfSe/19WobP+XeR1ROoPUSEb9hMZlGSnTpZBhjmnUPl2QAVyKcI5CDzifOZ3RL
	 l1OBmTLIxJJqlO299dlnZMt8vbCdnGEqdcYS6KK14KoowfrrfxhT9izAcfoGs/66+X4Aw
	 yKd7Hy3OF7IWCwHfRon6BsQO+lbHMCfTZ/ZHd5lVGapXhRhZ4AAu1Ytc+BFNPbnqoeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=R72ZpNDSLhj3N7avwpbFhud3bDAd8mZYVG4dhkFmtm4=;
	b=2CkErdkZxiNQT3vH0BvhuTce9IBAqs28z7amlYfgF9IDlxYbq0t1JLgxwc2IKCNbM/TQ
	 oClF1gnRTD6JVHNRc0E7+oWS2sNgfbA/q5CxIDlSNzFKvH9kg8UXGRCHt3rnlsxBrmJNN
	 afvLfa/LXL3s8ZYmAgYgJAuDYQrv+Rs8TYbG3xAzpVpYf3K8BgkgAfPvoBp/EsCrM+O7G
	 kuxkOqSFxncFWTo/zGB+CbtRLE2LtebG4GWckNzp54t4kPBhIscVO5oATl66XBEH08NgV
	 p1pfU1tsPguVnPfk5donEBO2J0jKCeURpyajNkbA5TY+VFKHMNilt2vmFA8YDY8ujBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=COzewcGP;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A0B606A8AF
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:41:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24A0B606A8AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=COzewcGP
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49d05d51553so457495e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933716; x=1795538516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R72ZpNDSLhj3N7avwpbFhud3bDAd8mZYVG4dhkFmtm4=;
        b=COzewcGPCMqNxb15UjWviCF9qNoG4MxS9Rzd4LdHhcPg+LTwnDb6KH9hiaS8Llmz2b
         yw+y9IVhmlCEd7pBgQpmAT++aG7DBStMHRGZkQAvZiNgZbXgdqbHOBjz2osbgM2DcXFQ
         mqq1KTw405AO93mYU743CxFdF5T1UxEpR74J5iFAomWvFS/D5pkGrKxWivxS8ioCmXAq
         oB2aFBrc7Ajz3mBdl/CTAPRCFnwT4EkkRKb5XokykR+1aXhOokMFPmiBXAnb0ga6rQnL
         hsHuj8Dktu+LF1PvQdYizquuL2n4ez6AmqLXz2HZUM1A0jtGqYjrw5pTAvcRctQjUwwK
         VSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933716; x=1795538516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=R72ZpNDSLhj3N7avwpbFhud3bDAd8mZYVG4dhkFmtm4=;
        b=jTavGuI8lmBaaAXHnTmG0ZVts0s+zzS6rqUqy0cOTftKHQMkWDsOGXJMxrQaHjflnY
         AklAL0L5N0nSGhdyl12mgXrGToTX+RNhCwU6iRSln5sSRWjFYJ4hsEwhtbHluIRkyqL5
         58+fHzLJ8C2K0wgr/QFsB4wTmeK8S751cyPntFN0a8/nrshSd192OtPZ9nYDvI/FYnBL
         Z4enwP/HSTWtRrzc5g8DNq4vs/6CGoDgq8SeCeOkbwhk43pRfI+UxQnvql2WLSZbIA1l
         Q814VOc420nv22SHJezey/Y+lYcSBRkrtGPvUJM5LO3GBy0zZ06xFuvm7WBq6hf4tIn1
         ywnQ==
X-Forwarded-Encrypted: i=1; AL+hErHf3evZB0XSecsmgKrmTT9Z1I6cVThKP9DeU48bcexbg2QUVvCBtwUbMu4A78s+Dfhy2sMJ5TFoesU4gwg=@vger.kernel.org
X-Gm-Message-State: APuU4Z88LNr9JAmbJ4AzEa6S4RECoiqaA/VRfhUv8N0s7WoN0+AbPoHA
	4IjGY5mJ5p/knB03+WIIweuKXLqCFtYQoi53h8i8ABMd6WrmbQh4VlEF
X-Gm-Gg: AYBFou26XlVwVbyuMFdyScro0HMU8/+20ahYhTnpcl0ImrLDHf5HZqAMMZicrW9plB6
	u2IDHAtjpTi0MheyPuIHzbCwfllY3mlPHw2x2Gx+p6xtMC2aLh7XkFUg96XKsoy8x1Omvez6zUQ
	/zf4BdZvXUcvsUXPEiqhGTtc+JSMlf172kuFqOVPDT9Hg9cGgqRG1PBMr2Y6Q5xIvHxj3I36BXf
	tf1lTkLYtC5aOdg/yRezJThYDV+A1hY34Q6Z6+JT1xIbwo+Ee0hqP4hALTbGtQAnBetNlhOzV3X
	VMLpmR8TUS/GUvFHjajBTEJYHVGOyaRQ9rxQrYQQpIraT0/Aj6bZLx9mQc+OrkTV469/UIzk3jH
	/rk0/o6c7nvb1yl4k3ZEPeBMWOggqctSHz0pGlHaGzqgJ0aJepa82PPnp1gq/8cWmQZ5geJf6SE
	VWYsa9M8b75kZ3QAQ1MzqOc8DGG2YAKvRww/Te72yAALoWixkH+d0gT3nPOh9jfdLOjRiYmiUYF
	JBpXpXxGG7zsTD1bns7FaJ+gfpYRIh1FF00fdOivd+8OLg9Axhwwv1Ys/hkpzFWunI75JsPPASc
	uQb3O0eVVxlI5E77P9QW+b8lMk2G9U8NMp54wVhPgTwpZa0pxhc0f9J2v4QOIvJDymZHGaPWvJx
	v69Haur5aLP4iajy5FzovLrmMRSSxR62G4w==
X-Received: by 2002:a05:600c:b86:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4bb55a67c61mr318826535e9.26.1794933715485;
        Tue, 17 Nov 2026 08:41:55 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78430752sm82316475e9.12.2026.11.17.08.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:41:55 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] mfd: an8855: Add support for Airoha AN8855 Switch
Date: Tue, 17 Nov 2026 17:41:31 +0100
Message-ID: <20261117164132.47167-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117164132.47167-1-ansuelsmth@gmail.com>
References: <20261117164132.47167-1-ansuelsmth@gmail.com>
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

Add support for Airoha AN8855 Switch that provide support for a DSA
switch and a NVMEM provider.

Also make use of the mdio-regmap driver and register a regmap for each
internal PHY of the switch.
This is needed to handle the double usage of the PHYs as both PHY and
Switch accessor.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/mfd/Kconfig         |  14 +
 drivers/mfd/Makefile        |   1 +
 drivers/mfd/airoha-an8855.c | 568 ++++++++++++++++++++++++++++++++++++
 3 files changed, 583 insertions(+)
 create mode 100644 drivers/mfd/airoha-an8855.c

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 2b2b7bced400..ba8c8971e12c 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -54,6 +54,20 @@ config MFD_ALTERA_SYSMGR
 	  using regmap_mmio accesses for ARM32 parts and SMC calls to
 	  EL3 for ARM64 parts.
 
+config MFD_AIROHA_AN8855
+	tristate "Airoha AN8855 Switch Core"
+	select MFD_CORE
+	select REGMAP
+	select PHYLIB
+	select MDIO_REGMAP
+	depends on NETDEVICES && OF
+	help
+	  Support for the Airoha AN8855 Switch Core. This is an SoC
+	  that provides various peripherals, to count, i2c, an Ethrnet
+	  Switch, a CPU timer, GPIO, eFUSE.
+
+	  Currently it provides a DSA switch and a NVMEM provider.
+
 config MFD_ACT8945A
 	tristate "Active-semi ACT8945A"
 	select MFD_CORE
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 3765e6ebc724..99f0bd236d92 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_MFD_88PM860X)	+= 88pm860x.o
 obj-$(CONFIG_MFD_88PM800)	+= 88pm800.o 88pm80x.o
 obj-$(CONFIG_MFD_88PM805)	+= 88pm805.o 88pm80x.o
 obj-$(CONFIG_MFD_88PM886_PMIC)	+= 88pm886.o
+obj-$(CONFIG_MFD_AIROHA_AN8855)	+= airoha-an8855.o
 obj-$(CONFIG_MFD_ACT8945A)	+= act8945a.o
 obj-$(CONFIG_MFD_SM501)		+= sm501.o
 obj-$(CONFIG_MFD_ASUS_TRANSFORMER_EC)	+= asus-transformer-ec.o
diff --git a/drivers/mfd/airoha-an8855.c b/drivers/mfd/airoha-an8855.c
new file mode 100644
index 000000000000..908b2676e35a
--- /dev/null
+++ b/drivers/mfd/airoha-an8855.c
@@ -0,0 +1,568 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Core driver for Airoha AN8855 Switch
+ *
+ * Copyright (C) 2024 Christian Marangi <ansuelsmth@gmail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/fwnode_mdio.h>
+#include <linux/gpio/consumer.h>
+#include <linux/mdio.h>
+#include <linux/mdio/mdio-regmap.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy.h>
+#include <linux/regmap.h>
+
+/* Register for HW trap status */
+#define AN8855_HWTRAP			0x1000009c
+
+/*
+ * Register of the Switch ID
+ * (called Project ID in Documentation)
+ */
+#define AN8855_CREV			0x10005000
+#define   AN8855_ID			0x8855 /* Switch ID */
+
+/*
+ * Register for GPHY Power Down
+ * Used to Toggle the Gigabit PHY power and enable them.
+ */
+#define AN8855_RG_GPHY_AFE_PWD		0x1028c840
+
+/* MII Registers */
+#define AN8855_PHY_SELECT_PAGE		0x1f
+#define   AN8855_PHY_PAGE		GENMASK(2, 0)
+#define   AN8855_PHY_PAGE_STANDARD	FIELD_PREP_CONST(AN8855_PHY_PAGE, 0x0)
+#define   AN8855_PHY_PAGE_EXTENDED_1	FIELD_PREP_CONST(AN8855_PHY_PAGE, 0x1)
+#define   AN8855_PHY_PAGE_EXTENDED_4	FIELD_PREP_CONST(AN8855_PHY_PAGE, 0x4)
+
+/* MII Registers Page 4 */
+#define AN8855_PBUS_MODE		0x10
+#define   AN8855_PBUS_MODE_ADDR_FIXED	0x0
+#define   AN8855_PBUS_MODE_ADDR_INCR	BIT(15)
+#define AN8855_PBUS_WR_ADDR_HIGH	0x11
+#define AN8855_PBUS_WR_ADDR_LOW		0x12
+#define AN8855_PBUS_WR_DATA_HIGH	0x13
+#define AN8855_PBUS_WR_DATA_LOW		0x14
+#define AN8855_PBUS_RD_ADDR_HIGH	0x15
+#define AN8855_PBUS_RD_ADDR_LOW		0x16
+#define AN8855_PBUS_RD_DATA_HIGH	0x17
+#define AN8855_PBUS_RD_DATA_LOW		0x18
+
+#define AN8855_MAX_PHY_PORT		5
+
+#define AN8855_MDIO_VAL(hi, lo)		(((u32)(hi) << 16) | (u16)(lo))
+
+struct an8855 {
+	struct mii_bus *bus;
+	struct mii_bus *phy_bus;
+	unsigned int switch_addr;
+	u16 current_page;
+};
+
+struct an8855_phy {
+	u8 addr;
+	struct an8855 *core;
+};
+
+struct an8855_phy_bus {
+	struct mii_bus *bus;
+	struct fwnode_handle *node;
+	u8 addr;
+};
+
+static const struct mfd_cell an8855_cells[] = {
+	MFD_CELL_OF("an8855-efuse", NULL, NULL, 0, 0, "airoha,an8855-efuse"),
+	MFD_CELL_OF("an8855-switch", NULL, NULL, 0, 0, "airoha,an8855-switch"),
+};
+
+static int an8855_mii_set_page(struct an8855 *ddata, u8 addr,
+			       u8 page) __must_hold(&ddata->bus->mdio_lock)
+{
+	struct mii_bus *bus = ddata->bus;
+	int ret;
+
+	ret = __mdiobus_write(bus, addr, AN8855_PHY_SELECT_PAGE, page);
+	if (ret) {
+		dev_err_ratelimited(&bus->dev, "Failed to set mii page\n");
+		return ret;
+	}
+
+	/* Cache current page if next MII read/write is for Switch page */
+	ddata->current_page = page;
+	return 0;
+}
+
+static int an8855_mii_read32(struct mii_bus *bus, u8 phy_id, u32 reg,
+			     u32 *val) __must_hold(&bus->mdio_lock)
+{
+	int lo, hi, ret;
+
+	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_MODE, AN8855_PBUS_MODE_ADDR_FIXED);
+	if (ret)
+		goto err;
+
+	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_RD_ADDR_HIGH, upper_16_bits(reg));
+	if (ret)
+		goto err;
+
+	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_RD_ADDR_LOW, lower_16_bits(reg));
+	if (ret)
+		goto err;
+
+	hi = __mdiobus_read(bus, phy_id, AN8855_PBUS_RD_DATA_HIGH);
+	if (hi < 0) {
+		ret = hi;
+		goto err;
+	}
+
+	lo = __mdiobus_read(bus, phy_id, AN8855_PBUS_RD_DATA_LOW);
+	if (lo < 0) {
+		ret = lo;
+		goto err;
+	}
+
+	*val = AN8855_MDIO_VAL(hi, lo);
+
+	return 0;
+err:
+	dev_err_ratelimited(&bus->dev, "Failed to read register\n");
+	return ret;
+}
+
+/*
+ * Protect concurrent access to phy page if switch address also
+ * expose a PHY.
+ */
+static void an8855_regmap_lock(struct an8855 *ddata)
+{
+	if (ddata->phy_bus)
+		mutex_lock(&ddata->phy_bus->mdio_lock);
+
+	mutex_lock_nested(&ddata->bus->mdio_lock, MDIO_MUTEX_NESTED);
+}
+
+static void an8855_regmap_unlock(struct an8855 *ddata)
+{
+	mutex_unlock(&ddata->bus->mdio_lock);
+
+	if (ddata->phy_bus)
+		mutex_unlock(&ddata->phy_bus->mdio_lock);
+}
+
+static int an8855_regmap_read(void *ctx, uint32_t reg, uint32_t *val)
+{
+	struct an8855 *ddata = ctx;
+	struct mii_bus *bus = ddata->bus;
+	u16 addr = ddata->switch_addr;
+	int ret;
+
+	an8855_regmap_lock(ddata);
+
+	ret = an8855_mii_set_page(ddata, addr, AN8855_PHY_PAGE_EXTENDED_4);
+	if (ret)
+		goto exit;
+
+	ret = an8855_mii_read32(bus, addr, reg, val);
+
+exit:
+	an8855_regmap_unlock(ddata);
+
+	return ret;
+}
+
+static int an8855_mii_write32(struct mii_bus *bus, u8 phy_id, u32 reg,
+			      u32 val) __must_hold(&bus->mdio_lock)
+{
+	int ret;
+
+	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_MODE, AN8855_PBUS_MODE_ADDR_FIXED);
+	if (ret)
+		goto err;
+
+	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_WR_ADDR_HIGH, upper_16_bits(reg));
+	if (ret)
+		goto err;
+	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_WR_ADDR_LOW, lower_16_bits(reg));
+	if (ret)
+		goto err;
+
+	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_WR_DATA_HIGH, upper_16_bits(val));
+	if (ret)
+		goto err;
+
+	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_WR_DATA_LOW, lower_16_bits(val));
+	if (ret)
+		goto err;
+
+	return 0;
+err:
+	dev_err_ratelimited(&bus->dev,
+			    "Failed to write an8855 register\n");
+	return ret;
+}
+
+static int an8855_regmap_write(void *ctx, uint32_t reg, uint32_t val)
+{
+	struct an8855 *ddata = ctx;
+	struct mii_bus *bus = ddata->bus;
+	u16 addr = ddata->switch_addr;
+	int ret;
+
+	an8855_regmap_lock(ddata);
+	ret = an8855_mii_set_page(ddata, addr, AN8855_PHY_PAGE_EXTENDED_4);
+	if (ret)
+		goto exit;
+
+	ret = an8855_mii_write32(bus, addr, reg, val);
+
+exit:
+	an8855_regmap_unlock(ddata);
+
+	return ret;
+}
+
+static int an8855_regmap_update_bits(void *ctx, uint32_t reg, uint32_t mask,
+				     uint32_t write_val)
+{
+	struct an8855 *ddata = ctx;
+	struct mii_bus *bus = ddata->bus;
+	u16 addr = ddata->switch_addr;
+	u32 val;
+	int ret;
+
+	an8855_regmap_lock(ddata);
+	ret = an8855_mii_set_page(ddata, addr, AN8855_PHY_PAGE_EXTENDED_4);
+	if (ret)
+		goto exit;
+
+	ret = an8855_mii_read32(bus, addr, reg, &val);
+	if (ret)
+		goto exit;
+
+	val &= ~mask;
+	val |= write_val & mask;
+	ret = an8855_mii_write32(bus, addr, reg, val);
+
+exit:
+	an8855_regmap_unlock(ddata);
+
+	return ret;
+}
+
+static const struct regmap_range an8855_readable_ranges[] = {
+	regmap_reg_range(0x10000000, 0x10000fff), /* SCU */
+	regmap_reg_range(0x10001000, 0x10001fff), /* RBUS */
+	regmap_reg_range(0x10002000, 0x10002fff), /* MCU */
+	regmap_reg_range(0x10005000, 0x10005fff), /* SYS SCU */
+	regmap_reg_range(0x10007000, 0x10007fff), /* I2C Slave */
+	regmap_reg_range(0x10008000, 0x10008fff), /* I2C Master */
+	regmap_reg_range(0x10009000, 0x10009fff), /* PDMA */
+	regmap_reg_range(0x1000a100, 0x1000a1ff), /* General Purpose Timer */
+	regmap_reg_range(0x1000a200, 0x1000a2ff), /* GPU timer */
+	regmap_reg_range(0x1000a300, 0x1000a3ff), /* GPIO */
+	regmap_reg_range(0x1000a400, 0x1000a5ff), /* EFUSE */
+	regmap_reg_range(0x1000c000, 0x1000cfff), /* GDMP CSR */
+	regmap_reg_range(0x10010000, 0x1001ffff), /* GDMP SRAM */
+	regmap_reg_range(0x10200000, 0x10203fff), /* Switch - ARL Global */
+	regmap_reg_range(0x10204000, 0x10207fff), /* Switch - BMU */
+	regmap_reg_range(0x10208000, 0x1020bfff), /* Switch - ARL Port */
+	regmap_reg_range(0x1020c000, 0x1020cfff), /* Switch - SCH */
+	regmap_reg_range(0x10210000, 0x10213fff), /* Switch - MAC */
+	regmap_reg_range(0x10214000, 0x10217fff), /* Switch - MIB */
+	regmap_reg_range(0x10218000, 0x1021bfff), /* Switch - Port Control */
+	regmap_reg_range(0x1021c000, 0x1021ffff), /* Switch - TOP */
+	regmap_reg_range(0x10220000, 0x1022ffff), /* SerDes */
+	regmap_reg_range(0x10286000, 0x10286fff), /* RG Batcher */
+	regmap_reg_range(0x1028c000, 0x1028ffff), /* ETHER_SYS */
+	regmap_reg_range(0x30000000, 0x37ffffff), /* I2C EEPROM */
+	regmap_reg_range(0x38000000, 0x3fffffff), /* BOOT_ROM */
+	regmap_reg_range(0xa0000000, 0xbfffffff), /* GPHY */
+};
+
+static const struct regmap_access_table an8855_readable_table = {
+	.yes_ranges = an8855_readable_ranges,
+	.n_yes_ranges = ARRAY_SIZE(an8855_readable_ranges),
+};
+
+static const struct regmap_config an8855_regmap_config = {
+	.name = "switch",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = 0xbfffffff,
+	.reg_read = an8855_regmap_read,
+	.reg_write = an8855_regmap_write,
+	.reg_update_bits = an8855_regmap_update_bits,
+	.disable_locking = true,
+	.rd_table = &an8855_readable_table,
+};
+
+static int an8855_regmap_phy_reset_page(struct an8855 *ddata,
+					int phy) __must_hold(&ddata->bus->mdio_lock)
+{
+	/* Check PHY page only for addr shared with switch */
+	if (phy != ddata->switch_addr)
+		return 0;
+
+	/* Don't restore page if it's not set to Switch page */
+	if (ddata->current_page != AN8855_PHY_PAGE_EXTENDED_4)
+		return 0;
+
+	/*
+	 * Restore page to 0, PHY might change page right after but that
+	 * will be ignored as it won't be a switch page.
+	 */
+	return an8855_mii_set_page(ddata, phy, AN8855_PHY_PAGE_STANDARD);
+}
+
+static int an8855_regmap_phy_read(void *ctx, uint32_t reg, uint32_t *val)
+{
+	struct an8855_phy *ddata = ctx;
+	struct an8855 *core_ddata = ddata->core;
+	struct mii_bus *bus = core_ddata->bus;
+	u32 addr = ddata->addr;
+	int ret;
+
+	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
+	ret = an8855_regmap_phy_reset_page(core_ddata, addr);
+	if (ret)
+		goto exit;
+
+	ret = __mdiobus_read(bus, addr, reg);
+	if (ret >= 0)
+		*val = ret;
+
+exit:
+	mutex_unlock(&bus->mdio_lock);
+
+	return ret < 0 ? ret : 0;
+}
+
+static int an8855_regmap_phy_write(void *ctx, uint32_t reg, uint32_t val)
+{
+	struct an8855_phy *ddata = ctx;
+	struct an8855 *core_ddata = ddata->core;
+	struct mii_bus *bus = core_ddata->bus;
+	u32 addr = ddata->addr;
+	int ret;
+
+	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
+	ret = an8855_regmap_phy_reset_page(core_ddata, addr);
+	if (ret)
+		goto exit;
+
+	ret = __mdiobus_write(bus, addr, reg, val);
+
+exit:
+	mutex_unlock(&bus->mdio_lock);
+
+	return ret;
+}
+
+static const struct regmap_config an8855_phy_regmap_config = {
+	.reg_bits = 16,
+	.val_bits = 16,
+	.reg_read = an8855_regmap_phy_read,
+	.reg_write = an8855_regmap_phy_write,
+	.disable_locking = true,
+	.max_register = 0x1f,
+};
+
+static int an8855_read_switch_id(struct device *dev, struct regmap *regmap)
+{
+	u32 id;
+	int ret;
+
+	ret = regmap_read(regmap, AN8855_CREV, &id);
+	if (ret)
+		return ret;
+
+	if (id != AN8855_ID) {
+		dev_err(dev, "Detected Switch ID %x but %x was expected\n",
+			id, AN8855_ID);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static int an8855_phy_bus_register(struct device *dev, struct an8855 *ddata,
+				   struct fwnode_handle *phy_np,
+				   struct an8855_phy_bus *phy_bus_info)
+{
+	struct mdio_regmap_config mrc = { };
+	struct an8855_phy *phy_ddata;
+	struct regmap *regmap;
+	u32 addr, phy_offset;
+	struct mii_bus *bus;
+	int ret;
+
+	ret = fwnode_property_read_u32(phy_np, "reg", &addr);
+	if (ret)
+		return ret;
+
+	phy_offset = addr - ddata->switch_addr;
+	if (phy_offset >= AN8855_MAX_PHY_PORT)
+		return -EINVAL;
+
+	phy_ddata = devm_kzalloc(dev, sizeof(*phy_ddata), GFP_KERNEL);
+	if (!phy_ddata)
+		return -ENOMEM;
+
+	phy_ddata->addr = addr;
+	phy_ddata->core = ddata;
+
+	regmap = devm_regmap_init(dev, NULL, phy_ddata, &an8855_phy_regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "phy%d regmap initialization failed\n",
+				      addr);
+
+	mrc.regmap = regmap;
+	mrc.parent = dev;
+	mrc.valid_addr = addr;
+	snprintf(mrc.name, MII_BUS_ID_SIZE, "%s-phy%u", dev_name(dev), addr);
+
+	bus = devm_mdio_regmap_register(dev, &mrc);
+	if (IS_ERR(bus))
+		return PTR_ERR(bus);
+
+	if (addr == ddata->switch_addr)
+		ddata->phy_bus = bus;
+
+	phy_bus_info->bus = bus;
+	phy_bus_info->addr = addr;
+	phy_bus_info->node = fwnode_handle_get(phy_np);
+
+	return 0;
+}
+
+static int an8855_mdio_register(struct device *dev, struct an8855 *ddata,
+				struct an8855_phy_bus *phy_bus_infos)
+{
+	struct fwnode_handle *mdio_np __free(fwnode_handle) = NULL;
+	int phy = 0;
+	int ret = 0;
+
+	mdio_np = fwnode_get_named_child_node(dev_fwnode(dev), "mdio");
+	if (!mdio_np)
+		return -ENODEV;
+
+	fwnode_for_each_available_child_node_scoped(mdio_np, phy_np) {
+		if (phy >= AN8855_MAX_PHY_PORT) {
+			ret = -EINVAL;
+			goto exit;
+		}
+
+		ret = an8855_phy_bus_register(dev, ddata, phy_np,
+					      &phy_bus_infos[phy]);
+		if (ret)
+			goto exit;
+
+		phy++;
+	}
+
+exit:
+	if (ret) {
+		while (phy--)
+			fwnode_handle_put(phy_bus_infos[phy].node);
+
+		return ret;
+	}
+
+	return phy;
+}
+
+static int an8855_probe(struct mdio_device *mdiodev)
+{
+	struct an8855_phy_bus phy_bus_infos[AN8855_MAX_PHY_PORT] = { };
+	struct device *dev = &mdiodev->dev;
+	struct regmap *regmap;
+	struct an8855 *ddata;
+	int num_phys;
+	int phy, ret;
+
+	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	ddata->bus = mdiodev->bus;
+	ddata->switch_addr = mdiodev->addr;
+	/* No DMA for mdiobus, mute warning for DMA mask not set */
+	dev->dma_mask = &dev->coherent_dma_mask;
+
+	/* Register virtual MDIO for each PHY */
+	num_phys = an8855_mdio_register(dev, ddata, phy_bus_infos);
+	if (num_phys < 0)
+		return num_phys;
+
+	regmap = devm_regmap_init(dev, NULL, ddata, &an8855_regmap_config);
+	if (IS_ERR(regmap)) {
+		ret = PTR_ERR(regmap);
+		dev_err_probe(dev, ret, "regmap initialization failed\n");
+		goto err_put_fwnodes;
+	}
+
+	/* Reset PHY page for switch address */
+	mutex_lock_nested(&ddata->bus->mdio_lock, MDIO_MUTEX_NESTED);
+	ret = an8855_mii_set_page(ddata, ddata->switch_addr,
+				  AN8855_PHY_PAGE_STANDARD);
+	mutex_unlock(&ddata->bus->mdio_lock);
+	if (ret)
+		goto err_put_fwnodes;
+
+	ret = an8855_read_switch_id(dev, regmap);
+	if (ret)
+		goto err_put_fwnodes;
+
+	/* Release global PHY power down */
+	ret = regmap_write(regmap, AN8855_RG_GPHY_AFE_PWD, 0x0);
+	if (ret)
+		goto err_put_fwnodes;
+
+	/* Register PHYs */
+	for (phy = 0; phy < num_phys; phy++) {
+		ret = fwnode_mdiobus_register_phy(phy_bus_infos[phy].bus,
+						  phy_bus_infos[phy].node,
+						  phy_bus_infos[phy].addr);
+		fwnode_handle_put(phy_bus_infos[phy].node);
+		phy_bus_infos[phy].node = NULL;
+
+		if (ret)
+			goto err_put_fwnodes;
+	}
+
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, an8855_cells,
+				    ARRAY_SIZE(an8855_cells), NULL, 0,
+				    NULL);
+
+err_put_fwnodes:
+	for (phy = 0; phy < num_phys; phy++)
+		if (phy_bus_infos[phy].node)
+			fwnode_handle_put(phy_bus_infos[phy].node);
+
+	return ret;
+}
+
+static const struct of_device_id an8855_of_match[] = {
+	{ .compatible = "airoha,an8855" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, an8855_of_match);
+
+static struct mdio_driver an8855_driver = {
+	.probe = an8855_probe,
+	.mdiodrv.driver = {
+		.name = "an8855",
+		.of_match_table = an8855_of_match,
+	},
+};
+mdio_module_driver(an8855_driver);
+
+MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
+MODULE_DESCRIPTION("Driver for Airoha AN8855");
+MODULE_LICENSE("GPL");
-- 
2.55.0

