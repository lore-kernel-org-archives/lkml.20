Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013040.outbound.protection.outlook.com [52.101.83.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED1A47C0E9
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450205; cv=fail; b=djHN53vHQaR0Rzb+arszt7Lo7gnfJwoejrP2zlo8+xl1weP2wuMRveFsGcWPsHtfJDsdVQKtiLA0twVK0ARAAMXk6R+wngNiBI0oYs870F+EtyEyZv6TkdBIUPTEBAmvkl3COxnhzjtiXCjiENiKckyavjHy21+2/4qGiQ36PiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450205; c=relaxed/simple;
	bh=oq0TxzZxf6N0Fov1zYP3Yc/Hyv7ITUFHoX9AZ/w3KL4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GZmryLU/KeCgRwVC/TxQH0oCuJtWFWLVcEbktaexBZjdHRSuG/pyQn0spJmZKTFfnfH2ZhIQ+X4I/yBk4v0YAuqXJaTAXy5m/8+tUA+iNQvnSEM3VXF1/j0rXbgwRdOzuiwQBP1rw+QoZuVjmYHvdU8VOn7k65M9tl+uT7UD14s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NN5XT5dh; arc=fail smtp.client-ip=52.101.83.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NN5XT5dh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AZoGYUwTtShVYHbTlDzd4wwwmdU7ky+KxEGw8vKJyMshI1QP712NY52gwQwZWflV8+Vdpj62zh9MswSf4aGZWjACyeMqWAF7J7SAuLqzLx41l95yjYeqXe42zKvvvtxJqJB71D1igyYoywpE+Yxrf7J19f8g1Pn+iBIvG6ZNqf0nWMTIxuZe1S6tHLiOyI6RELiNRxzDEq57LewTxEKsDeP4/iLqHMAHpRG0EqmhwfM8ASz67xMm2U4xDc3asV40LpEjz2OxI5YoUInJQQDGzJDsWRa1e7g4/n5weUFnWQ0p3s4pgZE94zSaflrqk9H8cIckhpSjG+fHaRNB8xy06w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4s8WExxFeJWBEEKw7lJ63SJfAx20PrpdU8Po6qXZ18=;
 b=A1+9iMg8ZQNt1AicbVMjnbsvD8rKE8KEuwqpjlIiLoMpOcFnHjtK2aDV1ZiU9JnPqP60gtS5v/QIlNVVCdtOtqAyIt2f4xcV7pNeg1wSTgpSkVUBNHGNFniljcejszu1nXTz532El2L51BG3FMknRsWz2wxfOFXLYSLXrVzh1dB2Uj6zqFJcs1DDmJxjjMMVyY6jx7gL4SyemPUU2yMedcgLpPSPPx2c6kSsgTWU56zWHHdXYKE/5TSxVVH37Vs7YxJu6npRczfRpyOYp9YyFtdzOidzGZjr8q3IZvU/zS+P3tdH4RpJd+yxgOFYo67/Lgs1HAnXgYukou8k3W5wmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4s8WExxFeJWBEEKw7lJ63SJfAx20PrpdU8Po6qXZ18=;
 b=NN5XT5dhT9Wbo2gExhiZwjPuKriOM9OwL7VdoBI9PgeyErAQ3TQEPAaoFv7H0rBsn0uU7r+18jY6h9V+eaRBIICHY9RV2UQ+R6uHcuP9WzvxoY6XDIFv22xkjDjF+PpT3qCLRn7Ffqoi8WdkKkq82n31l+B/rEEknIM8oZghaqyVI7/3HJ0B2MdLqCPLpo5qsEnbZaA9hBj88s1W732l7WCDSvyqYo4L01nF4GG4YlJT35aVoThuLnT+ikc3menBqTQ77qjUxPuJSwvm5UxuUcqPFVbtxIRlc6ouwDkTgYRzADBMV2bm1J3VWb65qRAsCn8uFfBWrl6yr9p0W3eYDg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by PA1PR04MB10099.eurprd04.prod.outlook.com (2603:10a6:102:45d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Thu, 8 Oct
 2026 09:03:12 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 09:03:12 +0000
From: Zhipeng.wang_1@oss.nxp.com
To: Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Radu Rendec <radu@rendec.net>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jindong Yue <jindong.yue@nxp.com>,
	xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 2/9] irqchip/imx-irqsteer: Validate IRQ count before creating domain
Date: Thu,  8 Oct 2026 18:02:24 +0900
Message-Id: <20261008090231.796511-3-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
References: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0232.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::16) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|PA1PR04MB10099:EE_
X-MS-Office365-Filtering-Correlation-Id: d047e211-afcc-49e6-45ab-08df251afb6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|19092799006|1800799024|366016|11063799006|10067099003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	sVDWrafejOvm8oBQNOGEbdo9/kKeE74gaev4zbpeb50rh5yicyFPDqEzEs1ufCmBO2ehx2bwZjZmwI5OZ+2dCqQQuCJk2oqMtY8nsY7/YJ9ubjDtfUtz0AuUb7ePpd8pmUySom7skmuxpmL1yDXD3qxf2bmaAvrcdenQyeF8eJ/8/ltZkTGo/4EULQR7s+CFEU2YMv/9cZVTuo1h13MzNKqtkYrG0igMNXFRklEWCwmAkUWqwSxZQv1caz5BLPoOU8TmXDc7ttsn9+VNPX72h99znpOrMM2BT2g5drDaNQqTFFVgQnJd+LWKJLXMaluVTO59NFllK6fOcbbnKjDCBCtcEquZPjCqV3vP0pmJ/y+rJFKEZIlkRUQUp7uBb4Ld8QtBH5XRw17IE3hLf9E9J/+aqkfhFPgvfT+PJZRdWlkC9uOYO95ver0RQxqM5kSicPaHLaxYaoN6pFObDIeBRyr02cvWWk62cG42CBjWFuwZzsNNQCZwthZR1Rr+q6qujgG1D8rkl3tnDCkDuHhOC2Zv/ci3AXZ6XMr68J1yrKzWQVX/prC3WpM30oxUgcPBvTTCKbo6cc6716mEQlys+IP658pbTpuYpiLYraKe66OClRsI03WZddgznQhDqz3bVmxK0ZGUnmyDf1dmPoeuoyLFwNYU18NWCoClFY+ltbY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(1800799024)(366016)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9oZzQmRHaLM3P6luCybQsVhKBuRMc03WkZVX3UEvL9l4giWbBeTEvbqjWiyh?=
 =?us-ascii?Q?putCP4tnzRnzz7SnAert04nhVcIZX3l7V0Bh14m+LaV4zFpYzg94+i3To55V?=
 =?us-ascii?Q?IVVhfR9Y1R3JBcpy4RaJzJ/U4cH/DHLezT6jr2Z2NKS9kgUKYlcQ/unR5YOZ?=
 =?us-ascii?Q?1BoO8JNWz7rwp3EX+QfS7ABB+nIu5V4RntWq0+4CwPMyPiKvHBJGh5+TzZ2H?=
 =?us-ascii?Q?iQ2cLhSYskLJu4/XllCkcWvPN/GKQj1Zqt0OV0dlJwQEJY9Lj3Mr0smh9dYI?=
 =?us-ascii?Q?QnjEqG0EHBcucN280m0spjONqsS0jZ6O5VO4TaC1XEP7GQ1XuD4D8KrTFyGj?=
 =?us-ascii?Q?QehuXznME1xF5N0bl5/DCsIyvtehF/c/Zy9plWq6DsbHWrqpBO+Mdg/uhopC?=
 =?us-ascii?Q?iEPnztN4hh8jS84/QcOCRUu6H4o2tpDm6F3zD+RbbIs3eGWoA3cmsEe2BAX3?=
 =?us-ascii?Q?/bslyPyRA08Ee4PNKwLEHaw/4gixdS0gwHo2KWzegn2sch0hYuXc37AlQIrJ?=
 =?us-ascii?Q?/6hPyQ0xvQjnxJ2KaHUL97l6mzEegzYplEDqHl/WzyogRRm7p1RImFhZYW1L?=
 =?us-ascii?Q?xut450vxXOw9qyoCVrLE/Vu/603ZdId2rWoMA5KxBW79HoG52zI/ZuZnpaE2?=
 =?us-ascii?Q?8C8lJ9lIC+lorLy57a5FM+G3dFugVzZqxeAH/3eIQqADn6cx96WXhyioye13?=
 =?us-ascii?Q?sab7fedmasaq0TRO6rtUzPRtkoIPwb6aPSTm+qfCqUlOFUzU3SwIaq4XpcdC?=
 =?us-ascii?Q?qL/ftcAPOnqLwvX/HMinqQAUnlsdsjgoFNlMcnmSmbCcaAEyFb4EDhSWtNRt?=
 =?us-ascii?Q?mn15m7OecXdb+ojrOzL0IfQE37ltLjYXcqgM13ND/nfFf3GffsRHMvnRR+qK?=
 =?us-ascii?Q?+hVGx1UHjvxONC0o/GjVytnv3iLVQ0gV00pekE+hRf6Bin2RaylIAYmD79Ht?=
 =?us-ascii?Q?ylTmQgLwN8uBFlwp0xd70hA503UFVJ9K9kFbx2JqvWtPFXPoxGSfuP2YIwwm?=
 =?us-ascii?Q?OLqVAs1lQllTdxitzGnL5NQSR2M6CSu4Mzp4wyLQYc53dOc8kr4dlqvOlEtI?=
 =?us-ascii?Q?7viUAY8N/MYO5lWccGgstraaG4GKdfaBZOgeflxevOYolXSkBUad/8+yGiYE?=
 =?us-ascii?Q?8qNWVGw5xElzlpTq4ver3+ZyaKA8B46FCv0HOJ0xw8JPpIqfgSJjmFDRBNB7?=
 =?us-ascii?Q?+KbYUdshxVSwT1nlW26vu9Qms7sp7OmKsk5E59p54IEXnh44gwdS2A+1YQ1S?=
 =?us-ascii?Q?LYYMXJ/As7RAy0TWghm6hFlWQK23jmdVuUiNfQCDEPZYVAB2Ad/9xqtA511o?=
 =?us-ascii?Q?u8JIvGarKRuG1+3F59wQHmZ4ukkbpzFfsAodD21nkkauc4035Tgv00e1Mi+M?=
 =?us-ascii?Q?JwgU2kK1N4kI9z9zA31+HS8/O0BrGxfFq+466NKzkHZGUdzcya4m9ccrNRy5?=
 =?us-ascii?Q?XdNl9nB/Swl16Cxe/SmSEr9rd/UHuvE4kD33oFy4+PAP3a0q0SljMihZeHaG?=
 =?us-ascii?Q?1JcihjlJiXlGNdt+x0DNYXm/l1u6NlWxdiPXWxBxvqQl+FVxcmrD6GJwepaT?=
 =?us-ascii?Q?v+rRLl9X7iewCboE61zV/+eClv0Ft2KmPFegiuqlM8utH9SGX6M+Rm2bu0iq?=
 =?us-ascii?Q?ZAOa9SIwdbctrYRmm8XbRYdlAS6KOtaLAiIPYing2jcz1KvvcQAAXOGuUhrH?=
 =?us-ascii?Q?7wwcdh9Itcfws42S5XYTXy47pxqKZyDfhwYR3Men3l3b6IuCgDzlcaVKhG2K?=
 =?us-ascii?Q?klu1Xr70ggRsAzeSzOD3L2G9Kaeav5XpQJAlChp+skBtzxq22zVQ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d047e211-afcc-49e6-45ab-08df251afb6d
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 09:03:12.8550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ocsghMGWBw+e4tLJd8izzYOsi5A1hTgK6AuvYviB/+ksTVBnIa+J3lmdN8Ei4TA+1K9/KiZM1w87vewVERcOidbxC36HRaHpgqIgLYigQr9EUDTrahq8tC6xWhfvcOJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10099

From: Fabio Estevam <festevam@nabladev.com>

The IRQ count is validated after creating the IRQ domain. If it is
invalid, probe returns without removing the domain, leaving its host
data pointing at devm-managed memory that is freed on probe failure.

Validate the count before allocating resources to avoid the leak and
dangling pointer.

Fixes: 28528fca4908 ("irqchip/imx-irqsteer: Add multi output interrupts support")
Signed-off-by: Fabio Estevam <festevam@nabladev.com>
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
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

