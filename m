Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013017.outbound.protection.outlook.com [52.101.72.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F60A4BEE34;
	Thu,  1 Oct 2026 22:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894218; cv=fail; b=AhDAjvvY1plPvBLzeLOW8Cy2Q8gJIZT1s/EMjyo38IJxr6GcC0gbxuKRzTMRb3On2OOk3LIdXOKqYDayl2ojZt0Z07ANrXSTDmR4zDMIZaG5fAqaS/bcJSXnCYG4bCjBig7sDSNTr9cfq2wa89SO1Sj26WQYVESP30XRt//5CpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894218; c=relaxed/simple;
	bh=HQqGyy44niQSJVgvMbkb3ZLCU1y/zlI9YXDPghVYkU0=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=Ge/iOp4lWlqrQAq3h5u++8bHyXVG1Vzho7zoi5mMCqL0HRt3i7wuEZV/Uc4M+Dpx+IUyXF5am2clBfDKSB/7d+k0OWPZZWuO3wyxr3N5YQ4+QYUXa5En0nBrzxw3oqj9/AMPToN6oOMnmmVCnIuzIBiTqlFKc/R86gRzevr4lLI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=qZtzlbqx; arc=fail smtp.client-ip=52.101.72.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="qZtzlbqx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u9kisXFc0a1uhs7DLVmyYCN5v8LctaU86nbtpykkWNY1agPfMuNK4rAjeoSKwehAeH1Sxxgq0FJBU3IzOj3ss5X7CJb2semEwzpxYXATgW2V2tUipGEfmzvHM7K9Jlf5FsfotY0hhbWeZ2rC9Ohp1TJJhvYs/wNay55ABE1xs1OLCEZGfgSWg8fXHwKlpHvWYH+N374WXH/iQXSQlPNio5T64Mdkbx6veZn2XRlWApWXWWhN1VnoVIDh7MszVR+KC0PPxy0KR0ZKK/tsH9LmMIHxEuujYK5RzjLiVYM5NoVkW/dJmHptTHtYUZUm9aJcQR2SWHAmdMT43ME8yG9SXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQQroCLK0UY71koW9rR2lAa4PwK91KrH4e0TXaaqAfE=;
 b=mz+Vfnvwc2MS6UbPQpcVrPb8l4iirGAF2iIACwy/xbydXRGdRqrKeO0O7N3/JWUPpacGn1lLEv6ZLRF3jccqRQZyqIWC0/q3h2NUVuCpt4oYn5W6xJAFN13BD9fSLsih8ZLnvxGMJY8lzV3myv7s1piV1WM8AXrfiqk9KQHHmGAAVlzuCyCQNAEgXkk/S/uGZ3mBbNZblDDi+8d4yAsGQJjsB2Q+pJrixz0qaJnL/ml/AvPQaJevojEAgg+lXSKG/9JCQuHTJW1VSHRtPL+u9Jt+uPjzD9zqm6U2IOH59htdFwrHb+F7y5XC++HxJou0OOTsVBRrrktHkpAO+w6tKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQQroCLK0UY71koW9rR2lAa4PwK91KrH4e0TXaaqAfE=;
 b=qZtzlbqx1fqVFLQ9WSXOx6Rvvy6U1e/aUKChE1oNRna4vGwM3cndMKHzgghhy0irOpRPfvvOtet+bLkJJZfd5SrPev2QwMa0IN56bG8IUHGVDalOWfOvt5zYffBaqKFa3MR9R4iuiOZPmcIsYGzhv6ATkx8JsbJgZnNz/YbUpBU=
Received: from DU2PR04CA0056.eurprd04.prod.outlook.com (2603:10a6:10:234::31)
 by DU4PR02MB11122.eurprd02.prod.outlook.com (2603:10a6:10:593::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 22:36:52 +0000
Received: from DB1PEPF000509FC.eurprd03.prod.outlook.com
 (2603:10a6:10:234:cafe::83) by DU2PR04CA0056.outlook.office365.com
 (2603:10a6:10:234::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Thu, 1
 Oct 2026 22:36:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FC.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 22:36:52 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 2 Oct
 2026 00:36:42 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 21/38] arm: dts: qcom: ipq8064: Align multiple property data
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <c480d106c610e2c78b3e4c3f5e35fe19ccb067c8.1790892852.git.waqar.hameed@axis.com>
Date: Fri, 2 Oct 2026 00:36:42 +0200
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FC:EE_|DU4PR02MB11122:EE_
X-MS-Office365-Filtering-Correlation-Id: c65d4bcb-4aad-4222-e43a-08df200c7d6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	g5cVMkVtuDRQVrYZkXmpERSoy2w7WEtb2eDL0ctUKNCZVCpLVJW5ii/hJszyXvRNQgVn7K8JX2qpUUgtusieuwcbpeCzkXT/xUaeJMTNPUBQr6jIvmzxywcMTK3RAnOic01CxtLxrk6p5RcexF5CSlPX91s7xsusypEyA18ik3SzIPieXXnrWnYf26C/kO6wde6ihE4EXeN0wMKfGatH3WAil29M9oqos32VOzmE7aPZSZ3Pi0JQ7UOJRCP+uY2UHTbKHCOY2F7w69lM1gZ/7ewkXXbnRgHa4dz6Z+R8qozz7LUiDjcv8gVT4gSPNiktQ5sTbRoaJeT6qkON9fKwNVt2JsK5ATMN+0jtAGy0l+McBndHp3LWcUBkCX/W/RaWsTVbwNgosD+iS7D3lC1mt1XWWxNliHPqHVMO/OqKld0fow8Z5CCwnRiYNRGYi0ersV4nNpFn4YCt0Piw3aghxmJmTMexqPWb2W1HqHAV+X0Pk0P+ESlneJP/T+3ha9UTmfzF7nPK4pgT49U6nFnUO8MNeVpEKQIp+PDsBGasvtX4Z8EeOFrrKbBNtbxbRro0KBukMpEAsoBuHvP0sL2s4x6zH2qUxTqRutUcllb0sq7r9KRIWdRvzAuqrbAqppAueMGeSRINHOb6bcFWuGdIfUbDMPW5bqZSl6zlXAdLK/UljlJ5H8PnuQh+x6Po5XC6+u0/JXjkNQt7i6sdX4XBHg==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	V6VDNvaevH2NND90HYonlxUS0fp19BQOlV2BgIFqMALxoATDe95FDLw7IZEPvwCOFbhVRfBjmAB3sbaaUzAAXMboVsjZBAobHaAxCQRLMG6APFFw6PoxxjEHaaZZ5zp8nRZtXSdZa7WtK9kT/QoD8KMxLsMLR8NhmLVMuKjBDVg7WakX6OmHVR0yaa4RMtThiMz3OpvfDyQtTAaVB713OkXl1b95vEukVm0hlYr4C3HOOy1Fe0qwqxBG/tDwlFUdzONC/eR6+pTK9cNsOSb2vwMXj53Ijm4CVY4hdImriC3h9bSaPOBsWuuaa5MLCGEMndKgJV6sTWT+jPMF0n4JIS+AiRlOU4Vd+Y2IDBWFIph7HHY2y4HO2XlQApzXkWIRf+EZQHCLuN6WDoVpXduvAbkRD4xYsOQgzncFGbfL5b5xZsLEXc6EGzvCqqwap5SA
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:36:52.5259
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c65d4bcb-4aad-4222-e43a-08df200c7d6a
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR02MB11122

Multiple property data on a newline should be aligned with the first
one. Found/fixed with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
index 2b3a3ec4e03d8..24632af28d52e 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
@@ -353,8 +353,8 @@ rpm: rpm@108000 {
 			qcom,ipc = <&l2cc 0x8 2>;
 
 			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
-					<GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "ack", "err", "wakeup";
 
 			clocks = <&gcc RPM_MSG_RAM_H_CLK>;
@@ -438,7 +438,7 @@ spi_pins: spi-state {
 
 			leds_pins: leds-state {
 				pins = "gpio7", "gpio8", "gpio9",
-					"gpio26", "gpio53";
+				       "gpio26", "gpio53";
 				function = "gpio";
 				drive-strength = <2>;
 				bias-pull-down;
@@ -489,9 +489,9 @@ mdio0_pins: mdio0-state {
 
 			rgmii2_pins: rgmii2-state {
 				pins = "gpio27", "gpio28", "gpio29",
-					"gpio30", "gpio31", "gpio32",
-					"gpio51", "gpio52", "gpio59",
-					"gpio60", "gpio61", "gpio62";
+				       "gpio30", "gpio31", "gpio32",
+				       "gpio51", "gpio52", "gpio59",
+				       "gpio60", "gpio61", "gpio62";
 				function = "rgmii2";
 				drive-strength = <8>;
 				bias-disable;
@@ -1257,11 +1257,11 @@ lpass@28100000 {
 			compatible = "qcom,lpass-cpu";
 			status = "disabled";
 			clocks = <&lcc AHBIX_CLK>,
-					<&lcc MI2S_OSR_CLK>,
-					<&lcc MI2S_BIT_CLK>;
+				 <&lcc MI2S_OSR_CLK>,
+				 <&lcc MI2S_BIT_CLK>;
 			clock-names = "ahbix-clk",
-					"mi2s-osr-clk",
-					"mi2s-bit-clk";
+				      "mi2s-osr-clk",
+				      "mi2s-bit-clk";
 			interrupts = <GIC_SPI 85 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "lpass-irq-lpaif";
 			reg = <0x28100000 0x10000>;
@@ -1280,7 +1280,7 @@ sata: sata@29000000 {
 				 <&gcc SATA_RXOOB_CLK>,
 				 <&gcc SATA_PMALIVE_CLK>;
 			clock-names = "slave_iface", "iface", "core",
-					"rxoob", "pmalive";
+				      "rxoob", "pmalive";
 
 			assigned-clocks = <&gcc SATA_RXOOB_CLK>, <&gcc SATA_PMALIVE_CLK>;
 			assigned-clock-rates = <100000000>, <100000000>;
-- 
2.43.0

