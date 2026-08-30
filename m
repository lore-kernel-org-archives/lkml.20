Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2111.outbound.protection.partner.outlook.cn [139.219.146.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950583806DC;
	Sun, 30 Aug 2026 06:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788072711; cv=fail; b=kYpVCWlkBqfncy1lwsBivVe0/qimXEaBh/KtAsuEIq5FhbCNP4Z1c+imO7337tVnFiBrTRJQDO2TqVIg8R8wUWaAKU61ye8BeHDWxvghcI/V7ANWVn6huLM3wvq/Ld10CvNULUixBRO2+7eECe5blUc97fuEZoXJvw2kAiykGDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788072711; c=relaxed/simple;
	bh=//EUbXz5Fzy9UT31Lnwm3/KLGodgN17UIdCbtiNNBBA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OlGq7N9Cw17Ml670X2ViU72tVMYVlPT9eou79jiNZGN5P6MTXBmc+o3i1vSq6mFTYZ2nlMx1kmpfoTIZ636wbSRo/Zd2tNWrTnRBh2WbxnsIgAfUQAZR7GwAboatnqszs57iRYw7zbHiOXpQCJBCYeJumF34cqt8GjhE/TdzPfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z6k3WaVMhxLBof9MCsK+h3PiOU2HnJoQFbjjqmUsfnuAPbyCJ1T6fEJQd7yN7n15Ek4lh1ZcdymAoz6yA7OnbR08t+tmt4tdTvOlxYAAIZ546jDVZ94bHZrQi39CEJIvKjdXiHEjzAuflNVu5tKDBzB3fJxcnh7YfklRMcb/Ad+j9StfzUIC8IKKAL8O7PiGxBVSWUbzceGjraYTneOnl3zd+yiIezbAZAIbcZJueh6uLVHr/K54sM0T2V8hMx4gqhcuPvs6Nzmq0JQKoppnEa62XiSjHyjpvbg9mC9ZVFbi3iAUCJduPgksqDimKDIYSZhtsm2uuVmfOcq56J2lcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y9q1WBxZ8G1IYB9OizD+bWGG7Gnz7xsULxF2ff83zj0=;
 b=S+5ueLNtGqZULkDtUEifVSMSBbW3ulQBZPInjIv//ltOZKNHkypsxj4Tp3aFpEdMxWhPs9yp2g5CA4+IGVlXuWIC0boVYY3zjNbUQUxT6MBP3NxAcmqnMvy3zAE0vJACMlClcAwjBT5l7lEWzCsorCGOTZMSmQWiw+9JCseLjlGCj7GwmDwCE7rwpwaq3fUqrPHoRwKICJZvdVDNfwVdbedPd6p5aNHQlh0efHeMILdhQqdDOAIoi7qmmPcXn4kc/u4C80AOfRC+ssmt5nWinPqkxbqO4AuV+ALhfnbBOGzMoLMf7tDpiiseWbKEADjX9BjQetJ1zV/mkiL5anu/EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1169.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Sun, 30 Aug
 2026 06:51:33 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Sun, 30 Aug 2026 06:51:33 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 2/2] soc: starfive: Add JHB100 UART Routing driver
Date: Sat, 29 Aug 2026 23:51:18 -0700
Message-Id: <20260830065118.51551-3-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260830065118.51551-1-changhuang.liang@starfivetech.com>
References: <20260830065118.51551-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJXPR01CA0069.CHNPR01.prod.partner.outlook.cn (10.43.33.36)
 To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn (10.2.3.102)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1169:EE_
