Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010053.outbound.protection.outlook.com [52.101.84.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F6E4D17AD;
	Thu,  1 Oct 2026 22:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894205; cv=fail; b=gzwVFz5OKRon0JXCiZ2Sk63Bm/AgQdyB4G3ExfmL8AnN07NVLhjwY/AgVWvbZQ6f1hmpy/1EeQwdG2OjPvpczDGeKZRD5vYmFVPiZfDIwSMZ9lgDBc/k9biFb5idmkraNKQ+USAnVO+FozNdrU7HWGt/YOju28mEIqcvxnZP75w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894205; c=relaxed/simple;
	bh=RU7Xe433LoVL/jksts5jjyX7omEzfH51gWx7T6mDraM=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=MNJ6/uvow0fw7eT4ahTnAIeEZ6hK2JNQUDMtjrfBGmIRrUgMnwOq9YI2KsKkeOLZVugBD7PiprHiexT3SdfNsJ8RcydHsqDytKjg8m78I1Imzjt8txwgIcEJ2j5tZeJkb4QePlFxIxON8Uu5pZvw+tjIxbruleTARmx1l8Xedcs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=frrCYSdM; arc=fail smtp.client-ip=52.101.84.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="frrCYSdM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ngQqIDhJyQaUFIZdbqHiWhKUsGVTpF4AOPQlhLE3mDH8f6bhqWzebRcEDMRNlAmIAsyNFokvW4MfBp7gOtr2n/4D6zCkCCaBR8rYUw3q6fjyZELGLdt4xt/Gh0cPvE4GAvzReIb1PZWCasXolcCWeouo0eRg/Y1susSnkrKYdoILSZFyb57p3aoO3ik7vUnWn6i2N1e+DgeaSkqd0c4JJu/mynF6rDlbLQAGtL0/Mic1YDHjrrnUwmgJhJ/vGwDsxEePP83RfSzLuXoPNnP7oAW/OwQIncHLP12Be3qVBV8ASMl2GLUTwwazrZGFiVUb4RStEp3bhDkll/zWCBxATg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/x9DYs2iijbpfhQXOsfa1ET1O8tMJrteT12ctYoYRQ=;
 b=p2v9LkHSYii79Y6oMHCSYXb4vwfRWWBh48XEM3ytHGrNNDaxk4KA6Jg+5fMRIUsbOD/1k3hRTiu2iJN84b6sfhlHEEyeBBk+4NbTsG0B8eOUBTEJHUUBcxeCCk7gkD7r3FoHcvQ5lIeimBccoIOv6yu6OVqIR+vBCpl5+s/8Uaxlshxh04bdYdnX1fR6IOq4qkSk352aA3mfpPS94VGqsc8/QaRHkE4R8wJJeODejq9+TJbdPNwB10NR8PRuvUkmTpEHwpDcsHLpSyClxov7j9q//Yl+P73/oCPsj7If5pN5QdKMmE+5xuEdIVBduE1a+ckU392UjsAiXaZMb4Iu5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/x9DYs2iijbpfhQXOsfa1ET1O8tMJrteT12ctYoYRQ=;
 b=frrCYSdMMA0mZmgkfB8gJy9LztOYwtp8+jMue0bNgBZnmpHcRasWzAwO4T+CMlu3xlEWUSw704Hwii8sHLlG3AvykdNiNGNVQysbo2nFqVlbJqZqEpwh+995PjTlV3BhirTeg6ASyexaZ9P6eGqv/JdjyJUpZjEK2t8xz7g8Mok=
Received: from DUZPR01CA0314.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::21) by DB5PR02MB11986.eurprd02.prod.outlook.com
 (2603:10a6:10:650::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 22:36:38 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::7b) by DUZPR01CA0314.outlook.office365.com
 (2603:10a6:10:4ba::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Thu, 1
 Oct 2026 22:36:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 22:36:37 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 2 Oct
 2026 00:36:34 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 06/38] arm: dts: qcom: apq8026: Add newline between subnodes
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <9484f72d6da11bd98bcb4f93e24c44b6ce2b8035.1790892852.git.waqar.hameed@axis.com>
Date: Fri, 2 Oct 2026 00:36:33 +0200
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|DB5PR02MB11986:EE_
X-MS-Office365-Filtering-Correlation-Id: 70a98b8f-17de-414d-ceb4-08df200c745d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9orFPzetELtBFRtBfCykf151vqmZ2AaCh6UAIsud99aH6Q8VjkdMjILAuiQST1mljAWqDHb9k5Qelqxh9t8yghBMJJX0Zsjj+sqhkv3GWsuKyGS2ANUYugJbwqpEob57KXNx3YMt+pLIoe02pp2e3MzzJTJBKTXODXujv60DxRVgPacykDUAMUKmUgb0t6v9g0jtV0vVHLWTAUGlCdGlqrCB7QHugoyWUsGIZwkLpoxdFlwFM3BrNdSvvwPjA75Sad3uF59sGxndugQaehS60jvOiA50OWiRkYew+5+8MLhkasO/PXe01jC5ivcdOHiRPZrf0ehLKY+SVqNEF9M24EWMblgyuhVLOcGV372b+ypKzoo0tCJAZ9CmcSJHl3Xh1o7o7umEsOZc3YYfRR2lcviSW3XUkw9ZoVgyHUW2CnSTH7NN41Lk69TuZlFUzDN3i1am4NM6a42TOicvMsiuZryMpf+H1Es2MLdrpwxu6I23Nq946JTq0Ow+Ly7W5cj+hHjg67fVf4+zydAKcAMZdYFBDTJqw2hi3Rh/i89uBTEkUzh65iHakUO7OJCN+6JLgTbnj4NKffOkQ500TuoNAXMhz5PqkvQwPqMwjWhQGCTrKJc76HoZ52JdaeFE8l3U+rHu3YXZyFS+p5ahsC8IviFIsHbTF1D3cLRpTfy8S5MTuzPf6lrTWc+KMKor2Bcm3/kttfImpIzk3KLV2uPJiA==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TDpyatuvqyqcfP41m769Pv0GT78kw/SCu9dsDcJsupQP4qJem5gRjDR4lr1o5B+/hBbLjVJUgs/TWCFb3VlOb9aVjhZCj5GbQceJdC/4elgHPCr7C0AQ5+gfdEjBtEmckhDys8R8fY6KLDPOHIPk0EvjqnOYEFlkdqSuxo2+gNuZHWKdi/69csZlo13cO/Ykkd/psh0zCAQciE0/JtsEHJgOXmDPaw1KHEpddMFZ6sdvwU52a0Ci577G1zgtkwNlpIyS18p3u7cGNTz0YdO+ogKeWGiGqchMzjYIXPbfaccKCLGls8Ki15Ze5bntTdpNuxyuA/RIRlEM4blLRdskAPuj3WDDuIekE7u3fAwHNsNBpiXfycnYQ0mJIuGZmWNHquEQV8fGUo7tFjFcyTSK/Ucn9gkrkugDEKq+3RO2NBVBvS10NDlKPd8kFAjSjhCU
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:36:37.3424
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70a98b8f-17de-414d-ceb4-08df200c745d
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB11986

