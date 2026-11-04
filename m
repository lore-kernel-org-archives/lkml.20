Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793777904;
	b=WjVEYrws497sCiAdKE2NpNO+bW40s0BJe5S6phglHEV5qlhbaYfyw0++S+m8XwuDkkSQ
	 dplVXAjx4IeilXLl0aIfGxfimdEjveX09ZGGAJCZatCXzIM7QXVRGnOoM0hT7Uks0h3Vd
	 orgkxhOs1lukk+/KKVmJWmIui68o89xboHNGGlnls9s04OnTOEyWdboTXaTUgImKM6/LO
	 VX0FPrhRRX4Gmi0p00ONUmYMHfEmjvRVJu/MXKUmX6D+/CUjwV4PSXh7IKXNw++p7cAYH
	 capBsdTmmI+z68oEBDKJJdwJdi8nS4MVzZSaWZnV1x6RQYYdgbkYWGOaZ+VZ0r4zfyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777904;
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
	bh=pxTvrPA3cHps2LFUdAPGjxzFmcj7sab7JNLNkszqAdg=;
	b=nID/YM3qvWDAMum2EAosjfDbMdN/qHq0iM8lq6Qfjhqfwfq60RBPnb9heTy2zbXk4vfQ
	 +uVonzPoJ1kH0kK4t2eGxkYZNn/2JQA4DbOn/JOglkY2gUd2TUNcskVaa6MkudtdgD/6e
	 WspFSk7WPHV3j9AGv0yWY7k7XBdPF5Fz5DWVat871NW1V4p+ws3LCjKDyV0wedYWsv+qj
	 pkS1UmvwlZqDFca1u+RC8P4uQKhr2XZaNXZ1+ssgnxBIhUQe7lAqJDz/FWVK4YcyIvAhZ
	 2Y38IvDxbtVSKrGo+xSenHvtOK9z8mO/i346HCl7sWNBEc9ysOs1fvqstnAnKRm6fJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=WktQj1si;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.56
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011056.outbound.protection.outlook.com [52.101.70.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA7D606A332
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EA7D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=WktQj1si
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YjT6YdkYdX4Cm2r8mU1TQt6LRH8C4ezHTIBMmLTjLbxslrz5CQd7PKz3Bvu7p0BNVaXRoErud85tHZAm6QEJ4Exn5q6gxZyVPvrauyuDiwjNO5Ag05up1MCnVoWV2DWuyi04VZMNFaD5aThahKkVVEVrL9reEe0WWWzlEUrcpFe4s/2OhJogLPpGBwVKMh+ceRyxAmdd5enZtlS1lw7vUpQczLeeLLokkNJ8bJbxBlEHq6Y0oOf0tOfRw2xuJSXvll0LhWIJt+B5w97F2QmRQ+W3Buyqw5z2cvE2QPZjgdwG2jQXhpgQVfsuaVSrdWJ8mBA8fAB3mF/7MKrgCIfDtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pxTvrPA3cHps2LFUdAPGjxzFmcj7sab7JNLNkszqAdg=;
 b=QDXydqW79ckq4lfPYJEACbo6QHnMmpjuE9qYVGAgwY6zD0JnAGf0DMlpeXfEtMCIWB1av230b/FP896mUXBHHVeoWV/USTM2MskwyC/WA8TRnZymqB+XPRQLtIfvNJ92G92ZHAzJrg29WcE3aT37O1SsjZtvlGRRQ8Qo2GIoUIMeFRrSKk/tDiVYaPPfwEf6HU/e8wnTUcP8moLqOJgtrcBvjicCG4cSwMy3xs0M8fFzRkAeeHWoW3tnDT0iVcjaK6kGoBqhTT6v+Je25mdwLozfsfD5EPuwUNb3f3fNeGhOc/V+ekh6t5rnrENv80l07Nyr2JUdQIvAaV6/IR9MLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxTvrPA3cHps2LFUdAPGjxzFmcj7sab7JNLNkszqAdg=;
 b=WktQj1si0nJs8yoAoG4E12gsSgSrVGZNkJFE76Nk8ZZHGV5O1LE5aIYJjamyFLOBNJNBmZwaIholJpf8cLyDfof+QE1aoUrW5GlM66aFfdXWIMi/KXmIL1dDiL/mOamWZENd/HFQ5idnhtfCVuJyI1gPNv1pxYpGeCeB+iXYIlbGxOYXTyUGyvNr7gy2hxyLSLYJMrChHtV2abPeAdoZ6HUa+YHnP2OYN/hZE7jLKZ21W9jeb88/Pm21wdtWrF2reGCF5baR2bpFJSVDh9zlVngVx4sPTABjznRRcxOOKKm0+eVdIOCfauAaRlRBEOPTawMMKzybX8k0IyuYxg2VnA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM0PR04MB6849.eurprd04.prod.outlook.com (2603:10a6:208:181::7)
 by PAXPR04MB8733.eurprd04.prod.outlook.com (2603:10a6:102:21d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 07:38:20 +0000
Received: from AM0PR04MB6849.eurprd04.prod.outlook.com
 ([fe80::5935:a7b7:baf6:6c65]) by AM0PR04MB6849.eurprd04.prod.outlook.com
 ([fe80::5935:a7b7:baf6:6c65%4]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 07:38:20 +0000
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
Subject: [PATCH v7 02/10] irqchip/imx-irqsteer: Validate IRQ count before creating domain
Date: Wed,  4 Nov 2026 16:37:50 +0900
Message-Id: <20261104073759.386777-3-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261104073759.386777-1-Zhipeng.wang_1@oss.nxp.com>
References: <20261104073759.386777-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::8) To AM0PR04MB6849.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 1a8acf1a-574b-496e-33ce-08df3a46993e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|366016|23010399003|1800799024|10067099003|18002099003|22082099003|3023799007|261102123227099003|11063799006|261026121527099003|261022075727099003|261028144727099003|261026140227099003|261022105027099003|261021121427099003|56012099006|261009223027099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	IelzbNgUJv9W19bpTiXN5gr2Vw5V6vXvDc5x4xu1EXz642hR5FUFmKxHMCADALtG8Ot0XL+jNXNt+zEpCnoYrixPu447eD7W9S6Y386dQcHGEidf/JPTShrhLRGfzdwgXl3wwq+7jQUCxBE/hvun+FIn6/vIWQ2HhkzpdwQO1rJ63oIRXPnK4MpASCbZCsK+XmwjlCS+LsOkz630f1MjbIuNLdxeU5OirUFo3C+JH5lawW1LNWQNJbr2w2ZEv+wTw+FvYEzSodMxayfkBFcLlBfFi70McjKtCrvywOq5DX/Yj9VU0ptGH7mWfueuXFYEKKInxGxw+P9kkI4gqWPXBFaXVAey+R9OJg0yStkeZ/qXnMJntjPbsjLHKOLShmGx/klASqAKX3/7F9wdc4jsVtKuyte4OHjpwFed7MupSmHw0jtD6UUZKOi/3RGKXanpGTzdCBTfCrgCh8qZkGMPVEy12aR4qoEXa2Ubn/YvQTtQ6HZEDRdB1FGK/22KCdtOTpFmJ4c1KcaCpOz2/GCDUoJ9cSmpztAHAwbZbOLuLSMlzSbbfU70TGQoW1Zrjlv6WeqOr7Kqg4U5L85OEWP3RHLCK1592Cftt7SskP54qv92Izo0mFP7sYueRdf4N9SzsS+z9utfrzuw+4k68lAdnQUCNrIeuwV0b9xalM0Z37s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6849.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(23010399003)(1800799024)(10067099003)(18002099003)(22082099003)(3023799007)(261102123227099003)(11063799006)(261026121527099003)(261022075727099003)(261028144727099003)(261026140227099003)(261022105027099003)(261021121427099003)(56012099006)(261009223027099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W36bZa/ZZyCpzVeoqUJtPFQgMt/T6+lx8R0RBxQTcXCeX9cmjnlrIBdTfm6f?=
 =?us-ascii?Q?D68IKsR/0xS07NUipskT1B4I+hlGyZ5TQSbW3pZpZ/ICc3x4Yft42Wf1zYiv?=
 =?us-ascii?Q?N/Sb3ypgQy8ZNfv6yQPuUdP7HOP4SVADUszG8dFqrnX4DYzZhKMiulC7D3Wf?=
 =?us-ascii?Q?cc8wyuv2sBZ92ZigEqCBzNZdqpL4ZPtlrBQsOru1hZoU87Hxqw71aM+q8lTx?=
 =?us-ascii?Q?0zbfbQG9wS/bCONx87ltfMls76lHNmZzXzTnzcXCMpOVIwnh2OKEevHHSqWs?=
 =?us-ascii?Q?pOGBSm5b4GERRnGnjIQ2xdepy3rq+Q8DFNlUqIPXR+7H7MptHLKi7BO99k4G?=
 =?us-ascii?Q?9Ao3Ghgc9tFxOcv3zvLDXAV8mS31K156OegUPvke/3woGeRWmXCVbSDg430y?=
 =?us-ascii?Q?1T+UnAYsEnGA/2o/SJrGsBHTvbeyM/Z8qRObsglyJhS2cossHCAoQiNEjqKp?=
 =?us-ascii?Q?lA1EfBOO0/IOBZxiaaf9B6h4SELuDCQTrzwj9iYIXivfRvmbd5xAJLm3Uy7l?=
 =?us-ascii?Q?Q9rFFEEHMrVmocgMCr9OJRTC1zQURgupKsFIY2QDEVmnJrW8RyciIWU0eGVL?=
 =?us-ascii?Q?vlR9SmMzTM8GCQJYqbfi42nWex45v6DNmw9H653sXwKLhjrgeZCgWc4RtNn2?=
 =?us-ascii?Q?wX28YVt+LHyVzpzSnfcBLxV7cLjDUd5yq6l4nIw1qQtISoFBYYJvveViW2b6?=
 =?us-ascii?Q?a3CuMa29G04Nu8G8R6xVb7NTpM4cMD98K6GaCltr3TRP3K3oQT3UWpOT4Q09?=
 =?us-ascii?Q?B3OqVCMZWHjgpBqFj5esa/3C1D9DF62XouZVky0RAt+AbifZivYYR4fvu/mf?=
 =?us-ascii?Q?KD8UtJTnXi03Nh0ySrQlwfvTFk2nVASanKqAIby86u0TWRlkQK4b/luMyLvb?=
 =?us-ascii?Q?+nYumpF7GLyX4ARk7ob8u/d1aJ3d1hch29b8ANYuk7drLHa8a5Bzlo6V840u?=
 =?us-ascii?Q?lOT+gT1lA1SrBtdpIFuXwFj6tAjrls6isoJDVNsdBSX2zqVwPEUfLD/c/LiC?=
 =?us-ascii?Q?8lLYXrGtwXrDPzWE3aX7dIyCtMeUpjDyHbo4pOLtJX2/hoLxJ3pfaQxlQqb+?=
 =?us-ascii?Q?kyU8hAvm4FV0IHZkgexm9Dd5MvAploMsrqscQG4/IWImhhARgC4HlXA4oB1/?=
 =?us-ascii?Q?rBX64SJieSBf55rydijwU9yhAWZts1sbAzrPykPHrIz38xOAMrtowImtTNuA?=
 =?us-ascii?Q?erRsuVmAL83UuMLWGNjooy5UjOwkomNsbiQhrxl7kZT8r13b0UXfuHmC3gQE?=
 =?us-ascii?Q?OxY2nRwlf1TVdVNZ2G65asDaQSFFRvyI1Mif6E4DYGzAOFbw100t8JKcjN8s?=
 =?us-ascii?Q?7wdeXubkE20NiyerjlmucKuKK5vbch6HiqYKLinnUlcKQTzzDrv7NFZ3RozW?=
 =?us-ascii?Q?eejspOUme/aVLuzmaXHAfiWrjr/b211A81k6eCOUA9ep1YsK4POPaMod393j?=
 =?us-ascii?Q?48KeEkGKKZUm5dhrFklNmVI2hP5srFbysGvOKLA48Fp6xtGw+fmAsDoNd8+y?=
 =?us-ascii?Q?p4nyee7evVVUzDa0wWf7Kq4uX1Xx34n+s2HDDVgHZXz7yvdxkays70apZFrf?=
 =?us-ascii?Q?jZUP+LdMYgSsLvyjdMuqNJJ1ZBapxwCERk41NOPZsCiktrI4POlbDqkKhUrX?=
 =?us-ascii?Q?vd8aTA6uDBWovRRvKfKjf4yCpSuNVIgo2KNPoHV01RQCMZS7ZTV+75xJOlTs?=
 =?us-ascii?Q?5vlwjodNVtgFAs8yEVx684N2xLgwT+efMXW8qofX54er+wHNJpHoYghOjU6s?=
 =?us-ascii?Q?7DQKkOqN1fPkBQ871ymcUEtInrY/uyPSfR8maWyO91Y22LBFdP8Y?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a8acf1a-574b-496e-33ce-08df3a46993e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6849.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 07:38:20.5626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0UaHuE15hJg0fLwNyiP++wZrifA53NuAmCHcw+4AgFGokIMg67JmBZrKbP7q9lXfcyEjyXvn/BXp2aEfVkWRfN0XfSMDPC7EJFMpLy9DTSIxAiaS8OeDaa7AosLBoq4a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8733

From: Fabio Estevam <festevam@nabladev.com>

The IRQ count is validated after creating the IRQ domain. If it is
invalid, probe returns without removing the domain, leaving its host
data pointing at devm-managed memory that is freed on probe failure.

Validate the count before allocating resources to avoid the leak and
dangling pointer.

Fixes: 28528fca4908 ("irqchip/imx-irqsteer: Add multi output interrupts support")
Signed-off-by: Fabio Estevam <festevam@nabladev.com>
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Radu Rendec <radu@rendec.net>
---
 drivers/irqchip/irq-imx-irqsteer.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index 1b8d0c8eedb9..766756e76c47 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -218,6 +218,8 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 	 */
 	data->irq_count = DIV_ROUND_UP(irqs_num, 64);
 	data->reg_num = irqs_num / 32;
+	if (!data->irq_count || data->irq_count > CHAN_MAX_OUTPUT_INT)
+		return -EINVAL;
 
 	if (IS_ENABLED(CONFIG_PM)) {
 		data->saved_reg = devm_kzalloc(&pdev->dev,
@@ -246,11 +248,6 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 	}
 	irq_domain_set_pm_device(data->domain, &pdev->dev);
 
-	if (!data->irq_count || data->irq_count > CHAN_MAX_OUTPUT_INT) {
-		ret = -EINVAL;
-		goto out;
-	}
-
 	for (i = 0; i < data->irq_count; i++) {
 		data->irq[i] = irq_of_parse_and_map(np, i);
 		if (!data->irq[i])
-- 
2.34.1

