Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.105
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794904484;
	b=CcxTb91ATyH45UbZJg5rMAT3hzFnxxxarnJbzAbtve5N0l8WI0hUSHgi25dX9P7OypUQ
	 CL+kvGNlZD1jQ9ni0A8Met/3lxt3Y8EtH5FaFdcTpM0xS4JeUu+LLH4UjafsTxrM10Roz
	 z3VH6QsvUrJ7L0I4ELbgl2M8n2U1TylztRmQbv9A1AD22XLDMtdp+nMUul4U+o7PlDmOr
	 PQPzmDsVCsKLd6FLyuBXtt3RxRJDosnwULkv4+IZgtgLUpy3TDxxYMh8UeIvt55KGL9IL
	 T/FLi/nbnC4fvH1Qxi0qLdCgx6VNf4aDTkibinfNGAGYgGcDDHC4VtG28d77aC6HDbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904484;
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
	bh=lypR/7ez+jQWvb5lm+Fjky5FDoOCpWH2l4POAB+Unr8=;
	b=Wg9oideHG8t7eQMKyfOg0nNPjQKdvQ/AG/6wTv3PkX2PYuyOJoUG5ZE6ZpAT/6WB0WGt
	 vy4cgmxwyWkwfwqfk3WbDyIbmfKERm5Typ2rudwLRx41FamkS4cgyBbVsHsgGbtOKvwm+
	 r7ROIPFngVk1gJeTmEhoWPvC159TYUm/QVEHSKuTtBK2OkiIj76xFeQiUS5WfoIrMbagp
	 JuwEn/3vskdcgqeNYtx4HPT4t2ZZudiK1T102z469RoqHZ15kZ86/H9p/I786yeri1hXP
	 PKP4s3LMnftNW9frQX2JAp58woToaQX5iJj7HNoXUdaxRO60sZ1sB9vinxVDOKGXj5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.105
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022105.outbound.protection.outlook.com [40.107.75.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EE6606A893;
	Tue, 17 Nov 2026 08:34:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84EE6606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=viUq+l+GptAig3BANwqUy9obU9h6VTfAcew0QntEqrzZ8wUTaXw7ct8senzNS48MQniA0+lac9gBwCBGFIL8NxCtbBFOoE9jJVzDY10uEiBsCkYRAE1al9J3Z0WYRVbk3p+dCKUbvuc9Tq1iddKjtO6Q63jR8QFBGptIh+pLKu41BAinj1QMl82MtrmZFwGjUc7RNmpg2ySYbHixuz2DHcQuts2U/GuDipLBmYA4QfxrMXHLoIMDjz9yv1LLJGeyk3lPHYvRv8oDF5y/cUdBgALnJlznLMKV+ocsfickkuKPTmqFU6iRTwt9LdPNuY7vNy5Y5s0FZkUKrN4EX3gJeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lypR/7ez+jQWvb5lm+Fjky5FDoOCpWH2l4POAB+Unr8=;
 b=SqeACf8i886ON7gytsOpGMI8gql8h23Qy1RaC9x5t2OFZGsgdGNyitqpN1SfTHJs5YT802AFqf5um6K9i3mJZgb/uqgGN46aVazAXSs2Y7xBYSTV/oM7PxgTUQz/lBBwrHWLG3cUznXHplyAbdeP1z0Fc0HqkPXhrkv+FUHIEU6Hs8iGokjo7nWFqWsq8/btRP1PHic5/F/Jx+CPkm9e+Kxg3iIf9a8xFl4Li2xgneKhlk7kPBRICoRbucnS25JS4cIPLkvWTvvPbxZe3ZLtkSBDzUaAD/OZ2gR6BGahVwOJFmC3UATo15S6kt+FfFpm2UG2lMAROGEFGrbdb7qqZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR01CA0046.apcprd01.prod.exchangelabs.com
 (2603:1096:990:5d::13) by SI2PR06MB5411.apcprd06.prod.outlook.com
 (2603:1096:4:1ee::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Tue, 17 Nov
 2026 08:34:36 +0000
Received: from SG2PEPF000B66CF.apcprd03.prod.outlook.com
 (2603:1096:990:5d:cafe::54) by JH0PR01CA0046.outlook.office365.com
 (2603:1096:990:5d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Tue,
 17 Nov 2026 08:34:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CF.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 08:34:35 +0000
Received: from gary-System-Product-Name (unknown [172.16.66.27])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id D59B340920E1;
	Tue, 17 Nov 2026 16:34:34 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Cc: Gary Yang <gary.yang@cixtech.com>,
	Luo Liu <Luo.Liu@cixtech.com>,
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] phy: cix: add Sky1 USB/DP combo PHY driver
Date: Tue, 17 Nov 2026 16:34:34 +0800
Message-ID: <20261117083434.3414417-3-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261117083434.3414417-1-gary.yang@cixtech.com>
References: <20261102082112.2306326-1-gary.yang@cixtech.com>
 <20261117083434.3414417-1-gary.yang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CF:EE_|SI2PR06MB5411:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b8028870-a454-4ec4-6c32-08df44859c85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700016|23010399003|82310400026|10067099003|5023799004|4143699003|56012099006|261026140227099003|261028144727099003|261021135927099003|261022113327099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261026121527099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	dViHg0ChVfgPLUQfUrZd1cy6AKRaeZhWrSt08NdnEUUAzGfGbLz3zWeWJIJrUY9Xe4ukLXMCoYBL4XkecKzESjCnxvC3Ua6+lMp2osAeAGiP/zQ7Vc7T1PH+79mIq56jZHwV2me/isCU46HZo6L9cne+ZHRTPjLB0ZNgGcQpk/YvkN7iC/kfykmaiGg0AlEXFMLkhOKEsBzvVAJbgpX+5ji33SD77SBc6hINo8jEi1vvoWufzhMquZ1+Vpq0zV2HEmrQkwlwefZxoYXlwIc4kxoEfdg6nMvrgRcCCaQ5Npr9L9qFMBNSDkd9ypBuWc9lPHTMz29kt9kWoRhEsuR2mS4vIb9vFCgr27dFlD9hKOMsiKEgpAeRL+JgnmUydbz2zhkE+8WwtOtW1Alg5HX3Oi+XtzDfsrhxIJe3kyKdTEmfAg4dnT68BdNS9GCMV4RwWIMLxadMNSdNY6RR0Ot2VN6gSnzRujO24/wF66qS9yIdQMW0a2dXfbIsIMuhdaTkwdh6DsEj1PkVoUXE5JsOwDSN3Gf8wxeBesgSQkxc8Np6U/kcokCoX+l/U64X00VBEwVOSpktLdrnIwmgPg8z0ql83aB8rnHbkZFTyuyKarn7yBx3Tu2RgALps4x78YTxtKSM2gv58xEZFY4Zp2yo36yF1VXyn+9xiVlIIYW2kbhj/a9PISd4L5x2Cbov7HsbX0UNx6Q/ZPAzhOQxMIwsKw==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700016)(23010399003)(82310400026)(10067099003)(5023799004)(4143699003)(56012099006)(261026140227099003)(261028144727099003)(261021135927099003)(261022113327099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261026121527099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KiuKwwohk7A9tQLx35E97hcDna12ik7aPBSs9FOELdIJqsIUT7x1GplN5vXnheUF6sVo3raxDhJUP72avNYsa1papgAI0BYeFuHzof9qXQ582iQE16b2WDkEIWhZb3s+1Eqnhq7XHDWMSpPWDNfn/qgFvd/rBGWrM0PJPv8sbon0Q+Bh9NhzxrHPOnhF+ptIQT/t5BoxlH2cev6hJNhJdSJmZhffyGmbwl3Se+xBe2nCzKQbJcEAMA8qEOmDOi0Pt1SuvclEDM+Q5611Baadu029ntBywNUdTaImFab83LNHCrFZhO/OQNWlfz/xw1c3HsXIaEaNJhqf8ANx422cH1uWKMuTAFWOHA9P0wwOSu4N7gTBgfz4xEEng+EfpDJ1vBlRiLbU4dIgtrsN41h+fL75IYDq8Ak/0oLNXNtQtUWfTZ1M/tyBHIS8A8/2hOBw
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 08:34:35.4871
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8028870-a454-4ec4-6c32-08df44859c85
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CF.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5411

Add a driver for the USB/DP combo PHY found on the CIX Sky1 SoC. A
single PHY instance drives one SuperSpeedPlus USB lane and up to four
DisplayPort lanes of a USB Type-C port, and exposes them as two PHYs
selected by PHY_TYPE_USB3 and PHY_TYPE_DP, so that the USB and DP
controllers can bind to them independently.

The PHY supports Type-C plug orientation switching, which is driven
through the S5 system controller, and muxing of the PHY lanes between
USB and DP, which is programmed in the PHY registers. It registers a
Type-C switch and mux with the Type-C class, so the orientation and
mode decisions are taken by the connector driver instead of the PHY.

The shared PHY is programmed once per mode combination: the driver
tracks the current and requested USB/DP mode as well as the plug
orientation, and reprograms the PHY on the next power-on only when the
mode combination or the orientation has changed.

Reviewed-by: Fugang Duan <fugang.duan@cixtech.com>
Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 MAINTAINERS                     |    4 +-
 drivers/phy/cix/Kconfig         |   16 +
 drivers/phy/cix/Makefile        |    1 +
 drivers/phy/cix/phy-cix-usbdp.c | 1422 +++++++++++++++++++++++++++++++
 drivers/phy/cix/phy-cix-usbdp.h |  257 ++++++
 5 files changed, 1699 insertions(+), 1 deletion(-)
 create mode 100644 drivers/phy/cix/phy-cix-usbdp.c
 create mode 100644 drivers/phy/cix/phy-cix-usbdp.h

diff --git a/MAINTAINERS b/MAINTAINERS
index d05771fe5bb2..f53c2d9de226 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6522,12 +6522,14 @@ M:	Satish Kharat <satishkh@cisco.com>
 S:	Supported
 F:	drivers/infiniband/hw/usnic/
 
-CIX SKY1 DISPLAYPORT PHY DRIVER
+CIX SKY1 PHY DRIVERS
+M:	Gary Yang <gary.yang@cixtech.com>
 M:	Luo Liu <Luo.Liu@cixtech.com>
 R:	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>
 L:	linux-phy@lists.infradead.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml
+F:	Documentation/devicetree/bindings/phy/cix,sky1-usbdp-phy.yaml
 F:	drivers/phy/cix/
 
 CLANG CONTEXT ANALYSIS
diff --git a/drivers/phy/cix/Kconfig b/drivers/phy/cix/Kconfig
index fd3becae2b23..84853a99f42f 100644
--- a/drivers/phy/cix/Kconfig
+++ b/drivers/phy/cix/Kconfig
@@ -16,3 +16,19 @@ config PHY_CIX_DP
 
 	  To compile this driver as a module, choose M here. The module will
 	  be called phy-cix-dp.
+
+config PHY_CIX_USBDP
+	tristate "CIX Sky1 USB3/DP combo PHY driver"
+	depends on OF && HAS_IOMEM && COMMON_CLK
+	depends on ARCH_CIX || COMPILE_TEST
+	depends on RESET_CONTROLLER
+	depends on TYPEC
+	select GENERIC_PHY
+	select MFD_SYSCON
+	help
+	  Enable this to support the CIX Sky1 USB3/DP combo PHY, which
+	  provides one SuperSpeedPlus USB lane and up to four DisplayPort
+	  lanes for a USB Type-C port.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called phy-cix-usbdp.
diff --git a/drivers/phy/cix/Makefile b/drivers/phy/cix/Makefile
index cc56c7586ec5..a1bc2b3d7ea2 100644
--- a/drivers/phy/cix/Makefile
+++ b/drivers/phy/cix/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_PHY_CIX_DP) += phy-cix-dp.o
+obj-$(CONFIG_PHY_CIX_USBDP) += phy-cix-usbdp.o
diff --git a/drivers/phy/cix/phy-cix-usbdp.c b/drivers/phy/cix/phy-cix-usbdp.c
new file mode 100644
index 000000000000..20507e2cba84
--- /dev/null
+++ b/drivers/phy/cix/phy-cix-usbdp.c
@@ -0,0 +1,1422 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 CIX Technology Group Co., Ltd.
+ *
+ * CIX Sky1 USB/DP combo PHY driver
+ */
+
+#include <dt-bindings/phy/phy.h>
+#include <linux/array_size.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+#include <linux/usb/typec_dp.h>
+#include <linux/usb/typec_mux.h>
+
+#include "phy-cix-usbdp.h"
+
+/* Distance between the registers of two consecutive PMA lanes. */
+#define PHY_LANE_STRIDE			0x200
+
+enum {
+	UDPHY_MODE_NONE		= 0,
+	UDPHY_MODE_USB		= BIT(0),
+	UDPHY_MODE_DP		= BIT(1),
+	UDPHY_MODE_DP_USB	= BIT(1) | BIT(0),
+};
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
+	int (*udphy_reinit)(struct cix_udphy *udphy);
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
+	{CMN_PDIAG_PLL0_CP_PADJ_M0,     0x0b17},
+	{CMN_PDIAG_PLL1_CP_PADJ_M0,     0x0b17},
+	{CMN_PDIAG_PLL0_CP_IADJ_M0,     0x0e01},
+	{CMN_PDIAG_PLL1_CP_IADJ_M0,     0x0e01},
+	{CMN_PDIAG_PLL0_FILT_PADJ_M0,   0x0d05},
+	{CMN_PDIAG_PLL1_FILT_PADJ_M0,   0x0d05},
+
+	{CMN_PLL0_INTDIV_M0,            0x01a0},
+	{CMN_PLL1_INTDIV_M0,            0x01c2},
+	{CMN_PLL0_FRACDIVL_M0,          0xaaab},
+
+	{CMN_PLL1_FRACDIVL_M0,          0x0000}, /* reset value. */
+
+	{CMN_PLL0_FRACDIVH_M0,          0x0002},
+	{CMN_PLL1_FRACDIVH_M0,          0x0002},
+	{CMN_PLL0_HIGH_THR_M0,          0x0116},
+	{CMN_PLL1_HIGH_THR_M0,          0x012c},
+	{CMN_PDIAG_PLL0_CTRL_M0,        0x1002},
+	{CMN_PDIAG_PLL1_CTRL_M0,        0x1002},
+	{CMN_PLL0_SS_CTRL1_M0,          0x0001},
+	{CMN_PLL1_SS_CTRL1_M0,          0x0001},
+	{CMN_PLL0_SS_CTRL2_M0,          0x0416},
+	{CMN_PLL1_SS_CTRL2_M0,          0x044f},
+	{CMN_PLL0_SS_CTRL3_M0,          0x007c},
+	{CMN_PLL1_SS_CTRL3_M0,          0x007f},
+	{CMN_PLL0_SS_CTRL4_M0,          0x0003},
+	{CMN_PLL1_SS_CTRL4_M0,          0x0003},
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
+
+	/* usb_part */
+	{PHY_PMA_LANE_MAP,              0x5100},
+	{PHY_LANE_OFF_CTRL,             0x0100},
+	{PHY_PIPE_USB3_GEN2_PRE_CFG0,   0x0a0a},
+	{PHY_PIPE_USB3_GEN2_POST_CFG0,  0x1000},
+	{PHY_PIPE_USB3_GEN2_POST_CFG1,  0x0010},
+	{CMN_CDIAG_CDB_PWRI_OVRD,       0x8200},
+	{CMN_CDIAG_XCVRC_PWRI_OVRD,     0x8200},
+	{TX_PSC_A0_LANE0,               0x02ff},
+	{TX_PSC_A1_LANE0,               0x06af},
+	{TX_PSC_A2_LANE0,               0x06ae},
+	{TX_PSC_A3_LANE0,               0x06ae},
+	{RX_PSC_A0_LANE1,               0x0d1d},
+	{RX_PSC_A1_LANE1,               0x0d1d},
+	{RX_PSC_A2_LANE1,               0x0d00},
+	{RX_PSC_A3_LANE1,               0x0500},
+	{TX_TXCC_CTRL_LANE0,            0x2a82},
+	{TX_TXCC_CPOST_MULT_01_LANE0,   0x0014},
+	{TX_TXCC_MGNFS_MULT_000_LANE0,  0x0007},
+	{RX_SIGDET_HL_FILT_TMR_LANE1,   0x0013},
+	{RX_REE_GCSM1_CTRL_LANE1,       0x0000},
+	{RX_REE_ATTEN_THR_LANE1,        0x0c02},
+	{RX_REE_SMGM_CTRL1_LANE1,       0x0330},
+	{RX_REE_SMGM_CTRL2_LANE1,       0x0300},
+	{XCVR_DIAG_PSC_OVRD_LANE1,      0x0003},
+	{RX_DIAG_SIGDET_TUNE_LANE1,     0x1004},
+	{RX_DIAG_NQST_CTRL_LANE1,       0x00f9},
+	{RX_DIAG_DFE_AMP_TUNE_2_LANE1,  0x0c01},
+	{RX_DIAG_DFE_AMP_TUNE_3_LANE1,  0x0002},
+	{RX_DIAG_PI_CAP_LANE1,          0x0000},
+	{RX_DIAG_PI_RATE_LANE1,         0x0031},
+	{RX_DIAG_ACYA_LANE0,            0x0002},
+	{RX_CDRLF_CNFG_LANE1,           0x018c},
+	{RX_CDRLF_CNFG3_LANE1,          0x0003},
+	/* usb adding to upspeed */
+	{XCVR_DIAG_BIDI_CTRL_LANE0,     0x000f}, /* new add */
+	{XCVR_DIAG_BIDI_CTRL_LANE1,     0x00f0}, /* new add */
+
+	/* dp_part */
+	{PHY_PMA_ISO_PLL_CTRL0,         0x000b},
+	{PHY_PMA_ISO_PLL_CTRL1,         0x2224},
+
+	{TX_PSC_A0_LANE2,              0x00fb},
+	{TX_PSC_A0_LANE3,              0x00fb},
+	{TX_PSC_A2_LANE2,              0x04aa},
+	{TX_PSC_A2_LANE3,              0x04aa},
+	{TX_PSC_A3_LANE2,              0x04aa},
+	{TX_PSC_A3_LANE3,              0x04aa},
+	{RX_PSC_A0_LANE2,              0x0000},
+	{RX_PSC_A0_LANE3,              0x0000},
+	{RX_PSC_A2_LANE2,              0x0000},
+	{RX_PSC_A2_LANE3,              0x0000},
+	{RX_PSC_A3_LANE2,              0x0000},
+	{RX_PSC_A3_LANE3,              0x0000},
+	{RX_PSC_CAL_LANE2,             0x0000},
+	{RX_PSC_CAL_LANE3,             0x0000},
+	{XCVR_DIAG_BIDI_CTRL_LANE2,    0x000f},
+	{XCVR_DIAG_BIDI_CTRL_LANE3,    0x000f},
+	{RX_REE_GCSM1_CTRL_LANE2,      0x0000},
+	{RX_REE_GCSM1_CTRL_LANE3,      0x0000},
+	{RX_REE_GCSM2_CTRL_LANE2,      0x0000},
+	{RX_REE_GCSM2_CTRL_LANE3,      0x0000},
+	{RX_REE_PERGCSM_CTRL_LANE2,    0x0000},
+	{RX_REE_PERGCSM_CTRL_LANE3,    0x0000},
+
+	{CMN_DIAG_GPANA_0,             0x0100},
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
+	{CMN_PLL1_SS_CTRL2_M0,          0x044f},
+	{CMN_PLL0_SS_CTRL3_M0,          0x007c},
+	{CMN_PLL1_SS_CTRL3_M0,          0x007f},
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
+	{PHY_PMA_LANE_MAP,              0x51d9},
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
+	{CMN_PLL1_SS_CTRL2_M0,          0x044f},
+	{CMN_PLL1_SS_CTRL3_M0,          0x007f},
+	{CMN_PLL1_SS_CTRL4_M0,          0x0003},
+};
+
+static const struct reg_sequence sky1_udphy_usbdp_conf_flip[] = {
+	/* common_part */
+	{CMN_SSM_BIAS_TMR,             0x0018},
+	{CMN_PLLSM0_PLLPRE_TMR,        0x0030},
+	{CMN_PLLSM0_PLLLOCK_TMR,       0x00f0},
+	{CMN_PLLSM1_PLLPRE_TMR,        0x0030},
+	{CMN_PLLSM1_PLLLOCK_TMR,       0x00f0},
+	{CMN_BGCAL_INIT_TMR,           0x0078},
+	{CMN_BGCAL_ITER_TMR,           0x0078},
+	{CMN_IBCAL_INIT_TMR,           0x0018},
+	{CMN_TXPUCAL_INIT_TMR,         0x001d},
+	{CMN_TXPDCAL_INIT_TMR,         0x001d},
+	{CMN_RXCAL_INIT_TMR,           0x02d0},
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
+	{CMN_PDIAG_PLL0_CP_PADJ_M0,    0x0b17},
+	{CMN_PDIAG_PLL1_CP_PADJ_M0,    0x0b17},
+	{CMN_PDIAG_PLL0_CP_IADJ_M0,    0x0e01},
+	{CMN_PDIAG_PLL1_CP_IADJ_M0,    0x0e01},
+	{CMN_PDIAG_PLL0_FILT_PADJ_M0,  0x0d05},
+	{CMN_PDIAG_PLL1_FILT_PADJ_M0,  0x0d05},
+
+	{CMN_PLL0_INTDIV_M0,           0x01a0},
+	{CMN_PLL1_INTDIV_M0,           0x01c2},
+	{CMN_PLL0_FRACDIVL_M0,         0xaaab},
+
+	{CMN_PLL1_FRACDIVL_M0,         0x0000}, /* reset value */
+
+	{CMN_PLL0_FRACDIVH_M0,         0x0002},
+	{CMN_PLL1_FRACDIVH_M0,         0x0002},
+	{CMN_PLL0_HIGH_THR_M0,         0x0116},
+	{CMN_PLL1_HIGH_THR_M0,         0x012c},
+	{CMN_PDIAG_PLL0_CTRL_M0,       0x1002},
+	{CMN_PDIAG_PLL1_CTRL_M0,       0x1002},
+	{CMN_PLL0_SS_CTRL1_M0,         0x0001},
+	{CMN_PLL1_SS_CTRL1_M0,         0x0001},
+	{CMN_PLL0_SS_CTRL2_M0,         0x0416},
+	{CMN_PLL1_SS_CTRL2_M0,         0x044f},
+	{CMN_PLL0_SS_CTRL3_M0,         0x007c},
+	{CMN_PLL1_SS_CTRL3_M0,         0x007f},
+	{CMN_PLL0_SS_CTRL4_M0,         0x0003},
+	{CMN_PLL1_SS_CTRL4_M0,         0x0003},
+	{CMN_PLL0_VCOCAL_INIT_TMR,     0x00f0},
+	{CMN_PLL1_VCOCAL_INIT_TMR,     0x00f0},
+	{CMN_PLL0_VCOCAL_ITER_TMR,     0x0004},
+	{CMN_PLL1_VCOCAL_ITER_TMR,     0x0004},
+	{CMN_PLL0_VCOCAL_REFTIM_START, 0x02f8},
+	{CMN_PLL1_VCOCAL_REFTIM_START, 0x02f8},
+	{CMN_PLL0_VCOCAL_PLLCNT_START, 0x02f6},
+	{CMN_PLL1_VCOCAL_PLLCNT_START, 0x02f6},
+	{CMN_PLL0_VCOCAL_TCTRL,        0x0003},
+	{CMN_PLL1_VCOCAL_TCTRL,        0x0003},
+	{CMN_PLL0_LOCK_REFCNT_START,   0x00bf},
+	{CMN_PLL1_LOCK_REFCNT_START,   0x00bf},
+	{CMN_PLL0_LOCK_PLLCNT_START,   0x00bf},
+	{CMN_PLL1_LOCK_PLLCNT_START,   0x00bf},
+	{CMN_PLL0_LOCK_PLLCNT_THR,     0x0005},
+	{CMN_PLL1_LOCK_PLLCNT_THR,     0x0005},
+	/* usb_part */
+	{PHY_PMA_LANE_MAP,             0x5100},
+	{PHY_LANE_OFF_CTRL,            0x0100},
+	{PHY_PIPE_USB3_GEN2_PRE_CFG0,  0x0a0a},
+	{PHY_PIPE_USB3_GEN2_POST_CFG0, 0x1000},
+	{PHY_PIPE_USB3_GEN2_POST_CFG1, 0x0010},
+	{CMN_CDIAG_CDB_PWRI_OVRD,      0x8200},
+	{CMN_CDIAG_XCVRC_PWRI_OVRD,    0x8200},
+	{TX_PSC_A0_LANE3,              0x02ff},
+	{TX_PSC_A1_LANE3,              0x06af},
+	{TX_PSC_A2_LANE3,              0x06ae},
+	{TX_PSC_A3_LANE3,              0x06ae},
+	{RX_PSC_A0_LANE2,              0x0d1d},
+	{RX_PSC_A1_LANE2,              0x0d1d},
+	{RX_PSC_A2_LANE2,              0x0d00},
+	{RX_PSC_A3_LANE2,              0x0500},
+	{TX_TXCC_CTRL_LANE3,           0x2a82},
+	{TX_TXCC_CPOST_MULT_01_LANE3,  0x0014},
+	{TX_TXCC_MGNFS_MULT_000_LANE3, 0x0007},
+	{RX_SIGDET_HL_FILT_TMR_LANE2,  0x0013},
+	{RX_REE_GCSM1_CTRL_LANE2,      0x0000},
+	{RX_REE_ATTEN_THR_LANE2,       0x0c02},
+	{RX_REE_SMGM_CTRL1_LANE2,      0x0330},
+	{RX_REE_SMGM_CTRL2_LANE2,      0x0300},
+	{XCVR_DIAG_PSC_OVRD_LANE2,     0x0003},
+	{RX_DIAG_SIGDET_TUNE_LANE2,    0x1004},
+	{RX_DIAG_NQST_CTRL_LANE2,      0x00f9},
+	{RX_DIAG_DFE_AMP_TUNE_2_LANE2, 0x0c01},
+	{RX_DIAG_DFE_AMP_TUNE_3_LANE2, 0x0002},
+	{RX_DIAG_PI_CAP_LANE2,         0x0000},
+	{RX_DIAG_PI_RATE_LANE2,        0x0031},
+	{RX_DIAG_ACYA_LANE3,           0x0002},
+	{RX_CDRLF_CNFG_LANE2,          0x018c},
+	{RX_CDRLF_CNFG3_LANE2,         0x0003},
+	/* usb adding to upspeed */
+	{XCVR_DIAG_BIDI_CTRL_LANE2,    0x00f0},
+	{XCVR_DIAG_BIDI_CTRL_LANE3,    0x000f},
+
+	/* dp_part */
+	{PHY_PMA_ISO_PLL_CTRL0,        0x000b},
+	{PHY_PMA_ISO_PLL_CTRL1,        0x2224},
+
+	/* lane0, lane1 */
+	{TX_PSC_A0_LANE0,              0x00fb},
+	{TX_PSC_A0_LANE1,              0x00fb},
+	{TX_PSC_A2_LANE0,              0x04aa},
+	{TX_PSC_A2_LANE1,              0x04aa},
+	{TX_PSC_A3_LANE0,              0x04aa},
+	{TX_PSC_A3_LANE1,              0x04aa},
+	{RX_PSC_A0_LANE0,              0x0000},
+	{RX_PSC_A0_LANE1,              0x0000},
+	{RX_PSC_A2_LANE0,              0x0000},
+	{RX_PSC_A2_LANE1,              0x0000},
+	{RX_PSC_A3_LANE0,              0x0000},
+	{RX_PSC_A3_LANE1,              0x0000},
+	{RX_PSC_CAL_LANE0,             0x0000},
+	{RX_PSC_CAL_LANE1,             0x0000},
+	{XCVR_DIAG_BIDI_CTRL_LANE0,    0x000f},
+	{XCVR_DIAG_BIDI_CTRL_LANE1,    0x000f},
+	{RX_REE_GCSM1_CTRL_LANE0,      0x0000},
+	{RX_REE_GCSM1_CTRL_LANE1,      0x0000},
+	{RX_REE_GCSM2_CTRL_LANE0,      0x0000},
+	{RX_REE_GCSM2_CTRL_LANE1,      0x0000},
+	{RX_REE_PERGCSM_CTRL_LANE0,    0x0000},
+	{RX_REE_PERGCSM_CTRL_LANE1,    0x0000},
+
+	{CMN_DIAG_GPANA_0,             0x0100},
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
+	struct regmap *usbphy_syscon;
+	struct reset_control *preset;
+	struct reset_control *reset;
+	struct clk *apb_clk;
+	struct typec_switch_dev *sw;
+	struct typec_mux_dev *mux;
+	struct phy *u3_phy;
+	struct phy *dp_phy;
+	struct mutex mutex; /* mutex to protect access to individual PHYs */
+	const struct cix_udphy_cfg *cfg;
+	u32 id;
+	u8 cur_mode;
+	u8 next_mode;
+	u8 dp_lanes;
+	bool flip;
+	bool needs_reinit;
+};
+
+static inline void udphy_write(struct cix_udphy *udphy, u32 reg, u32 val)
+{
+	writel(val, udphy->base + reg * 4);
+}
+
+static inline void udphy_update_bits(struct cix_udphy *udphy, u32 reg,
+				     u32 mask, u32 val)
+{
+	void __iomem *addr = udphy->base + reg * 4;
+	u32 tmp;
+
+	tmp = readl(addr);
+	writel((tmp & ~mask) | (val & mask), addr);
+}
+
+static inline void udphy_write_table(struct cix_udphy *udphy,
+				     const struct reg_sequence *seq,
+				     unsigned int num)
+{
+	unsigned int i;
+
+	for (i = 0; i < num; i++)
+		udphy_write(udphy, seq[i].reg, seq[i].def);
+}
+
+/* Link rate change */
+struct phy_link_cfg {
+	const struct reg_sequence *seq;
+	unsigned int num_seq;
+	u32 hsclk_div;
+	u32 clk_sel;
+	u32 pll_intdiv;
+	u32 pll_fracdivl;
+	u32 pll_high_thr;
+};
+
+static const struct phy_link_cfg link_cfg[] = {
+	{ sky1_udphy_dp_partial_conf, ARRAY_SIZE(sky1_udphy_dp_partial_conf),
+	  0x0002, 0x0f01, 0x0195, 0x0000, 0x010e },  /* 1.62 Gbps */
+	{ sky1_udphy_dp_partial_conf, ARRAY_SIZE(sky1_udphy_dp_partial_conf),
+	  0x0001, 0x0701, 0x01c2, 0x0000, 0x012c },  /* 2.70 Gbps */
+	{ sky1_udphy_dp_partial_conf, ARRAY_SIZE(sky1_udphy_dp_partial_conf),
+	  0x0000, 0x0301, 0x01c2, 0x0000, 0x012c },  /* 5.40 Gbps */
+	{ sky1_udphy_dp_8p1_conf, ARRAY_SIZE(sky1_udphy_dp_8p1_conf),
+	  0x0000, 0x0200, 0x0151, 0x8000, 0x00e2 },  /* 8.10 Gbps */
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
+	{ 0x08a4, 0x0003, 0x0028, 0x0000 }, /* swing level == 0 */
+	{ 0x08a4, 0x0003, 0x001f, 0x0014 },
+	{ 0x08a4, 0x0003, 0x0012, 0x0020 },
+	{ 0x08a4, 0x0003, 0x0000, 0x0027 },
+	{ 0x08a4, 0x0003, 0x001f, 0x0000 }, /* swing level == 1 */
+	{ 0x08a4, 0x0003, 0x0013, 0x0012 },
+	{ 0x08a4, 0x0003, 0x0000, 0x001f },
+	{ 0x08a4, 0x0003, 0x0000, 0x001f },
+	{ 0x08a4, 0x0003, 0x0013, 0x0000 }, /* swing level == 2 */
+	{ 0x08a4, 0x0003, 0x0000, 0x0013 },
+	{ 0x08a4, 0x0003, 0x0000, 0x0013 },
+	{ 0x08a4, 0x0003, 0x0000, 0x0013 },
+	{ 0x08a4, 0x0003, 0x0000, 0x0000 }, /* swing level == 3 */
+	{ 0x08a4, 0x0003, 0x0000, 0x0000 },
+	{ 0x08a4, 0x0003, 0x0000, 0x0000 },
+	{ 0x08a4, 0x0003, 0x0000, 0x0000 },
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
+static void sky1_udphy_set_orientation(struct cix_udphy *udphy)
+{
+	const struct cix_udphy_con_dir *con_dir =
+		&udphy->cfg->con_dir[udphy->id];
+
+	regmap_update_bits(udphy->usbphy_syscon, con_dir->offset,
+			   GENMASK(con_dir->bit, con_dir->bit),
+			   (u32)udphy->flip << con_dir->bit);
+
+	usleep_range(10, 20);
+}
+
+static void sky1_udphy_write_mode_table(struct cix_udphy *udphy)
+{
+	if (udphy->next_mode == UDPHY_MODE_DP) {
+		udphy_write_table(udphy, sky1_udphy_dp_conf,
+				  ARRAY_SIZE(sky1_udphy_dp_conf));
+	} else if (!udphy->flip) {
+		udphy_write_table(udphy, sky1_udphy_usbdp_conf_normal,
+				  ARRAY_SIZE(sky1_udphy_usbdp_conf_normal));
+	} else {
+		udphy_write_table(udphy, sky1_udphy_usbdp_conf_flip,
+				  ARRAY_SIZE(sky1_udphy_usbdp_conf_flip));
+	}
+}
+
+/* Reprogram the PHY after the mode or the plug orientation has changed. */
+static int sky1_udphy_reinit(struct cix_udphy *udphy)
+{
+	sky1_udphy_set_orientation(udphy);
+
+	/*
+	 * The APB clock is still enabled, so the block can be reset without
+	 * running the full power-on sequence again.
+	 */
+	reset_control_assert(udphy->reset);
+	reset_control_assert(udphy->preset);
+	reset_control_deassert(udphy->preset);
+
+	sky1_udphy_write_mode_table(udphy);
+
+	reset_control_deassert(udphy->reset);
+
+	return 0;
+}
+
+static int sky1_udphy_init(struct cix_udphy *udphy)
+{
+	int ret;
+
+	sky1_udphy_set_orientation(udphy);
+
+	/* usb rcsu reset is default deassert */
+	reset_control_assert(udphy->reset);
+	reset_control_assert(udphy->preset);
+
+	ret = sky1_udphy_clk_enable(udphy->apb_clk);
+	if (ret) {
+		dev_err(udphy->dev, "failed to enable APB clock\n");
+		return ret;
+	}
+
+	reset_control_deassert(udphy->preset);
+
+	sky1_udphy_write_mode_table(udphy);
+
+	reset_control_deassert(udphy->reset);
+
+	return 0;
+}
+
+static const struct cix_udphy_cfg sky1_udphy_cfg = {
+	.con_dir = sky1_udphy_con_dir,
+	.udphy_init = sky1_udphy_init,
+	.udphy_reinit = sky1_udphy_reinit,
+	.udphy_exit = sky1_udphy_exit
+};
+
+static int udphy_orien_sw_set(struct typec_switch_dev *sw,
+			      enum typec_orientation orien)
+{
+	struct cix_udphy *udphy = typec_switch_get_drvdata(sw);
+	bool flip;
+
+	guard(mutex)(&udphy->mutex);
+
+	if (orien == TYPEC_ORIENTATION_NONE)
+		return 0;
+
+	flip = (orien == TYPEC_ORIENTATION_REVERSE);
+	if (udphy->flip != flip) {
+		dev_dbg(udphy->dev, "plug orientation changed, re-init required\n");
+		udphy->needs_reinit = true;
+	}
+
+	udphy->flip = flip;
+
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
+	if (IS_ERR(udphy->sw))
+		return dev_err_probe(udphy->dev, PTR_ERR(udphy->sw),
+				     "failed to register orientation switch\n");
+
+	return 0;
+}
+
+static bool usbdp_typec_is_supported_mode(struct typec_mux_state *state)
+{
+	/* Handle Safe State and USB State */
+	if (state->mode < TYPEC_STATE_MODAL)
+		return true;
+
+	/* Handle DisplayPort Alt Mode, other alt modes are not muxed here */
+	if (state->alt && state->alt->svid == USB_TYPEC_DP_SID)
+		return true;
+
+	return false;
+}
+
+static int usbdp_typec_mux_set(struct typec_mux_dev *mux,
+			       struct typec_mux_state *state)
+{
+	struct cix_udphy *udphy = typec_mux_get_drvdata(mux);
+	u8 mode;
+
+	/* Ignore mux events not involving USB or DisplayPort */
+	if (!usbdp_typec_is_supported_mode(state)) {
+		dev_dbg(udphy->dev, "ignore mux event with mode=%lu\n",
+			state->mode);
+		return 0;
+	}
+
+	switch (state->mode) {
+	case TYPEC_DP_STATE_C:
+		fallthrough;
+	case TYPEC_DP_STATE_E:
+		mode = UDPHY_MODE_DP;
+		break;
+	case TYPEC_DP_STATE_D:
+		fallthrough;
+	case TYPEC_DP_STATE_F:
+		mode = UDPHY_MODE_DP_USB;
+		break;
+	default:
+		/* usb only handle as usb+dp mode */
+		mode = UDPHY_MODE_USB;
+		break;
+	}
+
+	guard(mutex)(&udphy->mutex);
+
+	if (udphy->next_mode != mode) {
+		dev_dbg(udphy->dev, "new mode: %u\n", mode);
+
+		/*
+		 * The USB and the USB+DP modes share one register table, only
+		 * the DP-only mode needs a different one.
+		 */
+		if (mode == UDPHY_MODE_DP || udphy->next_mode == UDPHY_MODE_DP)
+			udphy->needs_reinit = true;
+	}
+
+	udphy->next_mode = mode;
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
+	if (IS_ERR(udphy->mux))
+		return dev_err_probe(udphy->dev, PTR_ERR(udphy->mux),
+				     "failed to register typec mux\n");
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
+	int ret;
+
+	if (udphy->cur_mode == udphy->next_mode && !udphy->needs_reinit)
+		return 0;
+
+	if (udphy->cur_mode == UDPHY_MODE_NONE)
+		ret = udphy->cfg->udphy_init(udphy);
+	else if (udphy->needs_reinit)
+		ret = udphy->cfg->udphy_reinit(udphy);
+	else
+		return 0;
+
+	if (ret) {
+		dev_err(udphy->dev, "failed to bring up udphy\n");
+		return ret;
+	}
+
+	udphy->needs_reinit = false;
+
+	return 0;
+}
+
+static int cix_usbdp_phy_power_off(struct cix_udphy *udphy)
+{
+	int ret;
+
+	ret = udphy->cfg->udphy_exit(udphy);
+	if (ret) {
+		dev_err(udphy->dev, "failed to exit udphy\n");
+		return ret;
+	}
+
+	udphy->cur_mode = UDPHY_MODE_NONE;
+
+	return 0;
+}
+
+static int udphy_dp_phy_power_on(struct phy *phy)
+{
+	struct cix_udphy *udphy = phy_get_drvdata(phy);
+	int ret;
+
+	guard(mutex)(&udphy->mutex);
+
+	if (!(udphy->next_mode & UDPHY_MODE_DP))
+		return 0;
+
+	udphy->dp_lanes = udphy_dplane_get(udphy);
+
+	ret = cix_usbdp_phy_power_on(udphy);
+	if (ret)
+		return ret;
+
+	phy_set_bus_width(phy, udphy->dp_lanes);
+	udphy->cur_mode |= UDPHY_MODE_DP;
+
+	return 0;
+}
+
+static int udphy_dp_phy_power_off(struct phy *phy)
+{
+	struct cix_udphy *udphy = phy_get_drvdata(phy);
+
+	guard(mutex)(&udphy->mutex);
+
+	if (!(udphy->cur_mode & UDPHY_MODE_DP))
+		return 0;
+
+	udphy->cur_mode &= ~UDPHY_MODE_DP;
+	phy_set_bus_width(phy, 0);
+
+	if (udphy->cur_mode == UDPHY_MODE_NONE)
+		return cix_usbdp_phy_power_off(udphy);
+
+	return 0;
+}
+
+/*
+ * Return the PMA lane the given DP lane is routed to. The two inner lanes
+ * of the Type-C connector are always used first, the outer lanes are only
+ * used by 4-lane DisplayPort operation.
+ */
+static u32 udphy_dp_lane_to_pma(struct cix_udphy *udphy, u32 lane)
+{
+	if (udphy->flip)
+		return lane ^ 1;
+
+	return (lane + 2) & 3;
+}
+
+static int udphy_dp_phy_verify_link_rate(struct phy_configure_opts_dp *dp)
+{
+	switch (dp->link_rate) {
+	case 1620:
+	case 2700:
+	case 5400:
+	case 8100:
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int udphy_dp_phy_verify_lanes(struct cix_udphy *udphy,
+				     struct phy_configure_opts_dp *dp)
+{
+	if (dp->lanes > udphy_dplane_get(udphy))
+		return -EINVAL;
+
+	switch (dp->lanes) {
+	case 1:
+	case 2:
+	case 4:
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+/*
+ * If changing voltages is required, check swing and pre-emphasis
+ * levels, per-lane.
+ */
+static int udphy_dp_phy_verify_voltages(struct cix_udphy *udphy,
+					struct phy_configure_opts_dp *dp)
+{
+	int lanes = dp->set_lanes ? dp->lanes : udphy->dp_lanes;
+	int i;
+
+	for (i = 0; i < lanes; i++) {
+		if (dp->voltage[i] > 3 || dp->pre[i] > 3)
+			return -EINVAL;
+
+		/*
+		 * Sum of voltage swing and pre-emphasis levels cannot
+		 * exceed 3.
+		 */
+		if (dp->voltage[i] + dp->pre[i] > 3)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int udphy_dp_phy_set_rate(struct cix_udphy *udphy,
+				 struct phy_configure_opts_dp *dp)
+{
+	const struct phy_link_cfg *conf;
+	u32 i;
+
+	switch (dp->link_rate) {
+	case 1620:
+		conf = &link_cfg[0];
+		break;
+	case 2700:
+		conf = &link_cfg[1];
+		break;
+	case 5400:
+		conf = &link_cfg[2];
+		break;
+	case 8100:
+		conf = &link_cfg[3];
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	dev_dbg(udphy->dev, "lane %u, rate %u\n", udphy->dp_lanes,
+		dp->link_rate);
+
+	udphy_update_bits(udphy, PHY_PMA_PLL_CTRL, BIT(1), 0x0);
+	usleep_range(10, 20);
+
+	udphy_write_table(udphy, conf->seq, conf->num_seq);
+
+	for (i = 0; i < udphy->dp_lanes; i++) {
+		u32 lane = udphy_dp_lane_to_pma(udphy, i);
+
+		udphy_write(udphy,
+			    XCVR_DIAG_HSCLK_DIV_LANE0 + lane * PHY_LANE_STRIDE,
+			    conf->hsclk_div);
+	}
+
+	udphy_write(udphy, CMN_PLL1_INTDIV_M0, conf->pll_intdiv);
+	udphy_write(udphy, CMN_PLL1_FRACDIVL_M0, conf->pll_fracdivl);
+	udphy_write(udphy, CMN_PLL1_HIGH_THR_M0, conf->pll_high_thr);
+	udphy_write(udphy, CMN_PDIAG_PLL1_CLK_SEL_M0, conf->clk_sel);
+
+	udphy_update_bits(udphy, PHY_PMA_PLL_CTRL, BIT(1), BIT(1));
+	usleep_range(10, 20);
+
+	return 0;
+}
+
+static void udphy_dp_phy_set_lane(struct cix_udphy *udphy, u32 lane,
+				  const struct phy_voltage_conf *cfg)
+{
+	u32 base = lane * PHY_LANE_STRIDE;
+
+	udphy_update_bits(udphy, TX_DIAG_ACYA_LANE0 + base, BIT(0), 0x1);
+	udphy_write(udphy, TX_TXCC_CTRL_LANE0 + base, cfg->tx_txcc_ctrl);
+	udphy_write(udphy, DRV_DIAG_TX_DRV_LANE0 + base, cfg->drv_diag_tx_drv);
+	udphy_write(udphy, TX_TXCC_MGNFS_MULT_000_LANE0 + base,
+		    cfg->tx_txcc_mgnfc_mult_000);
+	udphy_write(udphy, TX_TXCC_CPOST_MULT_00_LANE0 + base,
+		    cfg->tx_txcc_cpost_mult_00);
+	udphy_update_bits(udphy, TX_DIAG_ACYA_LANE0 + base, BIT(0), 0x0);
+}
+
+static int udphy_dp_phy_set_voltages(struct cix_udphy *udphy,
+				     struct phy_configure_opts_dp *dp)
+{
+	u32 i;
+
+	for (i = 0; i < udphy->dp_lanes; i++) {
+		const struct phy_voltage_conf *cfg =
+			&volt_cfg[dp->voltage[i] * 4 + dp->pre[i]];
+
+		dev_dbg(udphy->dev, "lane %u, vs %u, pe %u\n", i,
+			dp->voltage[i], dp->pre[i]);
+
+		udphy_dp_phy_set_lane(udphy, udphy_dp_lane_to_pma(udphy, i),
+				      cfg);
+	}
+
+	return 0;
+}
+
+static int udphy_dp_phy_configure(struct phy *phy,
+				  union phy_configure_opts *opts)
+{
+	struct cix_udphy *udphy = phy_get_drvdata(phy);
+	struct phy_configure_opts_dp *dp = &opts->dp;
+	int ret;
+
+	guard(mutex)(&udphy->mutex);
+
+	/*
+	 * The PHY registers are only clocked while the PHY is up, so there is
+	 * nothing that can be programmed before the link has been powered on.
+	 */
+	if (!(udphy->cur_mode & UDPHY_MODE_DP)) {
+		dev_dbg(udphy->dev, "PHY is down, ignoring configuration\n");
+		return 0;
+	}
+
+	if (dp->set_rate) {
+		ret = udphy_dp_phy_verify_link_rate(dp);
+		if (ret)
+			return ret;
+	}
+
+	if (dp->set_lanes) {
+		ret = udphy_dp_phy_verify_lanes(udphy, dp);
+		if (ret)
+			return ret;
+	}
+
+	if (dp->set_voltages) {
+		ret = udphy_dp_phy_verify_voltages(udphy, dp);
+		if (ret)
+			return ret;
+	}
+
+	/* All of the options are valid, so they can be applied now. */
+	if (dp->set_lanes)
+		udphy->dp_lanes = dp->lanes;
+
+	if (dp->set_rate) {
+		ret = udphy_dp_phy_set_rate(udphy, dp);
+		if (ret) {
+			dev_err(udphy->dev, "failed to set DP link rate\n");
+			return ret;
+		}
+	}
+
+	if (dp->set_voltages) {
+		ret = udphy_dp_phy_set_voltages(udphy, dp);
+		if (ret) {
+			dev_err(udphy->dev, "failed to set DP voltages\n");
+			return ret;
+		}
+	}
+
+	return 0;
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
+	int ret;
+
+	guard(mutex)(&udphy->mutex);
+
+	if (!(udphy->next_mode & UDPHY_MODE_USB))
+		return 0;
+
+	ret = cix_usbdp_phy_power_on(udphy);
+	if (ret)
+		return ret;
+
+	udphy->cur_mode |= UDPHY_MODE_USB;
+
+	return 0;
+}
+
+static int cix_u3phy_exit(struct phy *phy)
+{
+	struct cix_udphy *udphy = phy_get_drvdata(phy);
+
+	guard(mutex)(&udphy->mutex);
+
+	if (!(udphy->cur_mode & UDPHY_MODE_USB))
+		return 0;
+
+	udphy->cur_mode &= ~UDPHY_MODE_USB;
+
+	if (udphy->cur_mode == UDPHY_MODE_NONE)
+		return cix_usbdp_phy_power_off(udphy);
+
+	return 0;
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
+	.init		= cix_u3phy_init,
+	.set_mode	= cix_u3phy_set_mode,
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
+
+	/* Until the connector driver reports the alt mode, expose both. */
+	udphy->next_mode = UDPHY_MODE_DP_USB;
+}
+
+static struct phy *cix_udphy_phy_xlate(struct device *dev,
+				       const struct of_phandle_args *args)
+{
+	struct cix_udphy *udphy = dev_get_drvdata(dev);
+
+	if (args->args_count != 1)
+		return ERR_PTR(-EINVAL);
+
+	switch (args->args[0]) {
+	case PHY_TYPE_USB3:
+		return udphy->u3_phy;
+	case PHY_TYPE_DP:
+		return udphy->dp_phy;
+	}
+
+	return ERR_PTR(-EINVAL);
+}
+
+static int cix_udphy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct phy_provider *phy_provider;
+	struct cix_udphy *udphy;
+	u32 id;
+	int ret;
+
+	udphy = devm_kzalloc(dev, sizeof(*udphy), GFP_KERNEL);
+	if (!udphy)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, udphy);
+	udphy->dev = dev;
+	udphy_set_default_mode(udphy);
+
+	udphy->usbphy_syscon =
+		syscon_regmap_lookup_by_phandle_args(np, "cix,usbphy-syscon", 1,
+						     &id);
+	if (IS_ERR(udphy->usbphy_syscon))
+		return dev_err_probe(dev, PTR_ERR(udphy->usbphy_syscon),
+				     "failed to get usbphy syscon\n");
+
+	if (id >= ARRAY_SIZE(sky1_udphy_con_dir))
+		return dev_err_probe(dev, -EINVAL,
+				     "invalid usbphy syscon id\n");
+
+	udphy->id = id;
+
+	udphy->cfg = device_get_match_data(dev);
+	if (!udphy->cfg)
+		return dev_err_probe(dev, -EINVAL,
+				     "failed to get match data\n");
+
+	udphy->reset = devm_reset_control_get_exclusive(dev, "core");
+	if (IS_ERR(udphy->reset))
+		return dev_err_probe(dev, PTR_ERR(udphy->reset),
+				     "failed to get reset\n");
+
+	udphy->preset = devm_reset_control_get_exclusive(dev, "apb");
+	if (IS_ERR(udphy->preset))
+		return dev_err_probe(dev, PTR_ERR(udphy->preset),
+				     "failed to get preset\n");
+
+	reset_control_assert(udphy->reset);
+	reset_control_assert(udphy->preset);
+
+	udphy->apb_clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(udphy->apb_clk))
+		return dev_err_probe(dev, PTR_ERR(udphy->apb_clk),
+				     "failed to get APB clock\n");
+
+	udphy->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(udphy->base))
+		return dev_err_probe(dev, PTR_ERR(udphy->base),
+				     "failed to remap registers\n");
+
+	mutex_init(&udphy->mutex);
+
+	udphy->u3_phy = devm_phy_create(dev, NULL, &cix_u3phy_ops);
+	if (IS_ERR(udphy->u3_phy))
+		return dev_err_probe(dev, PTR_ERR(udphy->u3_phy),
+				     "failed to create USB3 PHY\n");
+
+	phy_set_drvdata(udphy->u3_phy, udphy);
+
+	udphy->dp_phy = devm_phy_create(dev, NULL, &cix_dp_phy_ops);
+	if (IS_ERR(udphy->dp_phy))
+		return dev_err_probe(dev, PTR_ERR(udphy->dp_phy),
+				     "failed to create DP PHY\n");
+
+	phy_set_drvdata(udphy->dp_phy, udphy);
+	udphy->dp_phy->attrs.max_link_rate = 8100;
+
+	phy_provider = devm_of_phy_provider_register(dev, cix_udphy_phy_xlate);
+	if (IS_ERR(phy_provider))
+		return dev_err_probe(dev, PTR_ERR(phy_provider),
+				     "failed to register PHY provider\n");
+
+	/*
+	 * Register with the Type-C class only once the PHYs and the provider
+	 * are in place, so that the switch and mux callbacks cannot run before
+	 * the driver is fully set up.
+	 */
+	if (device_property_present(dev, "orientation-switch")) {
+		ret = udphy_setup_orien_switch(udphy);
+		if (ret)
+			return ret;
+
+		ret = devm_add_action_or_reset(dev,
+					       udphy_orien_switch_unregister,
+					       udphy);
+		if (ret)
+			return ret;
+	}
+
+	if (device_property_present(dev, "mode-switch")) {
+		ret = udphy_setup_typec_mux(udphy);
+		if (ret)
+			return ret;
+
+		ret = devm_add_action_or_reset(dev, udphy_typec_mux_unregister,
+					       udphy);
+		if (ret)
+			return ret;
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
+MODULE_DESCRIPTION("CIX Sky1 USB/DP combo PHY driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/phy/cix/phy-cix-usbdp.h b/drivers/phy/cix/phy-cix-usbdp.h
new file mode 100644
index 000000000000..58b00c100ac8
--- /dev/null
+++ b/drivers/phy/cix/phy-cix-usbdp.h
@@ -0,0 +1,257 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2026 CIX Technology Group Co., Ltd.
+ *
+ * CIX Sky1 USB/DP combo PHY register definitions
+ */
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
+#define TX_TXCC_CTRL_LANE3           0x4640
+
+#define TX_TXCC_CPOST_MULT_00_LANE0  0x404c
+
+#define TX_TXCC_CPOST_MULT_01_LANE0  0x404d
+#define TX_TXCC_CPOST_MULT_01_LANE3  0x464d
+
+#define TX_TXCC_MGNFS_MULT_000_LANE0 0x4050
+#define TX_TXCC_MGNFS_MULT_000_LANE3 0x4650
+
+#define TX_DIAG_ACYA_LANE0           0x41e7
+
+#define DRV_DIAG_TX_DRV_LANE0        0x40c6
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
