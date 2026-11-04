Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793800949;
	b=5CRAcustVAo+xRuu95NIZ1fpssUNWYY3pwXuWtcNmffXGJfaDp+k0hvWxGh4Q/G+GNFV
	 9CG63wkW6OXwdtkRBHkVrgk6I0UnplqTkEbgxvLdFzzjs3gPw5UCB+rj3sfVbMqauMbC7
	 2si6zjjc8aN5CLKjorV5dRs9tK4BBneja4LHvZXwJtfWJG6bYV0OLRbyuAAhKdAKeDEY4
	 Nj6LEz/gbbsVH47QUWLErLSMuUIr0XYr9UVGFD4Gza5p2Y0pZvDPGC9s0Q03YKzM20mRg
	 uKtKwWcYtWCqrB8t/JyNodVSWmbSImfeD3mpy1GmbbaHmM6yOEWQCtTXnRdP5xaPVUg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800949;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
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
	bh=jvswK6w3AIQI+1f1eBo4t/jQYo2CoheT5B9K0xis2KY=;
	b=3WfajXwTjP9F0T6sdWkYYvnuvrcOx9u3KCCYPgWWgLNrq6p0Ad3bi6A/xnOy6SVgxK2S
	 opGtD6AV6qx4IyBZKmBxOoF9CaL7ae1gGVn0IFJoNTnyhXXxkvBhNjvGOszVZWiwJK9N3
	 o6OO8X44k/DLmPDeoef2ZLl6FeqFnwa665lPQ1OMTv/TXdGZPnh3qcYbHVb9lA8R6zd77
	 XU97TGbVdXTye9v96uHcnZt8ve33Cs2NMjLLZJxwXY8MkQeZljCyTIiK3z4zKjaqPrSzF
	 juAg73DwKi03jpxeTQoqbpcVE+9zlKoOa9/aiEBQsbMIqP5HFZ5eHw6ZchZRlufk8uQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=e5olORMg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.39
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013039.outbound.protection.outlook.com [52.101.83.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B4A606D802;
	Wed,  4 Nov 2026 14:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1B4A606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=e5olORMg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YRRtnon4sDxe83R/s5mW4De3wt7cIxLW2KMzApr2NEtgbS5eRm36HeMdPiWOg44jsH0p1vIB2dzjnUhLoHEMYH2BufRv5YbiNKDj8HNwzycJMerZWHXgrZP3ElqLTJW3wNEQ03msD4PBC9GLhXjvJi5xgj8hMIFDOcDNiS4998cGCqGSgi8L/iY6T60VeBUb86TqdaDPPYRqRvRdt7mCnz7Jt1LNQt8RHEPUd/uchJ84DM8vu1+mQrQx8R5vhXC3LYPSKUUNSpqFwBsdqxyD0BTgQ5Fnd6dlJ74R+ESnMKgAQ7Iv6968SzKn7IFAtXH3qabYhKu91nezL77Uw5O7cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvswK6w3AIQI+1f1eBo4t/jQYo2CoheT5B9K0xis2KY=;
 b=C1N/DYpK+/wKD3NYtoB5WPiCwmwhr/LAOiUPw2PkKQpsy5r6xuDN2UlG8kRsXbLKJK39QRbkmefguGisPAqZnlry0KhsZfIwGEspIwhcfJI1iyXuItXe2LAwoKs3zWAObyUDD+hOxs//zZzFWXu6SldVU9i44xK+oiPawaSm9eDqhyKLW085W9ser44AzXpl+hZTTIdl1Rg1RwVJGgDoRzC0D1ejmoXzByQLwV3XbqrvLktUwQEYTjy1BHVqjD4nv82wis/Ina7SYKRHgvOEYBOgErcO+uTZfeYZwDvTZrb/L5ECWnbBgH8AUWTwGMlszcx8bsMm4i3YwpfaQwLqaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvswK6w3AIQI+1f1eBo4t/jQYo2CoheT5B9K0xis2KY=;
 b=e5olORMg39ohx73HGVVQR0HrrmEoU4U4L24D8au//SfmGO5hdf0l61C5qZj1RJibZN6R9bA5LsSE7zv9Fiht+k6lQSqYHFj5wf19/rPfbkPi5L5Cq07lhAyKu75B6Ao3EAi6bhoTzyfbGQjHAPx+Emnm6bAaF4PegeRmsswa72YVlUmg00ctp4zrwTwsSNm5+8EOgKe53M7u9Rmf3bzZrt5IQ/JwaFpn2hF/coL6Xmzb+v88sdAV3bBKQ7WtwtCP9H59r4TmadF3qoM5P/ia7Yi2M0uzWTAdacH/Q4IBui089wtC+MiB0XQs9VpzOGRNb1M8nr/KamLQhKPTDn+dlg==
Received: from MI1P293CA0020.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:3::18) by
 ZR6PR10MB784119.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:910:de::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 14:02:26 +0000
