Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazhn15013060.outbound.protection.outlook.com [52.102.179.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741813B71A9;
	Fri, 16 Oct 2026 15:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.179.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792164384; cv=fail; b=rH5hq/b8217jBbon1EFUTOP4Qp8Ll8pHkdfalr7Y/oS+sSz5KHaNwy0oXSgK0ah+5nibcXsLWwNM70Yr9ZT0zcrhgO+XCxG2J+vax3EP3Szpf/DlcuzHAi9JoRXzabhq4Bn0Z93Na+ybU7zTnH8UMHoL9catM93XDVi5TE4mGDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792164384; c=relaxed/simple;
	bh=ytlcwhJxUnZZUT4U4Mvj99O4foR65pJ13sbGtH/tCjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=aVQQCkeqcrMtdOEEoo3qNsIDpInyeirowxB0QW1aKP2CHvoNbepdRRsil85X5nKXegxqq6lh+Y9pjdwuosn1L2py1g2/ELKEPLQdphd8VswAGl4gfJ5kFLD83br1NZIkBrLYdYg30sQXAHje9IiIYVTUk/MDxf/TEPnHZ/DThUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=RYrFrXSr; arc=fail smtp.client-ip=52.102.179.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="RYrFrXSr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jhcv08NG0o50E+AXMr1lKfqJV1UTEt0RkM15Rz6c8AOfKBR+cPg7/1wAkrGD8krrTXhSdjcGFZ5UD6PqT48hd7o+M0kg1SnLyNfv/m/+Gb//qtzBIG2N3n0UgPDLXhErhgpvV/ZDzU/50vGBjMbQz4z/9oJlAelwCCZWip7dG4EmVo2fo7htQdeZR78FYRQLEBn4ESkXCJTX48OcSTixzVK0nHHKsF5EBFi3ugjAOD2Kk4oLyUGk1w3GdmXj71CSiTlCHwRu8+VfBXbvcu5+pU1oxSjcdwnOji2Azz6kf6M3GMDony7Pz6eicfsKwMMsU2/oTlxj7hojjY//N4wdqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=axHoqg9qAQIcVGo7wNY1pC6brrgMqhcOkfR10xE/Y9g=;
 b=iIAudwCKAywTaTbYf/Jiwbt3dap5rtRWTZGH9y03q9pT8AuLaQGZ0ijbuT02UjerwWZGI8Xq8+02X05fC0IyXOLFtLZQujLGEFBl9g8fzASS0QZCceYoDCJz8kbjUKyYWYks0L6M2RJLwS5xAkJPWIPeyROMGIeSW5LULq2OIyrh5w3/YSu6H5i/D//LYtvH1xZhHxwrLiUu62ZT/eF+IEv/5jWxPNTVsIju0yCV50JJF4uixEt0m2LxIMXi51qN0F35jS4fSot5o3bpqJgsNm9tBasFIAhPjbk8uDUBvaa+T2avYLi1xFV70m4rCw+cybEv2REdKkPOhXNLFiWNTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=axHoqg9qAQIcVGo7wNY1pC6brrgMqhcOkfR10xE/Y9g=;
 b=RYrFrXSr+EhYrYcGhbCNmJ3xXwUxoZb4vlND2PfVCAe012nj8uynaYr+D3FICK0qPuYn5TWGzEGLaaQmBrESFzVBnPicAssyjsZKw0o3Gz/aBokx6SBHl9yoUgR84ZlXczxfwxiQRGaqDhWFGH41/MgQPgfdXziPMP7D6puRoptfQ5escluj8ClIffHbkqnYoukFSTMJcH9Z4X2GY0r45hlPtZuOQHTO+FIv772ZDJrsrNT4tRnItoowY63CNreaP4J+vHRtmrqsMR/Jf2omxXp7x1OtMD9W9f52204x6pjox35U4GxJzgqVB8eraiO7AYdF2Q+jd9449T5LqduEPQ==
Received: from AS4PR09CA0010.eurprd09.prod.outlook.com (2603:10a6:20b:5e0::14)
 by PAWPR10MB7270.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2ec::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Fri, 16 Oct
 2026 15:26:14 +0000
Received: from AMS1EPF00000098.eurprd02.prod.outlook.com
 (2603:10a6:20b:5e0:cafe::8) by AS4PR09CA0010.outlook.office365.com
 (2603:10a6:20b:5e0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.21 via Frontend Transport; Fri,
 16 Oct 2026 15:26:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF00000098.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 16 Oct 2026 15:26:13 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 16 Oct
 2026 17:26:29 +0200
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 16 Oct
 2026 17:26:12 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Fri, 16 Oct 2026 17:26:05 +0200
Subject: [PATCH v3 3/3] nvmem: stm32: add TAMP nvmem driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261016-upstream_nvram_reworked-v3-3-f65908490cf7@foss.st.com>
References: <20261016-upstream_nvram_reworked-v3-0-f65908490cf7@foss.st.com>
In-Reply-To: <20261016-upstream_nvram_reworked-v3-0-f65908490cf7@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla
	<srini@kernel.org>
CC: Simeon Marijon <simeon.marijon@foss.st.com>,
	<linux-stm32@st-md-mailman.stormreply.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>, Gatien Chevallier
	<gatien.chevallier@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000098:EE_|PAWPR10MB7270:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dd240a0-e721-4496-2fef-08df2b99d074
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|34020700016|376014|36860700016|23010399003|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003|6133799003|12100799066;
X-Microsoft-Antispam-Message-Info:
	BTdDlEwJtYbMsB6paYhz/wBFOv4vnXgkWp0xOMxUsp3TweldzsFTg5jNeGknc0/3BmrBuDSkeJu+mLguQBEb25PIHFeXPIh9OyLlQUjf9l7X7C3fUkcwTF0vQoxy0qmN9NJsGWb5MPq0Kl72tlTxWCBisqKfM4QxUGp8BWYS+Ormg7pynWJdRq8eHBh1Vnyz1FTz9rIqK8BEndcQrFqqZ2KPtg50OHaBPUAzX9P/j3JFn2xwqg+QVnoseEmF50K8il4qpp7m4QJXVz4ngyuMFcJYIl2JKsQMW9Fm+WuXv84yoN7e+HNnbcXBFJq0eevweaubsL9CUA9GZm+uyp8eiX8ed3MYAGWCNHeI1ZstOwTfBor/g0ubifSx0LFUvL8vGfhp2VadP0Oel1S8KIrICgZshlOwPf05hSgyP33guXCJyEhd8mLpSYHcGyYPVMIt+Ww1QqmQGKNwDo+H1kdIpOMMzhzsUUKzMkTbNFGxSr3SlM+yRyj665rHyDOYYI3zkGQTdicVL3yXvJTPnnJDoCkRQwrqNs8FLTWb6GtYP9dS2VjRAtZuHWnCvp6oRHvsIw2ziushw4+ZEYuJ3/oDEu8+Wb4xnOdAJtrefH6RkrzZbFj6zxNIULjOQe+QuflZel1HZ97UtrMWhANcJ7KmWDG/6ifZJAO3SMOylpH0FiiAH7CE2KBWzTNsaqHdKnvFNxo1BCAKCL01K0YpSNZHlg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(34020700016)(376014)(36860700016)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	P6dSnWCbDAgB41Hupr2Bd52YpYFFCleGMV4pr6J2xL4YkrPXHpTI3qSc5s+2NGqW2rw14dx/wXTYvS2x1TFKcg2+DPvWidW0cVL1sVfXxS+8oS/2UMd7uocp8mzQKk5iXj1HuwQj3Wx6Vd+iMtQVc0gHo7Cap5s6kKHQ/HfMA1CiGC1Jyq9Og1fQs4cDY4QcCP+9aMtpJ6SPXYjV1LXc8qP2Vw+MrPH9zxYpL8WpmITX5pX7x86SbZXsuirJzSdKzkaFr0WPg+MrwISAn6NRiv8pJB8B3GJdK8NUlMH/RwxnvhOvd74nHqD+2WvHJ6WJC4l1ZZAVoMHu/JYUacqJVZxSObTKJzKeefk/W2f5zgKJ27avaBxti66eAJ2FwNA5HmYTYeS/3ixCJbHHlaczxtP6UUqu5mpReHhvBrUPRvzo/GPY/5YduXNNw/84jPfd
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 15:26:13.6241
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd240a0-e721-4496-2fef-08df2b99d074
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000098.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7270

From: Simeon Marijon <simeon.marijon@foss.st.com>

TAMP backup registers will be exposed as nvmem cells.

Each registers ([0..127] for STM32MP2, [0..31] for STM32MP1) could be
exposed as nvmem cells under the nvram node in device tree.

Signed-off-by: Simeon Marijon <simeon.marijon@foss.st.com>
Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 MAINTAINERS                      |   1 +
 drivers/nvmem/Kconfig            |  10 +
 drivers/nvmem/Makefile           |   2 +
 drivers/nvmem/stm32-tamp-nvram.c | 741 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 754 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b634c037c229..63c69f8a93f0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26267,6 +26267,7 @@ M:	Patrice Chotard <patrice.chotard@foss.st.com>
 L:	linux-stm32@st-md-mailman.stormreply.com (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml
+F:	drivers/nvmem/stm32-tamp-nvram.c
 
 STM32 TIMER/LPTIMER DRIVERS
 M:	Fabrice Gasnier <fabrice.gasnier@foss.st.com>
diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index c36c2a4c2a0b..1d71d0097bc2 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -504,6 +504,16 @@ config NVMEM_STM32_ROMEM
 	  This driver can also be built as a module. If so, the module
 	  will be called nvmem-stm32-romem.
 
+config NVMEM_STM32_TAMP
+	tristate "STMicroelectronics STM32 TAMP backup registers support"
+	depends on ARCH_STM32 || COMPILE_TEST
+	help
+	  Say y here to enable access for STMicroelectronics STM32
+	  TAMP backup registers.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called nvmem_stm32_tamp_nvram
+
 config NVMEM_SUNPLUS_OCOTP
 	tristate "Sunplus SoC OTP support"
 	depends on SOC_SP7021 || COMPILE_TEST
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 2bbfb9ff1885..2e9c55d1855a 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -86,6 +86,8 @@ nvmem_sprd_efuse-y			:= sprd-efuse.o
 obj-$(CONFIG_NVMEM_STM32_ROMEM)		+= nvmem_stm32_romem.o
 nvmem_stm32_romem-y 			:= stm32-romem.o
 nvmem_stm32_romem-$(CONFIG_NVMEM_STM32_BSEC_OPTEE_TA) += stm32-bsec-optee-ta.o
+obj-$(CONFIG_NVMEM_STM32_TAMP)		+= nvmem_stm32_tamp_nvram.o
+nvmem_stm32_tamp_nvram-y 		:= stm32-tamp-nvram.o
 obj-$(CONFIG_NVMEM_SUNPLUS_OCOTP)	+= nvmem_sunplus_ocotp.o
 nvmem_sunplus_ocotp-y			:= sunplus-ocotp.o
 obj-$(CONFIG_NVMEM_SUNXI_SID)		+= nvmem_sunxi_sid.o
diff --git a/drivers/nvmem/stm32-tamp-nvram.c b/drivers/nvmem/stm32-tamp-nvram.c
new file mode 100644
index 000000000000..a4b599fc0b37
--- /dev/null
+++ b/drivers/nvmem/stm32-tamp-nvram.c
@@ -0,0 +1,741 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * STM32 Tamp backup registers access driver
+ *
+ * Copyright (C) 2026, STMicroelectronics - All Rights Reserved
+ * Author: Simeon Marijon <simeon.marijon@foss.st.com> for STMicroelectronics.
+ */
+
+#include <linux/align.h>
+#include <linux/bits.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/mfd/syscon.h>
+#include <linux/nvmem-provider.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/unaligned.h>
+
+#define RIF_CID1			0x1
+#define CURRENT_CID			RIF_CID1
+#define NB_ZONES_STM32MP1		3
+#define NB_ZONES_STM32MP2		7
+#define NB_REGS_STM32MP1		32
+#define NB_REGS_STM32MP2		128
+
+#define _TAMP_SECCFGR			0x20U
+#define _TAMP_BKPRIFR(x)		(0x70U + 0x4U * ((x) - 1))
+#define _TAMP_RXCIDCFGR(x)		(0x80U + 0x4U * ((x)))
+
+#define BKPREG_PROTECTION_ZONE_1	0
+#define BKPREG_PROTECTION_ZONE_2	1
+#define BKPREG_PROTECTION_ZONE_3	2
+
+#define BKPREG_PROTECTION_ZONE_1_RIF1	0
+#define BKPREG_PROTECTION_ZONE_1_RIF2	1
+#define BKPREG_PROTECTION_ZONE_2_RIF1	2
+#define BKPREG_PROTECTION_ZONE_2_RIF2	3
+#define BKPREG_PROTECTION_ZONE_3_RIF1	4
+#define BKPREG_PROTECTION_ZONE_3_RIF0	5
+#define BKPREG_PROTECTION_ZONE_3_RIF2	6
+#define NB_COMPARTMENT_STM32MP2		3
+
+enum stm32_tamp_bkpreg_access {
+	BKP_READ_WRITE,
+	BKP_READ,
+	BKP_NO
+};
+
+struct stm32_tamp_nvram_priv {
+	struct nvmem_config cfg;
+	const struct stm32_tamp_nvram_plat *data;
+	int *idx_bkpreg_zones_end;
+	struct device *dev;
+	struct regmap *config_regmap;
+	struct regmap *bkpregs_regmap;
+	enum stm32_tamp_bkpreg_access *bkpreg_access;
+};
+
+struct stm32_tamp_nvram_plat {
+	const unsigned int nb_zones;
+	const unsigned int nb_regs;
+	const struct regmap_config *bkpregs_regmap_cfg;
+	const struct reg_field *config_reg_fields;
+};
+
+static const struct reg_field stm32mp1_tamp_nvram_zone_cfg_fields[NB_ZONES_STM32MP1 - 1] = {
+	[BKPREG_PROTECTION_ZONE_1] = REG_FIELD(_TAMP_SECCFGR, 0, 7),
+	[BKPREG_PROTECTION_ZONE_2] = REG_FIELD(_TAMP_SECCFGR, 16, 23),
+};
+
+static const struct reg_field stm32mp25_tamp_nvram_zone_cfg_fields[NB_ZONES_STM32MP2 - 1] = {
+	[BKPREG_PROTECTION_ZONE_1_RIF1] = REG_FIELD(_TAMP_BKPRIFR(1), 0,  7),
+	[BKPREG_PROTECTION_ZONE_1_RIF2] = REG_FIELD(_TAMP_SECCFGR,    0,  7),
+	[BKPREG_PROTECTION_ZONE_2_RIF1] = REG_FIELD(_TAMP_BKPRIFR(2), 0,  7),
+	[BKPREG_PROTECTION_ZONE_2_RIF2] = REG_FIELD(_TAMP_SECCFGR,   16, 23),
+	[BKPREG_PROTECTION_ZONE_3_RIF1] = REG_FIELD(_TAMP_BKPRIFR(3), 0,  7),
+	[BKPREG_PROTECTION_ZONE_3_RIF0] = REG_FIELD(_TAMP_BKPRIFR(3), 16, 23),
+};
+
+static const struct reg_field stm32mp25_tamp_nvram_rxcidcfg_cfen_fields[NB_COMPARTMENT_STM32MP2] = {
+	REG_FIELD(_TAMP_RXCIDCFGR(0), 0, 0),
+	REG_FIELD(_TAMP_RXCIDCFGR(1), 0, 0),
+	REG_FIELD(_TAMP_RXCIDCFGR(2), 0, 0),
+};
+
+static const struct reg_field stm32mp25_tamp_nvram_rxcidcfg_fields[NB_COMPARTMENT_STM32MP2] = {
+	REG_FIELD(_TAMP_RXCIDCFGR(0), 4, 6),
+	REG_FIELD(_TAMP_RXCIDCFGR(1), 4, 6),
+	REG_FIELD(_TAMP_RXCIDCFGR(2), 4, 6),
+};
+
+static enum stm32_tamp_bkpreg_access stm32mp1_tamp_bkpreg_access[NB_ZONES_STM32MP1] = {
+	[BKPREG_PROTECTION_ZONE_1] = BKP_NO,
+	[BKPREG_PROTECTION_ZONE_2] = BKP_READ,
+	[BKPREG_PROTECTION_ZONE_3] = BKP_READ_WRITE,
+};
+
+static int stm32_tamp_is_compartment_isolation_enabled_mp2x(struct stm32_tamp_nvram_priv *priv)
+{
+	int nb_compartment_enabled = 0;
+	struct device *dev = priv->dev;
+	u32 cfen;
+	struct regmap_field *cfen_field;
+
+	for (int i = 0; i < NB_COMPARTMENT_STM32MP2; i++) {
+		cfen_field = devm_regmap_field_alloc(dev,
+						     priv->config_regmap,
+						     stm32mp25_tamp_nvram_rxcidcfg_cfen_fields[i]);
+		if (IS_ERR(cfen_field)) {
+			dev_err(dev, "Can't allocate field for reading configuration\n");
+			return PTR_ERR(cfen_field);
+		}
+
+		if (regmap_field_read(cfen_field, &cfen)) {
+			dev_err(dev, "Can't read field for registers zones\n");
+			devm_regmap_field_free(dev, cfen_field);
+			return -EINVAL;
+		}
+
+		nb_compartment_enabled += cfen;
+		devm_regmap_field_free(dev, cfen_field);
+	}
+
+	if (!nb_compartment_enabled)
+		return 0;
+	else if (nb_compartment_enabled == NB_COMPARTMENT_STM32MP2)
+		return 1;
+	else
+		return -EINVAL;
+}
+
+static bool *stm32_tamp_get_compartment_owner_mp2x(struct stm32_tamp_nvram_priv *priv)
+{
+	struct device *dev = priv->dev;
+	struct regmap_field *cid_field;
+	u32 cid_per_zone;
+	int isolation_enabled;
+	bool *compartment_owner;
+
+	isolation_enabled = stm32_tamp_is_compartment_isolation_enabled_mp2x(priv);
+	if (isolation_enabled < 0)
+		return ERR_PTR(-EINVAL);
+
+	compartment_owner = kcalloc(NB_COMPARTMENT_STM32MP2,
+				    sizeof(*compartment_owner),
+				    GFP_KERNEL);
+
+	if (!compartment_owner)
+		return ERR_PTR(-ENOMEM);
+
+	for (int i = 0; i < NB_COMPARTMENT_STM32MP2; i++) {
+		if (isolation_enabled) {
+			cid_field = devm_regmap_field_alloc(dev,
+							    priv->config_regmap,
+							    stm32mp25_tamp_nvram_rxcidcfg_fields[i]
+							    );
+			if (IS_ERR(cid_field)) {
+				kfree(compartment_owner);
+				return ERR_PTR(-ENOMEM);
+			}
+
+			if (regmap_field_read(cid_field, &cid_per_zone)) {
+				dev_err(dev, "Can't read field for registers zones\n");
+				devm_regmap_field_free(dev, cid_field);
+				kfree(compartment_owner);
+				return ERR_PTR(-EINVAL);
+			}
+
+			if (cid_per_zone == CURRENT_CID)
+				compartment_owner[i] = true;
+			else
+				compartment_owner[i] = false;
+
+			devm_regmap_field_free(dev, cid_field);
+		} else {
+			compartment_owner[i] = true;
+		}
+	}
+
+	return compartment_owner;
+}
+
+static enum stm32_tamp_bkpreg_access *stm32_tamp_get_access_rights_mp2x(struct stm32_tamp_nvram_priv
+									*priv)
+{
+	struct device *dev = priv->dev;
+	unsigned int nb_zones = priv->data->nb_zones;
+	bool *compartment_owner;
+	enum stm32_tamp_bkpreg_access *bkpreg_access;
+
+	compartment_owner = stm32_tamp_get_compartment_owner_mp2x(priv);
+	if (IS_ERR(compartment_owner))
+		return ERR_PTR(-ENODEV);
+
+	bkpreg_access = devm_kcalloc(dev,
+				     NB_ZONES_STM32MP2,
+				     sizeof(*bkpreg_access),
+				     GFP_KERNEL);
+
+	if (!bkpreg_access) {
+		kfree(compartment_owner);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	for (int protection_zone_idx = 0; protection_zone_idx < nb_zones;
+	     protection_zone_idx++) {
+		switch (protection_zone_idx) {
+		case BKPREG_PROTECTION_ZONE_1_RIF1:
+			bkpreg_access[protection_zone_idx] = BKP_NO;
+			break;
+		case BKPREG_PROTECTION_ZONE_1_RIF2:
+			bkpreg_access[protection_zone_idx] = BKP_NO;
+			break;
+		case BKPREG_PROTECTION_ZONE_2_RIF1:
+			if (compartment_owner[1] || compartment_owner[2])
+				bkpreg_access[protection_zone_idx] = BKP_READ;
+			else
+				bkpreg_access[protection_zone_idx] = BKP_NO;
+			break;
+		case BKPREG_PROTECTION_ZONE_2_RIF2:
+			if (compartment_owner[1] || compartment_owner[2])
+				bkpreg_access[protection_zone_idx] = BKP_READ;
+			else
+				bkpreg_access[protection_zone_idx] = BKP_NO;
+			break;
+		case BKPREG_PROTECTION_ZONE_3_RIF1:
+			if (compartment_owner[1])
+				bkpreg_access[protection_zone_idx] = BKP_READ_WRITE;
+			else if (compartment_owner[0] || compartment_owner[2])
+				bkpreg_access[protection_zone_idx] = BKP_READ;
+			else
+				bkpreg_access[protection_zone_idx] = BKP_NO;
+			break;
+		case BKPREG_PROTECTION_ZONE_3_RIF0:
+			if (compartment_owner[0])
+				bkpreg_access[protection_zone_idx] = BKP_READ_WRITE;
+			else if (compartment_owner[1] || compartment_owner[2])
+				bkpreg_access[protection_zone_idx] = BKP_READ;
+			else
+				bkpreg_access[protection_zone_idx] = BKP_NO;
+			break;
+		case BKPREG_PROTECTION_ZONE_3_RIF2:
+			if (compartment_owner[2])
+				bkpreg_access[protection_zone_idx] = BKP_READ_WRITE;
+			else if (compartment_owner[0] || compartment_owner[1])
+				bkpreg_access[protection_zone_idx] = BKP_READ;
+			else
+				bkpreg_access[protection_zone_idx] = BKP_NO;
+			break;
+		default:
+			devm_kfree(dev, bkpreg_access);
+			kfree(compartment_owner);
+			return ERR_PTR(-ENODEV);
+		}
+	}
+
+	kfree(compartment_owner);
+
+	return bkpreg_access;
+}
+
+static int stm32_tamp_nvram_bkpreg_get_zone(struct stm32_tamp_nvram_priv *priv, int reg)
+{
+	int *idx_bkpreg_zones_end = priv->idx_bkpreg_zones_end;
+	int nb_zones = priv->data->nb_zones;
+	int protection_zone_idx;
+
+	if (reg < 0)
+		return -1; /* negative reg is the boundary of an empty zone */
+
+	for (protection_zone_idx = 0; protection_zone_idx < nb_zones; protection_zone_idx++) {
+		if (reg <= idx_bkpreg_zones_end[protection_zone_idx])
+			break;
+	}
+
+	if (protection_zone_idx >= nb_zones)
+		return -1; /* the reg is not a part of any zone */
+
+	return protection_zone_idx;
+}
+
+static bool stm32_tamp_nvram_rights(struct stm32_tamp_nvram_priv *priv, int reg, bool read_only)
+{
+	struct device *dev = priv->dev;
+	int protection_zone_idx = stm32_tamp_nvram_bkpreg_get_zone(priv, reg);
+
+	if (protection_zone_idx < 0)
+		return false;
+
+	switch (priv->bkpreg_access[protection_zone_idx]) {
+	case BKP_READ_WRITE:
+		return true;
+	case BKP_READ:
+		return read_only;
+	case BKP_NO:
+		return false;
+	default:
+		dev_err(dev, "Can't get access rights for the zone\n");
+		return false;
+	}
+
+	return false;
+}
+
+static bool stm32_tamp_nvram_readable_bkpreg(struct device *dev, unsigned int reg)
+{
+	struct stm32_tamp_nvram_priv *priv = dev_get_drvdata(dev);
+
+	if (!priv)
+		return false;
+
+	if (!stm32_tamp_nvram_rights(priv, ALIGN_DOWN(reg, sizeof(u32)) / sizeof(u32), true))
+		return false;
+
+	return true;
+}
+
+static bool stm32_tamp_nvram_writeable_bkpreg(struct device *dev, unsigned int reg)
+{
+	struct stm32_tamp_nvram_priv *priv = dev_get_drvdata(dev);
+
+	if (!priv)
+		return false;
+
+	if (!stm32_tamp_nvram_rights(priv, ALIGN_DOWN(reg, sizeof(u32)) / sizeof(u32), false))
+		return false;
+
+	return true;
+}
+
+static const struct regmap_config stm32mp1_tamp_nvram_regmap_cfg = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.readable_reg = stm32_tamp_nvram_readable_bkpreg,
+	.writeable_reg = stm32_tamp_nvram_writeable_bkpreg,
+	.max_register = (NB_REGS_STM32MP1 - 1) * sizeof(u32), /* 0x7C */
+};
+
+static const struct regmap_config stm32mp2_tamp_nvram_regmap_cfg = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.readable_reg = stm32_tamp_nvram_readable_bkpreg,
+	.writeable_reg = stm32_tamp_nvram_writeable_bkpreg,
+	.max_register = (NB_REGS_STM32MP2 - 1) * sizeof(u32), /* 0x1FC */
+};
+
+static const struct stm32_tamp_nvram_plat stm32mp1_tamp_nvram = {
+	.nb_zones = NB_ZONES_STM32MP1,
+	.nb_regs = NB_REGS_STM32MP1,
+	.bkpregs_regmap_cfg = &stm32mp1_tamp_nvram_regmap_cfg,
+	.config_reg_fields = stm32mp1_tamp_nvram_zone_cfg_fields,
+};
+
+static const struct stm32_tamp_nvram_plat stm32mp25_tamp_nvram = {
+	.nb_zones = NB_ZONES_STM32MP2,
+	.nb_regs = NB_REGS_STM32MP2,
+	.bkpregs_regmap_cfg = &stm32mp2_tamp_nvram_regmap_cfg,
+	.config_reg_fields = stm32mp25_tamp_nvram_zone_cfg_fields,
+};
+
+static int stm32_tamp_nvram_write_byte(struct stm32_tamp_nvram_priv *priv, u32 offset, u8 byte)
+{
+	int offset_aligned = ALIGN_DOWN(offset, sizeof(u32));
+	unsigned int shift = (offset - offset_aligned) * 8;
+	u32 reg_idx = offset_aligned / sizeof(u32);
+
+	if (!stm32_tamp_nvram_rights(priv, reg_idx, false))
+		return -EACCES;
+
+	return regmap_update_bits(priv->bkpregs_regmap, offset_aligned,
+				  0xFFUL << shift, (u32)byte << shift);
+}
+
+static int stm32_tamp_nvram_read_byte(struct stm32_tamp_nvram_priv *priv, u32 offset, u8 *byte)
+{
+	int offset_aligned = ALIGN_DOWN(offset, sizeof(u32));
+	int byte_in_word = offset - offset_aligned;
+	u32 read_value;
+	u32 reg_idx = offset_aligned / sizeof(u32);
+	int ret;
+
+	if (!stm32_tamp_nvram_rights(priv, reg_idx, true))
+		return -EACCES;
+
+	ret = regmap_read(priv->bkpregs_regmap, offset_aligned, &read_value);
+	if (ret)
+		return ret;
+
+	*byte = (read_value >> (byte_in_word * 8)) & 0xFF;
+
+	return 0;
+}
+
+static int stm32_tamp_nvram_read(void *context, unsigned int offset, void *buf, size_t bytes)
+{
+	struct stm32_tamp_nvram_priv *priv = context;
+	struct device *dev = priv->dev;
+	u32 temp_u32;
+	u32 reg_idx;
+	int i, ret;
+	size_t total = offset + bytes;
+	u8 byte;
+	u8 *buf_u8 = buf;
+
+	i = offset;
+	while (i < total)  {
+		reg_idx = i / sizeof(u32);
+		if (i + sizeof(u32) <= total && IS_ALIGNED(i, sizeof(u32))) {
+			if (!stm32_tamp_nvram_rights(priv, reg_idx, true)) {
+				dev_dbg(dev, "Backup register %u is not allowed to be read\n",
+					reg_idx);
+				temp_u32 = 0;
+			} else {
+				ret = regmap_read(priv->bkpregs_regmap, i, &temp_u32);
+				if (ret)
+					return ret;
+			}
+			put_unaligned_le32(temp_u32, buf_u8);
+			buf_u8 += sizeof(u32);
+			i += sizeof(u32);
+		} else {
+			ret = stm32_tamp_nvram_read_byte(priv, i, &byte);
+			if (ret == -EACCES) {
+				dev_dbg(dev, "Backup register %u is not allowed to be read\n",
+					reg_idx);
+				byte = 0;
+			} else if (ret) {
+				return ret;
+			}
+
+			*buf_u8 = byte;
+			i++;
+			buf_u8++;
+		}
+	}
+
+	return 0;
+}
+
+static int stm32_tamp_nvram_write(void *context, unsigned int offset, void *buf, size_t bytes)
+{
+	struct stm32_tamp_nvram_priv *priv = context;
+	struct device *dev = priv->dev;
+	u32 temp_u32;
+	u32 reg_idx;
+	int i, ret;
+	size_t total = offset + bytes;
+	u8 *buf_u8 = (u8 *)buf;
+
+	i = offset;
+	while (i < total)  {
+		reg_idx = i / sizeof(u32);
+		if (i + sizeof(u32) <= total && IS_ALIGNED(i, sizeof(u32))) {
+			if (stm32_tamp_nvram_rights(priv, reg_idx, false)) {
+				temp_u32 = get_unaligned_le32(buf_u8);
+				ret = regmap_write(priv->bkpregs_regmap, i, temp_u32);
+				if (ret)
+					return ret;
+			} else {
+				dev_dbg(dev, "Backup register %u is not allowed to be written\n",
+					reg_idx);
+			}
+			buf_u8 += sizeof(u32);
+			i += sizeof(u32);
+		} else {
+			ret = stm32_tamp_nvram_write_byte(priv, i, *buf_u8);
+			if (ret == -EACCES) {
+				dev_dbg(dev, "Backup register %u is not allowed to be written\n",
+					reg_idx);
+			} else if (ret) {
+				return ret;
+			}
+
+			i++;
+			buf_u8++;
+		}
+	}
+
+	return 0;
+}
+
+static int *stm32_tamp_nvram_get_backup_zones(struct stm32_tamp_nvram_priv *priv)
+{
+	struct device *dev = priv->dev;
+	struct regmap *tamp_regmap = priv->config_regmap;
+	u32 offset_field;
+	int nb_zones = priv->data->nb_zones;
+	int zone_idx;
+	int *idx_bkpreg_zones_end;
+
+	idx_bkpreg_zones_end = devm_kcalloc(dev,
+					    nb_zones,
+					    sizeof(*idx_bkpreg_zones_end),
+					    GFP_KERNEL);
+	if (!idx_bkpreg_zones_end) {
+		dev_err(dev, "Can't allocate registers zones\n");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	/* Get the n-1 frontiers of zone within the tamp configuration registers */
+	for (zone_idx = 0; zone_idx < nb_zones - 1; zone_idx++) {
+		const struct reg_field reg_field = priv->data->config_reg_fields[zone_idx];
+		struct regmap_field *field;
+		int ret;
+
+		field = devm_regmap_field_alloc(dev, tamp_regmap, reg_field);
+		if (IS_ERR(field)) {
+			dev_err(dev, "Can't allocate registers zones\n");
+			devm_kfree(dev, idx_bkpreg_zones_end);
+			return ERR_CAST(field);
+		}
+
+		ret = regmap_field_read(field, &offset_field);
+		devm_regmap_field_free(dev, field);
+		if (ret) {
+			dev_err(dev, "Can't read field for registers zones\n");
+			devm_kfree(dev, idx_bkpreg_zones_end);
+			return ERR_PTR(ret);
+		}
+
+		idx_bkpreg_zones_end[zone_idx] = offset_field - 1;
+	}
+
+	/* The last zone end is defined by the number of registers in TAMP */
+	idx_bkpreg_zones_end[zone_idx] = priv->data->nb_regs - 1;
+
+	return idx_bkpreg_zones_end;
+}
+
+static const struct of_device_id stm32_tamp_nvram_of_match[] = {
+	{ .compatible = "st,stm32mp15-tamp-nvram",
+	  .data = &stm32mp1_tamp_nvram },
+	{ .compatible = "st,stm32mp25-tamp-nvram",
+	  .data = &stm32mp25_tamp_nvram },
+	{},
+};
+
+static int stm32_tamp_nvram_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct stm32_tamp_nvram_priv *priv;
+	struct resource *res;
+	struct device_node *of_node;
+	const struct of_device_id *of_id;
+	void __iomem *base_addr;
+	int *zones_end;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = &pdev->dev;
+
+	of_node = dev_of_node(dev);
+	if (!of_node) {
+		dev_err(dev, "Can't get of node of the device\n");
+		return -ENODEV;
+	}
+
+	of_id = of_match_node(stm32_tamp_nvram_of_match, of_node);
+	if (!of_id) {
+		dev_err(dev, "Can't get of_id of the device\n");
+		return -ENODEV;
+	}
+
+	priv->data = (struct stm32_tamp_nvram_plat *)of_id->data;
+	if (!priv->data) {
+		dev_err(dev, "Can't get platform data of the node\n");
+		return -ENODEV;
+	}
+
+	priv->config_regmap = syscon_node_to_regmap(dev->parent->of_node);
+	if (IS_ERR(priv->config_regmap))
+		return dev_err_probe(dev, PTR_ERR(priv->config_regmap),
+				     "Can't get TAMP syscon regmap\n");
+
+	priv->idx_bkpreg_zones_end = stm32_tamp_nvram_get_backup_zones(priv);
+	if (IS_ERR(priv->idx_bkpreg_zones_end))
+		return dev_err_probe(dev, PTR_ERR(priv->idx_bkpreg_zones_end),
+				     "Can't determine protection zone\n");
+
+	zones_end = priv->idx_bkpreg_zones_end;
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+
+	if (!res) {
+		dev_err(dev, "Can't get resource\n");
+		return -ENODEV;
+	}
+
+	base_addr = devm_ioremap_resource(dev, res);
+	if (IS_ERR(base_addr)) {
+		dev_err(dev, "Can't remap resource\n");
+		return PTR_ERR(base_addr);
+	}
+
+	priv->cfg.name = "stm32-tamp-nvram";
+	priv->cfg.word_size = 1;
+	priv->cfg.stride = 1;
+	priv->cfg.dev = dev;
+	priv->cfg.priv = priv;
+	priv->cfg.owner = THIS_MODULE;
+	priv->cfg.type = NVMEM_TYPE_BATTERY_BACKED;
+	priv->cfg.size = resource_size(res);
+	priv->cfg.reg_read = stm32_tamp_nvram_read;
+	priv->cfg.reg_write = stm32_tamp_nvram_write;
+
+	if (priv->data->nb_zones == NB_ZONES_STM32MP2) {
+		priv->bkpreg_access = stm32_tamp_get_access_rights_mp2x(priv);
+
+		if (IS_ERR(priv->bkpreg_access))
+			return PTR_ERR(priv->bkpreg_access);
+
+		dev_dbg(dev, "\n"
+			"Zone 1-RIF1 %3d - %3d %c%c\n"
+			"Zone 1-RIF2 %3d - %3d %c%c\n"
+			"Zone 2-RIF1 %3d - %3d %c%c\n"
+			"Zone 2-RIF2 %3d - %3d %c%c\n"
+			"Zone 3-RIF1 %3d - %3d %c%c\n"
+			"Zone 3-RIF0 %3d - %3d %c%c\n"
+			"Zone 3-RIF2 %3d - %3d %c%c\n",
+			0,
+			zones_end[BKPREG_PROTECTION_ZONE_1_RIF1],
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_1_RIF1],
+						true) ? 'R' : '-',
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_1_RIF1],
+						false) ? 'W' : '-',
+			zones_end[BKPREG_PROTECTION_ZONE_1_RIF1] + 1,
+			zones_end[BKPREG_PROTECTION_ZONE_1_RIF2],
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_1_RIF2],
+						true) ? 'R' : '-',
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_1_RIF2],
+						false) ? 'W' : '-',
+			zones_end[BKPREG_PROTECTION_ZONE_1_RIF2] + 1,
+			zones_end[BKPREG_PROTECTION_ZONE_2_RIF1],
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_2_RIF1],
+						true) ? 'R' : '-',
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_2_RIF1],
+						false) ? 'W' : '-',
+			zones_end[BKPREG_PROTECTION_ZONE_2_RIF1] + 1,
+			zones_end[BKPREG_PROTECTION_ZONE_2_RIF2],
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_2_RIF2],
+						true) ? 'R' : '-',
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_2_RIF2],
+						false) ? 'W' : '-',
+			zones_end[BKPREG_PROTECTION_ZONE_2_RIF2] + 1,
+			zones_end[BKPREG_PROTECTION_ZONE_3_RIF1],
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_3_RIF1],
+						true) ? 'R' : '-',
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_3_RIF1],
+						false) ? 'W' : '-',
+			zones_end[BKPREG_PROTECTION_ZONE_3_RIF1] + 1,
+			zones_end[BKPREG_PROTECTION_ZONE_3_RIF0],
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_3_RIF0],
+						true) ? 'R' : '-',
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_3_RIF0],
+						false) ? 'W' : '-',
+			zones_end[BKPREG_PROTECTION_ZONE_3_RIF0] + 1,
+			zones_end[BKPREG_PROTECTION_ZONE_3_RIF2],
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_3_RIF2],
+						true) ? 'R' : '-',
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_3_RIF2],
+						false) ? 'W' : '-'
+				);
+	} else if (priv->data->nb_zones == NB_ZONES_STM32MP1) {
+		priv->bkpreg_access = stm32mp1_tamp_bkpreg_access;
+
+		dev_dbg(dev, "\n"
+			"Zone 1 %3d - %3d %c%c\n"
+			"Zone 2 %3d - %3d %c%c\n"
+			"Zone 3 %3d - %3d %c%c\n",
+			0,
+			zones_end[BKPREG_PROTECTION_ZONE_1],
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_1],
+						true) ? 'R' : '-',
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_1],
+						false) ? 'W' : '-',
+			zones_end[BKPREG_PROTECTION_ZONE_1] + 1,
+			zones_end[BKPREG_PROTECTION_ZONE_2],
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_2],
+						true) ? 'R' : '-',
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_2],
+						false) ? 'W' : '-',
+			zones_end[BKPREG_PROTECTION_ZONE_2] + 1,
+			zones_end[BKPREG_PROTECTION_ZONE_3],
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_3],
+						true) ? 'R' : '-',
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_3],
+						false) ? 'W' : '-');
+	}
+
+	platform_set_drvdata(pdev, priv);
+	priv->bkpregs_regmap = devm_regmap_init_mmio(dev, base_addr,
+						     priv->data->bkpregs_regmap_cfg);
+	if (IS_ERR(priv->bkpregs_regmap)) {
+		dev_err(dev, "failed to init regmap: %ld\n", PTR_ERR(priv->bkpregs_regmap));
+		return PTR_ERR(priv->bkpregs_regmap);
+	}
+
+	return PTR_ERR_OR_ZERO(devm_nvmem_register(dev, &priv->cfg));
+}
+
+MODULE_DEVICE_TABLE(of, stm32_tamp_nvram_of_match);
+
+static struct platform_driver stm32_tamp_nvram_driver = {
+	.probe = stm32_tamp_nvram_probe,
+	.driver = {
+		.name = "stm32-tamp-nvram",
+		.of_match_table = stm32_tamp_nvram_of_match,
+	},
+};
+
+module_platform_driver(stm32_tamp_nvram_driver)
+MODULE_AUTHOR("Simeon Marijon <simeon.marijon@foss.st.com>");
+MODULE_DESCRIPTION("STMicroelectronics STM32 NVMEM TAMP Backup registers");
+MODULE_LICENSE("GPL");

-- 
2.43.0

