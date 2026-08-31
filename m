Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011036.outbound.protection.outlook.com [52.101.65.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9653ABDB3;
	Mon, 31 Aug 2026 03:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788147210; cv=fail; b=KFQuce+oM5ZMtUOWoc+v3zdPvuNJZfwZHLtNvWv2u3ETYHag9/schzx/g8NT9XP1nNj/UJZdYzGAJJauxLA+tDPnsViLfRRUHru75O4yjZmfpflwWD4HD7IceEUhumx61jmesiUYKd5n8LM62fWRLsosFKzNIgcDG7v35bxWVjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788147210; c=relaxed/simple;
	bh=GeZTZaOQbUbILfPgV/r09iumcpZs5WGBVnI52ri84CA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Mpm2M9ja5qEEmQ7/FY/3NdUPychfj3qrKq1/aNXRyneuIUYFes0/nTZkdBgLWrHPsFvIykThKJJxv2Ot1S58bjKxRmMHof+zd/ymMY3v1LI8qfUwAxErkfzCzqWu9DOM64y3mYVghXxy995xii660SnZqhn4T+P5zM5du5bJ89Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lX4GDnYX; arc=fail smtp.client-ip=52.101.65.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lX4GDnYX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m8/HuTfgFZfkogt78ftZDKvRyj7lHgbhCoFkpq7ueEc/BosWDNjUq8qGppEsci5zbr0M0H+rvfzmFDKeNdAflyja4tWw765h3dRPOUUFb7uW395vui/YcbiHFrOoEm+spM1HPzppTtyOU4zC7VvufJQl50dKHRPIdIFEuFpYi669arg9X+X5R3cLtEZDB+HGsR/UkbQMDjBW+oIAsXKTrlh6TVRBsjZYVEljkXVLtnbks2RrE9rgnONritYizDCaGFUVJ2vF1OliO51Yige7/EF8NsMzHxJ3Z25iCW4Mq2jxCy8HbPWbnIcQR5dlm1PQIx7pMkSu8dqSr0hgGs6LeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0lXP8rbHr3mgLPjblwCC7UmOKlNfrTlY5mRIDgBqK88=;
 b=HbRhdQsSQ1/ovpBXivXKaBXKYbeKZ3E1/O8FiWFiuoZ7veLgZEt3DSQD24lYTudQGJJtupLaZSlMsmShbUVwZeCIvSlaFbyywAPpnql3hGQfdUYep7dpYY27AEgNmIQF6tqW4jNfiS61GQO0irIPybvY8JFHZYveNJQ5wqN7A/ZWGvAfLgtV1EauoNlSeiAGrKP31j/WeqRGTdZco2zVa6iGQTSVJkrm3ALpIpwVUXuEP2/Ce9LScKP+Khn29YCAQbM6dYWh+cL2qk6aws64QOfO4NbWCFh7AyJugCdyaFX/mbWt9p2CfsMj7GxM7odLMVSUb79j0ZCFxdw+jdnuJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lXP8rbHr3mgLPjblwCC7UmOKlNfrTlY5mRIDgBqK88=;
 b=lX4GDnYXT3H1dpEJ4T5fHzYnONqLq9tCd9xqVeH366Fhm5Bjn1JO2U1kBWAVUCnhg2NmXGE/zbhvNcNcaKd3seTWigtp1K1CWpUaAqv1m5R2PVX+ZdXhjJC4B6XJHSiOtOXPCXC5gquAr+MUpmgG9tEu9eTcebMFp8TVtJ03PopuQ/ZgJQs7tSjB7FMCR9zP8Kvmh/Y0dnturDpK3zpo9JNGo9DSPmfUn2QN0/6a94iUsgkpqGcBdb3H657GhjbrJohv8v/gjwdbKUDTKwfn6csu3hLi4ghY0pLTW1hrWHFasmIQSt5eyuvCWqTiVbqTpkxZowsspy8/LiiZ8Ci3iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by AS8PR04MB8772.eurprd04.prod.outlook.com (2603:10a6:20b:42f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 03:33:10 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 03:33:10 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Mon, 31 Aug 2026 11:36:57 +0800
Subject: [PATCH v2 2/6] media: imx8-isi: Use per-platform format_mask for
 output format field
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-isi_imx952-v2-2-fafdb4b446d4@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788147422; l=5531;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=GeZTZaOQbUbILfPgV/r09iumcpZs5WGBVnI52ri84CA=;
 b=0g/jittTCBQiqcuQ5yAOpXc9ZaLbp04oVrR9Filw+bf85MrBr9/A3hFYJTwMyn0d/p2lku/t+
 RlDgTYZTbzAB1kxQ3P/fV/dK8DNU9wWj/vYaR76faHewzrIcIxnOp9s
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2P153CA0036.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::11) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|AS8PR04MB8772:EE_
X-MS-Office365-Filtering-Correlation-Id: d828b987-38aa-4a5b-58b7-08df0710944b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|376014|7416014|18002099003|22082099003|56012099006|3023799007|11063799006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	YLPjmyTSKFzaVP5v80GjD6iLS06udQgaAuDHYWVnESXTL4W02IPX3JFJcRsGGc3MFeo+grKdTztJeWm4/XLHx4KS9R5mzN+jplamlNG7i8MVCeM1mLgS6r+C62kYeC4EiTG7JLlsaCOlhmAq4EoXKBgM3uNBfux4MoC6F1j44GWQFJFKsKTpB7xe6l2YrgJV0MtD+jOhWxIB9Pnl7fAm/DYdKl/YqGHFrkPtxm9CPu0rjDSCkwMxc4ektTXXqZYkScIiXALFFg99SSiBH07ERh0aZJI/cY5ZJqxGt8yZI8J+ptpGnseuRS9cYPKzY6g8mdKvLfzu0nC3tJBsEeilYL2X25ig6OESTQKCtQOfWDFBiDfkN+emUwn4TEJEtrX+7Npk92ItxTC/btjZ4Br+AQnt1z6ewqvKCtySUwphdNNvZrTWoDdo+gZsEC1+kjizRRBjwxuqWRQbEH9qft/FyclYn4hCcVZ8bRYdOUgEgOC+aPHnEwUNmCSxKIEMKVgPGtBMQdlMRYbwUYHTKtB9J3Tk+35puIcGWwmD7Xq619bQxn9TWou8M2/Xvl5YFtYnxXhHfDo9+yuUdig70KRaPJigCw8ImyC848EZFUlwzoq1IEGJSjwWmvpl+xZh4J5q5VR9jeyz6Ms4ws5rZJ0JzFMg4VdFiRNmXN3k23DPTNEKJ/DFJvf3KY8Bnl8h1YF1EEqxTRNlg8AbnFpZjREWAg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(376014)(7416014)(18002099003)(22082099003)(56012099006)(3023799007)(11063799006)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TldEaWw4UnZtZjFyNW85UHlSOHljY2V6WHJOZ1g2RlBpZkxMK3NuejUyWURF?=
 =?utf-8?B?dVdZYU1OZ2JiNUppQzVLblk1bVZVeGl4WENnL0Q2bWpwUVhJWWs1ZDFRR1hh?=
 =?utf-8?B?ZDc4ai9qYlRnWHcvaGpJajFlNUVld2xUd2tSb09yc3dueUlqZUZ4aEh3T3hD?=
 =?utf-8?B?L2F3eE0weEFMVWtyZWd1VHpZQmh3b0pHQ2pmZWdFc3I1OHBXZE1hNmZMSkFi?=
 =?utf-8?B?TWJZT1Z2UW5HOUkwd0I3SExuVVlqQkhYMGwzSmNOUzhrbGRpVFdWVWM1dTQ4?=
 =?utf-8?B?VjVzVkhONHF0M2pQdUtOUWw4aUJ3YXMxcXc0TllPVzlheUJFcGpLa1EzRFhS?=
 =?utf-8?B?ZUlaengrOERwRXpzZzM2MHhuQkREdU1zZEVVc3hXL2oySENITVBrN05QUXAy?=
 =?utf-8?B?cmwxbzY2VnRHelZLRGFYN1hJM2dma212V0VUOWROWjJLSlVYaGRZaW45WnBj?=
 =?utf-8?B?eGExd1ZOa2N4TnV3VlJib2xPcDhSMjFLNkR4VTE4R2NNdG05YVJNRTczMCty?=
 =?utf-8?B?Ni9DM09WcU8zSjhtWmVmT1RVbndmcWFhMmxITjVGNlM5enhpYzZlRmNyQ1B6?=
 =?utf-8?B?bFdUUlR1MHVxWG5sZnBiOVpKK2hPdENndEcxbkRjUXZWZEN2ZmMyQ2Q2aVF1?=
 =?utf-8?B?VTZsMnFqMHhGTmpFN3R0UXZ5M09wUzhEYytDWUYyeHh1UkwyVlJhZ081YW1G?=
 =?utf-8?B?bndMMEl3L3o5cDBVbFFsWXpoNEhJU2t6WUVMKysreTdIRGVoVkdJN2lXZDla?=
 =?utf-8?B?bHVVRm0zK3JwNnpzV0M3UTdhVWkyc0dOcll4c0h4RDdja3BXVjFud1hSWklJ?=
 =?utf-8?B?anZ4VFBXYkhxNG93Y0J3Zm9TbTY3bUJ4bjM4VHoyZlNMOXZ3L1gxLzNuenRx?=
 =?utf-8?B?N0dzcmhuWTgxSkxFUXBaVi84Rk44cWlEWXhTMW5BbkZoTW5ra29teHMzM0FH?=
 =?utf-8?B?VU9BQ3RoQUQ2eFBnSHhzSzI0cWJCdEhiYXU0aU83VUhvUktzWGFnUDhBQ1g5?=
 =?utf-8?B?c1MvS2pqdkxHMUxNNXZPVThPdnRKWThYOEJ5UDdNUjYyVVNjdlpNc21YaHhn?=
 =?utf-8?B?UXBDTHBWTTVPNDJseEFDZkJyZmVadUtGaEtoLzFuWFp0VndDc0VJcnBYeDNV?=
 =?utf-8?B?OTBGUFNkQUxZeDBKcWFxTlFkd0NkQXowbGhGSHpVbUJreXVwcWNBa1YydS9l?=
 =?utf-8?B?c2dzMU5WTEZHZkdCU1BFVmF3K1QrWmdZUVhUbFM3ZmMyRFRtanNnVFlQbzZs?=
 =?utf-8?B?QXhjMnBzU3ZsdjRjTG5qVmFzY3E1UlVOY3liUVcxOE9XQ1BROEhGOUNwTWdX?=
 =?utf-8?B?VFdMczI3VHJhcE9PaDg2eWhEY2lob3ZMQytyK0FEdEMvby82VnNyaDRhL0Rm?=
 =?utf-8?B?RGFUUTdlUzcrM1BQV3dYYWd6NmhTdXV6ZWVBT0JKQzV0Tm01aUZEZmZVY21W?=
 =?utf-8?B?NEdsY2tTczBLbGNuUHEyWDlocDdRR0ZMeE5Ed2lIY2lZb0FyM0NzQVBTNUVH?=
 =?utf-8?B?NUZaUkNmcE8rTzYvRWZkUEw0SGxIaXE5REpYOVNyYS9ONzYwRXBiQVdvQmRJ?=
 =?utf-8?B?UnhkT3p0akZLNnBVeXV3NWRkSGw1dW5XeHpBTUszeDlCdmhZN1owazlPL1F3?=
 =?utf-8?B?eWx0b1lBYWVaUmhTMDMySkY0dHVxMkRGZUVoUWQrK283TTNIbmorY0VPUkM1?=
 =?utf-8?B?bS96K3ZFZWY5dEh1Mm9GVWc5WWdMalRXYnRxZ3crcEZLL1hIVVVSUlJsUDVx?=
 =?utf-8?B?UFpQd0lFYUc4WS9lc0ZIUktKRTBnV2ViYUZXaWFoTzJKaFkvb2lxVkx1WWZu?=
 =?utf-8?B?SzB5TmwwdkYrT3JjSytyeXpTaUZMNWxhNHl3MVZwM1Zha3NBRnFJWkhIVmJF?=
 =?utf-8?B?RmZ1bUx6VmlLWExPbmtwelJtd0l5RFB5aFNua3NWeVdJeUQwUlR4NEVnRko5?=
 =?utf-8?B?VTJZQ3JVS0JOK2tXb1FaUDcrbm93RVJGaW5qYjg0QXpGUkZPeWZFN2x4Rktw?=
 =?utf-8?B?d2krV2I3aTNrRGRzK3V0WFNoa2gvcDRnMmV3a2VNUU5PakswN0x0YVN5N0FG?=
 =?utf-8?B?dU1Jc0xkbHJ5cHhLbTkyVXU0cGwwWUsvR1MyM0VCSm5TazVnUmduRWljOG1N?=
 =?utf-8?B?Um5SR2N6bjNYMnhHQnNRRVVtNFVCRWg5OENYd2VHc2tEYTlsR2VEVU53U2tr?=
 =?utf-8?B?cG1GMTJhY2F0enF1dENJMmFvVTVaQWtCOE9rRUlpVXVEYWNPdmpqVk1pQ0Fs?=
 =?utf-8?B?NWlBMXRZbW1DcjYrdVlvM0lCVGdYS1ZRdmJtTS9ybFdwNWxJOC9BeDRFOXhm?=
 =?utf-8?B?aXREbjg0R2lnWXVQa29zTSszSVg2T2dhVU4yQ2ZUOStmcjl0S0FCT091L3RJ?=
 =?utf-8?Q?BD7Fl888UqXmiHiDMQuNNxjqaCJT7ZXZ+8DVT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d828b987-38aa-4a5b-58b7-08df0710944b
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 03:33:10.2011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TUxpcPEd5nJrDLGqTM1WGmT4mRPM4NoKRwMI9ENvOIW6QkSPRjLKF8ihbz+RYWIBy1HnfUiBPEji4dT/fLIwJUQ/dSW6f2R+fFwPQLdeDTs3Yz73MHEnolqwSFBaLOFI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8772

The ISI output format field width differs across SoC generations:
i.MX8 series (MN/MP/QM/QXP) use a 6-bit field (bits 29:24), while
from i.MX8ULP onwards (including i.MX91/93/95/952) the field is
extended to 7 bits (bits 30:24) to support RAW32 and RAW14 formats.

Replace the static CHNL_IMG_CTRL_FORMAT_MASK with a per-platform
format_mask in mxc_isi_plat_data to correctly match the hardware
format field width for each SoC.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v2:
- Add Reviewed-by tag from Frank Li
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 8 ++++++++
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h | 1 +
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c   | 3 ++-
 drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h | 1 -
 4 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index f2a8eb82fbfd..c1c16dbc1539 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -297,6 +297,7 @@ static const struct mxc_isi_plat_data mxc_imx8mn_data = {
 	.reg_offset		= 0,
 	.ier_reg		= &mxc_imx8_isi_ier_v1,
 	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.format_mask		= GENMASK(29, 24),
 	.buf_active_reverse	= false,
 	.gasket_ops		= &mxc_imx8_gasket_ops,
 	.has_36bit_dma		= false,
@@ -309,6 +310,7 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
 	.reg_offset		= 0x2000,
 	.ier_reg		= &mxc_imx8_isi_ier_v2,
 	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.format_mask		= GENMASK(29, 24),
 	.buf_active_reverse	= true,
 	.gasket_ops		= &mxc_imx8_gasket_ops,
 	.has_36bit_dma		= true,
@@ -322,6 +324,7 @@ static const struct mxc_isi_plat_data mxc_imx8qm_data = {
 	.reg_offset		= 0x10000,
 	.ier_reg		= &mxc_imx8_isi_ier_qm,
 	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.format_mask		= GENMASK(29, 24),
 	.buf_active_reverse	= true,
 	.has_36bit_dma		= false,
 };
@@ -334,6 +337,7 @@ static const struct mxc_isi_plat_data mxc_imx8qxp_data = {
 	.reg_offset		= 0x10000,
 	.ier_reg		= &mxc_imx8_isi_ier_v2,
 	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.format_mask		= GENMASK(29, 24),
 	.buf_active_reverse	= true,
 	.has_36bit_dma		= false,
 };
@@ -345,6 +349,7 @@ static const struct mxc_isi_plat_data mxc_imx8ulp_data = {
 	.reg_offset		= 0x0,
 	.ier_reg		= &mxc_imx8_isi_ier_v2,
 	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.format_mask		= GENMASK(30, 24),
 	.buf_active_reverse	= true,
 	.has_36bit_dma		= false,
 };
@@ -356,6 +361,7 @@ static const struct mxc_isi_plat_data mxc_imx91_data = {
 	.reg_offset		= 0,
 	.ier_reg		= &mxc_imx8_isi_ier_v2,
 	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.format_mask		= GENMASK(30, 24),
 	.buf_active_reverse	= true,
 	.has_36bit_dma		= false,
 };
@@ -367,6 +373,7 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
 	.reg_offset		= 0,
 	.ier_reg		= &mxc_imx8_isi_ier_v2,
 	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.format_mask		= GENMASK(30, 24),
 	.buf_active_reverse	= true,
 	.gasket_ops		= &mxc_imx93_gasket_ops,
 	.has_36bit_dma		= false,
@@ -380,6 +387,7 @@ static const struct mxc_isi_plat_data mxc_imx95_data = {
 	.reg_offset		= 0x10000,
 	.ier_reg		= &mxc_imx8_isi_ier_v2,
 	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.format_mask		= GENMASK(30, 24),
 	.buf_active_reverse	= true,
 	.has_36bit_dma		= true,
 };
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 58b47335afc7..05c21c448b93 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -175,6 +175,7 @@ struct mxc_isi_plat_data {
 	const struct mxc_isi_ier_reg  *ier_reg;
 	const struct mxc_isi_set_thd *set_thd;
 	const struct mxc_gasket_ops *gasket_ops;
+	u32 format_mask;
 	bool buf_active_reverse;
 	bool has_36bit_dma;
 };
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
index 6aa760ce3605..2405f7d33d0a 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
@@ -410,13 +410,14 @@ void mxc_isi_channel_set_output_format(struct mxc_isi_pipe *pipe,
 				       const struct mxc_isi_format_info *info,
 				       struct v4l2_pix_format_mplane *format)
 {
+	const struct mxc_isi_plat_data *pdata = pipe->isi->pdata;
 	u32 val;
 
 	/* set outbuf format */
 	dev_dbg(pipe->isi->dev, "output format %p4cc", &format->pixelformat);
 
 	val = mxc_isi_read(pipe, CHNL_IMG_CTRL);
-	val &= ~CHNL_IMG_CTRL_FORMAT_MASK;
+	val &= ~pdata->format_mask;
 	val |= CHNL_IMG_CTRL_FORMAT(info->isi_out_format);
 	mxc_isi_write(pipe, CHNL_IMG_CTRL, val);
 
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
index e795f4daf3ff..7c4e736f4651 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
@@ -39,7 +39,6 @@
 /* Channel Image Control Register */
 #define CHNL_IMG_CTRL						0x0004
 #define CHNL_IMG_CTRL_FORMAT(n)					((n) << 24)
-#define CHNL_IMG_CTRL_FORMAT_MASK				GENMASK(29, 24)
 #define CHNL_IMG_CTRL_FORMAT_RGBA8888				0x00
 #define CHNL_IMG_CTRL_FORMAT_ABGR8888				0x01
 #define CHNL_IMG_CTRL_FORMAT_ARGB8888				0x02

-- 
2.34.1

