Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011019.outbound.protection.outlook.com [40.107.130.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5034A3AE195;
	Thu, 24 Sep 2026 08:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790239012; cv=fail; b=CCEswE5h253eOewUCedA8Qlf1yLEG1PiO+RClBB+3T+lpzjbO333+3mPUOZkFs9clMQd/Pc+XYOiyDjdiddYIGI0+ZNr2NscXvGbiQZx/i5fmfbNROOEIIUmm2L1AeM1jYh6QMxcWfRWUkpnwLlh9S22xtv0nyJ8dWKirKnQHUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790239012; c=relaxed/simple;
	bh=WmVZceEAoDQnZQ5NI9dtgTWuZ3TvO0qscSjG3kF7cUI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=byEiyDdw3yIDcHK0lF2ebBqLYOzp5us1ook06n3OKtQk8NfTtOrwpRHPaj2jE3YvlDA2PIrSsduVRBwLZygqCbZgta3BV+wChw+BREhBDEfIYAUOjiwHPS03xUUy+5g9dde1qxvAL3B+aNOThkzqTq6eA5B8eaZMABoJcc6nAOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uEfjf349; arc=fail smtp.client-ip=40.107.130.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uEfjf349"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vPVEkZ0fapjjofvx3IQEgyI4TYYgcnp9m1R/1DUKPfqq9CXbZIjR7M5bvQAwDd5uLGQl9PUAKEotL6u7hJP417k4NcWAlGUHKRZLC6krEmBvauZShYb8ylaaSJox7ZqpdLFBso24TbjN4RPb8zWWb7XRtmegIof7sOFXjniQbVa4GGfwB5KcEPe/3ri+grGbLlj+6LiP7bs3KDRouX6IQDoXCvX/2cv43C1ldAmeYqpav25bAPDToyBiSR+BJFVfcwDdaMKWF4urlH0EEGKVVKF/hLO4IczcFz0rELDTOtOFHrZDpd0mt/CNcZbjmIW646iDbC66wbwQMQ2eUCS3Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PexVcyDeRFkchwS9/+tXB6q8ri4Gh+PiC1uKs0j3FJs=;
 b=riY8T2X8gvdNft7mA0l+A9clAr5bWQd0U/vXgHwKoCpr937T1cw0F43PabwAx+jG4eAfYX71HBSg73TyJrbPWs8YdaJr8KXPIO1DxGBOUjK0v8ir5aKUtjWevf+62c78sO3bBSEYFSig9NnJnG9+A1vwbuTKt9Q/u6ZerTuEhl+nYA+ozYeWryFDTcf7jDkfTn+pzmJBukE8I4CaaGbr0moipPDLdI0eTyvodLdRkPPNWyerO+pDxtVvmRg40fjXfC2ioUJgUOYQEHRtZT/o1VQ/yIvSuEX0W/jqRsR5v/Cw7EGaNach7pGmxiT7Yiq+IMwhdHWlyc2WgX1XYZa4Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PexVcyDeRFkchwS9/+tXB6q8ri4Gh+PiC1uKs0j3FJs=;
 b=uEfjf349BzDVlg0r9tyRgFcymRms5QCziTB/B1xZa/n1vjUUS7yJPEf0nqR/HA6Whe2ZvXZ9u+BonQKoqUTk3c4db8N5Rhd5AlCs7rlIBrbyIN6svh74cn9448Gh8uqDQqPfQtscgUoXX57TGa5/CJuCuijllXD6ZzzOEHcXBzcX3i81+ADZfX/dGg1NNa+3JeenfLDzTb4O6VbZAMClsQmXg1bR1P1N0fUejX6luQainlravtCqS99EAQLpYlHgUSpf1yDxkqD6kRWdEM9DwJZClL6CCaEXKBgrfeTzziIunNVr7nplgkqQ6U81JMbQ5bvRlJM1OP7Y6kCbqgv6Cg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU4PR04MB11339.eurprd04.prod.outlook.com (2603:10a6:10:5ef::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 08:36:48 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 08:36:48 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: use regmap_assign_bits() for conditional set/clear
Date: Thu, 24 Sep 2026 16:34:12 +0800
Message-ID: <20260924083420.461715-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JH0PR01CA0126.apcprd01.prod.exchangelabs.com
 (2603:1096:990:54::20) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU4PR04MB11339:EE_
X-MS-Office365-Filtering-Correlation-Id: 51b15f31-f659-4987-082b-08df1a16f948
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|19092799006|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	4JsCzmZqXezGUTvht1gfMtQjU94iE6cYiGRiUPf3o2YEAp23HNfzBbPFFm/SLo/Eyu+XiP9/mfjeRCYZlTx4zu557JTKZ3np5lntJ6KDpIu8tc9+b1cro55oORk+a9pTelDCOCdPViCgQdjk9Es749+0QUi66SxxpP2qkyVRWHe8x0vdirwllxTwevLsneu/TUYS6ADK2FTiQ5rZSHotwcrvRDjfeqqFpGiGfS915/XzBZQB1bmiTTGFkSIdQaK8exsj6SkJaDQ97zSb+8aHzccbnghRz4ogLIzTTf/42qbz8Sj5m19qoJs6dcRjao8qEt2MUS1T8jI71ermUGydYztdP1HPcHUOG8ljCPoScuslgXKJNI9pxRAxXqmfWFjzHN9qZZ/CGXFSUqxswj3fFpGSP9X//ZEuYOQsnrIlMLpOQTYke3iER5cdwXNz3MEVSepre3sgNCBO3pPvMvCCxH7bsk+N78SKF8klSuXO/VxZOEWrGOxg51cwIbtaM62juXQlVFyLwyAdFt6k67sAKmxxFPiL9stPqr0auvp5vwY6aa77KTkAYuKIx2Tbx3f9VTz7YEFR0Lm8TWbs/LO04raODCP+NdxsJ2wX/QcthmAdsamqZfmQrgw6Mf2NwwQxZxcY2H0qFfUoUf0UNvskU70t9J6up9IAUc5nMNo51Sc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(19092799006)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2IhytS2vYx828Y9HCWvrNACpga4UD6SKLLqVw3GbLi56i5J7+iO86+fzGj7C?=
 =?us-ascii?Q?o6FgbuQOvEEInABWLd6rMgqk2PPsQ1muUyMQBfAko26oK3/tfOqZsYOLNzLO?=
 =?us-ascii?Q?e+eiZwZLMQYO/vY+zh6LwoUkDEC5NfAxCO0vbfGX6glZ2QxQI7x5HM1GKI+W?=
 =?us-ascii?Q?Be55IFz5LK6UEOoS1IdqbEsnLcaAZXQ8OwoX5WkqLzNO6p8Z2UL+ZzDCc8/8?=
 =?us-ascii?Q?XwlHN4s7qbgGXoZzXQZOVVrGJj0X7gy86udHMRgA2x3+fIB5fe5CQQDpAbPI?=
 =?us-ascii?Q?rTeqQJ5Z0JCkbW0IWU56qr13zYXQkPgmRblZ7jJvJZd4mxyUiLX+vASacBpn?=
 =?us-ascii?Q?h7PExAa2oWbUn34RWMD+ZqVAcUlQ5hAzwQgWDfrVRp8Z/erNNtxN0FaHvBh2?=
 =?us-ascii?Q?Hkd+Cp0As5ZIeD2unessWNdgvsGUDCkuSEqleqm4QJYobrXF73KSKGQKFarh?=
 =?us-ascii?Q?L5SO/MYO4seQyuknmtoPzqrbqEbvgGJ4vSwMCcgznC8ttUyS3Y6lCKG6KMY/?=
 =?us-ascii?Q?06k5/h4bWsQSWXmANMf6gkGHvI+/Uc2TaFg5b7lQtQUZ8QgFDqmzcE7fs5Lr?=
 =?us-ascii?Q?okUjPvFPd5sFcxY/NqEtn3QGR/3I4uaZ+ovO+uOSwfPNpY1ITHMHm91UCD8E?=
 =?us-ascii?Q?bxuHzX6WG81CoCorBs2KeMFIQJ+2fx/RkrtTmju9AF48MM6jZPvWO18J96sd?=
 =?us-ascii?Q?OuGltXFnIS2XU26Er/P+AaiX93My0oUsaMwax2uSABThOdnewMmtClGA3ayp?=
 =?us-ascii?Q?VMljYxFNtLhLUjIzKw2VQXZkczPMEfCFzAC8F7HDRObsGI0tWVDb2fw2fr5y?=
 =?us-ascii?Q?S7KFKgYhyxI++rLmzL0LUIBNWt5SnSnMGyLPB54WW9peqzgqiTYrEEkFBeVk?=
 =?us-ascii?Q?WzEeBsHL9AfPTBQSPqRYm0cDCK/bQ/Lld9kwjB7oqCjl492cfd0a0kM08Ic2?=
 =?us-ascii?Q?lUpmxGt+NSUI4F3eXB4dldHKRYNG7xs6hW4WybomgSq0/IqGeR6l66TlNwq7?=
 =?us-ascii?Q?5DN7M6O5Z/VMI+bczi5GTwaRMPVhyh+4VenA3SxT7FjLxHn+/13mGEgsD62Y?=
 =?us-ascii?Q?kuQrCcqg4xXUZqyLJyk2NybZDUs39wVdia+XfLmbhcqHqNuRHONSVFjiWhi6?=
 =?us-ascii?Q?ddQ3VLMk/ici9MFoj+Tppkmlz2EGH9Wy3gQtgeTvTnQ5bxwCOsSluXWMAzHc?=
 =?us-ascii?Q?yRFo/u5zF2aZ+fbB7tf8RI8dY9zeiDOqzacKOUL2VIe+XKmtfD22uFS0+gwi?=
 =?us-ascii?Q?NLU5+upyr3K4azQbDPK5H8unkhdSav3OPT9pdBeQQZ25mxjAjwbatur/wdN8?=
 =?us-ascii?Q?00dyYl3p5Y2NN7SYduF3IF8kB11ojNxXpR+EgOkHTtzLgFoeePPA6FmPJma8?=
 =?us-ascii?Q?JZlWkfJ5XovADqENRqASlVgit/Axj6icMopcjJPYa9Aeq9kyjxyn6AeywPpu?=
 =?us-ascii?Q?3wVjbZyOF4w8YnmiwsdvsIJrTKSXrLq6feyQfm0m1TsbqZ3Nx62JkrK5MEJj?=
 =?us-ascii?Q?hGlbnev/5itpVwLeF25iKd+9c53Y9Be4ERlbmSvFO50qsBjdDnX3LrtET3R3?=
 =?us-ascii?Q?MJF9AJrDaj2lDZSteBXy5Zy+BrgaEOXkBKjWWM7cJYlgAZtB1EfOiaJ0NE17?=
 =?us-ascii?Q?MBgSAvKrynvhYI8CvKcnzplGJmmHjHpYk7ij84znCqp0a+o5B0ZZAxi9tm5P?=
 =?us-ascii?Q?7q1g8Fo0PJyDOUyPJOXSFXGZlGnR6lm36MPr/1b/2PRHHw7hBZGYUF8QAJxg?=
 =?us-ascii?Q?7KmzMFKraNKFVr6VHWd4IpCoUiHc/AJ4U1+avAvFLVtLDzWeuiHo?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51b15f31-f659-4987-082b-08df1a16f948
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 08:36:48.6703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oD6YPsu32+rPAIsOPCvIQXpb7V4kaoWsgRQW6GHHWLjkddqv5N5+oXjnAQORDWv0aKZYi61ytemBZDmZ+Pb1etziaR+k13Sp6fuJUpwspTJAZ+BU2zQ/u6EF0nPiLoyL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11339

From: Peng Fan <peng.fan@nxp.com>

Replace if/else blocks using regmap_set_bits()/regmap_clear_bits() with
the simpler regmap_assign_bits() calls in the cs35l45 codec and the
mediatek mt8188 ADDA and DMIC DAI drivers.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 sound/soc/codecs/cs35l45.c                  |  6 ++----
 sound/soc/mediatek/mt8188/mt8188-dai-adda.c |  5 +----
 sound/soc/mediatek/mt8188/mt8188-dai-dmic.c | 10 ++--------
 3 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index 0ab76824f00f1..9eef7c8b1837e 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -224,10 +224,8 @@ static int cs35l45_sync_en_put(struct snd_kcontrol *kcontrol,
 		return 0;
 	}
 
-	if ((bool)ucontrol->value.integer.value[0])
-		regmap_set_bits(cs35l45->regmap, CS35L45_BLOCK_ENABLES2, CS35L45_SYNC_EN_MASK);
-	else
-		regmap_clear_bits(cs35l45->regmap, CS35L45_BLOCK_ENABLES2, CS35L45_SYNC_EN_MASK);
+	regmap_assign_bits(cs35l45->regmap, CS35L45_BLOCK_ENABLES2, CS35L45_SYNC_EN_MASK,
+			   (bool)ucontrol->value.integer.value[0]);
 
 	cs35l45->sync_en = (bool)ucontrol->value.integer.value[0];
 
diff --git a/sound/soc/mediatek/mt8188/mt8188-dai-adda.c b/sound/soc/mediatek/mt8188/mt8188-dai-adda.c
index ac547fc864a6f..395f4ab972f81 100644
--- a/sound/soc/mediatek/mt8188/mt8188-dai-adda.c
+++ b/sound/soc/mediatek/mt8188/mt8188-dai-adda.c
@@ -123,10 +123,7 @@ static void mtk_adda_ul_mictype(struct mtk_base_afe *afe, bool dmic)
 	       UL_MODE_3P25M_CH2_CTL);
 
 	/* turn on dmic, ch1, ch2 */
-	if (dmic)
-		regmap_set_bits(afe->regmap, reg, val);
-	else
-		regmap_clear_bits(afe->regmap, reg, val);
+	regmap_assign_bits(afe->regmap, reg, val, dmic);
 }
 
 static int mtk_adda_ul_event(struct snd_soc_dapm_widget *w,
diff --git a/sound/soc/mediatek/mt8188/mt8188-dai-dmic.c b/sound/soc/mediatek/mt8188/mt8188-dai-dmic.c
index a9515d7fb70ac..7ac847a5925ca 100644
--- a/sound/soc/mediatek/mt8188/mt8188-dai-dmic.c
+++ b/sound/soc/mediatek/mt8188/mt8188-dai-dmic.c
@@ -143,10 +143,7 @@ static void mtk_dai_dmic_hw_gain_bypass(struct mtk_base_afe *afe,
 		return;
 	}
 
-	if (bypass)
-		regmap_set_bits(afe->regmap, reg->bypass, msk);
-	else
-		regmap_clear_bits(afe->regmap, reg->bypass, msk);
+	regmap_assign_bits(afe->regmap, reg->bypass, msk, bypass);
 }
 
 static void mtk_dai_dmic_hw_gain_on(struct mtk_base_afe *afe, unsigned int id,
@@ -157,10 +154,7 @@ static void mtk_dai_dmic_hw_gain_on(struct mtk_base_afe *afe, unsigned int id,
 	if (!reg)
 		return;
 
-	if (on)
-		regmap_set_bits(afe->regmap, reg->con0, DMIC_GAIN_CON0_GAIN_ON);
-	else
-		regmap_clear_bits(afe->regmap, reg->con0, DMIC_GAIN_CON0_GAIN_ON);
+	regmap_assign_bits(afe->regmap, reg->con0, DMIC_GAIN_CON0_GAIN_ON, on);
 }
 
 static const struct reg_sequence mtk_dai_dmic_iir_coeff_reg_defaults[] = {
-- 
2.50.1

