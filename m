Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012042.outbound.protection.outlook.com [52.101.66.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3501481FD9;
	Mon, 21 Sep 2026 10:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987679; cv=fail; b=nwHymrHnku/Eyk6hyKOg5QLd6f4rTQSRqHXyAJJ5qHT5/Tk/Y03FS31FO+ddhhXo1D1vqWS7inknEA4i0aisZO0giocSmGN28vpJaxq/WAiiCqmaNY3ll2G9V3hZalaluBRjjVaAcvcYkTDQZSMxumYgNhZpTQ8TY986VCmWjnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987679; c=relaxed/simple;
	bh=WLeJFpAVqlmEfYoJcTigGbN9jJz7ZJjSG1F6yrWFZ+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ICwaMwGOfrqv5QLGDNwpigWMJZjK3jB0QWqNHyscztNkT3/lakw7v4rA35YfJL+83FJ+TLhDoHJlgzeNzCcl/Il0EEduuF1nrTPYg8f1Q1Zskg++Kh6sJl/cU33E/FPDjRWJzwrf6d4BpSowDKQjdtsmrvSuZmAHUOKGCxj4sL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=yGntOChy; arc=fail smtp.client-ip=52.101.66.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="yGntOChy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mw2coah9vAIfMvIRNQDkAQCQS3J4CL/E9qEwh+k1KtINyFfPnZ9clJ8+2YStcrexp01EFLQUzY8APw9JStWnbPcg0Lrfq4k6pjG9OeY2YL/ZO0pE1L5DM09/9SuKBlq2pLVYcTCQebtvXCVsxZ0qgt6yBwkk/6uOD+7iv6W6IOhHNQVkHRPaeiUApmTbpUVBfuIedUfj7FZ2Z/o8lEd5j9oKcDyXczQKeaeYuQEvViDqNaoGpvLPx+F/KOvWW8lhgMgnRCfdzDV17T3mdyrFN+8mUz3sYy9k1a20hDTUtoJDV1dIq0j0D+xJ5wuHP1xD0vtvhnOioo0jqs5WTBTxYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBvyA0mfcr8H75RCecxjR8A2y7Las6IvTZWTTXxcPMQ=;
 b=d7ZsTOhnp2Mr29QmfjmH3f/MdrT0ArX6LOW316pQhIq5ilXKzUKyHx5ZN3l2sErOLDCP90NfrQg5IFOa5AdWaCzM6+GCWWYp/Jj/ppbtoFWV/W/5uGxiaWEXBPuVLlSGgqFLyzQA0N1riFgiKpHSsq6ugbIYc6i/y+3RNzxcrPnh0y3g9yB2MD64XzfpWKVKwWKvAS0nSgtXgYzOQAU02qt767jO3rndjxoOi53VWsYsx7x4SFB/WYK8RKj6VqVbSZZxgdbDd6ZOwlDSzmODeU4ce5+5NmZzPRTQ0+LbkCLsxdxhuLvVdvJlX9eZhOFzxzygcW2Fcvff1ltiXz/jMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBvyA0mfcr8H75RCecxjR8A2y7Las6IvTZWTTXxcPMQ=;
 b=yGntOChy+M3GTfZSVZgXuC7Yj6rTVqrJwGzolgRYG/tvD1SnuJ32lC5mQpsXInLB1LBK8P02kdDp5FTpvPrD/8ecSov03rqUhcPCAbI9tZerthZTQk3Kkn/rzW9wxr3f+2ks0nSPujfbkl3134vaY3dMk12dwHyvwKKjjTZoQ6ElzmZSWzIs2yV2ZO+6UvYybSevBZqAQ0DWOhjxd3+bA5J6yMO79QZEtOT5D4YH0i0nFbi0TuOAeT9mtjq8bhnsRpGV5154GbPo7bROWKT9Z9tuCl8zzCPtJrNHfTgMS0SDsmIbpTl9nJxOrry1NBBF1264vihIespNC1xsZQ0KVw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VI0PR04MB554873.eurprd04.prod.outlook.com
 (2603:10a6:800:361::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 10:47:55 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 10:47:55 +0000
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
Subject: [PATCH 09/21] ASoC: rt5640: Move mclk acquisition to the i2c probe
Date: Mon, 21 Sep 2026 19:46:28 +0900
Message-ID: <20260921104640.1941554-10-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
References: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0083.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c6::16) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VI0PR04MB554873:EE_
X-MS-Office365-Filtering-Correlation-Id: a6b05402-bf90-4f40-d714-08df17cdcaeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|23010399003|366016|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wBB67atTldINyoK6cj9S9tssUc4wqVMPl1C9NMT5R4H25URvgk/xktV0p8qKrGmyRmV1ksOQ7StZDyjKYz4uYlZFnEoNil57oo445ZLaKjMuzNn9Y3yrnNZ6mpDwGh9zVaaXfsIva78mSukTKmtIDpNx0N4SNQkgYe4uL1m+g+1fPbWJlcC11nBnTwxeIU375gcouKINvymbcBJaQQx3MmNwlt0Neir/8PMJyBt5mESKQAPb9RdLjUz5hZlPNHA8BzHyT5wDrJy+i+sa9GXNitFqhIcOMo40d9W9/K/oEXof5ooihGgYOhaOZ+VH7TEeR/D1PXBiFsfyOAdlUhWtWdf6oZEQ39Htpq32TQOHlkHgdtOFff5JSg4+mEeYPgeUi9C9co7ruqgFhjCtnqw2FEIjz8zJXlE8EyBqezQHpaZ0rHJnS0qS8RNqTpEmq60OMUEbII/8j81KzqX3LFHluaxRWdps0wRXT7z+p3FQsBm/nmKu0QLrZHxWELmYD9mxxifdz0c1zVYFvbK37t0rlBcu/zSGRnpOuKNxnNJh+mb6ecddwRiJ+j5QX0/U7xC3Vrrbii5yzSfUdcG+ECrsDr+AZMPATrwI6OzXBw6nj3vpcnh7p/WTjeSFdiwRFiaNhqi0b9cTC9aY0KseFWP0WlUk88p0s2GNhH/VCDP2eao=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(23010399003)(366016)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SVz4Hew2XJljVlFXPo1+fGAY0OX12j1olvBdfBwox6oDJTlRDA+UTmbruog/?=
 =?us-ascii?Q?cnyQct1R0GJv7HNIqXwFjFB+YICNx2KZ5BZV6uaX183SUGdrlE+JGkpwGiby?=
 =?us-ascii?Q?oKimvHoNQ6do5B4P4XxrLntm6xJprGEoYeVgy7rw7i8vSREbk7B1xxEFFxgk?=
 =?us-ascii?Q?R06hi1g/xUzXf2MytL6DH29QMEgCSs3Up8nWkWG4IbiqIdmbaJc9+W53ZMh0?=
 =?us-ascii?Q?5H0TzKmM9yoQICHKTNCh6wrg9laWWq7fWVuDgvGznSUgvcGKNCxQ4WJCDSr4?=
 =?us-ascii?Q?/pusqAs7FE4Z13wkFFV0c48re0HTyUDX3P7S/0sjzd0sIhEZfVEQTHoRZ567?=
 =?us-ascii?Q?DMHbM6jHbCPBT4/tKRF0CluGH8vT76EI3vwJrM7zjt+g9pOb+Y4ZDO/yUMUS?=
 =?us-ascii?Q?1/8Yu3upQcJOaBFtqOVOZKqztpglN/Rw+jnSct/X6venl+g4yH29+UmE4pQV?=
 =?us-ascii?Q?fU5UdBFvFcpsvD9dXXarw2tlM0t+rSYoCeiN0oJ+E0SxEE0RDY9QcpV+3eYR?=
 =?us-ascii?Q?l++vsE2xKn6m8WNz53aBxkMb+yIfIuKTQ1jIaOKnd1eXM5W9G/S1ciKfqLit?=
 =?us-ascii?Q?/4WVwew6pnsqgM7ZNLb/YunS7RxfZ2GSCNKw6fQL0Hstj+ALo1/dAU7aKBK0?=
 =?us-ascii?Q?D6wCdAqWU2viq7FTKr+xoldDFbWkHbViPWzwxu4HZfnrqLJWovQFFDTDR6kY?=
 =?us-ascii?Q?q3d5klwJ4kiKFCRKw8cIW50iPF71g4CjVHaHlJkpx6CYt3JzY81vtfAyrbFP?=
 =?us-ascii?Q?T294g+tenIGWGxtAj17JzEUtLSIs0jSowioZ/sE7chMb0rnRROaYfhoZb4iU?=
 =?us-ascii?Q?YoWVeJp21jmozW/8n4yDR7o0EvzWyMUUyXYmnsf7NdNwJow90uAZnJgfr7zF?=
 =?us-ascii?Q?1rymEAvb1mIEja+qRQPBzMlTeR4LyPgOSz4GzZcaCdXOkmc0Y6GmgEm2aFiH?=
 =?us-ascii?Q?KuVpNUhYSihr0UgDEsM4pIky2mMUUudVpLPlnYNAdqk04C2fZo5tX07CYIxO?=
 =?us-ascii?Q?slDjrs06Ujb3dKkkqS96cbgoe/bFA3VHfFhbGS4tx/WqFqXEKDVrGEgdcmsF?=
 =?us-ascii?Q?zBHTGiEQALfQZNGY0WFj9Q0+EsePXgsInL9Aq37uvVZXvLIsAQO7qI60FTPF?=
 =?us-ascii?Q?Fz9o8kMj/1/GfixtyZJ20H07gO09o8RyCdfIm3VypYiWXu+rfJaAqg7zI6Xa?=
 =?us-ascii?Q?ZrZpR+R9mfhVYhi8bNpWp5mGpw1v3CHDJb8HAd2yAQIhLLLLD2Jcpz1coUKs?=
 =?us-ascii?Q?V3wMz2qNwjECgAvkh7Wz5PxwYJZVtlj4tdwjbG1rzfrN/tItil2yfsg7wiUO?=
 =?us-ascii?Q?Q9iHeUDVVpseYBdr4OcQfAn/d1yN9xSgKnd7Y89BKzArrbYjcgdGwmvRqfs5?=
 =?us-ascii?Q?T3ZfHyYihKRXa0tfLe/nj+eb400UddbDMTONppEqZZMCdouChwBaZs1x3MK+?=
 =?us-ascii?Q?6MbuSm3daHFf88jpaihdnX+FrQisWxgewPq/h3Y6uQir4lJFAFvojTnN2HeB?=
 =?us-ascii?Q?JXjNJ2HFiw4RqzxvQRv9z2hcvSHMd1HxHb3ZUAkRq8hTNwFEQ7obbfiSuUnD?=
 =?us-ascii?Q?flAY6KwKGZwCNyF+mZ7RZVUWgpZ2N7mycej+uu8NnxbZXh50gP19+yS4xHqn?=
 =?us-ascii?Q?I0HjUQmmqSJ/505H97gVA7LedVi0O1u4yuUIEPag0r7V1qPCjv7Qtj0n2273?=
 =?us-ascii?Q?HHpfqMMgCuJnJa6cyldVL/wv6RDwh5LbgVxlLjWkP2EfPX2EQ36+hIiRllVI?=
 =?us-ascii?Q?M2cx8KK/Sefw4rYo2sLZNI2UliNNqlEY26R+GZMi/cFxSWkKdU8i?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6b05402-bf90-4f40-d714-08df17cdcaeb
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 10:47:55.1683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xVVebgGizOifGrvS/yZjddiehh9uk521JRX25arezhczr+XiApjmNvKybCTwJKbLqPxRvqMT+L5zaZFZrR3Z9Vwy5d/lNR4pCNk0/gi4Sd7PCKOoOwhaDQ/0WYk69zz3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB554873

From: Chancel Liu <chancel.liu@nxp.com>

component->dev is the underlying i2c device whose devres is only
released on physical device removal, not on ASoC card unbind. Getting
the codec clock with devm_clk_get_optional(component->dev, ...) in the
component probe therefore leaks a clk reference on every card
bind/unbind cycle.

Move the devm_clk_get_optional() to rt5640_i2c_probe() so the clk
reference is tied to the physical device lifetime.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/rt5640.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index 03d0ac3359f5..1a45346cf6b9 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2667,11 +2667,6 @@ static int rt5640_probe(struct snd_soc_component *component)
 	bool dmic_en = false;
 	u32 val;
 
-	/* Check if MCLK provided */
-	rt5640->mclk = devm_clk_get_optional(component->dev, "mclk");
-	if (IS_ERR(rt5640->mclk))
-		return PTR_ERR(rt5640->mclk);
-
 	rt5640->component = component;
 
 	snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_OFF);
@@ -3053,6 +3048,11 @@ static int rt5640_i2c_probe(struct i2c_client *i2c)
 	regmap_update_bits(rt5640->regmap, RT5640_GCTL1,
 				RT5640_MCLK_DET, RT5640_MCLK_DET);
 
+	/* Check if MCLK provided */
+	rt5640->mclk = devm_clk_get_optional(&i2c->dev, "mclk");
+	if (IS_ERR(rt5640->mclk))
+		return PTR_ERR(rt5640->mclk);
+
 	rt5640->hp_mute = true;
 	rt5640->irq = i2c->irq;
 	INIT_DELAYED_WORK(&rt5640->bp_work, rt5640_button_press_work);
-- 
2.50.1

