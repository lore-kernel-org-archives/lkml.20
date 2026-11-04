Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.57
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793777883;
	b=f5RYx6LpXaTszRPDaWGCtSkfhOGDCClVT81KEHfbBWduGeJBa0qe4BKWkiVpPfT5BP96
	 yGWQdPOP175CENnW6pGGNMM7ecI+1/Kth598HL06ZUo2JT3fLHE2N99ZIWwArsM38p+wv
	 NxaJ+iBnTeow9Cm3nURxaVAIXP32lvY9Y9qVG26MJLlQuVMYap0UtHmAIQv/A+9pLghUg
	 +jrW4vkfqHLBEFilzt/Okh+QVr2FsTPRh75p7/3B8cIRUTH6tSvmu5ykzLlwRoAfeR9PN
	 FwVGTedW2uopKCBs7LK7NqFnqpLEzLv9llQAF9YeOKt0RdBXSXOw0QcN6Ofx1Sq+Rmg==
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
	bh=eRxFb/0+KwmHxPaizH+GL+QXK5+3R7hMaP0iHmfS0AI=;
	b=5IFjm3J9Qy1k7/BoYY6zgy8j4gbglt0jr51C2aogt583qyztKSOohDj7xw5zLM7ictSw
	 LsCYtbZUEQcHf6i4TZpLUIrYd+4CNiRY9HXGbLl/KsDhyOpo/xRQ6cNwNqvmECPi/+u45
	 Lk+/HqQCBGvaALYGwEW864okx0S+PyrTzgT2jA7ikEzb/1zVH14WBMBVfQC2FFKDnE6f7
	 TMl3W09HKlvtU9gqbVBjAmd5QpPfv2D2un7yIURqWaBfcxIxf3LCBg7vV7eTCFRBipQei
	 cq2sYYdbP/jlx28EWlfLuvwJMK77G39YbW548mcHcy28E3lmYF6dytwNN2X8QotFX8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cn.bosch.com;
	spf=pass smtp.mailfrom=cn.bosch.com;
	dkim=pass header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=ZdZDkC5I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.57
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010057.outbound.protection.outlook.com [52.101.69.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60ED7606A32D;
	Wed,  4 Nov 2026 07:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60ED7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=ZdZDkC5I
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HNTGPbBD57mXY/MAANMULSKX/C8SUL3pha+9w/6Zr7kAmf2dKu2MuqGwmbF/CbKBTlVgzGiQBWRvXv/n1bncFUr3vFUgc2+T627hubHXPSu1MpsVpCc69tH99IexVu+IDJw/PlhQW33ZSnKMH5z9tAHmZ9qRMYZylSxTLN7DRfUuzNky/25y1vxoXOGN5mSKRFNxdeYhOyUSI3tmVbPXyTESTg71fV/4/2MchI8Hbh9aUK4lMyrZPXsUXMiHxT0G/h+Z2cooSrV2Cyu6HF+WGJP65TXumduQpfd/60hsgmY22jZH91MmSKTuUTrlheimb1rfErj/YUm+nzu+IQLeow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRxFb/0+KwmHxPaizH+GL+QXK5+3R7hMaP0iHmfS0AI=;
 b=mUYNDzxuBYIIi3cEV0A9Gu24kVZDGNubfgOQcdEcgeOYhZhxvQXfc0gM9Y3/JWCs0W6qDPq6iNjdiiAkqtm7lWBHjJiWbw0h6PalNfUrpHyH0D2YKruanoXAwZYCMIPxWDHtLwow3H6nf+60iyZh83u/B9+gI5AgRl5N9nh0HjNnPLH+XINaZXVZiws8cCcl4Agbew6mAbJPODc2f+k5np6kNuE9AtDsimoxATZL09K1xUGqZ/EeMmfQOqv4ta3PnlDU7EaU55c8tiMFI4sitG6oVf65FClsGbCtv5sCHVld5g0Rr9i7BHeZtmH5vpfcG5HdYO24hnedsiukGoWztg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=cn.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=cn.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cn.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eRxFb/0+KwmHxPaizH+GL+QXK5+3R7hMaP0iHmfS0AI=;
 b=ZdZDkC5IEmqbUUjvKDsgIZ+8z+jQ92D2bieayvDHlBluU/BGo1uHigGoDV6E7um0R9cJ6mv2lKFlQH00CwsJh2BupBRakW1yuRJ3b//EC/Tx6CP+QhamBX6VdkUVe7aZg/yUZ7BVXMhpnBB1oxpFHi05jZ9vtA7I6i9YqBUky1Ul8GhJ2+2RwfxtYVfofV5JeG5IZdUJtuQscUkpYAwV3ndmCJRYQqAZc+GrKq3i2oeGc7+biL9WZhqnPnSHTSqerTOGu+pARAzWqKsfXYsEG4PFDPILbzTJy/wSN6c5oR2t59ItG2iZg+4aiQ1qG7jBPSSjXO4Jg0JMvCedfol+IQ==
Received: from DU6P191CA0045.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::26)
 by DU0PR10MB7237.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:44b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 07:37:54 +0000
