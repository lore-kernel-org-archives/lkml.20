Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013053.outbound.protection.outlook.com [52.101.83.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7392535FA3;
	Thu,  1 Oct 2026 22:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894224; cv=fail; b=F980IzVuMkxq2Nn6+PzGu4fIrWTxCRVQjQVahFj9hTCmr3pGc2mE5/FS30I6Jfw9591v1cc8nZuswuNlrwoKrEoCmRfOmn8s7UrQXO6jSQOHHKSKHzaHyUU6fc6b6/BYWC8jCtiwBhTaFT0PROJO7jQ/k9gsWbf/bFUMZldD2K8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894224; c=relaxed/simple;
	bh=pkLvjY2caT+Bo0r0a3JR7EUNuHCfq/EhYHxGEBdpHZM=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=hQeT5dpO/HCtOcJLTp1gWWxhzGtoAnumAJmK1cThvXAcPLoXHLKrOKI/AMyrHKcytCt0FXKwkEoaVWvE2qnd9YJ9Dj7SfeOPycch9pl6LDlR80IL5MX5cSmienQg3hauPi/74QynXcFxF1Emlf3sr39248DI6cxV2UXe+i38Ijo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=Rcj9BTrx; arc=fail smtp.client-ip=52.101.83.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="Rcj9BTrx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aR2i4oZeFZCo5GS9gX2cg1vN9yIS8gndfaIAiNKMpzOSA7wED84pFWkEHoDBNnYvMYbf93FEynKMurhJwJvxIiUvF9tLivJukiGYTMIHs42HyEviJdYt+C/gYdHh0UvkyfdAJgcP/NXYAbekmJihGfsIMGr8BsHtLRWbnC7kZF6vuI2hW6Wa+mWMkiEOeCShQYEziYhzEwTc+hPzcd4lwZm2pdzvdtz3KJPjl0D3fjQC/W9KX354Xae32rtmS/y+snU0ZnfBaEVR+q/JfomZ9SOXcams7PvSm3pvWhq7E8vYH5juKtGjtkRYYIR2ey54C0z8i54TF7WvbcU6hOfnJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0OyQtTlF4CdQKSzo+6WMS5ZI4K49wVLLY1cWKAFFEW4=;
 b=LVYe0/Dc+9cnjG4Nj9bobjmRCMFPgC8xdu1/CeXSksHPy7ukCOjRBSEEdGcpEbGXhQ+vGWV44WpAGlL4lpKHIgLz+RTN8OJmxKN3EUrx4xrZhfj7hjHufFpFsOVzoxzUiETvcO9ujv4tdCAnED9trtRUflUbEIkM6WadeDH+ctxVbgxgia7OdhkReWBxf6Q6B3kP8DF5ctwv1InnN1w03ZcfOWzXuZ4HSICotIonMLA/ezTCNRsIkQEPgGkalvbkGrRFFS7qBPmn0I7BnH4X6N6zTFF37uVI0A9iR43C5BU3XVW3DhtvbrbR5Jut8q6bLxA+dmkuuRvYsLG2vkdO+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0OyQtTlF4CdQKSzo+6WMS5ZI4K49wVLLY1cWKAFFEW4=;
 b=Rcj9BTrx8hDNM/3UwpT7z2qBQmFIOW1fYVT1lT8lN/WfDivN8A1FvXwvpDS390pHLoa/k8IGwlYV+ZkPLgxR4tHxSDeUg5NLLzpNBnUDum9KRsnDf8HYZ1/+Gs9MPY56izlLYgubfz1t485GNz4IIZddjaW7jGzYjZQHP76kHHc=
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
 2026 00:36:45 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 26/38] arm: dts: qcom: msm8226: Align multiple property data
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <d9bcb8ae23ce2143e598d1dc68b1050684b22246.1790892852.git.waqar.hameed@axis.com>
Date: Fri, 2 Oct 2026 00:36:45 +0200
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
X-MS-Office365-Filtering-Correlation-Id: 840cd6a1-43de-44a0-1ea2-08df200c7f02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2BNHTiTmgQRWo/Q90i0QYGDBIDmz99Peunoj137f6eFoXZvV0QatXN0k2LP2shdL1gHxf79QWnsUwV/uUSj9Xq0o2nsetsAJA0B9ainQwXKHmToZrFCC0YsHLHwlFEG9yQyolaWP+FikxthZUVhRu/bQYJWTYE7i7NgdfuxyhgHd6xCCJSdPqTwWNcIqVA/Us1onYfXB/V6vAyDrCPj77uHE60xxAxl5YC3JmEny7tF0nH9ju9V2eDfa5rto3lnBKx07qtB0i7RBiwXgzsSIRV7aPXlXQAgAKR/aGQMA59WQBF8W0Yu4kHDNbZdvOtzmDw2nIimj4NJvZeQe7akIIUZMO7YsdFBxf0vEGKcSquxLptnDO2OCaZAl4oQ4tLqa4dQSIi8mXwMhmNuYqJrMqPyEmNgr9hTIS1GNyXG6ecfYq12p/MAYFXNkE27nKdVLdqbGu+W8tpMbJHotU86ooNl2IJXzPQSQY9FXsGRaNvs6QgKykkmEA0oR1f5QmbhXgX9MbxX0Swkpo1yKea3x3JITYQd0dB4K0yWbbaZ+ed08N/Dqyegi0fm9GqUFTt8RqM3gxNgKki90EKsm0CTo75EpiowHMpZXScsLUeQnTuEhql4cibAJm8dbjW5Co1ss5A6fRfJbvsbDRLeNJH1kxrF+rZ2pHKIOqsEa7DZLIGgTQdtmwcVkcFZQQOCl9MBtYdAxBfOxkcDudk7OELR1Qg==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QkF1x0+jSBmGnBeykGMwsoMwULe1pC7VWDbAIrfb11ye7W09fIigktFofMc1UHpBPMW3soYa+BYD9FqdWQ2eDvBwuR4sem/uBOESNEtR5wtW9wmZ+kblpaX3WCK4H25piQMlfq40o8t4W6MiE/lezBErJTAU5NM4KLJk5HLZaIWu2CqhRda4YCAj673o84nGuFrvyq1qAD7cMoBDLELUCXz6Grp7/AksJ/Y31Z/cUGeL8lmrD0EhiDRWQHrPukr5Vc16HfKAjanSzCxJicRMZ7P0crHEnyeBA1XQo0ngIgbjd8jG+NCpvH7ohcUg9P28q8FqAO8DdfiS8pmZIIZ8umu4DENOEPc5uFHnyY5ejTGDltgwK/0jBgpfoOuip9kkGX5L/Y3nAdrYrHD/c2N7B95qbfhf5+qfans3SynjyCMokL9DItUJCvB8CI4wui5h
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:36:55.1961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 840cd6a1-43de-44a0-1ea2-08df200c7f02
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB8857

Multiple property data on a newline should be aligned with the first
one. Found/fixed with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
index 346aef4a1d9f5..ac18744b50924 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
@@ -1483,12 +1483,12 @@ cpu_crit1: trip1 {
 	timer {
 		compatible = "arm,armv7-timer";
 		interrupts = <GIC_PPI 2
-				(GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>,
+			      (GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 3
-				(GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>,
+			      (GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 4
-				(GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>,
+			      (GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 1
-				(GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>;
+			      (GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 };
-- 
2.43.0

