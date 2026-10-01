Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013021.outbound.protection.outlook.com [40.107.162.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32B74BF942;
	Thu,  1 Oct 2026 22:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894219; cv=fail; b=kf/rygcTw2r7htRL38cFohx6C1jA17g2DK9kxtkukrBaohTtYD8dbBQHtGRDv5reIs5dUrnbzQCKTecmkb7tng+EStL2QKWeflYnffQknt1G+KXlQhH2ws2/XXwLqdlgZyu7uNYoscOHK/Aagtpot7gVcaTLasy7GKELVzdm6mM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894219; c=relaxed/simple;
	bh=9IlQw4d54Fk4U8Y5n16Z/ONdSMieg57x4tN87YVBI90=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=MHjAIzqPDAAcxMsIPLSPSOzQtP2TUeC2HsmrHnUAKbOWFF5gazwYnNig7gE1O9CEYq3o4XN7NDJXhAD/XHo6hS8nxFsAgXhBi/e3C9Lygt6LRNWuyQT/2mFE2MyGAOheAU1zd2v1RQpTsLvi7K72qn+yuk3qwBCwAAjb4fWIVTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=dMjhDFbu; arc=fail smtp.client-ip=40.107.162.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="dMjhDFbu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mK31RAt9GeVnLYjCpw6s47u4Vop5FACNyXWD774gurhc9oYfvDLbfPPPbqhlmgVZJX019bojbBpaMR/tRr67TTyHcqyJfdRcbATUrXj5D9Nyu1vB2a8Pi8ZeJzdDJIIjYY0nuwDzmVDSmy8USX7g023hw5uafASSX9K2BHcOeLNtRmV7uTKVMVm+6BWIEbAcUhUl+D+YqjOucTKM5eBEYxeydCNRbcmdXvbty6w/A/OFCOc41iTmUgBeTnTjcK2wrQWg4LElsnudyrIYHT90t6y/+bORYB/rJimybHMhhtob/W6EIp0uRrmJ5bE/KvtAwnQ11cB+ykDR2zpSUzXMlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1h2tuOnhBaumk7QdWg2qktxgx/eqoMNGSFMHQl0qWLE=;
 b=e9v07dZNyCkvI2otagKNtR93tnk7OGFkAig4tf6tNeDeZL6HaTyXmwPILf7JGx4iZh3zQxlnEXO4iNSJN+qsb0AEgJcWjGeLpWhHGWV7CvFq9Y9bbJFAkZyDgmET/rAh7djS/UKM2gJras7pYnp5+3MTscc91vT3wz+SzRA6z3qT2L1KaErc2d2BJ5RmRy7cB3YoeU/nDA3dbRbVd3MV/yr84tE8JC96KEiC/7pd8riqQ6v5jt1vW9YU4eRsFwJMRnglpRHVdwmpFX2JlHmr1ZCjt7iWpHIizx4hm1MxSylJ4F/XPKJ6/ychLms+NyKQWIgbebfF7CaRiZkHhAKsRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1h2tuOnhBaumk7QdWg2qktxgx/eqoMNGSFMHQl0qWLE=;
 b=dMjhDFbuax79RsTCoRzuZYsD5mP7Rejx9wxh5/A+V0/sUOP6pj+Aid1+DhHMxfsWbShUM0gGdtKzsjvvhTZSQiT3t8W84+bdhJL2/Z3JTEFxdwCcZi7VParoKRADbwL72O4/nsFTbHCpJrMRE4kNsQVB0YwsoT7JrqsjbPBnsdc=
Received: from DU2PR04CA0057.eurprd04.prod.outlook.com (2603:10a6:10:234::32)
 by PA6PR02MB10648.eurprd02.prod.outlook.com (2603:10a6:102:3d5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.25; Thu, 1 Oct
 2026 22:36:51 +0000
Received: from DB1PEPF000509FC.eurprd03.prod.outlook.com
 (2603:10a6:10:234:cafe::a9) by DU2PR04CA0057.outlook.office365.com
 (2603:10a6:10:234::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Thu, 1
 Oct 2026 22:36:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FC.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 22:36:50 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 2 Oct
 2026 00:36:41 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 19/38] arm: dts: qcom: ipq4019: Break long property array data
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <914f62eb921e67f31cce119ed5852dae86858890.1790892852.git.waqar.hameed@axis.com>
Date: Fri, 2 Oct 2026 00:36:41 +0200
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FC:EE_|PA6PR02MB10648:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e53bf25-ca96-45cf-6882-08df200c7bf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	61Z4RawSW+VkqtIc7seKxuj9SrtrWUd/qM3M0k+EgtpH0SVdG19NK+7y0kKlac34pzR6olRFr1QHoSBLfptS6aO8rIL0gB2RCrTkkOra4ClgexwbD8fbMyOUx0Q0Qaaf3r0rBjqtOKCyHr8+X3EFORUR0oexSAQJ8UNATTsHemhRCy0rA4/iKxPJ+c7v7DDQkWWkv+UwaTJw2WM9qjZpFuxh9CD9R6znIB9LW9uzAvNDfdtQSqF62kPfIjBwo+65POvTj47hXVaULD+YFRqUQnskuEK4JHqig0N+nSIh0M+ac302xQLIN8jbNuHl6bgavaslIqhQS3HE/UtnjwtZ82ef83ZmbNVecN7CSS2rSvVlcOuxu+jvtWk75ixU5jnZbNZCrqs8Odw3+gvT+geZfSRTba2rC44HQKZ1Fiwibt/chPfEnQly8g1U1SjOABSAwrQ4kOYvR1EpDhafIbUbLAJ3AMPG4q/Bdb5LJbGTkU2qFFU8LhzkVi9iZeWoDravpMawfA0xIIhOQvzy43s2W+hSMBXdkbHs2fFUeOCCKPD2dpaknxYf9Q8A1YLeO34I2bBPw+0qXVb02m5VWidMs/nHU43S24mPUmvIBrPwNxJmGjIP5mUdM55XOZugD2oiO2qAlX9zEsaIWXUAVXIsapArb++RxD2RZyFs5TuL2M4W3LivuExYS9Maeut96ROW7HUsR1F/Zu2xKUJWtWg+7w==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8NC1ksoDqlCUjqmAmoiBVAaaUro4wbO1LkHNFANylJoXsERseYBs+HdM2PSQkhEFZADl22N1GmS+RjST8aWNhS4KKOw8SiTW8uqPaqnrM5xkmdJcv1Qs0xdfXTylLq/Tw+kk2ocBIyxeRGa/PcXq+/gZ3+lUzyRuB45GHEBkwwYb2DF/4wLigCMAd+GHcmYdE7FGhuPGKl/BPNZkmKtLcS3McK52OdhxZ33hMHgl1NTJHP4w/tcR2tBeXPBeanemSqXPvy72eoQym9PwaEoKld/xFjWvGALp+J1/Ea8fD6sOBxTNm2+XUa8Ps5dzvZ/ikXWch9HFxSrFDBQJqYqggPKpQYs85vYWTNglYtHNNsE8fz9fDYHCj9SLfGSHWKG3njEPSqe7HO06Mqsypha0wufwhYjM5cp8ogq/hiXeQ0RMF4by/IwxXiPiAkAvu1ju
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:36:50.0785
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e53bf25-ca96-45cf-6882-08df200c7bf5
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR02MB10648

There is an awkward line break at the last elements expression. Put all
elements on a newline instead. Found/fixed with dtfmt (Devicetree Source
formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
index 1fa1aef140a12..51721fedf7d60 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
@@ -135,8 +135,9 @@ memory {
 
 	pmu {
 		compatible = "arm,cortex-a7-pmu";
-		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) |
-					 IRQ_TYPE_LEVEL_HIGH)>;
+		interrupts = <
+			GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)
+		>;
 	};
 
 	clocks {
-- 
2.43.0

