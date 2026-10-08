Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013048.outbound.protection.outlook.com [40.107.162.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9EA47F2D8
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450253; cv=fail; b=L2glw4NZIJwA5rc+uO91egcTIqeHTMhe3DN6sdi1+gqUAHPNIQO1gqVBqjtgvdmRtLAwxm69Lp+8SbdBNs/ok2nZOs8+mgBDVu8orCT5lTb2TJKpqSod9oYD/M+ti9hbwij3TCVajhdFPVhvHhKGZl8ELNQuw5NibOEOv8NJ7Cc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450253; c=relaxed/simple;
	bh=xdS5jddoPZXbbe57TR9VYIBzdzLFfyEJcdJZGHOqdhg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B8pAKpnW7dQPKNw9OZ0ohEcRRL6IV7Vs0QCzjrM6SmwTVGSd5YvRClTIGmMx/eoHfkVeRlaP9T5ihc0Yzio3ZFAO4SxgYi+i96nPJvzl5ve4DVCznfn9DmNN5toB4gA6KznUHic1iMSRL3sKHE0JrT+n23jmueZze0RTkIel8Ok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tdA5iQe1; arc=fail smtp.client-ip=40.107.162.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tdA5iQe1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ameiSvBSBZlHIAAcZl/q63hPfAemmi8yCIYkSU1pI5/A2R65vAHYmzAy04GAvz85SUwnLeyEQv7bqZPlESxg30cws7/fYuCMMu2SyWVU7VlYjs2MO0Atru5c9xPpnX56hSOjBD0CCFY44Ku4QKYicz2EItLq09AWOM1PivBUtY7V/+UobpLgz2/Q6sYpr1hD1iEnOmJRYDA55J9oubXCyp8VLNqblpbFuSfSkyZIbWXapZeaRP/gz5uTSjBy4HG9JzoOrSuz2WkQ5p5ueU1w87tOOM+Pr+sWFYl8M9YNIqK4Pdd95z0hYQ3DJDf9RAI83qjgr7LNVmTb9ykycJ4Mqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wAhc9sKqFZfoQawq2B7jnnH8jYo4YFpX5HIFZxAZOco=;
 b=orywJkPZS97/4p8z4VI1wPxSyegolH5ZwKZo6nv5y9mDlCaXskflOZyodu6JL3+KDiWAAY6D+QcBkBfjKSGJfGDArDmtMIYR+wXQ5KNOBaeRQB/latzvT5TQltYHeoJ64FXfV+ceOc0jU01amQ9BhABmxBv99oyy41WqITrKqOWKfcGMo+G7iJ2CqKJvT9NRgGjijD7seN+fGYnBJzTbexBrxHB3I3lbcOyX3vfv8gBbzmv7kWBGQ+FcyKiHlBO8NivGdGCs/4bHOKTlD6RE1nlJTY63nYTpyP2aMMSumtfK3ZsH7axMmXO8IdAAcLSQKlsgsQLnJQvZMG4vsGdB+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wAhc9sKqFZfoQawq2B7jnnH8jYo4YFpX5HIFZxAZOco=;
 b=tdA5iQe1gJvVPCBBbB8K1H6aM4vePJhUBKpWh+y3iU0HviFCxVClQBG8y1nG0OsFTWBCuIkeQxYfyc72SHtpiEkqaXJwiJI5WXepsxL4ICT5uUz7iWucXBE7cQekh4zYxH4Ib6+NBQty5p3fV6TzFnKpmUayhudxLbAK0muQlwjeXV8kSZm6tY8AFq++3CDUwxEYeTzN4KoA7ELeM485OlxBLZkWSogeT4Etk5qdBEcNEfWrkbkkZHeTu8jxcoBrGkX+zbAVusdKYGrirn8y/dKpjrkg1goh7c7iKGMDwHA2gMc0F4yig1NoUwTE5+SeCvOwl+sWru+iTly63wr6DA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by PA1PR04MB10099.eurprd04.prod.outlook.com (2603:10a6:102:45d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Thu, 8 Oct
 2026 09:03:58 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 09:03:58 +0000
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
Subject: [PATCH v6 6/9] irqchip/imx-irqsteer: Let devres own the clock
Date: Thu,  8 Oct 2026 18:02:28 +0900
Message-Id: <20261008090231.796511-7-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
References: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0186.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::9) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|PA1PR04MB10099:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e7a45fc-26f1-4c9f-5680-08df251b165e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|19092799006|1800799024|366016|11063799006|6133799003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xMOOejfcHbHI4RK2Xm6pck47QyPeMP6vTn3T3bk2kEO2f9dGnvZxcZssr7+u5B0o8akPZZGviiYfgMhniMhS+7jw+HH9qwIeIA5QU3n2LqG9pzDmB5qB6sj1HbdYGCbkTqCPXDv2mutYvH2hUBvA7a5NBqh6PWWbTYtVaDqPBah6f8EedufInQHtGOKCVVEIHFSK+3EsxVZvAIof6lvLdjy/BOeF64c8SL/RmCwD5qaOXKRLfCj9kkIvmNbiMPVv5WD9M/aTAl2Nvfzwyel0Sia0kHLQ5m1Z4XN6TnhdDzuoHPJSffJ4K0QH2vtN4Orf40tdOMfGYLa1H9/biel2sXSu+38b5idbzYY8A3SCdmTTcfc01jxeBYKl4KoORgdS7T3Mk/uQegLboh8ijHPFBUHKI0G4WDmkrGosD7nI+2sosAg+pGqFpsuPpQWsSCZRM1IhIw+efxTPDJrRuidstQ53fYTit0/dgy7mUMpBx/iC0gm2vXOXE0PkwBzOOAxKVJu125YWDylRbtzu4ffk9LYpS/txG+VgvIcxhqGeoUAKphrSVqSq+P2DRn8b7WkYzvmaO9peBDkzSAl4Atlbwxhvnuvaq7EHUGY86Pcpog+XzM0pn5paWLb1Hf29KyxHBZEhNUsp2n4Fix5w/Cpf8Ai3BhKONbimzZcIC3CPjoI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(1800799024)(366016)(11063799006)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pBLcDIMo0KYPr3pnw3DfUfpawCJ1BFCkdDNU5DCkH75mqQtT4DwfBJpeAkK6?=
 =?us-ascii?Q?GEJtEs34Qhjd9UVqB7R078y1dfbCE+EBdWW/uMQK3AYERk1ZPLpbjaFsWwyx?=
 =?us-ascii?Q?nMapK6vKkYXAsXn1SkPYa1N+85E1byJBloiAnvu+pnxbtXzGjfqBN/HwS4D2?=
 =?us-ascii?Q?XP74gxYUTOFoZOaaRl12iL+H49/MXT1O/6e01wGy+R6AlrT7C5JePeQkTKrU?=
 =?us-ascii?Q?s7UP98YfDzjrm7bOoxGVfQ15gKUP6YCqX2hFJ8oSCqwTDnzQyxxEafS9allq?=
 =?us-ascii?Q?wz2l0pgIRKtpBW1jZ7doFrODRDPJx7fnLjoAeXxS8eEMspzsjY5rjrsd8X8c?=
 =?us-ascii?Q?AO+422ZCSrag111RXVD/mAktTeqzByM0YIN9gEaLmA0KpakvKjG8vO/RBnaX?=
 =?us-ascii?Q?zRaQ/kiscCngCdT6Vm0jFZU9Hie2m7JQZUIWdqoZ+EOZk60LkSo8QN/O910/?=
 =?us-ascii?Q?WQoLDLAmgh2MRBlVuwK3nJHVTUCFwguCPSfy+raUnH8xxhPf6RqM3qbhp+m/?=
 =?us-ascii?Q?10jgpvYHYfFUzNuUrE5/LsJyJgKs7JcBC30ZMqEq6R8HrFIsj/g72JrsvuBO?=
 =?us-ascii?Q?cs/d9/tg8Hv2KQYuxbrD5scVa9cRBx+M6j7TsX6AKV/Akg9ayAYfWywmVr+o?=
 =?us-ascii?Q?auXqsqcBo/lWpbbcyG8g/MCAFQD8mmeGr2sI6cvZocDA1OG9eMX/nlUTzB3k?=
 =?us-ascii?Q?bI214xUFqx272kHo/ZR9GqI0Uxwf51pvEBy57Pfbl/6zdgeI3q5XppZVCOwB?=
 =?us-ascii?Q?GLHklQI+b30OUTO1YKW+YRocm6zi5enzfGQ32CsA1ZqSROXoSGBcXbZ+WVge?=
 =?us-ascii?Q?KN1RPs0Uyi6M4angfX62ir8QteBTq35vKn25PwjR1H+DwLQ2BqGhHXbTGSue?=
 =?us-ascii?Q?xP2JOFw0TRzI9zLl0m07tYUFud5zGXpXkoGbo/nURFvoJPTaTgByiR41scEL?=
 =?us-ascii?Q?f0C+nFfXCrJBTn5ctu92p0wg+6MNymG3DHXnYzZZ0VRclvNc8+ooia8CalTi?=
 =?us-ascii?Q?nLVt4fo6xsfSYTN4E4AIaUw+Z8YqqjJzPfrSb45kfrhGn0x8tEDsFzhPT9AY?=
 =?us-ascii?Q?+mr+b6y9i4zC/yVKvZLSSPqyUNc+9a5I8zKjIXgQbBap9KZ/XU9e12fP40yq?=
 =?us-ascii?Q?F7MWPT0btlutgQ/CTT0wbmXWlA5mDJLIpTyAj8oWWIT9eI3svu8u1O2Ab8qb?=
 =?us-ascii?Q?WB3UNfQnheiZQJTuDJQ9A8LhfrGqFP55UASxmyxvlfBZdYg9Hhoxh1jGipe+?=
 =?us-ascii?Q?HTrJ3yjtWBoNDe2UzVwKHnIqznP5+2FMO+ngFaGnzLN13c2bMyeSGZzuRoC3?=
 =?us-ascii?Q?j8uM3fJ/Cznx90NxjZzxOQmq3/HwoMdkLAy2vv0Pi1kolPrP29tyDIaRMJBG?=
 =?us-ascii?Q?3bqtq/MHoZfdZ0k+WzrhqZgBLRnNN8GVv/Uzo13RhbiJzXa3gRPVMUPXYm61?=
 =?us-ascii?Q?aHbs+DuT0E0nWCRms79Om2Ml167ZoKI19gSKJoQAFNipEs2LpUOTMRjmld1U?=
 =?us-ascii?Q?hmvn53zJ360EMonlMw7GxbVaiMIKQeDHytKHfdZUi5NxbVonGg15TBQcCh78?=
 =?us-ascii?Q?QuqoOEisHwaELHa3kx43u8cRGdw/lM6IdmFX5IWatf5582mqVUdul3Dn0RAe?=
 =?us-ascii?Q?fTBaDfaMwKs60oxMgyvNXkKndBTGiMsDwgvX71uNqzuKJgRnRgH7hsyZfoJh?=
 =?us-ascii?Q?NF9ySOoTyr1Hnsaxb5UJNH7t8H/P7ogDrVM7mb3Lo27gvtFqe01sg45wiVXG?=
 =?us-ascii?Q?KoybUeNE6Tnm0bsxdbte5diYgvR35cSuPvk0rS775xtq/DAS9/s+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e7a45fc-26f1-4c9f-5680-08df251b165e
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 09:03:58.1537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rX6UnygGSYBW6zv6RmL85aNRntWyva7JhFiTbT0gAA/0HbjERRAEGN9nrbFIHSIo1HwR2e00rZFx92sDoSTR4zSwNdc63WUO7DY0gwczjyBiMgkl7mFQTPuRGgHkFJe+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10099

From: Zhipeng Wang <zhipeng.wang_1@nxp.com>

Let the driver core own the clock lifetime so that the probe() error
path and remove() do not have to hand-balance it:

 - acquire the clock with devm_clk_get_enabled() instead of a bare
   devm_clk_get() followed by a manual clk_prepare_enable(), so it is
   prepared/enabled for the device lifetime and released on unbind;
 - keep only clk_enable()/clk_disable() in the runtime PM callbacks,
   since prepare/unprepare is now handled once by devres.

Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
 drivers/irqchip/irq-imx-irqsteer.c | 37 +++++++++++++++---------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index fa233de9bc2b..15ee50f65d54 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -194,7 +194,7 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 		return PTR_ERR(data->regs);
 	}
 
