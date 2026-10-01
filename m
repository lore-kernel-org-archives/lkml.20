Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013053.outbound.protection.outlook.com [52.101.83.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56B553A388;
	Thu,  1 Oct 2026 22:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894227; cv=fail; b=fHESBoiV7EhIvpCVzwUqnuGHYhCzBWRDbAWbHYiAi5ocbMUZ2q3mTmnynPZFQAHxXbeVQqsmJblcHK/FRlHNcrIi4zAqGBZdJnXi7KJl/GgptcFOjkWf5eeqh05hUcAeyc9BYgVDDo+r34DITcmmzWzgUSJDmee0ZKgL9+eXz7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894227; c=relaxed/simple;
	bh=I1Lrj8OOjiTg/dDuWGCxcuCJA0P8wQklIpopbCAV/Vc=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=Mm/75G6oRLIX55GmERBX1pZ+Xw5IE6yrPhszkJtpXWLHbX5mqJYM56Dx8kATWbolVoUPQEFtqlckcAl5rYkPQKq/+ESRZBr6jnZbuYxhCpx9s+jRtFO3yhm5pINSrK1u2nc8tv3F+0SEpcXQc13nxX2LVNcDjsBMJXp/GtP3LnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=EnFc+TwM; arc=fail smtp.client-ip=52.101.83.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="EnFc+TwM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uh+hdyoPFk2S/g4Kmp+yZnsq9u4LgFotzStN/mPhUGpj1TNko8LPzpZKpfRX9KiSXvv+CE4HSBhzOqukFIFv8hI4q4Im+M5HBkn95BPBnTbjMjsL/GkqEMyOfzwaJermf9WRLE2XTJEeWwNBrkaZn7QB0JI8p1OYZNUOLx8H56hLxB7FvarvLNqx7OWDQHMkPsi8Rw15AlWupjwp3yHh1Rw2qp/VvdgygkWEv+cM82SsO3um2EmXVbvDPQ53GExTT20GImSKhYkMM6njvuVbv9cpr7JnXqJ5gRa2CpBfAAIYNEEP64BnDwY9dhRqpwmkw44gohsyopPzcRSN+lM9Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GbB8JNNTkw5X6cPXRif1FACBdsPlhsdjpRgb6/Z94tA=;
 b=w75d7aMGN9muM0blpxJDQOKM4ZzEX7w1F0gNCwMA+EmEfONHN3pgGESK3zWxP17IjSMLTKzuJF5Bc9HDaYBH13MpMDdGcvHRwKsjZmI5c4kZlcbojeETFz2rzWHFg5hV34YK+YzKO6nYJ/qOtrWE4taWEfMntdvX5wAo0mX5lYhFYd9ct+yyaBlf8oDUAOS/L/78vZrx8Mz3bbD/PrKqPi0P9jcbuijQD5T9oMk4GG1Z8SY3bT3aWrZuNNeaAPP7HBrRosXXerlf3+O1HIp3jjCllvWX1Bo3DCcD/0iKEd7aXHOvhHAeuHjc5483QYELTWR+DcpBBDJ556OnThzHKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GbB8JNNTkw5X6cPXRif1FACBdsPlhsdjpRgb6/Z94tA=;
 b=EnFc+TwMeFa4AEScnmpz35qc0imm4va9DEteQWt0KLcBwPfc/EKxzhCd+yEe3txTQSxIAIYIvhoWiuH4qjb2K3gpnlb3eOj8aH358dqDp+pc4rtsaEzvt1E2qlzda8VIt7O69eeA8HmELCO2qUd0gab9wTBUSYKKgIAdSbI1cOo=
Received: from DU2PR04CA0274.eurprd04.prod.outlook.com (2603:10a6:10:28c::9)
 by GV1PR02MB8857.eurprd02.prod.outlook.com (2603:10a6:150:a2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.25; Thu, 1 Oct
 2026 22:36:55 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::26) by DU2PR04CA0274.outlook.office365.com
 (2603:10a6:10:28c::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Thu, 1
 Oct 2026 22:36:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 22:36:55 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 2 Oct
 2026 00:36:46 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 27/38] arm: dts: qcom: msm8660: Remove empty line at end of
 node
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <737de4712f52d1ba198f9201cd2581ccac7b938b.1790892852.git.waqar.hameed@axis.com>
Date: Fri, 2 Oct 2026 00:36:46 +0200
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
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A00:EE_|GV1PR02MB8857:EE_
X-MS-Office365-Filtering-Correlation-Id: ad043843-091c-4c03-28ef-08df200c7f64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gUCoPdcRenl3zUdADZNNduWZU/WauFl0iCmvadl/cC1rLtO9Qj1GAIipV+35B7oTwOXG6lue+gWadpF8jla5OFcYraTcF+sxMmv7sEPxOcxxeNMwILplBJF4zsReLgZlBlRkuXzuFCChnqXBZJ89h/Cz5JDMxXrkdU1Qya25GE3w/TzayDRztuCJozSRz9xCgSUA89VOn1GCfk030JorW1cz2fPKY2NYxx3OrMUbh/lfp6otcUlklQ5Qf7yh+/PwSrXaDF4Lb3ggyfLtcCQsJ0usCvV81EUj5xoY7JRHghkuEPIxwRfqyg9rWkCr4k0OMUGnsdUrMPY/HlrQ0AOVQHI5Jf9rR8vQuwjnUjP6CzxqNxWKYFoO3W239LMXOMe3vRkLNqouTL2yZYC7wXmYgih5BAqv4vo6FQRmcNKOkac8s8i4Keorx9uu1229hbcD3DiSK1ttad65kZW+GOkZsynQr+qekzrrIJgUvKZhUny1Hwbci0Y/e07Hc+UTJ1yDYfLQ3DxktWnm6lxQucgxd+da1QJb5zVmB1KY69x8cI4PqN46FRN9+mYP8hUkyhQcF8eCG/6b56mr/SBx3Hm+xFP2nL4ufjySt/7xgfGQz4kUqXKe8NPbWSWTSKlZCXpPCcG0keI/SH4kTQ8HEb/VfYz4mKfVTkTK1u4bBQzkIrM70zPHQqmW8Me3A+WDantHUD28wzWMrnIlstly2ezRzw==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GUlu2vQJR+P1jB8UOK7YeTYNX1HHw4IFbyFWls3rIAbBvARTqF3Ugz5Lr99N+NL/+VyO+uafkkoKNeGU62a3v22sYQORKBDiPsPEbpcnFH+R7EZhWUHRyLqvLL1xS5eqhjyr3Wu8uS8aE5iHI1lumVj7LdXmQPJLCyySEOWZ0DhPDggTjZIMNzu5HNOV4fJugeCXaEb0Q9HzyNkCUIEgPTQnedSzDY/XejfIuinwKyh5ulAdvRIPG08tm27fUGe+OBqNAub7esdbEwTQawjFRdW79CPLAcy/W04q6yFJBZsFJfz3vBQOGIDCLmhvTrQ5gQQsEPRK21ri5a3EtR4cfe7t9wMa7+hEgKHqB/8KIMQQhzmfp3GoYwpDY9fR80cbpojxOMoVdlG5NP5o0P7Hug43xT/GlyCCAOZ0GcUYPnz5xQUNC5TbE4gAqX310kiW
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:36:55.8389
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad043843-091c-4c03-28ef-08df200c7f64
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB8857

There shouldn't be an empty line at end of node definition. Found/fixed
with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8660.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
index 3f69b98d0041e..7440ea621df59 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
@@ -107,7 +107,6 @@ tlmm: pinctrl@800000 {
 			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-
 		};
 
 		gcc: clock-controller@900000 {
@@ -430,5 +429,4 @@ tcsr: syscon@1a400000 {
 			reg = <0x1a400000 0x100>;
 		};
 	};
-
 };
-- 
2.43.0

