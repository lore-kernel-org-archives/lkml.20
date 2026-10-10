Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD92E4AA3F3
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637250; cv=none; b=Fg3zBsJ3XsYsFEew2e+XixEZmFFiKyoaAxTP0SCND3ReS/TAr81ABgUwYpoVZ8OrnSgzU1bq3UxYYSr10wQMGuj57v2Q7xWEFHiPK2Uez1bpp5I6jU6V+ah+CzbTK3498cb+YrStVBnR8MaDCWYOSWJRYGdxgFfs/sTadx+3Vfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637250; c=relaxed/simple;
	bh=YUSr1ObjN9s8cDS2Aj+ho9ixFRu5/jWUlDZQu3cdp5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s/+3mpUxd2pHJWRBQDOAGV7/kdWWNycjTwg4PaJC/AiDmHDtDK/803MnZYGSNLwc54ijeBQWVv/gjSH/txB/7f3dE7EmjnQSOtt2HHMt21f0FMyQ6T1v0tWf5lQhevTClKV/ztLO8W3NU5qNJhCDDxSsFDIV2DLPLpVTNndgxVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NymcRu7P; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NymcRu7P"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so4290095e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637245; x=1792242045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5mcYJeikhf+1cs7oxJAYDuJWMVU6PVHgHphuyMhrcPo=;
        b=NymcRu7PSYOAfMyaLc3bDmOlU6fxJnGgQfUQL17XIgt+I8L/C4Uq3LAEW0oLT/YxZY
         N8Cjmk+u+V5HNx930Ss6bU8kSIObltRslQNZ69ljAbwF/y/3bzKctAjgXeBkKGULkRi6
         SQSyaElZa4Le+2Uwtq6YC4Vo/v1Qd+/ssKlQ39K6grDMaz+P9T4mZ5SBEwfFuLiNKoCJ
         w0JFItKqhjqZWQ/zoGq8u29Artkf739zkefdpEY0DNkYH+Bw/bgWKXuG1kPkyg9uUFEm
         5fFEOWUB8DFDR/l7mzFAjEB8Oa5YPR7aNik/8Wo36InjQbuAcEHeTq13QGZDxGAfgz7j
         qQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637245; x=1792242045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5mcYJeikhf+1cs7oxJAYDuJWMVU6PVHgHphuyMhrcPo=;
        b=Bc+rPwLECZDjA/gVug6gc+tT2Ce8CS0qTLOrZJzapMmFXFchcjGSEIKVq6DkB+x9dL
         bF8L4QUYTlen6Jwaqi2HTSlTaiD0iaZBJye+PvnB/B50Uf747rk86pgORPW8iCkmJMcO
         KH5NP3aQB5pdmNTSZlVPUvuEPZyJ/IgjnsQ0lUR79jHFlLXk61SBC/2DCtYXoMvUpsHr
         Io+agia2WaM3SN+UvUPHLGrgxKF62XNcp30thHGyJTKbzXecP3OOfUSxANIIqRbb6pFg
         KxlMO9iF7nop0+oRJywk033+UmJp0mH0JDtyhLUsqTN4E2RxRetihimY4WtKpNxIozXU
         NfJg==
X-Forwarded-Encrypted: i=1; AKwUvByFevuVi1bUcmBkPoaTvO3my4YTy+7YTbtjVE9c4j+VAz/GdLXQlx9Al3cl8Wl04ovp2ilcwaapHSJTeg0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcnPX3nJSdI1CpXeSV6FqgXVPQ3IBF02KNZkGnPQ4wEeBjunCp
	rbd1ZxYOgqyTci8BHYkcSuzojUEtFukQ7BIeHzGTMl7weoLyVdqR30A+
X-Gm-Gg: AYBFou1w/V16maRf3IVI527p/iXULAQdjJKRQelGW0k1/9rJLm6Et6Uvtdhv3p/7uAK
	RzymSHG/A2TbbXNPv5kKWdiq7Im+bbTD1CSP+5vQ8PuFIef88HuB2IdOjf5c9DgCFSTkLPRbuO6
	GumnKFekMeVhprSzDNT/ROZGQXMeI3LG0pf04SfhpTvcDmWJz0Q0ODRv0PTPJ7hv62dSzWucPbq
	KEJScOaUNYT8xNys7vFtnBa8slKnu93Sea7yKs9QYdDz9tzAwx7PHiOrqLZipI5NJAZzAXtgD3x
	BHv0LTBAs4m73ICvUcvJy313YlC1yE8tS72H35pIXcTieQVhXqWzI+A+lF+Gp9O/q9yJxi9KNvQ
	FgPTXzXhTZbAFbaaRWnwe7zPL/sKVqC/3WhZ6ot5u8e23LUaI+tAqqkBRiDE0RDKkMX5EohXZB/
	fniuDlqgt/15FSbDzkVdVD9HczhSEagNceFKwjFeWVdSK48sTZLXiuu4djq6Z4ty7CUiWlQjzto
	Q83EyPGJvKdCXzJljngGKkWZt0cBZ0oUSHc/vjp/HrjgVAtphR6uA5aIlp2PJpkLnUZYX6zHe+1
	1EgQXSdRkwgQtUUrI+fW+o1yrJrT47w4qCoxlPLL9zeSEk7inOEWq3iBwqhuPQ==
