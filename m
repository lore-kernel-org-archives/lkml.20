Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011034.outbound.protection.outlook.com [52.101.65.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761C8386C3D;
	Mon, 14 Sep 2026 06:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789368880; cv=fail; b=AwGoBeshbd4UWImS1KGl+rgB457AhWbMttP5tKniGqqSA7Y61XaKi/hv4/ggcMgBO2Y0o7t5FiT3Ob91gN82rHMJMqkIXAQuC+uhNgfuPnZ5jKJ2lT1yl8WPw/ckf0xnvXpJkiRpRbm5UCxV+5/oZ4qPssbdv5Ks1qZkTnNPJWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789368880; c=relaxed/simple;
	bh=YFzjsXpDfe2YO1kVfGevYc0JF+G1cv4bPWS5LIWDY+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=lEDlmq9CYNPSh2R2YA9T2AvEtPsfNT9leaiUYbe96ABFnp/YSVZU6snpDZr0MgFyJ7qpS12WiLrywMJB808RLBrTVxpb6AueHAmS6IDTyW0ECw5aqLrQzNp3zuUpCW5HBVHo6cIC2waPbvQQNev5ssOobrtqum+QbZjqnbG51M4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ej5QxrT9; arc=fail smtp.client-ip=52.101.65.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ej5QxrT9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uQHSWGg7MUqHDLR9RtEqcJuSKFuuP/Jo1tkhXM3To3eU+FLJImLcKy38xhWJ0wFJQTzTlfFe+Qi7XXJOhFL29Hs0JsbLtaEGY9PY/htOMMu0Vw3nu8O5+T9wxdjmUwDGm3LNp3tdhhq70g0wTto9ye/K/JiOROnOK81BN1o9qkAXdhVVVTcLTvwAAgp90Dcqumb00vjMcRv952c4Y/BLCAb4Z9IlPvif5o71IELjbrh1e7Mw4GRffMF8052b2ddOItE0IZtsZkDTX5vQoQgrlqrnyC5kPP2XG+4rQrXLwE6yuOG5cfw/AR5u9JdeBVfd9WdY6k7aMh4maY34htF6Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJ4jtc2VAQ0JbVUWJ60zgba5PyV/wYm2KLaYB+2nP6w=;
 b=BWXLoJc8BiDTASn/ib1w7vg5pGbYK+0X4bCoR7GyIRRsWaTc112g2FehbEp1l3alaEW13pXY0wms4q3tTNxhJtVss6nT3wdYizG5/OIHdYVSvq0udEVq26DrvgKoVRMNQmqdUyFxsp0WIYEkQTIs+Ob2LoT4J0v8ms4oEf4967udw9/zMjsnttntPQ6C/f9RB/Aaa60p2dL90fc00BXVY7Ozw/LXVvQzpQTojeiniGtlgM4J/OJxQVzYJnHMlZmKz2O4dRBLhhT/Sz3kzGQiUWlYhO2jkXgzqAr/2A1iyZaSJjaO+XKWtSYbuOeqmdL4j9R/E8UVZmiX4fDacQzW1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJ4jtc2VAQ0JbVUWJ60zgba5PyV/wYm2KLaYB+2nP6w=;
 b=ej5QxrT90acV28gCBWCc31JlbC/GE+W8505SHJ6n0Zg2iVZ2f/uV5B3zaYndslQZM1HQ8szRl9FucommNVQSdpS2HH/wF5kBaz/XBez7hKxH+UNlCS4TjEuRl/0L1M1j3P4rplwCfK0GnqbhZDKM2uSOayz5Puch7fZcdMk9Bb1SvWVqYcRdhepBo1ViWAnbZmyep0FBgublnx3LrCNbC1RZhDY7PTCWIJtmUu+dJWdfonOBbp5XaPT0rFZnT4IwK6F7hbeovnxaHbs2w1fdbke4yq11/4E42jwm783He531T0KTsqV1GkVAi9JRtVP8q+AD5bzeJktKuyhnVcEl1A==
Received: from AS4P195CA0041.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::13)
 by PA2PR10MB9146.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:426::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 06:54:30 +0000
