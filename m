Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011070.outbound.protection.outlook.com [52.101.65.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE7D48592A;
	Mon, 21 Sep 2026 10:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987709; cv=fail; b=esfWYOoWgfzbnAsYcgtGPXUl5HYISTAD64okHzZTajHNwlFLpZTkXvn63RP+k/JqA8Haiy8r1rU0Esvgtb5/ZqK4EJPj1hK/p+vA8hk+EfsRZQSQqTY1XexZKxNC8osqzbjbamCSXWOCWbTsk8ZvikVAuIcMEMMltuWRCbXvPIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987709; c=relaxed/simple;
	bh=OJ51+xaqdJ9LqSarlEliD9zBHik7ItrkR4skyjxJbFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Nr/cLQhtOp/Uev1ONEorscjT2gVDAFd7c3RC9i9aj0rBK4UwdrddkkrRQYwVXPmlX923jgSESeIb/OewvX7nk+cd3WvtGIYCcczMW0VVaci8tsMIfN+IY19u4+k9MyeagsLHGNHYILl6zDYhGxh4/3S3d11/VIXJLWFLnDFsqWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xXUfRb+U; arc=fail smtp.client-ip=52.101.65.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xXUfRb+U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ue9wYtZdA+xpp37Sa5LQIUiTJhE5wFnK13ihkgDOXYQX/o1vNFYfCVwjb/eSoKJLHLsA3P1gp0t6BFOXSmZATQQYkcSfWSfaeKlF3VQQdPUczIdPE8fJaAFbYHkefc7U8gFvM3VZkYTwmkGFYim8pQlztvpOv3MjXcsWnHu6ModaQJ46tGLZiYRYkHfu5a5MtogjFnFo/rXlPQHKI3APAop77u3mi/VzUJo8d+oP0CnyESMSxh0IOGZ0fwUhhU6NgKSuyTER4PdiJxA58e3nABekIWbqc4ReZBpKaywy9TIBl43rwevGuKK4OvMhRgmrbEnd/obBHDkgsbT9n+pEzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jprutNdFgkcAYybSFgGpZoFZCil8zgrm1y90FJDPXG8=;
 b=tZPXggcOklE+igyhsnXppNhfiaRJUqNL3HQZPw3eQdhXp9KLoflD865YZlBn2jGbsGN++xz9MkxK6nV6zLHzzkx0TwUD4RkxtuXLmCzKdAV+oIVpazuor2nHqEwSREaU+mQBhPwDdYAaXxZyev8JoyUKOqxfvXkgYUj3CeM7FHCZA3g9zgYPynOjm04NuIILXA23ASkAiCA939DUcgk1fBpPVLmyNZVdjwHKbNUf7ijmWY9jlyjXO0Lj2uB/N4uslaMwFIWzhr9O+9LUpHPgrpK6K3jq1yBPOtoHD58UelCoGBGu1Bbot2ClLiQFsUZiE2R/4uoWSQOrUoyNkRy0vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jprutNdFgkcAYybSFgGpZoFZCil8zgrm1y90FJDPXG8=;
 b=xXUfRb+Un8aSTvku10S55ffBbEsTM/CHbCe0gRaaUrdHW7gXWm4BtOZKm46nXF9igTORCc2/Psb9m14Aux62B+IAaoXdo9xK5HTmZEs8B+gPcBwEF1sKmyZob/FgamfufaeyHnCe1M83KI4iYm7DCBanzygxEhZmL5eX24cE5khhrVsBDgc/bVuXw67y7HhKYIHs6YJQ3COVhDQuEKCv2atI2607xw0Hsaam0entDGpDeZHmw6AEtszOo5y1PrZva2pVW15aphkGf8sYk32qcoivumwERLqWGsv5RVjnp6WvqEgM/oPKie4nTfwR0HC/Yjo8S36mzBdr/lgX7XMF4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VI1PR04MB6862.eurprd04.prod.outlook.com
 (2603:10a6:803:130::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 10:48:24 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 10:48:24 +0000
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
Subject: [PATCH 13/21] ASoC: max98090: Move mclk acquisition to the i2c probe
Date: Mon, 21 Sep 2026 19:46:32 +0900
Message-ID: <20260921104640.1941554-14-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
References: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0037.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b5::17) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VI1PR04MB6862:EE_
X-MS-Office365-Filtering-Correlation-Id: 19dea424-0790-4c8e-0b90-08df17cddc50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|19092799006|366016|1800799024|6133799003|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	7Vi1F4K35O+6Qdzrz0jV5V7O1bjJhTKCTXErB74pWX0q4joMpB4bQRsPcADkPVpvX4aUfOVPvQLgiOxkqfwkiIH3NVIKu/XTiSUYoEeojQK1jxF0xaaWhMJ77YXFPz7XllSvqvHH0rziNjkv3jo2aLFGavkXV4CoffWKZ2B/eZ0Ykj7B+kIkzEP2PaGkRMV2Rx2Txfp8Fl5hY5UHmN6dmbtXeyg1h9MG0uhr1mR+zPhZzOniDpSwhqAR85IRjVDHDn8kdczwRg3eqLRHNzgwlsNbq4Vgn4Dcl9hogbd0k2bThu345JWoAkBFWe2slGvy8Oz/eAVXK4Zm+JpGCme7HzyL+w5vpH+P2yuQIHfmVPluqLMmxaFM0cCsY1vxHVLaiajokdBpUM+pd5ollUfZ2tPLAJH1KhUnNb6rvMa6BODalaeY1wIDLMHoVLNaUIMWG3CntiMTY4xhFWRR+ZKTdx/hX4iGzPNR4wEasUcOJ9734owsKQUzIrG3Z6yt2rrew2MquTTOLcCM40QwkiLSgsrl0Czq1r2muEzZIYEuAj2Xn7TnET0X997Hd2QEBtFjV4yWr5eP1DZ8BBlK3gP7r2inQr4sURLt301lEJq80PomXrTm+seEBGaQiPJMmDjwzagUVwmMKnNQ38hwioAiXc4o9L+6RZcY/A9ZHreZEvs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(19092799006)(366016)(1800799024)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8R27Qp5xWq6s+AuT5ZUTyvVGJhP3ywz8gQ/vHNRsDFCtay7pDNq+Lyp59Sfk?=
 =?us-ascii?Q?Xh7Yl9hjqDN8AvH1GpbXffaPn5DAobZZpAsDr7ZyQ7Pvt4NE90xmTv/Lm5z8?=
 =?us-ascii?Q?CgTBXXI06BwNLMJrUjjzAwJ8Bul5ns6JP3ypwpqpqSzyfVGtFPA4NVsQVEfd?=
 =?us-ascii?Q?nzrROzgpbmvNVJybqtJVSocQh/SmPBQs2VdjThXCoTUFyrc5Wrwu2iD64pUG?=
 =?us-ascii?Q?WRMVbOnI+BwAxsGgWuYjT8zpzz5Y4zylTTiMkB7IDudNZtbU9VovgxWZvd80?=
 =?us-ascii?Q?/LW79WTLbEh+obuyocIrxOSip371QDlEV2zCoM/qdlw8A2vnLi0dFk6lwxc5?=
 =?us-ascii?Q?o37nOGY0VS0RsiUqO5RX1Rzlpnw1DhA/C1xoYC8vRP3gFJl6EW6BfcpCatie?=
 =?us-ascii?Q?CHgl+Scles/4X87y2vN+nn57lEjzJgi4DcyM6bTW/ECl5NB1ucZ38TeJSRMl?=
 =?us-ascii?Q?4r09+SEp3Foo1o6Z6lAVmhfMuGau0KrsCVIGIJ5kaOd2E4ZJTHPxTZsN9gwn?=
 =?us-ascii?Q?4EIIoOxvhnDwdY6tGNeSfgXjlz2/hm9sMmN57KVJ+G+LGNmE/Ct7SGIOV7mX?=
 =?us-ascii?Q?X2MySdpKTg77GUS3MzUjuzmU387H9HMsy2hvZy3J8YrgQe5cfzDnHFGo6hNx?=
 =?us-ascii?Q?N82Tq04Wi9zoiopT5KEPQ/f36CPv4H3IppC4a8xVWIiflh9FSpUesJ/Ehk+G?=
 =?us-ascii?Q?Bvg8p+eKplPdlDJ7owrwOd0CFn56XCPUs0mKzdTTGQc0jmrQIMC68gdnVE03?=
 =?us-ascii?Q?xdh1CEj6DHKZmZh6Iqu4p8YR3RxXETm3/ZV8g4vDxf+aaVyTNAM8pABQHHi8?=
 =?us-ascii?Q?Lbo6rf8G+5YU/Rk86GZsdIcEBTMKfcnOdpP7VN+X7sVa07XN+lFGUBLc35M5?=
 =?us-ascii?Q?FcXrhN8hFW92oyVA+gSakiQ94HaIE/KwNQfrQ2Po0+tr+8/w7MXCS7b7HRzl?=
 =?us-ascii?Q?Ijd5iutNxQ5IsHg7IGUV2rwsLFazvuC5PQLlC7GDxaCZFU+2meI2zEw8q5TT?=
 =?us-ascii?Q?Un5uo5RmIBPEsvLujcr7j2g7vZF6ib6SroPoLYSt6E++O5Rd46n3dM2zNjDr?=
 =?us-ascii?Q?HAfxMpIWnA6cBJwSwkcaRl65PZZuBEhY3GnaWmJQtwXVSLpgKPcEKkWovOLP?=
 =?us-ascii?Q?3hNHVPCZpVMgN5LT9J9VYPwb94ZDjOpgcweMH24wwfSm+h7PibX+rJ11Lspj?=
 =?us-ascii?Q?jQtOs3SpWtAnq9dxWWjsDQsFfxtNOQW9ER+bHzuYDaQXUdciaiUWsnkIig1k?=
 =?us-ascii?Q?CLjx1Nj1uKci8eH+myqQnEqGbAx8D+oYOcr0YWhh2GbHNHwvy7Y6e/zNrOuQ?=
 =?us-ascii?Q?iiE5V7T6NDT58mV/Pl595o6Mg/9iVKngJVovAsZBDZpo3vowPYEo97JFuiBA?=
 =?us-ascii?Q?8lA1f8Q25PwSOPt+wWXJpQpRTCgigZNGaGuNi2lA55Gi3rRKjbpKTehkurBj?=
 =?us-ascii?Q?bkbLz/x5TEEIrdm2CwIi46TF62EXE/9QuBN1yY5nE4eyBHoYjht20nqtFr7B?=
 =?us-ascii?Q?hYJzCMsFRcD6bzP+Ut3az/jddTq84NZbJ7VprmoaKadvDaYb7EXtxtRCJXbJ?=
 =?us-ascii?Q?7lKgJJ9KSjuLxhubJ9xrdjR/rqZ3UZhuA4TwDqdIyJfjwjgmB8lG0jhKF+Q1?=
 =?us-ascii?Q?o3DLGYgvDNqnpi8bdWBUd6u0kamIjA0qrUK2WCZTFL3ACPs9S1RoMrOUm4HN?=
 =?us-ascii?Q?3xGhjJ1yRbJ/Fsw32AyvUP/z+wMhahCcYTmmqKwTr1mw6IZr3NKFpPy5RhgV?=
 =?us-ascii?Q?OijVd2dyRhcv0/P2hZhDbw1WEjHKeQwqp8gmvHh0pq0XryDcciBm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19dea424-0790-4c8e-0b90-08df17cddc50
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 10:48:24.4489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cguUSKNI+cNT0aFLJaE/jh2u+OsOOrz3jUlXg0Sc6MzW599WYwaMAtpCSCbpbZHoQ/HetqQ8/nEgym/igRgpy15z1CEcdZedysBfcz6sHJ1+tIpIkBqMggpHLNwJujoq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6862

From: Chancel Liu <chancel.liu@nxp.com>

component->dev is the underlying i2c device whose devres is only
released on physical device removal, not on ASoC card unbind. Getting
the codec clock with devm_clk_get(component->dev, ...) in the component
probe therefore leaks a clk reference on every card bind/unbind cycle.

Move the devm_clk_get() to max98090_i2c_probe() so the clk reference is
tied to the physical device lifetime.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/max98090.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index c31f3d32fa43..4bb5478f4642 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -2448,11 +2448,6 @@ static int max98090_probe(struct snd_soc_component *component)
 
 	dev_dbg(component->dev, "max98090_probe\n");
 
-	max98090->mclk = devm_clk_get(component->dev, "mclk");
-	if (IS_ERR(max98090->mclk))
-		if (PTR_ERR(max98090->mclk) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-
 	max98090->component = component;
 
 	/* Reset the codec, the DSP core, and disable all interrupts */
@@ -2633,6 +2628,11 @@ static int max98090_i2c_probe(struct i2c_client *i2c)
 		goto err_enable;
 	}
 
+	max98090->mclk = devm_clk_get(&i2c->dev, "mclk");
+	if (IS_ERR(max98090->mclk))
+		if (PTR_ERR(max98090->mclk) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+
 	ret = devm_request_threaded_irq(&i2c->dev, i2c->irq, NULL,
 		max98090_interrupt, IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
 		"max98090_interrupt", max98090);
-- 
2.50.1

