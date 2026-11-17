Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.109
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794882547;
	b=35uBXy8Fcn2G1uhUk+J99jjaTmSctq7wysX8l7rfY7Tqg00lCa7BWS/Sl6Z/1caklgEO
	 SBqw66WVCBSVJqYsTGU/NUltWrjW8ke5W7oDpxYxHgz//Y8FlH4RVLXZ05W5djSxNFrzg
	 w/rvFZElrv+ytSzfwzACugSbfQIjoNGBxKgn32I6ohfCTQxtgDLS17h/n80olo7buK5gR
	 6THUY06zKfZIrl0hqekDWaINdyJ25Q1X+8+1n+wCkAqfyUKUWzmLbZhDXhhHtF+KhPyK/
	 nHD2uxcyY2A6yn0LhLKLFN6RlIotcp0n23dPDlPGRLLHTRRTCDeLF3m5l4/A7vtv6/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794882547;
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
	bh=DYUTpf7gOiZMecldyvJgT3PWCIXRs0FeUFFPV30/Qoo=;
	b=wCcQuVynVdGn0pif1wGtHVQna8Wpf1/P64kuvvk3LZtn5zOyt/jqjOjVR7vAaDjtnnyu
	 8sitZtlQ09izKB+QvW7XTLe0j0mn8ueJ0nyGaHVFhkvOwPFbhNMFMNpjsXphuCFpI6L7c
	 S0e7rQRTMrEcRPJXoyUENh9K1qMOyfc4PgpkDSCxXHqX8NggEJqo694bv3L8BTBcg/P5s
	 OGxdtokFNlLMOQUaXgKiIAcKgB79PR9NE4Cn9w/mW8QWTgiDRQm+VYzmnquLO90H6r9aG
	 NI/D4ShLrmVyF59r1wFHZDrm0xNLiQAR8AqKiGJPCoaO3v/t+u5tU5fQycVcAakPfHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.109
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023109.outbound.protection.outlook.com [52.101.127.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EDF606A33E;
	Tue, 17 Nov 2026 02:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11EDF606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m5/9S2imYFBx1SGdZR8XTCHZStCLoF0jJsef1QrwKQa5WoTfvEIwTvgz4JNC79CPBkSfCS93jyJRNGtVnOzBkOXtETUpe7BjpwPZhx7VUCwDzxVDxn7/mZ7/8fXDQFxxe0G//MJy0fo7CXSwkbZnvLK37vywbmmdllLdamPOqA2WPkVTuGz2kjZep3fayAspL/bfXQQ2c7Tpay7DXFJFXSiVVmzfdqs9q6qur0xaQJDXKPeovNR93vTTcf89y5SAdTNaW+nELsSehvJ8VP+MKU1ROpYjdA4YfCNrC/76+Ldl0UchCi6Ohw1TbiSwJ4mxh018YRP0v5wAheZmiPUplQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYUTpf7gOiZMecldyvJgT3PWCIXRs0FeUFFPV30/Qoo=;
 b=QMZd4cywCxJ+2InmSmcpjFhwR8Rz7YgW3sER2bq6CB83PU34rSW/w0zhEipPLy1Zo7FT6Cf9KAlCrh8XUcTVfMfp/LfriA0tQUGps9iTyznJcOPwRoDMW69uOuxBhekexBO9aH0mcZgJ5RlouuwnoqE6u6uszaexE6yf+BHgYVAaUJ1Er2zxUdW30WCkAwrnjaCmoqsXnozoM8LJ5xGIuDB0FdGJ8zIfCyqyVtzWBNpQE3lo5s3ER+SwV3iSkQ+r0b6QX8j2cFDPFxyUH9XUSsQgD3TS39nEzUVbQwpjqHApvyj8ie3mI16NeMn6/MuW0C5DrIscCXZCz30o66A4cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR02CA0138.apcprd02.prod.outlook.com (2603:1096:4:188::12)
 by SEYPR06MB6982.apcprd06.prod.outlook.com (2603:1096:101:1e2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Tue, 17 Nov
 2026 02:29:01 +0000
Received: from SG1PEPF000082E4.apcprd02.prod.outlook.com
 (2603:1096:4:188:cafe::35) by SG2PR02CA0138.outlook.office365.com
 (2603:1096:4:188::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 02:29:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E4.mail.protection.outlook.com (10.167.240.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 02:29:00 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id EB3FB427EFCE;
	Tue, 17 Nov 2026 10:28:59 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Gary Yang <Gary.Yang@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>
Cc: linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	Hongliang Yang <hongliang.yang@cixtech.com>
Subject: [PATCH v8 2/2] phy: cix: Add CIX Sky1 USB3 PHY driver
Date: Tue, 17 Nov 2026 10:28:58 +0800
Message-ID: <20261117022858.2210212-3-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261117022858.2210212-1-hongliang.yang@cixtech.com>
References: <20261117022858.2210212-1-hongliang.yang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E4:EE_|SEYPR06MB6982:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f7d2debb-9545-45b3-5497-08df44528a77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|7416014|1800799024|22082099003|18002099003|6133799003|261009223027099003|56012099006|261102130727099003|10067099003|261102123227099003|261026121527099003|261028144727099003|261026140227099003|261021121427099003|261022075727099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	BMgzaV73cLkn9qnVPSn0DQ+iXKjW6LHNg0yiLe9IjGUe0Ipjrmdfqu45dgXB4OL/lQJtXv/mB5jZd6ynpyfQMhjv2s8jy0Ita5JA9YYaiJhkpLybHdxLbfgvZGKS3DYoHxKNkqoXJ5El/9av8hi4YWXDhHrvKAmbE43RVmQgxw0Z2ScZlc7pGvBBLs92oqt6xkBDHYh1NRV9z0ZsMbaYbGe0pcH65J3cx5fB+E7MezCMQZqyxOF4TbryT5Iuj+1qnvuF0d3T/nE8td5SVFPWzejK58xY+S6Tf2p0Hnvhdzxoi6RaMF5EhiESLwxw14YwTAtqK4MglCXiq2KE6XrLhIN7k2FVcgASeKUVMQZkdE0dDcPT/pz5Y/5z26dMhYdYNUWTfRfuEnzXuYy/7H+rTB6WgEpxDX6UMupjDSN4YuNza1SyfU0GYYSihAky6tJ8jhJtI5bhuqWgbPVAJKh84GrTTa0jNMabkS00djXo4FcV9mCUzmk3VDogx9xC3FUP7iKPDP811477DaPI9ncqtTEvvFAe4DG0A63/vN3IciAwfxiGEOjRJUySizn/WmI8yOaYmtTvAX71xWK7wLsqRB+b7N3CFUdgTjJjHEEjyDzAqI0rkXYhd42C25YBLCICmMSz1PyFfAxu0buBwKJmROVTHYjUKBfiYDN/ZQjIgZbZxpkSC9YG1tzRW9iQA3meqW9gbN0jLPAs4OcjeQNLMg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(7416014)(1800799024)(22082099003)(18002099003)(6133799003)(261009223027099003)(56012099006)(261102130727099003)(10067099003)(261102123227099003)(261026121527099003)(261028144727099003)(261026140227099003)(261021121427099003)(261022075727099003)(261022105027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uaaWQhC1JQy9ONsxXB7W+u1AsgjGp7YhglclMDL08bQRpLHl/vAddpUq4dZ5ksSb5axCbxwUwU8RWobWC6njpSn3eOY1XhBuwTIMDj2NoxL1v1wSYih0aBaChh3hDZB3G7192Z2j3uRsPr/aXqWsg06VG7rYoAhDTDlOffWyNCuO/lPAcGXCCVFE3M4VWJMbTo5cWGWgngl8PygnnHHBzFSkafHwwQ5emxJLn6pkKKpY/zyKdjoW9ubrnnrLzd14s+aaQ0EoKJ7QWWHgvZLNYrORULqUAUPcBZEB6T0OVlTuOJ+/w/uOBNfi3hwWDtgwdGUBDWwQ0PnAOCTCaY3GZSKVE3kT5hTf6pPd1TwbyK/M0MATmYvDChLO0opltpFKjLiraXAMDIk79+0EinRQjWiyRvayFCs7EjsnjSFQfKPBqXebhVfXssP23cTSNJKZ
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 02:29:00.8681
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7d2debb-9545-45b3-5497-08df44528a77
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6982

Add a driver for the Cadence SD0803 USB3 PHY integrated in the CIX
Sky1 SoC. The driver enables the APB and reference clocks, releases the
resets, programs the register sequence of the PHY, and exports a single
PHY instance for the two lanes of the block. The PHY core reference
counts phy_init() and phy_exit(), so the sequence is programmed once and
the block stays powered while any of its consumers is active.

Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>
---
Changes in v8:
- Rely on the PHY core for serialization and reference counting instead
  of a driver-local mutex and counter, and call the Sky1 init and exit
  functions directly from the PHY operations: the per-SoC callback
  structure and its duplicate error messages are gone.
- Drop the register macros that the initialization sequence does not use
  from the private header.

Changes in v7:
- Rename the register header to phy-cix-usb3.h: it is the register map
  of the USB3 PHY, and the old usbdp name suggested a USB/DP combo PHY.
- Fix the module description and the Kconfig help text.

Changes in v6:
- Select REGMAP in the Kconfig.
- Use dev_err_probe() for the reset, clock and regmap acquisition
  failures in the probe path.
- Assert the resets before registering the PHY provider, disable the
  clocks in LIFO order, and fix the error unroll path so that clocks
  which were never enabled are not disabled.
---
 MAINTAINERS                    |   1 +
 drivers/phy/Kconfig            |   1 +
 drivers/phy/Makefile           |   1 +
 drivers/phy/cix/Kconfig        |  21 +++
 drivers/phy/cix/Makefile       |   6 +
 drivers/phy/cix/phy-cix-usb3.c | 313 +++++++++++++++++++++++++++++++++
 drivers/phy/cix/phy-cix-usb3.h | 180 +++++++++++++++++++
 7 files changed, 523 insertions(+)
 create mode 100644 drivers/phy/cix/Kconfig
 create mode 100644 drivers/phy/cix/Makefile
 create mode 100644 drivers/phy/cix/phy-cix-usb3.c
 create mode 100644 drivers/phy/cix/phy-cix-usb3.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 73783abe027e..b857e529e5e2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2906,6 +2906,7 @@ F:	Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml
 F:	Documentation/devicetree/bindings/phy/cix,sky1-usb3-phy.yaml
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
index 000000000000..24452144ff78
--- /dev/null
+++ b/drivers/phy/cix/Kconfig
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# PHY drivers for CIX PHYs
+#
+
+if ARCH_CIX || COMPILE_TEST
+
+config PHY_CIX_USB3
+	tristate "CIX Sky1 USB3 Type-A PHY support"
+	depends on OF && HAS_IOMEM
+	select GENERIC_PHY
+	select REGMAP
+	help
+	  Enable this to support the USB3 SuperSpeed PHY of the Type-A
+	  ports on CIX Sky1 SoCs. The PHY provides the SuperSpeed lanes
+	  used by the two Cadence USBSSP controllers (USB4 and USB5) of
+	  the SoC, and is shared between them.
+
+	  If unsure, say N.
+
+endif # ARCH_CIX || COMPILE_TEST
diff --git a/drivers/phy/cix/Makefile b/drivers/phy/cix/Makefile
new file mode 100644
index 000000000000..58ec925a4425
--- /dev/null
+++ b/drivers/phy/cix/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for the CIX PHY drivers.
+#
+
+obj-$(CONFIG_PHY_CIX_USB3)	+= phy-cix-usb3.o
diff --git a/drivers/phy/cix/phy-cix-usb3.c b/drivers/phy/cix/phy-cix-usb3.c
new file mode 100644
index 000000000000..ca6a0e764e90
--- /dev/null
+++ b/drivers/phy/cix/phy-cix-usb3.c
@@ -0,0 +1,313 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * phy driver for cdn_sd0803_t7g_typea
+ *
+ * Author: Hongliang Yang <hongliang.yang@cixtech.com>
+ */
+
+#include <linux/array_size.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+#include "phy-cix-usb3.h"
+
+/*
+ * Cadence SD0803 Type-A USB3 PHY initialization sequence for the CIX
+ * Sky1 SoC, taken from the vendor-provided PHY register programming
+ * sequence for this SoC.
+ */
+static const struct reg_sequence sky1_u3phy_conf[] = {
+	{CMN_SSM_BIAS_TMR,                  0x0018},
+	{CMN_PLLSM0_PLLPRE_TMR,             0x0030},
+	{CMN_PLLSM0_PLLLOCK_TMR,            0x00f0},
+	{CMN_PLLSM1_PLLPRE_TMR,             0x0030},
+	{CMN_PLLSM1_PLLLOCK_TMR,            0x00f0},
+	{CMN_BGCAL_INIT_TMR,                0x0078},
+	{CMN_BGCAL_ITER_TMR,                0x0078},
+	{CMN_IBCAL_INIT_TMR,                0x0018},
+	{CMN_TXPUCAL_INIT_TMR,              0x001d},
+	{CMN_TXPDCAL_INIT_TMR,              0x001d},
+	{CMN_RXCAL_INIT_TMR,                0x02d0},
+	{CMN_SD_CAL_PLLCNT_START,           0x0137},
+	{RX_SDCAL0_INIT_TMR_LANE0,          0x0018},
+	{RX_SDCAL0_INIT_TMR_LANE1,          0x0018},
+	{RX_SDCAL0_ITER_TMR_LANE0,          0x0078},
+	{RX_SDCAL0_ITER_TMR_LANE1,          0x0078},
+	{RX_SDCAL1_INIT_TMR_LANE0,          0x0018},
+	{RX_SDCAL1_INIT_TMR_LANE1,          0x0018},
+	{RX_SDCAL1_ITER_TMR_LANE0,          0x0078},
+	{RX_SDCAL1_ITER_TMR_LANE1,          0x0078},
+	{TX_RCVDET_ST_TMR_LANE0,            0x0960},
+	{TX_RCVDET_ST_TMR_LANE1,            0x0960},
+
+	{PHY_PLL_CFG_0803,                  0x0000},
+	{CMN_PDIAG_PLL0_CLK_SEL_M0,         0x8600},
+	{XCVR_DIAG_HSCLK_SEL_LANE0,         0x0000},
+	{XCVR_DIAG_HSCLK_SEL_LANE1,         0x0000},
+	{XCVR_DIAG_HSCLK_DIV_LANE0,         0x0001},
+	{XCVR_DIAG_HSCLK_DIV_LANE1,         0x0001},
+	{XCVR_DIAG_PLLDRC_CTRL_LANE0,       0x0041},
+	{XCVR_DIAG_PLLDRC_CTRL_LANE1,       0x0041},
+	{CMN_PLL0_DSM_DIAG_M0,              0x0004},
+	{CMN_PLL1_DSM_DIAG_M0,              0x0004},
+	{CMN_PDIAG_PLL1_ITRIM_M0,           0x003f},
+	{CMN_PDIAG_PLL0_CP_PADJ_M0,         0x0b17},
+	{CMN_PDIAG_PLL1_CP_PADJ_M0,         0x0b17},
+	{CMN_PDIAG_PLL0_CP_IADJ_M0,         0x0e01},
+	{CMN_PDIAG_PLL1_CP_IADJ_M0,         0x0e01},
+	{CMN_PDIAG_PLL0_FILT_PADJ_M0,       0x0d05},
+	{CMN_PDIAG_PLL1_FILT_PADJ_M0,       0x0d05},
+	{CMN_PLL0_INTDIV_M0,                0x01a0},
+	{CMN_PLL1_INTDIV_M0,                0x01a0},
+	{CMN_PLL0_FRACDIVL_M0,              0xaaab},
+	{CMN_PLL1_FRACDIVL_M0,              0xaaab},
+	{CMN_PLL0_FRACDIVH_M0,              0x0002},
+	{CMN_PLL1_FRACDIVH_M0,              0x0002},
+	{CMN_PLL0_HIGH_THR_M0,              0x0116},
+	{CMN_PLL1_HIGH_THR_M0,              0x0116},
+	{CMN_PDIAG_PLL0_CTRL_M0,            0x1002},
+	{CMN_PDIAG_PLL1_CTRL_M0,            0x1002},
+	{CMN_PLL0_SS_CTRL1_M0,		    0x0001}, /* SSC enabled */
+	{CMN_PLL0_VCOCAL_INIT_TMR,          0x00f0},
+	{CMN_PLL1_VCOCAL_INIT_TMR,          0x00f0},
+	{CMN_PLL0_VCOCAL_ITER_TMR,          0x0004},
+	{CMN_PLL1_VCOCAL_ITER_TMR,          0x0004},
+	{CMN_PLL0_VCOCAL_REFTIM_START,      0x02f8},
+	{CMN_PLL1_VCOCAL_REFTIM_START,      0x02f8},
+	{CMN_PLL0_VCOCAL_PLLCNT_START,      0x02f8},
+	{CMN_PLL1_VCOCAL_PLLCNT_START,      0x02f8},
+	{CMN_PLL0_VCOCAL_TCTRL,             0x0003},
+	{CMN_PLL1_VCOCAL_TCTRL,             0x0003},
+	{CMN_PLL0_LOCK_REFCNT_START,        0x00bf},
+	{CMN_PLL1_LOCK_REFCNT_START,        0x00bf},
+	{CMN_PLL0_LOCK_PLLCNT_START,        0x00bf},
+	{CMN_PLL1_LOCK_PLLCNT_START,        0x00bf},
+	{CMN_PLL0_LOCK_PLLCNT_THR,          0x0003},
+	{CMN_PLL1_LOCK_PLLCNT_THR,          0x0003},
+	{PHY_PIPE_USB3_GEN2_PRE_CFG0_0803,  0x0a0a},
+	{PHY_PIPE_USB3_GEN2_POST_CFG0_0803, 0x1000},
+	{PHY_PIPE_USB3_GEN2_POST_CFG1_0803, 0x0010},
+	{CMN_CDIAG_CDB_PWRI_OVRD,           0x8200},
+	{CMN_CDIAG_XCVRC_PWRI_OVRD,         0x8200},
+	{TX_PSC_A0_LANE0,                   0x02ff},
+	{TX_PSC_A0_LANE1,                   0x02ff},
+	{TX_PSC_A1_LANE0,                   0x06af},
+	{TX_PSC_A1_LANE1,                   0x06af},
+	{TX_PSC_A2_LANE0,                   0x06ae},
+	{TX_PSC_A2_LANE1,                   0x06ae},
+	{TX_PSC_A3_LANE0,                   0x06ae},
+	{TX_PSC_A3_LANE1,                   0x06ae},
+	{RX_PSC_A0_LANE0,                   0x0d1d},
+	{RX_PSC_A0_LANE1,                   0x0d1d},
+	{RX_PSC_A1_LANE0,                   0x0d1d},
+	{RX_PSC_A1_LANE1,                   0x0d1d},
+	{RX_PSC_A2_LANE0,                   0x0d00},
+	{RX_PSC_A2_LANE1,                   0x0d00},
+	{RX_PSC_A3_LANE0,                   0x0500},
+	{RX_PSC_A3_LANE1,                   0x0500},
+	{TX_TXCC_CTRL_LANE0,                0x2a82},
+	{TX_TXCC_CTRL_LANE1,                0x2a82},
+	{TX_TXCC_CPOST_MULT_01_LANE0,       0x0014},
+	{TX_TXCC_CPOST_MULT_01_LANE1,       0x0014},
+	{TX_TXCC_MGNFS_MULT_000_LANE0,      0x0002},
+	{TX_TXCC_MGNFS_MULT_000_LANE1,      0x0002},
+	{RX_SIGDET_HL_FILT_TMR_LANE0,       0x0013},
+	{RX_SIGDET_HL_FILT_TMR_LANE1,       0x0013},
+	{RX_REE_GCSM1_CTRL_LANE0,           0x0000},
+	{RX_REE_GCSM1_CTRL_LANE1,           0x0000},
+	{RX_REE_ATTEN_THR_LANE0,            0x0c02},
+	{RX_REE_ATTEN_THR_LANE1,            0x0c02},
+	{RX_REE_SMGM_CTRL1_LANE0,           0x0330},
+	{RX_REE_SMGM_CTRL1_LANE1,           0x0330},
+	{RX_REE_SMGM_CTRL2_LANE0,           0x0300},
+	{RX_REE_SMGM_CTRL2_LANE1,           0x0300},
+	{XCVR_DIAG_PSC_OVRD_LANE0,          0x0003},
+	{XCVR_DIAG_PSC_OVRD_LANE1,          0x0003},
+	{RX_DIAG_SIGDET_TUNE_LANE0,         0x1004},
+	{RX_DIAG_SIGDET_TUNE_LANE1,         0x1004},
+	{RX_DIAG_NQST_CTRL_LANE0,           0x00f9},
+	{RX_DIAG_NQST_CTRL_LANE1,           0x00f9},
+	{RX_DIAG_DFE_AMP_TUNE_2_LANE0,      0x0c01},
+	{RX_DIAG_DFE_AMP_TUNE_2_LANE1,      0x0c01},
+	{RX_DIAG_DFE_AMP_TUNE_3_LANE0,      0x0002},
+	{RX_DIAG_DFE_AMP_TUNE_3_LANE1,      0x0002},
+	{RX_DIAG_PI_CAP_LANE0,              0x0000},
+	{RX_DIAG_PI_CAP_LANE1,              0x0000},
+	{RX_DIAG_PI_RATE_LANE0,             0x0031},
+	{RX_DIAG_PI_RATE_LANE1,             0x0031},
+	{RX_CDRLF_CNFG_LANE0,               0x018c},
+	{RX_CDRLF_CNFG_LANE1,               0x018c},
+	{RX_CDRLF_CNFG3_LANE0,              0x0003},
+	{RX_CDRLF_CNFG3_LANE1,              0x0003}
+};
+
+struct cix_u3phy {
+	struct device *dev;
+	void __iomem *base;
+	struct regmap *phy_regmap;
+	struct reset_control *preset;
+	struct reset_control *reset;
+	struct clk *apb_clk;
+	struct clk *ref_clk;
+};
+
+static int cix_u3phy_exit(struct phy *phy)
+{
+	struct cix_u3phy *u3phy = phy_get_drvdata(phy);
+
+	reset_control_assert(u3phy->reset);
+	reset_control_assert(u3phy->preset);
+	clk_disable_unprepare(u3phy->ref_clk);
+	clk_disable_unprepare(u3phy->apb_clk);
+	return 0;
+}
+
+static int cix_u3phy_init(struct phy *phy)
+{
+	struct cix_u3phy *u3phy = phy_get_drvdata(phy);
+	int ret;
+
+	/* usb rcsu reset is default deassert */
+	reset_control_assert(u3phy->reset);
+	reset_control_assert(u3phy->preset);
+
+	ret = clk_prepare_enable(u3phy->apb_clk);
+	if (ret) {
+		dev_err(u3phy->dev, "failed to enable the APB clock\n");
+		return ret;
+	}
+	ret = clk_prepare_enable(u3phy->ref_clk);
+	if (ret) {
+		dev_err(u3phy->dev, "failed to enable the reference clock\n");
+		goto disable_apb_clk;
+	}
+	reset_control_deassert(u3phy->preset);
+	ret = regmap_multi_reg_write(u3phy->phy_regmap, sky1_u3phy_conf,
+				     ARRAY_SIZE(sky1_u3phy_conf));
+	if (ret) {
+		dev_err(u3phy->dev, "failed to write the PHY register sequence\n");
+		goto assert_reset_preset;
+	}
+	reset_control_deassert(u3phy->reset);
+	return 0;
+
+assert_reset_preset:
+	reset_control_assert(u3phy->preset);
+	reset_control_assert(u3phy->reset);
+	clk_disable_unprepare(u3phy->ref_clk);
+disable_apb_clk:
+	clk_disable_unprepare(u3phy->apb_clk);
+	return ret;
+}
+
+static int u3phy_regmap_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct cix_u3phy *u3phy = context;
+	u32 offset = reg << 2;
+
+	writel(val, u3phy->base + offset);
+	return 0;
+}
+
+static int u3phy_regmap_read(void *context, unsigned int reg, unsigned int *val)
+{
+	struct cix_u3phy *u3phy = context;
+	u32 offset = reg << 2;
+
+	*val = readl(u3phy->base + offset);
+	return 0;
+}
+
+static const struct regmap_config cix_u3phy_regmap_cfg = {
+	.reg_bits = 32,
+	.reg_stride = 1,
+	.val_bits = 16,
+	.fast_io = true,
+	.reg_write = u3phy_regmap_write,
+	.reg_read = u3phy_regmap_read,
+};
+
+static const struct phy_ops cix_u3phy_ops = {
+	.init		= cix_u3phy_init,
+	.exit		= cix_u3phy_exit,
+	.owner		= THIS_MODULE,
+};
+
+static int cix_u3phy_probe(struct platform_device *pdev)
+{
+	struct cix_u3phy *u3phy;
+	struct device *dev = &pdev->dev;
+	struct phy_provider *phy_provider;
+	struct phy *phy;
+
+	u3phy = devm_kzalloc(dev, sizeof(*u3phy), GFP_KERNEL);
+	if (!u3phy)
+		return -ENOMEM;
+	u3phy->dev = dev;
+	u3phy->reset = devm_reset_control_get_exclusive(dev, "core");
+	if (IS_ERR(u3phy->reset))
+		return dev_err_probe(dev, PTR_ERR(u3phy->reset),
+				     "failed to get core reset\n");
+	u3phy->preset = devm_reset_control_get_exclusive(dev, "apb");
+	if (IS_ERR(u3phy->preset))
+		return dev_err_probe(dev, PTR_ERR(u3phy->preset),
+				     "failed to get APB reset\n");
+	u3phy->apb_clk = devm_clk_get(dev, "apb");
+	if (IS_ERR(u3phy->apb_clk))
+		return dev_err_probe(dev, PTR_ERR(u3phy->apb_clk),
+				     "failed to get APB clock\n");
+	u3phy->ref_clk = devm_clk_get(dev, "ref");
+	if (IS_ERR(u3phy->ref_clk))
+		return dev_err_probe(dev, PTR_ERR(u3phy->ref_clk),
+				     "failed to get reference clock\n");
+	u3phy->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(u3phy->base))
+		return PTR_ERR(u3phy->base);
+	u3phy->phy_regmap = devm_regmap_init(dev, NULL, u3phy, &cix_u3phy_regmap_cfg);
+	if (IS_ERR(u3phy->phy_regmap))
+		return dev_err_probe(dev, PTR_ERR(u3phy->phy_regmap),
+				     "failed to init PHY regmap\n");
+	/*
+	 * The PHY block drives both USB3 lanes, so a single PHY instance is
+	 * exported for the two controllers that share it. The PHY core
+	 * serializes and reference counts the init and exit calls.
+	 */
+	phy = devm_phy_create(dev, NULL, &cix_u3phy_ops);
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, PTR_ERR(phy), "failed to create phy\n");
+	phy_set_drvdata(phy, u3phy);
+
+	/* keep the PHY in reset until a consumer calls phy_init() */
+	reset_control_assert(u3phy->reset);
+	reset_control_assert(u3phy->preset);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(phy_provider))
+		return dev_err_probe(dev, PTR_ERR(phy_provider),
+				     "failed to register phy provider\n");
+	return 0;
+}
+
+static const struct of_device_id cix_u3phy_dt_match[] = {
+	{ .compatible = "cix,sky1-usb3-phy" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, cix_u3phy_dt_match);
+
+static struct platform_driver cix_usb3_phy_driver = {
+	.probe		= cix_u3phy_probe,
+	.driver		= {
+		.name	= "cix-usb3-phy",
+		.of_match_table = cix_u3phy_dt_match,
+	},
+};
+
+module_platform_driver(cix_usb3_phy_driver);
+
+MODULE_AUTHOR("Hongliang Yang <hongliang.yang@cixtech.com>");
+MODULE_DESCRIPTION("CIX Sky1 USB3 PHY driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/phy/cix/phy-cix-usb3.h b/drivers/phy/cix/phy-cix-usb3.h
new file mode 100644
index 000000000000..b36744124edd
--- /dev/null
+++ b/drivers/phy/cix/phy-cix-usb3.h
@@ -0,0 +1,180 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _PHY_CIX_USB3_H
+#define _PHY_CIX_USB3_H
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
+#define CMN_TXPUCAL_INIT_TMR         0x0104
+#define CMN_TXPDCAL_INIT_TMR         0x010c
+#define CMN_RXCAL_INIT_TMR           0x0114
+#define CMN_SD_CAL_PLLCNT_START      0x0128
+#define CMN_PDIAG_PLL1_ITRIM_M0      0x01c3
+
+#define RX_SDCAL0_INIT_TMR_LANE0     0x8044
+#define RX_SDCAL0_INIT_TMR_LANE1     0x8244
+
+#define RX_SDCAL0_ITER_TMR_LANE0     0x8045
+#define RX_SDCAL0_ITER_TMR_LANE1     0x8245
+
+#define RX_SDCAL1_INIT_TMR_LANE0     0x804c
+#define RX_SDCAL1_INIT_TMR_LANE1     0x824c
+
+#define RX_SDCAL1_ITER_TMR_LANE0     0x804d
+#define RX_SDCAL1_ITER_TMR_LANE1     0x824d
+
+#define TX_RCVDET_ST_TMR_LANE0       0x4123
+#define TX_RCVDET_ST_TMR_LANE1       0x4323
+
+#define CMN_PDIAG_PLL0_CLK_SEL_M0    0x01a1
+
+#define XCVR_DIAG_HSCLK_SEL_LANE0    0x40e6
+#define XCVR_DIAG_HSCLK_SEL_LANE1    0x42e6
+
+#define XCVR_DIAG_HSCLK_DIV_LANE0    0x40e7
+#define XCVR_DIAG_HSCLK_DIV_LANE1    0x42e7
+
+#define XCVR_DIAG_PLLDRC_CTRL_LANE0  0x40e5
+#define XCVR_DIAG_PLLDRC_CTRL_LANE1  0x42e5
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
+#define CMN_CDIAG_CDB_PWRI_OVRD      0x0041
+#define CMN_CDIAG_XCVRC_PWRI_OVRD    0x0047
+
+#define TX_PSC_A0_LANE0              0x4100
+#define TX_PSC_A0_LANE1              0x4300
+
+#define TX_PSC_A1_LANE0              0x4101
+#define TX_PSC_A1_LANE1              0x4301
+
+#define TX_PSC_A2_LANE0              0x4102
+#define TX_PSC_A2_LANE1              0x4302
+
+#define TX_PSC_A3_LANE0              0x4103
+#define TX_PSC_A3_LANE1              0x4303
+
+#define RX_PSC_A0_LANE0              0x8000
+#define RX_PSC_A0_LANE1              0x8200
+
+#define RX_PSC_A1_LANE0              0x8001
+#define RX_PSC_A1_LANE1              0x8201
+
+#define RX_PSC_A2_LANE0              0x8002
+#define RX_PSC_A2_LANE1              0x8202
+
+#define RX_PSC_A3_LANE0              0x8003
+#define RX_PSC_A3_LANE1              0x8203
+
+#define TX_TXCC_CTRL_LANE0           0x4040
+#define TX_TXCC_CTRL_LANE1           0x4240
+
+#define TX_TXCC_CPOST_MULT_01_LANE0  0x404d
+#define TX_TXCC_CPOST_MULT_01_LANE1  0x424d
+
+#define TX_TXCC_MGNFS_MULT_000_LANE0 0x4050
+#define TX_TXCC_MGNFS_MULT_000_LANE1 0x4250
+
+#define RX_SIGDET_HL_FILT_TMR_LANE0  0x8090
+#define RX_SIGDET_HL_FILT_TMR_LANE1  0x8290
+
+#define RX_REE_GCSM1_CTRL_LANE0      0x8108
+#define RX_REE_GCSM1_CTRL_LANE1      0x8308
+
+#define RX_REE_ATTEN_THR_LANE0       0x8149
+#define RX_REE_ATTEN_THR_LANE1       0x8349
+
+#define RX_REE_SMGM_CTRL1_LANE0      0x8177
+#define RX_REE_SMGM_CTRL1_LANE1      0x8377
+
+#define RX_REE_SMGM_CTRL2_LANE0      0x8178
+#define RX_REE_SMGM_CTRL2_LANE1      0x8378
+
+#define XCVR_DIAG_PSC_OVRD_LANE0     0x40eb
+#define XCVR_DIAG_PSC_OVRD_LANE1     0x42eb
+
+#define RX_DIAG_SIGDET_TUNE_LANE0    0x81e8
+#define RX_DIAG_SIGDET_TUNE_LANE1    0x83e8
+
+#define RX_DIAG_NQST_CTRL_LANE0      0x81e5
+#define RX_DIAG_NQST_CTRL_LANE1      0x83e5
+
+#define RX_DIAG_DFE_AMP_TUNE_2_LANE0 0x81e2
+#define RX_DIAG_DFE_AMP_TUNE_2_LANE1 0x83e2
+
+#define RX_DIAG_DFE_AMP_TUNE_3_LANE0 0x81e3
+#define RX_DIAG_DFE_AMP_TUNE_3_LANE1 0x83e3
+
+#define RX_DIAG_PI_CAP_LANE0         0x81f5
+#define RX_DIAG_PI_CAP_LANE1         0x83f5
+
+#define RX_DIAG_PI_RATE_LANE0        0x81f4
+#define RX_DIAG_PI_RATE_LANE1        0x83f4
+
+#define RX_CDRLF_CNFG_LANE0          0x8080
+#define RX_CDRLF_CNFG_LANE1          0x8280
+
+#define RX_CDRLF_CNFG3_LANE0         0x8082
+#define RX_CDRLF_CNFG3_LANE1         0x8282
+
+/* Bits */
+
+#define PHY_PLL_CFG_0803              0xC00E
+/* 0803 phy register */
+#define PHY_PIPE_USB3_GEN2_PRE_CFG0_0803	0xc01c
+#define PHY_PIPE_USB3_GEN2_POST_CFG0_0803	0xc01e
+#define PHY_PIPE_USB3_GEN2_POST_CFG1_0803	0xc01f
+
+#endif
-- 
2.54.0

