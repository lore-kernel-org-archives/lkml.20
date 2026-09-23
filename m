Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011006.outbound.protection.outlook.com [52.101.70.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D758543CEFE;
	Wed, 23 Sep 2026 06:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144131; cv=fail; b=QrjEqlqGdnUvoOOxRvT05FCBqnkdI+tiHw0FvObhky649L8hAqV8MUu7bIubr9lHBjgwovUz+qYNQTEPYJ/Prbe0Xhj5hT+56guZ+GI5g3jTxs4r7uaK2O1/RPTDh5BD14SgUdLgo+08MUvoAUq3sBLattLuYeYkstHcc38HnhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144131; c=relaxed/simple;
	bh=yhvPMB/J7tM8F6InA5bT28wjIBCLYF91qDpYwwfZQs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BM+boU6XppZ0KQM7zCwSKqp5nqLSArpSzz6/6BSoPLdXV7XQUVFsM8OMSwfJuRZivhZKmYT0PQsovrTCe52zGFqmT9LfFifVr4rsrtZ/86d20MucJ1v29hKfiYp3vIbJoujZWM99A4lc16mpdshBOueCWsDRv9biC3/+KFMMS0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Q8JSHfFG; arc=fail smtp.client-ip=52.101.70.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Q8JSHfFG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YfBWCroc9KfKUwPMYxgX6cRPJSex6Z24jf8D8rcOLE+kRw+8yMpZT80Xmz1WxqpmXgIsAxxEqAtcrLhOu6IhbQNRVtoGW3v9ZS5/k2PONIYfZL9MAmRsb2xxJ4knXVAu9CPKWS2XU1QkYRvmMRygapLAm8nLiGiedwGZ4dOqZo4oOzzmheFATxHPHpEvqoSIhDATqkBl2yDfEUiQzJjNaIrYUIRH+dSxRmZ4qi1d97ZXCxwFIddiaIfzeD4dzou4jrQeJ+copc29yCLCBuUHPtjPWnVsIcSMqc75xBs0553MDP8cg2GmTt8XPXcy2KwVFDepUJr56aeVfYb4TVh4lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1cwX510dAL63V1mIPAQeLGcDOULhO/ui22vGXFgwiHE=;
 b=juQTNm3oWeExdQXgPZtRXss7+/iiTZOlCr8uaiWVUch5t+BLI0ZZ0tV7FPAgDVSv3ALbNqzd76fsJf8XjOmQkOL/eeQd4H2ARmSDASROxzNxQ2soEE68MwlzW44YK1ELrNXJkI5hAJirM3OqIyaIT5WD4iX/lshwaBVRrlFj31LDqa1t/BmtHfmQpDo/3iXEw89T96XAS0jJwTj2FK2SnOgNYbVt4VJJbHGXBMeoc8gCoiZDyg0Caa7U2TYVvJPNSLpomXVQFX2XZhVsx3WdvjMAHQ6ulM5Peb6xHymApaRhLk7M957wC0/DBc3ZVe2K5Jhli/C5ssOyYBAiPpWkrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1cwX510dAL63V1mIPAQeLGcDOULhO/ui22vGXFgwiHE=;
 b=Q8JSHfFGq6hwliqT3mvyT6SMODPJLjSOlePPxD5IVhVO6UVn8FhbvMg33wexocX9Yh/b35O00/UnQjP1J+iHhoipInt47gqSY7vb4FTw/whwZ3dpdkjZHQJ+AjI9Lbf3UKBS75V7zww1tmNz+JpNycQnnq20EokuqIdrF6K1wFTUhpNa+ub6l4fJpvkTo3mzjC4iBhj+7ImFadyS+zpl1K2ejrozAHYHi7Pjmd8FvnJMFpTM8Rg6bZH35gTJeH9qvtztGuJV7JalfeEtsixRgdUGTqhFJXHkZGYvRE2f4zqBTPWKOK6P0A91tZDXbpnvi3FokhITBSxoXC0SyhWEng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM9PR04MB8339.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 06:15:20 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 06:15:20 +0000
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
Subject: [PATCH v2 17/21] ASoC: codecs: es8389: Move regulator and mclk acquisition to the i2c probe
Date: Wed, 23 Sep 2026 15:13:01 +0900
Message-ID: <20260923061305.4041197-18-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
References: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0103.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:3::18) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM9PR04MB8339:EE_
X-MS-Office365-Filtering-Correlation-Id: 233c3789-7b10-430e-d8dd-08df193a0bd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|19092799006|7416014|376014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	aMrQUwzxSGLq/MTD+Do88rS6kje/xr66FM2ncVTlfLrx24YAg/UX0ACN1ZaWQ000phQzHUAP6cXMMCpPMB6pZJ96SGFxPd347eQl5VpEQOOlGtZFkz3HzFadbZbkLY5ZyqjOiv0ot5LA6O6JiLBuzGbb0jOzcdE3Dovb5F5G65YxHJnh01t7ZHLcuQoLecWau0VRILzegpfh1MmowrzqTB3D9obnPy5ZEcjblmunNhg6KxT7Im7l9u53eaEifdZtJp4ca7U1bwum3dhVG0Yoa/4+Kbe7c11Zc8jvr9heSPSyOdfh43ZsILZl55+gXf9niww/qQPDAGrarHE0ZFqB1nJqICvMi/7Kkux3kbibqz8NgOb8M6ilLPwBLIQlJV+HVtxYOZh4YBhaxi1ZsdYAQnkJiai13Zsr5jYrVWWm1c0+HTHcG8p8rhygptrg+Uxj0kJhpW7Mz/jexOlhNYZkiliSSWb99FI7LpdyjPJWoE/tDkXdjAmNO0mwimCfVN71S33F09CiJsGzib0kj/20I8iixTQvIWt0VS/dBzFfNhhjXpUFjHzf89j9/WgTRQHjtJ1uLTMwHwfE/oPVE4/+bPlfiESRnv64epnJFkdPZ35SLhjG76WNWGjMYFLXP497H4mzFiyn5ZS/0olPO2nT0FfITM0Di6ziLemeIVMA9Zg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(19092799006)(7416014)(376014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gFX1SHNoJEBA9b+VTOZ4XTBhli4+mntazjb2Z2No+zy+cOoPOTdQQmMJ7v1v?=
 =?us-ascii?Q?sr5HKr9sVWJ8c7SAKuDNOCessjUFxTC7S4UqoXMDZ+f7r2PCFcCH9gOhCtaH?=
 =?us-ascii?Q?6o+W8NRzxMFY18p5K65jTpXwbLKmGjiRcuA3MYxc7jyZ9M0PUV0JUXbmIym1?=
 =?us-ascii?Q?4jERjtS4akaRhBARusykNTUDYaGpII0sXQrN3yf9n4O8odKH9X4RQEEL9Enb?=
 =?us-ascii?Q?D6x4y2tDkpDqu4xcDHEpOsQq4171JTZGO1imd00pnI9nP0jYRUwqTFVFDmgw?=
 =?us-ascii?Q?mpNwIWboVdnzge+UTaR6WZKQTkshhcSetkyQZSjyhWXaf1bWiZvjPpQHatZ2?=
 =?us-ascii?Q?XyGfyYdNw/CcLmqXhNMr62iQoHvD7Z6vTW8MRDzi/2sVH2YXjqJ6eDC2h0jM?=
 =?us-ascii?Q?PxFYG3/GR3bXypUbGOQOEznN2qrx3cJzhROBeCsYfA6xp+5qHXAiLAoxReOA?=
 =?us-ascii?Q?73SI5ZmxpXgHj5uCx7grrLUaYyGw87Uqv6LH92eqGf1Gy0cdurv9KRajkBCo?=
 =?us-ascii?Q?vMhhEAkDAWnC+DoksHTTQiQA0W7Ba9w4UB691Bpw4YdxR7wlxu6QnD+0N+xc?=
 =?us-ascii?Q?I3kqeszdHLrXPRQCf7UU6Aof/35mlACDURLmshAcAvnuMxgg/yZfHELeV9Od?=
 =?us-ascii?Q?6GH4uPLW6pSPgA5WmZs54AYijTRZOXsENGgiINwLtVAcCkAJMhQZAg/X+Ry/?=
 =?us-ascii?Q?i7QrPv7ES6dB6oMrbupmRB+saUmUh0oWXOzg3iW3wkx+tgcDACvIKyl22hut?=
 =?us-ascii?Q?6iTBrqSZ9GvY9dNnXfyj5lD7H1MQ/LOS6XSUqwx+wgZ6nq5A5c03SU9LhykQ?=
 =?us-ascii?Q?Gy2tzepK+pRy6+h7Ze2bDkWSpP7KbisaSUPJyWVeUvyhuWQusLCjgjIO0exG?=
 =?us-ascii?Q?EdytcZE19UBPYHAKTWVwbCIQrRzS8phZg81OxpnsBSkbZw4YoB64dJ2vipIc?=
 =?us-ascii?Q?gV0eUT06AblJCPZQaX60hL8bPWEIr3MUbbAizx3a4JZT+O4b1J2ANLdCCk9g?=
 =?us-ascii?Q?bnk2st7vMsWsN1a+6YQNx4QIkCtgymUhatNiRUQXfcRlrwQp9oWGXS7+z6DE?=
 =?us-ascii?Q?IUXeyDQv9grP7ug+FQBUGFO5c7J449hR6ioZNB4JkiwB6iVzQSZEQrFPhs4j?=
 =?us-ascii?Q?sUrxo/KSUYREH2Eg8+vUccOyZ9EyGmwPwrMTbdzn5TL9quzbc9mP0jAoOgd5?=
 =?us-ascii?Q?XZwBh3FKv78xEyg2fkY6rRaDtFicOGXlG1OGagHmrSe0kvsl6BHweKJEbPsj?=
 =?us-ascii?Q?cYURXd6tfwQoI1wUi0LSAvIdwdWB72x2MXom3IV5ar361JoAa5ThEVZGEjUX?=
 =?us-ascii?Q?Hc6KCykKx8MMsEKyLhs1RJga5fZTST7mxRcxpK/ihLaTlrvFQYMZBrC3LzXL?=
 =?us-ascii?Q?qF5Y/H9Ve31RuNlxOQKEZbxXdaePtMKp3vL9SP4PLkL/OB/GfO5oJv5/nnPT?=
 =?us-ascii?Q?/o3lYVM18sk6WSIPaY+Hm5uSzUHKy4vxA2qMNDkLWxCDb3SpeoIN2vkXAUcV?=
 =?us-ascii?Q?aJNc+oNwRMUB/q3GG+g01OWEDZoxECQpt+Ueo12V1BO8NnzGhh5ajXt54BXZ?=
 =?us-ascii?Q?uWSoJGIomBq0rCEwaojt+AvofAOvzmcDlo8ov1Bf1q84p0IM18WZpVZwHWnj?=
 =?us-ascii?Q?lTGIftLOq+yw6/cCHyXLda2bgi55nKpHz7T7Q9fUNpMUEveVRG33JmC9Ob3+?=
 =?us-ascii?Q?bOHNg/fEqL8stZ5tYbvXRYno8Kc59VNp3qZ7DCL9UOHq65rchZMqHyD6XPqh?=
 =?us-ascii?Q?XMshi62ga4B78efdAhvT1VyTqr6hiMBgbAhkf7NwaiW/sufJe9wm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 233c3789-7b10-430e-d8dd-08df193a0bd0
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 06:15:20.8222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HHbSG19ebCJOgkqX0o4VmbmjHGah1lGyiMVzEJ2oKg5Atx+5fW1Sdt09kojQXm7khoprw8zJPzD4Lb2d7Sj45XXhIBJIutiZnuCikSUpZBd8AW52rBD/nALYIAqyluPB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8339

From: Chancel Liu <chancel.liu@nxp.com>

component->dev is the underlying i2c device whose devres is only
released on physical device removal, not on ASoC card unbind. Getting
the core regulator supplies and the mclk with devm_*(component->dev, ...)
in the component probe therefore leaks those references on every card
bind/unbind cycle.

Move the devm_regulator_bulk_get() and devm_clk_get_optional() into the
i2c probe so the resources are tied to the physical device lifetime.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/es8389.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
index fe341fe56760..267806b72f87 100644
--- a/sound/soc/codecs/es8389.c
+++ b/sound/soc/codecs/es8389.c
@@ -1067,7 +1067,7 @@ static int es8389_resume(struct snd_soc_component *component)
 
 static int es8389_probe(struct snd_soc_component *component)
 {
-	int ret, i;
+	int ret;
 	struct es8389_private *es8389 = snd_soc_component_get_drvdata(component);
 
 	ret = device_property_read_u8(component->dev, "everest,mclk-src", &es8389->mclk_src);
@@ -1076,22 +1076,6 @@ static int es8389_probe(struct snd_soc_component *component)
 		es8389->mclk_src = ES8389_MCLK_SOURCE;
 	}
 
-	for (i = 0; i < ARRAY_SIZE(es8389_core_supplies); i++)
-		es8389->core_supply[i].supply = es8389_core_supplies[i];
-	ret = devm_regulator_bulk_get(component->dev, ARRAY_SIZE(es8389_core_supplies), es8389->core_supply);
-	if (ret) {
-		dev_err(component->dev, "Failed to request core supplies %d\n", ret);
-		return ret;
-	}
-
-	es8389->mclk = devm_clk_get_optional(component->dev, "mclk");
-	if (IS_ERR(es8389->mclk))
-		return dev_err_probe(component->dev, PTR_ERR(es8389->mclk),
-			"ES8389 is unable to get mclk\n");
-
-	if (!es8389->mclk)
-		dev_err(component->dev, "%s, assuming static mclk\n", __func__);
-
 	ret = clk_prepare_enable(es8389->mclk);
 	if (ret) {
 		dev_err(component->dev, "%s, unable to enable mclk\n", __func__);
@@ -1179,7 +1163,7 @@ static void es8389_i2c_shutdown(struct i2c_client *i2c)
 static int es8389_i2c_probe(struct i2c_client *i2c_client)
 {
 	struct es8389_private *es8389;
-	int ret;
+	int ret, i;
 
 	es8389 = devm_kzalloc(&i2c_client->dev, sizeof(*es8389), GFP_KERNEL);
 	if (es8389 == NULL)
@@ -1191,6 +1175,22 @@ static int es8389_i2c_probe(struct i2c_client *i2c_client)
 		return dev_err_probe(&i2c_client->dev, PTR_ERR(es8389->regmap),
 			"regmap_init() failed\n");
 
+	for (i = 0; i < ARRAY_SIZE(es8389_core_supplies); i++)
+		es8389->core_supply[i].supply = es8389_core_supplies[i];
+	ret = devm_regulator_bulk_get(&i2c_client->dev, ARRAY_SIZE(es8389_core_supplies),
+				      es8389->core_supply);
+	if (ret)
+		return dev_err_probe(&i2c_client->dev, ret,
+				     "Failed to request core supplies\n");
+
+	es8389->mclk = devm_clk_get_optional(&i2c_client->dev, "mclk");
+	if (IS_ERR(es8389->mclk))
+		return dev_err_probe(&i2c_client->dev, PTR_ERR(es8389->mclk),
+				     "ES8389 is unable to get mclk\n");
+
+	if (!es8389->mclk)
+		dev_err(&i2c_client->dev, "%s, assuming static mclk\n", __func__);
+
 	ret =  devm_snd_soc_register_component(&i2c_client->dev,
 			&soc_codec_dev_es8389,
 			&es8389_dai,
-- 
2.50.1