X-MS-Office365-Filtering-Correlation-Id: d9808ae8-c963-4727-6fbc-08df0663201a
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|23010399003|366016|376014|22082099003|10067099003|6133799003|56012099006|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	xWJG95YpMI8PO3H+Bez04Cd3z2QZwF90GEMFYDnmVoYge3XRHh2LqtrUOzJWOsmgWNW650ZFgrwloHMu2V8rqJUauy54TmyaSlLXDtKqkhr4Wp+vdY4JwMbEkqukhNuK1yfK7nj9w4mCvS1fHWE7duL2ahlnD2V5OaGHj962FwC7/UTZ7F5Baue3B9wzgf3x4d1bUTS3eQgnqTPj/jUKE9GhnlBHdPGjMr/vNi7X5ld/ZGdj0Lw2p8CnWoA7WzxLE3Q5dj36GQYYcMYevyELPITAUi4qzuESSruT7KvnJAEpLbd8mliEij1Fa19YPH6IKGshUuURiTAp3hgkKEmYmD1fr24YKGvuH3KFb/WQoImE+kJVD4LEfgbyq+3SKY4CmRNIZy2uXmUlbhJhB3Q3bXvjFQ0sjIHDRm2RwTu1EHWVpUwbNssfeZ2zIuTn/yPh6mKBEHWYKh3WosIiVY9HQwJyRaoG3NyMMN7+ATZv3F2EnfG8NIkGPHT+OekJep5yy2Ko7gq60r6Et5tmMy7OL+ESQw9rvvtoaK6feRLbdut+k6cpXqHAskjoMKSrRA7a
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(23010399003)(366016)(376014)(22082099003)(10067099003)(6133799003)(56012099006)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RX1e8H1dtyZ10Ae8D4WH6KIN3XvCGZFxcdJFoe833BZiwJfXEdQAdMmVvxNm?=
 =?us-ascii?Q?yrbqknnBEiW33I3rxHWnRTIfWV8F9SUSAabt8RTp/x2IMD4L7jwVy+zQJln8?=
 =?us-ascii?Q?3kjKtGsJT4d2O4sx2Q9X8diG3nzdWighjigMmpD5smtDqC9MRbBZSRvizCgq?=
 =?us-ascii?Q?y826dKyiDUaYR/n7EVW+M3+sIZA44xSmLQytOSQDHd2RqXsGLg+kabIqxWSi?=
 =?us-ascii?Q?L/lWoPzdXsXOXaxn6WSQ1FTc2e+cH8t8/VfWnpBIQtGqh6yOK70AaLfvr2BA?=
 =?us-ascii?Q?5hEy/KOG8yjyAkc9afud0OkX2FiX6TrGHvlC+1zA3ISUZHUrQeRB/TFZjeyt?=
 =?us-ascii?Q?M9jn2GM0QCYj9aVOUYkxC7vZnC1iY10Q5II6hGfb44nDbivGWqSAzI86q/vc?=
 =?us-ascii?Q?dcwTCxGn+7fJ4qTcBbMyJCx/RQALSnk7v0UxVBEd3MiwMkgZF2UXtWVjc7qn?=
 =?us-ascii?Q?eLE6BrMwn3eB/oZUqA6/tkYE4OhHAQPc5P+2P+ZvnnkehBj0Dqh+rFWTT26O?=
 =?us-ascii?Q?x1j7R1c0LUE2t5If+FusecPK2kqx2WFOoMjVOpES08fnIxxf+YIC2gZV1g6+?=
 =?us-ascii?Q?nAyWWAY4MNBh7eXyoFPj9Ag+tQekwmtG5FtPgS5a6UvpiERvxFT2p2TY4ZM9?=
 =?us-ascii?Q?cZIABIt+LzstjPA1nXAq9ZIZ/i4PFVA12nmaFe94rVEVbI0eyn+0dY3CAlAh?=
 =?us-ascii?Q?SaHaY/mqzHqjVmIyW9e6kpt6PiquFwgDgd1m+hpuQyu+bCd47HhrlID7h4Ez?=
 =?us-ascii?Q?xOXiFyIc+Lr9OFGJOpXpLeGMW9zuMfZqWNREirQC/WDqrEE3KPmgfsUsgZDJ?=
 =?us-ascii?Q?NnB+QZn8z5CMrmIIR/9T9huElAhlsYh9Zh1niSCxSS+oCjdH7qP8qdGvgoDM?=
 =?us-ascii?Q?UK3JF2wlN2ay83PeXH3YXTKh843FK+gUGMvJEXJUYR21AnmM1n+5sqcbwt+d?=
 =?us-ascii?Q?oE0X8HWzNLCOsEInaH4mVkJ7gHQdoBtNLR0J7f2Sr7sOCFL0+36trslNZbOc?=
 =?us-ascii?Q?8rbYiDHjpdhYY+uiBF43MwBLW5HEYR+Lf6jNkWPh1MurCkyd/IN1M0qGHD1y?=
 =?us-ascii?Q?1AMOytc0BsVz1kWHlenBmewzYryuyIptDk2691wzIa54Oc6k/W++iHdwrZYf?=
 =?us-ascii?Q?/EL2RBB7vh8WiyUg0PdsRCivCsChWxTCzzt0XxkYwScscZTPuaxe25DGYTos?=
 =?us-ascii?Q?ek8WGQwuL2RRQtW/pRBGDcR4fKyFNsllIWe7+C5LkhXMagKQ7jdVqErdstR1?=
 =?us-ascii?Q?DlExH9qFQV0vAXlinc0EfMkw7BbI6vU78XnbQCKsLsfYN04WLXSX2gXgq/qS?=
 =?us-ascii?Q?1KARyISlGrqT1mrMtPnW9rYCoJMYftsDIwcIzlbTK+1EOhrPSupeaUIPXfJV?=
 =?us-ascii?Q?pJKuyocpSy5/BOEFcrG1C6Y2d8KCLvwfklMUZdxw3XPcW5dOh1XAe8m5/eUi?=
 =?us-ascii?Q?G7pmj9KGbXl0Qf0ZbBTsKT/b/Bbsr12+3sDH79xesVZg6YAZ3Wq+sjHxY6Dq?=
 =?us-ascii?Q?q59VmWZIenFRqoi6gQKPv85CHFbJH54swK39b9fpJCPA6XJLISgfHr68+L9Y?=
 =?us-ascii?Q?Qd2xehL+S7irFbHTDTKU+W0+mS+d+jOF/J5XfcC7L3VbC0nWnY3GoebmGlBW?=
 =?us-ascii?Q?9+v5UfUKwtPvhSGDy5GpP2sO1mcx+KBF+cVSlaRpy0GdpY4QzM6JoAploB2q?=
 =?us-ascii?Q?mwELH/w3U8G60bJ2hCnDRnqwsJ6AzeGfYbZp8jzga+rDpU1EbHA/ofZfxRfk?=
 =?us-ascii?Q?J661sbEF30uiisE099LI9LluXJgQvUnWdaskbmTFtoqiKf+7wMar?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9808ae8-c963-4727-6fbc-08df0663201a
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 06:51:32.1518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O9lLRkqg4yxrT4AvRQ4TkdN4cAocs1pPHuGmXd4uPnu1axGnjMJMzfVHoGFjZXm2hIwXjJ+QvxALoYWVhnkQw34G6WHM0Dn81+oW+6E8v2890TCq1Gb5fTKkmE+RdfAT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1169

