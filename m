Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2126.outbound.protection.partner.outlook.cn [139.219.17.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E537A5650E2;
	Tue, 22 Sep 2026 16:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790093579; cv=fail; b=kr7XZR/09O+CaT6e7lK0CPHp0qT+9TVK0S7oa6iYP0yIfHsxt8ZIlVDlNhKcg9EkO/3DU+AL3PeYM7htcHlDMZVOBtWhucwTfcms3WoeZmg+87kEGWM1Iwj5ls2S77Dz4mBeltMLjxxtsvii9Ieqxoumm5o7FDwOqlILQHeQm7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790093579; c=relaxed/simple;
	bh=7rzc00L3WW+lDMZiSxN0O/9LZ0e6GRxrsiAlFT5n31k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bZGAR7gb4PTkzg06KQiEmUW7I5cJN7U/EsFe7ssuoPo3HaV3Sfnv0B9iOoxe0Xc0e6Wxr3iIXRM0X1VHFkmEQG98yP/gnUk2EZPoFnI+ganQDcoKbI+hp8DTEs3wJ/Cc92A8jiJQB0jyWG3y8iI1txPseUKvI2YWg/HuN3OoD6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WOxzpU3Jm5g8rVbwdlezTBENrxvKNUTu3aCDGBqUnVR4PUCoUJfxnUTrNvnnhrZTFinnhQiEkQbSQw4FOg/zdG4bTc1lY6f86YtzF/0GI6ArSRku6qTVRIDJFDAk8F0pMdFFij8c5z3IQ1edp+zalkSUqlDdgQqMKHPVj0TZFuymPRDqi2cTZvoRIPHI0NbgvrpBZgbV1Xqmu4kkGFH8Ds2DDsoXuhE9SL1NGITFQYMuG5IuTm5R2cmCHRAKMdZ8nyohdeYWLpwLEuvMdaJoQ+EFj1YbAwp84oTpT26puNt+C+2ZLKVMCmXfVqR/Lqs9tjOapvA465pc6x+y6XjmAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J05U/x0Mopq6Aclznvuqor2NPRAmVw+WbPaA94hlsIM=;
 b=m/0G/dYVjw83fGBMOBaLE3qYhJNyh0WlOoORFUQtkKXIW6a9mgiZSZ/cTlDKcHe1u77cjvsQ4lQSPaga8eG7Ti3CgKJyal92V2cz2QZPyNn/r/66JjkTucAYxf6WYnadRXPizctWbYY464sOxkKHfkahfkO/3yciOjd9BcpK91vMmLs82TWSMC/dlrXJG/km1z+APyyxWQcRal7N7lITNPYkFm3mf5up6o8r/I04AsRF8mzo/6IYWHiuUJjLYP0ECTo6jOhgWNOl1jI8n40CAgazDcbCpWn5EInG1yLv8xC3IfvxuMpXTe2yYpgYpzaxB1GwR3eFX31Zmdg1G//XJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14) by SH0PR01MB0492.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:9::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 16:12:44 +0000
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::435e:52b5:c524:459c]) by
 SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn ([fe80::435e:52b5:c524:459c%3])
 with mapi id 15.21.0428.015; Tue, 22 Sep 2026 16:12:44 +0000
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	rahul@summations.net,
	anup@brainfault.org,
	lftan.linux@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	joshua.yeong@starfivetech.com,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] regulator: Add RPMI voltage service
Date: Wed, 23 Sep 2026 00:11:53 +0800
Message-ID: <20260922161156.1088153-3-joshua.yeong@starfivetech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922161156.1088153-1-joshua.yeong@starfivetech.com>
References: <20260922161156.1088153-1-joshua.yeong@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJXPR01CA0066.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:12::33) To SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SH0PR01MB0841:EE_|SH0PR01MB0492:EE_
X-MS-Office365-Filtering-Correlation-Id: 785a4e36-08f4-4bfb-5a30-08df18c4558f
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|376014|7416014|1800799024|366016|10067099003|56012099006|3023799007|6133799003|22082099003|18002099003|5023799004|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	3gqV7LCHvDW462vrPfNCvC7oZJIqMqu6r1GCjjK1lbZnkM64JoYl5FrzBYgt3/5QZZwG5EAhd0z2pUmCTXZR01NYtLQO0onHaDrugjVxEYxvAX39kUXtXIrdLuhVKfqQgbrxeoB4znhRK1T1TTWK22F1YLY1swIRpyDOks0ucA5EKolgVhGTOEPJo0OYyRcRy5pGW4Q+WGUYlkESo7BxYkzrowKXmFiRGYpRPTlvqukRVBNhFEN0VqiS+M8JaOcBpCYsoBG+2H+UEJuRdhzGwXFDQ9w866NkDDAsHa7aCRou6CVEyCSeRl8wdBgjRadmm++uOk8S0u4NU3wKZeLD6kzDDDuaJ8Jd6XdSr770H6e2nCkRbDiv9kCXbrpwsF0mwMl7ZdGHdNTzLmjU732voXeyP2W0rxElat/DxUNihZanuFNJwT2+xRwI/DHKOhnakXJAoX/OcO+WpbB9ZatvUHjieUeRMSVN4s6tWtU6EYStP+eDQrfPafsQsXRHEjtGc1yxcOxx9V3izXNXvtqM+ft8qZ0B1NizPxX8j5zpbjr9ZrTf4XjRwXdpgtoQmCgguBhe1xlQUS/Ed84Rei78Ow==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(7416014)(1800799024)(366016)(10067099003)(56012099006)(3023799007)(6133799003)(22082099003)(18002099003)(5023799004)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QmKTTWmlhZzet2K3Wdt/BvcBBej/wx9/HOAPE+LPcKb6ct+PHkTwDb/RmcqH?=
 =?us-ascii?Q?53r2DAG7mB9/PSWwxdPlq8PP8OQavn+1krExLKJA6VvsBlLSp1C8UQ6Tpr8K?=
 =?us-ascii?Q?MYYNIyhCctMmKSj4C7w34hhnpetpb9i+7zB7YamAwdr8oOLm8oGRCfziY1ll?=
 =?us-ascii?Q?K9hRP7+CqRTtCrgFKc6mIZ/x7eO/ZdRJorCMMw3lbQW24Z5+puvDFXkMjjJ/?=
 =?us-ascii?Q?iRmnBCyCa7S8O6Ua2uBvcS3Q81Wl0LKa0unCe/hD7yGClKGEt3Rbgr/xs6tt?=
 =?us-ascii?Q?a14gZQRa52ySK0sPo7jBNI8cH6smUgaqsbyg6Fr2UtVuGiGAmwkX8UX+w78a?=
 =?us-ascii?Q?ITD4XZ+UjoeW8bADx92ARwWmeKfMr3GLR0klaUhdXeTViPMK0vWG01VR4iKo?=
 =?us-ascii?Q?FqtM2W2SwHhK0+JmV+CFlknqD580jgPq/Ii0kAXIH8ffkAyZwLK03peTdLW0?=
 =?us-ascii?Q?L1k7hToisCTtUd2WuzDB8j+ooNb+CeEPvsal3sl3NsWiJ3WxFnyx1Pln2qPh?=
 =?us-ascii?Q?X0ev9ZHO1NXQdY9tCtunGSQ/M/aoLkE/yi+6GbEAKuxxfeieqlXA+DxU9ARA?=
 =?us-ascii?Q?uxp/JT5nSOUA5SKEJWeD/f6SLGYH5mLj+m8b7LnkHp1XkL4waaWJKBBS/0bM?=
 =?us-ascii?Q?ibh66Dn3PEbarMy2foJ837EkHZOfi9K45BM+Goruc9sGticEU2sS7RlIElqL?=
 =?us-ascii?Q?nwzCLllRIY3HkoX0pNckXMhRCq5k5L2t3Dklh8d2deDU9mZwNEKmdLQlvCMp?=
 =?us-ascii?Q?X9aBkksqFHsXh+zw94ywmHHJD5meqlrF8LbUeZ1qwHcW2si4AOCNPP+jUKB9?=
 =?us-ascii?Q?vZvqBlNhU5U9dYiwFtLHmLaxIDB2tYBIC6NZM7LVwbFqmaIN/34LP7wk/N4C?=
 =?us-ascii?Q?lpwZEHFGT98tIyttmlZHSEcayJSwb/zUmS6u7mZA6TLb/eE1EIFOSK9RWqPa?=
 =?us-ascii?Q?nJCpHiJTdI9+SXYj3L3LCR21mpM35BO+PpPwRsozeVJVezEzixMJh4NCtaop?=
 =?us-ascii?Q?HmOIPQpbGSkPZZ00T3zm+0yYnfL2cSSTRTaOonysqr48sL6I04nlzpO2bGAO?=
 =?us-ascii?Q?8Tp+Zt1/ZcM0an+1fb5M00Hn3jGSh3cFhDkat+PH4Z+y9Xi9f0Xjk3GtXicE?=
 =?us-ascii?Q?yjczEtXQPEKePSt4j5uoNWcJNb39b8e0FXPkO8IXJKHnGaeqdfrN+OOI7zrG?=
 =?us-ascii?Q?esgxU1/WGDY3yavufOiGSZvhxAj597gE9VJeXpVr/FRV0m37uHV7H5jWBmqn?=
 =?us-ascii?Q?hZ0dwe6wCca9alIMJiqa06W01aoeYeuwkBcPTxgePItXOMwam+zZe7jw8q6W?=
 =?us-ascii?Q?gk/HaPSRiQJUqcyfXnUMHdHEIc44q1f1cwx1QLssN6rhJBc2pCrlXAqsyB/C?=
 =?us-ascii?Q?qWFvea0J+fKSImPm3V+JPK31iLkw3p99PsZCdtHEwxrH/55szBOxlvh78BFo?=
 =?us-ascii?Q?TibcGDG/VzbGLIvqYGmMMepwTOe6m7q2V2Qy1tizd7YcXX2hhDfm0Dj/ex3F?=
 =?us-ascii?Q?Cpb+cuEbGCDuvPuqL08fZsRb4x321tfWjS5BOZpaK1v3UOOuA5Pccv/ZmrFS?=
 =?us-ascii?Q?mepvRfz9hiGfkjI5eJcZXgZCJKIc8o85X1T2JLuUkxprLZFmQOWzK3BjHdxH?=
 =?us-ascii?Q?gp7AHI9FvDnWC7qwhls4Csa7+HGyEuWJCkEnvJ9/D/TYmajz1pkDkxJoovT6?=
 =?us-ascii?Q?D46P4Ik9hOM4B8N2yh9G0gq7S8kQPQmlDuVq+a+C2XIa/KxuHl5FR3aoqzpF?=
 =?us-ascii?Q?eI6k4kJB6Q1jD4Z41b62gbJ9SuwJiDY=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 785a4e36-08f4-4bfb-5a30-08df18c4558f
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 16:12:44.3414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dnPv+1BXH8nsmBbcG5tJRrNsvmRtdcLRVJQ6Gkt1erM3jtuuj3nDm0Sm7xRYfvsauovP8CQ5xxDw5eld0xWXiucDZmUmgLJqSlWEa7fmR7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0492

