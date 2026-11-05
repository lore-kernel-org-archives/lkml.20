Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793846519;
	b=dR9dYwP6yZcGhLJZakR/QqtT5qMpPH9KmEe0xdnusaDXKKWQvtIKks8y28LHDEoMwblY
	 2RxCUiuoC/0asb/7sp0eLocF5lFrZwKRkcwZUZtDX/iCydYSu6/V/dW5sgw72plVhwSKa
	 Al3tbMf9qwQa1xRgbYhHrXmVy7qSZel5GJk9aMGk9OhzzGWbsU8PTguysl8bG1hOB7L1e
	 p5l0zYhiwfsd4GPTabhptC43Xt6BIYkIOU548/zTsJkF0d7+EuegRSMUHjpKFYDsH91bH
	 E492tsOZ5GW4umXhkrg3y3KL9sZ4bY18HX1IVPRDOlcMeaX2UUfpjJhlyQrs+YhCeRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793846519;
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
	b=lrrD/TNlfXXgWHoMz0t518DXbsiN996jJODFAW23sUv5Rx0mZFoJDaClWkK7t7Vl82CR
	 WsZbpq4Gam7zZP3eIjVtcsM5rZOudkwcUtFyKfWy9qV0Z5AdTnNRWS9aizat2w8Agrz+w
	 Iyr+fpexomOx7Rqc6jJ3z/zFj2iLh1Q1I8Ls5mYnkdIc6ou3kuGu4kduvmF3j0NXHHljQ
	 ot2XVH6C7kfKnPymqQz6mXlFaeRTO1r8NiQt1iYQqqObWM3LxBWqYn1LqRjC3geIdhIMG
	 VG5WRcQEU+N7ljCYbY/dzJIoX9jVkNn7v5r33Cy9eVyUuddYlc7U1qnsOsIRSfOO6xw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cn.bosch.com;
	spf=pass smtp.mailfrom=cn.bosch.com;
	dkim=pass header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=ItTr7uin;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.15
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011015.outbound.protection.outlook.com [40.107.130.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0CD606A328;
	Thu,  5 Nov 2026 02:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E0CD606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=ItTr7uin
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iuTvdKQUPtpoZiYlH7Utg/iMo2u14TwUiXskHz8/PvVhmN2zszHOdDSi1qVg/BoRApKH430sJHwA0tPeYrqg6QH8+xfpMlgyzlt+Il7T7zFVxGiYG9gh10JfmeTbBW+Kt+yAKrhJgpNvTHy6cVZLELQsCifJPj0g5NBhnZG8lJ7y8djdKXp0+8Kk4qqNLJ1RRfE+q6j5dZuR7GFDRw/oi6Lw8Z/12MT+T+dN9hBnmyqGLc3mhaGLhwMUptuUbBJe4uB1GkafJJiTZh+DaOqAylirGSIVcZKhGB2Go3cYUbsKA9hrDrImgUFISGIQL7IxLhO9aDh+s6Yfe+MmrPdf3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/IvhXsMUaf93bbrw5waW02mepdm0IHSOaVM3XyUYZA=;
 b=dvDe1YNNNDKvOR5mmZFhduPhUxIiRubDXNoI3G7j4ly9MDqUO+x7D160om2kQAzRqKQqxHW3FudxLm3Fm4+ERZdEOOfOmc7+EhDfI3AS11kI7cNilPASfC4xGTwRiSMV9ItChGVkbNfApruuOi0flLd+aSJk+rdzGY3trvtCUhjsr3f6+qbkG48ujqEpRex3VXxIes6K0rUenulzAxObctXzu+Vo24VS0nT+4ebq5yRZShMfUWO3gj6sJVlvB3BVgPHALONMj8WeagljPndH6KCUJX/CRGt2UwGh7b1N+BXgnRz/zCWKwux5rZCT0tz23ODPwEAlY6JO5zz/GKGbBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=kernel.org smtp.mailfrom=cn.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=cn.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cn.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/IvhXsMUaf93bbrw5waW02mepdm0IHSOaVM3XyUYZA=;
 b=ItTr7uin/gJX03Td9wOfIkIKZjp+X8rjzn7ybqycRKs2WN6QzYWcGp4hKSmep7mBn+7CZTDbRE6mhAxpMiDrGbQhHQ8H3Mp40tbnE5zp841S70kCTNAqdFL/J3Ihq8SLWvfXzhGo5pv0u2gyilezJdn4+egLOATYsb5PdFOcn0vvUynn/IMc6qL3rpjOvf4srW8SlV5kjVt7RB63Ydmw9ueTLtUxoFm/BOhkJrLel8xRHZLepM4pnvaJ9qfxdxtS3HVS471Mf4eysuFYhvgtDidX4POQFjV5qCGbyeO99k9uRQik4VjvaCHnsOk8S5JZ8RS5vqcBu+2YcWEdbhUErg==
Received: from OS6P279CA0044.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:32::13)
 by GV1PR10MB8755.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1cc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 02:41:53 +0000
