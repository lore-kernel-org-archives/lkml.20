Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011039.outbound.protection.outlook.com [52.101.70.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF1F35F16C;
	Tue, 15 Sep 2026 10:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789469285; cv=fail; b=lPRckXurnUyKyZmKsA0dLYogsXaBmXozrly8q3Hcyj4IeJPTVgdCpYAFh38yT5hz6Ag+QHfWOHvPyXhSNcwD70nsik8i072xHa5VxuXfpZ2/B7oRb04gchf3m7WB3OeXTWLA4pKPjFiPuA6ikDsD5HA5McrtwbqHpk8O7h/0tIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789469285; c=relaxed/simple;
	bh=hM7YNo+QahG2i8+Ibiv45XBkWtXGy+XAQaAAxvA2TIE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=rm5csUhobDuMMK1knnOmMpf/sBaqd1hK/MWZUhEyKTmqKrjRoUj0YzmtOW37O5pXuowyzg9vYumoAaGxuaazWGsXmtO377d380/KyaJzjNzDtnGSPjXziT6H622bK4fa55ec/3+kVWMakOVi2vOX8SYZcWzcrO4pJ7HAL30K3tI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=oqegFX7b; arc=fail smtp.client-ip=52.101.70.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="oqegFX7b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vJUpGFYCE5fNdscDiyTuKRf1YYrapHhJ/w4rYHlH3WR1/D969PlO2+OXAsV/NV2uVHTyDk+KZ5Vqc1Rl46dpSsk6p46u7LWGsFDQAi56hP+VnI7J+AwP4/SibE4ek39W3hT9/3OP8z69HmKLKmJcepV+XSJITF1fKMh6b/TFCo7Djf+qfk7gGir9IuOJBMHVBwnuXEWOAcL9sXQ4MY/KUHLjbBp4CKkKQtZ5Z/amYThZN7EaV2+HGYwrvLBaZrlwhyCG+nAatR6LHW3R9Xdx94bdvRX8tExdR5j/zh8rAomQb+4GSr+Ds8vME6bAhpr2BYP2DJ7OCJXN0y5UDoM39w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uVgCD/g+vxKKIKywtDNm/X1sosQg2B5HwQgIkq+yIYI=;
 b=i4bK/oVx/35Vnzu0bxnIkBLYta48lU8D2n3eGSwBFVmvtm7slZzG+P/GGq6nKv5knGECJz+WXRfRqKm9KnIDm6N5UXMjPI3llWNzhFUbISIgx+ev0dovsTpQwxrVWEQg0Ve7YztaiRz97TzOYf9a902bvdLvTyqp8AF3oNsl8GC52LOTZasUu9t4nk+rWwzDY7vllL2W76ZTUkWS1n97eVsPTeEWRLujR0vG1myb8htQR/Rdw+L5i7hadcwkIs5vipNemd99w+XHe330gqWh4UqXVM9an0ZPOHOiEuWf48J3vFpom0TCmUCfUH30AzBZXy7pOw0cIaVI3gxo2bY0jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVgCD/g+vxKKIKywtDNm/X1sosQg2B5HwQgIkq+yIYI=;
 b=oqegFX7bjJxutRmYkJ6oibvgy0ymcRIp+pMiBCCff4tSc0aS+jEmkgtBl7BgHx70NlGfd69xW34i/b68hiZqHMtSaozCdqYSW/lOtR74yms2Cd9i1I4S7TnOx73newJLrf28Qd4UqqwBiqCk+SWvLsFWBOTSjvlYcGh88Ye+Hj8fUoJgDPnMtndmEJq/BE9+HP4oC+ASEex/Dmg9+lwu1S4x9lge6NhOF6bcWGpBe87fOU2CgYixQpmZIqHpuyIhoONbXIrpeQ6nsutRQJSypClw1GafUDy7fXqv9Pyr1YtAutg/cdsjbMS8YUQJT07cOHLESTFMjtWi+t+k19AkkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by AS8PR04MB8433.eurprd04.prod.outlook.com (2603:10a6:20b:407::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 10:47:58 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 10:47:58 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Tue, 15 Sep 2026 18:51:50 +0800
Subject: [PATCH v3 3/5] media: dt-bindings: nxp,imx8-isi: Add i.MX952 ISI
 compatible string
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-isi_imx952-v3-3-3d8ff1363dda@oss.nxp.com>
References: <20260915-isi_imx952-v3-0-3d8ff1363dda@oss.nxp.com>
In-Reply-To: <20260915-isi_imx952-v3-0-3d8ff1363dda@oss.nxp.com>
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
 devicetree@vger.kernel.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789469512; l=1620;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=hM7YNo+QahG2i8+Ibiv45XBkWtXGy+XAQaAAxvA2TIE=;
 b=7TQl0whi3iu6j1g7/W1UJXdiSOdo/aNGu0Jt4GDulwPhoQUMG/5lmzSZS0x3FpOgH1t3s0jrz
 /gLGoatzta5B/g5KxBti23Lk0BZn8bjhpz7haFK867aL/WBz9mJlLIw
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA0PR01CA0056.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::12) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|AS8PR04MB8433:EE_
X-MS-Office365-Filtering-Correlation-Id: 8468cee6-df98-4699-99b6-08df1316ce8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|366016|23010399003|22082099003|18002099003|921020|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	w5/EQiTlwY6pB96XKd3FyAydycr6G+FMvo7S9NK6w3AyvE5ylTriltTWNIJxE4WTZCoRKIZcm3wEbRVrAE/LqgTkgyw+3G2zdVVxz2GjYrJ8mpV6z3Ffc7UzsZfK9DuBzF/yb1ib9BfGTyVdtjdbiyGsNVZxXOi5fwz+hDf23orWpJ2lWBZIdgXu0iMkQKEzDTA3yG9rBNy0Zr2Ko3Rjm37NdgQ3CZObR8VizKefhBI2Sly8lGf/R2EfixlrosuJIKrqskvrl8P1t1Tk05CxYcgOODMBPh42zyvl3ZVQSr04jfxE/sfzUAF/KT0pDfV2l/xTHU/SVTFsfNfET1Iaz4BJd3+IoUn6Ftiv+FbkX8PZZYQatCgk9TZ3qqDwjc8IBrsIjRAcn45qqa+mm0q1ZqGT2xccqG7GYLl/KemH6N89JZaJwYy9M4BWliUrKco6mgv7+c3NWsaazJZ3+jXdlGozBTK4sf0dJn64TgkZRXFtNbvP+7J8IE7BaWJmmr5jgnpqQ8nEikia5lT2Im6TYWJOJd8tj052NGsifoKvXKNU9fOja73JGJgtqAUanFV/QMaQ4djO632jNDd6AsveT9gSQepaaTM9h1mUtfcsSc7cF0pRShUQ5XtLhYGIC3umsAsXlvZdxK7npLxWPN5PBS6PaQp9spofgpDXFmOj7B5/CYdN9b5Q8bkn7GUExDBDiexB0eiTgPaWlJXjpYy6IA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(921020)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1VKd1lVUmVINXFFM3BzQ2l1OXRjbUFEOWRZR0xKMVpneHlOTjUxYmdmclh0?=
 =?utf-8?B?N3NweHBSRFhmUXg5N1Q3SGxSV2ZEb3pUU2ljeXhCSVAxeDYzeVpwTDR2RktD?=
 =?utf-8?B?N1lRRlQvRHpXdmZ3VGEyc3FkTXh5Qk9yNndORnB0T2FYbzZvdzMwLzk1SkVV?=
 =?utf-8?B?ZjRBTjBVeUEyVS9LUUwzSHdQT0JRcXpUYUZPSHg4NEdRQU9vcGhYQ0psYVVp?=
 =?utf-8?B?RVp6Z3V4S1h6cG15KzdiRnU5N2V2QWxoYVMwSzFlNk5ZUThESG10WXljQnFD?=
 =?utf-8?B?OWdENGR6eVRkN3JKRHl0NlJ4TFl3emRXUkxlOWJ6eXdHd3pweVQyRzFQOGpm?=
 =?utf-8?B?TXpBeW1uU3d6T1NoQ2hJYlBRK1FXTTY1MEo5OHVEMFpPOW5QVmN4VVRHKzI1?=
 =?utf-8?B?czdTckl5VUxGV3lHd1YyalA2OHVqUkhhOWljUnl1Tkg3a2l2WUJ5aWhTbGZK?=
 =?utf-8?B?RG1sK1NsYmk5eFlyTmlaYzJ1eVQ4VVhtejhHMGRWNksxY0hxaTRpNE1vbzd3?=
 =?utf-8?B?MlUyb0hsZ21YUlFsTEpVaUhDY09mN3VqRVFRdnMrOFgyc2NnQ2JPaWIwanFr?=
 =?utf-8?B?b09waUpBdEFCWUlVUlhNNTN2SHAzeGhkTEM1ZHFVeUZlbzNzZUJleGIrV2dp?=
 =?utf-8?B?NDdQZGVkQWQzcGZKTndQZzVOdHVSc0EwK1l4cnlTSnRFZEZwMWFHUlFGUVRZ?=
 =?utf-8?B?QlZpQjdGeVZIV2hxTTlpcGdTVzdlaVJFb2hYNy9UNjFycjIwdnM0QnJ5Y3Zo?=
 =?utf-8?B?ZTR6dXNnV0dkWWtiYjhHN1RFSG9RTlZJT0VwTUFrcFdQTUlIVFd4bDNXTHA5?=
 =?utf-8?B?ZitKdno1L0k2NFlpcHIveExiSmc5ZkZLKzNyTlJ2WkFINnowdlBnajdScTlu?=
 =?utf-8?B?VFd5SFg4NGJwVHI5cCt1Y3B4ZFZxZGNYd2gwVVRzVmloSk44V2JweUhhVkpD?=
 =?utf-8?B?VSsrUGEyTkV4UC9qMEVTWlNXTFA4ZGxUNVA4d0wzTWVIL281S3h6Y1BGTVJT?=
 =?utf-8?B?Sjk5blVaQnZtaG5BbnZSTzlEYXRtS1BVbnE1Si9nakNIa1Rud2M3OHk0SUtO?=
 =?utf-8?B?SGlYa096Z2xzeWRkYTFpbG42SUtZdFdRMUhNTlU5OVJkdHZZVWZHam03dkpz?=
 =?utf-8?B?LzYzUnhyOUEvOEZCeUgxdHJCeTI0dDE5MEV1QmxwckxmOTUvNytSWkxsR1py?=
 =?utf-8?B?TnR2SUhCZ1FwUHk3c212S1VKSGUxM0Raa1VZcitHVlFNMmd2ZTBxNmNoeUtC?=
 =?utf-8?B?d2dZK3dTOTZpdDlCNHFTRmZCVkY4SHhLMXNxQVdPdDRsNGQxbVlKV3hPSk9m?=
 =?utf-8?B?aEFQVG5qUFNkbStFR1ZYZFZPMklxQmEwUUsxbUlLMm50dFFNR3dZUU51MWxF?=
 =?utf-8?B?NjI2M2N5ZTk0bVdLdTNtYTBnSVNaT3YvRDZKbytzMzBRU09mZ2VpanRYUVBp?=
 =?utf-8?B?eUxRY0hRaDFCVUNqOGJ5eThqeDZabEg2TUd5STRYdU5RVkpNcS80eEhjY0Ji?=
 =?utf-8?B?RExxM3FBWFRUS2xJeWJHV0ZCb1JvMnZadnlueXNsK2xXMVk5T3RqcTBTQmQz?=
 =?utf-8?B?QTk5OSswbnRDNjRhRkRPSk9TNERLSDZFN3BJRW05NnlFMVFJTExqNzdmUHBU?=
 =?utf-8?B?TXpQQi9tOFN4THZGaEpqNUlVS1J4bHgrbitISjlhZjNrWWtad1FQZExlNW01?=
 =?utf-8?B?ZWdvWWZXSTdvbGtybDNVTzhJVUt3TGFuVnlmb0xNN2xmVUI1clIrdmY2b1hq?=
 =?utf-8?B?RnNreUF2RHlIejVhSkdsMlQ0Vys0c0E1QVY1c0dMSlhNUnFsN1o2V0tFZ3NX?=
 =?utf-8?B?UDJST0FUdS9LVVZlVVJlcC94aDlFeFhzSy91bGxqektzME5yTGYrNWFVcktp?=
 =?utf-8?B?TUVrdE9iT1A2OEpzWVZYZm9HUWtHUHV5Z3orcXlUaUxRN2hyUkZCUWNya1JP?=
 =?utf-8?B?cSt2RTEwanlMUGNpTFNrRm94YTNYcTBqY010Zm9sUENEaTBGVDhodjlraHl0?=
 =?utf-8?B?MjRZc3JHSzlpMzVOa01IN3lObi9ER3BuVzI4a1dtSFo1eU96cUM3cVJ3WFFa?=
 =?utf-8?B?empVcitsYTljQUYzWVBsWFI4aGUzSkpjRW1pemIyYmdMWUt6OVR3V2xhVTRx?=
 =?utf-8?B?OEI4ZjYwNmVCVy9HWDFrMmpZa1h3clFYWUUrVUp1bDhNTmdiVW11dTlTVUsr?=
 =?utf-8?B?RURpcVpmWHN3Z3YvcUlYcXJpSkhaZmxNbW9RbEdKdm5NbmZSNDNiZ1MyUmhq?=
 =?utf-8?B?MHpuVE9JeGRZMnpQVnhkRUZoY3JtVVVITnorUVVPc21YK0EzNjF5RnhWQTVr?=
 =?utf-8?B?cVZKYXBuTXNrQTE0MFRFZHBGZWlXZHp2Rm80U3RsTUN6ditIV2pUbUlIZlk1?=
 =?utf-8?Q?hrcX62w0w3cEddNI9Z99nN7mHBPsqaXFMQrMh?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8468cee6-df98-4699-99b6-08df1316ce8b
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 10:47:58.6863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 55Vst9c+4ko8fCY963EutwgEZJ2aCIRpBUbclNp8mG9Rg6zGYJwZOXkVmSzEYOYB7wj7LjpnhWQSijf8qQDpbelkw7/NqPEuA97iymc7VZ2W+kfcBvO2RPsC+bZYLX09
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8433

The i.MX952 ISI is a minor silicon revision of the i.MX95 ISI,
primarily addressing RAW data alignment. The core functionality
remains identical, so the i.MX952 ISI uses a fallback compatible
string to fsl,imx95-isi.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v3:
- Add Reviewed-by/Acked-by tag from Frank, Laurent and Dooley

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

