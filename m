Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.101
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793607344;
	b=gXXdDAX8ZJTs5Cvp37TQrrujje+qQJuzgsLR37G4n1AqpaD1HpRY0x8yYchZsvWBGHoF
	 ASBQkFz+NLe/Ih/B0fYgg3M/TclpAT8cd3G5DyOogCwQIPH0TIO9iu/elMMUbV1ThVg4e
	 9b3E01hruescGaK90OFDurJknzeJamab+wNIxYJzrfKujqX/gRi+F2miLK/Gb5OOz5Pmz
	 ga/rdI+AHUp+bFSbx+uROzUdJ99DPkIAP4rP8PwdzeOqQrJezaf2jnThB7t6bdhCnTJMr
	 JsUShHPfvIToVidAFol2BY9uEK8FRL7JPfe6C5tzf16fF9gnlUm07271MKeVRwTny5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793607344;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Y1krlvDf7HlqpvayGP5gZH3JH6j/hZyi6+iIRGjdZNk=;
	b=BrJ+kiW/GPwBei91B0RgmI6R7r2Uutvv9+KDr+/EfuIQkSfsm5OTIq1HpREyD6E0lTcp
	 LwPddUcMkcv+j/SYso+dMJdQp6SRdt/99EW+GAGeyHpjZFfWpyTQ9IdFs80Q5WPzLusx9
	 nrv9snSZ8oJd2lUFpt81/h+V2NfejkCfqDOed2ug/EDvIDdtiTxpxuUk/4q4/85DunR61
	 QYJuMOAXFpx+IbBliei8LmImzN7By2Ji3omDRZhQXQJ+jVj1BfKG9v8aAvg4kYCxWgfv6
	 tKrPi3zKYXfbOg3tRxhOXIfWIeqzpJ+HEYqKGHxwCjDEo5Dzxl7eQhViqfPp6+9fdCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.101
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022101.outbound.protection.outlook.com [52.101.126.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABAE606A332;
	Mon,  2 Nov 2026 08:15:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ABAE606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tQdh/th9e+rhgKUWHPLID0fXcxvHmRaw+ZRc2Fo0iWjceOo/DgXRJQHIzMVvQY8hXHSk7ikAnUpyKktHKeLMGWXxXSLtVv0DcYVUVu2fHQ/11v0jFq/LH6vnP3txtgVuaEGNxMDUEj07kSORboYSck2jK4nE+NaevYZy9S5IyLqdgcsIz6tb15idwHDeVnLMAIcAO6IYAp+y66WrlrwwxSwa0ckdK/Rl92gWKrWBFLprfEAaI6Ku2AIjxDuOL0t44jD0P333YWaRmP2sJNxM2R1IjovVsV618FcqXP5UxPED4+u7KjRBzG3OYykDU//TJJn6Nb/Vc4TkCVC656pFHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y1krlvDf7HlqpvayGP5gZH3JH6j/hZyi6+iIRGjdZNk=;
 b=Sz3RMwOIrofk9qNUP8+1HwmxH77du1gK6FEZ6CvjsSrrsj+PsN499xkgQJazMwCamv8zwp5Pdf5TCMkqozMPTUdTwkK83lGMhTsokJh18PHPIx2fUxkWilYYYM8/BH4BTLbiYta5W3Thkgo8hpzGlKH/SUn0CEnK9eBgVQVjIh6ALSN/vCCvELsM4eUvSo1H433HF2qonbeo15xqTlRgbjkMTcKe42uVK2DVL3IjVEkxFSPGI+KG4COFVRnjMg5b00wH8g/5HL+tDgk6EcGtjopxtRJt+3A7x8QejZIeAYa3/bXrsiU6WHCElEoYX4T5UT5YIEhwOrtNq6q42f04lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP301CA0056.JPNP301.PROD.OUTLOOK.COM (2603:1096:400:384::18)
 by SEYPR06MB6981.apcprd06.prod.outlook.com (2603:1096:101:1d3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Mon, 2 Nov 2026
 08:15:36 +0000
Received: from TY2PEPF0000AB86.apcprd03.prod.outlook.com
 (2603:1096:400:384:cafe::ad) by TYCP301CA0056.outlook.office365.com
 (2603:1096:400:384::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 08:15:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB86.mail.protection.outlook.com (10.167.253.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 08:15:35 +0000
Received: from gary-System-Product-Name (unknown [172.16.64.55])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id BFD7E40920E1;
	Mon,  2 Nov 2026 16:15:33 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Cc: CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH 2/3] phy: cix: add Sky1 USB/DP combo PHY driver
Date: Mon,  2 Nov 2026 16:15:31 +0800
Message-ID: <20261102081532.2305142-3-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261102081532.2305142-1-gary.yang@cixtech.com>
References: <20261102081532.2305142-1-gary.yang@cixtech.com>
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB86:EE_|SEYPR06MB6981:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7d46a47e-fc49-4a04-7811-08df38b978b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|1800799024|23010399003|6133799003|10067099003|22082099003|18002099003|56012099006|261021121427099003|261021123027099003|261026121527099003|261026140227099003|261022105027099003|261022075727099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	B3Z6IdwhB0Yw5QAE3n4l1rQ1IfcILpI6Q64d2cDIEe4rz0FE5Gu3IQ7YuI8HdyFrK3FGyZovy/qLH0BgIlFBgVhadhTW72x9iCBadz5ypMYoT6Jkue5FPOpW0wKP+CjEaDxWG46oEIWh7xqJ/TJzS3nOjbRn5c3FT1CNLk3phwY9+gzPvXhDrEBu38fjbA84QoSHdaLN1D7/9tCxOA7ZtV+h1YgjvFR1fMt7tOJ7+g6GVvDokeF8siYDccliftNcx9uJUs26molosJEnXLgPR29fEb/lg7rGvuRQzpPwjl39N3qVGHigcIo52aLst57Aj7t5HlAybmxni3WCGRhlSo4SP2sfgJjN/hwpVZfdLcdYP/FC/BQML17ynfYMjTV6CpydPXDjbclqpD+hC4kWZ5CbRcih8wlPtl1/t5rQzQD0+Q3+0wZpVD02pFQAtPVk1zfjGUtaYWJi4/CXR038YxWZo75umNGH4dppyS38y/SpLARM5jzjyKH06s2amTk2XwUR/dZGX/fJctS2CbkbEca8NvzwcmC+GlqMdciczGOZxq90dO/wa7uRgFIRaw5pMdLZS0JxjLwcslh4Mh80BP36bviR6EqirHP3JboZzdIsRWpB2sxFHgsIecQd+cQjew5wIfYDaYoOgSlC1mt5ztiv+wl8YZfA/8aMqcVq3C4WLcm48zXIrcFHA44zRvQX
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(1800799024)(23010399003)(6133799003)(10067099003)(22082099003)(18002099003)(56012099006)(261021121427099003)(261021123027099003)(261026121527099003)(261026140227099003)(261022105027099003)(261022075727099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	smWqUeTXGmXPdHd14R8Stl0S8rk/BCKDQzA9cfY3M3f6WExpzktGVd3uhOevj2sRRz7DbBwu1FRqav8SNrZhq/29AoPJ2HeCKg/6meKWCvuFiALkSbcsSSagERE5V4jD1IF2cXaXYFbq+M+ohwCOGo8mew0wt9lZd/038aA7CUlVcsScOYxa+1jaXZM/7N0A2x5TwbNJhm8bgjyULiv9Wl1fqK6dcex5fHkjYSraUKJM6dCM/eiBpNpviKBkwVEB9RRt1H5QyMYLKEHKr2ioyFaB6840Pkqy9JAP7DlD9ob13Qyla3LAKlS6Fww5DDCbdmmlNxskitfjwG8DT/t9E0r2zV1raE4oy+aOpRYUrjcfczRwnzqOur4r/mcN6IhJTNdtF4Gwj3in9vmeW2yYd1GjzTKLbLWJ3k4FQ2tNzN2jbNmpt5iX+lZuDUDc/ijd
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 08:15:35.2623
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d46a47e-fc49-4a04-7811-08df38b978b0
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB86.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6981

Add a driver for the USB/DP combo PHY found on the CIX Sky1 SoC. A
single PHY instance drives one SuperSpeedPlus USB lane and one
DisplayPort lane of a USB Type-C port, and exposes the two lanes as
separate child PHYs so that the USB and DP controllers can bind to
them independently.

The PHY supports Type-C plug orientation switching and lane muxing
between USB and DP, both driven through the S5 system controller. It
registers a Type-C switch and mux with the Type-C class, so the
orientation and mode decisions are taken by the connector driver
instead of the PHY.

The bootloader may hand over the port already initialized; in that
case the first power_on calls skip the re-initialization.

Reviewed-by: Fugang Duan <fugang.duan@cixtech.com>
Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 MAINTAINERS                     |    1 +
 drivers/phy/Kconfig             |    1 +
 drivers/phy/Makefile            |    1 +
 drivers/phy/cix/Kconfig         |   22 +
 drivers/phy/cix/Makefile        |    2 +
 drivers/phy/cix/phy-cix-usbdp.c | 1477 +++++++++++++++++++++++++++++++
 drivers/phy/cix/phy-cix-usbdp.h |  265 ++++++
 7 files changed, 1769 insertions(+)
 create mode 100644 drivers/phy/cix/Kconfig
 create mode 100644 drivers/phy/cix/Makefile
 create mode 100644 drivers/phy/cix/phy-cix-usbdp.c
 create mode 100644 drivers/phy/cix/phy-cix-usbdp.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 8fb940a3ea3b..ed595861174b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2906,6 +2906,7 @@ F:	Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml
 F:	Documentation/devicetree/bindings/phy/cix,sky1-usbdp-phy.yaml
 F:	arch/arm64/boot/dts/cix/
 F:	drivers/mailbox/cix-mailbox.c
+F:	drivers/phy/cix/
 K:	\bcix\b
 
 ARM/CLKDEV SUPPORT
diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 105fbe408aa2..876e5857634c 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -176,6 +176,7 @@ source "drivers/phy/axiado/Kconfig"
 source "drivers/phy/broadcom/Kconfig"
 source "drivers/phy/cadence/Kconfig"
 source "drivers/phy/canaan/Kconfig"
+source "drivers/phy/cix/Kconfig"
 source "drivers/phy/eswin/Kconfig"
 source "drivers/phy/freescale/Kconfig"
 source "drivers/phy/hisilicon/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index c6dd02003bbe..5a31c5df1746 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_GENERIC_PHY)		+= allwinner/	\
 					   broadcom/	\
 					   cadence/	\
 					   canaan/	\
+					   cix/		\
 					   eswin/	\
 					   freescale/	\
 					   hisilicon/	\
diff --git a/drivers/phy/cix/Kconfig b/drivers/phy/cix/Kconfig
new file mode 100644
index 000000000000..769ec302657c
--- /dev/null
+++ b/drivers/phy/cix/Kconfig
@@ -0,0 +1,22 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Phy drivers for CIX platforms
+#
+
+config PHY_CIX_USBDP
+	tristate "CIX USB3/DP combo PHY driver"
+	depends on ARCH_CIX || COMPILE_TEST
+	depends on OF
+	depends on HAS_IOMEM
+	depends on RESET_CONTROLLER
+	depends on TYPEC
+	select GENERIC_PHY
+	select MFD_SYSCON
+	select REGMAP
+	help
+	  Enable this to support the CIX USB3/DP combo PHY, which provides
+	  one SuperSpeedPlus USB lane and one DisplayPort lane for a USB
+	  Type-C port.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called phy-cix-usbdp.
diff --git a/drivers/phy/cix/Makefile b/drivers/phy/cix/Makefile
new file mode 100644
index 000000000000..68b5d7a029a8
--- /dev/null
+++ b/drivers/phy/cix/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_PHY_CIX_USBDP)		+= phy-cix-usbdp.o
diff --git a/drivers/phy/cix/phy-cix-usbdp.c b/drivers/phy/cix/phy-cix-usbdp.c
new file mode 100644
index 000000000000..d596e89c74f7
--- /dev/null
+++ b/drivers/phy/cix/phy-cix-usbdp.c
@@ -0,0 +1,1477 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * phy driver for cdn_sd0804_t7g_typec
+ */
+
+#include <linux/array_size.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+#include <linux/usb/typec_dp.h>
+#include <linux/usb/typec_mux.h>
+
+#include "phy-cix-usbdp.h"
+
+enum {
+	UDPHY_MODE_NONE		= 0,
+	UDPHY_MODE_USB		= BIT(0),
+	UDPHY_MODE_DP		= BIT(1),
+	UDPHY_MODE_DP_USB	= BIT(1) | BIT(0),
+};
+
+#define PHY_LANE_MUX_USB			0
+#define PHY_LANE_MUX_DP				1
+
+struct cix_udphy;
+
+struct cix_udphy_con_dir {
+	u16 offset;
+	u8 bit;
+};
+
+struct cix_udphy_cfg {
+	const struct cix_udphy_con_dir *con_dir;
+	int (*udphy_init)(struct cix_udphy *udphy);
+	int (*udphy_exit)(struct cix_udphy *udphy);
+};
+
+/*
+ * USB 3.0/3.1 Type C Alt Mode
+ *   port 0: USB_TCAM; port 1, DP, 8.1 Gbps by default
+ */
+static const struct reg_sequence sky1_udphy_usbdp_conf_normal[] = {
+	{CMN_SSM_BIAS_TMR,              0x0018},
+	{CMN_PLLSM0_PLLPRE_TMR,         0x0030},
+	{CMN_PLLSM0_PLLLOCK_TMR,        0x00f0},
+	{CMN_PLLSM1_PLLPRE_TMR,         0x0030},
+	{CMN_PLLSM1_PLLLOCK_TMR,        0x00f0},
+	{CMN_BGCAL_INIT_TMR,            0x0078},
+	{CMN_BGCAL_ITER_TMR,            0x0078},
+	{CMN_IBCAL_INIT_TMR,            0x0018},
+	{CMN_TXPUCAL_INIT_TMR,          0x001d},
+	{CMN_TXPDCAL_INIT_TMR,          0x001d},
+	{CMN_RXCAL_INIT_TMR,            0x02d0},
+	{CMN_SD_CAL_PLLCNT_START,       0x0137},
+
+	{RX_SDCAL0_INIT_TMR_LANE0,      0x0018},
+	{RX_SDCAL0_INIT_TMR_LANE1,      0x0018},
+	{RX_SDCAL0_INIT_TMR_LANE2,      0x0018},
+	{RX_SDCAL0_INIT_TMR_LANE3,      0x0018},
+	{RX_SDCAL0_ITER_TMR_LANE0,      0x0078},
+	{RX_SDCAL0_ITER_TMR_LANE1,      0x0078},
+	{RX_SDCAL0_ITER_TMR_LANE2,      0x0078},
+	{RX_SDCAL0_ITER_TMR_LANE3,      0x0078},
+	{RX_SDCAL1_INIT_TMR_LANE0,      0x0018},
+	{RX_SDCAL1_INIT_TMR_LANE1,      0x0018},
+	{RX_SDCAL1_INIT_TMR_LANE2,      0x0018},
+	{RX_SDCAL1_INIT_TMR_LANE3,      0x0018},
+	{RX_SDCAL1_ITER_TMR_LANE0,      0x0078},
+	{RX_SDCAL1_ITER_TMR_LANE1,      0x0078},
+	{RX_SDCAL1_ITER_TMR_LANE2,      0x0078},
+	{RX_SDCAL1_ITER_TMR_LANE3,      0x0078},
+	{TX_RCVDET_ST_TMR_LANE0,        0x0960},
+	{TX_RCVDET_ST_TMR_LANE1,        0x0960},
+	{TX_RCVDET_ST_TMR_LANE2,        0x0960},
+	{TX_RCVDET_ST_TMR_LANE3,        0x0960},
+
+	{CMN_PDIAG_PLL0_CLK_SEL_M0,     0x8600},
+	{CMN_PDIAG_PLL1_CLK_SEL_M0,     0x0601},
+	{XCVR_DIAG_PLLDRC_CTRL_LANE0,   0x0041},
+	{XCVR_DIAG_PLLDRC_CTRL_LANE1,   0x0041},
+	{XCVR_DIAG_HSCLK_SEL_LANE2,     0x0001},
+	{XCVR_DIAG_HSCLK_SEL_LANE3,     0x0001},
+	{XCVR_DIAG_HSCLK_DIV_LANE2,     0x0000},
+	{XCVR_DIAG_HSCLK_DIV_LANE3,     0x0000},
+	{XCVR_DIAG_PLLDRC_CTRL_LANE2,   0x0019},
+	{XCVR_DIAG_PLLDRC_CTRL_LANE3,   0x0019},
+
+	{CMN_PLL0_DSM_DIAG_M0,          0x0004},
+	{CMN_PLL1_DSM_DIAG_M0,          0x8004},
+	{CMN_PDIAG_PLL1_ITRIM_M0,       0x003f},
+	{CMN_PDIAG_PLL0_CP_PADJ_M0,     0x0B17},
+	{CMN_PDIAG_PLL1_CP_PADJ_M0,     0x0B17},
+	{CMN_PDIAG_PLL0_CP_IADJ_M0,     0x0E01},
+	{CMN_PDIAG_PLL1_CP_IADJ_M0,     0x0E01},
+	{CMN_PDIAG_PLL0_FILT_PADJ_M0,   0x0D05},
+	{CMN_PDIAG_PLL1_FILT_PADJ_M0,   0x0D05},
+
+	{CMN_PLL0_INTDIV_M0,            0x01A0},
+	{CMN_PLL1_INTDIV_M0,            0x01C2},
+	{CMN_PLL0_FRACDIVL_M0,          0xAAAB},
+
+	{CMN_PLL1_FRACDIVL_M0,          0x0000}, /* reset value. */
+
+	{CMN_PLL0_FRACDIVH_M0,          0x0002},
+	{CMN_PLL1_FRACDIVH_M0,          0x0002},
+	{CMN_PLL0_HIGH_THR_M0,          0x0116},
+	{CMN_PLL1_HIGH_THR_M0,          0x012C},
+	{CMN_PDIAG_PLL0_CTRL_M0,        0x1002},
+	{CMN_PDIAG_PLL1_CTRL_M0,        0x1002},
+	{CMN_PLL0_SS_CTRL1_M0,          0x0001},
+	{CMN_PLL1_SS_CTRL1_M0,          0x0001},
+	{CMN_PLL0_SS_CTRL2_M0,          0x0416},
+	{CMN_PLL1_SS_CTRL2_M0,          0x044F},
+	{CMN_PLL0_SS_CTRL3_M0,          0x007C},
+	{CMN_PLL1_SS_CTRL3_M0,          0x007F},
+	{CMN_PLL0_SS_CTRL4_M0,          0x0003},
+	{CMN_PLL1_SS_CTRL4_M0,          0x0003},
+	{CMN_PLL0_VCOCAL_INIT_TMR,      0x00F0},
+	{CMN_PLL1_VCOCAL_INIT_TMR,      0x00F0},
+	{CMN_PLL0_VCOCAL_ITER_TMR,      0x0004},
+	{CMN_PLL1_VCOCAL_ITER_TMR,      0x0004},
+	{CMN_PLL0_VCOCAL_REFTIM_START,  0x02F8},
+	{CMN_PLL1_VCOCAL_REFTIM_START,  0x02F8},
+	{CMN_PLL0_VCOCAL_PLLCNT_START,  0x02F6},
+	{CMN_PLL1_VCOCAL_PLLCNT_START,  0x02F6},
+	{CMN_PLL0_VCOCAL_TCTRL,         0x0003},
+	{CMN_PLL1_VCOCAL_TCTRL,         0x0003},
+	{CMN_PLL0_LOCK_REFCNT_START,    0x00BF},
+	{CMN_PLL1_LOCK_REFCNT_START,    0x00BF},
+	{CMN_PLL0_LOCK_PLLCNT_START,    0x00BF},
+	{CMN_PLL1_LOCK_PLLCNT_START,    0x00BF},
+	{CMN_PLL0_LOCK_PLLCNT_THR,      0x0005},
+	{CMN_PLL1_LOCK_PLLCNT_THR,      0x0005},
+
+	/* usb_part */
+	{PHY_PMA_LANE_MAP,              0x5100},
+	{PHY_LANE_OFF_CTRL,             0x0100},
+	{PHY_PIPE_USB3_GEN2_PRE_CFG0,   0x0A0A},
+	{PHY_PIPE_USB3_GEN2_POST_CFG0,  0x1000},
+	{PHY_PIPE_USB3_GEN2_POST_CFG1,  0x0010},
+	{CMN_CDIAG_CDB_PWRI_OVRD,       0x8200},
+	{CMN_CDIAG_XCVRC_PWRI_OVRD,     0x8200},
+	{TX_PSC_A0_LANE0,               0x02FF},
+	{TX_PSC_A1_LANE0,               0x06AF},
+	{TX_PSC_A2_LANE0,               0x06AE},
+	{TX_PSC_A3_LANE0,               0x06AE},
+	{RX_PSC_A0_LANE1,               0x0D1D},
+	{RX_PSC_A1_LANE1,               0x0D1D},
+	{RX_PSC_A2_LANE1,               0x0D00},
+	{RX_PSC_A3_LANE1,               0x0500},
+	{TX_TXCC_CTRL_LANE0,            0x2A82},
+	{TX_TXCC_CPOST_MULT_01_LANE0,   0x0014},
+	{TX_TXCC_MGNFS_MULT_000_LANE0,  0x0007},
+	{RX_SIGDET_HL_FILT_TMR_LANE1,   0x0013},
+	{RX_REE_GCSM1_CTRL_LANE1,       0x0000},
+	{RX_REE_ATTEN_THR_LANE1,        0x0C02},
+	{RX_REE_SMGM_CTRL1_LANE1,       0x0330},
+	{RX_REE_SMGM_CTRL2_LANE1,       0x0300},
+	{XCVR_DIAG_PSC_OVRD_LANE1,      0x0003},
+	{RX_DIAG_SIGDET_TUNE_LANE1,     0x1004},
+	{RX_DIAG_NQST_CTRL_LANE1,       0x00F9},
+	{RX_DIAG_DFE_AMP_TUNE_2_LANE1,  0x0C01},
+	{RX_DIAG_DFE_AMP_TUNE_3_LANE1,  0x0002},
+	{RX_DIAG_PI_CAP_LANE1,          0x0000},
+	{RX_DIAG_PI_RATE_LANE1,         0x0031},
+	{RX_DIAG_ACYA_LANE0,            0x0002},
+	{RX_CDRLF_CNFG_LANE1,           0x018C},
+	{RX_CDRLF_CNFG3_LANE1,          0x0003},
+	/* usb adding to upspeed */
+	{XCVR_DIAG_BIDI_CTRL_LANE0,     0x000f}, /* new add */
+	{XCVR_DIAG_BIDI_CTRL_LANE1,     0x00F0}, /* new add */
+
+	/* dp_part */
+	{PHY_PMA_ISO_PLL_CTRL0,         0x000B},
+	{PHY_PMA_ISO_PLL_CTRL1,         0x2224},
+
+	{TX_PSC_A0_LANE2,              0x00FB},
+	{TX_PSC_A0_LANE3,              0x00FB},
+	{TX_PSC_A2_LANE2,              0x04AA},
+	{TX_PSC_A2_LANE3,              0x04AA},
+	{TX_PSC_A3_LANE2,              0x04AA},
+	{TX_PSC_A3_LANE3,              0x04AA},
+	{RX_PSC_A0_LANE2,              0x0000},
+	{RX_PSC_A0_LANE3,              0x0000},
+	{RX_PSC_A2_LANE2,              0x0000},
+	{RX_PSC_A2_LANE3,              0x0000},
+	{RX_PSC_A3_LANE2,              0x0000},
+	{RX_PSC_A3_LANE3,              0x0000},
+	{RX_PSC_CAL_LANE2,             0x0000},
+	{RX_PSC_CAL_LANE3,             0x0000},
+	{XCVR_DIAG_BIDI_CTRL_LANE2,    0x000F},
+	{XCVR_DIAG_BIDI_CTRL_LANE3,    0x000F},
+	{RX_REE_GCSM1_CTRL_LANE2,      0x0000},
+	{RX_REE_GCSM1_CTRL_LANE3,      0x0000},
+	{RX_REE_GCSM2_CTRL_LANE2,      0x0000},
+	{RX_REE_GCSM2_CTRL_LANE3,      0x0000},
+	{RX_REE_PERGCSM_CTRL_LANE2,    0x0000},
+	{RX_REE_PERGCSM_CTRL_LANE3,    0x0000},
+
+	{CMN_DIAG_GPANA_0,             0x0100}, /* new add */
+};
+
+/*
+ * TYPEC_ALT_MODE_DP
+ *   DP only
+ */
+static const struct reg_sequence sky1_udphy_dp_conf[] = {
+	{CMN_SSM_BIAS_TMR,              0x0018},
+	{CMN_PLLSM0_PLLPRE_TMR,         0x0030},
+	{CMN_PLLSM0_PLLLOCK_TMR,        0x00f0},
+	{CMN_PLLSM1_PLLPRE_TMR,         0x0030},
+	{CMN_PLLSM1_PLLLOCK_TMR,        0x00f0},
+	{CMN_BGCAL_INIT_TMR,            0x0078},
+	{CMN_BGCAL_ITER_TMR,            0x0078},
+	{CMN_IBCAL_INIT_TMR,            0x0018},
+	{CMN_TXPUCAL_INIT_TMR,          0x001d},
+	{CMN_TXPDCAL_INIT_TMR,          0x001d},
+	{CMN_RXCAL_INIT_TMR,            0x02d0},
+	{CMN_SD_CAL_PLLCNT_START,       0x0137},
+	{RX_SDCAL0_INIT_TMR_LANE0,      0x0018},
+	{RX_SDCAL0_INIT_TMR_LANE1,      0x0018},
+	{RX_SDCAL0_INIT_TMR_LANE2,      0x0018},
+	{RX_SDCAL0_INIT_TMR_LANE3,      0x0018},
+	{RX_SDCAL0_ITER_TMR_LANE0,      0x0078},
+	{RX_SDCAL0_ITER_TMR_LANE1,      0x0078},
+	{RX_SDCAL0_ITER_TMR_LANE2,      0x0078},
+	{RX_SDCAL0_ITER_TMR_LANE3,      0x0078},
+	{RX_SDCAL1_INIT_TMR_LANE0,      0x0018},
+	{RX_SDCAL1_INIT_TMR_LANE1,      0x0018},
+	{RX_SDCAL1_INIT_TMR_LANE2,      0x0018},
+	{RX_SDCAL1_INIT_TMR_LANE3,      0x0018},
+	{RX_SDCAL1_ITER_TMR_LANE0,      0x0078},
+	{RX_SDCAL1_ITER_TMR_LANE1,      0x0078},
+	{RX_SDCAL1_ITER_TMR_LANE2,      0x0078},
+	{RX_SDCAL1_ITER_TMR_LANE3,      0x0078},
+	{TX_RCVDET_ST_TMR_LANE0,        0x0960},
+	{TX_RCVDET_ST_TMR_LANE1,        0x0960},
+	{TX_RCVDET_ST_TMR_LANE2,        0x0960},
+	{TX_RCVDET_ST_TMR_LANE3,        0x0960},
+	{CMN_PDIAG_PLL0_CLK_SEL_M0,     0x8600},
+	{CMN_PDIAG_PLL1_CLK_SEL_M0,     0x0701},
+	{XCVR_DIAG_HSCLK_SEL_LANE0,     0x0001},
+	{XCVR_DIAG_HSCLK_SEL_LANE1,     0x0001},
+	{XCVR_DIAG_HSCLK_SEL_LANE2,     0x0001},
+	{XCVR_DIAG_HSCLK_SEL_LANE3,     0x0001},
+	{XCVR_DIAG_HSCLK_DIV_LANE0,     0x0001},
+	{XCVR_DIAG_HSCLK_DIV_LANE1,     0x0001},
+	{XCVR_DIAG_HSCLK_DIV_LANE2,     0x0001},
+	{XCVR_DIAG_HSCLK_DIV_LANE3,     0x0001},
+	{XCVR_DIAG_PLLDRC_CTRL_LANE0,   0x0019},
+	{XCVR_DIAG_PLLDRC_CTRL_LANE1,   0x0019},
+	{XCVR_DIAG_PLLDRC_CTRL_LANE2,   0x0019},
+	{XCVR_DIAG_PLLDRC_CTRL_LANE3,   0x0019},
+	{CMN_PLL0_DSM_DIAG_M0,          0x0004},
+	{CMN_PLL1_DSM_DIAG_M0,          0x8004},
+	{CMN_PDIAG_PLL1_ITRIM_M0,       0x003f},
+
+	{CMN_PDIAG_PLL0_CP_PADJ_M0,     0x0b17},
+	{CMN_PDIAG_PLL1_CP_PADJ_M0,     0x0b17},
+	{CMN_PDIAG_PLL0_CP_IADJ_M0,     0x0e01},
+	{CMN_PDIAG_PLL1_CP_IADJ_M0,     0x0e01},
+	{CMN_PDIAG_PLL0_FILT_PADJ_M0,   0x0d05},
+	{CMN_PDIAG_PLL1_FILT_PADJ_M0,   0x0d05},
+	{CMN_PLL0_INTDIV_M0,            0x01a0},
+	{CMN_PLL1_INTDIV_M0,            0x01c2},
+	{CMN_PLL0_FRACDIVL_M0,          0xaaab},
+	{CMN_PLL1_FRACDIVL_M0,          0x0000},
+	{CMN_PLL0_FRACDIVH_M0,          0x0002},
+	{CMN_PLL1_FRACDIVH_M0,          0x0002},
+	{CMN_PLL0_HIGH_THR_M0,          0x0116},
+	{CMN_PLL1_HIGH_THR_M0,          0x012c},
+	{CMN_PDIAG_PLL0_CTRL_M0,        0x1002},
+	{CMN_PDIAG_PLL1_CTRL_M0,        0x1002},
+
+	{CMN_PLL0_SS_CTRL1_M0,          0x0001},
+	{CMN_PLL1_SS_CTRL1_M0,          0x0001},
+	{CMN_PLL0_SS_CTRL2_M0,          0x0416},
+	{CMN_PLL1_SS_CTRL2_M0,          0x044F},
+	{CMN_PLL0_SS_CTRL3_M0,          0x007C},
+	{CMN_PLL1_SS_CTRL3_M0,          0x007F},
+	{CMN_PLL0_SS_CTRL4_M0,          0x0003},
+	{CMN_PLL1_SS_CTRL4_M0,          0x0003},
+
+	{CMN_PLL0_VCOCAL_INIT_TMR,      0x00f0},
+	{CMN_PLL1_VCOCAL_INIT_TMR,      0x00f0},
+	{CMN_PLL0_VCOCAL_ITER_TMR,      0x0004},
+	{CMN_PLL1_VCOCAL_ITER_TMR,      0x0004},
+	{CMN_PLL0_VCOCAL_REFTIM_START,  0x02f8},
+	{CMN_PLL1_VCOCAL_REFTIM_START,  0x02f8},
+	{CMN_PLL0_VCOCAL_PLLCNT_START,  0x02f6},
+	{CMN_PLL1_VCOCAL_PLLCNT_START,  0x02f6},
+	{CMN_PLL0_VCOCAL_TCTRL,         0x0003},
+	{CMN_PLL1_VCOCAL_TCTRL,         0x0003},
+	{CMN_PLL0_LOCK_REFCNT_START,    0x00bf},
+	{CMN_PLL1_LOCK_REFCNT_START,    0x00bf},
+	{CMN_PLL0_LOCK_PLLCNT_START,    0x00bf},
+	{CMN_PLL1_LOCK_PLLCNT_START,    0x00bf},
+	{CMN_PLL0_LOCK_PLLCNT_THR,      0x0005},
+	{CMN_PLL1_LOCK_PLLCNT_THR,      0x0005},
+	{PHY_PMA_LANE_MAP,              0x51D9},
+	{PHY_LANE_OFF_CTRL,             0x0100},
+	{PHY_PIPE_USB3_GEN2_PRE_CFG0,   0x0a0a},
+	{PHY_PIPE_USB3_GEN2_POST_CFG0,  0x1000},
+	{PHY_PIPE_USB3_GEN2_POST_CFG1,  0x0010},
+	{CMN_CDIAG_CDB_PWRI_OVRD,       0x8200},
+	{CMN_CDIAG_XCVRC_PWRI_OVRD,     0x8200},
+
+	{PHY_PMA_ISO_PLL_CTRL0,         0x000b},
+	{PHY_PMA_ISO_PLL_CTRL1,         0x2224},
+	{TX_PSC_A0_LANE0,               0x00fb},
+	{TX_PSC_A0_LANE1,               0x00fb},
+	{TX_PSC_A0_LANE2,               0x00fb},
+	{TX_PSC_A0_LANE3,               0x00fb},
+	{TX_PSC_A2_LANE0,               0x04aa},
+	{TX_PSC_A2_LANE1,               0x04aa},
+	{TX_PSC_A2_LANE2,               0x04aa},
+	{TX_PSC_A2_LANE3,               0x04aa},
+	{TX_PSC_A3_LANE0,               0x04aa},
+	{TX_PSC_A3_LANE1,               0x04aa},
+	{TX_PSC_A3_LANE2,               0x04aa},
+	{TX_PSC_A3_LANE3,               0x04aa},
+	{RX_PSC_A0_LANE0,               0x0000},
+	{RX_PSC_A0_LANE1,               0x0000},
+	{RX_PSC_A0_LANE2,               0x0000},
+	{RX_PSC_A0_LANE3,               0x0000},
+	{RX_PSC_A2_LANE0,               0x0000},
+	{RX_PSC_A2_LANE1,               0x0000},
+	{RX_PSC_A2_LANE2,               0x0000},
+	{RX_PSC_A2_LANE3,               0x0000},
+	{RX_PSC_A3_LANE0,               0x0000},
+	{RX_PSC_A3_LANE1,               0x0000},
+	{RX_PSC_A3_LANE2,               0x0000},
+	{RX_PSC_A3_LANE3,               0x0000},
+	{RX_PSC_CAL_LANE0,              0x0000},
+	{RX_PSC_CAL_LANE1,              0x0000},
+	{RX_PSC_CAL_LANE2,              0x0000},
+	{RX_PSC_CAL_LANE3,              0x0000},
+	{XCVR_DIAG_BIDI_CTRL_LANE0,     0x000f},
+	{XCVR_DIAG_BIDI_CTRL_LANE1,     0x000f},
+	{XCVR_DIAG_BIDI_CTRL_LANE2,     0x000f},
+	{XCVR_DIAG_BIDI_CTRL_LANE3,     0x000f},
+	{RX_REE_GCSM1_CTRL_LANE0,       0x0000},
+	{RX_REE_GCSM1_CTRL_LANE1,       0x0000},
+	{RX_REE_GCSM1_CTRL_LANE2,       0x0000},
+	{RX_REE_GCSM1_CTRL_LANE3,       0x0000},
+	{RX_REE_GCSM2_CTRL_LANE0,       0x0000},
+	{RX_REE_GCSM2_CTRL_LANE1,       0x0000},
+	{RX_REE_GCSM2_CTRL_LANE2,       0x0000},
+	{RX_REE_GCSM2_CTRL_LANE3,       0x0000},
+	{RX_REE_PERGCSM_CTRL_LANE0,     0x0000},
+	{RX_REE_PERGCSM_CTRL_LANE1,     0x0000},
+	{RX_REE_PERGCSM_CTRL_LANE2,     0x0000},
+	{RX_REE_PERGCSM_CTRL_LANE3,     0x0000},
+	{CMN_DIAG_GPANA_0,              0x0100},
+};
+
+static const struct reg_sequence sky1_udphy_dp_8p1_conf[] = {
+	{CMN_PDIAG_PLL1_ITRIM_M0,       0x007f},
+	{CMN_PLL1_SS_CTRL2_M0,          0x0430},
+	{CMN_PLL1_SS_CTRL3_M0,          0x0062},
+	{CMN_PLL1_SS_CTRL4_M0,          0x0004},
+};
+
+static const struct reg_sequence sky1_udphy_dp_partial_conf[] = {
+	{CMN_PDIAG_PLL1_ITRIM_M0,       0x003f},
+	{CMN_PLL1_SS_CTRL2_M0,          0x044F},
+	{CMN_PLL1_SS_CTRL3_M0,          0x007F},
+	{CMN_PLL1_SS_CTRL4_M0,          0x0003},
+};
+
+static const struct reg_sequence sky1_udphy_usbdp_conf_flip[] = {
+	/* common_part */
+	{CMN_SSM_BIAS_TMR,             0x0018},
+	{CMN_PLLSM0_PLLPRE_TMR,        0x0030},
+	{CMN_PLLSM0_PLLLOCK_TMR,       0x00F0},
+	{CMN_PLLSM1_PLLPRE_TMR,        0x0030},
+	{CMN_PLLSM1_PLLLOCK_TMR,       0x00F0},
+	{CMN_BGCAL_INIT_TMR,           0x0078},
+	{CMN_BGCAL_ITER_TMR,           0x0078},
+	{CMN_IBCAL_INIT_TMR,           0x0018},
+	{CMN_TXPUCAL_INIT_TMR,         0x001D},
+	{CMN_TXPDCAL_INIT_TMR,         0x001D},
+	{CMN_RXCAL_INIT_TMR,           0x02D0},
+	{CMN_SD_CAL_PLLCNT_START,      0x0137},
+	{RX_SDCAL0_INIT_TMR_LANE0,     0x0018},
+	{RX_SDCAL0_INIT_TMR_LANE1,     0x0018},
+	{RX_SDCAL0_INIT_TMR_LANE2,     0x0018},
+	{RX_SDCAL0_INIT_TMR_LANE3,     0x0018},
+	{RX_SDCAL0_ITER_TMR_LANE0,     0x0078},
+	{RX_SDCAL0_ITER_TMR_LANE1,     0x0078},
+	{RX_SDCAL0_ITER_TMR_LANE2,     0x0078},
+	{RX_SDCAL0_ITER_TMR_LANE3,     0x0078},
+	{RX_SDCAL1_INIT_TMR_LANE0,     0x0018},
+	{RX_SDCAL1_INIT_TMR_LANE1,     0x0018},
+	{RX_SDCAL1_INIT_TMR_LANE2,     0x0018},
+	{RX_SDCAL1_INIT_TMR_LANE3,     0x0018},
+	{RX_SDCAL1_ITER_TMR_LANE0,     0x0078},
+	{RX_SDCAL1_ITER_TMR_LANE1,     0x0078},
+	{RX_SDCAL1_ITER_TMR_LANE2,     0x0078},
+	{RX_SDCAL1_ITER_TMR_LANE3,     0x0078},
+	{TX_RCVDET_ST_TMR_LANE0,       0x0960},
+	{TX_RCVDET_ST_TMR_LANE1,       0x0960},
+	{TX_RCVDET_ST_TMR_LANE2,       0x0960},
+	{TX_RCVDET_ST_TMR_LANE3,       0x0960},
+	{CMN_PDIAG_PLL0_CLK_SEL_M0,    0x8600},
+	{CMN_PDIAG_PLL1_CLK_SEL_M0,    0x0601},
+	{XCVR_DIAG_PLLDRC_CTRL_LANE2,  0x0041},
+	{XCVR_DIAG_PLLDRC_CTRL_LANE3,  0x0041},
+	{XCVR_DIAG_HSCLK_SEL_LANE0,    0x0001},
+	{XCVR_DIAG_HSCLK_SEL_LANE1,    0x0001},
+	{XCVR_DIAG_HSCLK_DIV_LANE0,    0x0000},
+	{XCVR_DIAG_HSCLK_DIV_LANE1,    0x0000},
+	{XCVR_DIAG_PLLDRC_CTRL_LANE0,  0x0019},
+	{XCVR_DIAG_PLLDRC_CTRL_LANE1,  0x0019},
+	{CMN_PLL0_DSM_DIAG_M0,         0x0004},
+	{CMN_PLL1_DSM_DIAG_M0,         0x8004},
+	{CMN_PDIAG_PLL1_ITRIM_M0,      0x003f},
+	{CMN_PDIAG_PLL0_CP_PADJ_M0,    0x0B17},
+	{CMN_PDIAG_PLL1_CP_PADJ_M0,    0x0B17},
+	{CMN_PDIAG_PLL0_CP_IADJ_M0,    0x0E01},
+	{CMN_PDIAG_PLL1_CP_IADJ_M0,    0x0E01},
+	{CMN_PDIAG_PLL0_FILT_PADJ_M0,  0x0D05},
+	{CMN_PDIAG_PLL1_FILT_PADJ_M0,  0x0D05},
+
+	{CMN_PLL0_INTDIV_M0,           0x01A0},
+	{CMN_PLL1_INTDIV_M0,           0x01C2},
+	{CMN_PLL0_FRACDIVL_M0,         0xAAAB},
+
+	{CMN_PLL1_FRACDIVL_M0,         0x0000}, /* reset value */
+
+	{CMN_PLL0_FRACDIVH_M0,         0x0002},
+	{CMN_PLL1_FRACDIVH_M0,         0x0002},
+	{CMN_PLL0_HIGH_THR_M0,         0x0116},
+	{CMN_PLL1_HIGH_THR_M0,         0x012C},
+	{CMN_PDIAG_PLL0_CTRL_M0,       0x1002},
+	{CMN_PDIAG_PLL1_CTRL_M0,       0x1002},
+	{CMN_PLL0_SS_CTRL1_M0,         0x0001},
+	{CMN_PLL1_SS_CTRL1_M0,         0x0001},
+	{CMN_PLL0_SS_CTRL2_M0,         0x0416},
+	{CMN_PLL1_SS_CTRL2_M0,         0x044F},
+	{CMN_PLL0_SS_CTRL3_M0,         0x007C},
+	{CMN_PLL1_SS_CTRL3_M0,         0x007F},
+	{CMN_PLL0_SS_CTRL4_M0,         0x0003},
+	{CMN_PLL1_SS_CTRL4_M0,         0x0003},
+	{CMN_PLL0_VCOCAL_INIT_TMR,     0x00F0},
+	{CMN_PLL1_VCOCAL_INIT_TMR,     0x00F0},
+	{CMN_PLL0_VCOCAL_ITER_TMR,     0x0004},
+	{CMN_PLL1_VCOCAL_ITER_TMR,     0x0004},
+	{CMN_PLL0_VCOCAL_REFTIM_START, 0x02F8},
+	{CMN_PLL1_VCOCAL_REFTIM_START, 0x02F8},
+	{CMN_PLL0_VCOCAL_PLLCNT_START, 0x02F6},
+	{CMN_PLL1_VCOCAL_PLLCNT_START, 0x02F6},
+	{CMN_PLL0_VCOCAL_TCTRL,        0x0003},
+	{CMN_PLL1_VCOCAL_TCTRL,        0x0003},
+	{CMN_PLL0_LOCK_REFCNT_START,   0x00BF},
+	{CMN_PLL1_LOCK_REFCNT_START,   0x00BF},
+	{CMN_PLL0_LOCK_PLLCNT_START,   0x00BF},
+	{CMN_PLL1_LOCK_PLLCNT_START,   0x00BF},
+	{CMN_PLL0_LOCK_PLLCNT_THR,     0x0005},
+	{CMN_PLL1_LOCK_PLLCNT_THR,     0x0005},
+	/* usb_part */
+	{PHY_PMA_LANE_MAP,             0x5100},
+	{PHY_LANE_OFF_CTRL,            0x0100},
+	{PHY_PIPE_USB3_GEN2_PRE_CFG0,  0x0A0A},
+	{PHY_PIPE_USB3_GEN2_POST_CFG0, 0x1000},
+	{PHY_PIPE_USB3_GEN2_POST_CFG1, 0x0010},
+	{CMN_CDIAG_CDB_PWRI_OVRD,      0x8200},
+	{CMN_CDIAG_XCVRC_PWRI_OVRD,    0x8200},
+	{TX_PSC_A0_LANE3,              0x02FF},
+	{TX_PSC_A1_LANE3,              0x06AF},
+	{TX_PSC_A2_LANE3,              0x06AE},
+	{TX_PSC_A3_LANE3,              0x06AE},
+	{RX_PSC_A0_LANE2,              0x0D1D},
+	{RX_PSC_A1_LANE2,              0x0D1D},
+	{RX_PSC_A2_LANE2,              0x0D00},
+	{RX_PSC_A3_LANE2,              0x0500},
+	{TX_TXCC_CTRL_LANE3,           0x2A82},
+	{TX_TXCC_CPOST_MULT_01_LANE3,  0x0014},
+	{TX_TXCC_MGNFS_MULT_000_LANE3, 0x0007},
+	{RX_SIGDET_HL_FILT_TMR_LANE2,  0x0013},
+	{RX_REE_GCSM1_CTRL_LANE2,      0x0000},
+	{RX_REE_ATTEN_THR_LANE2,       0x0C02},
+	{RX_REE_SMGM_CTRL1_LANE2,      0x0330},
+	{RX_REE_SMGM_CTRL2_LANE2,      0x0300},
+	{XCVR_DIAG_PSC_OVRD_LANE2,     0x0003},
+	{RX_DIAG_SIGDET_TUNE_LANE2,    0x1004},
+	{RX_DIAG_NQST_CTRL_LANE2,      0x00F9},
+	{RX_DIAG_DFE_AMP_TUNE_2_LANE2, 0x0C01},
+	{RX_DIAG_DFE_AMP_TUNE_3_LANE2, 0x0002},
+	{RX_DIAG_PI_CAP_LANE2,         0x0000},
+	{RX_DIAG_PI_RATE_LANE2,        0x0031},
+	{RX_DIAG_ACYA_LANE3,           0x0002},
+	{RX_CDRLF_CNFG_LANE2,          0x018C},
+	{RX_CDRLF_CNFG3_LANE2,         0x0003},
+	/* usb adding to upspeed */
+	{XCVR_DIAG_BIDI_CTRL_LANE2,    0x00f0},
+	{XCVR_DIAG_BIDI_CTRL_LANE3,    0x000f},
+
+	/* dp_part */
+	{PHY_PMA_ISO_PLL_CTRL0,        0x000B},
+	{PHY_PMA_ISO_PLL_CTRL1,        0x2224},
+
+	/* lane0, lane1 */
+	{TX_PSC_A0_LANE0,              0x00FB},
+	{TX_PSC_A0_LANE1,              0x00FB},
+	{TX_PSC_A2_LANE0,              0x04AA},
+	{TX_PSC_A2_LANE1,              0x04AA},
+	{TX_PSC_A3_LANE0,              0x04AA},
+	{TX_PSC_A3_LANE1,              0x04AA},
+	{RX_PSC_A0_LANE0,              0x0000},
+	{RX_PSC_A0_LANE1,              0x0000},
+	{RX_PSC_A2_LANE0,              0x0000},
+	{RX_PSC_A2_LANE1,              0x0000},
+	{RX_PSC_A3_LANE0,              0x0000},
+	{RX_PSC_A3_LANE1,              0x0000},
+	{RX_PSC_CAL_LANE0,             0x0000},
+	{RX_PSC_CAL_LANE1,             0x0000},
+	{XCVR_DIAG_BIDI_CTRL_LANE0,    0x000F},
+	{XCVR_DIAG_BIDI_CTRL_LANE1,    0x000F},
+	{RX_REE_GCSM1_CTRL_LANE0,      0x0000},
+	{RX_REE_GCSM1_CTRL_LANE1,      0x0000},
+	{RX_REE_GCSM2_CTRL_LANE0,      0x0000},
+	{RX_REE_GCSM2_CTRL_LANE1,      0x0000},
+	{RX_REE_PERGCSM_CTRL_LANE0,    0x0000},
+	{RX_REE_PERGCSM_CTRL_LANE1,    0x0000},
+
+	{CMN_DIAG_GPANA_0,             0x100},
+};
+
+static const struct cix_udphy_con_dir sky1_udphy_con_dir[] = {
+	{0x420, 0},
+	{0x420, 1},
+	{0x420, 2},
+	{0x420, 3}
+};
+
+struct cix_udphy {
+	struct device *dev;
+	void __iomem *base;
+	struct regmap *phy_regmap;
+	struct regmap *usbphy_syscon;
+	struct reset_control *preset;
+	struct reset_control *reset;
+	struct clk *apb_clk;
+	struct typec_switch_dev *sw;
+	struct typec_mux_dev *mux;
+	struct mutex mutex; /* mutex to protect access to individual PHYs */
+	bool flip;
+	u8 cur_mode;
+	u8 next_mode;
+	u32 id;
+	const struct cix_udphy_cfg *cfg;
+};
+
+/* Link rate change */
+struct phy_link_cfg {
+	u32 hsclk_div;
+	u32 clk_sel;
+	u32 pll_intdiv;
+	u32 pll_fracdivl;
+	u32 pll_high_thr;
+};
+
+static const struct phy_link_cfg link_cfg[] = {
+	{ 0x0002, 0x0f01, 0x0195, 0x0000, 0x010e },  /* 1.62gbps */
+	{ 0x0001, 0x0701, 0x01c2, 0x0000, 0x012c },  /* 2.70gbps */
+	{ 0x0000, 0x0301, 0x01c2, 0x0000, 0x012c },  /* 5.40gbps */
+	{ 0x0000, 0x0200, 0x0151, 0x8000, 0x00e2 },  /* 8.10gbps */
+};
+
+struct phy_voltage_conf {
+	u32 tx_txcc_ctrl;
+	u32 drv_diag_tx_drv;
+	u32 tx_txcc_mgnfc_mult_000;
+	u32 tx_txcc_cpost_mult_00;
+};
+
+static const struct phy_voltage_conf volt_cfg[] = {
+	{ 0x08A4, 0x0003, 0x0028, 0x0000 }, /* swing level == 0 */
+	{ 0x08A4, 0x0003, 0x001f, 0x0014 },
+	{ 0x08A4, 0x0003, 0x0012, 0x0020 },
+	{ 0x08A4, 0x0003, 0x0000, 0x0027 },
+	{ 0x08A4, 0x0003, 0x001f, 0x0000 }, /* swing level == 1 */
+	{ 0x08A4, 0x0003, 0x0013, 0x0012 },
+	{ 0x08A4, 0x0003, 0x0000, 0x001f },
+	{ 0x08A4, 0x0003, 0x0000, 0x001f },
+	{ 0x08A4, 0x0003, 0x0013, 0x0000 }, /* swing level == 2 */
+	{ 0x08A4, 0x0003, 0x0000, 0x0013 },
+	{ 0x08A4, 0x0003, 0x0000, 0x0013 },
+	{ 0x08A4, 0x0003, 0x0000, 0x0013 },
+	{ 0x08A4, 0x0003, 0x0000, 0x0000 }, /* swing level == 3 */
+	{ 0x08A4, 0x0003, 0x0000, 0x0000 },
+	{ 0x08A4, 0x0003, 0x0000, 0x0000 },
+	{ 0x08A4, 0x0003, 0x0000, 0x0000 },
+};
+
+static int udphy_dplane_get(struct cix_udphy *udphy)
+{
+	int dp_lanes;
+
+	switch (udphy->next_mode) {
+	case UDPHY_MODE_DP:
+		dp_lanes = 4;
+		break;
+	case UDPHY_MODE_DP_USB:
+		dp_lanes = 2;
+		break;
+	case UDPHY_MODE_USB:
+		fallthrough;
+	default:
+		dp_lanes = 0;
+		break;
+	}
+
+	return dp_lanes;
+}
+
+static int sky1_udphy_clk_enable(struct clk *clk)
+{
+	int i, ret = -EBUSY;
+
+	/*
+	 * If the clock could not enable 10 iterations,
+	 * it considers this clock is broken.
+	 */
+	for (i = 0; i < 10; i++) {
+		ret = clk_prepare_enable(clk);
+		if (!ret)
+			return 0;
+
+		usleep_range(5000, 6000);
+	}
+
+	return ret;
+}
+
+static int sky1_udphy_exit(struct cix_udphy *udphy)
+{
+	reset_control_assert(udphy->reset);
+	reset_control_assert(udphy->preset);
+	clk_disable_unprepare(udphy->apb_clk);
+	return 0;
+}
+
+static int sky1_udphy_init(struct cix_udphy *udphy)
+{
+	int ret;
+	u32 value;
+	const struct cix_udphy_con_dir *con_dir = &udphy->cfg->con_dir[udphy->id];
+
+	regmap_update_bits(udphy->usbphy_syscon, con_dir->offset,
+			   GENMASK(con_dir->bit, con_dir->bit),
+			   udphy->flip << con_dir->bit);
+
+	usleep_range(10, 20);
+
+	regmap_read(udphy->usbphy_syscon, con_dir->offset, &value);
+
+	/* usb rcsu reset is default deassert */
+	reset_control_assert(udphy->reset);
+	reset_control_assert(udphy->preset);
+
+	ret = sky1_udphy_clk_enable(udphy->apb_clk);
+	if (ret) {
+		dev_err(udphy->dev, "Failed to prepare_enable udphy apb clock\n");
+		return ret;
+	}
+
+	reset_control_deassert(udphy->preset);
+
+	if (udphy->next_mode == UDPHY_MODE_DP) {
+		ret = regmap_multi_reg_write(udphy->phy_regmap, sky1_udphy_dp_conf,
+					     ARRAY_SIZE(sky1_udphy_dp_conf));
+
+		if (ret) {
+			dev_err(udphy->dev, "Failed to write the reg sequence\n");
+			goto assert_apb;
+		}
+	} else {
+		if (!udphy->flip) {
+			ret = regmap_multi_reg_write(udphy->phy_regmap,
+						     sky1_udphy_usbdp_conf_normal,
+						     ARRAY_SIZE(sky1_udphy_usbdp_conf_normal));
+			if (ret) {
+				dev_err(udphy->dev, "Failed to write the reg sequence\n");
+				goto assert_apb;
+			}
+		} else {
+			ret = regmap_multi_reg_write(udphy->phy_regmap,
+						     sky1_udphy_usbdp_conf_flip,
+						     ARRAY_SIZE(sky1_udphy_usbdp_conf_flip));
+			if (ret) {
+				dev_err(udphy->dev, "Failed to write the reg sequence\n");
+				goto assert_apb;
+			}
+		}
+	}
+
+	reset_control_deassert(udphy->reset);
+
+	return 0;
+
+assert_apb:
+	reset_control_assert(udphy->preset);
+	clk_disable_unprepare(udphy->apb_clk);
+	return ret;
+}
+
+static const struct cix_udphy_cfg sky1_udphy_cfg = {
+	.con_dir = sky1_udphy_con_dir,
+	.udphy_init = sky1_udphy_init,
+	.udphy_exit = sky1_udphy_exit
+};
+
+static int udphy_regmap_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct cix_udphy *udphy = context;
+	u32 offset = reg << 2;
+
+	writel(val, udphy->base + offset);
+
+	return 0;
+}
+
+static int udphy_regmap_read(void *context, unsigned int reg, unsigned int *val)
+{
+	struct cix_udphy *udphy = context;
+	u32 offset = reg << 2;
+
+	*val = readl(udphy->base + offset);
+
+	return 0;
+}
+
+static const struct regmap_config cix_udphy_regmap_cfg = {
+	.reg_bits = 32,
+	/* register width, if =2, then only reg 0 2 4 ...2^n can access */
+	.reg_stride = 1,
+	.val_bits = 16,
+	.fast_io = true,
+	.reg_write = udphy_regmap_write,
+	.reg_read = udphy_regmap_read,
+};
+
+static int udphy_orien_sw_set(struct typec_switch_dev *sw,
+			      enum typec_orientation orien)
+{
+	struct cix_udphy *udphy = typec_switch_get_drvdata(sw);
+
+	mutex_lock(&udphy->mutex);
+
+	if (orien == TYPEC_ORIENTATION_NONE)
+		goto unlock_ret;
+
+	udphy->flip = (orien == TYPEC_ORIENTATION_REVERSE) ? true : false;
+
+unlock_ret:
+	mutex_unlock(&udphy->mutex);
+	return 0;
+}
+
+static int udphy_setup_orien_switch(struct cix_udphy *udphy)
+{
+	struct typec_switch_desc sw_desc = { };
+
+	sw_desc.drvdata = udphy;
+	sw_desc.fwnode = dev_fwnode(udphy->dev);
+	sw_desc.set = udphy_orien_sw_set;
+
+	udphy->sw = typec_switch_register(udphy->dev, &sw_desc);
+	if (IS_ERR(udphy->sw)) {
+		dev_err(udphy->dev, "Error register typec orientation switch: %ld\n",
+			PTR_ERR(udphy->sw));
+		return PTR_ERR(udphy->sw);
+	}
+
+	return 0;
+}
+
+static int usbdp_typec_mux_set(struct typec_mux_dev *mux,
+			       struct typec_mux_state *state)
+{
+	struct cix_udphy *udphy = typec_mux_get_drvdata(mux);
+
+	mutex_lock(&udphy->mutex);
+
+	switch (state->mode) {
+	case TYPEC_DP_STATE_C:
+		fallthrough;
+	case TYPEC_DP_STATE_E:
+		udphy->next_mode = UDPHY_MODE_DP;
+		break;
+	case TYPEC_DP_STATE_D:
+		udphy->next_mode = UDPHY_MODE_DP_USB;
+		break;
+	case TYPEC_STATE_SAFE:
+		udphy->next_mode = UDPHY_MODE_USB;
+		break;
+	default:
+		/* usb only handle as usb+dp mode */
+		udphy->next_mode = UDPHY_MODE_USB;
+		break;
+	}
+
+	/* TODO: check whether the HPD state needs software */
+	mutex_unlock(&udphy->mutex);
+
+	return 0;
+}
+
+static void udphy_orien_switch_unregister(void *data)
+{
+	struct cix_udphy *udphy = data;
+
+	typec_switch_unregister(udphy->sw);
+}
+
+static int udphy_setup_typec_mux(struct cix_udphy *udphy)
+{
+	struct typec_mux_desc mux_desc = {};
+
+	mux_desc.drvdata = udphy;
+	mux_desc.fwnode = dev_fwnode(udphy->dev);
+	mux_desc.set = usbdp_typec_mux_set;
+
+	udphy->mux = typec_mux_register(udphy->dev, &mux_desc);
+	if (IS_ERR(udphy->mux)) {
+		dev_err(udphy->dev, "Error register typec mux: %ld\n",
+			PTR_ERR(udphy->mux));
+		return PTR_ERR(udphy->mux);
+	}
+
+	return 0;
+}
+
+static void udphy_typec_mux_unregister(void *data)
+{
+	struct cix_udphy *udphy = data;
+
+	typec_mux_unregister(udphy->mux);
+}
+
+static int cix_usbdp_phy_power_on(struct cix_udphy *udphy)
+{
+	const struct cix_udphy_cfg *phy_cfgs = udphy->cfg;
+	int ret;
+
+	if (udphy->cur_mode == udphy->next_mode)
+		return 0;
+
+	if ((udphy->cur_mode == UDPHY_MODE_USB || udphy->cur_mode == UDPHY_MODE_DP) &&
+	    udphy->next_mode == UDPHY_MODE_DP_USB)
+		return 0;
+
+	if (phy_cfgs->udphy_init) {
+		ret = phy_cfgs->udphy_init(udphy);
+		if (ret) {
+			dev_err(udphy->dev, "failed to init udphy\n");
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int cix_usbdp_phy_power_off(struct cix_udphy *udphy)
+{
+	const struct cix_udphy_cfg *phy_cfgs = udphy->cfg;
+	int ret;
+
+	if (phy_cfgs->udphy_exit) {
+		ret = phy_cfgs->udphy_exit(udphy);
+		if (ret) {
+			dev_err(udphy->dev, "failed to exit udphy\n");
+			return ret;
+		}
+	}
+
+	udphy->cur_mode = UDPHY_MODE_NONE;
+	return 0;
+}
+
+static int udphy_dp_phy_power_on(struct phy *phy)
+{
+	struct cix_udphy *udphy = phy_get_drvdata(phy);
+	int ret = 0;
+
+	mutex_lock(&udphy->mutex);
+	if (!(udphy->next_mode & UDPHY_MODE_DP))
+		goto unlock;
+
+	ret = cix_usbdp_phy_power_on(udphy);
+	if (ret)
+		goto unlock;
+
+	phy_set_bus_width(phy, udphy_dplane_get(udphy));
+	if (udphy->next_mode == UDPHY_MODE_DP)
+		udphy->cur_mode = UDPHY_MODE_DP;
+	else
+		udphy->cur_mode |= UDPHY_MODE_DP;
+
+unlock:
+	mutex_unlock(&udphy->mutex);
+	return ret;
+}
+
+static int udphy_dp_phy_power_off(struct phy *phy)
+{
+	struct cix_udphy *udphy = phy_get_drvdata(phy);
+	int ret = 0;
+
+	mutex_lock(&udphy->mutex);
+
+	if (!(udphy->cur_mode & UDPHY_MODE_DP))
+		goto unlock;
+	udphy->cur_mode &= ~UDPHY_MODE_DP;
+
+	if (udphy->cur_mode == UDPHY_MODE_NONE)
+		ret = cix_usbdp_phy_power_off(udphy);
+
+	phy_set_bus_width(phy, 0);
+
+unlock:
+	mutex_unlock(&udphy->mutex);
+	return ret;
+}
+
+static int udphy_dp_phy_verify_config(struct cix_udphy *udphy,
+				      struct phy_configure_opts_dp *dp)
+{
+	int i;
+
+	switch (dp->lanes) {
+	case 1:
+	case 2:
+	case 4:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/*
+	 * If changing voltages is required, check swing and pre-emphasis
+	 * levels, per-lane.
+	 */
+	if (dp->set_voltages) {
+		for (i = 0; i < dp->lanes; i++) {
+			if (dp->voltage[i] > 3 || dp->pre[i] > 3)
+				return -EINVAL;
+
+			/*
+			 * Sum of voltage swing and pre-emphasis levels cannot
+			 * exceed 3.
+			 */
+			if (dp->voltage[i] + dp->pre[i] > 3)
+				return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static int udphy_dp_phy_set_rate(struct cix_udphy *udphy,
+				 struct phy_configure_opts_dp *dp)
+{
+	int ret;
+	const struct phy_link_cfg *conf = NULL;
+
+	dev_dbg(udphy->dev, "lane %d, rate %x\n", dp->lanes, dp->link_rate);
+
+	regmap_update_bits(udphy->phy_regmap, PHY_PMA_PLL_CTRL, BIT(1), 0x0);
+	usleep_range(10, 20);
+
+	switch (dp->link_rate) {
+	case 0x6:
+		conf = &link_cfg[0];
+		ret = regmap_multi_reg_write(udphy->phy_regmap, sky1_udphy_dp_partial_conf,
+					     ARRAY_SIZE(sky1_udphy_dp_partial_conf));
+		break;
+	case 0xa:
+		conf = &link_cfg[1];
+		ret = regmap_multi_reg_write(udphy->phy_regmap, sky1_udphy_dp_partial_conf,
+					     ARRAY_SIZE(sky1_udphy_dp_partial_conf));
+		break;
+	case 0x14:
+		conf = &link_cfg[2];
+		ret = regmap_multi_reg_write(udphy->phy_regmap, sky1_udphy_dp_partial_conf,
+					     ARRAY_SIZE(sky1_udphy_dp_partial_conf));
+		break;
+	case 0x1e:
+		conf = &link_cfg[3];
+		ret = regmap_multi_reg_write(udphy->phy_regmap, sky1_udphy_dp_8p1_conf,
+					     ARRAY_SIZE(sky1_udphy_dp_8p1_conf));
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (ret)
+		return ret;
+
+	switch (dp->lanes) {
+	case 1:
+		if (!udphy->flip) {
+			regmap_write(udphy->phy_regmap,
+				     XCVR_DIAG_HSCLK_DIV_LANE2,
+				     conf->hsclk_div);
+		} else {
+			regmap_write(udphy->phy_regmap,
+				     XCVR_DIAG_HSCLK_DIV_LANE1,
+				     conf->hsclk_div);
+		}
+		break;
+	case 2:
+		if (!udphy->flip) {
+			regmap_write(udphy->phy_regmap,
+				     XCVR_DIAG_HSCLK_DIV_LANE2,
+				     conf->hsclk_div);
+			regmap_write(udphy->phy_regmap,
+				     XCVR_DIAG_HSCLK_DIV_LANE3,
+				     conf->hsclk_div);
+		} else {
+			regmap_write(udphy->phy_regmap,
+				     XCVR_DIAG_HSCLK_DIV_LANE0,
+				     conf->hsclk_div);
+			regmap_write(udphy->phy_regmap,
+				     XCVR_DIAG_HSCLK_DIV_LANE1,
+				     conf->hsclk_div);
+		}
+		break;
+	case 4:
+		regmap_write(udphy->phy_regmap,
+			     XCVR_DIAG_HSCLK_DIV_LANE0,
+			     conf->hsclk_div);
+		regmap_write(udphy->phy_regmap,
+			     XCVR_DIAG_HSCLK_DIV_LANE1,
+			     conf->hsclk_div);
+		regmap_write(udphy->phy_regmap,
+			     XCVR_DIAG_HSCLK_DIV_LANE2,
+			     conf->hsclk_div);
+		regmap_write(udphy->phy_regmap,
+			     XCVR_DIAG_HSCLK_DIV_LANE3,
+			     conf->hsclk_div);
+		break;
+	default:
+		break;
+	}
+
+	regmap_write(udphy->phy_regmap, CMN_PLL1_INTDIV_M0, conf->pll_intdiv);
+	regmap_write(udphy->phy_regmap, CMN_PLL1_FRACDIVL_M0, conf->pll_fracdivl);
+	regmap_write(udphy->phy_regmap, CMN_PLL1_HIGH_THR_M0, conf->pll_high_thr);
+	regmap_write(udphy->phy_regmap, CMN_PDIAG_PLL1_CLK_SEL_M0, conf->clk_sel);
+
+	regmap_update_bits(udphy->phy_regmap, PHY_PMA_PLL_CTRL, BIT(1), BIT(1));
+	usleep_range(10, 20);
+
+	return 0;
+}
+
+static int udphy_dp_phy_set_voltages(struct cix_udphy *udphy,
+				     struct phy_configure_opts_dp *dp)
+{
+	u32 index = dp->voltage[0] * 4 + dp->pre[0];
+	const struct phy_voltage_conf *cfg = volt_cfg;
+
+	dev_dbg(udphy->dev, "lane %d, vs %d, pe %d\n", dp->lanes, dp->voltage[0],
+		dp->pre[0]);
+
+	switch (dp->lanes) {
+	case 1:
+		if (!udphy->flip) { /* lane 2 */
+			regmap_update_bits(udphy->phy_regmap, TX_DIAG_ACYA_LANE2,
+					   BIT(0), 0x1);
+			regmap_write(udphy->phy_regmap, TX_TXCC_CTRL_LANE2,
+				     cfg[index].tx_txcc_ctrl);
+			regmap_write(udphy->phy_regmap, DRV_DIAG_TX_DRV_LANE2,
+				     cfg[index].drv_diag_tx_drv);
+			regmap_write(udphy->phy_regmap, TX_TXCC_MGNFS_MULT_000_LANE2,
+				     cfg[index].tx_txcc_mgnfc_mult_000);
+			regmap_write(udphy->phy_regmap, TX_TXCC_CPOST_MULT_00_LANE2,
+				     cfg[index].tx_txcc_cpost_mult_00);
+			regmap_update_bits(udphy->phy_regmap, TX_DIAG_ACYA_LANE2,
+					   BIT(0), 0x0);
+		} else { /* lane 1 */
+			regmap_update_bits(udphy->phy_regmap, TX_DIAG_ACYA_LANE1,
+					   BIT(0), 0x1);
+			regmap_write(udphy->phy_regmap, TX_TXCC_CTRL_LANE1,
+				     cfg[index].tx_txcc_ctrl);
+			regmap_write(udphy->phy_regmap, DRV_DIAG_TX_DRV_LANE1,
+				     cfg[index].drv_diag_tx_drv);
+			regmap_write(udphy->phy_regmap, TX_TXCC_MGNFS_MULT_000_LANE1,
+				     cfg[index].tx_txcc_mgnfc_mult_000);
+			regmap_write(udphy->phy_regmap, TX_TXCC_CPOST_MULT_00_LANE1,
+				     cfg[index].tx_txcc_cpost_mult_00);
+			regmap_update_bits(udphy->phy_regmap, TX_DIAG_ACYA_LANE1,
+					   BIT(0), 0x0);
+		}
+		break;
+	case 2:
+		if (!udphy->flip) {
+			regmap_update_bits(udphy->phy_regmap, TX_DIAG_ACYA_LANE2,
+					   BIT(0), 0x1);
+			regmap_write(udphy->phy_regmap, TX_TXCC_CTRL_LANE2,
+				     cfg[index].tx_txcc_ctrl);
+			regmap_write(udphy->phy_regmap, DRV_DIAG_TX_DRV_LANE2,
+				     cfg[index].drv_diag_tx_drv);
+			regmap_write(udphy->phy_regmap, TX_TXCC_MGNFS_MULT_000_LANE2,
+				     cfg[index].tx_txcc_mgnfc_mult_000);
+			regmap_write(udphy->phy_regmap, TX_TXCC_CPOST_MULT_00_LANE2,
+				     cfg[index].tx_txcc_cpost_mult_00);
+			regmap_update_bits(udphy->phy_regmap, TX_DIAG_ACYA_LANE2,
+					   BIT(0), 0x0);
+			regmap_update_bits(udphy->phy_regmap, TX_DIAG_ACYA_LANE3,
+					   BIT(0), 0x1);
+			regmap_write(udphy->phy_regmap, TX_TXCC_CTRL_LANE3,
+				     cfg[index].tx_txcc_ctrl);
+			regmap_write(udphy->phy_regmap, DRV_DIAG_TX_DRV_LANE3,
+				     cfg[index].drv_diag_tx_drv);
+			regmap_write(udphy->phy_regmap, TX_TXCC_MGNFS_MULT_000_LANE3,
+				     cfg[index].tx_txcc_mgnfc_mult_000);
+			regmap_write(udphy->phy_regmap, TX_TXCC_CPOST_MULT_00_LANE3,
+				     cfg[index].tx_txcc_cpost_mult_00);
+			regmap_update_bits(udphy->phy_regmap, TX_DIAG_ACYA_LANE3,
+					   BIT(0), 0x0);
+		} else {
+			regmap_update_bits(udphy->phy_regmap, TX_DIAG_ACYA_LANE0,
+					   BIT(0), 0x1);
+			regmap_write(udphy->phy_regmap, TX_TXCC_CTRL_LANE0,
+				     cfg[index].tx_txcc_ctrl);
+			regmap_write(udphy->phy_regmap, DRV_DIAG_TX_DRV_LANE0,
+				     cfg[index].drv_diag_tx_drv);
+			regmap_write(udphy->phy_regmap, TX_TXCC_MGNFS_MULT_000_LANE0,
+				     cfg[index].tx_txcc_mgnfc_mult_000);
+			regmap_write(udphy->phy_regmap, TX_TXCC_CPOST_MULT_00_LANE0,
+				     cfg[index].tx_txcc_cpost_mult_00);
+			regmap_update_bits(udphy->phy_regmap, TX_DIAG_ACYA_LANE0,
+					   BIT(0), 0x0);
+			regmap_update_bits(udphy->phy_regmap, TX_DIAG_ACYA_LANE1,
+					   BIT(0), 0x1);
+			regmap_write(udphy->phy_regmap, TX_TXCC_CTRL_LANE1,
+				     cfg[index].tx_txcc_ctrl);
+			regmap_write(udphy->phy_regmap, DRV_DIAG_TX_DRV_LANE1,
+				     cfg[index].drv_diag_tx_drv);
+			regmap_write(udphy->phy_regmap, TX_TXCC_MGNFS_MULT_000_LANE1,
+				     cfg[index].tx_txcc_mgnfc_mult_000);
+			regmap_write(udphy->phy_regmap, TX_TXCC_CPOST_MULT_00_LANE1,
+				     cfg[index].tx_txcc_cpost_mult_00);
+			regmap_update_bits(udphy->phy_regmap, TX_DIAG_ACYA_LANE1,
+					   BIT(0), 0x0);
+		}
+		break;
+	case 4:
+		regmap_update_bits(udphy->phy_regmap, TX_DIAG_ACYA_LANE0,
+				   BIT(0), 0x1);
+		regmap_write(udphy->phy_regmap, TX_TXCC_CTRL_LANE0,
+			     cfg[index].tx_txcc_ctrl);
+		regmap_write(udphy->phy_regmap, DRV_DIAG_TX_DRV_LANE0,
+			     cfg[index].drv_diag_tx_drv);
+		regmap_write(udphy->phy_regmap, TX_TXCC_MGNFS_MULT_000_LANE0,
+			     cfg[index].tx_txcc_mgnfc_mult_000);
+		regmap_write(udphy->phy_regmap, TX_TXCC_CPOST_MULT_00_LANE0,
+			     cfg[index].tx_txcc_cpost_mult_00);
+		regmap_update_bits(udphy->phy_regmap, TX_DIAG_ACYA_LANE0,
+				   BIT(0), 0x0);
+
+		regmap_update_bits(udphy->phy_regmap, TX_DIAG_ACYA_LANE1,
+				   BIT(0), 0x1);
+		regmap_write(udphy->phy_regmap, TX_TXCC_CTRL_LANE1,
+			     cfg[index].tx_txcc_ctrl);
+		regmap_write(udphy->phy_regmap, DRV_DIAG_TX_DRV_LANE1,
+			     cfg[index].drv_diag_tx_drv);
+		regmap_write(udphy->phy_regmap, TX_TXCC_MGNFS_MULT_000_LANE1,
+			     cfg[index].tx_txcc_mgnfc_mult_000);
+		regmap_write(udphy->phy_regmap, TX_TXCC_CPOST_MULT_00_LANE1,
+			     cfg[index].tx_txcc_cpost_mult_00);
+		regmap_update_bits(udphy->phy_regmap, TX_DIAG_ACYA_LANE1,
+				   BIT(0), 0x0);
+
+		regmap_update_bits(udphy->phy_regmap, TX_DIAG_ACYA_LANE2,
+				   BIT(0), 0x1);
+		regmap_write(udphy->phy_regmap, TX_TXCC_CTRL_LANE2,
+			     cfg[index].tx_txcc_ctrl);
+		regmap_write(udphy->phy_regmap, DRV_DIAG_TX_DRV_LANE2,
+			     cfg[index].drv_diag_tx_drv);
+		regmap_write(udphy->phy_regmap, TX_TXCC_MGNFS_MULT_000_LANE2,
+			     cfg[index].tx_txcc_mgnfc_mult_000);
+		regmap_write(udphy->phy_regmap, TX_TXCC_CPOST_MULT_00_LANE2,
+			     cfg[index].tx_txcc_cpost_mult_00);
+		regmap_update_bits(udphy->phy_regmap, TX_DIAG_ACYA_LANE2,
+				   BIT(0), 0x0);
+
+		regmap_update_bits(udphy->phy_regmap, TX_DIAG_ACYA_LANE3,
+				   BIT(0), 0x1);
+		regmap_write(udphy->phy_regmap, TX_TXCC_CTRL_LANE3,
+			     cfg[index].tx_txcc_ctrl);
+		regmap_write(udphy->phy_regmap, DRV_DIAG_TX_DRV_LANE3,
+			     cfg[index].drv_diag_tx_drv);
+		regmap_write(udphy->phy_regmap, TX_TXCC_MGNFS_MULT_000_LANE3,
+			     cfg[index].tx_txcc_mgnfc_mult_000);
+		regmap_write(udphy->phy_regmap, TX_TXCC_CPOST_MULT_00_LANE3,
+			     cfg[index].tx_txcc_cpost_mult_00);
+		regmap_update_bits(udphy->phy_regmap, TX_DIAG_ACYA_LANE3,
+				   BIT(0), 0x0);
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static int udphy_dp_phy_configure(struct phy *phy,
+				  union phy_configure_opts *opts)
+{
+	struct cix_udphy *udphy = phy_get_drvdata(phy);
+	int ret;
+
+	mutex_lock(&udphy->mutex);
+	ret = udphy_dp_phy_verify_config(udphy, &opts->dp);
+	if (ret)
+		goto unlock;
+
+	if (opts->dp.set_rate) {
+		ret = udphy_dp_phy_set_rate(udphy, &opts->dp);
+		if (ret) {
+			dev_err(udphy->dev, "failed to set DP link rate\n");
+			goto unlock;
+		}
+	}
+
+	if (opts->dp.set_voltages) {
+		ret = udphy_dp_phy_set_voltages(udphy, &opts->dp);
+		if (ret) {
+			dev_err(udphy->dev, "dp_phy_set_voltages failed\n");
+			goto unlock;
+		}
+	}
+	mutex_unlock(&udphy->mutex);
+	return 0;
+
+unlock:
+	mutex_unlock(&udphy->mutex);
+	return ret;
+}
+
+static const struct phy_ops cix_dp_phy_ops = {
+	.power_on	= udphy_dp_phy_power_on,
+	.power_off	= udphy_dp_phy_power_off,
+	.configure	= udphy_dp_phy_configure,
+	.owner		= THIS_MODULE,
+};
+
+static int cix_u3phy_init(struct phy *phy)
+{
+	struct cix_udphy *udphy = phy_get_drvdata(phy);
+	int ret = 0;
+
+	mutex_lock(&udphy->mutex);
+	if (!(udphy->next_mode & UDPHY_MODE_USB))
+		goto unlock;
+
+	if (udphy->cur_mode & UDPHY_MODE_USB)
+		goto unlock;
+
+	ret = cix_usbdp_phy_power_on(udphy);
+	if (ret)
+		goto unlock;
+
+	udphy->cur_mode |= UDPHY_MODE_USB;
+
+unlock:
+	mutex_unlock(&udphy->mutex);
+	return ret;
+}
+
+static int cix_u3phy_exit(struct phy *phy)
+{
+	struct cix_udphy *udphy = phy_get_drvdata(phy);
+	int ret = 0;
+
+	mutex_lock(&udphy->mutex);
+
+	if (!(udphy->cur_mode & UDPHY_MODE_USB))
+		goto unlock;
+
+	udphy->cur_mode &= ~UDPHY_MODE_USB;
+
+	if (udphy->cur_mode == UDPHY_MODE_NONE)
+		ret = cix_usbdp_phy_power_off(udphy);
+
+unlock:
+	mutex_unlock(&udphy->mutex);
+	return ret;
+}
+
+static int cix_u3phy_set_mode(struct phy *phy, enum phy_mode mode, int submode)
+{
+	if (mode == PHY_MODE_INVALID)
+		return cix_u3phy_exit(phy);
+
+	return cix_u3phy_init(phy);
+}
+
+static const struct phy_ops cix_u3phy_ops = {
+	.set_mode       = cix_u3phy_set_mode,
+	.exit		= cix_u3phy_exit,
+	.owner		= THIS_MODULE,
+};
+
+/*
+ * PHY lane to PMA lane mapping for a normal plug orientation
+ *
+ * PMA LANE     C       D                 E
+ * 0          DP TX2   USB TX0          DP TX2
+ * 1          DP TX3   USB RX0          DP TX3
+ * 2          DP TX0   USB RX1/DP TX0   DP TX0
+ * 3          DP TX1   USB TX1/DP TX1   DP TX1
+ *
+ * PHY lane to PMA lane mapping for a flipped plug orientation
+ *
+ * PMA LANE     C       D                 E
+ * 0          DP TX1   USB TX1/DP TX1   DP TX1
+ * 1          DP TX0   USB RX1/DP TX0   DP TX0
+ * 2          DP TX3   USB RX0          DP TX3
+ * 3          DP TX2   USB TX0          DP TX2
+ */
+static void udphy_set_default_mode(struct cix_udphy *udphy)
+{
+	udphy->cur_mode = UDPHY_MODE_NONE;
+}
+
+static int cix_udphy_probe(struct platform_device *pdev)
+{
+	struct cix_udphy *udphy;
+	struct device *dev = &pdev->dev;
+	struct phy_provider *phy_provider;
+	struct device_node *np = dev->of_node;
+	u32 id;
+	int ret = 0;
+
+	udphy = devm_kzalloc(dev, sizeof(*udphy), GFP_KERNEL);
+	if (!udphy)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, udphy);
+	udphy->dev = dev;
+
+	udphy->usbphy_syscon =
+		syscon_regmap_lookup_by_phandle_args(np, "cix,usbphy-syscon", 1,
+						     &id);
+	if (IS_ERR(udphy->usbphy_syscon))
+		return dev_err_probe(dev, PTR_ERR(udphy->usbphy_syscon),
+				     "failed to get usbphy syscon\n");
+	else if (id >= ARRAY_SIZE(sky1_udphy_con_dir))
+		return dev_err_probe(dev, -EINVAL, "failed to get id\n");
+	udphy->id = id;
+
+	udphy->cfg = device_get_match_data(dev);
+	if (!udphy->cfg) {
+		dev_err(dev, "no OF data can be matched with %pOF node\n", np);
+		return -EINVAL;
+	}
+
+	udphy->reset = devm_reset_control_get_exclusive(dev, "core");
+	if (IS_ERR(udphy->reset))
+		return dev_err_probe(dev, PTR_ERR(udphy->reset), "failed to get reset\n");
+
+	udphy->preset = devm_reset_control_get_exclusive(dev, "apb");
+	if (IS_ERR(udphy->preset))
+		return dev_err_probe(dev, PTR_ERR(udphy->preset), "failed to get preset\n");
+
+	ret = device_property_read_u8(dev, "cix,default-conf", &udphy->next_mode);
+	if (ret)
+		udphy->next_mode = UDPHY_MODE_DP_USB;
+
+	reset_control_assert(udphy->reset);
+	reset_control_assert(udphy->preset);
+
+	udphy->apb_clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(udphy->apb_clk))
+		return dev_err_probe(dev, PTR_ERR(udphy->apb_clk), "phy apb clock not found\n");
+
+	udphy->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(udphy->base))
+		return dev_err_probe(dev, PTR_ERR(udphy->base), "fail to get phy register\n");
+
+	udphy->phy_regmap = devm_regmap_init(dev, NULL, udphy, &cix_udphy_regmap_cfg);
+	if (IS_ERR(udphy->phy_regmap))
+		return dev_err_probe(dev, PTR_ERR(udphy->phy_regmap),
+				     "failed to remap phy register\n");
+
+	mutex_init(&udphy->mutex);
+
+	if (device_property_present(dev, "orientation-switch")) {
+		ret = udphy_setup_orien_switch(udphy);
+		if (ret)
+			return ret;
+
+		ret = devm_add_action_or_reset(dev, udphy_orien_switch_unregister, udphy);
+		if (ret)
+			return ret;
+	}
+
+	if (device_property_present(dev, "mode-switch")) {
+		ret = udphy_setup_typec_mux(udphy);
+		if (ret)
+			return ret;
+
+		ret = devm_add_action_or_reset(dev, udphy_typec_mux_unregister, udphy);
+		if (ret)
+			return ret;
+	}
+
+	udphy_set_default_mode(udphy);
+
+	device_for_each_child_node_scoped(dev, child_fn) {
+		const char *name = fwnode_get_name(child_fn);
+		struct phy *phy;
+
+		if (!strncmp(name, "dp-port", 7))
+			phy = devm_phy_create(dev, to_of_node(child_fn),
+					      &cix_dp_phy_ops);
+		else if (!strncmp(name, "usb-port", 8))
+			phy = devm_phy_create(dev, to_of_node(child_fn),
+					      &cix_u3phy_ops);
+		else
+			continue;
+
+		if (IS_ERR(phy)) {
+			ret = PTR_ERR(phy);
+			dev_err(dev, "failed to create phy: %s\n", name);
+			return ret;
+		}
+
+		phy_set_drvdata(phy, udphy);
+	}
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(phy_provider)) {
+		ret = PTR_ERR(phy_provider);
+		dev_err(dev, "failed to register phy provider\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id cix_udphy_dt_match[] = {
+	{
+		.compatible = "cix,sky1-usbdp-phy",
+		.data = &sky1_udphy_cfg
+	},
+	{ /* sentinel */ }
+};
+
+MODULE_DEVICE_TABLE(of, cix_udphy_dt_match);
+
+static struct platform_driver cix_udphy_driver = {
+	.probe		= cix_udphy_probe,
+	.driver		= {
+		.name	= "cix-usbdp-phy",
+		.of_match_table = cix_udphy_dt_match,
+	},
+};
+
+module_platform_driver(cix_udphy_driver);
+
+MODULE_AUTHOR("Chao Zeng <chao.zeng@cixtech.com>");
+MODULE_DESCRIPTION("Cix USBDP Combo PHY driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/phy/cix/phy-cix-usbdp.h b/drivers/phy/cix/phy-cix-usbdp.h
new file mode 100644
index 000000000000..561d02e70e5a
--- /dev/null
+++ b/drivers/phy/cix/phy-cix-usbdp.h
@@ -0,0 +1,265 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _PHY_CIX_USBDP_H_
+#define _PHY_CIX_USBDP_H_
+
+#define CMN_SSM_BIAS_TMR             0x0022
+#define CMN_PLLSM0_PLLPRE_TMR        0x002a
+#define CMN_PLLSM0_PLLLOCK_TMR       0x002c
+#define CMN_PLLSM1_PLLPRE_TMR        0x0032
+#define CMN_PLLSM1_PLLLOCK_TMR       0x0034
+#define CMN_BGCAL_INIT_TMR           0x0064
+#define CMN_BGCAL_ITER_TMR           0x0065
+#define CMN_IBCAL_INIT_TMR           0x0074
+#define CMN_PLL0_SS_CTRL1_M0         0x0098
+#define CMN_PLL0_SS_CTRL2_M0         0x0099
+#define CMN_PLL0_SS_CTRL3_M0         0x009a
+#define CMN_PLL0_SS_CTRL4_M0         0x009b
+#define CMN_PLL1_SS_CTRL1_M0         0x00d8
+#define CMN_PLL1_SS_CTRL2_M0         0x00d9
+#define CMN_PLL1_SS_CTRL3_M0         0x00da
+#define CMN_PLL1_SS_CTRL4_M0         0x00db
+#define CMN_TXPUCAL_INIT_TMR         0x0104
+#define CMN_TXPDCAL_INIT_TMR         0x010c
+#define CMN_RXCAL_INIT_TMR           0x0114
+#define CMN_SD_CAL_PLLCNT_START      0x0128
+#define CMN_PDIAG_PLL1_ITRIM_M0      0x01c3
+#define CMN_DIAG_GPANA_0             0x01f0
+
+#define RX_SDCAL0_INIT_TMR_LANE0     0x8044
+#define RX_SDCAL0_INIT_TMR_LANE1     0x8244
+#define RX_SDCAL0_INIT_TMR_LANE2     0x8444
+#define RX_SDCAL0_INIT_TMR_LANE3     0x8644
+
+#define RX_SDCAL0_ITER_TMR_LANE0     0x8045
+#define RX_SDCAL0_ITER_TMR_LANE1     0x8245
+#define RX_SDCAL0_ITER_TMR_LANE2     0x8445
+#define RX_SDCAL0_ITER_TMR_LANE3     0x8645
+
+#define RX_SDCAL1_INIT_TMR_LANE0     0x804c
+#define RX_SDCAL1_INIT_TMR_LANE1     0x824c
+#define RX_SDCAL1_INIT_TMR_LANE2     0x844c
+#define RX_SDCAL1_INIT_TMR_LANE3     0x864c
+
+#define RX_SDCAL1_ITER_TMR_LANE0     0x804d
+#define RX_SDCAL1_ITER_TMR_LANE1     0x824d
+#define RX_SDCAL1_ITER_TMR_LANE2     0x844d
+#define RX_SDCAL1_ITER_TMR_LANE3     0x864d
+
+#define TX_RCVDET_ST_TMR_LANE0       0x4123
+#define TX_RCVDET_ST_TMR_LANE1       0x4323
+#define TX_RCVDET_ST_TMR_LANE2       0x4523
+#define TX_RCVDET_ST_TMR_LANE3       0x4723
+
+#define CMN_PDIAG_PLL0_CLK_SEL_M0    0x01a1
+#define CMN_PDIAG_PLL1_CLK_SEL_M0    0x01c1
+
+#define XCVR_DIAG_HSCLK_SEL_LANE0    0x40e6
+#define XCVR_DIAG_HSCLK_SEL_LANE1    0x42e6
+#define XCVR_DIAG_HSCLK_SEL_LANE2    0x44e6
+#define XCVR_DIAG_HSCLK_SEL_LANE3    0x46e6
+
+#define XCVR_DIAG_HSCLK_DIV_LANE0    0x40e7
+#define XCVR_DIAG_HSCLK_DIV_LANE1    0x42e7
+#define XCVR_DIAG_HSCLK_DIV_LANE2    0x44e7
+#define XCVR_DIAG_HSCLK_DIV_LANE3    0x46e7
+
+#define XCVR_DIAG_PLLDRC_CTRL_LANE0  0x40e5
+#define XCVR_DIAG_PLLDRC_CTRL_LANE1  0x42e5
+#define XCVR_DIAG_PLLDRC_CTRL_LANE2  0x44e5
+#define XCVR_DIAG_PLLDRC_CTRL_LANE3  0x46e5
+
+#define XCVR_DIAG_BIDI_CTRL_LANE0    0x40ea
+#define XCVR_DIAG_BIDI_CTRL_LANE1    0x42ea
+#define XCVR_DIAG_BIDI_CTRL_LANE2    0x44ea
+#define XCVR_DIAG_BIDI_CTRL_LANE3    0x46ea
+
+#define CMN_PLL0_DSM_DIAG_M0         0x0094
+#define CMN_PLL1_DSM_DIAG_M0         0x00d4
+#define CMN_PDIAG_PLL0_CP_PADJ_M0    0x01a4
+#define CMN_PDIAG_PLL1_CP_PADJ_M0    0x01c4
+
+#define CMN_PDIAG_PLL0_CP_IADJ_M0    0x01a5
+#define CMN_PDIAG_PLL1_CP_IADJ_M0    0x01c5
+#define CMN_PDIAG_PLL0_FILT_PADJ_M0  0x01a6
+#define CMN_PDIAG_PLL1_FILT_PADJ_M0  0x01c6
+
+#define CMN_PLL0_INTDIV_M0           0x0090
+#define CMN_PLL1_INTDIV_M0           0x00d0
+#define CMN_PLL0_FRACDIVL_M0         0x0091
+#define CMN_PLL1_FRACDIVL_M0         0x00d1
+
+#define CMN_PLL0_FRACDIVH_M0         0x0092
+#define CMN_PLL1_FRACDIVH_M0         0x00d2
+#define CMN_PLL0_HIGH_THR_M0         0x0093
+#define CMN_PLL1_HIGH_THR_M0         0x00d3
+
+#define CMN_PDIAG_PLL0_CTRL_M0       0x01a0
+#define CMN_PDIAG_PLL1_CTRL_M0       0x01c0
+
+#define CMN_PLL0_VCOCAL_TCTRL        0x0082
+#define CMN_PLL1_VCOCAL_TCTRL        0x00c2
+
+#define CMN_PLL0_VCOCAL_INIT_TMR     0x0084
+#define CMN_PLL1_VCOCAL_INIT_TMR     0x00c4
+
+#define CMN_PLL0_VCOCAL_ITER_TMR     0x0085
+#define CMN_PLL1_VCOCAL_ITER_TMR     0x00c5
+
+#define CMN_PLL0_VCOCAL_REFTIM_START 0x0086
+#define CMN_PLL1_VCOCAL_REFTIM_START 0x00c6
+
+#define CMN_PLL0_VCOCAL_PLLCNT_START 0x0088
+#define CMN_PLL1_VCOCAL_PLLCNT_START 0x00c8
+
+#define CMN_PLL0_LOCK_REFCNT_START   0x009c
+#define CMN_PLL1_LOCK_REFCNT_START   0x00dc
+
+#define CMN_PLL0_LOCK_PLLCNT_START   0x009e
+#define CMN_PLL1_LOCK_PLLCNT_START   0x00de
+
+#define CMN_PLL0_LOCK_PLLCNT_THR     0x009f
+#define CMN_PLL1_LOCK_PLLCNT_THR     0x00df
+
+#define PHY_PMA_LANE_MAP             0xc010
+#define PHY_LANE_OFF_CTRL            0xc011
+
+#define PHY_PIPE_USB3_GEN2_PRE_CFG0  0xc018
+#define PHY_PIPE_USB3_GEN2_POST_CFG0 0xc01a
+#define PHY_PIPE_USB3_GEN2_POST_CFG1 0xc01b
+
+#define CMN_CDIAG_CDB_PWRI_OVRD      0x0041
+#define CMN_CDIAG_XCVRC_PWRI_OVRD    0x0047
+
+#define TX_PSC_A0_LANE0              0x4100
+#define TX_PSC_A0_LANE1              0x4300
+#define TX_PSC_A0_LANE2              0x4500
+#define TX_PSC_A0_LANE3              0x4700
+
+#define TX_PSC_A1_LANE0              0x4101
+#define TX_PSC_A1_LANE3              0x4701
+
+#define TX_PSC_A2_LANE0              0x4102
+#define TX_PSC_A2_LANE1              0x4302
+#define TX_PSC_A2_LANE2              0x4502
+#define TX_PSC_A2_LANE3              0x4702
+
+#define TX_PSC_A3_LANE0              0x4103
+#define TX_PSC_A3_LANE1              0x4303
+#define TX_PSC_A3_LANE2              0x4503
+#define TX_PSC_A3_LANE3              0x4703
+
+#define RX_PSC_A0_LANE0              0x8000
+#define RX_PSC_A0_LANE1              0x8200
+#define RX_PSC_A0_LANE2              0x8400
+#define RX_PSC_A0_LANE3              0x8600
+
+#define RX_PSC_A1_LANE1              0x8201
+#define RX_PSC_A1_LANE2              0x8401
+
+#define RX_PSC_A2_LANE0              0x8002
+#define RX_PSC_A2_LANE1              0x8202
+#define RX_PSC_A2_LANE2              0x8402
+#define RX_PSC_A2_LANE3              0x8602
+
+#define RX_PSC_A3_LANE0              0x8003
+#define RX_PSC_A3_LANE1              0x8203
+#define RX_PSC_A3_LANE2              0x8403
+#define RX_PSC_A3_LANE3              0x8603
+
+#define RX_PSC_CAL_LANE0             0x8006
+#define RX_PSC_CAL_LANE1             0x8206
+#define RX_PSC_CAL_LANE2             0x8406
+#define RX_PSC_CAL_LANE3             0x8606
+
+#define TX_TXCC_CTRL_LANE0           0x4040
+#define TX_TXCC_CTRL_LANE1           0x4240
+#define TX_TXCC_CTRL_LANE2           0x4440
+#define TX_TXCC_CTRL_LANE3           0x4640
+
+#define TX_TXCC_CPOST_MULT_00_LANE0  0x404c
+#define TX_TXCC_CPOST_MULT_00_LANE1  0x424c
+#define TX_TXCC_CPOST_MULT_00_LANE2  0x444c
+#define TX_TXCC_CPOST_MULT_00_LANE3  0x464c
+
+#define TX_TXCC_CPOST_MULT_01_LANE0  0x404d
+#define TX_TXCC_CPOST_MULT_01_LANE3  0x464d
+
+#define TX_TXCC_MGNFS_MULT_000_LANE0 0x4050
+#define TX_TXCC_MGNFS_MULT_000_LANE1 0x4250
+#define TX_TXCC_MGNFS_MULT_000_LANE2 0x4450
+#define TX_TXCC_MGNFS_MULT_000_LANE3 0x4650
+
+#define TX_DIAG_ACYA_LANE0           0x41E7
+#define TX_DIAG_ACYA_LANE1           0x43E7
+#define TX_DIAG_ACYA_LANE2           0x45E7
+#define TX_DIAG_ACYA_LANE3           0x47E7
+
+#define DRV_DIAG_TX_DRV_LANE0        0x40c6
+#define DRV_DIAG_TX_DRV_LANE1        0x42c6
+#define DRV_DIAG_TX_DRV_LANE2        0x44c6
+#define DRV_DIAG_TX_DRV_LANE3        0x46c6
+
+#define RX_SIGDET_HL_FILT_TMR_LANE1  0x8290
+#define RX_SIGDET_HL_FILT_TMR_LANE2  0x8490
+
+#define RX_REE_GCSM1_CTRL_LANE0      0x8108
+#define RX_REE_GCSM1_CTRL_LANE1      0x8308
+#define RX_REE_GCSM1_CTRL_LANE2      0x8508
+#define RX_REE_GCSM1_CTRL_LANE3      0x8708
+
+#define RX_REE_GCSM2_CTRL_LANE0      0x8110
+#define RX_REE_GCSM2_CTRL_LANE1      0x8310
+#define RX_REE_GCSM2_CTRL_LANE2      0x8510
+#define RX_REE_GCSM2_CTRL_LANE3      0x8710
+
+#define RX_REE_PERGCSM_CTRL_LANE0    0x8118
+#define RX_REE_PERGCSM_CTRL_LANE1    0x8318
+#define RX_REE_PERGCSM_CTRL_LANE2    0x8518
+#define RX_REE_PERGCSM_CTRL_LANE3    0x8718
+
+#define RX_REE_ATTEN_THR_LANE1       0x8349
+#define RX_REE_ATTEN_THR_LANE2       0x8549
+
+#define RX_REE_SMGM_CTRL1_LANE1      0x8377
+#define RX_REE_SMGM_CTRL1_LANE2      0x8577
+
+#define RX_REE_SMGM_CTRL2_LANE1      0x8378
+#define RX_REE_SMGM_CTRL2_LANE2      0x8578
+
+#define XCVR_DIAG_PSC_OVRD_LANE1     0x42eb
+#define XCVR_DIAG_PSC_OVRD_LANE2     0x44eb
+
+#define RX_DIAG_SIGDET_TUNE_LANE1    0x83e8
+#define RX_DIAG_SIGDET_TUNE_LANE2    0x85e8
+
+#define RX_DIAG_NQST_CTRL_LANE1      0x83e5
+#define RX_DIAG_NQST_CTRL_LANE2      0x85e5
+
+#define RX_DIAG_DFE_AMP_TUNE_2_LANE1 0x83e2
+#define RX_DIAG_DFE_AMP_TUNE_2_LANE2 0x85e2
+
+#define RX_DIAG_DFE_AMP_TUNE_3_LANE1 0x83e3
+#define RX_DIAG_DFE_AMP_TUNE_3_LANE2 0x85e3
+
+#define RX_DIAG_PI_CAP_LANE1         0x83f5
+#define RX_DIAG_PI_CAP_LANE2         0x85f5
+
+#define RX_DIAG_PI_RATE_LANE1        0x83f4
+#define RX_DIAG_PI_RATE_LANE2        0x85f4
+
+#define RX_DIAG_ACYA_LANE0           0x81ff
+#define RX_DIAG_ACYA_LANE3           0x87ff
+
+#define RX_CDRLF_CNFG_LANE1          0x8280
+#define RX_CDRLF_CNFG_LANE2          0x8480
+
+#define RX_CDRLF_CNFG3_LANE1         0x8282
+#define RX_CDRLF_CNFG3_LANE2         0x8482
+
+#define PHY_PMA_PLL_CTRL             0xe003
+
+#define PHY_PMA_ISO_PLL_CTRL0        0xe005
+#define PHY_PMA_ISO_PLL_CTRL1        0xe006
+
+#endif
-- 
2.50.1

