Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013039.outbound.protection.outlook.com [40.107.159.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D714EFFB1;
	Thu,  1 Oct 2026 22:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894276; cv=fail; b=sJfOaHT+jIp1qUxGqchCu5G2A0UWd4ubs+ODAjuSATHHNTu/a9qWpj5GqdF/5iCOzTczkfKt2fXo+6+gdHS5fHfhJ++vl8VBSn0fZm+7hNNHylD/icnA+78PyB/cz0G74q3Xxe7WxoYU28Z5ljOnQ+iusIVZESJp5v3k5I7qLyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894276; c=relaxed/simple;
	bh=NGC3l5dXTWwwgBZ7vOZUfdodkNngr1bOzwMECHzYNOw=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=aOW+uXreuSvxMzxTzAC6uHLRLiYoLRwvAG/WzCrkXInza8ke9Er2HqBdMOioC+nf9hJUOrs71RDD7UtlPmH9Z1XKPwZ59ZTeQ+Cz8HDkiOrxHFK2hPxY2AlnglcKO6Xw4XdIf3Q+DIeI0P4BTvKMlIGFTvzNYeCNCRsX/RLV05o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=qH6yk/1i; arc=fail smtp.client-ip=40.107.159.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="qH6yk/1i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kg8kUzldjG8oDiiG2ukn9PQn6T5/4PwnfL5Chu/MRSPnLXAZlgRiC2zqg1JxJSL1b85R/MHxwhpiT+J2HLoeSumeSoYfolGVCv24bioJOykPhFyYrxzv+8Vad+UAcskIljn9o2SacgbiHsNVdjTZXGqIIOo9OdRNMpi3z8UN0sIQKbN67+6TI8z6EzXXnPHfuFfPAIdqz2sjWD9dYvC2hnszLjZVsKx/gH/556Tjoedj3ubn1jrPJOk8cM+WkN5wrxBvylARoHwZU8n9fFr9vYUr1QRg/tDHwezSVZxjVP/TQ4HQcFwIdGJGZZCe2onxRYxC3nPxTXmKY9UbHPaKmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cM9TiXpEa3Nk//llOG41myXA8yQNp+JhEkUEMBbNLXo=;
 b=jWFcRkgsxdy7nU5Sxx67B9/EoIjdPiPk9Fi54k1IjS9NobJMnQp+3bMxsvRRHpYwE8tgCyDSHctEwvgr/R6hyX0pqg8qhP5Sfx7kEtYKhgK3S4dannf9iaQ8LWgMgvTfa/aWITJjESb6sudcs00tec8GuZUNaUvzNnuuv56evkOv5BOeI6yMdCRpVXJD21W8UXrKrHFXW0GM12ng9SQO+sxj4WZhepP8G10Z1/WxiAe3R9+99kkk4jZDvm9AqGx3Uqr/7C+knu7OP09AzKs4f/t/s3w9nbv87EFqA+v3lYZSG0NmKmKi+tDgOSnsqCDDyxY2Zjw06aXgd1YzBqDg0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cM9TiXpEa3Nk//llOG41myXA8yQNp+JhEkUEMBbNLXo=;
 b=qH6yk/1iR/lROCo9ETsvPIxKQOeDKZZk2GgXit/Lg8kiI7iVusnw9wNS88tfWBeGG7qljm1yZ4n7Qjy6GWdBNsKyhkyRKNKgM/zbR13Uq/MBT/629fzaE/IiSpG8YAjex5gcItMFMXy2Bmhv551B538x8LV9S6/4CLJ1lePxogU=
Received: from DUZPR01CA0329.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::28) by AS2PR02MB9764.eurprd02.prod.outlook.com
 (2603:10a6:20b:60c::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 22:37:48 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::f) by DUZPR01CA0329.outlook.office365.com
 (2603:10a6:10:4ba::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Thu, 1
 Oct 2026 22:37:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 22:37:48 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 2 Oct
 2026 00:36:52 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 38/38] arm: dts: qcom: sdx65: Align multiple property data
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <d0585f480c491b5d58d7f73a7f4429fb4e35f67b.1790892852.git.waqar.hameed@axis.com>
Date: Fri, 2 Oct 2026 00:36:52 +0200
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|AS2PR02MB9764:EE_
X-MS-Office365-Filtering-Correlation-Id: dd0ae898-0e9f-4dfc-ca84-08df200c9e9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LFBKKWD4DzEYHcJb5E6c6KCwLtL5inRrtDURrEXBucFo1xl8aS8bW6Cf2IbD5rbvG6mdbPhmLilJCn1xexFa+q+Xzg7kmlCpQ08GeQreeYAxUphfSW9R5JtLXoE+3ekSYkFYVGucZ1VtBj9upwL6ppTRm2/52INhaV8ezO/DOdjwt//EuQVTqAETfHE2nU492ouP+QS1FfUNQJRGxnrU9LyIkzM2UAz3Np+MdhggYVk9rm5iqVmCAL9dAu7YQY1hEv7kFMQec8dcJAy2NOfLOYBGoNXPB82jRuHxoGDZktcytuxBdZpBTD4hSfCZvPn2xqVtkSCjfcoWWpSn2ZMzQELyI5/KehimxsGz1oIA1w5wsP0C65/CqLx2OHpE+S7kkUNFT6If6R7gM39Xcdu2PAubZLUXoHm+wPPmRUC943FUQzKtCKKbIkjat9pbXkxdYxZxgq4cPCeudp42XK/ziDbv5NQwg8Wu8puF5cIgKzPfMY0YcWoqZa8UFItakzOCqUkr9fYNGVT/2jd1qT2AOsjFATAg8Au3epX2gR1unwzRLQ2ucafdy50pb5izAr289De+0dEg2CgyPAOIzTvdXmAZ9hIIai4jDA7TZhXgiB37K+hVZYl5eUc6oX2awhEnSexG9qG7BWDP867pYtyfaNYfmGAaTAYmwoKchpvxmvomzrcoZS6JYdyz+jlGeMK932h/GxLZUC/AWIV1S3IjPQ==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rSnKk98ymCE7w5jnt7t5O+1z7g3OOMmGwu6g5JLYuGUa3LoDF+M1j2EEPfxrG7CCUcWi26wGP2qwmI/3h7+Ia6w1LCFFEcQIqyG5OqutyekPQAyhJUCZVAJltd2jB96FbpFFXxnoXumLmd+cxgiUJQCdjC9+Wm8tfaDrf124lm0JVGcQamD7/RLFVFXHCfV5XUZSGn5NMeNd9eAwJ3q8qxP8EOiz+w1GSwShR9Am3TyUN+8hsUmaxHAU0VNfTd8JfPO9nmBp9nU58U/ys8F3EYBeZve7otpTNAv9LIsFuL9Ytyr1Z6tdcVdVAS6x2qmEmmsV6+iyB/CWAi/GQdanQ8beZ1B7T8Kj2YFuUamAvJsFWpp9UYBdx0/LN66zvmXhZzH5YTEE+1eY02UUJQqTT5NIhGzGWLyMwOL+j+CbLsfuZ9A20TiQzMUhfd5UW8a9
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:37:48.2386
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd0ae898-0e9f-4dfc-ca84-08df200c9e9f
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB9764

