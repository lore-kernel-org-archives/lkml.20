Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011026.outbound.protection.outlook.com [52.101.70.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E846D4BFE82;
	Thu,  1 Oct 2026 22:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894261; cv=fail; b=GdZ0bhbFwaVzP93ztt1SusEezQgoQuEyeTQqtHZ761xbZ/AUGjM5nGx/pkElyWsNAmfp7k+Iuk5S2coqFmFfE660xr9DTMgKIqnr5Lb8T5/fduavp3SLrRtLg5McbUMq/j0P488Cbhy7nId5j177cKpehnpLlDo+9qhLZSZssxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894261; c=relaxed/simple;
	bh=p04xr3PGm2jVzlSdsEMYMbYN1W+uwA9bN3vItGifl40=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=QRhh3vKIYh+pfBEJVmSvP7Ifm4OuI/yHCG1K2FSE9+UKimulkUtz+6JpmmgZqAvWHL3zk/Gbt9xI8j/06K2xPph6Xd28u6zJVCVm8oa20Kg68r0Kx251aRmQs5MzPH6UdAx3IS36kIHiS8E5foYZJLMk9F7cPfts6e0L/hqrp7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=b4Guhac8; arc=fail smtp.client-ip=52.101.70.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="b4Guhac8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N0J9dI9E0d5jtjEM7NKRKRIl9bfZqIh1gL4nUMXuqjSVV/PjRKHM0ISSFxk9WKhXlQz7RQ4sOL/EmOSvwJ85s62dWAZNauPjYx7jBE28nfSqnujLkMyzrc/R1MAZyD/6IxG9sK+J23YUnCn9pSL//C6AqVKpFKAyFAAIIMC+kfW6fGiDdRY66Ge8Ct0MocJ+64+hav2Ma68hPCGHpNRPRhsBB/j5O4hrK0ZOsvqgDxlrZ3xTiINhxbkgTVuOayWYRhdnAB2NtTvdT1P2N2KBvbHAKjRp2nU2napZywGM+SVLQajEUNUk4ufTTaYJLWJcW1Cll337ATMngUjOffaTtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZYvIwj2BbCr2sMJd+neqFdfw2ABZkQz23ZGMj4m983Y=;
 b=AFGLGGP1oTjV+KD6xz8nqjE6pLHuNOh1Y+gB+CvRjLmbKcnS+suzQi+24TH4TMdenQlA7ULpeg8dQaOZsFoKBFsnnHs1p90Pszw+wGrm7DL/ithQSj+iPUIZ+KY1R9XnXtcNtrVBANfxh8urys8SJPprveAMdgx5PgnZL9/UDqDt4g8bwIacffjCST4qrrXfaNdTAF79ySa1CHz5vbiWthN5pKdOOnMzjJjYfkSWewT+GRqZilyDTcl9r8FecTGbFRhI9S8s+4mxTMGneG8uPmi6tTNpWBbHdS5zqJud//ncLfk3Pf9UMGQWuBlBqewJkNKGjJz+3Pwpsov9yA6QWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYvIwj2BbCr2sMJd+neqFdfw2ABZkQz23ZGMj4m983Y=;
 b=b4Guhac8uLKugzXHl0+YyZrYfUAFbrdED8R0I5PBdn+OHOU2lPtIRqRow8YTwiWGOhv0c0qcj0/CUGf+cajggWRs/tYCLPFAAHxW0SPmx0PfGsSYhNBWqdcOlNvQwWXfJEhmKm9YprdhZTdsDgRYYaVJ2NtQGx2/l0TnVAjEKKg=
Received: from DU2PR04CA0043.eurprd04.prod.outlook.com (2603:10a6:10:234::18)
 by PRAPR02MB7833.eurprd02.prod.outlook.com (2603:10a6:102:29d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Thu, 1 Oct
 2026 22:37:35 +0000
Received: from DB1PEPF000509FC.eurprd03.prod.outlook.com
 (2603:10a6:10:234:cafe::8a) by DU2PR04CA0043.outlook.office365.com
 (2603:10a6:10:234::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.17 via Frontend Transport; Thu, 1
 Oct 2026 22:37:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FC.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 22:37:35 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 2 Oct
 2026 00:36:50 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 34/38] arm: dts: qcom: msm8974: Align closing brace properly
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <b5553955f03b7fc44d073451795b557668fe0a87.1790892852.git.waqar.hameed@axis.com>
Date: Fri, 2 Oct 2026 00:36:49 +0200
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FC:EE_|PRAPR02MB7833:EE_
X-MS-Office365-Filtering-Correlation-Id: f759d91e-195c-4840-9495-08df200c96ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|376014|82310400026|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	x/OcAO5vdZ4fhWNnMIr0ro7dk4Ck1ZMKW60+YG0r8B5rzqIhYCDyLySSqUm9BUrg8AFsA4y1Mfeeb0JUwVGrajgUyZXJYgs7hJ4u0ILT+RSKOAHdX6ZbzRC10bEPeNQ1ab+JXKUbtI0edVK4D2M2/Cmg2EmZh32wSKWLpLm7FyvRqFzTVQ/pQo8atn+WN5PNi+EabkAsOyp0LHcJo9wvQ+I7YJdTsmqdxbg0LYwAPRWmAq5aJCT1Z2bVofPsdF61bzrJZVZM4Gp7ws/qcg7lnsHgajpwASoMrkMvhAqUmF2GTaMplsTARQd6CXug43/rUuKM291SIiG9gMg8ZdfUkdPObnqLDJIpmUCK7SX9Sj0GMzfIisD8AYX8cmVGMIDFgkTZ3+lsqiRRRKvz6mZmNEAM36EVWIuKyXFwS6wYFqdUXEYjcvDwHtlRwC3LWDgrMuCMAs+PhUQxZVbiCFIm7oh/Z0mJ/MJWO54UrYGRxLmVgvdsihz9GEAG8m7eXj0QHljnBpnRZcJkhRAV7jvvkTgqluS7iGY9liLJEwSI1FyZlaTF6g2IQ0Q3ghza/kFuaczvN/hI/Xyfs/hrQeLW0t9Fj6vHzxB7Ef4QI95Cv3NP5Soo4whKX8aC330kAuyd0Whg26Uj6tGf2aBSctp13kI5dvj0AT8eXxv07LHEdOt45IcaF/yRWGxuJ7qF9D7N7tZyyZRq6TSSTiLNMTaKqw==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(376014)(82310400026)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	T4kPoLeV91pbtJK01q++yqU6VXftaiqyddQyn/aLL+y3spoUKim/cFqJtECDqBcqKADyfHwwdaOMGJmdJ0PJAVrw5mhOD/O9oun1S2k8Yr5PQhPqj+u16meR9JsKeyB56B6YBNdAdeWZ7fPtYEi2bB6XB8mKGJ6KIgwnscfuN5zprttwJ8OjXYuGQ9VM8J4Z6ffC5SuGh1A7cRhNm8fOjdsypDIxFm5+fdLryZQioX7poBu0pA6LFQVTe1jnJMdSMGDlKcyLtQRUuNOZLXOuK/RFWg3N2apv13Zsp2t1AMWGqOi2SI31V8YOLPrMcpl42AGGcN5ymFZy9B+YDu7Fh6NmiPBpIarYLwXD8Z/iLjwXJamFMmpaxZ40w/AGzul9Ymwt1TgRSTs4rOn5DOSeL76oylkcLd9z74YF+hReklWcS5CDVWYCt0ncnwPZQ31O
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:37:35.3386
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f759d91e-195c-4840-9495-08df200c96ef
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR02MB7833

Closing brace of a node definition should be indented like subnode name.
Found/fixed with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
index ccf66f45ea7c3..4c2730b34cd1d 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
@@ -867,7 +867,7 @@ port {
 					tpiu_in: endpoint {
 						remote-endpoint = <&replicator_out1>;
 					};
-				 };
+				};
 			};
 		};
 
-- 
2.43.0

