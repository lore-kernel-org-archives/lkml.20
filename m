Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013042.outbound.protection.outlook.com [52.101.83.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BCF481FD9;
	Mon, 21 Sep 2026 10:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987673; cv=fail; b=tWSzEceoOu6gX9sFfxeyTLai8elJIfxWKwYsXfYG/3tYPWulJz/rq+nVLul7oBmA1CLU9V3+kwE8Pe5TBAqQhYobHM/H7JxZ05vBXy1jYc1Z/ZjNjjgwBQoU/gh8BH4u3zOiu/LQS7w96JftbN4t6kfvsi1BZnhAsGFLYynxoX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987673; c=relaxed/simple;
	bh=fq8OvCKstjuQCBDVNJyovDL39v2BXdFT6zEDxUbx/5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hc4YnIHZsdlSmbTWYQ216rmHaCPrT8AWnXL+rE+twoYuHK2PDxe7BYKX8CkicIJH7VeKUhn5cckUskFcKTaAFaUmKDroCG3flWV+C1xN70hbKPdj/nH0sIQ94V9UzyU8I4D3gzzFZAJQ2miXV/Ja3Dts3K87VB8dvYHF8TLK03w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=e4FhXo7U; arc=fail smtp.client-ip=52.101.83.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="e4FhXo7U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uAIGz8IZTHt7oUHqJ0VPwONqxt9ocFFtGumKzzPYQzex/u/DPxZfqciSxQcw4Lihv+S3kqVTQBTDfeehK2hXMVRvZXpGQZSGPysQ42fxpAVm1CVd2JdsAxYcUZ3UMAsjuyqmT/515rU5iw28hV2xPIJYG/4pLGGzRN+3H17QTtwx4lFg91UDc764OrQDokftPlngjp2pyw+voMtoM56ehCYn7uqEYG7WfAWkGB83KAcpcTB7r5pgIVwcDn2HAQI1Lme0306O2OfUQuK0nTuP+aprbD5aB58jM9CO8XbG3oEFvscxpt73xf+HbrCCj96L96kz+U971AWLXzz/xHmS3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yz4ygMMBlRVEzKS1mK8PoExlQd1HxwMpcvKbzWX7ZhU=;
 b=WGv815a/AKrzn9i7ntBcLNMJ2Fo8KOSDtc/DEV8wJejc/pVyNH3ILR0V933cqIFDX9vstnTL25eaw0Th4x7DBjJ+JOUEFqEEMLblzWegUmRAjE9piz1c8J3optAP8sYUgWB5m7B4iWTJmyh9Nbn9KYyPtvaGn7zClns1Uasz1l/+nFvELQEeVNFQ8CgwRoZuEfE9fCwa3/+TpoCqKsBvr5wc49esiOQB4gWy6fP4Fq6qoDCVaUH1JGYeTRSUusReFTlVF9HzknpQoa5kXct6DRUZ2cjdB7HLqTF668XUpGGLzH1p0JsPhsqZ7fctYJIYAl/M38Idd9ho3YLy5nFzJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yz4ygMMBlRVEzKS1mK8PoExlQd1HxwMpcvKbzWX7ZhU=;
 b=e4FhXo7UBnGdNzGQezXmgKcYS/fi46VWeHr0k61bfVICqXGBlZL9+IbAfyciTil4FHR4TyuhCA9sjTXm+pgGva1mxTkNNIS+YIIpEnnc52/VX1xEP0d/H4/mLI1Rhvyub1WXnRXTDQP6YqA5+FjyFEq2cbA2djmUqjclybP6br0zzte92ynioeWUk+yo2L0ujH3WR4zYABPc/VvxDD/uCuuyCBR6gzx5VF6qSVhcA6nUc30rgvgJv2r8k7BfOXporrkaKvlv9IZoWc/oYIzbZqDDdMbPBHJ0beRWXfgviBdGAtKbphmZG6myxTIMQuHYHNqn/ZDxrQxL5Rdz7sJU4A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VI0PR04MB554873.eurprd04.prod.outlook.com
 (2603:10a6:800:361::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 10:47:47 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 10:47:47 +0000
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
Subject: [PATCH 08/21] ASoC: es8328: Move clk acquisition to the bus probe
Date: Mon, 21 Sep 2026 19:46:27 +0900
Message-ID: <20260921104640.1941554-9-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
References: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0131.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c7::9) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VI0PR04MB554873:EE_
X-MS-Office365-Filtering-Correlation-Id: e6e3b664-0e03-4eab-7c31-08df17cdc65c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|23010399003|366016|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xELtksm8y4gA0kdPbdb9BFeMar4mIg5bHJAjTx8DtCFMgBWDGIO0T2kZciJYFIr0lCNjuA3QA+mLuHWo0i/FgH/1A5czVrDj5ezGNeoKm360H+gLZglmMcX4Z+eWumMrk1O9SLskYMEPmtX0eziMOrqcNT+1cQPdiRZNrSnVzKfq4ivdtaVvds+Ofbx8x7QKbWvKRzxRweL6026VtUR2hu0O8jUVNsM3i7bG0j74P/wpI6trk6j1saO5IDmJM6+lgrtH1EyhaLGOuNSKlejuu4ARchdY5m4pZ45J122+ROKBJVrKbi0dCLYy2rFF7vNX2hyKwVSIWeA8HHU5BXH+qYxHEjgDvaCzzMxfIWzYAEFoFzZGue9KxB2n2ESSL6oqF93jQjE49WxcUXAPgHNc94oKFwGz288In6WNww58FjKfr5/0sExOgE1OMEYXFLoFMQZQdCSeYKyPWajI+5FBUM+9XtQehQ3DQe5p/oVLBiqEYKKMM1jEdRCqoqXO2ga/O5Jve1LI3PTDrQS8w3S2XKbQy/WAvK3yNhVzI7If0NK8H3XBNcSwYKdnL44skyfvW32qDM83/CXh1yyPmS01Oo9Rh0ecWFyDcBCO7k4voFKNi71sYXL/xRzoNpY9N+kV0Qg0RrhKS6kXFdTsqAGo9uJgaA3txKTBuJKMh5D7EPw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(23010399003)(366016)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1yRl4JmNiqiatuFXktDTyhS4XfNjAIoVC9LFbGwTP4LSQafvlsXiY+mk6ckL?=
 =?us-ascii?Q?qYfAiSHVNLpsVt8pDbfBMuTkrk1JSglx0QO/rRj+nICcDlcLpzPH9i9BB6IL?=
 =?us-ascii?Q?razdKZvD3FPyP+btzQWBtqV3HG1MukDrBvk2TKVxL+DyOWP1vL/4nfC2feVo?=
 =?us-ascii?Q?3GEGNGqIjUZFyuJylXk8su4JXJXmg7SiwLJrDdrrYDWglRAjvkR+wIwpDAr+?=
 =?us-ascii?Q?qlb9Gb87MwWk01Pkr+9xiD+mu+m0i93NivVqbZ2PYd+ZjfyidjKBmGqy+3nY?=
 =?us-ascii?Q?ZX4sn2nrsj+9ovN5nEeHBuirKVTuCO6erVYQOGzaGTf9EhbOmgyVbA1HC3Q9?=
 =?us-ascii?Q?bSGco/QFffxVfzQvvggjeI96Lp0zFXnFaB7/viWxUqBOG+U0lE59eD0e/Cl/?=
 =?us-ascii?Q?aZvFu1u5HpqYg653tQt4L+sTLjulZhvmjmtWV7WldbB9XXi4/5UrQMnb/+dd?=
 =?us-ascii?Q?w7OAK2olWrNroyL3qwElwUPQSLLy/98WxnKVjn3L81wFKzEF3VIVU21oF/pJ?=
 =?us-ascii?Q?Z1HutG5sOHyNjbevpExT7w7Dy2XYLYl19j6PJ/wUuTDd2p0rFy++lyJy8Z7B?=
 =?us-ascii?Q?qZ/N3CNEkYLR8OeZVIEoY7HKcri+qbvTAjSpBkgV/dapifnkex5vfC+9atLt?=
 =?us-ascii?Q?fxlCqlPC6/vOfAHvkkxw8jSAvaVP8uCCDLn0Hd1nvqdMSKXzUMVa6iBivmSg?=
 =?us-ascii?Q?YoJ+4fof0xywmrzgl2HsZiL0iJCXrfUXfZtmOq1lSC18yNc6fxI0yV0/Z8L1?=
 =?us-ascii?Q?gZVQX8F5bUf5pcBOfaj3rbbx8Pfom95uh8jS/L1JdNhEab7XVas0cFnO4nPe?=
 =?us-ascii?Q?3b42717n799045xxurcDQzKW8Y3TZQppW7Tz1cKnOPl0C5Ha5RtT8h0IVXOn?=
 =?us-ascii?Q?mf6D5me5I/spVLX1GQ7nmHy2H3XPxrvnoTlfdgfchXkCcykY24n8HfaJhj10?=
 =?us-ascii?Q?F4iXp0X9FNuxpNtiGdSbHXhrrGM0pB5ywMthO+jsNA6i6sawpOj5yu0wift0?=
 =?us-ascii?Q?TvgEIVPovTSie0BlOfMTa8HQ1e/J4YtSaSleYBaVKttzOkfS3Nk29mNnMunl?=
 =?us-ascii?Q?yajLoUOWUmDS7Pv8yr8zW5qmCuc1hVMTxvB2GvyrOg4SRj/jlPCW0K+s/u2K?=
 =?us-ascii?Q?lxJ0nmWUzPNXLqvS/ds/DqUbF/sX9r8VF+T9s7g1urBeMKhI/LElr2PyjSoo?=
 =?us-ascii?Q?GXqNIfGbI6SYpg5BKGEe22WciTcb9IZ/bMyO5TUnbvXmhGCSvJ+Qigh3d9xY?=
 =?us-ascii?Q?qTDRXcO3RIg3UEbIGL9SEGDlY6cmVOVKw5ShR6cXXKeOuzyQZrGqEHOv2zqQ?=
 =?us-ascii?Q?m/LUgXsfQFcDh8LCARlIzjNR15U/8UGvgfvRSUkrrrKEBdXder+AdN5wQsMV?=
 =?us-ascii?Q?/KWRcu2nqwhFEpRAgZLSoWJH3fwXXbVe1JU3YY0n3oTAdJSZpfRhYwcosNbb?=
 =?us-ascii?Q?Yt2IjUHke+lidk3q3wgNjxYqAT9ph0pFAp6aKJ1vS5eeAxkI6a8NaDr8DNGx?=
 =?us-ascii?Q?A4JVVI29VBlWKZu51gAzI6qSknx1Po5WWhUZpTZefwlRdA7rqPW49xugB0Eo?=
 =?us-ascii?Q?MK8/lKX2zCfbQy3es7yI6uIOBzsgZnJVWguyTnfvKkpxfvPL4vQEDzwIAVYL?=
 =?us-ascii?Q?/EACmn8PvzWJGunruDRnVuQBeLxqRLt4sWzbTbIucp6LfH7tSYTqURS+Duvz?=
 =?us-ascii?Q?sFFWwrgyVXBeKcxpJrxqNKG426veSTxTN/UrOBOrzH9ki4orHtR9yvbzk6wu?=
 =?us-ascii?Q?p6aD8JKPGcE7d8rZu74LdTtKxspZUic+jfHloQNuL8cwG3boiznF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6e3b664-0e03-4eab-7c31-08df17cdc65c
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 10:47:47.5740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v1X2BAg+GM9bspYfiSCqgG15DEjeMSUxBR/YDpX/1qMWY3k1RAQVAZ2CinQAzCOKkiFA1t+hctSUAwrCNZDUHuJEtPOUkMb8ZvnH3bOiyDeGwg2UvuS2O+rVD3gNjCPg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB554873

From: Chancel Liu <chancel.liu@nxp.com>

component->dev is the underlying i2c/spi device whose devres is only
released on physical device removal, not on ASoC card unbind. Getting
the codec clock with devm_clk_get(component->dev, ...) in the component
probe therefore leaks a clk reference on every card bind/unbind cycle.

Move the devm_clk_get() to es8328_probe() (the shared i2c/spi bus level
probe) so the clk reference is tied to the physical device lifetime.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/es8328.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
index 7d52b5d9d061..37fda2f42b0c 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -829,14 +829,6 @@ static int es8328_component_probe(struct snd_soc_component *component)
 		return ret;
 	}
 
-	/* Setup clocks */
-	es8328->clk = devm_clk_get(component->dev, NULL);
-	if (IS_ERR(es8328->clk)) {
-		dev_err(component->dev, "codec clock missing or invalid\n");
-		ret = PTR_ERR(es8328->clk);
-		goto clk_fail;
-	}
-
 	ret = clk_prepare_enable(es8328->clk);
 	if (ret) {
 		dev_err(component->dev, "unable to prepare codec clk\n");
@@ -906,6 +898,11 @@ int es8328_probe(struct device *dev, struct regmap *regmap)
 
 	es8328->regmap = regmap;
 
+	es8328->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(es8328->clk))
+		return dev_err_probe(dev, PTR_ERR(es8328->clk),
+				     "codec clock missing or invalid\n");
+
 	for (i = 0; i < ARRAY_SIZE(es8328->supplies); i++)
 		es8328->supplies[i].supply = supply_names[i];
 
-- 
2.50.1

