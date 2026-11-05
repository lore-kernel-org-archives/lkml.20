Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793846527;
	b=gKN+VErydhJxInAh58vnnqxK1UAGNEJQIBv7+QChdXst49z1CiIiZpgUYBKY3HhZw5JV
	 pI5SPxDYFJitWai0GNhVrZgAGs/ZTg8/LfxZmM0fMqqaDc/hDU0G5LVBp6cTJrMm+jGaA
	 UWabFd2lEFVYCStoMpSy677ZQNAtRAxU5lA7+/amveJNaWQ7ahVXelrLJnpD7z6p+LifK
	 k9je7OtYI28ud23Z+08KDlMTJBno3FicE61BTxcvVGGSTthIni1PYfYUKcFYvUKhfuLLv
	 PeTndPHSkaYeeNkHtrw4m9aQCarr2qMpSlRIW+VGsk3Cf0LwV/vdWhJZaQfMtVh9oow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793846527;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Originating-IP:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=RsNUOT/l/vZFz8nmdnrEFwA5r7M6uFFAuP56TPAVC00=;
	b=YCXiEvqW8uTiMrBANspPgNwKBGRAO2strTbKpc2HRn8xH8zeswqVmgxsfokc/X6dAFJT
	 3NK28DDC3shT2bsulkaY2C9mHSGGAiMCEXWUq4cK13ZPr9gv7/dmtjjfXJWh+6oKckD8j
	 qvWxyum69mJGOre099cJR8ecNv4O8V6jyO2Kyu4H+MOs2mLgSZcQ0vbCazxOdhiP/OT2M
	 hNXdhXgxj9HrUaYbUYArVx6UBzqPJdk09/O3PIGinQQfH0WcvSDKG/1nSV5Gdp5klnOuI
	 0LpdQFWL8xBngIQioEAFBygkj0tOg7N2J5wJFxg6cMV93qFiascpLai8qgGOCX28FGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cn.bosch.com;
	spf=pass smtp.mailfrom=cn.bosch.com;
	dkim=pass header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=EjYWfnMY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.43
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013043.outbound.protection.outlook.com [40.107.162.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0F0606A337;
	Thu,  5 Nov 2026 02:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E0F0606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=EjYWfnMY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y4BC4nMMQEOqrxCtvKHf/mzILfs21/aJx0yGP1y3OQMqYYIxTeBP8Ul/jXl1QmI+jbyTIoMpBHqqqEb6IZ0guM1XQSpOVJmCES6We4KvL/r9Uc5q/Pv/Bi6DtzoLYk8+koy1+nMDFyA85Wi+4Zfxev1aOekeBfOHj6AmQMYt4pleguAGfLhgJt6SnyyUwzJF2CxdQXBEc+Tdughe18xB4kgJtFNAQqvvj1OfQXEKNFCm3uyyh1S4RW9h/6+4BnzKV2PyM0HaAap8shvm47UmBjYMGkrptQ5e4ct33/FYs8lBr1yL1RsZGME5I+X+GR4HOwZYffy9lk0IxO+a8fkxcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RsNUOT/l/vZFz8nmdnrEFwA5r7M6uFFAuP56TPAVC00=;
 b=YkQ8aqkf/7NVAih50gfs7IiwnnJcqetH13nkz/U6c1hRd3QegwBVQayMQ5Fl4MS714wcurXTbZQv0nCyN/cqWxryut6jBBa2SqCOIlDUheRsNDwgLRVfE/Ol4FfLdhYcycV2IL+Y0cSPhLAT+JRKoVXtLtonr4nGWq69y+tcpUE8FTsLQE/kqy1qITPUwsPxCqIqQXRZvXA9H5t0ygDbGZ/V87RKwfr9zEGYYlh+b8p2x77q8Q7PsvS3Qhfk8fxd0uFw91g4+Qp5iOADGoIU6Pf0lJ8UjsL8utWmwQY4E+AiJ3ZY7SjGt3zCVDRDwdlA70Wn24JhFiSaln/K86tE0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=kernel.org smtp.mailfrom=cn.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=cn.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cn.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RsNUOT/l/vZFz8nmdnrEFwA5r7M6uFFAuP56TPAVC00=;
 b=EjYWfnMY4kv07TMNNfLoHsZK8lTYxZSqNwiB/GyXTnKlW/SS9AWF3CY2wa+t0FzykG6/XTaQzC5o4VuJ5xF03DkR9wzy/dFGwLEE5XdH4cC7t7mQJ8K/WVDd7B2KPJiRfvvusKP86JiIQDNYjZJqf5Wl+B1KwVSdLTHjbHx/bF4GNhMzxczcjnD9jC5DBRu+WgY1Ec5QhZMFa1TmE7Wt633mPu7fbZZFoXMaOiXD/sW/7L1E1eB7N4Kt2YxMAMw4ssMMppBhkvt7m2v8YZDGUxcBWIElcj9uXs1D/xJJeBRrZ5SKDXqCPPvDKrS0o9o9UJRRlGveRBWAoMvcKSkvmQ==
Received: from GV3PEPF0001DBFD.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::314) by BESPR10MB992322.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:b10:146::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 02:42:03 +0000
Received: from WA1PEPF00009B3A.eurprd05.prod.outlook.com (2603:10a6:1d8::118)
 by GV3PEPF0001DBFD.outlook.office365.com (2603:10a6:158:400::314) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.21.592.10 via Frontend Transport; Thu, 5 Nov 2026 02:42:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.205) smtp.mailfrom=cn.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cn.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of cn.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 WA1PEPF00009B3A.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Thu, 5 Nov 2026 02:42:02 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 5 Nov
 2026 03:41:57 +0100
