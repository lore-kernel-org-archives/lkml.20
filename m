Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023131.outbound.protection.outlook.com [40.107.44.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0DB3D47AB;
	Tue, 13 Oct 2026 09:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885549; cv=fail; b=GiSrSOQdOGnQ8XF7llHX5DzkFzdCnvT+0I9jvFX2SLSELgErC3/koVVXzOk8SZsDkmU/es+074UpWGinHyiPnsf/QyiAcqTR8f6qMr8KHy0805F9xDeI769XwEai5nzz1421PYVowF8b3yKlLKBZzqTZY+gO2RW7eOyU8V9xmFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885549; c=relaxed/simple;
	bh=V5Vv0Do4Y7FzvrF+UUnHQiviatNEu2+XcyML+FWPi5A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AmLozd5z4AvcPcrF0N7yagfOjrtXvyGc2kR95CzjV0fZ9McYgpp26X9DaJ7okwgSqRatIGzWtQgbXUBbJBO2m7jNWSIPGoBpSR8WGpI8abQVm7C/zuSWFg+1LM0ldP9qtdF7wM7og4Hk9Dq2tejS+QGGvQ8pjQ7LMG/oWcpJSto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J396UCVtE2aljV6JGH/rvWKg7sPm63Mcu+O4g17j3CW79SBGI3L8u8aQ+O5JaAUF9jKU/T9Jg8vnHcD1k0vh9n8peN41FBS/kP6E27ubHAmiNi+iC25qO1CCOd0UNBS0C5ap8JsfRQThY2SZp5RS0+1Z5gK9It0B7O2+8Kj34qV+WNCEJiR8ZJfdu8TLgDSQwtsgkvukVnf7zpKoUaZkGRiAFjzJt2V2jkDaHlGPuIPK9SXUq6mQTJyZhNMSIRztiPh0pnuvSwq7rYg0x0Dh3WsVOzdC7zN4DYzm6laQz7mTVJA6NAVC1wIjj4n3TLJ39jvyTWX9u6I06xyOxczYSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mo8cKvjN3H+PRT5xlK/k9CWpAFdm7bLN7l1yBz2d/bQ=;
 b=bru7VIamy9aOAlKL0xvYNT/T3YQoddLvreXxWZYC5HEGsq4/IC37/voIUbyvv6hX/rtCEcMgFv0gyoW10PWScc1Ivty+4tchDfP4igsFO90z+hu35hehUOV1trG/Rkt3azgcwgNIRB8hLnrripRvPRCbk2O/CfyFZPWz99Ilbwx3qdvda3fmdZo4uCMEXVSU27wMM9MjXm9Bh5D9drctue3kVkc75qs516pgZzXZ6cTctiiIqT7HJH77KCyr/Zzw4uhJ3F+N4pBNecYuNUXWwMNUYa6HAZojCXjOA4bIQ+vhLna9UqVxbrX9Z7jzcUabnjeEUJHSR4VurQuOjFvsew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR01CA0181.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::13) by PUZPR06MB5537.apcprd06.prod.outlook.com
 (2603:1096:301:ed::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 09:59:02 +0000
Received: from SG2PEPF000B66CF.apcprd03.prod.outlook.com
 (2603:1096:4:189:cafe::56) by SG2PR01CA0181.outlook.office365.com
 (2603:1096:4:189::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Tue, 13
 Oct 2026 09:59:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CF.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 09:59:01 +0000
Received: from localhost.localdomain (unknown [172.16.64.56])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 0F75640920F8;
	Tue, 13 Oct 2026 17:59:01 +0800 (CST)
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
Subject: [PATCH v3 2/3] phy: cix: Add Sky1 DP PHY driver
Date: Tue, 13 Oct 2026 17:58:59 +0800
Message-Id: <20261013095900.758464-3-Luo.Liu@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261013095900.758464-1-Luo.Liu@cixtech.com>
References: <20261013095900.758464-1-Luo.Liu@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CF:EE_|PUZPR06MB5537:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7fbcda0e-54bc-4b82-1203-08df29109bc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|7416014|376014|42112799006|82310400026|10067099003|3023799007|261009223027099003|921020|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	kBzEUT9EoqJncJLfg98ToYgJavGivyrP821xd1RXgoE6IQdyFBzgX1EHaw1Mryj9kH4aSiTzsB6k4Rb08KRYKrcmgiHMn84IwY/iXVnYKkAfTPuwZPOrKeHTe4SYfRlQrAjQBkr5ZATxRBUwFmQXa3jU7e1mPfGsNqPVYKBpk9YktTfbJfpT5Deh+EOtUD2Df4YYHkTBW8JV4HhP2yDZ923DgTfj5Ne47F0hB+5eDLUCW1kK/p4EGSRFMcAhgVoyo31a9D/CuwmXKu+48CQ9g51aAva9xzztiSPVXRYJuCve/r1vMSKV0peok6KlOKZIAtfUnNQ4Yl6T382W0iUTzZ0+/ORcGnusGzS6yQKKHpiLQ3nVuvFZxS+nz4TSjA16U8eWcLdfIPe9jWAMWofMHhEQNb7fv44uSC+s4dGsmcH/hwzZN55wxDyrSlsQE9c920zkwK271VbLO6TUGL4eVmb9cEykPTVYhpydybLNO5Qu0jjza2kZKtpTpuNeywVpGms5L1ukwYlxvpXQrLtfAyTybfBWPbogHLaQFRfURH5h6SxSvPqkz+yChTz2T98pCGTZVKa759xrH4L0Vxn9x+937NJW4v+ahxdKKb1hgNIwoBJxdobCawvsv/ylBeAKVoh9ZKbWOxoS6v8gCNtJDfQnrQQ/TuxCLYzD9v8duHDU8W7zNEHPjHr2Ltc5OQ/QOJlVnXvHmlvh8nVyRupv1l+Rh+Dnv3j2bQw6BNmz40AmxpkLTznScogwBq0uLg+C
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(7416014)(376014)(42112799006)(82310400026)(10067099003)(3023799007)(261009223027099003)(921020)(6133799003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/3lJOe8rOElPhmA19nASvoxZN3V7kSLlmDICt6hJxhCnuZExySpDiBKwT5TBYMy0L5swJ62EnXwpfy6CSR3ei3NLHtD4eV0f7woBBqyRW5V3iB988w64Ytl9oXt/7FeXE6vdXgMhhF1hMqlWFb6o2TxVpqkSXTgvc84BM32T3X7HbIu6p/vAbXX0OeSMxzOF46HD7VxqKZiUg4p2oPhModfYJmOgWi6mDC0tQ3RcKu9GgbN8nhITQVj60ywdgu5xkoEVrNyIXpvsVOfc6+xgb3WM2rVRaPRieQw2D164gH/jdCyQyH80J03qObUuVunIShHILjs/Y5aJwV/NzY75T6e2bxBpeufdWWCRooPhtuanb9rvcOMR/HAKjE4Kg7CqfIIsyUPile394NhcBKyY4NwbgmNr4WMKd/8y0/QkTERI43PKl/SNctc0++uac/Ld
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 09:59:01.7476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fbcda0e-54bc-4b82-1203-08df29109bc3
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CF.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5537

Add a PHY driver for the CIX Sky1 dedicated DisplayPort PMA. Support
link rate, lane count, SSC and voltage swing via the generic PHY DP
ops. Load PMA tables in phy_init and enable the analog path in
phy_power_on so configure can run before power-on.

Signed-off-by: Luo Liu <Luo.Liu@cixtech.com>
---
 drivers/phy/Kconfig          |   1 +
 drivers/phy/Makefile         |   1 +
 drivers/phy/cix/Kconfig      |  18 +
 drivers/phy/cix/Makefile     |   2 +
 drivers/phy/cix/phy-cix-dp.c | 987 +++++++++++++++++++++++++++++++++++
 5 files changed, 1009 insertions(+)
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
index 000000000000..0e429e2790bf
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
+	depends on OF && HAS_IOMEM
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
index 000000000000..4cc8f5e715f0
--- /dev/null
+++ b/drivers/phy/cix/phy-cix-dp.c
@@ -0,0 +1,987 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * CIX DP PHY driver
+ *
+ * Copyright (C) 2023 Trilinear Technologies
+ * Copyright 2024 Cix Technology Group Co., Ltd.
+ */
+
+#include <linux/bits.h>
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
+#define CIX_DP_CDB_SEL_READ			0x2
+#define CIX_DP_CDB_SEL_WRITE			0x3
+
+#define CIX_DP_NUM_LANES			4
+#define CIX_DP_POLL_SLEEP_US			10
+#define CIX_DP_POLL_TIMEOUT_US			100000
+#define CIX_DP_PWR_TIMEOUT_US			10000
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
+enum cix_dp_pwr {
+	CIX_DP_PWR_A0,
+	CIX_DP_PWR_A2,
+	CIX_DP_PWR_A3,
+};
+
+struct cix_dp {
+	struct phy *phy;
+	struct reset_control *reset;
+	void __iomem *base;
+	bool is_edp;
+	bool powered;
+	unsigned int num_lanes;
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
+	writel(1, dp->base + CIX_DP_CDB_ENABLE);
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
+	writel(1, dp->base + CIX_DP_CDB_ENABLE);
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
+	int ret;
+
+	ret = cix_dp_toggle_reset(dp);
+	if (ret)
+		return ret;
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
+	if (dp->powered)
+		return 0;
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
+	if (!dp->powered)
+		return 0;
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
+	ret = cix_dp_hw_prepare(dp);
+	if (ret)
+		return ret;
+
+	return cix_dp_hw_load_regs(dp);
+}
+
+static int cix_dp_exit(struct phy *phy)
+{
+	struct cix_dp *dp = phy_get_drvdata(phy);
+
+	return cix_dp_hw_reset(dp);
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
+	dp->is_edp = device_property_read_bool(dev, "cix,edp");
+
+	dp->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(dp->base))
+		return PTR_ERR(dp->base);
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

