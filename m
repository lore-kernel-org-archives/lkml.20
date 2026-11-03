Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793720293;
	b=M6XBBC60sonDuEQ7Phv4KUGPfWPrlOsRN5/q2PMvLi1yhu7j0LhflwJbYhv3+Vd77hXP
	 MZccZdR0u+H9ryGPzXlvrXQC5cRf+IuOHNS+a0Qu/7tBrPuZsPlj8B1mNWjCJsCiXhaZX
	 ZJ//qHeiAnxPwC7HpsKlYb34LJpcamZmiRqg9AUga+sADpPD+FnJmRj3sKRFMjrp3GrSu
	 3ooS/zHIx8oWHaDcWZv6Y0//sQjQNpZUVs8PBy8zwajq/bgywXCgzKaui6+/HBoxc2wr5
	 qhFD7nPBL7jt1rC6xjXwvzzC3PGn/TlRqT/FBplRmpq/1mvAnPLBJFsqRXMEAMevZLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720293;
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
	bh=zkelTXac/etWG1v9KwL2K3kHt1bkODCseAUnvoFMdJ4=;
	b=P6lRAg/Tmp4uRizdW6XMl1uZAWhWme1eeN1d7WaT7igAbMIZwMZTXjWswduZrk5hlk8A
	 h2V9Ogp/GmaeNTnR+NAqj3dXOgSpaTqw0PI/sdmsRrdSQhSVuUcClz8Bs2ag4fP7fqZiN
	 1L5K0EJ1Me3h7xdN0Q1SQK07Iq36wMMJpIMy8+uUJSUVCySpcXAErxD2hPumWNpHDFJRr
	 Pr+5xBAmL+eHJDsbbjIBCRZr9p52lSKQBqoj8j7M9EBDb2xX0sAwYiNc7Lu5PEWELHMH3
	 7OgIshohOi079TTP29R9k7sbpEJC2MKiD9LUtC6pcq0aw/UC6UCPFTwHwmknTeU8JgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="p6/GmCEZ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.31
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013031.outbound.protection.outlook.com [52.101.72.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5C8606A324;
	Tue,  3 Nov 2026 15:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D5C8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=p6/GmCEZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mV3bwR1CX9FCOrE11DWJHEItGeHdgfQ6WxVS7Jfwa0qPSRVP8nw7CUd9BoAn7E81RRUrAcPJzB8AHunkck1B2ML+gPG/JsDk/DSDAjzPCs/J87K4DFd9p5g1PZBJ6cg8H8nHyDrNfxOxCJTSfOgwpCccHbgOXRp6KQOqk5IjxV3D5xD3P8Z2HiQEBmwA7w2TPfQX5EKWaCICMHxeCn0d+FKPrcMLXwfCBFlz7p8EeM0kl/lwTmbvr2sdKbpRtqOIjnNG65wYSyy9mJ9LvSPx7H6zVZ+kT4fpaA7FfZtA+ppXF4p3a0HedFLPJ1LhAHcpeOvuWfystFMa9k5SVKg3uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zkelTXac/etWG1v9KwL2K3kHt1bkODCseAUnvoFMdJ4=;
 b=yOaEiko13W/1I47AUpPW0hFfsAtLU5F7RaG94wKFjTIybWFEObGT98QRrNSs9O7v0TvrybB0nBp4f1fZsMJIKJcfWo7GprZIFortyUiMzO+++dR5Sxhzo27qUIgznlAc40mxAcnn7HsecTBpvzGApgdknvW7U8ZBmuECyZAr0ql5XT+ko/J8Sd2EbibH+AJwzKJMkE97P46C3Xt5x/Io7nGk3bCAlRRLt8XRSnexLFJj/Lqbxl05xawedgdo9eez2FxUalCJr2XOWpuMmkKyDjYD7ri+zFjChjfDAV1d/WCuQtBIXORzm0ZFpled9WxjVGT3nQ040VMf5Rylyf8vdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkelTXac/etWG1v9KwL2K3kHt1bkODCseAUnvoFMdJ4=;
 b=p6/GmCEZJDEKPjKmwuMdDdfKlAUQNIJFtsnoQFMBlRMIRtxupYsD+v1JlkHlMmnPPKdgdlf2tFz9wTwfeNofxDIVVYfDtbdJPqpujEibElwidjGZyZ0ni2LKKFrN+oK+P0Ns+fGygn60wQdL8U0pWI8H/JrToCk9NV3kr2SrgcqkTqO0+RKnTxT6NHGf+CZnZG+rJF+aRHnqhcma2eFWB8RJRMYZ06rfaFGctOwgY+trQPtzCzcVU97StoWQhVHWLfIc3mGjy5nymOlPoLNBaNig345j3IYviSeFGA3gqKk9LOe4s2ro4JzH4ec2f+QUk7+b47GDH132NppfpgFBMw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM0PR04MB6994.eurprd04.prod.outlook.com (2603:10a6:208:188::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 15:38:10 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 15:38:10 +0000
From: Frank.Li@oss.nxp.com
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vinod Koul <vkoul@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Xu Rao <raoxu@uniontech.com>,
	linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v3 4/9] media: m2m-deinterlace: use dmaengine_desc_set_callback()
Date: Tue,  3 Nov 2026 10:37:04 -0500
Message-ID: <20261103153721.1232488-4-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103153721.1232488-1-Frank.Li@oss.nxp.com>
References: <20261103153721.1232488-1-Frank.Li@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DSSP222CA0005.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:8:3d4::15) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM0PR04MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: 51665a7f-e3f2-49ae-cb47-08df39c07712
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|10067099003|18002099003|22082099003|56012099006|11063799006|261021123027099003|261021121427099003|261102123227099003|261026121527099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	POUaM+RVJjPifxi4YKuBZ87xw7QdiwENP4zea9eAJuZ8hVdIlqgnB+mPU1oKgWate9jpN+mgiCEPE6ajvjL8FWUcX85dHZbgCBhcTo2g4GMY7MVbu/KiuS4nPj2Gzj+npUJuvhEXKIXODAG1FSnMsd8Jikx1cw2epyR89x5Xln1sMIA0AZpv0MFYPVx56or+/AFglQwJy1VVv2VtUSUSKzUT39o/Y60RcQkwwxH2HIcEJq5gFg5J7v8kQSa+gNq3diC27Cs9TpdRmqQw0f+ZP8fqqxTFuBDewp7UBFdRf0z4rFTYtgTndlcCgsn7Hw/lNJ9ASZgPigpkw+d3KAyT1fB42qqEYB7CGLsb1lGBlzrCZOR38UDWUXj4/g3wjrI4nAxS6/0wjtav3PZeEwthcrlDhAjiFVCNRcSBUMESh7bBOadCUmkW8UqI6RNMc4bSO82ahJDDXG9qAqQgRL63rZCuAPY5EueYQEIuIvwfID4QZ43szBzVhKUMPKq6EOMkkUQHctzRWx8azL/H4LVbMALfdtHERw1vq0fyA8Z4Lq8FCiVB1gnwkCk414W0m8u8cfP84yVvnRW82BUtJRGZIxapfV4x0wUi17aeKC8MsDsGSj6ADBH6oBaT6EufveCY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(261021123027099003)(261021121427099003)(261102123227099003)(261026121527099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gEzcvRaym29YcIdNl7BgD4znDh0funRBgJKucF/wwhquoYCW8pgRaH3lgmVV?=
 =?us-ascii?Q?rXp49EzyOfWi+++id0kbxV0/v4SoH7OimX7gmbWT4R9HCQTgfKt4ez4rTqL+?=
 =?us-ascii?Q?EO2CmeslowC6mOi7Kg9LExiUdj1a8dKyt7lDTeM9u1GvuqO7BXgPgvGzU4n3?=
 =?us-ascii?Q?lob20ZgPZfxORqNNVaIvbyOT264OxonsOXyn8QlZ43CPp88k6SHTY83rxJf/?=
 =?us-ascii?Q?DUGS7ys2Mx1pFdgxS3eK76SY/izg+OdUnCeX5fLtj+W65iP0QgFbMOMumi/w?=
 =?us-ascii?Q?FSF/qZeP2KsSHd3YekGHNv07kDEvZLyk/z2wgT49d2uGDewkX04eplzC99lT?=
 =?us-ascii?Q?SHXkrvYm+/Hgje8ppldbULebG1+fXUIo5kf3auAFssKTeZJi95XRsQoMQzOg?=
 =?us-ascii?Q?wkqSVOkpcjQl3mHTBObUNep1rC4rjm90M7gxoF7WO2FEE+nHrGb2jnRuHbm7?=
 =?us-ascii?Q?7LlOXd5fzgcHNXNCFsTmPvJuKt0G7K++HWturUgXFKEZP/6waCyqEm9WifGj?=
 =?us-ascii?Q?6kNPRIBNm3pcomI2LiauXXW1fM/tj2208XqxOX5Co3SpoX00CTPUFpc2YKVX?=
 =?us-ascii?Q?gcU29n2wXcpsJUHke5ylQIcA8L5oVBnGBLzZwFVZlFqG6cKAM01vfqlkUMRd?=
 =?us-ascii?Q?CiWH5HlN4c5aJ9hUtrrL1G3vXuLfwgF4rrJDBouVrhrPeJ7bDqTwXvnRutel?=
 =?us-ascii?Q?bKZ4T6TSmpDUyygQQA4t+wFOy55WSTfUCMwP/Dl+3fY+LxrgUggIcD+BnVov?=
 =?us-ascii?Q?mluHgMnkB06EVh6Pks0SvrcAtMO54ioPv+uHoiPKP+2wZgrknN2feAxWJ/FW?=
 =?us-ascii?Q?g2WSWOKNj3U/HxXz7mk+MSvt8pCp5PuENQh59iATsHxYPEuWpt8m9RIS4awj?=
 =?us-ascii?Q?EwmCQQEd+dnZEKtSRt7hxAHAGQmYcvwmQm4syUwCS/Tt2J0VMgM3qNTtBCNz?=
 =?us-ascii?Q?oNDFliONv5fsTt7K/nSgfUcvgfzIKDbHqeUfyl5CneufgHxi/sj0612iqmPh?=
 =?us-ascii?Q?uGK81OXPQBjCkUethTcstQIz4aWDbAI7jdxb3VtHVAPzbheYpzCJsVnbeth/?=
 =?us-ascii?Q?4AVNRKtA4FtcurWSVTpM+TRS52C2hADUz/U4G6rfVnYK2a7mCn9K442typRW?=
 =?us-ascii?Q?MVEK9Xst32yAa9A5xj84SXtd85+fmp3cvbjZxynBOu+W/qeKaqiF3CQBG/4W?=
 =?us-ascii?Q?YYtZfhqDQ6m42upvBs2lUPTzM8++DWakrxa3MevVUisZJT7jJqOD5u/kzT+e?=
 =?us-ascii?Q?Tx+50gA1Tobgc2XfxDBjz9EzTg1KPshcrjsVtN7mvsl74Oh71hATltj2gptM?=
 =?us-ascii?Q?+ptm4oBubOZE0hM2ZDnCzrM5noSSDTiGr+dJI8mHwJw1eh7/lqkb488N98ZH?=
 =?us-ascii?Q?Z6qXEIk30m97zx1uFB+ViAuUZIBN3QrQJDFchQvSMf+GwQkO8HrmOXEWdKQ8?=
 =?us-ascii?Q?jKTaUp7yAxBtZGCfkdNaPrb7dcvjJsKlFBn8s7jbWFPRKmzdeekoQlePjak7?=
 =?us-ascii?Q?5wi2k4oypHTK2MYcN081rryDDchkOA1szE1kd1tR+EC1EA31iNogS0Uw+Jy4?=
 =?us-ascii?Q?29sIWwmKu7GDqSf4GQ1seCGrXCnmBLglpr8YIBGJ0oF686VGRfcLL6QEuL5o?=
 =?us-ascii?Q?2lkzWHsQNlwXbxypRXJ/EkBIJKvBRWHIpxJNyWLB8la9UYAUYTaEXEhVeonO?=
 =?us-ascii?Q?Lvjx/9j1rOZCd5hLHua1d/ducyZSDLpbW/Fu3HZDMXz4iFXJUSGajrgTINDb?=
 =?us-ascii?Q?W4qhcoW23wiVAIwLCZXfxMT45qzXCTYENcmGgvKO1vbMeKSiVERk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51665a7f-e3f2-49ae-cb47-08df39c07712
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 15:38:10.4951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rcp7DWGXQxyW52HrIb1rw6LHRz387SqyS4EHxXftAeVYU54p4mHUZOSreLLqtuKwgJ6QMSutIkew3KyijM/BwPFIlmIQRTOBXbbRcorAuwrrdVs3Zuo+qKJ5dkQoYWcT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6994

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
 drivers/media/platform/m2m-deinterlace.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/m2m-deinterlace.c b/drivers/media/platform/m2m-deinterlace.c
index 6b07018614894..142b69eab47fe 100644
--- a/drivers/media/platform/m2m-deinterlace.c
+++ b/drivers/media/platform/m2m-deinterlace.c
@@ -336,8 +336,7 @@ static void deinterlace_issue_dma(struct deinterlace_ctx *ctx, int op,
 	}
 
 	if (do_callback) {
-		tx->callback = dma_callback;
-		tx->callback_param = ctx;
+		dmaengine_desc_set_callback(tx, dma_callback, NULL, ctx);
 	}
 
 	ctx->cookie = dmaengine_submit(tx);
-- 
2.43.0