Received: from DB1PEPF000509F8.eurprd02.prod.outlook.com
 (2603:10a6:10:53f:cafe::51) by DU6P191CA0045.outlook.office365.com
 (2603:10a6:10:53f::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 07:37:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.205) smtp.mailfrom=cn.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cn.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of cn.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 DB1PEPF000509F8.mail.protection.outlook.com (10.167.242.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 07:37:54 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 08:37:41 +0100
Received: from WX8-V-0008J.wx.apac.bosch.com (10.190.167.205) by
 smtp.app.bosch.com (10.124.11.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 08:37:37 +0100
From: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Date: Wed, 4 Nov 2026 15:35:46 +0800
Subject: [PATCH 06/10] ARM: dts: imx6ulz: Factor out BSH SMM-M2 common
 device tree
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
Message-ID: <20261104-add-bsh-smm-m2-v1-6-369f0a77e021@cn.bosch.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6791;
 i=Haoning.CHENG@cn.bosch.com; h=from:subject:message-id;
 bh=JhqFbqRx4HCfx3mIKlBUwywr+0lwAAX2JROj/+zac6o=;
 b=owGbwMvMwCV2Lz9jvnXEsVWMp9WSGLJePVjxO8s9M77K5UCb4fvGDBehX09VXjtXcDCVV5/pa
 cj6+ORQRykLgxgXg6yYIotqgvdZyasBptNmVsPNYWUCGcLAxSkAE/FxY/hf7Hztt7r84jItCd2z
 l988mc73m/czt6XCgr61E4R9Ot5IMPxmu7t2VfefC06HLrS/8/kZVMK/Sa/md/ZPCcdbYUJvWNY
 zAAA=
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=openpgp;
 fpr=25604BCD19D5503596997B16DE6F689F3B58C6AA
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F8:EE_|DU0PR10MB7237:EE_
X-MS-Office365-Filtering-Correlation-Id: a6f251ef-0cce-4abf-073f-08df3a468a03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|36860700016|82310400026|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|261026121527099003|261022075727099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	LsWI0jimNz03xrAw6NrwRLAwqLGO2ZfmMTQ/YuAdI/1oBdtM70/maYznbPPNoYCLTmiRC6+I38ON+AXjdXBfTrIbeTCLA9+lLEgPAfPt1Fe6StGC3bdFwNznK6G38I2N94cjotzCvtgrfaGu2htTxXc7p3504ye24MznJLHx72tFIgvT01SyjqgWKNU3eaGfQ8TCOitnFsIscDXhOCIZjGDsx3Oof4R4gur/bF/SfBYlMkLqI6gqUh5vAvMp73lWZFdOHJ4Uj9L6UROr/Sh2JKxIf06xBSKY1LTTLsU5RJBeKa1HtfVEl2vli/PUsx/KnbA2/4Vdgpr1BMHsgEFGYsBFj8qby78s/PECN9UEWeK4HUTeKbBcy+U/L4DD7E2DIcnJW8hTshIf+xMgKbKygmlCdNbaqXc1nN3S/zVLkx0nCaHhmID1NVIHP+IPGszp2nSqtigg6bnMLOKJlmeUh8FanoVTQpgnPr5cHzuLHyUziD8n7Xs1UMKhgpdM/j2xpHPEAumVVrB/mk/H94fB0OtUYnQO0SiCzXle7c0+yPKXTJl3eBpCVpxHRroj4GWKEu7tRwQw/IBL3PGliSBJK8CIddeD+9VE1082ueJPZctwmXfk22Ci4hDqpfzyTe0hzQm5TzxHF3HCfzyvaCpwGK2MHcjLDBWu69bqhaG9qIW2TZxEdhVPheI9XbUigQ6rPbgqgzRTPRpvqiB89rb9EQ==
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(36860700016)(82310400026)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261026121527099003)(261022075727099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iYOXSq2Mpb/00RSlbl+Q7yQOLK95uAzOm0qtCXzQFBYrrjmHX8cVyvX+1JEGueXcctAkgrmJCeEnbDYOtY3eVJ8xTRBxE1iq/bkvsPDaDwWkZ7QhDB/XwlYU4ck6hs/+dftPp+elLuwYZbgo93RjNfmz5z3W0QA+EQkGx9yNdjmh6VjgdORg3xnJ7NWAyZPKu27dp/xtuKQvmmEBytLmEP4BAZiuJ1BKuKu8Asqjk+vgBngNSldyIQpIkBOF0xdLGm5wbdcA8V2urNvaAf5sLjuXOYxQCcSjbN29Tv/XtFrT8Ew1hgABcLJHC7rFSfVtNMXiGw2AyTMHprq29yFzQZz0CpdV63/fIfG7ltkwEF7U+GB2L0lp7H/TnVHPrmRkEFD5q9A0HUs9DjoHr69ROFE90GeY+YhjbMZ2VRhU6RocyafIbxgaFNBhwTTcJ6lP
X-OriginatorOrg: cn.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 07:37:54.6358
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6f251ef-0cce-4abf-073f-08df3a468a03
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F8.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7237

From: Qiu Guochang <guochang.qiu@cn.bosch.com>

Move the hardware definitions shared by the BSH SMM-M2 and SMM-M2B
variants into a common device tree include file.

Update the existing SMM-M2 device tree to include the common file
while keeping board-specific configurations separate.

Signed-off-by: Qiu Guochang <guochang.qiu@cn.bosch.com>
Signed-off-by: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
---
 .../dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi     |  89 ++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts   | 102 +++------------------
 2 files changed, 104 insertions(+), 87 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
new file mode 100644
index 000000000000..5c9109da6806
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2021 BSH Hausgeraete GmbH
+ */
+
+#include <dt-bindings/input/input.h>
+#include "imx6ulz.dtsi"
+
+/ {
+	chosen {
+		stdout-path = &uart4;
+	};
+
+	usdhc2_pwrseq: usdhc2-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio2 21 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&gpmi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	nand-on-flash-bbt;
+	fsl,use-minimum-ecc;
+	status = "okay";
+};
+
+&rngb {
+	status = "okay";
+};
+
+&snvs_poweroff {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart4>;
+	status = "okay";
+};
+
+&usbotg1 {
+	dr_mode = "peripheral";
+	srp-disable;
+	hnp-disable;
+	adp-disable;
+	status = "okay";
+};
+
+&usbphy1 {
+	fsl,tx-d-cal = <106>;
+};
+
+&wdog1 {
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_gpmi_nand: gpminandgrp {
+		fsl,pins = <
+			MX6UL_PAD_NAND_CLE__RAWNAND_CLE		0xb0b1
+			MX6UL_PAD_NAND_ALE__RAWNAND_ALE		0xb0b1
+			MX6UL_PAD_NAND_WP_B__RAWNAND_WP_B	0xb0b1
+			MX6UL_PAD_NAND_READY_B__RAWNAND_READY_B	0xb000
+			MX6UL_PAD_NAND_CE0_B__RAWNAND_CE0_B	0xb0b1
+			MX6UL_PAD_NAND_RE_B__RAWNAND_RE_B	0xb0b1
+			MX6UL_PAD_NAND_WE_B__RAWNAND_WE_B	0xb0b1
+			MX6UL_PAD_NAND_DATA00__RAWNAND_DATA00	0xb0b1
+			MX6UL_PAD_NAND_DATA01__RAWNAND_DATA01	0xb0b1
+			MX6UL_PAD_NAND_DATA02__RAWNAND_DATA02	0xb0b1
+			MX6UL_PAD_NAND_DATA03__RAWNAND_DATA03	0xb0b1
+			MX6UL_PAD_NAND_DATA04__RAWNAND_DATA04	0xb0b1
+			MX6UL_PAD_NAND_DATA05__RAWNAND_DATA05	0xb0b1
+			MX6UL_PAD_NAND_DATA06__RAWNAND_DATA06	0xb0b1
+			MX6UL_PAD_NAND_DATA07__RAWNAND_DATA07	0xb0b1
+		>;
+	};
+
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX6UL_PAD_UART4_TX_DATA__UART4_DCE_TX	0x1b0b1
+			MX6UL_PAD_UART4_RX_DATA__UART4_DCE_RX	0x1b0b1
+		>;
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
index 362a26a2a1b1..033fb973f4ea 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
@@ -5,41 +5,11 @@
 
 /dts-v1/;
 
-#include <dt-bindings/input/input.h>
-#include "imx6ulz.dtsi"
+#include "imx6ulz-bsh-smm-m2-common.dtsi"
 
 / {
 	model = "BSH SMM M2";
 	compatible = "bsh,imx6ulz-bsh-smm-m2", "fsl,imx6ull", "fsl,imx6ulz";
-
-	chosen {
-		stdout-path = &uart4;
-	};
-
-	usdhc2_pwrseq: usdhc2-pwrseq {
-		compatible = "mmc-pwrseq-simple";
-		reset-gpios = <&gpio2 21 GPIO_ACTIVE_LOW>;
-	};
-};
-
-&gpmi {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_gpmi_nand>;
-	nand-on-flash-bbt;
-	fsl,use-minimum-ecc;
-	status = "okay";
-};
-
-&rngb {
-	status = "okay";
-};
-
-&snvs_poweroff {
-	status = "okay";
-};
-
-&uart2 {
-	status = "okay";
 };
 
 &uart3 {
@@ -57,24 +27,6 @@ bluetooth {
 	};
 };
 
-&uart4 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_uart4>;
-	status = "okay";
-};
-
-&usbotg1 {
-	dr_mode = "peripheral";
-	srp-disable;
-	hnp-disable;
-	adp-disable;
-	status = "okay";
-};
-
-&usbphy1 {
-	fsl,tx-d-cal = <106>;
-};
-
 &usdhc2 {
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -97,47 +49,19 @@ brcmf: wifi@1 {
 	};
 };
 
-&wdog1 {
-	status = "okay";
-};
-
 &iomuxc {
-	pinctrl_gpmi_nand: gpminandgrp {
-		fsl,pins = <
-			MX6UL_PAD_NAND_CLE__RAWNAND_CLE		0xb0b1
-			MX6UL_PAD_NAND_ALE__RAWNAND_ALE		0xb0b1
-			MX6UL_PAD_NAND_WP_B__RAWNAND_WP_B	0xb0b1
-			MX6UL_PAD_NAND_READY_B__RAWNAND_READY_B	0xb000
-			MX6UL_PAD_NAND_CE0_B__RAWNAND_CE0_B	0xb0b1
-			MX6UL_PAD_NAND_RE_B__RAWNAND_RE_B	0xb0b1
-			MX6UL_PAD_NAND_WE_B__RAWNAND_WE_B	0xb0b1
-			MX6UL_PAD_NAND_DATA00__RAWNAND_DATA00	0xb0b1
-			MX6UL_PAD_NAND_DATA01__RAWNAND_DATA01	0xb0b1
-			MX6UL_PAD_NAND_DATA02__RAWNAND_DATA02	0xb0b1
-			MX6UL_PAD_NAND_DATA03__RAWNAND_DATA03	0xb0b1
-			MX6UL_PAD_NAND_DATA04__RAWNAND_DATA04	0xb0b1
-			MX6UL_PAD_NAND_DATA05__RAWNAND_DATA05	0xb0b1
-			MX6UL_PAD_NAND_DATA06__RAWNAND_DATA06	0xb0b1
-			MX6UL_PAD_NAND_DATA07__RAWNAND_DATA07	0xb0b1
-		>;
-	};
-
 	pinctrl_uart3: uart3grp {
 		fsl,pins = <
 			MX6UL_PAD_UART3_TX_DATA__UART3_DCE_TX	0x1b0b1
 			MX6UL_PAD_UART3_RX_DATA__UART3_DCE_RX	0x1b099
 			MX6UL_PAD_UART3_RTS_B__UART3_DCE_RTS	0x1b0b1
 			MX6UL_PAD_UART3_CTS_B__UART3_DCE_CTS	0x1b099
-			MX6UL_PAD_GPIO1_IO01__GPIO1_IO01	0x100b1		/* BT_REG_ON */
-			MX6UL_PAD_SD1_CLK__GPIO2_IO17		0x100b1		/* BT_DEV_WAKE out */
-			MX6UL_PAD_ENET2_TX_EN__GPIO2_IO13	0x1b0b0		/* BT_HOST_WAKE in */
-		>;
-	};
-
-	pinctrl_uart4: uart4grp {
-		fsl,pins = <
-			MX6UL_PAD_UART4_TX_DATA__UART4_DCE_TX	0x1b0b1
-			MX6UL_PAD_UART4_RX_DATA__UART4_DCE_RX	0x1b0b1
+			/* BT_REG_ON */
+			MX6UL_PAD_GPIO1_IO01__GPIO1_IO01	0x100b1
+			/* BT_DEV_WAKE out */
+			MX6UL_PAD_SD1_CLK__GPIO2_IO17		0x100b1
+			/* BT_HOST_WAKE in */
+			MX6UL_PAD_ENET2_TX_EN__GPIO2_IO13	0x1b0b0
 		>;
 	};
 
@@ -149,10 +73,14 @@ MX6UL_PAD_CSI_DATA00__USDHC2_DATA0	0x17059
 			MX6UL_PAD_CSI_DATA01__USDHC2_DATA1	0x17059
 			MX6UL_PAD_CSI_DATA02__USDHC2_DATA2	0x17059
 			MX6UL_PAD_CSI_DATA03__USDHC2_DATA3	0x17059
-			MX6UL_PAD_SD1_DATA3__GPIO2_IO21		0x3029		/* WL_REG_ON */
-			MX6UL_PAD_UART2_CTS_B__GPIO1_IO22	0x100b1		/* WL_DEV_WAKE - WiFi_GPIO_4 - WiFi FW UART */
-			MX6UL_PAD_UART1_CTS_B__GPIO1_IO18	0x130b1		/* WL_HOST_WAKE - WIFI_GPIO_0 - OOB IRQ */
-			MX6UL_PAD_ENET1_RX_EN__OSC32K_32K_OUT	0x4001b031	/* OSC 32Khz wifi clk in */
+			/* WL_REG_ON */
+			MX6UL_PAD_SD1_DATA3__GPIO2_IO21		0x3029
+			/* WL_DEV_WAKE - WiFi_GPIO_4 - WiFi FW UART */
+			MX6UL_PAD_UART2_CTS_B__GPIO1_IO22	0x100b1
+			/* WL_HOST_WAKE - WIFI_GPIO_0 - OOB IRQ */
+			MX6UL_PAD_UART1_CTS_B__GPIO1_IO18	0x130b1
+			/* OSC 32Khz wifi clk in */
+			MX6UL_PAD_ENET1_RX_EN__OSC32K_32K_OUT	0x4001b031
 		>;
 	};
 };

-- 
2.43.0

