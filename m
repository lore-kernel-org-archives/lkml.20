Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793860922;
	b=rUrBaSzTyDmQhKyNJztHnXJbUGSbqUHQPpIVfFmaQyalz8gP7l5l7baeN0oeDOsQ2NbX
	 XTJTCTKnobGSdLu1GzwrM8JoNFlWYPWyHEtw74CVigbhz2YNYwmMxJttQKbLfk6YxXrAD
	 q0vAHaBfCiD0nl0TxaTljCkl1F4+ud14eihAEuyAusuHKEYReOOFzMjk6zVV82jSVpjWO
	 5531LSbVr/kd8pdtCDrK7utb/KLhzwOTP7AfP7cYlTdEkIgLrvndnGoIUYDTOSX9fGImM
	 tkB6px5EB6wWSSfYrJ23g7C+nFmSHloYzG5HM9o/WXcBgYzD7OSR6/j+pZ14k6MUw0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793860922;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=bYhCgpMj5R0+ZXu9d6uc+NzpcXPNcCCGom3lvzuvjyc=;
	b=b0BdJfrq6SVqTSZ/WrRzDcAxtD9/MVmCPZhuJijyRL1/ALCrkVWbdJaH+F1GPZJc2u8m
	 G9TEY4kGbnVpN3UxjqActqojb1Of33SOAczrf6obksReiEd8eZ0fnrWQe1OoAVhzHV88V
	 WQpJg62zU8qE2KmLP/BF9sSdR3GO+bVYCT4X08yWFtV7iyxtEHFn5IC1Iiyco8SzNSheU
	 NHr3tgtcPBrfXHWRn5SC5QTirY/4VrNLydTn5B2T7J5DSgNCfpC8VPOFIsayWk3ZtZoTA
	 CQeHqEhBGgdrGcCXXCOlbCq/WdcABS2wzQvtiQpBJq3j5jB6w1xRE2o3yKEsmdja12g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ROMKwe3W;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.19
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010019.outbound.protection.outlook.com [52.101.69.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A4B606A32F;
	Thu,  5 Nov 2026 06:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23A4B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ROMKwe3W
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fnah7lak29lfvWeOaJ289EZWG96392LnIs2eo3WaOSApiroN31BR33/aTbDgOrWXb7TV6MlhAcJVWjdjd09NdLr/RlMMrApvUK5R4LRtWKeWatcjuEwSDCef2uVhc+fjoXgnEHFvgwd2tLUGsnW+YkO2sQj7ZhvD/+fFY1ANhdYLkzJH/MgLnOxUX+5FxDybKfzVw6bN9OXypV40KAwJaiELk647GUfpDEM0HII+0MZljo3ekYZ4HpzHLvEmK7H0WcJ8/ZdfteRrHobqg9Uw8Myu6ub0R3dmx8JTAHvm/1NjgLc9eoEckihK0zhkMs726EP5H0wWeiAoiV/YVTlVqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYhCgpMj5R0+ZXu9d6uc+NzpcXPNcCCGom3lvzuvjyc=;
 b=A/XtnmyFE2I4uhTu5GRftow9G9sh3mAcygJ6NguqLcmYLlt/OII4315zN59Frny1BF5xfiV952StxwpGIlXkGsJTVdWYm0o8/cU989/REdmoRo/JY3WBfevxX6hLY9OCdM+d2xuwVAVPXh2LWX3ix+Az0LGjecMWkWtOSL64A8cMLwDs+Tlh4RZBgiu8Z9k6ilfIhUdAPkDDoU+A6SjbLeBkPiw5OrBV1yFq47lqpXdlP23I1pLK3DPHI8eO9SkYbyupAooGx2aChftCdXJZJm4qwgTZowex/6hrntkdRQ26vtyEjT3CEGgAwe+Zw+yzWCqmKCIA04u1Nf7G3eqhIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYhCgpMj5R0+ZXu9d6uc+NzpcXPNcCCGom3lvzuvjyc=;
 b=ROMKwe3WkzqU4/ymktodsDulkt00TL/X4kDr0rYLp+/BCH1Td3lPB6YDCJtekV8i522ZI6BptDpIKQXu7/HO6KYRZWleRTssC8gDupwIzO3W5H+XIc8h2Rw4SpwcyKLEqqJdeGrkDzBdFCI6v5Gd/qURfZ86CX5S8/aglK87Ff1eObIRrNh9Rokxou/9FZPnELbnz94D9GWAzRfFvyTjhDBvwwzjfcZOY5MLgbEOw9lxgAfyrA8pChB7+ppy4wHxILzLgs8x2fI7PRNL/3KTtPhxaWCxBE15PX7LlT6PEzrPSKZbxi1uDrW4bHZUSC4LmvPZtB/jXz1twdN6LE+CKA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by PA4PR04MB7710.eurprd04.prod.outlook.com
 (2603:10a6:102:e6::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 06:41:59 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 06:41:58 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 4/4] arm64: dts: freescale: Add common DTS overlay for IMX-AUD-IO add-on board
Date: Thu,  5 Nov 2026 15:41:17 +0900
Message-ID: <20261105064117.277495-5-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261105064117.277495-1-chancel.liu@oss.nxp.com>
References: <20261105064117.277495-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0142.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2be::10) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|PA4PR04MB7710:EE_
X-MS-Office365-Filtering-Correlation-Id: b80ddfcd-77f8-4c22-8439-08df3b07e411
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|23010399003|366016|1800799024|22082099003|18002099003|3023799007|10067099003|13003099007|56012099006|11063799006|261028144727099003|261021121427099003|261021123027099003|261022105027099003|261102123227099003|261009223027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	2ixvNeqH6ilp3hFbavwlS7qFJdRM4ztB3rVb3BXKCN7ZunsfWqHUnv5Gw/BfhRLg4F5GQMA0NLuBMR8do9p0zCghHZC5sWtQs8cglk8qKFc2NRkJOuMDnmFwacopQHpBSLiF6VOtruIUPR5L/AfF1K8pakFBly3r4uhvlDH4p4qsG922P5Aqo9G5t+b4Kb+J3eBH8pgEt8ZV47pyzAF5ewTuN2erW1GAxKOhD6nmsWGtauP2bxaRw74KSHfkgf1hmG256FiakiS53xSAn+i3Vgmytpd4wnabmLsPDdNLOfYeKsitJy9IR8D/NIm3i8aROL6ObsSpm9S9sfVcXCkPo1f+dZaIJ9eiR8Z2YB2yXrT5mdvT/t9PqnlpTuwRRcj2NdwYk8CC9Stw3/lj9Hjq56QConbuw6uAfbslsehbc4miBoPmqnlm5hpG6l7Edgo3I+oIuNaZB81efpwZmJ3j5E4A/9y6d46VKOs1X2dvXNn9kfypf6lqVuj5Zciap8VLjNmHhiqpUEj+EDgjq+1tvETC9OsJa3cKm4wnzXH39WmZhSdV+WEHbVycLaUz88aRen7+clkHunxKLVdrxPb8CcrkeTIxJ1rt8+20jrRkDk+O1oiVWG+7QpH9quOS8BUIa9SYtFG2ru0GpY0gUjzGU9jgMUEw/2cBZeJDktSIIHE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(3023799007)(10067099003)(13003099007)(56012099006)(11063799006)(261028144727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261102123227099003)(261009223027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wJG82Rl53kdRWs/JnK+HNCs0ePDA+JM6awa8ghHkxfLgRwYCJZghLTi3aEIM?=
 =?us-ascii?Q?R2tUOOSLmar4M1+ALzncd1ifzGZE7hfvwbI155bAHGpI2jiM1xWkhTPqlU5V?=
 =?us-ascii?Q?hl8cAPwqMlhIuXf0gxOXq7gYQJOwXRWzcV1WCCSJgHOMXY1W/U6Sl759RtEN?=
 =?us-ascii?Q?RmBEo7Hqu0l3ChJlyw5pbOwuVx8Jor1P4kq9jcJyR560UvDLJqS01kd2RzbO?=
 =?us-ascii?Q?8nWgfEpAOXOVkd0zYDZjxtp1pDoXl1jMq4v32boKO9XKLXtwo/tPbd7dv0wR?=
 =?us-ascii?Q?rm/ISmezywIo98zstqqVJlWEQrilZ7CMWyC3xJ9LRCg1Zz3IbgSh6cF7Sqn0?=
 =?us-ascii?Q?hMD3jxCFXdu6xP98uDUY9XQc7x5B3UfBL4WoEFFJaBW0FjMlEsbdkjcPY+Li?=
 =?us-ascii?Q?rkKkxQBowrHMC+0916xDfycniCz5kTS78HLLz4bQ8m7C9/JKQEN1+rC5qrFT?=
 =?us-ascii?Q?C/m4JL5Nt7kl3HBe7a9As1EomJVgAcs07Sez32mabMpc914S0Sl/BDoA+6aU?=
 =?us-ascii?Q?DJBnoyNr0TBVdBbrJGa2ri4cPlww+ZGLdrMvXcsi5qQqSu6sJBVkSddaSbLS?=
 =?us-ascii?Q?lxlA8wQ1oFXYDsC6mIgRf3y3aFh26v41m3THVNbKVYkPB1xjPh0rPW6hkNWS?=
 =?us-ascii?Q?NXlI4x71rGaeMLBnFXqwc7hURr4IwOCFpFzvZiEC37pSZ8RR8/+ds2Wz7CFL?=
 =?us-ascii?Q?AAeHBl3xhuK/4+oNxh/4vjbc7rZdRFdzloTVfx7pQutx/Neu5hfopGFKldnN?=
 =?us-ascii?Q?mjIUdLqqC1fDhGC4w9qhZAcMlAC6gnTg90WicVsNQj+H94gQdu1G7ek4qOwB?=
 =?us-ascii?Q?LV9unGo/+8E/8WElMZAROOZKWByHyp6XTvRvNiH/+U84Xp9tbe/Wb/sRJbvr?=
 =?us-ascii?Q?GUZegYGRgX4/8X8SeUYJPuXiTwUnAhBFDjgHi5KJvCjT/fFBLbJR+EG7eMMX?=
 =?us-ascii?Q?ZVcFflxjJAHEmiEO8rCTTwRE70X6WcuOGzi2+BOOnn9e0EdnvTiKE3A85oiv?=
 =?us-ascii?Q?pBGopmPmIRFwMQdYV/9TOpzNSzf0MDU+z+bB3P8+OKI8e+Dju70yv7PpXQ2I?=
 =?us-ascii?Q?liG2YZZDf5BpnuCmXrJWuRR+yPp7q5xfwdfQHoBK8I9oEiM4ro+xRPSOVLrR?=
 =?us-ascii?Q?KhJNO2aoSI3gHvLshTGJT3I7P7N6GtMz9vg8jnT08VsA9+zcqGfuqS/o1wRs?=
 =?us-ascii?Q?+6t5Ogo9lYUNmBMTCLrZjZIwIky1EjEsw5Bpi9FrxztkBqJ54gStFm0pOrbY?=
 =?us-ascii?Q?fl/8ujXTXrYVLRc43J8baTlcGFxWEoSOqWvTyts+yQhfbL9nlHpZ4usH/GYK?=
 =?us-ascii?Q?wCizD1plCWBtNN/X1BLwa5xHHefvgfnX99txzvwawOwCLNJyXnB79TAL6fes?=
 =?us-ascii?Q?rlBnr/wS48zd1uffepdojqa1A5JX1a+aRzSz0TqFUMsSe2fxF7wJR26DzOgN?=
 =?us-ascii?Q?4HPlaznLbhR8yI70VQ0DdoC5mD9DxoOYRP5LPhoCMD2r2SREWFgDe+53DmL8?=
 =?us-ascii?Q?begQ/2MG4/Z/50r6y9iZUxpvn0zNCGsAXpZeKM+ZPrvRVDynRnVJEoNqhcod?=
 =?us-ascii?Q?X/xNO//8RdPBuNR82hO5JMlWpWIGfOOeELL+WsBGopqXirJv/D7F0yIc+bZU?=
 =?us-ascii?Q?vfgsYmRUHm2FzSpKpRBD7LnGFZBz8dOOjsp1qAbz1Y+5HF46bpn5/Ls5G1DG?=
 =?us-ascii?Q?/xn8w6QYNdZ5FhLIujI31XFev9JHdg4wpPJaKo8FtQFhPLHYrplwNPQjeREs?=
 =?us-ascii?Q?sGZVDpuN8ZeyAIuwWVITCWufuyEmCz2KvGC+63XU/C8sTnFHfeiY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b80ddfcd-77f8-4c22-8439-08df3b07e411
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 06:41:58.8661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KuLPEs80M83lA212fWw9lEHUP7VYCGEuFjyWvO4pEF2mG+jYwjGRPCGrOku90wQT6uS9/F47Oly+K4NkHGLg0e8QpYnNhymR6SvwFMUx+oc9AuElUYWO19ozbVvAtiMz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7710

From: Chancel Liu <chancel.liu@nxp.com>

Add common DTS overlay for the IMX-AUD-IO add-on board[1] which
connects to the base board through a fsl,aud-io-slot connector.

This board features a CS42888 codec providing 2 microphone inputs, 2
line inputs and 6 channels audio output capability.

[1]https://www.nxp.com/part/IMX-AUD-IO

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  4 ++
 arch/arm64/boot/dts/freescale/imx-aud-io.dtso | 57 +++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx-aud-io.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a80cccf34eb5..aaf546cec0c8 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -994,6 +994,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-mqs.dtb
 imx95-19x19-evk-pcie0-ep-dtbs += imx95-19x19-evk.dtb imx-pcie0-ep.dtbo
 imx95-19x19-evk-pcie1-ep-dtbs += imx95-19x19-evk.dtb imx-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-pcie0-ep.dtb imx95-19x19-evk-pcie1-ep.dtb
+imx95-19x19-evk-aud-io-dtbs += imx95-19x19-evk.dtb imx-aud-io.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-aud-io.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-libra-rdk-fpsc.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-verdin-evk.dtb
@@ -1001,6 +1003,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-verdin-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx952-evk.dtb
 imx952-evk-mqs-dtbs += imx952-evk.dtb imx9-mqs.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx952-evk-mqs.dtb
+imx952-evk-aud-io-dtbs += imx952-evk.dtb imx-aud-io.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx952-evk-aud-io.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx952-frdm.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx-aud-io.dtso b/arch/arm64/boot/dts/freescale/imx-aud-io.dtso
new file mode 100644
index 000000000000..311b7f984576
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx-aud-io.dtso
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common Device Tree for the IMX-AUD-IO add-on board[1].
+ * It connects to the base board through an AUD-IO slot.
+ *
+ * [1]https://www.nxp.com/part/IMX-AUD-IO
+ *
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	aud-io-sound-cs42888 {
+		compatible = "fsl,imx-audio-card";
+		model = "imx-cs42888";
+
+		pri-dai-link {
+			link-name = "cs42888";
+			format = "i2s";
+			fsl,mclk-equal-bclk;
+
+			codec {
+				sound-dai = <&audio_io_codec>;
+			};
+
+			cpu {
+				sound-dai = <&aud_io_cpu>;
+			};
+		};
+	};
+};
+
+&aud_io_i2c {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	audio_io_codec: codec@48 {
+		compatible = "cirrus,cs42888";
+		reg = <0x48>;
+		clocks = <&aud_io_slot 0>;
+		clock-names = "mclk";
+		VA-supply = <&aud_io_reg_5v>;
+		VD-supply = <&aud_io_reg_3v3>;
+		VLS-supply = <&aud_io_reg_1v8>;
+		VLC-supply = <&aud_io_reg_1v8>;
+		#sound-dai-cells = <0>;
+		reset-gpios = <&aud_io_slot 0 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&aud_io_cpu {
+	status = "okay";
+};
-- 
2.50.1

