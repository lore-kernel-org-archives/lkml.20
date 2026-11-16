Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.81
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794856037;
	b=zRlCnBM0NoCOz0LBnQ2U++crOh+pU3DqqHHygDPYb7qp7oSi8FNGT3N7AcOemeHvwPCQ
	 F6MURrI4qWYyJ4c95vpUu1OEl8ytrUYyY6JJcubNdkIk57ufQmzvnC7VKKS3aCz/GefgH
	 hO0nl91JZCGZ10ziKquCPraR3U3GesQEwGgOOxiAtb2eSgGYBaz6ynT7BIFaOxvt8niEr
	 ImewHMniKWZAvO4CzE3waFsrFXJXaOMHAE1IT5QuougRNCBcomLhQ0GkmZ6L8Hp8oFyM2
	 YOvgFbl7cRrRA/TKcAm3dRqUSVvB6cRuYOXC+C6hJF7HrUKc1WpKGbwI2HZ6wKz6JVg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794856037;
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
	bh=IIiXfTC78vr2Hsvqokw2M6J+KAI4UMCn2ttmYRpnmwg=;
	b=KTZKmyQSbGqszFdAG1+6VUy8Boeu2Kz1qLQsk3r4IvRlFX/kG7rJrMzSMgiZmdS/BadH
	 1m3JJ1tH40oLdo7DF6kfDE1iZLW3yTxiR9YUtmvNV0raY7rKzHNaSNv1r/ima9vh5YNUw
	 6YgUhh14C7Hs3YryR0HpoylhJiKjSe+pMqS66dJQaC4rmrefNVtwAOJ1SORgDIdXmp/MV
	 S7/2m1bVm+SW2HtSvIXDKoknSBq/EW2jEvk5lxnEIZOGbqaLiegIThhpYbRQq+Tjjzn9i
	 9wWDKSXk22lBlxhlY2TsndXrjSo0p6BknAzIExwwF+Is5tuBXQ5w8+WNOGNTxc7fp+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=axiado.com;
	spf=pass smtp.mailfrom=axiado.com;
	dkim=pass header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=PGpqE8iy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.81
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11020081.outbound.protection.outlook.com [52.101.61.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD02606A33F;
	Mon, 16 Nov 2026 19:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FD02606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=PGpqE8iy
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jb0mI1CZUE0yLpqDyoTxSUwJpFdMkjONdxtBEuR5uVXkh0QygS0qK5VD2p+6uMBW3zAK03kIT5/xMRYH8+mhyvc1SufNqAQfr2RqpFgCpVvASqMdaZrKgG+2Lq/UDO6B3VJLNs+3W67dhJYUMJpBIywOEb5rMGkQAMiTl7Kl3O9hVQ0j8azJcGio+vU53zz15JiGFwWXPhChMCMY4miUuVcBjrAha8F+NZ8YRsEhP3fw2577KAgKDU6KlG5P+Jy2sjSqhK4vVCULAofTxRZ4R/pOpeSGU2PVS1Qy+YZLEL9UCPNNRFS8PhZv/awl38FlDsGTZ4yc+Hl14zHYwMumJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IIiXfTC78vr2Hsvqokw2M6J+KAI4UMCn2ttmYRpnmwg=;
 b=ZFpxNLED1QsHn7LrnEyW3TETROVn5SQmf5c3NlwU6c8bAF6bfYIdUyDlHDRmhiSwoVEcRGOoc8IRzJHigBddCc6z1KKuU6yFgo+Je3xaJ6OVYlnFrLpAjBgvmoF1GMs5YffwFkBIrQB/mmGQMAj2KWNnC8CGaGvuRYQzL5T9RF7p+xLkZa5leSWg0UEJmxuWJTTbKMSmn0w7vaKT5wziGW5GfR4FCeOFIfxtuSkaKZjZWfN7VCNHLicv+K0lcLpyWA2Ax/c8GvVsONxR1FaJDrSD3Lb100QVlR716gkTbYu/5qAZwanyh5L3VAZRUfjtjysnlLz9gxU7IW5dqk5Mxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIiXfTC78vr2Hsvqokw2M6J+KAI4UMCn2ttmYRpnmwg=;
 b=PGpqE8iyp2uhbYyVxyLSYe29RTPje8cn7T5GoSM+uiaKiL0oWq/6W0o2elJQA41X0fVUmNpc8vnpdGydyuUu4hhWVqLZ+fcenEcZBumjCHgN78+2P1UmwbinUQHEcMEKAO2xDRMtyx2MkS2NJA5s5e0X5JpqISposSJurIfD+wMRj4pPHHkx/rWcGhtHQNGqAzprZPyQQtC6dnnHQb1pYjLbRqhjZFYanUxH7WZHZ3+21P+l2Zl1zrE50Fjnk4fGbN+3yhEVhJYEnqIJL16gmRBzdDTCnQQpqR5WvGU3hDjxFfVtGA19TLMVqOGEkeeluYzzWRgVPghCpW20gxol0Q==
Received: from PH8PR07CA0032.namprd07.prod.outlook.com (2603:10b6:510:2cf::6)
 by IA1PR18MB6394.namprd18.prod.outlook.com (2603:10b6:208:59a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 19:06:40 +0000
Received: from PH7PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:510:2cf:cafe::7b) by PH8PR07CA0032.outlook.office365.com
 (2603:10b6:510:2cf::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 19:06:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 64.62.143.114) smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 PH7PEPF00000009.mail.protection.outlook.com (10.167.243.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Mon, 16 Nov 2026 19:06:40 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id A449140BFE10;
	Mon, 16 Nov 2026 11:06:39 -0800 (PST)
From: Petar Stepanovic <pstepanovic@axiado.com>
Date: Mon, 16 Nov 2026 11:06:20 -0800
Subject: [PATCH v5 6/6] usb: gadget: udc: crg: Add core driver and build
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
Message-Id: <20261116-axiado-ax3000-usb-device-controller-v5-6-49271ed5c793@axiado.com>
References: <20261116-axiado-ax3000-usb-device-controller-v5-0-49271ed5c793@axiado.com>
In-Reply-To: <20261116-axiado-ax3000-usb-device-controller-v5-0-49271ed5c793@axiado.com>
To: Prasad Bolisetty <pbolisetty@axiado.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>, 
 Karthikeyan Mitran <kmitran@axiado.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Neill Kapron <nkapron@google.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Petar Stepanovic <pstepanovic@axiado.com>, 
 Krutik Shah <krutikshah@axiado.com>, 
 Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794855998; l=45078;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=j72fMGfhDVDTx1EDFup1x0QovZCwKkAifoGALOZMVxQ=;
 b=5ibulFhYMgFrLvNc3M1sK5CeUNf8CP8vQRE9cekbjkd8bd90Ne1VDzsxRqpijz8qRuZfR4pLf
 OnygNpzUBSVBPf7olzNccxJv8MiUS1iUMQYXU2ndWIbwgPRubaDRA+Q
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PEPF00000009:EE_|IA1PR18MB6394:EE_
X-MS-Office365-Filtering-Correlation-Id: d1adf340-ea00-45dd-7390-08df4414bedd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|7416014|23010399003|22082099003|18002099003|6133799003|261009220027099003|261009221227099003|261009221727099003|261009223027099003|261009223327099003|3023799007|56012099006|5023799004|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261021123027099003|261022075727099003|261022105027099003|261022113327099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	o8SCkWY41Xh/7gAZbgmH+jfBcEChGoG7LjeOyh3fdKRzgM/iAmIJBcsVBwGMT+hoAGeFMsAcvoa8fF1hkKn/yTlkenwcWoU0evj05bqJzG3lLPL3u7Gj4/EtsyZlT8O/lgAzBG/3TdI6UztLH8dX3jItIDJBVMGJ03l6Ga7UzjUgi191omA1b2b9az6+XPBMyAju0TkAntrqRntdMZz8L99UomJz4+OkcyJzs2OQVfJ7v6FIkf/x9YyejzyO/X7nqS7yS6f0HNKZzSPtWa/y8xM44mPjq+PP2QbtdWYD/qJA3vb2bNrO1hFcNCRQ6EZI+ur8Uqcd+edyaseJM5P0WfwQRlyhyTEIJ7tvm3/RoR1YVuvVDR3b03+Zc2mloF+3QWchzLTQFwAeNRftTo1hWb63mJYHzab0lV1T9IcYU7BaTgmF5d/YWofk4GAhEg/8J7JtldiV5pvl8jDHJuQEFWwz+tCmD8eLgYYizBoFsJDNzAQrC0lwVs/+Mr0V3fJL3l9bryls8CdRPjADHrHkC4uAhZVeb0mdlxLKo28t98W5/Em9x4evDuv4/yCGRDWKG6C98OFOgvkk/aljVJNOzIe9mmC44Lcu89MhpZNj6j2T8FhoVtK16sHFmcL53tOgHivPqg/NVAMd7WkK+v56Ij+vqZeIPNiYzGK5Mplyw9JCXYOmxXJkojh9g2GiReaUBumWKDm98iJS0LeaHgj7KQ==
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(7416014)(23010399003)(22082099003)(18002099003)(6133799003)(261009220027099003)(261009221227099003)(261009221727099003)(261009223027099003)(261009223327099003)(3023799007)(56012099006)(5023799004)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261021123027099003)(261022075727099003)(261022105027099003)(261022113327099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xM0rY5cPun0+9dqCkGHrVyjuf2O0sagy5GzrH1CjCtt3sEpbtu7YqB8xYNUuJJYDT0Yob/BIIt1/tiWudqsKXOcdsw5WYiJ+5CzkbiDbIA6Nq8P8C54J1gpLemIC3mZh9vTK/B4vdArb7cGT8eO0KAYAXz275xJCLg4LhtyEJCiVwYKO/B8WoWP1K7fT7fOxSp4etxc7dBRVbeMytPtyxb/1ryZ1OE7eRFOOasiQs/vHV+RyZWzTQtoJyuiUr/tyauCy3uXWjyDAAIypKcUm6LiUoPynLmyPO4RdnqOzQSSMNHsEZhjeTMmuKFPXEh6Bw7jzraWxrrZgZGRaSPb5hBvy1ZraeA+CVSkjLeKMcQGX6Qxmv8tog5D1ZEt+cbXebI0gt2CT5vOOKRxiU4Lrho1zMjbX/zBArOlnfFQ+xLEJfH/WjkXWXh4cQWUsPH9A
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 19:06:40.1385
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1adf340-ea00-45dd-7390-08df4414bedd
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH7PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR18MB6394

This patch introduces the core probe/remove functions for the Axiado
AX3000/AX3005 UDC driver, and wires up the directory into the build
system via Kconfig and Makefile.

Co-developed-by: Krutik Shah <krutikshah@axiado.com>
Signed-off-by: Krutik Shah <krutikshah@axiado.com>
Co-developed-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
Signed-off-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
Co-developed-by: Tzu-Hao Wei <twei@axiado.com>
Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
---
 drivers/usb/gadget/udc/Kconfig            |    2 +
 drivers/usb/gadget/udc/Makefile           |    1 +
 drivers/usb/gadget/udc/crg/Kconfig        |   16 +
 drivers/usb/gadget/udc/crg/Makefile       |    9 +
 drivers/usb/gadget/udc/crg/crg-udc-core.c | 1376 +++++++++++++++++++++++++++++
 5 files changed, 1404 insertions(+)

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
index 000000000000..e508dbd45339
--- /dev/null
+++ b/drivers/usb/gadget/udc/crg/crg-udc-core.c
@@ -0,0 +1,1376 @@
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
+static void crg_udc_recovery_work(struct work_struct *work);
+static int crg_udc_reset(struct crg_gadget_dev *crg_udc, unsigned long *flags);
+
+static int crg_udc_alloc_ep_rings(struct crg_gadget_dev *crg_udc)
+{
+	int i;
+
+	/*
+	 * Preallocate two disjoint rings per endpoint. Endpoint enable and
+	 * controller recovery can run in atomic context.
+	 */
+	for (i = 0; i < CRG_NUM_EP_CX; i++) {
+		struct crg_buffer_info *ring = &crg_udc->udc_ep[i].tran_ring_alloc;
+		size_t len = (i ? CRG_UDC_BULK_EP_TD_RING_SIZE :
+			      CRG_UDC_CONTROL_EP_TD_RING_SIZE) *
+			     sizeof(struct crg_transfer_trb);
+
+		if (i == 1)
+			continue;
+
+		ring->cpu_addr = dma_alloc_coherent(crg_udc->dev, 2 * len,
+						    &ring->dma_addr, GFP_KERNEL);
+		if (!ring->cpu_addr)
+			return -ENOMEM;
+		ring->len = 2 * len;
+	}
+
+	return 0;
+}
+
+static void crg_udc_select_transfer_rings(struct crg_gadget_dev *crg_udc)
+{
+	int i;
+
+	/*
+	 * Transfer events identify TRBs by DMA address. After confirmed
+	 * quiescence, use the other bank for the next session so a completion
+	 * for the previous bank cannot match a new request. Keep the selected
+	 * bank if a rebuild failed before RUN was set. Reusing a bank from
+	 * older sessions relies on the halt/reset and event-ring clear.
+	 */
+	if (crg_udc->transfer_rings_live) {
+		crg_udc->transfer_ring_bank = !crg_udc->transfer_ring_bank;
+		crg_udc->transfer_rings_live = false;
+	}
+
+	for (i = 0; i < CRG_NUM_EP_CX; i++) {
+		struct crg_udc_ep *ep = &crg_udc->udc_ep[i];
+		struct crg_buffer_info *alloc = &ep->tran_ring_alloc;
+		u32 len = alloc->len / 2;
+		u32 offset = crg_udc->transfer_ring_bank ? len : 0;
+		void *addr;
+
+		if (!alloc->cpu_addr)
+			continue;
+
+		addr = (u8 *)alloc->cpu_addr + offset;
+		if (ep->tran_ring_info.cpu_addr == addr)
+			continue;
+
+		ep->tran_ring_info.cpu_addr = addr;
+		ep->tran_ring_info.dma_addr = alloc->dma_addr + offset;
+		ep->tran_ring_info.len = len;
+		ep->first_trb = NULL;
+		ep->last_trb = NULL;
+		ep->enq_pt = NULL;
+		ep->deq_pt = NULL;
+	}
+}
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
+	u32 tmp;
+	bool running;
+
+	running = !!(readl(&uccr->control) & CRG_U3DC_CTRL_RUN);
+	/* Only INIT_EP0 may be staged while the controller is stopped. */
+	if (!running && type != CRG_CMD_INIT_EP0)
+		return -ESHUTDOWN;
+
+	/*
+	 * A staged command must complete before the command registers can
+	 * be reused. Hardware does not consume commands while RUN is clear.
+	 */
+	tmp = readl(&uccr->cmd_control);
+	if (tmp & CRG_U3DC_CMD_CTRL_ACTIVE) {
+		if (!running)
+			return -EBUSY;
+		if (readl_poll_timeout_atomic(&uccr->cmd_control, tmp,
+					      !(tmp & CRG_U3DC_CMD_CTRL_ACTIVE),
+					      1, 10000))
+			return -ETIMEDOUT;
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
+	if (!running)
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
+/*
+ * Stop the controller and wait for pending event writes before resetting it.
+ * Corigine USB 3.1 DRD v1.5, sections 8.3.3 and 8.3.4: Controller Halted
+ * requires Controller Idle, at which point queued events have reached the
+ * event ring. Discard those events when rebuilding the ring after reset.
+ */
+static int crg_udc_soft_reset(struct crg_gadget_dev *crg_udc, bool atomic)
+{
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	u32 ctrl, val;
+	int ret;
+
+	ctrl = readl(&uccr->control);
+	ctrl &= ~(CRG_U3DC_CTRL_RUN | CRG_U3DC_CTRL_INT_EN |
+		  CRG_U3DC_CTRL_SYSERR_EN | CRG_U3DC_CTRL_SWRST);
+	writel(ctrl, &uccr->control);
+
+	if (atomic)
+		ret = readl_poll_timeout_atomic(&uccr->status, val,
+					       val & CRG_U3DC_STATUS_DEV_CTRL_HALT,
+					       10, 10000);
+	else
+		ret = readl_poll_timeout(&uccr->status, val,
+					val & CRG_U3DC_STATUS_DEV_CTRL_HALT,
+					10, 10000);
+	if (ret) {
+		dev_err(crg_udc->dev, "controller halt timed out before reset\n");
+		return ret;
+	}
+
+	writel(ctrl | CRG_U3DC_CTRL_SWRST, &uccr->control);
+	if (atomic)
+		ret = readl_poll_timeout_atomic(&uccr->control, val,
+					       !(val & CRG_U3DC_CTRL_SWRST), 10, 10000);
+	else
+		ret = readl_poll_timeout(&uccr->control, val,
+					!(val & CRG_U3DC_CTRL_SWRST), 10, 10000);
+	if (ret)
+		dev_err(crg_udc->dev, "software reset timed out\n");
+
+	return ret;
+}
+
+/*
+ * Stop bus-master DMA with new submissions blocked. This can sleep.
+ * An asserted SoC reset is a fallback when halting or SWRST times out.
+ */
+static int crg_udc_quiesce_hw(struct crg_gadget_dev *crg_udc)
+{
+	int ret;
+
+	if (crg_udc->hw_reset_asserted || !crg_udc->hw_dma_armed)
+		return 0;
+	if (!crg_udc->uccr)
+		return -ENODEV;
+
+	ret = crg_udc_soft_reset(crg_udc, false);
+	if (!ret) {
+		crg_udc->hw_dma_armed = false;
+		return 0;
+	}
+
+	if (!crg_udc->rst)
+		return ret;
+
+	ret = reset_control_assert(crg_udc->rst);
+	if (!ret) {
+		crg_udc->hw_reset_asserted = true;
+		crg_udc->hw_dma_armed = false;
+	}
+
+	return ret;
+}
+
+static void crg_udc_free_resources(struct crg_gadget_dev *crg_udc)
+{
+	unsigned long flags;
+	int i, ret;
+
+	/* Block any in-flight threaded handler before releasing DMA memory. */
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	crg_udc->shutting_down = true;
+	if (crg_udc->uccr && !crg_udc->hw_reset_asserted &&
+	    crg_udc->hw_dma_armed) {
+		u32 val = readl(&crg_udc->uccr->control);
+
+		val &= ~(CRG_U3DC_CTRL_INT_EN | CRG_U3DC_CTRL_RUN |
+			 CRG_U3DC_CTRL_SYSERR_EN);
+		writel(val, &crg_udc->uccr->control);
+	}
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+	if (crg_udc->irq >= 0) {
+		synchronize_irq(crg_udc->irq);
+		devm_free_irq(crg_udc->dev, crg_udc->irq, crg_udc);
+		crg_udc->irq = -1;
+		crg_udc->gadget.irq = 0;
+	}
+
+	if (crg_udc->status_req) {
+		kfree(crg_udc->status_req->usb_req.buf);
+		crg_udc_free_request(&crg_udc->udc_ep[0].usb_ep,
+				     &crg_udc->status_req->usb_req);
+		crg_udc->status_req = NULL;
+	}
+
+	ret = crg_udc_quiesce_hw(crg_udc);
+	if (ret) {
+		crg_udc->dma_quiesce_failed = true;
+		/*
+		 * Retain potentially live DMA mappings and coherent allocations.
+		 * A platform with detachable DMA translations must isolate the
+		 * master independently before tearing down its DMA domain.
+		 */
+		dev_crit(crg_udc->dev,
+			 "DMA stop failed (%d); retaining allocations, platform isolation required\n",
+			 ret);
+		return;
+	}
+	crg_udc->dma_quiesce_failed = false;
+	crg_udc_release_quarantine(crg_udc);
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
+		struct crg_buffer_info *alloc = &udc_ep->tran_ring_alloc;
+
+		if (alloc->cpu_addr) {
+			dma_free_coherent(crg_udc->dev, alloc->len,
+					  alloc->cpu_addr, alloc->dma_addr);
+			*alloc = (struct crg_buffer_info){};
+			udc_ep->tran_ring_info.cpu_addr = NULL;
+			udc_ep->tran_ring_info.dma_addr = DMA_MAPPING_ERROR;
+			udc_ep->tran_ring_info.len = 0;
+			udc_ep->first_trb = NULL;
+			udc_ep->last_trb = NULL;
+			udc_ep->enq_pt = NULL;
+			udc_ep->deq_pt = NULL;
+		}
+	}
+}
+
+static int crg_udc_init_hw(struct crg_gadget_dev *crg_udc)
+{
+	struct device *dev = crg_udc->dev;
+	struct reset_control *rst;
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
+	rst = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(rst))
+		return dev_err_probe(dev, PTR_ERR(rst),
+				     "failed to get reset\n");
+	crg_udc->rst = rst;
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
+	crg_udc = kzalloc_obj(*crg_udc);
+	if (!crg_udc)
+		return -ENOMEM;
+	usb_initialize_gadget(&pdev->dev, &crg_udc->gadget,
+			      crg_udc_gadget_release);
+
+	crg_udc->dev = &pdev->dev;
+	crg_udc->irq = -1;
+	/* Probe errors can call free_resources() before hardware init. */
+	spin_lock_init(&crg_udc->udc_lock);
+	init_waitqueue_head(&crg_udc->teardown_wait);
+	INIT_LIST_HEAD(&crg_udc->dma_quarantine);
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
+	INIT_WORK(&crg_udc->udc_reset_work, crg_udc_reset_work);
+	INIT_WORK(&crg_udc->recovery_work, crg_udc_recovery_work);
+	INIT_DELAYED_WORK(&crg_udc->port_retry_work, crg_udc_port_retry_work);
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
+	/* Hardware only supports Full-, High-, and SuperSpeed. */
+	switch (crg_udc->gadget.max_speed) {
+	case USB_SPEED_FULL:
+	case USB_SPEED_HIGH:
+	case USB_SPEED_SUPER:
+		break;
+	case USB_SPEED_LOW:
+		crg_udc->gadget.max_speed = USB_SPEED_FULL;
+		break;
+	default:
+		crg_udc->gadget.max_speed = USB_SPEED_SUPER;
+		break;
+	}
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
+	/* Initialize endpoint objects before reset, DMA setup or any IRQ. */
+	crg_udc_init_ep_info(crg_udc);
+
+	ret = crg_udc_alloc_ep_rings(crg_udc);
+	if (ret)
+		goto err_free_resources;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	ret = crg_udc_reset(crg_udc, &flags);
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+	if (ret)
+		goto err_free_resources;
+
+	crg_udc_clear_portpm(crg_udc);
+
+	ret = crg_udc_reset_data_struct(crg_udc);
+	if (ret) {
+		dev_err(crg_udc->dev, "crg_udc_reset_data_struct error\n");
+		goto err_free_resources;
+	}
+
+	ret = crg_udc_init_ep0(crg_udc);
+	if (ret)
+		goto err_free_resources;
+
+	crg_udc->udc_ep[0].desc = &crg_udc->ep0_desc;
+	/* Release the reset gate only after EP0 and all event rings exist. */
+	crg_udc->resetting = false;
+
+	ret = crg_gadget_irq_init(pdev, crg_udc);
+	if (ret)
+		goto err_free_resources;
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
+	unsigned long flags;
+	u32 tmp;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	crg_udc->shutting_down = true;
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+
+	/* The gadget core calls pullup(0) before the disconnect callback. */
+	usb_del_gadget(&crg_udc->gadget);
+	cancel_delayed_work_sync(&crg_udc->port_retry_work);
+	cancel_work_sync(&crg_udc->recovery_work);
+	cancel_work_sync(&crg_udc->udc_reset_work);
+	crg_udc_free_resources(crg_udc);
+
+	/* Do not access registers while the external reset is asserted. */
+	if (!crg_udc->hw_reset_asserted && !crg_udc->dma_quiesce_failed) {
+		tmp = readl(crg_udc->mmio_virt_base + CRG_UDC_MODE_REG) & ~0x1;
+		writel(tmp, crg_udc->mmio_virt_base + CRG_UDC_MODE_REG);
+	}
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
+	crg_udc->pullup_on = false;
+	crg_udc->shutting_down = true;
+	crg_udc->resetting = true;
+	crg_udc->device_state = USB_STATE_ATTACHED;
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+	if (crg_udc->irq >= 0)
+		synchronize_irq(crg_udc->irq);
+	cancel_delayed_work_sync(&crg_udc->port_retry_work);
+	cancel_work_sync(&crg_udc->recovery_work);
+	cancel_work_sync(&crg_udc->udc_reset_work);
+
+	/* Reset and gadget stop may own the registers across a lock drop. */
+	spin_lock_irq(&crg_udc->udc_lock);
+	wait_event_lock_irq(crg_udc->teardown_wait,
+			    !crg_udc->controller_recovering, crg_udc->udc_lock);
+	if (crg_udc->uccr && !crg_udc->hw_reset_asserted) {
+		u32 val = readl(&crg_udc->uccr->control);
+
+		crg_udc_set_vbus_detect(crg_udc, false);
+		val &= ~(CRG_U3DC_CTRL_INT_EN | CRG_U3DC_CTRL_RUN |
+			 CRG_U3DC_CTRL_SYSERR_EN);
+		writel(val, &crg_udc->uccr->control);
+	}
+	spin_unlock_irq(&crg_udc->udc_lock);
+}
+
+static int crg_udc_suspend(struct device *dev)
+{
+	struct crg_gadget_dev *crg_udc = dev_get_drvdata(dev);
+	unsigned long flags;
+	u32 val;
+	int ret;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	if (crg_udc->controller_recovering || crg_udc->shutting_down ||
+	    crg_udc->external_reset_pending ||
+	    crg_udc->endpoint_recovery_pending ||
+	    (crg_udc->hw_reset_asserted && !crg_udc->gadget_stopping)) {
+		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+		return -EBUSY;
+	}
+	crg_udc->suspended = true;
+	if (crg_udc->gadget_stopping) {
+		if (crg_udc->hw_dma_armed) {
+			crg_udc->suspended = false;
+			ret = -EBUSY;
+		} else {
+			ret = 0;
+		}
+		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+		return ret;
+	}
+	crg_udc_set_pullup(crg_udc, false);
+	val = readl(&crg_udc->uccr->control);
+	val &= ~CRG_U3DC_CTRL_INT_EN;
+	writel(val, &crg_udc->uccr->control);
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+
+	if (crg_udc->irq >= 0)
+		synchronize_irq(crg_udc->irq);
+	cancel_delayed_work_sync(&crg_udc->port_retry_work);
+	cancel_work_sync(&crg_udc->recovery_work);
+	cancel_work_sync(&crg_udc->udc_reset_work);
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	if (crg_udc->gadget_stopping || crg_udc->shutting_down ||
+	    crg_udc->controller_recovering || crg_udc->external_reset_pending ||
+	    crg_udc->endpoint_recovery_pending) {
+		ret = -EBUSY;
+		goto out;
+	}
+	/*
+	 * A reset may already have marked the link disconnected while its
+	 * gadget notification was still pending. Deliver disconnect before
+	 * resetting the software state, including that cancelled work.
+	 */
+	if (crg_udc->connected || crg_udc->bus_reset_pending)
+		crg_udc_notify_disconnect(crg_udc, &flags);
+	crg_udc->connected = false;
+	crg_udc->gadget.speed = USB_SPEED_UNKNOWN;
+	if (crg_udc->external_reset_pending || crg_udc->endpoint_recovery_pending) {
+		ret = -EBUSY;
+		goto out;
+	}
+	ret = crg_udc_recover(crg_udc, &flags);
+	if (ret)
+		dev_err(crg_udc->dev, "suspend controller reset failed: %d\n", ret);
+out:
+	if (ret) {
+		crg_udc->suspended = false;
+		crg_udc_kick_reset_work(crg_udc);
+	}
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+	return ret;
+}
+
+static int crg_udc_resume(struct device *dev)
+{
+	struct crg_gadget_dev *crg_udc = dev_get_drvdata(dev);
+	unsigned long flags;
+	int ret = 0;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	crg_udc->suspended = false;
+	if (!crg_udc->gadget_stopping) {
+		if (crg_udc->shutting_down || crg_udc->resetting)
+			ret = -ESHUTDOWN;
+		else if (crg_udc->gadget_driver && crg_udc->pullup_on)
+			crg_udc_set_pullup(crg_udc, true);
+	}
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+	return ret;
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
+	crg_udc_select_transfer_rings(crg_udc);
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
+	/*
+	 * A reset started on another CPU owns the controller registers and
+	 * the event rings until it has rebuilt them. It drops udc_lock while
+	 * polling SWRST and during givebacks, so this handler can get in.
+	 */
+	if (crg_udc->resetting || crg_udc->suspended ||
+	    crg_udc->shutting_down || crg_udc->controller_recovering) {
+		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+		return;
+	}
+
+	tmp_status = readl(&uccr->status);
+
+	if (tmp_status & CRG_U3DC_STATUS_SYS_ERR) {
+		bool was_connected = crg_udc->connected;
+		u32 generation = crg_udc->udc_event[0].generation;
+
+		/* A controller reset must not overlap composite's ->reset(). */
+		if (crg_udc->reset_callback_active) {
+			writel(CRG_U3DC_STATUS_SYS_ERR, &uccr->status);
+			crg_udc->deferred_system_error = true;
+			spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+			return;
+		}
+
+		dev_err(crg_udc->dev, "controller system error\n");
+		writel(CRG_U3DC_STATUS_SYS_ERR, &uccr->status);
+		/* Function drivers must see enabled endpoints on disconnect. */
+		if (was_connected)
+			crg_udc_notify_disconnect(crg_udc, &flags);
+		/*
+		 * The disconnect callback drops udc_lock: another CPU may be
+		 * resetting now, or may have reset and rebuilt the rings
+		 * already, in which case this error has been recovered.
+		 */
+		if (crg_udc->resetting || crg_udc->suspended ||
+		    crg_udc->shutting_down ||
+		    generation != crg_udc->udc_event[0].generation) {
+			spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+			return;
+		}
+		crg_udc_recover_link(crg_udc, &flags, false);
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
+			u32 generation = crg_udc->udc_event[i].generation;
+
+			ret = crg_udc_process_event_ring(crg_udc, i, &flags);
+			/*
+			 * The event handlers drop udc_lock, so a reset may have
+			 * started (resetting) or already completed and rebuilt
+			 * the rings (generation) while they ran. Either way
+			 * tmp_status and the checks below are stale.
+			 */
+			if (unlikely(crg_udc->resetting || crg_udc->suspended ||
+				     crg_udc->shutting_down ||
+				     generation != crg_udc->udc_event[i].generation)) {
+				spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+				return;
+			}
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
+		/* The port handler drops udc_lock. */
+		if (crg_udc->resetting) {
+			spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+			return;
+		}
+	}
+
+	if (crg_udc->device_state == USB_STATE_RECONNECTING &&
+	    crg_udc->connected == 1) {
+		ret = crg_udc_prepare_for_setup(crg_udc);
+		if (!ret && crg_udc->pending_setup_valid &&
+		    !crg_udc->resetting && crg_udc->connected &&
+		    crg_udc->device_state == USB_STATE_DEFAULT) {
+			struct usb_ctrlrequest setup = crg_udc->pending_setup;
+			u8 tag = crg_udc->pending_setup_tag;
+
+			crg_udc->pending_setup_valid = false;
+			crg_udc_dispatch_setup(crg_udc, &setup, tag, &flags);
+		} else if (ret && ret != -EBUSY) {
+			dev_err(crg_udc->dev,
+				"failed to prepare EP0 after reset: %d\n", ret);
+		}
+	}
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
+	u32 status;
+
+	if (READ_ONCE(crg_udc->gadget_stopping) ||
+	    READ_ONCE(crg_udc->shutting_down) ||
+	    READ_ONCE(crg_udc->resetting))
+		return IRQ_NONE;
+
+	status = readl(&uccr->status);
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
+/* Invalidate the old software session before dropping udc_lock. */
+static void crg_udc_reset_session(struct crg_gadget_dev *crg_udc)
+{
+	crg_udc->resetting = true;
+	crg_udc->bus_reset_generation++;
+	crg_udc->bus_reset_pending = false;
+	crg_udc->external_reset_pending = false;
+	crg_udc->endpoint_recovery_pending = false;
+	crg_udc->restart_after_reset = false;
+	crg_udc->deferred_port_events = 0;
+	crg_udc->deferred_system_error = false;
+	crg_udc->portsc_on_reconnecting = false;
+	crg_udc->setup_fn_call_back = NULL;
+	crg_udc->set_tm = 0;
+	crg_udc->udc_ep[0].generation++;
+	crg_udc->pending_setup_valid = false;
+}
+
+static void crg_udc_reset_queues(struct crg_gadget_dev *crg_udc,
+				 bool preserve_enabled)
+{
+	int i;
+
+	crg_udc->setup_status = WAIT_FOR_SETUP;
+	crg_udc->device_state = USB_STATE_ATTACHED;
+	crg_udc->dev_addr = 0;
+	crg_udc->port_reset_pending = false;
+	crg_udc->num_enabled_eps = 0;
+
+	crg_udc->udc_ep[0].desc = NULL;
+	crg_udc->udc_ep[0].ep_state = EP_STATE_DISABLED;
+
+	/* Data endpoint contexts start at DCI 2. DCI 1 has no queue. */
+	for (i = 2; i < CRG_NUM_EP_CX; i++) {
+		struct crg_udc_ep *ep = &crg_udc->udc_ep[i];
+
+		ep->generation++;
+		ep->desc = NULL;
+		ep->comp_desc = NULL;
+		ep->tran_ring_full = false;
+		ep->halt_failed = false;
+		ep->disable_failed = false;
+		ep->dequeue_paused = false;
+		ep->ep_state = EP_STATE_DISABLED;
+	}
+
+	for (i = 2; i < CRG_NUM_EP_CX; i++)
+		crg_udc_ep_nuke(&crg_udc->udc_ep[i], -ESHUTDOWN);
+	crg_udc_ep_nuke(&crg_udc->udc_ep[0], -ESHUTDOWN);
+
+	/* Preserve Gadget's endpoint state through all givebacks. */
+	if (!preserve_enabled)
+		for (i = 2; i < CRG_NUM_EP_CX; i++)
+			crg_udc_ep_clear_enabled(&crg_udc->udc_ep[i]);
+}
+
+static int crg_udc_reset(struct crg_gadget_dev *crg_udc, unsigned long *flags)
+{
+	int ret;
+
+	crg_udc_reset_session(crg_udc);
+	spin_unlock_irqrestore(&crg_udc->udc_lock, *flags);
+	ret = crg_udc_soft_reset(crg_udc, true);
+	spin_lock_irqsave(&crg_udc->udc_lock, *flags);
+	if (ret)
+		return ret;
+
+	crg_udc->hw_dma_armed = false;
+	crg_udc->dma_quiesce_failed = false;
+	crg_udc_release_quarantine(crg_udc);
+	crg_udc_clear_portpm(crg_udc);
+	crg_udc_reset_queues(crg_udc, crg_udc->preserve_ep_enabled_on_reset);
+	return 0;
+}
+
+/*
+ * The UDC core serializes pullup, async-callback and stop operations.
+ * Return requests before disconnect or unbind can free their storage.
+ */
+int crg_udc_stop_gadget(struct crg_gadget_dev *crg_udc)
+{
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	u32 val;
+	int ret;
+
+	spin_lock_irq(&crg_udc->udc_lock);
+	if (crg_udc->gadget_stopping) {
+		/* A previous stop or a failed restart can leave DMA armed. */
+		bool retry = crg_udc->hw_dma_armed;
+
+		if (!retry) {
+			spin_unlock_irq(&crg_udc->udc_lock);
+			return 0;
+		}
+		goto quiesce;
+	}
+	crg_udc->gadget_stopping = true;
+	crg_udc->pullup_on = false;
+	crg_udc_reset_session(crg_udc);
+	if (!crg_udc->controller_recovering && crg_udc->hw_dma_armed) {
+		val = readl(&uccr->control);
+		val &= ~(CRG_U3DC_CTRL_RUN | CRG_U3DC_CTRL_INT_EN |
+			 CRG_U3DC_CTRL_SYSERR_EN);
+		writel(val, &uccr->control);
+	}
+	spin_unlock_irq(&crg_udc->udc_lock);
+
+	if (crg_udc->irq >= 0)
+		synchronize_irq(crg_udc->irq);
+	cancel_delayed_work_sync(&crg_udc->port_retry_work);
+	cancel_work_sync(&crg_udc->recovery_work);
+	cancel_work_sync(&crg_udc->udc_reset_work);
+
+	spin_lock_irq(&crg_udc->udc_lock);
+	wait_event_lock_irq(crg_udc->teardown_wait,
+			    !crg_udc->controller_recovering &&
+			    !crg_udc->gadget_callbacks_active && !crg_udc->queueing,
+			    crg_udc->udc_lock);
+quiesce:
+	crg_udc_recovery_begin(crg_udc);
+	spin_unlock_irq(&crg_udc->udc_lock);
+	ret = crg_udc_quiesce_hw(crg_udc);
+	if (ret)
+		dev_err(crg_udc->dev,
+			"cannot stop DMA during gadget teardown: %d\n", ret);
+
+	spin_lock_irq(&crg_udc->udc_lock);
+	crg_udc->dma_quiesce_failed = !!ret;
+	crg_udc->controller_faulted = !!ret;
+	if (!ret) {
+		if (!crg_udc->hw_reset_asserted)
+			crg_udc_set_vbus_detect(crg_udc, false);
+		crg_udc_release_quarantine(crg_udc);
+	}
+	/* Function drivers can inspect usb_ep.enabled during disconnect. */
+	crg_udc_reset_queues(crg_udc, true);
+	crg_udc->connected = false;
+	crg_udc->gadget.speed = USB_SPEED_UNKNOWN;
+	crg_udc_recovery_end(crg_udc);
+	spin_unlock_irq(&crg_udc->udc_lock);
+
+	usb_gadget_set_state(&crg_udc->gadget, USB_STATE_NOTATTACHED);
+	return ret;
+}
+
+/* Called with udc_lock held and IRQ and queue entry blocked. */
+static int crg_udc_deassert_reset(struct crg_gadget_dev *crg_udc,
+				  unsigned long *flags)
+{
+	int ret;
+
+	spin_unlock_irqrestore(&crg_udc->udc_lock, *flags);
+	ret = reset_control_deassert(crg_udc->rst);
+	spin_lock_irqsave(&crg_udc->udc_lock, *flags);
+	if (!ret)
+		crg_udc->hw_reset_asserted = false;
+	return ret;
+}
+
+static int crg_udc_rebuild_after_stop(struct crg_gadget_dev *crg_udc)
+{
+	void __iomem *mode = crg_udc->mmio_virt_base + CRG_UDC_MODE_REG;
+	int ret;
+
+	writel(readl(mode) | CRG_UDC_ROLE_DEVICE, mode);
+	crg_udc_clear_portpm(crg_udc);
+	ret = crg_udc_reset_data_struct(crg_udc);
+	if (!ret)
+		ret = crg_udc_init_ep0(crg_udc);
+	if (!ret) {
+		crg_udc_set_vbus_detect(crg_udc, true);
+		crg_udc->stopped_needs_reset = false;
+		crg_udc->resetting = false;
+	}
+	return ret;
+}
+
+/*
+ * The gadget core serializes start and pullup with stop. Keep the IRQ and
+ * queue paths gated by gadget_stopping while the external reset may sleep.
+ */
+int crg_udc_restart_gadget(struct crg_gadget_dev *crg_udc,
+			   unsigned long *flags)
+{
+	int i, ret;
+
+	if (crg_udc->suspended)
+		return -EBUSY;
+
+	crg_udc_recovery_begin(crg_udc);
+	/*
+	 * A previous teardown or failed reconstruction may have left DMA
+	 * armed. Retry quiescing it before releasing any retained mappings.
+	 */
+	spin_unlock_irqrestore(&crg_udc->udc_lock, *flags);
+	ret = crg_udc_quiesce_hw(crg_udc);
+	spin_lock_irqsave(&crg_udc->udc_lock, *flags);
+	crg_udc->dma_quiesce_failed = !!ret;
+	if (ret)
+		goto out;
+
+	crg_udc_release_quarantine(crg_udc);
+	if (crg_udc->shutting_down) {
+		ret = -ESHUTDOWN;
+		goto out;
+	}
+	if (crg_udc->hw_reset_asserted) {
+		ret = crg_udc_deassert_reset(crg_udc, flags);
+		if (ret)
+			goto out;
+	}
+	if (crg_udc->shutting_down) {
+		ret = -ESHUTDOWN;
+		goto out;
+	}
+	ret = crg_udc_rebuild_after_stop(crg_udc);
+	if (ret)
+		goto out;
+
+	for (i = 2; i < CRG_NUM_EP_CX; i++)
+		crg_udc_ep_clear_enabled(&crg_udc->udc_ep[i]);
+	crg_udc->gadget_stopping = false;
+out:
+	crg_udc->controller_faulted = !!ret;
+	crg_udc_recovery_end(crg_udc);
+	return ret;
+}
+
+/*
+ * Run the optional reset in process context after the atomic SWRST path
+ * has returned the requests and quarantined any DMA-visible mappings.
+ */
+static int crg_udc_recover_external(struct crg_gadget_dev *crg_udc,
+				     unsigned long *flags)
+{
+	int ret;
+
+	crg_udc->external_reset_pending = false;
+	crg_udc_recovery_begin(crg_udc);
+	spin_unlock_irqrestore(&crg_udc->udc_lock, *flags);
+	if (crg_udc->irq >= 0)
+		synchronize_irq(crg_udc->irq);
+	ret = reset_control_assert(crg_udc->rst);
+	spin_lock_irqsave(&crg_udc->udc_lock, *flags);
+	if (ret)
+		goto out;
+
+	crg_udc->hw_reset_asserted = true;
+	crg_udc->hw_dma_armed = false;
+	crg_udc->dma_quiesce_failed = false;
+	crg_udc_release_quarantine(crg_udc);
+
+	if (crg_udc->shutting_down || crg_udc->gadget_stopping) {
+		ret = -ESHUTDOWN;
+		goto out;
+	}
+	ret = crg_udc_deassert_reset(crg_udc, flags);
+	if (ret)
+		goto out;
+	if (crg_udc->shutting_down || crg_udc->gadget_stopping) {
+		ret = -ESHUTDOWN;
+		goto out;
+	}
+	ret = crg_udc_rebuild_after_stop(crg_udc);
+out:
+	if (ret)
+		crg_udc->bus_reset_pending = false;
+	crg_udc->controller_faulted = !!ret;
+	crg_udc_recovery_end(crg_udc);
+	return ret;
+}
+
+static void crg_udc_restart_link(struct crg_gadget_dev *crg_udc,
+				 bool notify_reset)
+{
+	if (!crg_udc->async_callbacks || !crg_udc->gadget_driver ||
+	    crg_udc->reset_callback_active)
+		return;
+
+	if (notify_reset) {
+		crg_udc->bus_reset_pending = true;
+		crg_udc->restart_after_reset = true;
+		crg_udc_kick_reset_work(crg_udc);
+	} else if (!crg_udc->suspended && crg_udc->pullup_on) {
+		crg_udc_set_pullup(crg_udc, true);
+	}
+}
+
+static void crg_udc_recovery_work(struct work_struct *work)
+{
+	struct crg_gadget_dev *crg_udc =
+		container_of(work, struct crg_gadget_dev, recovery_work);
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	if (crg_udc->controller_recovering || crg_udc->gadget_callbacks_active ||
+	    crg_udc->reset_callback_active ||
+	    crg_udc->suspended || crg_udc->shutting_down || crg_udc->gadget_stopping)
+		goto unlock;
+
+	if (crg_udc->endpoint_recovery_pending) {
+		crg_udc_recover_endpoints(crg_udc, &flags);
+		goto unlock;
+	}
+
+	if (!crg_udc->external_reset_pending)
+		goto unlock;
+
+	ret = crg_udc_recover_external(crg_udc, &flags);
+	if (ret) {
+		if (ret != -ESHUTDOWN)
+			dev_err(crg_udc->dev, "external reset recovery failed: %d\n", ret);
+		goto unlock;
+	}
+
+	crg_udc_restart_link(crg_udc, crg_udc->bus_reset_pending);
+unlock:
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+}
+
+/*
+ * Called with udc_lock held. Keep the entire controller reconstruction
+ * serialized, not just the SWRST register poll. In particular, request
+ * callbacks drop udc_lock, allowing stop/suspend and IRQs to re-enter.
+ */
+int crg_udc_recover(struct crg_gadget_dev *crg_udc, unsigned long *flags)
+{
+	int ret;
+
+	if (crg_udc->controller_recovering || crg_udc->shutting_down ||
+	    crg_udc->gadget_stopping || crg_udc->hw_reset_asserted)
+		return -EBUSY;
+
+	crg_udc_recovery_begin(crg_udc);
+	ret = crg_udc_reset(crg_udc, flags);
+	if (ret) {
+		crg_udc->controller_faulted = true;
+		crg_udc->dma_quiesce_failed = crg_udc->hw_dma_armed;
+		crg_udc_reset_queues(crg_udc, crg_udc->preserve_ep_enabled_on_reset);
+	}
+	if (!ret && !crg_udc->shutting_down && !crg_udc->gadget_stopping)
+		ret = crg_udc_reset_data_struct(crg_udc);
+	if (!ret && !crg_udc->shutting_down && !crg_udc->gadget_stopping)
+		ret = crg_udc_init_ep0(crg_udc);
+	if (!ret && (crg_udc->shutting_down || crg_udc->gadget_stopping))
+		ret = -ESHUTDOWN;
+
+	crg_udc->controller_faulted = !!ret;
+	crg_udc->resetting = !!ret;
+	if (!ret)
+		crg_udc->stopped_needs_reset = false;
+	crg_udc_recovery_end(crg_udc);
+	return ret;
+}
+
+/* Called with udc_lock held for recovery of a live USB session. */
+int crg_udc_recover_link(struct crg_gadget_dev *crg_udc, unsigned long *flags,
+			 bool notify_reset)
+{
+	int ret;
+
+	if (crg_udc->controller_recovering || crg_udc->shutting_down ||
+	    crg_udc->gadget_stopping || crg_udc->suspended ||
+	    crg_udc->hw_reset_asserted)
+		return -EBUSY;
+
+	notify_reset = notify_reset && crg_udc->async_callbacks &&
+		       crg_udc->gadget_driver && !crg_udc->reset_callback_active;
+	crg_udc->connected = false;
+	crg_udc->gadget.speed = USB_SPEED_UNKNOWN;
+	crg_udc->preserve_ep_enabled_on_reset = notify_reset;
+	ret = crg_udc_recover(crg_udc, flags);
+	crg_udc->preserve_ep_enabled_on_reset = false;
+
+	if (crg_udc->shutting_down || crg_udc->gadget_stopping)
+		return ret;
+
+	if (ret) {
+		dev_err(crg_udc->dev, "link recovery failed: %d\n", ret);
+		if (ret == -ETIMEDOUT && crg_udc->dma_quiesce_failed &&
+		    crg_udc->rst) {
+			crg_udc->external_reset_pending = true;
+			crg_udc->bus_reset_pending = notify_reset;
+			crg_udc_kick_reset_work(crg_udc);
+		}
+		return ret;
+	}
+
+	crg_udc_restart_link(crg_udc, notify_reset);
+	return 0;
+}
+
+/* A full endpoint recovery also invalidates the gadget configuration. */
+int crg_udc_recover_endpoints(struct crg_gadget_dev *crg_udc,
+			      unsigned long *flags)
+{
+	bool notify_reset = crg_udc->device_state == USB_STATE_CONFIGURED ||
+			    crg_udc->bus_reset_pending ||
+			    crg_udc->gadget_callbacks_active;
+
+	return crg_udc_recover_link(crg_udc, flags, notify_reset);
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
+static DEFINE_SIMPLE_DEV_PM_OPS(crg_udc_pm_ops, crg_udc_suspend,
+				crg_udc_resume);
+
+static struct platform_driver crg_udc_driver = {
+	.probe = crg_udc_probe,
+	.remove = crg_udc_remove,
+	.shutdown = crg_udc_shutdown,
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = of_crg_udc_match,
+		.pm = pm_sleep_ptr(&crg_udc_pm_ops),
+	},
+};
+module_platform_driver(crg_udc_driver);
+
+MODULE_AUTHOR("Axiado Corporation");
+MODULE_DESCRIPTION("Axiado AX3000/AX3005 USB Device Controller");
+MODULE_LICENSE("GPL");

-- 
2.34.1