There should be a newline between subnodes. Found/fixed with
dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 .../dts/qcom/qcom-apq8026-asus-sparrow.dts    | 32 +++++++++++++++++++
 .../boot/dts/qcom/qcom-apq8026-lg-lenok.dts   | 27 ++++++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dts b/arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dts
index a2ca456012f1a..4340b4581e011 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dts
@@ -22,22 +22,27 @@ sbl_region: sbl@2f00000 {
 			reg = <0x02f00000 0x100000>;
 			no-map;
 		};
+
 		external_image_region: external-image@3100000 {
 			reg = <0x3100000 0x200000>;
 			no-map;
 		};
+
 		peripheral_region: peripheral@3300000 {
 			reg = <0x3300000 0x600000>;
 			no-map;
 		};
+
 		adsp_region: adsp@3900000 {
 			reg = <0x3900000 0x1400000>;
 			no-map;
 		};
+
 		modem_region: modem@4d00000 {
 			reg = <0x4d00000 0x1b00000>;
 			no-map;
 		};
+
 		modem_efs_region: modem-efs@7f00000 {
 			reg = <0x7f00000 0x100000>;
 			no-map;
@@ -94,10 +99,12 @@ pm8226_s3: s3 {
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1300000>;
 		};
+
 		pm8226_s4: s4 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <2200000>;
 		};
+
 		pm8226_s5: s5 {
 			regulator-min-microvolt = <1150000>;
 			regulator-max-microvolt = <1150000>;
@@ -107,102 +114,127 @@ pm8226_l1: l1 {
 			regulator-min-microvolt = <1225000>;
 			regulator-max-microvolt = <1225000>;
 		};
+
 		pm8226_l2: l2 {
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 		};
+
 		pm8226_l3: l3 {
 			regulator-min-microvolt = <750000>;
 			regulator-max-microvolt = <1337500>;
 		};
+
 		pm8226_l4: l4 {
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 		};
+
 		pm8226_l5: l5 {
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 		};
+
 		pm8226_l6: l6 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 		};
+
 		pm8226_l7: l7 {
 			regulator-min-microvolt = <1900000>;
 			regulator-max-microvolt = <1900000>;
 		};
+
 		pm8226_l8: l8 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 		};
+
 		pm8226_l9: l9 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 		};
+
 		pm8226_l10: l10 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 		};
+
 		pm8226_l12: l12 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 		};
+
 		pm8226_l14: l14 {
 			regulator-min-microvolt = <2750000>;
 			regulator-max-microvolt = <2750000>;
 		};
+
 		pm8226_l15: l15 {
 			regulator-min-microvolt = <3000000>;
 			regulator-max-microvolt = <3000000>;
 		};
+
 		pm8226_l16: l16 {
 			regulator-min-microvolt = <3000000>;
 			regulator-max-microvolt = <3000000>;
 		};
