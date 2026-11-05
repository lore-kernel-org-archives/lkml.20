Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793880188;
	b=B54kqWWuw/4Jdbm2xy/jODOawwqqF2/9jJ7ikzrNROIKwDVEeNKenDcmeq469XKxrbC1
	 CnvFiFbNG6wjRBPNmmNi3oyh10qyzCGwML50lxxx6OtuOch/sGiEinmB0ZQfAW7DwR0es
	 7+dTUKW4n1BKhVVMS2+ODzB/ZYjaMBvz2LptsU0LFHFpUJrxPBJTQrqF8b9sMEME/jbzc
	 v2FC0LG4ubdOiAYvzinQTIlrvhXhV5889VczjAWYJRtExYJVcNw6BinvR0BUDI+AEr0cG
	 z17VtmSCM/hs96WjVMiipNjfD5RjiW+1jZy3zxr/ip/9sKWxlb+Wkfz929DeeTFXRog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880188;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=ZoleSdlbXnOVeVfILP+/m90nXCpgRAwyuSmyptZWeqk=;
	b=DmwzDyad0kivQMsD687A4TA+JI1cZINpoqHp6A1AB7i/kxGhAoXancUH9+L1exSUB9/U
	 xWssepXQd6K1kh3UGTdRpP+MbCjnU3QurfCscSfLMmLQQZupIcvlUsxVajnPmQ8p4e08f
	 xqJvlt451tlbY84QscPKDzVA8oT8Vi4BqOgoChSJ2cOmBuY2eEyfkmLCn4ueyo20oQJMh
	 CDHAhi/CtDGwvoeKWJqtGGMg0rK7Z5VKVJlLpiU4KDCBxOJRJwN9VS5UK9J6v+GQUZdPN
	 8Z6UJb9beJ0BDoIwzG7Hubu63HdDf+JtiuH5GQdTPqbXk3buaFQDdgf1yRs215y7o5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=BLgNmrGd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.15
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011015.outbound.protection.outlook.com [52.101.70.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADF6606A326;
	Thu,  5 Nov 2026 12:03:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EADF6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=BLgNmrGd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sLGumsIR39d0O46bLdi6ZH6WiU4fM0IoiJwwuEuBPNn4CVlU9x25ZZFb86X25EZ+qj7JTc5UzpQKfINnEoAGWvUgFETV2m5nkYT5rc5AFeUYgH5R1cz2inuuRGcm8eSlmPU+VIvq/GV44r9FPuyZI0e3eEzswfL3tVE8NAZf85VsAq031OZbWq3kz5xZf8t2CLFs1sB0sP3Nh74OEz6jBsoNMmc2crzga0yPbwYjQA0VckuY/vScxHu2XDrSuKhrx9OPV2nPBFESItJYtrG1l5lLPzJQ150hXzXhalk0PeypTCm4Vd1AAaDwfdGpeOtA/iX1txlZhNUVBl7IB4IHRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZoleSdlbXnOVeVfILP+/m90nXCpgRAwyuSmyptZWeqk=;
 b=I8qSBQ+XeriRi8KrMzkFugLty/2/YS46/nldoxaBwLNxzhhi4PRZU2oc1y/e+66f0NkiWL1WeTDFw998WANdZIwPiwto/SnZ+/7ylvxxWpBbigUweGq1rBBpcNItJQMpBzIIwcDv7yX2D821OrY+WNSL1Z+NJTaPisSCeQAwduze1Uu63Wy7UhOYkw5f9cTNbQrK5u4yImBebR7Y4UXNlHG3XERyC9et3DqUgANAR1mpNgDvYgoOZ7LYsWWfl115IeEIHDuBwCQvZpd1j0PEtg3tIcpT4lDV3E3vc7tJ/7c5dBWNS5mXW91MyFQcOkmf1ym6RkQrOofyyyGQFWi5ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZoleSdlbXnOVeVfILP+/m90nXCpgRAwyuSmyptZWeqk=;
 b=BLgNmrGdX8tM+x4xtJAGJKN6xv1GXKmMC1SL6dw5phOgwHEJrA4pgYU1DqLTkXo7k23Nis6SYrI+S42yTaAvEeIoZYoLP68Ur2HbsZB9ns/jwgB+vs0MoZs27xcSQIdoztAv5jgbGdkG3tqj3RDbWSKIryn83ZY1XXafkMDu0Ac5cHakbkegBfhLoIVU+0ym5Fwe4uzw70ayJXqQZgmfo0eQ54SDKDt83TNwCEYWYdslwjjlyNodXra0unFh/qg/uYQlS16z5k/PpO89rAIuvY2zgB3u2AmJPjvbiukqzpybgQYBl8TQ2RIKZ+6IrY379Md0m5hW4asjUUcasDJQnA==
Received: from BE1P281CA0067.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:26::7) by
 AS1PR10MB5604.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:47b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Thu, 5 Nov 2026
 12:03:03 +0000
