Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010069.outbound.protection.outlook.com [52.101.69.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9333C0A00;
	Thu,  1 Oct 2026 22:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894274; cv=fail; b=KgGWBfMXWigW3QzzbK3pKyX2TcqDvPOLujw43l5IkPICXWCkuK1GDSqHdUED3+V0LnZ7a14UctVWXZYm1Y2HmSnHullKl2BSiItv4+17uPVFEZJKaqoXflLWG7FhV3bpwgv53YSqsPjOKtCb/zsmOlFu5BN8BpZG/09hsP3OJok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894274; c=relaxed/simple;
	bh=/sv0SaxZ1xDFAiHcgd5nvGwuNje45XinTiGGg4nfOek=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=FrK8KXTSklCcLvKD11KMws086IQpefd5kaLukJcJhu8Htg0SFU1gmIRCM9BsSdFAikOrJuD9/1SmQUMpQq8C8hwYMBc23HhvPiuYg6DsflHZ3H4LOWRvc07tdaMU8QaQ9GMqMxi5dpH6BSP+lSNqbCCkbLpL23mFHT0miT4WA+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=bbDY1AY3; arc=fail smtp.client-ip=52.101.69.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="bbDY1AY3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WOZAzCLUwb4AJPICZQHmZI8zdhkyffQufbhaA2LykVskZsmh55wxQyjtwZSh/6Z+XvQfZl5Q+yDr3zq3W+tkcSjyuIeABLcyT4mOgk7VWrQdu10y2jqL+9OHwsN7C1HoPv/ktI/e6X+er4nQ0BdJ2ViRHPQM0RtHeWhj7pjXB7hGbgfFiNLlfnRLoBougzQ+g0lGIn5P/VmgoiUJLm82KEzWkZH//KuzkUGBG0w1J9/bOjjGzq/8AlEuHtNI3KopMxKr7sA3+A3VDNvP0w4YgsLZsw+/FBMUUKPTEGWGJGMo4TVjfWo3e889fjDLb99yOUPQT8Y4JDp7EZq5c0X3aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cikv/9bFzcyx7gwGS+Ym5NrPVazN0gN2cbJ2LxyOVSo=;
 b=KGmEOUH/pdieGXs5ra9QVV88VjaSGeNxxL58KGGYsSQqE2inUqpkh7SJo4AuuQfLec6JAgkN5KfYF0emubj0aZoQYgiiC2RYNfku5DQK3eUm6VfreHBNv49mzUFthf4JOV1OqCx0VHLnA/90d6FIAHw5TRGa7suEI32ByUI2dcod33Fp2mqBhxC/m23G1hhkVRthNyHlTAb3p2PP/LAjy5grLT5ROiRwVjJn+qj7w2fdq7fv6HLZTy/+EfnRV6/xWYNEiYEseF6KoJTDNsMP3JaHbCPxPv//gU9TPyfk7OeMgKoljFnn4y5u0rIVqOgR5EzRRbWQ9A01aDbrG25SLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cikv/9bFzcyx7gwGS+Ym5NrPVazN0gN2cbJ2LxyOVSo=;
 b=bbDY1AY3ehAyXowhfxnmOVjJJsHLS1neLQj5lNth/bVf+CMKbwACl7a/i0c15vDLmuqIen/lUCw2PLrLBZCprSy91Z+m/F1zxft9u0Q9fAiPv/+1ZCR/n/Nd0rSlNfmEOjxE82maUxb3B1R87b4ysYaspLepmEt+3CCNmGG2dPM=
Received: from DUZPR01CA0312.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::8) by GV2PR02MB9589.eurprd02.prod.outlook.com
 (2603:10a6:150:d2::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.27; Thu, 1 Oct
 2026 22:37:46 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::88) by DUZPR01CA0312.outlook.office365.com
 (2603:10a6:10:4ba::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Thu, 1
 Oct 2026 22:37:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 22:37:46 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 2 Oct
 2026 00:36:51 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 36/38] arm: dts: qcom: sdx55: Properly indent subnode
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <1a3594753ee5f823f9de863dad39bb508603860d.1790892852.git.waqar.hameed@axis.com>
Date: Fri, 2 Oct 2026 00:36:51 +0200
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|GV2PR02MB9589:EE_
X-MS-Office365-Filtering-Correlation-Id: 266f3cba-f3bc-41cd-b87f-08df200c9dc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|376014|82310400026|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ht3JaeACiNYjiQs5fIx8gy3WpuG2f+X0A8BOaM58knsyf8CUpClqJ5EsXSlSXxYL+rgOT/PbUbYZTbF1X/MlWnLjGzbPOC5bMwAoeyJfjKlxYPigXfE1ix/j3fAGxKlyMkFKaK+XJFtay9a/ypntvIP+0IvpW2ugB2+jFKfwtSdIZHqSPm4wnQZaDnRzBYXRAgQfXYd+CPk1HHs5VGh81YS/j8dsUzHbl/S8GbNDTIEPoBu9VyUt2ErKRakDYZhlWCUVqpkR+ifhrmUKMLNtSJEcDtASUQpg0yFIX+8PxKPZ2x6C3Gy9/BQMjB9ksrlJJWZEO5cffV7ob5uAkpm0UWC9nFyYPZVgHHCBGXru+2rjWplrcCqb3JU4zbVPaPRbHLiFIRTO4gDO+vy6+rto6zMZsS0THcMZ57p7ILOZUO88kG+z4H5QRtZb8K+AS77CbkWVXlfar1+4zHnHo9mCmSDidTi0vuvPhtccJA9vWHyMmzlrZ8p7yr5COQO++zM+sGY+MVKhO4npg46LwCrnJlKK5IWmmCgw0V6aPsxybDEGAlPAilcadsNaziJBdIYhNlcZ4kHCXqFexVXLOI9oNWhJKVgfsYUYSOAv1BfkNgJI96QZXdhkbsgF7mD2LzyqpGfRH/oIhLg865CH22QF1DghtcS/Jp0y/Bq5/XFGSCUShKNS6oyGI6NYUIJzZpTq5e01LvwdMavjErQuZ8lgWg==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(376014)(82310400026)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	loBZ27FZG6gRz0r9kcWyu3UMeaq/ErdvSqLZYQmtddcuFSp2NWqkJTLHb5/zoxX0ibta8F6bt7tkII5CgfEngA7jXbW/1yAGRLBOW7WvdsfyUcTbhb3vPw3jEwIddAgu/fkwnlKpGXRbDkqk0YSHINmtvmayG97BYXkA8Gr72QylmYwaKG5HlAYrX6a1IZ32+tR67bHuRKxGxbt59CnKZAdIod1oTDLFgWGvFQdHLRSv12tLuZKF2QBcKC9Yb5FDkI2Tzp/gySE3ym1srZkp0LkqoYQUSvH90jD2n1bKh/4t4UDXpuzhNGcKkJpSDGmOMnz3OnKAEYcUFGLdsQrBwZcfzWRD972KN7Wv0PU7xVnYqqsK9zK7LX4gXtN556vc7VNF4+tvF9RHgqXSlln6K1IpAGQwfkCKgtirTqXP39gCF/6C+hipnfKgxGpt57Vj
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:37:46.7833
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 266f3cba-f3bc-41cd-b87f-08df200c9dc1
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB9589

Subnodes should be indented with tabs only. Found/fixed with
dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts b/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts
index 0443a86899a9c..cd57292e3bfd3 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts
+++ b/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts
@@ -297,11 +297,11 @@ perst-pins {
 		};
 
 		wake-pins {
-		       pins = "gpio53";
-		       function = "gpio";
-		       drive-strength = <2>;
-		       bias-pull-up;
-	       };
+			pins = "gpio53";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
 	};
 };
 
-- 
2.43.0