X-Received: by 2002:a05:600c:c176:b0:4a0:c2a:485e with SMTP id 5b1f17b1804b1-4a18e4dce0cmr88467255e9.33.1791637244608;
        Sat, 10 Oct 2026 06:00:44 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:44 -0700 (PDT)
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
Subject: [PATCH 16/24] net: phy: Add Sanechips ZX5201 PHY support
Date: Sat, 10 Oct 2026 13:59:54 +0100
Message-ID: <20261010130024.177503-17-ghahramani.navid@gmail.com>
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

Initialize the external WAN PHY and its SerDes path; generic PHY support
handles negotiation.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 drivers/net/phy/Kconfig     |   8 ++
 drivers/net/phy/Makefile    |   1 +
 drivers/net/phy/sanechips.c | 153 ++++++++++++++++++++++++++++++++++++
 3 files changed, 162 insertions(+)
 create mode 100644 drivers/net/phy/sanechips.c

diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
index b4ef927fd4..63620fdfc4 100644
--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -416,6 +416,14 @@ config ROCKCHIP_PHY
 	help
 	  Currently supports the integrated Ethernet PHY.
 
+config SANECHIPS_PHY
+	tristate "Sanechips Ethernet PHYs"
+	help
+	  Currently supports the Sanechips ZX5201 PHY, which the ZTE ZXHN
+	  H3600 uses for its WAN port. The driver sets the PHY up so that
+	  its SerDes interface passes traffic; everything else is handled
+	  by the generic PHY code.
+
 config SMSC_PHY
 	tristate "SMSC PHYs"
 	select CRC16
diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
index 25c4a3c242..666309f7d0 100644
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -97,6 +97,7 @@ obj-$(CONFIG_QSEMI_PHY)		+= qsemi.o
 obj-$(CONFIG_REALTEK_PHY)	+= realtek/
 obj-$(CONFIG_RENESAS_PHY)	+= uPD60620.o
 obj-$(CONFIG_ROCKCHIP_PHY)	+= rockchip.o
+obj-$(CONFIG_SANECHIPS_PHY)	+= sanechips.o
 obj-$(CONFIG_SMSC_PHY)		+= smsc.o
 obj-$(CONFIG_STE10XP)		+= ste10Xp.o
 obj-$(CONFIG_TERANETICS_PHY)	+= teranetics.o