+
 		pm8226_l17: l17 {
 			regulator-min-microvolt = <2950000>;
 			regulator-max-microvolt = <2950000>;
 		};
+
 		pm8226_l18: l18 {
 			regulator-min-microvolt = <2950000>;
 			regulator-max-microvolt = <2950000>;
 		};
+
 		pm8226_l19: l19 {
 			regulator-min-microvolt = <2850000>;
 			regulator-max-microvolt = <2850000>;
 		};
+
 		pm8226_l20: l20 {
 			regulator-min-microvolt = <3075000>;
 			regulator-max-microvolt = <3075000>;
 		};
+
 		pm8226_l21: l21 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <2950000>;
 		};
+
 		pm8226_l22: l22 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <2950000>;
 		};
+
 		pm8226_l23: l23 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 		};
+
 		pm8226_l24: l24 {
 			regulator-min-microvolt = <1300000>;
 			regulator-max-microvolt = <1350000>;
 		};
+
 		pm8226_l25: l25 {
 			regulator-min-microvolt = <1775000>;
 			regulator-max-microvolt = <2125000>;
 		};
+
 		pm8226_l26: l26 {
 			regulator-min-microvolt = <1225000>;
 			regulator-max-microvolt = <1225000>;
 		};
+
 		pm8226_l27: l27 {
 			regulator-min-microvolt = <2050000>;
 			regulator-max-microvolt = <2050000>;
 		};
+
 		pm8226_l28: l28 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <2950000>;
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dts b/arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dts
index a70de21bf139b..6184bb47a5731 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dts
@@ -157,10 +157,12 @@ pm8226_s3: s3 {
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1350000>;
 		};
+
 		pm8226_s4: s4 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <2200000>;
 		};
+
 		pm8226_s5: s5 {
 			regulator-min-microvolt = <1150000>;
 			regulator-max-microvolt = <1150000>;
@@ -170,102 +172,127 @@ pm8226_l1: l1 {
 			regulator-min-microvolt = <1225000>;
 			regulator-max-microvolt = <1225000>;
 		};
+
 		pm8226_l2: l2 {
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 		};
+
 		pm8226_l3: l3 {
 			regulator-min-microvolt = <750000>;
 			regulator-max-microvolt = <1337500>;
 		};
+
 		pm8226_l4: l4 {
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 		};
+
 		pm8226_l5: l5 {
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 		};
+
 		pm8226_l6: l6 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 		};
+
 		pm8226_l7: l7 {
 			regulator-min-microvolt = <1850000>;
 			regulator-max-microvolt = <1850000>;
 		};
+
 		pm8226_l8: l8 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 		};
+
 		pm8226_l9: l9 {
 			regulator-min-microvolt = <2050000>;
 			regulator-max-microvolt = <2050000>;
 		};
+
 		pm8226_l10: l10 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 		};
+
 		pm8226_l12: l12 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 		};
+
 		pm8226_l14: l14 {
 			regulator-min-microvolt = <2750000>;
 			regulator-max-microvolt = <2750000>;
 		};
+
 		pm8226_l15: l15 {
 			regulator-min-microvolt = <3300000>;
 			regulator-max-microvolt = <3300000>;
 		};
+
 		pm8226_l16: l16 {
 			regulator-min-microvolt = <3000000>;
 			regulator-max-microvolt = <3350000>;
 		};
+
 		pm8226_l17: l17 {
 			regulator-min-microvolt = <2950000>;
 			regulator-max-microvolt = <2950000>;
 		};
+
 		pm8226_l18: l18 {
 			regulator-min-microvolt = <3000000>;
 			regulator-max-microvolt = <3300000>;
 		};
+
 		pm8226_l19: l19 {
 			regulator-min-microvolt = <3000000>;
 			regulator-max-microvolt = <3000000>;
 		};
+
 		pm8226_l20: l20 {
 			regulator-min-microvolt = <3075000>;
 			regulator-max-microvolt = <3075000>;
 		};
+
 		pm8226_l21: l21 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <2950000>;
 		};
+
 		pm8226_l22: l22 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 		};
+
 		pm8226_l23: l23 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <2950000>;
 		};
+
 		pm8226_l24: l24 {
 			regulator-min-microvolt = <1300000>;
 			regulator-max-microvolt = <1350000>;
 		};
+
 		pm8226_l25: l25 {
 			regulator-min-microvolt = <1775000>;
 			regulator-max-microvolt = <2125000>;
 		};
+
 		pm8226_l26: l26 {
 			regulator-min-microvolt = <1225000>;
 			regulator-max-microvolt = <1225000>;
 		};
+
 		pm8226_l27: l27 {
 			regulator-min-microvolt = <2050000>;
 			regulator-max-microvolt = <2050000>;
 		};
+
 		pm8226_l28: l28 {
 			regulator-min-microvolt = <2700000>;
 			regulator-max-microvolt = <3000000>;
-- 
2.43.0

