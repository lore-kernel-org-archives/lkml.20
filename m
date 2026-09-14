Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011069.outbound.protection.outlook.com [52.101.65.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760343812F0;
	Mon, 14 Sep 2026 06:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789368876; cv=fail; b=jcSTSwuUoT3tG1BS2C9qwRDU5FeiWjJCmIRRud/5cFm9hPtLLHpPifRmmPbZvmiuJJhMmgBH5bB57pbdxD6VfC1PU9GRXkx85tGD3Fa64q96lRf9GNcoUfohKURQCfZUl8BOPRer8x9vRDwZNjdYCKx5vMqh0YmrI1HMd6pWCGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789368876; c=relaxed/simple;
	bh=4HKXF466vJPtgTJpwUg7y58vVS6yOf7ojX4AKKujnZA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=MONWDUDk/z+VphQHz0f075DXsZH9zKLCvdVnLIBXUTwb2S+Hvw+0oLxzkO8CxrjUIzBT/WgN0htKpPAytN/krSRuigb5sld1YQQNYpMRRyAHtxM4hug4+SBBMUi0v54g1YLxYm3tJH/BYiy1kkjvjrmxbbEf5nCBXDPZ7JgOb6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=jD5j/bIx; arc=fail smtp.client-ip=52.101.65.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="jD5j/bIx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QuGUc6g1DM9H47SgVnwBYtCzZLzeLuANNvLQuT3EcOp19XrWiRlYWIooFmxNsn+1oGnuW2cldJ0MxCg28mBlekbN0pV0MXZf1CdzI6yX6cHsgfJ94ONwg8so54CabMeMgLIw5GLJulCNWN1UPivs/nDLj9aNvSndtWj5LejfG6PasDtwz03cW9fF6NgyKo8PBqIpic8KnG+oVyYvXRx80YVhjThFXb1XNiHrNXxUrK6bYce5YlEC+4I/G6kOayqcx5YNL1Ccvek4U8GXdQRmzZDz5CfPzADoxGSuxU24QiE6I6QkILbTn59H9jlfrPrA3do5NzwM2thQdIJao26saQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TjFXdIQDBKQwP0lYYQKD7Abej6Sjh4yeyPLB4CsJk6M=;
 b=HA+FAjqnO4TZ89qGJGP4gBd4RBC4KAzyTArYHsDWo5W7r/Qt+z51ZcAwfSmisvM/kDm5zgYgDNfZWSy4YrnKZpqGGnaSO4otXJwziaXGAy+gz7UbzuGNGAOCs4/nB3FbtrkK1xQ+VE98G5mWWlJp7UKK5Q9JQd98GrG12cX6sXG+6rBAZGmbeIL1pnAhaVcHNuV7zFeu9zQeDv1W0CjzthA3Feb7guVrP3bcmxWTs7gdLHJJRViGlF/j4z95pR2PKy+/jJdaqz/DY/me3w2gZ/7Ec7ryLvH/u1eYMqRJjQGeuOVOdrIeIPInn2tCw13mH8BP/FLqWNXdwbtT5lc70g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TjFXdIQDBKQwP0lYYQKD7Abej6Sjh4yeyPLB4CsJk6M=;
 b=jD5j/bIxNoMliziVNhUPLBA6SeD20BEU20lnXIb4T4LCyOx/pnkhggU2FHZic7w3dhrlG995u3SFtt2PZ88ADCq4wqQfKFoDYi7Ckyc/BR0l4qR1neNvPsI3R331SLCqK85ZP7PGDbUoMv8V80WAwlQOhzNlAnugdyCs2u9JX7VzjpMmeojiu+pyXAxy442HPUXT/cfIrO2svBib4X0I91RFPSOdvgBaJ60h3LKwM4JW5++Aw2EXD6i0iuqbyZ5PB1tg3tKCAr08GjIH/trPkt4SrqfCoTH7GrgH3WZzSyNDjVKyfEljmEQaPPJRYOJsBXLNnzsr8+JK5+d9MdqxZg==
Received: from OS6P279CA0169.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:38::10)
 by VI1PR10MB3743.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:13a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 06:54:30 +0000
