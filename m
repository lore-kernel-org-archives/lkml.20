Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013008.outbound.protection.outlook.com [52.101.72.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09279535FBF;
	Thu,  1 Oct 2026 22:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894225; cv=fail; b=cbvV99oIUqUNuSj8xcPyf8yfqeRCVm7js4P0K/ku2Vai480W/L0XiJI+tRtGRCLgT9qujRm8GzcBCCf6LioHXcgXUtxQtDRXl2gBUwVlAnDKBavXYHLxTRrv68mAH34AwGaiqrBHObDkzRFrCyMwT5FaDKD3QwuCsV9ji5uogV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894225; c=relaxed/simple;
	bh=VYsgxZAhVzVRNllc2erQ9ORPUjz7l98UmOJKjvGJXjI=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=ebgh2Ynd6TVOMjvbCYuJzjOH5CitTcMch+5R5Kreka35zcPkPQ34AmfCUjp6H3cx9d2bGFgDDT6NArCjTnC9zj1dykq4zmb+IrGxDcV18XsEZTmhhN8UKGI+xKR7UpeuhVlBr3plJxkr/eGj3WnDVgB7EaOvrdCn8XZDDUv97ZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=LnBz4DGK; arc=fail smtp.client-ip=52.101.72.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="LnBz4DGK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U7Gf+A7nSjM0spRcacktmZRRJXvdu/sza3N4TpUt1/uM3YIXlg1awQgnJJsownrv1OfMrKFys5YacIPTd+WRD3r5Z2Ct+0IbXNYWGVaohyHlDs//KJj57ptEMIckYplYUnWYdD3MooeEOC3FJveRhx+05Y38XImxIipcjXjQC2UmaWEjJGysZneuPhTKT90KRUmkiixNxXbnzJkhiTFZXWgsrjgrmUOPpnJm6IqW8MLYpKxyFkgGZ+qyasVzM2bb/kndE1NWCp+1i+DcWARx44iSIOak7E4oy4A9G0XPNOiH3LwRQEYvcRDJIbc3E6/iTouSWeddM/Z9R5uCRwGbyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RcTz2SA9GaG4zHoJZc3NPpFoG0+3q4oylrb5GE1xyH8=;
 b=BwByK+50kKYHy/iRGoeT999t9IZ7P6LU1BVUUr/aulmSxTeBEY9Zn93VtqO1lD6JB6fUeby7V7yMzzaG65zSNZgQz+MqWCNeFKrrkCvbATrWzD89RpRNy3BBNxww0OODtJlbi2Kv4BgsClHXrSYPoYM9FyOhskeRr/T+MZeaRRY8luDDwA87qUk6o4N6Qji3uyldYn6bJMyrgu53yxQt3ksnORgcc0RdlfM6hd1fXhAVJA5A2tkSx75czxJR0DRd1x2dmesJaeB40gc01uahts3W87Mf8bUJadJW411mrnG8LtnO0fZwJurkkjQiWXK7Tu8Aum+H4J/kPwSt53k1ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RcTz2SA9GaG4zHoJZc3NPpFoG0+3q4oylrb5GE1xyH8=;
 b=LnBz4DGK18azMJoFmTN3niBbvUxdLO5d1avOwtnOHODr+sMSGfyE7GGu382/BFDZqd5XMAz2tzRFfrJI0wfdZEp+nA8TxwQEhVMXyxI0CbxxbKjP+VLCvz7COKWgERZKlq60oJroGzX7s4n/fC6BBw4ghuBLHYNE8dh2Jj9A6k4=
Received: from DU2PR04CA0031.eurprd04.prod.outlook.com (2603:10a6:10:234::6)
 by GVX0PFC545D084B.eurprd02.prod.outlook.com (2603:10a6:158:401::b1f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 22:36:54 +0000
Received: from DB1PEPF000509FC.eurprd03.prod.outlook.com
 (2603:10a6:10:234:cafe::88) by DU2PR04CA0031.outlook.office365.com
 (2603:10a6:10:234::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.17 via Frontend Transport; Thu, 1
 Oct 2026 22:36:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FC.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 22:36:54 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 2 Oct
 2026 00:36:45 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 25/38] arm: dts: qcom: ipq8064: Break long property array data
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <d8c979c34a5b49a7b83bda8101c5f74711a953a6.1790892852.git.waqar.hameed@axis.com>
Date: Fri, 2 Oct 2026 00:36:44 +0200
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FC:EE_|GVX0PFC545D084B:EE_
X-MS-Office365-Filtering-Correlation-Id: 705d8f1c-051a-4a9e-fe9f-08df200c7e9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	6aQB7AbK2zSCqxpkMr3PrrtHeImsEltLVDbVnV3Fco+T6hmc8xmCI2pjImKUnpJ9R02MIXrtHs9I+yPPhJ5JilVibd3MkHZPCQXAzU6R70mpVl80PcVFRE/EaoePWT+RAs9iOhzoxfQWy15O6cq0+9jBNuhtM1wHIl34p+oG7rJ1VnJK/o7aHUF86Ph6IVBPHZMU29Z81Rwtw5CdmzJKM45f5RPxBwu3GZnO8jytWxcdDWha0bqo82wAEZtRBk/hQ5WR2w1mWnLrzLSUxyYbVoVE3+dXt3llGqTUr1rwRcJNDHJlRKvHJ0w5VNT8ry/pedM3nGw5WpMzFbkT9oEtIMNuvQb2SKtiOXc8OagK77txRelHWLs62C+arkYc2AoqCCusxDtI35UPB7ouR9BRs9NqE/HAIIXs8tiirPrhWTFCSo0B97wEfn/Mv3rMxyCn+o5yVEqxOltRbdf1e7TknHYnXvX7f/kvtu9aheieUuSxeAEA2TQq3NRM8xd1Cu7l1uyiFKy7Lj78y/CGaKqj6vNyg1lcow+n2LjmZxn8R2preSnW2m46GCtIy9rzdfI7zc/nRtechiCSDE00yLH3sxmtlOCVUoLwoUNC+kGV/YTpDCO45d80/XweKOIPv/w+UpZoX1z8zCwczML0AP/n0eBffrt7eXjqsDfqVAqcPx3oITnmu2OHayp7OvpkKrgBLCgVn+PYRcgSkkWOOGwoSw==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1CB6QzdoHvaTmv5YHLjJ7RlJa8Z3l7Tq2mPC1U/pHpOIeGUj288f4NfSUCHY9kKhfui4E5nSaqLKwnmQbUjZT/KXlc0lXgnq7Q3LxqERisG0vm1hth5EV5i/4tqIrdKjkkV9TjuiTDNBeTmh+v/7ejkByMUjzEy9L22FUP5Y5puJFN54D/wifdggou1lOwUyB7zgTSIgQw7JDtk+qckdRQ3lR+gAe6LjfH4KP9opMeopGsDM5k36dqst9Wxper6RNGDLZ0GMnepbkkM+AKkXQijp7GKZUR8mX97eZYDDiKhJsmTWBJWL2j9moNAMOtda0CuiTSvLnirpT727ENFpzcZtmV3kV6Qyq4LQ+rU8Je9gWaKCia/f8XdaySkON7Q5SG0oKg/jqvb2kwZOqWGT1m+Lxtu7HSBtneu9hm6maClOw8pjtlbVsIPkaZhfPog+
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:36:54.5377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 705d8f1c-051a-4a9e-fe9f-08df200c7e9d
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVX0PFC545D084B

There is an awkward line break at the last elements expression. Put all
elements on a newline instead. Found/fixed with dtfmt (Devicetree Source
formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
index 14605d7666e68..346aef4a1d9f5 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
@@ -137,8 +137,9 @@ opp-787200000 {
 
 	pmu {
 		compatible = "arm,cortex-a7-pmu";
-		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) |
-					 IRQ_TYPE_LEVEL_HIGH)>;
+		interrupts = <
+			GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)
+		>;
 	};
 
 	rpm: remoteproc {
-- 
2.43.0

