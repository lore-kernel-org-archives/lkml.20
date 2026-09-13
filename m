Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013048.outbound.protection.outlook.com [52.101.83.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2485F356754;
	Sun, 13 Sep 2026 10:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789294551; cv=fail; b=FXtEtVTdyGjdMCC8VY2NQJJnUOMlEQA/1kwiA9HaFgrGlRlt4Xhs7xOyneHb/QPh2xHEuRm20spEMsFEfDx/KW/fAnVb81rI+gg+iZuuNyHT5fcsM+nIWGLT+z7i5/FCIldvf/O4ujLY9Iw/qgQ51qwLVkgB/7ogU0TFm5/XBoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789294551; c=relaxed/simple;
	bh=F5H5iYx9jaVOlSU41oTOixe2JeK7BTo43tr1l6r1ON0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YI64xKW9zxmxWSO3uialbxCGmUnTsE/bOggkaOx59UtALn+2a9OSwWZuG3LuKiQOHxVBaPvaqdrSWIgWZRTJ1aYtnKXnYAI71pRBJcg+cy68sod0rnBYDfbpYTP5pAA18Ijui99ByiW2Xt3vbpj+U6QgCTJkfTb3gg0RVFimYFk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dTUIOd9l; arc=fail smtp.client-ip=52.101.83.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dTUIOd9l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=crNXNCm1VYFDAHMkp4IqczNGLb3hJtS6qc1Xv9Vn4WOBGcVbHPsFd4M9Jc+4BtvrAdNtVc4Qy3sSu1LMZEawCh8/F+keit2yGUaTRjNoDYdWz46fjjpkaXKtmMjHyWWpcZIXvcAd1WepqnknBfzHrvfgIe9p8PR4aioSDVSxWCqGPqm2sdcbcpeHo+0V3pwMZLZ4nQLqMZaNIm5P9nhU+FvthDJqLxEddbyoyCkc5Z0h5pR3GZLqKuejexS8pl53Ly9Q1C25A7Qrzq0wIQKHCZNAQy/IBWpuu7XJxLANmrf3ayvmoR9v4yS6V+06AO8ZzON/n6+KbvIXdWmEw9KhtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CoDOE9A1a9FNt1uOlxcaEsQpwuoDVt0ZLJjIC/Om+GQ=;
 b=AVQohQbTvjaJ2fC7oDHqX38wmJMpmZf4iSYtSItNotBxO7FILMpdpE1Wlo1Ycz7TFv85chKNFQl5o2yGQc/5DxBWcj5/xLpyuQ6jtUsJkyitV7xMjZa6kSrTP9TJ9+73Q9q1ipQpy+H+FRqEnI8MP4JeQ+40lVRUPlVKjuCOhC+7Ep7pYv8JxJc91vSiBgfZ5DqSFXzLpfFOr62NFa+Ajwdwb7lIahCiFBIsWMQSOZWZNMF9iMcnD7XOwkkEO6t4TPSHZttCz8TxStBVhRyrnWcVXarHKZOIyRHoGOaKwFyI+VqbGreFCGwLIdPbPi+PFGjac5OeW0bUTQq2X8ESbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CoDOE9A1a9FNt1uOlxcaEsQpwuoDVt0ZLJjIC/Om+GQ=;
 b=dTUIOd9lPBIpXBGtHz08a9SVOu3FLbWlFipY9KattJ1Ns5T1+t5WF+uZTaAChWOo32sU4lpMmwIC8RHuk5uYL/G8Q/H6wk5R/gnTAsOThThg69t5qR/9m5kVjI+9OnLvxh3wucF3vHbpOPASugR7KeFlXdSgRPd6Yu7U70xh8Plea37dL8Fnro1dYaK6Kwi9yPnBzwHCNAoBDnF0FQtAUsc/zSCU01OCWtkbdcurVjcx+nDZZxoSwi/3JLSjr+u/Q0VwgfsEYuItLizOizTTf8SQ9PSEu/KtTG0dBtVwriUf0gHRAb+RPJTNZ4chq0mWFA50BoLCmacwpNkVS0g5LA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM9PR04MB8602.eurprd04.prod.outlook.com
 (2603:10a6:20b:439::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Sun, 13 Sep
 2026 10:15:46 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0406.007; Sun, 13 Sep 2026
 10:15:46 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] ASoC: wm8962: Fix regulator notifier and beep leaks on card re-bind
Date: Sun, 13 Sep 2026 19:15:26 +0900
Message-ID: <20260913101531.2787654-2-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260913101531.2787654-1-chancel.liu@oss.nxp.com>
References: <20260913101531.2787654-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0030.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:114::7) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM9PR04MB8602:EE_
X-MS-Office365-Filtering-Correlation-Id: 0203d002-a991-42db-cb22-08df117ffa24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|19092799006|23010399003|6133799003|22082099003|18002099003|921020|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	wImUviErGEKXWDuEcAg06bs7BUo7gUa2zQy2clK8l9YgxpEG6XTeZNfw+4natIFcxWKq8EbDp0MdLdlRvOG+OSBMT6ZSr+R5BR1pgLohmz5JeUtS9N9WLU4CgNFmeEJ4P/fAfweEInsDOrCMmS7vw8FKisFp6aKHPB3Qecrn4UsFaLvrR+rizxhIMAmqJd31zOwQqELyTz/oJZ9H2eNLBeILrG4kwstnbcHJFbeQXMOMiMXkT25qqD6twqVf8lEFJA8A2eAScWO1cKDYPYGl7AzAYDqipW/5H4iXr6zD8A+QrfG2k90wDGKOdoxhqV7ibOXgos8V4DS4T2uJRgcUup60cEBj98kwWHoyAtfUZWH/hKH32H6EeqsUJHWIE1Yj7Canzr/LXVj2r8FBkLlshGtnc06Nd4h5WWs01maaauIYT34hlQE13HyELTTHyqF1JBzxgd4YxIhVU6WSrhJAx6bC4E09UsxtP9UfGyILA7WiI5lO1LaSqUwW5b93maA4OHpIu+kChe7778DbczxsCKM6VW1qfxB/X/8v6fv8o/3SXfuEvUkb1E/12U+wGV7/SOyOQ3ri2BHRb5SYpUAPx1vf8aUjb8JW9QvcToJ9QV75EFvEv2ANPYVJIQHY/Gxeu3R+KZiUs8HdsJYowGWIcwYDuETREAbpnxiOo+AD9evTLnR6xN22WX5vWGcv1BscdfrsJAQj03ToilK6M6ycAw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(23010399003)(6133799003)(22082099003)(18002099003)(921020)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Nob/ka+l7RTV0uEdlBYtMmZHYK6LmbnB+AeYM9FvNcEEVmTq2uB8QnHjaol5?=
 =?us-ascii?Q?zsgL1uUszcdNelx1f04ZNi1gE1xUWjMiP02iW0/X2ePZ2pfRRiGc8cJX+zvE?=
 =?us-ascii?Q?100F5DN5E6I9TExCiVFEuUodT3m4dKEzB6JY5MdfPAh4zs9FFkPJ/rxCCAzx?=
 =?us-ascii?Q?I3Vr4y7XHtt8/VByJ6y/u+7epcZTNzaTicHzNtUGaOnF0SCFlceRL3OOoDVA?=
 =?us-ascii?Q?pEgX6ICPCOL7n2JOHb5UJfgoS2odoUihoZMWynJDHushLCQaSbqHrkBTk0c4?=
 =?us-ascii?Q?MWAG53e9AT1z6nxtnDN3fz+M55CLYm0zvnYPhVd9VvXwoB345GLVAI5hOeVq?=
 =?us-ascii?Q?lJ4ArqgCVhuUHwL1GjkTuQ+aJBFCXyaCeP2Re1SXt4KEApINeTYdUB06cO88?=
 =?us-ascii?Q?rKSUpZaf+qfEgXS8jD9/2uqqGysOELyWFp842WSCVwkhFPzEXHrR9Wvy0JXc?=
 =?us-ascii?Q?moeST8btiLPBoEGq/k7OZsgHZxaRTL2azJnZO7mcQG/4zO9jJnOcYctea7iA?=
 =?us-ascii?Q?vqSg3DrviJR9Xmph17p6TEpMBhAU+Beuz90aTVfAvy0AbyEVoQY8VDRSo+vM?=
 =?us-ascii?Q?JP4enyrP5L+EF5VpYVDgd9ddb+zbLCqQ7EegXsOM576tqMGzJ8b+goR0M6rQ?=
 =?us-ascii?Q?o9RifO1gqBjMu2gYNO2tdbQVX3jpNCi0W+jB9q+s2hiiq3BoqjLTP4GqtN/9?=
 =?us-ascii?Q?xPw2qiWiTd7PsKiq05JQhbcl98diuoX6RVlcTedG2jGgH/vpzVmilAR02+A8?=
 =?us-ascii?Q?0Vwt1LWx/O8YpuS9Cl+w0aqriREz8hyYc1MnsH+1Cg358Zx2BvE9WJJ/YnMq?=
 =?us-ascii?Q?CfFswSThdB+oB32lNZkWElNQY18ZTUa1Jb/UQ9L4dEeiQZfWUx00L8Z2oKfd?=
 =?us-ascii?Q?z3GIj+W7S9m2/rUYfEjG5EpQvJm6GG8jbDB9CYAu+wLvdRz6I3tESHiU+Tbn?=
 =?us-ascii?Q?7oiSnAFyYwPoACVVrLWrQXkpHL1964exDiVUA0krVTgv/bJT95LNoiGLj4Of?=
 =?us-ascii?Q?pFZBgb7iVMOrBOta2pOETheMAUiM/T7u7QpC0PLRxhoX/mpI40GGQbXwpZcb?=
 =?us-ascii?Q?cBK5a9VEd4VO/IlU0HSO8CUwgcF9gejjOyA1+KxP50G7vcBHFITNKYJ749u8?=
 =?us-ascii?Q?c73SVeJ0JxnS4q/DAvZrvjWuSP/zRqsWxsWdprlsUB0wHPMS9YtAq8NcBZDL?=
 =?us-ascii?Q?RVrAjDiHqMpD7sqcTj584ENcwk3jNdD/ypspyY6/GojWhRvNUKKtio1EbFYJ?=
 =?us-ascii?Q?t0CKDekG6swzg8fhb+KUsBrOSugN/9sIdBZ1fM/dDNtJJOvTtYBylDc8gK8B?=
 =?us-ascii?Q?0fQIA1yEkNeZ874eRMabjRVngccu2s83cdU9mHM64b/OKeXLq8fqbJnx5IzW?=
 =?us-ascii?Q?3Il28ZUAoA21TTYcxzOycSiu4thzvfKrl15FaLMeR+jnFQ/oAf6zlL1J3uMx?=
 =?us-ascii?Q?i3FIgQFNBvOr7h8DJwaX4tyK4iQ73jO5PA6a9AikAUxjBaqtuU1x+XpXGNoB?=
 =?us-ascii?Q?t7RU6OrSIaEK/HK2ATsSaXDF4IwY/B9z2OiuE+PQryB0cu2p8MU4Vm9lj6LC?=
 =?us-ascii?Q?L0KOSsKISNFihAxuT7Te0XOvKaFXgQhFQU2WzrogiBxGygvsc8zvGIQwVS8H?=
 =?us-ascii?Q?o6ITlHbvgb7BNG6kqY+h84rnBptqDhWIa9IG5NiJri+t8nle3wBjaXFsMIOZ?=
 =?us-ascii?Q?XsgCXlgkVAF9QCrTk3IRyR5ZY3hxMCraqSJ8hwFhaRozQtizErRgdZUcCJai?=
 =?us-ascii?Q?CmkD9YI+Bi/DBrrHW1F0eNj6Sf44Y/BDrq8SqB/KXjcHzRx7RlUu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0203d002-a991-42db-cb22-08df117ffa24
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2026 10:15:46.6936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IoB8qdpqV27HguvbdpXdlXjfn7BOEtVgRoj7aXHi0lfFwxEUmUVx55fyY03Al7cLZacESx8ICShi/VJ7XkN1Z7yOa5x9fnaRJp6Mb7VKUsJ/CgqzLU85RBXheFoZxsyZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8602

