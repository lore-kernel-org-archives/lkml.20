Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013064.outbound.protection.outlook.com [52.101.72.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916A63385B9;
	Mon, 14 Sep 2026 03:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789355873; cv=fail; b=SFrd3j0Yh5nNzcnKC47xKspGCbOdD8Q03hOobH3ChextKhmo9I5tzSlkUIgwIKjyVVdI7D3g2oRsA8nlFIjTOHu7phbXBcF7v+G38PnlWhvTBFwJFTzpEa55q0xTam6Rfr1ivarl/Y/LP/OVLdqMho6lAOj/SpW0sxufc3pbLqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789355873; c=relaxed/simple;
	bh=L975l3JvugCfPjX0x09HfdFo6WovLlWyJRwoLSFhDQQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=G8fRHq1LDMEh3QOVsIg8FwWFZTJPCDWbVCG6b6ncl3eKjNX2lLKB1NDPZwhTvPnJWHjB7THSz5KaPEVy7tazCthGyzIvG0PBKebG9HAaqpTD+tJ29JBMdqulhFRoL3KnyRHlOt0fJPogohSHrkvXp/3Y4lx1SHtomF/3hVVgVFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BahTkJNm; arc=fail smtp.client-ip=52.101.72.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BahTkJNm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iJ4w1FbZWYwRmh5aCoa88Wv5go0ms+BtrsBHVstJ2swqNV4odpRLkUFt1pdOPOYgTN45Tt+Ht+bZeexGBaj876c5AAMgYa9Vg77btLEE1SOTvPDUM+OI8zo6l5lZVFvaQPsLVGcA0hO46CAL0D6Xj/gw/4Xfa+L039qvHanH9hblNMdAo1AtgrtuxQFwdk5CNTg0lRtogS/iZm4lJDf5BvbQMFMPF7uwr/aHWEJ3pzda17b/XFiiLnPsck5rK9aP4aq5W9zEzu6VDd0OJLRuGm42RePQMXTMgtVkPdxlC/YoQywxo9ba6hyzcnHJMLRziRxSz94HxSEEe7yqEV5etw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TM59AKeRbyLIzOF92xgZWi9+DfQB076XMGlYtZeXn5s=;
 b=mdxP93kDYdWMhtnZqrEFTeNYCxihFNXskY1HBNtp0me+BVRMSmDa7H3hdsr9hcdPqpS+jdjASSq9CaHiJ0ht0vo0LPI+vGWlknGgsf2hx9upFitsqJ7IvJIo7D6qOM+78EiMnSe2F3XmFSAb8vRKvyMLcUeFUpcMHLLbvAeOUGo13S3h2tLdsh4obZFvHUYmmpPh/nmh+seucYIAEn9I8VU4Z9yVWeIvnUOXumvGyDH1H9Ly5jPuMZKQnRPHEyRxbWthzkzJXNsh6oWNXNH/CEax1RFEkq7N+AcUb1tAoGoPLssr88xzZxmku2l+Xl/vEcxy+MPTTOBHEvibyE4+rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TM59AKeRbyLIzOF92xgZWi9+DfQB076XMGlYtZeXn5s=;
 b=BahTkJNmn3w3HIgufxL6+474wQwBjzbuzHt95y+r7D1KCaaQ17FZ3/bQ5WVY9NcIUB/hrO+C9rqDXqHu7nJ57/U9tL8eEChrtcPZsB60jCQrxXo7SNRlRIgXmORHfFam7vuuExzrHwp++jXveHyrVO671s2Flqh9ETwBq0P0+6foosQVI3kTqDvQxPuWFEF362cwT+n2GQvx0VgxllzvXiG3rAMdCvXsEk6p3fyJUO5dhVyDxt+EZ0FRMNcPPeccImbVnuAZW446KGKDFGvCiLfPOBEZ1PvQu3PA5VgDWzkrZHiMZxNp0PqLOvI3wrTEy8rNUAaVwEIVcjOzd/ha5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by PAWPR04MB9720.eurprd04.prod.outlook.com (2603:10a6:102:38d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 03:17:30 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 03:17:30 +0000
From: Joy Zou <joy.zou@oss.nxp.com>
Date: Mon, 14 Sep 2026 11:21:07 +0800
Subject: [PATCH 1/2] arm64: dts: imx91-evk/qsb: add rtc1 alias for external
 PCF2131 RTC
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4_imx91_93_rtc-v1-1-daed1cba0714@oss.nxp.com>
References: <20260914-b4_imx91_93_rtc-v1-0-daed1cba0714@oss.nxp.com>
In-Reply-To: <20260914-b4_imx91_93_rtc-v1-0-daed1cba0714@oss.nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Joy Zou <joy.zou@oss.nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5P287CA0111.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::6) To DB8PR04MB5803.eurprd04.prod.outlook.com
 (2603:10a6:10:a9::27)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5807:EE_|PAWPR04MB9720:EE_
X-MS-Office365-Filtering-Correlation-Id: 23eba2d6-8a78-441d-24d8-08df120eb574
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|19092799006|921020|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	O6PWQKWHYHlj5F10xaYnAgLMj3DZvt8F2k7Uo1fMeRLJyHDNTPgBO6iXLqjRa4fgxbJWnzHEaIHO6FVaYiIQod5WJrRBfYu7w+bbZyyJDcy7GZv1bAIXPoRv6QKT3Qjy8AOojVESYxMvrMtwLOdZuufcfOu7KeqVGxVooOqw5erUXKKED0/yLTSVAY1bbxE0LVojDf8CtSRY4U2kGCAEmsUte+IxIqFPfUOGLcbUsNxtdT9ifvPGJXdXGdK9CbPeJ+UCj/wpz9KY+bxA+8+B0e3P2dJLBshcgK7wdbGPV+K4yNZDYMkACztNW3Kyt7613MZmMmXNv0EVaXJFGQPODMaZWqFvJqhymPBXOsct2MSSnw22QxlrxN3JsJR/zmnriBBIzgnvdtcM12v4sLeGye9+8LMR+qQ2aXGj9eLsBzQhSTa+zYvEhIu6CHjoPfCsdeq/X9XNLd8xU/BpIBRQpNTD+PuF5YjfxvLcPdkfHp7zh1/dvhQBQbQhYnPy96KJatR3IMa+qKkhstuSHwwYUz8myMXjQAq941tJWO0rLcZAugmajV2wL0ar32AE52QefEDgZbgGTFlKsPJgnN62UPYb9abTKHlm3kUz/Spbii+UW4jM/BEocGqNDtDi5psrdN6CC/g64dBLCoVyXBebZblXPMUWidx4ZYtbzcSg+LBmtjWBRQzEykQ63t74Wn/ZccrPsJ5nSVX3ozU//maJbA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(19092799006)(921020)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUlDM1RSRkZxbkpmSTZmMk82Uk5aeTU4SlhJK1AvNW1NcTArYnEyRC9ENXFX?=
 =?utf-8?B?WWNaU1gyY0hBQVdwVVZiRk53K1hUUnhDaEJidFpyMmthbjUwaEgvQ0ZXOUth?=
 =?utf-8?B?ZzJaYlB1SElMajBERFp1RUtGTVNMWlV0Mi9LdU9weVp6eWlBM0JGREFER3Rv?=
 =?utf-8?B?d2NGSVY2d2FLaUZJbFRYdEUyOFZZVXJmaU1VNy9TTldBZHJKbHNUZjkyaHFF?=
 =?utf-8?B?ZDBxRFBjRlVUUnhkTFpROXVDL1dteEE2b2JNZEpPZ1RqdHZiRkpkSGxDUjdw?=
 =?utf-8?B?M2NqVUtYWXJvbVJNVFZBNEo3WHRKamtKd3k3RU15VzBRdDlmRGM2Rkp4aGV5?=
 =?utf-8?B?MnczbmZYbm0rY1dNbFg1a1MwUWdRaTJjQWV1Nm9mSTJ5MXhKOUpJMnAyN09p?=
 =?utf-8?B?QzBieHUzYWdZYlRiMDhTMEZGZ3NnMFdoNVliT1JjaUV1Zis2eTZURkM5cG9M?=
 =?utf-8?B?WEowQ05ZMWZzOVJmcVNDTGJWUktlckMwRzVoU2pxU3FSemR2WW1sejh0RUw5?=
 =?utf-8?B?YmR0cHZrdHV6N2t0My9vUUxnN1FjLzhRYkNqSVBBWmt5NXhCcDk5ZTQxY1dk?=
 =?utf-8?B?U09NV1BOdndGSXpTMGpTa0lRL001YStKaC92Rmltb251UkVTZklVTzVCWGsz?=
 =?utf-8?B?cDgyaExDUkRPMzM2NnJGUC9LVUkxSDNmUHFmaDR2L2MzYnplTk0rTVF6ZjFj?=
 =?utf-8?B?RHYyODJkTjBSdnRlNy9wZGpsdkZXbmhVYVVVdXJRYmpOc2RxT3g5R2pHTFhi?=
 =?utf-8?B?WTBMaWhTS3czRW9tbnJzUktJS3J5L3g1VEgrUFVpaVBJWkoxUmRSU0d3TmJN?=
 =?utf-8?B?VHdnZUlHd2IzaUR4ZE5kajY3QmtJNldFY0hiYkRBNUdzNnMwRUVnTVJRMUh1?=
 =?utf-8?B?bWhPVXV0Yi8vanRkL1dRdW9iWXhIQ1AzK1FEZThVQ2RnU3N3RGNINmR2TTN0?=
 =?utf-8?B?QkdpRHBXd1hxSHRuUnF2UE9YQkpPSHYwaVNWd0NLVmpMU013TVlIZGR4QmFs?=
 =?utf-8?B?VHg3NVlXcEpPa3VTcVBGL0hwcTYvSEdRVWpiaG9kSm9tOTZBLzdvNWMvVWs1?=
 =?utf-8?B?QlBYd3o5dVVEbittZFZIN3dBMWZ4MXRia1J4ZXN4eXkrWDNHUEZKSjQ3MjdD?=
 =?utf-8?B?ckZDYkJJYTNDbHlYdE00bC9pd2Jqa3RzUS8vWkRZK3BGNE9uaTJxblp6SnFk?=
 =?utf-8?B?Tzh2SXpYenFVOTExOWZla05DZ0x2ejF2WUNMVktETCthb0dWdFJJcDlwTGhO?=
 =?utf-8?B?QkpCSlE2d2pZbDBOVEZCdGFwNXNRYmpDWDNQTWdaYUlnb2FWS2dpVkFXRFJF?=
 =?utf-8?B?RVFOZlgzWUpxcm9xUi9YQjlhbklNZVBZWHRyQmFFZG9LL1YzR0p5SHNVd2VP?=
 =?utf-8?B?aC93VUZia3BsK3UzNTRJSXdRT2cyeEhoNXhuU1lhaTNXN3pkSVU0WUoyZmh4?=
 =?utf-8?B?bDRnTXFLUWh0b1lVYjYveko5b2M2SGZzOHZuSEVCZlhwYnhpNWNaMWNpd1Bq?=
 =?utf-8?B?S1hUNU1Vdy9BSzdONXZiWGRqQkVmN1F0YzlZeUx2MkJKa213aWh3UG1ESFkw?=
 =?utf-8?B?OThyNTgvMXhkNDRuTE0xUm1ZOXo0UmF1cWVPdHQzWjIxWUxWNzYxZVF4NDIv?=
 =?utf-8?B?UXpiRkFaQ2NNODMzdG9ESW1ndUFNVUU1L0Q2RmdUR3pCMmtqNW5yRGlDZFg2?=
 =?utf-8?B?L0t1NE84YmpmaE9maEdnU0I2U1dTemQvNStNYmQvQnhZYWgyeWpEUkZDc3Er?=
 =?utf-8?B?SG5OSTNBYnNTQmVtdzdrZXpLcVk1SWhGZ0VMU1FVc25mTUhIWXhmdGxuU1Vj?=
 =?utf-8?B?NnM1UFVtb2YydUlqczlubDEzY1I5bUlOWWVUblZkcWVuSS9UOWplUnFkd2ZX?=
 =?utf-8?B?QTBuczRNVUdDaFFXU0pCYVlvekw1RitOWGp5S2o5K3NoZ2ZCYi9Pd3BFRDVo?=
 =?utf-8?B?aGhRRlprZmJyaUZZaGRzZVFBMFp6MWJSS2w5UlBQbHBoNE9rWTVFUk9DdzNy?=
 =?utf-8?B?S1ltR2J2ejBCMEsxbjl2L0gySm1hNFVDc0lpTy9tTnNUdWp2N2IwZEE2QmJR?=
 =?utf-8?B?UzlvT09MM3BVb3VsRkR1VDVYTTI4eld0Tm1nbkV2RXNHUUNCTzdMQkNwd01j?=
 =?utf-8?B?VlhRRFUvSWh4K3I4cDBVbjhSQU9ka1NlZnpaTGgzLzZEOExNSGhoOFV2Zlg3?=
 =?utf-8?B?SlNqTGhVd2pnTGNXVzVQanRQcXBxSnlSdUJwcjlMNk12dGpxSTBvaDFOZXF0?=
 =?utf-8?B?aXF5cURFNEpZSlJZd25Sa01BN1czUmNYNTJIM2I0R0cxczl3SERrMytvZDJ1?=
 =?utf-8?B?aEV1YWpVNm03UnNqUU4wbGwvQlNIYWVnakxPaGoxVHV6MndVNjdyODI0QlJE?=
 =?utf-8?Q?J0oTwXgDoQgqDpkyK/7kEPl+GtXrTaUA+BtCf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23eba2d6-8a78-441d-24d8-08df120eb574
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB5803.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 03:17:30.5650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uF/qcyeBTKehxYZmPZYB1I52TUw1PIbicqMFIvHYBWw2kj6w4/kb92xiUgnEPOGgY7Odv7T06YJ7ivvhIRpVer1hdYlm9Hh7s29AKw1xi8+xzD2KSCKrL1mp89qJt6wq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9720

Only rtc0 was aliased to bbnsm_rtc, while the external pcf2131 had
no fixed index. When both drivers are modules, the pcf2131 may register
first and take rtc0, pushing bbnsm_rtc to rtc1. Since suspend/resume
wakeup relies on the internal bbnsm RTC at rtc0, this broke wakeup.

Add rtc1 alias for the pcf2131 on imx91-11x11-evk and imx91-9x9-qsb,
so it keeps a fixed index while bbnsm_rtc stays rtc0.

Signed-off-by: Joy Zou <joy.zou@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts | 1 +
 arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
index 5716febb5a50..ea7852da43b9 100644
--- a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
@@ -25,6 +25,7 @@ aliases {
 		mmc1 = &usdhc2;
 		mmc2 = &usdhc3;
 		rtc0 = &bbnsm_rtc;
+		rtc1 = &pcf2131;
 		serial0 = &lpuart1;
 		serial1 = &lpuart2;
 		serial2 = &lpuart3;
diff --git a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
index f1ed7983226b..b7f0e39b867a 100644
--- a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
@@ -23,6 +23,7 @@ aliases {
 		mmc0 = &usdhc1;
 		mmc1 = &usdhc2;
 		rtc0 = &bbnsm_rtc;
+		rtc1 = &pcf2131;
 		serial0 = &lpuart1;
 	};
 

-- 
2.34.1

