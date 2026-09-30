Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013070.outbound.protection.outlook.com [40.107.159.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E395D3E6DDA;
	Wed, 30 Sep 2026 07:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790754116; cv=fail; b=vBaTb51A1sm8CBi3JGsO+hspabXgJC3e4zBvBn0aJ+2zrP0/tHSiFcw1bS7EL9VGXx+KogZyOYWNQH0KkfuYbPZcLf//k1lA4AMts8MQ5dSzMX3oxlEkagGNJSMx8QQBwrw2uf3YYqHs2tMb/zZzKBIlU5RUsdJf9HwfPoBJd6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790754116; c=relaxed/simple;
	bh=iAcm+G3lSEehg46KTPykldPrFVh6bB3crHk1Z8yrt2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=pNjII+w+o8t7BTN9cJIO3A0UWLj/kJB83as2YgGjgZCOXNpIc9TXh/jtS272qgG7Hl/xtzeOpSSVWDBDRf2NMZVLGMSVJq/1Tp80SjBH2eUTFiL5i4S4FiwVB9HfzlPYLfhdoI3DuMigeVtKGNNORuMFd0OOWSX5bTSi0fSh5FE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=CostuMlC; arc=fail smtp.client-ip=40.107.159.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="CostuMlC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wnxSVxsKm5cAhNtbOJ8bXPPSU/rENlAWCdyjaC3qMph3GLZ4zofSGLWB+BYahrJy6nKyQPIkieMMvF76pl2PHMoKPL79YfAsjoMzaSUpH6Csv+oDwp/l0p5Tlu0wxfyGaADEcWsDYO3HSpZz+6y/g5WWhMF5La9fSoM4ASz4PaHkRwIvDNBOL1eFvQr2KtjAoXMNI5zmzPJQwNOfpLpZS/iMv1mCU0lYGSsRVoG0ARvt25VoPf3PoGf6JFBGCt+IsdOoKVpGyhpFb/trgYoT/rSgIlhs+yJb5qJbi06JsuLw//ykNofTmshDMZxEDCaVlKNHFz0CDrI2DK7FmLAbRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1PVDq92gNEvL/EAZ/d0ouNQn1Qe9C0B2up9+bPwKODA=;
 b=mN7E9HOVsOl8R4WSgSR2ea8Omfk7r7d4RyNxxlP5n6cDVH0Jw9DbYkVPnqxjCGP+721nIb5RI/MJHau/7WxsiJkhuK0Ii1Ox8+oIi3t4MOEmMbYA5ZY6C2Ir3miXABT8lY4XEoaL0Cc38wa2lXywZpBvzfDOsbeHJquld+yayjvZWzQc52n2LXTYWIUhtd2NIx0g6rkq9S1OyrASunr9Sfyx49al1J7EEb7ywRERU7sZGhgBnNER1xHknIMZDVWUGmrrH1NGRgfhKAf918pj8pWSekgvSWG54gB1yfePpK4Dk8QGWlz5d2ZQh3+IMc7F4KsyADkXvHxDySB2gWgqRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1PVDq92gNEvL/EAZ/d0ouNQn1Qe9C0B2up9+bPwKODA=;
 b=CostuMlCcjFG8XW7W5XmdlVQhHBfoQFvOpcpj3TcGiYt0qQwJMLRzX5QJV8tkT//LxGGQ6s9MQW8zune9cvVUOkCoaS3X7gJeuD148swPTmb7Nv5coC5xwqLQ52IfFHY0B7MesXqFCloUKKJfYfLRk1vVsgPRP4TJDobzbK+6shfq4J4sOndGJR6uK+LVhQtxvoZ9q0DAqiBfUgycrDXyIHJpS12JvF4NyY0bTrREJOs0DBaSuPX9sLa6n8xLj/StbzoR532wznyarQHw1snPwFs+hNzkMuXkDEtgjImmshVlu50tOe5fshdTlaqKIpFvfeaieCPrNMYlfDwoP0/4g==
Received: from DUZPR01CA0088.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::14) by PA4PR10MB5634.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Wed, 30 Sep
 2026 07:41:47 +0000
