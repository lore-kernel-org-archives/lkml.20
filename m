Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793777883;
	b=RnbSxvJ9kMwL0duFQfOliJmRHKPPf54k5XVGagrfv1jvOwhCFQLESG2lyhU7S5W72x+J
	 rAM6qD11ihLW3g5RwzSwRRlFbpFc3wBF9Y5KuX5P2QhUMRF2usANV2ENZPD+/7bSyAzeJ
	 MHGat10jY7AqEnpxKX6yWAAkfX3CEZNwu2+S9FnWEKDVcH/BLKoCWNt8qbZjCQh6gcO4q
	 Og9lbt88Z1WYE5taYO5Vp/ogmVrlu9C9uDpfPZBbTCHZlTykatxFGUa2Fe4kN61L0GIVx
	 VGV5R/5PNfFOdHJIFO8YQP5fCR4nngIg4OpRhd0jwH5F2KJ5B3eKMOv1BAEp5RNyuBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777883;
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
	b=NY8GcmvNfVmuu4IVJD5knJ+2UW3uCHCoVsFEfFAoMDGCW8ZPeAANlj5SFcDL5bzrqQtW
	 e/7SIc2/wnM8tEMXF/8KsgOUU5KvKESUzGtizXea0A/jLJyk7xLxY+OtBnjbkAl3GwjNW
	 JeIYnl41YR/DHY7A99BRYCipEf9Uuf+e/lfzOShCKaJRc4UtPWWiu4qsIEliEte8IlYbx
	 G3IibwbUjo7tfOA+1lYX6SwaG5dFPIOSqX8RwkAT22vNu95TBjCii3g/YFQugL0QJNKdi
	 /Y1DrZLakvl1mHu++MsTEajKBKJMFHwAQdKgHXLmTQKxLhwQx0b36pJE6EeNBFHt8hA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cn.bosch.com;
	spf=pass smtp.mailfrom=cn.bosch.com;
	dkim=pass header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=oDNRRjO8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.60
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011060.outbound.protection.outlook.com [52.101.70.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65172606A330;
	Wed,  4 Nov 2026 07:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65172606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=oDNRRjO8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zc4M3dfAgy5Idjq3RsGoc9ix6q3RdkeaoWMrZBYuGWlwrH9/9GmRyGT8fzylDj3g9DlG+hwKa4MgjuZByDuHWR6A2agJtz4A9ktTIzD3TQc13ls6Mbs2o898Mea6lcimpZKfA9EGOazuTo8X8nOvqBxXFB4L2G1S+Ro+Guod8+hd3txGAhbK2oITdGr0lNPgYi2u0teWrDHinsyGRd8YOps/A/LauAJtZKHcyDQg0BuIZfAH/84gITgAU2NQg2rsX4yBtSoF6ZkcImyPDxioWngikwljQkzl6AwiJ9MQ0YGAgsjnp30SUR5gKG628qthqAbCuhMB3AwJ+HtNDG78dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RsNUOT/l/vZFz8nmdnrEFwA5r7M6uFFAuP56TPAVC00=;
 b=qUxLGOHM2TfZjE55vie5sHjfU8RBv3pHdS1BGhoIg5bBS95onWugn9JZMYfIWvV/ueGfGUXKAad6wQndp88x/drNASd5jhSyMu3bpmDbfhzQKpB4Rxop9a7r8oB3wXCrYcwO+v2l163LsbGe7d5vCe2QW/bo4UVzyHZIjAFkKATDCuLqiz81SkJtDFtDS3eqaypdnMipvK9WFUimpMuAw5wJjijc29uPzbOD+b2h/7bmjq4S6PMYVKbrD9HS0IwfRX2YQIwOpnY9t3HomFPzRG5V5QQ0DY3CZCgeUxyAtxjHDbSg3DUpyviMvzglIvgTxZHaoQ+F8yY4KDnjpdl/1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=cn.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=cn.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cn.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RsNUOT/l/vZFz8nmdnrEFwA5r7M6uFFAuP56TPAVC00=;
 b=oDNRRjO8aWzhdxHwxdeOdKtW4ihtYXdKDytu9TjBvnN+bca6xv0ABPF+0YOFajBdh7i6trEk3AwBcV6Ksap+wirf0J4E2y+6AGglxwW9zWqGgRbh7EReeQRt0CAzbexFBPob1jzC/4PsVOCLoBKa66PBObThzlJLhzSNfVqdiUIbF2FixFXkk7XybsT67bgDzM05/IAIp7Z5+fLgvOjn7oYQxUWTQOMf/OuI1KKzva401T7kzIffJj+Zmt3/x/3jtp/gk8duoU7D+jVFXXaSZGReVTRMIjHuMd3HQuNcKIgS8Zhtv6jrzJHylBJDce/O95ObMEdRMIo8Yh7QOd9q3Q==
Received: from DU7P251CA0006.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::7) by
 GV1PR10MB8902.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1ce::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.9; Wed, 4 Nov 2026 07:37:58 +0000
