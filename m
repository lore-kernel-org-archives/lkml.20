Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010036.outbound.protection.outlook.com [52.101.84.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AA5485921;
	Mon, 21 Sep 2026 10:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987652; cv=fail; b=IAaIM005HxyiHPN4cRFZYrndIXr+yXbU8MIWXQtG3VX9cFCBuGvMOyOWgA5z1U9g+WttNg9/UjBjsoeJ97GWgN7cCGzSUQXESyQa1OX23JKNjqISiB7OdKKLubIdLCVi7X/MevTU6mDuXt6TE2fWtqaOFcRG8vNCTKFDZQzxwYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987652; c=relaxed/simple;
	bh=QjTRwWXeLgHnbSiJxCHL0q62L09aC/5C+KC63eh9SX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RHnHreoLCPp3/he0LaJkqPJ+O5+GMQjvP+cYGHY1dKNKA9pDkRvbSq8FXMT4gdRTc9VQ7peKj8Nvfy3jdp32L/DttDJmNwiQ/lXOm99OHWXKyif0JxM0NcGAa7XiRYLpZNn4b+EcOkdrNXiOg/km0lBUj+CEulk4bor5fAjuP2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qE5oWiNy; arc=fail smtp.client-ip=52.101.84.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qE5oWiNy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jCczyDOHwJcxY6vWB9E/l4Wf0M+URbDEsx6O1nTOCWn7PjYRCWrDKJCKgdWmte5svc+Ku5Ygcvjxh1Gh62y915KGvB0NsK6WPG6NCYJYRnz34CoXzyxFVbowyyyGCsWuXl4GpaB/J3Xn4rjgQEYnr3aEp+vAOjjvpdGljACF8Eo28/jkx2A9fHEgBzoCFO1dhSZe0H2QSSGcd5FF0OBDhd49oxS8TLWHJSFJW9Zr2lBVGwkcap00ExDO5JIoFtUM41+WjI2lMeA4YlswomQMO6LPv9PB339sbZOJMMSES6XsTEPdqcz//Ce/oHRqSYgR4Ssh5MLP6j/HTCN8pgf1LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2G/gwqRaBvMiPM7MSHBjpa+qTOS9DfoQPYr3z4aeoLo=;
 b=MY4V4L8JgeeyiOyaII6M9X57fly97d0KcKTjTcJ7K7CJDi22cbCRMiz2rxCZTkMwZEPuBPZGo7XoLpxtXl2rhrg0+K8GWaEDQaUxU2ficpnDWcnsQywTv45LvxO07sOuz3wrJq16yoazShKfQ0vFPKiyJkSmDkTbTT1U7Xowi79FU082c+UG+99nuBYkfAQMQOlMlg4JcsYRuSfqqIb3bWrrwF7yYCEUVGZvG9RG3n6Ahvt3rSb0RQ2n1JnBAwKsV9dkrGwA1rDUOIuonQjoGb8RBxMq4exj5wCBQPvB0PTamCK5tnsOXKm2DS71Oh1Z2jbf34iXMVr1D9jTrxp78A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2G/gwqRaBvMiPM7MSHBjpa+qTOS9DfoQPYr3z4aeoLo=;
 b=qE5oWiNymMtlOZMFvcd6vJYm8WRN3TNz4Yw0Ik0U99q0KnMWq3atBFs/h5+gYDtXqu2GEirbDXA0K770HyKzXd69GCM+ITC0S/9A8VNleuO2Ka2WxN5efBj/UFlD83l0MxTZXnAHAviZfLc1fTrUjdmdPB5Vm3uIxRX3RgIB1AJ3kJLPCQdDfxqBFXyqFEbUofJy4QX6Wop4PYgfOBmNTY9PbW06+7zc4KHOH6E2IbQKU2RHcJrdSpuYU6F9dXyG/o4Zd1dgivmwhqBYSzAEywYw32NqLc4pzGCvacnRhmCKa9i7tL8/YBQu0fKa3bW9PcXMloFQHhtC8t4Ai+VqMQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VI0PR04MB554873.eurprd04.prod.outlook.com
 (2603:10a6:800:361::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 10:47:26 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 10:47:25 +0000
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
Subject: [PATCH 05/21] ASoC: es8316: Move mclk acquisition to the i2c probe
Date: Mon, 21 Sep 2026 19:46:24 +0900
Message-ID: <20260921104640.1941554-6-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
References: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0153.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::8) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VI0PR04MB554873:EE_
X-MS-Office365-Filtering-Correlation-Id: 27cd34c2-2018-4e8b-b7e9-08df17cdb97f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|23010399003|366016|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	WMvvno3f6rPX/NVeN6Wxc1U+GxPqeRxs0N8ZnwF9c6WPOwMKFktkU34YKIpgHUiJMVycB2sxw0OGOrrT4Y5FNXa48LMNANcK/kAhaSmvWrcWPjW8PBL9cyrN6FZNIoEXMgwr3BTqGP7zUskG8KTC4ZJgvXuugcDFWa96aw49lDSPgvpG4csznDt11gvl5WcZA5cWYIsP4nZ80XfeeFqH6rokkXtURg9FVpMcdwX6AxbHOPhDeeDHjw6kqWz+GW4e/fpXI/SMm+lqskkXGhUEBbG24AyXWMVJH2hrjSbBGZtFfi1S8fTczYmI6Ib3lYJYUuBFo+Zz0m2xYTSExrJh0V33EgLJ50mD1EAMnGPsu0LmBiOu6MQEn3Bt7OOQyYTrinpIfvMbq+qMzaAR9Xt1Us00VwGtXMe1hWERFXb6nXjEhNkKjGYP8dPTPavfCVPy8c47IzTbQrDdltcwhtVGbJJBmtO9h72AplPkkuibkUx2gUGLdc+wG5vkGswLAfHWGW92tIEZYT8TineNLpxGGOkMhrMgl/N7EhFX1D/n22qD+fwB7nw7lCgc5yip4pCN/G+DLaw5O309+dFcgQNLVlr588KLNQGcd5TjMNPFVpnb5hssQm3+H45pV6v0kD/ixAgZQuWrH+B9cPYVAklb1Tkb40QxH8lP8upBjKtMHIk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(23010399003)(366016)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4MOA57x3qzfygEyKO70mUC57oNX+Clg3FmWUfhZp0BETC4GaRPjvAcLfKL0e?=
 =?us-ascii?Q?MEYgBgWmjg/p4/HL+HaHXeJbiNXYbRFeP3k0jVIfUzB7RXuObqKqKKNthm/k?=
 =?us-ascii?Q?2OR54xoCNdLGZ29lFc02wjQsGs1l5i2G6FvQSR3zDCICEeUcROBysUJESVgg?=
 =?us-ascii?Q?Yg4jwoDlPc1dndjBS2kSvbhaAXjDzpQANwbJfppzmf1754QQkwhIV9F9kZPl?=
 =?us-ascii?Q?YMtajja44m5SzN7YLLeqYOoBRFh3MLruk6JgI7KYZefkMj3+uVRu4OEiJO/t?=
 =?us-ascii?Q?Mvx+3UPpiduCmtO10j8l/eOz1MJFmhUhEFXj2ebB5vubQY+/YGKSYohdlPCb?=
 =?us-ascii?Q?0taErVFEScsNP2SvMWSey97Y66IuK0EIHKbIfgxHr19xyIfcRRaMuh5cvnyY?=
 =?us-ascii?Q?uwcNstRl1snee6mtC+pk1Bj5BbrDjBSXiO2IyAtz+FjXkA5Z1T45X+U3bfcG?=
 =?us-ascii?Q?Ai1GouP9hT15a9j2EOOEaVmlJbAWUebshln+w7cdHK2uU8j0CeWjpGlrKKCo?=
 =?us-ascii?Q?zUwlHIfqkS4BFGMSfzO9QsetAvKfo1uOickM8NEY/F85B536YaUWEGo4f5Q9?=
 =?us-ascii?Q?wKQOnI3wASLW0njrEVMA/2owMdx8+61GoQbO/LXFhvCyY/66E+Ht7VLkFSOy?=
 =?us-ascii?Q?eUxlC21ej9KwZIfu6UEJqMl/rxbps7X//Y9yXgTIWiKAD2a/zYJRKpVgKgXV?=
 =?us-ascii?Q?ncTIQXf4/9eq4kwzg6LalDPm6UcceJ8leCxUP+FA69j43NgA/abJzcVeliGH?=
 =?us-ascii?Q?H49YzaXHF/3g+P4EjY1CDGlBi5hirHVKo6nifAYQ4PpiZL4vDPQS5Nr9FMsa?=
 =?us-ascii?Q?eXEpWzze0Ro6shJArbNRLf+Op0WO47GBdoBdegwptS66fgVyyMQcLg6mhWzS?=
 =?us-ascii?Q?Jj5N1/TjvB9KKEqVOWYANwgAKVL8RhAbW3M2l8y3Iu5RT3bggVwlFdD8SRRW?=
 =?us-ascii?Q?xLBWTVmy0TGox48SUJRUFVLrCDtlYTLiczlIUYoejnv72vmpY/uXB3VxNcZ9?=
 =?us-ascii?Q?DVxORg4KtoTqFIxIUzexbx5Txvja+V9WQj71YrgL46GUI7+gvDnpsyJ6u1h6?=
 =?us-ascii?Q?y0JKR44AJc4E4N+deRZt7JaqAGqEWWmacKDhpAa62SKkvvWdAFKoQRy2UDL5?=
 =?us-ascii?Q?hj+2M/zASE8Oj24ycmOr4iMr8FkUMhuNXVWG5hXLxwJwWCtcKheB0p51q3A6?=
 =?us-ascii?Q?hQtySvKPKPvNEUmBTiCvNm0MLqvZj+A/SlzDISb3lJxuqEU1NdPYL1R9EZha?=
 =?us-ascii?Q?vvPpRl0vWNsygTbShvRLWP5tRlLVhl9HkDOMfL2eOqqQZ+5df7jB6VfTyw13?=
 =?us-ascii?Q?vpJfMpy3kzz7/0mnCmYYN9LXY3d2JUnbY3weJa6orAY+DXCteZKC4kBmQsoL?=
 =?us-ascii?Q?nuXzmWLRTaH3kRw+g44P0FIh8vv/djXbc8jvU+oUm4T77D3njPiR4og0jPw3?=
 =?us-ascii?Q?KlZgJZd4KbbHYX5mKQlFhkAY0ZklhAyYUECo7goW/ToNtyX9H+ZArFpIp/5I?=
 =?us-ascii?Q?/IqYizkWwiFWWJLQtEg5b9Zv9BbKf7VJCOdfVhfiKt0Xf9eYvY5AmrFoa+w8?=
 =?us-ascii?Q?0mnhqO8udY2nmJz6JBsl/N51FOHV5sUmZMQSNipIrsZ1QJEiPRB465NJMN0c?=
 =?us-ascii?Q?ljXJUYnRXar6wN4IBLeJGkwaBlWFnLLLEeB0kwd/9B/LfEVRPf+XW7LqvC9h?=
 =?us-ascii?Q?NdoeaeZRYarVp6oeGMFEfCEgjvlKUzN0FQklEqNI/LhL4nsFJDbVjMZ/oR2+?=
 =?us-ascii?Q?wjt+jeDX4pstv0bj+VrdhQda0RGc6GE3P7tVDVU6W0IPmqvrrVZc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27cd34c2-2018-4e8b-b7e9-08df17cdb97f
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 10:47:25.9270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N1aX1TfvaSIBKen4Fg4EbVjS0plAy7zwWDC8ZsEeU4N+S9O2J1MTFB9FzpOUzUh/Smq1XfRQYWxHzfWIemKe7TljzsVR+fcZMxH7yYOrkgex24PYcbh2FAWMtIf70oIp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB554873

From: Chancel Liu <chancel.liu@nxp.com>

component->dev is the underlying i2c device whose devres is only
released on physical device removal, not on ASoC card unbind. Getting
the mclk with devm_clk_get_optional(component->dev, ...) in the
component probe therefore leaks a clk reference on every card
bind/unbind cycle.

Move the devm_clk_get_optional() to es8316_i2c_probe() so the clk
reference is tied to the i2c device lifetime.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/es8316.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 59399476b9d7..5e7bf6f020e0 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -771,14 +771,6 @@ static int es8316_probe(struct snd_soc_component *component)
 
 	es8316->component = component;
 
-	es8316->mclk = devm_clk_get_optional(component->dev, "mclk");
-	if (IS_ERR(es8316->mclk)) {
-		dev_err(component->dev, "unable to get mclk\n");
-		return PTR_ERR(es8316->mclk);
-	}
-	if (!es8316->mclk)
-		dev_warn(component->dev, "assuming static mclk\n");
-
 	ret = clk_prepare_enable(es8316->mclk);
 	if (ret) {
 		dev_err(component->dev, "unable to enable mclk\n");
@@ -883,6 +875,12 @@ static int es8316_i2c_probe(struct i2c_client *i2c_client)
 
 	i2c_set_clientdata(i2c_client, es8316);
 
+	es8316->mclk = devm_clk_get_optional(dev, "mclk");
+	if (IS_ERR(es8316->mclk))
+		return dev_err_probe(dev, PTR_ERR(es8316->mclk), "unable to get mclk\n");
+	if (!es8316->mclk)
+		dev_warn(dev, "assuming static mclk\n");
+
 	ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(es8316_supply_names),
 					     es8316_supply_names);
 	if (ret)
-- 
2.50.1

