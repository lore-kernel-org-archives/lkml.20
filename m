Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012027.outbound.protection.outlook.com [52.101.66.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE0441684A;
	Wed, 23 Sep 2026 06:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144013; cv=fail; b=DD9SpYU+K1gYnbszNLXewb7cWcygx5T8H2o5Q7WWPgbmln2voQIbPgl2VpzIrcS6zJkECWyEYlXUgoTgncIVfqdzhUdEetwGl1q1JZqI3zOZx0LRxc5L10n1qkr36IbpCDwkppjGjeLPbU1Ul/a9WvYhkrNcBrdMDvrT0Bpb4dk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144013; c=relaxed/simple;
	bh=q02eT454bppJo/x4D8PgwceGgKdres7RczIXpkbgrXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CqetLsHWB2onullUwRZ5Mjuorw9OZ5gQMV22v00039EiDvmZ49KJq1dsw0Rt7fvbU0Rvg9+VCRpFO2mURJi6c/h6uSiyysxytMGRqZcAUwYJa1cgBrKljUp9uBm3x+h/Bv8/S6wcWs8CsqoVmXw7alEXNoPhe/Lwjx/tnXN0rxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DMlwRaxX; arc=fail smtp.client-ip=52.101.66.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DMlwRaxX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iE8xKhUhI1QujeIqUiKT1lLv5plP6WN7sG7+KwhyRBvOgzVQJNZNhByl8/MAERj+T9/OvG2/t0jefLPM9grGgm9LKb59+G4Kq2fe8OIXDzCt8Mf3NcmXc+l0sdE+qd9PFcdtr6vfDkylL6nUPx7JRdpFoTHuNU8ZMg+FBt5xRVdPg1tQ1sdBgdABWCT52zWcvI9ZtFkFp9ogUVNKaoj5VMJQfyQiEBn02zOSpKUObEkZuK0gmzNYFAlWihrlQ0pKmWOQ21bjeirfsl0kcbyFB066M5CM1p4a7ldK4M4BNF8eStNLZ0dMoE/j+q5dzzWWvsx8ps8UpLnyirfYywTNWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzUepdnzWbVSGRHO+ZVcIv+V3m63ee4plTk22Sjo3nE=;
 b=uuZ4q5wqCgl7GlPvx3qlMsjg+LZ364T8NT5pjiKbQeeEkOard8MBQihbPknhQoUHOvkmyp5WImLcrXuKY2b+fc+2SAdInvb3oHs1iiQzaTPcBe9VhmwhRaZmzmvFbIE54otGGTPdCgP7lrglwmUWnVfN1fkBCaBkTe7OWnltI50gLw95fK/lvklmTTBgCofTt4/5SyyUYPCZkDvFSCClkY0IljfonKfeagtK1tQA0dV3+Mb8rzHBuW70IafNuWVTvWarBDGDXl4Tmczv08g8uPNKE7UfzDVjK8Bg+wodfPJrVo0Rs7dntY02IqcWLDcrxc4oRSf4FauDcNlrcJkonw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PzUepdnzWbVSGRHO+ZVcIv+V3m63ee4plTk22Sjo3nE=;
 b=DMlwRaxXXJkMuCZXwfPUk2s7o81hR2XgRCYhc5FxsuE+JXdi4r0msn5jtyeqKqKFbSVdeFVVVuD8Wd5pgwXr3oIb1i2Mn+JQ89A+g11lDlhOvjnE1QvpzG4BTnkU/Pje7uZK8iNJnl7QuVeFn/ikaCr4zThTS9n21cGU5O2E8aMblIadAIEeCynC4nmG/cu0n1krXEguxp+9IhTyHOfTHe1/xVjghWda0VO4vQIGc5eIDWoiKcWGhBnrbRu67g4KRDqhA4XYs3k170YajGNiIHLWQbQMJGXLFcix7u5ga8fwTy0Ru41umZ/aGny6aqkwtTh8GxzWTZ/hf8kKAupjXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VI0PR04MB10997.eurprd04.prod.outlook.com
 (2603:10a6:800:267::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 06:13:27 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 06:13:27 +0000
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
Subject: [PATCH v2 02/21] ASoC: codecs: da7218: Fix devm resource leaks across card bind/unbind
Date: Wed, 23 Sep 2026 15:12:46 +0900
Message-ID: <20260923061305.4041197-3-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
References: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0079.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c6::12) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VI0PR04MB10997:EE_
X-MS-Office365-Filtering-Correlation-Id: 4378094a-8a6e-40cd-18b2-08df1939c7ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|19092799006|10067099003|56012099006|6133799003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	57pXIHbVab0b9o8nQOwzuX8+D4cYhKM1d8Mhp+AhKg9mG/5nRYtzH+ceVXBdClQ9v+R9W8kz8ALc1vb2UYqpAFyv9sjv2Wo122khVwtVO3CSvIeojp7/GqPH7SmpmS99MWhBxEmgi+V1tiz5TeAkQQmr0LPkOrj5VtebgCh1fi6ezearEqbLf3qhILj/iErZ7dJW8cT38EFwmcGgSItpX9ybccAxPqTBeKOs8mhtr3MJapRByxIsOFVtixswuOsfAgZt9zLUh9aPfdpkpyewxmaXVW26TC0DZ+amFn2bkeppxbQepwVCY14ZPQW2Vgg1xEb+8xG+FSFo2E9sjo2cIE4O19Hxhar5sx6kd0qInpCqrEHEBhE5YrbYNg1MPgEA22lZGG2hvrBuF1QmrHpmtgJuWsEZOkq0exQiZ4JUtXTva5I9smgYdVM+pmss5nrYpFRU+Ls2IcHcGmyCIYDhLe/MryT8usn/V2JwW77jFyAhioIYLf1hmU9pIzd5JPBYSKOsQR8CN/oOolsDnAqlJ9lszUQjpL3o+JcOyDyKv6wrOQoQbhGR5XW0k43HrEjZSGl+IkfpEMgEcn41C5juREFKtB1ezerLLSh892wbZIOJnXU5J2E+E+dfeW/HZGnX2FyY9mw/M/MV7YcYFtTlZa6GV16fzCzXYMINabr7LbI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(19092799006)(10067099003)(56012099006)(6133799003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y1Q81vPVCoI7okXQPX283Sgic8Qf478BEpzDzNt9m6hfWEROHSZBDdLODITS?=
 =?us-ascii?Q?kTfmq8VFq3RauasX1pml86uH9eCAkXNdKNmzW8AckBx4zRyGf4rbeQACiWRD?=
 =?us-ascii?Q?o9S/Ezqm82F7XGOGCaOQFUiEL+dIUvSCUkIqJDRUy0HMrVNpSnvh76HDMaC/?=
 =?us-ascii?Q?vMFzyhc2OdqLa/yxliUBCvQYPwWbhOMnWyEXFk8PXk4p/3+kjzM8g1K8tcwg?=
 =?us-ascii?Q?hTsLw8T1pAQpFWaFUyZ799u1XG+JeuG709n+5tyDpsazs9MV4KkciX9mCGuZ?=
 =?us-ascii?Q?pgrldt5QGdakR6QlvVUYb6rnnOk9jmf1lL8qilr/pg0tf0GWBpsp+olOiWGz?=
 =?us-ascii?Q?G+2iJlA2/F8SJpXhYukgr5tfh/HL8bhX+1LFTHWCeAMaP+KFZTZSeYcDw0Oy?=
 =?us-ascii?Q?pF0Ob6b8DnZxRrDeDYjfaj94J2mS/DDCEBZFgosMy1qqBcaH4/wH4g1RFiVJ?=
 =?us-ascii?Q?1g5XWK5fCFLPV15nXN9+Ro8nK/1tXNLSMaN3Kg8n/U3VKbQRACPHyo8NG1wH?=
 =?us-ascii?Q?24AdLBdtlGTXVswNeSU0kwHij4nTYbcPdJ7SECSl1HzBbIE0oWN3RSu+2+UK?=
 =?us-ascii?Q?KGu9CfLQ+kFRvGqXdeU9SkDDGsFPfoRvF3kc0WY4Mm93I4+jrWy/QH8oG3hr?=
 =?us-ascii?Q?UsxWqReFrhNtoC2f7ddkIg77rnCp7BdwdDhlc+k/cRwTNlx+uta7TgzZvphv?=
 =?us-ascii?Q?WV7EtIar2aNifr2FRQyD1c8TM5sBbLyIbPpKvDrlpfMKUzw7wtgD+i9syJPn?=
 =?us-ascii?Q?2pNYseIEFTvukKLv7N7WXNLrzjbpW/seIyL3zm0vxxHwQYzj0cZ1i+rvlzGy?=
 =?us-ascii?Q?yS/6u/noR4bL/RqUatALiJF0LobKPcSdTfh7zF4PnwVR7hCzzcQSFtVz/R6k?=
 =?us-ascii?Q?309E1fxgUqaA2cKZTJ1LiHkDGX9dRyq8es9L5UHmd47RdowGCgFSkJaQAXe3?=
 =?us-ascii?Q?+cupKD5YzTs9g/kq1Zn0cDaBxuXsrDRn3xJ2t9y2HZDVk+QqieLWdQ0XqSJj?=
 =?us-ascii?Q?IZocQrxQH363j4qxbGQGRitJHN7lC07f3R/GbCxeNDm4yKqtmeCsqWw4MdHh?=
 =?us-ascii?Q?4/cOCf+GGMhvnL2a324kPamns923ymDnieWdVtTG2IB7Z+FyjYQ8bE+pccFC?=
 =?us-ascii?Q?OU4oVFs/aIdy/qH42bxNox3R0lm4vad2tubSaDYPogDGbu/4lF65p9Ntx63N?=
 =?us-ascii?Q?HZkf7AmD66PHIwV7ctwsLycoNmRcFmWSmcxj8NWu/+SwUBBT9EQlmWGwTbX3?=
 =?us-ascii?Q?Bl1tU1zvhY8Vp9pTlXHCk+Ld3BOWnRF8AOxY/hc9aAVvVmWcAuwlWX0r3Y2P?=
 =?us-ascii?Q?5OTaEpRmzFrBkv00dWxyo5gwic2rIDxDFthqyiPDnLj/0VqExOyovzITK0ZD?=
 =?us-ascii?Q?KhxtP/57cfyD1Qa7lx0Oiwq+AtSrOcZgOoJN36GbOuGeIXcWqKmc79CqUVr3?=
 =?us-ascii?Q?5th7GW2Y+1uhzioKqnrr346jRPBhD509kq6M6NFpMVFC7Bo1zvtY9qegk4Dr?=
 =?us-ascii?Q?/sZozDyeO83U7RYtRVCH2WMealtn3R8ZUz9S7DFV+bmOvIQ7y16JL6ANCP9l?=
 =?us-ascii?Q?UyjYXQl7T/p0hNEjRiUx6Lmw+GKcQGzrXk29hQTYYZGMZm24sc6Gbu/43ym2?=
 =?us-ascii?Q?VOCvHX/4F9hrmhxpbY9twjcnZhJwwg6ttI3V7Hx136oTQkHOx49FM6Ior3y4?=
 =?us-ascii?Q?a1Iy2pbDlmQsP9H0bPluRqzBHqVxTmzI2Rv0Kog4csIDEcvtUXaXw7HeD0rt?=
 =?us-ascii?Q?25VUb8KZw7UwVrgZ3pnZnwMdo5TkRmszW988NXFMZqpRocttNjVw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4378094a-8a6e-40cd-18b2-08df1939c7ec
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 06:13:26.9919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v96ph6Nvq88N3xdvHHa23sAy0KLGCrB58XGOsLdLAE+E35S2EFKOC5ZHTiFasyfpwvbj1ApjTT71kgoQ6SPjagW+8MX3pED50d7waoCUpOvADA/AsZPwrJ21a/teX912
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10997

From: Chancel Liu <chancel.liu@nxp.com>

component->dev is the underlying I2C device, so resources requested
with devm_*(component->dev, ...) in the component .probe are only
released when the I2C device is removed, not on card unbind. This
leaks the mclk clock, the regulator bulk, the platform data parsed
from the device tree and the IRQ on every card bind/unbind cycle.

Move the mclk clock and the regulator supplies (pure hardware
resources tied to the I2C device) to da7218_i2c_probe() using devm on
&i2c->dev. Likewise move the device tree parsing (da7218_of_to_pdata()),
which also allocates with devm, to da7218_i2c_probe() and store the
result in da7218->pdata; the OF helpers now take a struct device so
they no longer depend on the component. Keep the IRQ in the component
.probe (it feeds the component) but request it with the non-devm API
and free it in da7218_remove().

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/da7218.c | 129 +++++++++++++++++++-------------------
 1 file changed, 65 insertions(+), 64 deletions(-)

diff --git a/sound/soc/codecs/da7218.c b/sound/soc/codecs/da7218.c
index 361daf14152e..a538b3dd1635 100644
--- a/sound/soc/codecs/da7218.c
+++ b/sound/soc/codecs/da7218.c
@@ -2298,7 +2298,7 @@ static const struct of_device_id da7218_of_match[] = {
 MODULE_DEVICE_TABLE(of, da7218_of_match);
 
 static enum da7218_micbias_voltage
-	da7218_of_micbias_lvl(struct snd_soc_component *component, u32 val)
+	da7218_of_micbias_lvl(struct device *dev, u32 val)
 {
 	switch (val) {
 	case 1200:
@@ -2320,13 +2320,13 @@ static enum da7218_micbias_voltage
 	case 3000:
 		return DA7218_MICBIAS_3_0V;
 	default:
-		dev_warn(component->dev, "Invalid micbias level");
+		dev_warn(dev, "Invalid micbias level");
 		return DA7218_MICBIAS_1_6V;
 	}
 }
 
 static enum da7218_mic_amp_in_sel
-	da7218_of_mic_amp_in_sel(struct snd_soc_component *component, const char *str)
+	da7218_of_mic_amp_in_sel(struct device *dev, const char *str)
 {
 	if (!strcmp(str, "diff")) {
 		return DA7218_MIC_AMP_IN_SEL_DIFF;
@@ -2335,39 +2335,39 @@ static enum da7218_mic_amp_in_sel
 	} else if (!strcmp(str, "se_n")) {
 		return DA7218_MIC_AMP_IN_SEL_SE_N;
 	} else {
-		dev_warn(component->dev, "Invalid mic input type selection");
+		dev_warn(dev, "Invalid mic input type selection");
 		return DA7218_MIC_AMP_IN_SEL_DIFF;
 	}
 }
 
 static enum da7218_dmic_data_sel
-	da7218_of_dmic_data_sel(struct snd_soc_component *component, const char *str)
+	da7218_of_dmic_data_sel(struct device *dev, const char *str)
 {
 	if (!strcmp(str, "lrise_rfall")) {
 		return DA7218_DMIC_DATA_LRISE_RFALL;
 	} else if (!strcmp(str, "lfall_rrise")) {
 		return DA7218_DMIC_DATA_LFALL_RRISE;
 	} else {
-		dev_warn(component->dev, "Invalid DMIC data type selection");
+		dev_warn(dev, "Invalid DMIC data type selection");
 		return DA7218_DMIC_DATA_LRISE_RFALL;
 	}
 }
 
 static enum da7218_dmic_samplephase
-	da7218_of_dmic_samplephase(struct snd_soc_component *component, const char *str)
+	da7218_of_dmic_samplephase(struct device *dev, const char *str)
 {
 	if (!strcmp(str, "on_clkedge")) {
 		return DA7218_DMIC_SAMPLE_ON_CLKEDGE;
 	} else if (!strcmp(str, "between_clkedge")) {
 		return DA7218_DMIC_SAMPLE_BETWEEN_CLKEDGE;
 	} else {
-		dev_warn(component->dev, "Invalid DMIC sample phase");
+		dev_warn(dev, "Invalid DMIC sample phase");
 		return DA7218_DMIC_SAMPLE_ON_CLKEDGE;
 	}
 }
 
 static enum da7218_dmic_clk_rate
-	da7218_of_dmic_clkrate(struct snd_soc_component *component, u32 val)
+	da7218_of_dmic_clkrate(struct device *dev, u32 val)
 {
 	switch (val) {
 	case 1500000:
@@ -2375,13 +2375,13 @@ static enum da7218_dmic_clk_rate
 	case 3000000:
 		return DA7218_DMIC_CLK_3_0MHZ;
 	default:
-		dev_warn(component->dev, "Invalid DMIC clock rate");
+		dev_warn(dev, "Invalid DMIC clock rate");
 		return DA7218_DMIC_CLK_3_0MHZ;
 	}
 }
 
 static enum da7218_hpldet_jack_rate
-	da7218_of_jack_rate(struct snd_soc_component *component, u32 val)
+	da7218_of_jack_rate(struct device *dev, u32 val)
 {
 	switch (val) {
 	case 5:
@@ -2401,13 +2401,13 @@ static enum da7218_hpldet_jack_rate
 	case 640:
 		return DA7218_HPLDET_JACK_RATE_640US;
 	default:
-		dev_warn(component->dev, "Invalid jack detect rate");
+		dev_warn(dev, "Invalid jack detect rate");
 		return DA7218_HPLDET_JACK_RATE_40US;
 	}
 }
 
 static enum da7218_hpldet_jack_debounce
-	da7218_of_jack_debounce(struct snd_soc_component *component, u32 val)
+	da7218_of_jack_debounce(struct device *dev, u32 val)
 {
 	switch (val) {
 	case 0:
@@ -2419,13 +2419,13 @@ static enum da7218_hpldet_jack_debounce
 	case 4:
 		return DA7218_HPLDET_JACK_DEBOUNCE_4;
 	default:
-		dev_warn(component->dev, "Invalid jack debounce");
+		dev_warn(dev, "Invalid jack debounce");
 		return DA7218_HPLDET_JACK_DEBOUNCE_2;
 	}
 }
 
 static enum da7218_hpldet_jack_thr
-	da7218_of_jack_thr(struct snd_soc_component *component, u32 val)
+	da7218_of_jack_thr(struct device *dev, u32 val)
 {
 	switch (val) {
 	case 84:
@@ -2437,76 +2437,76 @@ static enum da7218_hpldet_jack_thr
 	case 96:
 		return DA7218_HPLDET_JACK_THR_96PCT;
 	default:
-		dev_warn(component->dev, "Invalid jack threshold level");
+		dev_warn(dev, "Invalid jack threshold level");
 		return DA7218_HPLDET_JACK_THR_84PCT;
 	}
 }
 
-static struct da7218_pdata *da7218_of_to_pdata(struct snd_soc_component *component)
+static struct da7218_pdata *da7218_of_to_pdata(struct device *dev,
+					       struct da7218_priv *da7218)
 {
-	struct da7218_priv *da7218 = snd_soc_component_get_drvdata(component);
-	struct device_node *np = component->dev->of_node;
+	struct device_node *np = dev->of_node;
 	struct device_node *hpldet_np;
 	struct da7218_pdata *pdata;
 	struct da7218_hpldet_pdata *hpldet_pdata;
 	const char *of_str;
 	u32 of_val32;
 
-	pdata = devm_kzalloc(component->dev, sizeof(*pdata), GFP_KERNEL);
+	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
 	if (!pdata)
 		return NULL;
 
 	if (of_property_read_u32(np, "dlg,micbias1-lvl-millivolt", &of_val32) >= 0)
-		pdata->micbias1_lvl = da7218_of_micbias_lvl(component, of_val32);
+		pdata->micbias1_lvl = da7218_of_micbias_lvl(dev, of_val32);
 	else
 		pdata->micbias1_lvl = DA7218_MICBIAS_1_6V;
 
 	if (of_property_read_u32(np, "dlg,micbias2-lvl-millivolt", &of_val32) >= 0)
-		pdata->micbias2_lvl = da7218_of_micbias_lvl(component, of_val32);
+		pdata->micbias2_lvl = da7218_of_micbias_lvl(dev, of_val32);
 	else
 		pdata->micbias2_lvl = DA7218_MICBIAS_1_6V;
 
 	if (!of_property_read_string(np, "dlg,mic1-amp-in-sel", &of_str))
 		pdata->mic1_amp_in_sel =
-			da7218_of_mic_amp_in_sel(component, of_str);
+			da7218_of_mic_amp_in_sel(dev, of_str);
 	else
 		pdata->mic1_amp_in_sel = DA7218_MIC_AMP_IN_SEL_DIFF;
 
 	if (!of_property_read_string(np, "dlg,mic2-amp-in-sel", &of_str))
 		pdata->mic2_amp_in_sel =
-			da7218_of_mic_amp_in_sel(component, of_str);
+			da7218_of_mic_amp_in_sel(dev, of_str);
 	else
 		pdata->mic2_amp_in_sel = DA7218_MIC_AMP_IN_SEL_DIFF;
 
 	if (!of_property_read_string(np, "dlg,dmic1-data-sel", &of_str))
-		pdata->dmic1_data_sel =	da7218_of_dmic_data_sel(component, of_str);
+		pdata->dmic1_data_sel =	da7218_of_dmic_data_sel(dev, of_str);
 	else
 		pdata->dmic1_data_sel =	DA7218_DMIC_DATA_LRISE_RFALL;
 
 	if (!of_property_read_string(np, "dlg,dmic1-samplephase", &of_str))
 		pdata->dmic1_samplephase =
-			da7218_of_dmic_samplephase(component, of_str);
+			da7218_of_dmic_samplephase(dev, of_str);
 	else
 		pdata->dmic1_samplephase = DA7218_DMIC_SAMPLE_ON_CLKEDGE;
 
 	if (of_property_read_u32(np, "dlg,dmic1-clkrate-hz", &of_val32) >= 0)
-		pdata->dmic1_clk_rate = da7218_of_dmic_clkrate(component, of_val32);
+		pdata->dmic1_clk_rate = da7218_of_dmic_clkrate(dev, of_val32);
 	else
 		pdata->dmic1_clk_rate = DA7218_DMIC_CLK_3_0MHZ;
 
 	if (!of_property_read_string(np, "dlg,dmic2-data-sel", &of_str))
-		pdata->dmic2_data_sel = da7218_of_dmic_data_sel(component, of_str);
+		pdata->dmic2_data_sel = da7218_of_dmic_data_sel(dev, of_str);
 	else
 		pdata->dmic2_data_sel =	DA7218_DMIC_DATA_LRISE_RFALL;
 
 	if (!of_property_read_string(np, "dlg,dmic2-samplephase", &of_str))
 		pdata->dmic2_samplephase =
-			da7218_of_dmic_samplephase(component, of_str);
+			da7218_of_dmic_samplephase(dev, of_str);
 	else
 		pdata->dmic2_samplephase = DA7218_DMIC_SAMPLE_ON_CLKEDGE;
 
 	if (of_property_read_u32(np, "dlg,dmic2-clkrate-hz", &of_val32) >= 0)
-		pdata->dmic2_clk_rate = da7218_of_dmic_clkrate(component, of_val32);
+		pdata->dmic2_clk_rate = da7218_of_dmic_clkrate(dev, of_val32);
 	else
 		pdata->dmic2_clk_rate = DA7218_DMIC_CLK_3_0MHZ;
 
@@ -2520,7 +2520,7 @@ static struct da7218_pdata *da7218_of_to_pdata(struct snd_soc_component *compone
 		if (!hpldet_np)
 			return pdata;
 
-		hpldet_pdata = devm_kzalloc(component->dev, sizeof(*hpldet_pdata),
+		hpldet_pdata = devm_kzalloc(dev, sizeof(*hpldet_pdata),
 					    GFP_KERNEL);
 		if (!hpldet_pdata) {
 			of_node_put(hpldet_np);
@@ -2531,14 +2531,14 @@ static struct da7218_pdata *da7218_of_to_pdata(struct snd_soc_component *compone
 		if (of_property_read_u32(hpldet_np, "dlg,jack-rate-us",
 					 &of_val32) >= 0)
 			hpldet_pdata->jack_rate =
-				da7218_of_jack_rate(component, of_val32);
+				da7218_of_jack_rate(dev, of_val32);
 		else
 			hpldet_pdata->jack_rate = DA7218_HPLDET_JACK_RATE_40US;
 
 		if (of_property_read_u32(hpldet_np, "dlg,jack-debounce",
 					 &of_val32) >= 0)
 			hpldet_pdata->jack_debounce =
-				da7218_of_jack_debounce(component, of_val32);
+				da7218_of_jack_debounce(dev, of_val32);
 		else
 			hpldet_pdata->jack_debounce =
 				DA7218_HPLDET_JACK_DEBOUNCE_2;
@@ -2546,7 +2546,7 @@ static struct da7218_pdata *da7218_of_to_pdata(struct snd_soc_component *compone
 		if (of_property_read_u32(hpldet_np, "dlg,jack-threshold-pct",
 					 &of_val32) >= 0)
 			hpldet_pdata->jack_thr =
-				da7218_of_jack_thr(component, of_val32);
+				da7218_of_jack_thr(dev, of_val32);
 		else
 			hpldet_pdata->jack_thr = DA7218_HPLDET_JACK_THR_84PCT;
 
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
@@ -2887,21 +2876,8 @@ static int da7218_probe(struct snd_soc_component *component)
 	if (ret)
 		return ret;
 
-	/* Handle DT/Platform data */
-	if (component->dev->of_node)
-		da7218->pdata = da7218_of_to_pdata(component);
-	else
-		da7218->pdata = dev_get_platdata(component->dev);
-
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
 
@@ -2965,10 +2941,10 @@ static int da7218_probe(struct snd_soc_component *component)
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
@@ -2989,6 +2965,9 @@ static void da7218_remove(struct snd_soc_component *component)
 {
 	struct da7218_priv *da7218 = snd_soc_component_get_drvdata(component);
 
+	if (da7218->irq)
+		free_irq(da7218->irq, component);
+
 	regulator_bulk_disable(DA7218_NUM_SUPPLIES, da7218->supplies);
 }
 
@@ -3259,7 +3238,7 @@ static const struct regmap_config da7218_regmap_config = {
 static int da7218_i2c_probe(struct i2c_client *i2c)
 {
 	struct da7218_priv *da7218;
-	int ret;
+	int i, ret;
 
 	da7218 = devm_kzalloc(&i2c->dev, sizeof(*da7218), GFP_KERNEL);
 	if (!da7218)
@@ -3284,6 +3263,28 @@ static int da7218_i2c_probe(struct i2c_client *i2c)
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
+	/* Handle DT/Platform data */
+	if (i2c->dev.of_node)
+		da7218->pdata = da7218_of_to_pdata(&i2c->dev, da7218);
+	else
+		da7218->pdata = dev_get_platdata(&i2c->dev);
+
 	ret = devm_snd_soc_register_component(&i2c->dev,
 			&soc_component_dev_da7218, &da7218_dai, 1);
 	if (ret < 0) {
-- 
2.50.1

