Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011036.outbound.protection.outlook.com [52.101.65.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E2C3B14B7;
	Mon, 31 Aug 2026 03:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788147265; cv=fail; b=KYfd8BIksxuVAfO7AXdPpORHXCt74flBE3Zjaf8gwYpg7pK3YdaO6AYlLewlCRXEKUcdlktfsaEaL5UUQuJfz+QmbWBnEigWJbT0ayhvNhB40wps+jFZNZUoD5qrTk4WvsBHuppYjh0kKTMH0zzcpapCmkYKiAYzIWvq63kZcmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788147265; c=relaxed/simple;
	bh=5xyWWZQd7O01Z/gncoQTkhbSuzLyNt6H1+cWCi68e0I=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=AYpZgJjP6buxhatwKepquYYAB5Jj+YkvuE2h6Vs/l0RUa451GMCCHYaLCt3PDSSbP8oDFuyJMJ1MT6l/6m+xzeOE6xgwcz6xJzyFHwP9pBHyAyJHaOw76GihYIH8OaMXNBr/UxR+erBmOSGoVn/+SzSWOk7V6P4mrlIQ7PTrCAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OM/GeCx2; arc=fail smtp.client-ip=52.101.65.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OM/GeCx2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=etjISixESwbQekGD5zy0Ob5FR6Bmd56+bTj7tcZrGwr5NRx/bQmcWmMddBKYg/EI4+DkJc6wrd/51LLXn6SlFVIDcDoz2fuvKQAWEOTxIFLIV0oNWNC6SihrQOMolvHI1cX7OWOeeK8FB4qcC38Hpbqd94U9G3rAoagePO6Kv6CcnB+BZWvQXAK5PrswhCQ7pzDeXca6tuTs0GKojylXqbXS1i+wVWo8yZ7gvPvj1X1fGRyOHAULuJy9SuQPRT+CpR/YktoEN4VToBqmu2LVql0q+dZPslYKfGgTdBg3Ie7Yok/0FXYArx/2W4Y033nlD+YY6MIAgfF05U71EaAmDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjFHTBcsIQ5A1s0AZAPNbXu7fz21KM1MU8Kho/zR7Wo=;
 b=NiW1XyHGrjcX0Fg8f5ptggvAKZG0zmxUqo2hPdbIQ4Or1XecqbL8jnBPZGlG4BI8YMle7nMkF2ealzia0M2+NxYKSolooDxn0nMVQ4fII1FXTpNppbbExjfPekOByBxH+UvY347vJP0UsJnaoBTy5tE+2A4oIEt1DttnErjo1FgUO2qyJstXGR1mGpmrS+bWpGEzlKBJx7AN9FQj60F7bLMXyBt60w73A+z1z8pwjBu3lhehWCQlssDJ7SKOw558u84GDYt/XjNVzVtCnWoLjRjlZ5wZ7JgNrJP2Rm3qiueVUrAk82QM5TUneQjdTwBlmRAMthChzwPp+BVHGpy8rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjFHTBcsIQ5A1s0AZAPNbXu7fz21KM1MU8Kho/zR7Wo=;
 b=OM/GeCx27eB1MyPFyRwSjOtPt0PzMdxoJIvZ32CgeG8qwEkSViXpGiGlYu0SbZ9ttPXmjyYO2Lmhx77fQl2Sm249zocNDoctBJMjzTNDgB7uTKQuWYus/6Y6fE1E8bQ5OLndrUI1z8YTOEInEVebqp1XuJXIi76/Dc8oUB2qlkNvqGNfIMPZElOYvTw9eg8SSKBr+7i4irfu591/LoAZ24lqnd+xqg8v0gSP6+OYBc6Z8XLRIWmY88GtZvQzcZuEwBgGF5NsZhNtGCdBkv1yy2P6r3CbBN86vzGiPXkDT9sb9UV8f51uCdsPZJ9LJD6TiEKopMaXHJQfXrZcEFXv2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by AS8PR04MB8772.eurprd04.prod.outlook.com (2603:10a6:20b:42f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 03:33:36 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 03:33:36 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Mon, 31 Aug 2026 11:37:01 +0800
Subject: [PATCH v2 6/6] media: imx8-isi: Enable ISI RAW10/12/14 output LSB
 alignment
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-isi_imx952-v2-6-fafdb4b446d4@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788147422; l=12206;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=5xyWWZQd7O01Z/gncoQTkhbSuzLyNt6H1+cWCi68e0I=;
 b=k95/hsJjie9XP338IvRVZvHP9R7VDyIs5yg4HxCif1JjPP743/mhBoX+1Gm9kppXAdJbtiE/J
 3vm/FH4URMLDAvYp0g1mNm+VxFWz4U8zy188ua2CTERSZtxdqleQgkh
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:194::22) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|AS8PR04MB8772:EE_
X-MS-Office365-Filtering-Correlation-Id: b9ea8338-96b6-490b-6cec-08df0710a3c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|376014|7416014|18002099003|22082099003|56012099006|3023799007|11063799006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	3GbLd8YWSzN0qujOJUglUDd0QaFIyXWX+Tin9Nc7L2U9akvNbkk4aNmEOAo/ntx6kEL3hx2yjv5c2SKYTvKhZXZnDTN8SetZxpvMvZJKa6PHXWvmf72StT5hulOmN6AvWWzRtIbLVT/xKGGk5JCTa9HtwMELip6TVoLKeda4irylCSQ9egYSzEkH5tABrg+biguHuCIvVV2w4glN4iN2Py03Y3Ny7sIXzFDwFhMzQcqc5tp1a9UNIZAGTvJBEMy4RZ4CSqxFlHlHyC+fU2euDDQqfwfDTxkkCFImVSNKY4UMoO7U1xvgSQGDF3lrvOr9CZjGa/m8QfrALCPWRiinE/hCf/ty3pyBJ4M51gRZZxDMdUC4owgyth4bAJ/ziFifAHc8nEmrOISyIziwJf4m+IwI5VSHm6QuTQKI57BOzpUEzOgXTRgwjEiMPz65Meks39QAcvy1Sw4cFFbrnzIAGeXjlc/MVLevx1hUoBm1ZXhbwdOZfAGW7YPl1O6AOrIgCY8bLiCakfPD3MRlwqBaRfqOXMUy9fltGypEkfdEnn0/Juv78CHvWMgVamMy/esuiaYK30isPTd8/tXJtQZECJ1I5Uv8TsIXQg5IgOBPrpVNSpys3BKBQtlpjhW9iN4qQLpGzsKDyiZB4leqxG1Fl3M9CZGwpRdz9PJlw5N8T1+HDk6KSPa1QiK3snngL1vQ3e+SVMt6dP1Lv59Y7DdEKw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(376014)(7416014)(18002099003)(22082099003)(56012099006)(3023799007)(11063799006)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YURBUXBQYjVHYzhaWUh1NHUwazJrQ21kNk4ycms1cHRVMHNUYnJkQ3V4SGxW?=
 =?utf-8?B?OVFHMWhVUXZkNkk5UWdsc2t0cUFIdUoyMmhuRFBxWlFTdzJFak1hVjk0aVQ4?=
 =?utf-8?B?a3pySHpZR3JVUC9BZGtKSVdVQjNKRmIwa01IVmlhdzlqb2d2UExSSkloQ0NR?=
 =?utf-8?B?a1ZVYUVaOExvbnZSZmhhbFg1ZUZKR01ERzJ2US9HSnF2MDVaNlNHQmdNRWxK?=
 =?utf-8?B?MnNHenR3VUo3WU9CWU0rU2FXWXQrUTNYeDA0UHhtYlpFTUgwaXo3V3U2UnFR?=
 =?utf-8?B?NWZpa1loTEZKQzhNb29oUVBVdmpVR0pFbGZKMUVsbTByckttR3IrL1ZKM1F4?=
 =?utf-8?B?S3dwQk9PV3hBd0xxZk5najY4K3FNMDhDaVRnQlJGZTZqaDlIQVNSZllZa3ZW?=
 =?utf-8?B?NTdFMDBEOGZETSt3VFEyNWJTYWpKMlNKdy9OdmFJZCtmMlFFcTNwN2U0MEN3?=
 =?utf-8?B?aFBrUzhjZFg3OUk5WTBLVWhBU1FXb00vcjQ3NUw1Z2ZodUtXWERySko3Qkl6?=
 =?utf-8?B?S0JJaTM0ZllnZmNOT3A4U0ZiaWFOaGdZak1rWXg4TW1qNVU5Z2VDWUxkTlJ1?=
 =?utf-8?B?VFBDYVdoZUtRMlV4TWhGYkllVjZucyttQ1kvZUREOWorWTVyWUlGc3NQVHpF?=
 =?utf-8?B?UHd3WFRoU2lUTGdpd0NLZkFLV1NFRDJHMHVQeU5NajZiTWpxNjZIdWFrMXFs?=
 =?utf-8?B?ZjVmLzQ4N0FoRFNXN3d2RjBEdWIxNzg4VGhkL1JIMGpWMzhIQzUyNWhKckxu?=
 =?utf-8?B?U0xIMnFJVVVwMHRpMmxqNzJLbm5IaGZDbjRIeUJsL3paa2JwWnRlaTZBeVR2?=
 =?utf-8?B?bE1RWHZ2YXFkSVc1UHlSUVMzMnFaakVPRiswN1hyeXN4ZGZibWJMeVJXSHYx?=
 =?utf-8?B?eXFETTBIZXZuakNKdllrZlFMdjRFYUc3YUNOUksvais4TEYzb2FvdlAyWnFz?=
 =?utf-8?B?NlZNUnp6RXFTOVFsbFZ6M3lYT1l2UjY5SXViWnpSNlQyOFJIVzVzaXUvTThH?=
 =?utf-8?B?eWRkYUgreUExaG9xbG5pc21iZm5EZ251TFVBYm00SURqZHhtS0taZXUyL0hM?=
 =?utf-8?B?R1k3bGVIWW5NUzhBTm5mTkwzRW1ZOC9oSFZxNTRyTU1rbElpbnh2TUt0anpJ?=
 =?utf-8?B?MmVPeGFpNUxXOVZxeFZrcXVSejFhYlo4VDlPaG9QbWNSZzl6clBLQXNWck1Q?=
 =?utf-8?B?TyszOFVPbDBZMFVOR1pBYm0zbkt6Uyt2ZHlnR1dqUEdqOXAwYjdod1NWbG8r?=
 =?utf-8?B?eGx4RllXcmtXcG9SNFRTYVFTZDh1VkV2SktGNDRkNGVDVWU1REJOcmdLY21m?=
 =?utf-8?B?VFVCQTUwa3VOdE9qVFZDeFpHS1RSUTZFb3VMV25mY0NqcGNaNmE3RE5PWWNM?=
 =?utf-8?B?eE5jQ1JBdkRhK1drOFNxVTBFNTNXTWNHd0ZsNkRtT29BUmRYdFc2UjY0WFRF?=
 =?utf-8?B?OUMyK3A1eFlkMGdsT0FKb1pNK3l5MG04TmErWjcrbHU1SFpxVk0yWVNSWlJX?=
 =?utf-8?B?Y083ZCt1cnN5N1JDeFpVMm05QjJZQjdXeVFkZGtJSVl3OUtzZnk0dDk0YldO?=
 =?utf-8?B?NXFPdk9yczREdUhEdWIreHNpWVNnQjhZQVlMaW1OL0FKYzY4SnB3TlY2b3Ns?=
 =?utf-8?B?NlZQYVVyZHdDUkhodUI0Y2JSa3lZU3RsR05QL1VwVzNUM2U5enNEaFZqYUx5?=
 =?utf-8?B?eWRqQVlGOEYzUE0vNndpNjN0aUthYXAwYzU2cXYwM2RHbzJxYU92VDJrYlF2?=
 =?utf-8?B?Mmw4YWE1bHFNejlSeU1IcjFIeDVEdDZiMEdrRWJYQ0Znd2dhaUhXYXdRbVlR?=
 =?utf-8?B?MkJMVjNMZ25VVE56Y3MzeWdVdldQT1VNUm0yUWVXQUlLOWRUVHFhMEtiVG9G?=
 =?utf-8?B?ckNSVjBma2hUSFlqNituRHVCbjlwTGE4SHR1eFRXbjNneDRuWHg3WHRBMHlo?=
 =?utf-8?B?Q3dSaThicTZSZTVRcVNMYlpQaDVUcjFicHRYcTRLbE0xeG1jTE1Ga0tvZ2Zr?=
 =?utf-8?B?SzdrRGhUNCtVcERHV2MyYjkzTFBOaWFzTmt0TmZFSUpQMUFCaUkvcjFDNUZ2?=
 =?utf-8?B?RWR4SDFxU3MxaFozbkorcG9tMXlkV01HZjVlTmlVQmxtK2hheEJPOHlRcjdU?=
 =?utf-8?B?anhiNDh0T0xzNUhxM2pxVjIyeGZUeFQ2Qnc2bm9GTDBDWGR0ZG5JMm5QVmxY?=
 =?utf-8?B?YUVXYzA4a3kyUkVyUDdWUWtCTUxCcnZUczdyNUoxVTJpQmxRTWpqcUVjSER4?=
 =?utf-8?B?YXlmckpUbURDWU8zOVFPVmlOSUNzZlZNSjJzb2h3N0ovbTJSTkZLTGVGMlpO?=
 =?utf-8?B?YjFBOVQyeFZ1bDhzNUQ5RTgyVTJvRE1vVStBekU5M3FyOUY3OW1KUVFKd0V0?=
 =?utf-8?Q?QMv72nagEPfuzoMpm8XX3OpygFhRpCZz2A5Ws?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9ea8338-96b6-490b-6cec-08df0710a3c7
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 03:33:36.1363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JaOZ6rrLj1N0yrS8kgaUZ/mubMreKU8b3oA0J8s83892cCeLKtGUCcXxkk9bpwwYJfnXFY/dbUVTdWwP8QLDDp/+oMwDddT03tlBWw0/+Ck+4w4XKw1/2TJDO56Py7J/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8772

V4L2 requires RAW formats to be LSB-aligned (right-aligned). Before
i.MX952, the ISI shifts RAW10/12/14 output left to MSB, so the driver
works around this by using RAW16 format instead.

The i.MX952 ISI introduces a RAW output LSB alignment bit. Enable it
along with the input MSB alignment on platforms that support this
feature, so that RAW10/12/14 output formats can be used directly
without the RAW16 workaround.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |  1 +
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  1 +
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  | 39 ++++++++++++++++++++-
 .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    |  3 ++
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 40 +++++++++++-----------
 5 files changed, 63 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index d492631dfb6d..0f776fc8fd7e 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -394,6 +394,7 @@ static const struct mxc_isi_plat_data mxc_imx952_data = {
 	.format_mask		= GENMASK(30, 24),
 	.buf_active_reverse	= true,
 	.has_36bit_dma		= true,
+	.raw_out_lsb		= true,
 };
 
 /* -----------------------------------------------------------------------------
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 73f6ea7b0ea1..c352bcf8dc47 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -166,6 +166,7 @@ struct mxc_isi_plat_data {
 	u32 format_mask;
 	bool buf_active_reverse;
 	bool has_36bit_dma;
+	bool raw_out_lsb;
 };
 
 struct mxc_isi_dma_buffer {
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
index 2405f7d33d0a..4838b445f279 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
@@ -308,6 +308,7 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
 					unsigned int vc,
 					bool bypass)
 {
+	const struct mxc_isi_plat_data *pdata = pipe->isi->pdata;
 	u32 val;
 
 	mutex_lock(&pipe->lock);
@@ -357,6 +358,20 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
 			val |= CHNL_CTRL_VC_ID_1(vc >> 2);
 	}
 
+	if (pdata->raw_out_lsb) {
+		/*
+		 * Enable RAW10/12/14 output LSB alignment to match the
+		 * V4L2 requirement that RAW formats are LSB-aligned.
+		 */
+		val |= CHNL_CTRL_RAW_OUT_LSB_ALIGN;
+
+		/*
+		 * Align the data selection from pixel link to MSB to
+		 * avoid data shift since the data from PL is MSB.
+		 */
+		val |= CHNL_CTRL_RAW_IN_MSB_ALIGN;
+	}
+
 	mxc_isi_write(pipe, CHNL_CTRL, val);
 
 	mutex_unlock(&pipe->lock);
