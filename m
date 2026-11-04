Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793777943;
	b=SiOwuUwFnF410x3NUgFIW5/4jy99XkR9LKGBz21zhMMpoM8q9EucG8xt739Pzhr9upi4
	 XmRzqtXwxRvldZwqPnWpRtJYyz3YFep269nLq8LGnYOahVQVNR0VHecrSU9aPhlILFLro
	 2nqH55GtN5KkVi2ILtBsC54GtwtJInt664wa+F/hAqzs/9s6UI8BnYgABdCjoymHWoF6Q
	 5ZC+M9jjiQ9wJ6u0dyHVmdRZ0myNtxF6bCvxWb1+iZXvHrzLQvZy72F2K341HYs3DSxPU
	 eWKHZgLamdXqNVyKnbM+wNdtZ/hBvlmkFqp/TME6ys1sDPCXZMl2JF2uyRJo+XC+0sw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777943;
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
	bh=zYTBDKn5rjNl9PcJXzO0CR2F+/UKh1uvWY8rnahROG4=;
	b=1ci2k1MhaPs+bN1VFQROmPc75Egy8PtJBeju8IGzXvTq9HBKlpInbrKLba41DgG9BtD8
	 4o703hqjZ8C9VADQhnC1hNFWrv0uxw0jWGtQ/381m3d45R9vokQvh2mHz2qlilErZ18xb
	 CkrAT6QcabknwKBpEWLtUv/2cUfEyYTz5qaNcMn33w12efNZq3UaRRJ+vMpKPntBkxBVv
	 6kWqagUbaq46vYkHV69ct3V0nAMQbNnngTeTh7+DY84G4uvqH0vfvbnyW/qCu4QiiYhQS
	 MEDyc1CjlM2vGOXkMfFaieikTyhdHOaL8qsWj5gQuzMoVHFk7+6ACf3Kq2KGNzAcbOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="V2g2h/Ku";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.20
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013020.outbound.protection.outlook.com [52.101.72.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04BA606A331
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C04BA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=V2g2h/Ku
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NlCRQ7AvZKKS41TSxaKRyz0atKcdr/7BUh6OrA7enQdyLX7eIuDU/Ys9YC3l6A8WTHItxOkKHSqbG2/em8iA5Y4fvSJl8rANeghVwdB/DNoS3A17NRqDbYqaQE8hJMcZjPLz+aR7o3qk65De82j5nCWSOQj5p4CuH3uELzTiT40/j8wf6jA0F9coH+moAm7KSeDMw0g+tvfGZheosdjR7ruIWnrRDx8IAUTrSqkkNIfWhRMxH6IbrIerV2r0DZHk2zUEK3b0U4iVFRaukC0mhYEdLOvRJmeXcKDOpiKlis//B0/gozrQdetX7nl1eing58Ii5UZsZhLkJOK48V+VXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zYTBDKn5rjNl9PcJXzO0CR2F+/UKh1uvWY8rnahROG4=;
 b=pWBNOCK32oTghYDWsw0gA6hvHq2++/EIEOMMDHNvG0vNZDnFaZg4gn6khCrJCs9h6LuNALqGzvNON2zuT66efW23+XBXSRCUqu0o2gmMMKoBwPCYSEkzbfVIdxQmrAOJNTyP+qR4ZVGwzyo3oZRru3+GlCjDgNnl5I/85rlKVk4O3luJZIbatpKu9nSeG2GOr2mW/33CR13Cw4shZc9DI0+4bZ9EMreb0q6f2YrJWx2vPDWMssiWdC2G306SQlp1gTMzgjJsIZH2Il3djCjQYhqYzN4vBvl2mzmTRdxa3B9G0YSBXqa3c+MplAEV7+n22jK/qy3oHAb4iuJ9+1OBbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYTBDKn5rjNl9PcJXzO0CR2F+/UKh1uvWY8rnahROG4=;
 b=V2g2h/Kutf+3y0GIQ/Rd3KB8drOQDRKgoXJBOn/vKMNvjk3sa1n1BWU2HRO39VFTr0npmxwHzKaVR+vkfe2ijIrskupkuxdHh5fLvBKCVeXlldG8q63nb5UoT9VrVNCSy5g9pa4qeo3VocQfll3aP+nyH85ecWSZAFtXRZCLXnUEUrbEWQwWnMLiDWNsxo3eoZryBEfl6PwTXwtwj057jcXEfcKjoLo8pbVJ/JrhUdE0tnPQM6wNhQJLhWjJmFY/yKhrtb5gZNETYiZMm9X6ez0xbI4B+dkQjrGHzblS2M84yyHP4hjd4tI2t85+iI71emixgRzfD1MXTF4rM+14AA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM0PR04MB6849.eurprd04.prod.outlook.com (2603:10a6:208:181::7)
 by MMZPR04MB084377.eurprd04.prod.outlook.com (2603:10a6:190:52::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 07:39:00 +0000
Received: from AM0PR04MB6849.eurprd04.prod.outlook.com
 ([fe80::5935:a7b7:baf6:6c65]) by AM0PR04MB6849.eurprd04.prod.outlook.com
 ([fe80::5935:a7b7:baf6:6c65%4]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 07:39:00 +0000
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
Subject: [PATCH v7 08/10] irqchip/imx-irqsteer: Dispose of child IRQ mappings in remove()
Date: Wed,  4 Nov 2026 16:37:56 +0900
Message-Id: <20261104073759.386777-9-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261104073759.386777-1-Zhipeng.wang_1@oss.nxp.com>
References: <20261104073759.386777-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:194::9) To AM0PR04MB6849.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB6849:EE_|MMZPR04MB084377:EE_
X-MS-Office365-Filtering-Correlation-Id: 3010fd49-94b1-492e-ab0d-08df3a46b0bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|366016|23010399003|1800799024|10067099003|18002099003|22082099003|261102123227099003|11063799006|261026121527099003|261022075727099003|261028144727099003|261026140227099003|261022105027099003|261021121427099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	aOfYh/di9MNZRXEtBtM+jT9lnMg9PlhCDpibKBpFPHMWiPryrFuEp2Wuhjhu3iI0vgWEuVnqRfpBoV9aBdf/tbYACKnoNyEGliUb2ogp/8e/g4RHwsBpHydsyQUbtSqUZNi0aJpMUSjPCXyl7KGPT2wYhp2GjzOoV+8BtnHz6dVfV2i2292i3D+9+n6iFQGf1Iz6tuR3YPDS0tK4gYaOsvj4xzYP0/KaiweK0uz1g5k64pdtaVv96Yo5C0bM6pa+eqNUHTLIOo5zzGJXTgcY2AqcQEFqMWtvJE2l811NvlhZnJwQuNT3ucf88g9pgkUiIMrW2FYN/Ufzb3oSfWTlSRq1bFZuRfIVWSbqaMMSguN5vZ5m/UhGK3bGGn/D0vv5hOaHlBwa3mC5A/+4QitI3vt0EOkNM914aIug7pDwoFnCYcApAeLYeSLEErAsStm66Df3FhZVr2ZWN96sr6rsjbYUn+alA2qImcnNJrZLgwa9tKS1yHUszSCgkCwXDXjNiz+NnLnHqj7MV4ZEmI66CLRKJyzRZqsQ+SspwehPla1JNUaQXIRApN/7gP4VSQfm65EerriCFXG9phNjaC8GnXrpa0WGJr4F0YaUSgY7lR+m1XPqGdde3+E0Bv2d9eoIsjtNzZrQMXhrzXbIFdYoxWr/ISr9HxPfthmzB3DMM+A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6849.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(23010399003)(1800799024)(10067099003)(18002099003)(22082099003)(261102123227099003)(11063799006)(261026121527099003)(261022075727099003)(261028144727099003)(261026140227099003)(261022105027099003)(261021121427099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XaZDGcSn9rtMPRHXuulvR2i3eienGIXZ1l4fxf1wEXdwepU+tcGI9vRWszkh?=
 =?us-ascii?Q?wzx564tLHmJbWK+ybGEO1uiZRrQNvKHuoZ795BXuxEX1CH4TOxBaOKCZoYz7?=
 =?us-ascii?Q?eGAMv5LGVdVTzGd4K0qfcx+j8VyAVZa4NwuDeYZfau0Ua2Qg2yFZrHocT0Il?=
 =?us-ascii?Q?pzIg1teRqMyu3H7vUmKA+uKK4hjSy1wrzXAdo5de5bpcijrQ28NjFrgZCL5q?=
 =?us-ascii?Q?+9T5ZW1MhTVbStdXernEEHm3/yn0WES/Z6iB7u1RWM4+xUg4K3odBkDghICI?=
 =?us-ascii?Q?UVw8BmBgUcYShHCxS5KFSMeKrtYuczQcDSozSQxgiMFDkp8wXMQtZZvif9+G?=
 =?us-ascii?Q?xtEfGXmpuAF9XERsa6YR/4yXYHF9zygZYwmueIlBygDyfGMM8ygUoJddI89M?=
 =?us-ascii?Q?Pr9M7XTk//oJfJ8Q4vkFUzEZy5/GCkCHiwhz7SsGKKFsCD1RLRWlLEt0H/5b?=
 =?us-ascii?Q?BFp2m0o0lo5mePdbCvW+HaJIa2ctkiv8BDRGoP+/TrU2QKxSYNgj9+IZHAXQ?=
 =?us-ascii?Q?TQyjacOlrU9mhYOe+C0m38tA2A9MafMHx9EIDw4ktUE2buFtVoEBFhtnwdkY?=
 =?us-ascii?Q?R93e0TJf+qwjWsa6NGDAfvTp0hRd+TwEve5IJ3mRjgSTYgUj49rZGgabU0Cz?=
 =?us-ascii?Q?iMBPrt3SSiGidvhNNdcyOapRfQiYjMgSK4L5DPcBWx2k68x5DGTXYqCkRdHW?=
 =?us-ascii?Q?6Bt7Qco+HhfI8FnF91MsfwkeQGMC9QleQ5vWM5XOIhW2/rxdfPxEzyC400Yr?=
 =?us-ascii?Q?wW9iu9GTF0qsxVW4UrHGz+TawLLa92nwtw9E+mo2YeXF+3x935ntIfL5uZxU?=
 =?us-ascii?Q?mm4/WGgWmceF6+RSS4idsX6S92V4/tbEHMetL/Koe4Q2Ie77Qo9vn8mSM9up?=
 =?us-ascii?Q?pp+DI7s34MBgcTDPTC87PWhmo9329/8IdckjPpCkp7H0fpkH0hrqEpMNbVH4?=
 =?us-ascii?Q?r8dVUl2uKU90Oq5Z6RoBF7lbHW2cAmA35fGVusfKBkl3UxuIC7/NojEoVYYe?=
 =?us-ascii?Q?N5yZxRd2d9we+A+qHjYFp/nPua/wUi0wn9dHNWBJDc0QjuGFTNqG7EBFTark?=
 =?us-ascii?Q?l5OqrZljoDQbHJ29L0tbL4xaaCw3EpOG+VWHrMpgY3bLm0T5EGUouzTFM1L8?=
 =?us-ascii?Q?T3nyXb2n68vNphY+ltYVCOLep5exg5kjrOtLS4Nt0Voi03Zdrb8SfzwwIkzC?=
 =?us-ascii?Q?SR2Oel2pgWzzg/oafUJ6l7po2Nk66EWIF/Zzv5WsO8oqURDCM6hEIi4kAgcV?=
 =?us-ascii?Q?eP+KJIKM0Lr/1BLf73aOEmI+F0K6owsQty0Tiza1elfobJXRdeX5FaeIhp/y?=
 =?us-ascii?Q?QarO2zUB+cOP2snzLD6jNG/qpvrVGZ3jcSsPohIc3Ih4QZ8b4/7naARVsO1i?=
 =?us-ascii?Q?S8FVqtXpSVKnZpVZu0a3wys1jkLGEZKmFtugikuXeBCV5PsuhkqsSohOYFCd?=
 =?us-ascii?Q?XU2bN3H+sYetljwapDbWjHg33b/Nld9iY+CILSAffbs9gz/2YdEUmrC0inBr?=
 =?us-ascii?Q?YGUT+qfSrwL+LqYjTt2+gdW4ifyfkjIoKQXG0zcrVEMrbxQJgk9L3oeWX95U?=
 =?us-ascii?Q?ED/JRyzo8Pe+NpGCKMr5Uddvv+9lzU2zv9TkZgYjJ5+VmlGqx60tGiL19kiM?=
 =?us-ascii?Q?7wrNRJWBsWpldek54Q3hDYBH84wmSbbZ/U4GRKGBdOGvP7UcoinV0Kdvd8DZ?=
 =?us-ascii?Q?50uyO2ojAjg7x5uU6E7FVou+u7vVYcNlHau6dY8w9pxCtNsd9l00vKimXodz?=
 =?us-ascii?Q?u8tk5ZSLnn9P5KuFaHFiUvRPH7ZWhfqt9qmZ5WpmlN7xhJH8MSJLyNccuj7S?=
X-MS-Exchange-AntiSpam-MessageData-1: i2dMk1DXFjjY2A==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3010fd49-94b1-492e-ab0d-08df3a46b0bd
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6849.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 07:38:59.9622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n1NNgyMdX0t8z7CFldvY7RrxHhaLvDC+QE5wf3a46tfKTHUjVnqY4ADLNYHnJ7HTVrHOZfbZiklpS4jIIjYF9EZkKPLdx7F+eFeJj8nWYCEkiJ+BGMcTsNF32sYTU5+6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB084377

From: Zhipeng Wang <zhipeng.wang_1@nxp.com>

Once the driver can be unloaded, the IRQ domain mappings handed out to
downstream consumers must be released on remove(), otherwise:

 - a parent interrupt racing with the teardown can run the chained
   handler while irqsteer_data is freed (no synchronize_irq());
 - downstream irq_descs keep dangling chip pointers into the unloaded
   module.

Dispose of every child hwirq mapping in remove(). irq_dispose_mapping()
calls irq_domain_disassociate(), which runs synchronize_irq() and frees
the descriptor, closing both races.

Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
 drivers/irqchip/irq-imx-irqsteer.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index a14a8b80d60e..d15b806b278c 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -272,6 +272,7 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 static void imx_irqsteer_remove(struct platform_device *pdev)
 {
 	struct irqsteer_data *irqsteer_data = platform_get_drvdata(pdev);
+	unsigned int hwirq;
 	int i, ret;
 
 	/*
@@ -294,6 +295,9 @@ static void imx_irqsteer_remove(struct platform_device *pdev)
 		irq_dispose_mapping(irqsteer_data->irq[i]);
 	}
 
+	for (hwirq = 0; hwirq < irqsteer_data->reg_num * 32; hwirq++)
+		irq_dispose_mapping(irq_find_mapping(irqsteer_data->domain, hwirq));
+
 	irq_domain_remove(irqsteer_data->domain);
 
 	if (ret >= 0)
-- 
2.34.1

