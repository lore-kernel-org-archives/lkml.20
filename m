Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011065.outbound.protection.outlook.com [40.107.130.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43D4232395;
	Sun, 13 Sep 2026 10:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789294563; cv=fail; b=s6qU/p5fZm32b7sVqEbmY1nhBCnQiTUFf2QeYie50rdzTi9WuULhHtHZrzDR+RdbWSQRcU8C9txzgiesRoz7LifnNv1GBb8z8A4HsOxvaF0LZ8op/gdioGHlI4TOa6KycU1Sp5fXokKTEWOphWdOHi9x9SkfoCD04QAqBG9kLK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789294563; c=relaxed/simple;
	bh=SQmhS0zP4C6/CSHvydIE44EVHIZFlXt0Dyh2IUpmN10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vs0w4cavyUJJUCPcuIPiCZaUi/Lg+SsFVxhc4ohlnYpxhJEWEquNl43fxjSytdJ11/skY/PoNa3yNDy619Y36czj/Ecf+zTZpKH39Zd3iBWVUkvifBbJZG3mgNh+UmIGr0+N2whb19f3qbMVX/HlJhKptfhzJwLc14Pvk2vjt6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LAxl7GYk; arc=fail smtp.client-ip=40.107.130.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LAxl7GYk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cn9aIXVXmVId9MTSI4zFaCYlAGgXGhqfJapVA5+N3PXgiRkn3efV8/zFFDh7wRe31CwDUGwpmC5nicF0lq2tTrkz/Eud6U+aWij2rImQMOK99vYg62seuaN3Ke6Q9G3XH3QjEC0ciuNkKQjkysaLKbXYROOine9eLMMwYwFKDF8PGL2TIxXdM+GkZoozbHEvMElWZ/5cKI6Q70xgBrtb4Vaw+sECvJd8G2OPSEPk6Yb68WHBJADy39RdGVDRm2Kj+B8v/LGK9xaNcusDSgm/iC/44lkRFQ+uFr1QGEViIT3/Nixz374FPOjXTlWtD7rrv/iADJBroEHHmojDTVufPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cq7FDgyoeulVoI6YcV4M2PsJ7Ev0kciD0n2Uw4aDiXs=;
 b=WhtH/KX4TPNLKY+dGVmtOv5IjDzp3Uey2NbgNgjrv6AyVYoGK9t9bYa+oVjpWwpkqscLnkTxD/9slqycxSJaF3kwSBp1dqa7Wm3enu0PSFolMK8unPxZ9en+4fumdscbddd5msONFp8QyxgsCsEQ2gJOxcMRFwayGpu3tb0hWyPucAc2Beu+6VKUs4OBlOZDMUpKlWuXLfVUP4rAn1/JW6duSknBwdGYWoiA7Hdq98Pevp1hVpq70iRaGeBYGfGLh0nk3YrRHfvO5nJtzZYeoeRL5QNbRBu4WQeGLKJF8n02AzyQo24IhLEWJxOYyYc1JWDd2n7sFNu/4kPAhurj4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cq7FDgyoeulVoI6YcV4M2PsJ7Ev0kciD0n2Uw4aDiXs=;
 b=LAxl7GYk4q+AOagcCm1Xvz/wuCCfdjN+ZxyZ962s6xEKRFIes/3NZYSDgFQ6AtXiWmYJrDT6viLDVnZhKnhjKlxJAnAev60nrTgzoyqBCTY4gxMY3jv3dcVjED/EXsQXgEn7Dt25kvQV/WV1eiLeY/7U0l1vIRqw0ABTAA7SbQmUHUbFSmwJx4F1hp47FNkbTBCeMnRCxK/AxTSmxLKQrYDFAWhoIGRsbF6z77SxwuzTIjH6gMpuWcngnEwNIwBdASSwrMnoZGtiODG5t1c6fMVQFYGQ7gckbRXpeKcirtyBeVfqBsmXDtxjDuljghLRZx8T+1N+u9a9RPpoXmGfYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM9PR04MB8602.eurprd04.prod.outlook.com
 (2603:10a6:20b:439::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Sun, 13 Sep
 2026 10:15:58 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0406.007; Sun, 13 Sep 2026
 10:15:58 +0000
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
Subject: [PATCH 3/6] ASoC: tlv320aic31xx: Register regulator notifier from the I2C probe
Date: Sun, 13 Sep 2026 19:15:28 +0900
Message-ID: <20260913101531.2787654-4-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260913101531.2787654-1-chancel.liu@oss.nxp.com>
References: <20260913101531.2787654-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0002.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b4::7) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM9PR04MB8602:EE_
X-MS-Office365-Filtering-Correlation-Id: 23e0a703-d4ff-436e-e7b4-08df11800125
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|19092799006|23010399003|22082099003|18002099003|921020|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	dG2KotGBOKQ81mQbMVhYjGF/mzLJ8xT0t/T6yXDAe5llXIZ1y0TCQh3o3stou9CD3iI5wFndSoq286OEyrexvPQUV85FlHuoajtMaUewBLn9fcOyIQA1Qid+0oNxZjfXm7eC8AU7oHy8hK/LY8UGy0sHqCDuGtKu1O1h6qBGmXEsL9nmLk+8vyhZ78/z2agNeNQc38c0YjdAS7hIunLzF5eqZhsTuwYB109AsA4haGYm8a3cHvWRYk/6KuxYoCqDn1puknxYBbP86hyj0fsvW5392KDWr6r+2wTkKH9yI1Xu2oOFFrBh1xbUGdtMIypv0PIaQC4yOch0k4FDYVjWS4KMWkRewjWooQ5S9B8afXQBEdHNvVbiG6qlIAV7rwfgjjGeq6QBblrO75xlseIAmLQPL2VXpwPFUvxl7AE5cvCB8WCmoVUKX++tTVjK+QDe2BIwIsW9qO/IOP5ri23nWgSV/6+0m6m6qZ7P14oUGOvInmYtDN+6CJh/wd7ektE83sIQ54qKFQRmUSOdvcCxYMtEAEfxYUITT09ykXqqF+bU9HN1vkPh488PF7Pwt9cX6gUwXuzKiWzWdK/hLJuUHirg/qQV8AhBF/n/FIel2+XvrhpU10NePeBaTTh3AIFJJJZ++TXUsPhoU3nnOHNkNdfSmjEIC6blxA1A4lT9LW02qUkPbLyrs4foAYIr+EqxjeoFA0VOgk7Zv6aCYlz+yA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(23010399003)(22082099003)(18002099003)(921020)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aKSH1VTtYfbKeEFwAQky0B0fNG43p0QbRiK1tslu8UXiZ9eBrE+Bc6PeRkVH?=
 =?us-ascii?Q?a+Wz9tv7/jyK57PaOr0cGzfEoqExGyC/aht4gfzZlh6H5PIt5oPDrvXu0OSz?=
 =?us-ascii?Q?Jv/HaN4gMaFhM5oIbFLQFR2JpLkxIR7trkiQ692FIIU6GC2JTeHkR27d2CbO?=
 =?us-ascii?Q?dtZt1kjwa96D/5zhYzLhrO92kN/q3gEi3ylgOCtHDIm6FcUAASGTqGCZPfFn?=
 =?us-ascii?Q?qUlQss6zzRkukACUKjb33t0379K7iLorIIGu71s0i8Sr2JRrNCt3h8jkBbYk?=
 =?us-ascii?Q?k8mh1S/W270vbu2NQ7bSjdqf6UKOH01DZjqGcCQD/dSdlbgAm8JqNY8WOois?=
 =?us-ascii?Q?Y5Z+8pLNzL66/AXcmX5VgfTWrS2otivvbCwlNLsx23K2tfPbyiJbfyb6oy87?=
 =?us-ascii?Q?5pFypKt0545pv5XA+drsvGrQT7kSzkTaU6fcxK6oXzQbSk9g8WqpUxPyMUvL?=
 =?us-ascii?Q?/q1c3lR0i2JQAblTMOLzPpiaOclOgXSS0c1hMP4Ayxmb+v3r3nzzEfGrayLo?=
 =?us-ascii?Q?nkX5lzfyOXulSwl9hEXiqjYmQzM0mOtM2c+juv21rS1dOtEPFFRneaUyYgaK?=
 =?us-ascii?Q?W+xH4MO1ahBPkVpAlEmZ8GoQNOYgrYVH00wXulWPLfMxqjfwr0sm0cZyUaO9?=
 =?us-ascii?Q?t/2tWZS8MTs+RG5HqhR8i3iNRZghqRe8L0ztpZOizNHazxziuftOpMggmE6C?=
 =?us-ascii?Q?dGyFdywC5CkZO1kcQV5/jJlPggsX8hbjM8k4JUN9J545XBe7zhXR43Vh7Uo6?=
 =?us-ascii?Q?SxMdAHbvPyJxLu6+CsLox//NhtGStbLx9va42tvdKdX3q20F6PMUqMDWolTQ?=
 =?us-ascii?Q?L6a5hhkDau5eKacB1RQk8hqbKbtdTLCsYEcLpflQyLKhAuPWFhLO2iO4yxD1?=
 =?us-ascii?Q?xj0OOuYqaAGdg9QjgADBA+qbyPQUySpcL8nkz69h032I00e0mDVs1EaBQcpX?=
 =?us-ascii?Q?sb8Dbe7g4oA4ziOjUmywWCzPRESdt9H9IY8HHzltcFDdjCnDcslrED9FPCyT?=
 =?us-ascii?Q?EdYeeISqlaXwXvlotCdplSR2fD1MudAjaUnVfv66sbEcFJrjTNELMr1+BQ1a?=
 =?us-ascii?Q?tonElm2tj8CzoiPSwnBouHhgXqkCe8us1tI7pase1vNJfVruSRF/GNosbr5W?=
 =?us-ascii?Q?Wa18dmePJEeGzTjBaI77hrlSLWlZCmRcBZpXQTKIDuGtd5thg6sAPNO6g/gr?=
 =?us-ascii?Q?0bUiLRHum0CzvqLn7Cd4sFRAzTU7ME//WIZ5OClc8QfduGo8cOwqyg1NOf5p?=
 =?us-ascii?Q?qyzrMFVqDH/BIFCC1i4ZpxXgy8mjAGBpq7zH+Qrb3bRxLHThMoyPcJHyEt9d?=
 =?us-ascii?Q?9/sx0A9/mon6LLNe5iSPdaoIZVqmQMM1yrXAYYgtsgn8S65GGq3ZCfXIe21C?=
 =?us-ascii?Q?jWulsCvtcgh61vvwnZBOgyWMGE6tqemy4sZH0/zStgpFfZimIrh391Es/KpD?=
 =?us-ascii?Q?yQF0Qn9MFEBFRcqaAx6D+7WmIh60/xODilNsEEdQYO1MpNgQkjIpAPYpjIhw?=
 =?us-ascii?Q?T1lyNEAIWSz146eRVlqUjTNGUdOE9N80DAGxj4eANjjzzX41xKmB+CD7YOlZ?=
 =?us-ascii?Q?obsAYMiIABUpgcevbzIqbkRhyZa8X6FT3BXzAfvGPbgHaEFsUw7228ef3o2x?=
 =?us-ascii?Q?adk/giEzr4ufLDYyvOtY1B/xPkGdmCJTEMQrOm+omYMhagJLZJ5o7SXr2aGu?=
 =?us-ascii?Q?aItRLrAm8C/Cv+lmLcNfOZkV3a/bYCaHN9iCubEce7AO2txRw0zmafLuW6xX?=
 =?us-ascii?Q?ATDESboEykR+iTfnPA5yPN8TfPmjlo3ZcasoV6/iWYr6qUcJXaZq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23e0a703-d4ff-436e-e7b4-08df11800125
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2026 10:15:58.4322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BykVH2EzYIjMV9B+rOuWU8umNhmap0/gcxODU0GXbruD4E/Rw3Vc4gz7IkbWiayDrwiF8BPUNDLXHrV+VOvO9+dVmhQYs9f2cB/ojRLk+Y6obgOsnq+9GYZGHkQB9Upy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8602

From: Chancel Liu <chancel.liu@nxp.com>

aic31xx registers its regulator disable notifiers from the ASoC
component probe, but the associated devres cleanup is tied to the
underlying I2C device.

The notifiers are only mishandled when the sound card is unregistered
and re-registered while the I2C device stays bound. On that path the
component probe runs again and re-registers the same notifier_block on
the still-registered regulator notifier chain and corrupts the chain.

Move the notifier registration to aic31xx_i2c_probe() so it runs once
per I2C device bind, right after the supplies are requested there.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/tlv320aic31xx.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic31xx.c b/sound/soc/codecs/tlv320aic31xx.c
index 43bcbc5449e1..b0df6e6435e7 100644
--- a/sound/soc/codecs/tlv320aic31xx.c
+++ b/sound/soc/codecs/tlv320aic31xx.c
@@ -1366,27 +1366,12 @@ static int aic31xx_set_jack(struct snd_soc_component *component,
 static int aic31xx_codec_probe(struct snd_soc_component *component)
 {
 	struct aic31xx_priv *aic31xx = snd_soc_component_get_drvdata(component);
-	int i, ret;
+	int ret;
 
 	dev_dbg(aic31xx->dev, "## %s\n", __func__);
 
 	aic31xx->component = component;
 
-	for (i = 0; i < ARRAY_SIZE(aic31xx->supplies); i++) {
-		aic31xx->disable_nb[i].nb.notifier_call =
-			aic31xx_regulator_event;
-		aic31xx->disable_nb[i].aic31xx = aic31xx;
-		ret = devm_regulator_register_notifier(
-						aic31xx->supplies[i].consumer,
-						&aic31xx->disable_nb[i].nb);
-		if (ret) {
-			dev_err(component->dev,
-				"Failed to request regulator notifier: %d\n",
-				ret);
-			return ret;
-		}
-	}
-
 	regcache_cache_only(aic31xx->regmap, true);
 	regcache_mark_dirty(aic31xx->regmap);
 
@@ -1791,6 +1776,19 @@ static int aic31xx_i2c_probe(struct i2c_client *i2c)
 	if (ret)
 		return dev_err_probe(aic31xx->dev, ret, "Failed to request supplies\n");
 
+	for (i = 0; i < ARRAY_SIZE(aic31xx->supplies); i++) {
+		aic31xx->disable_nb[i].nb.notifier_call = aic31xx_regulator_event;
+		aic31xx->disable_nb[i].aic31xx = aic31xx;
+		ret = devm_regulator_register_notifier(aic31xx->supplies[i].consumer,
+						       &aic31xx->disable_nb[i].nb);
+		if (ret) {
+			dev_err(aic31xx->dev,
+				"Failed to request regulator notifier: %d\n",
+				ret);
+			return ret;
+		}
+	}
+
 	aic31xx_configure_ocmv(aic31xx);
 
 	if (aic31xx->irq > 0) {
-- 
2.50.1

