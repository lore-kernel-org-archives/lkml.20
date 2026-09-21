Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013007.outbound.protection.outlook.com [40.107.159.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9F0481A99;
	Mon, 21 Sep 2026 10:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987644; cv=fail; b=o56gw7izHJVvTnRpNSuoHbUkwqu8cEP7X75+aHLNGKcs8hIuqc660MVEDww40v0KnQbhYXvWuFWLIXUNDDjNp3bh5NCGbgO5di5B+N5mFpFA1qxnwB34D2W5Ga+Q/uN+dRABqLgLZpHfKBG73955ukUw1oqo5MMTnGkg87ze1bM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987644; c=relaxed/simple;
	bh=XP5kDniofYKa/9VQ7QhRDEBhaOJNuAK7XrVXn9wZjdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kWAx2Q+dQqRjKJWP0NUfv+fr7g7cHKm54cW/kpJsy+3vYPjqRtSpe4qrvrzwhMJlB+gWCSOljf64hjiXoi53BZMjYFTCGN/2biYxnUSMYiK/nYAadjltMjkSXuMEV8q+B5O2rytgnyFu6/ucesv7+KcrbXv3+Aqa3NNJSDJACfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Hj5ysARA; arc=fail smtp.client-ip=40.107.159.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Hj5ysARA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ydGd43OCXCmiYhRX/152jOa7ftTvi4RmqPyJembuwKT/2iX51CnSOtxFvo9hEsNDhfkjFrSdq8gni8OOLDhl2MfnVyU5ULgBRn/qB+A+U1/ab/HLdDrYHoOoaqcfrul6r5aDuHmEs3xye50pOtuF3wRMEs/dJEWnd6wZ7zOcvSA6Jlq/c0Txgaix/L0K8sglDVQKERKfO6IsqKimD4Pu+R6X6zXiM3MDJM4Vvp2xRwRlC+/K5b5rsVA30VytNcu/fAolCID+oWKVEIPGq5Rr5CosqB77vTFgsweW7VlJQHatJXMD8Ekb+V/gYXoMcsNaYNiNEFjl2jE2pD/JOaw8Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcavGUxELXPW98RJksf9nLoEG+k/mtu5EkghU1zE0dA=;
 b=tpMzmZGuHKd37IX1h6NMNXthXXIVFIOwvYCO73buvumyYuUEWIy0At2stDfxIBUopJJtdPV82/+pE8IXMrNMm2sMLADR+18xHtXLZZQboLY+YXyDps0td2Eg/MXoG2xKa9KPGE0U9eqyQkWaEAopBukNLeGTI3xLuGEy/Kn06cJvMwFn6ZSrlSG1VC7Av+VNOxveTZTKX1qSFKEOU6KkuV/7Z2EtYG2vqnSvDyhTVz4nU/5QxJGQOTYLrwpTrudybpGx23ZSBvRLJTHFtTqu6hLX2+xC2fztHEVpTi3CwjHtslABPcELfB8iu9RPoS/ntY+5XGi5vnYvgfeLWJoDZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcavGUxELXPW98RJksf9nLoEG+k/mtu5EkghU1zE0dA=;
 b=Hj5ysARAh4XPf8aArRn4InvrQWLf/lQWN/ikexMPC1msvBAunKRODdkFfLYpaXx91QPwOhGLYSS5A1k7MfVGsw6saxoFC0QoRhJYaF6geAGlmEclaPCGLDE8YWlLfvgMT0s4IzKjHnkb9+xQKTqkCRUmYfg78T+SrFntugFHwC/loQ75TLD+TaXx/fBWom7tDcysb0/QNX/eIFUqFbD6MLq5+7/oFf4L8KTx3eMjQoPtCIHuVrss66ggd8NhPcLqut8io9ybAcIAjYNETTkKrPn1lSXbSHVI6pMXD5e0lQ1IBX35h6BxEqacx4uChZqMH0CnBhZ9oFf8jdYWs21aAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VI1PR04MB6862.eurprd04.prod.outlook.com
 (2603:10a6:803:130::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 10:47:18 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 10:47:18 +0000
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
Subject: [PATCH 04/21] ASoC: twl4030: Acquire board params and hs_extmute GPIO in the platform probe
Date: Mon, 21 Sep 2026 19:46:23 +0900
Message-ID: <20260921104640.1941554-5-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
References: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0167.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2cb::17) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VI1PR04MB6862:EE_
X-MS-Office365-Filtering-Correlation-Id: a078f764-b4d5-4baf-a648-08df17cdb4cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|19092799006|366016|1800799024|22082099003|18002099003|56012099006|11063799006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	jZl+/vkNCVzaW0/IFcC6VaHt749J3tAgYj1sW7IP0Q6FZqQL+agyqdl8SzR1IPyYzXqp8u2cxLoddV5EYZwPNzIM/hIWsMMjO3KRudLf51ZJRfnjAp8WNfqMum/Z1sIaRzaupIZAjwiUIMkJWxQ2FY+C3SdBSMacUuj/TtJI5tCRN9E9lFMtA6Ob9MNrEuoF8yIr2DKSfsxVcUU8lfVK2+9YrUCbfwStWieooyAv8bJyvXxAAYmQgKrsYGTw1KM+0fy69Q7ZiunzYMBQjS49wPrnn22mAmGWBx3JMUiR/jYVMK0QR3H+GiXsnRgdfEz3RopwemeA7azlysTSS5set+u/IyodWI8rFteINUwRkfFlL8/f7iLTby053G0CmYr8hZj8PL+pu79x0/PzpGNhjFecLZwR05p4YlR6f8fs+x37DV/Bd9QjjxYp23QpvobNAes1BXqnBClFw6wtrJwLLFGUM8DsxQ/O0LZoGtEl184UhAvFp3bqrfIN7WyDn9nuFmSRj4xiyolj0Quj/96tmB0MDgAS9lND1Danjr1YFp8IVgjoyQPSHRY8goNMvQqPQI5ppVmKANVXr4Jdl7xrmacW5Ig1w7jQ1ru/CvKLnIda/GvLgWrPUg5mpw7ba5o4FL+PmDMtB3MuxaTwr1niwRgjOJnQrJYJwtMFXgOs7Y8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(19092799006)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VTAQH/gjr7RAtNa2BSqUcgruQ6gKInyWlv/rVqZyRq9OiqF8IN4zheeHVwfG?=
 =?us-ascii?Q?3JmJ7wxv9TRlNn3gTzfU0F/4WDQbuC0pTR7bXr+zO9RgJccd59taLHB0XUPd?=
 =?us-ascii?Q?HDSlEV97L1XYlhD6RM7Jedfg0jS4SUHNpFopzBcSlHSRQ65qpf/E+mOjrW+W?=
 =?us-ascii?Q?1cF1hk9OyQ82O7HQPy9rHk8mZN3DqVrSKxCBUd0i1PjQvlDiuWQSqDgm+ERa?=
 =?us-ascii?Q?Ad3tEp+wKQf/3cpYo5KH5HVqCSvSr/85NKqbCad/s4DLFUc/+71cjPg/+Dk+?=
 =?us-ascii?Q?Gv91jnuwmxX5m3BA4B5lGGujcja7gGQOOvWPJFtQUcipHPVoG7S2BTfOj1/3?=
 =?us-ascii?Q?5972DBz/kGmgjTfgzKatYERreQn5kYaYhrXDbcoV14Tl2GJzca9395emYkfo?=
 =?us-ascii?Q?0sD9OjZHMvDZd0Yo7KXrLoQwxxFE2SUj5AeCOlkgjSJ2LMI0iMoPyD5YU0p6?=
 =?us-ascii?Q?0OCrHtf49lNw7SivwihH02Z4NMp8RhnmYbaxQq5ei11JzaQLDIJLNo0+2SPy?=
 =?us-ascii?Q?d9U6kJIIjnrLBlqNhW/f8Isz0ZOwk+N9TiXVsDphmbyWGc6ejPh7nlEsZ7Mb?=
 =?us-ascii?Q?4hEElZOp4oQ8jLGOSsTUKOEP7d2SMALHjU1lF35sYGgJUrDhfksCljraAthN?=
 =?us-ascii?Q?17dIUaF/v4EqCyWxUH7C/0HawZ6Kp4HyePyyGhzQonEfVDVZNavaCsoW7wOM?=
 =?us-ascii?Q?lABJcyy1SCsOc+xhmoA4ZyORZTIjQuB8euMpYcuwDXKKQ10Vh2OxcMZ3t+B8?=
 =?us-ascii?Q?hLUcYLipwNdOAmpKmNNliwiXPhRfuKbSKUOTegZ66E5YM9athFAuwmw6uKcl?=
 =?us-ascii?Q?kKMjt4T/4qZEgAoyLKVh1tLDadpDiYMXwzTEKHZyru5Semdi3HVdqclkNfnb?=
 =?us-ascii?Q?DTA71DVSHCgc0oZN+5eibKvhT80JN+JxbVKkWBZt8tDEFSECcUO7pVgskYgn?=
 =?us-ascii?Q?ssCYQ69iMREESYozMgVgehAgU5uVXDG+r//ZmrpA6L4h0f6NpH9xruLIZyh5?=
 =?us-ascii?Q?cacKUjoLxxKdBF23SjJpoTodnSAgMyi7GjbDDhzG6TdMUNWPKdzJT7X5l0n3?=
 =?us-ascii?Q?jP+5B5nlktbLx10u5yClQ0yhnL3jmXDcqBA6su8omvLPbNVPvmFKd0LTzx39?=
 =?us-ascii?Q?CdGM9459WpKZFqST23Rifci4Q610G+m6tuYCqSIhmReDnK2V55z4b7BLHzVP?=
 =?us-ascii?Q?cjpuhUV144sB5CpztBJpUO3yH4GgfLCVJLiC1NFPuB/7x1dqhJGyxc/uwL+l?=
 =?us-ascii?Q?c+2EMks/xkJhz3Bk77RVFjM5BhSchQUX3ig4TYKk9Ny5xDhy5MjSS39XUh29?=
 =?us-ascii?Q?HDtk69mtcQJQl+CPOFoDOfohewP1hRXLXpMLQobeu1WSWyTgdXVKNND3m6Zt?=
 =?us-ascii?Q?Y4urlZ8/hX/QHz85Cn0wjFZWIo4+Mm6az26pvD/HcXrWSrx94z+z5r0biHrM?=
 =?us-ascii?Q?lNVeQRsp3Gs13s93uge+e1aS2OG7JGVyd7sMOk+wrkT/eCdFDx3D9ngzgGaQ?=
 =?us-ascii?Q?isGi3PYFUIdlkCWTcGOZo+i8tBok8Waxd8E5kRbT4uL11essWcrBGe4vC6Xn?=
 =?us-ascii?Q?RdjI25VnM1ck+7Ycq8XNN3c5iJ0IGooIkb+UXDKo6G4IXZ+Rnp2JuieppZE5?=
 =?us-ascii?Q?uQNengCEcSgns9DRkkEL932UHqpGgdjOJt/OFdI9sA5Sedxl4tur0B/GovlO?=
 =?us-ascii?Q?27uRaUA+m9gKInelS6JoSXlAwcWQ7CBsqpfFwEJBxK156EdEFRJ9sF0XS20G?=
 =?us-ascii?Q?MHeHHFyVcGLpBB+2afTR025VNvHr2rhqFWSsg4Fg/BaZclbPzhtX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a078f764-b4d5-4baf-a648-08df17cdb4cb
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 10:47:18.0659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4OsifC+X1wyNvIf/QCalEbXkPNK+9UPeR5NrlpgIMOn6YF3putZ4/4K4OP8IGsAQYGPqMw1w1tkEOREuqao02MS3t2M6sOo9UoxbOTYhYVz5Xf2QPJi2VOVjQPzFnyUm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6862

From: Chancel Liu <chancel.liu@nxp.com>

The component .probe/.remove callbacks fire on ASoC card bind/unbind, but
component->dev is the underlying platform device whose devres is only
released on physical device removal. Resources allocated with
devm_*(component->dev, ...) in the component probe are therefore never
freed on card unbind, leaking one copy per bind/unbind cycle and leaking
the hs_extmute GPIO descriptor (which can also fail to be re-acquired on
re-bind).

The board parameters and the hs_extmute GPIO are pure hardware/device
level resources: they only depend on the physical device and the DT, not
on the ASoC component. Acquire them (together with the driver context)
in twl4030_codec_probe() using devm on the platform device, and hand the
context to the component through drvdata. Their devres lifetime then
correctly follows the device rather than the card bind/unbind, so no
explicit component .remove is needed. The component probe keeps only the
codec register initialisation that genuinely needs the component.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/twl4030.c | 63 +++++++++++++++++++++++++-------------
 1 file changed, 42 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/twl4030.c b/sound/soc/codecs/twl4030.c
index b986ece55d5a..442624cf2a31 100644
--- a/sound/soc/codecs/twl4030.c
+++ b/sound/soc/codecs/twl4030.c
@@ -212,21 +212,21 @@ twl4030_get_board_param_values(struct twl4030_board_params *board_params,
 }
 
 static struct twl4030_board_params*
-twl4030_get_board_params(struct snd_soc_component *component)
+twl4030_get_board_params(struct device *dev)
 {
 	struct twl4030_board_params *board_params = NULL;
 	struct device_node *twl4030_codec_node = NULL;
 
-	twl4030_codec_node = of_get_child_by_name(component->dev->parent->of_node,
+	twl4030_codec_node = of_get_child_by_name(dev->parent->of_node,
 						  "codec");
 
 	if (twl4030_codec_node) {
-		board_params = devm_kzalloc(component->dev,
+		board_params = devm_kzalloc(dev,
 					    sizeof(struct twl4030_board_params),
 					    GFP_KERNEL);
 		if (!board_params) {
 			of_node_put(twl4030_codec_node);
-			return NULL;
+			return ERR_PTR(-ENOMEM);
 		}
 		twl4030_get_board_param_values(board_params, twl4030_codec_node);
 		of_node_put(twl4030_codec_node);
@@ -235,21 +235,22 @@ twl4030_get_board_params(struct snd_soc_component *component)
 	return board_params;
 }
 
-static int twl4030_init_chip(struct snd_soc_component *component)
+static int twl4030_get_hw_params(struct device *dev,
+				 struct twl4030_priv *twl4030)
 {
 	struct twl4030_board_params *board_params;
-	struct twl4030_priv *twl4030 = snd_soc_component_get_drvdata(component);
-	u8 reg, byte;
-	int i = 0;
 
-	board_params = twl4030_get_board_params(component);
+	board_params = twl4030_get_board_params(dev);
+	if (IS_ERR(board_params))
+		return PTR_ERR(board_params);
 
 	if (board_params && board_params->hs_extmute) {
-		board_params->hs_extmute_gpio = devm_gpiod_get_optional(component->dev,
+		board_params->hs_extmute_gpio = devm_gpiod_get_optional(dev,
 									"ti,hs_extmute",
 									GPIOD_OUT_LOW);
 		if (IS_ERR(board_params->hs_extmute_gpio))
-			return dev_err_probe(component->dev, PTR_ERR(board_params->hs_extmute_gpio),
+			return dev_err_probe(dev,
+					     PTR_ERR(board_params->hs_extmute_gpio),
 					     "Failed to get hs_extmute GPIO\n");
 
 		if (board_params->hs_extmute_gpio) {
@@ -257,7 +258,7 @@ static int twl4030_init_chip(struct snd_soc_component *component)
 		} else {
 			u8 pin_mux;
 
-			dev_info(component->dev, "use TWL4030 GPIO6\n");
+			dev_info(dev, "use TWL4030 GPIO6\n");
 
 			/* Set TWL4030 GPIO6 as EXTMUTE signal */
 			twl_i2c_read_u8(TWL4030_MODULE_INTBR, &pin_mux,
@@ -269,6 +270,18 @@ static int twl4030_init_chip(struct snd_soc_component *component)
 		}
 	}
 
+	twl4030->board_params = board_params;
+
+	return 0;
+}
+
+static int twl4030_init_chip(struct snd_soc_component *component)
+{
+	struct twl4030_priv *twl4030 = snd_soc_component_get_drvdata(component);
+	struct twl4030_board_params *board_params = twl4030->board_params;
+	u8 reg, byte;
+	int i = 0;
+
 	/* Initialize the local ctl register cache */
 	tw4030_init_ctl_cache(twl4030);
 
@@ -288,8 +301,6 @@ static int twl4030_init_chip(struct snd_soc_component *component)
 	if (!board_params)
 		return 0;
 
-	twl4030->board_params = board_params;
-
 	reg = twl4030_read(component, TWL4030_REG_HS_POPN_SET);
 	reg &= ~TWL4030_RAMP_DELAY;
 	reg |= (board_params->ramp_delay_value << 2);
@@ -2163,15 +2174,9 @@ static struct snd_soc_dai_driver twl4030_dai[] = {
 
 static int twl4030_soc_probe(struct snd_soc_component *component)
 {
-	struct twl4030_priv *twl4030;
+	struct twl4030_priv *twl4030 = dev_get_drvdata(component->dev);
 
-	twl4030 = devm_kzalloc(component->dev, sizeof(struct twl4030_priv),
-			       GFP_KERNEL);
-	if (!twl4030)
-		return -ENOMEM;
 	snd_soc_component_set_drvdata(component, twl4030);
-	/* Set the defaults, and power up the codec */
-	twl4030->sysclk = twl4030_audio_get_mclk() / 1000;
 
 	return twl4030_init_chip(component);
 }
@@ -2193,6 +2198,22 @@ static const struct snd_soc_component_driver soc_component_dev_twl4030 = {
 
 static int twl4030_codec_probe(struct platform_device *pdev)
 {
+	struct twl4030_priv *twl4030;
+	int ret;
+
+	twl4030 = devm_kzalloc(&pdev->dev, sizeof(*twl4030), GFP_KERNEL);
+	if (!twl4030)
+		return -ENOMEM;
+
+	/* Set the defaults, and power up the codec */
+	twl4030->sysclk = twl4030_audio_get_mclk() / 1000;
+
+	ret = twl4030_get_hw_params(&pdev->dev, twl4030);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, twl4030);
+
 	return devm_snd_soc_register_component(&pdev->dev,
 				      &soc_component_dev_twl4030,
 				      twl4030_dai, ARRAY_SIZE(twl4030_dai));
-- 
2.50.1