Received: from MI3PEPF0000848B.eurprd02.prod.outlook.com
 (2603:10a6:290:3:cafe::5f) by MI1P293CA0020.outlook.office365.com
 (2603:10a6:290:3::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 14:02:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF0000848B.mail.protection.outlook.com (10.167.240.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 14:02:25 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 4 Nov
 2026 15:03:10 +0100
Received: from localhost (10.48.87.100) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 4 Nov
 2026 15:02:25 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>, Patrick Delaunay
	<patrick.delaunay@foss.st.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 5/7] arm64: dts: st: fix power-domain labels DT coding style in STM32MP25
Date: Wed, 4 Nov 2026 14:55:08 +0100
Message-ID: <20261104145502.5.I7e77e53b955d7d0f13e898bca1d395584cb6e2d6@changeid>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104135604.907283-1-patrick.delaunay@foss.st.com>
References: <20261104135604.907283-1-patrick.delaunay@foss.st.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000848B:EE_|ZR6PR10MB784119:EE_
X-MS-Office365-Filtering-Correlation-Id: aecb674e-f4cc-45f7-ef2f-08df3a7c418e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|82310400026|36860700016|261021121427099003|261021123027099003|11063799006|56012099006|261026121527099003|261009223027099003|261028144727099003|261022105027099003|261026140227099003|10067099003|261102123227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Xlae0WtjJhVdJ7nlz29ylLGxppTD1RaWe0BPQIl4Wsuf1dbKDVQb6iIJacx1u9osSLyLLvqTm2LGrfQKS0nSDSblT8tKZzjkLptvlr4xDaJl+Sptovs+iLa+SiMs/6eXjEDB1N2vo1vdgqa55Mzf22L3pw+oUfqpwIOgPbcX8/uHfMScGPE+APw0V9JieUc7RjlAbKiWknogv3WnK94n08SPEGOmfib6an65hkQIN6EwI3uEhaAsa10pkNwRT/jhSI8obqNshlG7paR6NF/f3VRWlFbRmghKZpPbtmbxyMCpypvPtB+xwMtueCqn4DCAZf0JQtGsrMrVu+wycoVMlJEGfY/NT70VyDFlJjpFq1mjFc/5dmlpCcUsvQNz30QA8M5gM0d30CZrw41GNVwjZp+qEK+kJXayMzgKmWjTYurwASgWeDB4HVW1AAT+O7td4QHDeLDWCg57SDgwVOtL4oNMOMnYf+tTn7M50FoxnYhu3PYLWPjmdgv/TChfMuVsDwkUHO+17ptu3Lc9vguV0KC6qcrWF5Iz+V4bSZnhDcMa8S7uD4NNZaD735mNK7R3/qklFZRRQIHEem6CL3/cClNCN2dGzPbtzBeaA73hKC4yuUtrFw6FwY8ulYUg0yKR6zgt0f1L6qdROFcd9IfF/U+Hz/AHvOscPxUccDsbnlmqlxbFgs6Me8HIFG9G8T5HC/+bvlYBMFmXCLXzDxmP7A==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(261021121427099003)(261021123027099003)(11063799006)(56012099006)(261026121527099003)(261009223027099003)(261028144727099003)(261022105027099003)(261026140227099003)(10067099003)(261102123227099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qMZhuhczISosYwr+9GytoArFfLSeAVk61JbLBS9tINs7Q8IkDSj4nIt5RlaoFrFkN77k3XFx0KPv06XPh5BC5AVXHOR2NFIiAHHk5/ddT/MvsO9FU2BQg8aMVjXMkW4Ej0W5O0dw9mtF8uyT2VYKmQ0w8jXkaxVoMLkiSSCPoERdZD2WMxGehW4oPSW9RKmjjTR/mldytGjCSoO7pWGwm2FP5TKRJjbaXIWqaq03jXAOutOUyu5CND1udVk7irsGOb+UHA9qI76fPy27znrdkcQV/ipuWHLRfxspPCCv+uk9ccjQGm1xu1ocKHTIrxglFYS9gyNdOk9jTXv23EvLtuS0wxTDsJSSsj5/7VDxG96K84FmyIB63oCk7BfklxUKXhZ4BDlQn4NUq5xHiUltnaHA1+eDTKcWJOa2SUyzkLGwQy7pTQhayaaxTP8OHCyt
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 14:02:25.9687
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aecb674e-f4cc-45f7-ef2f-08df3a7c418e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF0000848B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR10MB784119

Update STM32MP25 power domain labels to comply with the Device Tree
coding style requirement that labels use only lowercase letters,
digits and underscore.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 24 ++++++++++++------------
 arch/arm64/boot/dts/st/stm32mp253.dtsi |  6 +++---
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index d5204d88344f..43b4edfa07fc 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -22,7 +22,7 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			reg = <0>;
 			enable-method = "psci";
-			power-domains = <&CPU_PD0>;
+			power-domains = <&cpu0_pd>;
 			power-domain-names = "psci";
 		};
 
@@ -155,25 +155,25 @@ v2m0: v2m@48090000 {
 	d1_pd: power-domain-d1 {
 		compatible = "st,stm32mp-pm-domain";
 		#power-domain-cells = <0>;
-		power-domains = <&CLUSTER_PD>;
+		power-domains = <&cluster_pd>;
 	};
 
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
-		CPU_PD0: power-domain-cpu0 {
+		cpu0_pd: power-domain-cpu0 {
 			#power-domain-cells = <0>;
 			domain-idle-states = <&cpu_sleep>;
-			power-domains = <&CLUSTER_PD>;
+			power-domains = <&cluster_pd>;
 		};
 
-		CLUSTER_PD: power-domain-cluster {
+		cluster_pd: power-domain-cluster {
 			#power-domain-cells = <0>;
-			power-domains = <&RET_PD>;
+			power-domains = <&ret_pd>;
 		};
 
-		RET_PD: power-domain-retention {
+		ret_pd: power-domain-retention {
 			#power-domain-cells = <0>;
 		};
 	};
@@ -215,7 +215,7 @@ hpdma: dma-controller@40400000 {
 				     <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&scmi_clk CK_SCMI_HPDMA1>;
-			power-domains = <&RET_PD>;
+			power-domains = <&ret_pd>;
 			#dma-cells = <3>;
 		};
 
@@ -239,7 +239,7 @@ hpdma2: dma-controller@40410000 {
 				     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&scmi_clk CK_SCMI_HPDMA2>;
-			power-domains = <&RET_PD>;
+			power-domains = <&ret_pd>;
 			#dma-cells = <3>;
 		};
 
@@ -263,7 +263,7 @@ hpdma3: dma-controller@40420000 {
 				     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&scmi_clk CK_SCMI_HPDMA3>;
-			power-domains = <&RET_PD>;
+			power-domains = <&ret_pd>;
 			#dma-cells = <3>;
 		};
 
@@ -605,7 +605,7 @@ lptimer1: timer@40090000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				access-controllers = <&rifsc 17>;
-				power-domains = <&RET_PD>;
+				power-domains = <&ret_pd>;
 				wakeup-source;
 				status = "disabled";
 
@@ -641,7 +641,7 @@ lptimer2: timer@400a0000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				access-controllers = <&rifsc 18>;
-				power-domains = <&RET_PD>;
+				power-domains = <&ret_pd>;
 				wakeup-source;
 				status = "disabled";
 
diff --git a/arch/arm64/boot/dts/st/stm32mp253.dtsi b/arch/arm64/boot/dts/st/stm32mp253.dtsi
index 8562f13e5284..7df1031b7e91 100644
--- a/arch/arm64/boot/dts/st/stm32mp253.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp253.dtsi
@@ -12,7 +12,7 @@ cpu1: cpu@1 {
 			device_type = "cpu";
 			reg = <1>;
 			enable-method = "psci";
-			power-domains = <&CPU_PD1>;
+			power-domains = <&cpu1_pd>;
 			power-domain-names = "psci";
 		};
 	};
@@ -24,10 +24,10 @@ arm-pmu {
 	};
 
 	psci {
-		CPU_PD1: power-domain-cpu1 {
+		cpu1_pd: power-domain-cpu1 {
 			#power-domain-cells = <0>;
 			domain-idle-states = <&cpu_sleep>;
-			power-domains = <&CLUSTER_PD>;
+			power-domains = <&cluster_pd>;
 		};
 	};
 
-- 
2.43.0

