Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013003.outbound.protection.outlook.com [40.107.162.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239964718F7;
	Thu,  1 Oct 2026 22:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894218; cv=fail; b=WkiCGdT2kKA3NRbZLP2fMEwSiK3Hn6I/kCpRvAkJqQ3qfMc3oSUDVDSzuL0IiJIfFfi0COJX9pX2ujHncEezPnDaD+JsERbAuSdy6DgCON8rOvCHpc91UIFXnhgkqNCpd1QH4hz2WdTpPOqkfvRjDNQqMy2lxvVsXF7vjsfCfE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894218; c=relaxed/simple;
	bh=7SB85VLyFAa5eUzBPZqNUd1/YlR/Ls+ZUqPxee0RBFI=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=b0IVJ/PQM3CSfBXdK2QWAd7zLVLvjUb+VuAPLXKqHt/CR8Rz1eR3GfULujP09QDr66TP3ANzRdGSDOFWT7s92+5taNmGx8SbPfCgZd1zvSoKMxhToOxcHkmML9JX36vw7X6hk8PM/Fdtay7/X7YCreHAyJKj9nt9ayl9uxiSTo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=buRqxEhy; arc=fail smtp.client-ip=40.107.162.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="buRqxEhy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sip4du/rnoCvsbcINZFTznkTQ9E32U7Arh0ggqcf3F96JwPEDlqdyxnw9gb7ABaGaA17o8ELmpn6KBdhh0H650rTbSnMQ8hFYo05tIJXGAJTkJaXn0aIVwgv9BcG0AcJ4vRfRnU4J95dyb8h0yEj5hwi55DiqaPpFMDm4EJ7oRz3kREWmedgtA7oIRNA+m+BRGuD3kQntSQ5yDcRox1LDwrAcBJIxx1o0KSgnjBqC0VTjMj1xu+Chth+rlPSwBmHlhCq+Hw6CZbdXI5Lk5gU+L2LS6hulOboH6I+CHjqZOlE2pCfaQUzlCspiYCN5ugzcmAleYLp2B/WnKeHPi5/kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ElUig9qqWK8NSVy7fAO/Jg0nbnsipCCIosA93jsDA9Y=;
 b=kLBuSVCuHzL/APgcUelgGVnj6fXWsds5/hIQSTlTtHJL9K2JiCLjTfEgs3OH91pqmlyxblSi5UpY0osToNscFYgQaeNIhFlAxJvJLvWXps8ZGeIeLLVVZ0f0+PQ4PXsNvzKWdPaMwyk1vFCT2g1xJ/76rLUBiS1Z9CEhnqsObvLStG/RcPIKa0AT6gITkVHJl4XuopWH3ceugdAGmjNHjbdDKR6sZ8m4QDJ5h5dISvkKR4ma5oA9U/wr7j3yobPZr+xtF5v8WtG8udbZlc5YX4gZlFYEN2QPu6xhPGB2qM57Ab+3TuJ0l7tSJAByNfU1WIgB+uP82NwBoB6aHTSgMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ElUig9qqWK8NSVy7fAO/Jg0nbnsipCCIosA93jsDA9Y=;
 b=buRqxEhyL2pK8mWoOW5R1tspmLqtUmxitOeUmHpqgcEMUgyN5VFunsBTM6nc5s3XsLX5LbXGqE0XvZZjR339HUzROUwUz/ASu1os1WR8760lsPqSlfj+fs00GKaSwbf11hz1qWUhh5XiRSQiRmmoiy1MSjbYSYWoMrhHsDx0RoM=
Received: from DU2PR04CA0295.eurprd04.prod.outlook.com (2603:10a6:10:28c::30)
 by DB9PR02MB6827.eurprd02.prod.outlook.com (2603:10a6:10:1fb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Thu, 1 Oct
 2026 22:36:47 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::8a) by DU2PR04CA0295.outlook.office365.com
 (2603:10a6:10:28c::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Thu, 1
 Oct 2026 22:36:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 22:36:47 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 2 Oct
 2026 00:36:38 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 14/38] arm: dts: qcom: apq8064: Align multiple property data
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <c1886d808858a195ec78425b293b2ccd3756cfaf.1790892852.git.waqar.hameed@axis.com>
Date: Fri, 2 Oct 2026 00:36:38 +0200
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
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A00:EE_|DB9PR02MB6827:EE_
X-MS-Office365-Filtering-Correlation-Id: 17d5c453-2834-4468-556d-08df200c7a8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	iGvGS1oV5JYTRe1kWHqQBkov42a1+PEp/cW4g0N937bVmkwwnhsVROiE+REwKZXpf/fRlxUJGL6yS27RX87FY4mIiLUhVgf/1SUmJ0yUnOZvPZBazd6Y9gLvmO+FiqVcm+Df9BJh5mIYW2K4RXQrVO0HDkY195l7VYYyhLBlh2L0F6trzeJ7Lu9Sg8Pwlg94U+WEgsuhfA08+a5NSlt++cxOmgEOplJG/IBWmbidT7o5QGmbR2sY6VBPq8+GMd+udofuCmPgp88MY6PmFiHyTh09DAZMXTmiqF1ACwsOUkbHQUQUQfQZ3CaisTvzLQCn8J80lqcD3ZESjXGccvUcrVTX6+n0F1zOssWINWTCSZgT5EZ5wPvRG0hz/TPd6nBRXQnbnl6Z9dWi/hpVDtjDkN5GquQEh7x0uUJDWCeoZfTeUsgP9yoG/bYeJOGqHMaq5cMmkzczjSa2xAt1grY5sPRxn6MmBVlilod7rQ2hdi/BsvhMHAwYauJXEk32zXj1t/OkEDXgIvadTWwWgh58nhRrIbzFMnGjFzl5gCQTV8ksjvbzurRq1YmcmDkmcC9Ig0fqKwvPNmYM+44QawaDkfw4tXyRIbI5qUKNmPmwWHVcgMoUjnzd43JBjGslRnlzYjR4G3VrNs/zFBwuHTNO0UN+iEfziO1I5Rb//UV0BiSn0aaiOOCqg8KIUZ0gc8B4WANATKWRevormLGmnYTFuw==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	M5QMSpP1xBOQoPNLBDoAjwmizDjsOKG9LqZ5heZVXKcUtN9SwSpvFDCO3usnO925XlZDhr0/4j7yluoXzXy728j8RvAh6rEn+IVlpixpZJPoP9gYZYpvIdLYxDFzf4gH5zJ2ctYjDpVu07FF/QKnNOEuGPttrU4C+hhBVS1+Ox+/qrp+kS3vuR9L6yMgnsmMwf2Mao8O3qpBjKGHYonYvLr+llvCn1SEAVt14QRVGuqcDxXAb0+gSXd+aIJHM1HOS5T0yKbBD54flLAhEW2A8LUXuxXtC8hAImbgT0MqwmNHGd7f1+i0E9g7479RvFEXaYzm+e+KuccRu7yYZS897E+Mt6K604by2NeuDMu2WcFIBNE7RNNQrg+adL06IqAFPWpfVLLknNlHwq42CINSACf5N2AF0g2XhICfvszALZcWQKQNw9BpBgp8TF4KGsqh
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:36:47.7192
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d5c453-2834-4468-556d-08df200c7a8d
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB6827

Multiple property data on a newline should be aligned with the first one
or properly indented with tabs. Found/fixed with dtfmt (Devicetree
Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 98 ++++++++++++------------
 1 file changed, 49 insertions(+), 49 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 150b5670e13b3..565f98c00b3fb 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -89,7 +89,7 @@ l2: l2-cache {
 		idle-states {
 			cpu_spc: cpu-spc {
 				compatible = "qcom,idle-state-spc",
-						"arm,idle-state";
+					     "arm,idle-state";
 				entry-latency-us = <400>;
 				exit-latency-us = <900>;
 				min-residency-us = <3000>;
@@ -1036,15 +1036,15 @@ gpu: gpu@4300000 {
 			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "kgsl_3d0_irq";
 			clock-names =
-			    "core",
-			    "iface",
-			    "mem",
-			    "mem_iface";
+				"core",
+				"iface",
+				"mem",
+				"mem_iface";
 			clocks =
-			    <&mmcc GFX3D_CLK>,
-			    <&mmcc GFX3D_AHB_CLK>,
-			    <&mmcc GFX3D_AXI_CLK>,
-			    <&mmcc MMSS_IMEM_AHB_CLK>;
+				<&mmcc GFX3D_CLK>,
+				<&mmcc GFX3D_AHB_CLK>,
+				<&mmcc GFX3D_AXI_CLK>,
+				<&mmcc MMSS_IMEM_AHB_CLK>;
 
 			iommus = <&gfx3d 0
 				  &gfx3d 1
@@ -1141,24 +1141,24 @@ dsi0: dsi@4700000 {
 			reg-names = "dsi_ctrl";
 
 			clocks = <&mmcc DSI_M_AHB_CLK>,
-				<&mmcc DSI_S_AHB_CLK>,
-				<&mmcc AMP_AHB_CLK>,
-				<&mmcc DSI_CLK>,
-				<&mmcc DSI1_BYTE_CLK>,
-				<&mmcc DSI_PIXEL_CLK>,
-				<&mmcc DSI1_ESC_CLK>;
+				 <&mmcc DSI_S_AHB_CLK>,
+				 <&mmcc AMP_AHB_CLK>,
+				 <&mmcc DSI_CLK>,
+				 <&mmcc DSI1_BYTE_CLK>,
+				 <&mmcc DSI_PIXEL_CLK>,
+				 <&mmcc DSI1_ESC_CLK>;
 			clock-names = "iface", "bus", "core_mmss",
-					"src", "byte", "pixel",
-					"core";
+				      "src", "byte", "pixel",
+				      "core";
 
 			assigned-clocks = <&mmcc DSI1_BYTE_SRC>,
-					<&mmcc DSI1_ESC_SRC>,
-					<&mmcc DSI_SRC>,
-					<&mmcc DSI_PIXEL_SRC>;
+					  <&mmcc DSI1_ESC_SRC>,
+					  <&mmcc DSI_SRC>,
+					  <&mmcc DSI_PIXEL_SRC>;
 			assigned-clock-parents = <&dsi0_phy 0>,
-						<&dsi0_phy 0>,
-						<&dsi0_phy 1>,
-						<&dsi0_phy 1>;
+						 <&dsi0_phy 0>,
+						 <&dsi0_phy 1>,
+						 <&dsi0_phy 1>;
 			syscon-sfpb = <&mmss_sfpb>;
 			phys = <&dsi0_phy>;
 			status = "disabled";
@@ -1187,8 +1187,8 @@ dsi0_phy: phy@4700200 {
 			#phy-cells = <0>;
 
 			reg = <0x04700200 0x100>,
-				<0x04700300 0x200>,
-				<0x04700500 0x5c>;
+			      <0x04700300 0x200>,
+			      <0x04700500 0x5c>;
 			reg-names = "dsi_pll", "dsi_phy", "dsi_phy_regulator";
 			clock-names = "iface", "ref";
 			clocks = <&mmcc DSI_M_AHB_CLK>,
@@ -1274,15 +1274,15 @@ mdp_port0: iommu@7500000 {
 			compatible = "qcom,apq8064-iommu";
 			#iommu-cells = <1>;
 			clock-names =
-			    "smmu_pclk",
-			    "iommu_clk";
+				"smmu_pclk",
+				"iommu_clk";
 			clocks =
-			    <&mmcc SMMU_AHB_CLK>,
-			    <&mmcc MDP_AXI_CLK>;
+				<&mmcc SMMU_AHB_CLK>,
+				<&mmcc MDP_AXI_CLK>;
 			reg = <0x07500000 0x100000>;
 			interrupts =
-			    <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
-			    <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+				<GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
 			qcom,ncb = <2>;
 		};
 
@@ -1290,15 +1290,15 @@ mdp_port1: iommu@7600000 {
 			compatible = "qcom,apq8064-iommu";
 			#iommu-cells = <1>;
 			clock-names =
-			    "smmu_pclk",
-			    "iommu_clk";
+				"smmu_pclk",
+				"iommu_clk";
 			clocks =
-			    <&mmcc SMMU_AHB_CLK>,
-			    <&mmcc MDP_AXI_CLK>;
+				<&mmcc SMMU_AHB_CLK>,
+				<&mmcc MDP_AXI_CLK>;
 			reg = <0x07600000 0x100000>;
 			interrupts =
-			    <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>,
-			    <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+				<GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
 			qcom,ncb = <2>;
 		};
 
@@ -1306,15 +1306,15 @@ gfx3d: iommu@7c00000 {
 			compatible = "qcom,apq8064-iommu";
 			#iommu-cells = <1>;
 			clock-names =
-			    "smmu_pclk",
-			    "iommu_clk";
+				"smmu_pclk",
+				"iommu_clk";
 			clocks =
-			    <&mmcc SMMU_AHB_CLK>,
-			    <&mmcc GFX3D_AXI_CLK>;
+				<&mmcc SMMU_AHB_CLK>,
+				<&mmcc GFX3D_AXI_CLK>;
 			reg = <0x07c00000 0x100000>;
 			interrupts =
-			    <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
-			    <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
+				<GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
 			qcom,ncb = <3>;
 		};
 
@@ -1322,15 +1322,15 @@ gfx3d1: iommu@7d00000 {
 			compatible = "qcom,apq8064-iommu";
 			#iommu-cells = <1>;
 			clock-names =
-			    "smmu_pclk",
-			    "iommu_clk";
+				"smmu_pclk",
+				"iommu_clk";
 			clocks =
-			    <&mmcc SMMU_AHB_CLK>,
-			    <&mmcc GFX3D_AXI_CLK>;
+				<&mmcc SMMU_AHB_CLK>,
+				<&mmcc GFX3D_AXI_CLK>;
 			reg = <0x07d00000 0x100000>;
 			interrupts =
-			    <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
-			    <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>;
+				<GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>;
 			qcom,ncb = <3>;
 		};
 
-- 
2.43.0