From: Chancel Liu <chancel.liu@nxp.com>

wm8962 registers its regulator disable notifiers and allocates its beep
input device from the ASoC component probe, but the associated devres
cleanup is tied to the underlying I2C device.

These resources are only leaked when the sound card is unregistered and
re-registered while the I2C device stays bound. On that path the
component probe runs again and:

- re-registers the same notifier_block on the still-registered
  regulator notifier chain, which triggers

    notifier callback wm8962_regulator_event_N already registered
    WARNING: ... at kernel/notifier.c:23 notifier_chain_register

  and corrupts the chain.

- allocates and registers a new beep input device every time while
  wm8962_free_beep() only clears the pointer, leaking the previous
  input device and its sysfs/input node.

Fix both:
- Move the regulator notifier registration to wm8962_i2c_probe() so it
  runs once per I2C device bind.

- Allocate the beep device with input_allocate_device() and pair it
  with the component lifecycle: input_free_device() on registration
  failure and input_unregister_device() in wm8962_free_beep().

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/wm8962.c | 52 +++++++++++++++++++++------------------
 1 file changed, 28 insertions(+), 24 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index af4716051220..ae6cc9c72439 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -3355,7 +3355,7 @@ static void wm8962_init_beep(struct snd_soc_component *component)
 	struct wm8962_priv *wm8962 = snd_soc_component_get_drvdata(component);
 	int ret;
 
