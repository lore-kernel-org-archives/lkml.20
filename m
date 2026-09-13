Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013058.outbound.protection.outlook.com [52.101.72.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC9639EF12;
	Sun, 13 Sep 2026 10:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789295131; cv=fail; b=s5JslXiIFZxenh1D6R6E2BsmIsX6wK9I1q6ndaQfi+tXOkFm5XT7Tvd21zWnyvcvolurfwS0ineiC9MkzPClCGd8SWqxZdtmMcE8WXr66CMARHYOjxTBje2CnuVEy2EK/ZHL5kuG9MpC9bl4qZK8eYjFks4zF1PK1GXmrtndu7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789295131; c=relaxed/simple;
	bh=qh+kyh1Qeo4LHlYVdovn+0l22N/mg+bBebPpz68Ft2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AZ5UbTTic8QSUsEpFaHNzpqzkeWzd4uPvM5wX1gcV9ue+CexMJblZvdvozEVLpKtTiLtdNWXPHGAkWQIzzv9tEoC28zxTWk/LsCkynkYqlgiJw8tWTx9/W92pWeFFyAmgSbrmc1Idevq5AaMSMzwxfLSRDEKiLcp4RmGs0d8HCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NYoULDor; arc=fail smtp.client-ip=52.101.72.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NYoULDor"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mv79Fep/UDVV8xxUNiZU8c92XAbxCY+AMTS0gSYGQJ/OKTUIeBldNbd8nhU/Ay24ebVRWe8skJn0x2Sb+7LyXg42epihrHZis7j0G0kEexnNjXENI7zCZfuYO7LDJi7G6BCQTo1M/tlmFjmDSO8rs4R8pJuz00L/bszz86OYNlk24ReR6tToiFSYUbKzS1+Tnp1nHGI+AGJR0XmIb8Ylu9+nWNTRfPixoYSC2S+vQcy5KqhOfnXu1bTBb935kifZ13rMqc3Pay9YjAQRuUiOhI7xwc/y7SE/9tV7ivPmYhTqXr++795AyMMSinAExI5XOgkPdcM1j13MuQiOQw3tpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1q1iF7/tWEwub7UGJmbWKbDi2qUHmWD4/MzHoXfqk1E=;
 b=Vnu2FxtSK2uLJoCWX8Gc6uneQT8teYbrcv3jnQcNXJkFlYQx3Y4dbIoBBuM5fZUGFg6P/QI2xRBVZdlC7RLM2mNZF1fe+OrPRtEbOLB0g16VYUp1qGlv68exwCEMQ5i2ERdkU27Hh9UHJqc3UZZgNWVYcE1CAXcuUqYd32onYuYI8KBplUSfQdrRkxRDckhbG4l3q5wZ8XBbXSzU1G+M6CsxtTPijlBzxYL3bTX363VLO/NHOJE0Z0RKQPaWWoD5OTO09WrByNgHvAHnuL6zpcEXJNh+ebCNvPtyW5Y1UNRpFbyc2l/PaxYKKxgfnaxPnNpbpdyuH2BGNhK9sxzOBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1q1iF7/tWEwub7UGJmbWKbDi2qUHmWD4/MzHoXfqk1E=;
 b=NYoULDor3QLXvPaG08CqgdAWDboYLIXN1paprgFCbYx/OlWRdRxYIEvpiezmEqxv4mrEq+ymHnRa76O+5UwE7BdveiKWd+4jEejevWV4DbkOgKACd4M/LP/o0xcRQgDLDH70+zCJpztIVmcKAuHYDT6p2tMHayVk9Q46bHJKcspNOVrh+/L5x6yXXt9+3PV7YJjPCLGakRgj/LomJAjlJfSnzGz6sQKB4Hd7S6uKZkajqCh5pfUpqcmbxOAGJelN/ekwr9Ntm/qNr71t6UQ1OUrYKyM+xTBFYvxJ3F0+uCjBvM3sYgk4jtcdY2KwZrr90EnxMmxECns6EVRAffOOvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VI1PR04MB7006.eurprd04.prod.outlook.com
 (2603:10a6:803:137::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Sun, 13 Sep
 2026 10:25:25 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0406.007; Sun, 13 Sep 2026
 10:25:25 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] ASoC: simple-card: Free jack GPIOs on card remove
Date: Sun, 13 Sep 2026 19:25:00 +0900
Message-ID: <20260913102502.2805912-3-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260913102502.2805912-1-chancel.liu@oss.nxp.com>
References: <20260913102502.2805912-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0198.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c3::7) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VI1PR04MB7006:EE_
X-MS-Office365-Filtering-Correlation-Id: 461ffae0-a214-4217-4067-08df118152df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|19092799006|1800799024|22082099003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	+z8mIYmQV6kUlIB6FFH/jLFrimyVxRKrUv52o0uRCrNGQ6DNJrPSXJOM9vNI627OR7GGrEkJDfGut453cqbAl1Uk3OmpCPwXUKuKRvgo/tQdW0ZmWNNt+rcHwkUdPh7Qh+Qc+kpAEgvFAMtLrfNgsuwfCeofiF5XUnFizWK877DSwSf/YQSD7jBnC2wL1QaCyMZUtf0fgYepnXmXm1HsUuo2RewJIK65I1wZkjCZIz74K2bleGD0uvh1n3mLw3XnvPuU55nblw+9TN2tkNOBXJwTldQGgBDFF7tYjOPz0s5ybhO/vbtturqrv1uln9LuWylWTocNQfqJ4hUr4FF1/3xLZ19ECxkCnY3Rr/TbSoCKA44xfTrMpjrAeYswth/PLRuKy2Mat/DY/xMBcwi7pjrNJoiuy4jX0JEscjHUL2uNWJNKeNwTgJ1M0fijOqW2Z1VXVrIXKE8K0+5OkL1Fi6xKP0Gl0D3qCK2vqcEAMFT3FUTr0OTq4tpb5+ZWOuGcszaS/QkfDTYYhKzPeneW82Idqj1svkRLRgendzA2KdtZBHV4cPhfdPySHCaHEGxgZaXLINMPRxVtv7UCnc+vnf3JwDEF/5FaDc+6n7h7KnS5VMpiEZLG55g7EePamTuJv1iW9soqp0daSIKCNUz13uPnmblNv7MngW1umTWSEPA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(19092799006)(1800799024)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5UdwMSrBaSt7t5cmA+E96aZjXtX4EOHLunNqbhgv8/8L5BJCX0XlQuADDNjL?=
 =?us-ascii?Q?3qyg/Tf48s6JfqI9DAALPRv0QWBwXmJ3JrtrkOGnkg7sXH+kmC3CpkIE23s4?=
 =?us-ascii?Q?W/XdiqQ11kuY0aG/npqnm/+xgka4jUUsPHAWjk9FccwE3F46Mn6/izctsKE1?=
 =?us-ascii?Q?NpnJE+2R2+1oUDtd9gT50ydg94PoUX6y2C/rSr8wuz5UG/9PsJm98eM0QiE3?=
 =?us-ascii?Q?3uzhSJGkZ+mgoihbuisIjYy5aKeEVxbfrRql5/g2UvYFZJT4EMlj5V0trK+p?=
 =?us-ascii?Q?FEXnsPuB2GhCSabKw+vfxvNi/o2Nr3IiWsA5IQxgT+w8g0xiA1RE+XjZefWW?=
 =?us-ascii?Q?b0chJSm3enVOCcz58jb1jxdwIsexhh7ZwDijDD6U7/7k3fnO4tbWP0ouEP8t?=
 =?us-ascii?Q?diL7byPucTngusIg6kiSK1ZbKeLe3fO36ljRKe6A7e+f27qUCrRHEincKlpZ?=
 =?us-ascii?Q?HmMVLLaHW2K+phZlkDCgXrW6P7Xw8xjwRP1SB9sgB0CY+6JxCD0y6ORzJD+S?=
 =?us-ascii?Q?fdBG35GNSdYZZA6JH4hvHoY+pYntEIdJ3U2qsuuw0ioiwRC3nyoniWAEhuhm?=
 =?us-ascii?Q?qcM6sAXrEmJJ2tHT+kWDTBnq60gmqX7LLJB/yjLIDsT26369Wcd/38RqmoaR?=
 =?us-ascii?Q?Scqmsnc7raPmGVHk6vNtlQBZ2qbicwbf9A4IQYkjtqmSf5M+vAdK5zSS7qku?=
 =?us-ascii?Q?b8Y1tvhIuC9LmmeDG5B5Z6jPbMpqpnXfsgMTebFB1MVK7um2YeG1VZiTzOUC?=
 =?us-ascii?Q?Jm/N5oWP2jfvu5tF0llquNQx+IIKWafhGuKBLVWC5B+aWM9g/DynZGnmqWjD?=
 =?us-ascii?Q?ki+8hydNZNl14M5tIT+CDdQnJUX8mu7XtX1VK0QeKRil6uOKtB28SPUb2+Jq?=
 =?us-ascii?Q?veaCnqnRQ6wPbUtLZ8EMACdsBbEQBnRrOTZW4/bkmh+OVRDVINgBRVLxXOBS?=
 =?us-ascii?Q?mTQAtmvJ5ugLNrUaqJ1DLgDgp3YsJ/KM78X9VQqwBQaL+ZOq7os69ycYnrqi?=
 =?us-ascii?Q?D3MjGUVVypZVMoSHlJ8TR1qb1fsKq4ntBZGupV5cvWGJgtT4fyF3Mx8hsqBT?=
 =?us-ascii?Q?e4dZNWWcGJjHlnBuUX5IW96i1MSOoEaJieBq7FLqB3SHYP0Y2rAij8tNylMv?=
 =?us-ascii?Q?99bQ7m/aYlJCHvgMYCxdSoi/nGOiFxoLmZDb2USHiRZweXiYhlyDsnUGJ6q4?=
 =?us-ascii?Q?6fvN1wC1jttjUs0j/IqwDon/MqWlW6Q7UHSJ3Gdn9pElGxgQcScSbVGjPCRo?=
 =?us-ascii?Q?XES42QffCSCRqUhsdVc/CSNyTKGjA7cIHN/E6egN8Lek4p4UY12yaHrkp5sV?=
 =?us-ascii?Q?+ReKL3uUA4YuJiq6E14ucQrCjJICeCGQYLEgKVjyfZXd5/3RZaxdGai1Cow7?=
 =?us-ascii?Q?fKbGYiUw1+jDtIAYqTxf+ORI9ec5nRa2D9wkyv4Yo3SRhnqLxuD0ilCXxicA?=
 =?us-ascii?Q?mMQfuq5VkjNn5fUNN0VttkyaZB4Vveji3Vq1keqJRX+iFgXgH9EvSyWV7Ofz?=
 =?us-ascii?Q?Rpj2b3ll00xZBD79r9l4kbaH+A9IfPICea1HErdXAlSTpseu9s/kysPCoZiT?=
 =?us-ascii?Q?t34kckArv1rNXXtaDco2PtiNQH8p3aqpZtQMmBgV0Irm69ahJr9iNI/gWq+5?=
 =?us-ascii?Q?Ja7z4h8TM9Wn2wLO3LeyeOLux1VSNtsIi1UMu++Oz0+YG85Qty63nTTuJgNd?=
 =?us-ascii?Q?f+722ek+C+6s/bCoDx46ISX1SlM8fAifmuxAP6V3OPQOR6hiyz7tdWR7m4IX?=
 =?us-ascii?Q?a6z0KpRDOlxzYad7FyRWT9YsBfY3TKswUuqs9Wh+1Mdq0unGq3T0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 461ffae0-a214-4217-4067-08df118152df
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2026 10:25:24.9897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H6J3f+l1Cv4VSZt2AYQ7QGKWZvDVpzjm+mDlvCmhyOfkzBEHU3iuVV0uBi/tWVUJLj9sfNFh7rXtHM8pLQLJT1PGb/JXGbx7wIYQPE7qla/9SERPpF9yz98bkveAgmIV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7006