diff --git a/drivers/net/phy/sanechips.c b/drivers/net/phy/sanechips.c
new file mode 100644
index 0000000000..bb5129b2bb
--- /dev/null
+++ b/drivers/net/phy/sanechips.c
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Sanechips ZX5201 Ethernet PHY
+ *
+ * The ZX5201 answers on two MDIO addresses: the copper PHY on its own
+ * address and its MAC-side SerDes interface on the next one. The copper PHY
+ * uses the standard registers and the generic PHY code; this driver only adds
+ * the setup that the PHY needs before it passes traffic. The values come from
+ * the vendor firmware of the ZTE ZXHN H3600, and most of them are not
+ * documented.
+ *
+ * Copyright (C) 2026 Navid Ghahremani <ghahramani.navid@gmail.com>
+ */
+
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/phy.h>
+
+#define PHY_ID_ZX5201		0x84b95011
+
+/* Copper PHY vendor registers */
+#define ZX5201_REG18		18
+#define ZX5201_EXT_ADDR		16	/* extended register access: address */
+#define ZX5201_EXT_DATA		17	/* extended register access: data */
+#define ZX5201_REG29		29
+
+/*
+ * SerDes interface registers, at the PHY's MDIO address + 1. The names are
+ * a best guess from the way the vendor firmware uses them.
+ */
+#define ZX5201_SDS_WDATA_LO	16
+#define ZX5201_SDS_WDATA_HI	17
+#define ZX5201_SDS_CMD		18
+#define ZX5201_SDS_RDATA_LO	20
+#define ZX5201_SDS_RDATA_HI	21
+#define ZX5201_SDS_REG22	22
+#define ZX5201_SDS_REG27	27
+
+static int zx5201_sds_read(struct phy_device *phydev, u32 regnum)
+{
+	return mdiobus_read(phydev->mdio.bus, phydev->mdio.addr + 1, regnum);
+}
+
+static int zx5201_sds_write(struct phy_device *phydev, u32 regnum, u16 val)
+{
+	return mdiobus_write(phydev->mdio.bus, phydev->mdio.addr + 1, regnum,
+			     val);
+}
+
+static int zx5201_ext_write(struct phy_device *phydev, u16 reg, u16 val)
+{
+	int ret;
+
+	ret = phy_write(phydev, ZX5201_EXT_ADDR, reg);
+	if (ret)
+		return ret;
+
+	return phy_write(phydev, ZX5201_EXT_DATA, val);
+}
+
+static int zx5201_config_init(struct phy_device *phydev)
+{
+	static const u16 led_regs[] = { 0xb409, 0xb407, 0xb406, 0xb408 };
+	int ret, lo, hi, i;
+
+	ret = phy_write(phydev, ZX5201_REG18, 0x8402);
+	if (ret)
+		return ret;
+
+	ret = zx5201_sds_write(phydev, ZX5201_SDS_REG22, 0x0a0f);
+	if (ret)
+		return ret;
+
+	ret = zx5201_sds_write(phydev, ZX5201_SDS_REG27, 0x0800);
+	if (ret)
+		return ret;
+
+	ret = phy_write(phydev, ZX5201_REG29, 0x0355);
+	if (ret)
+		return ret;
+
+	ret = zx5201_ext_write(phydev, 0xb62d, 0x0006);
+	if (ret)
+		return ret;
+
+	/*
+	 * This looks like an indirect read-modify-write of SerDes register 4:
+	 * read it, set bits 9-13 of its high half (bits 25-29 of the register)
+	 * to 0b10100, and write it back.
+	 */
+	ret = zx5201_sds_write(phydev, ZX5201_SDS_CMD, 0x0004);
+	if (ret)
+		return ret;
+
+	hi = zx5201_sds_read(phydev, ZX5201_SDS_RDATA_HI);
+	if (hi < 0)
+		return hi;
+
+	lo = zx5201_sds_read(phydev, ZX5201_SDS_RDATA_LO);
+	if (lo < 0)
+		return lo;
+
+	ret = zx5201_sds_write(phydev, ZX5201_SDS_WDATA_HI,
+			       (hi & 0xc1ff) | 0x2800);
+	if (ret)
+		return ret;
+
+	ret = zx5201_sds_write(phydev, ZX5201_SDS_WDATA_LO, lo);
+	if (ret)
+		return ret;
+
+	ret = zx5201_sds_write(phydev, ZX5201_SDS_CMD, 0x0204);
+	if (ret)
+		return ret;
+
+	ret = zx5201_sds_read(phydev, ZX5201_SDS_REG22);
+	if (ret < 0)
+		return ret;
+
+	ret = zx5201_sds_write(phydev, ZX5201_SDS_REG22, (ret & 0xfff3) | 0x0004);
+	if (ret)
+		return ret;
+
+	/* LED control registers, all cleared as the vendor firmware does */
+	for (i = 0; i < ARRAY_SIZE(led_regs); i++) {
+		ret = zx5201_ext_write(phydev, led_regs[i], 0);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static struct phy_driver sanechips_phy_driver[] = {
+	{
+		PHY_ID_MATCH_EXACT(PHY_ID_ZX5201),
+		.name		= "Sanechips ZX5201",
+		.config_init	= zx5201_config_init,
+		.suspend	= genphy_suspend,
+		.resume		= genphy_resume,
+	},
+};
+module_phy_driver(sanechips_phy_driver);
+
+static const struct mdio_device_id __maybe_unused sanechips_phy_tbl[] = {
+	{ PHY_ID_MATCH_EXACT(PHY_ID_ZX5201) },
+	{ }
+};
+MODULE_DEVICE_TABLE(mdio, sanechips_phy_tbl);
+
+MODULE_AUTHOR("Navid Ghahremani <ghahramani.navid@gmail.com>");
+MODULE_DESCRIPTION("Sanechips Ethernet PHY driver");
+MODULE_LICENSE("GPL");
-- 
2.55.0

