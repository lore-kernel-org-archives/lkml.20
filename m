Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.58
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793720269;
	b=lxLptz1qtC7bPX/8ekurnVV2UDMjJH6N5SE4j7qYyuiQAzU+dAl7t1DtnDfckfWV2Hx5
	 UOKR8U+nWmYk0mts9F0a4jdRxgGDKF8LBUCIqVnIbo1QvKoa5wAyUv3lc2mB9/Qvp13+s
	 jxRmP0/Cwibz50RG3bPZ7CVJ7PutewUEW+yfjYfdheaVEbfa2dysknV/O09gdesaOv150
	 s5wEPcmCwkBMwKG3NW77+HeEKlkyW0VmasxCarHvHePQrUyBmDukuPcNrCeayTMP+tr7n
	 YMYQKMUc5Oh2Y8wXDqhVT/MPqjHEBoAtLeUR8ESQ/UczNCiUQHGwSs44vJ2EPxeBGpw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720269;
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
	bh=ksbgLG3hzOxJT7GTtCEsIOdkkfv3BWZrRslrWo5SCQE=;
	b=KQiQhP9u1/rN73BP/esrJH4XoPsDuplfHWxQYbnDCBmdaSwLoqQrym5M9hXY2uXopRjt
	 oZsvhPrqVTpy6wyOxgR0+Z6RnIAkAWfONJrMTEpHi4Rsw9AekphGFyNn4TP0QAHLxXyVv
	 o0IFGUwukgMEqlz9K8mAQZPjrjI5QcA1ALmahlEjC29DHupNE8JX1ogpwXWCRS/z3knvA
	 uClJ8WlebZN/AKnTUKE9jl6YNqiFyng36O5y/l4nQDtiaEqX/A4xu3X2HoVOgY6PhOaNI
	 UXqq1hefn5SK0kpMZLf75QwlX6pP312Ur87KkGCWVVal28XBIC+vTN5GXrGanRK6e8g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=QkminwiQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.58
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013058.outbound.protection.outlook.com [40.107.162.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F6C606A334;
	Tue,  3 Nov 2026 15:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68F6C606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=QkminwiQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RFPbH4sLOeJnjBGL2hPi+mOAVjT8NOy5bAYdG/KAvEMeN70DgOtxIhlVkJgbQoHADQV2fW1FtrIYyivufZg7VXvguETkoNxFro09YWK+pEnL3s3JPg78jphaogfYqAIKKG/kkd/GQECieoEahs89CdBki4XIyeE6U4FREQPc7i1OHFBKJ3k7y16OvuvRK0tpGP8yL+rTvv1giBtTLdOR3ikPKqlwOgRea5l9gKNTMXCcKy3XHE6AiNC3UvkbrIxz7Z1ek1mHR/tmsnJdH23mhD+QXCHXUo20MsSYrxXHG2BzgSNEb3+IOD25+XEMyLD/6jy03hxFE7mXZ1Et0sPkwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ksbgLG3hzOxJT7GTtCEsIOdkkfv3BWZrRslrWo5SCQE=;
 b=BdlapS+1ag1U5fnDZjBNXUcI2utdQI1T9saLQaiXITnmsy3FColtC7iZ0fvo/4cMRsI/uSZLjGZD4POBQp5Ot/qCagGBaFrkvgCHSbZAmBSsbWlS/UKZqhILbsfnN0FsqQJljJGjWsN9Qz+CG+PoEPz4doTNKGiXsZ+KEIovbp9sK1ivsmuAn6vADW2r464soy6Fok9M84IWi0CNhGhFP/6EZuWUvFm4kS9xqX1R1oPsPQoMr3n09DGG8rChXxUFBQxlqqzDl+fdOXVNNa7LIouBxLmYLDJXnrMTc29ii61s1DxO3Y4GzArGBxlmZMrUb+vM0aqnAsH4Jsr1CNXHUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksbgLG3hzOxJT7GTtCEsIOdkkfv3BWZrRslrWo5SCQE=;
 b=QkminwiQswPuBKzdMeLffQxevg04oWsRsTtFgegGpM8TTqtGAd0cR4KFXneV2xMVIc1lwYIttkt9TNdvLNa8SQS+kPq5hwb7wCnyBuVHuRV1UvklPX+ox22wl4v4jlcrTSd6flyWKCYZIzCezO9Xyf4p1MLxHxSMmxAnPn6xBEfNmfqDdH7KYQUVJhQR4ujkVaUKdxr4TEHAbtttz4rNnvIKOFl3f6jAyGVJC5gqPA9IrWuLOfryhaVqjsO8P/FdgFSJGk/4G1A07Cp7tFcNJ0ZZVtWyoemqGTLWUHyj15iGZx4r8lHkGZ+oFXGcHcHo63GrbkQKhuHVzMC/QWeJfg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AMBPR04MB879831.eurprd04.prod.outlook.com (2603:10a6:20b:7b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 15:37:45 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 15:37:45 +0000
From: Frank.Li@oss.nxp.com
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v3 3/9] media: intel: pxa_camera: use dmaengine_desc_set_callback()
Date: Tue,  3 Nov 2026 10:37:03 -0500
Message-ID: <20261103153721.1232488-3-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103153721.1232488-1-Frank.Li@oss.nxp.com>
References: <20261103153721.1232488-1-Frank.Li@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7P221CA0032.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:25e::9)
 To MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AMBPR04MB879831:EE_
