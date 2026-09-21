Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010032.outbound.protection.outlook.com [52.101.69.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E503481FD9;
	Mon, 21 Sep 2026 10:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987686; cv=fail; b=kzfT3C9QOY+F0Kq+/7uW6S/upZhq0R1AiK5SNGZ1ZQFoOpU2Ae0T4MNch4z7sE0eDFtXB2fAxE2u5mdcLPFJavIxEP1h0tbNZPUlzHLeemjfOGarYC48yE2KdAcdcWtsaT0RXNZeLK9w4l5dUzQLB+1kTxJGBhsY8msr5tUsb2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987686; c=relaxed/simple;
	bh=ph+xmPDxXn7XAYx36aB4qfYrM7ZqswmfvI2Q3HkRxH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M/luEHlBBIPgNOnYCNU6qwOX+eQtt575Y73b1DNFjBWBaf5OKSi8fbH4J//9DKwzngXgsWvDv6UMCUWLNWAp6MkQjexemz17t9kXvlxFlap0YAZTQLQ/lqNC+hzmiinpw+HX9h1BOWTT9GrfSqPcvQT7siSicgVQpqSqah7HawA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Qd8uqnYy; arc=fail smtp.client-ip=52.101.69.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Qd8uqnYy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aaGtE8oTKPj23Ur2v/ZhXlqpZccMWP5I44OVaGey67bvuWvH55q/AE3xJ/kedMXlwRza+5vr2c9HzDSscLs8QTZBZAK1w5OERwbep5Apvy2Hm76UFvRyirVtwDG2gPz+DXgPw0od78GNd09ATrq2zgEaPleUQFU2NFxNMhjDEUEM1h9GR+BT5KeC6qXGz2nsQ71gVng+/YwABSFa0jl77LLITVp4pO0F0DffuM1eN6KrjWw1J5jYx8baOrvOQ6sdoahk38NaiWdaabTesOn9Hj6oUozZb54wL3NNTAH1mWl5qlLKwbR2vIUhqCwYF4Mrl5JVzciX2h/XaMvFwt1gMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJYhUgDr42oyUnZnvcU3j8O69ycorETAiANoBIvFIKc=;
 b=EuZBazo1C+aCQD4mHAdVi2D1AVHG2bK1PBd5dvWQolarXixHcvkJbFL7DFQEY0NsALVwJ4Wceifvym4aac98dY1svKok1Yin7iwgd1eh+R305Fz5T7q7knqK0ZC2PcEdoqw7pKhlPWDGwX/0IS3zVxyVhfTWi6inRNDNq0LNa13cS6ZsCfQWmjgFGzt7WUPC+yRpildZ9L8sxSIlrEH1FIqNM/liaoWZLJCYXZfrY8VKhG5eygWzyV3k64L/8WQuasTXU4zDBYqqw7InI0wSuluu+8Ouf2XoE7HzfWGUC+a4v+FNAMbJoM2+TcQqWxdkXJpB+JHcwBz5lWTCGLocxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJYhUgDr42oyUnZnvcU3j8O69ycorETAiANoBIvFIKc=;
 b=Qd8uqnYyupwRD69rTxHcxryJFI81AscveuXv2JmWYUoguojHCWdQlUSfA3fuzV+YG7SUAi8gS7X9vr2nGwxQHIZ3u4GJdkP1bFzYZN9Jc8Op1Ya1uwtIr8ddD9YBpXxcKs8GgooUSHVUjFMqCASfu1Wk2NtFHI6Lsj/JYKjmvGoWqUFZoxacNs7J48FAp+O0aW/IBZe0eGLBRsxq+UzQZ4XJodImweMYGOANcQfHZn0N/XG+z6j2FgiyQQYLP3c17RNo8gfX0mBWRX/EaDe2SmHnlqWAL3+Vly+tCjs12Wxi8dUnCpspxg5zLpIod5rvhCncQJJ4hl3AQ61xIJw7KQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VI0PR04MB554873.eurprd04.prod.outlook.com
 (2603:10a6:800:361::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 10:48:02 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 10:48:02 +0000
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
Subject: [PATCH 10/21] ASoC: rt5616: Move mclk acquisition to the i2c probe
Date: Mon, 21 Sep 2026 19:46:29 +0900
Message-ID: <20260921104640.1941554-11-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
References: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0084.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c6::8) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VI0PR04MB554873:EE_
X-MS-Office365-Filtering-Correlation-Id: 20500a3b-e81e-46c1-5e32-08df17cdcf53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|23010399003|366016|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jAJbuaR/OgTFY9tQABOgD1MJvIWU/SpUfUJ2AFa0sygG5//t9QLfFG9Yq3MooRHP/NOws3Sz9UFjdz08F69M+5wdhPaqBGq4IJsrpQ/z5KFOJAAKQY5MNzvFCud8/L2mym3OZYallbRkAR+NIR/TC6cI+Fizk4+kZw8MZzt650p//4/ew/cYk8IjBrRClkGFztjlQRO918PcE6nHc6PCf0MipsoxRuXnXxiWIbFxeaxYpx24kP6qaLfhAAjp0RuQkx05Y9x8ztP2rFvR6vsrUodrliOxJaznarBt88FLsFTs1ivyMZRcYoF9n9USM0aQGDbpyB4teb8Xpjo7xeFEZ3YitR8PeWR1ajmCizXNEKQ0jr7iyrSc+ArxrXjLq8bN+cqleAI8Bo0ST34+hPN7LnqZdEPB1O5gicECiLZTNPrNtIGWWuh4dxlhvXzl1pRhmE6c5q3APFGl9S11FvU/I/ifn55VW8Eig2mKylbwW0R9CsRX/gduv52AOEpc+nq/no5zhOb9uQIvvMnEdITNDxeXwlro/ithzGYGV245kHT8ma1LYNBv+sN/VywT3OWxG8kSBMfbs0f5wRX5TDyTatbcoSxvb/KnEgOgH4Y+xx3KUjQpobirNT1gJKqnhdb5QqgmwdejRVRY+PJlo/sXnvGnIyrz18q/1p7R+76WZ80=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(23010399003)(366016)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YS8Uk42V8h5oEObMKSOBRuXB1chq4fzRNQRkzoIclcNuwujcamB1h74jVrRa?=
 =?us-ascii?Q?3RNh+/KktJPBukkk5jNDbiJo94jYPxBbKcIXmGsIXB9wUkXukWmxOznPu7f5?=
 =?us-ascii?Q?Za1MXl5ub+L5zV1pod0htI74JglxDJAK0EOSMdw6eTUdBrGXHbONUCEQtiTl?=
 =?us-ascii?Q?nXvDJYc47KU5VxbTuoLa0oeiN3+6JPcQaWVdKkCNSb+nzvXnK1+zBSFLXKBE?=
 =?us-ascii?Q?gq3+o9qoUTe2mwgqYI8isskAT+BRyOZVpYs7es327iywPnpqFg855aLN9LfB?=
 =?us-ascii?Q?BYYDrWh81fm6ZbUrFjQm5vcHUGmbMo1Y9pXTqR+fKZky17h9vBJ76Pbfa4m9?=
 =?us-ascii?Q?oWk9xNdbxufYKK0tluqTr/Aac8yV+TAn6cKTe7Z/kAJ0FNhReWGDTw5tXgCw?=
 =?us-ascii?Q?YQkbSPf7MznvjiD2wFglf0qWrSlAIbERuwngXdGUKLbBjIz9HdSQw3oEEiZN?=
 =?us-ascii?Q?LzD8UKT5uI7Z27Vf2Ifbe8uLckGLclz1daB+cbKamPAxapJuaahAmBLq571n?=
 =?us-ascii?Q?jlcA8qK2H8nbF5Dtfp0Yg0I0P0BjDKp6yAWRJngY6VCyiv/gU1ZUAJAtRp+V?=
 =?us-ascii?Q?NR7zbBRXsedqKd2vi5+dfIqDW7djGaMrhAeQ82YJZnJ3skIT7AqPS7B7ixFx?=
 =?us-ascii?Q?bJnuDVamuVDfuJKutyTq1YaVYu7OJsZafFeX/4FUiDi02OYPGVoREM8KSTe+?=
 =?us-ascii?Q?cy3JaokLl7fiTUXSMo19y3qvn4Qcol4eb5VeHMb+eOg1BlNDe9QyIXGHG8Y1?=
 =?us-ascii?Q?jLziAonVIPwPbWsJpD1qyEJHp6ukJMJFUBMx3v34OQBUXqMrDqPOus6ZSWqe?=
 =?us-ascii?Q?WnpsbPBLkylBqr0/cUdA8NZTPcFF2tO8kBBAMQbm5i9n0F6hcHBzhymSfVFe?=
 =?us-ascii?Q?CMcZx0DDwAxtoqKscmVCaX6C3kE/dwgvBkJrHY1JSEDl4TP+8i+WRpRuxsL4?=
 =?us-ascii?Q?m00gqrx0WS231uDn9CYRcbCngbXFV/5Z6j7/yg23O2p5bPcztFaeg33EEIGI?=
 =?us-ascii?Q?KfCbQ4DsGD/iGlcWJVvJtcEyn/yizS8e2AM75IhGdQeD6Wdkb+0vgLmKLor4?=
 =?us-ascii?Q?2QOEwZ8mdhcrYK870tpZsBG9NtXo8P+85nYYGoSZ24P7pbnpCORWaU5VRpRU?=
 =?us-ascii?Q?KmwAUtq7OGwM4XW60XvvIDfygz/+VuoF/3P6nFZ1xMKX37AnDxAVAIl1wL7R?=
 =?us-ascii?Q?3/ss5LjOMp2iORXHIFpBBy6dRYGCiDAHSYbX928TsZOioefBAfiU+eSeeome?=
 =?us-ascii?Q?l8QC0VomSFqJrd6LnuM4vwEQ4kKYEb95Dipx8J8fElaygY+9qF/XS2k+Ixdc?=
 =?us-ascii?Q?vl6UMgZQCA2ZR6BUlRNysU/0m7rUNKa1JtKT/oo0a6Q8OdaHNyvxS1btQB1n?=
 =?us-ascii?Q?/SYaFv7jl9WTCE1GRNZp6NfSB65e2gkQd3A0/Np2drS26o3OBqrk7KyhbYqA?=
 =?us-ascii?Q?w0ykjEtmKp8LA5Jvs15flEZxlnvpT9hnH1rQL8Xw9APKJ3LPo2t36ec2asCI?=
 =?us-ascii?Q?x3pzHwiF2V46Adyk9Xnyy5JamCQ+hjRD71//9/l2N5MPvXjsS1eIUVMF8C5/?=
 =?us-ascii?Q?PWI7Di8JLbWjRHZnBZN5bsRc+nMVsiUpqFdsmSoVtEAtTYEzYSilz+2d9lDx?=
 =?us-ascii?Q?5jlJWnEH0F2wkKqNFqxCQ55OCDWXxTWJbrqCLe9/oeRLGT9/p4JSoEiTLFRC?=
 =?us-ascii?Q?D3RIdg07DnlR+rbuaLhnaFa5YDS02qlLNZmWLE32/xoPtyJpA2LnvFbfnD6j?=
 =?us-ascii?Q?Pv4ydxmkgnp0QmCCH7BfCAwXcN8/8zerX7ahhkz/eDujOmXSnkr6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20500a3b-e81e-46c1-5e32-08df17cdcf53
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 10:48:02.5398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q5qJp4fqQvSXTTvystLhvz03lTakFFiL+FKQYErw9N5X24kZYS91/A0tFcRpaJRGUoH895XMYuJ4rWD3rint+LCxWmJv9iXbAmI59BSJerEo6yUBSgQxcra38c/2W/GF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB554873

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

