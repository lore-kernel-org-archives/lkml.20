Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794312486;
	b=RDPhm5d7d4h0en3H0EeqpDrV0rxt92QUyVABHTHZVinE+Mx+6+Weuwt7mVIvS2cfezjI
	 Rb/oT14QCohcK/Ugh8Xlw01K6xzrF3o5rg+Si3m0XExF4Apz80WWg0bUYgnMiJIoEADSM
	 pgi1xWh4XYg6eSuNFyG+9KPPBpC0VtnM+OTJCl5/UsbTMM3s7bL7k+EMa57lNmkMOi6wd
	 xusVEoUeioi3OOs3OIOCB4TPgQ25PMPTvhJgDZqkVALP+JY+l9pi0wCnbpm5VVeadth/3
	 Q+Y3zrj3vI62jAXI2GFOIbFmvK26SOaJf9zvAtZsDgOV7x33nO4KfPI0q0hkcNcBlOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312486;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
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
	bh=lQtjDmOf4HvGNDfw8JM6BBXWIVmK2tU0fOzh9RCq74c=;
	b=dxlWIN60RFtClAlSxgDKaugzB6geKXswVCN6dxsr2g6hlV5hNoX+EpDj05HPZgcgZaxk
	 np1mz/77UFpWItmz6rPirq2L9QYkFBsQoZ4uiVl6nVIOYn4MTuO8qxr0rIRzlWkKBAb94
	 b56A65cZyhVjVzIax9YWkJUd7zgFjAtZDE/O+5ZDfKnK4vUGjO3/k+YXCIdbLF63+FyoK
	 s24mMim73N6CbKm0Ucho1WN0HF2TGnyaygHF5ILSABkEPwPDoKOd6d7KjQzoQb0uoEcqM
	 jLs7r5x/F5u3EdzqRo22BWzrScinCxqD5qYjrKy7uKJES3+CfJzCGKsMoXgbC/q0xNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b="aMn+c55/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.13
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011013.outbound.protection.outlook.com [52.101.70.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8FF606A332;
	Tue, 10 Nov 2026 12:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED8FF606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=aMn+c55/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BZjwjS+qa7P1atvj3e4fFd8xcB1/OUDmQVX08uu8zlFWLVoco7Kkqd9iL8EhujhDQcpTvMd1yO8fyCB1tD50jRf/dGInBo4UTOMeN5Oyp8g3tBSmGTv6QQsjKr3ZUGh3PaBrVpBHklPRsXRMA3xqP6D4FMDyqsH2PEp8ZLMmNlmoe+9yOjW/omQyab/9QF1UIQwCKeh4dKBvLPpgkU13x0Y41rpnLWzRcrnJCHFrGeEvKP/ezAkhBixYL+LuRHv/oWb1x3aDLlrz/Dh8XhKvfPH+5FImOvXYtNa6QSJ52sVY5KQpo8086mz+yAkqEzCNaDJbhNXhhr8q9650iek0OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQtjDmOf4HvGNDfw8JM6BBXWIVmK2tU0fOzh9RCq74c=;
 b=sRWXcXa40+pICMFQlPGxVSrc+cSLc6XI2FGiedqj1mYLOu3sU0I4ruXosifsejPxHZRmmGJ2Wc+oviMt9Snh3Zt3jgfjpCRJeSh6z8vX5e+JxOfXeHBMmur2YYvFbHq1OlkHjZJvUxGBB09jY40qufbzwLwaMAqu4vnlRQk75iOohcNAfa9DweesJG4TkxE6v52oSVUP2YCNBjOXUiU9J8N+qQwXL+EPJyOvrinJv8dnzCfagDxWDX6igMdIYRjp40qAUvywlvlXFDuvPh1WvP9z4vCruXpRGt1G1kVuUAGj7ipUrx2ZkggwPE1usHdaAftSmdeHShH5ndvXCt9J+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQtjDmOf4HvGNDfw8JM6BBXWIVmK2tU0fOzh9RCq74c=;
 b=aMn+c55/z7FykaiO0PVEXprY0yeh5czmTLDfvm8A6Gt2IQM51fKbwAETUuAyy4KZOgtgizYY/TtHYOqCk8EXN4NYLKq13hguJBIpMMXazAiEtL26cFz+EHHllkUUTBOV/1fLGc842a7Y32nju1jfgr9RcvsEfn2bsGWAQ/b7kI5cEIOJZGu48wPBdAgPbX1lgZGKpuPtcVQlfutlFsm76iyliAEYNEj1/a/UbBj727ZgExEqgzUyww6p3Tettz4NN2VjPSx5vxjNS9QrksBjn+9Mqwe6Nmxb3do0XKSZPOaYfo/cMWFTx/RFH0CHcCvCBlM/8OYLsO4srQwP5cZNYw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4472.eurprd04.prod.outlook.com (2603:10a6:20b:23::20)
 by PA6PR04MB11832.eurprd04.prod.outlook.com (2603:10a6:102:520::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 12:08:03 +0000
Received: from AM6PR04MB4472.eurprd04.prod.outlook.com
 ([fe80::aed9:e8b9:c352:9ba0]) by AM6PR04MB4472.eurprd04.prod.outlook.com
 ([fe80::aed9:e8b9:c352:9ba0%6]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 12:08:03 +0000
From: Stefan Ghetu <stefan.ghetu@nxp.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Cc: daniel.baluta@nxp.com,
	Stefan Ghetu <stefan.ghetu@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] ASoC: fsl_asrc_dma: release DMA channels on repeated
Date: Tue, 10 Nov 2026 14:07:41 +0200
Message-Id: <20261110120743.6301-4-stefan.ghetu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110120743.6301-1-stefan.ghetu@nxp.com>
References: <20261110120743.6301-1-stefan.ghetu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4PR10CA0030.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d8::11) To AM6PR04MB4472.eurprd04.prod.outlook.com
 (2603:10a6:20b:23::20)
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
X-MS-TrafficTypeDiagnostic: AM6PR04MB4472:EE_|PA6PR04MB11832:EE_
X-MS-Office365-Filtering-Correlation-Id: acd0598c-2c3f-4d84-3bd3-08df3f234570
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|7416014|23010399003|56012099006|11063799006|22082099003|18002099003|6133799003|10067099003|261009223027099003|261028144727099003|261102123227099003|261021123027099003|261021121427099003|261026140227099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	SLejJ9DaHOCefT3dny7v66mt74Q4KXLTLLGsziam1mptrW9V7Sr9FXMPLgItZx8xzYHdcv8n8Hr75M5jbAatCzfw+GNXoI3BMXU0n7Gfwpf5GRekAUfOMU+Ki5FRXWO/Ve7pR7LpFwJmGtZOwLqT+Ih+xF4FzCzUBS8Tof94zZHjtGUxNSnTwf8SMrbQp52EOptViVvWVM7LGFKnHwR0qOhTiv9b6XtrQDD6Fvo9XR3bsDBLN7qe9Sm1Uo6p9FzT2WMEGMXJuLxcBNdgkaHyRqp3DjF2PurO3YWn0yAJCFJCAkSbEAxrUfOm9UBOwA5BzkDvj7TGQ2KlnJvLMyE/tkW9cW87oLVrOoWX/pXrQ4sFL5Y7n5cJjTOc9QCpFHm6mp7e8TYYsMydYRqUFEJI4xUxdCWMkCRvJHkZoe7sFgloFpyFbOclTdQHcj1eDUh5kplVjLsEPElEvYSTeW+myaXhm0SHko58qH+IXKk6elasLHsYe/1MJsz2zUJUL1F6cbY9yraBMKcwB+PwR6P6xfmp4VN8o6VuagSZPYOt0bBf9F69yI8tv2arD03wMoovyuo7bARQiAr7L7oaYhJ8MEFTslrhsPWdLuKS2sd0IJ9/71pHY4XdEt8WRi7JYwRsKQmivf5sdU+jFtt+hVGfp81x4BKl0Z6Oq9tSUla6Ols=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4472.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(23010399003)(56012099006)(11063799006)(22082099003)(18002099003)(6133799003)(10067099003)(261009223027099003)(261028144727099003)(261102123227099003)(261021123027099003)(261021121427099003)(261026140227099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?icaUr/bxpw9ir4OGjpOOZ9uUcPhbWMpLHac9DhCVvczsSYyG/QrRaYx8bq6y?=
 =?us-ascii?Q?lUNHp9K4VgYxRO8dyNm6U9f0st36GUlDac1DI/FVfGtF52D7yLsKWtDvnCl6?=
 =?us-ascii?Q?YQBmFHF7V3Enr9y764xyGhQzQcnFcXQzfOLb+x6gAhwR8KDzK+bG1pVgYEy6?=
 =?us-ascii?Q?u9ig6iBbGg4SgkzuB1FFeycEbEzjKsnl6Ypshb4QyIj41Q7xIf3FGU+XbpHE?=
 =?us-ascii?Q?9D1jkSsxP3ImYpYJbmpfbkPeS+h6970Maxy2zhGLhtjBAKvgZlJpr7I5DFZK?=
 =?us-ascii?Q?w+lLLYABNfoCmSiOUdiz/T/rK8e5IyJE8LqR64+lDKbUPeO7UAy26DZmlYO3?=
 =?us-ascii?Q?YQDvV53UdJmjnuNMtYSF3VhATo6xmxK7l1+WCTy9j2RNkC1xu947IMvRffas?=
 =?us-ascii?Q?/Qd0VhXxf2r+O1kuHwfIrIOQkQj6FCh5nj2uIoIfHNSXQ8eWFzCMqFlpCqxw?=
 =?us-ascii?Q?GGCFL5/FWVQl8xQzv1WLte0mMNKtj+ekmlxFsiyc55fWjwsZNyYY5kmqeHaG?=
 =?us-ascii?Q?+RqQA51sIgaDOf5Zc86mtVGEdSB+eunWxa8ged6NujHLSztOid0gV8Wyr2aA?=
 =?us-ascii?Q?DZcb+qX3ZYWJLyOXuJ8wqY6cJzvzIwMz65OsopTf2oZmPeD9Pr65u3jzpuwW?=
 =?us-ascii?Q?6nFHwqQseO9qBF09ZqmJVQN0YYWaU+JAbRiL2uepCc/Umyoo6Yifu2SbkjHI?=
 =?us-ascii?Q?ybChgXO3J1zmib3RYDJ1sODBYDa3BPMtGvDfPijccCdCxbjd/WVeC+HAv9PQ?=
 =?us-ascii?Q?vFiXzl1hwIVJzHGeff4TuwXSXJ+18L+KY1pAWOorC+yE+Ci/c1wZalAb/2UK?=
 =?us-ascii?Q?0Y2ccSJbXXgM5TT1Bqfbp516mZI7OK9XOH0ssGapa21qVUj8tGoNQWFxZt3t?=
 =?us-ascii?Q?/4MbgW+Z9xlymcuBgnTHuxThPE0ow+uMFSCUr6jRhKnoMdGek+nDegtNb0y2?=
 =?us-ascii?Q?2zR/7Ae8pd4mkX3GrVAQLLClgmuM4KRKv5NwQbZqbs2HyXk7p6whWm0T+LPm?=
 =?us-ascii?Q?OulEQVEk+tm+XHhnOa6V4tcfAiStX7LzL2JxgUsPL18tar1IS4auoX75pxCj?=
 =?us-ascii?Q?3tfPuC5ThEP1B4APwOLcj8vIIIIhXzgK328iJKt97Zy3aK0fXS74ppbc3EVF?=
 =?us-ascii?Q?Iyiw2mdoTwUzZIVSxTJbchQZvyadJlMYm88E9m5U4Q8y8mHVVoBDJfAsBdDa?=
 =?us-ascii?Q?9ERdfw9nLLXprrmt/FFB9ksWHxRc1vEMNQ8ahslaf+kKLcHCYh5N/XoflYGA?=
 =?us-ascii?Q?9225MFVEPg51aBJOwlh1JiLddLwJMYoKkEI4MJCb0sveeqZSTmC2R/QSQsSB?=
 =?us-ascii?Q?GHCfOf4sEfUUb10eHO53/YQGvw3BSKwuBlW0BOoqTionXDjoc8+hYqiL7fy2?=
 =?us-ascii?Q?EpqpdpnpV5kQ5SqRzbjCIJysI/Tp2pm5vf/Io+6/bPrnDyzlsethZuSGDndJ?=
 =?us-ascii?Q?u0pM5cH0U413s6pq3gpCAd6GLKwVsxLvorFwnaQc2zqgc0R/z1pUXBjDdTIF?=
 =?us-ascii?Q?r+ZMdtTOzbBVuegnHTVkz4Qz7OILAlF0jgvrbhHDyV8VJ3HWHsfBDjILysEV?=
 =?us-ascii?Q?XSA2Ogji0riDKBgzChDWZo62dDpZorfxzbc0tAE4KhFGWNkCgasieXlH76KQ?=
 =?us-ascii?Q?u0GGfp61Bzh9y4bwc+L437UM69c5Pz4HSd9Swasu4MxhwwQskBokThd0VsUh?=
 =?us-ascii?Q?pWbDKKB61DbRRmFSFQTxVfKg31w0SVDuvWrGKjPqQNIrI5iQpOWGN4LkLk9i?=
 =?us-ascii?Q?i/TE10b2tQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acd0598c-2c3f-4d84-3bd3-08df3f234570
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4472.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 12:08:03.2646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U8AukyTNFZGOp7ASnqiu1FpxGp/9iVmmGlR1Bf0+aTx4jnxagGKLq8HZ8VZIoVkSswxHyBS+osVlukxe1w4oig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11832

fsl_asrc_dma_hw_params() requests new DMA channels on every call and
overwrites the previous ones, which are leaked when hw_params() is
called again without hw_free(). Its Back-End error path also releases a
channel without clearing the pointer, so the following hw_free()
releases it a second time.

Release the channels of a previous call first, and clear the pointer in
the error path.

Fixes: 3117bb3109dc ("ASoC: fsl_asrc: Add ASRC ASoC CPU DAI and platform drivers")
Fixes: 36124fb19f1a ("ASoC: fsl_asrc_dma: Fix dma_chan leak when config DMA channel failed")
Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>
---
 sound/soc/fsl/fsl_asrc_dma.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index b417de6abebe..5ba4bdeff019 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -124,6 +124,19 @@ static int fsl_asrc_dma_trigger(struct snd_soc_component *component,
 	return 0;
 }
 
+static void fsl_asrc_dma_release_chans(struct fsl_asrc_pair *pair, u8 dir)
+{
+	if (pair->dma_chan[!dir])
+		dma_release_channel(pair->dma_chan[!dir]);
+
+	/* release dev_to_dev chan if we aren't reusing the Back-End one */
+	if (pair->dma_chan[dir] && pair->req_dma_chan)
+		dma_release_channel(pair->dma_chan[dir]);
+
+	pair->dma_chan[!dir] = NULL;
+	pair->dma_chan[dir] = NULL;
+}
+
 static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 				  struct snd_pcm_substream *substream,
 				  struct snd_pcm_hw_params *params)
@@ -190,6 +203,9 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	dma_params_fe->addr = asrc->paddr + asrc->get_fifo_addr(!dir, index);
 	dma_params_fe->maxburst = dma_params_be->maxburst;
 
+	/* hw_params() may be called again without hw_free() in between */
+	fsl_asrc_dma_release_chans(pair, dir);
+
 	tmp_chan = asrc->get_dma_channel(pair, !dir);
 	if (IS_ERR(tmp_chan)) {
 		dev_err(dev, "failed to request DMA channel\n");
@@ -342,6 +358,7 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 		dev_err(dev, "failed to config DMA channel for Back-End\n");
 		if (pair->req_dma_chan)
 			dma_release_channel(pair->dma_chan[dir]);
+		pair->dma_chan[dir] = NULL;
 		return ret;
 	}
 
@@ -356,15 +373,7 @@ static int fsl_asrc_dma_hw_free(struct snd_soc_component *component,
 	struct fsl_asrc_pair *pair = runtime->private_data;
 	u8 dir = tx ? OUT : IN;
 
-	if (pair->dma_chan[!dir])
-		dma_release_channel(pair->dma_chan[!dir]);
-
-	/* release dev_to_dev chan if we aren't reusing the Back-End one */
-	if (pair->dma_chan[dir] && pair->req_dma_chan)
-		dma_release_channel(pair->dma_chan[dir]);
-
-	pair->dma_chan[!dir] = NULL;
-	pair->dma_chan[dir] = NULL;
+	fsl_asrc_dma_release_chans(pair, dir);
 
 	return 0;
 }
-- 
2.53.0

