Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013017.outbound.protection.outlook.com [52.101.72.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFD4389452;
	Mon, 14 Sep 2026 06:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789368874; cv=fail; b=lBPAbsRqc3twcpnfD6ZoH6zYrvW13A5KkJiQXOlmn1QIg15cK7uRLJFbAJFInbNjZbVbTIUTfLXRP0cigIszShIuuJ4vjZYjtyvo3MocZbqmzERmVwe1gAiEm2NVByU1qahjvD9SXctPD+GhMGAHTDn7nbSvA3KtGwqAh+/29nI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789368874; c=relaxed/simple;
	bh=WuewgmQUnC5tIclyo0sQ01g5C5XgDvHOCz83jR6BCks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=MzrTaG2mF6pxuXHUKuYbF1nzSQYWb0aCVhPivj2ZTiFHWEkk+e9AtCVMGf95DVfXvFEPTYlScTlLxAB82lyZXZ87VuJXXZ7CLgQXd2Tpg2POQjE2d5RRPUmdrsP6etGOF1ySHv9o7OhNnwkCqDjgZF6vIjT6tutYNcJhHdV1TwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Y9PF+jLD; arc=fail smtp.client-ip=52.101.72.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Y9PF+jLD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chviuV3DHcu0ZL+lt+64voZSsotZM4k8vHg9jQ3DpF+pB39IIq3gmutEI7OSbkSjT3lmcVQ1XD39mgIH15Xhc4BNBg9Vl87Iy+h0B9S0P8LrwtVDo+rNb71EqUDAxLVw0YV1hAg7S4/yMxGXoSqSN1T5XirnBDP/54TSuUdZoqTJPbmaJl2/wuOnX+YTCXlUY1HmXUFHZnx1bVLi/POjAVtSrQAWHmL3Za9ssDSx0+YNksCw5qjk9h9NNPAXSB+jBwmKgNBTV7XtbJ9qYxZfIjlj6jlo9MyGMVfOcfvFK0K3OndFu1ay9vg+T+e3xaAbPAxzA2J7Mqfy/yFFsj2gyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bgggxyqn6FwapD1ha0t9sN2E4jvprJKAahiU60nLmkA=;
 b=hSxr94PYr3Qqql184Yriebp5SX3LIxnAYCWwkpHtyoHDO15hxjxOtKkbDV9TdXcJ2WsPWBrWldjr8RyxLIX60odF134oyTi+PPoUxM/VNPty6Lf2yKhRdeioeyrAAwX1rxdmW23CjAk86HQl813xULzg4QehdFMe6uzQ/pBe6mR3pY27+fAPld2h+1XxfrW6GHJehbQtVbnVYvAWokUq6LA6sK5xAfSmsE9bz1d4wL3+KLhEI5SMwVbBtxPjEr9s22V08EY0o+p5DPXw3PebjlIijOU5DVeoL6BrfKnlXKAMwDNK+IZ+ajc2FR/jXZ7LFJHO8thim8xHDyXevcVUCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bgggxyqn6FwapD1ha0t9sN2E4jvprJKAahiU60nLmkA=;
 b=Y9PF+jLDA109JFycnqZ5fle8Dpef1uWymOxhwRzyJveLLGtovkTuWk/clMgUcnTZfqa/OszNuKxAIjIHWIb8nVhuZk2idLVPLhIvCBHg2+05fyfFpWqroIs9bUq0Ji6AA0pnzhnQ3dqaZ2LUG+NPIumFJEAAl0YQWSgYxvYOy2FJOVo9ayo9yXNZ0aWfxPHWR1q0ZsH56/HZlylBsfx0lnFiPXqM7AZfogYErR1PEgCWWxDc1/IOXl5xdhzMV/N7428bvo+O1CXCu8FMJlEUbZjyoSGsbeaaLzcCAJuU18jyyRUBcWl2m9BHeiI/tCpnZoTYPt6vWqJ/8JtpcjPegA==
Received: from AM8P191CA0002.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::7)
 by AS2PR10MB6823.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5f6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 06:54:28 +0000
