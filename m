Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012015.outbound.protection.outlook.com [52.101.66.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF44F4848B3;
	Mon, 21 Sep 2026 10:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987694; cv=fail; b=QkWNmahq+/qtu8L7cdjBWQp6/Ujz6NzL+9L2bP3njmI8eDcQ0pI0gUJYVMb3lS+0u1GIQQFSWL+KQcH9tO37kMyLWDQ9H83e9CiOJPNk45mRs/az4QKh0IuXvt18vH5ziQcmIf08dg+dKLnwpoR7q3HmL++opkYGSeHeckk2WLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987694; c=relaxed/simple;
	bh=r/zTdlq7Jy5Tiwl8gnqpM08S5NLLfvLYcMs0BuBIvqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lxq5AhkULFlfnjiZv/gF00rTZRzRA8GHF455DTYgaTAFDvuvQBQ25aembQM8Y0Wmdygkl9iKgS0pochfKjRrJET/YMVgHdeeQfr8ITSLXQJ23UpQX5eruO4fxeU/HASpgQCKrpIvtLkoV5Aj/afRs5heW3aJnRyM6pr+U6QQeUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GHwueYCB; arc=fail smtp.client-ip=52.101.66.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GHwueYCB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nQ0CBh+Mopjc5wCGM50S62WeBWPu603FAdVHmmV7vBmgai68eUIqq2um1LEDOEli0scZq5FRn2IZhyOgieH8pv5wCDebguLTQiHj3jOdRnFDpOAERIm+zwEr6R86ER/YPndx6yfSJv0qirRc3L5IjtIzrBYG9UkYY4BFuY4gjpAkK2juNn3nZsyTKfjPlR3RFphOSDH0wgc8AmT3psOs1gq19rU1egSZ+FfKCHFvJWBkJWI/JX4ZP+PO9O+LTBGfS3xYLjm45BfYCA1RnjT1mFfCjkpbpgWFddpxo0sj4BlR+fS1wGlScaYmWEVIpibRVXlPpIngo4TDQvpa7A9c2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=syyI4noX614QyhJXKFAb8Yn43sk5lPtVZT2395KgcIE=;
 b=gUpgVlyqZbe6SvgJt0kC1sMcJk6MLiuHUwBPUa/7/i1CYVJqN7lIlopL8GZQNuMIZX303xQMX/7SxBNqbSsWFvG82967EO7QQoEX67M0cXrcwsNyho6nrbYMtGBmJsnUVrdsRkxtGt7/8wJ/eWM57Xjo0QaddFqpl77IYc3fjFKumJWR/xgcYM2kw8DDtPybRyx6n9h9zQnKgBr6v6QusPi/+lftMDauYDP+fZfnxOnSqbiAaxmaeZ4vjc4oEZEEnvrLSw6IuXF6bdv05YnG3GPXc2cpF5SoVygcT2Dhwl1ob09IgeiUcm9zDZukm0tR/ppv0Ia19UuHZaZck2eBnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=syyI4noX614QyhJXKFAb8Yn43sk5lPtVZT2395KgcIE=;
 b=GHwueYCBt/pu4fpR8vLlMv5DVOuxiN97xntCZLJZSz8qKsTlro0WXlAi6099xAVriTQIo34z2z/TLyj9YuRyVmAqFlIupqakyDNF/yWtuQOoqOxQqfODUTOvl2etFOkbZOKoV8+1BtuUdrxO0ZpTOA2IyvIvlIhacN3wG5L+WQAuP/Ub/8d3vTWfOBth4AFyUAxD3cVj/wgvB+J/wkI3U/JMagXSjG3/QDPQ9MOiMXqRlPo3t8f7v7y4Hezyo59QObMQjfzp7/3lmsELCQ0OhWgi8l3eRWpfMmYwGFiuTE/9c3Bc2hmOYGncCX/HK7GHCSNZ9wzMR6If4iCDnLG6gQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VI0PR04MB554873.eurprd04.prod.outlook.com
 (2603:10a6:800:361::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 10:48:09 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 10:48:09 +0000
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
Subject: [PATCH 11/21] ASoC: rt5514: Move clk acquisition to the i2c probe
Date: Mon, 21 Sep 2026 19:46:30 +0900
Message-ID: <20260921104640.1941554-12-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
References: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0197.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:19::10) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VI0PR04MB554873:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a87f003-fae4-4df8-3d79-08df17cdd388
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|23010399003|366016|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TD5eLQNqYkIUCLYfPkT44z4lQWSovuYw4kgJbveBSNs/BT7i3C3tkeX/NJnYH6Kp9Pla2NzI4KtW5/iBfDRe47O2Zg7iGcef+lKiu0ObnquFdukfHciYiP3Dkh4/RUhpcgzDP4XnH2qosFEdIDdeSi+tV/vZEqe5B/zoC7HdZph/2lPI+NZeaVvXcwInwG3p3w9xBhj706uPa/GuYX/LAfemy1eU82fOGOhEj/jZiZqUcd+EESV6X89OqIg1t/NmaCWBVsvY0E6r7Fufnk0PkBxhhoPZp5ECjL0lwcaufIFT07PJ9G+3qO+6sC9Q/OSAKokEueQfaVQ3v0gRmH2Cp3su+N7CZzVQNJJgzebWTCeg9Ve23Djf3FkSM1E9PK6+riCnVbSf3WTptkRCxh7aKKa9Tn1EhovJlom7YBdjKFYx2Y5/y7vbx8yzB6lcG82fWEVW0SBJbsMBU/lybxDJ/1RZ+TzZ2A/X1nGCEkJfcgi+t8lyuGZLGE0nrHlxJ808b4B5IAGBRsypwL847aYCCvEy/TIPe0P++snLe+JEMsfiy/bXrI3Kk84SuW3nLSXSIeP7/8Bq2v8Ni8aVXVPd+yJaD6x0MxSiNur1B/jtjKCrgTY2jFb1S17Txj3ijUmsNvFyFKXZI5CG8/mTdmJ9xj4b4uGKvz3lyD+iJ3ySISE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(23010399003)(366016)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?to7dgwf1eivYlfGq0f/XXvNy0nUifjQJK3aC8ilRo0ynD5JxIPCbK/d4I8iS?=
 =?us-ascii?Q?ajjmLrIOHT2rtaPSzJRyNztZN5lM9tGti7WKELTSSdHKLTCGfoLci+aj4RTA?=
 =?us-ascii?Q?wex55G5/aWNnL20M1G2Wf8g9Po7Uq2h9+3NHDoIRL7QOocEgBi+sXjXgaGLX?=
 =?us-ascii?Q?4k/dY5WknNnMgxxaN8OsoEV+LfzOrc0KlcaMqPlsIRg5tE6ES13v0dZ7+AdO?=
 =?us-ascii?Q?yZHA4oYosZys1aVyKoe0MHwHQX/iHFJOHRJMUOp2QhRCnOZc5mMudcHKkYT7?=
 =?us-ascii?Q?hQhIVyzA48QCS6rCjFWH6fzTe/XgrzlnoIviwvV9mZkAQKtILCStzHs/lr3x?=
 =?us-ascii?Q?vHpEI78e/LJL2/OT/Zl/NpCVOb6Yd16Uwgqoxzg/sDgWrf/F4G1xPHNo7lwJ?=
 =?us-ascii?Q?gV8wjsoSfOhvNs29O/ZbDw8mqlAnTBhMnPdsH8CNNqaicWJscmf/MwKayr4/?=
 =?us-ascii?Q?tRP7djf+UcxbijMtrAxoiElfPMxWbEa7jGcm4dVyJRzBCJx4WPF6q9PJ3kMb?=
 =?us-ascii?Q?GGewDfQeva9I0ub7Ji5dEQAjn7AHzkKVVkTJa71x/LIwwvX8rHy4o5zTyZYj?=
 =?us-ascii?Q?n6OVyyMbNL8jzzqpCMSYWR26RjmFLk4nuBAIbJePeehI2f3Eel3yHlY1MzpD?=
 =?us-ascii?Q?y7BM2KDqhz1qTuE6dPdkQrPK+JFcfUb+jzA5VANqTWk7mt2cSowJUrBAo5jH?=
 =?us-ascii?Q?nevrNG5dSLbn1ZI216XpBCaIE0tbVNgZYuBnpeM+au3HTPm8wXAtHZO2CGhY?=
 =?us-ascii?Q?hUsVL6Gwc4msm8Zf1r4ojr9cEM+ZYboHOUS8Fzkp3MZTy1zIyAMOZidPhlPo?=
 =?us-ascii?Q?c3pttgOSmLpbwGftTuIN2T4onRKC7A9P9Offr2J6A1mFlIe/s/0vcugJo6kq?=
 =?us-ascii?Q?2AsUMtPLwVrvGJZjYs3W0XBfWP0n84JMEbuXmPz4bgPWw5OAnXQy2x5wfjMX?=
 =?us-ascii?Q?bTdPw/iNRj3ySifxfLsa7bDBs+j/7xq73ojHl56VQ5JsVzKI10lAiPuSnEVI?=
 =?us-ascii?Q?2OHefgfMaDtKgR1ucaw9/iNYOn6MtO1ZNI19MQya6c38khcUZ+lZmMZMGw0a?=
 =?us-ascii?Q?/tTqLCr3FVj995qX1pK0+fwB3c0QMZlm13JghUdSqOIwofoq4WS3EoAlsGJo?=
 =?us-ascii?Q?nMD0eDI+JE5uFwPROg1n591ntHqErnWfb4aEdZihDrYWK1dauiB78mCnKnKc?=
 =?us-ascii?Q?25+Qk7js1asswVIw85zFtHvadbGndTxQxYRe3YftO6+NzQqDBGx57H8m388J?=
 =?us-ascii?Q?U0XScPI4TCm5WgLMP6ReW8MpPzzLJdUz5ECiwFAJiDR3U9pNbGtQ815/shs+?=
 =?us-ascii?Q?9mZYAyk1tlq5Tp+BV53m7wVoF8TyblveplLkk+RCof9mZvaYuVpqbgPPCQAm?=
 =?us-ascii?Q?wqv562LjhsySL+b/5L9ASxrqHZIft25TQi8ZT43veGVAuExWkIqBxoNRP7yV?=
 =?us-ascii?Q?GOZnzoyugC+ZHqp7JpaK7gFeFrUQ3Shvmz3VKEd2rpGbWMRzizSoUbYVC8tm?=
 =?us-ascii?Q?HhMkx5x83p8X+L9t7EbxY07ALbdsvCl2qPdV9LfR8UD1SlB2nbpZlvIHvlg3?=
 =?us-ascii?Q?UkjE3ZhHgCy+i9Do6s25QDff/6clE01k5JFtr255HeXNKtDMzSfM9Q3cJtFE?=
 =?us-ascii?Q?jyvTPeyyw6e/4CF83iZFJUWoPCnjUpXJbRiQqQOnhifMfrfzFV6O50Do4CPQ?=
 =?us-ascii?Q?UA7vrNhUPmaBb9XDcZbjYhRPidWAcqarkdJkCBI/+nkuI3iYH11DpkzK/Vtl?=
 =?us-ascii?Q?BTIdeSDS5jR9k5LPKr8C3y2SSIUFvZHi3Ssel0IdjAUTLXEQ9Kjo?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a87f003-fae4-4df8-3d79-08df17cdd388
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 10:48:09.6960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fT4LqXF9usgQVWS6NdCnvmdkMrkTMHWLPgaPOSAh5H/LPnY5dcsO+aFTAH5bncbwyGA/Qw/gEJaGRuYT6X9GDlnQtb6/WhCnhEm0tWsmEeJ2afncPezl6VEYY+MLjjIp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB554873

From: Chancel Liu <chancel.liu@nxp.com>

component->dev is the underlying i2c device whose devres is only
released on physical device removal, not on ASoC card unbind. Getting
the codec clocks with devm_clk_get*(component->dev, ...) in the
component probe therefore leaks clk references on every card
bind/unbind cycle.

Move the mclk and dsp_calib_clk acquisition to rt5514_i2c_probe() so
the clk references are tied to the physical device lifetime.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/rt5514.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt5514.c b/sound/soc/codecs/rt5514.c
index 753143e2d11f..a33fbc9fb047 100644
--- a/sound/soc/codecs/rt5514.c
+++ b/sound/soc/codecs/rt5514.c
@@ -1099,18 +1099,6 @@ static int rt5514_set_bias_level(struct snd_soc_component *component,
 static int rt5514_probe(struct snd_soc_component *component)
 {
 	struct rt5514_priv *rt5514 = snd_soc_component_get_drvdata(component);
-	struct platform_device *pdev = to_platform_device(component->dev);
-
-	rt5514->mclk = devm_clk_get_optional(component->dev, "mclk");
-	if (IS_ERR(rt5514->mclk))
-		return PTR_ERR(rt5514->mclk);
-
-	if (rt5514->pdata.dsp_calib_clk_name) {
-		rt5514->dsp_calib_clk = devm_clk_get(&pdev->dev,
-				rt5514->pdata.dsp_calib_clk_name);
-		if (PTR_ERR(rt5514->dsp_calib_clk) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-	}
 
 	rt5514->component = component;
 	rt5514->pll3_cal_value = 0x0078b000;
@@ -1285,6 +1273,17 @@ static int rt5514_i2c_probe(struct i2c_client *i2c)
 	else
 		rt5514_parse_dp(rt5514, &i2c->dev);
 
+	rt5514->mclk = devm_clk_get_optional(&i2c->dev, "mclk");
+	if (IS_ERR(rt5514->mclk))
+		return PTR_ERR(rt5514->mclk);
+
+	if (rt5514->pdata.dsp_calib_clk_name) {
+		rt5514->dsp_calib_clk = devm_clk_get(&i2c->dev,
+						     rt5514->pdata.dsp_calib_clk_name);
+		if (PTR_ERR(rt5514->dsp_calib_clk) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+	}
+
 	rt5514->i2c_regmap = devm_regmap_init_i2c(i2c, &rt5514_i2c_regmap);
 	if (IS_ERR(rt5514->i2c_regmap)) {
 		ret = PTR_ERR(rt5514->i2c_regmap);
-- 
2.50.1

