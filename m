Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793800952;
	b=FGWUhgq/Gmgw3iJ/7DnvoR0IS0APK+tVzoBAI6lu2Z4O1VllBQOJvZ9eO9EBtl3fQYmV
	 4FZjf77YuzEn50QKGwKwkvUARZjLPXrbF3k+uur0B36b6xVIr12lAJO5o6bH8to72ebLS
	 7AT2KY4xrm9uMytdCHe/K7PbL4+cHhBqIC1mUmavWpR8ai4u/xH+eWTe7Hd7YnycqgWpq
	 GiYTuMjrtAAkfLvLkcRhYtleOx1f9ohHzy++WdLwDnLIJBnAqOCnW5GJJAHSWI5821j12
	 QMi6+OTYxO6OnJEyKbmd69J97bREo/4a/puNxLJZmev0spnoQ5KQvthj8g9IwhuttyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800952;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
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
	bh=t4+n3hfPgREeaA9WBf2sjEzFj6S7uT+Cc5GFeA11fDE=;
	b=tFmHz3nVdquaH2JGFlU9bdqMQxcLuJGMqHp22Y4iScyEgoF56C5OoLgs3L2VXpR1yaQ2
	 ggTF9YN1p1Aeu2o+xV+RuTcmpwJD7kvYwbKKLbmZ9HrOPKkCOwutE6kfK1p3odJEEcx4q
	 fGoAuaKmexiaKK3xfWeHXMG//ZEcXtQfPBfvo3BbcS2rVPJZHHiiqOw22sVGMu9RyzMWp
	 S3DO9FYHIBMrZMGZf5VQCjgrzHABgwvj1cIXP2Vo9cLRR24y6QjXfR9FFFAn4D3pa1GZ+
	 th77RLo6igo7ee1wCQM7J7f5bUIzPA4T7smIOnYolTcUKWa+3ue53xy6AW5ry5cIa1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=JC1CNcEf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.27
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013027.outbound.protection.outlook.com [40.107.159.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BF1606A32C;
	Wed,  4 Nov 2026 14:02:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2BF1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=JC1CNcEf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JWFAcMfB9e3qBWqhIoPlF5+wbsvLNA/lxXnQmdxNRXTb8bqk0ZENzWqpRHRz+nmXCjBSic3Ut3Hf7xMPlQ+ytzmZHT95UVh0zNr5QgPkPaOpNb9zQrBaO2zvKDDWjPibPJ7BTWB0XSIa+fBa3Osx5IIf8seXnq9wsIcHpHZrgNeIYzQ3tNlBpepD/aMK6t8qC0L3XnJjwl9QPqPO5hWMhLFDhu4fm9quNIfCXgiWBJF7/kWBqcbfhszd8nGHXR7eJ+BCFqlMfjD9vG/qHW7uEZU27bCqf2/7Fua6d2utwGE64frhH6X5PyxwgdLBTAm0KgGwhiyrZWUknhbZG4VEGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4+n3hfPgREeaA9WBf2sjEzFj6S7uT+Cc5GFeA11fDE=;
 b=JuMfpgGc7NtGYM0SCW7+9q9EnwZ7mqulOcrF6jFiacp1dX+DZGzrlNupm8gAHLuOqKXigWWa584gVsTH5UClBql0YITwJfcrKQvTi7R79nTNalJ+CXoWueNYb+of2lyvJy7dIwAGau2iXwnPE2BCoue5bVgROl0NeZrnPpY+xoAA0Mpm/KWqvOjQWU5ejHl9p6QWJqDO5AnibGpCC8n+gGufu/ViIRMkbDTYaGrBrfHsanxgrt3Wg/7wyvLnEDrlyLTfE4uedmz78iWlniKHke8vqkQxrFLT8/yOuinofTim1In3MFoV+jlQpv6FDPjoS0GQO5ujh5Xcvy1vBQ5v6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4+n3hfPgREeaA9WBf2sjEzFj6S7uT+Cc5GFeA11fDE=;
 b=JC1CNcEf7g17MfDSWOzpLtRb2SvZAf7ZhHtlLyL0PFUhlfZdlxQuPRGrKqq/ZwmA1erLkLV55bWbq60jOYUHNMjSObAanKr65RGUCVMHnkmN12bZ8vUhih9614X6i4HsRQHoX/INqT0u+mz4x1+q6D6vAOrUSh0K0XgVevqyb+pt3/7wDEZuZsH15YfL4yjg3I7vEPIeYvsQSInudksQc8p3KXQETcdXajPbIvgv/7L8tDF50j0L7yd+Hjdyn0uQq46NIIuS7ZpVfqhwEbNq2/stx9gBfXUFPBAqFSjGzfWTrb7xEelhr+q3PKGxwTjUD69DLhazjFNiHsz2YbO2qg==
Received: from MI1P293CA0023.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:3::9) by
 GV1PR10MB334055.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:801::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 14:02:25 +0000