Received: from AM2PEPF00070CF9.eurprd02.prod.outlook.com
 (2603:10a6:20b:21a:cafe::45) by AM8P191CA0002.outlook.office365.com
 (2603:10a6:20b:21a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 06:54:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM2PEPF00070CF9.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 06:54:28 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 14 Sep
 2026 08:59:57 +0200
Received: from localhost (10.252.27.156) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 14 Sep
 2026 08:54:27 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 14 Sep 2026 08:54:18 +0200
Subject: [PATCH 2/4] arm64: dts: st: ensure IMX335 is enabled on
 stm32mp257f-ev1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260914-stm32mp2-dk-camera-v1-2-2f2bd719bb63@foss.st.com>
References: <20260914-stm32mp2-dk-camera-v1-0-2f2bd719bb63@foss.st.com>
In-Reply-To: <20260914-stm32mp2-dk-camera-v1-0-2f2bd719bb63@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Alain Volmat" <alain.volmat@foss.st.com>, Hugues Fruchet
	<hugues.fruchet@foss.st.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF00070CF9:EE_|AS2PR10MB6823:EE_
X-MS-Office365-Filtering-Correlation-Id: b467cda8-e7b2-44fc-5761-08df122d056c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|11063799006|56012099006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	+gOTSiPo7yWN3am3UulCp+fb9PCPU79elerRSbgMZn4liS0iwXawBbeqSnDdE/LKXB10X4LgwGQja3afd70EcxGLAcsJREGpuvu1IUH4NSdeIe9hCeyEUv6UvviK0gC++5lrnrC17cUVcM1VQHu+qeCYKwN8ByuETdBHQe9c6U21Fy4znc+U2HX/HU1mZSpR2aIySdEgeNBSm3vLuGoJQ7cWCI+1WqNs11xID7PvVzBlURatNrwkAQ3Kkn+Awtse+TAUVdFXCKNGBsVeSOjS27MKcdG4XAd0+D5+flW3MOKvhFkPe+GnvXrQczDUVvgaVl/m8kSck4qqBQaI9w9OzsHiKql+Z3OzBbAhkuj8cU8gtrr67vrHIByXV3fZUszSXZ75PWQZ9qJ+W4B9opfbp68fZSDvcwo1lbTB3+7zaOnFyLYi0lLmfBMYAP8pICPkkq65i2UR9+hozsxpjLtZBL6xxdP1ji5H5VlVF29c+lgDbw0HhwIu1Yt/IGcX60GAcnbDC1RsfzHsPGwjEYdpgvYaPjez+4V04rXk8I8Bdhsg/tv5xFlxgdwM2lDY8Xwj6JUPFjKlrU1Jgb0KQC/8ycb/8VhA9BnzKd/iyrhzhR43P2Lcxaole8yDNqhB2vcD+AKdB3ViuTxS23NBxdSk+K3OyUJLmGRU5KQtWDvQ2Y2gO01l1vudFOs+wRqA1L6SqffDy8sFkSepF30qfD8vNA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	chRMEnTRbbN1IBa23Q5UAAJDBb0H8gYivD83kMYvkjc0yPbj4q3obu8Bs3JnECfcE1b8VTjIOjIgyI3lFDhLwC/SIuibbgA0WG5rMVHfY+dE7zmaYpXVbCx4OSL64tVEkGRaCIYopa1azqlwAauo4zb5Z5LuT7Td2l8K6gGFSHgx1S4dU60WnXHb5UlOVK46MhnpKnqmiZ1r+HxjS+gplQXbsaRrUBeFanYnbfIb4H6oIDuva08zbEviN+gNBJVM16DaR/xWxQXqDLpP2rmp8YeCsUEK7u8pJeKt21kckh7WDQVvP3hx0dUPrwE3IrkPESs8cNlIyMYVFCt5bCZp/W/KwMsDxxp/wZZ2fE1AKGjPChNsILSHCN7t3Y3lyoyq4QYpF+bk5CjmQQzOV0xcdTO3Jvg68T0XOvOqPYSs9jKFLojYTgB+s2FSdz30h1uQ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 06:54:28.2896
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b467cda8-e7b2-44fc-5761-08df122d056c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF00070CF9.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6823

Set the GPIO enable line for the IMX335 camera via a GPIO hog
in order to ensure it is well enabled.

Use scmi_v3v3 for imx335 regulators.
The 3 imx335 supplies are generated within the MB1854 and all come
from the v3v3 coming from the board.  Ensure that this regulator is
enabled by using the scmi_v3v3 as supplier of the imx335.

Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 40 ++++++++++--------------------
 1 file changed, 13 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 12b4018edeb0..acc730146287 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -72,30 +72,6 @@ ddr_channel: sdram-channel-0 {
 		io-width = <32>;
 	};
 
-	imx335_2v9: regulator-2v9 {
-		compatible = "regulator-fixed";
-		regulator-name = "imx335-avdd";
-		regulator-min-microvolt = <2900000>;
-		regulator-max-microvolt = <2900000>;
-		regulator-always-on;
-	};
-
-	imx335_1v8: regulator-1v8 {
-		compatible = "regulator-fixed";
-		regulator-name = "imx335-ovdd";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		regulator-always-on;
-	};
-
-	imx335_1v2: regulator-1v2 {
-		compatible = "regulator-fixed";
-		regulator-name = "imx335-dvdd";
-		regulator-min-microvolt = <1200000>;
-		regulator-max-microvolt = <1200000>;
-		regulator-always-on;
-	};
-
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x1 0x0>;
@@ -253,6 +229,16 @@ phy0_eth2: ethernet-phy@1 {
 	};
 };
 
+&gpioi {
+	/* Enable the IMX335 power line */
+	imx335-en-hog {
+		gpio-hog;
+		gpios = <0 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "imx335_en";
+	};
+};
+
 &i2c2 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&i2c2_pins_a>;
@@ -269,9 +255,9 @@ imx335: camera@1a {
 		compatible = "sony,imx335";
 		reg = <0x1a>;
 		clocks = <&clk_ext_camera>;
-		avdd-supply = <&imx335_2v9>;
-		ovdd-supply = <&imx335_1v8>;
-		dvdd-supply = <&imx335_1v2>;
+		avdd-supply = <&scmi_v3v3>;
+		ovdd-supply = <&scmi_v3v3>;
+		dvdd-supply = <&scmi_v3v3>;
 		reset-gpios = <&gpioi 7 (GPIO_ACTIVE_LOW | GPIO_PUSH_PULL)>;
 
 		port {

-- 
2.34.1

