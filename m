Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794241554;
	b=AVBHyceg2Zfr2Cs6LzZAyysySPH5fOZrrnU9+/QohqcjmqSXOBoN1CmxiLCwgQ+Aqk2m
	 nEiBJG18rDnCjtoXWYarUsV0XH5OtQIb/+MD1vOp/f7JyZdaiR6X1qX6Qxk37OcAks8tZ
	 u/Yw+6emX1ybGrpUDJVgWkq8ZskLMsjJ1rfLLhy5GW4vueAO4vUv7rhfm8oqMLYOcFXxg
	 oP9A68bVfU2g+KddigYl9n+ttmwrQHlzJz+34/ujjFU1UZ4m+p3TLTXs1G7Xx/OLp9LI1
	 nX9kASew5cpiNRe2QKUoAA2jvXgjduOKQFmYeudmM+C6w+YX9By3NiEhJo9rfRx2q/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794241554;
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
	bh=2wyNqL63kWtVje1ffZSADS4BlKEGmGfm3wjpZr37pf8=;
	b=2QBEmn4cfMMKUJbrT58DwF8mLPZHJ4Hraf1Ww3I328vf/gTkEY4dEurCxA/p2DROfJ53
	 nQ8hBP/NPajgKtjLAilQJQFeI9acaG8SrvGzssTw4EQ6pOGwXPHCbuz5r3bTtQiBq2RRT
	 eyeBlRQM4FphPrHyarElxrnmZ52u98hvBz6j1mPCk4C8bmfhfernC515njifKJFLwrjqE
	 O8Ez2L4DGqUnxlDOj2jYL++k7+Kww0mPliXJJVAnMS5mJqom5RZqCeWa3GUe3K0JgU8Sn
	 jzVeTI/TcapoZveYocP0kW940mLt32utdJ8/GhdOLwOrwDz7DWRcZIDLGow2tm6SjPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=VxFNqdII;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.8
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010008.outbound.protection.outlook.com [52.101.84.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18608606EEB8;
	Mon,  9 Nov 2026 16:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18608606EEB8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=VxFNqdII
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VyTvHSs91kvLi46TsvIr3T19Z05d/CHnU3nNXItgnZqg4hKbzAlt3Fy/sjdKGF4rs+oMK2HFKq1TYPBvAJxd7tg2/GoD1yimAhHxMta9g0heH1ezFk4v+izm96rAhudCptrXTbzokPoA4nkv4LBRBUcavLqW0/KDHQl5drhbUOjqYSQ91hCQJbNQYdOBSSrprG6YZLQogUs/4DFu3SeN3jvYooT1TF46a9ngvJCnuv3trE66Lxt7PrVz0CRG/x2k5IF3m8JtT8SQxEvzWweqWMYXR3VpSx+1easIdVwQrsEq+M61Ct2KGVcDtXz/5L5VMR2K0h+s4VzOS+cZJC/yXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wyNqL63kWtVje1ffZSADS4BlKEGmGfm3wjpZr37pf8=;
 b=Brh2NhXHMqECqnYEX1s2ofTb4vLYDPpduPRPGKEP3GpBLWblcofGhHa/xZ/TYHTyHZhkcGpVuoRkv0GAtbEohijWzxNUa4F6Od4UlbC2+ZqX8COMy0hPvzDjwZtTkgxDiv53IA1oWfvxHZi9B7/KC4pYMkGr6exnzxS07WDcug/Mwi/ZEdtSjNs2BNyBLrw+e7Two4ofG5aCnj9JnBsRVSA8aczqKiTPL+TXSIk2joBvPT7AQkSWdj+L5U2SFBaoxyatPE7edhpxpSaX2uIquAc6VkYGmAVFAnPscuOhQHogexjbJA9HftuzpBrGBdHE0olU/NxyaKXleTwbT+4hmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wyNqL63kWtVje1ffZSADS4BlKEGmGfm3wjpZr37pf8=;
 b=VxFNqdIIsVjINw9tsXUvrRb4F1Vtg00PRQ5eXueOgKTDTKDHlNdwdyLjaYI7HPLUCyr1GIVd5znmXGSGlYiyNuvxiryD0DXZ7/5MjdKMO/QfkqZEbWXnesYBm+S6HXsFQ8R4/eKB2ShLDi8h6XNCrix8ihwiKhmZYdOd8Vg1+JX8BF7hiFpSVnaXuWHlMolhbVq1JkqrGuv0tp4Lx46NdxgzgtUJK9IzKYvqqNdzsRLnWa+fOb9toDqUzj/ywEfvBfFHshZ7pTTFWPBha89H9Ckj44XTio3u0lvQ3fwhqaOonbrYv6QTbZg4F9A0bebtHbL4MszWiTYRjMnvBJd3fQ==
Received: from GV3P280CA0004.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:b::18) by
 DB8PR10MB3595.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13d::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.8; Mon, 9 Nov 2026 16:25:49 +0000
