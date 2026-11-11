Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794417772;
	b=G0QGSsmrxyJ/LX6gh3nOZplTgCJKDs3xDDQzYDwpdbTGpj26wTHOzepan6UdN9/GPO9b
	 kBWC5/i04bz/tsI8cdP4gUSXmDCdekBNBnc82tDI3TmXJnW5CIQlcoUHlwqphrU4JQTZW
	 V7p/hriSbeavUu4nL8FZQJZYc8ZFi2N+gH2zXB+ASlRvC34NH9xa11NcugO6kWu5NTTQc
	 y8cgegxkbo54jokHmR2UFwtVTfXCHfIQ7SSyXLYiNGI2t8zh5/36rrqHzX9ldb8STJT+v
	 9jQHAra+4+1Exza1tbdlg7VoZNGmIQ4bJ6qUdqXKuKriJyzpuO7gfyC3b4k0neblHDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417772;
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
	bh=FoQpm34+4/MGXQkByEg4Zgpwi/vW+obpD6WlXIuUk0A=;
	b=gwfp3jjxyHpj7PY2/LD6dYdBfFPwzpjte7fI1gMutegBvPZ7NrVVpm964SFaumgZ4/OL
	 5TpNOzJGGEmGvSflEpCWrk5n1BXFwycf1jogSfdwmY41AcbmhtI2/atoBo/bGCvZNaeuc
	 o73j10/7Wem+3ouAMRvB8Z34hoRQT/U1x+YvI0tFPDjKVLsFOpqWlaMEWq7AwgeR4kU12
	 vuuJeMMb6OoE8YSJZlYxRUrBXrntlujwuk8gM9OanTKr+IB/s6UnT7ObpLtT7bnCa30sd
	 yIza30vZeMPegTY9QObzVsOi1YzuGtbyAE5HdFapbWxiOQWWJFU9KsH6gp9ouin4odA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=jSXEd5k6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.13
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011013.outbound.protection.outlook.com [40.107.130.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B0B606A324;
	Wed, 11 Nov 2026 17:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35B0B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=jSXEd5k6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cn0fsSfSPA5dbGYGpJGfX6TyFGXaT6AmfOs82VxCk35MBXI0DJ07ZxWBwlWZ06D5SXjpJS8epS4ToeRgsvEDOtrQdKoPCvIrc9WOzA7bHtzW55ai6HgelOH2rCU0miLGfDRONhDtipCQiO8q/vbULOhbYZqfjuNjjrvX+0XMRe8k3n4em83CcNWAxxEJxajWok7Vj5YoPVHf6uBbPWMnXx0UFMzwqOwavJk8tMP8Qax0VtISp1CHjqoJaKb9UWMpEJkedZqUqelT+4TQLahNXw4XerBnsbjGTs+Y+rXFeCpXLYetB9A2O54OCV5ZpajP5gO68lYXQS2892Vy9omGeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FoQpm34+4/MGXQkByEg4Zgpwi/vW+obpD6WlXIuUk0A=;
 b=c27k7TU667jWlncJXzkblbPfofaK8WEGpBCZL6OpMuru4+zDSQ41tZlTmUPr2PiGmXUKxS2AFGBeygXleknzfss0Iu82Op4l5QVU/vunXheQyk13qLCa5D/onrO0V/NFJ6DAB0hNyYmAx0xB+ZkiR3QWAs07CP111vQaAQoziCSpKcZBE2mbUirRsj1PHwZ2sBH4nlftUOYtPWjFuOCJrGr7pPMQewHeGIs7i4fEUc0uexMvwBJ3TK+O8PCXTlsA+nCD38I4VexGzxQXoi6NqD6zRwbgI9NM/MPmxoWkCzXFc4qzMSeRxDy/SMqHr7dpfl1eXjFnFU+CwxHG87GxAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FoQpm34+4/MGXQkByEg4Zgpwi/vW+obpD6WlXIuUk0A=;
 b=jSXEd5k6//BAqS3yoLpPkgoDYi/jB3u0c6Pyr8okV++i28iqRUNLGlth99Zad3ha/1cn6oqs6v4/bKSJjS7m7aI+dq6hPBIZ7WrGTYK66r3VWT3tcZ9ejF43mWK0N5P//kjJHyepa9My0Wb1/R5OChS8kJWkel1xQuHTaq5WT99SoM61xup+kwJbNzmpb6l/bLXgvufAyhHe4IyAz4tLj7317ez4DVYL621EydwwAkt2jeAygrVF26xnizjZjdeNYMCjTF+JaPndDh3vaKqoIqlYRPhUiT8DFGohkM5tGxxQieJgFNgyQih7JkUjJ2/jQquI+4GA6M+euGZXaTNkLQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DBBPR04MB7882.eurprd04.prod.outlook.com (2603:10a6:10:1e7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 17:22:48 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 17:22:48 +0000
From: Frank.Li@oss.nxp.com
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Xu Rao <raoxu@uniontech.com>,
	linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] media: m2m-deinterlace: use dmaengine_has_cap() instead of dma_has_cap()
