Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011069.outbound.protection.outlook.com [52.101.65.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D63C3BB13C;
	Wed, 23 Sep 2026 06:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144005; cv=fail; b=Qdk9cwoGZuxaw6A/uQ1RLRhmFlbvWmXVzFyYjJ8vNkZ6wvi5HVfYDV2jCGSdZ/ZA28h2F0GVAc59O6V++bjE1mKvoMijt6DNR78oUWEw85Ghc4xKFojpw/FjJjNlmQl9O6xAJPkhQk/q1ksNUGZZryUfcE0uLSDghZoNpwWImnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144005; c=relaxed/simple;
	bh=c7xnN5kAv/DZQbbn8SLYdEX5Ut8bjYu9XqB5HOe924o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Se7kglR4zCsi7jfJ2AMlOWVd3FXJEb5k/r51zUaJQycc41yrJ1W46WDpZlWVqJhqazi2T5qMPQfppaKfjxlODEwg0fIeX8ff/i4t/GQCnpKwG7ki/Roy/Ws3/b+DMZbEDEJrhaEyR26edfzwEbZ0788spmL0y3g0gqnaI62ZfkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FMJG0fgC; arc=fail smtp.client-ip=52.101.65.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FMJG0fgC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iB225zwg7HPBGr/BZVCNz+j/rTr4112BHd1dTW0rwK7BsbMfZsh0rGGDLJ5fK6iAEdSvAnaNoAg7z/r27hsuiq93Rnvz6+TbBqR3EKKanvDZci+JNiuQ5eXYQni5/ZtSgV/R4D5/2c620H/5RdOBNIZBK3GS5G0rimFmcApBL2qh6KlkOZcB78U41S6i1p38qRWWuELl4K+Ts9kXNJHycWa92i7cnAgMIWdllWkaX3N6Y+UQUA6P3E/X96dXv8SzAEzCfWqNTKcX1BrRsLJfc4Fbrex/Xw7aNSazg0D4w+iIuLKsFNKNO5Pmffi9dkcUZ8VGFj3uLqJSMT96dPrKhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZQVQZf/6Uuyp9pKwkWGP7D52T71N5AtDOq4Fwo3zvo=;
 b=ioE9MklzzdqrkW8zkNCnBizmtTzvCO7B9RyhjYEQDRse7UH7R92aa5dxiQDj1uHrnIQpfQvFtWNP8W0D217lx0YqU2fGoKQpA45hT3wH3uGJZlZDvGbrbRjMqn/lfDvV+ctKJiI6dGEr9IPrAdNKEyr6kAZjDAwfWfy9xxXRkEdGbTvwAkjSkocXKxOK4U43pi/ocmgXPeTLlC7OB+58IzK5MKpBJmk9Dooemn9YsltNfXIITRwIbvQBnBIQtSQdbLv737GySWG5LrKme+HoqiJq60gX/UdWq8+JtuPi6saYJM5BasXufqnknNrRWHYnqfoijAKPL7tZOY6yzj1o8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZQVQZf/6Uuyp9pKwkWGP7D52T71N5AtDOq4Fwo3zvo=;
 b=FMJG0fgC9kN5gXFKYOOmwLmfXYnaX1Gghj+llHQ7Ln9r3gZ5ohSzi7cjXIAyqLPA5H15qYEuh9m/0leBXTZU8nZwffJp77tBCF0vmGhKoSqYEBYKQTumZdzQ6mhTJkSc4ZO1ojdigdALcD/59ejugxu6bjb3Wtc48iYYMVqhq1zQirEWOeq/jiXjUfSSD3bCXp+DG0oaxOooH3cXWbcbQbgE5LwyqGwLtSIpNOBHIzbXmyua4Ot0G86LMBryhOTy95j+jJBvUdbIWafkFkgTKRyqlZbvESiWq9PnN9VqzWRpT0/tvuXkGEesubcRne6/fuiQvFDX5RXSPZ5xOqfFcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VI0PR04MB10997.eurprd04.prod.outlook.com
 (2603:10a6:800:267::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 06:13:19 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 06:13:19 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH v2 01/21] ASoC: codecs: cpcap: Fix devm resource leaks across card bind/unbind
Date: Wed, 23 Sep 2026 15:12:45 +0900
Message-ID: <20260923061305.4041197-2-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
References: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0063.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:118::12) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VI0PR04MB10997:EE_
X-MS-Office365-Filtering-Correlation-Id: 199cf73e-735f-47b1-5f49-08df1939c37a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|19092799006|10067099003|56012099006|6133799003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zEXbbQmgD+oHyC/IWB2YkvWOC77HXi8OqxjcO/RGcW8u02k7NukJyflo7EJfzee0C2Ew4qxpXBH0TjNHnu7tQb/7r1yONoLS90ue8VT4KQzC1wFzX7cX2onyzvJkfl9b7MN/ns4tpkvtryiCdksJIR43Q0JmHAwhmiu0xLRt86e2zO/GsQAAHu51aCm4ZVD9ZaOJmE57NqjY9tw95BjYhWaZ2jQ518mGuAy0Hy1dBOn3HAIdJ+rz1ApPrGRpVVd4Cmfpqn6U6PhViJuvJN23labsnq/UhO7j8nzQ2CESVPtYrOBRmsU8crkwKyReWjcKlvrqzxDjJr7HarueYBl4HwrhNbdVbuIs3n+sK5ypOEJVbLGVadvN2WtD6mindvgODrkCP/Bqs6QHd/diR/dVJQSvN3juXlWUubCGRo24bisIrAmx59xjFCWvltD4WD20Dtx1jlqLzh2LHeJGtDbbVBGLCR1J4uFmJKe9NRTDm6DBPDGhegMgIqc4vjLN/l3V8MCa12/q6tpuqNcDVDqtZ5nE8yQQ9uepZV99bdupR/tPFSANPu2DXvR+G/WMSPtf0MX1hnQOmZqYyYuUy6xz5fnF0DAuWzrANG/fKZQe2ZT+DN7k+iKuI1fMbkeOsAAKU5+MnVEgzrkK2srMbTrNyLzYxUkwYg+YX6Zx+DrUhKA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(19092799006)(10067099003)(56012099006)(6133799003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UgYgSJIAXhErS79no0QFaIknN08WxCcYCBfvWikF07EN6T2zEa8O6Xpq6NCp?=
 =?us-ascii?Q?UrAnWOYhmbVyoDF1Se4XTUCzbeZR6iWAsPsotIsflUbYOkqPlzYH+orb+h3t?=
 =?us-ascii?Q?VATxRf/3vzdxHtUOI+EVgTBdKF1113MJ1fnEJJB4H4UmHSn0KhnW7B/xqpBQ?=
 =?us-ascii?Q?7yv9Qw7RJYrw4LAIO6uYHZ6oerz1st9/ogwQPqMRORBD6YorS5QJsaFVetNS?=
 =?us-ascii?Q?O9P0ppFUNIUidjbqgJG0TbHwOCn/sDxFKjIpTI3Sez1wo3z58B8TxwPMwqb0?=
 =?us-ascii?Q?wdvx9axvwrLJZqPQ6MKcHfvpjjmAWh8fkzFXkNcUcdU6V4f0fbZGS9h2Qx3J?=
 =?us-ascii?Q?5BnE55whuX9iW3Uvhzs6dvl5JDHV27N9MwAtk3uoo+FM+KYakxkVHebhR6rJ?=
 =?us-ascii?Q?juf+z/yadJs/tuSv5pYLP3GqwyCS5XlbZsd5wqKKn8374WIooizaf2+l3JtJ?=
 =?us-ascii?Q?CrSYbOc2tDQkdkVhwOKsp8JZvYAaMt42/GNyRdXdxoRsYGR7Ygb6V7/h9fN3?=
 =?us-ascii?Q?7jzUS3iZJh+TnDaElf2oxtKpKPYh0YWWh/hDfyOksx5aNCXXlKnQgrxWtY1k?=
 =?us-ascii?Q?k4iyCvj6SLjx8IQlpk9+3k6A5i0JRCk+DXnI2XaAIVudPlp6lKTr08rlQafc?=
 =?us-ascii?Q?atEIOvwNJ+Zz0L1ypzoS7DC0K61FX/8tdazyEwM2puqarfzwkhBY6zjMsmy7?=
 =?us-ascii?Q?Vxj5SQCP+MgN1DM2pOUsgOD8F4KNQfO5KlHzG+D0Cd28D/5LYYZBYQ/Lzew9?=
 =?us-ascii?Q?LxNDMuh6GC4Y1SXZpZzqmG4muI9YvGAf/CsrDWP8n0z6BpArWhHBa+p+AszY?=
 =?us-ascii?Q?ECR3sj/ovre6Sc8DuwNk/+U6aFmpQZp7yfULOsbDMTKlyxjRGjTY+9+UKNZ0?=
 =?us-ascii?Q?DDl94NxSIpawMvLVWH1jZxtFxflasau2FiakaZD0HysAwObyG7fqvafZuSaL?=
 =?us-ascii?Q?x9Hn1z124LhijvAXN3cyCihLoTeHk2UjYb1bywL455SRC0gM/ce4dom7ZM7s?=
 =?us-ascii?Q?vD3bzAJ8plZMGsX9aZJiUx0uYcViPX1CZnj21qotUKz86tMrp6LM1+Z5R+uQ?=
 =?us-ascii?Q?mx3zgB2DQoEdzWapxbzFO1Or5dJS71jheuCfmudvzAX6cKjHMrwOOk0Bq8nW?=
 =?us-ascii?Q?FBXI6+Qv+Ndp1MKoj/1dBLr9fIgXc+YzjJEOL5IQUFZy0r2IoUkom5qoi2cQ?=
 =?us-ascii?Q?R+o04gHZAZ7ushsc3Elkou7vxJRHK9wk9H5Stqc4DggGNpMKGnWsjOJ5IAxQ?=
 =?us-ascii?Q?Y7S8jD7PDsx8scu4Ll2KtqL/uy+49OGD4edrTk8IKMrkQLUIbjowuruQyfZH?=
 =?us-ascii?Q?sl3n1gBlHIh94wBGnCiQPcOzU3Cy5H5nFnKq53aAuatUzL8fCamPSCF7vrXj?=
 =?us-ascii?Q?5voy5f9MLAqxaZowKsFvmb9NGUTCGY30UzNLU+fcTiFDAfsP6dFLXgnzjatG?=
 =?us-ascii?Q?loCnbRINOaBwufhe64CH+4oIKPFzK8VBfswyLPjw7mkF7DUDeVz7Lxm4ls3p?=
 =?us-ascii?Q?lR4QHcesyXc6Ukt4jLjaI3FOj6gML7AvvDOGQ+s/n5vNAbi1fsa9IbggcCmG?=
 =?us-ascii?Q?DpHWTUNmcdDjxw76hwlI64iji6PJqATe6jG2a7NIoehuMrDifs9JQRynd/Jy?=
 =?us-ascii?Q?w/ZzJ3NyHV2dZosY3nS1i5Kst3UvpzUR7MaRkfnDKqXhyuIrnk/gGKpqMoqo?=
 =?us-ascii?Q?A8pkI6GFILN08mF4prEQgJklJnb5ZyYkhT8yQxjFaquHfi73dGfkeZJeH+Z+?=
 =?us-ascii?Q?w0uxUOvOw/5VWBkfyxr7tV8pK3SNyp4/z9L7c5v0tdZiiyub8Jdd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 199cf73e-735f-47b1-5f49-08df1939c37a
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 06:13:19.4554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kw50ud3otHGpTXByJmoPyvwxHt1C7FDoRkPK3vVaBv/e/m107K2114kZoqgr3Jq+oKQBhOusC9sHBRmOyt9rihWIVPTLnrZbRAPJBZHaRt7Hg1eZcaPrkAPdYEum07Ev
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10997

From: Chancel Liu <chancel.liu@nxp.com>

The ASoC component .probe/.remove are called on card bind/unbind, but
component->dev is the underlying platform device. Resources requested
with devm_*(component->dev, ...) or request_irq() in the component
.probe are only released when the platform device is removed, not on
card unbind, leaking on every bind/unbind cycle.

The VAUDIO regulator is a pure hardware resource that only depends on
the platform device, so acquire it with devm_regulator_get() in the
platform probe where its devres lifetime matches the device.

The headset/mic-button IRQs genuinely depend on the component, so
keep them in cpcap_soc_probe() but request them with the non-devm
request_irq() API and free them explicitly in cpcap_soc_remove().

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/cpcap.c | 74 ++++++++++++++++++++++++----------------
 1 file changed, 45 insertions(+), 29 deletions(-)

diff --git a/sound/soc/codecs/cpcap.c b/sound/soc/codecs/cpcap.c
index 0262900fbb7d..dda68165b817 100644
--- a/sound/soc/codecs/cpcap.c
+++ b/sound/soc/codecs/cpcap.c
@@ -1622,21 +1622,12 @@ static int cpcap_soc_probe(struct snd_soc_component *component)
 {
 	struct platform_device *pdev = to_platform_device(component->dev);
 	struct snd_soc_card *card = component->card;
-	struct cpcap_audio *cpcap;
+	struct cpcap_audio *cpcap = dev_get_drvdata(component->dev);
 	int err;
 
-	cpcap = devm_kzalloc(component->dev, sizeof(*cpcap), GFP_KERNEL);
-	if (!cpcap)
-		return -ENOMEM;
-
 	snd_soc_component_set_drvdata(component, cpcap);
 	cpcap->component = component;
 
-	cpcap->vaudio = devm_regulator_get(component->dev, "VAUDIO");
-	if (IS_ERR(cpcap->vaudio))
-		return dev_err_probe(component->dev, PTR_ERR(cpcap->vaudio),
-				     "Cannot get VAUDIO regulator\n");
-
 	err = snd_soc_card_jack_new(card, "Headphones",
 				    SND_JACK_HEADSET | SND_JACK_BTN_0,
 				    &cpcap->jack);
@@ -1660,13 +1651,13 @@ static int cpcap_soc_probe(struct snd_soc_component *component)
 	if (cpcap->hsirq < 0)
 		return cpcap->hsirq;
 
-	err = devm_request_threaded_irq(component->dev, cpcap->hsirq, NULL,
-					cpcap_hs_irq_thread,
-					IRQF_TRIGGER_RISING |
-					IRQF_TRIGGER_FALLING |
-					IRQF_ONESHOT,
-					"cpcap-codec-hs",
-					component);
+	err = request_threaded_irq(cpcap->hsirq, NULL,
+				   cpcap_hs_irq_thread,
+				   IRQF_TRIGGER_RISING |
+				   IRQF_TRIGGER_FALLING |
+				   IRQF_ONESHOT,
+				   "cpcap-codec-hs",
+				   component);
 	if (err) {
 		dev_warn(component->dev, "no HS irq%i: %i\n",
 			 cpcap->hsirq, err);
@@ -1674,25 +1665,27 @@ static int cpcap_soc_probe(struct snd_soc_component *component)
 	}
 
 	cpcap->mb2irq = platform_get_irq_byname(pdev, "mb2");
-	if (cpcap->mb2irq < 0)
-		return cpcap->mb2irq;
-
-	err = devm_request_threaded_irq(component->dev, cpcap->mb2irq, NULL,
-					cpcap_mb2_irq_thread,
-					IRQF_TRIGGER_RISING |
-					IRQF_TRIGGER_FALLING |
-					IRQF_ONESHOT,
-					"cpcap-codec-mb2",
-					component);
+	if (cpcap->mb2irq < 0) {
+		err = cpcap->mb2irq;
+		goto err_free_hsirq;
+	}
+
+	err = request_threaded_irq(cpcap->mb2irq, NULL,
+				   cpcap_mb2_irq_thread,
+				   IRQF_TRIGGER_RISING |
+				   IRQF_TRIGGER_FALLING |
+				   IRQF_ONESHOT,
+				   "cpcap-codec-mb2",
+				   component);
 	if (err) {
 		dev_warn(component->dev, "no MB2 irq%i: %i\n",
 			 cpcap->mb2irq, err);
-		return err;
+		goto err_free_hsirq;
 	}
 
 	err = cpcap_audio_reset(component, false);
 	if (err)
-		return err;
+		goto err_free_mb2irq;
 
 	cpcap_hs_irq_thread(cpcap->hsirq, component);
 
@@ -1700,6 +1693,13 @@ static int cpcap_soc_probe(struct snd_soc_component *component)
 	enable_irq_wake(cpcap->mb2irq);
 
 	return 0;
+
+err_free_mb2irq:
+	free_irq(cpcap->mb2irq, component);
+err_free_hsirq:
+	free_irq(cpcap->hsirq, component);
+
+	return err;
 }
 
 static void cpcap_soc_remove(struct snd_soc_component *component)
@@ -1708,6 +1708,9 @@ static void cpcap_soc_remove(struct snd_soc_component *component)
 
 	disable_irq_wake(cpcap->hsirq);
 	disable_irq_wake(cpcap->mb2irq);
+
+	free_irq(cpcap->mb2irq, component);
+	free_irq(cpcap->hsirq, component);
 }
 
 static int cpcap_set_bias_level(struct snd_soc_component *component,
@@ -1754,11 +1757,24 @@ static int cpcap_codec_probe(struct platform_device *pdev)
 {
 	struct device_node *codec_node =
 		of_get_child_by_name(pdev->dev.parent->of_node, "audio-codec");
+	struct cpcap_audio *cpcap;
+
 	if (!codec_node)
 		return -ENODEV;
 
 	pdev->dev.of_node = codec_node;
 
+	cpcap = devm_kzalloc(&pdev->dev, sizeof(*cpcap), GFP_KERNEL);
+	if (!cpcap)
+		return -ENOMEM;
+
+	cpcap->vaudio = devm_regulator_get(&pdev->dev, "VAUDIO");
+	if (IS_ERR(cpcap->vaudio))
+		return dev_err_probe(&pdev->dev, PTR_ERR(cpcap->vaudio),
+				     "Cannot get VAUDIO regulator\n");
+
+	platform_set_drvdata(pdev, cpcap);
+
 	return devm_snd_soc_register_component(&pdev->dev, &soc_codec_dev_cpcap,
 				      cpcap_dai, ARRAY_SIZE(cpcap_dai));
 }
-- 
2.50.1