-	data->ipg_clk = devm_clk_get(&pdev->dev, "ipg");
+	data->ipg_clk = devm_clk_get_enabled(&pdev->dev, "ipg");
 	if (IS_ERR(data->ipg_clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(data->ipg_clk),
 				     "failed to get ipg clk\n");
@@ -229,12 +229,6 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 			return -ENOMEM;
 	}
 
-	ret = clk_prepare_enable(data->ipg_clk);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to enable ipg clk: %d\n", ret);
-		return ret;
-	}
-
 	/* steer all IRQs into configured channel */
 	if (irqsteer_has_chanctrl(data->devtype_data))
 		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
@@ -249,14 +243,13 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 
 	ret = devm_pm_runtime_set_active_enabled(&pdev->dev);
 	if (ret)
-		goto out;
+		return ret;
 
 	data->domain = irq_domain_create_linear(dev_fwnode(&pdev->dev), data->reg_num * 32,
 						&imx_irqsteer_domain_ops, data);
 	if (!data->domain) {
 		dev_err(&pdev->dev, "failed to create IRQ domain\n");
-		ret = -ENOMEM;
-		goto out;
+		return -ENOMEM;
 	}
 	irq_domain_set_pm_device(data->domain, &pdev->dev);
 
@@ -273,15 +266,23 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, data);
 
 	return 0;
