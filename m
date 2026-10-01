Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012047.outbound.protection.outlook.com [52.101.66.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2351847CA74;
	Thu,  1 Oct 2026 22:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894217; cv=fail; b=nuUj8w0j06wgA7kuJQ6kqntXIdC/KyPzRpE3pPPgAxh1xIy646fB82LBJu23b2k4qv9XWdITGvNXSIhOSh1c2Tu4l2sR5c41XSq78tH7xM5RVM0FWE1oAzclg6RVZ+oJwbH99Ov3GlPFRIbu/+EsDumqBD9wqaZ+Xgv+jeT5RNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894217; c=relaxed/simple;
	bh=1odJJkPAWBBm45+d9dJbDStJi+g4GVOWwtmILoY233Y=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=QB1YBk/hE16+WT3me3r0uyU1rNRC5/UH04j0zqP5UmQPtWq4kaUaVYZRQWc/SFNFvbd/pR1xE5Jrg0TotdFZjlG9Si4387/bgHKF4akz+IJWplkA5kHTbwqluzlYe7e6issbw9VL0R5Nw2tjY34IR6UqdD5n0sE70Ufq2YwFrqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=rRNlQVns; arc=fail smtp.client-ip=52.101.66.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="rRNlQVns"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oVl7M2oJ8/FoK5fGd9kpVbFoU/308zOvMpBhsG8TAQ198itVZ8Zcv07mfWvX5o2JXoI3l7TYy5jCSMBg4uOahfelZyGW1s9wDxCDiIs+ufRSNXMC4ON5XKMCanqF5iwlmDjyn+K0GWd3fPrAR+d1HlI1rK1fSKqlCdjKK6AYiM2fQpflFuNyBWU1w4SLyzRC1r5XoZ7YbMX746I0N7m6SEq8oO1RZjjLWbkd+7fyQi/lch9KmFxDFKMJBF/HlITIRN5+I049/n2CqGdsfmxAQ+HHKZW3m2wgAtW4di+BmtxVxoewPiiXBFAR2kvICx3KY+ZMqdGy5JZh2LzlzCUP3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sK5Fl147HNRTOqnjGHsGqa18V7rxw7IjhlvPgoCMIiU=;
 b=sVomVr6jBQBjsBE2DT8wLkxwdiUTwiBSxz0gFun08VrCov8r8rHcM2jvZtPI5Yb86k7iZxJrFPfp9bG/Vfqs4xOlNYi7BLR1KbCO6KFRIpGPE2Qkrp9TGm0zDGg3LqmkcQ96R7AR91EaeYj9YypVqTvaKsnga89bAHJDtblcsW9vRjieSr6YY5crAb6dBHzodDEuDMlE84txpweyqVVkHB5iUWSGlIwPULpjwMHSnNVw7E4Qv69Ru8bntKMqib4pxfOgQllZOVLeFIl4J7t0Bh08N5sWks5hGb8aHZUcBnjdVaPtlDARCoksbGeIO6xADRtugKLpcDEhQPHrXLnTfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sK5Fl147HNRTOqnjGHsGqa18V7rxw7IjhlvPgoCMIiU=;
 b=rRNlQVnsPXg5aHhxvYS3vHBjyehkpBJz/lLunEs6/29GrITPOQVzfS16VTxuhEEUNvY4d/Rt3xi7QNESe2IaMFQjlH/Rk4bbBGIDXppfAdcdhF6WJF4ze6qbQ75GL/gUEu05tS1mCExWS2fH239y4n/Y/NIUfNiF6uiJSPYqtIs=
Received: from DU2PR04CA0276.eurprd04.prod.outlook.com (2603:10a6:10:28c::11)
 by PR3PR02MB6204.eurprd02.prod.outlook.com (2603:10a6:102:62::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 22:36:45 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::8) by DU2PR04CA0276.outlook.office365.com
 (2603:10a6:10:28c::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Thu, 1
 Oct 2026 22:36:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 22:36:45 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 2 Oct
 2026 00:36:37 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 11/38] arm: dts: qcom: apq8064: Add newline between subnodes
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <b86dabaeeea3672a790fb5e8378f829bd616de78.1790892852.git.waqar.hameed@axis.com>
Date: Fri, 2 Oct 2026 00:36:36 +0200
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
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A00:EE_|PR3PR02MB6204:EE_
X-MS-Office365-Filtering-Correlation-Id: cec85bb6-8133-4f21-5dee-08df200c7943
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	xlCbLwcR0a5GRX40wOHEvtxFvx8N1+B13/tDqbbfYVsPZ/xy8UoSPYW6zyGi2qwkhicsUPMG+PmcE4kkY+Zv1L2E4UGKExLCa2VBk8RrMaPmN3RxEbcSCDvWoZw+muLSvkBFKf24wOuYdmAmNcBtTDiz8HCkwpK9dDhSjzQSnNASFsWh7hzEmyg7B47Qd63OICXVKBEhkPGG8wf8r4pUnvfOsTpdTaDgLDSSsuZkYPfh+yYUBJpzBQzKpuYGBuqcYyGqN6A8GATTnJd0RiaGXeB9UQp8q1QY09gOkiNPgx3kDpuurnl1dx1uKfnpRgtJfvI0TZguGN9Ij2czY8iZ2Q30d7/B7koDpbKR9h2pw0YfG2cArN5L2yaLCOOWXBUQBULtsFWNtSfkxRc77862+qlPqNscjw6SZNR45jF7/7XiqDZGZ6E1AMUAEQ2mRlyz0k77RLRdhmhYcaoxUyssBhcEhGWl0W8klYC8bDJHHanqBTcP0dkeyqQzEPGA+6/cCokyXpBsETupEVfNilet7LGle9yfFsX4o8JqoNZw3fOHseHcPEa8CPUJc4udUwofYcpJzKCo7zHOVzKOtr/UcFmKNEvSx5Gp8vs9MSO/vJ2j3/UDu8moSdVF2PqfrYIg5kvItYMgqy9x6gWZPH9N7d+X7b8E/rgfhRY+53HTlvASYumq5PAWh9VPli33r3VuKELBpzptGGLUFBZPHQn1IA==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gqhNFC3fYzrW+bn0tUMkvXIs5lmOwx3IMGjcWrF/mtTiFnVSTF3eCbSsw2NLpYRA/vpoDFAez/Mobow8qFGZuRePu19HH2xgLA9fzpLMgL+U1SVxGXdLjKpkhAKIybr3Umn3b97ZwdMnvLdiE96XP/n86rNO14IOkUno13k23XP4sDutIgFWNssDZG6DFIHQWq9dR8gsl/lfjGL0/YVPIwXmp1tMFRSfdHFiFCBXiOB2pPgvGTAV/1rf/RzVlYbgKsvt+Bg65bsnEtUwL7NF4Dxy7s/UNKtZ4iG6uST5QwVwd8iUWYr3ZS1ubPld84KVSbki4svYsnuO6oZ6ApkhvBtxvdEVS4zHiHnIWdOZQwdpO8Id9NDLR/s8/R5fu7SdkMwKL5BthdM+FSHcUgCNi1LjmPOyqo99qI8jWgB4KpXcN6yXfQ3DgEek+ZNsrwqM
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:36:45.5562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cec85bb6-8133-4f21-5dee-08df200c7943
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB6204

There should be a newline (and only one) between subnodes. Found/fixed
with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 .../boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts    |  2 ++
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi              | 11 +++++++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
index 9471839928505..bdd3dab530ece 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
@@ -53,6 +53,7 @@ key-volume-up {
 			gpios = <&pm8921_gpio 4 GPIO_ACTIVE_HIGH>;
 			linux,code = <KEY_VOLUMEUP>;
 		};
+
 		key-volume-down {
 			label = "Volume Down";
 			gpios = <&pm8921_gpio 38 GPIO_ACTIVE_HIGH>;
@@ -330,6 +331,7 @@ pm8921_lvs5: lvs5 {
 		pm8921_lvs6: lvs6 {
 			bias-pull-down;
 		};
+
 		/*
 		 * mipi_dsi.1-dsi1_vddio
 		 * pil_riva-pll_vdd
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 09062b2ad8ba5..0423b9380c812 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -116,6 +116,7 @@ cpu_alert0: trip0 {
 					hysteresis = <2000>;
 					type = "passive";
 				};
+
 				cpu_crit0: trip1 {
 					temperature = <110000>;
 					hysteresis = <2000>;
@@ -137,6 +138,7 @@ cpu_alert1: trip0 {
 					hysteresis = <2000>;
 					type = "passive";
 				};
+
 				cpu_crit1: trip1 {
 					temperature = <110000>;
 					hysteresis = <2000>;
@@ -158,6 +160,7 @@ cpu_alert2: trip0 {
 					hysteresis = <2000>;
 					type = "passive";
 				};
+
 				cpu_crit2: trip1 {
 					temperature = <110000>;
 					hysteresis = <2000>;
@@ -179,6 +182,7 @@ cpu_alert3: trip0 {
 					hysteresis = <2000>;
 					type = "passive";
 				};
+
 				cpu_crit3: trip1 {
 					temperature = <110000>;
 					hysteresis = <2000>;
@@ -707,6 +711,7 @@ qfprom: efuse@700000 {
 			tsens_calib: calib@404 {
 				reg = <0x404 0x10>;
 			};
+
 			tsens_backup: backup-calib@414 {
 				reg = <0x414 0x10>;
 			};
@@ -1177,7 +1182,6 @@ dsi0_out: endpoint {
 			};
 		};
 
-
 		dsi0_phy: phy@4700200 {
 			compatible = "qcom,dsi-phy-28nm-8960";
 			#clock-cells = <1>;
@@ -1249,7 +1253,6 @@ dsi1_out: endpoint {
 			};
 		};
 
-
 		dsi1_phy: dsi-phy@5800200 {
 			compatible = "qcom,dsi-phy-28nm-8960";
 			reg = <0x05800200 0x100>,
@@ -1596,18 +1599,21 @@ funnel_in0: endpoint {
 						remote-endpoint = <&etm0_out>;
 					};
 				};
+
 				port@1 {
 					reg = <1>;
 					funnel_in1: endpoint {
 						remote-endpoint = <&etm1_out>;
 					};
 				};
+
 				port@4 {
 					reg = <4>;
 					funnel_in4: endpoint {
 						remote-endpoint = <&etm2_out>;
 					};
 				};
+
 				port@5 {
 					reg = <5>;
 					funnel_in5: endpoint {
@@ -1698,4 +1704,5 @@ etm3_out: endpoint {
 		};
 	};
 };
+
 #include "qcom-apq8064-pins.dtsi"
-- 
2.43.0