Received: from WX8-V-0008J.wx.apac.bosch.com (10.190.167.205) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 03:41:53 +0100
From: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Date: Thu, 5 Nov 2026 10:41:20 +0800
Subject: [PATCH v2 6/8] ARM: dts: imx6ulz: Add BSH SMM-M2B board support
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
Message-ID: <20261105-add-bsh-smm-m2-v2-6-fb5ffc7da486@cn.bosch.com>
References: <20261105-add-bsh-smm-m2-v2-0-fb5ffc7da486@cn.bosch.com>
In-Reply-To: <20261105-add-bsh-smm-m2-v2-0-fb5ffc7da486@cn.bosch.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, Haoning Cheng
	<Haoning.CHENG@cn.bosch.com>, Qiu Guochang <guochang.qiu@cn.bosch.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1625;
 i=Haoning.CHENG@cn.bosch.com; h=from:subject:message-id;
 bh=Wu4+NJU1Wqab+k0K/gKL2a12YrgZQpuITcxOXPjHLfs=;
 b=owGbwMvMwCV2Lz9jvnXEsVWMp9WSGLJev7nRWya048jZb2937jgfrvRlS+iNAs0VzPELSh6li
 /5Ke1eU3lHKwiDGxSArpsiimuB9VvJqgOm0mdVwc1iZQIYwcHEKwERSEhj+F6uHbX25x3cmo4n0
 2ahlrNYLXvzNnbJxfeLXIqPdEpKlyxgZ+tncw3h/OrGrlKpOfqZSfml2jHCm+X9zLa/d7DXfDVf
 xAwA=
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=openpgp;
 fpr=25604BCD19D5503596997B16DE6F689F3B58C6AA
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF00009B3A:EE_|BESPR10MB992322:EE_
X-MS-Office365-Filtering-Correlation-Id: aa40a00d-631d-4a42-dc7a-08df3ae65f9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|36860700016|82310400026|11063799006|56012099006|261021123027099003|261009223327099003|261009220027099003|261009221227099003|261009221727099003|261009223027099003|261021121427099003|261102123227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	bH3bWl1ch4GUGX7CTc2AsEeFssoe7Tq/nMW6dabid0n42Nbznf07AQTSOTraHtPXJq8k1SkZxhPvQbXLgap7SKsbqOi7kX8gazLfimDQaT0u/Wr8lxjeiGDVy4L3okcnqwBCieMAPb/wgt2qHCcssepCPVjidw4Yswqim6wkW+uPDOArap3tNRCY9VK+IFtuLuEuf5i01EZpUaw0aR4S1a2gz6x34ED3kU9qHO2kPzZMai+R4IqjkQFqj+7T3KD3enRHd6Pu64Xq6o0yIEK+f+f0hwvc6JaZwiOQ4dbD4+zSaBzmN9qGnI1zfs+dsXYmW1NmeOIk4tiTRkxHOt/RIhoXfDwWIIxFkGsw0FidvnDJqYNYLkhq7/G3PxT8SHX/2OfjgNBc0zlhCHY31FEWZf6ZegYBqELUBOguHuj+5Ubx/WapJVlty96DurFRrkX23TKGRM79/doCSrkU2PAYuNYLfhXVmGiiBaAgkjwoUeM21VYqH/Nf5IfQwYwU9+xN3XMPXGtl9a5/0uOu1cS+PIMLqYuYO4v+GQdp9Nz3NyV5ZigK6zRgS7D0CsNY6DyMAbAHbcd4wbeT+uNHWRxqpDP5iB7COiHZEyN0BfNzWnmAGeZU0JkmuYO+de+LlIPmlEbvENfgJVVLNz7RMdjI8OZqPzG4avNnhM9RKTUuQTlObZUGm5by2psRN0GuSJkT2suwMN4eDyvBFs9z4l6rHQ==
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(36860700016)(82310400026)(11063799006)(56012099006)(261021123027099003)(261009223327099003)(261009220027099003)(261009221227099003)(261009221727099003)(261009223027099003)(261021121427099003)(261102123227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	t2SeaQc4CxgjpYdBTsRMoDcT8hGHwOI5bV1IL1R6luFDF9hmnhZw2PeItR7VMNDCTMnuW1wy49JodF3O4mC2zhFTKYo5wQvOw/2VaTLyL5/mxbyHkIotOu7HUepPu/qHgHIsTipvZwaTlVSUmtqtDp6wl8HvYU5ioQCJ2281eEEtnAzTTG/leOnnF+vqSOG8EXlFBf62wOKPOx1VmKhJECBBsUFGCLmM2r1TQN4Vzt2C52ySNlUbIlmf9ai6HeANaiGYzpJh7twoRtOqkB//dSPk6FgSHpupUSGBC56RwZLxqNpwgmnxzI7Q/oJqkmITtev0aL2Q7cnCCcxPfwBjvdITsI5GHiRepFDGZltNX8GDC5Moz+ZRZdjySAzKtlY0TmKSxAXF5Bi8qdHhpZz5FaStt7N8LZSP2k/0MriaS6xNMUdsAExTqZJVOckq1HiC
X-OriginatorOrg: cn.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 02:42:02.9947
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa40a00d-631d-4a42-dc7a-08df3ae65f9b
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	WA1PEPF00009B3A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR10MB992322

From: Qiu Guochang <guochang.qiu@cn.bosch.com>

Add basic device tree support for the BSH SMM-M2B SystemMaster,
a hardware variant of the BSH SMM-M2.

Reuse the common SMM-M2 hardware definitions and provide the
board-specific model and compatible strings.

Signed-off-by: Qiu Guochang <guochang.qiu@cn.bosch.com>
Signed-off-by: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                |  3 ++-
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2b.dts | 13 +++++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index b5fad2ba764c..de9a317132ed 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -420,7 +420,8 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ull-var-som-concerto.dtb \
 	imx6ull-var-som-concerto-full.dtb \
 	imx6ulz-14x14-evk.dtb \
-	imx6ulz-bsh-smm-m2.dtb
+	imx6ulz-bsh-smm-m2.dtb \
+	imx6ulz-bsh-smm-m2b.dtb
 
 imx7d-colibri-emmc-aster-panel-cap-touch-7inch-parallel-dtbs := \
 	imx7d-colibri-emmc-aster.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2b.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2b.dts
new file mode 100644
index 000000000000..9dc92da6ace9
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2b.dts
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2021 BSH Hausgeraete GmbH
+ */
+
+/dts-v1/;
+
+#include "imx6ulz-bsh-smm-m2-common.dtsi"
+
+/ {
+	model = "BSH SMM M2B";
+	compatible = "bsh,imx6ulz-bsh-smm-m2b", "fsl,imx6ull", "fsl,imx6ulz";
+};

-- 
2.43.0