The RPMI specification defines a voltage service group which can be
accessed via SBI MPXY extension or dedicated S-mode RPMI transport.

Add a mailbox client based regulator driver for the RISC-V RPMI voltage
service group. The driver enumerates the voltage domains advertised by
the platform microcontroller, reads their supported voltage levels and
registers each of them as a regulator.

Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>
---
 drivers/regulator/Kconfig                     |   13 +
 drivers/regulator/Makefile                    |    1 +
 drivers/regulator/riscv-rpmi-regulator.c      | 1077 +++++++++++++++++
 include/linux/mailbox/riscv-rpmi-message.h    |   14 +
 .../linux/regulator/riscv-rpmi-regulator.h    |   41 +
 5 files changed, 1146 insertions(+)
 create mode 100644 drivers/regulator/riscv-rpmi-regulator.c
 create mode 100644 include/linux/regulator/riscv-rpmi-regulator.h

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index a54a549196fe..ed833c313a1e 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1255,6 +1255,19 @@ config REGULATOR_RC5T583
 	  through regulator interface. The device supports multiple DCDC/LDO
 	  outputs which can be controlled by i2c communication.
 
+config REGULATOR_RISCV_RPMI
+	tristate "RISC-V RPMI based regulator driver"
+	depends on MAILBOX || COMPILE_TEST
+	default RISCV
+	help
+	  Support for regulators based on the voltage service group defined
+	  by the RISC-V platform management interface (RPMI) specification.
+	  The voltage domains advertised by the platform microcontroller are
+	  registered as regulators.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called riscv-rpmi-regulator.
+
 config REGULATOR_RK808
 	tristate "Rockchip RK805/RK808/RK809/RK817/RK818 Power regulators"
 	depends on MFD_RK8XX
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 134eee274dbf..098a50b958b3 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -146,6 +146,7 @@ obj-$(CONFIG_REGULATOR_RAA215300) += raa215300.o
 obj-$(CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY)  += rpi-panel-attiny-regulator.o
 obj-$(CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_V2)  += rpi-panel-v2-regulator.o
 obj-$(CONFIG_REGULATOR_RC5T583)  += rc5t583-regulator.o
+obj-$(CONFIG_REGULATOR_RISCV_RPMI) += riscv-rpmi-regulator.o
 obj-$(CONFIG_REGULATOR_RK808)   += rk808-regulator.o
 obj-$(CONFIG_REGULATOR_RN5T618) += rn5t618-regulator.o
 obj-$(CONFIG_REGULATOR_ROHM)	+= rohm-regulator.o
