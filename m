Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794241553;
	b=YOJzT56gpNOaqu6glzUOMCBDNsORH3LEcIUIJKN8jCVFCiWB8WrFMqyB3RtdN3EYdSXe
	 uFnzwnrvaXwUvEIuI/E6uFWQwT+7TrfKxm6/fGIdxOAM6mp8CuM9tCkX4P+nzkXgaoWb+
	 +3SmSQuoK/937aqP95vBiC31SD/HnB7lMclxiHSDlPq/Jw2p+aq3Jsw/avQgnfxOAq5Tw
	 ZUBrEAvleCjN1dX2hGjBLJqhN2AtRCO4CVA3w/17ZuZ8xl+a43uU8nyLMKIU1L+aiFiSO
	 LgH296uc+lMuBVeKESphQMimyDelGepAuQy4mDpx6fT6+qVW4yL6PVuHIG0LsRQ0S7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794241553;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=vphtM/boQ9WFmEPOyrQuGBexqVINAdAjanhU5cyTHiM=;
	b=vmVaKhz9CvXhLwslUJ9/NyRfgR5rrxy/Zxm2OTAMvhL9ObR6D92MCeyT5kxktr/IkzmN
	 CZwv0s0/dYvSuNd7O5ytSydTew9IIguDGQIhtomrZkpS2HEk0mAKvditDLOaqWI+wue8R
	 SEY+utGnXtRSKESTXhEgmPNfPuBQzBZ3WHpTHY/sCZAmtGfZqEEI4PYoU0vfeXmYkzaok
	 oZRKEPqiLMBQnL39mDQra3T3NaSv70+ovfaE6PQFhWkap5kVZlMBs4iPDi4/CaZq3AxgJ
	 Zi1gQm23cVFU5yk8nEvod7k/W+IfPGbaWoOhPNHJuXEv5jjbbeefTDvbY565Op2v0+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=ngpk64qX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.42
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011042.outbound.protection.outlook.com [52.101.65.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F44606EE91;
	Mon,  9 Nov 2026 16:25:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13F44606EE91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=ngpk64qX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bg1UGtVFP1jYH2I6JubTflErYPDD/230OrNM0g3jWlHVuIWObwI3/Os+azz+jFF8Q1E21jlkGY6pf//zr80iTD5vnb57p6cPFT8/y30A5+GU4R35V4at8GGfayJpkjvmugkjFolO6GsdsF8/EQDv0AlU3UsZiA4/wAFWvULycE3e0BFHBnZUfwSZoTtb5j6cbepVAyJn5+NXHbC+KrO6xfckUiouB0Zljcdcxbz9GGd/qPPRr7z7nDTl6siuCMl3WWFxmsRmZ607KmLlNpNycUX1CBOJDAvYpVB/Q3cp6eNp+jvbJIxH+jDA6KPl5pjkL8gK0LuwkgFwFm9rf5+oLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vphtM/boQ9WFmEPOyrQuGBexqVINAdAjanhU5cyTHiM=;
 b=QEhehquBidztw/z+y2t7AsSEN0PrxgDRAQSvt0StyQn+W5tZ+GVZuypFznpoyfetrJ3hEFa6h+pvhc2jdzRE2gpOTb+FEqkGiQSqT3xztlkAWurrFK1UyUtBZi3kgaxxF+82woZImqS9y2PKJSY+mjBzDjP+Bv2nUfHCms79bqQaq/lkrsU49tbTs+aArceB0kKZ9vhEcpSVcw/rBpdG4RvPIltZBClW8xNoJr2l0x8TGFJUGuqbPRs7Xi7juQXm4x1qV2K37a/s3D4RQOcrxsYteOIr1gQ2XnfYVNeyrycgKxqiWRUGqRyO7shnOgxlEQD6n+uFy/ROOcQvhx8iVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vphtM/boQ9WFmEPOyrQuGBexqVINAdAjanhU5cyTHiM=;
 b=ngpk64qXuL8MN4VTJ/ueEkotk1CLvHD/kW2lHbSLCC2YAO4+sf7O3chKoW39L7PPdQ2xx5fIkE62GHGzLjM0MBT/35Uai+KOT4pUgBxpcJQmmLGU3gIzWhtcEo1GJvkf0MJYyJ49TUFPwyC1xASntDAEimW09VWZR/AnUOkiJX+bg98YR9KCPHNxD0ggCz1KA99aReoEIfrTPa2C/f3oVzdc6G2DKQeNl9WSVK8KzESIfslYUsnwn0l3gR/3asocDgM4Ifli9GCC8sMqmKC4aUKUA8ymRAYPFb58ocGb0db1rVruju1INonptYH6Tcp+tMvm6Mq4cdiYvdl/byfnkg==
Received: from PR3P251CA0018.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::26)
 by GVXPR10MB764134.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:3a3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Mon, 9 Nov 2026
 16:25:49 +0000