Received: from DB1PEPF00050A01.eurprd03.prod.outlook.com
 (2603:10a6:10:46a:cafe::ad) by DUZPR01CA0088.outlook.office365.com
 (2603:10a6:10:46a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Wed,
 30 Sep 2026 07:41:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF00050A01.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 07:41:47 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 09:47:40 +0200
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 09:41:46 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 30 Sep 2026 09:41:44 +0200
Subject: [PATCH v2 3/3] nvmem: stm32: add TAMP nvmem driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260930-upstream_nvram_reworked-v2-3-cfda749ee0b7@foss.st.com>
References: <20260930-upstream_nvram_reworked-v2-0-cfda749ee0b7@foss.st.com>
In-Reply-To: <20260930-upstream_nvram_reworked-v2-0-cfda749ee0b7@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A01:EE_|PA4PR10MB5634:EE_
X-MS-Office365-Filtering-Correlation-Id: e5efb323-146b-4cb5-67ff-08df1ec64866
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|1800799024|82310400026|10067099003|11063799006|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Frz1HDeg/FK1EaOlYPh/2oPiqjikA8u0iQKLDS7uG5XjCwb3ubg8E61wj9adHhm71zM+xDHpShHP8iO6nqCT19EeIOhxopHjQJSSAHmtat1PxKI6YDFkIeYvp36Lht6Mxc0Zf5pCMYQJYazKTrdE0P1ba7oBkuU4Hlwxbu5oKYzoiKO43GSGs8xnqUrezoHNhXMhpdUEni9SF27VlhS6w685V2jq7ApAxomcChPz+MzEbJBVId+zAnKlkyRqXNeZdIL6RwVT0MWe5vHKtLbKcqkrSCuLyiV2OLlvKs0vGDUFLnwbQM35Y9ObDHOM2+Obj9jy39WvrnuVVMK1JyUojVafzwAMIxzw5cj15UG1oU832AIds8GJeubIHD9zsKHe8Ivc6/YAsfMzptsV1MH+KrOLyRVcxl/x2S/QDvY5eUdpnc8659sYZC9o78oInkRHpDRHkGd0ub9qS52M55DAx/7XjhDZMGiIUtUUdz62H6/2ngsztqQep+U0kl2mMackRdUQ9cjUW/tIgFb3r3qfZGCX+Z3DHLcK0anvynNRgLW0QbvEftFN2uMaRwhkT8IHQDq5dGCEiZ3ufqD/M51btzmbjVRkfsv/yPBdx/Wikk6KoBzQ+rAfxBAgPPo5OxvaMzfJgUXyLcBMvrhFZqPe8+69bNB1ivqPumC9i0mVrkpns7kevpKPPGjtD9ZG/ArSUbP1MrYSRdobBRfRvRrtdg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dq7UxDml9/mlfDqdvIQWmS6oNZ7Og2Cc5iRkAf4zrX3ejW6Ss6JPYDofNOEtqBv7HUAPIn8P2OL58UwCy2KzizrgFyprLv48Bgwmf+sGOqq4fSePHX1imYwds1IUy910cuE5Q0sSNPz4HFsf2iwHZ5o3GNm7mkYtW77BqEKE0gwauEkm2Dra6YqoecuVZ2ISHUPXix9lJG2R98Xg5rDwLIxBvPi1FkSu6zyHBo9favvM+hYABisfkaU9kIkL6S9FxVgQV41qeKQIGwlKK1/s5YDog0sW+ZKwy/O0P4JWnOsCeTWXBTmrBeERRYgCvycSjllPU7bHG3TScxaWxuRyknZm5Xm8/JALfTg67wtVaezUfrjM0yztujTQO2+Gvi1NzrTSnH5aCXqGoGZkKmz17ilx3OYH1mi5HqllBL0X451xcqxnfDV8BUIGtl8Bw2VG
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 07:41:47.5796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5efb323-146b-4cb5-67ff-08df1ec64866
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5634

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
 drivers/nvmem/stm32-tamp-nvram.c | 742 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 755 insertions(+)

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
index 000000000000..c10c5ed5d273
--- /dev/null
+++ b/drivers/nvmem/stm32-tamp-nvram.c
@@ -0,0 +1,742 @@
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
+	.max_register = 0x80,
+};
+
+static const struct regmap_config stm32mp2_tamp_nvram_regmap_cfg = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.readable_reg = stm32_tamp_nvram_readable_bkpreg,
+	.writeable_reg = stm32_tamp_nvram_writeable_bkpreg,
+	.max_register = 0x200,
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
+			memcpy(buf_u8, &temp_u32, sizeof(u32));
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
+				memcpy(&temp_u32, buf_u8, sizeof(u32));
+
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
+	unsigned int *zones_end;
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
+	if (of_device_is_compatible(pdev->dev.of_node,
+				    "st,stm32mp25-tamp-nvram")) {
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
+	} else if (of_device_is_compatible(pdev->dev.of_node, "st,stm32mp15-tamp-nvram")) {
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

