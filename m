Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793777924;
	b=d4VIBgp0pHg2qohLf1KL8KjM9aFoO1kxKsqvBTi+zRH9Y1qy/huWhg85AHndReki8b6I
	 iSDlHnSV27/YxnRaui0ATk2SoQvNtx8YrBpW9578qTv6TV6QQwF27Uk4E1PYQpk3l2SnU
	 pFtYbZIK2Ucycaf2PpTnTpobGo/82ofWoJE9D9r2STYFgvjeXLQ3QT8X2hyn5MnU60DG0
	 yhQj5/3vpySPNC36qSKqtnrnYuFBlPecQwkNiBxmGhFQUz/9PXuaQQNU/MpBHesvSI8Pl
	 QZk/Pox5Z0PNM+CCGThveepYNusex1RBoEsxJJrvPn+eEt2sVT5DgHOyzY+VbuIZB5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777924;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=dL0stlT5NY5IMOuvkXecGXUBsAl7qdvuZFLOmCTmyls=;
	b=E+6oUF1t3qExjTW2Bfn9nAZxK27EdOP8Veo1mLTwIqlyA8xDxwnN1VuAc9O2wyXkovEb
	 TX0b6GbVglJBbGV+MskILWSFgjeT6oZGp7Yj+jXQrJDmZaQNnuOnDPJ6Wzb92LhlurBaI
	 5pAByzXLhX+pwv2/gTCwxMKFatRq2Q+0b4Ot0b85q8LREpJJbxR8oztNThW2chLH6Usw/
	 VN/e24Tamc1a5UTt0yMW8E1iU4uxrB+mTW2jvvNejEtYBhynN/WAV3Zs0R9SZIhnzDjgp
	 UQ4URxb3P3reg+GV8dLnBhWY0g1mo9OU33mPGWtDgD+g8yjcVnfK43LfHpn9Goz6ZAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="r/VB86nQ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.60
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011060.outbound.protection.outlook.com [52.101.70.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CC4606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3CC4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=r/VB86nQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I+ckaMXoUWqh9VDH8uRiacBs+n+SaEFApJlQr6IZ4ApowPkmTGs72iMahkyGRMB/iPK19MJuWa6O8CbVRYJOUQQtOB7iM/wpeDG3qBlm9Eue7IeDEehyzb/tgS5yiQP4/jZ3KXDTEiBpYPoBe/63mH+xDUSgE/XAlJxVvm9PRp/+lZVuVzJ9dyGmly6X8fWZg+wL7Ybv1z9da4RDWRs7kXlA0VajxY6FHMj8LMTOEQPMiqPvV2C19vdgZs8SncuKfdRN/jB3Nt8NcoYdVr5HtkXN/woM8nOcK6kkZzvowRI62VKmyEPVWIrQzt5Abz/5V9mpI6zIY211zlz9XRPxAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dL0stlT5NY5IMOuvkXecGXUBsAl7qdvuZFLOmCTmyls=;
 b=YhRD4XuiiF+fniOf6tsqPDgYwfVug+k+czNeRvTgMcDeHm3erexzQA9WmffMCDPKmziNPXP5JHslsOk1Fg6m4/PUnRrDrz3jx/qcFF0XjtzxxOUsY/CRv1tlCluHoQrGXlfHHYxokV8yIVZdTQK+tB3yLgK+7YzSCn7IVI7lB8GfoIJ/fcExNvq5l06SewtanLMVsQS81WPqv8YzmAg1nTh+ReBMMYpq4BRZVpWiQU0CDSMWQYVXJrHPBU6MRuBjJgRi9UkF0knsvn388jZWi1g7CgkjqWrGQY+0GJmIJWtZwvmU0llZd/jDfPxpTftLZMhl4MPPITSFsubxvYZlqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dL0stlT5NY5IMOuvkXecGXUBsAl7qdvuZFLOmCTmyls=;
 b=r/VB86nQeW8ybZ0/X8NTWmyFDgD1GP6QLs8JIYuW2LJ6DoGp1kqFAaB/cOf77W8j7KoV7PDxDbP3Ixf6fSQ0VaakSmpCwqMKhNKFkJsNRDtWiefVU0cm7FE3qT0y1KML6SNMYy5qqL5SxOcHCDnX73xBWcLBggg6V9wikoqPbQtaskhIU+U+GbJnY7v5q7n3X1J0sjohI42Q0/P/a7hVmMCbHKwTGQ1R2Z49MBBUFdWZfGEjla6RUyr7MoMImIQB4pBffIZNslTxiCFg0yh/LVZo8HkWMvPDp4lzCVNKcSMJWztOgvPNKXME7SD4jDHwsSndNHkCoKGV60uFIlxNyg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM0PR04MB6849.eurprd04.prod.outlook.com (2603:10a6:208:181::7)
 by PAXPR04MB8733.eurprd04.prod.outlook.com (2603:10a6:102:21d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 07:38:40 +0000
Received: from AM0PR04MB6849.eurprd04.prod.outlook.com
 ([fe80::5935:a7b7:baf6:6c65]) by AM0PR04MB6849.eurprd04.prod.outlook.com
 ([fe80::5935:a7b7:baf6:6c65%4]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 07:38:40 +0000
From: Zhipeng.wang_1@oss.nxp.com
To: Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Radu Rendec <radu@rendec.net>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Fabio Estevam <festevam@nabladev.com>,
	Jindong Yue <jindong.yue@nxp.com>,
	xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 05/10] irqchip/imx-irqsteer: Mask all interrupts in probe()
Date: Wed,  4 Nov 2026 16:37:53 +0900
Message-Id: <20261104073759.386777-6-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261104073759.386777-1-Zhipeng.wang_1@oss.nxp.com>
References: <20261104073759.386777-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:195::18) To AM0PR04MB6849.eurprd04.prod.outlook.com
 (2603:10a6:208:181::7)
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB6849:EE_|PAXPR04MB8733:EE_
X-MS-Office365-Filtering-Correlation-Id: 0af8e958-8198-4e60-67a5-08df3a46a4d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|366016|23010399003|1800799024|10067099003|18002099003|22082099003|261102123227099003|11063799006|261026121527099003|261022075727099003|261028144727099003|261026140227099003|261022105027099003|261021121427099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	CI26m0AIekHBUAAqPSCnq7Q4y/kH5aVDLH7Hxgil0e9Q0hpTFNaGS+QZuaC+VOFA5cnAMtwVso2hnaHUSXwRnDoh4oaIB24hd2i0pP6ieMupq16RHIgsvJhkiiBGmtcq+7/z6HRD+ZSE8yADkHvhXk28PYEpSWC5eUYa9jaPEYVUvdltgKqLev9RvTLp31NbVOnbmfkL+0Om0YO70NFVOW+b7X/aq/wWeJS1PKu1vIbqhXM2zOhl9s75I+cdwS+E1ZWh2twthPii5bydmTe/z8rWg4wtcRSZc29nm5KWzjN1pPjtTUhaj3ImQ/DKWKdcYOgOe9YbKYrf9LPtD/9fWs31U3waGZWmCaUKZ1Wh0JPkOIErZIHo+NHhvgswQsbzB6ixHLUNviPhY+MSUnptgIfG3QKuPPSzwk0Bwld5Lb9Ku7LahZQ6Ayp4amCR24w+lqkae7qIJKkboAB5CRANuzYphMh1kwpmHg4dk2gcwRcu0LNlpaIKIpUuU2RNMbG48Q0A3jIWFuD99LyAi42nLqpw2ZDVTOWiQr2ZUjhCE1D3scu/ndElj0hK7troNuIA6NtZNsbvnlmWYVTcHTjxZ0Kz/zTWBXVZRkD2jYaGDto/zLtVnWwXs+L39T1IqRhojRDUePl6hITUrh2kqpqO8CgKsautlb70GRu9AcRfI/Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6849.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(23010399003)(1800799024)(10067099003)(18002099003)(22082099003)(261102123227099003)(11063799006)(261026121527099003)(261022075727099003)(261028144727099003)(261026140227099003)(261022105027099003)(261021121427099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6X0ImV6m4FYb1iGFlG+fc72f85tbjPFT48KR94zd9ADaR6vk2EB8uWNomiS1?=
 =?us-ascii?Q?XXRTOz08yp4wJcPPHb7s/CBiON7ORdQqCnyjo/pfYQTnn8NL8CuVQJBusT92?=
 =?us-ascii?Q?Q6bl4TD284/XOGIqiEJJxZOssYNPASTaipgzbSTD6wJVcbQ+kFb7vHPJL39U?=
 =?us-ascii?Q?BcBovAThA3S5UODE95N3p6cSt1sLTV/QYgGIZ0KuAy+LERnP7bNSDYVQDAA1?=
 =?us-ascii?Q?xLpz7+bfEwwunQicrtNWjRsmqDk+8Kj7P7NkoEsK7XrqaVO4SV9EYMc0er17?=
 =?us-ascii?Q?Ne3Q1Mk/s8kdAQbJET+Na1gPExp3fhcmKKP0F/qezai64d1LBWF3YiHWUzhN?=
 =?us-ascii?Q?DGdSBPPJ4FymoeniJ6RHWP2k44xxTB3Mt2s2HqhttsxSpqpf7dOi37yr7EGm?=
 =?us-ascii?Q?xYn2ExxeIHOYUMYUM/D/7vCS+UzQp8jfZT/Qt3XZRWo2OklgVrhqiDWGh5Ha?=
 =?us-ascii?Q?tM/Gr3lSSuuGc2y+bxcY9J7w0aaRk5+Qa3BFOcIYb+RnqQ7fHPy0GzFNvW+x?=
 =?us-ascii?Q?/ZzdmhDETuw0xQTBEm584GtZigRUpO7hmj1J3YCEY/zbvKnvFzsZk3dQnkXO?=
 =?us-ascii?Q?YXmo9JvriBhG0bCoZ1txiPxxV3cm9pYzgKFDiDJqtBUoECkL2XubTZczGXt+?=
 =?us-ascii?Q?Z7uEJkmEI3rsB+2H9cuZM/UpfhxiP55tIsXPzGy/Dc4YmSzYZ2VxUE+tSiEc?=
 =?us-ascii?Q?BDtRCsYleJKdoZjtLQ6p7MrEg0hF5K61k6j1oiqjsExDm9DeQNv558yDYuZw?=
 =?us-ascii?Q?TM6CUt3HjHk5NgIUQHZ4sXSFv/v3oTQZAmapgkdPFJRlKwFp27bSKF10XPvx?=
 =?us-ascii?Q?YKK30ERUtPiNvxzYNdzVd9MEpKFVq/ZozR5up0GeqF0GrRZNYi8NBSzuuAYj?=
 =?us-ascii?Q?o3h8uUJDKvLbtOs4yFAef8vufbqc7kK9wcupEZDmWZDqFnXsqNKNuWl1RfAo?=
 =?us-ascii?Q?xPtqK/77yyt0r1HSwG+AOajXbQY7a0KntzF5pFLP6Ye19D7tjRkLpvzrPRGf?=
 =?us-ascii?Q?k4Z4IYZuAtzHdYRhFbhmkXlaiP/lPCKvUeEu+nJMM0ItyJ2giifKnkpS5Kkj?=
 =?us-ascii?Q?fhtVMWW48kL83C6R6bZtZ3/9Op5eS7nvHHsrCuA6D+BmMRvNgbnnlWBIz1EP?=
 =?us-ascii?Q?1Zuvp2fk9bTOLDNyfvwCWj7fhPVLlbU0pKqgao2BlFNpM1br5vohRZPAYFPV?=
 =?us-ascii?Q?qsD1OXm81br3p/grRTlsTT2ybZtahXj67Qf6B04pMx6kaRqdYZzqZ1ACCXhh?=
 =?us-ascii?Q?IP5HaHCwI3+KKzBqDbDCf8BshIDueTriyaN5lzU4Auaa4R6iIHkX96d+8Xn4?=
 =?us-ascii?Q?fLn4txrTokKYlMpq/UKXPCRgBaXHqD2nYT3vatWStcTSgMXfrfqF2PsP3Ety?=
 =?us-ascii?Q?Y49NbmV+98jpSMxHKPnVCUyZxw1/a5OwssoFiqxkkusFbfcruQXl5CxlJfeV?=
 =?us-ascii?Q?egzKZ8e32hD+cL68H/scbIh2qqZwL7Nsud74sD2Y1vfG8Ykc1i6COad3YSxM?=
 =?us-ascii?Q?v2zdcy2dEwK5wt1nOBDMv2XR+C6Ufwc026SwYSGOjZRmapwkARSSGXk8wOfW?=
 =?us-ascii?Q?1pA55rONtVjjMU2PIWKaRPgwOBi/24wAr1HXfV5PO+P42jt6OhoDJQUzrYxm?=
 =?us-ascii?Q?QgZBo6d3uBiuujgzFe4B8+eJpXrFo8SsmA67Ek6l5oLmYCvB/11LbTE2SGtb?=
 =?us-ascii?Q?JkaWM1mFVinJT+zz9QCHSPqe8DJMyls0KM35wBHbx4rXaubHGcMHFFvid/SU?=
 =?us-ascii?Q?Q3SK8KwaEI3zGseIRD421bd/HAm5xnESViIs5Gyv6DHeNvvfO3XSdqdhM0Nu?=
X-MS-Exchange-AntiSpam-MessageData-1: 1lpRDMHVQfH14Q==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0af8e958-8198-4e60-67a5-08df3a46a4d1
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6849.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 07:38:39.9752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EOUnA+0dC0WkpPRIiig4V/bNdFtH/7f+yLyWHafpOXg8fmZhILJPqu5672Nlpbt1nlNsG0mYB2P+xdTjzBpo5t2iRD8o424uL21QHv9wdVPEmKah4DuBaIQsIBVPU66l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8733

From: Zhipeng Wang <zhipeng.wang_1@nxp.com>

probe() sets up the chained handlers without first masking the input
interrupts. For a built-in driver this happened to be harmless because
CHANMASK resets to all-masked, but once the driver can be unloaded and
reloaded a child interrupt left unmasked at unload time survives in
hardware. On the next probe() the parent interrupts are re-mapped and
unmasked before the new domain is ready, so a still-asserted line
immediately storms the parent with no handler to service it.

Mask all interrupts in probe() before wiring up the chained handlers.
CHANMASK uses inverted polarity (a set bit enables the interrupt), so
masking means writing zero. This mirrors the sibling NXP chained mux
irq-imx-intmux.c, which masks all sources at probe() time.

Masking is only done in probe(), not in remove(): the next probe()
quiesces the hardware before it re-maps and unmasks the parent
interrupts, which is the only window in which a stale line could storm.
Masking in remove() would also mean touching CHANMASK while the device
may already be runtime-suspended with the clock gated.

Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Reviewed-by: Radu Rendec <radu@rendec.net>
---
 drivers/irqchip/irq-imx-irqsteer.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index a0546f11936d..14fc56847a8c 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -239,6 +239,14 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 	if (irqsteer_has_chanctrl(data->devtype_data))
 		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
 
+	/*
+	 * Mask all interrupts before wiring up the chained handlers. CHANMASK
+	 * has inverted polarity (a set bit enables the interrupt), so writing
+	 * zero masks the source.
+	 */
+	for (i = 0; i < data->reg_num; i++)
+		writel_relaxed(0, data->regs + CHANMASK(i, data->reg_num));
+
 	platform_set_drvdata(pdev, data);
 
 	ret = devm_pm_runtime_set_active_enabled(&pdev->dev);
-- 
2.34.1

