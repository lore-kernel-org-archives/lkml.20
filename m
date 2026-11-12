Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461499;
	b=QIP33hcGHgd6hbT9CHZLWQ0gK0QT38xQNIDNFqZA9zQBca0oTkM7mObVRSz1PC/TbI8L
	 QDCbw/BnSVGxkRpvwYZNnHC492pgAmKXfQ2ZNGFKHnqUru31Y3a1wRd+jIbCtIFwgYwcT
	 zC9ojKieJiHHfF56bik5S7PZftv5Lx+TMF4XcAkiz4GqHhrJQroARKOxNfP2/iQYqrj7Y
	 qJspnTG2EWQ8i8ncynnCCfF1tBKxtx0QAl+HQ9L3ev/95GYucLrbCEjFDNsbnSiNsts/B
	 syN60dLf03+3FeOoMgMFFst+aKj4i71kuzSBhUKbJv8mn6OlrHaTMfOsB9UGH3KCNcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461499;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=g+7DY9m8CiKLzIJAMJ8QwpkFgylcA9tMseP7Agvss7k=;
	b=4u616JrycoXFu79WUZdgQTtEmSvsuGcB9xmD15GVI68WI2NbwscMXYZAA0Y9bsQIrYH8
	 K5SIlbE9bNfWHBf6/3kah8aK+nrbD4QEwOO2qY4nImLl4ajeBcZG61n4z0809Jcu6sWYu
	 hHbB5odRt5eR1KWczDC8dIHF1+ApkBE7Dp8Xq2/5/0iEnu6fARYtFas8j4OIElgG0fxi5
	 epx/utwiA0jcJFh5gsCS+3qzXO1qXWKIrx0ubCjeTwX+owjjfnHzTl5VRVtdTORKbwiIR
	 +W0p0LvNL0zmBCUaeW7V5vaRzWiwvblHck9l9GoPZ1xMZKuxE99VdCBeZDfkwcvqILw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=R9H3VLUe;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8356606A32A;
	Thu, 12 Nov 2026 05:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8356606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=R9H3VLUe
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AC5VTzT43463064, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794461489; bh=g+7DY9m8CiKLzIJAMJ8QwpkFgylcA9tMseP7Agvss7k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=R9H3VLUeNetjOUFjY4ztDcR0FkgrmIHeGpzW9uQBAodObgvuYew69XoaAkJYuKmg+
	 MxqqPC/5x2eo8cFi0XbnxoMK4NiLk6jDr+tJuaux60YRpemu3nINAqtW813AGzO/NY
	 HiXEm6iI15aPvPsE5nHIcVkHsucw7QOf3lLXltr81tHCKz5qjlP1+KiA3IYcb+CYg1
	 uKbbG5TX6EvaA9BrA2JZjKFuy+qxLqtj78ciVQgfuCUp4Xk2xjDJlqAGj+3yr9+Spj
	 2PWd38YBzOvitDz+7v+Pp4xmvpcoKM0q0hPo8KmtTd0Bb9kDrFZFhcfZX0FLK4oxcE
	 Q5+3b1y/zLf6g==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AC5VTzT43463064
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 Nov 2026 13:31:29 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 13:31:29 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 13:31:29 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Thu, 12 Nov 2026 13:31:29 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <p.zabel@pengutronix.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <cylee12@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<james.tai@realtek.com>, <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v16 3/3] reset: realtek: Add RTD1625 reset controller driver
Date: Thu, 12 Nov 2026 13:31:28 +0800
Message-ID: <20261112053128.561149-4-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261112053128.561149-1-eleanor.lin@realtek.com>
References: <20261112053128.561149-1-eleanor.lin@realtek.com>
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
Content-Type: text/plain

From: Cheng-Yu Lee <cylee12@realtek.com>

Add support for the CRT (Clock, Reset, and Test) and ISO (Isolation)domain
reset controller on the Realtek RTD1625 SoC.