Received: from WA1PEPF000099D3.eurprd04.prod.outlook.com
 (2603:10a6:150:b:cafe::94) by GV3P280CA0004.outlook.office365.com
 (2603:10a6:150:b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.12 via Frontend Transport; Mon, 9
 Nov 2026 16:25:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 WA1PEPF000099D3.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 16:25:48 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 9 Nov
 2026 17:26:27 +0100
Received: from localhost (10.48.86.251) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 9 Nov
 2026 17:25:47 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Mon, 9 Nov 2026 17:25:03 +0100
Subject: [PATCH 1/4] ARM: dts: stm32: Use hex timer addresses on stm32mp13
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
Message-ID: <20261109-timer-use-hex-unit-addr-v1-1-b4abfa457adb@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: WA1PEPF000099D3:EE_|DB8PR10MB3595:EE_
X-MS-Office365-Filtering-Correlation-Id: f3c3112a-4dc2-46c5-d48f-08df3e7e1cfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|376014|7416014|1800799024|18002099003|22082099003|6133799003|11063799006|56012099006|261028144727099003|10067099003|261026121527099003|261102123227099003|261022105027099003|261021123027099003|261021121427099003|261026140227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	g1Md6TbpHwsi69KJ4VNjJfCvJ3sWo7DugYPpal8nX83qRydKwMdHylcwSO5vMcPZMRINJui863/oF8ob4iGGF4gVjecMr2NFHFHIn+5zHUo/8o/zF7LtC1wcH0n2CbBzM8TLFQYxy0LtqM6Un93YEKBX8Pxv2+osKi8G5eyw9bQot3mtzW3Vxwr8FT0TdAkLuZlmBnkGFibywtYR+gmtwCk2q2PUSLr0H7mOEahPB4tL35IuoKcS3yhZ676bz9K1QBkd5xPKCKcvBLqFRd5cgS0JtiNeQ+rUTd6SEBmBrOAk9b1lxG882a+LhXjkJwCunElPABjAKE2/iVekTXLlAlkfSCshEI3H60BLHIMdPnuseY5mMQvJ9PKKT4TJyqMqRnuzJYxwSVa6K/V5y58t36Dj216DoRimdENNCBJvUqCdgZRc9o84wLeZfXMbcbIOjE4bVjUaV8xncHP3VBxitVW7S67RvLiE/qOyKZfGyR+4FSWwjaci4pbmeE/AauDmtKfQAPkQdW+gf98MCN+hHlO4ajzfOpn2/IMKYFdiqfhPEWCwKqjP+YNGMpNcAN0eYxqLgzZohOlZijwwxF/QAKScV1KQXG1Gi8EpBxsd5PLvz5toi4jFoPy6m+U/9Ebx+ZtWX4Q11oEcSKjXfY4/zCBxQMNyISwl/5N2eNUv3AI=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(376014)(7416014)(1800799024)(18002099003)(22082099003)(6133799003)(11063799006)(56012099006)(261028144727099003)(10067099003)(261026121527099003)(261102123227099003)(261022105027099003)(261021123027099003)(261021121427099003)(261026140227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kySNZ54fSamgxyt7chFca0/+NoydXngzk+8DRanBdzaoBtKqCGP6nNzajTqAvwLL6D8E5h/7oXpfkqHLSAuIAD6+QhCOB8OzPKnlKsUlu6en/AK52yBdc3N/5NCV0F8s0hTkZq8Skpg+CyKOIw5juBRaJTofr3QOD0TBxG4MsqdR5omjtyqEjGgsXR+oqmhpUGbFm/ZcMvECnC+q4QrbACwiYD4Jx6X4ZVbg5oS4VzX6wnannNe2VXH5W1OvZb4bjefwioLAMK79mfHvsb0I6y7uMfNM2sAFLvo7/z0ZXM+m7cm54vqhBtrdxkZ6FADkp+7JAxgH53MNUI1Xjj0amhMxSlCjGUpU09JgTRDfd1eSya0hn+hp71Msyc+3hExUTbCZvV2QRtNAZXeLChqgRMVRYQ8zyeNzo7Q0uwAbvrOkydDMdUBt4Nu7W7rPkWGF
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 16:25:48.1877
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c3112a-4dc2-46c5-d48f-08df3e7e1cfb
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	WA1PEPF000099D3.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3595

Use hexadecimal unit addresses for timer subnodes. This has been raised
since ("dt-bindings: Use hex unit address patterns").
Also:
- adopt hexadecimal format for reg properties.
- update stm32mp135f-dhcor-dhsbc and stm32mp135f-dk accordingly as
  they use timer 13 and 14.

Link: https://patch.msgid.link/linux-devicetree/20261102135330.2493332-1-robh@kernel.org/
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp131.dtsi             | 46 ++++++++++++------------
 arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts |  2 +-
 arch/arm/boot/dts/st/stm32mp135f-dk.dts          |  2 +-
 3 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index ae45c2023afe..dffabf19b615 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -188,7 +188,7 @@ pwm {
 
 			timer@1 {
 				compatible = "st,stm32h7-timer-trigger";
-				reg = <1>;
+				reg = <0x1>;
 				status = "disabled";
 			};
 
@@ -224,7 +224,7 @@ pwm {
 
 			timer@2 {
 				compatible = "st,stm32h7-timer-trigger";
-				reg = <2>;
+				reg = <0x2>;
 				status = "disabled";
 			};
 
@@ -258,7 +258,7 @@ pwm {
 
 			timer@3 {
 				compatible = "st,stm32h7-timer-trigger";
-				reg = <3>;
+				reg = <0x3>;
 				status = "disabled";
 			};
 
@@ -294,7 +294,7 @@ pwm {
 
 			timer@4 {
 				compatible = "st,stm32h7-timer-trigger";
-				reg = <4>;
+				reg = <0x4>;
 				status = "disabled";
 			};
 
@@ -324,7 +324,7 @@ counter {
 
 			timer@5 {
 				compatible = "st,stm32h7-timer-trigger";
-				reg = <5>;
+				reg = <0x5>;
 				status = "disabled";
 			};
 		};
@@ -349,7 +349,7 @@ counter {
 
 			timer@6 {
 				compatible = "st,stm32h7-timer-trigger";
-				reg = <6>;
+				reg = <0x6>;
 				status = "disabled";
 			};
 		};
@@ -373,7 +373,7 @@ pwm {
 
 			trigger@0 {
 				compatible = "st,stm32-lptimer-trigger";
-				reg = <0>;
+				reg = <0x0>;
 				status = "disabled";
 			};
 
@@ -585,7 +585,7 @@ pwm {
 
 			timer@0 {
 				compatible = "st,stm32h7-timer-trigger";
-				reg = <0>;
+				reg = <0x0>;
 				status = "disabled";
 			};
 
@@ -626,7 +626,7 @@ pwm {
 
 			timer@7 {
 				compatible = "st,stm32h7-timer-trigger";
-				reg = <7>;
+				reg = <0x7>;
 				status = "disabled";
 			};
 
@@ -1417,9 +1417,9 @@ pwm {
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
@@ -1447,9 +1447,9 @@ pwm {
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
@@ -1477,9 +1477,9 @@ pwm {
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
@@ -1512,9 +1512,9 @@ pwm {
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
@@ -1545,9 +1545,9 @@ pwm {
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
@@ -1578,9 +1578,9 @@ pwm {
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
@@ -1605,7 +1605,7 @@ pwm {
 
 				trigger@1 {
 					compatible = "st,stm32-lptimer-trigger";
-					reg = <1>;
+					reg = <0x1>;
 					status = "disabled";
 				};
 
@@ -1640,7 +1640,7 @@ pwm {
 
 				trigger@2 {
 					compatible = "st,stm32-lptimer-trigger";
-					reg = <2>;
+					reg = <0x2>;
 					status = "disabled";
 				};
 
diff --git a/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts b/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
index 70d85af46735..9b8baed6a022 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
@@ -349,7 +349,7 @@ pwm {
 		pinctrl-names = "default", "sleep";
 		status = "okay";
 	};
-	timer@12 {
+	timer@c {
 		status = "okay";
 	};
 };
diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index 2d6c5af7e481..b2a01a0f9a3a 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -563,7 +563,7 @@ pwm {
 		pinctrl-names = "default", "sleep";
 		status = "okay";
 	};
-	timer@13 {
+	timer@d {
 		status = "okay";
 	};
 };

-- 
2.43.0