X-MS-Office365-Filtering-Correlation-Id: 14f90a93-332e-4cb4-981f-08df39c067dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|19092799006|261102123227099003|11063799006|261009223027099003|261028144727099003|261026140227099003|261022105027099003|261021121427099003|261021123027099003|56012099006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	xNrCkrZyZ5NLl6c5SWz4nCfhLsNIRXW0mZbx3GyKnhRb01dylkUGLvLataNnUSh5mC+hYC0XO5Qp3KWSnE8W3BvfNq7W43s1m6r07ck773pIaxgR6Q4a8Hhe5X257+cYdmIH/6UX08VokEuBPwFa/zPMRXGm5nYoywmmoLWyEOltF6DW3fon0Y8Cp8qxdX1QCdZ7fMNdfmH+V/R+KBdqDp5vgurPEFuuR6Rjgz2ghla4IuaI6Hzym97fFeqHvs070TXWpgfKJuVNxFLBsM6nznOMlky2QfcgDJPPWRAAlb4KUc29cl9Us3r4kuvUK+XOydtaEOgCQaDj9XUN7erFgxTd68gm5TmjzfpxEWdSYazkgVmx+xs+UZZtO9xvRV/0Ubauu2rSlFWYBtrMXh4gFcnj+ch5cmarq8hqTwmW/rOyL0CLJsZF55ClLElaVuR3wC7qlVyWShny0+cxtAqSEeIrtRnOIWr8Cyt0k2sLfNzo39mxqTR2XPxw20BQXFq9ac1nwlVMPH4COvdC0wFP8jD0xkB0/JKdkw0/JBlwW6soQQpgTJz2PDkyfYL3upVLqWlaHWBMpRAUs4fSzqcX+ysuH2GH9N+pDAVxSQym2x8rjjm+b/pEjZiAMzlnj9Zf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(19092799006)(261102123227099003)(11063799006)(261009223027099003)(261028144727099003)(261026140227099003)(261022105027099003)(261021121427099003)(261021123027099003)(56012099006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/AMCubUS2oE4KbUrzly31mkY9ewnj+92atKJsmGXytGlNC3GXMXXe5gROLwX?=
 =?us-ascii?Q?YFmD93hVSksjqUKcODoJx4vWCN+ix4W1hiC1pTpdJQclkdoAbAJ+zLixfuGD?=
 =?us-ascii?Q?s043XUkdCfQshA0wF2pVvR5m/cFArNKAEJH9DjSfhKI4qr3ges/YyZPjd0F/?=
 =?us-ascii?Q?HvPCU2DYR9MTi01Kap6wibSLCuQXceH+7+7A48UlzKvXstYBpAbs8RG4wgM6?=
 =?us-ascii?Q?Z+VBHFYWizxvZw2Foygxgh9I1N+RPYJi00hVChER6qllkxRjIUUpAWuLCygV?=
 =?us-ascii?Q?8D45jmi+deXrlN/6LeT5DHfTC63mI4jIPtHyiFKS5k8xHdn2TU04ZhwBjpVu?=
 =?us-ascii?Q?TgcuxgvJMu2QAOZnYLOK9KciOb/JWg/OnBNiF4CuB1DsRmLVZIb/JqO1yz1E?=
 =?us-ascii?Q?6CxotXQu6ZApWZhAuaE68QA+xXSL2kZBOcsAbAe7bpbFLD40xBCwUz3+6F/X?=
 =?us-ascii?Q?fZ3lQo+kVCSyAoaUMeOus1KWKZHUps2KmidcCwniFzhpTlpRPfbg2aqCmG+s?=
 =?us-ascii?Q?NS6WTSjnzFLSNnn5P/Va4kakN1sh1OJLZMThiJRP+lsMQVlcCH08plJL8hPR?=
 =?us-ascii?Q?h5re1/b6ZvksfDgCnAtVfRM2BNNk+q5Fnhy2YL2gqpLNY4OgOrUV6UaIjWMn?=
 =?us-ascii?Q?jk8+uTFRpHw6QvmEufoFkFvaMe65ssMmZwH987a4GDlhxAvars+DZHao0jS6?=
 =?us-ascii?Q?IKssK4YSdNlB2CsLhJvTmfc/VWi/i6dnjvO5RrJggtdP2RFJfNw1icZAeBZc?=
 =?us-ascii?Q?u4H50HoibbvONvgeGMtgsH88aXSPV9M5XKic83c0pOY5rotpdGHouBeo3o9W?=
 =?us-ascii?Q?0MkK4hsUc5EB9mcGlfmLWtdDGtkXU9w9ijUMpDwdI4GdF5NFF6IFlOlIR4th?=
 =?us-ascii?Q?RqFPGLi0a7BfbKFSFYIdiQgonYvpKxMLD5WuD3cOc1yn3e8qPPawZRTmpBkf?=
 =?us-ascii?Q?0mlC6iuGHFBbScZW3Bmg2hNuXWH/ies0rWcci7ce26yoTo9xJvZXEG7dx/Lo?=
 =?us-ascii?Q?n9gPz2Abu13wpl3WQ7Hm8qNJoEJjQEJCga4rsmDqZXiT7TLYE/s/4zTnvsrJ?=
 =?us-ascii?Q?dwLM22urRnrdZ9JbMcp9Ye4tF2Ac50Gvkr2ap1s55X6Icq8qlwHg9cuElwZC?=
 =?us-ascii?Q?mW4ZuV/74i+mO5QgHH7iR6oao1Z1z2IE8X+YYctop+egM/2vGAxaDNJu7dbu?=
 =?us-ascii?Q?UdV2x0AX6TIXfFEV+A3JfYAdbRF133Wf01aPHeDQjJ6RYOwWwKqFeGUq7HMg?=
 =?us-ascii?Q?8Brx3+gSiV0A6qE8ABzWSlCie4KhLE57Rr0r9vdh5EvgPut+wYwqB+IXiuDG?=
 =?us-ascii?Q?HSIHS/AIqgsNe421/FgLKU6f1ffgzdbGKvHZgB6fBeW6TtqbimSSUOIHMX1R?=
 =?us-ascii?Q?B/fgVO2ntO3EmLws8xt/cGrgXTuQwHevUT5bjS5bs+o3pt5IIDeN0LlIsoPz?=
 =?us-ascii?Q?c1Ovsz10pwZjCZQihw60SeTr5IN1UuymRkXvoj7KHRmdOlBnJ3agaNNRg0Yo?=
 =?us-ascii?Q?CNGT44XXT5QjsOzAUF7AzPjCkaonth4pnhT5XijSpJddD9AapFyOv7qlBj1y?=
 =?us-ascii?Q?ykyyHgs2ntFORiaE1cAWgLvTLMielLp0ey7zh3nBe35pfV4DVcYGr3s1KT18?=
 =?us-ascii?Q?0gq3D6JXojxhtCWAj7wdnUnYKDYJPZ7BL3MPysyJr5irRDgCzX1V3Ih3aNt2?=
 =?us-ascii?Q?rd+gIJFlU1UMWfZrbNi6L5zVcwoaDBphcPxj0Zw/kgovJcebx8L2GDLdHV/X?=
 =?us-ascii?Q?1ZR+Qjaxmvfcwiz+pFbdgE7G5rUTBpH+ceR2dJBFtNqUq8htyyax?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14f90a93-332e-4cb4-981f-08df39c067dd
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 15:37:44.9632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vlAYK2rbn3qqG5a3t40BkzwjX9AgvUbs2owlCI3qKAMnZ6RT8kNWTZNqm7mTJLhsEr/Ohwtqc+pwGjV0bewfHJQrD+Meg+eEAzeADgvsxLkycHROL+11M4B2Yh0pFalz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB879831

From: Frank Li <Frank.Li@nxp.com>

Replace open-coded assignments to callback and callback_param fields
of struct dma_async_tx_descriptor with calls to the
dmaengine_desc_set_callback() helper.

No functional change intended. Prepare to make struct
dma_async_tx_descriptor private to the DMA engine.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v3
  split to simple patch
https://lore.kernel.org/imx/38f6a9abf37b06318bb6429ac04807941ca8d558.camel@collabora.com/
---
 drivers/media/platform/intel/pxa_camera.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/intel/pxa_camera.c b/drivers/media/platform/intel/pxa_camera.c
index 9e1fdd963b559..c9d57e4245181 100644
--- a/drivers/media/platform/intel/pxa_camera.c
+++ b/drivers/media/platform/intel/pxa_camera.c
@@ -832,16 +832,18 @@ static int pxa_init_dma_channel(struct pxa_camera_dev *pcdev,
 		goto fail;
 	}
 
-	tx->callback_param = pcdev;
 	switch (channel) {
 	case 0:
-		tx->callback = pxa_camera_dma_irq_y;
+		dmaengine_desc_set_callback(tx, pxa_camera_dma_irq_y, NULL,
+					    pcdev);
 		break;
 	case 1:
-		tx->callback = pxa_camera_dma_irq_u;
+		dmaengine_desc_set_callback(tx, pxa_camera_dma_irq_u, NULL,
+					    pcdev);
 		break;
 	case 2:
-		tx->callback = pxa_camera_dma_irq_v;
+		dmaengine_desc_set_callback(tx, pxa_camera_dma_irq_v, NULL,
+					    pcdev);
 		break;
 	}
 
-- 
2.43.0

