Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022127.outbound.protection.outlook.com [52.101.126.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6820A3D2FFC;
	Mon, 31 Aug 2026 08:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164601; cv=fail; b=qTSFoxEhe3nRGLo9wbNa1L4s5C++CZ4id7SgzWKxLw5xVei7y7wwHDykJKQoDA1rvVI538VAq4CoXU6VoT9o5VJQhXH3F/ESWQLK/gHiTFHWqDlLLp1Hh6nuO/F4HmLvgT6wHkSLYAtwBY0RxtP1x626EsFe3kPJ96Abl4JdURk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164601; c=relaxed/simple;
	bh=c/BXHNUZRQMFJolCxqq9JeKaXXDzJ58Kkro8FbmxwGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aMXKFphYhiGH2pOhJEFFsAixCEhjygF0RpAdLSyCaZh2fYEkuGK25nstPAo20i4jYuxe/VyPl8byPjVHJRx8xforQKZA1z5N77J4kvmeTY6fZNHYK1xeADhgxphYuPxwTr31n4ojpUF/6Tach16yQkNC6LvWozS/MFeqBDyXY3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CTEe+BHJ+oK7DSuRIPm49a+3wc12CK4vPQimCwIBXlMyF23/RREBSXxOOntl1oMP9uV9RtfTy6TOqNCAL9w4ljUqLm2cdutd+g2V8v9lm7TexjLFg3SXa23ZYRImNC0O80D9lgFsLIcN2Pb1Zv8SHTHyH2TdFZOw01IBOVoE1yVZQ/eKqewB9a2NMpY8gyeERCuNp6S6vRz9Uk+7vQATvWN8CK50eo7HLrGHpMhAiI6uN9oS3VvFRo6/JyvC4CVhFZ8cOdfGMSsvq3JbfzGg0NmK07OaxM835aGriQU9Cr9Xz9eDZbQDi+fgtILKRF6KxbRJtfcljDB1New70VuCAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JH3pqfFgYMOMyd9Rs2AO8OmYXJR4H7yfKbIzOpkAinU=;
 b=kc+gCXnnE/l9wwGdX8tWyiFTw8nVMtm09826c9Kchb9MYZwpYV3AeZZKeuW1rvNNvkm+211RTQX3nP0bo12VgICW+DqA3WUjib+8rIZXondBNIiolGcFwAy5PI37T1Ave5rcuI5sk4182shx4wfEY9nhoaZ/KB/ZUuiJ1EVk+CM0o8UHArzyhk4GyjkffNBWSPzaZWkSnyIVxUxFWr7QpCRj6nFvV3qlmrc9KnCkZ3zvD/e9hOYMftbdH3rvR81Zq45d8L06mbAp8RB4EJNOoLv60oMtvlf63zRFlCrbi70eC0rDEoMiIlUcsn3A27uUXgGw/LpA79oIVj/GByCrOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2P153CA0034.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::21) by
 TYSPR06MB6362.apcprd06.prod.outlook.com (2603:1096:400:415::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Mon, 31 Aug 2026 08:23:14 +0000
Received: from SG2PEPF000B66CD.apcprd03.prod.outlook.com
 (2603:1096:4:c7:cafe::4) by SG2P153CA0034.outlook.office365.com
 (2603:1096:4:c7::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Mon,
 31 Aug 2026 08:23:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CD.mail.protection.outlook.com (10.167.240.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Mon, 31 Aug 2026 08:23:12 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 5AFB9409210C;
	Mon, 31 Aug 2026 16:23:11 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: peter.chen@kernel.org,
	pawell@cadence.com,
	vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: gregkh@linuxfoundation.org,
	rogerq@kernel.org,
	neil.armstrong@linaro.org,
	p.zabel@pengutronix.de,
	fugang.duan@cixtech.com,
	cix-kernel-upstream@cixtech.com,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hongliang Yang <hongliang.yang@cixtech.com>,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v1 3/4] usb: cdns3: Add CIX Sky1 glue driver
Date: Mon, 31 Aug 2026 16:23:07 +0800
Message-ID: <20260831082309.3854507-4-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260831082309.3854507-1-hongliang.yang@cixtech.com>
References: <20260831082309.3854507-1-hongliang.yang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CD:EE_|TYSPR06MB6362:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e934a2e7-a6db-4781-e879-08df0739192c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700016|82310400026|23010399003|10067099003|5023799004|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	039mdtLniNqgcg36BTuUH7kJa8KEBD72C8uJJ4U10RTUO+d3SRMFOClUOuttI9gLmje3iX0FMLPpSUaHTB1H4oa65W9e44NEyy8qX24rSCdfsP+eiFAjo7sVEiX4/gONFJHj+fPKCpQ7mQP9IsJgpwSFmgX+owJzbHoC10VkzADItLWOgzUyNKje0YjeK2Y3T2IdQi0HToJ8hefs7TMMPyMKNlzTiuALuhrTp7B2+1rR+CwZV4MbTxVkM79NNtaKsV5Kxu+ViXdnv+V09lKo5ezgMkaQ8I8dK9DIvpiMhiCwHmXWZNNez3Ykp+h9oXkchB8TyGtdHog8E6L394XA78qOQQKF0l+JW+qab2BKj3oe8yFlPd/tIeGtihFjiFEdiWK6854abx4KIOQbx6DKjX1X2G0H82I9WrqXWuG436y9UHPfF2RNFxfB4MFA8BDYNQcKjKhOuEUUCB2SY2mGUMdk2N4GhWhPhEXUQszj8mHag0ZSSW/dyLPh6GdZgRHyffcz3HnHBnCNJERqcpLe7PFMYoZ2hXpVWBw+BqTGEg3gU8IGgXd8fYND2v/zC+xFAC4VXrHuAqrjt+G4Lz1Gn659/eF93/xUz6Zi4jJn/VUwtJndrAFbqDCXF1paoRuBQokj7e5XFzn+48M5wj443WQnVkNR6xR3ApLyrwCjhtmKDSeWTajI7ma3/h9KeMbW
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700016)(82310400026)(23010399003)(10067099003)(5023799004)(6133799003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tW9hDG1p5mXVl1hK4o4SOQ316UbXRtvEwvqNLkj48AJTDUVTh82bdKFZ/V0ZIWChlj7XlpST7/0WhBczHmlBH9aLGWzp41FwG0i4DAMDCJpHNsxipioYmJcS0EAzIl04a5i2Z4aZPSfumKWw32NpTHpP8On1+y6YLb4M0YrphG1hVX26gxsmIo90mUesIBVRlpTvs9lr00jWyhp1piHUe7TgxT3/SIR5WFrmsDBLL6VokwRvE23F1nM5iQvBAQVJZVaIIS2IdN139DFjl+DOgggbqDoo3KrGI9r9HbBNk00XrvgnTqd+eQh9lqf+pTvQ1LnqLqGEDqhpsr1cHKpnU9iVZSUVrM+zipRXgsNtUFFjS3OPdW+EWBr4m32iS2fMRh0LhSLRZcXVuZpBtQaJSbeF8jTvkLg2ywkPAexyc7QVyQphkLEVsMiMQxdo/wAs
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 08:23:12.4485
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e934a2e7-a6db-4781-e879-08df0739192c
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CD.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6362

Add glue layer for the Cadence USBSSP DRD controller on CIX Sky1
SoCs. The glue driver handles platform-specific initialization
including clocks, resets, and PHY configuration.

Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>
Reviewed-by: Gary Yang <gary.yang@cixtech.com>
---
 drivers/usb/cdns3/Kconfig      |  13 +
 drivers/usb/cdns3/Makefile     |   1 +
 drivers/usb/cdns3/cdnsp-sky1.c | 682 +++++++++++++++++++++++++++++++++
 drivers/usb/cdns3/cdnsp-sky1.h | 127 ++++++
 4 files changed, 823 insertions(+)
 create mode 100644 drivers/usb/cdns3/cdnsp-sky1.c
 create mode 100644 drivers/usb/cdns3/cdnsp-sky1.h

diff --git a/drivers/usb/cdns3/Kconfig b/drivers/usb/cdns3/Kconfig
index 39ad23d1ada8..03d8e170a98a 100644
--- a/drivers/usb/cdns3/Kconfig
+++ b/drivers/usb/cdns3/Kconfig
@@ -77,6 +77,19 @@ config USB_CDNSP_PCI
 	  If you choose to build this driver as module it will
 	  be dynamically linked and module will be called cdnsp-pci.ko
 
+config USB_CDNSP_SKY1
+	tristate "Cadence USB3 support on CIX Sky1 SoC platforms"
+	depends on USB_CDNS3
+	depends on ARCH_CIX || COMPILE_TEST
+	default USB_CDNS3
+	help
+	  Glue driver for the Cadence USB dual-role controllers on CIX Sky1
+	  (device tree compatible cix,sky1-usb3). It enables clocks and resets
+	  from the SoC, then uses the shared cdns3 platform core (cdns.ko).
+
+	  If built as a module, the module is named cdnsp-sky1.ko and must be
+	  loaded after the cdns core module when both are loadable modules.
+
 config USB_CDNS3_TI
 	tristate "Cadence USB3 support on TI platforms"
 	depends on ARCH_K3 || COMPILE_TEST
diff --git a/drivers/usb/cdns3/Makefile b/drivers/usb/cdns3/Makefile
index b2e4ba6a49a3..ab813aaf9940 100644
--- a/drivers/usb/cdns3/Makefile
+++ b/drivers/usb/cdns3/Makefile
@@ -28,3 +28,4 @@ obj-$(CONFIG_USB_CDNSP_PCI)			+= cdnsp-pci.o
 obj-$(CONFIG_USB_CDNS3_TI)			+= cdns3-ti.o
 obj-$(CONFIG_USB_CDNS3_IMX)			+= cdns3-imx.o
 obj-$(CONFIG_USB_CDNS3_STARFIVE)		+= cdns3-starfive.o
+obj-$(CONFIG_USB_CDNSP_SKY1)			+= cdnsp-sky1.o
diff --git a/drivers/usb/cdns3/cdnsp-sky1.c b/drivers/usb/cdns3/cdnsp-sky1.c
new file mode 100644
index 000000000000..3dd20451569e
--- /dev/null
+++ b/drivers/usb/cdns3/cdnsp-sky1.c
@@ -0,0 +1,682 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * cdnsp-sky1.c - CIX Sky1 glue for Cadence USBSSP DRD controller
+ *
+ * Copyright (C) 2026 CIX Technology Group Co., Ltd.
+ */
+
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+
+#include <linux/usb.h>
+#include <linux/usb/hcd.h>
+
+#include "cdnsp-sky1.h"
+#include "core.h"
+
+static const char *cix_usb_clk_names[CIX_USB_CLK_NUM] = {
+	"sof_clk",
+	"usb_aclk",
+	"lpm_clk",
+	"usb_pclk",
+};
+
+struct cdnsp_sky1_strap_signal {
+	unsigned int offset, bit;
+};
+
+static const struct cdnsp_sky1_strap_signal strap_signals[SKY1_USB_S5_NUM] = {
+	/* usb config in s5 domain */
+	[U3_TYPEC_DRD_ID]	= { USB_MODE_STRAP_S5_DOMAIN, U3_TYPEC_DRD_MODE_STRAP_BIT },
+	[U3_TYPEC_HOST0_ID]	= { USB_MODE_STRAP_S5_DOMAIN, U3_TYPEC_HOST0_MODE_STRAP_BIT },
+	[U3_TYPEC_HOST1_ID]	= { USB_MODE_STRAP_S5_DOMAIN, U3_TYPEC_HOST1_MODE_STRAP_BIT },
+	[U3_TYPEC_HOST2_ID]	= { USB_MODE_STRAP_S5_DOMAIN, U3_TYPEC_HOST2_MODE_STRAP_BIT },
+	[U3_TYPEA_CTRL0_ID]	= { USB_MODE_STRAP_S5_DOMAIN, U3_TYPEA_CTRL0_MODE_STRAP_BIT },
+	[U3_TYPEA_CTRL1_ID]	= { USB_MODE_STRAP_S5_DOMAIN, U3_TYPEA_CTRL1_MODE_STRAP_BIT},
+	[U2_HOST0_ID]		= { USB_MODE_STRAP_S5_DOMAIN, U2_HOST0_MODE_STRAP_BIT },
+	[U2_HOST1_ID]		= { USB_MODE_STRAP_S5_DOMAIN, U2_HOST1_MODE_STRAP_BIT },
+	[U2_HOST2_ID]		= { USB_MODE_STRAP_S5_DOMAIN, U2_HOST2_MODE_STRAP_BIT },
+	[U2_HOST3_ID]		= { USB_MODE_STRAP_S5_DOMAIN, U2_HOST3_MODE_STRAP_BIT },
+};
+
+static int cdnsp_sky1_set_mode_by_id(struct device *dev, int mode)
+{
+	struct cdnsp_sky1 *data = dev_get_drvdata(dev);
+
+	return regmap_update_bits(data->usb_syscon,
+				  strap_signals[data->id].offset,
+				  GENMASK(strap_signals[data->id].bit + 1,
+					  strap_signals[data->id].bit),
+				  mode << strap_signals[data->id].bit);
+}
+
+/**
+ * cdnsp_sky1_clk_enable_all() - enable all clocks for usb controller
+ * @dev:	Pointer to the device of platform_device
+ *
+ */
+
+static int cdnsp_sky1_clk_enable_all(struct device *dev)
+{
+	int i, ret = 0;
+	struct cdnsp_sky1 *data = dev_get_drvdata(dev);
+	struct clk **cix_usb_clks = data->cix_usb_clks;
+
+	for (i = 0; i < CIX_USB_CLK_NUM; i++) {
+		cix_usb_clks[i] = devm_clk_get(dev, cix_usb_clk_names[i]);
+		if (IS_ERR(cix_usb_clks[i])) {
+			ret = dev_err_probe(dev, PTR_ERR(cix_usb_clks[i]),
+					    "could not get %s clock\n",
+					    cix_usb_clk_names[i]);
+			goto err_usb_clks;
+		}
+		ret = clk_prepare_enable(cix_usb_clks[i]);
+		if (ret) {
+			dev_err(dev, "%s enable failed:%d\n", cix_usb_clk_names[i], ret);
+			goto err_usb_clks;
+		}
+	}
+	dev_dbg(dev, "enable sky1 USB clock done\n");
+	return ret;
+
+err_usb_clks:
+	cix_usb_clks[i] = NULL;
+	while (--i >= 0) {
+		clk_disable_unprepare(cix_usb_clks[i]);
+		cix_usb_clks[i] = NULL;
+	}
+	return ret;
+};
+
+/**
+ * cdnsp_sky1_clk_disable_all() - disable all clocks for usb controller
+ * @dev:	Pointer to the device of platform_device
+ *
+ */
+
+static void cdnsp_sky1_clk_disable_all(struct device *dev)
+{
+	int i;
+	struct cdnsp_sky1 *data = dev_get_drvdata(dev);
+	struct clk **cix_usb_clks = data->cix_usb_clks;
+
+	for (i = 0; i < CIX_USB_CLK_NUM; i++)
+		clk_disable_unprepare(cix_usb_clks[i]);
+};
+
+/**
+ * cdnsp_sky1_clk_enable_resume() - enable the clocks that are turned
+ * off while suspend
+ * @dev:	Pointer to the device of platform_device
+ *
+ */
+
+static int cdnsp_sky1_clk_enable_resume(struct device *dev)
+{
+	int i, ret;
+	struct cdnsp_sky1 *data = dev_get_drvdata(dev);
+	struct clk **cix_usb_clks = data->cix_usb_clks;
+
+	for (i = 0; i < CIX_USB_CLK_OFF_NUM; i++) {
+		ret = clk_prepare_enable(cix_usb_clks[i]);
+		if (ret) {
+			dev_err(dev, "failed to enable clock %s: %d\n",
+				cix_usb_clk_names[i], ret);
+			goto err_usb_clks;
+		}
+	}
+	return 0;
+
+err_usb_clks:
+	cix_usb_clks[i] = NULL;
+	while (--i >= 0) {
+		clk_disable_unprepare(cix_usb_clks[i]);
+		cix_usb_clks[i] = NULL;
+	}
+	return ret;
+};
+
+/**
+ * cdnsp_sky1_clk_disable_suspend() - disable the clocks which are not
+ * needed when suspend
+ * @dev:	Pointer to the device of platform_device
+ *
+ */
+
+static void cdnsp_sky1_clk_disable_suspend(struct device *dev)
+{
+	int i;
+	struct cdnsp_sky1 *data = dev_get_drvdata(dev);
+	struct clk **cix_usb_clks = data->cix_usb_clks;
+
+	for (i = 0; i < CIX_USB_CLK_OFF_NUM; i++)
+		clk_disable_unprepare(cix_usb_clks[i]);
+};
+
+static int sky1_handshake(void __iomem *ptr, u32 mask, u32 done, u64 timeout_us)
+{
+	u32	result;
+	int	ret;
+
+	ret = readl_poll_timeout(ptr, result,
+				 (result & mask) == done || result == U32_MAX,
+				 10, timeout_us);
+	if (result == U32_MAX)		/* card removed */
+		return -ENODEV;
+	return ret;
+}
+
+static int cdns_sky1_platform_suspend(struct device *dev,
+				      bool suspend, bool wakeup)
+{
+	struct cdns *cdns = dev_get_drvdata(dev);
+	struct platform_device *xhci_dev = cdns->host_dev;
+	struct usb_hcd  *hcd;
+	struct device *parent = cdns->dev->parent;
+	struct cdnsp_sky1 *data = dev_get_drvdata(parent);
+	u32 value;
+	int ret = 0;
+	int count = 3;
+
+	data->wakeup = wakeup;
+
+	if (cdns->role != USB_ROLE_HOST)
+		return 0;
+
+	hcd = dev_get_drvdata(&xhci_dev->dev);
+	if (!hcd) {
+		dev_dbg(dev, "host controller have not registered\n");
+		return 0;
+	}
+
+	if (suspend) {
+		while (count--) {
+			value = readl(hcd->regs + XECP_PM_PMCSR);
+			value &= ~PS_MASK;
+			value |= PS_D3 | PS_PME_En;
+			writel(value, hcd->regs + XECP_PM_PMCSR);
+			/* After controller enters D3, disable AXI and SOF
+			 * until AXI valid flag changes to 0.
+			 */
+			if (sky1_handshake(data->ctst_base, AXI_CLOCK_VALID, 0, 100ULL * 1000))
+				dev_dbg(dev, "enter D3 failed,register value:%x\n",
+					readl(data->ctst_base));
+			else
+				break;
+		}
+		if (count < 0) {
+			dev_err(dev, "enter D3 failed after retries, register value:%x\n",
+				readl(data->ctst_base));
+		}
+	} else {
+		while (count--) {
+			value = readl(hcd->regs + XECP_PM_PMCSR);
+			value &= ~PS_MASK;
+			value |= PS_D0;
+			value &= ~PS_PME_En;
+			writel(value, hcd->regs + XECP_PM_PMCSR);
+			/* Wait power state back to D0 */
+			if (sky1_handshake(hcd->regs + XECP_PM_PMCSR, PS_MASK, 0, 100ULL * 1000)) {
+				dev_dbg(dev, "exit D3 timeout, power state=0x%lx\n",
+					readl(hcd->regs + XECP_PM_PMCSR) & PS_MASK);
+			} else {
+				break;
+			}
+		}
+		if (count < 0) {
+			dev_err(dev, "exit D3 timeout after retries, power state=0x%lx\n",
+				readl(hcd->regs + XECP_PM_PMCSR) & PS_MASK);
+		}
+	}
+
+	return ret;
+}
+
+static void cdnsp_sky1_configure_controller(struct cdnsp_sky1 *data)
+{
+	int clk;
+	int v0, v1, v2;
+	u32 val = 0;
+
+	if (data->u3_disable) {
+		dev_dbg(data->dev, "disable u3 port\n");
+		writel(D_XEC_CFG_3XPORT_MODE_VALUE, data->device_base
+			+ D_XEC_CFG_3XPORT_MODE);
+	}
+	writel(AXI_HALT, data->device_base + D_XEC_AXI_CAP);
+	writel(AXI_HALT, data->xhci_base + D_XEC_AXI_CAP);
+	writel(data->axi_bmax_value, data->device_base + D_XEC_AXI_CTRL0);
+	writel(data->axi_bmax_value, data->xhci_base + D_XEC_AXI_CTRL0);
+	writel((~(u32)(AXI_HALT)), data->device_base + D_XEC_AXI_CAP);
+	writel((~(u32)(AXI_HALT)), data->xhci_base + D_XEC_AXI_CAP);
+	clk = data->sof_clk_freq;
+	v0 =  25 * clk / 100000000;
+	v1 = clk / 10000;
+	v2 = clk / 10;
+	writel(((v0 > 1) ? v0 - 1 : 1), data->device_base
+		+ D_XEC_PRE_REG_250NS);
+	writel((unsigned int)((v1 / 100 > 1) > 0 ? (v1 / 100) - 1 : 1),
+	       data->device_base + D_XEC_PRE_REG_1US);
+	writel((unsigned int)((v1 / 10 > 1) > 0 ? (v1 / 10) - 1 : 1),
+	       data->device_base + D_XEC_PRE_REG_10US);
+	writel(((v1) > 1 ? v1 - 1 : 1), data->device_base
+		+ D_XEC_PRE_REG_100US);
+	writel((unsigned int)((125 * clk / 1000000) > 1 ? (125 * clk / 1000000) : 1),
+	       data->device_base + D_XEC_PRE_REG_125US);
+	writel(((v2 / 100 > 1) ? (v2 / 100) - 1 : 1), data->device_base
+		+ D_XEC_PRE_REG_1MS);
+	writel(((v2 / 10 > 1) ? (v2 / 10) - 1 : 1), data->device_base
+		+ D_XEC_PRE_REG_10MS);
+	writel((v2 > 1 ? v2 - 1 : 1), data->device_base
+		+ D_XEC_PRE_REG_100MS);
+	dev_dbg(data->dev, "readl:%x, %x ,%x, %x, %x, %x, %x, %x\n",
+		readl(data->device_base + D_XEC_PRE_REG_250NS),
+		readl(data->device_base + D_XEC_PRE_REG_1US),
+		readl(data->device_base + D_XEC_PRE_REG_10US),
+		readl(data->device_base + D_XEC_PRE_REG_100US),
+		readl(data->device_base + D_XEC_PRE_REG_125US),
+		readl(data->device_base + D_XEC_PRE_REG_1MS),
+		readl(data->device_base + D_XEC_PRE_REG_10MS),
+		readl(data->device_base + D_XEC_PRE_REG_100MS));
+	clk = data->lpm_clk_freq;
+	v0 =  25 * clk / 100000000;
+	v1 = clk / 10000;
+	v2 = clk / 10;
+	writel(((v0 > 1) ? v0 - 1 : 1), data->device_base
+		+ D_XEC_LPM_PRE_REG_250NS);
+	writel((unsigned int)((v1 / 100 > 1) > 0 ? (v1 / 100) - 1 : 1), data->device_base
+		+ D_XEC_LPM_PRE_REG_1US);
+	writel((unsigned int)((v1 / 10 > 1) > 0 ? (v1 / 10) - 1 : 1), data->device_base
+		+ D_XEC_LPM_PRE_REG_10US);
+	writel(((v1) > 1 ? v1 - 1 : 1), data->device_base
+		+ D_XEC_LPM_PRE_REG_100US);
+	writel((unsigned int)((125 * clk / 1000000) > 1 ? (125 * clk / 1000000) : 1),
+	       data->device_base + D_XEC_LPM_PRE_REG_125US);
+	writel(((v2 / 100 > 1) ? (v2 / 100) - 1 : 1), data->device_base
+		+ D_XEC_LPM_PRE_REG_1MS);
+	writel(((v2 / 10 > 1) ? (v2 / 10) - 1 : 1), data->device_base
+		+ D_XEC_LPM_PRE_REG_10MS);
+	writel((v2 > 1 ? v2 - 1 : 1), data->device_base
+		+ D_XEC_LPM_PRE_REG_100MS);
+	v0 = readl(data->xhci_base + XEC_USBSSP_CHICKEN_BITS_3);
+	v0 &= ~(CFG_APB_TIMEOUT_PSLVERR_EN | CFG_APB_PSLVERR_EN);
+	writel(v0, data->xhci_base + XEC_USBSSP_CHICKEN_BITS_3);
+	if (data->u3_disable) {
+		dev_dbg(data->dev, "disable u3 port\n");
+		writel(XEC_CFG_3XPORT_MODE_VALUE, data->xhci_base
+			+ XEC_CFG_3XPORT_MODE);
+	} else if (data->ssp_disable) {
+		dev_dbg(data->dev, "disable ssp\n");
+		v0 = readl(data->xhci_base + XEC_CFG_3XPORT_MODE);
+		writel(v0  & CFG_3XPORT_MODE_DIS_SSP, data->xhci_base
+			+ XEC_CFG_3XPORT_MODE);
+	}
+	clk = data->sof_clk_freq;
+	v0 =  25 * clk / 100000000;
+	v1 = clk / 10000;
+	v2 = clk / 10;
+	writel(((v0 > 1) ? v0 - 1 : 0), data->xhci_base
+		+ XEC_PRE_REG_250NS);
+	writel((unsigned int)((v1 / 100 > 1) > 0 ? (v1 / 100) - 1 : 0), data->xhci_base
+		+ XEC_PRE_REG_1US);
+	writel((unsigned int)((v1 / 10 > 1) > 0 ? (v1 / 10) - 1 : 0), data->xhci_base
+		+ XEC_PRE_REG_10US);
+	writel(((v1) > 1 ? v1 - 1 : 0), data->xhci_base
+		+ XEC_PRE_REG_100US);
+	writel((unsigned int)((125 * clk / 1000000) > 1 ? (125 * clk / 1000000) : 0),
+	       data->xhci_base + XEC_PRE_REG_125US);
+	writel(((v2 / 100 > 1) ? (v2 / 100) - 1 : 0), data->xhci_base
+		+ XEC_PRE_REG_1MS);
+	writel(((v2 / 10 > 1) ? (v2 / 10) - 1 : 0), data->xhci_base
+		+ XEC_PRE_REG_10MS);
+	writel((v2 > 1 ? v2 - 1 : 0), data->xhci_base
+		+ XEC_PRE_REG_100MS);
+	clk = data->lpm_clk_freq;
+	v0 =  25 * clk / 100000000;
+	v1 = clk / 10000;
+	v2 = clk / 10;
+	writel(((v0 > 1) ? v0 - 1 : 0), data->xhci_base
+		+ XEC_LPM_PRE_REG_250NS);
+	writel((unsigned int)((v1 / 100 > 1) > 0 ? (v1 / 100) - 1 : 0), data->xhci_base
+		+ XEC_LPM_PRE_REG_1US);
+	writel((unsigned int)((v1 / 10 > 1) > 0 ? (v1 / 10) - 1 : 0), data->xhci_base
+		+ XEC_LPM_PRE_REG_10US);
+	writel(((v1) > 1 ? v1 - 1 : 0), data->xhci_base
+		+ XEC_LPM_PRE_REG_100US);
+	writel((unsigned int)((125 * clk / 1000000) > 1 ? (125 * clk / 1000000) : 0),
+	       data->xhci_base + XEC_LPM_PRE_REG_125US);
+	writel(((v2 / 100 > 1) ? (v2 / 100) - 1 : 0), data->xhci_base
+		+ XEC_LPM_PRE_REG_1MS);
+	writel(((v2 / 10 > 1) ? (v2 / 10) - 1 : 0), data->xhci_base
+		+ XEC_LPM_PRE_REG_10MS);
+	writel((v2 > 1 ? v2 - 1 : 0), data->xhci_base
+		+ XEC_LPM_PRE_REG_100MS);
+	val = readl(data->xhci_base + XEC_USBSSP_CLK_GATING_CTRL);
+	val |= HOST20_ACLK_GATING_DISABLE | HOST20_UTMI_GATING_DISABLE;
+	writel(val, data->xhci_base + XEC_USBSSP_CLK_GATING_CTRL);
+}
+
+static int cdnsp_sky1_drd_init(struct cdnsp_sky1 *data)
+{
+	int ret = 0;
+
+	reset_control_assert(data->reset);
+	reset_control_assert(data->preset);
+	cdnsp_sky1_clk_disable_all(data->dev);
+	ret = cdnsp_sky1_clk_enable_all(data->dev);
+	if (ret)
+		return ret;
+	writel(CIX_USB_AXI_WR_CACHE_VALUE, data->axi_base);
+	cdnsp_sky1_set_mode_by_id(data->dev, MODE_STRAP_OTG);
+	reset_control_deassert(data->preset);
+	cdnsp_sky1_configure_controller(data);
+	reset_control_deassert(data->reset);
+	return ret;
+}
+
+static void *sky1_of_get_addr_by_name(struct device_node *parent, char *name)
+{
+	struct device_node *node;
+	int index;
+
+	node = of_get_next_child(parent, NULL);
+	if (node) {
+		index = of_property_match_string(node, "reg-names", name);
+		if (index >= 0)
+			return of_iomap(node, index);
+	}
+	return NULL;
+}
+
+static void *sky1_get_addr_by_name(struct device *dev, char *name)
+{
+	return sky1_of_get_addr_by_name(dev->of_node, name);
+}
+
+static void sky1_put_addr(void __iomem *regs)
+{
+	if (regs)
+		iounmap(regs);
+}
+
+static struct of_dev_auxdata cdns_sky1_auxdata[] = {
+	{
+		.compatible = "cdns,usb3",
+	},
+	{},
+};
+
+static int cdnsp_sky1_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->of_node;
+	struct cdnsp_sky1 *data;
+	int ret = 0;
+	struct cdns3_platform_data *cdns_sky1_pdata;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+	data->axi_base = devm_platform_ioremap_resource_byname(pdev, "axi_property");
+	if (IS_ERR(data->axi_base)) {
+		dev_err(dev, "can't map IOMEM resource\n");
+		return PTR_ERR(data->axi_base);
+	}
+	data->ctst_base = devm_platform_ioremap_resource_byname(pdev, "controller_status");
+	if (IS_ERR(data->ctst_base)) {
+		dev_err(dev, "can't map IOMEM resource\n");
+		return PTR_ERR(data->ctst_base);
+	}
+	data->reset = devm_reset_control_get(&pdev->dev, "usb_reset");
+	if (IS_ERR(data->reset)) {
+		ret = PTR_ERR(data->reset);
+		dev_err(dev, "get reset error:%d\n", ret);
+		return ret;
+	}
+	data->preset = devm_reset_control_get(&pdev->dev, "usb_preset");
+	if (IS_ERR(data->preset)) {
+		ret = PTR_ERR(data->preset);
+		dev_err(dev, "get reset error:%d\n", ret);
+		return ret;
+	}
+	platform_set_drvdata(pdev, data);
+	data->dev = dev;
+	ret = of_alias_get_id(dev->of_node, "usb");
+	if (ret == -ENODEV) {
+		if (device_property_read_u32(dev, "id", &ret))
+			ret = -ENODEV;
+	}
+	if (ret < 0 || ret >=  SKY1_USB_S5_NUM) {
+		dev_err(dev, "get alias failed.\n");
+		return ret;
+	}
+	data->id = ret;
+	data->usb_syscon = syscon_regmap_lookup_by_phandle(dev->of_node,
+							   "cix,usb_syscon");
+	if (IS_ERR(data->usb_syscon)) {
+		dev_err(dev, "Unable to get cix,usb_syscon regmap");
+		return PTR_ERR(data->usb_syscon);
+	}
+	data->u3_disable = device_property_read_bool(dev, "u3-port-disable");
+	data->ssp_disable = device_property_read_bool(dev, "ssp-disable");
+	if (!device_property_read_u32(dev, "sof_clk_freq", &ret))
+		data->sof_clk_freq = ret;
+	else
+		data->sof_clk_freq = CIX_USB_CLK_32K;
+	if (!device_property_read_u32(dev, "lpm_clk_freq", &ret))
+		data->lpm_clk_freq = ret;
+	else
+		data->lpm_clk_freq = CIX_USB_CLK_8M;
+	if (!device_property_read_u32(dev, "axi_bmax_value", &ret))
+		data->axi_bmax_value = ret;
+	else
+		data->axi_bmax_value = AXI_BMAX_VALUE_DEFAULT;
+	data->xhci_base = sky1_get_addr_by_name(dev, "xhci");
+	if (!data->xhci_base)
+		return -ENODEV;
+	data->device_base = sky1_get_addr_by_name(dev, "dev");
+	if (!data->device_base)
+		return -ENODEV;
+	ret = cdnsp_sky1_drd_init(data);
+	if (ret == -ETIMEDOUT)
+		return -EPROBE_DEFER;
+	if (ret)
+		return ret;
+	data->oc_gpio = devm_gpiod_get_optional(data->dev, "oc", GPIOD_IN);
+	if (IS_ERR(data->oc_gpio)) {
+		dev_err(data->dev, "can not get oc_gpio\n");
+		ret = PTR_ERR(data->oc_gpio);
+		return ret;
+	}
+	if (data->oc_gpio) {
+		ret = gpiod_direction_input(data->oc_gpio);
+		if (ret < 0)
+			dev_err(data->dev, "set oc_gpio input failed:%d\n", ret);
+	}
+	/* release by platform_device_release */
+	cdns_sky1_pdata = kzalloc(sizeof(*cdns_sky1_pdata), GFP_KERNEL);
+	if (!cdns_sky1_pdata)
+		return -ENOMEM;
+	cdns_sky1_pdata->platform_suspend = cdns_sky1_platform_suspend;
+	cdns_sky1_pdata->quirks = CDNS3_DEFAULT_PM_RUNTIME_ALLOW;
+	cdns_sky1_auxdata->platform_data = cdns_sky1_pdata;
+	ret = of_platform_populate(node, NULL, cdns_sky1_auxdata, dev);
+	if (ret) {
+		dev_err(dev, "failed to create children: %d\n", ret);
+		goto err;
+	}
+	device_set_wakeup_capable(dev, true);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	return 0;
+err:
+	kfree(cdns_sky1_pdata);
+	return ret;
+}
+
+static void cdnsp_sky1_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cdnsp_sky1 *data = dev_get_drvdata(dev);
+
+	pm_runtime_get_sync(dev);
+	of_platform_depopulate(dev);
+	sky1_put_addr(data->xhci_base);
+	sky1_put_addr(data->device_base);
+	reset_control_deassert(data->reset);
+	reset_control_deassert(data->preset);
+	cdnsp_sky1_clk_disable_all(dev);
+	platform_set_drvdata(pdev, NULL);
+}
+
+#ifdef CONFIG_PM
+/* Because the wake-up interrupt and host interrupt are the same interrupt, closing the axi
+ * and sof clock will result in the inability to generate port status change interrupt.
+ */
+
+static int cdnsp_sky1_system_suspend(struct device *dev)
+{
+	struct cdnsp_sky1 *data = dev_get_drvdata(dev);
+
+	if (!data->wakeup) {
+		reset_control_assert(data->reset);
+		reset_control_assert(data->preset);
+	}
+	cdnsp_sky1_clk_disable_suspend(dev);
+	return 0;
+}
+
+static int cdnsp_sky1_system_resume(struct device *dev)
+{
+	int ret = 0;
+	struct cdnsp_sky1 *data = dev_get_drvdata(dev);
+
+	ret = cdnsp_sky1_clk_enable_resume(dev);
+	if (ret)
+		return ret;
+	if (!data->wakeup) {
+		writel(CIX_USB_AXI_WR_CACHE_VALUE, data->axi_base);
+		cdnsp_sky1_set_mode_by_id(data->dev, MODE_STRAP_OTG);
+		reset_control_deassert(data->preset);
+		cdnsp_sky1_configure_controller(data);
+		reset_control_deassert(data->reset);
+	}
+	return 0;
+}
+
+static const struct dev_pm_ops cdnsp_sky1_pm_ops = {
+	.suspend = cdnsp_sky1_system_suspend,
+	.resume = cdnsp_sky1_system_resume,
+};
+#endif /* CONFIG_PM */
+
+static const struct of_device_id cdns_sky1_of_match[] = {
+	{ .compatible = "cix,sky1-usbssp", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, cdns_sky1_of_match);
+
+static int cdnsp_sky1_find_cdns(struct device *dev, void *data)
+{
+	struct cdns **cdns_ptr = data;
+
+	if (dev->of_node && of_device_is_compatible(dev->of_node, "cdns,usb3")) {
+		*cdns_ptr = dev_get_drvdata(dev);
+		return 1;
+	}
+	return 0;
+}
+
+static int cdnsp_sky1_find_gadget_match(struct device *dev, void *data)
+{
+	struct device **gadget_dev = data;
+	const char *name = dev_name(dev);
+	static const char gadget_prefix[] = "gadget.";
+
+	/*
+	 * The gadget device is registered on the gadget bus with name
+	 * "gadget.%d" (see usb_add_gadget_udc -> dev_set_name).
+	 * It sits on the gadget bus and has the function driver bound to it.
+	 * Verify the device is on the gadget bus by checking the bus name.
+	 * This prevents matching devices that happen to have "gadget." prefix
+	 * in their name but are not real gadget devices, and also avoids
+	 * NULL pointer dereference when device bus is being removed.
+	 */
+	if (name && dev->bus && !strcmp(dev->bus->name, "gadget") &&
+	    !strncmp(name, gadget_prefix, sizeof(gadget_prefix) - 1)) {
+		*gadget_dev = dev;
+		return 1;
+	}
+	return 0;
+}
+
+static void cdnsp_sky1_shutdown(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cdnsp_sky1 *data = dev_get_drvdata(dev);
+	struct cdns *cdns = NULL;
+	struct device *gadget_dev = NULL;
+
+	if (!device_may_wakeup(dev)) {
+		/*
+		 * Find the cdns3 child device, then find its gadget device
+		 * and release the function driver before disabling clocks.
+		 * This ensures all register accesses in gadget_unbind_driver
+		 * complete before clocks are turned off.
+		 */
+		device_for_each_child(dev, &cdns, cdnsp_sky1_find_cdns);
+		if (cdns)
+			device_for_each_child(cdns->dev, &gadget_dev,
+					      cdnsp_sky1_find_gadget_match);
+		if (gadget_dev)
+			device_release_driver(gadget_dev);
+		if (cdns && cdns->host_dev) {
+			struct usb_hcd *hcd = platform_get_drvdata(cdns->host_dev);
+
+			if (hcd && hcd->irq > 0) {
+				disable_irq(hcd->irq);
+				synchronize_irq(hcd->irq);
+				/*
+				 * Clear HCD_FLAG_HW_ACCESSIBLE before disable_irq.
+				 * This prevents usb_hcd_irq from calling xhci_irq
+				 * (which reads USBSTS) after clocks are disabled.
+				 */
+				clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
+			}
+		}
+		reset_control_assert(data->reset);
+		reset_control_assert(data->preset);
+		cdnsp_sky1_clk_disable_all(dev);
+	}
+}
+
+static struct platform_driver cdnsp_sky1_driver = {
+	.probe		= cdnsp_sky1_probe,
+	.remove		= cdnsp_sky1_remove,
+	.shutdown	= cdnsp_sky1_shutdown,
+	.driver		= {
+		.name	= "cdnsp-sky1",
+		.of_match_table	= cdns_sky1_of_match,
+		.pm	= pm_ptr(&cdnsp_sky1_pm_ops),
+	},
+};
+
+module_platform_driver(cdnsp_sky1_driver);
+
+MODULE_ALIAS("platform:cdnsp-sky1");
+MODULE_DESCRIPTION("CIX Sky1 Cadence USBSSP DRD glue driver");
+MODULE_AUTHOR("Hongliang Yang <hongliang.yang@cixtech.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/usb/cdns3/cdnsp-sky1.h b/drivers/usb/cdns3/cdnsp-sky1.h
new file mode 100644
index 000000000000..49c3d5eab174
--- /dev/null
+++ b/drivers/usb/cdns3/cdnsp-sky1.h
@@ -0,0 +1,127 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _CDNSP_SKY1_H
+#define _CDNSP_SKY1_H
+#include <linux/clk.h>
+#include <linux/gpio/consumer.h>
+#include <linux/reset.h>
+
+#define USB_MODE_STRAP_S5_DOMAIN        0x424
+
+#define MODE_STRAP_OTG                  0
+
+#define U3_TYPEC_DRD_ID                 0
+#define U3_TYPEC_HOST0_ID               1
+#define U3_TYPEC_HOST1_ID               2
+#define U3_TYPEC_HOST2_ID               3
+#define U3_TYPEA_CTRL0_ID               4
+#define U3_TYPEA_CTRL1_ID               5
+#define U2_HOST0_ID                     6
+#define U2_HOST1_ID                     7
+#define U2_HOST2_ID                     8
+#define U2_HOST3_ID                     9
+#define SKY1_USB_S5_NUM                 10
+
+#define U3_TYPEC_DRD_MODE_STRAP_BIT     12
+#define U3_TYPEC_HOST0_MODE_STRAP_BIT   14
+#define U3_TYPEC_HOST1_MODE_STRAP_BIT   16
+#define U3_TYPEC_HOST2_MODE_STRAP_BIT   18
+#define U3_TYPEA_CTRL0_MODE_STRAP_BIT   8
+#define U3_TYPEA_CTRL1_MODE_STRAP_BIT   10
+#define U2_HOST0_MODE_STRAP_BIT         0
+#define U2_HOST1_MODE_STRAP_BIT         2
+#define U2_HOST2_MODE_STRAP_BIT         4
+#define U2_HOST3_MODE_STRAP_BIT         6
+
+#define AXI_HALT                        BIT(31)
+#define AXI_BMAX_VALUE_DEFAULT          0x7
+
+#define D_XEC_CFG_3XPORT_MODE           0x2040
+#define D_XEC_AXI_CAP                   0x2174
+#define D_XEC_AXI_CTRL0                 0x217C
+#define D_XEC_PRE_REG_250NS             0x21E8
+#define D_XEC_PRE_REG_1US               0x21EC
+#define D_XEC_PRE_REG_10US              0x21F0
+#define D_XEC_PRE_REG_100US             0x21F4
+#define D_XEC_PRE_REG_125US             0x21F8
+#define D_XEC_PRE_REG_1MS               0x21FC
+#define D_XEC_PRE_REG_10MS              0x2200
+#define D_XEC_PRE_REG_100MS             0x2204
+#define D_XEC_LPM_PRE_REG_250NS         0x2208
+#define D_XEC_LPM_PRE_REG_1US           0x220C
+#define D_XEC_LPM_PRE_REG_10US          0x2210
+#define D_XEC_LPM_PRE_REG_100US         0x2214
+#define D_XEC_LPM_PRE_REG_125US         0x2218
+#define D_XEC_LPM_PRE_REG_1MS           0x221C
+#define D_XEC_LPM_PRE_REG_10MS          0x2220
+#define D_XEC_LPM_PRE_REG_100MS         0x2224
+
+#define XEC_CFG_3XPORT_MODE             0x2040
+#define XEC_PRE_REG_250NS               0x21E8
+#define XEC_PRE_REG_1US                 0x21EC
+#define XEC_PRE_REG_10US                0x21F0
+#define XEC_PRE_REG_100US               0x21F4
+#define XEC_PRE_REG_125US               0x21F8
+#define XEC_PRE_REG_1MS                 0x21FC
+#define XEC_PRE_REG_10MS                0x2200
+#define XEC_PRE_REG_100MS               0x2204
+#define XEC_LPM_PRE_REG_250NS           0x2208
+#define XEC_LPM_PRE_REG_1US             0x220C
+#define XEC_LPM_PRE_REG_10US            0x2210
+#define XEC_LPM_PRE_REG_100US           0x2214
+#define XEC_LPM_PRE_REG_125US           0x2218
+#define XEC_LPM_PRE_REG_1MS             0x221C
+#define XEC_LPM_PRE_REG_10MS            0x2220
+#define XEC_LPM_PRE_REG_100MS           0x2224
+#define XEC_USBSSP_CHICKEN_BITS_3       0x2230
+#define XEC_USBSSP_CLK_GATING_CTRL      0x2234
+#define XECP_PM_PMCSR                   0x2240
+
+/* XEC_USBSSP_CLK_GATING_CTRL */
+#define HOST20_ACLK_GATING_DISABLE      BIT(4)
+#define HOST20_UTMI_GATING_DISABLE      BIT(5)
+
+/* XECP_PM_PMCSR */
+#define PS_MASK                         GENMASK(1, 0)
+#define PS_D0                           0
+#define PS_D3                           3
+#define PS_PME_En                       BIT(8)
+
+#define D_XEC_CFG_3XPORT_MODE_VALUE     0xa0031e07
+#define XEC_CFG_3XPORT_MODE_VALUE       0xa0031e07
+#define CFG_3XPORT_MODE_DIS_SSP         (~(1 << 31))
+
+#define CFG_APB_TIMEOUT_PSLVERR_EN      BIT(22)
+#define CFG_APB_PSLVERR_EN              BIT(23)
+
+#define CIX_USB_CLK_NUM                 (4)
+#define CIX_USB_CLK_OFF_NUM             (2)
+#define CIX_USB_AXI_WR_CACHE_VALUE      0x33
+#define CIX_USB_CLK_32K                 32000
+#define CIX_USB_CLK_8M                  8000000
+
+#define AXI_CLOCK_VALID                 BIT(1)
+
+struct cdnsp_sky1 {
+	struct device *dev;
+	void __iomem *axi_base;
+	void __iomem *ctst_base;
+	void __iomem *dr_base;
+	void __iomem *xhci_base;
+	void __iomem *device_base;
+	struct platform_device *cdnsp_pdev;
+	struct reset_control *reset;
+	struct reset_control *preset;
+	struct clk *cix_usb_clks[CIX_USB_CLK_NUM];
+	int id;
+	struct regmap	*usb_syscon;
+	int lpm_clk_freq;
+	int sof_clk_freq;
+	bool u3_disable;
+	bool ssp_disable;
+	int axi_bmax_value;
+	struct gpio_desc *oc_gpio;
+	bool wakeup;
+};
+
+#endif /* _CDNSP_SKY1_H */
-- 
2.54.0

