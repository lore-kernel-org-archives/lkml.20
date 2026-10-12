Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023089.outbound.protection.outlook.com [40.107.44.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D1348BD54;
	Mon, 12 Oct 2026 12:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808589; cv=fail; b=A6AxH1iynKoXym9RYY5MjC3BCsVu+fJKgL683niH+zJcMpKVzDsI3M3o90ejDoxkGiPW9ouq4ARuXJa+/ci7Ty3Zv3K6QjptClyBracSPIAGrWa8TrwipI3T991ykdb2KlBJw8OOEYSvnnNWvZw5/yWUdXSXxE7SH5/wwrqpZWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808589; c=relaxed/simple;
	bh=C3/mAmOPfjajiytdlCtX7oHZO94Q40B/FPtsNBO7s1M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ea4RrOWJVm861YYBC2eiB4vP8RYlbOmmYFT6q/9qXf+ki8bcTGt/2BQ7gU02yRilngEvaHWBbDFXbp3RlrILFZXNDTxfObMYPyofHPOdn/C546ZgMPP7c9Gr7/FD8d2io13dQ6UQMpxl3LtLv9w7xiUYw0Cw2jAxRqQddRH3srg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pAxyVfLtzm2Gn5WjieY2cU9CQp1WSqiSy7GEXDN8rti1KC7mu07Q42YjqvL5G0nBs8BcSV+MOJOxPF8dXRDHCTWqET9LT2gUP7g/6AWSd61M1VLzxXxSNfgbXSHeue3CnHQGkxhMCvJ7aC8AzvU2oowtAaysN5Sugl9or39OPmmdVvL+RLxggnUSkicJIhfXWPXKyrQDQq2aCF4pfkZBbWMEcsKj9Y/EmaWBPXW8Ubx97/1wMPHEgw3Rq1FAz+ZrMH4AE2n3ALK/l+ns5kqbAHMl+Xx5hwt5rTHpjW/XkFZn1pzgLE3ktljmfeSnxbNOpgwteFzmMaIQqu1rMVKVFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YinwHvGN7UYBIz+EUMhL6FSoB5SNtWeHwdwCyLfRwlc=;
 b=lXEsEgMrkpb3K/CbPNWhuFQcGqdCg7qNf5rj9UqrsG7Nx8+Cg9latZpR85PI9m7ZlPz3YtG3ZX6BIXH4ui/VRtT2IX46gGT5jEtL9hnCellVL0EZrY5SRyP16JE/LdX5DrLd+DbJXcyEPu1ml2NAfFDSRwTwB0CKd2ldSudpr+MXuNn5JCcynnLVkFl6/J4vbvBKQ3wNXLVxw00Fevir5btcLoNBOGbZsShJcvnhUkCpVoI6HofxaSyrjXYEhaD8goh58clzo8Pp2tUAd9HTc7jovUBlXC/1N2vvlofYPofo2EGpDN0KRCJqq2Tmrf3yRMcvJzMbcprFAhVj23FWOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR04CA0004.apcprd04.prod.outlook.com (2603:1096:990:4::20)
 by OS8PR06MB7321.apcprd06.prod.outlook.com (2603:1096:604:289::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 12:36:21 +0000
Received: from SG2PEPF000B66CC.apcprd03.prod.outlook.com
 (2603:1096:990:4:cafe::4c) by JH0PR04CA0004.outlook.office365.com
 (2603:1096:990:4::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon,
 12 Oct 2026 12:36:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CC.mail.protection.outlook.com (10.167.240.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 12:36:20 +0000
Received: from localhost.localdomain (unknown [172.16.64.56])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 901A840920F3;
	Mon, 12 Oct 2026 20:36:18 +0800 (CST)
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
Subject: [PATCH v2 2/3] phy: cix: Add Sky1 DP PHY driver
Date: Mon, 12 Oct 2026 20:36:17 +0800
Message-Id: <20261012123618.648930-3-Luo.Liu@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261012123618.648930-1-Luo.Liu@cixtech.com>
References: <20261012123618.648930-1-Luo.Liu@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CC:EE_|OS8PR06MB7321:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c04b84ea-938a-45f8-190b-08df285d6b3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|42112799006|82310400026|36860700016|921020|56012099006|261009223027099003|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	OO6UBGa+ZptcOe1Bl9wnH7wToVNsdfPcVjHqctmhh2ggI3tB8ucnKM1vtjpH9ehVQeAwdbQibYOBa/+9OAun6ocl8fN7H79ZGd5QULtKR8FKD9k26gE4gYRIPBAwAjW0u91cbvZahy+crogAI7WCV6yqDSRBH5Ne6jXlYQPIpYXXfiJaRCNVwl/FlXcms3jAbH8h0mix2GFA8Y75TwsWgZsdfoHHHYGQiJZd82Tcxsbf3V1bGAN0H8DSuSv7eJ7r6vKqLgysnk7syoYF36VblOL1PQJ8oUrujsBEoe1nXiM7cIyY3poD/0OzXnUvdyDfvcBcdptWhtJCWEtB8SxbSQD5FVm7lAiF6EKmKJ+jkog/Qzr8P7vZ4FCPzRel05XobQOuDDiCGLdA4oV8oteI5y96d20p/VT5iFZPxKW9RlAymPGsgUZ/5IY3+deqD2TqnESxlFVP9lgLrt0f2tIS76VwQXOON4dGX/Nfuj15yyNldbRrsDXysRj1gYGtpj/xFMNDgEBqsCnGx6KwnAk1Zzg9L1ZVSQ1ef8F46ECEpDPOGvMtIRt8zianMPR5RB+Hv+Unep3cd9f0qISfmS4TJN5hyGa6r+i/l3ulrNU2/oy9L79cYjLWTGzgv8g2WXlscekc4ehi2pOqoR6J1nPSobkVqWyKhhUoliknNle+6RUCNuuSg4sP+2jSkdV2Uzwkalb3M0VK4H/Ej7rERjj3Pkhw93bh0VhJvTzNC6ORUcWoUAVIFmeWfebUXBCO8QDL
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(42112799006)(82310400026)(36860700016)(921020)(56012099006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ITKBkWZvP2FIUTfmUgxUgG5M3Ii93Suu5wCKYCo5tyJITVblhcrli/n32jkizzkvYjhPGAx33a8C2elzHIVtEUwv/nfWPbUyp7UgBgU09eMoYfYgUydjCWa054rZdbRexCXrh6ZuUUB9pXGZ/SZz0ydiqc91a4n5l6+vvBTORWzsUTjRb2at4r2th6R0Z3bkj7hCd7TcoHYdR102F/xce+YddRwCnu4sKanTDZSrc79kc30RpLYHuE6wuXbl1RbLEKhBr9RKvJM3nC4BcEUix0DRY+gOuHq9zL1kN08oIc+noIAUa2NdAf3in38rQLgRIMetHfISg98MAlco8oRNDh0jjk19pjBEts/QDDUZxCe2NCAjf8EX3mbpuxLW37TBJ8ShXWXTNkFo6YEq/XUa+V6lUMAV04j89XtNGWsPazm88jyMjdLHNvKJW389k+Bk
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 12:36:20.3321
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c04b84ea-938a-45f8-190b-08df285d6b3a
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CC.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS8PR06MB7321

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
 drivers/phy/cix/phy-cix-dp.c | 985 +++++++++++++++++++++++++++++++++++
 5 files changed, 1007 insertions(+)
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
index 000000000000..00c9d1ad6a5b
--- /dev/null
+++ b/drivers/phy/cix/phy-cix-dp.c
@@ -0,0 +1,985 @@
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
+	bool use_low_volt;
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
+	int ret;
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
+		return ret;
+
+	ret = cix_dp_phy_cdb_write(dp, CIX_DP_DRV_DIAG_TX_DRV_LANE(lane),
+				   cfg->drv_diag_tx_drv);
+	if (ret)
+		return ret;
+
+	ret = cix_dp_phy_cdb_write(dp,
+				   CIX_DP_TX_TXCC_MGNFS_MULT_000_LANE(lane),
+				   cfg->tx_txcc_mgnfs_mult_000);
+	if (ret)
+		return ret;
+
+	ret = cix_dp_phy_cdb_write(dp,
+				   CIX_DP_TX_TXCC_CPOST_MULT_00_LANE(lane),
+				   cfg->tx_txcc_cpost_mult_00);
+	if (ret)
+		return ret;
+
+	return cix_dp_phy_cdb_write(dp, CIX_DP_TX_DIAG_ACYA_LANE(lane),
+				    value & ~BIT(0));
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
+	table = dp->use_low_volt ? cix_dp_volt_low_cfg : cix_dp_volt_cfg;
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
+	dp->use_low_volt =
+		!device_property_read_bool(dev, "cix,external-dp");
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

