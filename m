Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011070.outbound.protection.outlook.com [52.101.65.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10A34D0CF5;
	Thu,  1 Oct 2026 22:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894217; cv=fail; b=CBKjgbIkikzdj2DVncoL5n0hbQ8J2S/sV4OabIWImu7/Rnp91dwtP8lUx/l75y1A5ZVBSe39GdWP7GdLcAb4FiDJcJVv1OsCg/wVHzIjEgKxl3PAu42Bnin7SFqGcM5wcxToRwFqpqUC/y+njuT0E57C5DBSwLMd1G1c4bAGUAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894217; c=relaxed/simple;
	bh=01fxnpZLBmBlIy2MUeJ6MshPlmqqHy4aO20SWDgLYqY=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=B9kIKA7I6CjBOMyh2e+vnhX7wFSKebcEvhqP2nW9sCuKQ1K7inicmTsNLDF4IWnC/eNptBQgCIw+84x6ffrRg0ZH+RUZyDiypeensjQcBu2HwX6xPHSKAugR1RDpVlUu1CZoj9GWOX+4/84owyId8kr5FQuaoR3TdLfIHfjkUFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=lL195SNB; arc=fail smtp.client-ip=52.101.65.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="lL195SNB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dCHEtNQsIam1Z5Q19leHBJxb/6j9kChJlN/JreuOibV22+NpWOaFPjOWHg6F6F2HtfVCrqFHDAQCI/mAA+D1/PsRLRfflcsQTC8hOSxp3LVuBIa6vLcmeqcIo9F2S65Y0h46aRkpoZohMMemX8wHnT+Ijo4B6KMjsJ2JtqjYPeQ+EIuuOGaZ2KO8iKitwovnqUDnSvUdWgNKnDAh+4+U8hNPl6KCn5VLgpDKsi1dVv/GP7v2aHfb2rWEOJbX+65cUH2DTnJtifpaVykT4IKVDpKuXc7FG1kHDE5xHvhzymtyI4Qfb5d9VogQA+wEoaEOtAD5CmJL2LKkfd5xbbd8kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G5dkshg0c1Copx8K+fEoN7U0/r6mfqtQah3Ot7JBq8c=;
 b=ebe8/hOefgsHwRL3aDgWMrQh9GDVxL0WCRshc4NUVZh6+dQI8grpabvZnPMpjEARxtsvl7CCXu1XZZ+COcCJ8SjdM72rdhhiXJPLiKNHHy7wXkmDDNyUfZUGQYQIp4VZad811BhahULVpSy8G/6TG52Uxr1YyQjgxe+0JYQL5eq0BF8K+HCxZ1ht6fxgaOfRqWAt1y3Vm366xFyBEZRrtXsXXgWEUkgIgm+u7rYopIex7vcGamLHoRoxJh9nOSWlY+Xn6COs2F8ZUrr3ilZ80AQ5URHFCRmBA/8zfQ7BWDBJDU/7fpjY5UF8SoCtPr7LymfakVgmjXb1+HhN/m2A/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G5dkshg0c1Copx8K+fEoN7U0/r6mfqtQah3Ot7JBq8c=;
 b=lL195SNBqBua9eqABwr6haa5ha1pOErbDD9yklvEhtLgNZXtip/WuW6YTOxZlPgYBdovyu2XZhYAdHGKWKmSzNTf3hJLaEnriqSgoH/K6NhNXyaJOai/5VQ7oQQJaOoZdHVOS+Tj0z+kdFVM3a+AYTAi1DB//qxh6r8JdKX0HXo=
Received: from DU2PR04CA0277.eurprd04.prod.outlook.com (2603:10a6:10:28c::12)
 by DU0PR02MB10016.eurprd02.prod.outlook.com (2603:10a6:10:444::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 22:36:46 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::73) by DU2PR04CA0277.outlook.office365.com
 (2603:10a6:10:28c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Thu, 1
 Oct 2026 22:36:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 22:36:46 +0000
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
Subject: [PATCH 12/38] arm: dts: qcom: apq8064: Remove empty line at end of
 node
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <dbab80dfe63748bce2dc47155e6e5d40d1f9214e.1790892852.git.waqar.hameed@axis.com>
Date: Fri, 2 Oct 2026 00:36:37 +0200
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
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A00:EE_|DU0PR02MB10016:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d26b005-31bc-4b9f-8d6e-08df200c79e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|23010399003|1800799024|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	57akT9hwKZW/BoislLCargnWf/nWhi7QWVJrXhPC7KheXDdQ1KYgxrcSsC/9oYAUWunvGP6EKQkw/USZJGe7lpASEMvBKXsTh2QXi7tt4hbQNZ76A8W8NDdyMuDxarg2B8CR78KWR9JdWsRra8pUXGu/6OqnXPnL9joMP+E/29YZq/2fxmBaTg/CHvamm1A/FUAX/wBDlBi+kn7qyxycxz2a4s4nEcGSZJSjxhcJDywzIb1LvmtsgWSTq4iWB3dDDV7GVtLpM7/x2Jxntg6s7dRF6MY+BCTRP+1rox34dsQVSGzz1D1AGckZWENrOQ6Nrm9SlDQAxtY1onxZcugcTW+SQP0dZkwqwQiLlrpEy1I8Hm58jwCArbr/6wA7lFTcoOgCoNNQPGcebWLpMG37zgUCJUisCt5MnOilAy5bzELbYjZQPwA0Drs25eDEAOk35hmzus00BYXTEd9lzlZNTxojKkRx74tZ6EH99yQ+HqUBtD/36Fyy8/qWQzJFyagVhBiffM6aqm+B5vy/Le0BrkM7+qpyQqKR/J732SL65YLgoNsg513v7fipxyuozbXoqemK9hoH0/PswjzzObtXkGsxH1X05tOB29gahFSE8W0Li/iX4FNTQSSELyYncPRfBZDKsVPF+itDyt5KkKytS6GgOxEV2f+XceHod9z3jRusVCjDOkv401q9/JE59Aw3LmDBLkmFx3g8pzrT8IODSQ==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vMH21W2Xx+GUB6QmyZkJi01tooG6XZwTEJXraHmXU9zkGzn1XyIYvC29rrkeTTwmZHQ05YQ0StPiNweJpoOOX/kUzA7J17BqLNn0iJ5aHqTf7gyuB0pFVR4TWrV5MYXAm4XwkLjmTIJ1pr2Gcr+FwtIwCO76KK3/AU7ug+KRWTqea6BV8uKhyS7cuh14D4207WC4JWDF+CPUC808Yp+Co2wHQXLkE4fO81YXCRIg4XZOHd2CeDZ2AkBgVqlG+v8OdFYRPs9BeaJopGjGRxfHu8iUAbji7VkA2Pz1kTZ7V/qdSNlBg78z2GbGcNrYb/rWG9zVjONR4RCQaUmRyMfSnQkp2CYa/gUSaeT6WKdfFwOHNR+KvI673Ba6A13dvrMCwRam2Sg+0ZgbJFnp2StZko2Kk7DsgATuf58h8tVWOwZOraNqNk38WFiSW0BnsbUK
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:36:46.5877
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d26b005-31bc-4b9f-8d6e-08df200c79e0
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB10016

There shouldn't be an empty line at end of node definition. Found/fixed
with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts        | 1 -
 arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts | 1 -
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi                       | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
index bdd3dab530ece..4111834b12012 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
@@ -137,7 +137,6 @@ bq27541@55 {
 		compatible = "ti,bq27541";
 		reg = <0x55>;
 	};
-
 };
 
 &gsbi3 {
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts
index 7752f07973f9e..28bd88eb5df55 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts
@@ -395,7 +395,6 @@ tx-pins {
 		};
 	};
 
-
 	sdcc3_cd_pin_a: sdcc3-cd-pin-active-state {
 		pins = "gpio26";
 		function = "gpio";
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 0423b9380c812..150b5670e13b3 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -482,7 +482,6 @@ gsbi1_i2c: i2c@12460000 {
 				#size-cells = <0>;
 				status = "disabled";
 			};
-
 		};
 
 		gsbi2: gsbi@12480000 {
-- 
2.43.0