Add driver support for JHB100 UART Routing control, allowing runtime
configuration of RX muxes between UART controllers and I/O pins.

A sysfs interface is provided for easy checking and updating of routing
paths.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../sysfs-driver-starfive-jhb100-uart-routing |  45 +++
 MAINTAINERS                                   |   7 +
 drivers/soc/starfive/Kconfig                  |   1 +
 drivers/soc/starfive/Makefile                 |   1 +
 drivers/soc/starfive/uart-routing/Kconfig     |  14 +
 drivers/soc/starfive/uart-routing/Makefile    |   2 +
 .../uart-routing/jhb100-uart-routing.c        | 262 ++++++++++++++++++
 7 files changed, 332 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-starfive-jhb100-uart-routing
 create mode 100644 drivers/soc/starfive/uart-routing/Kconfig
 create mode 100644 drivers/soc/starfive/uart-routing/Makefile
 create mode 100644 drivers/soc/starfive/uart-routing/jhb100-uart-routing.c

diff --git a/Documentation/ABI/testing/sysfs-driver-starfive-jhb100-uart-routing b/Documentation/ABI/testing/sysfs-driver-starfive-jhb100-uart-routing
new file mode 100644
index 000000000000..2844133bea1b
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-starfive-jhb100-uart-routing
@@ -0,0 +1,45 @@
+What:		/sys/bus/platform/drivers/starfive-jhb100-uart-routing/\*/uart\*
+Date:		August 2026
+Contact:	Changhuang Liang <changhuang.liang@starfivetech.com>
+Description:	Selects the RX source of the UARTx device.
+
+		When read, each file shows the list of available options with currently
+		selected option marked by brackets "[]". The list of available options
+		depends on the selected file.
+
+		e.g.
+		cat /sys/bus/platform/drivers/starfive-jhb100-uart-routing/\*.uart-routing/uart1
+		io0 [io1] io2 io3 io4 io5 io6 io7 io8 io9 io10 io11 io12 io13 io14 uart0 uart1
+		uart2 uart3 uart4 uart5 uart6 uart7 uart8 uart9 uart10 uart11 uart12 uart13 uart14
+
+		In this case, UART1 gets its input from IO1 (physical serial port 1).
+
+		To switch the RX source of UART1 to UART2, write the desired source to the file:
+		echo uart2 > /sys/bus/platform/drivers/starfive-jhb100-uart-routing/*.uart-routing/uart1
+
+		This indicates that UART1 now receives its input from UART2.
+
+Users:		OpenBMC.  Proposed changes should be mailed to
+		openbmc@lists.ozlabs.org
+
+What:		/sys/bus/platform/drivers/starfive-jhb100-uart-routing/\*/io\*
+Date:		August 2026
+Contact:	Changhuang Liang <changhuang.liang@starfivetech.com>
+Description:	Selects the RX source of IOx serial port. The current selection
+		will be marked by brackets "[]". The list of available options
+		depends on the selected file.
+
+		e.g.
+		cat /sys/bus/platform/drivers/starfive-jhb100-uart-routing/\*.uart-routing/io9
+		uart0 uart1 uart2 uart3 uart4 uart5 uart6 uart7 uart8 [uart9] uart10 uart11 uart12
+		uart13 uart14 io0 io1 io2 io3 io4 io5 io6 io7 io8 io9 io10 io11 io12 io13 io14
+
+		In this case, IO9 (physical serial port 9) gets its input from UART9.
+
+		To switch the RX source of IO9 to UART10, write the desired source to the file:
+		echo uart10 > /sys/bus/platform/drivers/starfive-jhb100-uart-routing/*.uart-routing/io9
+
+		This indicates that IO9 now receives its input from UART10.
+
+Users:		OpenBMC.  Proposed changes should be mailed to
+		openbmc@lists.ozlabs.org
diff --git a/MAINTAINERS b/MAINTAINERS
index 90919c672d4d..1583e988d8b0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26105,6 +26105,13 @@ M:	Changhuang Liang <changhuang.liang@starfivetech.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-syscon.yaml
 
+STARFIVE JHB100 UART ROUTING DRIVER
+M:	Changhuang Liang <changhuang.liang@starfivetech.com>
+S:	Maintained
+F:	Documentation/ABI/testing/sysfs-driver-starfive-jhb100-uart-routing
+F:	Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-uart-routing.yaml
+F:	drivers/soc/starfive/uart-routing/
+
 STATIC BRANCH/CALL
 M:	Peter Zijlstra <peterz@infradead.org>
 M:	Josh Poimboeuf <jpoimboe@kernel.org>
diff --git a/drivers/soc/starfive/Kconfig b/drivers/soc/starfive/Kconfig
index 04b020083d3e..f45e6ddc49df 100644
--- a/drivers/soc/starfive/Kconfig
+++ b/drivers/soc/starfive/Kconfig
@@ -2,5 +2,6 @@
 menu "StarFive SoC (System On Chip) specific Drivers"
 
 source "drivers/soc/starfive/socinfo/Kconfig"
+source "drivers/soc/starfive/uart-routing/Kconfig"
 
 endmenu
diff --git a/drivers/soc/starfive/Makefile b/drivers/soc/starfive/Makefile
index ca1e609b8104..ead286caecfa 100644
--- a/drivers/soc/starfive/Makefile
+++ b/drivers/soc/starfive/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y += socinfo/
+obj-y += uart-routing/
diff --git a/drivers/soc/starfive/uart-routing/Kconfig b/drivers/soc/starfive/uart-routing/Kconfig
new file mode 100644
index 000000000000..6a8fb28fbc23
--- /dev/null
+++ b/drivers/soc/starfive/uart-routing/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config STARFIVE_JHB100_UART_ROUTING
+	tristate "StarFive JHB100 uart routing control"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	depends on HAS_IOMEM
+	select REGMAP_MMIO
+	help
+	  Provides a driver to control the UART routing paths, allowing
+	  users to perform runtime configuration of the RX muxes among
+	  the UART controllers and I/O pins.
+
+	  If M is selected, the module will be called
+	  jhb100-uart-routing.
diff --git a/drivers/soc/starfive/uart-routing/Makefile b/drivers/soc/starfive/uart-routing/Makefile
new file mode 100644
index 000000000000..b0df03c8501b
--- /dev/null
+++ b/drivers/soc/starfive/uart-routing/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_STARFIVE_JHB100_UART_ROUTING)	+= jhb100-uart-routing.o
diff --git a/drivers/soc/starfive/uart-routing/jhb100-uart-routing.c b/drivers/soc/starfive/uart-routing/jhb100-uart-routing.c
new file mode 100644
index 000000000000..7cf29741593a
--- /dev/null
+++ b/drivers/soc/starfive/uart-routing/jhb100-uart-routing.c
@@ -0,0 +1,262 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * StarFive JHB100 UART Routing driver
+ *
+ * Derived from drivers/soc/aspeed/aspeed-uart-routing.c
+ *
+ * Copyright (c) 2018 Google LLC
+ * Copyright (c) 2021 Aspeed Technology Inc.
+ * Copyright (C) 2026 StarFive Technology Co., Ltd
+ */
+
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+#include <linux/sysfs.h>
+
+#define STARFIVE_ROUTING_SEL(uart_sel)	((uart_sel) * 0x04)
+#define ROUTING_TX_SHIFT		0
+#define ROUTING_TX_MASK			GENMASK(4, ROUTING_TX_SHIFT)
+#define ROUTING_RX_SHIFT		8
+#define ROUTING_RX_MASK			GENMASK(12, ROUTING_RX_SHIFT)
+
+#define MAX_UART_PORTS			15	/* UART0-UART14 */
+#define MAX_IO_PINS			15	/* IO0-IO14 */
+#define TOTAL_TARGETS			(MAX_UART_PORTS + MAX_IO_PINS)
+
+struct starfive_uart_routing {
+	struct regmap *regmap;
+};
+
+struct starfive_routing_attr {
+	struct device_attribute dev_attr;
+	u8 ch;
+	u8 shift;
+	u32 mask;
+	bool io_order;		/* options table orientation */
+};
+
+#define to_routing_attr(_dev_attr) \
+	container_of(_dev_attr, struct starfive_routing_attr, dev_attr)
+
+static const char * const routing_targets[TOTAL_TARGETS] = {
+	"io0",  "io1",  "io2",  "io3",  "io4",
+	"io5",  "io6",  "io7",  "io8",  "io9",
+	"io10", "io11", "io12", "io13", "io14",
+	"uart0", "uart1", "uart2", "uart3", "uart4",
+	"uart5", "uart6", "uart7", "uart8", "uart9",
+	"uart10", "uart11", "uart12", "uart13", "uart14",
+};
+
+static ssize_t starfive_uart_routing_show(struct device *dev,
+					  struct device_attribute *attr,
+					  char *buf)
+{
+	struct starfive_uart_routing *priv = dev_get_drvdata(dev);
+	struct starfive_routing_attr *rattr = to_routing_attr(attr);
+	u32 val;
+	unsigned int pos;
+	int len = 0;
+	int ret;
+
+	ret = regmap_read(priv->regmap, STARFIVE_ROUTING_SEL(rattr->ch), &val);
+	if (ret)
+		return ret;
+
+	val = (val >> rattr->shift) & (rattr->mask >> rattr->shift);
+
+	/* Show all available options with current one highlighted */
+	if (rattr->io_order) {
+		/* For io* files: 0-14 -> uart0-uart14, 15-29 -> io0-io14 */
+		for (pos = 0; pos < TOTAL_TARGETS; pos++) {
+			const char *target;
+
+			target = routing_targets[(pos + MAX_UART_PORTS) % TOTAL_TARGETS];
+
+			if (pos == val)
+				len += sysfs_emit_at(buf, len, "[%s] ", target);
+			else
+				len += sysfs_emit_at(buf, len, "%s ", target);
+		}
+	} else {
+		/* For uart* files: 0-14 -> io0-io14, 15-29 -> uart0-uart14 */
+		for (pos = 0; pos < TOTAL_TARGETS; pos++) {
+			if (pos == val)
+				len += sysfs_emit_at(buf, len, "[%s] ", routing_targets[pos]);
+			else
+				len += sysfs_emit_at(buf, len, "%s ", routing_targets[pos]);
+		}
+	}
+
+	if (val >= TOTAL_TARGETS)
+		len += sysfs_emit_at(buf, len, "[unknown(%u)]", val);
+
+	len += sysfs_emit_at(buf, len, "\n");
+
+	return len;
+}
+
+static ssize_t starfive_uart_routing_store(struct device *dev,
+					   struct device_attribute *attr,
+					   const char *buf, size_t count)
+{
+	struct starfive_uart_routing *priv = dev_get_drvdata(dev);
+	struct starfive_routing_attr *rattr = to_routing_attr(attr);
+	int val;
+	int ret;
+
+	val = sysfs_match_string(routing_targets, buf);
+	if (val < 0)
+		return val;
+
+	/* For io* files, reverse the mapping */
+	if (rattr->io_order)
+		val = (val + MAX_IO_PINS) % TOTAL_TARGETS;
+
+	ret = regmap_update_bits(priv->regmap, STARFIVE_ROUTING_SEL(rattr->ch),
+				 rattr->mask, val << rattr->shift);
+
+	return ret ? : count;
+}
+
+/* Static attribute definitions using macros */
+#define ROUTING_ATTR(_name, _ch, _shift, _mask, _io)			\
+	static struct starfive_routing_attr routing_attr_##_name = {	\
+		.dev_attr = __ATTR(_name, 0644,				\
+				   starfive_uart_routing_show,		\
+				   starfive_uart_routing_store),	\
+		.ch = (_ch), .shift = (_shift),				\
+		.mask = (_mask), .io_order = (_io),			\
+	}
+
+/* UART selectors (uart0-uart14) - each UART routes to a target */
+ROUTING_ATTR(uart0, 0, ROUTING_RX_SHIFT, ROUTING_RX_MASK, false);
+ROUTING_ATTR(uart1, 1, ROUTING_RX_SHIFT, ROUTING_RX_MASK, false);
+ROUTING_ATTR(uart2, 2, ROUTING_RX_SHIFT, ROUTING_RX_MASK, false);
+ROUTING_ATTR(uart3, 3, ROUTING_RX_SHIFT, ROUTING_RX_MASK, false);
+ROUTING_ATTR(uart4, 4, ROUTING_RX_SHIFT, ROUTING_RX_MASK, false);
+ROUTING_ATTR(uart5, 5, ROUTING_RX_SHIFT, ROUTING_RX_MASK, false);
+ROUTING_ATTR(uart6, 6, ROUTING_RX_SHIFT, ROUTING_RX_MASK, false);
+ROUTING_ATTR(uart7, 7, ROUTING_RX_SHIFT, ROUTING_RX_MASK, false);
+ROUTING_ATTR(uart8, 8, ROUTING_RX_SHIFT, ROUTING_RX_MASK, false);
+ROUTING_ATTR(uart9, 9, ROUTING_RX_SHIFT, ROUTING_RX_MASK, false);
+ROUTING_ATTR(uart10, 10, ROUTING_RX_SHIFT, ROUTING_RX_MASK, false);
+ROUTING_ATTR(uart11, 11, ROUTING_RX_SHIFT, ROUTING_RX_MASK, false);
+ROUTING_ATTR(uart12, 12, ROUTING_RX_SHIFT, ROUTING_RX_MASK, false);
+ROUTING_ATTR(uart13, 13, ROUTING_RX_SHIFT, ROUTING_RX_MASK, false);
+ROUTING_ATTR(uart14, 14, ROUTING_RX_SHIFT, ROUTING_RX_MASK, false);
+
+/* IO selectors (io0-io14) - each IO routes to a target */
+ROUTING_ATTR(io0, 0, ROUTING_TX_SHIFT, ROUTING_TX_MASK, true);
+ROUTING_ATTR(io1, 1, ROUTING_TX_SHIFT, ROUTING_TX_MASK, true);
+ROUTING_ATTR(io2, 2, ROUTING_TX_SHIFT, ROUTING_TX_MASK, true);
+ROUTING_ATTR(io3, 3, ROUTING_TX_SHIFT, ROUTING_TX_MASK, true);
+ROUTING_ATTR(io4, 4, ROUTING_TX_SHIFT, ROUTING_TX_MASK, true);
+ROUTING_ATTR(io5, 5, ROUTING_TX_SHIFT, ROUTING_TX_MASK, true);
+ROUTING_ATTR(io6, 6, ROUTING_TX_SHIFT, ROUTING_TX_MASK, true);
+ROUTING_ATTR(io7, 7, ROUTING_TX_SHIFT, ROUTING_TX_MASK, true);
+ROUTING_ATTR(io8, 8, ROUTING_TX_SHIFT, ROUTING_TX_MASK, true);
+ROUTING_ATTR(io9, 9, ROUTING_TX_SHIFT, ROUTING_TX_MASK, true);
+ROUTING_ATTR(io10, 10, ROUTING_TX_SHIFT, ROUTING_TX_MASK, true);
+ROUTING_ATTR(io11, 11, ROUTING_TX_SHIFT, ROUTING_TX_MASK, true);
+ROUTING_ATTR(io12, 12, ROUTING_TX_SHIFT, ROUTING_TX_MASK, true);
+ROUTING_ATTR(io13, 13, ROUTING_TX_SHIFT, ROUTING_TX_MASK, true);
+ROUTING_ATTR(io14, 14, ROUTING_TX_SHIFT, ROUTING_TX_MASK, true);
+
+static struct attribute *starfive_routing_attrs[] = {
+	&routing_attr_uart0.dev_attr.attr,
+	&routing_attr_uart1.dev_attr.attr,
+	&routing_attr_uart2.dev_attr.attr,
+	&routing_attr_uart3.dev_attr.attr,
+	&routing_attr_uart4.dev_attr.attr,
+	&routing_attr_uart5.dev_attr.attr,
+	&routing_attr_uart6.dev_attr.attr,
+	&routing_attr_uart7.dev_attr.attr,
+	&routing_attr_uart8.dev_attr.attr,
+	&routing_attr_uart9.dev_attr.attr,
+	&routing_attr_uart10.dev_attr.attr,
+	&routing_attr_uart11.dev_attr.attr,
+	&routing_attr_uart12.dev_attr.attr,
+	&routing_attr_uart13.dev_attr.attr,
+	&routing_attr_uart14.dev_attr.attr,
+	&routing_attr_io0.dev_attr.attr,
+	&routing_attr_io1.dev_attr.attr,
+	&routing_attr_io2.dev_attr.attr,
+	&routing_attr_io3.dev_attr.attr,
+	&routing_attr_io4.dev_attr.attr,
+	&routing_attr_io5.dev_attr.attr,
+	&routing_attr_io6.dev_attr.attr,
+	&routing_attr_io7.dev_attr.attr,
+	&routing_attr_io8.dev_attr.attr,
+	&routing_attr_io9.dev_attr.attr,
+	&routing_attr_io10.dev_attr.attr,
+	&routing_attr_io11.dev_attr.attr,
+	&routing_attr_io12.dev_attr.attr,
+	&routing_attr_io13.dev_attr.attr,
+	&routing_attr_io14.dev_attr.attr,
+	NULL,
+};
+
+ATTRIBUTE_GROUPS(starfive_routing);
+
+static const struct regmap_config starfive_routing_regmap_cfg = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.max_register	= STARFIVE_ROUTING_SEL(MAX_UART_PORTS - 1),
+};
+
+static int starfive_uart_routing_probe(struct platform_device *pdev)
+{
+	struct starfive_uart_routing *priv;
+	struct device *dev = &pdev->dev;
+	struct reset_control *rst;
+	void __iomem *reg_base;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(reg_base))
+		return dev_err_probe(dev, PTR_ERR(reg_base),
+				     "Unable to map IO resources\n");
+
+	rst = devm_reset_control_get_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(rst))
+		return dev_err_probe(dev, PTR_ERR(rst),
+				     "Unable to get and deassert reset control\n");
+
+	priv->regmap = devm_regmap_init_mmio(dev, reg_base,
+					     &starfive_routing_regmap_cfg);
+	if (IS_ERR(priv->regmap))
+		return PTR_ERR(priv->regmap);
+
+	dev_set_drvdata(dev, priv);
+
+	return 0;
+}
+
+static const struct of_device_id starfive_uart_routing_match[] = {
+	{ .compatible = "starfive,jhb100-uart-routing" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, starfive_uart_routing_match);
+
+static struct platform_driver starfive_uart_routing_driver = {
+	.probe = starfive_uart_routing_probe,
+	.driver	= {
+		.name = "starfive-jhb100-uart-routing",
+		.of_match_table = starfive_uart_routing_match,
+		.dev_groups = starfive_routing_groups,
+	},
+};
+
+module_platform_driver(starfive_uart_routing_driver);
+
+MODULE_AUTHOR("Changhuang Liang <changhuang.liang@starfivetech.com>");
+MODULE_DESCRIPTION("StarFive JHB100 UART Routing driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1

