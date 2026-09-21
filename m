Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011053.outbound.protection.outlook.com [52.101.65.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FE8484239;
	Mon, 21 Sep 2026 10:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987627; cv=fail; b=cJJsSj7cRmV57foTC6hYeUqOjRbgVl00eS2VOC9YMvtQmoNYgwjL/+QEWgIo4vYl36YTo7O8B38ifcvs6CXfQcaXWxbaTjVAtpsy1ad1lSnejFs52v4AHboKIpwPH6/k5EgSLRl4xl+vseWlyfAsGsRB8Ydf+j0TkEqCvbWLQMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987627; c=relaxed/simple;
	bh=j63a9iTwY2s2JYCC+5DeGojz4NUG4NZQ3puZpH5Oy9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uaR+lIPH5uTxM5x9o6EU7L6xhblBBuXBSO10vT6GtIoLpRt1wpF3b/7t6okHpuOqNKUQkgQ5Q+C+jTvxYvNZ/ECkn/JO7NO6IU4snecqoh2TqnMArI4f8qns/+uu3EeRBWRHroQhgllWXX2lODbPNQfcxHtWn9Wll99/qrLX9/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pQLtIO87; arc=fail smtp.client-ip=52.101.65.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pQLtIO87"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kq2q43Zzao9KG+q2F1F8JwN0NwxOc+Esq2V/thGGfySeJFP/6mQB64sqIZZnU9tL2tTXgwfj/5o97DdQnPO5Khn0259wenPmJkavoibWtNWogkGZS4f9vwFSaFz7sfg7dpZtoeY5cQ3EiL/ZOMcBeJ8jch5XUXzV3Bsg4uQsfKKC2oL3OFqrkPjo94gT7pIvGET5ryf7W4lluEeSGl5ke1HcLGddGi/7kvNmsznIzBSohjMtYoNn2zyGDL7WJ/sAqYrd4mBeK757wHHkTzirWNY/6sOvjxbTaLeWdpfdTWqgV9oho8raXzVVfttLPTYqHmcuu1fNJldjxZvBGxP/zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vuspjEBhcAWwrUpUYcbJuPjQhWhUPDhZQs4WpBw2HG8=;
 b=SPzy/L1Zti1hh+7xMzkRBYK+rDGs/dvYhkgxldAQr+StY5t5iJhvrEKn7capWnqx9WCsICBmyjyVXWRNCWpxZ0bDOOLXL7Jesc3v1F7zK+QUhiSpDeLP+SVy6I16o1mp/pcniE8rAxOAjVJGB2S8ri6eGPz4FDMLlQf9W0K+ATUnWNlzm5PRzwjCldBKKKSaXtJ50WWe5bpEd5oBNPF9nW5Ut9iPsj4ayQAhgQtgZGBtl0IwhiB+LPbh5Fh1eFvu+aOj5yv5/iyRz54hQWrCFNgZM6OJaY3EBqz/R1LG2XJ7eq8NfRK0b5YIo1/shnvxknP340LAISdqTEItbJwATA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vuspjEBhcAWwrUpUYcbJuPjQhWhUPDhZQs4WpBw2HG8=;
 b=pQLtIO870z9nm1hITpfl3Ek2uy3hFo6tZxScZt9KRlvYnQq2YcKo7gyPxVgapohrulmRQo+NKK5/LYa6+2+epIaG6FjmArjnG9WeRhBH2vY2vBltStDzvuAnSX11tbRuKP1vNzYOGODDnjaHLOl6po/lMmov1BEM7nxusYHvT7A7sgb4Zx3NlMHnIjhNIK1cdFaDkLr28kH3I9csIdLFk8k82xlSvmdEi5JFzGHN95v7rVTOhWth3YxR4IlrG3nJb4yjvMnYflWVG0pnBuLzX3t05FBBbTULtJZUog21AGJt+IYO565jVl0q8TFLlIkyc6Iuh+f+XQ3CinkjMaJg6A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VI0PR04MB554873.eurprd04.prod.outlook.com
 (2603:10a6:800:361::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 10:47:02 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 10:47:02 +0000
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
Subject: [PATCH 02/21] ASoC: da7218: Fix devm resource leaks across card bind/unbind
Date: Mon, 21 Sep 2026 19:46:21 +0900
Message-ID: <20260921104640.1941554-3-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
References: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0121.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::17) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VI0PR04MB554873:EE_
X-MS-Office365-Filtering-Correlation-Id: 02a2d702-a51f-474e-1fdc-08df17cdab8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|23010399003|366016|10067099003|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	DJMzdFvdEc+kVOQvXQwoF+5354i5ZOpjTkBpJf9aygIxGFKuQAIElauQOfdpqn706jj9Qc2msAnvrO41ul9uzdV3Wf38iXc1y4GwHB8rINBNMbvJAGuurdyputOZHioUKe/aUniYMq8q3mAOxksGxNScvyf9qciGXJNfoSmXcV+9pfGlp3Mkmq/i5CCgBaLYjXPKjppGp5DePoZBE07l0EXIobNaLHL+FOidO+6CYHFNzKVFstPuLQVqoYwOejqgbC928LlEomcpCfTeHlWlIOy3wMcaN0sayFrPfDJDnmW8OcBKsu+doqUQkoYJf33yFHFt9nx8BnYqWNrSnhNQYlrfBIs2CBuwXPnjtRggfYNYGDAwA8+PwcBZD3fbKaOu3AjaxHup8W9/HCz2o62b07QLt15KcXgDiBdReFwa2dIZBTcL9aVq59xBSHlw9gCWBW806hp1L3n0w250zB2ofLAMNX9TgkhzMZCAp6eFlGsj55eipTYWZQ03BFuOcTGPwLfapXgOEauUMV8TWKeob27hm0jPRmqJmq/QnA3La2OYr5W7jrkws7ulvNqRcQGhx09JeVwpoii837jxhrFUm3u4ahBHOhDWNDeZbjeHEMywYoYF8uFedXLwaz3kYYFPDDoEAVZPa8dWILKZOHsb+w/pbewt/BIL/mi7GEEPXtM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(23010399003)(366016)(10067099003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0FF3TtKEfY+jZgfbMdBwuRWyE3DGOxgKrrbsY8IwX1AgQAM9GQbMIiSWLh2d?=
 =?us-ascii?Q?7Ec8rp/V+FyaiKulshrDYwHqDY0+O427m0WSko72oHuVqeHPWWYB+4WyYeki?=
 =?us-ascii?Q?OoWgst/VN6AdqGX7YfEps+L5UmHYY8ei4+4IAyhNpdAg2t4igjOuPqxeHz1/?=
 =?us-ascii?Q?4aWPgrvGCgA9sZ108Hv2XaDSmSpQRUE8iAFfvrQLjhABzw+mUP7W2Pfbi0tn?=
 =?us-ascii?Q?hXOqkU1rS5A0rSbRK/WcmX2G87l8lsNDyDrhqKpb5uyS9n0LikXD8g7DD3kY?=
 =?us-ascii?Q?3MTUA3NmEe1t8XVjdZRDOxtu+ak8O1Chxsc6yA+15eTopScTyDvHlUdY4hi9?=
 =?us-ascii?Q?oIBTtDReqf/j9rb8wiKRBcupmchKwmU4LVn0Hzs0slsmbjGE9He1Ff7r0hwm?=
 =?us-ascii?Q?nEmVJ+EoExMn1bv1oAkaiyKvlQIxz2nBkMdd7Rzb6mVFqGtF4szGCaRy7D0F?=
 =?us-ascii?Q?BJfSxXC/FCddkGY7wlcmki/BzIb8cmx3PeOCsg1wIHRaZ+HJ4sTwo22taqvA?=
 =?us-ascii?Q?xzuRqIjRPAqOFeArsNIK4MReORmM7j8XmiaCAasxyNZs91FggbJzmFaeHK04?=
 =?us-ascii?Q?XnaPIY6OAQAt56hNmDdxz7E9hg8Wos0E6/gReCGLgjEJid2lMdtcRPK9wnhf?=
 =?us-ascii?Q?EVGQW/0obe90vliz4rri47j3J95L65aVizg9VimcSkKN6hYkWaQCA+tGzIzB?=
 =?us-ascii?Q?3Y9gvS88VpT+l95VV5cW1AwZEZrZxt9dWNZyXG1xueqRRSIDBmT4ZwJPlWpx?=
 =?us-ascii?Q?dW99ImKEbUXzQHuxagY6ZDn4WJIrajN0w+BYVZPWVNtA7fNYIGHWTN8M2nUa?=
 =?us-ascii?Q?NdU9DBvB43atjAIvLrzHOkGq4CKrbsanSDTKtfKy+FiinHuntc0yTeKaCMwi?=
 =?us-ascii?Q?+wL/N2S8wPWBQmCpZj8sJnmABS9Dek2L5EUDMAWtEi8izy6n71pIulPoDqGh?=
 =?us-ascii?Q?MmV9lovWFl/w6a7k+TePZHDTI8hmpCUpfkfqRHk5DotoTungfvJNYHRLMsJZ?=
 =?us-ascii?Q?6CMSKTTtDOVtKIKKROwQ3K2yfWhywdtXjBQCsFoZrSE8LTGNtR8kwQOWOtzB?=
 =?us-ascii?Q?gFR4ETo3t7r+XoNCG58jasjaDAI4RiByEvjkdRh0rHVWTehL9rb6NGhUM0Ib?=
 =?us-ascii?Q?lP/lwwWFmAldwnz3qf0OGWOXrnBqnuvzKuBgshxj9kqfLpow1NhF13hRxLuj?=
 =?us-ascii?Q?Cig6zcEzhYa6wGZKlqFRFZFpCc0lOFShR00AbQVIMUkMcilpvj4hNFIBaKZD?=
 =?us-ascii?Q?wS7FWtiDq0wErTkpdJ5WirfNsxNQyhu3aR6v9sVjxiQrb81tqzB+bNQo9OUX?=
 =?us-ascii?Q?zpkH55JuHtIOD5q8Q8ptLrJggN8vb5xp0+L2ypqQ08MFR5jj4Z80ZUgzLfAo?=
 =?us-ascii?Q?4rR2w2c0HJPtQz8tnaEXjGhTa4xX6i8jJjM3GuuYT1FsSS2FGqNTnk0SGcB/?=
 =?us-ascii?Q?M9pDQLtp5dgsrdLON6+c1mkZbgMBVNymve49MMNSCZbMrSLNtX/a6SNsLNZB?=
 =?us-ascii?Q?vIwZiNz++fslowhfzZlhv3cZA9/jWV3Zv9Vy1CL68yWuFdgok6J61NN+8HAD?=
 =?us-ascii?Q?PdBH5ultXtDo6yNFe++KyXe7iKkhSgGZ/bTLOTu7bCwNMkRwyRE+snWoai+s?=
 =?us-ascii?Q?kVwspRVZbDM526RmcOgSxFkxJ2yaUMQIogo9n47knDYujRp/0PKrMXRfVVME?=
 =?us-ascii?Q?Ka44I8f2ArELnTPbgeXxP+a/zihWONaVJHEBuZfkibQonIjP+9Bc+KN3W3LT?=
 =?us-ascii?Q?jptdw2DV2bPrtZAUWxkNVQu51/LbfUrvhG2pdIx3PB8CRi1h5fUv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a2d702-a51f-474e-1fdc-08df17cdab8c
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 10:47:02.8032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JmJeM5pXTB6rkuHZLR/zP2HCcaimvGxKA5CRnV4BtgL+uLmGB3GHLXKFHtPwGmezxvr21b8vdr0DdkTlI9sH7UC6v3Zx3I6Lr3MnQndLcQrnM+T9uBAfLRdJleCt3Gtb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB554873

From: Chancel Liu <chancel.liu@nxp.com>

component->dev is the underlying I2C device, so resources requested
with devm_*(component->dev, ...) in the component .probe are only
released when the I2C device is removed, not on card unbind. This
leaks the mclk clock, the regulator bulk and the IRQ on every card
bind/unbind cycle.

Move the mclk clock and the regulator supplies (pure hardware
resources tied to the platform device) to da7218_i2c_probe() using
devm on &i2c->dev. Keep the IRQ in the component .probe (it feeds the
component) but request it with the non-devm API and free it in
da7218_remove().

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/da7218.c | 49 ++++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 24 deletions(-)

diff --git a/sound/soc/codecs/da7218.c b/sound/soc/codecs/da7218.c
index 361daf14152e..f8928545b70f 100644
--- a/sound/soc/codecs/da7218.c
+++ b/sound/soc/codecs/da7218.c
@@ -2638,18 +2638,7 @@ static int da7218_handle_supplies(struct snd_soc_component *component)
 	struct da7218_priv *da7218 = snd_soc_component_get_drvdata(component);
 	struct regulator *vddio;
 	u8 io_voltage_lvl = DA7218_IO_VOLTAGE_LEVEL_2_5V_3_6V;
-	int i, ret;
-
-	/* Get required supplies */
-	for (i = 0; i < DA7218_NUM_SUPPLIES; ++i)
-		da7218->supplies[i].supply = da7218_supply_names[i];
-
-	ret = devm_regulator_bulk_get(component->dev, DA7218_NUM_SUPPLIES,
-				      da7218->supplies);
-	if (ret) {
-		dev_err(component->dev, "Failed to get supplies\n");
-		return ret;
-	}
+	int ret;
 
 	/* Determine VDDIO voltage provided */
 	vddio = da7218->supplies[DA7218_SUPPLY_VDDIO].consumer;
@@ -2895,13 +2884,6 @@ static int da7218_probe(struct snd_soc_component *component)
 
 	da7218_handle_pdata(component);
 
-	/* Check if MCLK provided, if not the clock is NULL */
-	da7218->mclk = devm_clk_get_optional(component->dev, "mclk");
-	if (IS_ERR(da7218->mclk)) {
-		ret = PTR_ERR(da7218->mclk);
-		goto err_disable_reg;
-	}
-
 	/* Default PC to free-running */
 	snd_soc_component_write(component, DA7218_PC_COUNT, DA7218_PC_FREERUN_MASK);
 
@@ -2965,10 +2947,10 @@ static int da7218_probe(struct snd_soc_component *component)
 	}
 
 	if (da7218->irq) {
-		ret = devm_request_threaded_irq(component->dev, da7218->irq, NULL,
-						da7218_irq_thread,
-						IRQF_TRIGGER_LOW | IRQF_ONESHOT,
-						"da7218", component);
+		ret = request_threaded_irq(da7218->irq, NULL,
+					   da7218_irq_thread,
+					   IRQF_TRIGGER_LOW | IRQF_ONESHOT,
+					   "da7218", component);
 		if (ret != 0) {
 			dev_err(component->dev, "Failed to request IRQ %d: %d\n",
 				da7218->irq, ret);
@@ -2989,6 +2971,9 @@ static void da7218_remove(struct snd_soc_component *component)
 {
 	struct da7218_priv *da7218 = snd_soc_component_get_drvdata(component);
 
+	if (da7218->irq)
+		free_irq(da7218->irq, component);
+
 	regulator_bulk_disable(DA7218_NUM_SUPPLIES, da7218->supplies);
 }
 
@@ -3259,7 +3244,7 @@ static const struct regmap_config da7218_regmap_config = {
 static int da7218_i2c_probe(struct i2c_client *i2c)
 {
 	struct da7218_priv *da7218;
-	int ret;
+	int i, ret;
 
 	da7218 = devm_kzalloc(&i2c->dev, sizeof(*da7218), GFP_KERNEL);
 	if (!da7218)
@@ -3284,6 +3269,22 @@ static int da7218_i2c_probe(struct i2c_client *i2c)
 		return ret;
 	}
 
+	/* Get required supplies */
+	for (i = 0; i < DA7218_NUM_SUPPLIES; ++i)
+		da7218->supplies[i].supply = da7218_supply_names[i];
+
+	ret = devm_regulator_bulk_get(&i2c->dev, DA7218_NUM_SUPPLIES,
+				      da7218->supplies);
+	if (ret) {
+		dev_err(&i2c->dev, "Failed to get supplies\n");
+		return ret;
+	}
+
+	/* Check if MCLK provided, if not the clock is NULL */
+	da7218->mclk = devm_clk_get_optional(&i2c->dev, "mclk");
+	if (IS_ERR(da7218->mclk))
+		return PTR_ERR(da7218->mclk);
+
 	ret = devm_snd_soc_register_component(&i2c->dev,
 			&soc_component_dev_da7218, &da7218_dai, 1);
 	if (ret < 0) {
-- 
2.50.1

