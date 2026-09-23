Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013048.outbound.protection.outlook.com [40.107.159.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863BF43BDC7;
	Wed, 23 Sep 2026 06:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144021; cv=fail; b=cvoAmsEblUSONovwpg8Z0Sww6r4n+mUaD99bRZH1f5PsUMX8+43O1X9FFRBtrXEvtGEY2ZcKT8tysln7BOyLct/HXyA/edj6bDoysH6DFvpwWEl3FuFuv0XKyEmlBlWwkKZYVIDiiz2IBDrYu0cbXTsR1Vvq7q86gP+Q5uc0DlM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144021; c=relaxed/simple;
	bh=qEMqprp8CWTdo7TMThRLU1Zh5CRm1eBW79ke9ElAD9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SfVhiX4WRYeJHbDJxW5qB+SwO6hKi38s5WtuS1Ti70fqjr3Y//gOlpMs6jtx2UnrxuGLqbAIaecrsvlkjWF5JhaPWYVEo6JeFedM4/s6Ds8dXpeHGi+h6vtB9vF+EHQoI/39pbfOQ83P66YhlCtZZ89FviOdOEACMieLrnPjPP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iXY9osL+; arc=fail smtp.client-ip=40.107.159.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iXY9osL+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pSmFrdYU/grkXA2E20aY2Q5VPs1WRgwORIXsvGhojDFTT6LtjZvJxpkEXOo9hHq7kozyxvbiFJNVywX6kx/aidBQEQuhBKs+xHj0IILoQfmEotAvte/PMPw2DUyNU8eiL9i6eBBv+XfD9vfN4Jduvy9xJpAZdhuX469hzFvfPt7kWuU2B0m6ggWKiOzqovv8t9a05tiqoJYo10SDuBnTWkAqSQ4CpmcYkqcAh1vhVwnoRFfo/dUWuARnDm29b6igyQtPEec7kr/nqkaC1pG+40wFy+pThVadHLO5aCqEmEwss+wsbLRKFbYEAchm1ZENBOI56nNTUtdyHPtCnHGxYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cv2W0k0/Ejzq2odJu2pL7H9Wi9Ka+zCk4zA7jrVjKUk=;
 b=meztiJkFaLh0PujTHWm2mbKGxNEBlRgz4KjH94L7xz5wc/pHth/VgvqFXdc9UUdItzY3ehRPhFsK32RXYJh9HQ46UcCVbLoD47zrUqCXRuehMIcPtalHaeWI6vAa6p9ABbFvmHmKDVFlg9Vsyh/LwVr6SddNPPqJpx0n0PYLHg/pYTbb/9HWngnEYT6SfHqa4w8W7K/ATuGM5OwJ7XTm0fiK8dCKyO/Mct3vpsbo+oMO33zolrXzcOqY5YUAo779yK7M8zC/jjPepnrXsX1MHL0ImXM6ZkhjWFR3c7LiS1RPzt81i3BQwlBs5r+PsI1f9eZkweGR1uXZC1BU8UOC2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cv2W0k0/Ejzq2odJu2pL7H9Wi9Ka+zCk4zA7jrVjKUk=;
 b=iXY9osL+4GzkXI1FrSxRaoUv5cfINTRHNR7Bx6ccuo2hJPWDQr/aYZJBrNKGZ5XoqInY1HADE4KrGxaiXxhLX918lKfIPHCjHfIKws4VrkRm2yK/B5dkIOAbEfqKjLL/dOjYHCWGQcmIkAprRLbvsBicr2AssmBN5eYLfYHs2WrDVwH0da55vwXPvAFiN3s5BbeRiYejDCvNYmBLgjM7CbO/sPcZSHlVvHuApbPFQAyQOyPAGN9Ainw3QIURDNvcjItQY4he4P1auB1LjnW8UBWglYbRF8iNyqoV5SD0mi2PY0YU+X0L77JYxfmplGNyE0Zs22X/Ei0EG+uqmUnfVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VI0PR04MB10997.eurprd04.prod.outlook.com
 (2603:10a6:800:267::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 06:13:33 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 06:13:33 +0000
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
Subject: [PATCH v2 03/21] ASoC: codecs: tlv320aic32x4: Fix clock leak from runtime callbacks
Date: Wed, 23 Sep 2026 15:12:47 +0900
Message-ID: <20260923061305.4041197-4-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
References: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0078.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c6::15) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VI0PR04MB10997:EE_
X-MS-Office365-Filtering-Correlation-Id: df4bae80-f219-4d73-8e78-08df1939cc06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|19092799006|10067099003|56012099006|6133799003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZNm7EQwbkBxE7d8+QCvfcwfcyqGFOyi+UOjOVLMQ0ql+p+sZ37IwsvQmYIGy3btpuQy4CQLsta1cpt5UNWnQ8fGU+ggf5XxChgSBzhbz1YkFhQyG8vMgW3Guy6exmrOMotCDXUJhFWqNm+eEjxPPjOr18+EvFGd3tjejcu2t3Vwiw3tj0M+y55RnYuxoF4DN/ClbyAGNPLuwUN64pwWJGf+fMJvzn5CzQDyxGjLhi5Idj/0BKmn2YaRpIJeZG3r426P2wdRzfCsAMsQDRvMwQMWuH615zLPq8LsaiZz/Znb7aYBt1CK2Kn9bptDZ2RAjd8C6tXC7R8q+jh/AbHjSS8t2BvjyholtjAayHCsXgZG6wupkF4nOd1Ej18jfQoypcPVPtP2RQYiPs0pRearI9y1i+AxmfhHFnCo+BNgdo1r9Sk+iQTFEaHSD0lwflJp8EEnd4txBIpfA4Lf+wSY6/xpAo2gUgPB7MBMw1bEzECdftq8koTdPOLz+uMKMfIjcq54aMQhyFtpptx6ok7voNMI7hSoMmvBAKJw9BgLCvq3OdQij+f35Gp6SyVrqlnIyYx+20HSRp6FmVXzPybaiPhk/WhKXIh3Vqt75Yl4N2SxQ5VxExg02cr4S07IIedIh9nSOlTZuvZKbbOhmoV3PmWkaYRuaSoqEciXfE8mPCkw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(19092799006)(10067099003)(56012099006)(6133799003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+657yRa8qhfwb55Lq+x/svDroKeJ/s4LZvRXnA1F4NoEPAhQxoAHn53kqL5T?=
 =?us-ascii?Q?dDfUOdXnCWg7ZJx+0Nroa+H2HiPUP42qPifUQJJJteaeQU/T/YE/HwPOaXrr?=
 =?us-ascii?Q?klEDUI5O4KComR/IB83y846PDG8Ev59EEGXffMYkDVYMIYZZoFO/JJi3c4mV?=
 =?us-ascii?Q?5+wdVeKgfkCvN88tpBVESeXnPq2YKiqwRwBRJxNxsY+M9cUMy5FdKl0yIuJk?=
 =?us-ascii?Q?+YiMV45/Fa6wK+n21kQrzETnwNJKXM5I+SF+n4nLpCnZXcoYU8jhIwl/XVCG?=
 =?us-ascii?Q?NIhPBfV5wiNipIwddvZHWUrqZY3QIiDqfVB+yqOujU/EX2tHCYsImjGyGpJI?=
 =?us-ascii?Q?q2iE7NLyKiVsbY3o0s6GQJobpGX8MK5KlKIRsCaV8jPhAMJIzFNi5oyLTX2+?=
 =?us-ascii?Q?hW1A10EzxNbyo+F9ygH0Spa5z017R41xrjHP1zB6FbuD4lrp6Qv2oNoVj0Hy?=
 =?us-ascii?Q?vL+QNPQk+ZmawRHtyvBUXOGBUjxe7ixd+x2a7uNHZ+66aPM4ja9RTGHJzNiF?=
 =?us-ascii?Q?5N5TiNZBJ4KmP423Sdq6K3FyKIyGgvXQRFIcGmcNyTwg/+mJgcUgtIJLCa/8?=
 =?us-ascii?Q?4zdjLHhDxz6yekWPBFmZ7cOJ9aJfIV58OvK1cbqW41O1yAZst+6PwnqNUbJf?=
 =?us-ascii?Q?baTEArJw3QOL96/sLI4sGFePccsmmtSM1GrBW856K/FSqJwfP/4ggrqBN8e6?=
 =?us-ascii?Q?aLHfaC4xgT5txfN1ksxtXK3INoTd9mzfxhSTmBvSx7UCj3K4cSY7t2yE5Za3?=
 =?us-ascii?Q?drqNVrxgTfwOZR7Z/z9NJA4BUYgFwDkQ+Oj3e5PwK8fv9nm4xJeb9sK1L9pu?=
 =?us-ascii?Q?f3x7pYQSy0IEakeZotQhAhjNyH+E/h/YnKED1FcxuesDlft951PcARiLsthu?=
 =?us-ascii?Q?jSMWXgk+c/ndpHCU0qWgEfw4H0qx8F8yzlVI0lD2Y9zhzn8Oy7XmLtMWFEUC?=
 =?us-ascii?Q?TDAayaViXzB/8N+rx+kaYy/EDDiOLfx1udACuZE2u9veb/uyySxbHyWHQxJ/?=
 =?us-ascii?Q?DvVxtZ5U0JvLacOKYujyCXa0gZDnzT2gBMEekBMv5dDv6f32aAtRgUFLp6nF?=
 =?us-ascii?Q?gnPQzZJzWhslhgjQVshEAg1aeCUffsSEdvWyEVAJvbvHoMkkomYNnx2tm/YP?=
 =?us-ascii?Q?L3WJ849mbP6b4eSKsddiuoFbY8TaPlOmJBUrVKBB/5F3gvyprBksatqlWqQg?=
 =?us-ascii?Q?gDSyVN46X6TZq/F4uYRcFTZcWn0WOYklXnTYxATKsR2Wgg2GMtybERJhbqX1?=
 =?us-ascii?Q?WTGsQDOBOFLaY973Fg+R6CPUqJrIlIlUYh9pCXTY6OTq0SIsPawbhcIW4iAg?=
 =?us-ascii?Q?HQ2SQW8MvZm9eqvCGpnv38/spsq8//PTdqYQfc1DiVfzgY/wF0N/I95jQi2d?=
 =?us-ascii?Q?SiuX4all0HZky1ouJCbtcEaPkPQ4fsyLuHDHX6VAZN8J4NKchjrWkYhhgX3A?=
 =?us-ascii?Q?Ksw6x+g+w/2IbxdcUoUSNalchbePu1HaIRkI3qRRZEXOraqXAj/7aTzlH0Vf?=
 =?us-ascii?Q?5Gm51sp49E7TvfnALVduFc9NXb1yUklUAbX6T07tDxGYtliCUeyW8a5dej7N?=
 =?us-ascii?Q?QGQPlpDN4NOBb6IOnHWpqL90MlQfP6KCNvabgvvzghAd4x3Xy3FNs9q83d0h?=
 =?us-ascii?Q?/KRu5PYF8U+cerdtuvI8WxT1bw5Uv7KGc6jFUemMlpLBRMtvub4M2LdoqPeq?=
 =?us-ascii?Q?sHDKvxWMEzoW+f0rgefUPuei/7HPJ8GxYITb32vLB3nncecXA4Z+PfO3HS0k?=
 =?us-ascii?Q?z0BAMNQcxT53NBd0Nq58lLLIXsKtPSHiBweUjE0F5j+28GF7TpjK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df4bae80-f219-4d73-8e78-08df1939cc06
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 06:13:33.8254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KRCqxvmnrGLcHtmMjS7dUhYVJX/uwNIBm6OqFlEbbdG+oEWNUBszZ46eWRZ+cSH3VuORk7a/SYcfLYXyqj2ldGqhgeYud+KGHLg3l/mCrSlQoaPvXmBBxlMn96/5dch0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10997

From: Chancel Liu <chancel.liu@nxp.com>

component->dev is the underlying I2C/SPI device. The driver acquired
its codec clocks with devm_clk_get()/devm_clk_bulk_get(component->dev,
...) from the DAI set_sysclk runtime callback, from set_bias_level and
from the component .probe. Because devres on component->dev is only
released when the platform device is removed, each card bind/unbind
(and, for set_sysclk, each runtime invocation) leaked a fresh clock
reference.

Acquire all codec clocks once in the bus probe with a single
devm_clk_bulk_get() into the private struct, and have the runtime
callbacks and both component probes reuse those stored references.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/tlv320aic32x4.c | 94 +++++++++++++++-----------------
 1 file changed, 44 insertions(+), 50 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index af4be5bee723..7fec94768afb 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -48,8 +48,18 @@ struct aic32x4_priv {
 	enum aic32x4_type type;
 
 	unsigned int fmt;
+
+	struct clk_bulk_data clocks[7];
 };
 
+#define AIC32X4_CLK_CODEC_CLKIN	0
+#define AIC32X4_CLK_PLL		1
+#define AIC32X4_CLK_NADC	2
+#define AIC32X4_CLK_MADC	3
+#define AIC32X4_CLK_NDAC	4
+#define AIC32X4_CLK_MDAC	5
+#define AIC32X4_CLK_BDIV	6
+
 static int aic32x4_reset_adc(struct snd_soc_dapm_widget *w,
 			     struct snd_kcontrol *kcontrol, int event)
 {
@@ -591,14 +601,10 @@ static int aic32x4_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 				  int clk_id, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
+	struct aic32x4_priv *aic32x4 = snd_soc_component_get_drvdata(component);
 	struct clk *mclk;
-	struct clk *pll;
-
-	pll = devm_clk_get(component->dev, "pll");
-	if (IS_ERR(pll))
-		return PTR_ERR(pll);
 
-	mclk = clk_get_parent(pll);
+	mclk = clk_get_parent(aic32x4->clocks[AIC32X4_CLK_PLL].clk);
 
 	return clk_set_rate(mclk, freq);
 }
@@ -750,17 +756,7 @@ static int aic32x4_setup_clocks(struct snd_soc_component *component,
 	unsigned long adc_clock_rate, dac_clock_rate;
 	int ret;
 
-	struct clk_bulk_data clocks[] = {
-		{ .id = "pll" },
-		{ .id = "nadc" },
-		{ .id = "madc" },
-		{ .id = "ndac" },
-		{ .id = "mdac" },
-		{ .id = "bdiv" },
-	};
-	ret = devm_clk_bulk_get(component->dev, ARRAY_SIZE(clocks), clocks);
-	if (ret)
-		return ret;
+	struct clk_bulk_data *clocks = &aic32x4->clocks[AIC32X4_CLK_PLL];
 
 	ret = aic32x4_configure_rate(component, sample_rate, &aosr,
 				     &adc_resource_class, &dac_resource_class,
@@ -876,18 +872,15 @@ static int aic32x4_set_bias_level(struct snd_soc_component *component,
 				  enum snd_soc_bias_level level)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+	struct aic32x4_priv *aic32x4 = snd_soc_component_get_drvdata(component);
 	int ret;
 
 	struct clk_bulk_data clocks[] = {
-		{ .id = "madc" },
-		{ .id = "mdac" },
-		{ .id = "bdiv" },
+		aic32x4->clocks[AIC32X4_CLK_MADC],
+		aic32x4->clocks[AIC32X4_CLK_MDAC],
+		aic32x4->clocks[AIC32X4_CLK_BDIV],
 	};
 
-	ret = devm_clk_bulk_get(component->dev, ARRAY_SIZE(clocks), clocks);
-	if (ret)
-		return ret;
-
 	switch (level) {
 	case SND_SOC_BIAS_ON:
 		ret = clk_bulk_prepare_enable(ARRAY_SIZE(clocks), clocks);
@@ -970,23 +963,16 @@ static int aic32x4_component_probe(struct snd_soc_component *component)
 {
 	struct aic32x4_priv *aic32x4 = snd_soc_component_get_drvdata(component);
 	u32 tmp_reg;
-	int ret;
 
-	struct clk_bulk_data clocks[] = {
-		{ .id = "codec_clkin" },
-		{ .id = "pll" },
-		{ .id = "bdiv" },
-		{ .id = "mdac" },
-	};
-
-	ret = devm_clk_bulk_get(component->dev, ARRAY_SIZE(clocks), clocks);
-	if (ret)
-		return ret;
+	struct clk *codec_clkin = aic32x4->clocks[AIC32X4_CLK_CODEC_CLKIN].clk;
+	struct clk *pll = aic32x4->clocks[AIC32X4_CLK_PLL].clk;
+	struct clk *bdiv = aic32x4->clocks[AIC32X4_CLK_BDIV].clk;
+	struct clk *mdac = aic32x4->clocks[AIC32X4_CLK_MDAC].clk;
 
 	aic32x4_setup_gpios(component);
 
-	clk_set_parent(clocks[0].clk, clocks[1].clk);
-	clk_set_parent(clocks[2].clk, clocks[3].clk);
+	clk_set_parent(codec_clkin, pll);
+	clk_set_parent(bdiv, mdac);
 
 	/* Power platform configuration */
 	if (aic32x4->power_cfg & AIC32X4_PWR_MICBIAS_2075_LDOIN) {
@@ -1127,23 +1113,16 @@ static int aic32x4_tas2505_component_probe(struct snd_soc_component *component)
 {
 	struct aic32x4_priv *aic32x4 = snd_soc_component_get_drvdata(component);
 	u32 tmp_reg;
-	int ret;
-
-	struct clk_bulk_data clocks[] = {
-		{ .id = "codec_clkin" },
-		{ .id = "pll" },
-		{ .id = "bdiv" },
-		{ .id = "mdac" },
-	};
 
-	ret = devm_clk_bulk_get(component->dev, ARRAY_SIZE(clocks), clocks);
-	if (ret)
-		return ret;
+	struct clk *codec_clkin = aic32x4->clocks[AIC32X4_CLK_CODEC_CLKIN].clk;
+	struct clk *pll = aic32x4->clocks[AIC32X4_CLK_PLL].clk;
+	struct clk *bdiv = aic32x4->clocks[AIC32X4_CLK_BDIV].clk;
+	struct clk *mdac = aic32x4->clocks[AIC32X4_CLK_MDAC].clk;
 
 	aic32x4_setup_gpios(component);
 
-	clk_set_parent(clocks[0].clk, clocks[1].clk);
-	clk_set_parent(clocks[2].clk, clocks[3].clk);
+	clk_set_parent(codec_clkin, pll);
+	clk_set_parent(bdiv, mdac);
 
 	/* Power platform configuration */
 	if (aic32x4->power_cfg & AIC32X4_PWR_AVDD_DVDD_WEAK_DISABLE)
@@ -1362,6 +1341,21 @@ int aic32x4_probe(struct device *dev, struct regmap *regmap,
 	if (ret)
 		goto err_disable_regulators;
 
+	aic32x4->clocks[AIC32X4_CLK_CODEC_CLKIN].id = "codec_clkin";
+	aic32x4->clocks[AIC32X4_CLK_PLL].id = "pll";
+	aic32x4->clocks[AIC32X4_CLK_NADC].id = "nadc";
+	aic32x4->clocks[AIC32X4_CLK_MADC].id = "madc";
+	aic32x4->clocks[AIC32X4_CLK_NDAC].id = "ndac";
+	aic32x4->clocks[AIC32X4_CLK_MDAC].id = "mdac";
+	aic32x4->clocks[AIC32X4_CLK_BDIV].id = "bdiv";
+
+	ret = devm_clk_bulk_get(dev, ARRAY_SIZE(aic32x4->clocks),
+				aic32x4->clocks);
+	if (ret) {
+		dev_err(dev, "Failed to get clocks\n");
+		goto err_disable_regulators;
+	}
+
 	switch (aic32x4->type) {
 	case AIC32X4_TYPE_TAS2505:
 		ret = devm_snd_soc_register_component(dev,
-- 
2.50.1

