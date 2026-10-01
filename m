Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011046.outbound.protection.outlook.com [52.101.70.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFD24E01E2;
	Thu,  1 Oct 2026 22:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894221; cv=fail; b=s93Xk0W1AtoqEAvfTfX009BtmwVb2bKtkOPdCAyrtBN00WHJcdFtxDfDYGiJ5uICXqBM7HmSAbVbzx02AlwPk3gW/BhrW0qMrhbStRWaxcEjcU0OL2dJD1U4u7yX1DyhG8JgRtEi3kxft+w5NLgHtzzNyz5EF6IN70AeKhlohmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894221; c=relaxed/simple;
	bh=V/l2IXky3ePeNxiXW52kMORXV/BYUgn1IZEiccl2UpY=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=SXM7TqTpTQQ3IISKDKNeBuDPhZczEQLV37L7gmFNIIZFZJu/a1Bfg+rEho1BjKNDrqD8OVnFDsS4Wx4ZQ7r50f1g9E/Mwd+G5OHTZi74P2RfwS0+3qbJ7pO69Pqr2hBCxVFpkKHcqKkFT0RBcxHrZUu03h6SyQZBUPTLRn5y9Vs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=BriNCW3c; arc=fail smtp.client-ip=52.101.70.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="BriNCW3c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EAhmgtKO/m9SMdib2xSeZqVmtPVHiaKo7Uw88UCI0pFmT4PaGGvtPUpAaEZuNi6C1Bv7tC18M0N3VoIIgeZHnoOLHKyPZgS5oviGOmKu07IPvllnYX/nE0QrcoxuxM8k7+7qvs91CBL7sFR19TaHYhdqh7n+Y3Ibr5gIP80y6kTCmerbZIn1scYok8JbFiIwSlwbwCab8WmLOhTOD9CgjzalrAorrh/MecG6YUTkvhVznU1j2ZcK9wOtNCtB24HmkHFH4KTlO1lfgB7FCn3iC5iwuAA/YiNLZAcGp3Zaa0RpOUKuAaiq0WGWHx7/NG+hm/SBavk+Xsjk5+8vryCfuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ubz++aUPjLc6sdycAETdb7GB+3sTFPCCfdXoAB+Tgqo=;
 b=cRJUoxWnWecetD2v2QSLuZcW6XSCaD3eQUivp/ZW9Unc7XTKqoxcYBwRipuvH5x2dG1YGvw+r6b+tOUuNEi8TTrfrI/gdJE3q2uXd36UCHFe5m/TeRe5aR9wlLx84byj1Q9GmrtpDxtAlAzgUUfHXWV0mnPHEV/52iPpi5T68/OaBGDENlkhVQDmcRsvMxO+GnLJ8TGGfv4vK7JHKne54cdeHnIzSbTe2r5xiz6OlCt3mMt1m4hJFi2WK9Xf28vVinws29qrEGr8OnDFDEcCWzJlJxnDWi2YYCIkhYCM9ZDljC5qwgplQK3HPxRivVHt82tisrHrgA6EZEtXD7dB+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubz++aUPjLc6sdycAETdb7GB+3sTFPCCfdXoAB+Tgqo=;
 b=BriNCW3ckfV0f6ZhBINfn9Rwp28KKtK5cz9cPhQ1V8yyrbhRoGkAbfCpLeyqZs7lqT+x5Y4HowfoYGCF3Yx/QobU/w5fKGL1YUDzJDb0iivu9vx3JW2Hg1gJ4kIWk1N+iPhlbe77tny40cG8ZpOeC7bL31ic/QYiby6hjXDEShc=
Received: from DU2PR04CA0280.eurprd04.prod.outlook.com (2603:10a6:10:28c::15)
 by GV2PR02MB9493.eurprd02.prod.outlook.com (2603:10a6:150:d4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 22:36:50 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::d) by DU2PR04CA0280.outlook.office365.com
 (2603:10a6:10:28c::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Thu, 1
 Oct 2026 22:36:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 22:36:49 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 2 Oct
 2026 00:36:41 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 18/38] arm: dts: qcom: ipq4019: Align multiple property data
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <11b9df95b8ee7fb12a118aba7004a74616896399.1790892852.git.waqar.hameed@axis.com>
Date: Fri, 2 Oct 2026 00:36:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: se-mail11w.axis.com (10.20.40.11) To se-mail10w.axis.com
 (10.20.40.10)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A00:EE_|GV2PR02MB9493:EE_
X-MS-Office365-Filtering-Correlation-Id: 7314b5f7-b543-4e28-ef53-08df200c7bb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	fqZxkC6xC2sGEsPPmKnAU8IWe0bljY5oOfmfEcCz7+/XIsJyeV0inyrCW7dAMhXrgNst7hiqY1Cl/3ffqGrbp77hTwewiL8Llz+tidxgKNT7/RpOn7boQH5/rIr4SYWyGclcSZPzwnuVuwrFdZSJwp1HsFDx7stb3EJqBJ1GbEuiAis78lFZ5/2IKU0PvwwKMn4CLqQ8Nv5IMKLW/9SYCoI3V5UxKgaoLlQnRw19+uaLDyBQ0+fWoDpEQfE3Aq04PJTMhPe7rAoyIqwSOCznaGOx+9HUHatlz+OMqHSEVtvlQn2EfbYrU1DTvw9m3c2Sk080m766HDAOUGsxAOavAimnAxxQbdjbJhcB2F13pXRONVJiYKlWCjw/dW0LP8Dig8uI0KEWKuz6cT55zDB6pxb6BUXCLcUrVjoL2S33/37q1fWvFJTdwjsoTdWYWvhqgAlg4e5bliGNNhVT9unEm1D75VgGutUEgmiZ9dQG9H39vqoCJcJO8c4s1qGbwdfiDLtUw+M7nt4w0k3EkDP+1lFv1q+ml2I07BluyRinfgnAnqsaeiApKZOuO/XSkADaTjSjIuNKVg+p8DSRP/MUUoGU6d0mgvAAiSt/sgMK/3fuJ57/qWNAIenAWDaHdbdKz8Z7rbDBi45S8hiNaGN797OjNIcO7VedwNE4DunLwitfsRiIwEDDRTjbE26SxQilqoXr81SyYEwqelkdjxs2BQ==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	u4rtLvC7MS1rObCwjRzYMzoO9av7/oNWJ5ROHpADQnLNlWyxmVCvl1Sjj2BMAxjSNC3YoU2hUsnLQ5vYRxnhRdPbzZmli4UMw5z1ePrK0yu74hqv2rMiwaBuzZxN2KcvQ5GPV2z4vefK9A7rzf+Gg90CJ3rIqDxS0nBgbUK2p5e8g3Bn5pxWobc/Eu7COpgqqDioH6uvWkUbAOpXkO6vrR62vlDizCZK7sDrSeDKSLkR4Kp3MZQHKylnlGZdMPKgupZFp8tEP6DtQaam+a2KrcfmhrwI7WyhUzKhArqZ09PD4KdeDKUFJZsvBu5jDDhw3/JCw+XnMxmwQQwIIPoirz/Jz//dlIniEC9PITQivnLV9DfEXxBsonXgXg8hyRcU7CJNGW4nz6WKamuA0x02IVl/Z5WXIB6Z1oKUPkUs1mN0Splz2FjJ4UJLthcgF5Dt
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:36:49.6571
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7314b5f7-b543-4e28-ef53-08df200c7bb4
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB9493

Multiple property data on a newline should be aligned with the first
one. Found/fixed with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1.dtsi   | 10 +++++-----
 arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c1.dts |  2 +-
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi             |  8 ++++----
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1.dtsi
index e998cb72c98db..faedcc0a76387 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1.dtsi
@@ -32,7 +32,7 @@ serial_0_pins: serial0-state {
 
 			serial_1_pins: serial1-state {
 				pins = "gpio8", "gpio9",
-					"gpio10", "gpio11";
+				       "gpio10", "gpio11";
 				function = "blsp_uart1";
 				bias-disable;
 			};
@@ -60,10 +60,10 @@ i2c_0_pins: i2c-0-state {
 
 			nand_pins: nand-state {
 				pins = "gpio53", "gpio55", "gpio56",
-					"gpio57", "gpio58", "gpio59",
-					"gpio60", "gpio62", "gpio63",
-					"gpio64", "gpio65", "gpio66",
-					"gpio67", "gpio68", "gpio69";
+				       "gpio57", "gpio58", "gpio59",
+				       "gpio60", "gpio62", "gpio63",
+				       "gpio64", "gpio65", "gpio66",
+				       "gpio67", "gpio68", "gpio69";
 				function = "qpic";
 			};
 		};
diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c1.dts b/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c1.dts
index 71c5ba00ff982..4230d71c48b16 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c1.dts
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c1.dts
@@ -21,7 +21,7 @@ spi@78b6000 {
 		pinctrl@1000000 {
 			serial_1_pins: serial1-state {
 				pins = "gpio8", "gpio9",
-					"gpio10", "gpio11";
+				       "gpio10", "gpio11";
 				function = "blsp_uart1";
 				bias-disable;
 			};
diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
index 6ff87808e2a0f..1fa1aef140a12 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
@@ -181,7 +181,7 @@ intc: interrupt-controller@b000000 {
 			#address-cells = <0>;
 			#interrupt-cells = <3>;
 			reg = <0x0b000000 0x1000>,
-			<0x0b002000 0x1000>;
+			      <0x0b002000 0x1000>;
 		};
 
 		gcc: clock-controller@1800000 {
@@ -268,7 +268,7 @@ blsp1_spi2: spi@78b6000 { /* BLSP1 QUP2 */
 			reg = <0x78b6000 0x600>;
 			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&gcc GCC_BLSP1_QUP2_SPI_APPS_CLK>,
-				<&gcc GCC_BLSP1_AHB_CLK>;
+				 <&gcc GCC_BLSP1_AHB_CLK>;
 			clock-names = "core", "iface";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -380,7 +380,7 @@ blsp1_uart1: serial@78af000 {
 			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 			clocks = <&gcc GCC_BLSP1_UART1_APPS_CLK>,
-				<&gcc GCC_BLSP1_AHB_CLK>;
+				 <&gcc GCC_BLSP1_AHB_CLK>;
 			clock-names = "core", "iface";
 			dmas = <&blsp_dma 0>, <&blsp_dma 1>;
 			dma-names = "tx", "rx";
@@ -392,7 +392,7 @@ blsp1_uart2: serial@78b0000 {
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 			clocks = <&gcc GCC_BLSP1_UART2_APPS_CLK>,
-				<&gcc GCC_BLSP1_AHB_CLK>;
+				 <&gcc GCC_BLSP1_AHB_CLK>;
 			clock-names = "core", "iface";
 			dmas = <&blsp_dma 2>, <&blsp_dma 3>;
 			dma-names = "tx", "rx";
-- 
2.43.0