Received: from MI3PEPF00008552.eurprd05.prod.outlook.com
 (2603:10a6:102:b5:cafe::85) by PR3P251CA0018.outlook.office365.com
 (2603:10a6:102:b5::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Mon, 9
 Nov 2026 16:25:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF00008552.mail.protection.outlook.com (10.167.240.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 16:25:48 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 9 Nov
 2026 17:26:44 +0100
Received: from localhost (10.48.86.251) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 9 Nov
 2026 17:25:48 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Mon, 9 Nov 2026 17:25:04 +0100
Subject: [PATCH 2/4] ARM: dts: stm32: Use hex timer addresses on stm32mp15
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261109-timer-use-hex-unit-addr-v1-2-b4abfa457adb@foss.st.com>
References: <20261109-timer-use-hex-unit-addr-v1-0-b4abfa457adb@foss.st.com>
In-Reply-To: <20261109-timer-use-hex-unit-addr-v1-0-b4abfa457adb@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>, Marek Vasut
	<marex@nabladev.com>, =?utf-8?q?Goran_Ra=C4=91enovi=C4=87?=
	<goran.radni@gmail.com>, =?utf-8?q?B=C3=B6rge_Str=C3=BCmpfel?=
	<boerge.struempfel@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@dh-electronics.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008552:EE_|GVXPR10MB764134:EE_
X-MS-Office365-Filtering-Correlation-Id: 43db8dcd-429b-4fae-2e6a-08df3e7e1d40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|23010399003|376014|1800799024|22082099003|18002099003|6133799003|10067099003|56012099006|11063799006|261028144727099003|261102123227099003|261022105027099003|261021123027099003|261021121427099003|261026140227099003|261009223027099003|260925021311599003|260925021911599003|260925022911599003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	l7SVhoLwbxPcdBVUpX64tkuL/CF4dd0Yjzj56Lwl+Pj9zViszy2BsO3yA4eeaNfCEAXyrF7uKxvdoRfFk6k/agB86VmMcuvR22HXJrW6hQXdIHQaaOWIoUWvt5n9A1xPvnRNPYDpzbIIaeE3P0Sq69L+OoxfFH0XhuWYv4IsgG5gzq9aYvgTWfLRXcPWsqvpt+7S8TkbH1mmKRx0sthwU8jFI1wT7kL3SBdHhL3EfNn6+3/2WMohUI7My1mkliJZ7wFLC8Y19dlGLLrwcYOSdPsrcyu/9gg3Ay2LQoJcAdcJMOrf4WOqzVGk1ORox9GmIgKpyC/rJYQ2IwNbGMTgYSVgForJMKZQBddDnsPKlr/yI35ch0NXR/408XyNGQIgIxT8p5MuAISLWkguRw6/wSGxFDfB4iWdEtn4Lv9PeVr+Gq3kYTXXwFlB4LTeaBHc7TTu6PWFktpu4zSTeZeiwUP97c2GJ+XptAp5IbnBGQAgxMevN9bDFwBnAmOSPSkKEnXIsnP7/m6cpgf3wmGKT/kPaaz8GAHJHRRqa1gnyOvA7xjndpAfUSvTy/LC9rMHKjA6z1NB/bd0uJtEVci5/0BIbau5LQv5JnDHZmSfdKNILIvo+ZBXNSpI0XQxSOXyfyKwRVGc6On3yVZO626rzBqeCWQqlBjgegtkxrTUeaI=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(6133799003)(10067099003)(56012099006)(11063799006)(261028144727099003)(261102123227099003)(261022105027099003)(261021123027099003)(261021121427099003)(261026140227099003)(261009223027099003)(260925021311599003)(260925021911599003)(260925022911599003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fpH+EwGuiswK8kyMIsQWewESGRn3e4U9kuRKZUFlrxZHTcydp7g6nYsg/cbdffrWD+4s2ihH2nmmG2Y5+OgegPU8OIrNbKR/TNxoRFeacL6Zs3laJ8unuo3rfyzRJv6bcmIYPSp/ZVHo5krTUuvv0c01qV/rjablP1lcgrHtX8SSpjRU5BmrQK+qDd39usgkv0z9eA06uoEp/IUBUR/G0fzXlklDOplpGC0rJMt4OlOxP7WQ8QT1dRjVAAK8UTaPihrbwej2/BE75gB7Yob98ikGFpx4J0Iw1KO762d54Cp/5w2Z7SIDnvHXD7NawvLXHWO1qfh4rVIfcbCI4gMi1h3DkoTZs8tWNOjZd0Fd8PTJGvT7OItYRcMTrbEEk4qFXQqvr3pCdJ9zURUTu/AOZBuW574MDJREPU0CcavOYhqMBmMrjs7XYH7DOoQHeWJW
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 16:25:48.7001
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43db8dcd-429b-4fae-2e6a-08df3e7e1d40
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008552.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB764134

Use hexadecimal unit addresses for timer subnodes. This has been raised
since ("dt-bindings: Use hex unit address patterns").
Also:
- adopt hexadecimal format for reg properties.
- update MP15 boards accordingly as they use timers 12 and 17.

Link: https://patch.msgid.link/linux-devicetree/20261102135330.2493332-1-robh@kernel.org/
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp151.dtsi               | 46 +++++++++++-----------
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts           |  2 +-
 arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dts |  2 +-
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi          |  2 +-
 4 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
index ae3188373238..71f81f25af0e 100644
--- a/arch/arm/boot/dts/st/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
@@ -632,7 +632,7 @@ pwm {
 
 				timer@1 {
 					compatible = "st,stm32h7-timer-trigger";
-					reg = <1>;
+					reg = <0x1>;
 					status = "disabled";
 				};
 
@@ -669,7 +669,7 @@ pwm {
 
 				timer@2 {
 					compatible = "st,stm32h7-timer-trigger";
-					reg = <2>;
+					reg = <0x2>;
 					status = "disabled";
 				};
 
@@ -704,7 +704,7 @@ pwm {
 
 				timer@3 {
 					compatible = "st,stm32h7-timer-trigger";
-					reg = <3>;
+					reg = <0x3>;
 					status = "disabled";
 				};
 
@@ -741,7 +741,7 @@ pwm {
 
 				timer@4 {
 					compatible = "st,stm32h7-timer-trigger";
-					reg = <4>;
+					reg = <0x4>;
 					status = "disabled";
 				};
 
@@ -772,7 +772,7 @@ counter {
 
 				timer@5 {
 					compatible = "st,stm32h7-timer-trigger";
-					reg = <5>;
+					reg = <0x5>;
 					status = "disabled";
 				};
 			};
@@ -798,7 +798,7 @@ counter {
 
 				timer@6 {
 					compatible = "st,stm32h7-timer-trigger";
-					reg = <6>;
+					reg = <0x6>;
 					status = "disabled";
 				};
 			};
@@ -826,9 +826,9 @@ pwm {
 					status = "disabled";
 				};
 
-				timer@11 {
+				timer@b {
 					compatible = "st,stm32h7-timer-trigger";
-					reg = <11>;
+					reg = <0xb>;
 					status = "disabled";
 				};
 			};
@@ -856,9 +856,9 @@ pwm {
 					status = "disabled";
 				};
 
-				timer@12 {
+				timer@c {
 					compatible = "st,stm32h7-timer-trigger";
-					reg = <12>;
+					reg = <0xc>;
 					status = "disabled";
 				};
 			};
@@ -886,9 +886,9 @@ pwm {
 					status = "disabled";
 				};
 
-				timer@13 {
+				timer@d {
 					compatible = "st,stm32h7-timer-trigger";
-					reg = <13>;
+					reg = <0xd>;
 					status = "disabled";
 				};
 			};
@@ -913,7 +913,7 @@ pwm {
 
 				trigger@0 {
 					compatible = "st,stm32-lptimer-trigger";
-					reg = <0>;
+					reg = <0x0>;
 					status = "disabled";
 				};
 
@@ -1216,7 +1216,7 @@ pwm {
 
 				timer@0 {
 					compatible = "st,stm32h7-timer-trigger";
-					reg = <0>;
+					reg = <0x0>;
 					status = "disabled";
 				};
 
@@ -1258,7 +1258,7 @@ pwm {
 
 				timer@7 {
 					compatible = "st,stm32h7-timer-trigger";
-					reg = <7>;
+					reg = <0x7>;
 					status = "disabled";
 				};
 
@@ -1351,9 +1351,9 @@ pwm {
 					status = "disabled";
 				};
 
-				timer@14 {
+				timer@e {
 					compatible = "st,stm32h7-timer-trigger";
-					reg = <14>;
+					reg = <0xe>;
 					status = "disabled";
 				};
 			};
@@ -1384,9 +1384,9 @@ pwm {
 					status = "disabled";
 				};
 
-				timer@15 {
+				timer@f {
 					compatible = "st,stm32h7-timer-trigger";
-					reg = <15>;
+					reg = <0xf>;
 					status = "disabled";
 				};
 			};
@@ -1417,9 +1417,9 @@ pwm {
 					status = "disabled";
 				};
 
-				timer@16 {
+				timer@10 {
 					compatible = "st,stm32h7-timer-trigger";
-					reg = <16>;
+					reg = <0x10>;
 					status = "disabled";
 				};
 			};
@@ -1775,7 +1775,7 @@ pwm {
 
 				trigger@1 {
 					compatible = "st,stm32-lptimer-trigger";
-					reg = <1>;
+					reg = <0x1>;
 					status = "disabled";
 				};
 
@@ -1805,7 +1805,7 @@ pwm {
 
 				trigger@2 {
 					compatible = "st,stm32-lptimer-trigger";
-					reg = <2>;
+					reg = <0x2>;
 					status = "disabled";
 				};
 			};
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
index c0e274eebf13..beba90ab1a2a 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
@@ -411,7 +411,7 @@ pwm {
 		pinctrl-names = "default", "sleep";
 		status = "okay";
 	};
-	timer@11 {
+	timer@b {
 		status = "okay";
 	};
 };
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dts b/arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dts
index 2531f4bc8ca4..d7eeedbc6600 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dts
@@ -1058,7 +1058,7 @@ pwm17_4: pwm {
 		status = "okay";
 	};
 
-	timer@16 {
+	timer@10 {
 		status = "okay";
 	};
 };
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
index 1a07ae09afb2..816669169474 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
@@ -747,7 +747,7 @@ pwm {
 		pinctrl-names = "default", "sleep";
 		status = "okay";
 	};
-	timer@11 {
+	timer@b {
 		status = "okay";
 	};
 };

-- 
2.43.0