@@ -406,11 +421,19 @@ void mxc_isi_channel_set_input_format(struct mxc_isi_pipe *pipe,
 		      CHNL_IN_BUF_PITCH_LINE_PITCH(bpl));
 }
 
+static bool isi_out_raw(u32 format)
+{
+	return format == CHNL_IMG_CTRL_FORMAT_RAW10 ||
+	       format == CHNL_IMG_CTRL_FORMAT_RAW12 ||
+	       format == CHNL_IMG_CTRL_FORMAT_RAW14;
+}
+
 void mxc_isi_channel_set_output_format(struct mxc_isi_pipe *pipe,
 				       const struct mxc_isi_format_info *info,
 				       struct v4l2_pix_format_mplane *format)
 {
 	const struct mxc_isi_plat_data *pdata = pipe->isi->pdata;
+	u32 fmt;
 	u32 val;
 
 	/* set outbuf format */
@@ -418,7 +441,21 @@ void mxc_isi_channel_set_output_format(struct mxc_isi_pipe *pipe,
 
 	val = mxc_isi_read(pipe, CHNL_IMG_CTRL);
 	val &= ~pdata->format_mask;
-	val |= CHNL_IMG_CTRL_FORMAT(info->isi_out_format);
+
+	/*
+	 * Before i.MX952, the ISI shifts the 10/12/14-bit formats left
+	 * by 6, 4 and 2 bits when using CHNL_IMG_CTRL_FORMAT_RAW10/12/14
+	 * respectively, to align the bits to the left and pad with zeros in
+	 * the LSBs. The corresponding V4L2 formats are however right-aligned,
+	 * we have to use CHNL_IMG_CTRL_FORMAT_RAW16 to avoid the left shift.
+	 * After i.MX952, ISI add RAW10/12/14 LSB output alignment, so skip
+	 * the above workaround.
+	 */
+	fmt = !pdata->raw_out_lsb && isi_out_raw(info->isi_out_format) ?
+	      CHNL_IMG_CTRL_FORMAT_RAW16 :
+	      info->isi_out_format;
+
+	val |= CHNL_IMG_CTRL_FORMAT(fmt);
 	mxc_isi_write(pipe, CHNL_IMG_CTRL, val);
 
 	/* line pitch */
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
index 35dec3a650ac..c9c22a3668f9 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
@@ -20,6 +20,8 @@
 #define CHNL_CTRL_CHAIN_BUF_NO_CHAIN				0
 #define CHNL_CTRL_CHAIN_BUF_2_CHAIN				1
 #define CHNL_CTRL_SW_RST					BIT(24)
+#define CHNL_CTRL_RAW_OUT_LSB_ALIGN				BIT(23)	/* i.MX952 only */
+#define CHNL_CTRL_RAW_IN_MSB_ALIGN				BIT(22)	/* i.MX{91,93,95,952} only */
 /*
  * CHNL_CTRL_BLANK_PXL: i.MX8{QM,QXP} only
  * CHNL_CTRL_VC_ID_1, CHNL_CTRL_VC_ID_1_MASK: i.MX{95,952} only
@@ -88,6 +90,7 @@
 #define CHNL_IMG_CTRL_FORMAT_YUV420_3P10P			0x3a
 #define CHNL_IMG_CTRL_FORMAT_YUV420_2P12			0x3d
 #define CHNL_IMG_CTRL_FORMAT_YUV420_3P12			0x3e
+#define CHNL_IMG_CTRL_FORMAT_RAW14				0x41	/* i.MX{8ULP,91,93,95,952} only */
 #define CHNL_IMG_CTRL_GBL_ALPHA_VAL(n)				((n) << 16)
 #define CHNL_IMG_CTRL_GBL_ALPHA_VAL_MASK			GENMASK(23, 16)
 #define CHNL_IMG_CTRL_GBL_ALPHA_EN				BIT(15)
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
index f45c2aae59ce..9a6a8302774c 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
@@ -221,11 +221,11 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 	/*
 	 * RAW formats
 	 *
-	 * The ISI shifts the 10-bit and 12-bit formats left by 6 and 4 bits
-	 * when using CHNL_IMG_CTRL_FORMAT_RAW10 or MXC_ISI_OUT_FMT_RAW12
-	 * respectively, to align the bits to the left and pad with zeros in
-	 * the LSBs. The corresponding V4L2 formats are however right-aligned,
-	 * we have to use CHNL_IMG_CTRL_FORMAT_RAW16 to avoid the left shift.
+	 * The format entries use the native RAW10/12/14 ISI format codes.
+	 * On platforms without hardware LSB alignment, the driver
+	 * substitutes RAW16 at runtime in
+	 * mxc_isi_channel_set_output_format() to avoid the left shift
+	 * that the ISI applies to RAW10/12/14 output.
 	 */
 	{
 		.mbus_code	= MEDIA_BUS_FMT_Y8_1X8,
@@ -240,7 +240,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_Y10_1X10,
 		.fourcc		= V4L2_PIX_FMT_Y10,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -249,7 +249,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_Y12_1X12,
 		.fourcc		= V4L2_PIX_FMT_Y12,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -258,7 +258,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_Y14_1X14,
 		.fourcc		= V4L2_PIX_FMT_Y14,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW14,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -312,7 +312,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
 		.fourcc		= V4L2_PIX_FMT_SBGGR10,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -321,7 +321,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SGBRG10_1X10,
 		.fourcc		= V4L2_PIX_FMT_SGBRG10,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -330,7 +330,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SGRBG10_1X10,
 		.fourcc		= V4L2_PIX_FMT_SGRBG10,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -339,7 +339,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SRGGB10_1X10,
 		.fourcc		= V4L2_PIX_FMT_SRGGB10,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -348,7 +348,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR12_1X12,
 		.fourcc		= V4L2_PIX_FMT_SBGGR12,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -357,7 +357,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SGBRG12_1X12,
 		.fourcc		= V4L2_PIX_FMT_SGBRG12,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -366,7 +366,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SGRBG12_1X12,
 		.fourcc		= V4L2_PIX_FMT_SGRBG12,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -375,7 +375,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SRGGB12_1X12,
 		.fourcc		= V4L2_PIX_FMT_SRGGB12,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -384,7 +384,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR14_1X14,
 		.fourcc		= V4L2_PIX_FMT_SBGGR14,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW14,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -393,7 +393,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SGBRG14_1X14,
 		.fourcc		= V4L2_PIX_FMT_SGBRG14,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW14,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -402,7 +402,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SGRBG14_1X14,
 		.fourcc		= V4L2_PIX_FMT_SGRBG14,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW14,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -411,7 +411,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SRGGB14_1X14,
 		.fourcc		= V4L2_PIX_FMT_SRGGB14,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW14,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },

-- 
2.34.1