From: Chancel Liu <chancel.liu@nxp.com>

simple_soc_probe() sets up the headphone and microphone jacks, which
takes a reference on the jack detection GPIO and registers an IRQ, a PM
notifier, a delayed work and a sysfs export for it. simple-card has no
card->remove() callback, so none of this is released when the card is
torn down.

This goes unnoticed while the card is only torn down together with its
platform device, because the devres cleanup registered by
snd_soc_jack_add_gpios() is tied to that platform device. It becomes a
problem once the card alone is unregistered and registered again while
the platform device stays bound - for example when a codec component is
unbound and bound again. card->probe() then runs a second time and
gpiod_get_optional() fails with -EBUSY, because the descriptor is still
held by the previous bind. The card is not registered again and audio
stays broken until the platform device itself is unbound.

Add simple_soc_remove() as the counterpart of simple_soc_probe() and
release both jacks from there.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/generic/simple-card.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 0a769c177149..b2fc91b8ab81 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -666,6 +666,16 @@ static int simple_soc_probe(struct snd_soc_card *card)
 	return simple_ret(priv, ret);
 }

+static int simple_soc_remove(struct snd_soc_card *card)
+{
+	struct simple_util_priv *priv = snd_soc_card_get_drvdata(card);
+
+	simple_util_remove_jack(&priv->hp_jack);
+	simple_util_remove_jack(&priv->mic_jack);
+
+	return 0;
+}
+
 static int simple_parse_of(struct simple_util_priv *priv)
 {
 	struct snd_soc_card *card = simple_priv_to_card(priv);
@@ -754,6 +764,7 @@ static int simple_probe(struct platform_device *pdev)
 	card->owner		= THIS_MODULE;
 	card->dev		= dev;
 	card->probe		= simple_soc_probe;
+	card->remove		= simple_soc_remove;
 	card->driver_name       = "simple-card";

 	return simple_parse_of(priv);
--
2.50.1

