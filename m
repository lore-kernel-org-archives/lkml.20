Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012034.outbound.protection.outlook.com [52.101.66.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045764825D3;
	Mon, 21 Sep 2026 10:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987635; cv=fail; b=sDR1vMQSyH7PDEMSoZ+Mc1lrxNQC+cchfwre//xpOUFmdtCkOVKqO99p4GIO7gxAtURg37TosCjkjlBdXrfYEV1GSaQ/au+qYr0HppljImEvDAMRWvJ4RCyLAawKo40zfZ2AcD2OnOVreYlOj+LUJg2k/KIVN0HAjuoBL7iXzQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987635; c=relaxed/simple;
	bh=qEMqprp8CWTdo7TMThRLU1Zh5CRm1eBW79ke9ElAD9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YTAjKSL8agKFjGMXLFdm7923qcEuV8wynmPIsNXmYI2HQ0ZsMIXtRjxTHyoia7VQM/ZIRIupFc9WWq5QNawlgwTJyWKKxGJ509sqKD4KanY3DmfG07Mpv9Abifujm4al83yXRwLqC92RasM6BkVs+2mUQP4KUQKHsxUIvDiOOOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OF1msDl+; arc=fail smtp.client-ip=52.101.66.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OF1msDl+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BRBtG9cwpeC4mlIZBo+9guP/4PBjHkfb5dHM9biFWxbv88HbBD4vo4cijs/iZjDgb8Zop9mP6jAX5Sf7pnFPOkBKwVWrZfxIYt5ABehJDGsYVyWZdIBkEYfBkcu691/kWKPIq93rhoGEz5fmaJkmEwSLY9GYpEYXPhU5t2KJUvj0du7IVIdtgp+BbZECv/I2yM+rE+asLlpFuHjU4s6z7LG4xMJpf6hesIrPydT/bciJ8Jo1E4JxGD1ZY9m3a/1SH2szyZ9LAUGv7P3rogDq5CFYP94rajU+HwyiMrs6zM0HVaQXol42G5i0yTrIqxEIIo+3Uv9BOJjizrtG3peH0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cv2W0k0/Ejzq2odJu2pL7H9Wi9Ka+zCk4zA7jrVjKUk=;
 b=I+WVGEp4/0FlC6UdAv4hp6ViULqqAz8wfqK8eMaehP8PTel0BDgp3W/ZPXdE8S1k69SKCzDgZwl9bwFRQi2zHc+9PnTzugTB396CnDdNoU+i35ccMeW4QkiLnKEkm81YfMhAWu/ddo9clO9yzk2D84qV4mA3uWrFw9nNpLufPtO40BGIPdR9FjA2pdsn2OtrpaOhx7rOrIh67mnPzxgNV8fii+Rn7i+LiNTXLVVvMbL/BX6axD3j9EA15dkBGXn1pGQySyaNjt49U8gvMbWtFt7JFPJkjRBLyVuFmN04bJ0/5RQXR5VLDhPFG9E7By84+rcc3xc0Iuhf5wW5kMlwMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cv2W0k0/Ejzq2odJu2pL7H9Wi9Ka+zCk4zA7jrVjKUk=;
 b=OF1msDl+7uFsEz5wPEYE4wcIAu2yTopp1qbDN2roF4UV1UnL0DiFKfdMeAK3RLUW887c6lSx+UeR0/cG65bfaSYYID8X+wjufMcHVefOwyycEx6ocgG33XizSj+ZzUw3LDCW884iaQgETeZl59WNKF8tZs0Z5TH3FmpXet81s6hRvH5s2kD8Wj0L9Rhqzt5swdOr8M6sQv4FOoNDKVVmKXAKizqSclAAkI83GZkgDRq+OsFs6HmuFHPMLBb99xeEuhEvN9ewO/Ya+uYousOP1XUvY/2BgcEV1ozVV4sHxy5l74mM9r9YKiCY7PZh4v/r8AUxGL0iDZoSSh5Tk4qcDw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VI0PR04MB554873.eurprd04.prod.outlook.com
 (2603:10a6:800:361::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 10:47:10 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 10:47:10 +0000
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
Subject: [PATCH 03/21] ASoC: tlv320aic32x4: Fix clock leak from runtime callbacks
Date: Mon, 21 Sep 2026 19:46:22 +0900
Message-ID: <20260921104640.1941554-4-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
References: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0168.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2cb::10) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VI0PR04MB554873:EE_
X-MS-Office365-Filtering-Correlation-Id: 98ecf975-735e-477a-86d9-08df17cdb021
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|23010399003|366016|10067099003|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VoS9yhcYewibqOHJx18c6Za9UyD7W6b+TwNsGf3e9j3dB6kJV/7uAbIN/Wp5nAJTKvmI4Yl8ooGAVsxBsmFl6lUMoHxsil+zqLyGSK3vv5dgI2hFqzwXUmex/gYdODGpCAjfPQLPBJWxrmaujYWiGTSKLB2SINKYJQ4T9YfiZaU+BV3gemBo5XcWC1Nq854XO8l5VGlam6QIF2kE1TDI0NrmeOUzQikLg3VTRUtwxe9m8T6byFOL47Yp+3xbiPL8IG0ihfRqZi0tRyrC0rYkXrl/VxpZGhaj85GxrU+bZiRlPjwgTeT2RHVjnXqguHeNOIrCT/G62NyBfwN2ga9VOif36kFg7w1a24p8Zc+uruBdJbsuvvZ1CjrCZ8GRaz1J0QT+IazYH9ShLAfvzdM0zmzfyxiAnH4kLImym8UJC7s3SGrWj6g/sYnUWFGKtX2cRnZ3yyYGxDSSnqICaGs+cAeiO1M5w3AX+IrgBhL/3qzz5CgMNWcQzGIMkk1R4B06F7IATtygCPlULtjW3E2yw4u/bRffPZDGYfhfNep+OraVbpSu9i8Mwj1YH+ErrrPODNUo2YSpj8QN+Adpl3G4sltDdrY7e1To5m7GM6dJqvU76Y3D9fFtIqcrdb5UkUJzbl8VCLkJTjKODQ42nlNpRSBwtaKm3g339c9Ly7I/DrY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(23010399003)(366016)(10067099003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+fSedBNzhbYQh/jNYfb4YAAZl5E7Ug0k3owcuBTsuglcc+6BCXQtvNm27GZl?=
 =?us-ascii?Q?H4X1gvhaFB0vr9gHgbP/VRRv+CCVitOd/eTmSMMuT6bP0/d4ZXTEIDM8Gqmw?=
 =?us-ascii?Q?Oazhqva0/gzn7RgMJLsm6buqVnUPBQq16f8a7/XU86m/C1fXsjBeAN/dL1n8?=
 =?us-ascii?Q?Ofwh7/5mwYVZK2q+lkU5ASqLN3EJz281NnxV0pc3/dzC06CItkgw4PniTHVM?=
 =?us-ascii?Q?5Y59ZnMoY7c1csRKr6k9yQ3J858XFid7S6YnhymGDmdmoKEObA5cyTqgwQux?=
 =?us-ascii?Q?Hn7OYU+hYHU6pv3IoadTcGlV29O68CtZod6CWrS1B7heOrkTCaTqBFuEXZdx?=
 =?us-ascii?Q?ZNQ6j4CptebGQbITb1hJ/iw3osB8Z9TVylq9XkcfuMaIKowf6xkPb+XGKnBq?=
 =?us-ascii?Q?OUjAxvqHEMFPeqTQPkz+EdgleUnybX0WhkvpdArnMY8eeFLLaf6+84i01EFm?=
 =?us-ascii?Q?ro4r8Z4wwNq7yPe5RYpsSEQy3Qr8k+Vrv4LrRU+LntFa4uw9nP5VN5V6G7PG?=
 =?us-ascii?Q?PDBJyPaucFtxeocxNjYtsimfq6b3+pAqfIzM9tC3TQd4J39rB1rcyrN5ault?=
 =?us-ascii?Q?ErXuLnRm78Nl/VeXiFMZP1XWHv+jqdIDDoap4LU6/vdNIneAR+cyB3uist5d?=
 =?us-ascii?Q?/WFcgwsHWTA/zi4zBrnw/tQNqRqO8V59McnfOnwtz+tyuFq2rfZN5MzzvbDD?=
 =?us-ascii?Q?UHzK1L78GNUvVmapXRjAKESR59JIP5IJfdqFEFV87sfTGqt6wZhlZfDTl4/z?=
 =?us-ascii?Q?x4TiSLkw0tXa7l806yr3/jiuOrSRmIw1o0mspYdgsr9scG3JeKnIec6N9VCd?=
 =?us-ascii?Q?2S21NgggZGeKiflaYykVaCWX/B/I81HXAVjxuvxbQFxO/xVwvfdLH+BhH9MG?=
 =?us-ascii?Q?KyMFz/xQtQ+GbGc+2TaxypaG5JxN+bDZPywL1OXtlOtWyZZPzN5FSSWBMZbq?=
 =?us-ascii?Q?DIevkLi+L1D34lbq/tNnu4b64PfE+9TySK/fxLBVv2QhF9b1UtRdGgfzVpus?=
 =?us-ascii?Q?h1LVXdXy9iNfaP2TleIcz0h3+X+LqjkBsKt93MP0u9kQDwIDGzXtQSzANb+0?=
 =?us-ascii?Q?BeT5NeIYQW86nN3GV+iVUBY4LaiUhXOZoQlJpT2ixTC6le56xen3bpfFAFmy?=
 =?us-ascii?Q?aBVpWt66bWh0sUe386jtRdYS3/i84e28a8cCxbftj+hZvaTPEUfW/+kI3gtc?=
 =?us-ascii?Q?kQ1NQacurbllb3afR73dcK3vM89dgsZTofdOiDHPXc39PidOBVxGFzqSxvLw?=
 =?us-ascii?Q?s5ELRraqBdjhHuXn8sK0+bRIqiKNCl1TFPYXYqCK9HGXQbaHLK2RMzGvARMY?=
 =?us-ascii?Q?GAqCbBM50bbjLzmqxbkfTmkfILQJvVwHASY8FeVlA6tPnuWeBYO0VG6JskmW?=
 =?us-ascii?Q?YXsd2mvdo8fgdywKaFNOAdAR4cSbQaggeMY9BpqrEtYxxBZya84Fv3qcsSOF?=
 =?us-ascii?Q?1kk62Xn+5VxRJTkkGzg13dkMk22wwrS9qReVNfQo0kv3UugyyNB7y24hTXf2?=
 =?us-ascii?Q?Xg9VBcJQimtHLTnkx/zpJWG2NbN6ZXz+l/kx0p4Gld9vrXQ43dzGyaI0QTgJ?=
 =?us-ascii?Q?iEmWUkZQSvctdRuVy/rrEY1js335uLa4ATFmaf8ikwtK+pCsSqWEpZV8a7dh?=
 =?us-ascii?Q?yBF5s4qNQBIN7//RzYFEPJucFxhp+WoAZGBTty5V6lOCrrxCCnK8/SURCr+B?=
 =?us-ascii?Q?Wh9vxUn2HcerGjbsXaDawqytzsk+Y0AhCTjjOM+m/I5DW27zQUPeuoTifCvS?=
 =?us-ascii?Q?jkyVyAMeBCoVZIpdcsTq2RCz75XqOEwNhwdJUwDvA8QDdUSggDf9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98ecf975-735e-477a-86d9-08df17cdb021
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 10:47:10.2906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GFvqFi/uws4higJyTV0PQ/pNq016zX/s08IUUocWlPBKxNz6Mx/CNmGeveu46WgVnk1I9BD/GrFNRg4cYQ4KCsQHxtv4rmxDzt+ws6eduEYbUy+7Vu5nHVnhxM+7wNoc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB554873

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

