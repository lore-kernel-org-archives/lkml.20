Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794389074;
	b=28ia6FwekS2KgPoRWdr1vbKgZ0kE21oZWBtsFqUNTG1EjB4Lvt6IPptbfquNL3iEjAts
	 64Ty11jSbi8OzpRqkp4yWl+a1Zlo2d2u3VSLWkU916/9Q/Q2M6Hn4IRPuBlO5C89CYNMp
	 Bs6wKUkG8k3pUIVoltQPmPEfCR/OnJhJV8cmw1eMfSPihOAGdKv/DcMjTbYRrIcWIcq1Z
	 pwGY+jm1XQA4mvHjyioV0jLzAQTqBxMuJkISbIqOe/ntuA7UvojIyyZJ+rnPPb8rTnEL0
	 gv2//M6OnPdvKBBXPLDcRXtqOmf3aOCMuo5RZz23bnzpG/QGx6EW8a7Pj5hyiBDiMmg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389074;
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
	bh=p/IvhXsMUaf93bbrw5waW02mepdm0IHSOaVM3XyUYZA=;
	b=CrsSbRiKENf5Z1Zpe205UV5nBUL95Liqxgg4t85fY+ciI1/7wktuPFc9CmazwSuX4nk1
	 LZgygUjTYaVB4WEzmVUsTO7e6iS7a6qfhsdgqu9wpx/94ZLrokOOOInFpRBs6fMzFdkG0
	 q/Av+hgsvyu3Zrr4Yg91NnH9ICcTmldZ3wm5llTG6bTi1SofDO3dnS8cWiMC0KaJzVSb6
	 9t0npuI8XvsvWp7vHSozX4g5oAbET1kkbMJrHY/7q7oyCI00lMTNYM/Q2LP5iqA0zHRsN
	 xh8TqnBGmjtiGc4jYN7b62JIoWZp31Hd+sCD2tkReKnnQg4/qs2yFSf2e/TwPWXlCsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cn.bosch.com;
	spf=pass smtp.mailfrom=cn.bosch.com;
	dkim=pass header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=Sse+Xe1S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.25
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013025.outbound.protection.outlook.com [52.101.83.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C2B60A260D;
	Wed, 11 Nov 2026 09:24:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7C2B60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=Sse+Xe1S
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X9ZgXPKC9lU93V1Zihx10w2iAu5O/N8+UHPoSxYXFbfHoTkr0RAFArzvuw6oC1g8/10MXHIzlUUJDEamYyRUE01e9ZWfyhDXfCe2cHrg2APeclBAreHpGpi+Eshrb3GzvCQQmJjE2fR0GMVRvNiVOghykGiYrxGvYXx7wSy7aNY8WId1dcyBg6YSsOy15dz7rZ14W86j75knHIsP10CPlHegNosz8pBivs6j3SSmYwZ3OV2G/Uc+VxPbrFOy/G/DqWn9kMy95UDhscdQOREPOG4jbze9w3HbZ9sA+v8Tve8medpDCKIeK7rRGpKB4EYaeKazqsLe7kz8Y+L7q8lGkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/IvhXsMUaf93bbrw5waW02mepdm0IHSOaVM3XyUYZA=;
 b=VxDO3WD06IFgrsJo8i/riPALI7vWWk26smSAB8bfFjY9SVm2Wx+/3g2Rv84dS5mmrBYIRkBjUuFmRYm4LZm8+bHlW0LArSGTuQ+ZdcImpOAMOhDBSpZS7pwe91ZOEmDYFeLkvpcqx/yqg5K2G8N/Kl7JbW8uaXu2LOQyzaVHRYeR2fGjUTUSk3od0CBrgYdpy4aaPSTYgZnZcsFRemNfSFJY3X7AyA8XCJVQdTE2x8QuNJXk2A5Dzbm4KyAZCiSTxJWunnKKhGFyi6vWjIa5OWcBNfriMD6EIkpqrGVZb7tM+q/dT2luZMeTOPX90VmRL3Zjr5wt2yjuHqsueNAfCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=gmail.com smtp.mailfrom=cn.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=cn.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cn.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/IvhXsMUaf93bbrw5waW02mepdm0IHSOaVM3XyUYZA=;
 b=Sse+Xe1SzsI79XINnJUw8mjeVMeRhUgM8Uy4NJRwm+KRK849Pc3B2Rzd1A38B7d8mGE+2mo7z517fLWGuGO2c0HVUUOmMDp/3jhE7WQdzmw25duJz2BeMxIg3FJFFN5GtzKftGhYmlvMO73seg5s/oYltAwV0sOEq9rIk6kDmf4iCQn2xUOWOrvPVFIBF0VEE35qC78PMoh92JAJQtrg5JfOvMqiVfMkjZWbYzRANf0OgEsOmdB1ddryhNLNMiSLKD6YSnlbKPAFcENlRE+jSydK89dcKC1dHHptNJ3Q+9UKgfX1aP3e3/0N/HegFDUjiI4sTSnfeSFT5xhj3MUDWg==
Received: from MR1P264CA0093.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3f::21)
 by AS2PR10MB7021.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:59b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 09:24:27 +0000