Received: from DB1PEPF000509F6.eurprd02.prod.outlook.com
 (2603:10a6:10:551:cafe::8c) by DU7P251CA0006.outlook.office365.com
 (2603:10a6:10:551::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 07:37:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.205) smtp.mailfrom=cn.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cn.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of cn.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 DB1PEPF000509F6.mail.protection.outlook.com (10.167.242.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 07:37:57 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 08:37:45 +0100
Received: from WX8-V-0008J.wx.apac.bosch.com (10.190.167.205) by
 smtp.app.bosch.com (10.124.11.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 08:37:41 +0100
From: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Date: Wed, 4 Nov 2026 15:35:47 +0800
Subject: [PATCH 07/10] ARM: dts: imx6ulz: Add BSH SMM-M2B board support
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
Message-ID: <20261104-add-bsh-smm-m2-v1-7-369f0a77e021@cn.bosch.com>
References: <20261104-add-bsh-smm-m2-v1-0-369f0a77e021@cn.bosch.com>
In-Reply-To: <20261104-add-bsh-smm-m2-v1-0-369f0a77e021@cn.bosch.com>
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
 b=owGbwMvMwCV2Lz9jvnXEsVWMp9WSGLJePVixLD3DL29v0q95VakmN+69CugSenmag0X3qNPrq
 VqXl/027ChlYRDjYpAVU2RRTfA+K3k1wHTazGq4OaxMIEMYuDgFYCK8OYwMN/pf5J5MmnbxmRKn
 HEOdY27jo3WfYjU7fi5hig/wSEx/zPA/bt5T3R8FV/sOTmrbtGlTuyPDpLpN5xsP7tbXuzZLi+0
 sJwA=
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=openpgp;
 fpr=25604BCD19D5503596997B16DE6F689F3B58C6AA
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F6:EE_|GV1PR10MB8902:EE_
X-MS-Office365-Filtering-Correlation-Id: fe3afc81-0d40-4dca-ed24-08df3a468c03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700016|23010399003|1800799024|10067099003|18002099003|22082099003|56012099006|261102123227099003|11063799006|261009223327099003|261021121427099003|261009221727099003|261009221227099003|261009223027099003|261009220027099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	OQmTSkvzn3/DzbS4P406Ua1uHT0n+QVI0GauJqyNo5ZZ1sZHbGtV5ToddoxGj8ht87cOHgmhGlGOqxGUvN9u90Bw7ubpvr27VS0t3q7/4I8hpLfqbsHauSIdbCBuweYWFBRtrigFFf/d6u+vn1Sbn4ZDOam3zBdaM2JupzbSoY6qvEuN6k6i2BSAj0RM8wtbkorrRwLESm7wCZW/XL1A80DUK1tOZGvb4CHZsTKm8NuytRInb8xoMGy5rgqO+pkfENIVTkm3QgtBL/jywkobUoV2Eho5pnPpCqmysXNywi0yYZSFbGmHV2KO6fpQxpxQs1v0lPRwu+lVKXh/vlVsEzmB+6jO3WGikEK7M0jQNwmSl4DhYFwmfKS4/twbW9wtqxjtI54KbCuiOpZ1bBECPex0n6GJSr5j1vTj9egbGWbpjHyv3gtfweZkQz13ApJPhYE0XisCUA7tg7N+R/jF6scV9stQS69AMxUa3fKJHwIemmH8SFhyw5eGU3k4pI2aQKbL+lkXTyeus/hbUNVzAShoGTLHZQ/mAjLjucfMMp+FG1GFO/nmWsdeUgJItVCZbrDvku5pq3MYgE/miQfqT7DjU4up1Lud8PcPZh5mnwi3o21Bs3ebuPrpr8q/SfUSR6eItaqE9/PHxwZHy2veA5GoC50UGz+kcFqtTyAdrAVSL9gsvN7hDErU2hQ7KbotFdpUqwAXo7MFID6HJu5qZQ==
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(10067099003)(18002099003)(22082099003)(56012099006)(261102123227099003)(11063799006)(261009223327099003)(261021121427099003)(261009221727099003)(261009221227099003)(261009223027099003)(261009220027099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kOCJiQPoW+o8eE9k2uPmIVg0Ldzt+AMrXHnXuQGPDnDYfQcTLn2zcDCE29yi+ti6755yVN7ZWaMurRO4yiGoksIBQLycM8ISBRjOwqsLgCFsTmWwwkxoTnFrLNY3zRXNJV8/K/DiDIkroB0F7yJIK8e/TPPyXpxJcEnfwMTCP5JQ9Cvzp0FrMfM/x0OK4miZNexpnxR7VyhW6PktUyBRVre23u+U+JB43/7Er78K6HQzl/TOkdQtXOlQQLkUqzwlgJ6AkMiV4kFxMxYwb7iwOzpjR9cNTb/O4Tj8nvo1fMpK03l0o04vK40M4t1njiU/QuyE6C7H7OPDArVoA4lhFR5gd8USumWR8luwRWJnHyqkRfxbfoRNWTsXx1f+6P4fbskEPKuKbw3XKTANnaQm+698oiMsEjsedjxP08Zcx+gWg4CAmeYKNjVOsGqmD/2S
X-OriginatorOrg: cn.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 07:37:57.9990
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe3afc81-0d40-4dca-ed24-08df3a468c03
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F6.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8902

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