Received: from WA1PEPF000099CC.eurprd04.prod.outlook.com
 (2603:10a6:e10:38:cafe::7a) by OS6P279CA0169.outlook.office365.com
 (2603:10a6:e10:38::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 06:54:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 WA1PEPF000099CC.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 06:54:29 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 14 Sep
 2026 09:00:32 +0200
Received: from localhost (10.252.27.156) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 14 Sep
 2026 08:54:28 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 14 Sep 2026 08:54:19 +0200
Subject: [PATCH 3/4] arm64: dts: st: use video-interfaces media bus type in
 stm32mp257f-ev1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260914-stm32mp2-dk-camera-v1-3-2f2bd719bb63@foss.st.com>
References: <20260914-stm32mp2-dk-camera-v1-0-2f2bd719bb63@foss.st.com>
In-Reply-To: <20260914-stm32mp2-dk-camera-v1-0-2f2bd719bb63@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Alain Volmat" <alain.volmat@foss.st.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF000099CC:EE_|VI1PR10MB3743:EE_
X-MS-Office365-Filtering-Correlation-Id: ac5d76bd-cdcd-42c7-43ea-08df122d0620
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LMXh+zJQZKdfIiTRQmCf7l1EOkAqjzqB5dnbU6P4uP8NWeGeNyrHRZXV56SCnFABMnY2AWSV8OHBqh2U1RVCme6G6t2QjUXRu8XOcqZHkETSKMDL1BTm32PgoMcSYcbUfKh47j3tKQrgq52aCOqr0bUoV0wUYz+ZdHVCphmIF+oQOQVty+QZ4lChNbrr+YUZAKwkbXf0XQ2pOCTN8/Zc2ES2ig9NAXH0Ai+XeO6xYGnsGVnYRMSbbzN6RzMIYX7N3E4SajVgoiQmjHNrlsRvfQdHl7FzqIxWH1dPIcbKCtuMgOvqFK6Cvp0pVtwCxHQ3xj1iqRY+99suxImIDMokiI4KLM2icz/oB03OwsD+Y0FRnGkjkiH9oVRtOU50nWEbRTtyz4p7y3lE6bs1LTeA/Gpop3xo1/9oDDWg02g4zp6qkCCOIxXU0bJzY4e/B1vtHL34pC6nQ4au0E4bkZHyMMknB5Mg8JoP2jpPlLiBKZherS5RCokyABO7KrXc9fsO8VsLQZILSmDA83rar/a+rE/0cMdvQyVJNQI2rz2zZGezJBlskz9bcFuCZYygC2RXqgC/wvsdcVuWjsjdtwv2TOtFuqHfD1oQd7RkPXCxqiQHGbdgLJKWwxzvSApIu/JuVlQokJZxOk1+cvcslVcjq3mcfc4P3QkwY8isv3NeY+f6YL4MdBQ+QEKGdo+zntkJmXKmOVDoaYcZ7jouaqCv6g==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SwtXZwjrQDI1IjyHg1Vf41ZDg/4Qo5yAeCHs9qlAHDubQdVnTlc+FTI+23OEPUw2e1kG+YE0BbN8VCvUBJUvhKlP1SrZRZMTjH/UUC6avikjMk9dvZBGAM3VEVLzqWrBpm4OBSmvEaZd8bVbdYsQ6A1BcIa+SXajXaGfTJt5uD0zcOy44SW1aXeIhzS60LXz0Di81eqWJa1PaQIPQ99JstQr4uTsvIsQgqXz5DMjYZBXoWbuNZo2Ivb6PC0tON+MS3EkiY0kL7LR6EK41qOJIIFzi4UqrP3mxo/1YvAYs7lqQ1dH3+R7zdaqqdt0KW3EzOPbGq+u1y/JUzA8zj7+B4C69h4WZLpKejikdCxiz8kVHR/WcfRALMBmpEHhXHd2SKDaCeKB2M9WkqyuCzYnbQw0GiuRm2seHA9NN4i2t2+nYSnEzFtC3Th0tBsmUndo
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 06:54:29.4439
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac5d76bd-cdcd-42c7-43ea-08df122d0620
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	WA1PEPF000099CC.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3743

Use MEDIA_BUS_TYPE macro in stm32mp257f-ev1 for csi/dcmipp bus-type.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index acc730146287..782b4bb843ee 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -8,6 +8,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/regulator/st,stm32mp25-regulator.h>
 #include "stm32mp257.dtsi"
 #include "stm32mp25xf.dtsi"
@@ -161,7 +162,7 @@ port@0 {
 			csi_sink: endpoint {
 				remote-endpoint = <&imx335_ep>;
 				data-lanes = <1 2>;
-				bus-type = <4>;
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
 			};
 		};
 		port@1 {
@@ -178,7 +179,7 @@ &dcmipp {
 	port {
 		dcmipp_0: endpoint {
 			remote-endpoint = <&csi_source>;
-			bus-type = <4>;
+			bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
 		};
 	};
 };

-- 
2.34.1

