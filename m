Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.127
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792480750;
	b=mwKwpC4ApysxaQoiXUhZWk5NwOPLvigfxnCtiEcSSneiv8IQCajy0HSCiU6jZgMGcB2v
	 P2ZD3HLUlSJ7rogoV4rdaN3T0z9IYHeh3dvlgshpJb5DQqeMLKGRBpkNNcaxd3QaeiYY9
	 4qji6upfLG2mHN7A/TM1hlKCYKg0mxT9uOyqwJmRFJGcw7DBx2dGVtWdh+Dx4FR68EhS4
	 9VYf8c8sm5Ca9n374XxO6ewFtVOu6z4B4YuXlxe7pVfp+fLzceXyoEmyEnK7dCE6BWgQY
	 rDPnGRW6RCItX4CMo87pTjlR83NRfFP6z088z5Xi6wVEPz5ZGUFBnclvOfJ+Rv5VkVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792480750;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-EOPAttributedMessage:
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
	bh=FI4g1BbBg6YAbdNtstZ+Trt0iimfEu0C8QaY2hbawZ0=;
	b=iJVco2kQPhXGWh/DpudKsbPIamx1O6daO1qpA7D3iR6DU8mFuNNC91gtGI9uCC0ym1tB
	 LoA+1i0KuZH46GBXWryzgtRZsGh71a/Zs5BAu0NDI7ItGMNY7dnvrGDeP0CmriSFa7ax8
	 WDZK3sREEAc/HPWanSXpuyq3gFm/ALYHkrnmvXOfof7SeGnPV0KzwfEsv8VsYVsReG7fe
	 RpwFYB4jXox0qxn79RgszzYhGf3bD3JYIvH1eg9ZPkXQyw7HRKlJLFKDlHlAMtqI30E95
	 EXbxcFo/EEssyGq4HaCAbAVsMdANik2nYQckSk284OgvUSK60OyxnAN+u13fUCnASdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=axiado.com;
	spf=pass smtp.mailfrom=axiado.com;
	dkim=pass header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=KU6ibm+8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.127
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11020127.outbound.protection.outlook.com [52.101.85.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A897B60A2605;
	Tue, 20 Oct 2026 07:19:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A897B60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=KU6ibm+8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lbFs1SJoowQ9xU7P9s4U/5ORF1v52bedFfxi/Jfquwc0xfDvouzriIR9lh4j5zXuWvwPnjxhUYR2GhNGNjMkN/oEdIyytkSdYqQ8KYNLiOzuJsdarTTNDSPbLd7RAJUu/+8pghcKS8z9VaYXJD5VH6QLWDAUJw9hkaQh3ItFcUJBIUR1MclouVY1Y4JD64OTnNyR+wAdHMZJJU5nu/t5n9kjocrGcY+RUNDiv4iuCbalSyuC5fK2wp3U+Qrqb1olgtGEw/lNObjeRC/uBsjfJZdTQsvrobLqOF/NobzDQGia3kIxWwYqxS5LQV5bE7s++mLj3jlFd/0yGj0dinlAPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FI4g1BbBg6YAbdNtstZ+Trt0iimfEu0C8QaY2hbawZ0=;
 b=eXLhKj7EHgM4NLgCKYr3oK47MofJgKDjE+tegJ9WNHXG6m8MrIqtJf3Mygtt+GSIpWQI9qU4GzdCk+OOyKk9o90ZRhAl5343/TRHFHSLGV0G56CD4Xva24PRUCDMQrvamM+ygxaPbcwLIte6rCDwis1WtwCfflJXXMr3Rd/9QlXQDKMfGgAduwKp5FyV6zsO5KnORtrHCBz9wyh2hvQ+/tSGTDkdEjB5zd3mGo1UO8mP4r46xan7LMbt+KAs55FJHZEUEreS8dSlvF2KKz9FhlnQcLgQdWt7q+g+7nSSirf0btIRa9bpt7TqBRzPACu+i7caUE3b+tgjV6Q4ZIiMTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FI4g1BbBg6YAbdNtstZ+Trt0iimfEu0C8QaY2hbawZ0=;
 b=KU6ibm+8Q04msm3lgDzInZa0h0OgSc6kjLxksVDAlLXqhu5eZQ5ojO3ACtU3PQl7tV9pCaawBLebZpTNeZ/4RB1aE26GBQgJ50374lXyGrbmMyJcZisOfl5bYNbRPDSbdO3P3UiQsy2sV8LJvQ9YwrBLhy0NLAfAMZAH9T7nYXq6zCLvnZEGloV1c6f5BQdQ0Y5ZPksJsNapJtDw6RoePZNOV2C7uUCcoD37ppOkkfFXoVGQWxobQSSqkU2OrGyzLHiydQrxYsOmc+1XLaQYSD8b7hRclhUwq7titors9BlJSok+5XDzu8G+7AmaDPGab1YCRyhafDbbY6PZ08iGng==
Received: from CY5PR15CA0018.namprd15.prod.outlook.com (2603:10b6:930:14::14)
 by LV3PR18MB6325.namprd18.prod.outlook.com (2603:10b6:408:271::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 07:19:02 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:930:14:cafe::4c) by CY5PR15CA0018.outlook.office365.com
 (2603:10b6:930:14::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Tue,
 20 Oct 2026 07:19:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 64.62.143.114) smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15
 via Frontend Transport; Tue, 20 Oct 2026 07:19:02 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 57EAC40BFE10;
	Tue, 20 Oct 2026 00:19:01 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Date: Tue, 20 Oct 2026 00:19:00 -0700
Subject: [PATCH v3 6/6] usb: gadget: udc: crg: Add core driver and build
 integration
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
Message-Id: <20261020-axiado-ax3000-usb-device-controller-v3-6-3012ecfc0a93@axiado.com>
References: <20261020-axiado-ax3000-usb-device-controller-v3-0-3012ecfc0a93@axiado.com>
In-Reply-To: <20261020-axiado-ax3000-usb-device-controller-v3-0-3012ecfc0a93@axiado.com>
To: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>, 
 Karthikeyan Mitran <kmitran@axiado.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Petar Stepanovic <pstepanovic@axiado.com>, 
 Krutik Shah <krutikshah@axiado.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792480739; l=24047;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=TY14CTN+aFd+ibnJ3l233qOdQgeJVGg+KCDPUfgsnc4=;
 b=TYQrzcVWKSG8uEXe02V5yNXl/iJLBfUJWUMoORjVeOmXllMR6rPKk/fDSL+tFJKLjsORF01wL
 ejZcSNa+fcTCTdQWhN+BaPFwR1c9+92q1PIzM1kfBd0tdgKwEEKv2Vm
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|LV3PR18MB6325:EE_
X-MS-Office365-Filtering-Correlation-Id: a2f83c6a-aa66-4a9b-14aa-08df2e7a6aec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|23010399003|1800799024|82310400026|261009223027099003|10067099003|56012099006|3023799007|6133799003|22082099003|18002099003|5023799004;
X-Microsoft-Antispam-Message-Info:
	DBfW/CTNdsK+lyqHbt6+3CzZYBLlZ1FkfY/y5ClQks8oNrgFxgbYgRmuvFWCx80zKxmItL4hVbEaRGvVMEyjVff4tPnGAtV7FeeHfmZcXdc73Mizfqb6vLSKfaZg+YMXFcLstc9JI35ugQ4JV2Sml3eym0+zhRyTXljvOB73irXZmhmD02Alh15fJJP+Hl6iAo+mEh0cXqxWdCZLJM98Gsl7bplTMBx7Sg9QNBYBhlgZS7v1KknEJ6dHzRTp9N2spqbayq0AVf9KXkWNKIFAQuO+xsr4CBATTVbq0N9KIeCG3taGa8CrT2uVms4ahSH+jXkn0mMPObYo6LV2qunCCppgAxb4yK7bCbpHHjakV4mjRIjA+hR447SXowbW25OJDstB9+SZW52sJHI1MtRPnXkIyI8EjQvvQ+wsAWwV3PQnSGDHg/gjF3AhuM9Idrjs+ymcS/i7JHuZIOp5xRy0jlUT8NvxjnzpiIEYely8GdLqzaa66mGV/CDyb8+wK4062QTySzwMG52Vxn2qrHh6mIZAyHdn+f2uYxQU7gSJId5GhOydsD+EZPx5sZmlyP/iWVtQDjqO2tr4cySjgjiJ/n8HljW0W1Ebl6Cm9T9voieBYCSkGP6GitVgv6ISawFgczUzzYJ8S1GvJ0c2N5CEFAvklHZV0+69PF4yYERajYrgC638j6oMoBS+hvvfBb/tKwlN0FQ5kEE66St7km7mPA==
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(23010399003)(1800799024)(82310400026)(261009223027099003)(10067099003)(56012099006)(3023799007)(6133799003)(22082099003)(18002099003)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tQv+AhVvSE9mCdJnlOycVg5pVRH6x5SG5X4WUiiikqiCxeovPO1mjtL0BlrgVH91owrUOjohxnVBMw8j/s9BTcpR1Rrl11GpPxHwrxVgMuqoQ3LcHKYB6H0aCemnAckQ3ztWEhDNBfWqmzIz0D8W3vipvUamRS0nSWaK9xSXV3IjDBUk5ARMoTo6ZsXDDWjA1hui5XtJ73a3p+RUyH0O1stZohBC2OhZx9fY+2QNSccYSY4NWQ0wSZoHJXlP+i9u4idhdln/9mSghC9FDsp8ro3KwrI8i3qWwiyme9l4K4DfV/AiqxwYbUYAxfTd12mgs7heHFK1+upf+j99mXDWx0Dfa6Z60QJ4nL7Yjb+2YZ1DkVVqYbcRzT75afhqgL7IUgM9jlsReyhtS0TOu9wYKTajdPrZLmAFi+ZR9PE0EdLTxuHiaEKV9YYGSG82devK
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 07:19:02.3380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2f83c6a-aa66-4a9b-14aa-08df2e7a6aec
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR18MB6325

This patch introduces the core probe/remove functions for the Axiado
AX3000/AX3005 UDC driver, and wires up the directory into the build
system via Kconfig and Makefile.

Co-developed-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
Signed-off-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
Co-developed-by: Krutik Shah <krutikshah@axiado.com>
Signed-off-by: Krutik Shah <krutikshah@axiado.com>
Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
---
 MAINTAINERS                               |   1 +
 drivers/usb/gadget/udc/Kconfig            |   2 +
 drivers/usb/gadget/udc/Makefile           |   1 +
 drivers/usb/gadget/udc/crg/Kconfig        |  16 +
 drivers/usb/gadget/udc/crg/Makefile       |   9 +
 drivers/usb/gadget/udc/crg/crg-udc-core.c | 706 ++++++++++++++++++++++++++++++
 6 files changed, 735 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 58c5c8e00870..d5b6a04a95ad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4515,6 +4515,7 @@ M:	Prasad Bolisetty <pbolisetty@axiado.com>
 L:	linux-usb@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/usb/axiado,ax3000-udc.yaml
+F:	drivers/usb/gadget/udc/crg/
 
 AYANEO PLATFORM EC DRIVER
 M:	Antheas Kapenekakis <lkml@antheas.dev>
diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
index 7ddbc2606686..72a5a8a04982 100644
--- a/drivers/usb/gadget/udc/Kconfig
+++ b/drivers/usb/gadget/udc/Kconfig
@@ -421,6 +421,8 @@ source "drivers/usb/gadget/udc/aspeed-vhub/Kconfig"
 
 source "drivers/usb/gadget/udc/cdns2/Kconfig"
 
+source "drivers/usb/gadget/udc/crg/Kconfig"
+
 #
 # LAST -- dummy/emulated controller
 #
diff --git a/drivers/usb/gadget/udc/Makefile b/drivers/usb/gadget/udc/Makefile
index 1b9b1a4f9c57..227d2a0b525b 100644
--- a/drivers/usb/gadget/udc/Makefile
+++ b/drivers/usb/gadget/udc/Makefile
@@ -38,3 +38,4 @@ obj-$(CONFIG_USB_ASPEED_UDC)	+= aspeed_udc.o
 obj-$(CONFIG_USB_BDC_UDC)	+= bdc/
 obj-$(CONFIG_USB_MAX3420_UDC)	+= max3420_udc.o
 obj-$(CONFIG_USB_CDNS2_UDC)	+= cdns2/
+obj-$(CONFIG_USB_CRG_UDC)	+= crg/
diff --git a/drivers/usb/gadget/udc/crg/Kconfig b/drivers/usb/gadget/udc/crg/Kconfig
new file mode 100644
index 000000000000..7167c4943389
--- /dev/null
+++ b/drivers/usb/gadget/udc/crg/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0
+config USB_CRG_UDC
+	tristate "Corigine / Axiado USB Device Controller"
+	depends on USB_GADGET
+	depends on HAS_DMA
+	depends on ARCH_AXIADO || COMPILE_TEST
+	help
+	  Say Y here to support the USB device controller found on Axiado AX3000
+	  and AX3005 SoCs, which is based on the Corigine USB 3.1 IP.
+
+	  This controller supports High-Speed and SuperSpeed.
+
+	  Say "y" to link the driver statically, or "m" to build a
+	  dynamically linked module called "crg-udc.ko".
+
+	  If unsure, say N.
diff --git a/drivers/usb/gadget/udc/crg/Makefile b/drivers/usb/gadget/udc/crg/Makefile
new file mode 100644
index 000000000000..96b209fb59fc
--- /dev/null
+++ b/drivers/usb/gadget/udc/crg/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0
+
+# define_trace.h needs to know how to find our trace header
+CFLAGS_crg-udc-trace.o		:= -I$(src)
+
+obj-$(CONFIG_USB_CRG_UDC)	+= crg-udc.o
+
+crg-udc-y			:= crg-udc-core.o crg-udc-ring.o crg-udc-ep0.o crg-udc-gadget.o
+crg-udc-$(CONFIG_TRACING)	+= crg-udc-trace.o
diff --git a/drivers/usb/gadget/udc/crg/crg-udc-core.c b/drivers/usb/gadget/udc/crg/crg-udc-core.c
new file mode 100644
index 000000000000..80a4fc6a61e8
--- /dev/null
+++ b/drivers/usb/gadget/udc/crg/crg-udc-core.c
@@ -0,0 +1,706 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Axiado AX3000/AX3005 USB Device Controller driver.
+ *
+ * Copyright (c) 2019 Corigine Inc.
+ * Copyright (c) 2021-2026 Axiado Corporation.
+ */
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/property.h>
+#include <linux/reset.h>
+#include <linux/slab.h>
+
+#include "crg-udc.h"
+
+static int crg_gadget_irq_init(struct platform_device *pdev,
+			       struct crg_gadget_dev *crg_udc);
+static void crg_udc_phy_exit(void *data);
+
+static void crg_udc_gadget_release(struct device *dev)
+{
+	struct crg_gadget_dev *crg_udc;
+
+	crg_udc = container_of(dev, struct crg_gadget_dev, gadget.dev);
+	kfree(crg_udc);
+}
+
+/*
+ * command related ops
+ */
+int crg_udc_issue_command(struct crg_gadget_dev *crg_udc,
+			  enum crg_cmd_type type, u32 param0, u32 param1)
+{
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	u32 status;
+	bool check_complete = false;
+	u32 tmp;
+
+	/*
+	 * The command state machine only runs while the controller itself is
+	 * running. Once RUN is cleared (e.g. during udc_stop()/reset()), the
+	 * hardware never processes queued commands, so ACTIVE never clears.
+	 * Skip the busy/completion checks in that case instead of getting
+	 * stuck on a command the hardware will never service.
+	 */
+	tmp = readl(&uccr->control);
+	if (tmp & CRG_U3DC_CTRL_RUN)
+		check_complete = true;
+
+	if (check_complete) {
+		tmp = readl(&uccr->cmd_control);
+		if (tmp & CRG_U3DC_CMD_CTRL_ACTIVE) {
+			dev_err(crg_udc->dev,
+				"previous command is not complete\n");
+			return -EBUSY;
+		}
+	}
+	/* Ensure that everything is written before issuing new command */
+	dma_wmb();
+
+	writel(param0, &uccr->cmd_param0);
+	writel(param1, &uccr->cmd_param1);
+
+	tmp = CRG_U3DC_CMD_CTRL_ACTIVE |
+	      FIELD_PREP(CRG_U3DC_CMD_CTRL_TYPE_MASK, type);
+	writel(tmp, &uccr->cmd_control);
+
+	if (!check_complete)
+		return 0;
+
+	if (readl_poll_timeout_atomic(&uccr->cmd_control, tmp,
+				      !(tmp & CRG_U3DC_CMD_CTRL_ACTIVE), 1,
+				      1000)) {
+		dev_dbg(crg_udc->dev, "command timed out\n");
+		return -ETIMEDOUT;
+	}
+
+	status = FIELD_GET(CRG_U3DC_CMD_CTRL_STATUS_MASK, tmp);
+	if (status) {
+		dev_dbg(crg_udc->dev, "command failed with status %u\n",
+			status);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static void crg_udc_clk_disable(void *data)
+{
+	clk_disable_unprepare(data);
+}
+
+void crg_udc_free_resources(struct crg_gadget_dev *crg_udc)
+{
+	int i;
+
+	if (crg_udc->uccr) {
+		u32 val = readl(&crg_udc->uccr->control);
+
+		val &= ~(CRG_U3DC_CTRL_INT_EN | CRG_U3DC_CTRL_RUN);
+		writel(val, &crg_udc->uccr->control);
+	}
+	if (crg_udc->irq >= 0) {
+		devm_free_irq(crg_udc->dev, crg_udc->irq, crg_udc);
+		crg_udc->irq = -1;
+		crg_udc->gadget.irq = 0;
+	}
+
+	for (i = 0; i < CRG_RING_NUM; i++) {
+		struct crg_udc_event *udc_event = &crg_udc->udc_event[i];
+
+		if (udc_event->event_ring.cpu_addr) {
+			dma_free_coherent(crg_udc->dev,
+					  udc_event->event_ring.len,
+					  udc_event->event_ring.cpu_addr,
+					  udc_event->event_ring.dma_addr);
+			udc_event->event_ring.cpu_addr = NULL;
+			udc_event->event_ring.dma_addr = DMA_MAPPING_ERROR;
+			udc_event->event_ring.len = 0;
+			udc_event->evt_dq_pt = NULL;
+		}
+		if (udc_event->erst.cpu_addr) {
+			dma_free_coherent(crg_udc->dev, udc_event->erst.len,
+					  udc_event->erst.cpu_addr,
+					  udc_event->erst.dma_addr);
+			udc_event->erst.cpu_addr = NULL;
+			udc_event->erst.dma_addr = DMA_MAPPING_ERROR;
+			udc_event->erst.len = 0;
+			udc_event->p_erst = NULL;
+		}
+	}
+
+	if (crg_udc->ep_cx.cpu_addr) {
+		dma_free_coherent(crg_udc->dev, crg_udc->ep_cx.len,
+				  crg_udc->ep_cx.cpu_addr,
+				  crg_udc->ep_cx.dma_addr);
+		crg_udc->ep_cx.cpu_addr = NULL;
+		crg_udc->ep_cx.dma_addr = DMA_MAPPING_ERROR;
+		crg_udc->ep_cx.len = 0;
+		crg_udc->p_epcx = NULL;
+	}
+
+	for (i = 0; i < CRG_NUM_EP_CX; i++) {
+		struct crg_udc_ep *udc_ep = &crg_udc->udc_ep[i];
+
+		if (udc_ep->tran_ring_info.cpu_addr) {
+			dma_free_coherent(crg_udc->dev,
+					  udc_ep->tran_ring_info.len,
+					  udc_ep->tran_ring_info.cpu_addr,
+					  udc_ep->tran_ring_info.dma_addr);
+			udc_ep->tran_ring_info.cpu_addr = NULL;
+			udc_ep->tran_ring_info.dma_addr = DMA_MAPPING_ERROR;
+			udc_ep->tran_ring_info.len = 0;
+			udc_ep->first_trb = NULL;
+			udc_ep->last_trb = NULL;
+			udc_ep->enq_pt = NULL;
+			udc_ep->deq_pt = NULL;
+		}
+	}
+
+	if (crg_udc->status_req) {
+		crg_udc_free_request(&crg_udc->udc_ep[0].usb_ep,
+				     &crg_udc->status_req->usb_req);
+		crg_udc->status_req = NULL;
+	}
+}
+
+static int crg_udc_init_hw(struct crg_gadget_dev *crg_udc)
+{
+	struct device *dev = crg_udc->dev;
+	int ret;
+
+	crg_udc->clk = devm_clk_get_optional(dev, NULL);
+	if (IS_ERR(crg_udc->clk))
+		return dev_err_probe(dev, PTR_ERR(crg_udc->clk),
+				     "failed to get clock\n");
+
+	ret = clk_prepare_enable(crg_udc->clk);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable clock\n");
+
+	ret = devm_add_action_or_reset(dev, crg_udc_clk_disable, crg_udc->clk);
+	if (ret)
+		return ret;
+
+	crg_udc->rst =
+		devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(crg_udc->rst))
+		return dev_err_probe(dev, PTR_ERR(crg_udc->rst),
+				     "failed to get reset\n");
+
+	crg_udc->phy = devm_phy_optional_get(dev, NULL);
+	if (IS_ERR(crg_udc->phy))
+		return dev_err_probe(dev, PTR_ERR(crg_udc->phy),
+				     "failed to get phy\n");
+
+	ret = phy_init(crg_udc->phy);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to init phy\n");
+
+	ret = phy_power_on(crg_udc->phy);
+	if (ret) {
+		phy_exit(crg_udc->phy);
+		return dev_err_probe(dev, ret, "failed to power on phy\n");
+	}
+
+	return devm_add_action_or_reset(dev, crg_udc_phy_exit, crg_udc->phy);
+}
+
+static void crg_udc_phy_exit(void *data)
+{
+	struct phy *phy = data;
+
+	phy_power_off(phy);
+	phy_exit(phy);
+}
+
+static int crg_udc_probe(struct platform_device *pdev)
+{
+	unsigned long flags = 0;
+	int ret;
+	int i;
+	struct crg_gadget_dev *crg_udc;
+	const struct crg_udc_priv *priv;
+
+	priv = device_get_match_data(&pdev->dev);
+	if (!priv)
+		return -ENODEV;
+
+	crg_udc = kzalloc_obj(*crg_udc, GFP_KERNEL);
+	if (!crg_udc)
+		return -ENOMEM;
+	usb_initialize_gadget(&pdev->dev, &crg_udc->gadget,
+			      crg_udc_gadget_release);
+
+	crg_udc->dev = &pdev->dev;
+	crg_udc->irq = -1;
+
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
+	if (ret) {
+		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+		if (ret) {
+			dev_err(&pdev->dev, "no usable DMA mask\n");
+			goto err_free_resources;
+		}
+	}
+
+	ret = crg_udc_init_hw(crg_udc);
+	if (ret)
+		goto err_free_resources;
+
+	crg_udc->ep0_desc.bLength = USB_DT_ENDPOINT_SIZE;
+	crg_udc->ep0_desc.bDescriptorType = USB_DT_ENDPOINT;
+	crg_udc->ep0_desc.bEndpointAddress = 0;
+	crg_udc->ep0_desc.bmAttributes = USB_ENDPOINT_XFER_CONTROL;
+	crg_udc->ep0_desc.wMaxPacketSize = cpu_to_le16(64);
+
+	crg_udc->u12_forbidden = priv->quirks & CRG_QUIRK_DIS_U1U2_ENTRY;
+	crg_udc->u12_initiate_forbidden = priv->quirks &
+					  CRG_QUIRK_DIS_U1U2_INITIATION;
+	crg_udc->reinit_ep0_on_bus_reset = priv->quirks &
+					   CRG_QUIRK_REINIT_EP0_ON_RESET;
+
+	spin_lock_init(&crg_udc->udc_lock);
+	INIT_WORK(&crg_udc->udc_reset_work, crg_udc_reset_work);
+	platform_set_drvdata(pdev, crg_udc);
+
+	crg_udc->gadget.ops = &crg_gadget_ops;
+	crg_udc->gadget.ep0 = &crg_udc->udc_ep[0].usb_ep;
+	INIT_LIST_HEAD(&crg_udc->gadget.ep_list);
+	/*
+	 * The controller supports up to SuperSpeed. Honour the standard
+	 * "maximum-speed" property to cap it; default to the hardware
+	 * maximum when the property is absent.
+	 */
+	crg_udc->gadget.max_speed = usb_get_maximum_speed(&pdev->dev);
+	if (crg_udc->gadget.max_speed == USB_SPEED_UNKNOWN)
+		crg_udc->gadget.max_speed = USB_SPEED_SUPER;
+	crg_udc->max_speed = crg_udc->gadget.max_speed;
+	crg_udc->gadget.speed = USB_SPEED_UNKNOWN;
+	crg_udc->gadget.name = KBUILD_MODNAME;
+	crg_udc->gadget.sg_supported = true;
+	crg_udc->gadget.wakeup_capable = true;
+	crg_udc->connected = 0;
+	crg_udc->dev_addr = 0;
+
+	crg_udc->mmio_virt_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(crg_udc->mmio_virt_base)) {
+		ret = dev_err_probe(&pdev->dev,
+				    PTR_ERR(crg_udc->mmio_virt_base),
+				    "failed to map registers\n");
+		goto err_put_gadget;
+	}
+
+	/* set controller device role */
+	writel((readl(crg_udc->mmio_virt_base + CRG_UDC_MODE_REG) |
+		CRG_UDC_ROLE_DEVICE),
+	       crg_udc->mmio_virt_base + CRG_UDC_MODE_REG);
+	for (i = 0; i < CRG_RING_NUM; i++) {
+		crg_udc->uicr[i] = crg_udc->mmio_virt_base + CRG_UICR_OFFSET +
+				   i * CRG_UICR_STRIDE;
+	}
+	crg_udc->uccr = crg_udc->mmio_virt_base + CRG_UCCR_OFFSET;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	ret = crg_udc_reset(crg_udc, &flags);
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+	if (ret)
+		goto err_free_resources;
+
+	crg_udc_clear_portpm(crg_udc);
+
+	ret = crg_gadget_irq_init(pdev, crg_udc);
+	if (ret)
+		goto err_free_resources;
+
+	ret = crg_udc_reset_data_struct(crg_udc);
+	if (ret) {
+		dev_err(crg_udc->dev, "crg_udc_reset_data_struct error\n");
+		goto err_free_resources;
+	}
+
+	crg_udc_init_ep_info(crg_udc);
+	ret = crg_udc_init_ep0(crg_udc);
+	if (ret)
+		goto err_free_resources;
+
+	crg_udc->udc_ep[0].desc = &crg_udc->ep0_desc;
+
+	ret = usb_add_gadget(&crg_udc->gadget);
+	if (ret)
+		goto err_free_resources;
+
+	return 0;
+
+err_free_resources:
+	crg_udc_free_resources(crg_udc);
+err_put_gadget:
+	usb_put_gadget(&crg_udc->gadget);
+	return ret;
+}
+
+static void crg_udc_remove(struct platform_device *pdev)
+{
+	struct crg_gadget_dev *crg_udc = platform_get_drvdata(pdev);
+	u32 tmp;
+
+	crg_udc->device_state = USB_STATE_ATTACHED;
+	crg_udc_set_vbus_detect(crg_udc, false);
+
+	usb_del_gadget(&crg_udc->gadget);
+	cancel_work_sync(&crg_udc->udc_reset_work);
+	crg_udc_free_resources(crg_udc);
+
+	/* set controller host role */
+	tmp = readl(crg_udc->mmio_virt_base + CRG_UDC_MODE_REG) & ~0x1;
+	writel(tmp, crg_udc->mmio_virt_base + CRG_UDC_MODE_REG);
+
+	platform_set_drvdata(pdev, NULL);
+	usb_put_gadget(&crg_udc->gadget);
+}
+
+static void crg_udc_shutdown(struct platform_device *pdev)
+{
+	struct crg_gadget_dev *crg_udc = platform_get_drvdata(pdev);
+	unsigned long flags;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	crg_udc->device_state = USB_STATE_ATTACHED;
+	crg_udc_set_pullup(crg_udc, false);
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+	crg_udc_set_vbus_detect(crg_udc, false);
+	if (crg_udc->uccr) {
+		u32 val = readl(&crg_udc->uccr->control);
+
+		val &= ~CRG_U3DC_CTRL_INT_EN;
+		writel(val, &crg_udc->uccr->control);
+	}
+	if (crg_udc->irq >= 0)
+		synchronize_irq(crg_udc->irq);
+}
+
+static int __maybe_unused crg_udc_suspend(struct device *dev)
+{
+	struct crg_gadget_dev *crg_udc = dev_get_drvdata(dev);
+	unsigned long flags;
+
+	/* Stop the pullup while the controller is suspended. */
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	crg_udc_set_pullup(crg_udc, false);
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+	return 0;
+}
+
+static int __maybe_unused crg_udc_resume(struct device *dev)
+{
+	struct crg_gadget_dev *crg_udc = dev_get_drvdata(dev);
+	unsigned long flags;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	if (crg_udc->gadget_driver && crg_udc->pullup_on)
+		crg_udc_set_pullup(crg_udc, true);
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+
+	return 0;
+}
+
+/* Program the speed limit while the controller is stopped. */
+int crg_udc_program_speed(struct crg_gadget_dev *crg_udc)
+{
+	u32 cfg, speed;
+
+	switch (crg_udc->max_speed) {
+	case USB_SPEED_FULL:
+		speed = CRG_U3DC_CFG0_MAXSPEED_FS;
+		break;
+	case USB_SPEED_HIGH:
+		speed = CRG_U3DC_CFG0_MAXSPEED_HS;
+		break;
+	case USB_SPEED_SUPER:
+		speed = CRG_U3DC_CFG0_MAXSPEED_SS;
+		break;
+	case USB_SPEED_SUPER_PLUS:
+		speed = CRG_U3DC_CFG0_MAXSPEED_SSP;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	cfg = readl(&crg_udc->uccr->config0);
+	cfg &= ~CRG_U3DC_CFG0_MAXSPEED_MASK;
+	cfg |= FIELD_PREP(CRG_U3DC_CFG0_MAXSPEED_MASK, speed);
+	writel(cfg, &crg_udc->uccr->config0);
+
+	return 0;
+}
+
+int crg_udc_reset_data_struct(struct crg_gadget_dev *crg_udc)
+{
+	int i;
+	int ret;
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	u32 val;
+
+	crg_udc->ep0_state = EP0_STATE_IDLE;
+
+	val = readl(&uccr->control);
+	val &= (~(CRG_U3DC_CTRL_INT_EN | CRG_U3DC_CTRL_RUN));
+	writel(val, &uccr->control);
+
+	ret = crg_udc_program_speed(crg_udc);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < CRG_RING_NUM; i++) {
+		ret = crg_udc_init_event_ring(crg_udc, i);
+		if (ret)
+			return ret;
+	}
+
+	ret = crg_udc_init_device_context(crg_udc);
+	if (ret)
+		return ret;
+
+	if (!crg_udc->status_req) {
+		struct usb_request *req;
+
+		req = crg_udc_alloc_request(&crg_udc->udc_ep[0].usb_ep,
+					    GFP_ATOMIC);
+		if (!req)
+			return -ENOMEM;
+
+		crg_udc->status_req =
+			container_of(req, struct crg_udc_request, usb_req);
+	}
+
+	/* other hw ops */
+	return 0;
+}
+
+static void crg_gadget_handle_interrupt(struct crg_gadget_dev *crg_udc)
+{
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	unsigned long flags = 0;
+	u32 tmp_status;
+	int ret;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+
+	tmp_status = readl(&uccr->status);
+
+	if (tmp_status & CRG_U3DC_STATUS_SYS_ERR) {
+		bool was_connected = crg_udc->connected;
+
+		dev_err(crg_udc->dev, "controller system error\n");
+		writel(CRG_U3DC_STATUS_SYS_ERR, &uccr->status);
+		ret = crg_udc_reset(crg_udc, &flags);
+		if (!ret)
+			ret = crg_udc_reset_data_struct(crg_udc);
+		if (!ret)
+			ret = crg_udc_init_ep0(crg_udc);
+		if (ret)
+			dev_err(crg_udc->dev,
+				"failed to recover from controller error: %d\n",
+				ret);
+		crg_udc->gadget.speed = USB_SPEED_UNKNOWN;
+		crg_udc->connected = 0;
+		if (was_connected)
+			crg_udc_notify_disconnect(crg_udc, &flags);
+		if (!ret && crg_udc->pullup_on)
+			crg_udc_set_pullup(crg_udc, true);
+
+		/*
+		 * tmp_status was captured before the reset above, which tore
+		 * down and rebuilt the event rings. It no longer reflects
+		 * the controller's current state, and if recovery failed the
+		 * rings may not be consistent at all. Skip the rest of this
+		 * interrupt's processing; any event still pending will raise
+		 * a fresh interrupt once the controller is running again.
+		 */
+		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+		return;
+	}
+
+	if (tmp_status & CRG_U3DC_STATUS_EINT) {
+		int i;
+
+		writel(CRG_U3DC_STATUS_EINT, &uccr->status);
+
+		for (i = 0; i < CRG_RING_NUM; i++) {
+			ret = crg_udc_process_event_ring(crg_udc, i, &flags);
+			if (ret)
+				dev_err(crg_udc->dev,
+					"process event ring error: %d\n", ret);
+		}
+	}
+
+	if (crg_udc->device_state == USB_STATE_RECONNECTING &&
+	    crg_udc->portsc_on_reconnecting == 1 &&
+	    crg_udc_is_event_rings_empty(crg_udc)) {
+		crg_udc->portsc_on_reconnecting = 0;
+		crg_udc_handle_port_status(crg_udc, &flags);
+	}
+
+	if (crg_udc->device_state == USB_STATE_RECONNECTING &&
+	    crg_udc->connected == 1)
+		crg_udc_prepare_for_setup(crg_udc);
+
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+}
+
+/*
+ * Primary handler only checks whether the shared interrupt belongs to the
+ * controller. All controller work, including reset polling, runs in the
+ * threaded handler and therefore never busy-waits in hard IRQ context.
+ */
+static irqreturn_t crg_udc_common_irq(int irq, void *dev)
+{
+	struct crg_gadget_dev *crg_udc = dev;
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	u32 status = readl(&uccr->status);
+
+	if (!(status & (CRG_U3DC_STATUS_EINT | CRG_U3DC_STATUS_SYS_ERR)))
+		return IRQ_NONE;
+
+	return IRQ_WAKE_THREAD;
+}
+
+static irqreturn_t crg_udc_irq_thread(int irq, void *dev)
+{
+	struct crg_gadget_dev *crg_udc = dev;
+
+	crg_gadget_handle_interrupt(crg_udc);
+
+	return IRQ_HANDLED;
+}
+
+static int crg_gadget_irq_init(struct platform_device *pdev,
+			       struct crg_gadget_dev *crg_udc)
+{
+	int irq;
+	int ret;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	/*
+	 * IRQF_ONESHOT keeps this (level-triggered) line masked until
+	 * crg_udc_irq_thread() has cleared the status bits, which is the
+	 * correct pairing for IRQF_SHARED with a threaded handler.
+	 */
+	ret = devm_request_threaded_irq(&pdev->dev, irq, crg_udc_common_irq,
+					crg_udc_irq_thread,
+					IRQF_SHARED | IRQF_ONESHOT, "crg_udc",
+					crg_udc);
+	if (ret) {
+		dev_err(crg_udc->dev, "request of irq%d failed\n", irq);
+	} else {
+		crg_udc->irq = irq;
+		crg_udc->gadget.irq = irq;
+	}
+
+	return ret;
+}
+
+int crg_udc_reset(struct crg_gadget_dev *crg_udc, unsigned long *flags)
+{
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	u32 i, tmp;
+	struct crg_udc_ep *udc_ep_ptr;
+	u32 val;
+
+	val = readl(&uccr->control);
+	val |= CRG_U3DC_CTRL_SWRST;
+	writel(val, &uccr->control);
+	crg_udc->resetting = true;
+	spin_unlock_irqrestore(&crg_udc->udc_lock, *flags);
+	/* Poll until SWRST clears; hardware reset takes up to 10 ms */
+	if (readl_poll_timeout_atomic(&uccr->control, tmp,
+			       !(tmp & CRG_U3DC_CTRL_SWRST), 10, 10000)) {
+		spin_lock_irqsave(&crg_udc->udc_lock, *flags);
+		crg_udc->resetting = false;
+		dev_err(crg_udc->dev, "reset error\n");
+		return -ETIMEDOUT;
+	}
+	spin_lock_irqsave(&crg_udc->udc_lock, *flags);
+	crg_udc->resetting = false;
+
+	crg_udc_clear_portpm(crg_udc);
+
+	crg_udc->setup_status = WAIT_FOR_SETUP;
+	/* Base on Figure 9-1, default USB_STATE is attached */
+	crg_udc->device_state = USB_STATE_ATTACHED;
+	crg_udc->dev_addr = 0;
+
+	/* Complete any reqs on EP1-EP15 queue */
+	for (i = 2; i < CRG_NUM_EP_CX; i++) {
+		udc_ep_ptr = &crg_udc->udc_ep[i];
+
+		if (udc_ep_ptr->desc) {
+			udc_ep_ptr->desc = NULL;
+			udc_ep_ptr->comp_desc = NULL;
+			crg_udc_ep_nuke(udc_ep_ptr, -ESHUTDOWN);
+		}
+		udc_ep_ptr->tran_ring_full = false;
+		udc_ep_ptr->ep_state = EP_STATE_DISABLED;
+		/*
+		 * This bypasses the generic usb_ep_disable() API, so the
+		 * framework's own usb_ep.enabled bookkeeping needs to be
+		 * cleared directly here too (crg_udc_reinit() already does
+		 * this for the live bus-reset case). Otherwise a later
+		 * usb_ep_enable() call for this endpoint short-circuits on
+		 * the stale "already enabled" flag without ever calling our
+		 * .enable callback, leaving desc/the ring never set up for
+		 * the new session.
+		 */
+		udc_ep_ptr->usb_ep.enabled = 0;
+	}
+	crg_udc->num_enabled_eps = 0;
+
+	/* Complete any reqs on EP0 queue */
+	udc_ep_ptr = &crg_udc->udc_ep[0];
+	if (udc_ep_ptr->desc) {
+		udc_ep_ptr->desc = NULL;
+		udc_ep_ptr->comp_desc = NULL;
+		crg_udc_ep_nuke(udc_ep_ptr, -ESHUTDOWN);
+	}
+
+	return 0;
+}
+
+static const struct crg_udc_priv crg_udc_data = {
+	.quirks = CRG_UDC_QUIRKS_DEFAULT,
+};
+
+static const struct of_device_id of_crg_udc_match[] = {
+	{ .compatible = "axiado,ax3000-udc", .data = &crg_udc_data },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, of_crg_udc_match);
+
+static SIMPLE_DEV_PM_OPS(crg_udc_pm_ops, crg_udc_suspend, crg_udc_resume);
+
+static struct platform_driver crg_udc_driver = {
+	.probe = crg_udc_probe,
+	.remove = crg_udc_remove,
+	.shutdown = crg_udc_shutdown,
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = of_crg_udc_match,
+		.pm = &crg_udc_pm_ops,
+	},
+};
+module_platform_driver(crg_udc_driver);
+
+MODULE_AUTHOR("Axiado Corporation");
+MODULE_DESCRIPTION("Axiado AX3000/AX3005 USB Device Controller");
+MODULE_LICENSE("GPL");

-- 
2.34.1

