Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793720304;
	b=15lhkNkwQw6BzmaCqyJWCNS0swNS4domsxmeRrkghr653ve/O79EI3vOgfRnT0yU2LTI
	 dk7NJv2aFF6WDYN4mBWKhkGPmJ14msWCduZnfrCPRqIvQRZGxK9oGs2WYIrXFx/7f4MJ8
	 tRe/UiMtNjm8YtTe/x69jbBRC6lZ2hw3babzzRmjdWK0/hROqEiY0EMieYarpqpxHNEud
	 Bhgz2ScMqnEJBOH4OSQU7uY5yvwSaqDbnKsHN9+mNGhGS/ffaOPmeek0FSIa/fi0Zy5yv
	 7ulnZBRTZIlUxBtAuzS58G0gUcBkL9RnLI0keb0jX6cS9v0BO4vjyBwIQLEtpAAjO5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720304;
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
	bh=SV3neNdSARQ6uhplbKpOvnlkRhBVN1jBmQ+QEKSvToM=;
	b=SNAzJGbbNEgPOCynkG5U0WFvo5SfaDVhzX0uHF+Ftf9Kz1J6U3X++H5DOJ0M1WqO7aJQ
	 yK+T2qyK55/FE86XExY4fDIOzUJ4UdD5hWnz8pTGvDdtLaJk0KhCrag+aGT9fzKj6O/7u
	 IyYhbsLPFbjt99g7yB3Ue7NM71B9OEbnk/2SRDGb4WD0dj0Qc556v6t2N/+ryK0CJJnM2
	 eBo7inqjyN4hauhbGaWO+QkeiCc18sz4Dc+3in2hmC2AO1nMQo9OnfLvzQ1r3al4s1qCv
	 c2K9hcjroUBjh6LIucPSdXtCaCmvModxrpmbFoc2jFAVCc4DyNOt9HuP0v9UnGLzhUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=P566cu4S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.25
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010025.outbound.protection.outlook.com [52.101.84.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833A6606D801;
	Tue,  3 Nov 2026 15:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 833A6606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=P566cu4S
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rlIjEwHn6YkV6bWoTUq1fkgTOZ5AEsDg+moCZQfu6dZiyETZH8RRNszHV2JdFhgJCuy3CCYuKfKqKENVlz6b15VkppL6HtFmTRl8uwTOWvlhdSPfMvpT10tEgdYK4fD7Tw3pRlBJx6qnrMTjCGVJ89yIWJqbAg4D/8NHC6+Tsxkxb/qjnwEtXZR831Y1BHlsAJC5nLCPtYiKeJU73/Iomtja1ZGblxNRWgVUdOY5ST54WmynjgJJxQqvMG5HMj3yoXhYekaGfCrYFkFTcbGkQFReVlXORZh9V4CZ5qpwTvvLBTTQcGlrqBTJlyUES7TjlXIXafZU5dkXP13eWyQllg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SV3neNdSARQ6uhplbKpOvnlkRhBVN1jBmQ+QEKSvToM=;
 b=Gb9vK1vX+vRkpt+b1OCux0+H7Vg/L5JOrWpDfWkkdhQZddEjqRW8PeYB8qC+6pDaLfaxnZNfip7vnZaRYnUSxk4E4uw2GEi/xkwC1qQEl1xptntecvyDwPkfNP7ty4Vbx5u3Fuaxu9YKRiDpyIE7Rz7JMmKEd/oEutei0c3FQIMZ7MwLFZEuxYVIzfbYo7eJO+dnBUgbrActYhByUMvrHIaXzGTDQC/70UywrXBk9kOqkSQ3NOG2rU8RfNNmk97+ya4fo02QxatkDHorzNJjIsRbhiMACsGvC1q8zfq3wrAU1WBmRElP1p5UFgXjONoog6DiUnhtpScWQfDOGieoRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SV3neNdSARQ6uhplbKpOvnlkRhBVN1jBmQ+QEKSvToM=;
 b=P566cu4SvBZ1K1eGgM7vhqdNdvx2caD+ug1XKSV/BwnXdC80iZ7mnUWoLNAdtKGV1b06Nuj25n1dgp5/Af8rpMuxERPsYQQaXSCp4Uz/gLsIM82TuEx75k9dfQyz6XRzgoespee95OLGoZZXxdxBsA/4+/g9Mw9O5BOSOwlcsJQeWSliw9X29uBUFvwHI3EizmAtG7rII3WGv/tJw0+4CVtPgFteZR80g31AWLS0u4jce7iN/FhD7mfIKZu7fT06ac4ErOVaH7eV5WZ+xm7nV1zshN2HwOvW+zqLwQi/EnyLftN6p0Pfoymk/ZEW6VjvAZsoCGkN3H2W58kSsZVogA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM0PR04MB6994.eurprd04.prod.outlook.com (2603:10a6:208:188::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 15:38:21 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 15:38:21 +0000
From: Frank.Li@oss.nxp.com
To: Jai Luthra <jai.luthra@linux.dev>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org (open list:TI J721E CSI2RX DRIVER),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 6/9] media: ti: j721e-csi2rx: use dmaengine_desc_set_callback()
Date: Tue,  3 Nov 2026 10:37:06 -0500
Message-ID: <20261103153721.1232488-6-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103153721.1232488-1-Frank.Li@oss.nxp.com>
References: <20261103153721.1232488-1-Frank.Li@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR17CA0024.namprd17.prod.outlook.com
 (2603:10b6:510:324::21) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 3006ed97-a1fc-4741-9bbe-08df39c07d3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|10067099003|18002099003|22082099003|56012099006|11063799006|261021123027099003|261021121427099003|261102123227099003|261026140227099003|261028144727099003|261009223027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	2BjNQq5eShgIrVvQhR/k7t4ScNH4rQXaIhcFSBsUjVK88vgqmGBHA9TNB6k1WlitEsRRYc7x9Qe/FpBawqdBB/VOBQxfvyR6rzyKl8+QqvjQSEB+QFIobNXWHkDCag+ZCODzqOgE+pjV6IKHSPWTCt2H4HQvIkgDdixl+DfYg1SRzhH8irlzSuYWHANIuh+PHQsdg4HiX5q5XS6nt5LKfGo9d9ssZfOg9IsyOJllM4pCxOhs9mSm9jM5xlF5S8yQdhLN2ZU/9KHG+3g70dUAues6vCOkbQ3oPl+r4F6coChVZKIUi1o3ByzNirT3ej8drWxafq2Jnd/4+E/yQF1JNXLAq8vX26l98u9uoyvXSNpPWVIYRRwQc3DMvzcSl/iQv18NvnCOqXGe5v+/7CcIbzgFXsSFt+FfLYHph4nzCFSzvycV8dpzNERdsTZ6TB/FWL3w/oYCypwJpUeqrqO2gRxwIucla0iqGtXh6EQ63IZ9UknROVVu0ctZsQMQVdLODuuY1CwYu2ZZWwG3xaQRuxp9gdDU0n/MB/9LqUz0uDkctCanOxnuZVdhB/GscDU054TcMA5otwg2WWDFEzwBoB/2cmFgprJeHSau+fczYK3TlPlNmfLGkBk05HAyVB9R
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(261021123027099003)(261021121427099003)(261102123227099003)(261026140227099003)(261028144727099003)(261009223027099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?piFIJREzOHjbisy4oZltK9PoR1A7bryzCAwpLsbFH1rkKJHqlxbfmZdCyHcV?=
 =?us-ascii?Q?9sZW3USLPRU1SEd/PKdQSS6WU7+1ka+oKC+BZT4l7XjpgayORciDsHc4pc6V?=
 =?us-ascii?Q?7Tq6R+GITfPX7VRXPaXNoYl1BtNPE6VLwI5TWUNBSDS9tH/yhKYs1LCBmjLW?=
 =?us-ascii?Q?1K/f/UGHitEmp4jCgO+UlsqML0W+0RYJavdKFpVm/iNmJUtfRxZ7DBozerHD?=
 =?us-ascii?Q?zR5JQ753/GS0lSRmLlK/scvFF0wUZ79r47ukN0Folt7cRcajgmA0cKRWRThJ?=
 =?us-ascii?Q?0hoVX6heTFk9B/3aPwzizM/GD4BlXbo+mdjs+3CNpyEGmI5DNcc6s1FgIWZb?=
 =?us-ascii?Q?10NaUDSJEu5YN/fOaGWf/MJYnuQZpdQ2s4aZXQTY7BvEMjgnDhZSRRnFY850?=
 =?us-ascii?Q?u4iLjMIdZA7Rzif1kuF7G4Uvtth5XuEYnc68o1eWrEbnjnvZIhFHmNGchNe2?=
 =?us-ascii?Q?r1ZiVatA9ZG6/eL3LIWCGenbspxRGX0g1d0ZHX4M8JkJyvi7eB7Qx6UvwCkX?=
 =?us-ascii?Q?jlkocfvmO/olwUEjjEX9x+Q2SNo2Rg54zqEgQN02yc5EP7RlJpK/zLg3H7Ar?=
 =?us-ascii?Q?mmDJss819ZXvehnCws28tzAPq31GXEZabrJ1yv6D6PcpDWwm+MGx2Tr0+M59?=
 =?us-ascii?Q?HD3+HsXUiqIaGe1i9FVv4ZmaMrY5iGBXPLoic6sUI4PRQkzULguG9y/dXw0w?=
 =?us-ascii?Q?dvUJijHanE/Grg60w0DDK16o0vZuYSuTCIF81KOosyKAJz78gL+UxfRk3Dtn?=
 =?us-ascii?Q?pwFcd0ozTVmZKLLbGDorG2eCfw3ev+kkgBDNP5bHtjZLdKXh5mH/DerVkiro?=
 =?us-ascii?Q?KoHCKrjrhXE4ERLqEEGoZDOOXWl7UecfVrw+Q9Sx6zSjcJWdSKVJjhGZGTF9?=
 =?us-ascii?Q?rUfx4NxwPyNtIZz/va6wNcLlfm83OkanrImkEYGBfpfVgIL047RHSBrag2m9?=
 =?us-ascii?Q?5e4N1H7M3awdtJHucmIQFHAkIfzqzHYw7NOdcqEk7JPssnXXFgd+eDhEdOXA?=
 =?us-ascii?Q?FRl5ouUbUhY6sJ65IsZVFBpVQo/rW/D+Koj7AysExq9oXMdPqkuHRoR76LTs?=
 =?us-ascii?Q?tChz01QQQinvW07XYUE+IWwzfNnknEKnz9O8nqtgPQm31aSPV/RRtLx3iVWA?=
 =?us-ascii?Q?GoXdkV67g0CL3fN73lgoOI8b/8XAVFM1mU2nGiVHFXPcjZ7CWRCYCKfc3oP9?=
 =?us-ascii?Q?ZqdW1ujZhL/L/qBdkieHj13vIsQd/RGQzwq2tTEbQJEX5EKApeaeRvQ5f6cO?=
 =?us-ascii?Q?vS4CTCCcVMs9NssGZ71AfvMWEP10jrbDGWRXpvlIpv3LNGrKRhAmhMwyDN3X?=
 =?us-ascii?Q?OX5/J0KgGur8PJwD8/WSEdCj4HOtGIhJtXzRvXCFfQTE35+TUQ/x72Gn2SPd?=
 =?us-ascii?Q?Ed3PKhHw6cQz1jXvn0qrnB/mAbgby3Ijjw367BWHPh8/cBimYNi4yuuvFETY?=
 =?us-ascii?Q?xvc4INYP+sicCNib1AhLJIumdoqU8to5yaVixQh1YtbuAYzwWSb8zsXOlQIU?=
 =?us-ascii?Q?J1UpIAC8seIBGtreR0k0zJ4ZrOcaXm3QmBOCo1IvbyMd31sBsFa+OExMyz18?=
 =?us-ascii?Q?AGHH6s9HjY/fJulemdu/eWRFNKUQtiDrVzOdgejmPqndCBgGvuZowEzf6haE?=
 =?us-ascii?Q?lwYDPxGnzv0w9Cpe1JEykPKbIaeGCsj8342NkxboKn7Jlj2OiB19Ci4fe39h?=
 =?us-ascii?Q?SYsFN7K4CGoC6C6CzLliBT3R2OaJaAL3aaW7vc2ttj15sQz4J0Mjjy8gi8lu?=
 =?us-ascii?Q?flhL/AkLl+UGHU0Ch8dChXEuw4Tibzbxyhgcfp920P5hoLQdUUtf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3006ed97-a1fc-4741-9bbe-08df39c07d3d
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 15:38:20.9604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 51wWeyQjtJHlX94s9A8Lhpt54b5mWkztVk8/4Ro8k/aciZm9dP1culwoVs8kguNS7VCbKgJavPSyN9CmY3U8ak11x+/Wc9xTExHJ96z+UbNQwY+qWSnJaWWXBJlU3B2D
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
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 022ea3d616c9e..998423fa2f330 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -692,8 +692,7 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx)
 		goto out;
 	}
 
-	desc->callback = ti_csi2rx_drain_callback;
-	desc->callback_param = ctx;
+	dmaengine_desc_set_callback(desc, ti_csi2rx_drain_callback, NULL, ctx);
 
 	cookie = dmaengine_submit(desc);
 	ret = dma_submit_error(cookie);
@@ -782,8 +781,7 @@ static int ti_csi2rx_start_dma(struct ti_csi2rx_ctx *ctx,
 	if (!desc)
 		return -EIO;
 
-	desc->callback = ti_csi2rx_dma_callback;
-	desc->callback_param = buf;
+	dmaengine_desc_set_callback(desc, ti_csi2rx_dma_callback, NULL, buf);
 
 	cookie = dmaengine_submit(desc);
 	ret = dma_submit_error(cookie);
-- 
2.43.0

