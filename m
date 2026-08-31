Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011036.outbound.protection.outlook.com [52.101.65.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415263B14B7;
	Mon, 31 Aug 2026 03:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788147202; cv=fail; b=mw6OEpLb/ymfDDljg40kl3PXJSWQvlSmGxVe242shp4uFaLr1TdQffX41OBRDQIe7BXsryQhYc4xKSYL5yA6VsPh0mcCFESQstvBCGU+hbbcA43AMWoBsyweZC/VkpNpW7K1xJYefinxNaWxx4kctwoBZHcFW59LXB8TKxlQqTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788147202; c=relaxed/simple;
	bh=UHWeKUc1ebS3XaJwsLh3Svxgz08aX5ts6yE0mzyLR84=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=dRr8qZmqmuZUGsBoejfsR3apxBuIG/2fcD4TD2Bkjwn11a6Ld8QMxN9P2z2koypo+rHkEiYhnF3esUfLTepYeI74YJr00UBr7Za5OWGz7d9UWUkcNtdWtJj7ZVYav7GNevYC70xo8pjvhu4fSAwnaMI4N4p+nmhvWpmY28X8ptA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=H1e3ID8j; arc=fail smtp.client-ip=52.101.65.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="H1e3ID8j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eWhFD4NesHdcukBIOgzx03JLO/Pbe8SeqQ3QWjPaLTa5B5CAKJPmBHBf26GynG5u8BVJVBRSDTXYhEOIplg7OFiCMHZLAAFArkikQwuM6xPeZoY6M5JDDKx2tL8VIEb2agmpFVypbfomCmXt/nEM/xOLoyefPtFHA4D0QddbbTPpHmn+AhLobyXtCOE2OT87jqm8lxOLuAHr8ftrRr1Nw+rAfjezqeibUjei+gOPrY6H3jz85buoc9mdexBTomdqRdXKnZkK4aWpIhxIEQO8PxX3R10rkZCyCgRIN6VZaZ5sQWIYPFAyYGrTA9MXfmeCgSzqOKd0jmegB5gBZc2LNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VRt2et0mtUSluEneDeBbpZ6+G7nJgKvh4j69NOEabJk=;
 b=hrIN+OL9h5Qoan6cPCF8M3e+X8Dq69kCSOtl+ext/DSFFX1iNIIK00sSNuxb11xF9koRm2LcG0DmIeibZmuhk1OFJ3dfKhY6WfGlt4a6maK86fFI56I/lAj7YWBzU6303iM/7vbvoJem+bWBee2YuqRuC/vLDwsJNOIQE2LETHPTWh0WAqNUEVGJoPjXjHqAKakUV/Uwprz76nx/iqQ5dkXuhbbPFwTSPs404KXmJt9C8paB6bLs6HT6e2c1kbAuENY9z2D+jSmPFeGP339iZwRK8SkS3Ag7MT3y++ckvu0LTuYa/mLweQM9LuWAK5NQlRJMA47yMv9snYweVqOhgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VRt2et0mtUSluEneDeBbpZ6+G7nJgKvh4j69NOEabJk=;
 b=H1e3ID8jtc6n2ok1EvH2QBjw1/QR83J+jiAX5/+U5kHQtGfBTGxevk+u8t/GQqKhIClzO5W2XhWodZHWmQhIjW97AwDxLgf1ld5qXwnIw9/c6WWjvHVkFAiv1/NSW+xJo8J+6xSRhr75HxU9piF870mxEu6v/QqHAGjFSUG2tnzUz4MVR9Caha2SLZwTnFV2OQ/FTGuqUX1hEFcrFmlWs+1rSDjKb2nCNfYU4s9QgwK6mVtVufXjfHQbt5bjsUGC1e64ScmuiCUOD1CyxKr+Pu00I9YVcSCA5JGOos+ru6cP8SQLdG67F2gAlYMxDcYJHe9awY4weyxfNxWItFn/Uw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by AS8PR04MB8772.eurprd04.prod.outlook.com (2603:10a6:20b:42f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 03:33:03 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 03:33:03 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Mon, 31 Aug 2026 11:36:56 +0800
Subject: [PATCH v2 1/6] media: imx8-isi: Reorder mxc_imx95_data to follow
 mxc_imx93_data
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-isi_imx952-v2-1-fafdb4b446d4@oss.nxp.com>
References: <20260831-isi_imx952-v2-0-fafdb4b446d4@oss.nxp.com>
In-Reply-To: <20260831-isi_imx952-v2-0-fafdb4b446d4@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788147422; l=1777;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=UHWeKUc1ebS3XaJwsLh3Svxgz08aX5ts6yE0mzyLR84=;
 b=frJuTCI47OzF2z1FLnfpuUK2D/sQMXpUfER5hD4Xofk5e/qGqbUfpaBxGcENm0FBzJvPYmRKe
 IIvJnyR8hOrCbKNWPNzujNmtfGbZXTsCbMT7QKoKOh+SpauKrx5tZs2
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5PR01CA0191.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::14) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|AS8PR04MB8772:EE_
X-MS-Office365-Filtering-Correlation-Id: 11bdd2f4-4b19-46bc-93e3-08df0710906b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|376014|7416014|18002099003|22082099003|56012099006|11063799006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	Z6TT0zygwc3lOiDVZ91kHNhEDdQNnYtLD9828nReGFINMtVYsQ/0WTmBZMUsN6JrcNgafMW4ngoPaizqQztw82Evh0zWAvX5BmfI/qjN3YC87qefRf9D0kJGKbz/2HF8TPkEKZzSb+c6+5Bye1OjgACpSdomRglyQfj7fOuMEz1uHDCIcV3QOuaqNguj1hPkTmq3vj45Dm0lwwAF4m5SXRBheFmhRbSqRCjq9r2/7d9iCpPUdlh6JrosK/i9xRYKbJsdsjMPR0QVvsJUf48Qzfu5XKx6KjUAWbmj4X51zfhDmi/XXwNrQKQuJV0VEkMIU4HgRaMW0c6P6OuyAmu3yXrLg2Q3QuiJ8iZbbzq25uyEotGjmN5N/3eVsbLudvY+15qpm2Osjrw+m7RQZNesLyUpsm9u+TxAqR3/az9FbnYCdrXNJNBlxhhNzmAFTm0A0fLoaqiEWTkvWRtQK+BMrDRfZTAiZn8qqJ8635IgyULvLIwZaeduH69/NXkKXnblTQyk6xwt+JUb3QOl7RcBm5lZMGM45e6U0W7yPfjXqHdD5JA1H854uapYXdR/l8/SL64G4DKBw2OEQf3Zow6mmXLD1IZCN45n7RBABbNkdyMhkgoDw0Zj9C6U+178SMfTPKlQhoMO77r8odpvLvWvUHnUCsebntPD8Qf05Ap8kwvZbdUAkTNIfqBiPnh052vEudvJ1BzJf4U4tWm6HQbg0A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(376014)(7416014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QSs1VEpkamYxeFhTaGtnR045ZjQ1M3crVkU3cy9yV0VGS2VsUDF4cXZGeTlm?=
 =?utf-8?B?ekROZ2gxMjgxS0RDemExZW5DdnlLN3BZRWFkWTY0RXVkd0piZHlHaS83THRp?=
 =?utf-8?B?V3VxMm42eEdDaGxqZkNwdUoyeTNOemdtcmJERVFGYkludGdiQU4xUWtFVVJ2?=
 =?utf-8?B?eHBYOHhqREpzeFlZVER5aXg1aUxFUXd2WE1ZNVVVSDRzd3Y5cENEL3F5bndo?=
 =?utf-8?B?VTRTaGpwVG92ZnpCREU0elBadUNLdldaUTgzQ2FpTlJMWHBqeG9LS3FOQWxM?=
 =?utf-8?B?RThqcnV5Wk1VdFNlb0VTTy9yMjVyN09BakVtQkIvSE1uemFONkk0d2pIUm9q?=
 =?utf-8?B?MkY5V1dqRXhxM2RQMDFmYTZScFlhVmE3Wk13L1lGNERWcXRoeG1JZEpoSHBp?=
 =?utf-8?B?dkFhQUdic2FyeFZnK3BhZjBYZ0lkemhpbTlkV0wwNkRaOGVXa0F4MnM1akRl?=
 =?utf-8?B?UUJVMXRkMGpSUmx6d29sb1VrdkdoRGFqck5jQVlPV2J1TEg2QmVoQ2N4cUJO?=
 =?utf-8?B?QWM1NmJhMkpWeURtMDRtUER1U21pay9sdnIvNEhCWCtTRURCanFRRXppTmNi?=
 =?utf-8?B?anJXbHo4MjNqeEtnc0RlYTc1dUtLU21ST08wLzNkSzl2YkZ0ekdDckF6ano5?=
 =?utf-8?B?TmMydEhOUW1saThGd2tONTJMS2hHcHpaWGdhSmRyUEZiSk9mY1hLTzdIYlB4?=
 =?utf-8?B?Q0J2K3IwWEdkWnB6RGJhbkwycXYxSXp3R2dUamVXUXRFUFhVV2NBYitIbjRZ?=
 =?utf-8?B?RHZJbkhXazBRSEk2dHhicG1mOWUzZHUwbm5LWTRBVkI1Y1ZGVW9lRVpkeC9Z?=
 =?utf-8?B?ekJQYTNIbzAzZE8rRktoQ3RRRHcwSmpWdHhaTGRvemRIUTQwZ0VXdjVYRzlN?=
 =?utf-8?B?T25aeWNhcVMwLzhqS2tnaXR1WDBLN3BWOXVOYVVmNkV6Y3JnOUovaVMvNUVY?=
 =?utf-8?B?TTR0N0RGMk51WFVhVGFnWVFJRndPN29Gd3pOT3NqUFVNMGYrNk9tblJFWnIx?=
 =?utf-8?B?eDRKM0RNL2U1NytoZ1Z1RG1yT2t1U2N4a3czYUxTcDAyM0FGckF0WVV6Mk0r?=
 =?utf-8?B?eUwxRGlVeDlxbXBxSUhKMFdCdmthSHVYdCtCZ1lKd0JJNHo4RjZXcUZXaEtx?=
 =?utf-8?B?dWdiUnFjM2hFMGVRamNUUDZMV0Fad1FxbGFWTWx0aE4wc3lMUnFBeUJUMjU3?=
 =?utf-8?B?REtDMVVCWVZLMU1rZE1Td2pnbjdDckxBOFFKQ054cVRmZGZCQ20xWG9aSm85?=
 =?utf-8?B?OW5uUWpBdGhlQUlxZkgrZGlMeDVReVZHMml6K0g2dzBoV0M2a3Z0cDNvcVBm?=
 =?utf-8?B?YWRpZk8zYnl4MkxKVUlMaWNCSDJZT3NRTDhVTHhES1BwalY3Z1lWdW83Z0Iy?=
 =?utf-8?B?cHlUc0owNTBqT0VqNWhFOVBEV2NEbjF6aFhyYVZWYm5TMVkydDV0a0VUUm9D?=
 =?utf-8?B?ejF4ZmZsVXRQcGFxNzBGSEwwazVtVGVsbllmU3liVnR1ZVpPRUtiZUhxSUo4?=
 =?utf-8?B?UUZYTGNnQkV2OW45RlBXTHI3RDZ3WGZzOTRkOHBVTnd4bHlBeGVrQ3Y0VWlM?=
 =?utf-8?B?ampDY3M1UWx3cS92d0IyWlVRUHlqVDNFRWVDNnhCVFV6ZDBvTEdnSEJhSjVI?=
 =?utf-8?B?WjVVRGFXZzJKTVZVTkJoNWVqMFoxbkFzalZERTRwMFlDNmFvM2hIWW80WkNW?=
 =?utf-8?B?alo1SThQTE5lUzg1Nllqa0s1a2UvYm95TXdYVkxDZ2toTGgzOVAyYTAvNVRZ?=
 =?utf-8?B?Q2Z0VW5lM3RrOTVwQWVabGFJV0ppeFdPcGl6bm5MS2plL29vWUFjRVFKWEt5?=
 =?utf-8?B?M0swNm51bDlETElKT0FocHhTYnZDdG52M3QyNm41ekpXNlROdk5rMXN1Q2N6?=
 =?utf-8?B?emRkK1ZLWWZhYmVwcDFZeXMxRnJGb29pbTdMeXh1eTVFYlNwZEJlSWhDRHkv?=
 =?utf-8?B?V3BUOWZ4MWNDUEx6WEdTdmQ5R2JwbEpYVDJCbEtSbmZWbUx0dFhWcTlEMXRq?=
 =?utf-8?B?OFZWQzBxcTYrL05kNDdqMXBQWUNlWlFyWEkyT0NjSDEycWVnVndIWm4xVERI?=
 =?utf-8?B?V0s5MzJmd3dEbm53T0l5Q2dXVTBDOGsvVHVQYU42YVdNbWFGbXcxWEUxTFg0?=
 =?utf-8?B?TmZYMDhHd1FsWUE4U20vWFc2bXhoMWczTlBsMEpGS3NSbjFaWHhiNXVSZ1R2?=
 =?utf-8?B?M2lqcTlrY2diVTFtS1djWXR4V0JLZUZXTXpNS2pTTHJjUDdNVnNSaE9VOVFj?=
 =?utf-8?B?V1RZUWg1dndMcGgweHI1VlIza093dEZVTGVnRTZHRkdxYjh0T2M3SWdWRHVV?=
 =?utf-8?B?RHVWZEZUSTF5allxdlMraVA2WkFWb3k1YlJLemowYjdnR0VlTjY2SER2TFRz?=
 =?utf-8?Q?93AEOsy0+amJuIAVGeuRREu/Gte3btSIMP0nz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11bdd2f4-4b19-46bc-93e3-08df0710906b
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 03:33:03.5291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dli699YpdNcVKVCl1oENwDxAqyt+uRKVn2pCbxyM1TA9SJfFlNr/LD8Ew+UzYLNi7tY624HFCAK89nimt/64MIxH8MINHtA3uLxZdD+Hn1s0cJa57mobDBy6hnI5XvGf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8772

Move mxc_imx95_data definition after mxc_imx93_data to match the
order defined in the of_match array.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v2:
- Add Reviewed-by tag from Frank Li
---
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 0ae5f35e017c..f2a8eb82fbfd 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -314,18 +314,6 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
 	.has_36bit_dma		= true,
 };
 
-static const struct mxc_isi_plat_data mxc_imx95_data = {
-	.model			= MXC_ISI_IMX95,
-	.num_ports		= 4,
-	.num_channels		= 8,
-	.num_vc			= 8,
-	.reg_offset		= 0x10000,
-	.ier_reg		= &mxc_imx8_isi_ier_v2,
-	.set_thd		= &mxc_imx8_isi_thd_v1,
-	.buf_active_reverse	= true,
-	.has_36bit_dma		= true,
-};
-
 static const struct mxc_isi_plat_data mxc_imx8qm_data = {
 	.model			= MXC_ISI_IMX8QM,
 	.num_ports		= 5,
@@ -384,6 +372,18 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
 	.has_36bit_dma		= false,
 };
 
+static const struct mxc_isi_plat_data mxc_imx95_data = {
+	.model			= MXC_ISI_IMX95,
+	.num_ports		= 4,
+	.num_channels		= 8,
+	.num_vc			= 8,
+	.reg_offset		= 0x10000,
+	.ier_reg		= &mxc_imx8_isi_ier_v2,
+	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.buf_active_reverse	= true,
+	.has_36bit_dma		= true,
+};
+
 /* -----------------------------------------------------------------------------
  * Power management
  */

-- 
2.34.1