diff --git a/drivers/regulator/riscv-rpmi-regulator.c b/drivers/regulator/riscv-rpmi-regulator.c
new file mode 100644
index 000000000000..2309466eccb3
--- /dev/null
+++ b/drivers/regulator/riscv-rpmi-regulator.c
@@ -0,0 +1,1077 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * RISC-V RPMI Based Regulator Driver through SBI MPXY
+ *
+ * Copyright (C) 2026 Shanghai StarFive Technology Co., Ltd.
+ *
+ * Implements a regulator driver on top of SBI RPMI Message Proxy Extension (MPXY)
+ *
+ * Each SBI MPXY regulator instance is associated, through the means of a proper DT
+ * entry description, to a specific Transport ID.
+ */
+
+#define pr_fmt(fmt) "riscv-rpmi-regulator: " fmt
+
+#include <linux/bitfield.h>
+#include <linux/cleanup.h>
+#include <linux/list.h>
+#include <linux/mailbox/riscv-rpmi-message.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
+#include <linux/regulator/of_regulator.h>
+#include <linux/regulator/riscv-rpmi-regulator.h>
+
+#define RPMI_REG_DOMAIN_NAME_LEN	16
+/* "domain" and a u32 DOMAIN_ID in decimal */
+#define RPMI_REG_SUPPLY_NAME_LEN	17
+
+/* VOLT_GET_ATTRIBUTES FLAGS */
+#define VOLTAGE_FORMAT_MASK		GENMASK(3, 1)
+#define ALWAYS_ON_MASK			BIT(0)
+
+struct rpmi_ctx {
+	struct mbox_chan *chan;
+	struct mbox_client client;
+	u32 max_msg_size;
+};
+
+struct rpmi_reg_level_discrete {
+	u32 uvolt;
+};
+
+struct rpmi_reg_level_linear {
+	u32 uvolt_min;
+	u32 uvolt_max;
+	u32 uvolt_step;
+};
+
+struct rpmi_reg_domain {
+	u32 id;
+	struct rpmi_ctx *rpmi_ctx;
+	struct device *dev;
+	struct regulator_desc desc;
+	struct regulator_init_data init_data;
+	u32 voltage_format;
+	u32 always_on:1;
+	u32 num_levels;
+	u32 transition_latency;
+	u32 *level;
+	char name[RPMI_REG_DOMAIN_NAME_LEN];
+	struct regulator_dev *rdev;
+	struct regulator_consumer_supply supply;
+	char supply_name[RPMI_REG_SUPPLY_NAME_LEN];
+};
+
+/*
+ * A provider whose domains a consumer can name by DOMAIN_ID, through
+ * "voltage-domains = <&provider DOMAIN_ID>". It is listed once every domain
+ * has been registered, so that devm_rpmi_voltage_supply_alias() can go from
+ * the phandle to the domain.
+ */
+struct rpmi_reg_provider {
+	struct list_head node;
+	struct device *dev;
+	struct rpmi_reg_domain *domains;
+	u32 num_domains;
+};
+
+static LIST_HEAD(rpmi_reg_providers);
+static DEFINE_MUTEX(rpmi_reg_providers_lock);
+
+/* Service ID: RPMI_VOLTAGE_SRV_GET_NUM_DOMAINS */
+struct rpmi_get_num_domain_rx {
+	__le32 status;
+	__le32 num_domains;
+};
+
+/* Service ID: RPMI_VOLTAGE_SRV_GET_ATTRIBUTES */
+struct rpmi_get_domain_attrs_tx {
+	__le32 domain_id;
+};
+
+/* Service ID: RPMI_VOLTAGE_SRV_GET_SUPPORTED_LEVELS */
+struct rpmi_get_supp_levels_tx {
+	__le32 domain_id;
+	__le32 level_index;
+};
+
+struct rpmi_get_supp_levels_rx {
+	__le32 status;
+	__le32 flags;
+	__le32 remaining_items;
+	__le32 returned_items;
+	__le32 level[];
+};
+
+/* Service ID: RPMI_VOLTAGE_SRV_SET_CONFIG */
+struct rpmi_set_config_tx {
+	__le32 domain_id;
+	__le32 config;
+};
+
+struct rpmi_set_config_rx {
+	__le32 status;
+};
+
+/* Service ID: RPMI_VOLTAGE_SRV_GET_CONFIG */
+struct rpmi_get_config_tx {
+	__le32 domain_id;
+};
+
+struct rpmi_get_config_rx {
+	__le32 status;
+	__le32 config;
+};
+
+/* Service ID: RPMI_VOLTAGE_SRV_SET_LEVEL */
+struct rpmi_set_level_tx {
+	__le32 domain_id;
+	__le32 level;
+};
+
+struct rpmi_set_level_rx {
+	__le32 status;
+};
+
+/* Service ID: RPMI_VOLTAGE_SRV_GET_LEVEL */
+struct rpmi_get_level_tx {
+	__le32 domain_id;
+};
+
+struct rpmi_get_level_rx {
+	__le32 status;
+	__le32 level;
+};
+
+/* regulator control */
+enum rpmi_domain_config {
+	RPMI_VOLT_DISABLE = 0,
+	RPMI_VOLT_ENABLE = 1,
+};
+
+struct rpmi_get_domain_attrs_rx {
+	__le32 status;
+	__le32 flags;
+#define REG_VOLTAGE_FORMAT(f)	(FIELD_GET(VOLTAGE_FORMAT_MASK, (f)))
+#define REG_FORMAT_DISCRETE	0
+#define REG_FORMAT_LINEAR	1
+#define REG_ALWAYS_ON(f)	(FIELD_GET(ALWAYS_ON_MASK, (f)))
+	__le32 num_levels;
+	__le32 transition_latency;
+	char name[RPMI_REG_DOMAIN_NAME_LEN];
+};
+
+static int rpmi_reg_get_num_domains(struct rpmi_ctx *mpxy_ctx, u32 *domain)
+{
+	struct rpmi_get_num_domain_rx rx = { };
+	struct rpmi_mbox_message msg;
+	int ret;
+
+	rpmi_mbox_init_send_with_response(&msg, RPMI_VOLT_SRV_GET_NUM_DOMAINS,
+					  NULL, 0, &rx, sizeof(rx));
+
+	ret = rpmi_mbox_send_message(mpxy_ctx->chan, &msg);
+	if (ret)
+		return ret;
+
+	if (rx.status)
+		return rpmi_to_linux_error(le32_to_cpu(rx.status));
+
+	if (msg.data.out_response_len < sizeof(rx))
+		return -EPROTO;
+
+	*domain = le32_to_cpu(rx.num_domains);
+
+	return 0;
+}
+
+static int rpmi_reg_get_attrs(struct rpmi_reg_domain *mpxy_reg)
+{
+	struct rpmi_get_domain_attrs_tx tx;
+	struct rpmi_get_domain_attrs_rx rx = { };
+	struct rpmi_mbox_message msg;
+	u32 flags, format;
+	size_t level_size;
+	int ret;
+
+	tx.domain_id = cpu_to_le32(mpxy_reg->id);
+
+	rpmi_mbox_init_send_with_response(&msg, RPMI_VOLT_SRV_GET_ATTRIBUTES,
+					  &tx, sizeof(tx), &rx, sizeof(rx));
+
+	ret = rpmi_mbox_send_message(mpxy_reg->rpmi_ctx->chan, &msg);
+	if (ret)
+		return ret;
+
+	if (rx.status)
+		return rpmi_to_linux_error(le32_to_cpu(rx.status));
+
+	if (msg.data.out_response_len < sizeof(rx))
+		return -EPROTO;
+
+	flags = le32_to_cpu(rx.flags);
+	format = REG_VOLTAGE_FORMAT(flags);
+
+	mpxy_reg->num_levels = le32_to_cpu(rx.num_levels);
+	mpxy_reg->transition_latency = le32_to_cpu(rx.transition_latency);
+	strscpy(mpxy_reg->name, rx.name, RPMI_REG_DOMAIN_NAME_LEN);
+
+	switch (format) {
+	case REG_FORMAT_DISCRETE:
+		level_size = sizeof(struct rpmi_reg_level_discrete);
+		break;
+	case REG_FORMAT_LINEAR:
+		level_size = sizeof(struct rpmi_reg_level_linear);
+		break;
+	default:
+		dev_err(mpxy_reg->dev, "voltage domain %u: unknown voltage format %u\n",
+			mpxy_reg->id, format);
+		return -EINVAL;
+	}
+
+	mpxy_reg->voltage_format = format;
+	mpxy_reg->always_on = REG_ALWAYS_ON(flags);
+
+	mpxy_reg->level = devm_kcalloc(mpxy_reg->dev, mpxy_reg->num_levels,
+				       level_size, GFP_KERNEL);
+	if (!mpxy_reg->level)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static int rpmi_reg_get_supported_levels(struct rpmi_reg_domain *mpxy_reg)
+{
+	u32 max_msg_size = mpxy_reg->rpmi_ctx->max_msg_size;
+	u32 index = 0, remaining, returned, words, i;
+	struct rpmi_get_supp_levels_tx tx;
+	struct rpmi_get_supp_levels_rx *rx;
+	struct rpmi_mbox_message msg;
+	u32 *level = mpxy_reg->level;
+	int ret = 0;
+
+	switch (mpxy_reg->voltage_format) {
+	case REG_FORMAT_DISCRETE:
+		words = sizeof(struct rpmi_reg_level_discrete) / sizeof(u32);
+		break;
+	case REG_FORMAT_LINEAR:
+		words = sizeof(struct rpmi_reg_level_linear) / sizeof(u32);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	rx = kzalloc(max_msg_size, GFP_KERNEL);
+	if (!rx)
+		return -ENOMEM;
+
+	tx.domain_id = cpu_to_le32(mpxy_reg->id);
+
+	while (index < mpxy_reg->num_levels) {
+		tx.level_index = cpu_to_le32(index);
+
+		rpmi_mbox_init_send_with_response(&msg, RPMI_VOLT_SRV_GET_SUPPORTED_LEVELS,
+						  &tx, sizeof(tx), rx, max_msg_size);
+
+		ret = rpmi_mbox_send_message(mpxy_reg->rpmi_ctx->chan, &msg);
+		if (ret)
+			break;
+
+		if (rx->status) {
+			ret = rpmi_to_linux_error(le32_to_cpu(rx->status));
+			break;
+		}
+
+		if (msg.data.out_response_len < sizeof(*rx)) {
+			ret = -EPROTO;
+			break;
+		}
+
+		remaining = le32_to_cpu(rx->remaining_items);
+		returned = le32_to_cpu(rx->returned_items);
+
+		if (!returned || returned > mpxy_reg->num_levels - index ||
+		    returned > (msg.data.out_response_len - sizeof(*rx)) /
+			       (words * sizeof(u32)) ||
+		    remaining != mpxy_reg->num_levels - index - returned) {
+			dev_err(mpxy_reg->dev,
+				"voltage domain %u: invalid supported levels reply\n",
+				mpxy_reg->id);
+			ret = -EPROTO;
+			break;
+		}
+
+		for (i = 0; i < returned * words; i++)
+			*level++ = le32_to_cpu(rx->level[i]);
+
+		index += returned;
+	}
+
+	kfree(rx);
+
+	return ret;
+}
+
+static int rpmi_reg_set_config(struct rpmi_reg_domain *mpxy_reg, u32 config)
+{
+	struct rpmi_set_config_tx tx;
+	struct rpmi_set_config_rx rx = { };
+	struct rpmi_mbox_message msg;
+	int ret;
+
+	tx.domain_id = cpu_to_le32(mpxy_reg->id);
+	tx.config = cpu_to_le32(config);
+
+	rpmi_mbox_init_send_with_response(&msg, RPMI_VOLT_SRV_SET_CONFIG,
+					  &tx, sizeof(tx), &rx, sizeof(rx));
+
+	ret = rpmi_mbox_send_message(mpxy_reg->rpmi_ctx->chan, &msg);
+	if (ret)
+		return ret;
+
+	if (rx.status)
+		return rpmi_to_linux_error(le32_to_cpu(rx.status));
+
+	if (msg.data.out_response_len < sizeof(rx))
+		return -EPROTO;
+
+	return 0;
+}
+
+static int mpxy_reg_enable(struct regulator_dev *rdev)
+{
+	struct rpmi_reg_domain *mpxy_reg = rdev_get_drvdata(rdev);
+
+	/*
+	 * An always-on domain cannot be switched and is already supplying, so
+	 * enabling it is a no-op rather than an error. Failing here would also
+	 * fail registration of any domain constrained as always-on.
+	 */
+	if (mpxy_reg->always_on)
+		return 0;
+
+	return rpmi_reg_set_config(mpxy_reg, RPMI_VOLT_ENABLE);
+}
+
+static int mpxy_reg_disable(struct regulator_dev *rdev)
+{
+	struct rpmi_reg_domain *mpxy_reg = rdev_get_drvdata(rdev);
+
+	if (mpxy_reg->always_on)
+		return -EPERM;
+
+	return rpmi_reg_set_config(mpxy_reg, RPMI_VOLT_DISABLE);
+}
+
+static int mpxy_reg_is_enabled(struct regulator_dev *rdev)
+{
+	struct rpmi_reg_domain *mpxy_reg = rdev_get_drvdata(rdev);
+	struct rpmi_get_config_tx tx;
+	struct rpmi_get_config_rx rx = { };
+	struct rpmi_mbox_message msg;
+	int ret;
+
+	/* An always-on domain is supplying whatever its config reports. */
+	if (mpxy_reg->always_on)
+		return 1;
+
+	tx.domain_id = cpu_to_le32(mpxy_reg->id);
+
+	rpmi_mbox_init_send_with_response(&msg, RPMI_VOLT_SRV_GET_CONFIG,
+					  &tx, sizeof(tx), &rx, sizeof(rx));
+
+	ret = rpmi_mbox_send_message(mpxy_reg->rpmi_ctx->chan, &msg);
+	if (ret)
+		return ret;
+
+	if (rx.status)
+		return rpmi_to_linux_error(le32_to_cpu(rx.status));
+
+	if (msg.data.out_response_len < sizeof(rx))
+		return -EPROTO;
+
+	return !!(le32_to_cpu(rx.config) & RPMI_VOLT_ENABLE);
+}
+
+static int mpxy_reg_set_voltage_sel(struct regulator_dev *rdev, unsigned int selector)
+{
+	struct rpmi_reg_domain *mpxy_reg = rdev_get_drvdata(rdev);
+	struct rpmi_set_level_tx tx;
+	struct rpmi_set_level_rx rx = { };
+	struct rpmi_mbox_message msg;
+	s32 volt_uV;
+	int ret;
+
+	volt_uV = mpxy_reg->desc.ops->list_voltage(rdev, selector);
+	if (volt_uV <= 0)
+		return -EINVAL;
+
+	tx.domain_id = cpu_to_le32(mpxy_reg->id);
+	tx.level = cpu_to_le32(volt_uV);
+
+	rpmi_mbox_init_send_with_response(&msg, RPMI_VOLT_SRV_SET_LEVEL,
+					  &tx, sizeof(tx), &rx, sizeof(rx));
+
+	ret = rpmi_mbox_send_message(mpxy_reg->rpmi_ctx->chan, &msg);
+	if (ret)
+		return ret;
+
+	if (rx.status)
+		return rpmi_to_linux_error(le32_to_cpu(rx.status));
+
+	if (msg.data.out_response_len < sizeof(rx))
+		return -EPROTO;
+
+	return 0;
+}
+
+static int mpxy_reg_get_voltage_sel(struct regulator_dev *rdev)
+{
+	struct rpmi_reg_domain *mpxy_reg = rdev_get_drvdata(rdev);
+	struct rpmi_get_level_tx tx;
+	struct rpmi_get_level_rx rx = { };
+	struct rpmi_mbox_message msg;
+	s32 volt_uV;
+	int ret;
+
+	tx.domain_id = cpu_to_le32(mpxy_reg->id);
+
+	rpmi_mbox_init_send_with_response(&msg, RPMI_VOLT_SRV_GET_LEVEL,
+					  &tx, sizeof(tx), &rx, sizeof(rx));
+
+	ret = rpmi_mbox_send_message(mpxy_reg->rpmi_ctx->chan, &msg);
+	if (ret)
+		return ret;
+
+	if (rx.status)
+		return rpmi_to_linux_error(le32_to_cpu(rx.status));
+
+	if (msg.data.out_response_len < sizeof(rx))
+		return -EPROTO;
+
+	volt_uV = le32_to_cpu(rx.level);
+
+	return mpxy_reg->desc.ops->map_voltage(rdev, volt_uV, volt_uV);
+}
+
+static const struct regulator_ops mpxy_reg_discrete_ops = {
+	.enable = mpxy_reg_enable,
+	.disable = mpxy_reg_disable,
+	.is_enabled = mpxy_reg_is_enabled,
+	.set_voltage_sel = mpxy_reg_set_voltage_sel,
+	.get_voltage_sel = mpxy_reg_get_voltage_sel,
+	.list_voltage = regulator_list_voltage_table,
+	.map_voltage = regulator_map_voltage_iterate,
+};
+
+static const struct regulator_ops mpxy_reg_multi_linear_ops = {
+	.enable = mpxy_reg_enable,
+	.disable = mpxy_reg_disable,
+	.is_enabled = mpxy_reg_is_enabled,
+	.set_voltage_sel = mpxy_reg_set_voltage_sel,
+	.get_voltage_sel = mpxy_reg_get_voltage_sel,
+	.list_voltage = regulator_list_voltage_linear_range,
+	.map_voltage = regulator_map_voltage_linear_range,
+};
+
+static int rpmi_reg_setup(struct rpmi_reg_domain *mpxy_reg)
+{
+	struct regulation_constraints *constraints = &mpxy_reg->init_data.constraints;
+	struct rpmi_reg_level_linear *linear_level;
+	struct linear_range *linear_ranges;
+	u32 i, linear_index, n_step, top;
+	u32 min_uV = U32_MAX, max_uV = 0;
+
+	mpxy_reg->desc.name = devm_kasprintf(mpxy_reg->dev, GFP_KERNEL, "%s", mpxy_reg->name);
+	if (!mpxy_reg->desc.name)
+		return -ENOMEM;
+
+	mpxy_reg->desc.id = mpxy_reg->id;
+	mpxy_reg->desc.type = REGULATOR_VOLTAGE;
+	mpxy_reg->desc.owner = THIS_MODULE;
+
+	switch (mpxy_reg->voltage_format) {
+	case REG_FORMAT_DISCRETE:
+		mpxy_reg->desc.n_voltages = mpxy_reg->num_levels;
+		mpxy_reg->desc.volt_table = (const unsigned int *)mpxy_reg->level;
+		mpxy_reg->desc.ops = &mpxy_reg_discrete_ops;
+
+		for (i = 0; i < mpxy_reg->num_levels; i++) {
+			/*
+			 * The specification lists discrete levels in strictly
+			 * ascending order, and VOLT_SET_LEVEL carries a level
+			 * as an int32, so one above that cannot be set at all.
+			 */
+			if (mpxy_reg->level[i] > INT_MAX ||
+			    (i && mpxy_reg->level[i] <= mpxy_reg->level[i - 1]))
+				return -EINVAL;
+
+			min_uV = min(min_uV, mpxy_reg->level[i]);
+			max_uV = max(max_uV, mpxy_reg->level[i]);
+		}
+		break;
+
+	case REG_FORMAT_LINEAR:
+		linear_level = (struct rpmi_reg_level_linear *)mpxy_reg->level;
+
+		linear_ranges = devm_kcalloc(mpxy_reg->dev, mpxy_reg->num_levels,
+					     sizeof(struct linear_range), GFP_KERNEL);
+		if (!linear_ranges)
+			return -ENOMEM;
+
+		for (i = 0, linear_index = 0; i < mpxy_reg->num_levels; i++) {
+			/*
+			 * The RPMI specification defines a linear range as
+			 * having a constant step size, so a zero step is
+			 * malformed and would divide by zero below.
+			 */
+			if (!linear_level[i].uvolt_step)
+				return -EINVAL;
+
+			if (linear_level[i].uvolt_min > linear_level[i].uvolt_max ||
+			    linear_level[i].uvolt_max > INT_MAX ||
+			    (i && linear_level[i].uvolt_min <= linear_level[i - 1].uvolt_max))
+				return -EINVAL;
+
+			n_step = (linear_level[i].uvolt_max - linear_level[i].uvolt_min) /
+				 linear_level[i].uvolt_step;
+
+			linear_ranges[i].min = linear_level[i].uvolt_min;
+			linear_ranges[i].min_sel = linear_index;
+			linear_ranges[i].max_sel = linear_index + n_step;
+			linear_ranges[i].step = linear_level[i].uvolt_step;
+
+			/*
+			 * max_sel is inclusive, so a range spans n_step + 1
+			 * selectors and the next range starts past the end of
+			 * this one.
+			 */
+			linear_index += n_step + 1;
+
+			/*
+			 * Only levels that land on a step are selectable, so
+			 * the top of the range is the last step at or below
+			 * uvolt_max, not uvolt_max itself.
+			 */
+			top = linear_level[i].uvolt_min + n_step * linear_level[i].uvolt_step;
+			min_uV = min(min_uV, linear_level[i].uvolt_min);
+			max_uV = max(max_uV, top);
+		}
+
+		/*
+		 * A linear range only permits the levels that fall on its
+		 * steps, so it is enumerated through selectors. Leaving
+		 * continuous_voltage_range clear is what keeps the core from
+		 * treating every voltage in between as selectable.
+		 */
+		mpxy_reg->desc.linear_ranges = linear_ranges;
+		mpxy_reg->desc.n_linear_ranges = mpxy_reg->num_levels;
+		mpxy_reg->desc.n_voltages = linear_index;
+		mpxy_reg->desc.ops = &mpxy_reg_multi_linear_ops;
+
+		break;
+	}
+
+	if (min_uV > max_uV)
+		return -EINVAL;
+
+	/*
+	 * Everything a regulator constraint would describe is already known:
+	 * the levels come from VOLT_GET_SUPPORTED_LEVELS and the always-on
+	 * capability from the VOLT_GET_ATTRIBUTES flags. Build the constraints
+	 * from that rather than from a device tree node, which would only be a
+	 * second copy of the same facts. Without them the core leaves
+	 * REGULATOR_CHANGE_VOLTAGE clear and refuses every set_voltage().
+	 */
+	constraints->name = mpxy_reg->desc.name;
+	constraints->min_uV = min_uV;
+	constraints->max_uV = max_uV;
+	constraints->always_on = mpxy_reg->always_on;
+	constraints->valid_ops_mask = REGULATOR_CHANGE_VOLTAGE;
+	constraints->settling_time = mpxy_reg->transition_latency;
+	if (!mpxy_reg->always_on)
+		constraints->valid_ops_mask |= REGULATOR_CHANGE_STATUS;
+
+	return 0;
+}
+
+static int rpmi_reg_attr_setup(struct device *dev, struct rpmi_ctx *mpxy_ctx)
+{
+	struct rpmi_mbox_message msg;
+	int ret;
+
+	/* Validate RPMI specification version */
+	rpmi_mbox_init_get_attribute(&msg, RPMI_MBOX_ATTR_SPEC_VERSION);
+	ret = rpmi_mbox_send_message(mpxy_ctx->chan, &msg);
+	if (ret) {
+		dev_err(dev, "Failed to get spec version\n");
+		return ret;
+	}
+
+	if (msg.attr.value < RPMI_MKVER(1, 0)) {
+		dev_err(dev,
+			"msg protocol version mismatch, expected 0x%x, found 0x%x\n",
+			RPMI_MKVER(1, 0), msg.attr.value);
+		return -EINVAL;
+	}
+
+	/* Validate voltage service group ID */
+	rpmi_mbox_init_get_attribute(&msg, RPMI_MBOX_ATTR_SERVICEGROUP_ID);
+	ret = rpmi_mbox_send_message(mpxy_ctx->chan, &msg);
+	if (ret) {
+		dev_err(dev, "Failed to get service group ID\n");
+		return ret;
+	}
+
+	if (msg.attr.value != RPMI_SRVGRP_VOLTAGE) {
+		dev_err(dev,
+			"service group match failed, expected 0x%x, found 0x%x\n",
+			RPMI_SRVGRP_VOLTAGE, msg.attr.value);
+		return -EINVAL;
+	}
+
+	/* Validate voltage service group version */
+	rpmi_mbox_init_get_attribute(&msg, RPMI_MBOX_ATTR_SERVICEGROUP_VERSION);
+	ret = rpmi_mbox_send_message(mpxy_ctx->chan, &msg);
+	if (ret) {
+		dev_err(dev, "Failed to get service group version\n");
+		return ret;
+	}
+
+	if (msg.attr.value < RPMI_MKVER(1, 0)) {
+		dev_err(dev,
+			"service group version failed, expected 0x%x, found 0x%x\n",
+			RPMI_MKVER(1, 0), msg.attr.value);
+		return -EINVAL;
+	}
+
+	/* Get max message size */
+	rpmi_mbox_init_get_attribute(&msg, RPMI_MBOX_ATTR_MAX_MSG_DATA_SIZE);
+	ret = rpmi_mbox_send_message(mpxy_ctx->chan, &msg);
+	if (ret) {
+		dev_err(dev, "Failed to get max message data size\n");
+		return ret;
+	}
+
+	if (msg.attr.value < sizeof(struct rpmi_get_supp_levels_rx) +
+			     sizeof(struct rpmi_reg_level_linear)) {
+		dev_err(dev, "max message data size %u too small\n",
+			msg.attr.value);
+		return -EINVAL;
+	}
+	mpxy_ctx->max_msg_size = msg.attr.value;
+
+	return 0;
+}
+
+static void rpmi_reg_mbox_chan_release(void *data)
+{
+	mbox_free_channel((struct mbox_chan *)data);
+}
+
+/*
+ * The child of the "regulators" container describing domain @id, if any.
+ *
+ * Children are tied to domains by "reg", the RPMI DOMAIN_ID, the way SCMI
+ * voltage domains are. The DOMAIN_ID is unique by definition; the name a
+ * domain reports is neither guaranteed unique nor stable, and is truncated to
+ * RPMI_REG_DOMAIN_NAME_LEN, so it cannot be relied on to find the child.
+ */
+static struct device_node *rpmi_reg_find_child(struct device_node *regulators,
+					       u32 id)
+{
+	u32 reg;
+
+	for_each_available_child_of_node_scoped(regulators, child) {
+		if (!of_property_read_u32(child, "reg", &reg) && reg == id)
+			return of_node_get(child);
+	}
+
+	return NULL;
+}
+
+/*
+ * Fold a board level constraint from the device tree into the constraints
+ * built from what the domain reported.
+ *
+ * Each domain may have a child in the optional "regulators" container, the
+ * way SCMI voltage domains do. The child is what a consumer's "<name>-supply"
+ * points at, and it is also the one place a board can say what it permits the
+ * rail to supply, which RPMI has no way to express.
+ *
+ * Unlike SCMI, a child that says nothing about voltage does not freeze the
+ * rail: whatever it leaves out is taken from the levels the domain advertised,
+ * so that describing a domain for its phandle does not mean restating its
+ * range. What it does give narrows that range, and a minimum equal to a
+ * maximum pins the rail to one voltage.
+ *
+ * The child is parsed here rather than through desc.of_match, because the
+ * core would then use the device tree constraints in place of the discovered
+ * ones instead of on top of them.
+ */
+static int rpmi_reg_apply_dt(struct rpmi_reg_domain *mpxy_reg,
+			     struct device_node *np)
+{
+	struct regulation_constraints *c = &mpxy_reg->init_data.constraints;
+	struct regulator_init_data *dt;
+	int min_uV = c->min_uV, max_uV = c->max_uV;
+	unsigned int settling_time = c->settling_time;
+	bool always_on = c->always_on;
+
+	dt = of_get_regulator_init_data(mpxy_reg->dev, np, &mpxy_reg->desc);
+	if (!dt)
+		return -EINVAL;
+
+	*c = dt->constraints;
+
+	if (!c->name)
+		c->name = mpxy_reg->desc.name;
+
+	/*
+	 * A bound the child sets replaces the discovered one, so the child can
+	 * only narrow the range if it stays inside it. The core clamps both to
+	 * the selectable levels when the regulator is registered, and rejects
+	 * a minimum above the maximum.
+	 */
+	if (dt->constraints.min_uV)
+		min_uV = dt->constraints.min_uV;
+	if (dt->constraints.max_uV)
+		max_uV = dt->constraints.max_uV;
+	c->min_uV = min_uV;
+	c->max_uV = max_uV;
+
+	/*
+	 * Bring the rail inside a range the device tree gave, even when it gave
+	 * only one bound. The core only does that with both, and a discovered
+	 * bound on its own never needs it.
+	 */
+	c->apply_uV = dt->constraints.min_uV || dt->constraints.max_uV;
+
+	/* A domain the microcontroller keeps on stays on whatever the child says. */
+	c->always_on = always_on || dt->constraints.always_on;
+
+	if (!c->ramp_delay && !c->settling_time &&
+	    !c->settling_time_up && !c->settling_time_down)
+		c->settling_time = settling_time;
+
+	c->valid_ops_mask &= ~(REGULATOR_CHANGE_VOLTAGE | REGULATOR_CHANGE_STATUS);
+	if (c->min_uV != c->max_uV)
+		c->valid_ops_mask |= REGULATOR_CHANGE_VOLTAGE;
+	if (!c->always_on)
+		c->valid_ops_mask |= REGULATOR_CHANGE_STATUS;
+
+	return 0;
+}
+
+static struct rpmi_reg_provider *rpmi_reg_find_provider(struct device_node *np)
+{
+	struct rpmi_reg_provider *provider;
+
+	lockdep_assert_held(&rpmi_reg_providers_lock);
+
+	list_for_each_entry(provider, &rpmi_reg_providers, node) {
+		if (dev_of_node(provider->dev) == np)
+			return provider;
+	}
+
+	return NULL;
+}
+
+static void rpmi_reg_provider_remove(void *data)
+{
+	struct rpmi_reg_provider *provider = data;
+
+	guard(mutex)(&rpmi_reg_providers_lock);
+	list_del(&provider->node);
+}
+
+static void rpmi_reg_put_device(void *data)
+{
+	put_device(data);
+}
+
+/**
+ * devm_rpmi_voltage_supply_alias - resolve a supply named by DOMAIN_ID
+ * @dev: consumer device
+ * @id: supply name, as listed in the consumer's "voltage-domain-names"
+ *
+ * A consumer may name an RPMI voltage domain by its DOMAIN_ID,
+ *
+ *	voltage-domains = <&rpmi_voltage 7>;
+ *	voltage-domain-names = "vdd";
+ *
+ * instead of by a "<name>-supply" phandle to a node describing the domain. The
+ * regulator core only follows the latter, so this tells it where @id is: once
+ * it returns, regulator_get(@dev, @id) reaches that domain, and so does every
+ * other lookup of @id for @dev, such as the one the OPP core makes. The
+ * mapping lasts until @dev is unbound.
+ *
+ * "voltage-domain-names" may be left out when "voltage-domains" has a single
+ * entry.
+ *
+ * Nothing orders the consumer's probe after the provider's, since the core has
+ * no idea "voltage-domains" names a supplier, so the provider may not be there
+ * yet. Resolve every supply before doing anything that cannot be repeated.
+ *
+ * Return: 0 on success, -EPROBE_DEFER until the provider has registered its
+ * domains, or another negative error number.
+ */
+int devm_rpmi_voltage_supply_alias(struct device *dev, const char *id)
+{
+	struct device_node *np = dev_of_node(dev);
+	struct rpmi_reg_provider *provider;
+	struct rpmi_reg_domain *domain;
+	struct of_phandle_args args;
+	const char *src, *alias;
+	int index = 0, ret;
+
+	if (!np || !id)
+		return -EINVAL;
+
+	if (of_property_present(np, "voltage-domain-names")) {
+		index = of_property_match_string(np, "voltage-domain-names", id);
+		if (index < 0)
+			return index;
+	} else {
+		ret = of_count_phandle_with_args(np, "voltage-domains",
+						 "#voltage-domain-cells");
+		if (ret < 0)
+			return ret;
+		if (ret != 1)
+			return -EINVAL;
+	}
+
+	ret = of_parse_phandle_with_args(np, "voltage-domains",
+					 "#voltage-domain-cells", index, &args);
+	if (ret)
+		return ret;
+
+	if (args.args_count != 1 || !of_device_is_available(args.np)) {
+		of_node_put(args.np);
+		return -ENODEV;
+	}
+
+	guard(mutex)(&rpmi_reg_providers_lock);
+
+	provider = rpmi_reg_find_provider(args.np);
+	of_node_put(args.np);
+	if (!provider)
+		return -EPROBE_DEFER;
+
+	if (args.args[0] >= provider->num_domains)
+		return -EINVAL;
+
+	/* A domain that failed to initialise has nothing to hand out. */
+	domain = &provider->domains[args.args[0]];
+	if (!domain->rdev)
+		return -ENODEV;
+
+	/*
+	 * The core keeps the names and the provider device by reference, so
+	 * give them the lifetime of the mapping: the caller's @id may be on its
+	 * stack, and the provider may unbind first.
+	 */
+	src = devm_kstrdup_const(dev, id, GFP_KERNEL);
+	alias = devm_kstrdup(dev, domain->supply_name, GFP_KERNEL);
+	if (!src || !alias)
+		return -ENOMEM;
+
+	get_device(provider->dev);
+	ret = devm_add_action_or_reset(dev, rpmi_reg_put_device, provider->dev);
+	if (ret)
+		return ret;
+
+	return devm_regulator_register_supply_alias(dev, src, provider->dev,
+						    alias);
+}
+EXPORT_SYMBOL_GPL(devm_rpmi_voltage_supply_alias);
+
+static int rpmi_reg_probe(struct platform_device *pdev)
+{
+	struct device_node *regulators __free(device_node) = NULL;
+	struct regulator_config config = {};
+	struct rpmi_reg_provider *provider;
+	struct rpmi_reg_domain *rpmi_reg;
+	struct device *dev = &pdev->dev;
+	struct regulator_dev *rdev;
+	struct rpmi_ctx *mpxy_ctx;
+	u32 num_domains = 0;
+	u32 registered = 0;
+	int ret;
+	u32 i;
+
+	mpxy_ctx = devm_kzalloc(&pdev->dev, sizeof(*mpxy_ctx), GFP_KERNEL);
+	if (!mpxy_ctx)
+		return -ENOMEM;
+
+	/* Setup mailbox client */
+	mpxy_ctx->client.dev		= dev;
+	mpxy_ctx->client.rx_callback	= NULL;
+	mpxy_ctx->client.tx_block	= false;
+	mpxy_ctx->client.knows_txdone	= true;
+	mpxy_ctx->client.tx_tout	= 0;
+
+	/* Request mailbox channel */
+	mpxy_ctx->chan = mbox_request_channel(&mpxy_ctx->client, 0);
+	if (IS_ERR(mpxy_ctx->chan))
+		return PTR_ERR(mpxy_ctx->chan);
+
+	ret = devm_add_action_or_reset(dev, rpmi_reg_mbox_chan_release,
+				       mpxy_ctx->chan);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to add rpmi mbox channel cleanup\n");
+
+	ret = rpmi_reg_attr_setup(dev, mpxy_ctx);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to verify RPMI attribute\n");
+
+	/* Get number of voltage domain */
+	ret = rpmi_reg_get_num_domains(mpxy_ctx, &num_domains);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to get number of voltage domains\n");
+
+	if (!num_domains)
+		return dev_err_probe(dev, -EINVAL, "No voltage domains found!\n");
+
+	dev_dbg(dev, "%u MPXY voltage domains are found\n", num_domains);
+
+	provider = devm_kzalloc(dev, sizeof(*provider), GFP_KERNEL);
+	if (!provider)
+		return -ENOMEM;
+
+	rpmi_reg = devm_kcalloc(dev, num_domains, sizeof(*rpmi_reg), GFP_KERNEL);
+	if (!rpmi_reg)
+		return -ENOMEM;
+
+	provider->dev = dev;
+	provider->domains = rpmi_reg;
+	provider->num_domains = num_domains;
+
+	regulators = of_get_child_by_name(dev_of_node(dev), "regulators");
+
+	for (i = 0; i < num_domains; i++, rpmi_reg++) {
+		struct device_node *np __free(device_node) = NULL;
+
+		rpmi_reg->rpmi_ctx = mpxy_ctx;
+		rpmi_reg->dev = dev;
+		rpmi_reg->id = i;
+
+		ret = rpmi_reg_get_attrs(rpmi_reg);
+		if (ret) {
+			dev_warn(rpmi_reg->dev,
+				 "voltage domain %d initialization failed\n",
+				 rpmi_reg->id);
+			continue;
+		}
+
+		ret = rpmi_reg_get_supported_levels(rpmi_reg);
+		if (ret) {
+			dev_warn(rpmi_reg->dev,
+				 "voltage domain %d initialization failed\n",
+				 rpmi_reg->id);
+			continue;
+		}
+
+		ret = rpmi_reg_setup(rpmi_reg);
+		if (ret) {
+			dev_warn(rpmi_reg->dev,
+				 "voltage domain %d initialization failed\n",
+				 rpmi_reg->id);
+			continue;
+		}
+
+		if (regulators)
+			np = rpmi_reg_find_child(regulators, rpmi_reg->id);
+
+		if (np) {
+			ret = rpmi_reg_apply_dt(rpmi_reg, np);
+			if (ret) {
+				dev_warn(dev, "voltage domain %s: bad constraints in %pOF\n",
+					 rpmi_reg->desc.name, np);
+				continue;
+			}
+		}
+
+		config.dev = rpmi_reg->dev;
+		config.driver_data = rpmi_reg;
+		config.init_data = &rpmi_reg->init_data;
+		/*
+		 * A domain without a child gets no node rather than sharing the
+		 * provider's: of_find_regulator_by_node() would otherwise resolve
+		 * a phandle to the provider to whichever domain registered first.
+		 * Such a domain cannot be named by a "-supply", only through
+		 * "voltage-domains".
+		 */
+		config.of_node = np;
+
+		/*
+		 * A name to look the domain up by without a node of its own,
+		 * for a consumer that names it through "voltage-domains". It
+		 * only has to be unique on this provider, which the DOMAIN_ID
+		 * is and the name the domain reports is not.
+		 */
+		snprintf(rpmi_reg->supply_name, sizeof(rpmi_reg->supply_name),
+			 "domain%u", rpmi_reg->id);
+		rpmi_reg->supply.dev_name = dev_name(dev);
+		rpmi_reg->supply.supply = rpmi_reg->supply_name;
+		rpmi_reg->init_data.consumer_supplies = &rpmi_reg->supply;
+		rpmi_reg->init_data.num_consumer_supplies = 1;
+
+		rdev = devm_regulator_register(rpmi_reg->dev, &rpmi_reg->desc, &config);
+		if (IS_ERR(rdev)) {
+			dev_err(dev, "failed to register RPMI voltage domain %d: %pe\n",
+				i, rdev);
+			continue;
+		}
+
+		rpmi_reg->rdev = rdev;
+		registered++;
+	}
+
+	/*
+	 * Only now can a consumer be pointed at a domain, and it is taken off
+	 * the list again before any of them is unregistered.
+	 */
+	scoped_guard(mutex, &rpmi_reg_providers_lock)
+		list_add(&provider->node, &rpmi_reg_providers);
+
+	ret = devm_add_action_or_reset(dev, rpmi_reg_provider_remove, provider);
+	if (ret)
+		return ret;
+
+	/*
+	 * One line for the lot. A domain that did not make it has already said
+	 * so above, so naming each one that did only buys a count.
+	 */
+	dev_info(dev, "%u MPXY voltage domains registered\n", registered);
+
+	return 0;
+}
+
+static const struct of_device_id rpmi_reg_of_match[] = {
+	{ .compatible = "riscv,rpmi-voltage" },
+	{ },
+};
+
+MODULE_DEVICE_TABLE(of, rpmi_reg_of_match);
+
+static struct platform_driver rpmi_reg_platdrv = {
+	.driver = {
+		.name = "riscv-rpmi-regulator",
+		.of_match_table = rpmi_reg_of_match,
+	},
+	.probe = rpmi_reg_probe,
+};
+
+module_platform_driver(rpmi_reg_platdrv);
+
+MODULE_AUTHOR("Joshua Yeong <joshua.yeong@starfivetech.com>");
+MODULE_DESCRIPTION("Regulator Driver based on SBI MPXY extension");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mailbox/riscv-rpmi-message.h b/include/linux/mailbox/riscv-rpmi-message.h
index d5362b5821f9..f96ba08a56bd 100644
--- a/include/linux/mailbox/riscv-rpmi-message.h
+++ b/include/linux/mailbox/riscv-rpmi-message.h
@@ -92,9 +92,23 @@ static inline int rpmi_to_linux_error(int rpmi_error)
 
 /* RPMI service group IDs */
 #define RPMI_SRVGRP_SYSTEM_MSI		0x00002
+#define RPMI_SRVGRP_VOLTAGE		0x00007
 #define RPMI_SRVGRP_CLOCK		0x00008
 #define RPMI_SRVGRP_DEVICE_POWER	0x00009
 
+/* RPMI Voltage Service IDs */
+enum rpmi_voltage_service_id {
+	RPMI_VOLT_SRV_ENABLE_NOTIFICATION = 0x01,
+	RPMI_VOLT_SRV_GET_NUM_DOMAINS = 0x02,
+	RPMI_VOLT_SRV_GET_ATTRIBUTES = 0x03,
+	RPMI_VOLT_SRV_GET_SUPPORTED_LEVELS = 0x04,
+	RPMI_VOLT_SRV_SET_CONFIG = 0x05,
+	RPMI_VOLT_SRV_GET_CONFIG = 0x06,
+	RPMI_VOLT_SRV_SET_LEVEL = 0x07,
+	RPMI_VOLT_SRV_GET_LEVEL = 0x08,
+	RPMI_VOLT_SRV_ID_MAX_COUNT,
+};
+
 /* RPMI clock service IDs */
 enum rpmi_clock_service_id {
 	RPMI_CLK_SRV_ENABLE_NOTIFICATION = 0x01,
diff --git a/include/linux/regulator/riscv-rpmi-regulator.h b/include/linux/regulator/riscv-rpmi-regulator.h
new file mode 100644
index 000000000000..684d0c1d7760
--- /dev/null
+++ b/include/linux/regulator/riscv-rpmi-regulator.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * RISC-V RPMI voltage service group consumer interface
+ *
+ * Copyright (C) 2026 Shanghai StarFive Technology Co., Ltd.
+ *
+ * The domains of an RPMI voltage provider are regulators, and a consumer
+ * normally names one the usual way, with a "<name>-supply" phandle to the
+ * domain's node. A consumer may instead name a domain by its DOMAIN_ID,
+ *
+ *	voltage-domains = <&rpmi_voltage 7>;
+ *	voltage-domain-names = "vdd";
+ *
+ * which needs no node for the domain but which the regulator core cannot
+ * follow on its own. devm_rpmi_voltage_supply_alias() resolves such a name,
+ * after which the consumer uses the regulator API as it would for any other
+ * supply.
+ */
+
+#ifndef _LINUX_REGULATOR_RISCV_RPMI_REGULATOR_H_
+#define _LINUX_REGULATOR_RISCV_RPMI_REGULATOR_H_
+
+#include <linux/errno.h>
+
+struct device;
+
+#if IS_ENABLED(CONFIG_REGULATOR_RISCV_RPMI)
+
+int devm_rpmi_voltage_supply_alias(struct device *dev, const char *id);
+
+#else
+
+static inline int devm_rpmi_voltage_supply_alias(struct device *dev,
+						 const char *id)
+{
+	return -ENODEV;
+}
+
+#endif
+
+#endif /* _LINUX_REGULATOR_RISCV_RPMI_REGULATOR_H_ */
-- 
2.43.0

