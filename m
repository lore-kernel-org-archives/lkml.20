Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012015.outbound.protection.outlook.com [52.101.66.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5957F4AD4AC;
	Thu,  1 Oct 2026 22:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894198; cv=fail; b=PHGBYlcdZOAf0rodVok3TZxAd+52pK2IrXr0hGMmMh9q4s8g7/kbqyW1b6/AuRHVJ8Cag0Sp+diJ+MuhzDJIa8pwFK95O9xf4c+y0i3RZ5L73221si0t/WHlk5rm+2JE/HdQI16lVEMugOuE4tlUtLgQMEcDiyBMN95ZVlus2ZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894198; c=relaxed/simple;
	bh=+mEGFKustS6Z3bQJQNrYs4VR9oLy6kcAG2mwhi63xXI=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=ZQ1ne10hGDQMneUzqdyXhvMAELoHlz/nTnpiu1HSRYk+rGizCim2m1F4Md3dojR1XkEMLEsUr+2V3XSqqWG3EMRNXzmOyxKhO/ahgJWzXcRifyA3ZC9XR2EUcTBr7NzoYAlvT+INP2yosqgn+AlIkqU8bJDJ/o0QwMlby6snOdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=IsdrcKHC; arc=fail smtp.client-ip=52.101.66.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="IsdrcKHC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+y4qLWdY+1M2z6EcBCoBERg2/VzlxRv1xNF1mxfyJM6AtSFTUsPfsfo4QbaDqN6dXPRNry3nG0ztf0LMvyACBcMqBlGrKykAQYu7rOALIz8u+dNc931DkiCT04MOHHrrsQmvgkvxr9+LBkkLLtHoHHz0542DfBFmJHD1ntL60OH5zTkuFHOnix54RrC1VOlJwfnuV6Mu3w85m9vg6AT26rWMSQWERyX0QCqc19L3TRn8z/PzQ5wf6j3GfufgrKNZiwzHgqDGk1izwP6i+G/eOTW8Gi5IVepl3I+tWh3OQZaF21mTnrQ7otWrRymXitcf6DIENTjPUewIB7iFRL+PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SKHPAB8D2vwE5x08gschgGpsLJos8W+1AuuahnxAOqw=;
 b=WlRp476F8j50HSbXA0M//627djWwlj1KU/KLs3BL8uegMiKm2mHQ3PTfY+AjHPkd8/o7yIH598fqBlYeg6YLlj2mO8bWsZ+MaKbAO49/fMJkqaWcNFjXmDld9NZl+/U1j8ydcY+c7Sa7uKovc6vEz40XrnWWLVXONK1jz7bWtlZrgypcgioUPwUTo43YrI1lLTWVe/5nKjV27DhMEOpS2eKVaLhztZ0mdASWZy1MIJ84HIYg1bbEHf4zEQd8Buatt/4YrcweuAT1Zw/EGlYpNurY8v6hC6Nhwz3fX4BepGef5nJguFm94tUfFITjtYSMGMrMFS+JV9KDj0UW5bayJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKHPAB8D2vwE5x08gschgGpsLJos8W+1AuuahnxAOqw=;
 b=IsdrcKHCJN0rbw+HxqB5FwliOvePuR3viEy3iyezjbG75GrjqMmTip+XNlDaDnYIrBRLSXPHOy9aYXEI+2Ic+rXosODwjcXaggx0M+ftbliobYOVBLMAwYYSX1zlgQCNSQK+/Rc0396LuDlvWCRUWoF6k4SGk08Bm86+kLydDDA=
Received: from DUZPR01CA0321.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::15) by PA1PR02MB11104.eurprd02.prod.outlook.com
 (2603:10a6:102:484::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 22:36:34 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::7b) by DUZPR01CA0321.outlook.office365.com
 (2603:10a6:10:4ba::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Thu, 1
 Oct 2026 22:36:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 22:36:34 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 2 Oct
 2026 00:36:31 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 02/38] arm: dts: qcom: pm8841: Remove superfluous empty lines
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <62a960c58513c2356f814108800732deb989d589.1790892852.git.waqar.hameed@axis.com>
Date: Fri, 2 Oct 2026 00:36:31 +0200
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|PA1PR02MB11104:EE_
X-MS-Office365-Filtering-Correlation-Id: aec1e3b3-9afa-4563-19b8-08df200c7276
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|18002099003|22082099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Fg144wGRIYDlIIRNMHua+XBNLO41Y6qqjEJLT3fbcybtEKja+k/kHxgjweeXwsRF54SLAnrBZ3P6p0WUukvdF7/sFITHMysyCZCunyqS2iT/7XyvSJsk6d2na9R/HvOBWg1gkWy2f9ri/M1v+6Eev7ced2R3nOle2PdCy2RWUcZGgqhBhMMUFtpnCylSfyQmvdeoIgvA5NxAl1JGa3Uo9WEpndUzWcD+pxnG3TAy97D2mxSG6qzKT0jt2SOLDi/ohcUedMcjWqFvteWzK/IIZw3e0kkuIUYoCSzrk5Sc7N2AGvrjOB/2xdUVB0RzZGxHLusc1wFdMCI/9iUO79JUzSCb8RPDx5nm6poDD26B86hJABiMO2xaWZho0Lav4ZQ34olD4gsSyq6crd9tO93Vr0IZJfGwgqIIYHEPKPNuXe+Ayycf2taWw548oeh/6Gzhx+aCPxcauiyV7uaRBynOZ8J+WPrGO6R6Lh7prKvhBkROhMOiqzSCxXjWK1m7dWPwbtKu1HXEj9QQePeGlKoTepGuqMqK/6+d1bKSCZqwrgpktzgFvqH+oK+FWYAFOwmFVMEEjZT6s9EiIj7Y8o/uct+UkgZX0PHnpWLvKR0KER/eSf22LewEV9I4EVmJmx8EqhkaqupMz698qR+4T8PqVUdhEh0ANRB0Q8nlBYXchp7iDOIIO0SZj7LmonB9KJZysG0B2RQDgtAbV1+8wcLdcw==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jL8wRGVejSB7ZhJPvUCvDfU8DTKB8GVanC5MvW0KDi1XlzCVibJGjybpm9ZRQM2uxpdAfxxI+rT6+87HSBLQ2R0m8QYDJIgIGswZDx74TuvnAuFiE6bkyrxKQ+V08bsgP/HRkuYuztexVeln3sZoRVV+YVzoKbq+BXHHQkW4F8JIa/1jmRt4qTDjXvC5UvNXbfHIlb1iLhudZ+NRw6l9n+956lnsqNuRGd8bWP7e8cYZKSmScBDB3Xx2IYutOV4yWAArakIpt5buPA6SFaPcA3o2Aq5pNlTMyqGT7nrnsdvT8gzWB7eXwmxLFxWf0MB7Sx4TLO0sa5A+opuHCYVsSZyL96hs+F4RIt6k9W/0N/jg8GKMQ1B2cFF2Qeh+yrli0Aq7ogpnvvEp+1K5fIKLLWjtf1dv0X/jBRs4tnHu7iYk4Dl73mzcowyjyH9JVtj6
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:36:34.1453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aec1e3b3-9afa-4563-19b8-08df200c7276
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR02MB11104

There shouldn't be a newline at the start of node definition or multiple
empty lines. Found/fixed with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm/boot/dts/qcom/pm8841.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/pm8841.dtsi b/arch/arm/boot/dts/qcom/pm8841.dtsi
index 3bf2ce5c86a64..49316e971fd3a 100644
--- a/arch/arm/boot/dts/qcom/pm8841.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8841.dtsi
@@ -2,7 +2,6 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
 
-
 / {
 	thermal-zones {
 		pm8841-thermal {
@@ -34,7 +33,6 @@ crit {
 };
 
 &spmi_bus {
-
 	pm8841_0: pm8841@4 {
 		compatible = "qcom,pm8841", "qcom,spmi-pmic";
 		reg = <0x4 SPMI_USID>;
-- 
2.43.0