Date: Wed, 11 Nov 2026 12:22:39 -0500
Message-ID: <20261111172243.3440103-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR03CA0242.namprd03.prod.outlook.com
 (2603:10b6:5:3b3::7) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DBBPR04MB7882:EE_
X-MS-Office365-Filtering-Correlation-Id: f5c37835-8c0c-4c0a-0538-08df4018688f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|19092799006|10067099003|56012099006|11063799006|261026121527099003|261021121427099003|261021123027099003|261102123227099003|261009223027099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	iKDDA2em0liSwbm42cRHG3JOcyvfM5pHnLg+bW945+eRz3s2BDC7vdODHQUDmrWFnvPUxxGp4IUcf3YIiDW2mmbYLtjZk3E9MsnTwhwb3hDzmgpQ3/bIF/1TyEbZYySelEZKyBGkZyJxSxPN5Mi2FtWsZtG3kfwEho038fHPpMTJLyixiAKRkRv5Z8jK+mfHtUX9CQE1df9LG6DmTwq8Pk+yjYI2krHAPykUV6nrrT7MlEPGFEyvz0GIWFr4xwudPxmm/dWhwqp1RDAjes90CrRnZqWyQS1neKrSR9+AeiS60b7/Pp9bVr5BzCbMGvK92VtUoY02T0Oh3OVdHZZGkmbyrOYUJ+LSpmbTEIma5WBgBoFjRxifU/tipEFFJaYE71ypm/2I1hXhD8uGaHVGRf65ZBXWAPyWDf1Z1zxr37HWrO4yoH7vKMdex6zsUbkfgWK8GAOT8FKhlJ/+8ZiKZywKfFeDpbY89qY2d0255/+CxH78n+gKfJV2ojvKvhq/UyuTfGXKkEPpL/nOTorpLvOPWeSP7T27H79Fw1OdTu37Z0YJ2WU2qb0AH2K5OEPAoxihbMMHI1rHcKQikCJVC8dFLBZluVyFuJjbd6POU5icYwMwzhCvbmUQNMXvBsgTFq8sPNo4atpdtIgWHnhHIkJXL/ptQc5oYK62XGuGhzY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(19092799006)(10067099003)(56012099006)(11063799006)(261026121527099003)(261021121427099003)(261021123027099003)(261102123227099003)(261009223027099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uFz/wo/0/W0lFnrl2reWZRwh/ptbsqayghloAUpbWbVq+g8LfEyxZ/eIoSp5?=
 =?us-ascii?Q?r1u9TFZWuGmWrGYqjCUopnXPtbyW5daiBMY0w63c8hCVlYFfv4sP0Wvh2Hsr?=
 =?us-ascii?Q?X6oPMhtMqlo7Mv6sZtwU3E191AqD9GNiWufhkx8xGqMcZ2QaXFcdm2PKL2np?=
 =?us-ascii?Q?pxM2+R1i2WxC6XNXfPf34shKD1/GynKEZRQQdu9xTcjaOr7Cg0TeQ6jnOkGB?=
 =?us-ascii?Q?LvIXn/uNfioweuU8IvoJTvATtqGgCZRjIGUiRIef3TVnVI8z969opqulIme/?=
 =?us-ascii?Q?ybQdtnuMFBbGFIAQxOnD6RZxysbqLBWJprEj8hmZS0Y+L9qj1WcxdnfHmU5F?=
 =?us-ascii?Q?a8aecsofRu7fBksnFwC+CkaK8KJNMOVy1ZwjWmWfTOebBZBucUsAoPRRTeOQ?=
 =?us-ascii?Q?OnNXLta+HSxUkr/wUrh7YVXMmwUIB3EzsPQLmHPoFzG2z2RSQFUjmNn6/LkE?=
 =?us-ascii?Q?4nDyxusOd3m3It0J2jAufIhJsIqyAWtw74MuA3s4gm2Rebn0aAVvQ2jo8b0n?=
 =?us-ascii?Q?otBEXkEthub2DTpdIG7AEYwIC/gM5i2vb1A4jBiMSrxJ6utrbdrod1mquluS?=
 =?us-ascii?Q?eVROKvtbBSfShyPZNrlz7GQCy9muXxk067+KZ6yRaeFSFxDRhDQJNEiuGa1h?=
 =?us-ascii?Q?a7ja9JSyMN+KPy2bZVRg01RM16OJ78vKXi8coh9+Mj2si34/+pR5NzCznf47?=
 =?us-ascii?Q?4LTEf63iPnkaEx0lvaD+tjob4g848Tlgu3UTrFQG82ti7YET+hgMyetHhJW9?=
 =?us-ascii?Q?jXQG5CDM/cAP+gnHR3RBhH1xVV0TA/BstDAMYkPprKwxkGhnhddqnbOkAbd0?=
 =?us-ascii?Q?iMEA5SwnCETIT7+qpnUM7Aka/1hyeFpIhTIZU7pflEu61XboKHnhBgZ06bYT?=
 =?us-ascii?Q?VUSy2JkkyidJ59lAD8GYaKnj7lEuOhytQokm7atBoUfOJ8dfAeXtYxdpiphi?=
 =?us-ascii?Q?tfCu5dhZtEezM7cfyGQtvpYWp/YwtLAnSOt2ZR8YcCyCLWHchiSi4FGDkSz1?=
 =?us-ascii?Q?6mSw1qjfs2wesg8gUaq4x3dZkLIeWBtCqZRnG+AgJIIp06RKTMjccoUPIttm?=
 =?us-ascii?Q?Xfg/CDWe8ZhiewwzODo8iXcwwXwWIG0wajxFIuAfR1XHPeYXZZ5SkPjvoquD?=
 =?us-ascii?Q?xz4+uGNeSGelmye+kos8BCSO5qcVvafTl1WLoGyU2kp27OynnNL3Zbb4evrb?=
 =?us-ascii?Q?GTkZgbW25OfNWKmvuxthElbW+1eQAQMm2ZYNhe+DUGi6mTH2Pnbj2DUV14Nf?=
 =?us-ascii?Q?HdRlilNFS4CD0uaPlq57X6eEN+dK+F7O6nZy9z/auudLlbHnSp/Nz6J7Wks5?=
 =?us-ascii?Q?hVYIuaGSl8LKmzb+Db+W8tDFjTv/8/17UrOR/R7+r3/aGwTlKSmXMsI6nbzT?=
 =?us-ascii?Q?o6dikqejmb3K6bjbWvEE+EdSNjUDA0rlg6WJ0wOSyMUM96H7P2enCm1jFvOJ?=
 =?us-ascii?Q?1L+q1Bg4RD2diq2V3nj2VPXsTDt0MiX/OzmsfIV3GIG/Yu4IXsNvE2R6Q3sy?=
 =?us-ascii?Q?mUzX+vI39kZM9FCTIqbJ81Fki3oLnq8eHNQKm7gQL4+KTdDc2aY6DZ4z5Ce4?=
 =?us-ascii?Q?kGeHtWMpTJyGTg0c8/lj8Ydf0l+4F5eu1PPETVzbam3opEnjzIICX3emDnRS?=
 =?us-ascii?Q?eYrj0/l0McNd4D63osgYhselNdVi7GaMFwRkvpaFrHJpkmH6jIsAbHsNrFtA?=
 =?us-ascii?Q?tDzVpCKBvI8qVPNT82RmJqCEt1kYghccytfnJam8GJ6foPULSwUyldtGDF4a?=
 =?us-ascii?Q?z5lMAeigtA7KLmOelZrdiP7atj5EgDg=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5c37835-8c0c-4c0a-0538-08df4018688f
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 17:22:48.8150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wHQReLHMdjjOv4GNThcUl7Q31IBVJRYpKYSmpHBf5wewnY07WMVOXsGaLdQaBdz9ilczj8qXrTz7BLi0OyRurce2hajvBLvH04bg0rC95yMaX7he2kw0DvCpcKsdipAa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7882

From: Frank Li <Frank.Li@nxp.com>

Replace the open-coded dma_has_cap(DMA_INTERLEAVE,
pcdev->dma_chan->device->cap_mask) with the dmaengine_has_cap()
helper, which encapsulates the capability check and takes the
dma_chan pointer directly.

No functional change and prepare to move struct dma_device to private.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/m2m-deinterlace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/m2m-deinterlace.c b/drivers/media/platform/m2m-deinterlace.c
index df291b5f7501f..33f05d2baed6a 100644
--- a/drivers/media/platform/m2m-deinterlace.c
+++ b/drivers/media/platform/m2m-deinterlace.c
@@ -924,7 +924,7 @@ static int deinterlace_probe(struct platform_device *pdev)
 	if (!pcdev->dma_chan)
 		return -ENODEV;
 
-	if (!dma_has_cap(DMA_INTERLEAVE, pcdev->dma_chan->device->cap_mask)) {
+	if (!dmaengine_has_cap(pcdev->dma_chan, DMA_INTERLEAVE)) {
 		dev_err(&pdev->dev, "DMA does not support INTERLEAVE\n");
 		ret = -ENODEV;
 		goto rel_dma;
-- 
2.43.0

