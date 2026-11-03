Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793741328;
	b=g3lp0O0flUiT71U2jOEN0jS+fhRppP9vk5i19MqBL6a9VulIaYh3re8ItuFkcaM9GwoS
	 AQ6KlzmSZGrw9b76z1QLkoK6eS4iNIn/UkDtSqS8BVFm8IFQAp1PfxoYI1cz0HVPaHVYo
	 gKGfuedwFkw3Du9eYkXDLdjlQXrT+JbtyjzAM3woTgqcvgDqHVMs8Olo5nJleInrQaeXC
	 F1UxvY3z30ARbJbyrpmkhA/KJt1vW9kPnvA3vNtWzFvVMP08g6MWznj2k68Vw9TwwUvmS
	 OH0ouprz32MR4ZVjDa2+vyGSUEzqfdufX19HXHqNez4zRToLQPWI1eVtYKu0b9y3DPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793741328;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=t8xagdrP6jEJGmLrt4x41v8Wpipc1ni1c8LWwdgYx8Q=;
	b=qIELJ7/E0p3DBIs7X9QT/OL5s8Fm1DNfgmj43gfxRY5PzzeFkYt+8CNSq7kdDznE2XUn
	 5IoaalIoVtpuKYDogT2FQCCimv5nTc4/0tUvJ3KaBDVaKP4BPesay0dcXTeVNI5xV1nsL
	 /Ieaw9Ft2P5dTxAteqw6jTwtTsyNFoZa2b1uadwjpQ61c2Tr1Abw6GhybT3c19eGO0unm
	 d6r1Fe52+p1hlKnpMlcdq4eRVZ90/XCdPiHKPMgKhARiJpQ+S7yNE0VCaE17Xe319lntK
	 CjPbzlDer1dcXdKywZSFBS+L90BKXIYGFK4NVQ51Tx4aXbTjvNK0yhmsqiqqJRjJH7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=G+vB14fY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.43
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011043.outbound.protection.outlook.com [52.101.70.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F42606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73F42606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=G+vB14fY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZO/M1YnqYduc1Z6Wbg1TfIJL8csG38ejgCULNf5lpC1dvVaEtOHI75xe1BcgxPAGuWh17WirkaE6kB6Vc4VazNW26I7xB5sDHfEHDyj49RpQJa63vp2g2YbhND/nfOKPw9NV7i4+Rc4j1p5cIMssVfAuFUYT629QB+DZPE7STKrKuV3EpjmeeR8gTBY5ytAUtB1SXNHEOchJ8sykId0UjicC/BOT2KynFvZ2hRm3/uXhB871gBOcbWgsBvB3leSSJ3SPChpay0gc3b6IldrexmG0ugLbIO6aVSgz9fUwQ0SZ4XOQsjNp7bhACBI9WXZNYtSrutJBAc9QcHqAOEqgQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t8xagdrP6jEJGmLrt4x41v8Wpipc1ni1c8LWwdgYx8Q=;
 b=A8gKZIdPbU99yUsXP8sJ5rO5t1IMsBCsRVCeOq0XlxIFVI1pu8Cb4D5cuaampms80GTmBQFs5AObubLp7ikhMeghVLQDPUz2tFyLqrMBjAwO5+CLMLcdx86/vHXoOdUubSjBfiMkBVknSfzHtPdfhv6TUhzzn6zmm2a0AlsW6r1O0JbWGXj0QlefnuUoAk3IOFhd8EJPD4wxlEgseqzWtPywMHdWUL/uAagLIRCffB1Xzt0JwuaENRP/GuKo1366KDcYxF+lhR34VV1ELaQbDxQ1stIb6+2aXJML+5ZpQ/QHsxR+v5rZ5KXe+eoG4EXDHgAdRS3dww3BZNUs+O1BSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t8xagdrP6jEJGmLrt4x41v8Wpipc1ni1c8LWwdgYx8Q=;
 b=G+vB14fYTjyUCEJ5vGJfVGSAdx7243Nuo/RgZoH4kywEB2FZaRpERV7L02dMxM2/iqVZ4wsWWA5wXPw/Qtqxi4XQnU8iAa5wvX3+tp87uBQJHdX04PnlywSD+vI8DUkATKx5yUzgpUZrbfG0c8QrR/xDnW7w5K5D7ac5ntH5M/Vf26LO2+SAFlbE+DE9G5qUvOT0Imh1FjdcQZ+xw3JxFfhy2Z3909Yc78HJy9dV2KofJbQ78x38S37xtQ8E1GxTqK9ibc3ObeHbEJvqv9DfXpAFibKwqvD1uNuGCvToy61IhIArHlxz1txMfmC84kViT1RM5/xco2+c9E3t8LRoVg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MI7PR04MB364121.eurprd04.prod.outlook.com (2603:10a6:290:100::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 21:28:45 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 21:28:45 +0000
From: Frank.Li@oss.nxp.com
To: Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	linux-nvme@lists.infradead.org (open list:NVM EXPRESS TARGET DRIVER),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	vkoul@kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 1/1] nvme: replace chan->device->dev with dmaengine_get_provider_device()
Date: Tue,  3 Nov 2026 16:28:37 -0500
Message-ID: <20261103212837.1777874-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR02CA0054.namprd02.prod.outlook.com
 (2603:10b6:510:2da::14) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MI7PR04MB364121:EE_
X-MS-Office365-Filtering-Correlation-Id: 2941a9eb-b004-4cc2-242d-08df39f170a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|19092799006|23010399003|18002099003|261102123227099003|56012099006|10067099003|261009223027099003|261022105027099003|261021121427099003|261021123027099003|11063799006|261028144727099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	ymah0n6EQqegNwrzCyedsd809v2KhNFoYrOT0YE85ppT87hkhBd5BesPpiW7uPFBQrG8ILAACW2Wd+T3vuOa8H7uFepGtw/NhoG2c8l/YvUZymPilM7qwifSu/B8An1WB7rnwPAYMaMCtXVrWkgojnfDTRSv5fBi6gowiFAZ4MUZ0DbyfFwJpGe8Khe7VHkDZt3YLPs88EpzyZ77+JsNNUdJyC2TwsEsBsq6P5ouMUv9R0fSRoUHds0dc1tzkf1p+CQt1aopXf2Ie2THaRQuB99oJGiYY8m+oHGNB0t5+5fk0JdYFwzG6e5YbZ///83egRVRJ/tSSqTP66/yzAAaQ9Tn0Sz8XuQTP6m/iOGPJlhFGPTJLfhR/Vsza4biDicop+HGzJcfxWe2LblTF8/tsIh+ZKLwh2oDTVLFenReJxv33ilM61EoasHh3KEIdNlhyeA/eJj1SkNOSEZEpRUlhNYgNZDhZm5698KaNDKs3Wvj1b4A2FSL6bOVC0a+6GhIHxq2zMfRgKCg+v1QFpWQVMK9ptzrXhxl/3ikW/uYvJhbKASSIR3Xz0yyyiHmGfRojp5rveeMVoemjw6vmchzeFLFr+Bw6ojB3+F1oNdp7ZkM0wLvtnFmv+JedwI0dLg3BokjFKA0uE2t6ncErvG+NsrWHN1sZalw3167paO/Ac0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(19092799006)(23010399003)(18002099003)(261102123227099003)(56012099006)(10067099003)(261009223027099003)(261022105027099003)(261021121427099003)(261021123027099003)(11063799006)(261028144727099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TojL9aiLkr6T2owA3eBdFaerGmtVsnyAxw6+R/fsomOjkEeeRJTzf897ZEQg?=
 =?us-ascii?Q?+F+DXGrk5Q19R5kX3oMmyhDpg2dsKiiElNonG6MkJBknXbueG7PC5MPds7ux?=
 =?us-ascii?Q?6j8XUZBF7fMXhDTZeY+zLut2EPsK85Hg2k2iFgNCBcVvo30kgW0xBMDaRYYi?=
 =?us-ascii?Q?z/wPSH4/IhtMv4Bxqvv33r65siNvmOOXh5CU8JyZdfbdWyQlAATEld1WUA2X?=
 =?us-ascii?Q?z7j7QsFo+DeaooJriBXoYsEL4Ecus9c3ZtPXHKG0jw/waWPA2eO8voN+S3V8?=
 =?us-ascii?Q?OOioFBW7SRuLk2pQPr3oWDyL9YiCk9yZBP5YySGt3iYiCcTfG/hXrBV9Gv5F?=
 =?us-ascii?Q?O4nN13MUaxXR02qw8ex2I4ggZiKZ3h5s6aujuQI/UFX0/yVxfs54v0aH1wdH?=
 =?us-ascii?Q?ovKQJOrwc8NTpRjUJJAW6GJIuZVj5e79RygJXLqURBbz+PsS51knsAj2XtJJ?=
 =?us-ascii?Q?Kw2b/cXUSsq/8IhRLk42ZKQsji9BgpquI6ee0yrYnFgIxVWD8gvkVfspkT1W?=
 =?us-ascii?Q?u14/Zfeg1DJ9OreJptpmyudqFyg9PS7uf36QDea3/qjkbVw8v6v/MjQHNF1J?=
 =?us-ascii?Q?Jx1/4nI4ockh2jTbBZNfMcqpR3TC412bALLE1LzHEhO85h1UrI15Rt5BDHyN?=
 =?us-ascii?Q?L8J6M7LzBEKdSjkkQxYQnRgf3S5p2PIkk0u/hh1iJGZMTYlPtgEHzNn2EStP?=
 =?us-ascii?Q?48FDWpwzjotsyc+/c/ZWXsTZ5EXcG3QVlAEalCY+MdJ7nG4AO6cgBnPl9YEl?=
 =?us-ascii?Q?+lyiBiDowseTDHJWwQTbTHgDumAUFgZLBBCBPCx0/oh1P+HO4VDw5prjHY73?=
 =?us-ascii?Q?/KgNkjsoSA0KHe25olF0d2JdlhGyayI7jnTV/INta8LahgbAZI9Pm80yAcFj?=
 =?us-ascii?Q?sFaQPPTj1A3uTw6m3TrpXAD0EdffVc0gScAu4U8xJbqPLnUez+xb3Uo8f5rS?=
 =?us-ascii?Q?O7DpTMpeSxBPLBNibfpDFY7gH8lrD3r4WK5ffOC4jDK7M0TXpGJ3tq2bjRc0?=
 =?us-ascii?Q?6igx6d+AsBfjAPHxKDa3wOjpKnYlatcILLZuhCJeY01b4WwAjBQc5YJtc+A2?=
 =?us-ascii?Q?sHmlT3d2M1osSRFOFcgyWRB68x0phYB7NoPqJhht8VllVbS6kPJ1OR8BrQa+?=
 =?us-ascii?Q?tntsyoETP+cReA2RaSA6WbrOkKlcUROv6MkGYG+rA5MZAIU917oLU9Jyrp97?=
 =?us-ascii?Q?JZNx9m+xu+iUUwhwZ/6rd3BnBGt1PudlEM5e3nHH6fr/uikygHgJ0xaskfpJ?=
 =?us-ascii?Q?0DkxGp/aUE3CJrEVg9FV/HcWoGgM2uvhXaZn9rT1rNLLVp0WmCVZnq5eKR7a?=
 =?us-ascii?Q?MXp3t+JaNVmYHXbWFX1bGNoZOOPgQR9hpCBLx1UkbfWdRQ4NTtD7jePPEdTg?=
 =?us-ascii?Q?SJ0ImvauZKDfOUmnlpZTmVAbH3uXUV9o3Jtdpu4ptsHu64nDls8zXvqlBy+G?=
 =?us-ascii?Q?AL31QhrKMPFoAtoiDAHqrHRklYG9NXdPsKWE5EnG00oEIGK4QkZHKaI7Z70/?=
 =?us-ascii?Q?c29zylvKM2Yep/u/475k7yxsGQXG6NkNo676COm85ZF9PTwQTDZ3ShZR1Gg0?=
 =?us-ascii?Q?PNqgTsiesgC1uxpBixTqPJVfYHMjAGrWWPKHkXfav7lCf/0pVydCmJ9PzXq7?=
 =?us-ascii?Q?P1lZYeqtX857ibCt/YeyEM1b5DhO7U8j4uGbdGFS+yKFCkkGaHkcwmCxUx14?=
 =?us-ascii?Q?SaqLGGEsf4K9J4/Di2+yTe50tR5n7338JRHgh3NZCV3/M7SIFa9xPDElL5k5?=
 =?us-ascii?Q?QX+qGNjKOkn15D4ysuv0hd1b/8biS8GcoaHkA5goNYyRvm01CcTx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2941a9eb-b004-4cc2-242d-08df39f170a4
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 21:28:45.0349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Og0W9DXu6/CyLbeJGbLAxHiM1iRIkHA8q4cjUeWfpaBaPp+msU1W5IHC3e0V5lUhq5mBp5JueFeZ/Brx6xIyjBRKfDpDocTG7rOnBAMJ0XsZsH+ZzaIXhBarMEal/17h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI7PR04MB364121

From: Frank Li <Frank.Li@nxp.com>

Use the dmaengine_get_provider_device() API instead of directly
accessing chan->device->dev to get the DMA provider device.

No functional change intended. Prepare make to struct dma_device private
to the DMA engine.

Assisted-by: LLM
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/nvme/target/pci-epf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvme/target/pci-epf.c b/drivers/nvme/target/pci-epf.c
index a8df176c1a574..4a2def0b7cc3a 100644
--- a/drivers/nvme/target/pci-epf.c
+++ b/drivers/nvme/target/pci-epf.c
@@ -281,7 +281,7 @@ static bool nvmet_pci_epf_dma_filter(struct dma_chan *chan, void *arg)
 	memset(&caps, 0, sizeof(caps));
 	dma_get_slave_caps(chan, &caps);
 
-	return chan->device->dev == filter->dev &&
+	return dmaengine_get_provider_device(chan) == filter->dev &&
 		(filter->dma_mask & caps.directions);
 }
 
-- 
2.43.0