The reset controller shares the same register space with the CRT and ISO
clock controller. To handle this shared register space, the reset driver is
implemented as an auxiliary driver. It will be instantiated and probed via
the auxiliary bus by the RTD1625-CRT and RTD1625-ISO clock controller
driver.

Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/reset/realtek/Kconfig         |  11 ++
 drivers/reset/realtek/Makefile        |   1 +
 drivers/reset/realtek/reset-rtd1625.c | 262 ++++++++++++++++++++++++++
 3 files changed, 274 insertions(+)
 create mode 100644 drivers/reset/realtek/reset-rtd1625.c

diff --git a/drivers/reset/realtek/Kconfig b/drivers/reset/realtek/Kconfig
index 5ddf8e5c09c7..38591b6a70b3 100644
--- a/drivers/reset/realtek/Kconfig
+++ b/drivers/reset/realtek/Kconfig
@@ -6,3 +6,14 @@ config RESET_RTK_COMMON
 	  Realtek SoCs. It provides shared reset control operations
 	  (assert, deassert, status) that other Realtek-specific reset
 	  drivers can use.
+
+config RESET_RTD1625
+	tristate "RTD1625 Reset Controller"
+	depends on ARCH_REALTEK || COMPILE_TEST
+	select RESET_RTK_COMMON
+	select AUXILIARY_BUS
+	help
+	  This enables the reset controller driver for Realtek RTD1625 SoC.
+	  The driver controls reset lines for various peripherals including
+	  PCIe, SATA, HDMI, display, video encoder/decoder, USB, SD, audio,
+	  and other subsystems.
diff --git a/drivers/reset/realtek/Makefile b/drivers/reset/realtek/Makefile
index 6d68e41748bf..993acd1e2d14 100644
--- a/drivers/reset/realtek/Makefile
+++ b/drivers/reset/realtek/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_RESET_RTK_COMMON) += reset-rtk-common.o
+obj-$(CONFIG_RESET_RTD1625) += reset-rtd1625.o
diff --git a/drivers/reset/realtek/reset-rtd1625.c b/drivers/reset/realtek/reset-rtd1625.c
new file mode 100644
index 000000000000..061634e74b5f
--- /dev/null
+++ b/drivers/reset/realtek/reset-rtd1625.c
@@ -0,0 +1,262 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Realtek Semiconductor Corporation
+ */
+
+#include <dt-bindings/reset/realtek,rtd1625.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/array_size.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include "reset-rtk-common.h"
+
+struct rtd1625_reset_info {
+	const struct rtk_reset_desc *descs;
+	unsigned int nr_resets;
+};
+
+static const struct rtk_reset_desc rtd1625_crt_reset_descs[] = {
+	/* Bank 0: offset 0x0 */
+	[RTD1625_CRT_RSTN_MISC]         = { .ofs = 0x0, .bit = 0,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_DIP]          = { .ofs = 0x0, .bit = 2,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_GSPI]         = { .ofs = 0x0, .bit = 4,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_SDS]          = { .ofs = 0x0, .bit = 6,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_SDS_REG]      = { .ofs = 0x0, .bit = 8,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_SDS_PHY]      = { .ofs = 0x0, .bit = 10, .write_en = 1 },
+	[RTD1625_CRT_RSTN_GPU2D]        = { .ofs = 0x0, .bit = 12, .write_en = 1 },
+	[RTD1625_CRT_RSTN_DC_PHY]       = { .ofs = 0x0, .bit = 22, .write_en = 1 },
+	[RTD1625_CRT_RSTN_DCPHY_CRT]    = { .ofs = 0x0, .bit = 24, .write_en = 1 },
+	[RTD1625_CRT_RSTN_LSADC]        = { .ofs = 0x0, .bit = 26, .write_en = 1 },
+	[RTD1625_CRT_RSTN_SE]           = { .ofs = 0x0, .bit = 28, .write_en = 1 },
+	[RTD1625_CRT_RSTN_DLA]          = { .ofs = 0x0, .bit = 30, .write_en = 1 },
+	/* Bank 1: offset 0x4 */
+	[RTD1625_CRT_RSTN_JPEG]         = { .ofs = 0x4, .bit = 0,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_SD]           = { .ofs = 0x4, .bit = 2,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_SDIO]         = { .ofs = 0x4, .bit = 6,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCR_CNT]      = { .ofs = 0x4, .bit = 8,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE0_STITCH] = { .ofs = 0x4, .bit = 10, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE0_PHY]    = { .ofs = 0x4, .bit = 12, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE0]        = { .ofs = 0x4, .bit = 14, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE0_CORE]   = { .ofs = 0x4, .bit = 16, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE0_POWER]  = { .ofs = 0x4, .bit = 18, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE0_NONSTICH] = { .ofs = 0x4, .bit = 20, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE0_PHY_MDIO] = { .ofs = 0x4, .bit = 22, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE0_SGMII_MDIO] = { .ofs = 0x4, .bit = 24, .write_en = 1 },
+	[RTD1625_CRT_RSTN_VO2]          = { .ofs = 0x4, .bit = 28, .write_en = 1 },
+	[RTD1625_CRT_RSTN_MISC_SC0]     = { .ofs = 0x4, .bit = 30, .write_en = 1 },
+	/* Bank 2: offset 0x8 */
+	[RTD1625_CRT_RSTN_MD]           = { .ofs = 0x8, .bit = 4,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_LVDS1]        = { .ofs = 0x8, .bit = 6,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_LVDS2]        = { .ofs = 0x8, .bit = 8,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_MISC_SC1]     = { .ofs = 0x8, .bit = 10, .write_en = 1 },
+	[RTD1625_CRT_RSTN_I2C_3]        = { .ofs = 0x8, .bit = 12, .write_en = 1 },
+	[RTD1625_CRT_RSTN_FAN]          = { .ofs = 0x8, .bit = 14, .write_en = 1 },
+	[RTD1625_CRT_RSTN_TVE]          = { .ofs = 0x8, .bit = 16, .write_en = 1 },
+	[RTD1625_CRT_RSTN_AIO]          = { .ofs = 0x8, .bit = 18, .write_en = 1 },
+	[RTD1625_CRT_RSTN_VO]           = { .ofs = 0x8, .bit = 20, .write_en = 1 },
+	[RTD1625_CRT_RSTN_MIPI_CSI]     = { .ofs = 0x8, .bit = 22, .write_en = 1 },
+	[RTD1625_CRT_RSTN_HDMIRX]       = { .ofs = 0x8, .bit = 24, .write_en = 1 },
+	[RTD1625_CRT_RSTN_HDMIRX_WRAP]  = { .ofs = 0x8, .bit = 26, .write_en = 1 },
+	[RTD1625_CRT_RSTN_HDMI]         = { .ofs = 0x8, .bit = 28, .write_en = 1 },
+	[RTD1625_CRT_RSTN_DISP]         = { .ofs = 0x8, .bit = 30, .write_en = 1 },
+	/* Bank 3: offset 0xc */
+	[RTD1625_CRT_RSTN_SATA_PHY_POW1] = { .ofs = 0xc, .bit = 0,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_SATA_PHY_POW0] = { .ofs = 0xc, .bit = 2,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_SATA_MDIO1]   = { .ofs = 0xc, .bit = 4,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_SATA_MDIO0]   = { .ofs = 0xc, .bit = 6,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_SATA_WRAP]    = { .ofs = 0xc, .bit = 8,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_SATA_MAC_P1]  = { .ofs = 0xc, .bit = 10, .write_en = 1 },
+	[RTD1625_CRT_RSTN_SATA_MAC_P0]  = { .ofs = 0xc, .bit = 12, .write_en = 1 },
+	[RTD1625_CRT_RSTN_SATA_MAC_COM] = { .ofs = 0xc, .bit = 14, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE1_STITCH] = { .ofs = 0xc, .bit = 16, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE1_PHY]     = { .ofs = 0xc, .bit = 18, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE1]         = { .ofs = 0xc, .bit = 20, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE1_CORE]   = { .ofs = 0xc, .bit = 22, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE1_POWER]  = { .ofs = 0xc, .bit = 24, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE1_NONSTICH] = { .ofs = 0xc, .bit = 26, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE1_PHY_MDIO] = { .ofs = 0xc, .bit = 28, .write_en = 1 },
+	[RTD1625_CRT_RSTN_HDMITOP]      = { .ofs = 0xc, .bit = 30, .write_en = 1 },
+	/* Bank 4: offset 0x68 */
+	[RTD1625_CRT_RSTN_I2C_4]        = { .ofs = 0x68, .bit = 2,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_I2C_5]        = { .ofs = 0x68, .bit = 4,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_TSIO]         = { .ofs = 0x68, .bit = 6,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_VI]           = { .ofs = 0x68, .bit = 8,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_EDP]          = { .ofs = 0x68, .bit = 10, .write_en = 1 },
+	[RTD1625_CRT_RSTN_VE1_MMU]      = { .ofs = 0x68, .bit = 12, .write_en = 1 },
+	[RTD1625_CRT_RSTN_VE1_MMU_FUNC] = { .ofs = 0x68, .bit = 14, .write_en = 1 },
+	[RTD1625_CRT_RSTN_HSE_MMU]      = { .ofs = 0x68, .bit = 16, .write_en = 1 },
+	[RTD1625_CRT_RSTN_HSE_MMU_FUNC] = { .ofs = 0x68, .bit = 18, .write_en = 1 },
+	[RTD1625_CRT_RSTN_MDLM2M]       = { .ofs = 0x68, .bit = 20, .write_en = 1 },
+	[RTD1625_CRT_RSTN_ISO_GSPI]     = { .ofs = 0x68, .bit = 22, .write_en = 1 },
+	[RTD1625_CRT_RSTN_SOFT_NPU]     = { .ofs = 0x68, .bit = 24, .write_en = 1 },
+	[RTD1625_CRT_RSTN_SPI2EMMC]     = { .ofs = 0x68, .bit = 26, .write_en = 1 },
+	[RTD1625_CRT_RSTN_EARC]         = { .ofs = 0x68, .bit = 28, .write_en = 1 },
+	[RTD1625_CRT_RSTN_VE1]          = { .ofs = 0x68, .bit = 30, .write_en = 1 },
+	/* Bank 5: offset 0x90 */
+	[RTD1625_CRT_RSTN_PCIE2_STITCH]  = { .ofs = 0x90, .bit = 0,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE2_PHY]    = { .ofs = 0x90, .bit = 2,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE2]        = { .ofs = 0x90, .bit = 4,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE2_CORE]   = { .ofs = 0x90, .bit = 6,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE2_POWER]  = { .ofs = 0x90, .bit = 8,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE2_NONSTICH] = { .ofs = 0x90, .bit = 10, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE2_PHY_MDIO] = { .ofs = 0x90, .bit = 12, .write_en = 1 },
+	[RTD1625_CRT_RSTN_DCPHY_UMCTL2] = { .ofs = 0x90, .bit = 14, .write_en = 1 },
+	[RTD1625_CRT_RSTN_MIPI_DSI]     = { .ofs = 0x90, .bit = 16, .write_en = 1 },
+	[RTD1625_CRT_RSTN_HIFM]         = { .ofs = 0x90, .bit = 18, .write_en = 1 },
+	[RTD1625_CRT_RSTN_NSRAM]        = { .ofs = 0x90, .bit = 20, .write_en = 1 },
+	[RTD1625_CRT_RSTN_AUCPU0_REG]   = { .ofs = 0x90, .bit = 22, .write_en = 1 },
+	[RTD1625_CRT_RSTN_MDL_GENPW]    = { .ofs = 0x90, .bit = 24, .write_en = 1 },
+	[RTD1625_CRT_RSTN_MDL_CHIP]     = { .ofs = 0x90, .bit = 26, .write_en = 1 },
+	[RTD1625_CRT_RSTN_MDL_IP]       = { .ofs = 0x90, .bit = 28, .write_en = 1 },
+	[RTD1625_CRT_RSTN_TEST_MUX]     = { .ofs = 0x90, .bit = 30, .write_en = 1 },
+	/* Bank 6: offset 0xb8 */
+	[RTD1625_CRT_RSTN_ISO_BIST]     = { .ofs = 0xb8, .bit = 0,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_MAIN_BIST]    = { .ofs = 0xb8, .bit = 2,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_MAIN2_BIST]   = { .ofs = 0xb8, .bit = 4,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_VE1_BIST]     = { .ofs = 0xb8, .bit = 6,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_VE2_BIST]     = { .ofs = 0xb8, .bit = 8,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_DCPHY_BIST]   = { .ofs = 0xb8, .bit = 10, .write_en = 1 },
+	[RTD1625_CRT_RSTN_GPU_BIST]     = { .ofs = 0xb8, .bit = 12, .write_en = 1 },
+	[RTD1625_CRT_RSTN_DISP_BIST]    = { .ofs = 0xb8, .bit = 14, .write_en = 1 },
+	[RTD1625_CRT_RSTN_NPU_BIST]     = { .ofs = 0xb8, .bit = 16, .write_en = 1 },
+	[RTD1625_CRT_RSTN_CAS_BIST]     = { .ofs = 0xb8, .bit = 18, .write_en = 1 },
+	[RTD1625_CRT_RSTN_VE4_BIST]     = { .ofs = 0xb8, .bit = 20, .write_en = 1 },
+	/* Bank 7: offset 0x454 (DUMMY0, no write_en) */
+	[RTD1625_CRT_RSTN_EMMC]         = { .ofs = 0x454, .bit = 0 },
+	/* Bank 8: offset 0x458 (DUMMY1, no write_en) */
+	[RTD1625_CRT_RSTN_GPU]          = { .ofs = 0x458, .bit = 0 },
+	/* Bank 9: offset 0x464 (DUMMY4, no write_en) */
+	[RTD1625_CRT_RSTN_VE2]          = { .ofs = 0x464, .bit = 0 },
+	/* Bank 10: offset 0x880 */
+	[RTD1625_CRT_RSTN_UR1]          = { .ofs = 0x880, .bit = 0,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_UR2]          = { .ofs = 0x880, .bit = 2,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_UR3]          = { .ofs = 0x880, .bit = 4,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_UR4]          = { .ofs = 0x880, .bit = 6,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_UR5]          = { .ofs = 0x880, .bit = 8,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_UR6]          = { .ofs = 0x880, .bit = 10, .write_en = 1 },
+	[RTD1625_CRT_RSTN_UR7]          = { .ofs = 0x880, .bit = 12, .write_en = 1 },
+	[RTD1625_CRT_RSTN_UR8]          = { .ofs = 0x880, .bit = 14, .write_en = 1 },
+	[RTD1625_CRT_RSTN_UR9]          = { .ofs = 0x880, .bit = 16, .write_en = 1 },
+	[RTD1625_CRT_RSTN_UR_TOP]       = { .ofs = 0x880, .bit = 18, .write_en = 1 },
+	[RTD1625_CRT_RSTN_I2C_7]        = { .ofs = 0x880, .bit = 28, .write_en = 1 },
+	[RTD1625_CRT_RSTN_I2C_6]        = { .ofs = 0x880, .bit = 30, .write_en = 1 },
+	/* Bank 11: offset 0x890 */
+	[RTD1625_CRT_RSTN_SPI0]         = { .ofs = 0x890, .bit = 0,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_SPI1]         = { .ofs = 0x890, .bit = 2,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_SPI2]         = { .ofs = 0x890, .bit = 4,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_LSADC0]       = { .ofs = 0x890, .bit = 16, .write_en = 1 },
+	[RTD1625_CRT_RSTN_LSADC1]       = { .ofs = 0x890, .bit = 18, .write_en = 1 },
+	[RTD1625_CRT_RSTN_ISOMIS_DMA]   = { .ofs = 0x890, .bit = 20, .write_en = 1 },
+	[RTD1625_CRT_RSTN_AUDIO_ADC]    = { .ofs = 0x890, .bit = 22, .write_en = 1 },
+	[RTD1625_CRT_RSTN_DPTX]         = { .ofs = 0x890, .bit = 24, .write_en = 1 },
+	[RTD1625_CRT_RSTN_AUCPU1_REG]   = { .ofs = 0x890, .bit = 26, .write_en = 1 },
+	[RTD1625_CRT_RSTN_EDPTX]        = { .ofs = 0x890, .bit = 28, .write_en = 1 },
+};
+
+static const struct rtd1625_reset_info rtd1625_crt_info = {
+	.descs = rtd1625_crt_reset_descs,
+	.nr_resets = ARRAY_SIZE(rtd1625_crt_reset_descs),
+};
+
+static const struct rtk_reset_desc rtd1625_iso_reset_descs[] = {
+	[RTD1625_ISO_RSTN_VFD]                 = { .ofs = 0x88, .bit = 0 },
+	[RTD1625_ISO_RSTN_CEC0]                = { .ofs = 0x88, .bit = 2 },
+	[RTD1625_ISO_RSTN_CEC1]                = { .ofs = 0x88, .bit = 3 },
+	[RTD1625_ISO_RSTN_CBUSTX]              = { .ofs = 0x88, .bit = 5 },
+	[RTD1625_ISO_RSTN_CBUSRX]              = { .ofs = 0x88, .bit = 6 },
+	[RTD1625_ISO_RSTN_USB3_PHY2_XTAL_POW]  = { .ofs = 0x88, .bit = 7 },
+	[RTD1625_ISO_RSTN_UR0]                 = { .ofs = 0x88, .bit = 8 },
+	[RTD1625_ISO_RSTN_GMAC]                = { .ofs = 0x88, .bit = 9 },
+	[RTD1625_ISO_RSTN_GPHY]                = { .ofs = 0x88, .bit = 10 },
+	[RTD1625_ISO_RSTN_I2C_0]               = { .ofs = 0x88, .bit = 11 },
+	[RTD1625_ISO_RSTN_I2C_1]               = { .ofs = 0x88, .bit = 12 },
+	[RTD1625_ISO_RSTN_CBUS]                = { .ofs = 0x88, .bit = 13 },
+	[RTD1625_ISO_RSTN_USB_DRD]             = { .ofs = 0x88, .bit = 14 },
+	[RTD1625_ISO_RSTN_USB_HOST]            = { .ofs = 0x88, .bit = 15 },
+	[RTD1625_ISO_RSTN_USB_PHY_0]           = { .ofs = 0x88, .bit = 16 },
+	[RTD1625_ISO_RSTN_USB_PHY_1]           = { .ofs = 0x88, .bit = 17 },
+	[RTD1625_ISO_RSTN_USB_PHY_2]           = { .ofs = 0x88, .bit = 18 },
+	[RTD1625_ISO_RSTN_USB]                 = { .ofs = 0x88, .bit = 19 },
+	[RTD1625_ISO_RSTN_TYPE_C]              = { .ofs = 0x88, .bit = 20 },
+	[RTD1625_ISO_RSTN_USB_U3_HOST]         = { .ofs = 0x88, .bit = 21 },
+	[RTD1625_ISO_RSTN_USB3_PHY0_POW]       = { .ofs = 0x88, .bit = 22 },
+	[RTD1625_ISO_RSTN_USB3_P0_MDIO]        = { .ofs = 0x88, .bit = 23 },
+	[RTD1625_ISO_RSTN_USB3_PHY1_POW]       = { .ofs = 0x88, .bit = 24 },
+	[RTD1625_ISO_RSTN_USB3_P1_MDIO]        = { .ofs = 0x88, .bit = 25 },
+	[RTD1625_ISO_RSTN_VTC]                 = { .ofs = 0x88, .bit = 26 },
+	[RTD1625_ISO_RSTN_USB3_PHY2_POW]       = { .ofs = 0x88, .bit = 27 },
+	[RTD1625_ISO_RSTN_USB3_P2_MDIO]        = { .ofs = 0x88, .bit = 28 },
+	[RTD1625_ISO_RSTN_USB_PHY_3]           = { .ofs = 0x88, .bit = 29 },
+	[RTD1625_ISO_RSTN_USB_PHY_4]           = { .ofs = 0x88, .bit = 30 },
+};
+
+static const struct rtd1625_reset_info rtd1625_iso_info = {
+	.descs = rtd1625_iso_reset_descs,
+	.nr_resets = ARRAY_SIZE(rtd1625_iso_reset_descs),
+};
+
+static const struct rtk_reset_desc rtd1625_iso_s_reset_descs[] = {
+	[RTD1625_ISO_S_RSTN_ISOM_MIS] = { .ofs = 0x310, .bit = 0, .write_en = 1 },
+	[RTD1625_ISO_S_RSTN_GPIOM]    = { .ofs = 0x310, .bit = 2, .write_en = 1 },
+	[RTD1625_ISO_S_RSTN_TIMER7]   = { .ofs = 0x310, .bit = 4, .write_en = 1 },
+	[RTD1625_ISO_S_RSTN_IRDA]     = { .ofs = 0x310, .bit = 6, .write_en = 1 },
+	[RTD1625_ISO_S_RSTN_UR10]     = { .ofs = 0x310, .bit = 8, .write_en = 1 },
+};
+
+static const struct rtd1625_reset_info rtd1625_iso_s_info = {
+	.descs = rtd1625_iso_s_reset_descs,
+	.nr_resets = ARRAY_SIZE(rtd1625_iso_s_reset_descs),
+};
+
+static int rtd1625_reset_probe(struct auxiliary_device *adev,
+			       const struct auxiliary_device_id *id)
+{
+	const struct rtd1625_reset_info *info;
+	struct device *dev = &adev->dev;
+	struct rtk_reset_data *data;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	info = (const struct rtd1625_reset_info *)id->driver_data;
+
+	data->descs           = info->descs;
+	data->regmap          = dev_get_platdata(dev);
+	data->rcdev.owner     = THIS_MODULE;
+	data->rcdev.nr_resets = info->nr_resets;
+	data->rcdev.ops       = &rtk_reset_ops;
+	data->rcdev.dev       = dev;
+	data->rcdev.of_node   = dev->of_node;
+
+	return devm_reset_controller_register(dev, &data->rcdev);
+}
+
+static const struct auxiliary_device_id rtd1625_reset_ids[] = {
+	{
+		.name = "clk_rtk.rtd1625_crt_rst",
+		.driver_data = (kernel_ulong_t)&rtd1625_crt_info },
+	{
+		.name = "clk_rtk.rtd1625_iso_rst",
+		.driver_data = (kernel_ulong_t)&rtd1625_iso_info },
+	{
+		.name = "clk_rtk.rtd1625_iso_s_rst",
+		.driver_data = (kernel_ulong_t)&rtd1625_iso_s_info },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(auxiliary, rtd1625_reset_ids);
+
+static struct auxiliary_driver rtd1625_reset_driver = {
+	.probe    = rtd1625_reset_probe,
+	.id_table = rtd1625_reset_ids,
+	.driver = {
+		.name = "rtd1625-reset",
+	},
+};
+module_auxiliary_driver(rtd1625_reset_driver);
+
+MODULE_DESCRIPTION("Realtek RTD1625 Reset Controller Driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("REALTEK_RESET");
-- 
2.43.0