Received: from AM2PEPF00070CF3.eurprd02.prod.outlook.com
 (2603:10a6:20b:65a:cafe::76) by AS4P195CA0041.outlook.office365.com
 (2603:10a6:20b:65a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 06:54:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM2PEPF00070CF3.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 06:54:30 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 14 Sep
 2026 08:59:59 +0200
Received: from localhost (10.252.27.156) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 14 Sep
 2026 08:54:29 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 14 Sep 2026 08:54:20 +0200
Subject: [PATCH 4/4] arm64: dts: st: add imx335/csi/dcmipp nodes on
 stm32mp235f-dk
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260914-stm32mp2-dk-camera-v1-4-2f2bd719bb63@foss.st.com>
References: <20260914-stm32mp2-dk-camera-v1-0-2f2bd719bb63@foss.st.com>
In-Reply-To: <20260914-stm32mp2-dk-camera-v1-0-2f2bd719bb63@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Alain Volmat" <alain.volmat@foss.st.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF00070CF3:EE_|PA2PR10MB9146:EE_
X-MS-Office365-Filtering-Correlation-Id: 01abdef2-e2d0-49e2-7b55-08df122d06b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|22082099003|18002099003|3023799007|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	kGMCIuF2u8MaHO2qgo1Fo267k4jYQ6AlepLznuy02JN1qliepCma9ES1ARNsqVGER+EJ97vXi631wKtZnQ4ETWCmfstLmEAV4U7gR9oWQ91U7xMicqmV+p2Iz4ByCukketX7Y94eNYXbbcEocb4o8OmCEFR16H8jSp2y0z7dytwNrQEaoVtUFPrEyNTaO3AiOTPpOlq6TFswLUcSalVVsvG41PEj8s2xO+7K/ko3Ke4qfyOw1dZ12FXFLOav8vIc4yEffFRTZVxeoJSSwnRCTl8lDuCPAFvXugiMKDdfzSOopWLwLYbqxGg9C2TANkZFuV9dZjljXDdGPNzWof9DCHTIn+ygeiMe5GoR9rEeKEcQri/XjRgjirI5OECc/Ws5/qcysBGYR+kjG7tzQG4R/L7zgFsFjWTzZNsF8h/pRRdsDGtMn/dSXB/Q/M1gWaMs3qHKJ64YVXbu7m3wgzyZkf72jOqNB/PuwtLBvQGdqFuPQgUPIFJ5kb8XC2QAdH6fG8Rg3NPcP/SyJf49ILKAbdjgTrP+K8XKTX4DVJxWgy0HR47sr0gR6unHMVOgJIqFoHkhfWHF63RQifcdj+thYiv0UGFd6ESEFxsv5YoM/VqDELeZFrJnzKfT4FpUbW8ttuRK010ABkmlhquRXsQ3+eywta00n6vdctwc4VKaU+v+KRj/QL4MjUylKkRnrIkSnXaAFYzGdatdCpTWfP/dpA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(22082099003)(18002099003)(3023799007)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JxyONiVsJi3xh3ySQI3zE4QeLTEFFXLhW7TCAjVo8AskvhoMS8Lz6uCR9FDSo6/fkRJTVuSc6xkGWSnKqDZwjTwEePEIURF8O3sMOQiDpT36QkahAWJH1p0zyM25j/V0A/WMhMXB5mC+6MVll4z9O0lVKVKnYzH8fxUEQ5iN6uGojx7gFdiFYklIHp/bWT8vFfZIlNhQ+e/fYvueUM3m+/CmNPk662uKDLd0Lvma98V3rB6HwUAM7urFuvEL6/RrUq/dmcKRxoO5NdW5nAg9OnVfYIA2MYBNKj3w9NThGnRLPxgNpcWZsYUmcHOVRLp/gSbF0r29lNfs6DRk19JyQmxRJT3KJfi/971KU+nSXUcgFqM1YtFsJL6bpIPKf6S0+6A7Yf9LZk2KnSFx/lrZTZumqWdKjCQnM2+51AaDGpXYC8BoDDnnheqIC3m7kI9F
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 06:54:30.4458
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01abdef2-e2d0-49e2-7b55-08df122d06b5
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF00070CF3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB9146

Add all nodes necessary for the imx335 camera capture via csi / dcmipp
on stm32mp235f discovery board.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp235f-dk.dts | 75 +++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp235f-dk.dts b/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
index dd4efbe5a46e..f06b334dc9ce 100644
--- a/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
@@ -9,6 +9,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include "stm32mp235.dtsi"
 #include "stm32mp23xf.dtsi"
 #include "stm32mp25-pinctrl.dtsi"
@@ -27,6 +28,14 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	clocks {
+		clk_ext_camera: clk-ext-camera {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <24000000>;
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -131,6 +140,42 @@ &arm_wdt {
 	status = "okay";
 };
 
+&csi {
+	vdd-supply =  <&scmi_vddcore>;
+	vdda18-supply = <&scmi_v1v8>;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@0 {
+			reg = <0>;
+			csi_sink: endpoint {
+				remote-endpoint = <&imx335_ep>;
+				data-lanes = <1 2>;
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+			};
+		};
+		port@1 {
+			reg = <1>;
+			csi_source: endpoint {
+				remote-endpoint = <&dcmipp_0>;
+			};
+		};
+	};
+};
+
+&dcmipp {
+	status = "okay";
+
+	port {
+		dcmipp_0: endpoint {
+			remote-endpoint = <&csi_source>;
+			bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+		};
+	};
+};
+
 &ethernet1 {
 	pinctrl-0 = <&eth1_rgmii_pins_b>;
 	pinctrl-1 = <&eth1_rgmii_sleep_pins_b>;
@@ -153,6 +198,16 @@ phy1_eth1: ethernet-phy@1 {
 	};
 };
 
+&gpiob {
+	/* Enable the IMX335 power line */
+	imx335-en-hog {
+		gpio-hog;
+		gpios = <11 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "imx335_en";
+	};
+};
+
 &i2c2 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&i2c2_pins_b>;
@@ -165,6 +220,26 @@ &i2c2 {
 	/delete-property/dmas;
 	/delete-property/dma-names;
 
+	imx335: camera@1a {
+		compatible = "sony,imx335";
+		reg = <0x1a>;
+		clocks = <&clk_ext_camera>;
+		avdd-supply = <&scmi_v3v3>;
+		ovdd-supply = <&scmi_v3v3>;
+		dvdd-supply = <&scmi_v3v3>;
+		reset-gpios = <&gpiob 1 (GPIO_ACTIVE_LOW | GPIO_PUSH_PULL)>;
+		status = "okay";
+
+		port {
+			imx335_ep: endpoint {
+				remote-endpoint = <&csi_sink>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <594000000>;
+			};
+		};
+	};
+
 	ili2511: ili2511@41 {
 		compatible = "ilitek,ili251x";
 		reg = <0x41>;

-- 
2.34.1

