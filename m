Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010043.outbound.protection.outlook.com [52.101.69.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D244387375;
	Mon, 14 Sep 2026 06:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789368875; cv=fail; b=dbIQuXjy/lruyiOedFEErZYt/Uh9YJN6zLWqfkRwsCcrOZjbsd4YVWvZWaQkK7R33n/v1Kc52yTLYqMXSXLzkKU7M/N6HxRQ+X9pDl+O+Vy4sGpH45e0SRqQOoMx4VwCVknQCDwhwi6zOq0Fh3I+9SAKJZ821dDNQlPd512eJ1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789368875; c=relaxed/simple;
	bh=nq5KLPdjWVecGh3+UD1pWdUjpULRszjkdfbhTYDr5NM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=FEgmZ+hKNMak/6r6++uBGeG+UWVyWRlp7UTe2Ld9PEDJQm6ua9sstwMEhCTFILvL4dPdk/OgY/WRTWiyRYCZlzdWsbjUerSfegTWTcweo0AB83vjs09HOc3Q4oaRd+ExzVwBCJo71dQbvICizp77VLAjBO2MU6k9PGIygKch3bM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=oDKv7lJ8; arc=fail smtp.client-ip=52.101.69.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="oDKv7lJ8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BwHO3b0zcbdrvn9lgjPbHIMbspjCM4/7xH+fddQ0wKQ8o8iZs2rB+pmbSWRTnDpzp1/NNUHeL8S3lBWaY0ZFtRh9ZmguP75OAx0baifLioqTN+7GGZL/9/VhB7GHZA71eEh1QH9jiFydQEDkZBPe6COkaWYsSMSJIQOK8h6Sh4jCWc5LZWTliS9F6IX8FusXXnUqm3eOabjlhx5IuKy/5x9uH/UTO9VIFbfZro7tpHvm2xsHwZfXdC3E/R+A636BHPrJKa3jsjnTbETw9V98e8L1WBw5JVa7IXqGbXycVVDND/CTz+yw57hrsQPVP2/5vtie+iexY8JOJaaRi725Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/toYHhxO/wcMjvjO9+8XfYH1TFzpnRzngtEFcVvPIps=;
 b=SqSAOy7tKwcg15BTH9tDne0CI05/GEshl917RWpfIhtigMPUlkEImAywX5djPrdg6SEB7ItSrEmGfSg+0sCNKU5t+gs/BEA218ayHeE4BeaUM+xAXnJ2mpmWRLee1wbvCjYfwaZSr4fMXQBt6Y8PXwA4OT9sSWp04vl/j2FwxJC/CqEHOPur1Z9ONqT0prl9rKGkIEq1Sd+dhf8BbbMDvvJc4KVz39ZLbtwstf01NaO14O/Kco5d7iPV9NCj6b1I5I9GBzTZ7pOZTX9XW8J7m+5pQ3nx7+oSObsKNJigJURQ9iRtViVW1AaoJAF5vZLH1WIKnUhsLVFurf2LMVYyVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/toYHhxO/wcMjvjO9+8XfYH1TFzpnRzngtEFcVvPIps=;
 b=oDKv7lJ82qGek1Z3VqZp7TnDp4hrSVbTzWpQEWp6sm01p0Bkkt80Dyqwc+vTmQNvqKMV7NgftretZKFL83WF34dzP5LK58U7MCduYliSicZAEjN2DeotZQEGzCE0SnggJ0ADfYDCGc7NM6WFe43GMzTlu9K9BfgSe0yi0f4OugzFrFkZEjurvZOGJgHRc/OAMwD1PIzHbE5uo1Mhq5/hC7KNeDtTjbuBbJ/vlXU7wPn5OTeZXXJf8G2rwdS2gspRMytDco9mQnDQ+VFi/HtMVsboCZ75iEW7sWx0x/JCDGlBFvw17F5utnyBfDM4VTJeW/veDOdQq/yM8uLh/QDLzQ==
Received: from VI1PR07CA0162.eurprd07.prod.outlook.com (2603:10a6:802:16::49)
 by PAVPR10MB7467.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2f6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 06:54:27 +0000
Received: from WA1PEPF000099CD.eurprd04.prod.outlook.com
 (2603:10a6:802:16:cafe::56) by VI1PR07CA0162.outlook.office365.com
 (2603:10a6:802:16::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.8 via Frontend Transport; Mon, 14
 Sep 2026 06:54:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 WA1PEPF000099CD.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 06:54:27 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 14 Sep
 2026 09:00:30 +0200
Received: from localhost (10.252.27.156) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 14 Sep
 2026 08:54:26 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 14 Sep 2026 08:54:17 +0200
Subject: [PATCH 1/4] arm64: dts: st: add imx335/csi/dcmipp nodes on
 stm32mp257f-dk
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260914-stm32mp2-dk-camera-v1-1-2f2bd719bb63@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: WA1PEPF000099CD:EE_|PAVPR10MB7467:EE_
X-MS-Office365-Filtering-Correlation-Id: 75ba0ed0-dc76-4747-368e-08df122d04ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|36860700016|376014|10067099003|3023799007|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	7cAkH6Gnz5ChMcCAQP3t7hMUWhzSsPaTyrWV2eA2UV3fDKHH+cPTx6SbvW5ZPuqoO2agXQQlf60Ny+wf3nGEQ5L8k9dcSaI/dLENfushny7VV2C+1i0rM0u87Az34HAOhKofbUAyFlBlXokvdUi6rUs2JsBX/q0A5FkN916od4V5NdHeaghON8lBxwED/56Jm4Jo/QrYWeniCZreS32RhY4CAckc7l3YGn580XW8LoLQYHkO+nQSq9V6hI157bYGbFM2JBweZtmogp5VHK6CgwaOCD1VRfQM4pkkNdN5yQ9ASpk6K+vljlVQIFOVRTfWEltDp74mQmaugUv4N1ZpbvOpOVfosvRQWDt+FiJyCPrD82eArvmD0f08Gy4YvhVzsHfqrhwH9MBaJ1TbCKCcaROc7+axi/B4ZXo0y3zuALLDNdVmve1+yTPxiuf74scYfw9Dp99epdhRvvxq/+4Nud6yGJqewyh8RcaEdkDKgJ/1/DuVUEjjiNKkeGApxxPgSl4oMhFu1TWNvKJfylO70pu0/PeQ6OpnvFo6L9A5dLZXQ2WCOOtN+wNscf4YjGGfaWaXO74Cbjhu9ldVOsL6BhIx4FOKIpNo0ZKPCvYmp/SbD2onAsEwsKAh8nMOA60Zfw34M5ObJ574rWEwQuVUL6d2/W2UjM6iCcd8NRezo7h4eQrslCm101vibn0L5+eJ563IZd8BooHPtx9YLyhQ/w==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(376014)(10067099003)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LI5lC5ByQiHD2gAEn72JSmju3geuuh6xJRtEhKN0QRYDHPIOOguQ0jogH2cwcS1fj+C+neKlSCtj+8IyU5GL6vYvgpI8ajQFK29JcvA1V9wmG+YNyXRGsz0xLVR36UYhrIk9gu7nFyTRQYcT8jOXsNAfS+CymwKOytXowib66V1NCAmlHfgLn55rS/3AWh3qkbWnVennTNJUo5+AQQu3MKdiDRx9Gs0YoIpTwbzR8Pze7GBkkC2HrRyOdAHzcR+fM5VGb+ARFvuVLFcIrW4B1NY/lgXxkop8xE1Gk1orw0isGdpCQd9sNSPVKMji6Ix2EAB1VoBOsHmSMKqscqfCsA+hFiHAwEWOGMBIHV2Qmx6GhWeWcWAJuFWw3UBp56GNOOO1wRZn65x9A7oO0QbfUdUkOoX81YTOijfASC2gwb480rPcPfkJZOcFr39E5A9X
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 06:54:27.0988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75ba0ed0-dc76-4747-368e-08df122d04ba
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	WA1PEPF000099CD.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7467

Add all nodes necessary for the imx335 camera capture via csi / dcmipp
on stm32mp257f discovery board.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts | 74 +++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
index 8daf3dfd5133..39ad23d95069 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
@@ -9,6 +9,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include "stm32mp257.dtsi"
 #include "stm32mp25xf.dtsi"
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
 
@@ -138,6 +147,42 @@ &arm_wdt {
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
@@ -160,6 +205,16 @@ phy1_eth1: ethernet-phy@1 {
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
@@ -172,6 +227,25 @@ &i2c2 {
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

