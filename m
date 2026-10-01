Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013006.outbound.protection.outlook.com [52.101.83.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB634E0B63;
	Thu,  1 Oct 2026 22:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894273; cv=fail; b=rJXpn6/bkQLeV80yWDo7pasmt0Vu4xnlu+ydCBfI+A+rPe2ol/r/y50Zv/EW9kTxUaUHxtz5TSq22CXgjuXZ5gfdBchEgJkgk6ZmPS8xFo74DEjCaD+2+7WtA8RYD9cBTJ+WFWPjzuLnCe0IWAWv4f83yzARnzRVCBsoCPQ44WM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894273; c=relaxed/simple;
	bh=1RM1GDFQnRypMoFnLba04i4/6H8m1vTZjUPR8xxhW9U=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=j6aCS2ONfRvVQJ5D3t8Y7eIWo9nuvYsM91Dj/oUxUBlcZzrPoDxkYLch2KoSz8cfW2bIfQST6mi66u0hC7e5AymT4foGh6fS7Y2ombb0zV15fjpO35UM8UA253I7SYnLxWjF9TnLEFIxvh25W9CWgprYRICLO7aTZe6DBzOBERk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=hpzYz3SJ; arc=fail smtp.client-ip=52.101.83.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="hpzYz3SJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WLjlxFcq2XLER0Nmm4mPHydRl6Cp5OlZGSRucCoNjPjBIrxob5lfijysd8Zg5dPtOllx0c/TRzAaxyq32HPkR0eW3XZkargcjupftE/hXHhmbo74h5Yc3EP/XQWYxF+OT14iw2YQ4wq4ZtcSwxtCM6L7gRQtadBlLvAHOFCgCqXAqyspBc2ks2S0f2gBznlmr8wbzIocxXXeApQ93saeVK3XPnqUeUcDdMhZDVr0RDnuQ3mv0wjuQnF/ADQ1umOAWvenBaZAvSNIDKcRtASwi3LWMtB+sAXNfJOM1JtRGoc9mIvKw5yT5p0j47J6PtVq71sLsS+x79MO2hLDidiIGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kcAiFTC6N9w3bYZZ3eGG1uUnWKSTUyeUEUUFn8v2MPw=;
 b=WVgVVU8y5pzm0GodxBR47kHHMNgsSzWGee5d0wPR3X4G6WrdFwfFlooUkBL9K139pZX0SongN43LudPOT0aALAcbkIY0QYAfRbSaK79s3olnfSeXItFQ3iM2eWIFX/ixxHvGHI4df8ySOA77MNfAY5/S5gO3TVuZvIIt+HHHeJmAmBQctKliIWmI8/MkCvpR4HOEFXkMI1wR9ugz2bw7QVHBXS3PbfU1mI5MnUx1sE8r3cfZGkOY1skQPoQZb8uxHyxkXEWWKt6xLJG2dGf1BCjVcFC9YQn2DkS8pNlbE2v8lEmDn75hyo4dQw3eRV6pCR6jmJJIDOouxbbA/6J4qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kcAiFTC6N9w3bYZZ3eGG1uUnWKSTUyeUEUUFn8v2MPw=;
 b=hpzYz3SJakGqPLvDuAMtsOaaKkSRNniG7KM9AMf80RqCxGiceJBWFj4HIRuGb+2k7q8I7k1Ak8aOb5652IOq1GNHUDNAA9Uwel2T7Kxd3QtywDOsVrNGUO/dcRfXgLVu8FUhdaHRuE4Kmims4cLVGgED1gPoKCbb5s4j0JeOvuI=
Received: from DUZPR01CA0323.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::24) by DB8PR02MB5836.eurprd02.prod.outlook.com
 (2603:10a6:10:114::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 22:37:37 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::65) by DUZPR01CA0323.outlook.office365.com
 (2603:10a6:10:4ba::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Thu, 1
 Oct 2026 22:37:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 22:37:00 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 2 Oct
 2026 00:36:49 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 33/38] arm: dts: qcom: msm8974: Align multiple property data
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <ecfee840a4884f277a73924d9da6831b85269e26.1790892852.git.waqar.hameed@axis.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|DB8PR02MB5836:EE_
X-MS-Office365-Filtering-Correlation-Id: 74d753a0-baba-4800-4e7f-08df200c8246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	eOeD8MGeKJHHmhvaCaqMI+OyRjPOoGmWSKr7oXlna1pWetL9fPWUMnipO5j4L813nmvx6ZGbFaSoaHlWizlPqf0gFh6khNYuv79b7a6I7b6dIdXCMzLqTYX1twEUc6qQNB2KbbyqkQ73zUAcoFIGkK8c7xJWsM++etGhipyuN76vSMQo5BZgdTMnZcV1w1/7OslHnXhECYc1aCFE0PRZsAFzD/cWkVdqYhyBj6fLsBuRWAb1S+PQnBc0MJFgHth8AJL/n/xVO1y4FpAC/rslsbfy+j8+0WQ49JCzHlCm7G00Q+JP+F7XumnyR6v9Sg2Jjw/2E7scrLnRFdi3l43DS7COIP6fb9HSMAFKyoPPEb3I+bFGc+bK2RhHt+c8/QDMGCnQ548gWXp8F5tfzh0M1fQ046zcT6XKg7NouQj6NuoTXAyerda3g+nm4nNRWkHHn1wqQDgI+8YOmm72wpHWyVRozDTcF5etCmxLp0eaZVjZp9FwyuaYYFof1d7Hxlj/dWQb7klkFgzHKYLNm93H9IfSUYeKubbqBcBmh4x0/3nqlbsT02Jz12jfoKFbeUw4l9WvJeljBSsn4iHb3dVF12HAuNwiB9IIFJq8ZWiYwkDJ8OsUbpNc+FCvPBtkiLTXRFxqa25q12SLZX6yJVXVW2Y/JVzImwvkj7XbxgizAykQU79VtZrKcrBl3yLBPP84lZC6/TIK9qTvbBsbAzlGNg==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dMnhUioXwTWN3l9tlIQZJjCkH7+hFtXJYLOYElp40I6+5XDCZCJ55JFy/Zvtc3DvCkABmH+grNeWEV9tarL+3f3toWiLBQ0SF6jWdNrOBe/D2zSLfo0GymcNTZ5Zb6jvAHZlimaj+V9JA/h6s+PkSLLwqZRyKUv/rQN5+yQCG8SiVCCZyISOcIRuRH5gFjXl2p6OMH9vY8y7RK6deLiLgxLirqmyEIe3aRJfaLOv8YyEz9zXxEUIOqPSMVXtMdZxJtXmfqbPeoHydz7JkTxmi5VXgim53rCWDKM0geVY4tMgw676IYj4CrlORcDrQxJtZVODCdaRWXdTx1hE/ZRY944N+LzVIDO3IXZ/DdRVJVwdg1DJjlr023ItM7FEvfgEcs2Jbwnhupr+tRmsba41iUi9aNrH06B5GT8jLxIUwgIY8SGIev3NYBkKRp6IXuaB
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:37:00.6763
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74d753a0-baba-4800-4e7f-08df200c8246
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5836

Multiple property data on a newline should be aligned with the first
one. Found/fixed with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
index f300de74c47d4..ccf66f45ea7c3 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
@@ -92,7 +92,7 @@ l2: l2-cache {
 		idle-states {
 			cpu_spc: cpu-spc {
 				compatible = "qcom,idle-state-spc",
-						"arm,idle-state";
+					     "arm,idle-state";
 				entry-latency-us = <150>;
 				exit-latency-us = <200>;
 				min-residency-us = <2000>;
@@ -2228,10 +2228,10 @@ remoteproc_adsp: remoteproc@fe200000 {
 			reg = <0xfe200000 0x100>;
 
 			interrupts-extended = <&intc GIC_SPI 162 IRQ_TYPE_EDGE_RISING>,
-					       <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
-					       <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
-					       <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
-					       <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+					      <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "wdog", "fatal", "ready", "handover", "stop-ack";
 
 			clocks = <&xo_board>;
-- 
2.43.0

