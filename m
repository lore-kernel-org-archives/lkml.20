Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793795442;
	b=MYsc3nN0Ubj2TanIY8rR29BQE/4qVly4/TLgHWfhMgPjvN698Au+hrTKjwOYc8CW/Y2W
	 MEfCtmhO8K7B6s/XR/prqV21XtS2A+DbOqGkvvzgCmI4YNcbnkquoTRrS5E5dATmf9sOC
	 3Bffcf7a3U0KfhX63lQ/wJTiQTFzkk2MvChDsldVgNksOhyYbmX8rxLUtwChSulJCVXXW
	 27Qu28otGMjWuCT4yn3sZo5PFl+f9bZrQ7y0LHDqMzYU3o3zM1LChr31eN5op8I5vyTmf
	 F7aPZ4Wpocvv/TLdIH4Dno8jn2DeKE01qqKsWnEXu/HwX+vp7b/nhf72p1G8SG4gAug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795442;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=hd92GcgT778Yt0B1JwZXuH2F889LDpcB4cZALLNz4n0=;
	b=oD20DVySv4Q/Plxfw+uof1oroeQkZh5n/tZeiww1yxHpgwgCPMvpS/WIsh6WXK63U0i2
	 oQMZnRW0O9ABD3hFTWQS4ydzrJoj+Y8OB56FoJHctICsCMUJ1uWuXh6XLGvYDHWTyLN0/
	 UbFFRbjlrlTeDhvKz1IwrPZQDPK/mowUe6jzD5tz4ILA7I7kZzXcGyH+91qYSZNUoxKRI
	 asqgNGhbdUYdFA85BHhnfJarLgR04eu4eWHuUEHwL0vmkjn7oOHjLs6SWx/Iy5+z+LfUF
	 k5MaJCnjPFcF3NaamFwlBpMEXl9P8avfmT+RS49HNLdeZQbmEDYB416PH8vdf+FNauQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Gc7mO5Yb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.9
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010009.outbound.protection.outlook.com [52.101.84.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34966606A31B;
	Wed,  4 Nov 2026 12:30:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34966606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Gc7mO5Yb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rVuTzr9xSSomF59jDZLQpzYWSKdu4vl8ObBUl58B53Q7v91nryZfLMMNH2l6Ou1mziXL/sxknOVbCjMrBP7PQNHnc8rXHFKyDhg0PSftm90CXHTvGEx45F4BSrr3DiLUcQowdQfvD7bm27lUPrJkvrtW1u/IA3Q5Ox2of+GPrKcWNZA283rYrE/NXDY71Kz02SFUOaq7utHDPYRtHVe9dIdTbwxA9Ea+YDJ2P2eZAfCgilp/DWBdd5ktxRNWMIYixjDqReM6J197+waNA02uzLLfrD75EZ+7D7ImVzeN3MHoSG61M40RGLlGjGh+l3aC+g/g590TFYx33h/aJEw2QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hd92GcgT778Yt0B1JwZXuH2F889LDpcB4cZALLNz4n0=;
 b=hSUDrIEbVg0vkuRCGrRalENwUC+oPlaLn4AgSLRfeU0jLGN6MHRMjYbfV8+Ntvbe7ddxcj82/d9pd8Rc958zdRSasZSvHkmurQz00quqz6DUCIfYLjj0s5YMMioYz7+u2yX8ZfUT0US9b8Czgsp0yW9aTb0KDaR2opE/55Gl9DNVT7Z9iGMHrOpGW4O//0buiibRQJRKg/v2PEL3pMon/u4Yr0XYM8rJsBcYIjMB9OsqF/LzkQ4pRiI/XfPaB44qg1bFCVu4j7qwZ+cFABu52Fcq7gAVJDE3iJegGlDxb81K3xrVhd2cIgxu1jUigSVXFpyfy5tzUgOn9z9B+dn3Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hd92GcgT778Yt0B1JwZXuH2F889LDpcB4cZALLNz4n0=;
 b=Gc7mO5YbdgY+z+PS8czdbIEn4JpOqCSuEZFZhh8RTbZcXp7jood2qHKzJXtKaYl9UgAfjR6iJRLVuMV3qdpCVPZWHmFDHgNOsKE0gnIzmtpgXdIH4MC8Os6Thdlb3bx7IfjjpMZLduozKLoVlIsZTq0VklSu1R/xAaIXEXwOw0hbT3/m8/p3ZBzpPCAGxONoAjfpk82Ii0eP+7hMs81s8FU+/r2obuZQBDOX8pay8c+kc0w6eWp1SbfqDQDIYHYnGejNEJAPQs50QW7hJgRr9C3b71Blkmb84C22rsz8Ml8nhkgli/l+FKrb5zzOfwwT0sLm5XOGQDRebc7jL2XHMg==
Received: from VI1PR03CA0068.eurprd03.prod.outlook.com (2603:10a6:803:50::39)
 by DU0PR10MB6653.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:403::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 12:30:38 +0000
Received: from MI3PEPF0000848B.eurprd02.prod.outlook.com
 (2603:10a6:803:50:cafe::9d) by VI1PR03CA0068.outlook.office365.com
 (2603:10a6:803:50::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 12:30:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF0000848B.mail.protection.outlook.com (10.167.240.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 12:30:37 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 4 Nov
 2026 13:31:22 +0100
Received: from localhost (10.48.87.100) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 4 Nov
 2026 13:30:36 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>, Patrick Delaunay
	<patrick.delaunay@foss.st.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] arm64: dts: st: add PSCI idle state to STM32MP23 CPU domains
Date: Wed, 4 Nov 2026 13:30:25 +0100
Message-ID: <20261104133023.1.If2b6b99285c1e60ca11b6e7fccf7d9b130ca20dd@changeid>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: MI3PEPF0000848B:EE_|DU0PR10MB6653:EE_
X-MS-Office365-Filtering-Correlation-Id: c77cee8d-e871-4870-ab22-08df3a6f6e49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|23010399003|1800799024|10067099003|18002099003|11063799006|261102123227099003|261026121527099003|261026140227099003|261022105027099003|261028144727099003|261021121427099003|261021123027099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	DtDTCjRjimFGq3qhRmYZhRY06h+v+/RQUsLQSOpLUpRTwRepnHPB+w7xsMgxfm5QkgvHxP8zAf/+hqYuUdNslj43k9cOCSy/b5AjZVYQEpBn7FK7D7RxDyfD0BBBClxUgpfZEaQl6IkFp8dUjlfOiobFMxdF6jWFoaCJ5VZupp5XchyImEbxtIt00wU6g0H0LS7PN2QkPODaztG5AAUUq4UQeabQOiowa5AI1HTz/qTN7lvGyzW5n/3J3mWQTuvtagomEQ15b+YFPtcN9rwqkFF8pdRId1SJUFACalTkXBxC98Y7maoBq7SiLGr0IcuPWXn6QTdPzjT9eovWGuhypiWw0e/eATWSFjMBgi1mygaF66/GOtvhN4z9wjKllqNEJikpY+86Zl9DCzcQJhqwgPtgeROImi41K2BLktAn3HfjbU1BzrlRMNAI2rSoHU9Uh5c8788a1TUBW8DHDGX/AObPGMU3pKAHCr+erNKxM3mqp5IEuWY0kdYrvKJpbwvr9u8BC35YxmimGj/pVAQOB2IGk3dXCOn+KZ0qFx9YMRcQzSpwgny28vq3wz7cqXJT1vShvNdEUtrQmjIuyiUU9ubWNStTdCae75zXU0uljCnyB31gHXGTy7MuijR815/EY3LzWKCQJXMkYfP8Fxm+tvJS1qpZrHiWUzoc5OQIErtdZnTImUiOCvdW9t9fOGk1S/kyFJ4ERzexhbu99wpAww==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(1800799024)(10067099003)(18002099003)(11063799006)(261102123227099003)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(261021121427099003)(261021123027099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PHj0AojaCJlXQSQgNHm9cdSaPKLJFfYCE6u8mQJ0pH3tCTN0iiX1pYwQIjcJhaR/LATnfwFkkZfCvS47x2DGMXFeF5YuuZ/iZmR7mN7uv7mL+jACEwVPB0hHsCw5MaCGQEPluD9S80VR3EmRpU6zPRJntoKSlJkMPi+hk9q7PlQ8POIuGLV5+gsq86M1lPQGjifMLPrmv2W8SukqDsQZ7eAz/9Zps9aWsilbJp8zWw0w1fxtMXVcaxLJtpOku6lL9Qa2u3d1MyPURX3N7dWh8ZQ1ul5nTx3Kxvy+7M8di5UO7mg5L/nqhMkD1OODeI7K5cj0ufkAy1g39XeISSIUnuU6KLhvmsXaHU4LdsiF8VrkEKjaMSl+j7bcPRrOBec8lPB+GGg1tEoHuzaN/qHo4fllxkDom1n1acVYLCzPXe1F/M++DekZjk7VGNn4/gHo
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 12:30:37.5553
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c77cee8d-e871-4870-ab22-08df3a6f6e49
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF0000848B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6653

Define a PSCI CPU suspend state and reference it from both STM32MP23
CPU power domains.

In OSI mode, PSCI power domains are initialized as off. The idle-state
allows the CPU power-domain governor to manage them, avoiding probe
stalls for devices that depend on the cluster power domain, including
SDMMC1.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm64/boot/dts/st/stm32mp231.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/st/stm32mp233.dtsi |  1 +
 2 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index fefbf6f4f153..27231e140fbb 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -24,6 +24,19 @@ cpu0: cpu@0 {
 			power-domains = <&cpu0_pd>;
 			power-domain-names = "psci";
 		};
+
+		idle-states {
+			entry-method = "psci";
+
+			cpu_sleep: cpu-sleep {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x00000002>;
+				local-timer-stop;
+				entry-latency-us = <150>;
+				exit-latency-us = <200>;
+				min-residency-us = <1000>;
+			};
+		};
 	};
 
 	arm-pmu {
@@ -123,6 +136,7 @@ psci {
 
 		cpu0_pd: power-domain-cpu0 {
 			#power-domain-cells = <0>;
+			domain-idle-states = <&cpu_sleep>;
 			power-domains = <&cluster_pd>;
 		};
 
diff --git a/arch/arm64/boot/dts/st/stm32mp233.dtsi b/arch/arm64/boot/dts/st/stm32mp233.dtsi
index 78f4059fca5d..cebefd99906f 100644
--- a/arch/arm64/boot/dts/st/stm32mp233.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp233.dtsi
@@ -26,6 +26,7 @@ arm-pmu {
 	psci {
 		cpu1_pd: power-domain-cpu1 {
 			#power-domain-cells = <0>;
+			domain-idle-states = <&cpu_sleep>;
 			power-domains = <&cluster_pd>;
 		};
 	};
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
branch: master

-- 
2.43.0