Multiple property data on a newline should be aligned with the first
one. Found/fixed with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm/boot/dts/qcom/qcom-sdx65.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi b/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi
index c1c5b574424dd..9814f20e6e167 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi
@@ -544,10 +544,10 @@ restart@c264000 {
 		spmi_bus: spmi@c440000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0xc440000 0xd00>,
-				<0xc600000 0x2000000>,
-				<0xe600000 0x100000>,
-				<0xe700000 0xa0000>,
-				<0xc40a000 0x26000>;
+			      <0xc600000 0x2000000>,
+			      <0xe600000 0x100000>,
+			      <0xe700000 0xa0000>,
+			      <0xc40a000 0x26000>;
 			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
 			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "periph_irq";
@@ -735,10 +735,10 @@ apps_rsc: rsc@17830000 {
 			label = "apps_rsc";
 			compatible = "qcom,rpmh-rsc";
 			reg = <0x17830000 0x10000>,
-			    <0x17840000 0x10000>;
+			      <0x17840000 0x10000>;
 			reg-names = "drv-0", "drv-1";
 			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
-				   <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
 			qcom,tcs-offset = <0xd00>;
 			qcom,drv-id = <1>;
 			qcom,tcs-config = <ACTIVE_TCS  2>,
-- 
2.43.0

