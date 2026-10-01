Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010017.outbound.protection.outlook.com [52.101.84.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CDA486419;
	Thu,  1 Oct 2026 22:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894217; cv=fail; b=PgA9nGH5x7n9TWSZuMHRAlor+NFx38y40oyUUfy/tB11z2psnl475Jpe5b26i8XlMQ0M326Zq2DF/zqZkFvjDPk9ay9aj4X9N2wRvoflkeFYntFdVZBvodyZdUMp7oa+ipofiiYbtMa6nf7oCZ4qTyyzZTzf03oyWHHAJViadQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894217; c=relaxed/simple;
	bh=36YMVUPcuHOpsKBdg08SPMlWQg8MvJhz17nstQkdAFk=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=MYEKW+RgCdHZu9Hi4pXx/eEHN5MwR5z7QdGHbtBTW/EG/Ns0++CLxyIlXTrVAA3kcZar1sGrM101enMwvqhnutbt1qmwX+WrEGOEdWvbJ/wkgNyQWhfQxr3FdmqeptpwFi59dxBm5wbF2hP1lVVyk2fLtiIRO4UOFSZ/GsGas0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=agt3ah6L; arc=fail smtp.client-ip=52.101.84.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="agt3ah6L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dDMNZonPilRfRPDjs8EcBPLJou6XUgmD8w7v8J+sfOouJnEyulwFB2yGOArDDYKsTaE3Vo+p8rhpolkrulJJP8ptdPlXmPN9Vd7XOnA1klwpnpWkZvzVslvDcEw5Hm26JHG7+obJ+g8fCYPi5a/55Iq727/1IEHZkFJ7ZFdhVaETz0kKxgGOWKtoeag+TI4I51xEB+b+pdtjSdq0LxhLpzlCu9bDWvCoQZ2yZyfBzjxaImcaLvCFbgZ2F1Te5Q7hq10kEuHxreOxlL0qaiFpzVvUmaeap2Pzvw/wakuP1Zr90oqM9Bc/fK13EKmT4dmTMG5/zE7G7PfAw2/HgqUHFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZbJQMMEAZrr82hYTe7ay4ZKqtX95WgMDPZbL4qc42Xw=;
 b=td3WHap26XQDlhux39V6wEooHi7GQTOYM6Be9cI34GcdOYBxzSPIj0FVCiaBMYLakYnvDc7Ja7ABxHXrO8ZfH59+DtWI2XdTaBqK2CqQoyuH/OPutHR1QG6duvE/AoODKB6BfsbHLdlFbG4pKWR8U9oaolN33BIUFItSz1sH0iL1t+RH1KzdgL2N6t/T+3/LvNhfBlPS3VUaF+TXsRXLoKgpib86IO9VLUGUzPH/3/4pn7bIVdB6RnbkvTz7+WqNdOLXNGx6qiW2BNL2duuJrv0Ql3tA0vdFedbRGKSVAj/ddw+IZvjMW9BSiRX6GksQpiFIuuBJ8nRo485PXS519A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZbJQMMEAZrr82hYTe7ay4ZKqtX95WgMDPZbL4qc42Xw=;
 b=agt3ah6Lbw5tw3WYVmfYk2oZPzLigCCARFTckpGEEfS6VBSImBxseLncqPuQ7XifueiXQK3u26X2NEJ62VB2Nh9dWZNWfLSN/xNRzQkZFYqNQ5oeMURpwj3rbRNlyCFDj4uhBaT714FwD4lrbfpw4pzXK/eTKgIGw9I97orzSyE=
Received: from DU2PR04CA0291.eurprd04.prod.outlook.com (2603:10a6:10:28c::26)
 by AS5PR02MB11272.eurprd02.prod.outlook.com (2603:10a6:20b:6ca::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 22:36:47 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::a0) by DU2PR04CA0291.outlook.office365.com
 (2603:10a6:10:28c::26) with Microsoft SMTP Server (version=TLS1_3,
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
Subject: [PATCH 13/38] arm: dts: qcom: apq8064: Add space before line comments
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <bdb549b57918f3d06694769b7b9f5c438980cb4b.1790892852.git.waqar.hameed@axis.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A00:EE_|AS5PR02MB11272:EE_
X-MS-Office365-Filtering-Correlation-Id: c5edbe2b-c413-4b2a-0dd8-08df200c7a4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	XbElAYa7Ia8vjY/jcCV7vjsPKQWTh34NnNIWdnLKya+53AUAsLMNaQavZ4iaq9b4Kfonj4cCCiq1hMEgk4EQYo0Cx+V7IpRkqTp7/a0CS72qSqiE75LgmJTsW5jxJXk9KKwluk190xsCMV1TUTrocsBHqsq94DX2T1v0wc+pVncI3Qf1tA2zuRLtEoOv+Ss2DBrcwFS6o4OWdVo6qiWEaT95GORBeeWzGjXhrqBnzo6mgiEOMR5B8EyqByRyTQ8Oby+PCQ9ROOQhO4vgKfE+Cv15IFyvC37kvbw3a5t6svj3OE8T2f6rBFuUMCfVQIqOgk5nMXiQLhR+Z7tWws3GgyILmhTg67/MJC92HjRxvNRatJjSEpMrDUyzD5c3NDCY4lfbcv6G4yS6ljT3wK1P6wfbj4t6InOEvzaB3Q9/tgWLmJJcE/dQsZjqT/OLI+sVXOenWBv+oll4c2pFxCMFxcSFGXegAoX5+bl2n84i0s8teDqwGqEN4xO56twp6/B2SMmrSJ6TLtNzXnWhFPT5/2PKD+wJ5cMIRsPoAXcmxcbaZcsb969TtyN+o11UExpq1jk8KaAUek432gmCk4vec/W/yLOrEVpnDyNjaMshDbX5BK2pNvEpBKLaV7YmhHfVzq0DskhSJ2nn/LuK6lhWa8d42+xiSNrh9jOdvlgj1FLrWuyz6mU4py1BThGnkUGmo37U0SnioMXaMHyh6vmNyA==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oJitMuHLHZIM4kiQA3FvomdKy5AefCSTpP4vqgtl9aKQdXI7hY8Dv4Wp2jV8BlpErLJ8NrAHA2LEg4cFpKmRc7XTtuSf0TLxfgaDLZUqxemJsLyNXxUfK1OXSNj3hyLYCGiO6Zw9ckHtD/wnHoOHiiCh6L9uA5HNtok77nEdvSm2rgrlR8q7dkn5WRTPWfeT60LJYGB4rML6D4WUc9mdMv85bIZU47Ml26KGN29VcY9A9KBhAdntH8KNpUKwZNpIi2Je/8uD8ZyI30/cc6mOHVabDPZvFZMb2Y0kelaN4L6cNC2MBiFj/rs4z3vUV7h4FJ19NsL+L9K+pH0SmeTjwDRrNg1PPiXc19a9UkjUNkjE3m9VEpBOGgkbFeeYEV7jgz8ZULaNrQ1eb2d6Hv3/+Ol9cvgXWRWBJ88l9QBBL8TIjx7AM6OHrIdzi0vdpk1C
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:36:47.2796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5edbe2b-c413-4b2a-0dd8-08df200c7a4a
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR02MB11272

There should be a space before start of comment delimiter. Found/fixed
with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
index 4111834b12012..1ae9de453ccf9 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
@@ -79,7 +79,7 @@ reboot-mode {
 };
 
 &dsi0 {
-	vdda-supply = <&pm8921_l2>;/*VDD_MIPI1 to 4*/
+	vdda-supply = <&pm8921_l2>; /* VDD_MIPI1 to 4 */
 	vdd-supply = <&pm8921_l8>;
 	vddio-supply = <&pm8921_lvs7>;
 	avdd-supply = <&pm8921_l11>;
@@ -114,7 +114,7 @@ &dsi0_out {
 };
 
 &dsi0_phy {
-	vddio-supply = <&pm8921_lvs7>;/*VDD_PLL2_1 to 7*/
+	vddio-supply = <&pm8921_lvs7>; /* VDD_PLL2_1 to 7 */
 	status = "okay";
 };
 
-- 
2.43.0