-	wm8962->beep = devm_input_allocate_device(component->dev);
+	wm8962->beep = input_allocate_device();
 	if (!wm8962->beep) {
 		dev_err(component->dev, "Failed to allocate beep device\n");
 		return;
@@ -3376,8 +3376,10 @@ static void wm8962_init_beep(struct snd_soc_component *component)
 
 	ret = input_register_device(wm8962->beep);
 	if (ret != 0) {
+		input_free_device(wm8962->beep);
 		wm8962->beep = NULL;
 		dev_err(component->dev, "Failed to register beep device\n");
+		return;
 	}
 
 	ret = device_create_file(component->dev, &dev_attr_beep);
@@ -3393,7 +3395,10 @@ static void wm8962_free_beep(struct snd_soc_component *component)
 
 	device_remove_file(component->dev, &dev_attr_beep);
 	cancel_work_sync(&wm8962->beep_work);
-	wm8962->beep = NULL;
+	if (wm8962->beep) {
+		input_unregister_device(wm8962->beep);
+		wm8962->beep = NULL;
+	}
 
 	snd_soc_component_update_bits(component, WM8962_BEEP_GENERATOR_1, WM8962_BEEP_ENA,0);
 }
@@ -3525,34 +3530,12 @@ static void wm8962_free_gpio(struct snd_soc_component *component)
 static int wm8962_probe(struct snd_soc_component *component)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
