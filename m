Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013004.outbound.protection.outlook.com [52.101.83.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509CA4BB26E;
	Thu,  1 Oct 2026 22:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894200; cv=fail; b=DjMmWCR6OBZ8UQRw0fUrVLgi8iO3TXngjlmS/X7cT9LInDDrSfXSEPYbbnR/3tNG5D38dHX0lBB4x5oztlPAlXUYdq4iKIWtAAGKHwaCzL0Kr9B0stjQ7yEU7edls6ljdVBAfh4vqfmUOSE3lcW1uxZpfXam6zZ/wp/dRpvFf+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894200; c=relaxed/simple;
	bh=1bRoEi1EQwh4EF6EXFLP1BvAgtwm5TlKV9VAiSPfrGY=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=A6pNIDhJ0yohG0XceIOt+5mwhMb+SwzwSlQWWqP8C48rv7ni6O3xozOIKkIyY4QWPDR6hBAkl2Z0YBdAPO/a/36vEBrpoVTHrnCihpB3zdc07uz42lCZz/rI6eWjBPKF5zKxDKp4RSbXHdzjCRQgs0/aarXnoRN3s2yY6jTUnco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=aOit7iqJ; arc=fail smtp.client-ip=52.101.83.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="aOit7iqJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gd8laD2er/WOdQOX4/cLpt0pkZQsFMw2reA7KTY8SZj6LZY4ArJZjXSe5bYAaxz3UOEOszLQtQWgrn7+ByJSpnus5E4BsSGa8Xiovg2Px67dDftNhgWyPDDXM/CQ86n42i5qFRYKj5uqBB1aMghPu0kawGho9PMXxxqwhnNUzvJ6BC2wI6kXwt1nbz6MS8A0cjv+t/Xqau9HJmByYwqyOvi/ypNBiEKpZDcbI6RGIRdhlr7+TeKhj0CKLwIWr5dMu8anYaxFz5fKqhM5LaJlmbqeECRWYyVVGh37nRIS0xa2h6eMKWAG1uQAWi8Gi9Ow4t5VcwWyP3SnFbC2o9ODpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2SsDmRkVdLAu0flPTxN/E5t+7bkm/5SXy2mAixEsKDU=;
 b=YaV7rs5oYYa91Svx7AwdSLIZp6GwDXEsQdST85kb5tEUVLk3d/LmdwWWtQLZlAjYC27ubcjEaDH/qZWa00hOph+nxxeVWx9QifiYOtiYjb1QWcFe6OjFRxZ6zRNTlr95Y2lpp+CmZwEgbMGVcHGgbO5ap1bL9NaL0uudW7/UjIIwpnIulEo/It/6U1QHagzxJ0RZJNvSTVTxP9LBFfGGB3rXXL5ZkBj+y2PUtHFFjdDysfGiIGnPD1VLU4+nTMRLS29XJvQVWrOJd/BA4N50iHDjciqBFFFuhyqZPDH+h2CBeKjDHhy6mGcV9c/sdsG/g6x8haeSH5+t/rcSRIj7og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2SsDmRkVdLAu0flPTxN/E5t+7bkm/5SXy2mAixEsKDU=;
 b=aOit7iqJgYkobdVF17ErIaORdERW9WKx8bs5PWeH8nWPRxn2gvWQE2SM33WUiG0ru0AYgJe6lkufBp5tWVxGTHiWymTSIEb+vFBh0moE0wFyA3zTCWWRKuvxmPTiRk1/iMWqsLftbJHoZa42jxiJQHKv3VKl68jqBWGGrJjVZLo=
Received: from DUZPR01CA0317.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::27) by AMBPR02MB169614.eurprd02.prod.outlook.com
 (2603:10a6:20b:817::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Thu, 1 Oct
 2026 22:36:35 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::35) by DUZPR01CA0317.outlook.office365.com
 (2603:10a6:10:4ba::27) with Microsoft SMTP Server (version=TLS1_3,
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
 2026 00:36:32 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 03/38] arm: dts: qcom: pm8921: Remove superfluous empty lines
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <3ad783a0b4f1f51e801b7c108df23f5b28893f29.1790892852.git.waqar.hameed@axis.com>
Date: Fri, 2 Oct 2026 00:36:32 +0200
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|AMBPR02MB169614:EE_
X-MS-Office365-Filtering-Correlation-Id: a3afe80b-dc2e-48d8-b956-08df200c72eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|23010399003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+dB+BMv5RXlyRGua7XAxGbLq3a84HaAC1xXK4Z+qEVr+5g131rQnGPw+PrUYN2ROi6tPnGNvb0GDjj78k4kppjoKwMuL5jDBL0DDRHHGfSnpOvi+PuFh0Jl/p6D1pt0IX4kH1uxuXDgVxThj8Yhq1wyvRu/dEfzz24bLlFiiZ8YhiK1HQ/dlJLcLnzC7QHgeO+uFRLXscd9F3VDWan551g6SM3QD+P1bfEb4VemEMDT2UW8rfBQsh6efuk1DhLiMr6T6A/09mk7ZHgvAyGDMgg3/ak1KJsqmTIsiSGdwoiHjt5TrZpg8kKPA3olGHmaVMtGzR50bi85I8gJiMtgs4DBXqHmsHVPEpnaM6tzVtY5/2MIrMyrSgOh44MrZVpT6+NbSmwDaTKFj1mo8rESrE0C9DgwkvWANCdsrhzn3nQgg0ajDMTlX9/Hp0BQTe4y5Y7WubkwmCVoqY5yxjKouHRsFStk5wSNTIIEft7IYCbJQ7Y2WdgIW0k2PQ73MPIDPaDIGN/gS4/SB0radNJLhVuxsXrD99oV7g3jmtHISDeEeNMgaQbnRJsdRChTyTFpfsZSP4MI67uMinIpEr7xpRZrJ5TG1HxOAj4+2ekHBWmjapFX4UU/YMEfz5Ohw6whRkTzif3w8gx3jgCiaMJkl6dKNJmeXGMpm68G3HNQmADRu8v9GtIYuAArWi4w6YpCe0PwH41Z61UTostWSjzBnoQ==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(23010399003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	k6FFARaFdmNvAezCw7N5AenxU/pf0BNi34V8jatG31fs5aXQO6SwI7EXxNOjdBj0QCFDrLWz6MIVZmpKxl/dKai6nspa2m+8hnFVVKkblLTKoE+T9/9wfv/9GRL3eDfn3r/syOzPQ0aGp14zaluLY3cU/uKDEELDZNqAX6LsPn4XyVro5vEZQI2+HJFm76tyy41rEf/2aagL1Zi35HwuUeBrqzdoMdav957IQHzmLW4CwFfgKxc9GdFfJhNPEHr4ZHEzNkysG8BO4xIQa3DpCWwVJWxEfKMK2i5EpFHy21h110Z1/NVkHRij7xknwrYg78/JM4bf/ZjecR9/i9lzIatPl/2LmsepllgeiKS8tCeguEuGPPZHQkLZkqHb1beMgEb0QsoG7cbCsL0QR/tZ6VzhD3er2Y+48AJXYG2q2DDipheeKeWYD65z8gWcEQyf
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:36:34.9145
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3afe80b-dc2e-48d8-b956-08df200c72eb
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR02MB169614

There shouldn't be a newline at the start or end of node definition.
Found/fixed with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm/boot/dts/qcom/pm8921.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/pm8921.dtsi b/arch/arm/boot/dts/qcom/pm8921.dtsi
index 15246f4bd2672..7b177b65c6b61 100644
--- a/arch/arm/boot/dts/qcom/pm8921.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8921.dtsi
@@ -53,7 +53,6 @@ pm8921_keypad: keypad@148 {
 		};
 
 		pm8921_gpio: gpio@150 {
-
 			compatible = "qcom,pm8921-gpio",
 				     "qcom,ssbi-gpio";
 			reg = <0x150>;
@@ -62,7 +61,6 @@ pm8921_gpio: gpio@150 {
 			gpio-controller;
 			gpio-ranges = <&pm8921_gpio 0 0 44>;
 			#gpio-cells = <2>;
-
 		};
 
 		pm8921_xoadc: xoadc@197 {
-- 
2.43.0

