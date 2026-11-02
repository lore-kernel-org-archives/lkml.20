Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.111
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793588741;
	b=nu2mY5+mJau69BHKa9c75usRZCK34uJd1sgNP/6UMmiiKh1D2KSUjokwTh1Qn7pHRiSD
	 RYCYs4lQv4mBRu5CPqYqf/EA93a+PKWS+d5BNu/biTib55qziw8tfhk6YF7zJbhmwlgEc
	 kwjRYYs+3Th+a9AnoXSs2Jld1CGGBjJPa1kYNWVoMH6Q0kfGvdtSEPB7oD6+5nP9tM2EE
	 3wCfgaV9uiHcw3oi5iG5K9O4an//ANbZ3mP6f2QHUnQ4UHZ9LSvBmeUUpA3vN6N+Fo4bZ
	 qryx85JcbIIo71pjx5oz5pL3RMDz9yA1NHJsvW8t8h7YEvRXRJU3Eu7VZ2H44xqj8xw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793588741;
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
	bh=LtsKc7KXaATIVKQpjyr0TxYQNT8L0FtH5n+3f+ib01M=;
	b=ZxQuOiO2VNjzxYdeXjvGTMSVTEhiKEdHvgx27rZwDtZa5EFpcurVJZEG1LyryUL7+wCj
	 469rlXokMgf70ATvhoa/R//E++WxA0WssNn1WSzbEgkQZCl6pmBd5w33gnGR61RWT5gce
	 u7EJ5n9w2r3tNrJLzsmxgwWf0u7Ceims2DrXazNjcfJ2NYpliuqHsJJURa62kYhrk5/hs
	 qcYDDpvMkW24su8rffnYylKiXfrL146k7a89kBqOecQvT1NXVFgpNBLi0MAZYitIuHYl5
	 C2xTq6LQSwsal2fzj2SlmOXYyWccvZc74aZ1HwmijkkifF97UOJp0+H/UTjbSM9UdCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.111
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022111.outbound.protection.outlook.com [40.107.75.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34471606A324;
	Mon,  2 Nov 2026 03:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34471606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fTdfw8Tt3EIYBqzcv2O6he1FbRRUwIU5o2J3IC9fLq7W5UsSw6USFKp7mghjGSxsGcb5sqQUjJwx3RSWJ/DXBeMlb4LD+x9Zsf4uNTAWladjARkXBOm1gszTwnT3Jv9SeeE3ddp5BaSkxI2vcp5gQjWESKPePN13LBVQIiQx68P0DZjMRseIgK9VVwYASlSV4M7ZDQAo07EcGi5kvYw/765wUmIRQoybFdMothmREo4qcTmSmwAeUcqee3M8tAEvViGHo1VtbuNbSBD+x82HXkMA66ER14JEStGaZH62Un06bSaXLpD+hjcItbf5beLAw3Eh3O9Kpy6QEOXhxeLTMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LtsKc7KXaATIVKQpjyr0TxYQNT8L0FtH5n+3f+ib01M=;
 b=tap8ZUeap9UYUclh3ScCUOtsOq+Qmt71aHn79vpCDnqvPdVRHm7bgXVkwYg1/czqugKIaoD7IvnrqzlU/V028kheSbOcMwKnqK3VT+6GBLIgSjwfIEE4Y8TvK5Ape/rysPTjt/1rd6L2OmYmkue40BIumulT+EtbiJAV634zffKbjRObkVZCE5ntZ4PTuxahIwojMUqNn3YPNXz7UQR0cpm+0Sh7MZnZmr/D38hsZfSsVAJWF7GKHGZFh+aZPjHI/35kN/4gT9LHyMmGyDGMDpEFx2C/exgGzXMu3Py8/3f8FNae2k3qZHgqFilvIQ9ncTiXtm/AG8HV2PH37XktGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0045.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:29d::19)
 by SEZPR06MB5643.apcprd06.prod.outlook.com (2603:1096:101:a7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Mon, 2 Nov 2026
 03:04:27 +0000
Received: from TY2PEPF0000AB83.apcprd03.prod.outlook.com
 (2603:1096:400:29d:cafe::18) by TYCP286CA0045.outlook.office365.com
 (2603:1096:400:29d::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 03:04:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB83.mail.protection.outlook.com (10.167.253.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 03:04:26 +0000
Received: from localhost.localdomain (unknown [172.16.64.56])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id C483940920E1;
	Mon,  2 Nov 2026 11:04:25 +0800 (CST)
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
Subject: [PATCH v4 2/3] phy: cix: Add Sky1 DP PHY driver
Date: Mon,  2 Nov 2026 11:04:24 +0800
Message-Id: <20261102030425.1957585-3-Luo.Liu@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261102030425.1957585-1-Luo.Liu@cixtech.com>
References: <20261102030425.1957585-1-Luo.Liu@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB83:EE_|SEZPR06MB5643:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e0fdad97-343b-48d0-0263-08df388e014d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|7416014|376014|23010399003|42112799006|6133799003|3023799007|22082099003|18002099003|10067099003|56012099006|261009223027099003|921020|261022105027099003|261021123027099003|261021121427099003|261022075727099003|261028144727099003|261026140227099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	OSnYJocMrGQnFGniy3xLbyvgGYWrEfc6zDmpKKPZ40RvzBiDJbLIBjjONlAG2kSjRvgnx1eLFs4x1SUAxgzZXCusVvnaIgHcYGckVRUNRQY2p6AxLOMiBKMRAoSJO5IFhJ+bFCcEBSeLAlt7NS4ORwymp42LS8o+qhiOkTjTIGq8D9BT10Xmvl9Hitx3ysM7xtZr4RCU2tzvrTh5wjSB8CiJ5nBVjsnG+ZcP0naEiOXX0PBAsP6NvvAlM8lPboe/8tpGfFF1tvdlr49vIZ8QicKTJN/wDiIBZXxlANayZG3xfe0tD1WRcS+UZRlMHBwRHn4Hegl9eCDib0bdhJz9GnmtfXq113YZWVmAAiaVL59ydtAjUc0CvkaogV7TarucJj8+sjaQrsTDxXbhXogEMOyvrKR+O8YuxUJKSaKCxFSoOV6qoyBczuOJSbPNxFJ+LiPOCeGixep5IHT6hAhmNQ7SL1GQQSYP2WwaEhKf6QZJ9wFxCbNP9MOMU2pIGEyyWAyE5bQiXwWBkBTB8273FkB9ppPOam4pSXKhBZxkqMkbpN9EyVzgb4aCi0/pK9JakJVbpJoLKgYkEE8sjz5+YOb9xevmLpN0pjUb1SghrCa32l5vDb/EsDR94IJ0950kJIcR/c5v/MAlo7j+V1ZQoV9xJHBnXCdV4wWv4GE3qR++1eCHUY17Q5EpBk846BApEVy4akgFc3K0yF9A0jWHJxJT9TtYy02+Yq87UevV9m8lqx8Le/2g/M6ke4C94i3i
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(7416014)(376014)(23010399003)(42112799006)(6133799003)(3023799007)(22082099003)(18002099003)(10067099003)(56012099006)(261009223027099003)(921020)(261022105027099003)(261021123027099003)(261021121427099003)(261022075727099003)(261028144727099003)(261026140227099003)(261026121527099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HUgo0ki15SdkYfyoym92Mho6Bf6If5su9aBlTVAw7770q8I9dBpaU6pzCNJJZ1b4bbCPWLek263nm3pq9iLJgBe9AxySlHI6g4A4Dk7VU+9tSblK1lGI3bkCRlMrR26aQpOIl8oTlx+IW4i6hpCkOrjmTZqLbuuto99Cik20Ll3c+V2ozNPtU3E5JZzmWAEPtm+1bfz5N52W+7ZjT6coU5+fDMmQ22GhFM8vn+LHt61JQBT8XKME4RBPIzX4qEOmQOaLup7b6n1TMlZ5oqIoDE3GrI5+2ptPEDwSZAT3xCyOYVkk5nkj16KG+ZpZunFB05aF2i/nnyfG6nl4lquu5GRtNVPH4ourX8UOZ0kQXexRE5hKI2A/0HEeQk5Y6rNhcIMmF/YKcf9ZZh6wwQzr1ZJnULp6Zova63qS//wdBjefZxr60OxoSWZTyjXHllN1
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 03:04:26.5300
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0fdad97-343b-48d0-0263-08df388e014d
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB83.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5643

Add a PHY driver for the CIX Sky1 dedicated DisplayPort PMA. Support
link rate, lane count, SSC and voltage swing via the generic PHY DP
ops. Enable the shared APB clock and toggle reset in phy_init, load
PMA tables there, and enable the analog path in phy_power_on so
configure can run before power-on.

Signed-off-by: Luo Liu <Luo.Liu@cixtech.com>
---
 drivers/phy/Kconfig          |    1 +
 drivers/phy/Makefile         |    1 +
 drivers/phy/cix/Kconfig      |   18 +
 drivers/phy/cix/Makefile     |    2 +
 drivers/phy/cix/phy-cix-dp.c | 1004 ++++++++++++++++++++++++++++++++++
 5 files changed, 1026 insertions(+)
 create mode 100644 drivers/phy/cix/Kconfig
 create mode 100644 drivers/phy/cix/Makefile
 create mode 100644 drivers/phy/cix/phy-cix-dp.c

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 19f3b7d12b7d..cb0d4be47628 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -175,6 +175,7 @@ source "drivers/phy/axiado/Kconfig"
 source "drivers/phy/broadcom/Kconfig"
 source "drivers/phy/cadence/Kconfig"
 source "drivers/phy/canaan/Kconfig"
+source "drivers/phy/cix/Kconfig"
 source "drivers/phy/eswin/Kconfig"
 source "drivers/phy/freescale/Kconfig"
 source "drivers/phy/hisilicon/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index d7aa516bcc49..6fd0f3910018 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_GENERIC_PHY)		+= allwinner/	\
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
index 000000000000..8e52d10d2595
--- /dev/null
+++ b/drivers/phy/cix/phy-cix-dp.c
@@ -0,0 +1,1004 @@
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
+	bool is_edp;
+	bool powered;
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
+static void cix_dp_phy_write(struct cix_dp *dp, u32 offset, u32 value)
+{
+	writel(value, dp->base + offset);
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
+	cix_dp_phy_write(dp, CIX_DP_PHY_LANE_PWR_STATE_REQ, pwr_state);
+	ret = cix_dp_pwr_state_ack(dp, pwr_state);
+	cix_dp_phy_write(dp, CIX_DP_PHY_LANE_PWR_STATE_REQ,
+			 CIX_DP_PHY_PWR_STATE_IDLE);
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
+	cix_dp_phy_write(dp, CIX_DP_PHY_DATA_ENABLE, 0);
+	ret = cix_dp_hw_power(dp, CIX_DP_PWR_A3);
+	if (ret)
+		return ret;
+
+	cix_dp_phy_write(dp, CIX_DP_PHY_LANE_PLLCLK_ENABLE, 0);
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
+
+	ret = cix_dp_phy_cdb_write(dp, CIX_DP_PHY_PMA_PLL_RAW_CTRL, 1);
+	if (ret)
+		return ret;
+
+	ret = cix_dp_pll_raw_ctrl_ack(dp, mask);
+	if (ret)
+		return ret;
+
+	cix_dp_phy_write(dp, CIX_DP_PHY_LANE_PLLCLK_ENABLE, 1);
+	ret = cix_dp_lane_pll_ack(dp, true);
+	if (ret)
+		return ret;
+
+	ret = cix_dp_hw_power(dp, CIX_DP_PWR_A2);
+	if (ret)
+		return ret;
+
+	ret = cix_dp_hw_power(dp, CIX_DP_PWR_A0);
+	if (ret)
+		return ret;
+
+	cix_dp_phy_write(dp, CIX_DP_PHY_DATA_ENABLE, 1);
+
+	return 0;
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
+	cix_dp_phy_write(dp, CIX_DP_PHY_LANE_RSTN_BITS, mask);
+	cix_dp_phy_write(dp, CIX_DP_PHY_LANE_EN_BITS, mask);
+	cix_dp_phy_write(dp, CIX_DP_TX_ELEC_IDLE_BITS,
+			 (~mask) & GENMASK(CIX_DP_NUM_LANES - 1, 0));
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
+	if (dp->powered) {
+		ret = cix_dp_pll_disable(dp);
+		if (ret)
+			return ret;
+	}
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
+	if (dp->powered)
+		return cix_dp_pll_enable(dp);
+
+	return 0;
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
+	table = dp->is_edp ? cix_dp_volt_cfg : cix_dp_volt_low_cfg;
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
+	cix_dp_phy_write(dp, CIX_DP_CDB_RSTN, 1);
+
+	/* reset AUXHPD block */
+	cix_dp_phy_write(dp, CIX_DP_AUXHPD_ENABLE_BITS, 0);
+	cix_dp_phy_write(dp, CIX_DP_TX_ELEC_IDLE_BITS, 0xf);
+
+	/* reset PHY */
+	cix_dp_phy_write(dp, CIX_DP_PHY_DATA_ENABLE, 0);
+	cix_dp_phy_write(dp, CIX_DP_PHY_LANE_RSTN_BITS, 0);
+	cix_dp_phy_write(dp, CIX_DP_PHY_LANE_EN_BITS, 0);
+
+	cix_dp_phy_write(dp, CIX_DP_PHY_CONFIG_RSTN, 0);
+	udelay(1);
+
+	/* enable Cadence AUXHPD block */
+	cix_dp_phy_write(dp, CIX_DP_AUXHPD_ENABLE_BITS, 1);
+	udelay(1);
+	cix_dp_phy_write(dp, CIX_DP_AUXHPD_ENABLE_BITS, 3);
+	udelay(1);
+	cix_dp_phy_write(dp, CIX_DP_AUXHPD_ENABLE_BITS, 7);
+	udelay(5);
+
+	/* aux lines enabled for TX and RX */
+	cix_dp_phy_write(dp, CIX_DP_AUXHPD_ENABLE_BITS, 0xf);
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
+	cix_dp_phy_write(dp, CIX_DP_PHY_CONFIG_RSTN, 0x0001);
+	ret = cix_dp_common_ready_ack(dp);
+	if (ret)
+		return ret;
+
+	ret = cix_dp_pll_enable(dp);
+	if (ret)
+		return ret;
+
+	dp->powered = true;
+
+	return 0;
+}
+
+static int cix_dp_hw_power_off(struct cix_dp *dp)
+{
+	int ret;
+
+	ret = cix_dp_pll_disable(dp);
+	if (ret)
+		return ret;
+
+	dp->powered = false;
+
+	return 0;
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
+	cix_dp_phy_write(dp, CIX_DP_PHY_DATA_ENABLE, 0);
+	cix_dp_phy_write(dp, CIX_DP_PHY_LANE_RSTN_BITS, 0);
+	cix_dp_phy_write(dp, CIX_DP_PHY_LANE_EN_BITS, 0);
+	cix_dp_phy_write(dp, CIX_DP_PHY_CONFIG_RSTN, 0);
+	dp->powered = false;
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
+static int cix_dp_reset(struct phy *phy)
+{
+	struct cix_dp *dp = phy_get_drvdata(phy);
+
+	return cix_dp_hw_reset(dp);
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
+	.reset		= cix_dp_reset,
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
+	dp->is_edp = device_property_read_bool(dev, "cix,external-dp");
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

