Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793649160;
	b=IJdO7R1ANdZOEof4J3k+aQAMmoONTUc/2Y4MPDWb4Xs7YUI2t4VOSj68Y/f2q7EM/w6b
	 8XiVLDa/iP0R3Gzu/dplfvXJmKVKi8IUIiJJeQxo4GfeMfxytukqI8c8u9GMOemHjgesk
	 jGAZE4bPUPEYp4T/UU+hjH761iXMgWqwonfOKoWRrJlBCIAV9ju41QWoxJU3j7AxNb1j9
	 SbGsxzr2Cgd1tXI2nbUeOH5kB6h17vfymM4sPCIbphAPX7LiGW8HoiURLy3Hh0lWgExgS
	 k/4OCOet6gtjDF4tWKTZ8q9XmmKm7RlBiVflfCqjGtyWN2FERu4cqiOhoQGqbk46ytw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649160;
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
	bh=X3wivh8RoVRyqznj0vKvpYqmlNEdu05DfkZ/ENPqJt4=;
	b=TZrgWI9yJZyLiFFpNMcgDgLKzVt68+S3LmYu/0sfs9iVnYnJcWIeqU7aOIBNLqmLTVfG
	 RR0V+6HL2Y6GkyTFstTdPTxjAoXvtkhW8rkLW71s1TuHv+OaI7q43vzUNgsXOM1nBjNmA
	 ICxIDeOL6PMEa4lXqAyGIFIp/TiqdRicrx0wPqkLJSivaTyXgJb3nXn4PB4zi+9X+AJSC
	 Oi1FsDqsB3WjhlmgFe1PATBJYG7YFWDphI5TlFC2RyQPYEI/AoedUKfDJrQDhDtbTGOrD
	 XH+kQCeDUEos9gmI57yhcrN2+YBi3C5bNdFy6I/5mhn/3k6OhDTxGYIRKkfw+L53UOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=UhqVvPPB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.66
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011066.outbound.protection.outlook.com [40.107.130.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD2E606A324;
	Mon,  2 Nov 2026 19:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCD2E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=UhqVvPPB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IHkLIccpdrBm745gyHEoR4dNMpWTvYWw1BdpF3ZYZF/hVu38dHEgqKe3Ay5bIIvsFmDHZ7ciVpZNPP/4S76QUg5qs1sAZ4wxhnh3cUiO2rvKarTvmgR6oG9SnvT0sV5EijCID3fNDQNG5W8FOPvVf6aKDRrOnT443UCbbCdDI0fSJh1luRsuiHjNfFVtGboYsYSpCTS8mTBtJtg5L0cVav0ksP/HRpFjE6Qey5mIGyiFt2LDLsF7q46knWnRcu8SCgubWV7phNd9tmFWq9dWOkn/3EeEBV9xMmkSM9rGA6QuqPr1jU34OB2ZcAqRsQwZ8cUQK7FILIm44Zw8f72qLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X3wivh8RoVRyqznj0vKvpYqmlNEdu05DfkZ/ENPqJt4=;
 b=XNZb/oNyxYGcXe48/XoptDVMqWuUmCpprAuJGyyTmfKahfQiLfRm8zZOX+7AHWZUSZCfO4d8Gv9Oq7bBSxPmuHxqGvi8nz3v5xN2bEaUoiCFrHqjsFyvKUiOE4DNtT8UFiTC3Vt2SYrn4J5mofPcZp7vAe+FA3CZl4+309g3JluBPoHuke2ro2pwgNObwG9yZ3Am05Z7paLuKs169cmEJ84SRVf8CHX8j6Deu1a09pWwfY4IqXnDWxtys7HM1cI3eBjrP1Nyierr1xZyeksPp9xHvva6HEekpY0XFe0nTVZKOfJQvRFo1AEttt8l7QFlkhDEqg480q1yPsE6wkeQHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X3wivh8RoVRyqznj0vKvpYqmlNEdu05DfkZ/ENPqJt4=;
 b=UhqVvPPBev5IZN/rjVhikQfiV0qqvsmYAGXSqsUn28IM6JY5it9k/ACO6ET0c9222LBZA5VEL8LzrLcFKkuBXkCIBidL/75I3T+ymebsB9V1RagrePLN6gEaAnNoSaLx97BNg877nGe9IyX76FWax86dHeCNKXVpDxXbd0CGcXtVm5D5T4vnIWWzKfnVW+6P1teo6R3dFLMTIEwKrs2E3ee6dRVX5WgnixiMAILuzGfBEIuj2nz65OahQsf0iDCNmE+pjPhKKebW4zlWkI8SgoXHzmlyD7YuqWdzkLfsvMxjQ5q9UB00Rlv9AROMYZZQnmksxU0DGHcZTyGLERxevA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB9282.eurprd04.prod.outlook.com (2603:10a6:10:36e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 19:52:34 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 19:52:34 +0000
From: Frank.Li@oss.nxp.com
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org (open list:FREESCALE SOC SOUND DRIVERS),
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC SOUND DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	vkoul@kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 1/1] ASoC: fsl_asrc_m2m: use dma_chan directly for dma_async_issue_pending()
Date: Mon,  2 Nov 2026 14:52:27 -0500
Message-ID: <20261102195228.4084438-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH3PEPF000040A7.namprd05.prod.outlook.com
 (2603:10b6:518:1::49) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB9PR04MB9282:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f63529b-2f93-44e0-cd52-08df391ad698
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|7416014|1800799024|376014|261021123027099003|261021121427099003|261022105027099003|261009223027099003|921020|261026140227099003|261028144727099003|11063799006|10067099003|56012099006|261102123227099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	5UF8j0kUKiveatyrwnLwTh/itQMKZHRBuboQBfsvokbIPEwLSE3Tggv2sj33YmJJJAFnR+0beIJX6MkePrE9GmupH8xiox6Psm/rhkTzVHlQnvT9nNWFVlU0UKOK1ji2QiYYYuySOhC+ji9eGpRh3An+DLbx2QRYu6YCvfDAovHFk1Gvh8yBB8rOgp/vkenPWCuYxGaxmbfh5TEkNq9h++emnBxbnjGhYjjCrbahQKR7HL0kpHOXs7l9OqZ5z5OKmpNmRNyWexJOqND1a8SLmZ+OrlhtLBSSKd+5+C5KsyhBaBS47ZOUsyM3LTY/phvnasTDxLZ0G0FU/oIxd0Wx1Y3Ji+3cB+LafpwFHbfa/LXG4WqQNyAic366W/Yw02svxn+9/6eZo5pHWZCHpmW58jFGyBVlAr4nZhaqyrloCp++vofPoHl8nmoFE8YTX3VDnZDWF7yqzXTRHrVtgjLwe+q6BaLphB8tuyEpbX2aOkU2b+bgJNioBt6NO3bGOaBjK5C70OgEHhK/zV53ZPZyMfr5trWL1NFI61zf1tUFtvc+KgEectOFsCJQhJGrJGSxMqkBZHVPTF+a0ietL1gSAbC//GOpyGkEdaJEhNKGYc/NcA3K49b5zi//Gp3LRiy2DVFUtHj40xkuAzsSlLJ3mmp18m9ImDzQ8ofXfS42pvOy51JwN0eSVw0CtuFLaBaeBZKOG/+TYa4lY91kzIgwWQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(7416014)(1800799024)(376014)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(921020)(261026140227099003)(261028144727099003)(11063799006)(10067099003)(56012099006)(261102123227099003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LOF6VuVQUFyW1fvMbg/r/DWwhec7pAiljwC/4o7ohzC/RBoRhpvZUktk2lOW?=
 =?us-ascii?Q?kK8vT3+TZSny+SmGxHU8XtuWxw5DP1vfFZBeLLQ2OlfLEolCOIpFvgwg3+t9?=
 =?us-ascii?Q?WxY05nW15oloMlsEa6oWVTVXtPVPteHS88G6TtPHxPpIbR1qvO/vwf/V00zS?=
 =?us-ascii?Q?/xbLrYC5pKNEfwm8lFFNynKeNB8GgQmnxVwdTaNfc1IwENI0Sci4dm+G3G8f?=
 =?us-ascii?Q?3FC9UUVK+BGZ7XOEXEazUD59RJRHQTIZrPlKwAhoZhdVn9mFgemlnG3m6Zz6?=
 =?us-ascii?Q?5y/ComWGPmjg1FCou/rVZl2/ooqU+z2UbVmZQszr3NnRouUbGvD1lPPD86kw?=
 =?us-ascii?Q?27mI14mkvm7vKSFB4gk6Qe0xZaAjutgtqV/+FJdePQT6ob7z8K8Q9iG3Ky0h?=
 =?us-ascii?Q?t3JYV2xWyIwx998MY6gN+Mxj0uj9Dy+iljP7oRo6zPowYklJBj57mQwAVh9e?=
 =?us-ascii?Q?V7BEs0U7y77iazmYGeySeE0QqBMO2u5ghClq3fLLn8Vw0N7FMd9LiA+KlB+v?=
 =?us-ascii?Q?ElCG/SP8E5oKx+Euvvw6fx7g4TucIvpqBXEFbk1x5uLzygiW3DHv3I/Jup+S?=
 =?us-ascii?Q?AHen/85vLS744S/p3dySCTcrwAHoMc/+WN+u2hrN804LvJtTDpWE3pymCpFk?=
 =?us-ascii?Q?oLN0UopSKn+74LrNVhV2A6ABvASZE9otOP8M7DbPvpKgCQWjiOYq/ZiDBSJf?=
 =?us-ascii?Q?aMAvt6uc9mZB/ubBPTLJugUiYzvh91LCw3PwzC5J+mgPP5ujEkswlQHEZjyU?=
 =?us-ascii?Q?8R8G0v6F6Ng0PdgB/QHHNB+A6oA93aLA5h1IVBENkMWGYo4zCs41/ZEmKpSC?=
 =?us-ascii?Q?bOdYYzEHyCm2jUJwDEd8HTIr6pYV1ro6FugkmUpcNhDNa/hXpCnznsGfTNCY?=
 =?us-ascii?Q?6BwjnUP4ZjQZjKamIPyh7JdrMfSB4o5qTMerlFUZ1xmNBvD9FJ6FNbxgABi6?=
 =?us-ascii?Q?XATEzDuK0wlJ3/mZcdNx81Mdmk3jDqrestRBAUXkaCv7uKILt1k/1XHGuWl5?=
 =?us-ascii?Q?WSR4EZ17kRWnmvG3cn6s1h28PyxU6L0mZcuqdYVX0oMVygnL+omRIIUgPzcn?=
 =?us-ascii?Q?GR0S7+mlw1ecl2CxXBZ8RQKUMggW6e75jLHp8N+kSYUEPhYcQQ5dyENjWflR?=
 =?us-ascii?Q?WOHBU+E+7LkSUxlAGI0vCXR1sJGlvXwkDS9v99Ea2TPhKhCWWgKjgPTIdnts?=
 =?us-ascii?Q?AFLPqqdI1gVLlNI0wv/HEfFrUYBVbYHLb+Ejyba9oJGIQ2LRQS1JFonpQK+X?=
 =?us-ascii?Q?3WccpuZNmmi+cxsWrihhRkm52xLW5zltHHO03MS3RoDwsjebmjwQ7Iwvd7mR?=
 =?us-ascii?Q?gPmYJ9DVB38TzqGeq2CRI4QG/hPi2p4szzf2Pg5D0YB11/nOAbJGLViKHWFI?=
 =?us-ascii?Q?FdhLwdEaxBGwPBWuzKXQoNctzeXoUvzSfL3qgjjfc1QMVzanz9wpalaWM7gO?=
 =?us-ascii?Q?052srAbfhZV8kMQsk2XlzPvinxbZo6daCHMenpuJA2nZszMwG+OvoLYUG7zM?=
 =?us-ascii?Q?+nVs6Dr8am0lXyRqDhfRyoSq///phcXwona36zy1Abbb0/8IiRVC3fRB08XV?=
 =?us-ascii?Q?kuDzG6Hkgl9xtjMd2Y7MlcexPqUEKVlN26lSQsZobZdIsUP4dhKkVcBgmqJG?=
 =?us-ascii?Q?GtNJxrtcQS7iWJkS/lc19x9U37I+hJk8zbcAmw4oTLzcbLdTaIUhKSMXVsmn?=
 =?us-ascii?Q?j8b3gGuJZ0oG2TI4yIDJI2CgV53VnnvMhuGVSopwSe12X+Ou/MuegLQTYV6b?=
 =?us-ascii?Q?hY53yonEPl0SIFQuTck+f4fkFsN+KUt4DzzTZ+plXQHvIXyDDjXL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f63529b-2f93-44e0-cd52-08df391ad698
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 19:52:34.2748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pr1+pnasqmQAlhRHfE43H2H4VjXV5rN8XgVMgV/M15TumpkEjjuCMARDwqwjxD0Qr/cik/0l8riXc6kVDF5zjif+wI25fgs9vE06hda9TDiErN5fYr3mAy8rlwsQ2Qzj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9282

From: Frank Li <Frank.Li@nxp.com>

Use pair->dma_chan[] directly instead of pair->desc[]->chan when calling
dma_async_issue_pending(), which is more straightforward and avoids
dereferencing the descriptor to get the channel.

Prepare to make struct dma_async_tx_descriptor private.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 sound/soc/fsl/fsl_asrc_m2m.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
index c6970a7e88f3f..796a78124765f 100644
--- a/sound/soc/fsl/fsl_asrc_m2m.c
+++ b/sound/soc/fsl/fsl_asrc_m2m.c
@@ -257,12 +257,12 @@ static int asrc_m2m_device_run(struct fsl_asrc_pair *pair, struct snd_compr_task
 
 	/* Submit DMA request */
 	dmaengine_submit(pair->desc[IN]);
-	dma_async_issue_pending(pair->desc[IN]->chan);
+	dma_async_issue_pending(pair->dma_chan[IN]);
 	if (out_dma_len > 0) {
 		if (asrc->start_before_dma && asrc->m2m_output_ready)
 			asrc->m2m_output_ready(pair);
 		dmaengine_submit(pair->desc[OUT]);
-		dma_async_issue_pending(pair->desc[OUT]->chan);
+		dma_async_issue_pending(pair->dma_chan[OUT]);
 	}
 
 	if (!asrc->start_before_dma)
-- 
2.43.0

