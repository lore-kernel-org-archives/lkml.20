Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011033.outbound.protection.outlook.com [40.107.130.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4584A38A73B;
	Mon, 31 Aug 2026 18:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788202245; cv=fail; b=g7mOIY/n8NIqbUhfKaFQbiUWMuxRN//oXRtGoXWjtCvq0Uzft89+1gmM+l2+T1hpLRL8Ad4EgZpB0LyuOrmG9lJkT0YtgV7Qcr9foOR84Bj0SV60iS7w9vg9GpQaYFtSrCRmVxXjwl6XI9L3bbjdorGH2bN1c504Xzn0H2tnLvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788202245; c=relaxed/simple;
	bh=ahn9JFdZlt1NkNxIaFPwfoWX0pzPC3l6NWBEwSh+9RI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=uJu33LFSaAAJZ6eTQ2kxBucAnjVtnl9IynkGn6xkZ67FuWmtKTqGSzeSzUISGvz552bLwk4yBqImxNRKxjZR0C3XwnJ99Tvgm9k0OZBe4vnaYHJ+YMvSOOawB/VkRpWTQ3x3TVeG/KlD3Gzpwwoc7CIEKLlTycucyqhY10nbbfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qEsHd0aK; arc=fail smtp.client-ip=40.107.130.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qEsHd0aK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L/uH9QVklFYCH2bnYeNZsahFZgPpNq4LYV/pGcyGynZSrOTO+QVWmWeOYeL4cvOFi2LjaHwpjApREokP1rpDidGLo7fRmrLaP6DvLOfgRJzZIBLp1nciA9/UILguirC4O9aBwpm0AKKF1mWIllb2mYdBs1lE/6NnvtskbjTZWwYdCUGmane4/hyvPR7y95HiCqrzpcZ1OrE5j1chz+Wzq4FjgSilpWQz8bX4CPDnKP3+nlp5vOoYwYopbW2Owwm15rQiO3JcxQMpWMBekAz2FvOU0jeqCm2luOhMpEjQs32y0oC5q0HZQuQRbTVYBVWDA5WR2DYMWpiTwTfWbdbOaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A73HwCRr0ytLESu6x1iJ7uX34QIjj6bIkBw7RZl0J54=;
 b=yd+pZ89NaD5pWBhyd5082wQCuEdhTGp5cxNcenfHAsaW/oOFC3v33is6lcX2Nhnx7AE230vAeyZKJsdWl1EBv1vdQ7rmujVfwC5qxez2gib5QYvhGeagwXLFvSbrhSVtk22BOgKVUlVTaJYlbeVdOl7365PAorAoCtb65DizZwbEmMsNiyT3Tm+oAkGIzhuMI6tPBIHhDI29tBaqZkLOkY+tPXczhKcCbkdoSLaGP+i1w7kRS9zPeJY54wYc9Ch4afv+UpDqt9V4uUKmGvIUcBCNPzCE7l/YwxIKkbZtU2cPmjWJBs4LI0jkjorpOQxiLe4HcaNNo6PHj+75F+m0zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A73HwCRr0ytLESu6x1iJ7uX34QIjj6bIkBw7RZl0J54=;
 b=qEsHd0aKY5SPXmcvvZBKEyNhBMWFjOCOiipraSGL5MPO9E00ccXC9p0/NNXNfl+TcnDqf3w2N4XGI/YdofanaAPe8ZyJtq6S2Tg2sWTIwOWfnzdqpmAfcxqrmeD3eDF6d60++qGG2VR4cdGDdk6VNEmpaSfj5A6gGFqNsParKV1Ecx23jmfEjlPD3ZGu5j57ZBPZRyV0MRkm1ioFFG8/0KSfZOJc0RZjMlDznfMnqxG9dUmJvG9XQOiAXWUwBAQnjaMfUZEcfUF0VmzVTxnQRdugBqbby8M4mEl751nDYG0lx9mNZBxe4s1e5hfy0l4h1bJoJSsh61cJ7YnOOsqA+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB11994.eurprd04.prod.outlook.com (2603:10a6:20b:6fb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 18:50:41 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 18:50:41 +0000
From: Frank.Li@oss.nxp.com
Date: Mon, 31 Aug 2026 14:50:20 -0400
Subject: [PATCH v2 3/3] ARM: dts: imx: remove undocument properties of
 st,stmpe*
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-dts-stmpe-v2-3-f93d5f080443@nxp.com>
References: <20260831-dts-stmpe-v2-0-f93d5f080443@nxp.com>
In-Reply-To: <20260831-dts-stmpe-v2-0-f93d5f080443@nxp.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Linus Walleij <linusw@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788202221; l=3061;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=vObI9N9nWeIftc272jMDVqqNqfJYNfI3KxDU/Y3lcMc=;
 b=kdeVO0LydXvto0i058tU3Js/TAdwduUiZGBLWhZhcFLwRuoQ2XpC1FrVShTpjTsY1gwZ05UJR
 diRPI71iQv3AbN4k1PLBkO9isaubpAwm4+4tqG8NlrkNFoSlAk+p2EH
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: CY5PR15CA0105.namprd15.prod.outlook.com
 (2603:10b6:930:7::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB11994:EE_
X-MS-Office365-Filtering-Correlation-Id: 472c0f89-693a-415d-c646-08df0790c196
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|1800799024|23010399003|7416014|366016|921020|6133799003|10067099003|11063799006|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	jQzE38C9BmOtBKl1Jzld1XQ3EKS1OeT9DOYZlypXH5PZ0r6QUFzJ/zK/OIlLRWe45k8l6/iWOBoO8ak07ToxryNw+Ir5iaedV6zvbm7buRPFFHyji7IzMASHRR3/t3/dOIHe6PSlpN9hK3TlvTvYAnAsDavv0hOl2FzBlZS+ZpAwKkEZH9cPFtjJh77luuBFJoWunDJc/S0dZInfWcx8L6OXYTEGAQ3YIfbg/HalAVo91U6iApf7Gavd/XVoHWs93MLZKgA0w+NMeAX//sQih2bbPV1K5HgHSh9xe8HeITnUDPogIpU/fXHIq20f1KMyrYqZhunosH6MfG4jaGSUUAvBhK3FENMoVb/Q/wocSXT1W2azxSRK1AcBOyCvTLDAJDo2hhImKWPMrwVWAMKdoDle2rkfqnt+Z4Z6jsAkVfb0ZQ7pg8c3TFNSp6Teg4yTq9mNj/LeenPd+jgk+UXQYh1SWnLsLVPvX/Pf3sL1z/ycSOitcTtvHKFbZqVN+r9cr8ULuZ16u7m0rhW4qOFQM/hXIAZyAvkEhExiK0/9hEMyiaAS+sinQz7l+u5WyyLv4pT7x0njJU5Se2F5/M2FhNY16nvcNfiqamjbsCFbmC2iF6eW0DK0FQ0qfnVMcaR4rRa4K8gX9ybRKDe3Gbh+NQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(23010399003)(7416014)(366016)(921020)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzdUZmNOWG9xZ0tKTXJyVks5UW10Rk1hVVVVUGpWdXpDRmpxdTlSUTNpdjdj?=
 =?utf-8?B?UGZKMHpnWCsvUE5TNHVPRkE4OEJvZE8zdHNBbzNJVk5uTXkzM1hxQ2xXKzdX?=
 =?utf-8?B?SmRVWjg0UCtFZzYzbW0xSUF1YVEwTHhLLzNrVytyLzNvQXVjSi9uNzBiMDBW?=
 =?utf-8?B?d2xISDZHam53R0ZQY1lxdnE4OTNCbEdVdzNaZlI2R1FkTUdvZUowRVJ5VlZ4?=
 =?utf-8?B?ZThFcjcvcnovdnEvSlRSOXorTEMxVm4wOE1rUUluVFc5RWlyc0J6VENVdWk0?=
 =?utf-8?B?czVIQm9wRFVFZ3doZ1Y5WWxuKzAwWVhheThxdXJPM3c1NndwK1k0cFV5RTFT?=
 =?utf-8?B?cnFTa3VQWDVVc045K25JcENrYUEyb2oyNHo2dyswT3ZOdDEvTk84OEhmWTFu?=
 =?utf-8?B?UmV0NlFMb2pLbWkzWm1mclZHWS9SV2hxRU9KUHBubUVyKzNlVlBFYjRObWJo?=
 =?utf-8?B?a1duKzV6N1UxK3dQZ1FYNitzYzhoczN6NG10Vm1rK0h5SFM1S3d5U01KQ1Nx?=
 =?utf-8?B?ajFKTEhTOEpha0hYNk0vVzk1MWFDc1RJc1VmemN5ZlNDWVdVRHhKWlNHSTFx?=
 =?utf-8?B?M1lMY0NRNS9YUEVUUWFEOE9pZ0pieXNFVXNUVnVORGdHM3ZMM2JGNm53dUlE?=
 =?utf-8?B?clFMdmczMUNnY0t6Y1EzL1JEMnFOTjNOWEs0c0hPWFVxcXpmR1gwcTRVaU5n?=
 =?utf-8?B?UUtFdUVvQmY4NW5LdzdBNkhrNGVoYTRSZjRQRjluWnd1RFVnaXdOMksrU3E2?=
 =?utf-8?B?ZmZNUXl2NW5IYXpWN2xiMERlbDFaZitCVW80R0RjbXRjSW9VV3B2K0hFcVB5?=
 =?utf-8?B?Q2U5bTFvQ2lqT3hCZmNBa1dzZ0pZMG83UjRmamJHbjduYkxSeFF1WnpVRTk5?=
 =?utf-8?B?ZVVDSEovUjB5RWtWeE16c3JmK2xOcHAvYXVPa1NmYWtkK1lySllXeG5rRVhG?=
 =?utf-8?B?VmlEWkFJWEhIVXlHN1kyMmgrQisrNnBRR0VOR25pNHRMWmx3cSt3Y1BYTU5s?=
 =?utf-8?B?dlBvOHZmZlFoWElQbXJlLzdBQXhPSzJjeVlmeXpGczhrN1UrYVdvOUF4Qkhp?=
 =?utf-8?B?VmxVWkg4cjBGMXQ1ZFBIc0R4Y0NxbjBnN3Zqb0dOdUI0bU1aWWwvNVJ1eWVW?=
 =?utf-8?B?eGU1UGF1OHozYUVFZGJzdHJpNXhhMnBJUDFQQlhRaHZrcVVHWlNoOTdJNVpY?=
 =?utf-8?B?Wm5jNFlINzVBWGFPNmJsWTA3VXpORG92TGM4c0tvZVYwWm1jc2JFT2xzaXdS?=
 =?utf-8?B?L2lqYjhUSU5PdnVQMU9UZjVXY0FVUUZIdU8vYjdnVzQwc3Z0MzgvWXNybEE5?=
 =?utf-8?B?dVJ2K0hsOWtRZnFzWlFEVXlHY0MwSTFkM1NyM0RiR3dNMGd1a3NpWnZkUHpC?=
 =?utf-8?B?T1VERmRZMkZPa2xFQTUvUWpvcDFlNU16bHpGaTRsMitTdnExRFZ5TGx1Y01l?=
 =?utf-8?B?a3EwZE9aU0JSYWE4b1Q2dlBIald2WWRnZEtRMXVOYmVQT1BWNjZ4QjJJYlRt?=
 =?utf-8?B?OWFiUnJlSitPaTJLbVVIUDFIOWU1UmE3RENWMFFvMCs3UGZPTmRjU0YyNHht?=
 =?utf-8?B?QnUzMFdxeHVLQTcrY0E4M1M4bTdneGNFWnNSYlB4ZjF3S2VXbXdBWmNUeFA3?=
 =?utf-8?B?d2Y2SlYwUUhRSnpQeGxsTHl6RnNXNU8yN3dIMVRsbnRSaklhcFZtQWdvV25N?=
 =?utf-8?B?TUk1Zzg2L1dwWUNkRHpXVFNSVnA3d1ZYakg5c01DVkorVkYwUFcwS3JmZ0ZJ?=
 =?utf-8?B?UVB3Y3FyLzNjR0s3dE0ySk8xTHNQbWZYVFJ0YnZIMUdsWTJPUHhpNEZzem5q?=
 =?utf-8?B?THlLT1pjQkRnODFxalpIRHVldkt1VW0xU0Y3TzF2aWhLTDdmdE1RVmFhb29U?=
 =?utf-8?B?bms3U0FUbEc1QXBDbU03SnZIZFFZUjgwRlE0Sk9QNUVCNE5saEpNYmZNMGFh?=
 =?utf-8?B?ZG84NFFHS1FjRHVjK0trTlVrWTg5WXI5K1dwcVJybG9ZTUVydDNaOUlNTDJj?=
 =?utf-8?B?N0pLSmt5VlFKYkJRSEhYZ0RyWjJhNVZiT09yV2xFWFREbTNHQnFXUm9iMzNB?=
 =?utf-8?B?cUQ0MVZHOVNqOC9iK29KR3Vjc2pMbmFkMkZrNHB3akk1WUlVYytqM2N0RE1Q?=
 =?utf-8?B?cGo5eHE3dmZmYnp6alNQWGp1TGdrc2MzNHg2Ykt1ekIxZzluK2FYdmF2Z0pt?=
 =?utf-8?B?dzRXQzdvYUlqUDIwSUdiUWdQaFRtNmFaY3B1MjZnNTUwWUtOWnR4YkhpK3Zv?=
 =?utf-8?B?YlMwMFJRRjFPYVBjMWtKNnRQZFFLMUJxZjF1dnRnTWpuUmdpcTVMR1o1Zmh3?=
 =?utf-8?B?WkFJSEw0cGovRm84b0JGVENzRGh0VVRWLyt4bmxmaWxReUJHSlBWN2dRNlJE?=
 =?utf-8?Q?yXyfAy1AgAuNwKWbC1scAYjgXyH4B8wzGbGEs?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 472c0f89-693a-415d-c646-08df0790c196
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 18:50:41.5853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FgAzGztAcLtEWBnA8dKRRGs83fBtf9ptSQ6lauqwZM1+ITZ2vTe2Vv0HTnoDxXfvZp3oljrlUFHMY3M9CPjkVuZBscCydroL3GCNiHuLbvncf8Jeg3pavTTJfcIKz+D7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11994

From: Frank Li <Frank.Li@nxp.com>

Remove undocument properties irq-trigger, id, blocks of st,stmp* to fix
below CHECK_DTBS warnings:
  arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtb: stmpe811@41 (st,stmpe811): 'blocks', 'id', 'irq-trigger' do not match any of the regexes: '^pinctrl-[0-9]+$'
        from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml

Known other user (uboot) doesn't support this touch screen device.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx53-m53.dtsi       | 3 ---
 arch/arm/boot/dts/nxp/imx/imx6q-novena.dts     | 3 ---
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi  | 3 ---
 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi | 3 ---
 4 files changed, 12 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx53-m53.dtsi b/arch/arm/boot/dts/nxp/imx/imx53-m53.dtsi
index 89b17509ad487..9f7548e87f6ca 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-m53.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx53-m53.dtsi
@@ -41,11 +41,8 @@ &i2c2 {
 	touchscreen@41 {
 		compatible = "st,stmpe610";
 		reg = <0x41>;
-		id = <0>;
-		blocks = <0x5>;
 		interrupts = <6 0x0>;
 		interrupt-parent = <&gpio7>;
-		irq-trigger = <0x1>;
 
 		touchscreen {
 			compatible = "st,stmpe-ts";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts b/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts
index cd9a050fa906e..9938a63b5110c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts
@@ -281,9 +281,6 @@ touch: stmpe811@44 {
 		compatible = "st,stmpe811";
 		reg = <0x44>;
 		irq-gpio = <&gpio5 13 GPIO_ACTIVE_HIGH>;
-		id = <0>;
-		blocks = <0x5>;
-		irq-trigger = <0x1>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_stmpe_novena>;
 		vio-supply = <&reg_3p3v>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
index 5fcd7cdb7001f..af038ac472261 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
@@ -631,11 +631,8 @@ codec: sgtl5000@a {
 	/* STMPE811 touch screen controller */
 	stmpe811@41 {
 		compatible = "st,stmpe811";
-		blocks = <0x5>;
-		id = <0>;
 		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-parent = <&gpio4>;
-		irq-trigger = <0x1>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_touch_int>;
 		reg = <0x41>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
index 8a0ce250e5760..c9e539f83f80f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
@@ -555,11 +555,8 @@ codec: sgtl5000@a {
 	/* STMPE811 touch screen controller */
 	stmpe811@41 {
 		compatible = "st,stmpe811";
-		blocks = <0x5>;
 		interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-parent = <&gpio6>;
-		id = <0>;
-		irq-trigger = <0x1>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_touch_int>;
 		reg = <0x41>;

-- 
2.43.0

