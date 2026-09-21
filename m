Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013030.outbound.protection.outlook.com [40.107.159.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7DB48489D;
	Mon, 21 Sep 2026 10:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987743; cv=fail; b=b1V5Z+Y5Z4knrKdWfpabOiIhdCrbGUKdbgaDG6e+d/x/RiI+tNL/ejq/whwB3adg3I+Ta5QgZnWm+eEdsylV7DLKCbx2m8ZBINUNYFljjsQLtMsjEZxDAluaPYZ3K1Lrtm9MIr1exXBBM0Q6tdD9Uh1SjAGDmBGZZe4jVBfEeG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987743; c=relaxed/simple;
	bh=M7efeJN+NfpmQC/N9EP5qwZrBQRbM8zxY6pmdnRIOtk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gyW8Nk1u0MNxrQQpHKUTjQMrH/Lq/Zcf76G3Adi1HX4vi5rd26tc1RuNC06Y+6PxC5299jUESxDecJuC8ZcuA2Ec0Y1Ms1m5NOX/LsT7ZhjXEpBBoJonEYUxjaZXRNqUWtyCQ9ROW4tXBoHJsqBH1MoZjfJ86JkkMk3bt2BE2Aw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EXgH7bpx; arc=fail smtp.client-ip=40.107.159.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EXgH7bpx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ajdRPFCVtZHXyJF6uGpl1br9u0fMEbqMY98kdLsJ0G34qzINB6Y2ghKrbAj6FvMwKcxl2HMU3EqoiXpODPyT2ti4SklFFXh74qnOUfFMeEYfWmAI0jqabvvKDN1NsDwT0c2MRyI+3CW4kBcRgwYW7SH32mn0Ev6Hse4BG6H9bW32DqeYgMq5/13M8WTRklEJsoVPF9ZJcD8H2MVA2i4Rgc6T7DQPGS+nnasQNYbeXXF4EOtD2DNQDUlHyJcG+FokMFuyJueRmyUuVrhFVMj7Uz7CNb8LBeZ9Ie8GhmpX5qMMfJFHBs6C70OIs9XRWRXQykHkRa7yfpmFOwc7Smk4xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/NMrkafjEBFNsq40Hn3bJwpoACWPVL63dt2s0wQ1AoA=;
 b=WgbGQJ7mmH4iQttY43Y6j8YJqbOmWotx3BLKo4YNq42NQ4ZuL88WR7uu1jMd+1q+fcUL+S8vm5dcp8zzI1wDsuD3vaBp330/rL+vK5dtDp9hcn3vp/9wEYHGLxtT5DzcqE5lj6Xl6ZD+Qv/48WCzmTYeAJKqD4TP+9swWZ1cniLclqyG30G0JW+9sRcZCpyGYfxInBa2lqJxB0cgO0qfHjHPERxgWYqhttmuPHdsqowBl4Apra0a4HAHQMqg8OWJUGGZcdDrCKBTDZwTckn7yupmAlHqjn7iu97bnV+UZGmTfM5fRrfXwVIUx+mf8i4lO7PscdfVmrJXIOsjwPQp5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NMrkafjEBFNsq40Hn3bJwpoACWPVL63dt2s0wQ1AoA=;
 b=EXgH7bpx47aoHzScOfKPp2UHmzaPClYo9AW4aIzZAGH1vAP6X43iB0MxdLsrXGODb1onn419H+SgE2yJtrygb+xfht1gOf3DDECuaXLItjEMFiol8c2YvuvazUDN8TyRKnefHMzyUqm63rc7rzGByey7Hsy3fOdNp2mTc4ZGyauGOvfa4GOedYK/x4V5UkREhcNYpOOSIIzNeZMOu21OCZm9ttQZeST17hejRYWnvBo89jBEeK/ear8pVDko2cUyxAOFdeszYfqikxqbWsxRKRBlTpScjog8k5HkzhPc6WSXdagfBTJimDnIdw7+d7wC9bsFtXZub2sgaY3kjP+3Dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VI1PR04MB6862.eurprd04.prod.outlook.com
 (2603:10a6:803:130::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 10:48:58 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 10:48:58 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Oder Chiou <oder_chiou@realtek.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH 18/21] ASoC: rt5677-spi: Free the DSP context on component remove
Date: Mon, 21 Sep 2026 19:46:37 +0900
Message-ID: <20260921104640.1941554-19-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
References: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0153.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c1::9) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VI1PR04MB6862:EE_
X-MS-Office365-Filtering-Correlation-Id: 04009766-a205-499c-dd93-08df17cdf0b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|19092799006|366016|1800799024|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	+SOKe1zCmXAmUvzPteRuWzCpewcNFfC0DHqaH65ILAAve+UxxPABoVlzQyHXrxHoQ1Pg6OecJr74SO3Lh6u67ACm418vFHAmKIUY4D7ObkkAntRhSuP73QhlbB5A8tomHIcUCfMCwhEqdfv9Tvaj8J3TbatMKOLRCYE5SeS86bUxcapPn1L2WaqvaAoitd3wEn2FqM0XDDILXLaYJa8+ScKD/+9aPI5m7glo7oi4oBoKJi07BvSSEQ8FANGD8cn/maL+G9gYrL4gZeHvbtvSTiXqrWe4bmhfSNnhYSn6JJkGamJTekuTVZh5/PAc5deamktsj7oAAVqeDGdBu7NGHInpXxni5XrfUQgmrrg4Us4AacPeeWVIe2Hun/XoyXf6+R5meFN7N9syMpH3U8NDH63TkGqYQuHDcRNgg2WsMO7fgpFHzqmgDjdYFEbfhMvoPJqC7JBi6JV8CB0Zh+Fl2uKNP3LVHw+ZgVfwtJxKaPWpjervOClsDL44g7EaHpskluxsBllh2QhjN2Yqod/qw0NQuHU5YNymmNqRDV1RWglOBWB/8FRW7jN9EGPgZ5z9kluiI/kNnewBgoGXJNr42u8kMCKaSP+q47nHMWpqto7bR17IJUhANq0xe/i/Wx1KbiXZQul3HS6AnCuyTlD1eXUZ+CbXyQfpt2PlKojrrI8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(19092799006)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oCXeNMEpxFWpkvqORuKREPHgRJLlJqaxKIqUEAsx9y3x09crpsOtOUd3k70C?=
 =?us-ascii?Q?ooTDSeQsE/WaxNiPMVo6fhtmrIGboRYUdO16ZcSc3i60TYRh9L9xQA9h7Lwa?=
 =?us-ascii?Q?hkMsxgW+GLW1FIH5xcPvnHx3xyHpo1EizBE7IJ4WV6n6WTGypHkoVTzjTj3v?=
 =?us-ascii?Q?5JM+xunLZ64F7EtLYPr5lvvQZ8wKz7i7cIxxVyDrt/+I988hyOaDjhtbvlgY?=
 =?us-ascii?Q?aohCaHd6UvA1RVeZ06Fa1poLqwSkEYbrQZ15zJsoOssexdaAvFy7eDqi0nrU?=
 =?us-ascii?Q?x/t4ItGMp2YjR/afQr4Ifq71vXPkXk10tMWRkD71R1MHOATfU9HixiXtB6T7?=
 =?us-ascii?Q?+Kbfoevc4lmt9gOv84051TDrPdxHcdh2V/zZ3rTEM5lXea8xJTsVhS8iwHz+?=
 =?us-ascii?Q?ui2/0PzE/PqOBt12cq9DkZYV7Mx9UV7Ea9Fh+aKV7qJcxd0IGY9hFy2Mc9Gw?=
 =?us-ascii?Q?A27WZUpemjubNwh2WNiEw7/GpFdh3GSQcBh+wM+MyTwpWUfFKrkEABbp8+o8?=
 =?us-ascii?Q?iI+oPKFZXhmz54bZ4LBS59DYfMc8BOfWIQ8hzffaz/rriDpLbJ7Q3BICFrM6?=
 =?us-ascii?Q?A3TfabPhIeU980UAlopmKIzzaQ4SKHjfd7GjrTwUmkqjj5dIAtV/qhcoVJv7?=
 =?us-ascii?Q?RxSreySp2gu1fyHErL6aCwFMFX/Tbz05TRkBMi6CCAcvFDDLQ+m0gWMN8RnT?=
 =?us-ascii?Q?HT91juCyg+fRs9ntCCCNvAs9SZQfvZw5b663gzq3/9DCPnLkwmCb0P/VVPFr?=
 =?us-ascii?Q?VDIUBkRaV1le20W0TziPbqCsZtC45JtOES76GihVJHZ6Zq7zyYNbrjPgDiHY?=
 =?us-ascii?Q?1wp5ZA87EMiWcJx/KuZ8Of6oWvLxPOaSTbY2nsP/ufO0w9oT2RvTFDiDQwGo?=
 =?us-ascii?Q?QzROP4nbIfKoYq81/N3SQhRlnJQ8ld5zTDpxmtbfoHgvrdiQ4ozWeG1+ugAY?=
 =?us-ascii?Q?2wPmqxdJtzkErWvXsU7ro+BDK7ZJV5IASdrm5ImZHBBIVwceT0YQmDftva4j?=
 =?us-ascii?Q?+ckGtEZwYHTQMRZm7CpMMf/GqU1ylrnvW8wO1A7YMK3nU3e/JfID4li5UlSE?=
 =?us-ascii?Q?lJL5XUtctHEGAkhPggswL3Qbv6XSOaU0X15JzLEwNCEeQBnv3UGRWKV51n4m?=
 =?us-ascii?Q?XcE8lWfKJ2WLiUIe7+Z8bmB0LiH4+f2IOIhO52M1LFf6C1JquUNb8pahq6M8?=
 =?us-ascii?Q?40T/p0Qi/T+7Cq1onzIe/YzxP6bBDzLby11wzXppKssjA4VI5cHdm5ONMyh4?=
 =?us-ascii?Q?+3A0et2JLf5hUOSVGeeCG4qRyr8G3XEgh6INO0iUQ6GZzV6t447NF1AGMAhx?=
 =?us-ascii?Q?EAnI+1xIJnblmv1vX8BJG9B0xiE8uxxzS4kDAN5KGb00m2yyirQNoOxuDxLa?=
 =?us-ascii?Q?FCx5wZIMLni0DK1/dvGe+r8WLCD9ZfqHBiR9rRLXb2Fg3oANRFzXz0ovqEVU?=
 =?us-ascii?Q?ZO7/OOIVxWk7/2DOVFDf7KPfEEPwnaLtIu30raWQqMImimwnsvJntNZHrGkg?=
 =?us-ascii?Q?PGOTJ5Vz+04gikfxtYs28uaYrgUgvlMycZWoD2MxzRSq5vWvHN4C23vpVn/R?=
 =?us-ascii?Q?tMBm3gL56vjc/07rI/edrUcT/rvEDQ9SO4bCXXIuuR2WaRLMat88hm+2nA4D?=
 =?us-ascii?Q?/ymwe6k00pLCntQnkycKbLnwx1UkChBOf0o4gmlrOf6SUNdbUS113U4rVuT4?=
 =?us-ascii?Q?/NMXkVyjy9ehA/qhLTovbEHo7r8WkSJy4drrE59kb4PrYaHz4Uz3g97aJaOC?=
 =?us-ascii?Q?R5JhdQpE5GzFLviOhP5OBw7ZNQ3OU1qldJowM+WsL4qZXcFwpK8V?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04009766-a205-499c-dd93-08df17cdf0b5
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 10:48:58.8349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BT8Hfsc9fhPFg2sCYN8pwQckQJY6EqftCSDcIrvnU3I+KH5iFCsh/cZheeOAXo0CIZwq3nm58gVxMN5kW+bebJwO1EedhSmNeN0gBeNYt6UMAX2y1K1WqymsYfO5KBsH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6862

