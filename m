Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010065.outbound.protection.outlook.com [52.101.69.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51859442397;
	Wed, 23 Sep 2026 06:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144078; cv=fail; b=sOv7T/m/+wbCivDPuh8H1KpS1xBynyxncwrX1SbeHCEAgyLHLbMov7FfRtRpB+1NHjH9lvacG0evzPw5PT9NE12Ucgl6/YFYHLKecPLoBkjzo4ejqLS0tXxxnp+6GABUowWIKeNPhJC3qCJycMVcCN4KGu6WPijQNZwbbeJHY0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144078; c=relaxed/simple;
	bh=ph+xmPDxXn7XAYx36aB4qfYrM7ZqswmfvI2Q3HkRxH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sjakrFqVHU56uiGCBHT5z16+aQPpPteoAc9A4B2wsT1E+XUq26pv14TdC2mk3n3i0+O3oluuoMIEBxg1qsXk+EOLR2P6i3hftem/CfEXDxFFZxn9FjmoAN7U4yxMa0v2CegCDkle+/3Cuk69RkYU3hONXwt3+AQ/z1zHPRfDe/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aKZ3tg0M; arc=fail smtp.client-ip=52.101.69.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aKZ3tg0M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jvv5l97M/zeAJT8rNRHvmNDuidoxI4QdgDpJChnIk9XyaCuDAyyjhKCYOCHQ7ynX0OMIUYl+WOyry9zQwq5I+kc7kU2dNwCECbNwQvyUZpqbuJWafqgmuXUFEKn+SbtsuYXhpFccVrxyzyW0IeYk83JL5PriRP01NA/luKRMNh9cdOeR5q72/XsniVgsGQdJ74jKJ56835Rg+V0A2NfiOeH3v3k+tT3mV/arj93kV60gnaGuyzCvHmp548FH6xtCV2SEVml4J9AlrQTUMPC6NCYKMXRYrzoEkVr0FWvAZ+EA1+RsXyZLC2E+LGMC4y2VXZAeiik2Pjmc48+QLCB/Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJYhUgDr42oyUnZnvcU3j8O69ycorETAiANoBIvFIKc=;
 b=c0PvUBAD0UYz/3+F8f4w7Pp5AmAowQtyS19fCMYNlV5kpi3ZgW/2rmXanvixC/6znOGI2UE5nTtzOwccgJHLS8OrNCKqRZDJ+oYoZ/yCHt/j2XBp53DDQYn6AGrcDNOANlrF6cq7m4d4dRjJaaNFoESuuZ8wB7F2kKay2DrPGq1TbdTPN4AreSqGcWRrR6kxHeGfbbfxnhXI4Y/KGXLxMav1W5iqqljs8ADhnBRU9biIkrOf1xsyJWvPeLGWUoOkpVDgyOHQy+lUFjyuFP8JAiK++pouR8oZlA3dma86ecdgpEQVUBVv9u0/GJwFXVjziEKKgb57qu1ksLGPq3qglw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJYhUgDr42oyUnZnvcU3j8O69ycorETAiANoBIvFIKc=;
 b=aKZ3tg0MLQvM3Gvrfl6eNr8YK1mpeL/r6fdpDP8KSiHDKFnUaBCI93o2Z+/5x+NhyFG6dLaawtTaXoJ4lLxJ7fRUJ57bqVxlg8HooyDQJ+7IWx+N11/6x13dhG9Nhtwq3T73i17HVi1qMtHBkQNhlBaXIKZmCD4qeiEz0mL6EnoUsHMKN+51VtWM1lWGS0Zi064gLppMW+LguMpNckk1N6TpO86EcWwm7v/tbaV9QzDB/tXNEIJXWMqfPbucYsNVQVO3ahRiVkl+7ZqxMasYkp4/7Rc5saBuVbJ8z0naMmff8xCXC/89kwPX/el8DBWKz4g8ZDMqEZmKFcf9HRXr3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM9PR04MB8339.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 06:14:31 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 06:14:31 +0000
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
Subject: [PATCH v2 10/21] ASoC: codecs: rt5616: Move mclk acquisition to the i2c probe
Date: Wed, 23 Sep 2026 15:12:54 +0900
Message-ID: <20260923061305.4041197-11-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
References: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0165.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2cb::14) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM9PR04MB8339:EE_
X-MS-Office365-Filtering-Correlation-Id: 44c60662-b0d7-4521-1fab-08df1939ee60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|19092799006|7416014|376014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qJd/ib+JS1z2Ar3zrmdicSqyZWHpsTR9PECnLKtPzMtSx3Ec1NPFiRw0wKBOP5/RqvdTSJdX9EL9dY4AkI6UZcddhUfl+EpP+mFuebkS4i4JUeFC13UG0iGCbFy2vHmn5athp/qkxbLf7xZRkvbXRrHV0z22GxsFYbCNRYUiWSl5Zz/HoXM+KWflK4auCO25eziHPKR8k7tB4idH1YLC98rwbCV9K6d/P/6s0qvVK2RpDmeGJiZwCmRDH6vO8JM7BxIeMjqpIdITMfUgOB9ZDktlPUg7T5FoiMCrOIznO9LlprHySzyQShi0edRMMpZ/y9vO7umlO9khxw+Glmuw7iqm/7uQBtJDj+FJE7LlK5JSgUOQARVlRkUvFX7HUWT8aIhJes+yzMWk137OQvXkI4GJukGc39JvTAeTh0RRQtFc6kLM4xqZUGHd4zSXbQKu9b6AP/mSuKJ9+H4Y465Hys+W5A5SonDw/tQcV6+7VoOefOKr2QrWi+XFKgC9GeQDXeSgPHj6rRMGJhkuHQBQjSgMlyzgR1tZ9aTPgnBCT7CnJylmIEJesZxRYaTCnx1njRDVuTJIpjSTh63cj5q8VI6wAem922tENGv475uS0ClqKLhQYlmNBjQHyLD20zld1HxqtVWVi5Hisd4PdDkfCIYoVOooucm7CYVchSW/dRs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(19092799006)(7416014)(376014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t8x+P8Ui6a92oed9hJnq1IMkhFkdhrCP35Q4VO6UaR/tdi9WCZbLQe9A0KLu?=
 =?us-ascii?Q?i8fE5YKiFydEHubUCCm/F+KZ27rkwpRTWh7v9G7z3Vhdq5p6yQBcOe/Hlqdx?=
 =?us-ascii?Q?XLpZVB1BM2Fxfklup4t2Y2eNFiqpu+8+TJ7Pz11p5ZKi+KskeqAUj85oKNmW?=
 =?us-ascii?Q?JwpOE0L5vCGkahPHel++XhbXqqsyl2wzsPXlOzAUMU6QgClIlz74LFPQKQo/?=
 =?us-ascii?Q?dySyupR9PTt1KVtgBU/kxoILLjebGjCYjHWmke0BWI60sVeCbyju7XlXg/Zw?=
 =?us-ascii?Q?Qp5PpQ8WymEOOb8ob9SqQz1J59rVSfw9ETPIcAC0h/CqoKC89PkqfP6+0HlP?=
 =?us-ascii?Q?P6FtCOxpi+hjvGcsSjqZQJiMfjlIIuOe1x89Pf+w06pK1G0CbUCvrCxH0AJR?=
 =?us-ascii?Q?KUqvY8QuK+4WEIVvj9UAN/Jpuu78m5uxHwmyFwZv4+pKzadQY9CQ1X/Z8/o+?=
 =?us-ascii?Q?19yE/m7jHb9YupGZew00asW++HLSAX9sSt7E6pdZQTQwmk34VrRAO/WYH2qP?=
 =?us-ascii?Q?aI+j8Vw2caH1h8l73j1u2510vu19SfW4sPsDx12yy1uS/LXua8PRqR3XYopn?=
 =?us-ascii?Q?0K146pHQyi9EqxpxJhKOE/OaMNmWouxICE+ru3fX25vS0tiK8wqOkjP5FBAW?=
 =?us-ascii?Q?vIDxPTCb5oyRH2Tvqu3Q7d3nX9DEt/zWL69KlF0obuLBcOZnhw9J7f/PugfK?=
 =?us-ascii?Q?tGZXrywdjjxHhkWv6kZOQBJUmNGex8FUav8AHPe4h+JGJX0OuHd6UARL6DSh?=
 =?us-ascii?Q?sM0lVaEhxoUrJhp/I2yZ/Xi7d00F18uohOhDBiX2raqNv0udJr1rCjOav0Ig?=
 =?us-ascii?Q?4R1BrlvyLY6jOYykg3QYXsLC5Suor94DrLiLOMYFwYHVa4qsb4l8ryGMqUNH?=
 =?us-ascii?Q?2cDBd5tJnKtVFQ/lQxDBioRQT8grm5EFI6FUvpQ2ba2VBYviJXCJC1dlNp2m?=
 =?us-ascii?Q?MRlOk0ETfHyLxrz55UYyJWfhZ6T59i3GkiPmTWUC6jsIFZLpIz1W5B7TbZD9?=
 =?us-ascii?Q?bokgjp4BUEI3m/t2SGkFdP2Z6Ea6lOyr+w2vRhybcOwZGOsj5eTd1cbuJvxm?=
 =?us-ascii?Q?IDu8tRS5QpMA/0wgg0hA5pF4kSFd5yhjf1OyoDLc4IWP5w9aAB3dKix5UtVh?=
 =?us-ascii?Q?Q2OBO/MvD/DHNA1FpCa32xl+K/7ZMnWGlmboTPBGXQIvHbkLG56q9bSdcQEm?=
 =?us-ascii?Q?SclZPkPdQbTQue6Lp7jtaNsmZtCsaKpBGtYGFGQDiXZ7jOfiSvP0RwRCy7bx?=
 =?us-ascii?Q?jLevGCvIghEKfUvCu9FxqgL0PmIBJPOqXZXxG/77O4bls69WBFKpwIbQ07Sf?=
 =?us-ascii?Q?3T8ePvl0GC6/Yp3kfdXd2qGC37ifnqykYUB7oMR5+ns2MqIRILg91+cDDnt3?=
 =?us-ascii?Q?KeIRCanDfzB5ft/bFe8dLDJo0B3Kc+9WksNk+SIuYRQQFY7aY8cb3ptO2Fxk?=
 =?us-ascii?Q?CQQYwSKfwqg4KBk+O26E60H/P/qA11OP22qQmPLhfpEbxy+yHWMQbLxe7V7S?=
 =?us-ascii?Q?sIIuGo8AcebwwAH/K4bgjbCrRbW2jBw+GpQ9UUPya9BOED4bJb/iU3vFutzb?=
 =?us-ascii?Q?WQBRvTxI9WIzhwWBUA8d43y4fBewkXvYVxHOe9IHQVD5wUCywidlVVYjOvGM?=
 =?us-ascii?Q?JvepdwUkBui+tO29tjVKsvhcoiwR6qNcLt0PSAZ5BVfM1rXbRrQzWT12gIZm?=
 =?us-ascii?Q?+YvImNI9nl4FXbi6OArJZrsWqtpoQPz0NWFpVwdR0omDLjaCoKOlFAiRyHG4?=
 =?us-ascii?Q?79fHX12YtyvqsrGoi6P0g90kcYlwBf5P55dP+lxSHeSyinvHUOK7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44c60662-b0d7-4521-1fab-08df1939ee60
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 06:14:31.4291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CERW7oLTPXKLfaiMUHa8klmFlHDQa2FyX+IzxNJXrX+xawHUHA7LweXpSH8d2JesMLY/en9407ETxjmtltRWfD/UtgiDO26N7DW5TZITicOmNfmD0jyyrQdwOp433eyM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8339

From: Chancel Liu <chancel.liu@nxp.com>

component->dev is the underlying i2c device whose devres is only
released on physical device removal, not on ASoC card unbind. Getting
the codec clock with devm_clk_get_optional(component->dev, ...) in the
component probe therefore leaks a clk reference on every card
bind/unbind cycle.

Move the devm_clk_get_optional() to rt5616_i2c_probe() so the clk
reference is tied to the physical device lifetime.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/rt5616.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt5616.c b/sound/soc/codecs/rt5616.c
index 3f9d97d04d48..e30e3b563c90 100644
--- a/sound/soc/codecs/rt5616.c
+++ b/sound/soc/codecs/rt5616.c
@@ -1222,11 +1222,6 @@ static int rt5616_probe(struct snd_soc_component *component)
 {
 	struct rt5616_priv *rt5616 = snd_soc_component_get_drvdata(component);
 
-	/* Check if MCLK provided */
-	rt5616->mclk = devm_clk_get_optional(component->dev, "mclk");
-	if (IS_ERR(rt5616->mclk))
-		return PTR_ERR(rt5616->mclk);
-
 	rt5616->component = component;
 
 	return 0;
@@ -1357,6 +1352,11 @@ static int rt5616_i2c_probe(struct i2c_client *i2c)
 
 	i2c_set_clientdata(i2c, rt5616);
 
+	/* Check if MCLK provided */
+	rt5616->mclk = devm_clk_get_optional(&i2c->dev, "mclk");
+	if (IS_ERR(rt5616->mclk))
+		return PTR_ERR(rt5616->mclk);
+
 	rt5616->regmap = devm_regmap_init_i2c(i2c, &rt5616_regmap);
 	if (IS_ERR(rt5616->regmap)) {
 		ret = PTR_ERR(rt5616->regmap);
-- 
2.50.1

