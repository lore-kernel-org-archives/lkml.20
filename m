Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022076.outbound.protection.outlook.com [40.107.75.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D0A33A9E2;
	Thu,  3 Sep 2026 02:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788402937; cv=fail; b=PxW34jER+DYSUtB+BFSjWKy0mM8YSt4iIgiqAGpjEzULzHOK2zpyOGu7ICu4dGlzFd0ngFk7DLQAQpqFP54iwAn2N5P2zVBA+nldGRgy0WmAKLqeQDGLAWyYlg79y5kBCiyJm+u2INau3o83Ybf79aKDesHorb9AYMM6JwinXIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788402937; c=relaxed/simple;
	bh=dtMUAnXPMz3UxMmw0TpW3BDtsuExqhEIlBfymrjAQ4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DJCzCLcRpCGPREyCCbr2qyFb7DB+FdJQB2OSi6RpcC4FTjZmbmTdNlLlXfVrTRuLMA9HtWIYVAI5rrx5C8b5a/+vqx4TxXxDFDIm4mIAWGq4TzCl1ghYrHOyFzJd9tTWzTfSBN+r5vAm+s84gpjkDrdewmv0FpsO9Blci4+J5nU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PcJg19S+W7+SFLbsM3eawM8a5KnmdUelyJ2dHnzsR6QjE6EhIt13FBVJWWRAXXdGJLib5kVTyAC3+Qg1ysb3zhoec0wx+xmBnrt0EqS8KWOjQzFlxZAPVPmicmdqiapbRTrqqtM2PfCKNgV8FhCtUghPcnmOZz51iTZ4r73EywbK6L3GYM/A9gJXBBIYAj0PPitGi+SgGCxiQNLcZRIBPSmVcEO/UgyHy3erEBwPdZzBzePl9GW9BiKE2VlO6zZxpP8kVeVv1SDdsBGF8Ke6SWRcc5pyI33xYYA2rZRbrHPE+uCTlfZiDlkhkTk14cZ2pkXQEjijnoV3OaxLKxP25w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GXH7bv9aJkeOANT8bK6lhnGui/IjjqhBwvUQoUluYJM=;
 b=asEHA6J/ggr0SgSusGFaOmuzg77Shw/pDyc2HaBOlFNDwbD9RpnOxMoDAHtsutWfBHeQNZ2YCDUbSILAWNmWp/7XXYA3evMPFhvHGldj3WfpKdu1DPZeAN5RXxmRePfog+mHEfBTrD8Nro8P6VpssCfFldJ/jbgPuC6ItWWdecHXvjTQcS6R+pGZqEjeMJWObpoCDwzvbc5bi65x3rR6ch9lCNndeISM45CvvqKJ6W19RgQBBTkB2lQg2BaQVU7Xyb65eZ96ugiiel2cPBbMz6GgCVqCZZwazb378+FBvANhW0GpNftM7YDDjrA2eFkknjN+D6wiJtQt30j6A+UJyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TY6PR01CA0008.jpnprd01.prod.outlook.com (2603:1096:405:3bc::19)
 by TYZPR06MB5300.apcprd06.prod.outlook.com (2603:1096:400:1f3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 02:35:25 +0000
Received: from TY2PEPF0000AB83.apcprd03.prod.outlook.com
 (2603:1096:405:3bc:cafe::88) by TY6PR01CA0008.outlook.office365.com
 (2603:1096:405:3bc::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Thu, 3
 Sep 2026 02:35:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB83.mail.protection.outlook.com (10.167.253.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 02:35:24 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 27D624092114;
	Thu,  3 Sep 2026 10:35:23 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: krzk@kernel.org
Cc: cix-kernel-upstream@cixtech.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	fugang.duan@cixtech.com,
	gregkh@linuxfoundation.org,
	hongliang.yang@cixtech.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	neil.armstrong@linaro.org,
	p.zabel@pengutronix.de,
	pawell@cadence.com,
	peter.chen@kernel.org,
	robh@kernel.org,
	rogerq@kernel.org,
	vkoul@kernel.org
Subject: [PATCH v3 3/5] phy: cix: Add CIX Sky1 USB3 PHY driver
Date: Thu,  3 Sep 2026 10:35:19 +0800
Message-ID: <20260903023521.2064986-4-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903023521.2064986-1-hongliang.yang@cixtech.com>
References: <503e87d9-3311-413a-98c0-e02a02c4a354@kernel.org>
 <20260903023521.2064986-1-hongliang.yang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB83:EE_|TYZPR06MB5300:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d3585309-e752-446c-58ea-08df09640216
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|1800799024|376014|23010399003|36860700016|22082099003|18002099003|4143699003|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	ssVyo4mX6aKdYweEJxQGeN5Zk9nR1AZlNVssTb8LxxSqQs22meAPwMFkV/FevJdrZgvxh+OnHrqrFhdCfGeFMQYWN/R1e3T3l6U3m0QWV+DHW+hq/UwBeskq26/LWkliUsf2en7HiYgoBGJPahAK3VtDeJXJwVsXeUuAC3i/F2mE5kVvXVTs80kQh0DzCaYMDzT9CbK6vEch1l0bq1XCbVMavGEAmheYHyhWO/1MBUvseUGx2ODFLlLTsMa7PXmT4R5KVd9n0KfhEQ5TG2sHkBRL4PXHRa44gJXG92uLB2ALtD40DKkIhdX5heXCE+0dPPctGCio/k/5xsIlv8Xm/KgxvauQF50X4E63S5kaXx0w2jeQO3eOss8EKZ18ApIi7UiM37tTnnM1UJkoKdqUR0rlrvgsUSuCFcEvQGgZJt5FQN7FQzaANIrHI7BoRUiA9kqspfUPrQYNuShdiLVVpZVe/Y0hDMw5+UgdTEzqJMpXYeuU4ESOFA4lEVGZLzE2bybRmVi5FbNX/yVuu2BYlIopLoIr3bPv/g0qp8s6nA2d6blJLjXE7wi3t7qFp/i0zPgBsCuehDO6C9YLHxMlySrR1AtGwkh7OUUlScRWSvoJAkn1oLvfjLr98TgYkd+CDbT0K5TrfDB7PN3Ugdfk8gstNal/M4ykFPexQou3lOiYZM16+GmGTaDSEe/xjDqiZcaKw2j0b/DsjCxp7jJTTg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(1800799024)(376014)(23010399003)(36860700016)(22082099003)(18002099003)(4143699003)(56012099006)(6133799003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Puchv6e1b+jqE4JU7e2G6kG3k1jhl1EXRjO1r0SUCU6wbwOtJgMHTt4Px4CWAE8viOqfByVmra+FTBigQK5JcnvIHzBEcfGYa56jrItzrAMHf+g4NDgV12JTpURQvzMTJxo7CLsEqYEBbn2H7PYZhVZks089rF84uq7ruMj43YLqyaXcxKY4WcFpJyuqmDQq/9sHi0bmyEgMCPeOYZUCzcNS3bD1+C8w/ven0j4mHFX8e8ilJ7mQEYd7MGz15SNqGmJbZRYHTq9ADq+rBvjc1cRcAC0MMNSBxDiyExjNfycOvE5M3nud0bPb3lMyG/xRMmfZIMpvbAdnTJwC/mjuhPkJtDWgQK8HzPVYuH5kiwwlR/dPvQ8oTm00N3GJx6POj5NxtNmEWAANxpbS+VinQqloISc0fNEC2maKaI+E+Xia/NWgBsotDIJ//EwvQgPu
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 02:35:24.4044
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3585309-e752-446c-58ea-08df09640216
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB83.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5300

Add PHY driver for the USB3 PHY found on CIX Sky1 SoCs. The driver
handles initialization, reset, and clock management for the
multi-port USB3 PHY.

Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>
---
 drivers/phy/Kconfig             |   1 +
 drivers/phy/Makefile            |   1 +
 drivers/phy/cix/Kconfig         |  20 ++
 drivers/phy/cix/Makefile        |   6 +
 drivers/phy/cix/phy-cix-usb3.c  | 410 ++++++++++++++++++++++++++++++++
 drivers/phy/cix/phy-cix-usbdp.h | 310 ++++++++++++++++++++++++
 6 files changed, 748 insertions(+)
 create mode 100644 drivers/phy/cix/Kconfig
 create mode 100644 drivers/phy/cix/Makefile
 create mode 100644 drivers/phy/cix/phy-cix-usb3.c
 create mode 100644 drivers/phy/cix/phy-cix-usbdp.h

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
index 000000000000..aaa2eb9d4552
--- /dev/null
+++ b/drivers/phy/cix/Kconfig
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Phy drivers for Cix PHYs
+#
+
+if ARCH_CIX || COMPILE_TEST
+
+config PHY_CIX_USB3
+	tristate "Cix USB3 PHY Driver"
+	depends on OF && HAS_IOMEM
+	select GENERIC_PHY
+	help
+	  Enable this to support the CIX USB3 PHY for TYPEA Connection.
+
+	  This driver provides initialization and power management for
+	  the USB3 PHY found on CIX Sky1 SoCs.
+
+	  If unsure, say N.
+
+endif # ARCH_CIX || COMPILE_TEST
diff --git a/drivers/phy/cix/Makefile b/drivers/phy/cix/Makefile
new file mode 100644
index 000000000000..b46b1059b2ab
--- /dev/null
+++ b/drivers/phy/cix/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for the Cix phy drivers.
+#
+
+obj-$(CONFIG_PHY_CIX_USB3)	+= phy-cix-usb3.o
diff --git a/drivers/phy/cix/phy-cix-usb3.c b/drivers/phy/cix/phy-cix-usb3.c
new file mode 100644
index 000000000000..0f074af84e90
--- /dev/null
+++ b/drivers/phy/cix/phy-cix-usb3.c
@@ -0,0 +1,410 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * phy driver for cdn_sd0803_t7g_typea
+ *
+ * Author: Hongliang Yang <hongliang.yang@cixtech.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+#include "phy-cix-usbdp.h"
+
+struct cix_u3phy;
+
+struct cix_u3phy_cfg {
+	int (*u3phy_init)(struct cix_u3phy *u3phy);
+	int (*u3phy_exit)(struct cix_u3phy *u3phy);
+};
+
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
+	struct mutex mutex; /* mutex to protect access to individual PHYs */
+	bool init;
+	int init_count;
+	const struct cix_u3phy_cfg *cfg;
+};
+
+static int sky1_u3phy_exit(struct cix_u3phy *u3phy)
+{
+	u3phy->init_count--;
+	if (u3phy->init && u3phy->init_count == 0) {
+		reset_control_assert(u3phy->reset);
+		reset_control_assert(u3phy->preset);
+		clk_disable_unprepare(u3phy->ref_clk);
+		clk_disable_unprepare(u3phy->apb_clk);
+		u3phy->init = false;
+	}
+	return 0;
+}
+
+static int sky1_u3phy_init(struct cix_u3phy *u3phy)
+{
+	int ret;
+
+	if (!u3phy->init) {
+		/* usb rcsu reset is default deassert */
+		reset_control_assert(u3phy->reset);
+		reset_control_assert(u3phy->preset);
+		ret = clk_prepare_enable(u3phy->apb_clk);
+		if (ret) {
+			dev_err(u3phy->dev, "Failed to prepare_enable u3phy apb clock\n");
+			return ret;
+		}
+		ret = clk_prepare_enable(u3phy->ref_clk);
+		if (ret) {
+			dev_err(u3phy->dev, "Failed to prepare_enable u3phy ref clock\n");
+			goto disable_apb_clk;
+		}
+		reset_control_deassert(u3phy->preset);
+		ret = regmap_multi_reg_write(u3phy->phy_regmap, sky1_u3phy_conf,
+					     ARRAY_SIZE(sky1_u3phy_conf));
+		if (ret) {
+			dev_err(u3phy->dev, "Failed to write the reg sequence\n");
+			goto assert_reset_preset;
+		}
+		u3phy->init = true;
+		reset_control_deassert(u3phy->reset);
+	}
+	u3phy->init_count++;
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
+static const struct cix_u3phy_cfg sky1_u3phy_cfg = {
+	.u3phy_init = sky1_u3phy_init,
+	.u3phy_exit = sky1_u3phy_exit
+};
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
+static int cix_usb3_phy_power_on(struct cix_u3phy *u3phy)
+{
+	int ret;
+	const struct cix_u3phy_cfg *phy_cfgs = u3phy->cfg;
+
+	if (phy_cfgs->u3phy_init) {
+		ret = phy_cfgs->u3phy_init(u3phy);
+		if (ret) {
+			dev_err(u3phy->dev, "failed to init udphy\n");
+			return ret;
+		}
+	}
+	return 0;
+}
+
+static int cix_usb3_phy_power_off(struct cix_u3phy *u3phy)
+{
+	int ret;
+	const struct cix_u3phy_cfg *phy_cfgs = u3phy->cfg;
+
+	if (phy_cfgs->u3phy_exit) {
+		ret = phy_cfgs->u3phy_exit(u3phy);
+		if (ret) {
+			dev_err(u3phy->dev, "failed to exit udphy\n");
+			return ret;
+		}
+	}
+	return 0;
+}
+
+static int cix_u3phy_init(struct phy *phy)
+{
+	struct cix_u3phy *u3phy = phy_get_drvdata(phy);
+	int ret = 0;
+
+	mutex_lock(&u3phy->mutex);
+	ret = cix_usb3_phy_power_on(u3phy);
+	mutex_unlock(&u3phy->mutex);
+	return ret;
+}
+
+static int cix_u3phy_exit(struct phy *phy)
+{
+	struct cix_u3phy *u3phy = phy_get_drvdata(phy);
+	int ret = 0;
+
+	mutex_lock(&u3phy->mutex);
+	ret = cix_usb3_phy_power_off(u3phy);
+	mutex_unlock(&u3phy->mutex);
+	return ret;
+}
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
+	struct device_node *np = dev->of_node;
+	struct device_node *child_np;
+	struct phy *phy;
+	int ret;
+
+	u3phy = devm_kzalloc(dev, sizeof(*u3phy), GFP_KERNEL);
+	if (!u3phy)
+		return -ENOMEM;
+	dev_set_drvdata(dev, u3phy);
+	u3phy->dev = dev;
+	u3phy->cfg = device_get_match_data(dev);
+	if (!u3phy->cfg) {
+		dev_err(dev, "no OF data can be matched with %p node\n", np);
+		return -EINVAL;
+	}
+	u3phy->reset = devm_reset_control_get_exclusive(dev, "core");
+	if (IS_ERR(u3phy->reset)) {
+		dev_err(dev, "failed to get reset\n");
+		return PTR_ERR(u3phy->reset);
+	}
+	u3phy->preset = devm_reset_control_get_exclusive(dev, "apb");
+	if (IS_ERR(u3phy->preset)) {
+		dev_err(dev, "failed to get preset\n");
+		return PTR_ERR(u3phy->preset);
+	}
+	u3phy->apb_clk = devm_clk_get(dev, "apb");
+	if (IS_ERR(u3phy->apb_clk)) {
+		dev_err(dev, "phy apb clock not found\n");
+		return PTR_ERR(u3phy->apb_clk);
+	}
+	u3phy->ref_clk = devm_clk_get(dev, "ref");
+	if (IS_ERR(u3phy->ref_clk)) {
+		dev_err(dev, "phy ref clock not found\n");
+		return PTR_ERR(u3phy->ref_clk);
+	}
+	u3phy->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(u3phy->base))
+		return PTR_ERR(u3phy->base);
+	u3phy->phy_regmap = devm_regmap_init(dev, NULL, u3phy, &cix_u3phy_regmap_cfg);
+	if (IS_ERR(u3phy->phy_regmap)) {
+		dev_err(dev, "failed to remap phy register\n");
+		return PTR_ERR(u3phy->phy_regmap);
+	}
+	mutex_init(&u3phy->mutex);
+	device_for_each_child_node_scoped(dev, child_fn) {
+		const char *name = fwnode_get_name(child_fn);
+
+		if (!name)
+			continue;
+		/* only the usb-port@N lane nodes describe PHY ports */
+		if (strncmp(name, "usb-port", 8) || name[8] != '@')
+			continue;
+		child_np = to_of_node(child_fn);
+		phy = devm_phy_create(dev, child_np, &cix_u3phy_ops);
+		if (IS_ERR(phy)) {
+			ret = PTR_ERR(phy);
+			dev_err(dev, "failed to create phy: %s\n", name);
+			return ret;
+		}
+		phy_set_drvdata(phy, u3phy);
+	}
+
+	/* keep the PHY in reset until a consumer calls phy_init() */
+	reset_control_assert(u3phy->reset);
+	reset_control_assert(u3phy->preset);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(phy_provider)) {
+		ret = PTR_ERR(phy_provider);
+		dev_err(dev, "failed to register phy provider\n");
+		return ret;
+	}
+	return 0;
+}
+
+static const struct of_device_id cix_u3phy_dt_match[] = {
+	{
+		.compatible = "cix,sky1-usb3-phy",
+		.data = &sky1_u3phy_cfg
+	},
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
+MODULE_DESCRIPTION("Cix USB3 Only PHY driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/phy/cix/phy-cix-usbdp.h b/drivers/phy/cix/phy-cix-usbdp.h
new file mode 100644
index 000000000000..6ec7eb5c81aa
--- /dev/null
+++ b/drivers/phy/cix/phy-cix-usbdp.h
@@ -0,0 +1,310 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _PHY_CIX_USBDP_H
+#define _PHY_CIX_USBDP_H
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
+#define TX_PSC_A1_LANE1              0x4301
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
+#define RX_PSC_A1_LANE0              0x8001
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
+#define TX_TXCC_CPOST_MULT_01_LANE1  0x424d
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
+#define RX_SIGDET_HL_FILT_TMR_LANE0  0x8090
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
+#define RX_REE_ATTEN_THR_LANE0       0x8149
+#define RX_REE_ATTEN_THR_LANE1       0x8349
+#define RX_REE_ATTEN_THR_LANE2       0x8549
+
+#define RX_REE_SMGM_CTRL1_LANE0      0x8177
+#define RX_REE_SMGM_CTRL1_LANE1      0x8377
+#define RX_REE_SMGM_CTRL1_LANE2      0x8577
+
+#define RX_REE_SMGM_CTRL2_LANE0      0x8178
+#define RX_REE_SMGM_CTRL2_LANE1      0x8378
+#define RX_REE_SMGM_CTRL2_LANE2      0x8578
+
+#define XCVR_DIAG_PSC_OVRD_LANE0     0x40eb
+#define XCVR_DIAG_PSC_OVRD_LANE1     0x42eb
+#define XCVR_DIAG_PSC_OVRD_LANE2     0x44eb
+
+#define RX_DIAG_SIGDET_TUNE_LANE0    0x81e8
+#define RX_DIAG_SIGDET_TUNE_LANE1    0x83e8
+#define RX_DIAG_SIGDET_TUNE_LANE2    0x85e8
+
+#define RX_DIAG_NQST_CTRL_LANE0      0x81e5
+#define RX_DIAG_NQST_CTRL_LANE1      0x83e5
+#define RX_DIAG_NQST_CTRL_LANE2      0x85e5
+
+#define RX_DIAG_DFE_AMP_TUNE_2_LANE0 0x81e2
+#define RX_DIAG_DFE_AMP_TUNE_2_LANE1 0x83e2
+#define RX_DIAG_DFE_AMP_TUNE_2_LANE2 0x85e2
+
+#define RX_DIAG_DFE_AMP_TUNE_3_LANE0 0x81e3
+#define RX_DIAG_DFE_AMP_TUNE_3_LANE1 0x83e3
+#define RX_DIAG_DFE_AMP_TUNE_3_LANE2 0x85e3
+
+#define RX_DIAG_PI_CAP_LANE0         0x81f5
+#define RX_DIAG_PI_CAP_LANE1         0x83f5
+#define RX_DIAG_PI_CAP_LANE2         0x85f5
+
+#define RX_DIAG_PI_RATE_LANE0        0x81f4
+#define RX_DIAG_PI_RATE_LANE1        0x83f4
+#define RX_DIAG_PI_RATE_LANE2        0x85f4
+
+#define RX_DIAG_ACYA_LANE0           0x81ff
+#define RX_DIAG_ACYA_LANE3           0x87ff
+
+#define RX_CDRLF_CNFG_LANE0          0x8080
+#define RX_CDRLF_CNFG_LANE1          0x8280
+#define RX_CDRLF_CNFG_LANE2          0x8480
+
+#define RX_CDRLF_CNFG3_LANE0         0x8082
+#define RX_CDRLF_CNFG3_LANE1         0x8282
+#define RX_CDRLF_CNFG3_LANE2         0x8482
+
+#define PHY_PMA_PLL_CTRL             0xe003
+
+#define PHY_PMA_ISO_PLL_CTRL0        0xe005
+#define PHY_PMA_ISO_PLL_CTRL1        0xe006
+
+/* Bits */
+
+#define PHY_PLL_CFG_0803              0xC00E
+/* 0803 phy register */
+#define PHY_PIPE_USB3_GEN2_PRE_CFG0_0803	0xc01c
+#define PHY_PIPE_USB3_GEN2_POST_CFG0_0803	0xc01e
+#define PHY_PIPE_USB3_GEN2_POST_CFG1_0803	0xc01f
+
+/* gop status address */
+#define GOP_STATUS_ADDRESS 0x83E05000
+#define GOP_STATUS_SIZE 0x04
+
+struct gop_status {
+	unsigned char phy_status[4];
+};
+
+/*
+ * 0: usb
+ * 1: 2 lane usb+ 2 lane dp
+ * 2: usb device
+ * 3: usb2.0 + 4 lane dp
+ */
+enum phy_role {
+	USB_ROLE_NONE,
+	USB_ROLE_HOST,
+	USB_ROLE_DEVICE,
+	USB_ROLE_HOST_20,
+};
+
+#endif
-- 
2.54.0