Received: from MAD0EPF000008C2.eurprd05.prod.outlook.com
 (2603:10a6:501:3f:cafe::c) by MR1P264CA0093.outlook.office365.com
 (2603:10a6:501:3f::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 09:24:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.206) smtp.mailfrom=cn.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cn.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of cn.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 MAD0EPF000008C2.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 09:24:26 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 11 Nov
 2026 10:24:11 +0100
Received: from WX8-V-0008J.wx.apac.bosch.com (10.190.167.205) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 11 Nov 2026 10:24:07 +0100
From: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Date: Wed, 11 Nov 2026 17:23:21 +0800
Subject: [PATCH v3 5/8] ARM: dts: imx6ulz: Factor out BSH SMM-M2 common
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
Message-ID: <20261111-add-bsh-smm-m2-v3-5-4abdf10e9a7f@cn.bosch.com>
References: <20261111-add-bsh-smm-m2-v3-0-4abdf10e9a7f@cn.bosch.com>
In-Reply-To: <20261111-add-bsh-smm-m2-v3-0-4abdf10e9a7f@cn.bosch.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, Haoning Cheng
	<Haoning.CHENG@cn.bosch.com>, Qiu Guochang <guochang.qiu@cn.bosch.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6649;
 i=Haoning.CHENG@cn.bosch.com; h=from:subject:message-id;
 bh=z6faOTLoJb7dE87hm1QqKnI0Bs+XHQBfuRdp9QSTWBE=;
 b=owGbwMvMwCV2Lz9jvnXEsVWMp9WSGLK+mPDYnDaYq7tgqQdno+UmZZPc/oTMOtMNcQ8ObfVfV
 9xaJD6vo5SFQYyLQVZMkUU1wfus5NUA02kzq+HmsDKBDGHg4hSAibx1Y/hn9PmOaXOjtuSbJYVN
 me/eNxlYKmRv+Kt1xu/pxGt8iVdTGf4niv7S+heYeUwqsFDqxun73Y2zDk1U+nv6vFfalcKd2rF
 cAA==
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=openpgp;
 fpr=25604BCD19D5503596997B16DE6F689F3B58C6AA
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008C2:EE_|AS2PR10MB7021:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f646477-fc73-4af7-421e-08df3fd594e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|7416014|36860700016|1800799024|22082099003|18002099003|6133799003|10067099003|261021121427099003|261009223027099003|11063799006|261026121527099003|261022075727099003|261021123027099003|56012099006|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	7egYr0HE+JlrdsI+tmBE6R8V2R12QiQYosnLPjgjngCcWcA/D1noQirnl0/iuYdFCvNANDZAT/dcztZZUa03uoHiQE/a81mPjkQ7OIVwWzo1N7zUBaOtIt2R467AVlwzLHrhYwBP76KoFV9dwQrto37zZlLxdTgONAzvxku2NNTYBsHD1W36f2gWBPcQmzEwBOWxLDeQaTwlGTVLX8EgTdFhtMuKU9bcaJFeHDB4/ZRGBCkuDKYLmSQ/9vPkBM7OcPJm/v/0hw4vfeVRso5cF5Lza2GWjfqzrhrILxtVp0MGVw3fDNILBemBoPkpNzdpAY4gIxA6qE1EI5KIQX1UL1lPqPRLO7pwXc9i8e9lj/flQgeWFSiy7FOw5tfvwZSKsSvFj6sXoE3hnhUvodelNltktemzn4NL449GVBUtDwr8+26nhSJG9Kp1To/1rKVYABpVuhy5kj+W7cywFnMErQPOZ30/Ftv/QCOE9sQT4BWMuukqFnGLZrL2RMWcof4KmQfRj/F7E59/PlUEDhM6m2kpmgA/dflIu2RFOyIlfUSObtmHDlMzlzEGvLf+WwKmDxX6RqDQ6QF7N1ueeUq+iEzGhtaWxVEwDXKSJDYPZ/3lQE51+rCa4Mf66uIQuEDS/ua+Yk6AW7MQu+rD5jJ152n4WfYaYLe68b39svl6aPee48jOkQD3i4zOKQeCHf/nnXDOmBgb/VDH7deQNX2sIQ==
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(7416014)(36860700016)(1800799024)(22082099003)(18002099003)(6133799003)(10067099003)(261021121427099003)(261009223027099003)(11063799006)(261026121527099003)(261022075727099003)(261021123027099003)(56012099006)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	k/fhv4OHDNgYHNMMw9aTfX3GxraYp6yWj80xcLrr3Wmep2AJCASjKzCF4NM1slOZ7uKqa9ZJMQdto60lallpKi4j97UFrWES4IXDqq6nGHQkqX8I4xp3kesWI8dVDZo1u3s8Fti84JlNYnS70d1BkjbnqQcxhVVSKzt35NhXA/AvBbCip3r9Dt5GZnfmbZ0GzbyDGn/j5+/BhhAICrPK4OjCSdJFvHKZ5QJ189yTZTDzVSZ8l/yYdgGv0ZB8IKT/8VA99yCd9PZvD+hjMiWQ/N0lBEBqMEdaVyRF1vDBlm50wCr4ixlOaiIHrpk5jub+tfYWRtINZ/wGzRuT1lKi8V6TEU7U3LaE4gwKy+M3W3ccGBvgEQWQMI37yByFsXt7QawGHuG4zHgnn9e5WKcVn0/wFiJy81GZxKBcJBNikEY82G2LZxV+bCFS0W2pz6gn
X-OriginatorOrg: cn.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 09:24:26.7008
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f646477-fc73-4af7-421e-08df3fd594e1
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008C2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7021

