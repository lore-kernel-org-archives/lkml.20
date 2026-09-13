Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013031.outbound.protection.outlook.com [52.101.83.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDEC390CA2;
	Sun, 13 Sep 2026 10:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789294558; cv=fail; b=VLyT+fwBtrFPz+XUfVDKjrRRTHSJFxi90U0Pw+nT0ahteop17w9i4OY4ie7quoncLTCnkWwZahJ+jVSekrVVCUiTGHFe1ncIh8HEEZLXLLC9jnVkdCSt2YXT0bhLpQNFe9xAHA2H2yizjNCiRTcL3jJuXsusVY9JBw9UJ3a7H1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789294558; c=relaxed/simple;
	bh=G6opOaakQxgdOPuMUB1d8Pt62FPuOLCsaB6UfsjVbXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HMGpW+0GK0lEwPrzTa6iBTC8dTePf7O9BSM34BTHGidqGjHNRp/sVvjzEJ7mXtw8wMuEzy5NBEeA/v+/LvCIymZwMnvfup/IPQlzACzB9wYjBMP4QFxWEz0xB3+P0QSumO2UQW1i6mOIrcQBjLTvoVJxurj5tB9qa8c2oM9H1Kc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jqEY3C3t; arc=fail smtp.client-ip=52.101.83.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jqEY3C3t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=keo8a74q6M/bebSihtW/TKCrh2k0fnZz/QgZCstm2lLj5ilQWlLdAV52IuJE0rpT5brV2mI3vViZfIi319/CvFnbuoGpq1NeEzMZW7R7CBrBYIWDAvHLljztluahx3wj9fSsKnp1+/fZTbT2Kd2TJlRTgpHmE+JQrwlVASqzlkG8gzLM39DHMPLBLuZXcoVEggH5C7zcIEP6JRqmY0kZyjjpHaj1ZQnq5buNtzBlHzFpdoLF9Miw8nKVe+Q8i1fO8+1UIP5LxxWtS60F6Pp+I6MoZ6K2cFeiqgJ4jBDyVUcsCRmjMkdB0ENKiO45qxVYi3mmKaCjlTD9DoT1LDNvXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MsmUy3lRONu0jdSerhnMkYynqjgKM0DSgb4hDlowHxE=;
 b=U7VMCqq5hB9T/wZXV3FvQlGYORdH0XtrH9DlO4dUnfwh1f6yLXNv/mizXjaOsfQmLhjfMVoFvU3nvSEMoQaMZUuLiLVVHQeAfPs8++hYbcWpxuIlqobbyBYWJtKUR6QuVDoglO8lG7OZAgarb8QkI5hMH/RZ1/CD8MUHFAtoEM5JGF49xrbH2bOiCqZFfNX1DU+P1Aychk06+OSfOG8h1uGpMoVnO9Ftp3JPWSCigqSu5jhd1JGgz16tOovN+RtuhGUmuCNVuLcuiVm2g8CKe44Nt1L6Oo/r4c/1fcrZF/Op6VOuSCA3xqIiPCZKDpPMyJULPaD6+dALEq6FtYmbnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MsmUy3lRONu0jdSerhnMkYynqjgKM0DSgb4hDlowHxE=;
 b=jqEY3C3tMukOc8V66PYvBCtjbfdzdCzTA7y6tEcmbGOczTkHjoe0Lq6WwL6aXeCTDn5zYZZ5wq+59ujSqEAjIxJWmNn1+oHT6HlL6OcJ3GzXFIZx5e55oBrzgJq2MkwxcB/pv/B1KDLzJk5FS6bfaxIucGHAELyUK4OaiYZD6QMQoMvS1Ana5irUY4w9Odio/1GTsm3gUxMwpvN4C2IYeRLlSxov8BPwaXjuOh1zcUeVCa9/5QjlBV/0pYYa48ktVNfHjbMMajl+TJLBCmG+Y6XK9jVOsRr+7mYIFIQl7c6V4mWMU1K3qRw+IMeNfk/v7vIo1z6+MF3uevlp0/SL1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM9PR04MB8602.eurprd04.prod.outlook.com
 (2603:10a6:20b:439::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Sun, 13 Sep
 2026 10:15:51 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0406.007; Sun, 13 Sep 2026
 10:15:51 +0000
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
Subject: [PATCH 2/6] ASoC: wm8995: Register regulator notifiers from the bus probe
Date: Sun, 13 Sep 2026 19:15:27 +0900
Message-ID: <20260913101531.2787654-3-chancel.liu@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 501bf435-6680-484a-7e79-08df117ffd35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|19092799006|23010399003|22082099003|18002099003|921020|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	AI6POrSjk9dyyXmtmN/XMkCzOyxn2bcRuF4Mh0rNSTDe7U+uSwqBWnAd0SsI5CAp/3REz0KaOxnd/IdxRm2vLPhrznU0MMia37LfuSNNasixn6bvcrdhb3QuNzlAW+IHHXLPz9cpVpiJUKBLeCgmAisK9gfEghkwKWK2edZCvnEynxpaVCnNGB5iYkrz3ZafLUDP9yPctSpJ4IpJtONQ1CZL3qTyWAYq8U74w2sUCiusCHIu6hxMaWEqi3xRq80cWK5a2U4SPJFW37zirhkDf9tIU2JLV8YviJPZ0UWv1wUbfHxPoZQUvEpSsiCcILKvAnvkNehVxD6niHfu0TL2e7FBIwjepkV3W+d7KxWiKS6VcocsrPXWRmAKL8T+qe6adFr7G4iZFVLIZ+Z2itx9PxBPNaaoaROAUeX4A9Nf0i8E1t+tHbG7/M7EMehEt+5V6KtoIC/pEjVTjUwAjwly63I7FuE2SuTjKEduwp6301PzQpIcEBT2P3A1NPp56ikWcPHTng/o3BBQKqi0iqaiB83DAvh2zY5sEnTw0biwjp2H+pz1I9uLt1IjHQNZohM/wvcJArYW9wi5MMsXeVpWAUTirW2U48+7TLMZL5+/NdxZG3WGSRI1BYeEcBgsDkPJYnUdhHh+XPVkg/CP1aVYASM6zE3X6DhkrE/Cnh9naxpAINKCAHQjbN3XkNtxjH5fBInNNLuySIYxziGjAWB35A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(23010399003)(22082099003)(18002099003)(921020)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ojHAVg8Azv0fS3yZZMe8fZKg+OqLvTdvhm8z6XaUVpCKrCygegWujLXRwHi/?=
 =?us-ascii?Q?VdaYelWhGH1ReieLh0f9gNZJKb+4a6GF3ArBtPhcxFHissbZeaPYd6gJw9uu?=
 =?us-ascii?Q?8AyuAfpvXOXt0LiNbUTAxNMvpWuYmRbMU8dBANktAUcftoS0vBkSjCWhWIco?=
 =?us-ascii?Q?kXpyTDkyR6LrypF++9xWfeAnV4t6P/b6lEqQLrmzRKXNh/U3yDQSEUvGIP0r?=
 =?us-ascii?Q?pOVJHdjLSxGbafFXBk49HDxdXi+p7ep8Fj4YiSZL864S/chdkA8J15OlhYun?=
 =?us-ascii?Q?f46elBI4zUVp2VUjMCbwnSAmlWfz1lBPBuIhi5wunsF8YWf17to8ZzwwYhUw?=
 =?us-ascii?Q?pDnqjbWeQ6Bvuj05f+PY8mhJBInaPdxATB+Zz+Pb8HRSzsxWNMFEBUvvYLCt?=
 =?us-ascii?Q?3riuOStnFRXACcwFh+NOdlEbqvLg2wK5RiMc/fRZh6bW5RuhhQA7//Qsmw5Q?=
 =?us-ascii?Q?PVFkwo77U7S3EHZglD9TejiYJ3UxcQ2hHy9bTLPER6rOG3iqR8LH6bcVT4/r?=
 =?us-ascii?Q?QIeI8Kb97MSIhTc8hj50Qj12kgIH2SlC7h64hzoHeg+V9+KY5uyAKosNUqDm?=
 =?us-ascii?Q?WHxQuAfHzgvsl/L1LP15YupXyMSjja2QKQggK7+aOtDWyHo7O+AwWyrSku++?=
 =?us-ascii?Q?kkUphePsknD+Qy5eXWiRwiLh3fnQHS+GLgkAPkd5TOaIZI1OoQbRbUdzbRrz?=
 =?us-ascii?Q?g64EYAwntnzXr4Bzu3VHE1ZeYp/YVCRS28tLh65+1OtFMHA1ohJlqjcEiRUz?=
 =?us-ascii?Q?/yc543d9b5+TG26WQZ45GElXk/e9+v986T5kBzPn6Q2y4eh1s3H0rjnj4YDG?=
 =?us-ascii?Q?MKh1h/1BUj+F+ID9+TSKHJFV3ziZVZoJ2V/46zdkIniMQ/2GrfynvB7thfKE?=
 =?us-ascii?Q?aev9Ie51t9/8xbpcZj7+iJ5ilXuYt8qkr8L2qAHQAKqVtoa/IEsykRQSouG+?=
 =?us-ascii?Q?Tpoy3GvAqUZji2l8+ClKiWkuaWMFMmr8XdU9mxeeBB2Etd0d0eJb7AfO0zeU?=
 =?us-ascii?Q?sWNm6bUF1qfxAFGUSL62QuFVdasw4vl6SThAiSU1LcmUQwhkL6C+3pW+a80o?=
 =?us-ascii?Q?cG7nQ+9Iz4Rzw2jMxyNsoXK0ZDMJDkvawf4hEwLm+klS0iuzxcK6hQEZn9FU?=
 =?us-ascii?Q?0iciSBN1fh/jzBSDpw+fOxT/eBLKFKMgnzyJ6y5XNoVQeEdAeKMl90/Vs6PJ?=
 =?us-ascii?Q?9qFZqAyeFPh7kZQubl0WzThYTJAxkbL698JH5/EgxEaC6QWcPz9/I2Km3zpJ?=
 =?us-ascii?Q?fatVVpNMixgmG2phEGE14VB6QgE09AqJKQFi8r+HVRrSvCsC/cNYgmZzxod/?=
 =?us-ascii?Q?VeQv37MgvA/QWQXJhW4neQ8lDtq7xCPNoKl+wyAm92vyAuq/+bdZhWcsHZPd?=
 =?us-ascii?Q?C8gFnnm0HcUbBt1IhT/aKFW4ldXi1vUqtIlWby+EvG+iqDTFS37l6ApEyJnR?=
 =?us-ascii?Q?ZFkCBpCkyUqyN2yfIR+bSRcy7TUJ1m1dYdmO/UF3kVpGkIHsjwT5bsB5+mtx?=
 =?us-ascii?Q?gQtpi87tKzP4sunP+XqFY5CF+TUa2lRZ9tWC1Ej5kuRBqlyJHSA5fLbue8JT?=
 =?us-ascii?Q?Kzsqcmnpw3ZHMgW+kh0UGMOY3ETf8kGKPMfo1lgsRPPEbXBXP89FSvFjLI8U?=
 =?us-ascii?Q?DOYhvHWLyFiGVcD9bPp4HQMp0OlwWpyFxNZwBSF64b4vhnNeopGFgajazwNR?=
 =?us-ascii?Q?RHRChwpdQmyreLwle8y3j0qvZ0Kr5PpAexzl+obx3xoTWlxnv5P4Oy4gMHMm?=
 =?us-ascii?Q?DXrfKUkFS254WlsyHOQ7A/OyeFyi0ew5M19/T4synDvPlx2JSk9c?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 501bf435-6680-484a-7e79-08df117ffd35
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2026 10:15:51.8587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iy7a2JLgkrU80QFTvVnQy4fmNI4iRqzdJn+2RRfZhOlaPIwqeVmRUDIAZVeMf+ilnbcNd8MoFNn2Olfi6wjPHDqw0kRsNXVGV+pwwiFKkfvH1WlzVYJyHJ3kA0m6Omjp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8602

From: Chancel Liu <chancel.liu@nxp.com>

wm8995 requests its regulator supplies and registers the regulator
disable notifiers from the ASoC component probe, but the associated
devres cleanup is tied to the underlying I2C/SPI device.

These resources are only mishandled when the sound card is unregistered
and re-registered while the bus device stays bound. On that path the
component probe runs again and re-registers the same notifier_block on
the still-registered regulator notifier chain and corrupts the chain.

Move the supply request and notifier registration into a helper,
wm8995_hw_init(), and call it from wm8995_i2c_probe() and
wm8995_spi_probe() so they run once per bus device bind. The regulator
enable and the register accesses that need the component stay in
wm8995_probe().

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/wm8995.c | 41 ++++++++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/wm8995.c b/sound/soc/codecs/wm8995.c
index 799989a5bf0f..35cbd0fb7f1a 100644
--- a/sound/soc/codecs/wm8995.c
+++ b/sound/soc/codecs/wm8995.c
@@ -1993,23 +1993,17 @@ static int wm8995_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
-static int wm8995_probe(struct snd_soc_component *component)
+static int wm8995_hw_init(struct device *dev, struct wm8995_priv *wm8995)
 {
-	struct wm8995_priv *wm8995;
-	int i;
-	int ret;
-
-	wm8995 = snd_soc_component_get_drvdata(component);
-	wm8995->component = component;
+	int i, ret;
 
 	for (i = 0; i < ARRAY_SIZE(wm8995->supplies); i++)
 		wm8995->supplies[i].supply = wm8995_supply_names[i];
 
-	ret = devm_regulator_bulk_get(component->dev,
-				      ARRAY_SIZE(wm8995->supplies),
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(wm8995->supplies),
 				      wm8995->supplies);
 	if (ret) {
-		dev_err(component->dev, "Failed to request supplies: %d\n", ret);
+		dev_err(dev, "Failed to request supplies: %d\n", ret);
 		return ret;
 	}
 
@@ -2024,16 +2018,27 @@ static int wm8995_probe(struct snd_soc_component *component)
 
 	/* This should really be moved into the regulator core */
 	for (i = 0; i < ARRAY_SIZE(wm8995->supplies); i++) {
-		ret = devm_regulator_register_notifier(
-						wm8995->supplies[i].consumer,
-						&wm8995->disable_nb[i]);
+		ret = devm_regulator_register_notifier(wm8995->supplies[i].consumer,
+						       &wm8995->disable_nb[i]);
 		if (ret) {
-			dev_err(component->dev,
+			dev_err(dev,
 				"Failed to register regulator notifier: %d\n",
 				ret);
+			return ret;
 		}
 	}
 
+	return 0;
+}
+
+static int wm8995_probe(struct snd_soc_component *component)
+{
+	struct wm8995_priv *wm8995;
+	int ret;
+
+	wm8995 = snd_soc_component_get_drvdata(component);
+	wm8995->component = component;
+
 	ret = regulator_bulk_enable(ARRAY_SIZE(wm8995->supplies),
 				    wm8995->supplies);
 	if (ret) {
@@ -2216,6 +2221,10 @@ static int wm8995_spi_probe(struct spi_device *spi)
 		return ret;
 	}
 
+	ret = wm8995_hw_init(&spi->dev, wm8995);
+	if (ret)
+		return ret;
+
 	ret = devm_snd_soc_register_component(&spi->dev,
 				     &soc_component_dev_wm8995, wm8995_dai,
 				     ARRAY_SIZE(wm8995_dai));
@@ -2249,6 +2258,10 @@ static int wm8995_i2c_probe(struct i2c_client *i2c)
 		return ret;
 	}
 
+	ret = wm8995_hw_init(&i2c->dev, wm8995);
+	if (ret)
+		return ret;
+
 	ret = devm_snd_soc_register_component(&i2c->dev,
 				     &soc_component_dev_wm8995, wm8995_dai,
 				     ARRAY_SIZE(wm8995_dai));
-- 
2.50.1