-out:
-	clk_disable_unprepare(data->ipg_clk);
-	return ret;
 }
 
 static void imx_irqsteer_remove(struct platform_device *pdev)
 {
 	struct irqsteer_data *irqsteer_data = platform_get_drvdata(pdev);
-	int i;
+	int i, ret;
+
+	/*
+	 * The device may be runtime-suspended here, in which case the runtime
+	 * suspend callback has already dropped the clock enable count. Resume
+	 * it so the devres clk_disable_unprepare(), which runs after remove(),
+	 * finds the clock enabled and stays balanced. On success drop the
+	 * usage count again with pm_runtime_put_noidle(): it must not trigger a
+	 * suspend (which would re-disable the clock) and must not leak to the
+	 * next probe of this persistent device.
+	 */
+	ret = pm_runtime_resume_and_get(&pdev->dev);
 
 	for (i = 0; i < irqsteer_data->irq_count; i++) {
 		if (!irqsteer_data->irq[i])
@@ -294,8 +295,8 @@ static void imx_irqsteer_remove(struct platform_device *pdev)
 
 	irq_domain_remove(irqsteer_data->domain);
 
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		clk_disable_unprepare(irqsteer_data->ipg_clk);
+	if (ret >= 0)
+		pm_runtime_put_noidle(&pdev->dev);
 }
 
 #ifdef CONFIG_PM
@@ -325,7 +326,7 @@ static int imx_irqsteer_suspend(struct device *dev)
 	struct irqsteer_data *irqsteer_data = dev_get_drvdata(dev);
 
 	imx_irqsteer_save_regs(irqsteer_data);
-	clk_disable_unprepare(irqsteer_data->ipg_clk);
+	clk_disable(irqsteer_data->ipg_clk);
 
 	return 0;
 }
@@ -335,7 +336,7 @@ static int imx_irqsteer_resume(struct device *dev)
 	struct irqsteer_data *irqsteer_data = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(irqsteer_data->ipg_clk);
+	ret = clk_enable(irqsteer_data->ipg_clk);
 	if (ret) {
 		dev_err(dev, "failed to enable ipg clk: %d\n", ret);
 		return ret;
-- 
2.34.1

