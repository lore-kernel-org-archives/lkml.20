Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013038.outbound.protection.outlook.com [40.107.162.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E61480359;
	Mon, 21 Sep 2026 10:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987657; cv=fail; b=p6Skaj8YFF+TauruNG75kItJI/gcvvjkTLBaUhF67m0dj/mK7a7A0W2RTp0rYsYa/Xqc9MC2nO2IF9DE4XovH5nMEBvlnDkMX0hJeVOzzaskjmeflKVDzJuTUovYDmNkiPH/bXaJjEfNVkRj+jO8Ur8WzMlRrKEjFPPnhROb+dg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987657; c=relaxed/simple;
	bh=otVERtQmvahCR+kyoSpgKfSzqyoRxQacGMeFwrAyqtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P63RP8h/ebY8uZhVrxw7CZQvLoY8XqW26Gt9uefrsEp2h4tMm9BBMwfF//h2sgiErCtH8A0wW+YH28sW1oJegmXNAghdyQQ1FV3Ninyji/Bh5fGL8GWAOJoSaFewIm9T+fZYR3nTH9mAev1se1H6iydUuUEPIE6+LAXl7+vDikM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pkGDG3Ua; arc=fail smtp.client-ip=40.107.162.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pkGDG3Ua"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EmQ2fzUVWWj5tuywKP8vYvoeLMzNuez8WgTrydAdQXvi8OKwh3JyBJwATNc6e4m5dPbQTjLYtNJOewT/yTTbV0pIg1cXX+UOGVs2W4H+4Rb1ii8vGs7Wloly0EoY86vvHQV1h6KX2ATyfxNXOrPwoJmAR9h3ZMhS15QEsCq9EYTNOit6bmjvpBwj74jjNFzWjgjyZH/oLOykhtr32kj5Xix7FDVcp9S5F+DeSBENlLN3B75el+eoTvxNILfEB874DLXrLO/7oYE6Rct1SuaBOBDRzOHOGXKKiz7+Bs6SRk1n3oeiZBLhc24qy1F0mRqoVZpaaCWojaSwYKwt7/ll+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=40pim2tjUqNgzAtNund6F5DddjCKrbifPSD+sxRagWo=;
 b=gFgAv6EEMUosMwynyAzEDFhgKNw5SgRncMyDacmXgmHHRj+cmx70LMmIPC2M+uIBuMUzHtbWNYWPqShqQmtSRMHbPfNCb9I83JbmvY/ZByDKPFn++InuRE290YCApKDN4fRWCK2VAJteb+dmwxPaFYjhkHhLz3VYYjJdv0+xLgaDiMwLn4Y5UAJCoTc7B+/e9j1Htwl9LwMnyQzFBS33jnNVkp6hpL6khEhK+wvtcW7l9Y0YxCwQU4UYIQnUxh22MGDXIF06/i+/wMEtU6w9W0IgdAAKNJEdJ/aOhYLvA2p8pEMHMrwmwHN5t1p/0cpP9WmMx/yxbzyR6QC1zD8Gsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=40pim2tjUqNgzAtNund6F5DddjCKrbifPSD+sxRagWo=;
 b=pkGDG3UaTs2CqYkwza+H8ZBn+9daIDIUqJWhNobQ59jMUGLq9z9c9ah1Cw6PepTGYuHupgCsZSWFYAacCXKEfOe2rCi4pt6OZWYrw7D+X/WjvmfNVuJIeas7whnZ8kcPd9HfnA15/y1XZ2WCgqnzD8ZZbqJsAvBGxKCzqfLakys6jcLtR4vIETO/zC/mlShqUCGoeFSJFEtZmXhHNpcSw926osnjuCzmBdpGgaH4nSR9y1kK+ekCDgke6cQDfJGl8HGTcWrPQ/b6Yiur/Jk7939b/wOM/bnBS1xoClRu404o28i81P0ggSJ8h/drnhXyrl7P2NT+oQR6uLWx07ywkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VI1PR04MB6862.eurprd04.prod.outlook.com
 (2603:10a6:803:130::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 10:47:33 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 10:47:33 +0000
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
Subject: [PATCH 06/21] ASoC: es8323: Move mclk acquisition to the i2c probe
Date: Mon, 21 Sep 2026 19:46:25 +0900
Message-ID: <20260921104640.1941554-7-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
References: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0159.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::10) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VI1PR04MB6862:EE_
X-MS-Office365-Filtering-Correlation-Id: c399c205-ab40-408b-32a1-08df17cdbdac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|19092799006|366016|1800799024|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	IMVNZcRAiGP2DYq0BAEdIoAg8UV+LV9MTa9EZn+MM8QXFb9BoKvySEcXp1Yhcjcd6txBA08iyrM98dEb0LqjcSIKrV82uNCM2ZNkJDvnS81jsorUVJ4S+mbMZ7X4bVS5HVoCtjW5dlVktb3D4b/GdMsUqMp01RwqzjKu+VfIBFj3hK8qgJr3GovLJLERtCz2DTcGDTiLKzAZCH/xSoT8XxeEuiKlMGuycNldCJdTAdheTq7A/W6BGvE3EvyKyQjRRZbD9l/EEpISjzV+SaK1hS85aTYvAcO1d1vPs+amWr4LTsXbCLE6agXXwc6WE9vGucv2t5GdgVuctgb7+kDuI09QYPQHz5kyczEtrE69W9Pf+MSWaJYglLLcl6ELAFjF+1prtYo43ZG40W4nIpqnQsImiEqp2RdmYs7RGhGyjD32zNEuntTMzZi926WEA4RKbsSpJIK4rF9Akt8mL/EiIVCTyUq+G3+SpJJdn6f/JimI8GOCW5gwvSTHzK1D2Eh0A2PjKvlfZA9q8ANWMQ3LEpMR85uEcU5P/lNpqUjXkXTZpJ16qvf3lOkwN4BpmVTmbufsY8k5YEHOMt6d7Y9hnRN0vitl+sijZe5Y6pUIJ8RjK46AP+YetmKaAQCh0KI+Oku5+VzgvSnNo/TDte7Yj75IFl3S4JM5OSBIe9vjquY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(19092799006)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iC6za2qEGemH8xTymY/grIK/qlNWRyuwWsQqbi1ZZtMNyrKOBXD04Wrv24QE?=
 =?us-ascii?Q?H45tYJfi1Ym0tuOcce8XXZde2BnmZX5JUBTiLhSQ/dwAmeDW76qBzSpipW91?=
 =?us-ascii?Q?2zV5Qxx29VM+trrnJXkoKJDgXiwg10bCO1DqDj1U0WdSPgGfVtYhiVl2kNQB?=
 =?us-ascii?Q?89pgP1X8siWEXqW2HybEoLSO9rBUgex4LKMsxgXepREgkSRFxHfM9sPc21i3?=
 =?us-ascii?Q?ib3BTbcUrOHEpLKujmLfwKHtwi9H5Gxp5t51LKVY28Tne4HZpvIV4SHtU8Rj?=
 =?us-ascii?Q?l3wopx9hja9RUVi9bDpAF1aECXKBAdzlGt2AZoFGFwh3YkqNuLNx5CnnMvZw?=
 =?us-ascii?Q?FMU7raEY7nuem4FudYtECFTuJGzhelWVKveZ2+25MX3vziizMm+w2yTvggER?=
 =?us-ascii?Q?Xs4yVcdU+aCEy+ufD7o42aaRhCSJODBl6qQp8pUs/NQ5oYHhGyjNaHajIgMT?=
 =?us-ascii?Q?AhQOw4+fHYSIc6OFz8AlSF7rImA7cvnDhX1kilaLn8e/GYCDqk4eo9Z4Y3/l?=
 =?us-ascii?Q?iwAl2paOr48dCSi/fvOguBHFAMMTmsDAIVS6mLTOR4HwcHebYWHnOQ3CEwnL?=
 =?us-ascii?Q?QUiaLxlNkBAQqIUmFYU+53/FbMXyBo12p5K6dxfiVFoMlomvDHhK1pFFTseE?=
 =?us-ascii?Q?DrtB884f5wFAUA2sbjzuCzBa9ZrEWnsRkuztnWOMMtfMV8zX6bmdc6HIzQVC?=
 =?us-ascii?Q?3u808q4baSlcJy/plvpn77rOGTbauzs2IhhOH1WwxyjsjPFgfZufAXKUp+nn?=
 =?us-ascii?Q?GBw1KhW1jiWmJ/FZmQX+WnahG2H3hN+T3avRNDVVR521lgcvg7RhHSrBwdDz?=
 =?us-ascii?Q?9lSV8HE0XHLIk9lpx75gXLY2VCCbnvxS5tS6U5BTl8OLZVOtgNrosj72zwiE?=
 =?us-ascii?Q?lQjx3lM0YTS6gXCuTUcWGGzNt2l+y/GaALm5OZGDAwCW5cUxdSDmh0OTEqYO?=
 =?us-ascii?Q?OnDOtbdbqEqL245BPUuCgAml1EKC9Cw4gHpqH4FLYBzA7AfJSRlOGPD0DnBa?=
 =?us-ascii?Q?8MxNgZjSyRQKgch2uffKLtjogltWyVll6SXbz7yZYOOyEEIeJG16Ru8jIJmC?=
 =?us-ascii?Q?RommNnmwqY49DuC9P1mB3Boq4Ai0NwpSg9oQrOJ2xBeAUvcyBmWFh/ydVdUl?=
 =?us-ascii?Q?dSp8Ay+0mHwtZSvt8FELoD6u9wr30WGPfhyT2dBr93WE+G9RObNMIDafQg/j?=
 =?us-ascii?Q?kP1nRR+AeM6q5t69FsYppegMnNNRVXlMsR4Mno0KOzo6KHkdAxFE/6kzJOfM?=
 =?us-ascii?Q?CDjypxTJ9KIHMuj2S/shC5Afs2IRlkRNnE7Fvu2oIgiRTFKUjzS5NF3eGeXA?=
 =?us-ascii?Q?odnR/8yTzhjRVTbiety42wMoxcUnLHi3xQupdwkc/6zn0TilFkmfMTy1oaaH?=
 =?us-ascii?Q?Pi4lWEfsWFcDt+2oxfn7ssk0biREPWCqGkSYoKXUWTOKXdrykD8YidI6ex7G?=
 =?us-ascii?Q?UEtbiCJNopLOuR3iiY9uLtkl2Lg0z/fz1Dy+If604U4elm8J9/HAGZ8u5qEF?=
 =?us-ascii?Q?lvIyImChjYbMHb44oLDKFn+xQwZOVJVGdqjRc/xn70HJqygEX9QBfZS2YhAr?=
 =?us-ascii?Q?HLHcEE/FaeBQmPwvBb43eY5MT57wifZlYztLG7wDCLolbPBoHeM4qprPm+Zh?=
 =?us-ascii?Q?NVmOBe30X+EqxxL6N3AbT2Frhadu9OjkHzxgHFJb4ek5iKtIy0uywzGFz7lH?=
 =?us-ascii?Q?2D8njs3ITTzao7lXFDRmIO79CH1XFCMc1cVQu6WOOmrax/u8/0ZXtLMcfn+J?=
 =?us-ascii?Q?gYsh+JR0wTjsAeR8oxpWt+4AY+qpoawiWkBU3vLxs8ezAVG6/cw6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c399c205-ab40-408b-32a1-08df17cdbdac
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 10:47:33.1836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: inmjwoinvMCvWvVFUzNVnHTm6ih9fKhgyS8B/pk1W2ZRdS1j3CQryrTQyJqm9z6L8yv4+Pazzkoz19o2K/TeCc0Bw7Ft3OC7nIMaKr2Taj3EImsJ5nhyHouYGw30b+Dt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6862

From: Chancel Liu <chancel.liu@nxp.com>

component->dev is the underlying i2c device whose devres is only
released on physical device removal, not on ASoC card unbind. Getting
the mclk with devm_clk_get_optional(component->dev, ...) in the
component probe therefore leaks a clk reference on every card
bind/unbind cycle.

Move the devm_clk_get_optional() to es8323_i2c_probe() so the clk
reference is tied to the i2c device lifetime.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/es8323.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/es8323.c b/sound/soc/codecs/es8323.c
index 12fcfe017ab2..3f7fbbdb111e 100644
--- a/sound/soc/codecs/es8323.c
+++ b/sound/soc/codecs/es8323.c
@@ -671,15 +671,6 @@ static int es8323_probe(struct snd_soc_component *component)
 	struct es8323_priv *es8323 = snd_soc_component_get_drvdata(component);
 	int ret;
 
-	es8323->mclk = devm_clk_get_optional(component->dev, "mclk");
-	if (IS_ERR(es8323->mclk)) {
-		dev_err(component->dev, "unable to get mclk\n");
-		return PTR_ERR(es8323->mclk);
-	}
-
-	if (!es8323->mclk)
-		dev_warn(component->dev, "assuming static mclk\n");
-
 	ret = clk_prepare_enable(es8323->mclk);
 	if (ret) {
 		dev_err(component->dev, "unable to enable mclk\n");
@@ -789,6 +780,12 @@ static int es8323_i2c_probe(struct i2c_client *i2c_client)
 
 	i2c_set_clientdata(i2c_client, es8323);
 
+	es8323->mclk = devm_clk_get_optional(dev, "mclk");
+	if (IS_ERR(es8323->mclk))
+		return dev_err_probe(dev, PTR_ERR(es8323->mclk), "unable to get mclk\n");
+	if (!es8323->mclk)
+		dev_warn(dev, "assuming static mclk\n");
+
 	es8323->regmap = devm_regmap_init_i2c(i2c_client, &es8323_regmap);
 	if (IS_ERR(es8323->regmap))
 		return PTR_ERR(es8323->regmap);
-- 
2.50.1