From: Qiu Guochang <guochang.qiu@cn.bosch.com>

Move the hardware definitions shared by the BSH SMM-M2 and SMM-M2B
variants into a common device tree include file.

Update the existing SMM-M2 device tree to include the common file
while keeping board-specific configurations separate.

Signed-off-by: Qiu Guochang <guochang.qiu@cn.bosch.com>
Signed-off-by: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
---
 .../dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi     | 80 +++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts   | 93 ++++------------------
 2 files changed, 95 insertions(+), 78 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
new file mode 100644
index 000000000000..83df5c696748
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
@@ -0,0 +1,80 @@
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
index 91c76909c086..66ea70d93590 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
@@ -5,39 +5,18 @@
 
 /dts-v1/;
 
-#include <dt-bindings/input/input.h>
-#include "imx6ulz.dtsi"
+#include "imx6ulz-bsh-smm-m2-common.dtsi"
 
 / {
 	model = "BSH SMM M2";
 	compatible = "bsh,imx6ulz-bsh-smm-m2", "fsl,imx6ull", "fsl,imx6ulz";
 
-	chosen {
-		stdout-path = &uart4;
-	};
-
 	usdhc2_pwrseq: usdhc2-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&gpio2 21 GPIO_ACTIVE_LOW>;
 	};
 };
 
-&gpmi {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_gpmi_nand>;
-	nand-on-flash-bbt;
-	fsl,use-minimum-ecc;
-	status = "okay";
-};
-
-&snvs_poweroff {
-	status = "okay";
-};
-
-&uart2 {
-	status = "okay";
-};
-
 &uart3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart3>;
@@ -53,24 +32,6 @@ bluetooth {
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
@@ -93,47 +54,19 @@ brcmf: wifi@1 {
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
 
@@ -145,10 +78,14 @@ MX6UL_PAD_CSI_DATA00__USDHC2_DATA0	0x17059
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