Received: from CPH1EPF00000520.eurprd04.prod.outlook.com
 (2603:10a6:e10:32:cafe::94) by OS6P279CA0044.outlook.office365.com
 (2603:10a6:e10:32::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 02:41:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.206) smtp.mailfrom=cn.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cn.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of cn.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 CPH1EPF00000520.mail.protection.outlook.com (10.167.241.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Thu, 5 Nov 2026 02:41:53 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 5 Nov
 2026 03:41:53 +0100
Received: from WX8-V-0008J.wx.apac.bosch.com (10.190.167.205) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 03:41:49 +0100
From: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Date: Thu, 5 Nov 2026 10:41:19 +0800
Subject: [PATCH v2 5/8] ARM: dts: imx6ulz: Factor out BSH SMM-M2 common
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
Message-ID: <20261105-add-bsh-smm-m2-v2-5-fb5ffc7da486@cn.bosch.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6649;
 i=Haoning.CHENG@cn.bosch.com; h=from:subject:message-id;
 bh=z6faOTLoJb7dE87hm1QqKnI0Bs+XHQBfuRdp9QSTWBE=;
 b=owGbwMvMwCV2Lz9jvnXEsVWMp9WSGLJev7mx33jJypJv2n8y+F++fLpHcsmqU9rTdCfvm5Gvy
 7U7bQrTxY5SFgYxLgZZMUUW1QTvs5JXA0ynzayGm8PKBDKEgYtTACbim8PI8EQ9qEU10Hbe54rr
 VcwpT5cuuVYjpfittmHPSosbkxdafmP4Kyzj+aXRLsLk7NVZ7RHrTkvtjj4j82C79jH3gueFD/Y
 f4gEA
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=openpgp;
 fpr=25604BCD19D5503596997B16DE6F689F3B58C6AA
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF00000520:EE_|GV1PR10MB8755:EE_
X-MS-Office365-Filtering-Correlation-Id: d8ba8b1f-0b59-475a-ed8a-08df3ae659e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|7416014|376014|1800799024|6133799003|22082099003|18002099003|10067099003|11063799006|56012099006|261022075727099003|261026121527099003|261102123227099003|261009223027099003|261021121427099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	ma3Nxb8bMupE8G4Oeew/+5wYWM37MpN9fthfDnzehrX4t+gD8ZinZrCehphlyIFqe9j1EGuEu14VWl+Kc+/qcjENC4Pkur/yvDaTczpB+SfTXwqZ0mlW5Q9TMK1MesLmtRJ6LrhZTy5Fqtq/lCiwo7HnIA8w34DAZpkNccWBsQL8alL7xxBjwAyqN5Ka8uyeplovCAO4SP4F4/f/5yaXHeVIZ320YMKtjxNCuWDwu+S6G9P80xTcwBCnGc4HGH7+ZEhxAG7Fo+eTXZzOAiLukjaCeiLsdWsxipRqo+UzMQ4MVJ9lZB9b8L0p+rUyDyccY5yq6kYeYDB785C+uH/Uc/UUwXHzGUTW8hw+5H/A6X3MqjztFTjnDsqpYB04HE/2D1WQK+DusD+qEnzp5Bj1thCbZT/gNryG23T5JCHFL49xfYH/8gxbZRUMHH5gA0b1EpMEnGbAi8eIrDp/1kSuAZqZyLHn1cK/T2zO6nRAQonJGUOlJC5Gf+R8PaS++uEkqslFEnSU2Ejl+A++lOVMJszul+5JXMT4nRsOIGon+GRT2KeiEH+t837wLRdB10vR2KriD5jtGTztWQ9A2RWBgHyPBbEFqTlZrytubZr427m6FaFpU2zGiQkEdwNOJas66IFN6eEsoErsKlIdW501KuHnnSFptToIEj8UXCAn+AXbBwNKxXK7E0PWtqf2qvyIBgMdJ9AVWQYzQqF8CA+OjA==
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(7416014)(376014)(1800799024)(6133799003)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006)(261022075727099003)(261026121527099003)(261102123227099003)(261009223027099003)(261021121427099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AmgAfEK7RH5ON01FR3FdGpPayVwQjrwFHpJ8kDpCYQeaxZVSIzWtvbWDZ6efAEkm82tXffleGCyqXzUFOzau/QSfyao3gLaMYyogFUYAZ+uTZGV77EUpV/OIvwJxgZ75pO3F1PNefj27jgKl9ULKP4lCOggE6N9Sy1PWuLrZka84M6YQVDD9eonu+O3ln2z05tDnT7OBpVQkddXntj57XclJN7uBxnvyVYZ+dW3Hwzrgme0+D/x8J8t108mD4oJJDZjDvmYDudmhbMuOfleHmLXTzn77/bst9TCHtV9BNi/vJkpfIwHbqC3sFbiU3827YXBTzAfOnv5iLhBFaNJSRAkTgvGfe3kFkFHmA+EOsuJ+rjSvZLDe9X8c+npNbwkZz9Ae2he43h1N5LYSXopiwJLMs0aTuQHdIciqbd8j/ZGyo2Y4vV3kTDsR4q9T2bR4
X-OriginatorOrg: cn.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 02:41:53.4007
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8ba8b1f-0b59-475a-ed8a-08df3ae659e1
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CPH1EPF00000520.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8755

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

