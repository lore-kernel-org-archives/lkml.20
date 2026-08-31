Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011036.outbound.protection.outlook.com [52.101.65.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBCB3B1EC6;
	Mon, 31 Aug 2026 03:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788147231; cv=fail; b=jCV/4uVWUxxgGydGhB/3156uwCUfMX1axuMt5yHUU+xE61thhI1hfv+PyUPz0BkhjpZBsk86hgN1UqotOpRRwJ+QYzO+Lgs/xW5GVlJox50pQTFj2biDqU1MmYUR5qMALaf+3A8dx3c1OpQFdyqPtjd2f22TtTAYYrIuQ4LX5QY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788147231; c=relaxed/simple;
	bh=b2+iFGHfp7pqoZj60gf3HVqmK0WPfmWbeEuzUKZ91mE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IcOSDtrQQ3wLXI3u4clB2uwDkbLSLCxp4afTV9zyefRvS37F1qhpYglhuLjeL8K+pn6o45sAd6CF28Z4V/Q9KaLToRFaXv6BWMkC5Gs+c88iqew4YxLIlKOSjcKTFlH1iWcobKZhW0RRgiJOvSBzCtfXr08IrOmlcBu89dvTwDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=D9hAh4Ys; arc=fail smtp.client-ip=52.101.65.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="D9hAh4Ys"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=np/t/+APd1VU6PR3oMeU/sGSpHDKmvSldjDwwVdY+dIcw6FeA+iYVKzuHZlEczyTLmyvl6oeQZVK+f+jij/cENfmcz0lbuLg27pgi3DjO+hSdPRP86ztxGDtlfxY5TiWGSWSiMYCWxDPANYG6nEWOMv22ofjZ4tpHv1NdV7aH+lFyilbu/Xk2ecGOHMb1vU7j43lbk+7qbcp6nPhkCamIRdkuAoKt8/T24c3N/L374EbEb+4xTpzBzqlvNoiZavG8/hPXzVO5fsuYz8j6IMtLzujSJqT5do1PxMjtiGINmIZ2vIJ6j+t1hAeinWXfHQsgacprW4sFhQJSlKhJaZqXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIw48S+BPKSfqu1wXSRbqyZ1VBGaoNV+d/21cuLImTc=;
 b=ceWv2yEIwvG/m3OCzO8AqkoO2xvf+sET3kDrHCpbRyYa5+LX8tMvHm190n96kHZDoZSZN+l3pHgT5Gn1HCNgeDGAKUNKR3h6rhO1j8imXaBGGnRvg/GoLlKeqMeekSpgHO7AQTuD3QZwSDlsW98O5/wiHj0N/Q7X4LRIhPmvxAUEx8c8rRki2BmKhqMQG479gW1P6twMKHDbtR/e9FZWUKgivwdXWG6FUsuxx9h2msmntGMaGjS/Ix1fM1Z2Pe3AP05O8RliR2Ox+iM2b1Jc5LYmC9kDuX3N9d0nN99+UPh+X5YYexNmCYXFRSVygZLnpptRwSTJqA8L+4HSoHmibw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIw48S+BPKSfqu1wXSRbqyZ1VBGaoNV+d/21cuLImTc=;
 b=D9hAh4YsKhzwuCOuTCaIhwsKuxvPQiffoipulzDjz0sp2bO9dPxFjLHdajdUKrxOPsvo9y1gzmcdJDk8lZD0x72HdtzqzICjqLBOkf2BlMbL8665gJFYz6hp/02QQ4+8AkVdNiZx3+7ZHC/OEGsTOZx4KTfVbl08Hu/NHo9QihNWrKHiTBzYTGCVKMh1ZS6jMTOnB5b/mv1+6wJJtYklX34UezER9tGV+k7NKzEuUuUbYvgVRAzE5IhLUpC1lScgyg9EgEVqjCKhEz1couFpGio1/u62HQHLRgv8Zdq4OBtHM9pggEQh4L2kWOr+JBlyL8905MBZqwzpI8tEevTTZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by AS8PR04MB8772.eurprd04.prod.outlook.com (2603:10a6:20b:42f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 03:33:23 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 03:33:23 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Mon, 31 Aug 2026 11:36:59 +0800
Subject: [PATCH v2 4/6] media: dt-bindings: nxp,imx8-isi: Add i.MX952 ISI
 compatible string
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-isi_imx952-v2-4-fafdb4b446d4@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788147422; l=1377;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=b2+iFGHfp7pqoZj60gf3HVqmK0WPfmWbeEuzUKZ91mE=;
 b=RCZITq/pDYgNvK4z3eg2b3ue+04ylWEBlNP/xaKAq/Q36Pk4A6BuiZblOFK5KrSuBgpD+VKRh
 oWRGwqrrypFAtkNFmDXX36aCzzwoPsLrbP7YnwQz5fLtFSVha3A/Bq3
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2P153CA0032.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::23) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|AS8PR04MB8772:EE_
X-MS-Office365-Filtering-Correlation-Id: a56c7f70-2068-43e8-9d6c-08df07109c08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|376014|7416014|18002099003|22082099003|56012099006|11063799006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	D5dz8WzTnt18rZ9i6iHgwDzeCTuMD4YqSb9hBWUvQoT8nx6BtwhwCwGZm8bm2uEM4oUReXSqitU0sMnh2xUb/b6MEI9rMgQiJHzyuL0S1wwBCOBPov8Nnb33PhLsf6eSP+OjrYUNAwBSiHOHQEnu/JW+Tjd2xTM8FbiuonsgxKU2RKt5107TKxDTlfzWpWylCxugdh9gU/LSB1DvTsHU1+c5EiF7kVt+JD/gkoYY1uwmbRi0T4hoKHPrXEqp5aLcjWQgipaAQ4Ac39tw771qq4uaN2gxP0GCRVabZeQn2FptmrMGVopRGAUUcHiMXiP18OG2+ce9ElYMMZ5JKT02lKnvpUu7KUgJ5gz0gvV2BPV+CIF3kUXi0Mft4M+F2H/n76j9AF0ec9HEn+iZTKuTDlXKmmOTIscBS1esQF9OGwCpRGHr6QThXVkNDQlxq/ESbk4XzF5XL0dXbfujA2gRMmGv8YcbMuu3dk56BgXFwYY3sHCzjMTjkd70Zg5FaysBL3sUznhfz8+YXHuAV7i/Ijp8Lu9kX98+N3PRFUBZAzl6QJVX3iIuHVrb2BAut0wjx6NHpSPTKcKQLcKBbblSDWTLtwuyFGFiwqy3wU6Ox+zRzPb7Dbdy6PuXVvGSUuDtOVrswmZzOi39yNZJkxSE+HPLe9chDsSWpKwTc/RyZdhXO4wt5F8RIASrfqrlplbpAVXGiw/y51Y11kjnxzC2Hg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(376014)(7416014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXNUMFlEWlhEb2lFYldOTlhuMTAzT2duUklJMTVaYVRvZEdqSHdabXZKRVVF?=
 =?utf-8?B?a25ySzZBdzhjcFhKNGdXczgxUkt5NDNJam5QTkZkUGZhdFhyRWkwWjFXM3Rn?=
 =?utf-8?B?WE1CYVllS09uMVVxQlduYUphaWN3ZFYxZjd0RlRWU3NPTnJwajlFcm5MUEpn?=
 =?utf-8?B?dnpTQTZLMVp3WFFPQ3MvNHZlallkV3dsNklNUERweFdqSmsyay9Ta3lVYkJ3?=
 =?utf-8?B?ZEhseDJZTzdIMVhCdVdnblg4YWgwTGFoUVRRZjh1b3MzRmxhbDJRRUdGSkdv?=
 =?utf-8?B?Z2dyTXBiaGQwTlRjK2FUVGxmWEJIS2NuSVR4Zk9CWVI3dHVrMW9IN3pJRExz?=
 =?utf-8?B?Y0FIa2tCbFZJRDRJeHBybGNYcVRuOFp4U3NBKytyUllTZHFZbXdabVpYdUhn?=
 =?utf-8?B?N2lXTUdKaHowMU1WMU9hNkpKQmNubThGclBNTWtjOEFEVlZqZWFobFMydWFv?=
 =?utf-8?B?ZU5iZ1JqQi84dk5MWjhGcnN3dUZTd3loWjZQcEVvRXRGdVg1QmxQc0dkUTNy?=
 =?utf-8?B?SWxlUmtJQzFlZ3FNcEt4SC9aRkIrQzUzOTZ3SWxuVU9id1FIK3Zqbmh2NDh2?=
 =?utf-8?B?cTJyUWl6dGZqTnBpTDJrT1ZYSi9aUkVRVng1K29PbjZud3h3R1pNNmttZDRF?=
 =?utf-8?B?b1dmeGhFMGdtelJFSVBWd0xpZE5PU3NiRkVvd2w5TSt2WjQ2T3RJamVVaS85?=
 =?utf-8?B?NkpZd1dTYjRJNndzOEpRc2JUWDhTSGhMOWJZS2cyNEYrR3VINWRrbkgxTC9s?=
 =?utf-8?B?YXlXTHh6d0JMNE5xSzlQV0N5ZGsrZFhpeThwak9NaWdCd3dOLy9BSFhuNjhI?=
 =?utf-8?B?blNaSk0ydUpZN3B4US9Fa2RsZW1VR2s3Y05sU3Nyd2JpeC9oWjQrTUJqRWlo?=
 =?utf-8?B?c0NheCs4emdlVFhZYWJoRk0vQysyRFVZOU41djJ6TG0wRnJnV082N3ZPWkRt?=
 =?utf-8?B?ZGkvWlB3NHcrV0dmakxybnpvUndxL0Q3VEc3ZFZ3SVZqOTJUWjNZdkhzZTZr?=
 =?utf-8?B?NVhnZkJkN0JpeUNIcDlCbmlSeWg0N0RzWFZRMDloTXkrNERSM3JTeHRONGc0?=
 =?utf-8?B?dElSaENOUmZaZjNjRDNGTXNpKy9lemhNUnRiTUMvaDViS1hmM0VRbE9DWkxp?=
 =?utf-8?B?Qm9HZ256Yk1jNGRTOHkwZ0xoSXJtUzJsTkRSdy9TQjdJMCtJcExncFliMzRZ?=
 =?utf-8?B?dXZ6SjB3d1hxNzRqaXltUDRPNlhZQzNEdVZGMThxdDVyOExXeW12ZEp6aUVp?=
 =?utf-8?B?NFpKS2ZPVHdlS2o0UFlmaXQyajVrK2xVUjRqbDJEcklmaXR3RDlPbmZXelpj?=
 =?utf-8?B?UnVNMkhzTlFVcis4QkhGL3I1R29sNWRnUld0bTVaajhiRUtSR09xSnE0eVND?=
 =?utf-8?B?VnF2eENQWlVEeDRoK01qcDh4MHpjOHU4Q3RUTndlcGJMcWtjalFRYTlWTUlQ?=
 =?utf-8?B?SlBRNkRGbWEvRkRadGxqTzVVcmdGSDU1VUphTENpcjg3MWs1RWJrUGl4UzRu?=
 =?utf-8?B?Nm9qaVdQcUZLZ2hReDBGc0RPNm1sRWdqa01qM0ZvcTRxSVJtbTYxTWFocnNa?=
 =?utf-8?B?YS9pQ2psMjJSdFVrZDNzTVF3UEd6ZGVXWkc5Q01PYmhuRFhoZSt6Tk9kVnlO?=
 =?utf-8?B?UUp1QUdYM3FDOEE3UXVQWWxIb0hBbkVvVWwzc0lFSGFOTHd3dTRsZEh4WktP?=
 =?utf-8?B?eE1LNTNDZlRFc2hMUC9PbHBFdmxnZy9iNmUvWW5ZUDBpNXA5UjFIYkM1MlZD?=
 =?utf-8?B?VkU0dGdSNGI0dDRMUk1ncjdEdkhOUktSRGxQY2x2bVZBajFGY0VZNHFjcVVN?=
 =?utf-8?B?cnFBYlNLUzk3ZVNUTC9xcXRBbjJ2V0VRQm5tYThpeS96S2NWbUJrM1U5ZVVJ?=
 =?utf-8?B?TXNxajN2SEhSaHBlZFdaYk01TFVJQW14ck5mUllzektSUDlKdXlCVDZSVzBV?=
 =?utf-8?B?bWRLcTMyU0NNbE5CUFl4WnoyM0xvOFBqeGxIdHY3MVdMQUV5dllKbThZbmg5?=
 =?utf-8?B?SkQyOE5KQTJrdWJ2WDUzRy9lT1ZESFRqMmpQcThVU29oT29GUWNQTjFmTnRq?=
 =?utf-8?B?WnpOK3FPVlZQMXhxZmNrcjVraDJ2TVcxTlF0SDdJOEl5dGp3SmdqaS80WVV2?=
 =?utf-8?B?Yml5aFJzSmEvcWNHNkxBbEpjb0k0WDBXNTJEYlozVG8zcHgrMVRMcm0xZHUv?=
 =?utf-8?B?Y2NSN1hEK0RtMXljK3pWcFZZMVpHM1gvMjRXbnFNUHdCcitiYmxKNzFzdmVO?=
 =?utf-8?B?azNLWXNXejJVUm1ZUHdRSWdER3RubjFpeDg3eStsaWR1MS93Y3NhU2xzUFNv?=
 =?utf-8?B?OE0wd1BHM1RHTzQwT2ZZWEpCZWJCVkN4L2JVS3IvOUZ1R2VPYm9DRW96YVRF?=
 =?utf-8?Q?eHHZi4uhROYecqrry0emZIaVBTNE2itJdLxGw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a56c7f70-2068-43e8-9d6c-08df07109c08
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 03:33:23.1930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rswv2r97eVft42c+Ye7/WYVnC6nnoMzgmtSEyOu/OdIgLD1dXC8qVb5I4+Hcg7vgmzVvhj8+hKvsrEYY+swZkNYnBSbZAAgtslK+1Pputvc0Tdk88DCvPclBe7Dxaf9W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8772

The i.MX952 ISI is a minor silicon revision of the i.MX95 ISI,
primarily addressing RAW data alignment. The core functionality
remains identical, so the i.MX952 ISI uses a fallback compatible
string to fsl,imx95-isi.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v2:
- Use fallback compatible fsl,imx95-isi for imx952 (Frank, Conor Dooley)
---
 .../devicetree/bindings/media/nxp,imx8-isi.yaml        | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
index 279c9cd3034a..d0a99f00a45e 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
@@ -18,13 +18,17 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - fsl,imx8mn-isi
-      - fsl,imx8mp-isi
-      - fsl,imx8ulp-isi
-      - fsl,imx91-isi
-      - fsl,imx93-isi
-      - fsl,imx95-isi
+    oneOf:
+      - enum:
+          - fsl,imx8mn-isi
+          - fsl,imx8mp-isi
+          - fsl,imx8ulp-isi
+          - fsl,imx91-isi
+          - fsl,imx93-isi
+          - fsl,imx95-isi
+      - items:
+          - const: fsl,imx952-isi
+          - const: fsl,imx95-isi
 
   reg:
     maxItems: 1

-- 
2.34.1

