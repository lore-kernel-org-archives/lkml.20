Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011065.outbound.protection.outlook.com [52.101.65.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651C8486BAB;
	Mon, 21 Sep 2026 10:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987728; cv=fail; b=Mwb9OXTGnbIdSy6eyLnqFzlx++UzCt7hqilrIfKNhVnxViXzDeLtn11uOvngHq9QS6D5d3meIIvCn5xjrrvB3XM0BSq2lqPdn+weRMCQoxQNSPsJyLN/WEtjMwP5JG8WfEht9WBxM7rnW6nfF1fV+vsv6mx99rHw1s4KDiL04L4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987728; c=relaxed/simple;
	bh=+GttOVpo7uqOKv7hIZ+nZywPTS4hrcbT8v7gArqrMko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BTd3xhz30iGKB9B9RP2P+ivwDvgkZVl3lqn3exusdLPMS0+b9MGUHja7cWvlk5dHzpQzO9M/b12w5YC7grcn0Du33ck99W01SMsLOviCWbYxd6S45L75WZAOsm25uhjND8yZgjwp6duQ6Og4whSnMZqKPjqOaBuQXxi2PUjo+YQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Rum8BygX; arc=fail smtp.client-ip=52.101.65.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Rum8BygX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uRGaWLv4L0OZCaBlKYDpf1v3OXyNZ+UIstataySvKAPz+9kb9K4yRgofyKHtIzKcp9O7F7mpT8l5Duor1y7sVOLlwFIDMcF/O+NSNiaiO5RyGyyOHDiKbvDHEeUssd+mC0JbSpgaK03C/yIb/QoPodRDQk46/dY1xyjyyu2Ek9NDkY97uZFROf7ETghiZzebsOr3yZQU/UtouKCSm7q4rxbiBy4+4j/GPeFcUhOnHwSq4jbXodGL7Y4APR0+4F5z+JXARCSMm8LfaAt5yAAX06r5sCbtLcxE8X1+4CnKqxw9EZ+gCf2rGqKxhX1CRSNp4I8WsxO4UHDFYb1MgCuc/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQ6BIyYDeY2w7CsnkK71yGOHvGFOo4FlHEiIi+FVmeQ=;
 b=VyCLhWGuwyYPqU2kOBXLFcrM09why/rj4+uY6G5fAgz8i7uzch+K3frEeEuaMsr4iOlrqe+aTY3Ce6q5WRr5O0B8X0qRtycCSu6jOitX//kOZ94GasViJ7yTVOgPF5tqDb1gXpO5DS8ETEmavebuqqQ4TsTBstsrtxLB0I+TtKlMZ3ydBrhII+GRxr59eOsGke28H7Szu6ZzENJHkQ3WXO2g0zhIjgsw/4AEAAC89bbHZomKNcszb08kjIoK6T1ivBgbgzxDtp9q/RrBPsbhNKTMU29xRSCcU8XB9BQ4GcAgS44mE/sUZBVymhcV9srM2b+a6Mx7Qb5h48mpJ1CxJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQ6BIyYDeY2w7CsnkK71yGOHvGFOo4FlHEiIi+FVmeQ=;
 b=Rum8BygXtpV64HLWE3XQgLwhbMWxCWbfB+Q+MQ60SNRIDjebCIQfJ62NZNVXD+PD227fSOO/OVISebVNtmVqfOaDbRtIGYdOPZpmlfcTAqgZ2k8ZWsM6mMFmhgX0QE5pyq3eYezQk0AxwafohgXk/xiFYEX3nukudsYiptTdwAiwfIi4H7gbz+mgKMxoDp4XIiXfvQsV/ekg+mqGERx5ExF1c7tSNxko5IfJzAYPyCF9zanJLgTO6jl49FD0oqb0b+XI7GAKOkBjOFqnffYOgs0hhC+tmuncyDQ/Iwv+6G1GxzdftisaJIdx1D/dZSLb42pjm/JVoxJVXbWhkeWurg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VI1PR04MB6862.eurprd04.prod.outlook.com
 (2603:10a6:803:130::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 10:48:44 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 10:48:44 +0000
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
Subject: [PATCH 16/21] ASoC: wm8955: Move regulator acquisition to the i2c probe
Date: Mon, 21 Sep 2026 19:46:35 +0900
Message-ID: <20260921104640.1941554-17-chancel.liu@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: f379e921-47eb-4a4d-67df-08df17cde83c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|19092799006|366016|1800799024|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	N7fZOug/edRrecJlDym649rIUdxWfyPMKRuE/Dej9xeG/R3Ud3Ti1lYyX95N/oz31DyFBokRk/vh48DolwqTqjHyp8zCBA92E0thv7x8v9zYxgM2VrTEMHc4j/B0gX0IjtlN/8nVxbGTv3qPBOWxXISs8Z4A+c+6YtkZZnw/lzBVYhshaNVWhP1lzid51tfiEygaD9Ms6TmgafdCXPduNXp9MKmlKq/ZJ/Pd3PZQEcd4COdtrnb70J+QHAldcQvK4TkG3bXlL6pOjTTgBC5+OtWS0//6pBk2HdwSQXEKburgOqAUMNYDq73GDaa8W1WWrHCf+vydVZqfQM+wQLZrLJAmaNaXseT3hmQUCtQRy4jvJdwoZpImdoWyHpXH6KlwQX9DwdfHmVMIu7t7Y8xLQnQPAKVlE6rNLOFerRBP8EzVle7wWphlXbU+jq9UMYUHTFl5kzLWDIFUukYgd+vr4dUQZcVIeon1YdhK/D5+oC7JLU7zPDdjeaNAwUY37fqARMpk3Bv+/KqmmFwKQ870zjoVGRPXUD/oBNwYRVGoXKpVTskj9bk5vRcJbrDhgpZuAhB9IYdVscRstY+r+pFxy30bQ61D5CIHc6EnkuKeq3R9W2WBPEHZ723dSeKEa/VcUlKaSwiLURuQFFSs0k7uluEA7nvYVGxw/hrsn7cSf7k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(19092799006)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VqbXwNZ/iJq9hOr01hDHqjewi9cjhL0FktfuzqgHo+EsyVFTsjgswvUVfTrj?=
 =?us-ascii?Q?QXdmKDyhrJIh6zgq53ZwxRk+PTXytHR2Cw9QWZ6x00vbABS6sS6dFJsVFS+g?=
 =?us-ascii?Q?8WFcgVAdr9IcmZKBD1yI36F9sU8QMPvTgIxjl7QXoYhIFq/jI4qiYGXezumA?=
 =?us-ascii?Q?cB/mGRJeC3HEgf3VbZGGA+VbCa8pxgW5AuusTaeL6tt4PlBcGSD5TA9ViU6P?=
 =?us-ascii?Q?gyBbtFLoUWJLm93Ko8pUK2n/RfQfwbVBTH17/D+hNOe0scZrxYc+SHDhRmIN?=
 =?us-ascii?Q?lzP/cDjJvvWtmQb8I4xkp9xw4xlQze9cN8SnxZcMoHgq97XR+o38fC5tS0xX?=
 =?us-ascii?Q?u6gcGotH5TKUIgDrXRqt9TxHNubo96H4gk8R+3KCTroQezrOLVr/Kt5C30YF?=
 =?us-ascii?Q?B/fYX8TTtovoTY24TBIerqE1hI0Ka3END21AZLiCJ4FZqamaCMK5M1O0dbtr?=
 =?us-ascii?Q?uudHkY35u8Blo2F7sckBXNWG0M7k+vdmgN6tLs7jUnuG9MzpB6Xcdb/Ir7Gf?=
 =?us-ascii?Q?M+xPwXsVwn10VP0d+rJiD01vE2dQFZkJQuxsyoYdi3KvGYB4zN7722/z0iyT?=
 =?us-ascii?Q?p+TuKkJ5r5xajXpvPo6LUnGGqNqwCcCVzutXpI/VvyZ1waIn0crYY6qDF0b0?=
 =?us-ascii?Q?kx7St211DZUHx3OgB+mD/1z4in1Fu4VTY1ERZyv3CLMqIjfVanY6xl/GLUKh?=
 =?us-ascii?Q?zqVTEbevTAJ3ve11helrdeG2Owo4hJgVqdVChNHDxC+zTwBoZE5q60o85C8q?=
 =?us-ascii?Q?j7uKF5MLtsfFHa8T5e43ghIyymo1eZV6qwpslwO5QSQRto9Al8AlFe6g2awn?=
 =?us-ascii?Q?EsSCjVCrTW/VZfQ85npxCWmP+qJ9m/nexIbHPMmjRZD1MRHTbId73ZQoxwWf?=
 =?us-ascii?Q?RXOJcroaNFiOcZn/COquZfFrVWrn+kX6HnmTl/L319uD8CdA2IirRl4+pMLh?=
 =?us-ascii?Q?bpQDws2WSBxnmK8UUtocjwUd8DYCJfJ31dzBEmt3mYeQxhElJOPZ6zHtCLL8?=
 =?us-ascii?Q?IY+ZyWAPNkOS+/pVzKo1bb6U3Xw8Y4xLprmxQCT/PoYLSy/hyy0yPATjvkd9?=
 =?us-ascii?Q?uKaDm907oGEcCcP23J1bBFLP/Tt1uGXBLoakdnSPXtvW1UtJDDQ3OWTVRq0S?=
 =?us-ascii?Q?eG+0rfPUBsMI4EhQbvsHcQ6pDqc7uDf7ZbI1rHU8rLr5/AItlID260pD/WV7?=
 =?us-ascii?Q?Mfh2P+Tq3ey8+rDIBr0k6U+Pu2fvNm4hb62tLNPwghcFmETtL3ZRCbOWJV0+?=
 =?us-ascii?Q?GazIU5KD1HcGOJYn9ghslg0g7i3ANFZVWu9ndX9/NeOiOjtP+nRr0zrR1ug4?=
 =?us-ascii?Q?PiaJc3Ca/dW+34IBooaWwB7W1iK/647T7IIudpq6X64HrMbyZFbB/u99wUYK?=
 =?us-ascii?Q?8jT/EGuOkHjwlJAeiQlSkJuyEke/SzOUhG43v6b1nfrtrieiVzK54WF0Ekuu?=
 =?us-ascii?Q?+ZZqi9JOuWCuzHTToeFb2riZDXbgvwANBGCpbe6+moX7LgXs1+1NTosiRSRu?=
 =?us-ascii?Q?uak9wuQSovKVJhOJ5Q2Hgbn9im2I7L8toVNg4Edpe2/wUBojzXzH9xJXWNHH?=
 =?us-ascii?Q?IWxkLQkaMr45LX8M3rMnH27p435YXTC461cEWo1guKB5bcntfrzhY20KmLtM?=
 =?us-ascii?Q?WUQ1QpqtgV4rCbO8x34JqPldqu8cBQdOSBdz47U41mkiVhTRAzCmgQT1PA6g?=
 =?us-ascii?Q?G5LcwLCt9Rrm2ASL/TaPGa9XrldKFJVTUYtT3kY4uMIoXlDLIP7Prja6B3vt?=
 =?us-ascii?Q?jCoiGlvNxKBD79/d62XB/JpQqg/F9OIhTLTdwgZMpHI3hehYTF8v?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f379e921-47eb-4a4d-67df-08df17cde83c
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 10:48:44.4093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G6KcuX8BY7PiB7x/UwzLDL9pv/zJZ4RBkAbo8mg+qK21HYyK3fhT9sF7c4AUhQwvmKsmHsL7VxO7gNzH75fjQxw+MtUKv9AbqnAZIKNzN7v6555XslzLDFBRzgplrL9x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6862

From: Chancel Liu <chancel.liu@nxp.com>

component->dev is the underlying i2c device whose devres is only
released on physical device removal, not on ASoC card unbind.  Getting
the regulator supplies with devm_regulator_bulk_get(component->dev, ...)
in the component probe therefore leaks the regulator references on every
card bind/unbind cycle.

Move the devm_regulator_bulk_get() to the i2c probe so the supplies are
tied to the physical device lifetime.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/wm8955.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/wm8955.c b/sound/soc/codecs/wm8955.c
index 1d367a957f3e..017ec2e37d1e 100644
--- a/sound/soc/codecs/wm8955.c
+++ b/sound/soc/codecs/wm8955.c
@@ -888,17 +888,7 @@ static int wm8955_probe(struct snd_soc_component *component)
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct wm8955_priv *wm8955 = snd_soc_component_get_drvdata(component);
 	struct wm8955_pdata *pdata = dev_get_platdata(component->dev);
-	int ret, i;
-
-	for (i = 0; i < ARRAY_SIZE(wm8955->supplies); i++)
-		wm8955->supplies[i].supply = wm8955_supply_names[i];
-
-	ret = devm_regulator_bulk_get(component->dev, ARRAY_SIZE(wm8955->supplies),
-				 wm8955->supplies);
-	if (ret != 0) {
-		dev_err(component->dev, "Failed to request supplies: %d\n", ret);
-		return ret;
-	}
+	int ret;
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(wm8955->supplies),
 				    wm8955->supplies);
@@ -990,7 +980,7 @@ static const struct regmap_config wm8955_regmap = {
 static int wm8955_i2c_probe(struct i2c_client *i2c)
 {
 	struct wm8955_priv *wm8955;
-	int ret;
+	int i, ret;
 
 	wm8955 = devm_kzalloc(&i2c->dev, sizeof(struct wm8955_priv),
 			      GFP_KERNEL);
@@ -1007,6 +997,16 @@ static int wm8955_i2c_probe(struct i2c_client *i2c)
 
 	i2c_set_clientdata(i2c, wm8955);
 
+	for (i = 0; i < ARRAY_SIZE(wm8955->supplies); i++)
+		wm8955->supplies[i].supply = wm8955_supply_names[i];
+
+	ret = devm_regulator_bulk_get(&i2c->dev, ARRAY_SIZE(wm8955->supplies),
+				      wm8955->supplies);
+	if (ret != 0) {
+		dev_err(&i2c->dev, "Failed to request supplies: %d\n", ret);
+		return ret;
+	}
+
 	ret = devm_snd_soc_register_component(&i2c->dev,
 			&soc_component_dev_wm8955, &wm8955_dai, 1);
 
-- 
2.50.1

