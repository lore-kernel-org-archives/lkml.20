Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013067.outbound.protection.outlook.com [40.107.159.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D734825B1;
	Mon, 21 Sep 2026 10:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987724; cv=fail; b=laK8CR9pxS7iVbcAkwW5FEk+ckBeohURo0TSSCI/JIC9X//JOwj7kux6b2X1kfpLSc+rI3w201P0UTw3gFleKNqS+42TP4JQHA8tAgGAF0r80G165pxNu1rjWe3PdY7f6h3+VIQN+QuJ8TfDV9m/wC0eCZoy1NuthA4fOxMMYYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987724; c=relaxed/simple;
	bh=ITfPrC10+OpaqY628PnqkzwlL9dvu8d6IwkPfdLRf+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h9Sktk4Vwfr6nB+JvSQGkxdWV3zi7hr+w2lzTKaRN8TQz6FuBE0nNfT5QfJTQhrgkyOt7vm2HrteE3J5R/6Hoc+rblM4EwBUBBdz7U6TZK1DwHx/q83LIgayIsJiAbjdY1FjFAkxRjK0MPkS1o+fvgfHleB0nhXYdtxUB/1O4/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iO0aqr77; arc=fail smtp.client-ip=40.107.159.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iO0aqr77"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jp+YdO38wuWDehwefKn2m/0mmjhRSkFf5eBr1kyT3lmHzyM/+0Uo89r3HJ1JZ+qnafsE2uqnbPv5wTcQbQKmCa8uM53Ax+M7ayTb7fEJYg86mbmIKY2XS13Pl0V/NB3XrPcSxdDRtjzksHwCQm9+FAlXDOhqnfIWTj34HBYawuI7agDHJC4rgL+nnJcMG1r3UMRbMwJKs/f6L/gnfHlZojPK38u5cza+3D81FavGDRpZRqHOZ8qCaxy7MshusZIwc6rP/NihSUt4Ob5V6pY+xT3LZmw7WrYGpgyUzAcjoYGFyLT46Zxn6kbK/LvwphcQSQFA3YWflymRAMYirAnPsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=owCd+tNvS6Dia/vzOGT5IVhPhXkY78CKcPE8jbkEjWI=;
 b=SXqOZOvabt+d4IQeD5kUor5Ij89Wc55rSd+ZtmResZHbezLUdL2eBusBdPld5Cdw5CGhy6nfu8HzpA2agn/koHAC9+Wwtjr/LzCx/z8ge9vHl5EbzswVu13N0dxShzq0/8eqUVnAVoBrkAf2Y16JgGBKMn5MGSA8FRBJ5wxT2C8aAOCttPRyURXE0soabYMKObtJlEtM8BGPmmc4vTOFtxfxaRel3c2kkSm5f+p0nHdhn/h5K6lDM4cwhYiligwj4V+PnFg2aPPuk2hR+LAcE7zfdluo74HGtNMp9rhFY2rj8+c9op+/PZkBEx8pjTJ1Vcap54V0apZruxROJ0gDBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=owCd+tNvS6Dia/vzOGT5IVhPhXkY78CKcPE8jbkEjWI=;
 b=iO0aqr770bQ9n4I7Tdnql+8tHrr0CXM1bFK5pt+M0IfaK0uEIpkjCpZDk9aDYolLX1WEmexN2kx96NLYg4maQL+1EUhh0Vh60xsB08qqiENZqYjOGXJWKc44Eo930pzOpaDyL8wicLppby82xHoWQNW3iwWclGfggPtNUaowvAjbR6kBKIK8dmpgMR6RG5jvfEt3NhPQrDleOua4m30HWY/7pAf+PhECm8OeAOXUCiqOZOTO5LtY8BiwwVIx70yR5yJFdZuYB6q8gfOOoiOCQgiQdVFtAUD76zcHwFClbtugLJthYlqcynDV0HhoojMbPiJ4DiHw7RXIU9kWszHjdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VI1PR04MB6862.eurprd04.prod.outlook.com
 (2603:10a6:803:130::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 10:48:39 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 10:48:38 +0000
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
Subject: [PATCH 15/21] ASoC: wm8985: Move regulator acquisition to the bus probe
Date: Mon, 21 Sep 2026 19:46:34 +0900
Message-ID: <20260921104640.1941554-16-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
References: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0013.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b4::14) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VI1PR04MB6862:EE_
X-MS-Office365-Filtering-Correlation-Id: c18ff782-3036-4eab-b05e-08df17cde4f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|19092799006|366016|1800799024|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	to875cFAaNDr7Va5e4GWKrKOVHwejhxCvRVYWSSB5Ckvhyi6DGymlTXLmUPvIexZcrBrX3uNl4n9danva+w5ly5b3Yf4AzjX4P7i4WFkyzGxblyPjfCfxAwnZR3AVSMYWRXylDyX4orSgPqx6mpq2GSSlvlh2qx7hC9hvTY1GmRyxRdh2LyohEHUQ4UUZU8Ac9WbnIfpPS6vUV+38zUJX9twUELdgmE6nAfewPFSetvbLXxnKfZeNtylPNS+Cv8kPzZLZp6V1KntctOGWLLzCMjHc3Zx9/y3QGcX02v8dFGzTSb5d8G+Zh6u0SpnE+58cqQYE3Dyhwd8zImpAboHfGkavXKxILzMLOzRxSkdpLaDH7xuHbCQSVS6dI7TKNoIwOd3jpDruxFRFJvHm8mR0bonhpOI+ju8R4Qw36eSPOuJp1+KwSteLplj9nBFcsh+Q+obkuy14McoFvYCZnDU+1VyU/OPHaB9bk9ZHFP+6JVQiVF8NRlFqmfJGIxdSfVy7dNShxBTo2R2AGV8yB88lPn933YxJhfow9FTPrkFz39Prwl45a1QMNko2qzWgSiylML+t3FKANVD9yRw371g2ty3OH4Lp+ZAyb+Kny1o3OhlKTOp11hbRMltMcgKomWNPu/U1ahTyhlzLk2ed0tgpHRkxIDjg1BSWkzZNtE2+Zc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(19092799006)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QqL+Vm1c95RZRGJUQE/BuhJ864xX45EvNVBWkdJZ0jYCz/oFdBaeBv8o9RJf?=
 =?us-ascii?Q?VyBJJiB9EKut2CVAn93XW38Db0GQGa+1Ig1N3Sn8YRcTYLJbXEv3AjIFeO4H?=
 =?us-ascii?Q?J5dvHXbntaRFEppltGAuj92NpGCBbZNkMhPmwcfbQGIegDmfKkKOmM9m6A8B?=
 =?us-ascii?Q?wdJR0WbkrgD2IrxWVe5DGusTsjvwUy/9AtaGqlMLySm2MOmUysa5mTLQrML7?=
 =?us-ascii?Q?vgn4cpPFfZgxVL7w03jsvl+TLzAL1tqvvLs4Eh3D53TGTSpzzxyAAgMeglBq?=
 =?us-ascii?Q?Djoekp+cXRF4G5C354KJusYahze21Luxq13UcCrL6Gunp5Zu5qqiPYCW60OK?=
 =?us-ascii?Q?dBTS/nRpABE58nDOXcPR2cS1rBBvHaG+O2nByezqhfD9Tx8bCnpc5EJjJ351?=
 =?us-ascii?Q?a0gEm/22Ot3jne9DUb3FS7R3k+n3derKUOqTG8cKl13oXvHBYYtYef3fr3UX?=
 =?us-ascii?Q?CFdwxWd9dVi03ma0lIz3g4RX3i6wDUu2uuG9XkJDo879jNhBL2+rvKGE3EJc?=
 =?us-ascii?Q?N8wPTAeljsuL7gs5GYQiH4CEhIXhWBxueZ1Ke4UdQo8k/y/Ina13cZ2tDYEx?=
 =?us-ascii?Q?zdqi4LYczs5zcUw3HBFyFu7EY+XHpoJpOBhF4mv3RhJD5J7prbwsP6TmXamn?=
 =?us-ascii?Q?QGNdNeNmQxxp4741AAgMt2xF0uGZdQz4+rnRut5GGJbWMyknMufmjq20c16y?=
 =?us-ascii?Q?X/v2zww0+gp1Mrs23K5D4Nv2Wj4iV3PVvuZGkOZQ16lCYVBshJq2Jv3z7dwh?=
 =?us-ascii?Q?/pgF2r04L+qAjcZiIgeUDaMmVNaUuycPxZH8clJtn7XUQSgXkzqTIiGheP/n?=
 =?us-ascii?Q?at1yUdXJu5kkLwD5tdNv8qZuxM6UoM6rrTYtR4lbGVn7byy0UKbJGu7zZ0zM?=
 =?us-ascii?Q?aDQxiNhW7xATS2RDDwHWZMMsnirv8K5WBgTEXp+0htrgZ6j1vr73Dpc+vL5m?=
 =?us-ascii?Q?4KCHl7RHFS/Ny2lqo8yXdGEwHXuuAZFncpnytaYNNo8E7KiRlOP43xKXX6C0?=
 =?us-ascii?Q?DHyzH0f5IRFFXK+2SdqtNPzAnPX9G93RRBY5BzX9ahvRQxvsWYqc3d+E0Cn8?=
 =?us-ascii?Q?+9VhZLutMkgdQv2ptojiMIVILYwP/M+U8tTdL80LFn+CiRzuL67auesz/c/p?=
 =?us-ascii?Q?RQJAOYto/qBrCWYQ27T6o8Q3Qu5Iz0ItHsVhRz1vqurMy59a4Xp2qY84NvV0?=
 =?us-ascii?Q?GlU4zH2LUsKLhobz9z4nPV6Lo0mPncDoCxCJ51RSLY6imM9rc9yN3ExZgTvb?=
 =?us-ascii?Q?00U3VhuyrVruEyE87y0P6ZZ5/1I0X7Z0PwD7aijKeqqj7WG8E330Itcj1C9l?=
 =?us-ascii?Q?ETVZy/wRjzmm8XM66M4m4Praf6TudYeAW0syJq2MNZq8DY/H2E9Dv+P25gXh?=
 =?us-ascii?Q?iz0sMz4BMrfXqAXcp5CKOoDt1yRUYfF7U7IIH0IkkHfDHr3oBiE8B1n22gR7?=
 =?us-ascii?Q?BAB7St6eyIhnm5Mo3VrUdGVvXrKANxhI84c1X4EzGw+ysnEgQRAXbsR+RyQ8?=
 =?us-ascii?Q?LneDygnrPKnmPLD1ByLBN9lM0Q5gY8zZ4kar7sjBfVFYjNHU5Z2aQFGzuEfy?=
 =?us-ascii?Q?1D5Om3FPyXNS0GARlQjctZweJ+FCtUfY2QI+58GB6zFerbM5976O50+JUF5e?=
 =?us-ascii?Q?boO9pkTr3x3tH66nrZ2CXRFDwK81b2v7GV/02LoyF+N9VjtGFeCXASYOochs?=
 =?us-ascii?Q?7pKCYdRaJbcjqfVj+uHAv1gf8VZhArq9dfsa9Oxbew8PKO6NK+RzlJqhESa+?=
 =?us-ascii?Q?t7YTJ2wBZH04JfHIf6T3lqRBTRZnFVIndvMe0p2JT3f7/NWrPsfG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c18ff782-3036-4eab-b05e-08df17cde4f3
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 10:48:38.8730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AyeHWkllvXAokUPUZq3x2Z66B9bncuo+1xODlAcSdmB8omxH415Prz0ZJJinImTGjOTb9q5tJefFRgkJ1xgUai1e79SYl0qEQLLAmUxq7f/xILibP6zGkLhaHvYQ/Oia
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6862

From: Chancel Liu <chancel.liu@nxp.com>

component->dev is the underlying i2c/spi device whose devres is only
released on physical device removal, not on ASoC card unbind.  Getting
the regulator supplies with devm_regulator_bulk_get(component->dev, ...)
in the component probe therefore leaks the regulator references on every
card bind/unbind cycle.

Move the devm_regulator_bulk_get() into a helper called from the i2c and
spi probes so the supplies are tied to the physical device lifetime.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/wm8985.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/wm8985.c b/sound/soc/codecs/wm8985.c
index 877a691c188b..70d0b8667b90 100644
--- a/sound/soc/codecs/wm8985.c
+++ b/sound/soc/codecs/wm8985.c
@@ -1029,6 +1029,18 @@ static int wm8985_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static int wm8985_get_regulators(struct device *dev,
+				 struct wm8985_priv *wm8985)
+{
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(wm8985->supplies); i++)
+		wm8985->supplies[i].supply = wm8985_supply_names[i];
+
+	return devm_regulator_bulk_get(dev, ARRAY_SIZE(wm8985->supplies),
+				       wm8985->supplies);
+}
+
 static int wm8985_probe(struct snd_soc_component *component)
 {
 	size_t i;
@@ -1037,16 +1049,6 @@ static int wm8985_probe(struct snd_soc_component *component)
 
 	wm8985 = snd_soc_component_get_drvdata(component);
 
-	for (i = 0; i < ARRAY_SIZE(wm8985->supplies); i++)
-		wm8985->supplies[i].supply = wm8985_supply_names[i];
-
-	ret = devm_regulator_bulk_get(component->dev, ARRAY_SIZE(wm8985->supplies),
-				 wm8985->supplies);
-	if (ret) {
-		dev_err(component->dev, "Failed to request supplies: %d\n", ret);
-		return ret;
-	}
-
 	ret = regulator_bulk_enable(ARRAY_SIZE(wm8985->supplies),
 				    wm8985->supplies);
 	if (ret) {
@@ -1176,6 +1178,12 @@ static int wm8985_spi_probe(struct spi_device *spi)
 		return ret;
 	}
 
+	ret = wm8985_get_regulators(&spi->dev, wm8985);
+	if (ret) {
+		dev_err(&spi->dev, "Failed to request supplies: %d\n", ret);
+		return ret;
+	}
+
 	ret = devm_snd_soc_register_component(&spi->dev,
 				     &soc_component_dev_wm8985, &wm8985_dai, 1);
 	return ret;
@@ -1212,6 +1220,12 @@ static int wm8985_i2c_probe(struct i2c_client *i2c)
 		return ret;
 	}
 
+	ret = wm8985_get_regulators(&i2c->dev, wm8985);
+	if (ret) {
+		dev_err(&i2c->dev, "Failed to request supplies: %d\n", ret);
+		return ret;
+	}
+
 	ret = devm_snd_soc_register_component(&i2c->dev,
 				     &soc_component_dev_wm8985, &wm8985_dai, 1);
 	return ret;
-- 
2.50.1