Received: from MI3PEPF0000848B.eurprd02.prod.outlook.com
 (2603:10a6:290:3:cafe::b) by MI1P293CA0023.outlook.office365.com
 (2603:10a6:290:3::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 14:02:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF0000848B.mail.protection.outlook.com (10.167.240.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 14:02:25 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 4 Nov
 2026 15:03:09 +0100
Received: from localhost (10.48.87.100) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 4 Nov
 2026 15:02:23 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>, Patrick Delaunay
	<patrick.delaunay@foss.st.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/7] arm64: dts: st: add D1 domain for STM32MP25 family
Date: Wed, 4 Nov 2026 14:55:07 +0100
Message-ID: <20261104145502.4.I1233f0c68bba42732eb6dc470b5eebaf6db441a7@changeid>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104135604.907283-1-patrick.delaunay@foss.st.com>
References: <20261104135604.907283-1-patrick.delaunay@foss.st.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000848B:EE_|GV1PR10MB334055:EE_
X-MS-Office365-Filtering-Correlation-Id: 54c63b69-4df2-494b-2dca-08df3a7c4134
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|10067099003|18002099003|22082099003|56012099006|11063799006|261022105027099003|261028144727099003|261026140227099003|261102123227099003|261026121527099003|261021121427099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	g1eyLmW0dwC2gZU7BQbznxF3UExQXq6Cw+lHI72t+XcqUVi7bFhhukxxpyFkf8BjdcLbxwUz8dJvokIMQ8OOfw5FITG4ky70fo3SsCKkmVXuMNgthHRKLwJyPpnJC83eDZnrzezKnfX/xDW2PiFBjQTDyOx8/6h0bm8pS0s9FByP6eJLjgm9oK1GL8EA6G2rzd4/jDf+Mt6fDD2yYySt79olYrQhv691T8ARbLyavoVLjWTxLDOdctTO0HCVtRDaubRu6wfjHItd4O+4ojkXVeQP+IkKBOmp7JPvjm/p4e5J/jMm4AUNhoWA+0F7D3XaM3TyCIeaDF1EQo7PF3cAKd09uXFtvUqH0pZJDYCPCaX2/hb+3tRfUEFyNFasmXQ1rTSvH4PBIGFpLOcKO/uDLYaCaiPmVDS1kW8xPwgvZpxLD4IHDw4ypevcca4YbIgfQOFhtXdtHwmaeq5WjehpRhVRkuFoqO/SfkmJp8f4WN6ifnLIS9dssavrW9fM/ZpK6S5SgCe6/juuQf3Pw1UUQxAUsf09jL7X5Pyf5y1JDeZv1DuAjrEDkTbQjIqvNZiWJ0pUVKg2MB+cte9yGjKHabLqhEe0W5KQ0eQVoTL+sFkqsH7DaVpg/WIVjxrfQ6Sy7lnheCtmLcHH4hn+XVnbYhVUoKPX8i1SFO37Lmke1HJwWYbCvCx7B3U/anHUN9RjQUvaW3yhfv1bPFPp5BPC3g==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(261022105027099003)(261028144727099003)(261026140227099003)(261102123227099003)(261026121527099003)(261021121427099003)(261021123027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LPI2W6+CIyChVUNTzMaQBTtcZTXE12OU9rcko47ZjIVRgTSgodXaD5xteQ34GvqeNCxl1wwQEWCUJm646n7uPOVEC1nL/yrMzO3W0D8gxSgV9c2ERWGHA9vGk33RHj4K/+hDJ6O0olXLVu9UThKmujrfP1gmYj7l7umewKLTV9WbwhDYjo1nDtpgvJTebUHrM+488QMH1rsLms81thSAWd+2VXpDwRS4ab8aC7ZD6YL0YGU3HoxarGIexLaMPK9NANrqz2Fi7TDEcw8VjgQ37Z5wniRdDDh7aGfS4AtTFpY7K5pSA1RNCgfvqzlKTSHIQX9eGhNKe8MnXizFTUzbya417wmnaI1VUPz++fWw6OokjTapRQ+Ul8uLtjvKvcyouiXmaly1lcv3I6+MCdbxZo573rGMyeBTcPvSdEtjFjbiNS0VXQKqHS+UN5Hjsz/7
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 14:02:25.3851
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54c63b69-4df2-494b-2dca-08df3a7c4134
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF0000848B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB334055

Add the D1 power domain for devices that require the Cortex-A35
cluster to remain in Run1. Keep S2Idle wake-up handling on the
EXTI1/RET_PD path.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 110 +++++++++++++++----------
 arch/arm64/boot/dts/st/stm32mp253.dtsi |   3 +-
 arch/arm64/boot/dts/st/stm32mp255.dtsi |   2 +-
 3 files changed, 69 insertions(+), 46 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index bf1542818be2..d5204d88344f 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -152,6 +152,12 @@ v2m0: v2m@48090000 {
 		};
 	};
 
+	d1_pd: power-domain-d1 {
+		compatible = "st,stm32mp-pm-domain";
+		#power-domain-cells = <0>;
+		power-domains = <&CLUSTER_PD>;
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
@@ -209,6 +215,7 @@ hpdma: dma-controller@40400000 {
 				     <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&scmi_clk CK_SCMI_HPDMA1>;
+			power-domains = <&RET_PD>;
 			#dma-cells = <3>;
 		};
 
@@ -232,6 +239,7 @@ hpdma2: dma-controller@40410000 {
 				     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&scmi_clk CK_SCMI_HPDMA2>;
+			power-domains = <&RET_PD>;
 			#dma-cells = <3>;
 		};
 
@@ -255,6 +263,7 @@ hpdma3: dma-controller@40420000 {
 				     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&scmi_clk CK_SCMI_HPDMA3>;
+			power-domains = <&RET_PD>;
 			#dma-cells = <3>;
 		};
 
@@ -273,7 +282,7 @@ ommanager: ommanager@40500000 {
 				 <&scmi_reset RST_SCMI_OSPI2>;
 			reset-names = "omm", "ospi1", "ospi2";
 			access-controllers = <&rifsc 111>;
-			power-domains = <&CLUSTER_PD>;
+			power-domains = <&d1_pd>;
 			#address-cells = <2>;
 			#size-cells = <1>;
 			st,syscfg-amcr = <&syscfg 0x2c00 0x7>;
@@ -290,7 +299,7 @@ ospi1: spi@0 {
 				resets = <&scmi_reset RST_SCMI_OSPI1>,
 					 <&scmi_reset RST_SCMI_OSPI1DLL>;
 				access-controllers = <&rifsc 74>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				st,syscfg-dlyb = <&syscfg 0x1000>;
 				status = "disabled";
 			};
@@ -306,7 +315,7 @@ ospi2: spi@1 {
 				resets = <&scmi_reset RST_SCMI_OSPI2>,
 					 <&scmi_reset RST_SCMI_OSPI2DLL>;
 				access-controllers = <&rifsc 75>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				st,syscfg-dlyb = <&syscfg 0x1400>;
 				status = "disabled";
 			};
@@ -330,7 +339,7 @@ timers2: timer@40000000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				access-controllers = <&rifsc 1>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 
 				counter {
@@ -361,7 +370,7 @@ timers3: timer@40010000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				access-controllers = <&rifsc 2>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 
 				counter {
@@ -392,7 +401,7 @@ timers4: timer@40020000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				access-controllers = <&rifsc 3>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 
 				counter {
@@ -423,7 +432,7 @@ timers5: timer@40030000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				access-controllers = <&rifsc 4>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 
 				counter {
@@ -454,7 +463,7 @@ timers6: timer@40040000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				access-controllers = <&rifsc 5>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 
 				counter {
@@ -479,7 +488,7 @@ timers7: timer@40050000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				access-controllers = <&rifsc 6>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 
 				counter {
@@ -504,7 +513,7 @@ timers12: timer@40060000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				access-controllers = <&rifsc 10>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 
 				counter {
@@ -535,7 +544,7 @@ timers13: timer@40070000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				access-controllers = <&rifsc 11>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 
 				counter {
@@ -566,7 +575,7 @@ timers14: timer@40080000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				access-controllers = <&rifsc 12>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 
 				counter {
@@ -686,7 +695,7 @@ spi2: spi@400b0000 {
 				       <&hpdma 52 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 23>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -717,7 +726,7 @@ spi3: spi@400c0000 {
 				       <&hpdma 54 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 24>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -744,6 +753,7 @@ usart2: serial@400e0000 {
 				       <&hpdma 12 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 32>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -756,6 +766,7 @@ usart3: serial@400f0000 {
 				       <&hpdma 14 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 33>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -768,6 +779,7 @@ uart4: serial@40100000 {
 				       <&hpdma 16 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 34>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -780,6 +792,7 @@ uart5: serial@40110000 {
 				       <&hpdma 18 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 35>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -796,7 +809,7 @@ i2c1: i2c@40120000 {
 				       <&hpdma 28 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 41>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				i2c-analog-filter;
 				wakeup-source;
 				status = "disabled";
@@ -815,7 +828,7 @@ i2c2: i2c@40130000 {
 				       <&hpdma 31 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 42>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				i2c-analog-filter;
 				wakeup-source;
 				status = "disabled";
@@ -834,7 +847,7 @@ i2c3: i2c@40140000 {
 				       <&hpdma 34 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 43>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				i2c-analog-filter;
 				wakeup-source;
 				status = "disabled";
@@ -853,7 +866,7 @@ i2c4: i2c@40150000 {
 				       <&hpdma 37 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 44>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				i2c-analog-filter;
 				wakeup-source;
 				status = "disabled";
@@ -872,7 +885,7 @@ i2c5: i2c@40160000 {
 				       <&hpdma 40 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 45>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				i2c-analog-filter;
 				wakeup-source;
 				status = "disabled";
@@ -891,7 +904,7 @@ i2c6: i2c@40170000 {
 				       <&hpdma 43 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 46>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				i2c-analog-filter;
 				wakeup-source;
 				status = "disabled";
@@ -910,7 +923,7 @@ i2c7: i2c@40180000 {
 				       <&hpdma 46 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 47>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				i2c-analog-filter;
 				wakeup-source;
 				status = "disabled";
@@ -926,7 +939,7 @@ timers10: timer@401c0000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				access-controllers = <&rifsc 8>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 
 				counter {
@@ -957,7 +970,7 @@ timers11: timer@401d0000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				access-controllers = <&rifsc 9>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 
 				counter {
@@ -991,7 +1004,7 @@ timers1: timer@40200000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				access-controllers = <&rifsc 0>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 
 				counter {
@@ -1025,7 +1038,7 @@ timers8: timer@40210000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				access-controllers = <&rifsc 7>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 
 				counter {
@@ -1055,6 +1068,7 @@ usart6: serial@40220000 {
 				       <&hpdma 20 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 36>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -1085,7 +1099,7 @@ spi1: spi@40230000 {
 				       <&hpdma 50 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 22>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -1101,7 +1115,7 @@ spi4: spi@40240000 {
 				       <&hpdma 56 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 25>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -1115,7 +1129,7 @@ timers15: timer@40250000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				access-controllers = <&rifsc 13>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 
 				counter {
@@ -1146,7 +1160,7 @@ timers16: timer@40260000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				access-controllers = <&rifsc 14>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 
 				counter {
@@ -1177,7 +1191,7 @@ timers17: timer@40270000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				access-controllers = <&rifsc 15>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 
 				counter {
@@ -1210,7 +1224,7 @@ spi5: spi@40280000 {
 				       <&hpdma 58 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 26>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -1325,6 +1339,7 @@ uart9: serial@402c0000 {
 				       <&hpdma 26 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 39>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -1341,7 +1356,7 @@ timers20: timer@40320000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				access-controllers = <&rifsc 16>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 
 				counter {
@@ -1371,6 +1386,7 @@ usart1: serial@40330000 {
 				       <&hpdma 10 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 31>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -1420,7 +1436,7 @@ spi6: spi@40350000 {
 				       <&hpdma 60 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 27>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -1436,7 +1452,7 @@ spi7: spi@40360000 {
 				       <&hpdma 62 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 28>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -1449,6 +1465,7 @@ uart7: serial@40370000 {
 				       <&hpdma 22 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 37>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -1461,6 +1478,7 @@ uart8: serial@40380000 {
 				       <&hpdma 24 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 38>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -1474,7 +1492,7 @@ dcmi: dcmi@404a0000 {
 				dmas = <&hpdma 137 0x60 0x00003012>;
 				dma-names = "tx";
 				access-controllers = <&rifsc 88>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -1500,7 +1518,7 @@ spi8: spi@46020000 {
 				       <&hpdma 172 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 29>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -1517,7 +1535,7 @@ i2c8: i2c@46040000 {
 				       <&hpdma 169 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 48>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				i2c-analog-filter;
 				wakeup-source;
 				status = "disabled";
@@ -1649,7 +1667,7 @@ csi: csi@48020000 {
 					 <&rcc CK_KER_CSIPHY>;
 				clock-names = "pclk", "txesc", "csi2phy";
 				access-controllers = <&rifsc 86>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -1661,7 +1679,7 @@ dcmipp: dcmipp@48030000 {
 				clocks = <&rcc CK_BUS_DCMIPP>, <&rcc CK_KER_CSI>;
 				clock-names = "kclk", "mclk";
 				access-controllers = <&rifsc 87>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -1674,7 +1692,7 @@ combophy: phy@480c0000 {
 				resets = <&rcc USB3PCIEPHY_R>;
 				reset-names = "phy";
 				access-controllers = <&rifsc 67>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				wakeup-source;
 				interrupts-extended = <&exti1 45 IRQ_TYPE_EDGE_FALLING>;
 				status = "disabled";
@@ -1692,7 +1710,7 @@ sdmmc1: mmc@48220000 {
 				cap-mmc-highspeed;
 				max-frequency = <120000000>;
 				access-controllers = <&rifsc 76>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -1708,7 +1726,7 @@ sdmmc2: mmc@48230000 {
 				cap-mmc-highspeed;
 				max-frequency = <166000000>;
 				access-controllers = <&rifsc 77>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -1724,6 +1742,7 @@ sdmmc3: mmc@48240000 {
 				cap-mmc-highspeed;
 				max-frequency = <166000000>;
 				access-controllers = <&rifsc 78>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -1753,6 +1772,7 @@ ethernet1: ethernet@482c0000 {
 				snps,tso;
 				st,syscon = <&syscfg 0x3000>;
 				access-controllers = <&rifsc 60>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 
 				mtl_rx_setup_1: rx-queues-config {
@@ -1784,6 +1804,7 @@ usbh_ohci: usb@482e0000 {
 				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&usb2_phy1>;
 				phy-names = "usb";
+				power-domains = <&d1_pd>;
 				resets = <&rcc USBH_R>;
 				status = "disabled";
 			};
@@ -1797,6 +1818,7 @@ usbh_ehci: usb@482f0000 {
 				interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&usb2_phy1>;
 				phy-names = "usb";
+				power-domains = <&d1_pd>;
 				resets = <&rcc USBH_R>;
 				status = "disabled";
 			};
@@ -1828,7 +1850,7 @@ pcie_ep: pcie-ep@48400000 {
 				resets = <&rcc PCIE_R>;
 				phys = <&combophy PHY_TYPE_PCIE>;
 				access-controllers = <&rifsc 68>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 			};
 
@@ -1854,7 +1876,7 @@ pcie_rc: pcie@48400000 {
 				resets = <&rcc PCIE_R>;
 				msi-parent = <&v2m0>;
 				access-controllers = <&rifsc 68>;
-				power-domains = <&CLUSTER_PD>;
+				power-domains = <&d1_pd>;
 				status = "disabled";
 
 				pcie@0,0 {
diff --git a/arch/arm64/boot/dts/st/stm32mp253.dtsi b/arch/arm64/boot/dts/st/stm32mp253.dtsi
index 19b3e55a4414..8562f13e5284 100644
--- a/arch/arm64/boot/dts/st/stm32mp253.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp253.dtsi
@@ -56,7 +56,7 @@ m_can1: can@402d0000 {
 		resets = <&rcc FDCAN_R>;
 		bosch,mram-cfg = <0x0 0 0 32 0 0 2 2>;
 		access-controllers = <&rifsc 56>;
-		power-domains = <&CLUSTER_PD>;
+		power-domains = <&d1_pd>;
 		status = "disabled";
 	};
 
@@ -86,6 +86,7 @@ ethernet2: ethernet@482d0000 {
 		snps,tso;
 		st,syscon = <&syscfg 0x3400>;
 		access-controllers = <&rifsc 61>;
+		power-domains = <&d1_pd>;
 		status = "disabled";
 
 		mtl_rx_setup_2: rx-queues-config {
diff --git a/arch/arm64/boot/dts/st/stm32mp255.dtsi b/arch/arm64/boot/dts/st/stm32mp255.dtsi
index 7a598f53a2a0..003024eb2fc7 100644
--- a/arch/arm64/boot/dts/st/stm32mp255.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp255.dtsi
@@ -20,7 +20,7 @@ lvds: lvds@48060000 {
 		clock-names = "pclk", "ref";
 		resets = <&rcc LVDS_R>;
 		access-controllers = <&rifsc 84>;
-		power-domains = <&CLUSTER_PD>;
+		power-domains = <&d1_pd>;
 		status = "disabled";
 	};
 
-- 
2.43.0

