Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.109
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794814688;
	b=N+mTWXykPmBxxT/zZ8iClUXCMqc2eh1KBPa3S1w/C47IMmK6g9t+v2QTVJ2TqGStLUKT
	 Ieh+BgXD3pjsiDbhP+i8M6udGpFA2AMm7NP5u0bhdpyDf6Y9ocVwSa9LR56T9b3z06pAo
	 cuqHfWMcJujEMfJ2ulVw7K4NxSr6wmSlwleqFwQvCY9wWlSumic971a4Jg/HIXPnKEz4j
	 E4m1Jy7Qw45JfRwliTjZt27t38iM9sozFD8FmImPIFZNa5m6kOV9OdsDkHjOWt/FRo7ki
	 o38DFsD+xTZkPAsbIiNneZYFSNbgc8tnuj7hvtsJ/Wa8kOy9n7BAoJjSPx8nPbruw8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814688;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-Id:
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
	bh=D/JuKKCfEdcNCljV4o4uEaxT5QfjwnabGbqt94sGoUY=;
	b=2uOFelNo2v3TLgIHulgGpKGyIo6g5yZfF94wcG2lMcBlFJYysVSkZn+kiqsEkzuEDJlW
	 eimDRizGsxYa2CRsSgJR8B0UnVCiZAi4AQxdjH0cFelmjuyz0V5uBh6zUr8zkugYLU+H6
	 IQaoybWEGyidE43bmbxlacbEb2KW72rUwHyzgwErCEqQzjJNJTia/SC3ajsHKscHdCZH2
	 MndPKj0SWYkvXXxxCYogKogyZXD3UROGjeiaxhW8Ev/WqrS1RuxuJQyz6hgXMl1mTzgkX
	 uenJMt5fskFfiJBT8zD2tn8IHUMNw5t5XO8iX2FJ/LXP8K+spOYTmY3cqUZuBiROUAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.109
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022109.outbound.protection.outlook.com [52.101.126.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E8C606A323;
	Mon, 16 Nov 2026 07:38:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69E8C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G8zLNwdT7x7stDvPrOdv8wLnSQjR+9U65B5w7SFMO0g5Vn6aB9/T3m3SBrDD748cIaB4cEMU2pNF6RsKZatqTKuY+OLm6JkKXtlTmU8hLGMleXV5FrRQlBC2Pf0tHz/pQD8XXbQQrY1ZO3Ebfo4hwaNjd+d4MjbtTSueZjCQTtJ8COXW6p0KYudPEEZl8EQUto0DdQpb/Tw+hDu8xlnmRIpjmkxd+NkpD5llQblIq+VLukEEt7dUaYRGJ58BZvQ02QCOgMTuxpRWZ5/Vl9dw0+Y0PSg4lJTqN1VeLAwgNzksnaofIyLSIN2ltLo9d9XnFtd4RG9uv9TtOX7Wj40qag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/JuKKCfEdcNCljV4o4uEaxT5QfjwnabGbqt94sGoUY=;
 b=aorJDtYG7w3TXe20HPdvgPQ3v6Omm1B+nApcnkMgpnNqYKKxdIQVkX9qx2y5M8642wHQznSla2RfpDjj9C3OrSnmfizwEIXjjKfNWqZ3/vr2bDFrTsLtIkQHyqVoxFGz2JrO+1j5E6iJo+4zRdnyN7MhL64vPXyc3nC6IxqSQME5Xv/6YfLQUPmMaaHW+LCcj4odVljp4dZIrrAwEf64Mejiegk9svrajFd7ESuNMwduAlyG+wuI8j/yHXpLVSfMRcJSTFoesaEk1zS6ig2Dz8G79AwZ4lwwxsoQFe0J++J7Vx9TRotAGxO6KDL9fRQo/fcSgZ1VIBGevS08m5t4+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI1PR02CA0049.apcprd02.prod.outlook.com (2603:1096:4:1f5::18)
 by KUXPR06MB8512.apcprd06.prod.outlook.com (2603:1096:d10:a1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Mon, 16 Nov
 2026 07:38:02 +0000
Received: from SG2PEPF000B66C9.apcprd03.prod.outlook.com
 (2603:1096:4:1f5:cafe::58) by SI1PR02CA0049.outlook.office365.com
 (2603:1096:4:1f5::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Mon,
 16 Nov 2026 07:38:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66C9.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 07:38:02 +0000
Received: from localhost.localdomain (unknown [172.16.64.56])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 1E1E440920E1;
	Mon, 16 Nov 2026 15:38:01 +0800 (CST)
From: Luo Liu <Luo.Liu@cixtech.com>
To: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gary.yang@cixtech.com,
	fugang.duan@cixtech.com,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: cix-kernel-upstream@cixtech.com,
	p.zabel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	Luo.Liu@cixtech.com,
	Wuyi.Shen@cixtech.com,
	EastLake.Yang@cixtech.com
Subject: [PATCH v5 2/3] phy: cix: Add Sky1 DP PHY driver
Date: Mon, 16 Nov 2026 15:37:59 +0800
Message-Id: <20261116073800.2396894-3-Luo.Liu@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261116073800.2396894-1-Luo.Liu@cixtech.com>
References: <20261116073800.2396894-1-Luo.Liu@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66C9:EE_|KUXPR06MB8512:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5d5620dc-463f-482d-18d2-08df43b48bac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|42112799006|82310400026|23010399003|376014|7416014|1800799024|18002099003|22082099003|6133799003|261009223027099003|3023799007|921020|56012099006|10067099003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261021123027099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	W7xQipl4h1VUkasZ0xnVzgvG4ZsM4hI87EX+CK0wL2GZzZbPS9KtzTpiwNjxh/deSDQUdhLKyBXjR2SluiTIwaDjLEtwf3XD4Y1JR6QQO+X1oizcPzZO+F+wG8FOAOrE9OCYjXpt/FJBN8epjiUjZH5QLkZ/WBQNarEt4VdXdlV7lxd8Ze0XxUtxzesVfm9FyDr/DHchqD2UTGIRjLz8mUX6ooP90mKGWSPn2bvYzRnc99irPtRarJyK3eeSIbudSAxaSSnvDMZ2W1k19/9lL9MKo34E6GpvVOSlORMMAYuEy8l3oNcLEA8Dyxtdi/U8hjI/l2nH1SnLVOik2MzmP8zjYyyJcZc7Mv4vSeAqnm3ChBQeVsyXm5sMVBvDoYcM18m5EdWexte7OFSESHhPibji49LHy3AbT5HP/faG4zA6l8X4YuSAfllY4WcaOr5tY/Fnff8b8F/dVbXrduJYs7EHc0a3KJq0fBKGm1AoI6cpyWDT3NfZyfox5ooiRfi+AVEW7CLi2vwF8kw/sdHs03cC4ShuA6BQoo4SkITCcpzsNPJut0IBkz7xvb2RkyqmAJ1lw/YS6r99pFQWjUKCpBfmuaGJjc7voI844+DDlObmCWTc8ilx23zPvIyvzDEBNdQNhSHRj2FDB9WdokJQF1wzdL7o8PvviwuvfWIoNpQ+ix2L/5zXJiAAAg+lF38hhYVE3p2uxSaMBk2Chnht53EShv/ETXC2lLGoFuU3CD3x2++TQXq6ltCnbqDuWmtu
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(42112799006)(82310400026)(23010399003)(376014)(7416014)(1800799024)(18002099003)(22082099003)(6133799003)(261009223027099003)(3023799007)(921020)(56012099006)(10067099003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pgu5CeJf/1SbvRnpUkYhRCDKHazOPoPBI+nFIx22iQQt3YmELPNwMeLUHlqWFV5BHWlqAp0l5lpvYlLHIxAB6qmsKa8fQnzSfrCbodKV5fjv/f2Xt07rOk6wiMMHd9bTI+OyV/84shLKVpK9L5hY5VS//DlQjLVQdQbPPly1MQawVXBBMzuFTKI8yG25hI2lWeuj6F9RpBf2Rywlyi2ydHK3Fo7il5d91WWXpJTQX5KAEgI2vsJ0Usc3kCh3BzdVoD+gOuvYbxVqkxQvW7xev4X5x63lT69k1AFcaiTxdBYbCyMGiW9lkCwgemLfDiVgt+bU87uZc2DJGdmOidLaVpyEF+fzXFoVNxreUCvgEtNSOhjT45HZLsrh36HUsiHJ5xv5n9dwLm9O/2vpHCi5KkyyyxIi8wF++u2pl6eJaV9StkIDPqozp8oSAYofA16S
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 07:38:02.3782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d5620dc-463f-482d-18d2-08df43b48bac
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66C9.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR06MB8512

Add a PHY driver for the CIX Sky1 dedicated DisplayPort PMA. Support
link rate, lane count, SSC and voltage swing via the generic PHY DP
ops. Enable the shared APB clock and toggle reset in phy_init, load
PMA tables there, and enable the analog path in phy_power_on. A rate
change disables the PLL, programs the new dividers, and enables the
PLL again.

Signed-off-by: Luo Liu <Luo.Liu@cixtech.com>
---
Changes in v5:
- Drop .reset. phy_init() already pulses the block reset, and
  phy_reset() does not rerun that setup.
- Rename is_edp to external_dp. It selects the external connector
  swing table, not Embedded DisplayPort.
- Call writel() instead of cix_dp_phy_write().
- Roll back a failed PLL enable and keep the original error.
- Drop the powered flag. Always disable the PLL, program the rate,
  and enable the PLL again.

 drivers/phy/Kconfig          |   1 +
 drivers/phy/Makefile         |   1 +
 drivers/phy/cix/Kconfig      |  18 +
 drivers/phy/cix/Makefile     |   2 +
 drivers/phy/cix/phy-cix-dp.c | 993 +++++++++++++++++++++++++++++++++++
 5 files changed, 1015 insertions(+)
 create mode 100644 drivers/phy/cix/Kconfig
 create mode 100644 drivers/phy/cix/Makefile
 create mode 100644 drivers/phy/cix/phy-cix-dp.c

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
index 000000000000..fd3becae2b23
--- /dev/null
+++ b/drivers/phy/cix/Kconfig
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Phy drivers for CIX PHYs
+#
+
+config PHY_CIX_DP
+	tristate "CIX Sky1 DP PHY driver"
+	depends on OF && HAS_IOMEM && COMMON_CLK
+	depends on ARCH_CIX || COMPILE_TEST
+	select GENERIC_PHY
+	help
+	  Say Y here to enable the dedicated DisplayPort PHY used by the CIX
+	  Sky1 DisplayPort controller. The PHY provides the physical layer
+	  used by the dedicated DisplayPort output and supports link rates
+	  up to HBR3.
+
+	  To compile this driver as a module, choose M here. The module will
+	  be called phy-cix-dp.
diff --git a/drivers/phy/cix/Makefile b/drivers/phy/cix/Makefile
new file mode 100644
index 000000000000..cc56c7586ec5
--- /dev/null
+++ b/drivers/phy/cix/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_PHY_CIX_DP) += phy-cix-dp.o
diff --git a/drivers/phy/cix/phy-cix-dp.c b/drivers/phy/cix/phy-cix-dp.c
new file mode 100644
index 000000000000..9a97c96006f2
--- /dev/null
+++ b/drivers/phy/cix/phy-cix-dp.c
@@ -0,0 +1,993 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * CIX DP PHY driver
+ *
+ * Copyright (C) 2026 Trilinear Technologies
+ * Copyright 2026 Cix Technology Group Co., Ltd.
+ */
+
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/reset.h>
+
+#define CIX_DP_PHY_ID_REV_REG			0xfc
+#define CIX_DP_PHY_ID				0x4d
+#define CIX_DP_PHY_PWR_STATE_IDLE		0x0000
+#define CIX_DP_PHY_PWR_STATE_A0_TXRX_ACTIVE	0x0001
+#define CIX_DP_PHY_PWR_STATE_A2_POWERDOWN2	0x0004
+#define CIX_DP_PHY_PWR_STATE_A3_POWERDOWN3	0x0008
+
+#define CIX_DP_CDB_ADDR				0x0000
+#define CIX_DP_CDB_WDATA			0x0004
+#define CIX_DP_CDB_SEL_WR			0x0008
+#define CIX_DP_CDB_READY			0x000c
+#define CIX_DP_CDB_RDATA			0x0010
+#define CIX_DP_CDB_RSTN				0x0014
+#define CIX_DP_CDB_ENABLE			0x0018
+#define CIX_DP_CDB_ENABLE_BIT			BIT(0)
+#define CIX_DP_CDB_SEL_READ			0x2
+#define CIX_DP_CDB_SEL_WRITE			0x3
+
+#define CIX_DP_PHY_CONFIG_RSTN			0x0040
+#define CIX_DP_PHY_CMN_READY			0x0044
+#define CIX_DP_PHY_LANE_EN_BITS			0x0048
+#define CIX_DP_PHY_LANE_RSTN_BITS		0x004c
+#define CIX_DP_PHY_DATA_ENABLE			0x0050
+#define CIX_DP_AUXHPD_ENABLE_BITS		0x0054
+#define CIX_DP_TX_ELEC_IDLE_BITS		0x0058
+#define CIX_DP_PHY_LANE_PWR_STATE_REQ		0x0060
+#define CIX_DP_PHY_LANE_PWR_STATE_ACK		0x0064
+#define CIX_DP_PHY_LANE_PLLCLK_ENABLE		0x0068
+#define CIX_DP_PHY_LANE_PLLCLK_EN_ACK		0x006c
+
+#define CIX_DP_PHY_PLL_CFG			0xc00e
+#define CIX_DP_PHY_PMA_CMN_CTRL2		0xe001
+#define CIX_DP_PHY_PMA_PLL_RAW_CTRL		0xe003
+
+/* Common (CMN) registers */
+#define CIX_DP_CMN_SSM_BIAS_TMR			0x0022
+#define CIX_DP_CMN_PLLSM0_PLLPRE_TMR		0x002a
+#define CIX_DP_CMN_PLLSM0_PLLLOCK_TMR		0x002c
+#define CIX_DP_CMN_PLLSM1_PLLPRE_TMR		0x0032
+#define CIX_DP_CMN_PLLSM1_PLLLOCK_TMR		0x0034
+#define CIX_DP_CMN_BGCAL_INIT_TMR		0x0064
+#define CIX_DP_CMN_BGCAL_ITER_TMR		0x0065
+#define CIX_DP_CMN_IBCAL_INIT_TMR		0x0074
+#define CIX_DP_CMN_PLL0_VCOCAL_TCTRL		0x0082
+#define CIX_DP_CMN_PLL0_VCOCAL_INIT_TMR		0x0084
+#define CIX_DP_CMN_PLL0_VCOCAL_ITER_TMR		0x0085
+#define CIX_DP_CMN_PLL0_VCOCAL_REFTIM_START	0x0086
+#define CIX_DP_CMN_PLL0_VCOCAL_PLLCNT_START	0x0088
+#define CIX_DP_CMN_PLL0_LOCK_REFCNT_START	0x009c
+#define CIX_DP_CMN_PLL0_LOCK_PLLCNT_START	0x009e
+#define CIX_DP_CMN_PLL0_LOCK_PLLCNT_THR		0x009f
+#define CIX_DP_CMN_PLL0_INTDIV_M0		0x0090
+#define CIX_DP_CMN_PLL0_FRACDIVL_M0		0x0091
+#define CIX_DP_CMN_PLL0_FRACDIVH_M0		0x0092
+#define CIX_DP_CMN_PLL0_HIGH_THR_M0		0x0093
+#define CIX_DP_CMN_PLL0_DSM_DIAG_M0		0x0094
+#define CIX_DP_CMN_PLL0_SS_CTRL1_M0		0x0098
+#define CIX_DP_CMN_PLL0_SS_CTRL2_M0		0x0099
+#define CIX_DP_CMN_PLL0_SS_CTRL3_M0		0x009a
+#define CIX_DP_CMN_PLL0_SS_CTRL4_M0		0x009b
+#define CIX_DP_CMN_PLL1_VCOCAL_TCTRL		0x00c2
+#define CIX_DP_CMN_PLL1_VCOCAL_INIT_TMR		0x00c4
+#define CIX_DP_CMN_PLL1_VCOCAL_ITER_TMR		0x00c5
+#define CIX_DP_CMN_PLL1_VCOCAL_REFTIM_START	0x00c6
+#define CIX_DP_CMN_PLL1_VCOCAL_PLLCNT_START	0x00c8
+#define CIX_DP_CMN_PLL1_LOCK_REFCNT_START	0x00dc
+#define CIX_DP_CMN_PLL1_LOCK_PLLCNT_START	0x00de
+#define CIX_DP_CMN_PLL1_LOCK_PLLCNT_THR		0x00df
+#define CIX_DP_CMN_PLL1_INTDIV_M0		0x00d0
+#define CIX_DP_CMN_PLL1_FRACDIVL_M0		0x00d1
+#define CIX_DP_CMN_PLL1_FRACDIVH_M0		0x00d2
+#define CIX_DP_CMN_PLL1_HIGH_THR_M0		0x00d3
+#define CIX_DP_CMN_PLL1_DSM_DIAG_M0		0x00d4
+#define CIX_DP_CMN_PLL1_SS_CTRL1_M0		0x00d8
+#define CIX_DP_CMN_PLL1_SS_CTRL2_M0		0x00d9
+#define CIX_DP_CMN_PLL1_SS_CTRL3_M0		0x00da
+#define CIX_DP_CMN_PLL1_SS_CTRL4_M0		0x00db
+#define CIX_DP_CMN_TXPUCAL_INIT_TMR		0x0104
+#define CIX_DP_CMN_TXPDCAL_INIT_TMR		0x010c
+#define CIX_DP_CMN_RXCAL_INIT_TMR		0x0114
+#define CIX_DP_CMN_SD_CAL_PLLCNT_START		0x0128
+#define CIX_DP_CMN_PDIAG_PLL0_CTRL_M0		0x01a0
+#define CIX_DP_CMN_PDIAG_PLL0_CLK_SEL_M0	0x01a1
+#define CIX_DP_CMN_PDIAG_PLL0_CP_PADJ_M0	0x01a4
+#define CIX_DP_CMN_PDIAG_PLL0_CP_IADJ_M0	0x01a5
+#define CIX_DP_CMN_PDIAG_PLL0_FILT_PADJ_M0	0x01a6
+#define CIX_DP_CMN_PDIAG_PLL1_CTRL_M0		0x01c0
+#define CIX_DP_CMN_PDIAG_PLL1_CP_PADJ_M0	0x01c4
+#define CIX_DP_CMN_PDIAG_PLL1_CP_IADJ_M0	0x01c5
+#define CIX_DP_CMN_PDIAG_PLL1_FILT_PADJ_M0	0x01c6
+
+/* Lane / TX / RX / XCVR registers */
+#define CIX_DP_TX_TXCC_CTRL			0x4040
+#define CIX_DP_TX_TXCC_CPOST_MULT_00		0x404c
+#define CIX_DP_TX_TXCC_MGNFS_MULT_000		0x4050
+#define CIX_DP_XCVR_DIAG_PLLDRC_CTRL		0x40e5
+#define CIX_DP_XCVR_DIAG_HSCLK_DIV		0x40e7
+#define CIX_DP_XCVR_DIAG_BIDI_CTRL		0x40ea
+#define CIX_DP_DRV_DIAG_TX_DRV			0x40c6
+#define CIX_DP_TX_PSC_A0			0x4100
+#define CIX_DP_TX_PSC_A2			0x4102
+#define CIX_DP_TX_PSC_A3			0x4103
+#define CIX_DP_RX_ST_TMR			0x4123
+#define CIX_DP_TX_DIAG_ACYA			0x41e7
+#define CIX_DP_RX_PSC_A0			0x8000
+#define CIX_DP_RX_PSC_A2			0x8002
+#define CIX_DP_RX_PSC_A3			0x8003
+#define CIX_DP_RX_PSC_CAL			0x8006
+#define CIX_DP_RX_SDCAL0_INIT_TMR		0x8044
+#define CIX_DP_RX_SDCAL0_ITER_TMR		0x8045
+#define CIX_DP_RX_SDCAL1_INIT_TMR		0x804c
+#define CIX_DP_RX_SDCAL1_ITER_TMR		0x804d
+#define CIX_DP_RX_REE_GCSM1_CTRL		0x8108
+#define CIX_DP_RX_REE_GCSM2_CTRL		0x8110
+#define CIX_DP_RX_REE_PERGCSM_CTRL		0x8118
+
+/* PMA bit defines */
+#define CIX_DP_PMA_CMN_CTRL2_PLL0_READY_BIT	BIT(0)
+#define CIX_DP_PMA_CMN_CTRL2_PLL0_DISABLED_BIT	BIT(2)
+#define CIX_DP_PMA_PLL_RAW_CTRL_PLL0_FORCE_RSTN	BIT(0)
+
+#define CIX_DP_LANE_OFFSET(x) \
+	((x) * 0x0200)
+#define CIX_DP_XCVR_DIAG_HSCLK_DIV_LANE(x) \
+	(CIX_DP_XCVR_DIAG_HSCLK_DIV + CIX_DP_LANE_OFFSET(x))
+#define CIX_DP_TX_DIAG_ACYA_LANE(x) \
+	(CIX_DP_TX_DIAG_ACYA + CIX_DP_LANE_OFFSET(x))
+#define CIX_DP_TX_TXCC_CTRL_LANE(x) \
+	(CIX_DP_TX_TXCC_CTRL + CIX_DP_LANE_OFFSET(x))
+#define CIX_DP_DRV_DIAG_TX_DRV_LANE(x) \
+	(CIX_DP_DRV_DIAG_TX_DRV + CIX_DP_LANE_OFFSET(x))
+#define CIX_DP_TX_TXCC_MGNFS_MULT_000_LANE(x) \
+	(CIX_DP_TX_TXCC_MGNFS_MULT_000 + CIX_DP_LANE_OFFSET(x))
+#define CIX_DP_TX_TXCC_CPOST_MULT_00_LANE(x) \
+	(CIX_DP_TX_TXCC_CPOST_MULT_00 + CIX_DP_LANE_OFFSET(x))
+
+#define CIX_DP_NUM_LANES			4
+#define CIX_DP_POLL_SLEEP_US			10
+#define CIX_DP_POLL_TIMEOUT_US			100000
+#define CIX_DP_PWR_TIMEOUT_US			10000
+
+enum cix_dp_pwr {
+	CIX_DP_PWR_A0,
+	CIX_DP_PWR_A2,
+	CIX_DP_PWR_A3,
+};
+
+struct cix_dp {
+	void __iomem *base;
+	struct clk *apb_clk;
+	struct reset_control *reset;
+	struct phy *phy;
+	unsigned int num_lanes;
+	bool external_dp;
+};
+
+struct cix_dp_link_cfg {
+	u32 link_rate;
+	u32 hsclk_div;
+	u32 clk_sel;
+	u32 pll_intdiv;
+	u32 pll_fracdivl;
+	u32 pll_high_thr;
+};
+
+struct cix_dp_reg {
+	u32 reg;
+	u32 val;
+	bool per_lane;
+};
+
+struct cix_dp_voltage_conf {
+	u32 tx_txcc_ctrl;
+	u32 drv_diag_tx_drv;
+	u32 tx_txcc_mgnfs_mult_000;
+	u32 tx_txcc_cpost_mult_00;
+};
+
+static const struct cix_dp_voltage_conf cix_dp_volt_cfg[] = {
+	{ 0x08a4, 0x0003, 0x002a, 0x0000 }, /* swing level == 0 */
+	{ 0x08a4, 0x0003, 0x001f, 0x0014 },
+	{ 0x08a4, 0x0003, 0x0013, 0x0020 },
+	{ 0x08a4, 0x0003, 0x000a, 0x002a },
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
+static const struct cix_dp_voltage_conf cix_dp_volt_low_cfg[] = {
+	{ 0x08a4, 0x0003, 0x002f, 0x0000 }, /* swing level == 0 */
+	{ 0x08a4, 0x0003, 0x002a, 0x000d },
+	{ 0x08a4, 0x0003, 0x0026, 0x0015 },
+	{ 0x08a4, 0x0003, 0x0022, 0x001b },
+	{ 0x08a4, 0x0003, 0x002b, 0x0000 }, /* swing level == 1 */
+	{ 0x08a4, 0x0003, 0x0027, 0x000b },
+	{ 0x08a4, 0x0003, 0x0023, 0x0012 },
+	{ 0x08a4, 0x0003, 0x0000, 0x0000 },
+	{ 0x08a4, 0x0003, 0x0027, 0x0000 }, /* swing level == 2 */
+	{ 0x08a4, 0x0003, 0x0023, 0x0009 },
+	{ 0x08a4, 0x0003, 0x0000, 0x0000 },
+	{ 0x08a4, 0x0003, 0x0000, 0x0000 },
+	{ 0x08a4, 0x0003, 0x0023, 0x0000 }, /* swing level == 3 */
+	{ 0x08a4, 0x0003, 0x0000, 0x0000 },
+	{ 0x08a4, 0x0003, 0x0000, 0x0000 },
+	{ 0x08a4, 0x0003, 0x0000, 0x0000 },
+};
+
+/* Default PHY programming, including SSC enabled (SS_CTRL1 = 0x1). */
+static const struct cix_dp_reg cix_dp_reg_conf[] = {
+	{ CIX_DP_CMN_SSM_BIAS_TMR, 0x0018 },
+	{ CIX_DP_CMN_PLLSM0_PLLPRE_TMR, 0x0030 },
+	{ CIX_DP_CMN_PLLSM0_PLLLOCK_TMR, 0x00f0 },
+	{ CIX_DP_CMN_PLLSM1_PLLPRE_TMR, 0x0030 },
+	{ CIX_DP_CMN_PLLSM1_PLLLOCK_TMR, 0x00f0 },
+	{ CIX_DP_CMN_BGCAL_INIT_TMR, 0x0078 },
+	{ CIX_DP_CMN_BGCAL_ITER_TMR, 0x0078 },
+	{ CIX_DP_CMN_IBCAL_INIT_TMR, 0x0018 },
+	{ CIX_DP_CMN_TXPUCAL_INIT_TMR, 0x001d },
+	{ CIX_DP_CMN_TXPDCAL_INIT_TMR, 0x001d },
+	{ CIX_DP_CMN_RXCAL_INIT_TMR, 0x02d0 },
+	{ CIX_DP_CMN_SD_CAL_PLLCNT_START, 0x0137 },
+	{ CIX_DP_RX_SDCAL0_INIT_TMR, 0x0018, true },
+	{ CIX_DP_RX_SDCAL0_ITER_TMR, 0x0078, true },
+	{ CIX_DP_RX_SDCAL1_INIT_TMR, 0x0018, true },
+	{ CIX_DP_RX_SDCAL1_ITER_TMR, 0x0078, true },
+	{ CIX_DP_RX_ST_TMR, 0x0960, true },
+	{ CIX_DP_PHY_PLL_CFG, 0x0000 },
+	{ CIX_DP_XCVR_DIAG_HSCLK_DIV, 0x0000, true },
+	{ CIX_DP_XCVR_DIAG_PLLDRC_CTRL, 0x0011, true },
+	{ CIX_DP_CMN_PLL0_DSM_DIAG_M0, 0x8004 },
+	{ CIX_DP_CMN_PLL1_DSM_DIAG_M0, 0x0004 },
+	{ CIX_DP_CMN_PDIAG_PLL0_CP_PADJ_M0, 0x0b17 },
+	{ CIX_DP_CMN_PDIAG_PLL1_CP_PADJ_M0, 0x0b17 },
+	{ CIX_DP_CMN_PDIAG_PLL0_CP_IADJ_M0, 0x0e01 },
+	{ CIX_DP_CMN_PDIAG_PLL1_CP_IADJ_M0, 0x0e01 },
+	{ CIX_DP_CMN_PDIAG_PLL0_FILT_PADJ_M0, 0x0d05 },
+	{ CIX_DP_CMN_PDIAG_PLL1_FILT_PADJ_M0, 0x0d05 },
+	{ CIX_DP_CMN_PLL0_INTDIV_M0, 0x01c2 },
+	{ CIX_DP_CMN_PLL1_INTDIV_M0, 0x014d },
+	{ CIX_DP_CMN_PLL1_FRACDIVL_M0, 0x5555 },
+	{ CIX_DP_CMN_PLL0_FRACDIVH_M0, 0x0002 },
+	{ CIX_DP_CMN_PLL1_FRACDIVH_M0, 0x0002 },
+	{ CIX_DP_CMN_PLL0_HIGH_THR_M0, 0x012c },
+	{ CIX_DP_CMN_PLL1_HIGH_THR_M0, 0x00e0 },
+	{ CIX_DP_CMN_PDIAG_PLL0_CTRL_M0, 0x1002 },
+	{ CIX_DP_CMN_PDIAG_PLL1_CTRL_M0, 0x1002 },
+	{ CIX_DP_CMN_PLL0_SS_CTRL1_M0, 0x0001 },
+	{ CIX_DP_CMN_PLL1_SS_CTRL1_M0, 0x0001 },
+	{ CIX_DP_CMN_PLL0_SS_CTRL2_M0, 0x044f },
+	{ CIX_DP_CMN_PLL1_SS_CTRL2_M0, 0x03c7 },
+	{ CIX_DP_CMN_PLL0_SS_CTRL3_M0, 0x007f },
+	{ CIX_DP_CMN_PLL1_SS_CTRL3_M0, 0x007f },
+	{ CIX_DP_CMN_PLL0_SS_CTRL4_M0, 0x0003 },
+	{ CIX_DP_CMN_PLL1_SS_CTRL4_M0, 0x0003 },
+	{ CIX_DP_CMN_PLL0_VCOCAL_INIT_TMR, 0x00f0 },
+	{ CIX_DP_CMN_PLL1_VCOCAL_INIT_TMR, 0x00f0 },
+	{ CIX_DP_CMN_PLL0_VCOCAL_ITER_TMR, 0x0004 },
+	{ CIX_DP_CMN_PLL1_VCOCAL_ITER_TMR, 0x0004 },
+	{ CIX_DP_CMN_PLL0_VCOCAL_REFTIM_START, 0x02f8 },
+	{ CIX_DP_CMN_PLL1_VCOCAL_REFTIM_START, 0x02f8 },
+	{ CIX_DP_CMN_PLL0_VCOCAL_PLLCNT_START, 0x02f6 },
+	{ CIX_DP_CMN_PLL1_VCOCAL_PLLCNT_START, 0x02f6 },
+	{ CIX_DP_CMN_PLL0_VCOCAL_TCTRL, 0x0003 },
+	{ CIX_DP_CMN_PLL1_VCOCAL_TCTRL, 0x0003 },
+	{ CIX_DP_CMN_PLL0_LOCK_REFCNT_START, 0x00bf },
+	{ CIX_DP_CMN_PLL1_LOCK_REFCNT_START, 0x00bf },
+	{ CIX_DP_CMN_PLL0_LOCK_PLLCNT_START, 0x00bf },
+	{ CIX_DP_CMN_PLL1_LOCK_PLLCNT_START, 0x00bf },
+	{ CIX_DP_CMN_PLL0_LOCK_PLLCNT_THR, 0x0005 },
+	{ CIX_DP_CMN_PLL1_LOCK_PLLCNT_THR, 0x0005 },
+	{ CIX_DP_TX_PSC_A0, 0x00fb, true },
+	{ CIX_DP_TX_PSC_A2, 0x04aa, true },
+	{ CIX_DP_TX_PSC_A3, 0x04aa, true },
+	{ CIX_DP_RX_PSC_A0, 0x0000, true },
+	{ CIX_DP_RX_PSC_A2, 0x0000, true },
+	{ CIX_DP_RX_PSC_A3, 0x0000, true },
+	{ CIX_DP_RX_PSC_CAL, 0x0000, true },
+	{ CIX_DP_XCVR_DIAG_BIDI_CTRL, 0x000f, true },
+	{ CIX_DP_RX_REE_GCSM1_CTRL, 0x0000, true },
+	{ CIX_DP_RX_REE_GCSM2_CTRL, 0x0000, true },
+	{ CIX_DP_RX_REE_PERGCSM_CTRL, 0x0000, true },
+};
+
+/*
+ * Supported DisplayPort link rates in Mb/s. 2160 and 4320 listed by
+ * phy-dp.h are not implemented on this PHY.
+ */
+static const struct cix_dp_link_cfg cix_dp_link_cfg[] = {
+	{ 1620, 0x0002, 0x0f01, 0x0195, 0x0000, 0x010e },
+	{ 2430, 0x0001, 0x0701, 0x0195, 0x0000, 0x010e },
+	{ 2700, 0x0001, 0x0701, 0x01c2, 0x0000, 0x012c },
+	{ 3240, 0x0002, 0x0b00, 0x0195, 0x0000, 0x010e },
+	{ 5400, 0x0000, 0x0301, 0x01c2, 0x0000, 0x012c },
+	{ 8100, 0x0000, 0x0200, 0x0151, 0x8000, 0x00e2 },
+};
+
+/*
+ * Sky1 routes 1- and 2-lane DP through physical lanes 2/3, not 0/1.
+ * phy-dp.h describes logical lanes starting from lane 0; map them with
+ * +2 so enable/reset masks and voltage programming hit the wired pads.
+ */
+static u32 cix_dp_phy_lane_bits(unsigned int lanes)
+{
+	switch (lanes) {
+	case 1:
+		return BIT(2);
+	case 2:
+		return BIT(2) | BIT(3);
+	case 4:
+		return GENMASK(3, 0);
+	default:
+		return 0;
+	}
+}
+
+static int cix_dp_phy_cdb_ready(struct cix_dp *dp)
+{
+	u32 value;
+
+	return readl_poll_timeout(dp->base + CIX_DP_CDB_READY, value,
+				  value & BIT(0), CIX_DP_POLL_SLEEP_US,
+				  CIX_DP_POLL_TIMEOUT_US);
+}
+
+/*
+ * After kicking CDB_ENABLE, READY may stay high for a few clocks before the
+ * IP drops it. Poll tightly for busy so a stale READY=1 is not taken as
+ * completion. The busy pulse can be shorter than a sleeping poll, so ignore
+ * a missed busy and still wait for idle.
+ */
+static int cix_dp_phy_cdb_complete(struct cix_dp *dp)
+{
+	u32 value;
+
+	readl_poll_timeout_atomic(dp->base + CIX_DP_CDB_READY, value,
+				  !(value & BIT(0)), 0, 1);
+
+	return cix_dp_phy_cdb_ready(dp);
+}
+
+static int cix_dp_phy_cdb_write(struct cix_dp *dp, u32 offset, u32 data)
+{
+	int ret;
+
+	ret = cix_dp_phy_cdb_ready(dp);
+	if (ret)
+		return ret;
+
+	writel(offset, dp->base + CIX_DP_CDB_ADDR);
+	writel(data, dp->base + CIX_DP_CDB_WDATA);
+	writel(CIX_DP_CDB_SEL_WRITE, dp->base + CIX_DP_CDB_SEL_WR);
+	writel(CIX_DP_CDB_ENABLE_BIT, dp->base + CIX_DP_CDB_ENABLE);
+
+	return cix_dp_phy_cdb_complete(dp);
+}
+
+static int cix_dp_phy_cdb_read(struct cix_dp *dp, u32 offset)
+{
+	int ret;
+
+	ret = cix_dp_phy_cdb_ready(dp);
+	if (ret)
+		return ret;
+
+	writel(offset, dp->base + CIX_DP_CDB_ADDR);
+	writel(CIX_DP_CDB_SEL_READ, dp->base + CIX_DP_CDB_SEL_WR);
+	writel(CIX_DP_CDB_ENABLE_BIT, dp->base + CIX_DP_CDB_ENABLE);
+
+	ret = cix_dp_phy_cdb_complete(dp);
+	if (ret)
+		return ret;
+
+	return readl(dp->base + CIX_DP_CDB_RDATA) & GENMASK(15, 0);
+}
+
+static int cix_dp_phy_apply_reg(struct cix_dp *dp, const struct cix_dp_reg *r)
+{
+	unsigned int i;
+	int ret;
+
+	if (!r->per_lane)
+		return cix_dp_phy_cdb_write(dp, r->reg, r->val);
+
+	for (i = 0; i < CIX_DP_NUM_LANES; i++) {
+		ret = cix_dp_phy_cdb_write(dp, r->reg + CIX_DP_LANE_OFFSET(i),
+					   r->val);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int cix_dp_common_ready_ack(struct cix_dp *dp)
+{
+	u32 value;
+
+	return readl_poll_timeout(dp->base + CIX_DP_PHY_CMN_READY, value,
+				  value & BIT(0), CIX_DP_POLL_SLEEP_US,
+				  CIX_DP_POLL_TIMEOUT_US);
+}
+
+static int cix_dp_pll_raw_ctrl_ack(struct cix_dp *dp, u32 mask)
+{
+	int value;
+	int ret;
+
+	ret = read_poll_timeout(cix_dp_phy_cdb_read, value,
+				value < 0 || value & mask,
+				CIX_DP_POLL_SLEEP_US, CIX_DP_POLL_TIMEOUT_US,
+				false, dp, CIX_DP_PHY_PMA_CMN_CTRL2);
+	if (ret)
+		return ret;
+
+	return value < 0 ? value : 0;
+}
+
+static int cix_dp_lane_pll_ack(struct cix_dp *dp, bool enabled)
+{
+	u32 value;
+
+	return readl_poll_timeout(dp->base + CIX_DP_PHY_LANE_PLLCLK_EN_ACK,
+				  value, !!(value & BIT(0)) == enabled,
+				  CIX_DP_POLL_SLEEP_US, CIX_DP_POLL_TIMEOUT_US);
+}
+
+static int cix_dp_pwr_state_ack(struct cix_dp *dp, u32 pwr_state)
+{
+	u32 value;
+
+	return readl_poll_timeout(dp->base + CIX_DP_PHY_LANE_PWR_STATE_ACK,
+				  value, (value & GENMASK(4, 0)) == pwr_state,
+				  CIX_DP_POLL_SLEEP_US, CIX_DP_PWR_TIMEOUT_US);
+}
+
+static int cix_dp_phy_pwr_req(struct cix_dp *dp, u32 pwr_state)
+{
+	int ret;
+
+	writel(pwr_state, dp->base + CIX_DP_PHY_LANE_PWR_STATE_REQ);
+	ret = cix_dp_pwr_state_ack(dp, pwr_state);
+	writel(CIX_DP_PHY_PWR_STATE_IDLE,
+	       dp->base + CIX_DP_PHY_LANE_PWR_STATE_REQ);
+
+	return ret;
+}
+
+static int cix_dp_hw_power(struct cix_dp *dp, enum cix_dp_pwr pwr_state)
+{
+	switch (pwr_state) {
+	case CIX_DP_PWR_A0:
+		return cix_dp_phy_pwr_req(dp,
+					  CIX_DP_PHY_PWR_STATE_A0_TXRX_ACTIVE);
+	case CIX_DP_PWR_A2:
+		return cix_dp_phy_pwr_req(dp,
+					  CIX_DP_PHY_PWR_STATE_A2_POWERDOWN2);
+	case CIX_DP_PWR_A3:
+		return cix_dp_phy_pwr_req(dp,
+					  CIX_DP_PHY_PWR_STATE_A3_POWERDOWN3);
+	default:
+		return -EINVAL;
+	}
+}
+
+static int cix_dp_pll_disable(struct cix_dp *dp)
+{
+	u32 mask = CIX_DP_PMA_CMN_CTRL2_PLL0_DISABLED_BIT;
+	int ret;
+
+	writel(0, dp->base + CIX_DP_PHY_DATA_ENABLE);
+	ret = cix_dp_hw_power(dp, CIX_DP_PWR_A3);
+	if (ret)
+		return ret;
+
+	writel(0, dp->base + CIX_DP_PHY_LANE_PLLCLK_ENABLE);
+	ret = cix_dp_lane_pll_ack(dp, false);
+	if (ret)
+		return ret;
+
+	ret = cix_dp_phy_cdb_write(dp, CIX_DP_PHY_PMA_PLL_RAW_CTRL, 0);
+	if (ret)
+		return ret;
+
+	return cix_dp_pll_raw_ctrl_ack(dp, mask);
+}
+
+static int cix_dp_pll_enable(struct cix_dp *dp)
+{
+	u32 mask = CIX_DP_PMA_CMN_CTRL2_PLL0_READY_BIT;
+	int ret;
+	int err;
+
+	ret = cix_dp_phy_cdb_write(dp, CIX_DP_PHY_PMA_PLL_RAW_CTRL, 1);
+	if (ret)
+		return ret;
+
+	ret = cix_dp_pll_raw_ctrl_ack(dp, mask);
+	if (ret)
+		goto err_pll;
+
+	writel(1, dp->base + CIX_DP_PHY_LANE_PLLCLK_ENABLE);
+	ret = cix_dp_lane_pll_ack(dp, true);
+	if (ret)
+		goto err_lane_clk;
+
+	ret = cix_dp_hw_power(dp, CIX_DP_PWR_A2);
+	if (ret)
+		goto err_pwr;
+
+	ret = cix_dp_hw_power(dp, CIX_DP_PWR_A0);
+	if (ret)
+		goto err_pwr;
+
+	writel(1, dp->base + CIX_DP_PHY_DATA_ENABLE);
+
+	return 0;
+
+	/* Undo the steps that completed and return the original error. */
+err_pwr:
+	err = cix_dp_hw_power(dp, CIX_DP_PWR_A3);
+	if (err)
+		return ret;
+err_lane_clk:
+	writel(0, dp->base + CIX_DP_PHY_LANE_PLLCLK_ENABLE);
+	err = cix_dp_lane_pll_ack(dp, false);
+	if (err)
+		return ret;
+err_pll:
+	err = cix_dp_phy_cdb_write(dp, CIX_DP_PHY_PMA_PLL_RAW_CTRL, 0);
+	if (err)
+		return ret;
+
+	err = cix_dp_pll_raw_ctrl_ack(dp,
+				      CIX_DP_PMA_CMN_CTRL2_PLL0_DISABLED_BIT);
+	if (err)
+		return ret;
+
+	return ret;
+}
+
+static int cix_dp_phy_set_ssc(struct cix_dp *dp, bool enable)
+{
+	u32 val = enable ? 0x0001 : 0x0000;
+	int ret;
+
+	ret = cix_dp_phy_cdb_write(dp, CIX_DP_CMN_PLL0_SS_CTRL1_M0, val);
+	if (ret)
+		return ret;
+
+	return cix_dp_phy_cdb_write(dp, CIX_DP_CMN_PLL1_SS_CTRL1_M0, val);
+}
+
+static int cix_dp_phy_set_lanes(struct cix_dp *dp, unsigned int lanes)
+{
+	u32 mask;
+
+	mask = cix_dp_phy_lane_bits(lanes);
+	if (!mask)
+		return -EINVAL;
+
+	dp->num_lanes = lanes;
+	writel(mask, dp->base + CIX_DP_PHY_LANE_RSTN_BITS);
+	writel(mask, dp->base + CIX_DP_PHY_LANE_EN_BITS);
+	writel((~mask) & GENMASK(CIX_DP_NUM_LANES - 1, 0),
+	       dp->base + CIX_DP_TX_ELEC_IDLE_BITS);
+
+	return 0;
+}
+
+static int cix_dp_phy_set_link_rate(struct cix_dp *dp,
+				    const struct phy_configure_opts_dp *opts)
+{
+	const struct cix_dp_link_cfg *cfg = NULL;
+	unsigned int i;
+	u32 reg;
+	int ret;
+
+	for (i = 0; i < ARRAY_SIZE(cix_dp_link_cfg); i++) {
+		if (cix_dp_link_cfg[i].link_rate == opts->link_rate) {
+			cfg = &cix_dp_link_cfg[i];
+			break;
+		}
+	}
+
+	if (!cfg)
+		return -EINVAL;
+
+	ret = cix_dp_pll_disable(dp);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < CIX_DP_NUM_LANES; i++) {
+		reg = CIX_DP_XCVR_DIAG_HSCLK_DIV_LANE(i);
+		ret = cix_dp_phy_cdb_write(dp, reg, cfg->hsclk_div);
+		if (ret)
+			return ret;
+	}
+
+	ret = cix_dp_phy_cdb_write(dp, CIX_DP_CMN_PLL0_INTDIV_M0,
+				   cfg->pll_intdiv);
+	if (ret)
+		return ret;
+
+	ret = cix_dp_phy_cdb_write(dp, CIX_DP_CMN_PLL0_FRACDIVL_M0,
+				   cfg->pll_fracdivl);
+	if (ret)
+		return ret;
+
+	ret = cix_dp_phy_cdb_write(dp, CIX_DP_CMN_PLL0_HIGH_THR_M0,
+				   cfg->pll_high_thr);
+	if (ret)
+		return ret;
+
+	ret = cix_dp_phy_cdb_write(dp, CIX_DP_CMN_PDIAG_PLL0_CLK_SEL_M0,
+				   cfg->clk_sel);
+	if (ret)
+		return ret;
+
+	ret = cix_dp_phy_set_ssc(dp, opts->ssc);
+	if (ret)
+		return ret;
+
+	return cix_dp_pll_enable(dp);
+}
+
+static int cix_dp_phy_set_lane_voltage(struct cix_dp *dp, u32 lane,
+				       const struct cix_dp_voltage_conf *cfg)
+{
+	int value;
+	int ret, err;
+
+	value = cix_dp_phy_cdb_read(dp, CIX_DP_TX_DIAG_ACYA_LANE(lane));
+	if (value < 0)
+		return value;
+
+	ret = cix_dp_phy_cdb_write(dp, CIX_DP_TX_DIAG_ACYA_LANE(lane),
+				   value | BIT(0));
+	if (ret)
+		return ret;
+
+	ret = cix_dp_phy_cdb_write(dp, CIX_DP_TX_TXCC_CTRL_LANE(lane),
+				   cfg->tx_txcc_ctrl);
+	if (ret)
+		goto out_restore;
+
+	ret = cix_dp_phy_cdb_write(dp, CIX_DP_DRV_DIAG_TX_DRV_LANE(lane),
+				   cfg->drv_diag_tx_drv);
+	if (ret)
+		goto out_restore;
+
+	ret = cix_dp_phy_cdb_write(dp,
+				   CIX_DP_TX_TXCC_MGNFS_MULT_000_LANE(lane),
+				   cfg->tx_txcc_mgnfs_mult_000);
+	if (ret)
+		goto out_restore;
+
+	ret = cix_dp_phy_cdb_write(dp,
+				   CIX_DP_TX_TXCC_CPOST_MULT_00_LANE(lane),
+				   cfg->tx_txcc_cpost_mult_00);
+
+out_restore:
+	err = cix_dp_phy_cdb_write(dp, CIX_DP_TX_DIAG_ACYA_LANE(lane),
+				   value & ~BIT(0));
+	if (err && !ret)
+		ret = err;
+
+	return ret;
+}
+
+static int cix_dp_phy_set_voltages(struct cix_dp *dp,
+				   const struct phy_configure_opts_dp *opts)
+{
+	const struct cix_dp_voltage_conf *table;
+	const struct cix_dp_voltage_conf *cfg;
+	unsigned int lane;
+	unsigned int phy_lane;
+	unsigned int index;
+	int ret;
+
+	if (opts->lanes != 1 && opts->lanes != 2 && opts->lanes != 4)
+		return -EINVAL;
+
+	table = dp->external_dp ? cix_dp_volt_cfg : cix_dp_volt_low_cfg;
+
+	for (lane = 0; lane < opts->lanes; lane++) {
+		if (opts->voltage[lane] > 3 || opts->pre[lane] > 3 ||
+		    opts->voltage[lane] + opts->pre[lane] > 3)
+			return -EINVAL;
+
+		index = opts->voltage[lane] * 4 + opts->pre[lane];
+		cfg = &table[index];
+
+		/* One- and two-lane modes use the upper physical lanes. */
+		phy_lane = opts->lanes == 4 ? lane : lane + 2;
+		ret = cix_dp_phy_set_lane_voltage(dp, phy_lane, cfg);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int cix_dp_toggle_reset(struct cix_dp *dp)
+{
+	int ret;
+
+	ret = reset_control_assert(dp->reset);
+	if (ret)
+		return ret;
+	usleep_range(10, 20);
+
+	ret = reset_control_deassert(dp->reset);
+	if (ret)
+		return ret;
+	usleep_range(10, 20);
+
+	return 0;
+}
+
+static int cix_dp_hw_prepare(struct cix_dp *dp)
+{
+	struct device *dev = &dp->phy->dev;
+	u32 id;
+
+	id = readl(dp->base + CIX_DP_PHY_ID_REV_REG) >> 16;
+	if (id != CIX_DP_PHY_ID) {
+		dev_err(dev, "unsupported PHY id 0x%x\n", id);
+		return -ENODEV;
+	}
+
+	/* enable PHY's local configuration bus */
+	writel(1, dp->base + CIX_DP_CDB_RSTN);
+
+	/* reset AUXHPD block */
+	writel(0, dp->base + CIX_DP_AUXHPD_ENABLE_BITS);
+	writel(0xf, dp->base + CIX_DP_TX_ELEC_IDLE_BITS);
+
+	/* reset PHY */
+	writel(0, dp->base + CIX_DP_PHY_DATA_ENABLE);
+	writel(0, dp->base + CIX_DP_PHY_LANE_RSTN_BITS);
+	writel(0, dp->base + CIX_DP_PHY_LANE_EN_BITS);
+
+	writel(0, dp->base + CIX_DP_PHY_CONFIG_RSTN);
+	udelay(1);
+
+	/* enable Cadence AUXHPD block */
+	writel(1, dp->base + CIX_DP_AUXHPD_ENABLE_BITS);
+	udelay(1);
+	writel(3, dp->base + CIX_DP_AUXHPD_ENABLE_BITS);
+	udelay(1);
+	writel(7, dp->base + CIX_DP_AUXHPD_ENABLE_BITS);
+	udelay(5);
+
+	/* aux lines enabled for TX and RX */
+	writel(0xf, dp->base + CIX_DP_AUXHPD_ENABLE_BITS);
+
+	return 0;
+}
+
+static int cix_dp_hw_load_regs(struct cix_dp *dp)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < ARRAY_SIZE(cix_dp_reg_conf); i++) {
+		ret = cix_dp_phy_apply_reg(dp, &cix_dp_reg_conf[i]);
+		if (ret)
+			return ret;
+	}
+
+	return cix_dp_phy_cdb_write(dp, CIX_DP_PHY_PMA_PLL_RAW_CTRL,
+				    CIX_DP_PMA_PLL_RAW_CTRL_PLL0_FORCE_RSTN);
+}
+
+static int cix_dp_hw_power_on(struct cix_dp *dp)
+{
+	int ret;
+
+	ret = cix_dp_phy_set_lanes(dp, dp->num_lanes);
+	if (ret)
+		return ret;
+
+	writel(0x0001, dp->base + CIX_DP_PHY_CONFIG_RSTN);
+	ret = cix_dp_common_ready_ack(dp);
+	if (ret)
+		return ret;
+
+	return cix_dp_pll_enable(dp);
+}
+
+static int cix_dp_hw_power_off(struct cix_dp *dp)
+{
+	return cix_dp_pll_disable(dp);
+}
+
+static int cix_dp_hw_reset(struct cix_dp *dp)
+{
+	int ret;
+
+	ret = cix_dp_toggle_reset(dp);
+	if (ret)
+		return ret;
+
+	writel(0, dp->base + CIX_DP_PHY_DATA_ENABLE);
+	writel(0, dp->base + CIX_DP_PHY_LANE_RSTN_BITS);
+	writel(0, dp->base + CIX_DP_PHY_LANE_EN_BITS);
+	writel(0, dp->base + CIX_DP_PHY_CONFIG_RSTN);
+
+	return 0;
+}
+
+static int cix_dp_hw_configure(struct cix_dp *dp,
+			       union phy_configure_opts *opts)
+{
+	struct phy_configure_opts_dp *dp_opts = &opts->dp;
+	int ret;
+
+	if (dp_opts->set_lanes) {
+		ret = cix_dp_phy_set_lanes(dp, dp_opts->lanes);
+		if (ret)
+			return ret;
+	}
+
+	if (dp_opts->set_rate) {
+		ret = cix_dp_phy_set_link_rate(dp, dp_opts);
+		if (ret)
+			return ret;
+	}
+
+	if (dp_opts->set_voltages)
+		return cix_dp_phy_set_voltages(dp, dp_opts);
+
+	return 0;
+}
+
+static int cix_dp_init(struct phy *phy)
+{
+	struct cix_dp *dp = phy_get_drvdata(phy);
+	int ret;
+
+	ret = clk_prepare_enable(dp->apb_clk);
+	if (ret)
+		return ret;
+
+	ret = cix_dp_toggle_reset(dp);
+	if (ret)
+		goto disable_clk;
+
+	ret = cix_dp_hw_prepare(dp);
+	if (ret)
+		goto disable_clk;
+
+	ret = cix_dp_hw_load_regs(dp);
+	if (ret)
+		goto disable_clk;
+
+	return 0;
+
+disable_clk:
+	clk_disable_unprepare(dp->apb_clk);
+	return ret;
+}
+
+static int cix_dp_exit(struct phy *phy)
+{
+	struct cix_dp *dp = phy_get_drvdata(phy);
+
+	cix_dp_hw_reset(dp);
+	clk_disable_unprepare(dp->apb_clk);
+
+	return 0;
+}
+
+static int cix_dp_power_on(struct phy *phy)
+{
+	struct cix_dp *dp = phy_get_drvdata(phy);
+
+	return cix_dp_hw_power_on(dp);
+}
+
+static int cix_dp_power_off(struct phy *phy)
+{
+	struct cix_dp *dp = phy_get_drvdata(phy);
+
+	return cix_dp_hw_power_off(dp);
+}
+
+static int cix_dp_configure(struct phy *phy,
+			    union phy_configure_opts *opts)
+{
+	struct cix_dp *dp = phy_get_drvdata(phy);
+
+	return cix_dp_hw_configure(dp, opts);
+}
+
+static const struct phy_ops cix_dp_ops = {
+	.init		= cix_dp_init,
+	.exit		= cix_dp_exit,
+	.power_on	= cix_dp_power_on,
+	.power_off	= cix_dp_power_off,
+	.configure	= cix_dp_configure,
+	.owner		= THIS_MODULE,
+};
+
+static int cix_dp_probe(struct platform_device *pdev)
+{
+	struct phy_provider *phy_provider;
+	struct device *dev = &pdev->dev;
+	struct cix_dp *dp;
+
+	dp = devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
+	if (!dp)
+		return -ENOMEM;
+
+	dp->num_lanes = CIX_DP_NUM_LANES;
+	dp->external_dp = device_property_read_bool(dev, "cix,external-dp");
+
+	dp->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(dp->base))
+		return PTR_ERR(dp->base);
+
+	dp->apb_clk = devm_clk_get(dev, "apb");
+	if (IS_ERR(dp->apb_clk))
+		return dev_err_probe(dev, PTR_ERR(dp->apb_clk),
+				     "failed to get apb clock\n");
+
+	dp->reset = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(dp->reset))
+		return dev_err_probe(dev, PTR_ERR(dp->reset),
+				     "failed to get reset\n");
+
+	dp->phy = devm_phy_create(dev, dev->of_node, &cix_dp_ops);
+	if (IS_ERR(dp->phy))
+		return dev_err_probe(dev, PTR_ERR(dp->phy),
+				     "failed to create PHY\n");
+
+	phy_set_drvdata(dp->phy, dp);
+	phy_set_bus_width(dp->phy, CIX_DP_NUM_LANES);
+	platform_set_drvdata(pdev, dp);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(phy_provider))
+		return dev_err_probe(dev, PTR_ERR(phy_provider),
+				     "failed to register PHY provider\n");
+
+	return 0;
+}
+
+static const struct of_device_id cix_dp_of_match[] = {
+	{ .compatible = "cix,sky1-dp-phy" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, cix_dp_of_match);
+
+static struct platform_driver cix_dp_driver = {
+	.probe	= cix_dp_probe,
+	.driver	= {
+		.name = "cix-dp-phy",
+		.of_match_table = cix_dp_of_match,
+	},
+};
+module_platform_driver(cix_dp_driver);
+
+MODULE_AUTHOR("Luo Liu <Luo.Liu@cixtech.com>");
+MODULE_AUTHOR("Eastlake Yang <Eastlake.Yang@cixtech.com>");
+MODULE_DESCRIPTION("CIX DP PHY driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1

