Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022127.outbound.protection.outlook.com [40.107.75.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382D734676F;
	Sun,  6 Sep 2026 03:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788665082; cv=fail; b=IP6JEhQRQUWZrtrNjX70CC7ctESXkEKsCrLA3eews9SoUatsWsSFRK4KMVpy7SS8n8Huybcl1p/+Bn1V8s2nAuHU+maXlr7jLeCL/BTT8RjCPdqCZodXTUptp30+aL/3doR5ti02F1AmqomWHiJqefdURwin+obGQh6G54DM/Pg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788665082; c=relaxed/simple;
	bh=Mz9jv8OHATBXoa900SMJz6m5V5e/ujUFLYCk2Bl/yFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JOhQXiX35m3t94V+Zn1EZl4ZO3sLkr5+486FCy/TIdC8vDYSYRJyWqf1bYRAWeIt1y+eb9BLPg0o/tegYwqASGBnEG2RVPlial0qwiP6vz5bZqt6WY74xe1r7ot9yoTdiEc2DTgVEFcoFqcbvLt5BuKFWdSUfMzSWtLCEXnP0zo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fS/HRbaqfkvSzYWMptN1o+UeYxcWkC058SzTj/+H5UGO4j4PLI/dy7Aq6qMOPT7P4nYriyuSVRKn7oDnRv09kimhB/F4bh6CzaR8Gqd3tF418kZWwiN+SrB22nj3f6ZrjVwduoEZtlL6u89h2bbx4ze/gXsrhyPOtkRETzMSQoyzJxqqStVdB6y6s6CUciFcGbM5xiXS90A7IRx06C/FVIQWygdv1R8a52tE6QqJSzC0XyHkhygId8fu4Zgsrb8zB29ClQsegMcYzmDntqainMYt55hGJr6AwjMCO9FKk/KQVIKjZ1xyXaqkcO44bonMZ75kn4s3PXuWmWVShWoXGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SzilfY1X+jy0Y1LRqfyAZ/0s+HBCpKlQvOrEJM4Apd4=;
 b=DtJZC5ioPznOSt63Xa79BtDHr0bqCd7RLd7A7af63iSgT/CIj8D9Gd95Fk/f6ZHyE+FMDVuPbDMoiZJfmVK55bRHKyGHRJ8d8uQa/AGsCuwHUXkZFO2UMLNMeU1PGn+CzNyKD1qlw+b7LgiJef99M216LAn/xvro2vDO5GNjxw80UzS5NRcMHZ3IC7sMf2sOt+fKTj7/jZP40x7Hki/OKVO9qkLoIYxdUyFiiqgLnAruBaSaDGB5+biP5pyRSTvHy8mpyi+WhHyvLk3pf4RIeFCHYoZ7j0miHXmCgXB4ngR36jq+AknpK/vTHjJwCLewYAOYQcycQ4GoxqSwqvADVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYWPR01CA0002.jpnprd01.prod.outlook.com (2603:1096:400:a9::7)
 by SI3PR06MB8609.apcprd06.prod.outlook.com (2603:1096:4:2aa::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Sun, 6 Sep
 2026 03:24:35 +0000
Received: from TY2PEPF0000AB84.apcprd03.prod.outlook.com
 (2603:1096:400:a9:cafe::5b) by TYWPR01CA0002.outlook.office365.com
 (2603:1096:400:a9::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Sun, 6
 Sep 2026 03:24:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB84.mail.protection.outlook.com (10.167.253.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Sun, 6 Sep 2026 03:24:34 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 707B34092117;
	Sun,  6 Sep 2026 11:24:33 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: peter.chen@kernel.org,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org,
	krzk@kernel.org
Subject: [PATCH v4 3/3] arm64: dts: cix: Add USB3 PHY node for Sky1
Date: Sun,  6 Sep 2026 11:24:31 +0800
Message-ID: <20260906032431.470744-4-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260906032431.470744-1-hongliang.yang@cixtech.com>
References: <20260906032431.470744-1-hongliang.yang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB84:EE_|SI3PR06MB8609:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4e113c5a-3a44-4d33-932b-08df0bc65fe1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|7416014|376014|23010399003|921020|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rEH2pQEaAVN9sFnPk+FgfziMb1rHDDUP5u/lKZVJ28KPnv8hh7TTOpF5z+7jwPbA0R6ozQkut5oNnovOYaYvACGGPjdc/yt7UMz+mZd8UeqpipFkpqMBo3L+CyGy+AsRt9umME3DTvGruklhyoq8H3Nrl71cQC3ymAh9PUMnEkKEvRcCdIaini0ugTukPAUTPP88nE8lqypwo3wT6b7kUyO5PROJ2OGnZQr525kks2XNkJM15uMo/FYOjttWcof6XFDJVyLWHmedpiftqukfZki471+FzCmqrQYuBbJMnVeUloqUx1jeiIgf5++dOC16CNlDZazhqXbtH4cgVdo/hGpMjFgUdwns5XmitMzplmTzKMekp6QXzhq5/snXfcujUdGu5I3tcyx3IIsKy0yEKP1ASdhpzvawKTJhy+LtypR4AR7IDsSLNQeLXkrXCW7sCLezAlKg4SKCishaqKyP0+RyfkaEmxCYMbwcWEjdvJZARlLNrQRhnsurMCOnvTtizBcrknj9ZTqmWDg/oiFOm7rQKdwITZnajfaxWJGgxX815qNO7gVU3g1BT5+u791sOA023QeFRtRY2Is9301xP1gWSwyqZnP9K/igZXU0L0srEzan3F5wqsxp3lHiiHXwvH5WdUq9JsRhWAQCkFOnvEOBejPhsVsPiMVoPdXJKp/6yxTTE45bw8ravlV/tl9NOpPWzenghvKG51Db3U0QYoFCTIXzu3sKVvxx7alv2PAvWTKG4wccvgyc3p0F54dg
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(7416014)(376014)(23010399003)(921020)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eephF62pJ9DHeqoxEsyR9q0gT5BjGlTnYo5cjgn44oW2YmsPf8Wp3DaIC/THg9jDFVnpxlFW9biqZwcn4TCQ0Wd02XKxcCrplmf88O4SX3MDoHvI/0+K9kYZfv228W6H/4QdTwsuHfJaXaMxXmP2iz/Zvp4U3aF7GjiVLu8OOYwwDJVdTh9+yeyfOncMc8q/1DYqvP7sOcVmNL3cQbdWNAooOs6VlsREM8J/3dDbGSfdKNZ3DHO5/ASCJJamdjhoYUhZVSces44qq2UuCexQe1hI/H0D1De6udgyMyNARACdO7XqWbw1UDMIi8hEuyUQ8sR1zNfS/0Ia+uUdUvXYeRF2RnZOjAMbr3qA6B/zcbmqmEpSuGL5WweFDxzaA0DtIJSbeQ+rv18JLdQMEbaPE2kcTp/cXhRC0uxF2XcwqL2/cuod7VXHMgB1LXy30P+O
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2026 03:24:34.7626
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e113c5a-3a44-4d33-932b-08df0bc65fe1
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB84.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI3PR06MB8609

Add the USB3 PHY node for the USB4/USB5 controllers on the CIX Sky1
SoC. Enable the PHY and both of its ports on the Radxa Orion O6
board.

Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts | 12 +++++++++
 arch/arm64/boot/dts/cix/sky1.dtsi         | 31 +++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
index e39c87774c12..b152942aaa60 100644
--- a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
+++ b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
@@ -117,3 +117,15 @@ &s5_gpio2 {
 &uart2 {
 	status = "okay";
 };
+
+&usb3_phy4 {
+	status = "okay";
+
+	usb-port@0 {
+		status = "okay";
+	};
+
+	usb-port@1 {
+		status = "okay";
+	};
+};
diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index a77c52296ebd..478c726fae96 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -6,6 +6,8 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/cix,sky1.h>
+#include <dt-bindings/phy/phy.h>
+#include <dt-bindings/reset/cix,sky1-s5-system-control.h>
 #include "sky1-power.h"
 
 / {
@@ -574,6 +576,35 @@ mbox_ap2sfh: mailbox@80a0000 {
 			cix,mbox-dir = "tx";
 		};
 
+		usb3_phy4: usb-phy@9210000 {
+			compatible = "cix,sky1-usb3-phy";
+			reg = <0x00 0x09210000 0x00 0x40000>;
+			#address-cells = <1>;
+			clocks = <&scmi_clk CLK_TREE_USB3A_PHY3_GATE>,
+			         <&scmi_clk CLK_TREE_USB3A_PHY_x2_REF>;
+			clock-names = "apb", "ref";
+			resets = <&s5_syscon SKY1_USBPHY_SS_RST_N>,
+			         <&s5_syscon SKY1_USBPHY_SS_PST_N>;
+			reset-names = "core", "apb";
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			usb3_phy4_0: usb-port@0 {
+				reg = <0>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
+
+			usb3_phy4_1: usb-port@1 {
+				reg = <1>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
+		};
+
 		pcie_x8_rc: pcie@a010000 {
 			compatible = "cix,sky1-pcie-host";
 			reg = <0x00 0x0a010000 0x00 0x10000>,
-- 
2.54.0