-	int ret;
 	struct wm8962_priv *wm8962 = snd_soc_component_get_drvdata(component);
 	int i;
 	bool dmicclk, dmicdat;
 
 	wm8962->component = component;
 
-	wm8962->disable_nb[0].notifier_call = wm8962_regulator_event_0;
-	wm8962->disable_nb[1].notifier_call = wm8962_regulator_event_1;
-	wm8962->disable_nb[2].notifier_call = wm8962_regulator_event_2;
-	wm8962->disable_nb[3].notifier_call = wm8962_regulator_event_3;
-	wm8962->disable_nb[4].notifier_call = wm8962_regulator_event_4;
-	wm8962->disable_nb[5].notifier_call = wm8962_regulator_event_5;
-	wm8962->disable_nb[6].notifier_call = wm8962_regulator_event_6;
-	wm8962->disable_nb[7].notifier_call = wm8962_regulator_event_7;
-
-	/* This should really be moved into the regulator core */
-	for (i = 0; i < ARRAY_SIZE(wm8962->supplies); i++) {
-		ret = devm_regulator_register_notifier(
-						wm8962->supplies[i].consumer,
-						&wm8962->disable_nb[i]);
-		if (ret != 0) {
-			dev_err(component->dev,
-				"Failed to register regulator notifier: %d\n",
-				ret);
-		}
-	}
-
 	wm8962_add_widgets(component);
 
 	/* Save boards having to disable DMIC when not in use */
@@ -3742,6 +3725,27 @@ static int wm8962_i2c_probe(struct i2c_client *i2c)
 
 	regcache_cache_bypass(wm8962->regmap, false);
 
+	wm8962->disable_nb[0].notifier_call = wm8962_regulator_event_0;
+	wm8962->disable_nb[1].notifier_call = wm8962_regulator_event_1;
+	wm8962->disable_nb[2].notifier_call = wm8962_regulator_event_2;
+	wm8962->disable_nb[3].notifier_call = wm8962_regulator_event_3;
+	wm8962->disable_nb[4].notifier_call = wm8962_regulator_event_4;
+	wm8962->disable_nb[5].notifier_call = wm8962_regulator_event_5;
+	wm8962->disable_nb[6].notifier_call = wm8962_regulator_event_6;
+	wm8962->disable_nb[7].notifier_call = wm8962_regulator_event_7;
+
+	/* This should really be moved into the regulator core */
+	for (i = 0; i < ARRAY_SIZE(wm8962->supplies); i++) {
+		ret = devm_regulator_register_notifier(wm8962->supplies[i].consumer,
+						       &wm8962->disable_nb[i]);
+		if (ret != 0) {
+			dev_err(&i2c->dev,
+				"Failed to register regulator notifier: %d\n",
+				ret);
+			goto err_enable;
+		}
+	}
+
 	ret = wm8962_reset(wm8962);
 	if (ret < 0) {
 		dev_err(&i2c->dev, "Failed to issue reset\n");
-- 
2.50.1