Received: from WA1PEPF000099CE.eurprd04.prod.outlook.com
 (2603:10a6:b10:26:cafe::39) by BE1P281CA0067.outlook.office365.com
 (2603:10a6:b10:26::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4 via Frontend Transport; Thu, 5
 Nov 2026 12:03:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 WA1PEPF000099CE.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 12:03:03 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 5 Nov
 2026 13:03:48 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 5 Nov
 2026 13:03:02 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 5 Nov 2026 13:03:01 +0100
Subject: [PATCH v5 3/8] nvmem: stm32: add TAMP nvmem driver
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261105-upstream_nvram_reworked-v5-3-ddf7dbf1b298@foss.st.com>
References: <20261105-upstream_nvram_reworked-v5-0-ddf7dbf1b298@foss.st.com>
In-Reply-To: <20261105-upstream_nvram_reworked-v5-0-ddf7dbf1b298@foss.st.com>
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
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF000099CE:EE_|AS1PR10MB5604:EE_
X-MS-Office365-Filtering-Correlation-Id: 14a96c12-d605-4fe9-5fea-08df3b34bebd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|56012099006|11063799006|261022105027099003|261021121427099003|261022075727099003|261009223027099003|261102123227099003|261021135927099003|261026121527099003|261028144727099003|261026140227099003|22082099003|6133799003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	pMhDaHr/MV+oXAnHJPbqB1/VaPWeU24O0js2B/dG0MSBVC33jGSlvcxruRiM07kseuCK3U6fT81ElXL3787yBrYZmlklTB/5Z/TWM+IvTbVYkqugImVtvCK/tsFx8DNnmwpipIxUDVTLibODOCqJt6/+3u8xSTzBnnd+XD51q5DK1xWoAMt3fG2bR0KMzdX/DQ5saJJmkBKWFAyPSHI9sFGv99cUny6LbmqiiW2+OWhJZCfyFCN8Gs7iXlOUF569BUub2sbIzqRcAHsyCWL2OuzQCKCO5fcFwn886252GMVNDWzw6rdkdWjJesUW6nKOEEzWSs5/SDJ+sEBshLT0/n7qNiLBolWbcqKqf2kw3OHtPk7BziAssTkRABUw0ljry3KwAextjBAvo2RFUE1HsXf9PRiEM+lp5YZYsOyahJHhZqu+5zkA806bQlJCTzHx3d5OD/AKAPfJZuLUAEjVXjOyzV5LDQ/Q4hNpRZuMor/Bq6zBFk8FDY90a5VPa0LPdTNS458WCA/3Odl1rQKRY59e2g4RuC6+GfENvxLXchJ3EoAyuGfWOXBTATxB+WD6XNnBG4NKw22qXEhidihPcqW03lXa5NEePpA9PQNp4FpRr2+o49IK0svBeJDH/EFtmZTnWDNkHgaqrtomJJ9UTsf9E9EBfySHUH0FH2A6rieRrB4yDqpcVHLfqdLgWcxDk1TtVRj+wy8TN1JXzWcfGA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(56012099006)(11063799006)(261022105027099003)(261021121427099003)(261022075727099003)(261009223027099003)(261102123227099003)(261021135927099003)(261026121527099003)(261028144727099003)(261026140227099003)(22082099003)(6133799003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pggNinlKCW9xkjBjonqhT2Li71j4QNuD0YGtvTiIZkIRKd4Hh3hNOE5fi4rPJnSH2l7zA0LJrlF2cETBvMZ5zFYd9RnRl5fW+rRHXdpg1M21eGpa0Tjbp30ydln9LxCmkzc4ZCtPgSVFB1QtDy2sZmeN+XyYfwASCW8o5EukRp5J081npbib6nOEKK2vC+yzYK1WaviW8bNv1SRWh6nw955EYy041n7704CJS/GkBxE5f8btwP4WyMP8yEyMNvpoy0SGbnokJH4MRUZaVJa+vOTlkABAEv2jIgOb0pUq3QRCtXWF5qe1wHtcUdXchEL6eVCnWhKQ3mG/upXPCA/oeoyxmAQCAhHEHAzPDFNyYsxp1rRl22mxViQq/FnpykbgntjPnjRXrXjbGg1EauHrGQeQTLbmscfvCut/KydDz1qweo6nCF3Y0C/bKse9Ilja
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 12:03:03.3186
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14a96c12-d605-4fe9-5fea-08df3b34bebd
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	WA1PEPF000099CE.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5604

From: Simeon Marijon <simeon.marijon@foss.st.com>

TAMP backup registers will be exposed as nvmem cells.

Each registers ([0..127] for STM32MP2, [0..31] for STM32MP1) could be
exposed as nvmem cells under the nvram node in device tree.

Signed-off-by: Simeon Marijon <simeon.marijon@foss.st.com>
Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 MAINTAINERS                      |   1 +
 drivers/nvmem/Kconfig            |  11 +
 drivers/nvmem/Makefile           |   2 +
 drivers/nvmem/stm32-tamp-nvram.c | 680 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 694 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 13f5c94b0bf8..eb7b9f746be6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26924,6 +26924,7 @@ M:	Patrice Chotard <patrice.chotard@foss.st.com>
 L:	linux-stm32@st-md-mailman.stormreply.com (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml
+F:	drivers/nvmem/stm32-tamp-nvram.c
 
 STM32 TIMER/LPTIMER DRIVERS
 M:	Fabrice Gasnier <fabrice.gasnier@foss.st.com>
diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index d2f5bb236663..a0675f89015c 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -516,6 +516,17 @@ config NVMEM_STM32_ROMEM
 	  This driver can also be built as a module. If so, the module
 	  will be called nvmem-stm32-romem.
 
+config NVMEM_STM32_TAMP
+	tristate "STMicroelectronics STM32 TAMP backup registers support"
+	depends on ARCH_STM32 || COMPILE_TEST
+	select MFD_SYSCON
+	help
+	  Say y here to enable access for STMicroelectronics STM32
+	  TAMP backup registers.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called nvmem_stm32_tamp_nvram.
+
 config NVMEM_SUNPLUS_OCOTP
 	tristate "Sunplus SoC OTP support"
 	depends on SOC_SP7021 || COMPILE_TEST
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 5e70bad9f0f9..73ec68e53556 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -88,6 +88,8 @@ nvmem_sprd_efuse-y			:= sprd-efuse.o
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
index 000000000000..81096a5d0282
--- /dev/null
+++ b/drivers/nvmem/stm32-tamp-nvram.c
@@ -0,0 +1,680 @@
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
+	unsigned int bkpregs_offset;
+	enum stm32_tamp_bkpreg_access *bkpreg_access;
+};
+
+struct stm32_tamp_nvram_plat {
+	const unsigned int nb_zones;
+	const unsigned int nb_regs;
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
+static const struct stm32_tamp_nvram_plat stm32mp1_tamp_nvram = {
+	.nb_zones = NB_ZONES_STM32MP1,
+	.nb_regs = NB_REGS_STM32MP1,
+	.config_reg_fields = stm32mp1_tamp_nvram_zone_cfg_fields,
+};
+
+static const struct stm32_tamp_nvram_plat stm32mp25_tamp_nvram = {
+	.nb_zones = NB_ZONES_STM32MP2,
+	.nb_regs = NB_REGS_STM32MP2,
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
+	return regmap_update_bits(priv->bkpregs_regmap, priv->bkpregs_offset + offset_aligned,
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
+	ret = regmap_read(priv->bkpregs_regmap, priv->bkpregs_offset + offset_aligned,
+			  &read_value);
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
+				ret = regmap_read(priv->bkpregs_regmap,
+						  priv->bkpregs_offset + i, &temp_u32);
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
+				ret = regmap_write(priv->bkpregs_regmap,
+						   priv->bkpregs_offset + i, temp_u32);
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
+	struct resource *res, parent_res;
+	int *zones_end;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = &pdev->dev;
+	priv->data = of_device_get_match_data(dev);
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
+	/*
+	 * The backup registers belong to the parent TAMP syscon, which other
+	 * drivers (e.g. remoteproc) also access: go through the syscon regmap
+	 * so that all accesses are serialized by the same lock.
+	 */
+	if (of_address_to_resource(dev->parent->of_node, 0, &parent_res) ||
+	    !resource_contains(&parent_res, res))
+		return dev_err_probe(dev, -EINVAL,
+				     "Backup registers not within TAMP parent range\n");
+
+	priv->bkpregs_regmap = priv->config_regmap;
+	priv->bkpregs_offset = res->start - parent_res.start;
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