From: Chancel Liu <chancel.liu@nxp.com>

component->dev is the underlying SPI bus device, whose devres lifetime
follows the physical device's probe/remove rather than the ASoC card's
bind/unbind. The rt5677_dsp context allocated in the component probe with
devm_kzalloc(component->dev, ...) therefore leaks on every card
bind/unbind cycle, and the delayed work initialised there is never
cancelled on unbind.

Allocate the context with kzalloc() and add a component .remove callback
that cancels the copy work, destroys the mutex and frees the context.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/rt5677-spi.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5677-spi.c b/sound/soc/codecs/rt5677-spi.c
index ebc527115ea5..285ea4872cde 100644
--- a/sound/soc/codecs/rt5677-spi.c
+++ b/sound/soc/codecs/rt5677-spi.c
@@ -380,8 +380,7 @@ static int rt5677_spi_pcm_probe(struct snd_soc_component *component)
 {
 	struct rt5677_dsp *rt5677_dsp;
 
-	rt5677_dsp = devm_kzalloc(component->dev, sizeof(*rt5677_dsp),
-			GFP_KERNEL);
+	rt5677_dsp = kzalloc_obj(*rt5677_dsp);
 	if (!rt5677_dsp)
 		return -ENOMEM;
 	rt5677_dsp->dev = &g_spi->dev;
@@ -392,9 +391,22 @@ static int rt5677_spi_pcm_probe(struct snd_soc_component *component)
 	return 0;
 }
 
+static void rt5677_spi_pcm_remove(struct snd_soc_component *component)
+{
+	struct rt5677_dsp *rt5677_dsp =
+			snd_soc_component_get_drvdata(component);
+
+	snd_soc_component_set_drvdata(component, NULL);
+
+	cancel_delayed_work_sync(&rt5677_dsp->copy_work);
+	mutex_destroy(&rt5677_dsp->dma_lock);
+	kfree(rt5677_dsp);
+}
+
 static const struct snd_soc_component_driver rt5677_spi_dai_component = {
 	.name			= DRV_NAME,
 	.probe			= rt5677_spi_pcm_probe,
+	.remove			= rt5677_spi_pcm_remove,
 	.open			= rt5677_spi_pcm_open,
 	.close			= rt5677_spi_pcm_close,
 	.hw_params		= rt5677_spi_hw_params,
-- 
2.50.1

