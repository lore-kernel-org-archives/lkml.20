Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013027.outbound.protection.outlook.com [52.101.83.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C3D4E780B;
	Fri, 18 Sep 2026 14:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789740162; cv=fail; b=oL52Nm4ZqWA6/zcU5LFZ049hLzpojVH7KE8WwzJQokzbNSmrTkq4ISWaHpD6BSifViPLisSQqQjQTbiAtXHc45mIE2483RpfDKRi+6kih78RauP0+vIVozy050axuRSc9cho4oTF1+LxtR0DpTyQmOnG7qDx911KiItOZ/w8c74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789740162; c=relaxed/simple;
	bh=RbjgzDazudQ3V8Hl+lENRJSaPny2sw07N22eNegz9mk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=uyMWeREGbc8E2k4D1MYlAxFQJqKbSJ2H9RhFXQ8sKYzUV8LGHUreLOXLq/rqEAsL3dmTYq08cTf3vbPkXPc+8SgcO0IITIxnj6dVswFusr7Q6wEK6c2ed7x/Wp0ujMTXtV9XVRWEvRVDIEYMJ/qTj6SzrP/lw2TFLBgRjU/ME/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OH0I1bRA; arc=fail smtp.client-ip=52.101.83.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OH0I1bRA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d4LEXzfsb/fi9ou0iecO/59j2aexHTKcFPq2APkEbD8oRimDRjKd3oXSCu6zZzK++tYLN1vmYWd31rn4HKx/cFYPxBKY6RePM576ldiMpgex6p7nh9qyYoSmWuFHpXjbph74BSB2WHbbOysQd/fX7CubiZBa0dhH1CRLmmGlWX7MFBL97pMLN/Re2RVglTap0FaFtIGJxQ3ysqKfPHUUYUkex/3qlDv40+Fm3MiHt67Hzh/LBM/KTlh8zLd7FlVe3ylwmiAIrBdz7iHH9EtHZi2WGNYZ5wXG3LWwCI2n4YK4xARU+FfdRfxJC19l116+HwZNNCcG81pDhjGgCxYuDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3YJYAuZsJdj+D89MfChAUXskVnTFhIaE8CFzqT5faxs=;
 b=BkGi9QeSGntgOdSdNWo0ZJ2Cf1YsEJvqirfLvWT9pdIfoRgZC0ynVLlEZon3PGDnJGyEYHHp3KT4wZot3jJX7/CvLhF/TtOcUe2x+JjReuQ9dBaKByYCglA1peFgSiEqFGwMCNUiruKd4hSaz8zp1bQwhK6otwjQTa3izS51Rf6Cav72mMgNYo1+Wh/a0bvlLFK/rxdwS9eaz7Y0oFVXzRBe52d6qFmPj010/P56+VnhXqCfe5rwtM6BdFriy+pZ2y0ctL1csIG5m6dlYIoTJIKu4ZEuMAvATqNll8ZeyF6SEJQKOuKwBegYnwrD11p0wC6Z+e37W6U/2qYiFlHRpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3YJYAuZsJdj+D89MfChAUXskVnTFhIaE8CFzqT5faxs=;
 b=OH0I1bRA+JQkY15ARzDYNsiCdwKfN8yY+ztWkPJ/xl2NxUC6PxSqWVIEbWzyi9tKl4BjhIvheu8eyICs4ze0rp4E7fTBKWUS+jefzd4nkz3FdH7TaDH8rIuDsIf8EhS1Rf5CCHK8fKem+6jtJcf/hPXEdjw/HBQuStgLhSAkr1lKdnA/4IBV+Hqb0zOVnLD8CDtHKOS1MszIpP1VPDhAlHD3FPV3jJlhDFGHlpFY89+p+v0Z3wmNq4jPIgfp93uWA/OeEI3VQ1fs94uoYdJddZeXHljkHZ8jYopqwksIvqdXqtCRCdD1bk9hvX3rrr7mKHtLOF4FBslS3YrH4cMX2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB7575.eurprd04.prod.outlook.com (2603:10a6:20b:29c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 14:02:37 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 14:02:35 +0000
From: Frank.Li@oss.nxp.com
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>,
	Kees Cook <kees@kernel.org>,
	Xu Rao <raoxu@uniontech.com>,
	linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	vkoul@kernel.org
Subject: [PATCH v2 1/1] media: m2m-deinterlace: replace direct ->device_prep*() calls with standard DMA engine API
Date: Fri, 18 Sep 2026 10:02:21 -0400
Message-ID: <20260918140225.2027053-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:510:339::8) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB7575:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eee6c0f-ad42-4402-3a77-08df158d7d62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|19092799006|1800799024|23010399003|11063799006|56012099006|6133799003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	goXnb6fimCgxZtjhVzS2xlmQAuq1pZuppjMROkPvB1rXnvrJePjMfwFFpx5j5r9aGvWBdYGd1R9E+dXIrQy74oewQ98Oi2BepYzs27d7t8l4UHw1nsF91xYPm40RyROMZNAoIDnH0MRBDdwUeRXCVzLiSR8de9yn8JRmWzFBT9zGXVOwsByIY6n1QAzTRuNaVSkHr6bhGOVJ8Kuchn/np68eBmhHZOk72PWkTQyfjOniKMaKK51uAn613hClFs7J4RySloP3Pm6zbV1uRdJGoUP0pFbfEXcRc03bXt21r8psl0GxTZcwnrD26FqpiSkM5gUrW1aiso4hfGRpqdkOm1FIcgC3DzBWr/kH8M9IbAqDD3yxRWuAw6zFD/Q12jgnnXTokdOPMXxv9wV6zlYYrLKzeVszidXnU78T3xyek/cJFg/EN52Cht84QaIa9XBoVvBBkzBBzQ8uPbCotDtTB8gV4XvFzvHSiStDmPpIg6KX03gHxIH8u8+LW3FmO+Rj3+s2XZnRB8u851dvylhsLYhHJxFVfjCQd2w59NRaLHy/368tjDgcLD7eKNzcK37SORIHSGCGjtMHPRZLon8f4ayJWAmzDe/dgneRzF2kO9EK1MOE02+rXdnOREeg5gCuuHiVr/JcYN2H2xqhS1JsvHECjPwkcVGl1mFoxljpMWI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(19092799006)(1800799024)(23010399003)(11063799006)(56012099006)(6133799003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jCazPxVoYEF+wjrVPfQDCI0Lf7/o8X4p+MkSi4bxpyWU7nqJOdCPKHZryDM7?=
 =?us-ascii?Q?ZHylpvRpsRNf6CB3tH5lI7qmUUQWv2/wV624PV7V5oF8UxKjKVgwQwbBBTyH?=
 =?us-ascii?Q?j/QCs5AGplFc7bf20XeipZnZk97TIpBRO/WuvzBvRjolcW2/Fz4iScaU94GJ?=
 =?us-ascii?Q?IVZ+PXh/i+R73u2t8qAnLUdjhVjIyiSpyXvu0q0RmhernbIdt+jb1uEg4/nY?=
 =?us-ascii?Q?7OdnOXirI8uBZvhHutqfsRQZqrD7+D9VK3uiy7tVnpK7siNinsopegSXM1nG?=
 =?us-ascii?Q?19+crKiFMqvzU99KBmuwRcR9EK04m5e1YTh1f9/csmmAP+KcXrZraKcrZq3P?=
 =?us-ascii?Q?WT7m0ltPZQTBIZNnF/MVPnAefZJ9mDL0O0kw9fUdjtzSsETzHC9reGjDl5+m?=
 =?us-ascii?Q?qoGUB0biSlFMoBGbr9ly+fzM/drKA8ClfM0PQCSSo/JsSEQ8yBSh5XXm9pDX?=
 =?us-ascii?Q?gVAY4KQJ7udtSjOb78vgzg1N1Ke9YESNxAk0+dgSyoeOoNgvx327ooUminAB?=
 =?us-ascii?Q?IV1HWXcAIG8s0PMqb1MPxPMF6JDCAQSQWyKFOXz9WM/gB2hQSDYenMan13jF?=
 =?us-ascii?Q?7VvzDXhnLI47wwMxWfQstkFIMD1vVC4fpLnHrpnyJusgEm3E7gVB4+qs0pCa?=
 =?us-ascii?Q?iIFBmD5ajbVqO2wN+bfHuX7tTikLFLbIEgBQ3LK8497BRgCwx/juMegWzoqX?=
 =?us-ascii?Q?6weOF+KvRBmamHW158ZgDHrV6vyaJGlcBSmd5v0ITbeAL3t29dpAWjDKzu6j?=
 =?us-ascii?Q?ydObsrg//eaYK9wScaZuCz6PE0DVPlOSGOxF4jeJYOgsW4UX/JV0l/CQapJw?=
 =?us-ascii?Q?xI4Vc3hWtn5hLOqHLHkUMIFs/7WGxpFulc4UuWwflSUKEKNqCVYNdJEZedM6?=
 =?us-ascii?Q?3AscnRt4uEC+ECtpDrLafvy6sq89JncxL8atKqmnKaagR5tBQxqe8Sa1xOiA?=
 =?us-ascii?Q?RbTjahof0P7ZV6dBcdbY8odCzS2oUuzd9YZkijUKIe0IbYfB86V33MkiLpS1?=
 =?us-ascii?Q?esDuLfars28rUwpDRdcr3/fQ5dP6LPiU/tPVoGpvGfeEDswS3SKC7NlFJvU4?=
 =?us-ascii?Q?n2YiuVTH0DOBoKhn31CPG7atZSHDzginjPipIMZ4vjbWMXYGAV3iKedY60hm?=
 =?us-ascii?Q?5PLG72HjlJNJl689SEGj3YAGS+ADqSDJGrUBAbOKxcQX93uWZ5Mv/GG6hXsg?=
 =?us-ascii?Q?ndIZTcBhkWzFt0sK32dnn82EK/73qrYwhaQqaUEIioE3LoRu6PljYC2/FIea?=
 =?us-ascii?Q?wRhRe0nov+a5nTAi4Te3wbvKrz8rVXNnsHsw4+L3sd8bCO6g2rj4W+PiTdtN?=
 =?us-ascii?Q?qIkATKSgrqPGFrshsva872KQuHsYXIF/JFOFtSETuO+BeKocSzwm83eWnCrH?=
 =?us-ascii?Q?guy1zyMSTceoAOljfimQQT0QkKUWgKhtAZcYeYe80a09Zh73tOBgjfGLHloL?=
 =?us-ascii?Q?KdufGNUN/C7k6YNv7jVvy8o2aTrjN2LVCDZyPbYUZs3Zd/Visj8WVpEkiDoN?=
 =?us-ascii?Q?60qtQ6GWnZdiuvQzR0XFRplJdAKYFo4hsZmeLkd10TZSeQOrJP6qteHC0Btd?=
 =?us-ascii?Q?SciJjV0sZj3vhToHKDElbAtS/uTqaQ6awaCfDMHXnpebAdqWD4FULZeY2Kkm?=
 =?us-ascii?Q?nhz5o11NUWGb+TVe0fVbnRv1TxAbaSg6R+2IVjwBVMuSteh68qNEwnA4I1hB?=
 =?us-ascii?Q?m7e37ULl3Veic7i4at0spMSXVsaLsUlZz7GuTrI3fa0YjHR4Gu0JzG/b2gxa?=
 =?us-ascii?Q?3f9OOkpZDJafgXknGyF0BKpOjJnS3JpusRIWVosl086nibVt4d68?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eee6c0f-ad42-4402-3a77-08df158d7d62
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 14:02:35.0254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +sLRqa6OsGKDYP0mlYGc7IaSiEfnmT/s3DEPaanS4ASrE01ExI37uDymy38+7Dvv07CEhUtUVNoeN4kE3DjB+g50KqUAG0zfG8R9gZ/esWOD5RGoHiPvhvY/G2PWawB2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7575

From: Frank Li <Frank.Li@nxp.com>

DMA engine consumers must not call the channel's device_prep_*() function
pointers directly. Use the standard dmaengine wrapper APIs instead.

Assisted-by: LLM
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- Add Laurent Pinchart review tags
- Remove unused varible dma_dev (sashiko)
---
 drivers/media/platform/m2m-deinterlace.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/m2m-deinterlace.c b/drivers/media/platform/m2m-deinterlace.c
index 9dcc4bd6cbdd5..6b07018614894 100644
--- a/drivers/media/platform/m2m-deinterlace.c
+++ b/drivers/media/platform/m2m-deinterlace.c
@@ -211,7 +211,6 @@ static void deinterlace_issue_dma(struct deinterlace_ctx *ctx, int op,
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 	struct deinterlace_dev *pcdev = ctx->dev;
 	struct dma_chan *chan = pcdev->dma_chan;
-	struct dma_device *dmadev = chan->device;
 	struct dma_async_tx_descriptor *tx;
 	unsigned int s_width, s_height;
 	unsigned int s_size;
@@ -330,7 +329,7 @@ static void deinterlace_issue_dma(struct deinterlace_ctx *ctx, int op,
 	ctx->xt->dst_sgl = true;
 	flags = DMA_CTRL_ACK | DMA_PREP_INTERRUPT;
 
-	tx = dmadev->device_prep_interleaved_dma(chan, ctx->xt, flags);
+	tx = dmaengine_prep_interleaved_dma(chan, ctx->xt, flags);
 	if (tx == NULL) {
 		v4l2_warn(&pcdev->v4l2_dev, "DMA interleaved prep error\n");
 		return;
-- 
2.43.0

