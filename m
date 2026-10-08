Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011018.outbound.protection.outlook.com [52.101.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7523247A87B
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450293; cv=fail; b=dTIkVGY5orRgImTP+3MWAa+R4B4oS6qa5qP81fiSa8zhKKIVH00OqUsk9DKRstEbxiNUm4wQPQxqI02EmdJelCeVo94k6XLxnKxf8LumqcbKZPw1OgoYgnGOY/kV1pmLVH8kdiwONemAGy//+Cf/b0kupRzmOmYDtGQ20fJF1xc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450293; c=relaxed/simple;
	bh=7+zgrgMyF/Ryci4kLWDC1s1LqCjGBhNVKcRWtEscp/4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H2zuqcgp4g4yIOx/ndLUcCwBTNqqm1+g92sqZXTF84U1zW5EYz6XG832VGCreYkhfdbhD0lQ5emibB2HLivcopX7flIVMM7maQIAnlnTNapPlBrCcwkVUUDDjAwiXWALVD73pXRK7dSJyIXg6c4EEqQ/cUIA9mz+MsuiFm/N5w4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SclcAJ4n; arc=fail smtp.client-ip=52.101.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SclcAJ4n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=glq5TMXuCWteuh+64WfM/O6KXQZXtmdw9RS4qvly6Zyxzg+ncbtJq8yddKFb63ztcGU8RtXDADUKosNhxoRz0ogU4hStPZSLQ/UIQ1Oq/Dug06Z+qCoiWLt8QIfnJIeWAdTs+J16AqRj1XRRfQxcRgl1zNM3iKZ2M4mal2cQtW5rJ82pMErShgDXzk2rDX6vkiCW1zrPrVS4152q8bQKIxmCoJI5TkwZMJzwpio+8szTrGnQmZfZczhIihBS8bxOyVHRH0ek+oAONMvnKg3B6pjmldbWvMlBSpB2N1coonBz2vEoF9Da/j4LV4ZR/xi5cRk6MYzWWpqkSihu6q9kEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pbzgh1rE9jSe1dLpi2zHw9RLF4HlxFwww2OgMXtHNUA=;
 b=f5dM5faSsTfcPwt9+Drfgxrk8EK9h7lr3tBRzjYFv6QTa+d/pjY30mQEP29QfF5NLktfVf5Zta5lXHVjG/VVuCsHGP/2wAT6nzY+gFsRakUvSeGnA8B23qhzrEFWZpKjOG0Rm5Ymak3VLl5iuqR91lyKKSDq00B3BisZVTDpPYsrPdSCfTVCKeBxb3hj5Ojk5/9P0ZgJ+WhwdaINaCx+ymW7Y7QOC/vzRA5iim4K/mPWbAQiH/Om0pyPpoO28We5IcqL8UQH25YQuT/0qL1U+ZdhLJdHRvaCcxDB57jSjj0Esu4uk8Otk7CoiBaQ3HJkQHhIhbPNW4bypp9InoTITQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbzgh1rE9jSe1dLpi2zHw9RLF4HlxFwww2OgMXtHNUA=;
 b=SclcAJ4nCNKfIo4bBx5KCZj3esVqFqz6rueNG4qBFuHy8mM24jDUGwig9x1uDxX/LAIjQm7i+FTUIN69f1OveulZ5XoFM3uDMBXyUyVMkoaLh1Oi1A3cDCYLryqYo2XfdMULfrnpzhpXT+pDJzjcFaZ/5TAYa0ZB5H4W4IBL1vZeT1E0tgsbs651H7iQQBxgnjjFg+sc9nomEqG7CS3csFTcXS4W3ke+y+P/ZzxHPWDelhZl7Pk1MEx0SOqR7/gXENGVDYN/iIYIH5wZZWl93JhtvrG580NhGNznngVwk/B+X/xVXI8FQf/I9trbT2ZKDWUbrhGOXCAL2Dr21qe7yA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by AM8PR04MB7459.eurprd04.prod.outlook.com (2603:10a6:20b:1dc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 8 Oct
 2026 09:04:47 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 09:04:47 +0000
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
Subject: [PATCH v6 9/9] irqchip/imx-irqsteer: Use devm_irq_domain_create_linear()
Date: Thu,  8 Oct 2026 18:02:31 +0900
Message-Id: <20261008090231.796511-10-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
References: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0137.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::17) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|AM8PR04MB7459:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ed75c2e-04dc-4620-ffdf-08df251b33cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|23010399003|11063799006|18002099003|10067099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	6egNc5AGUTw/vmjndqCdiJSK+RSG1hmTsS9juVEgYBpvLx328idUPIi1bu1Qtp534rWu9aHT055AD3Tw++LVdmF1q+jN9KFmQ5fKVTLasY+8EEub0m3E0rOVQ3hSuq89/FR83aKSdv/yKeXBvPtpRxnWgCdGuP81gdS0MsJNgmPGnQmp8TB3SFRDjVe5zrHgJKF5kOH7ALWvmvoLi/zbeCBPc9Oi8hrPOIqlVRY+oQoq2Z6lf0VDZF9fAX/n4IGQtwx9eOoG1yHL6DcWflbRZg3eqaaC/rnZeZ31vytA9ZM4imUp9p26irpuzCIlB5Z7iCf5JK/wjoe4BX6kWYFmQ62XXZFYTdbIIS0jFU166fWL/XZS2ZC4bYZM7pL9dpsYURQj28vEYD8NP/0A19XbLNEN7AdAmEgJ6PPJgCjKABIzjbYrwBbW2/xGAJKp3BEW9El+B/vLm887DCj6yjZmoBPTXZWSlT3EvrmGQaF284kDvfRguY0nRoq729nmgIknFlj0qaJzXKO8eq5sbJzx0D+yBxpQu9Cn8Mq/SvgNnIevjcWy1PpJwq3Qjoh9vRbVRSa7mgOTefPJ+VI2+YsmzXIUpbMRvezzadNYpTM38b+YCUFcziLyxeMCKAip5meCBTIaBVyG7Q540KPGmfBD4rqXGxXQgZCuqaziwyXjd7A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(23010399003)(11063799006)(18002099003)(10067099003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+JFNNfk5cY17p4+mA4QQkbRWbjJUZDnguDeSQyFyvYO60gJLiF3Wkh+wiBM8?=
 =?us-ascii?Q?oFhTIks/zVcd8s/NfYmIRm/YSOYAHau6t+Dx87nAhr0QlfDJBZeZKovOpwOV?=
 =?us-ascii?Q?IT15PrOXi1Uv/FH8GY5GKPbIvWBJHSXfUlcQyx8G9gAgsFePtBMPRckP0O+V?=
 =?us-ascii?Q?th/siRhHfN2tRNv4evxvo0qQjg/CltmxSztvdGI2nPiL0WMnLxut+9X5HnTq?=
 =?us-ascii?Q?n9qjJwYt6vPNHOpGI9cqObzSrdkDhXt98kJivelJMwa18BjCG/D8E24ZKHDR?=
 =?us-ascii?Q?6b2B2txPdpXLi+mbfFnNd1h1si2qmoX2j1UioIcd83/OM24s5n0/cS9aVRwf?=
 =?us-ascii?Q?YcwTKPbiKmqbjrQX3hVV1w7t2zE5Td/vvVhaz/GsJQFwuiZ/yKAoGHPeGluy?=
 =?us-ascii?Q?5pfdG+tQdqNsffUYv86Wj+JzbybqOfdeBl+kDvA3Te24mrWkXruY7QwMPDYG?=
 =?us-ascii?Q?IRcrBtOJzrLH4mQLsU37PEbH5XrmKy80J+fHS99KoIp9MMI6Ybey8CAxi0qK?=
 =?us-ascii?Q?YMiTRplGmxOcmmqF/jvCHgL+pnJ5iKxosaQ8uiefCmytfvIngFbgLdqEhpGk?=
 =?us-ascii?Q?OQMRYGDU5WcrJvG+LwtXCC2r7/pZ6qqs4K9SU45cD6eLGeoPZl77uOFmQVvl?=
 =?us-ascii?Q?gJ3psH4Blf5AMALWjwZaeBMKES1xwOEJ9VtYXSbItO/mHvYe2xvu9FeFxgSW?=
 =?us-ascii?Q?MtrHHbgMTyWr1zA3Vc7CJ76LHZzbv4BjwdScCH6ei7bmiDSp4Af3XaVPzwlM?=
 =?us-ascii?Q?1KImYBJT+mxwEQtr+X6Azn8V5hCAmqHk4CVi96Xz909H8YD/op6uovyJLTul?=
 =?us-ascii?Q?0oYLtlRoc3ykx0SPzpYbInCzQeQOHcw093zk39MayvoWcKjZeqSE4a/ySULn?=
 =?us-ascii?Q?yO8evha+CVfrdyXsDG/jqNbK2zANt66punMQOp9W3HOVB8VBJizNbqM7D2Re?=
 =?us-ascii?Q?VKrr3/STdSrj3QGhHzWPspFuLxWLu7WRTnmc/nrU/ncanmuZIy0EdN75ql8A?=
 =?us-ascii?Q?aGNolTbmwquLWMnOxfBS3HaZkPo0lvVjG1swl1R/9rI/9f0iTDLeeu9Njmb9?=
 =?us-ascii?Q?R2SrJt5Uau7zCPUxf9YXhtp8ETnLwQrKom5IiSf8zevyc45yHr6riPGdljKL?=
 =?us-ascii?Q?CHaH7/hhR4Gt+WMFpifbF2fdi8io1h9yUkvFnHg/qaQAAjS+yRKzlBF7UQ3C?=
 =?us-ascii?Q?E/HYdRoiS6P7FDhLW7QpIwYdCs1fKlcP9J6epXytRUokwOqTJs5NBg0TlW8Z?=
 =?us-ascii?Q?lRF4wsse5HWCzuvezaPaa1UN5FKlidGjNPXCH+drg53H2umhS1SKhGLV6BQ/?=
 =?us-ascii?Q?/UKlWhrA47ENrFUAV5PcawwiRuWWg0OX/UUwQ6VgKsi0olV/wOPswFYv5fC1?=
 =?us-ascii?Q?99zO84dXp0ClSMCgdfBxVRKQ+HS+ySEGIr/b1iZjWwd7EAeh5ybV0n+t5DYM?=
 =?us-ascii?Q?gPc9JrFFmVZ5SJAbyx7t55lokiHQeHveFOI4g/MZeBU0zyIFgJlf42RcJ8/h?=
 =?us-ascii?Q?/TYGJ3CFHtohoxbv2w6QRdlDczoGbbkt4XHCoaqUN8Tdior0aLIi2S0VDrEh?=
 =?us-ascii?Q?4RZmc16snJXesENR5r9paKL4BZX2uJJ5FpPakXqyDlBdCh3o9LZGDWttHucP?=
 =?us-ascii?Q?CG2Rhldofv/xoUCfv4eEcJf2/WCklPwG0HZs9g2o+XLolqKhyzJsHQsV4CRa?=
 =?us-ascii?Q?RjH71u5hnLrojD9vbyw9HACCz73EIjK52/0C9RPB1Jf55varf13qlAt3MfwY?=
 =?us-ascii?Q?zdGGm4UJqlbQCKPrhmrsBclzoNd3+NRnI02ypAXvgdEdUoV1lTw+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ed75c2e-04dc-4620-ffdf-08df251b33cb
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 09:04:47.4178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HsXH2pBz3rY6mCzQSZ15NIc99SLxWl0MWl8kZ8m266Ky51fxUoMHtb3OTy6piPSY39R68EGI4ajauYhbvqFEk/MTWgxDtNh03jM0LTwVZPpLB0R0sir+y6BTBSoEGHG6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7459

From: Zhipeng Wang <zhipeng.wang_1@nxp.com>

The driver open-codes an irq_domain_info and calls
devm_irq_domain_instantiate() only to get a linear revmap domain tied to
the device lifetime. Use the new devm_irq_domain_create_linear() helper
instead. No functional change.

Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
 drivers/irqchip/irq-imx-irqsteer.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index 85edd5e33ca9..f5601769d036 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -246,8 +246,9 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	data->domain = irq_domain_create_linear(dev_fwnode(&pdev->dev), data->reg_num * 32,
-						&imx_irqsteer_domain_ops, data);
+	data->domain = devm_irq_domain_create_linear(&pdev->dev, dev_fwnode(&pdev->dev),
+						     data->reg_num * 32,
+						     &imx_irqsteer_domain_ops, data);
 	if (!data->domain) {
 		dev_err(&pdev->dev, "failed to create IRQ domain\n");
 		return -ENOMEM;
@@ -294,8 +295,6 @@ static void imx_irqsteer_remove(struct platform_device *pdev)
 		irq_dispose_mapping(irqsteer_data->irq[i]);
 	}
 
-	irq_domain_remove(irqsteer_data->domain);
-
 	if (ret >= 0)
 		pm_runtime_put_noidle(&pdev->dev);
 }
-- 
2.34.1

