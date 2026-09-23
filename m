Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010065.outbound.protection.outlook.com [52.101.69.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CA744102E;
	Wed, 23 Sep 2026 06:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144069; cv=fail; b=D87OWKXatHA8hB2m4CUsnO5QFqD2Ug2sJTXa5p7NZ4jeUYLFWJ2Vl1W1RI8AEH60X4CZL3crhpCbOhd5n5URfdG16Mh+eEJNfMxOMhHBAFxO/kMt9+THl1r9kajKQPoodtIxtPFmAkL4u6cvKKW60KPbZWKQR17rNJNUS90X7do=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144069; c=relaxed/simple;
	bh=fq8OvCKstjuQCBDVNJyovDL39v2BXdFT6zEDxUbx/5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Cxn+rK8vaoEyaZCgnEgNLk4V9g6QYsHi1oL4IjLuDxizRKnr1rTrjHa44/m1YZ/TiBsWw5ilAPviHqVIFBuya1p84L9ASt7fEwkeA8VNLmPvSEPCDJFFiguNmgSvp+AH9cEqbOU8rPmWRxc55BI3+o00CUJPOUC4e97Sf4oW0kU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tpC71/Fx; arc=fail smtp.client-ip=52.101.69.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tpC71/Fx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QW8OFsx4JHNDxmAjZRyBAGPOZVU3LKt38NYG4cBuePh/9Q4EFbFsA32bVW3MUi9KFooz8SrR6CWIogKHRC3/4suuN7Y5JHDW4d4ox95/9yqLh7+u4mD1/JoIhw7gFNLTSXn9KIZW0LU3sytpvWWDZ4erAvSVKMRY3v3zp1eNOfQojzT2+Gvqzy2554sxiZL6i6Hye5z/7YBA9vp+18TaN53dwloVnvPgZr39IYwTPJmfNWW/0g1EZ74mFA9AVWsH1D4LhgSHp0gZS7U7h24qCk37um+QA8uzPLU2mg9Lh6dkZjZKlPSFrxiJptYADEen9VMYJkaUZQ2X9bGg3IJvxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yz4ygMMBlRVEzKS1mK8PoExlQd1HxwMpcvKbzWX7ZhU=;
 b=xWxpFUbCQJzBrpCgjE1baIOatVp8kKzerYQu3rBkIorWQUPJh+RI0rxALibaG4REZt56tfMj29x1Yp2TnQQB8wHp9KoOpDmEdmRzZVS235pbdIgjM4ViiFRWlhhb7KtFrMwKBV8WHL1Dt3uzLbbia/eCJpZZTzznE2uwpnJ8knjk8WOEIGzC2K4i5w3QxZXSzX40WXP5wx7+e4G2x8iRNz9YBvNyBTO5xt5JRzqhBESYqsy7rgjW6T+wqg/5tX+xICnnnMZhobqHJXB+bjDKhG8fb3Hs8xkXGapk4HmvhuJxXlpgFbPZCBN0Iyemk5N06/Zhtpzqcr+tmS6vdjo0SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yz4ygMMBlRVEzKS1mK8PoExlQd1HxwMpcvKbzWX7ZhU=;
 b=tpC71/FxrlEyMCtJxOH8Q2MarVbOnclRGapdznleGXuR9tsIDNAsw3Kubr0otFN5MJJO83ge1sLgNElk6zH7CmxYGO+5qaTQvYEU2KNZDWNrZkh/3Xnb/aIDuRpTeR9y5CaHH3A0rTNOAl12Xh0Az7ihUCQdUW2iTAcaPisnzY/i1jlIYOTGL/bIpPguSledmut8oPA1Hozzh9sI1MKwRlrkFsrGB3nTLWuPet4rAkfP3aBkhsugkr2Gt7c6VpOiEyhXMYzibaeZnabDr+PlZfCaxfCtMDzMmhB91iUDiLlHUMI+sPBF5uJ/8IiHrtbjAoG/Q0Jh9UJmQDn9wLRJSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM9PR04MB8339.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 06:14:17 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 06:14:17 +0000
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
Subject: [PATCH v2 08/21] ASoC: codecs: es8328: Move clk acquisition to the bus probe
Date: Wed, 23 Sep 2026 15:12:52 +0900
Message-ID: <20260923061305.4041197-9-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
References: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0096.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:3::11) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM9PR04MB8339:EE_
X-MS-Office365-Filtering-Correlation-Id: 785cee30-6165-4308-44e5-08df1939e63a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|19092799006|7416014|376014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oMeuLx7Ty6M2r4AdwtmHk25pHpVxgXYgCTyBvrI6VD8Q+gzTSm14P5vnw7lyIp0nv/KEhg2HL3jVYOvmC0UevB46WDTpfG1L61X/wZuvi778uGk4e202oHfJpEZTCXYxJd4n58dKDoX5PqadZvIYVfHb1jT+u0RVBSsOF9nWd1/GqwbC2QtxXSPfDfVBN5vSiXcyEmtoI4cH15TUxXJAahBtslczCiwDYi/IIba1JQNYaDpaHzF/BNDeJOt6YYIrMh6SOc2/vDOOy92qm5+wKFsQwwaAQDWHC/OW9F5gakNCtHmivYzCc9xQSWuLnodI4PFkbpj3LETHbI/AJFib5eYYTjdFus+B/51PXgQ/OZynsEFRJcDH1pYsexkCaK6/3REF6K6kDfb7gCYqrmXQqJZpfi2RIc9acbfRoUqFTywXjWGNEGrFuZ4U9YwAwpAbfFFt2/LRLDVZY8iS6/XLlK1Gbt3oXOg35Bi2d/jtJV4vcxeMVn6yKrDfBPSmZ5g9aHo0AZWpkp1HJ/G+j3Svr+8g/paYO+uyGHuB7z0CHdVITyGX7zfC/5c6K3tbZM37FGpdL7tSwk+ISxAsaUyUtBuiO5r36izA7XrGNhyOXirngyTpqkPH8eJlq9vb9lRTdRAGg654psR0vSfJYALLDzHCfKPTEwdU35hAH036g2s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(19092799006)(7416014)(376014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WN+wwG89McKI4JywlvNQFjWJxXA48liX+6Cci27jHuh7Z7kEMbjKYZw3xT1Q?=
 =?us-ascii?Q?Dbq4mmR5QhNdmE+f4hQL1b/FQuo9hZoeBAU/yylLAGxm3rMD0PPewBvryEn2?=
 =?us-ascii?Q?Aggbva6UX6x/ketMoo02e5lc4wxYDEsgsgxQzT2yK65sYozVIYp5EVs1BpUb?=
 =?us-ascii?Q?ypOqg4afmrvx+LK+62drk7Q+n/nYITrPO1b1M8DmVtk/UcSFq5J1Kyvkqr0D?=
 =?us-ascii?Q?zkG1wBy2TQxQ/6gWyFoIOA/vyNAogCCQspBhIyfSXkd5giTxWPbxgIZU0hI0?=
 =?us-ascii?Q?p5B15umHjI5OLkTH9g3BjUOcenw8Lf4+Al+7KR/sLFanFUHLmUgAGz31gZIF?=
 =?us-ascii?Q?dJIIgH4qW9M9FO4Zf0DmeHvsBeiCLHKvF4vGglGINQbuZc7+fo6f6kyx6SjR?=
 =?us-ascii?Q?txR883t6vm/YwW94bY7DDZEDRWVG3/y+Rmw/D1LdZllmKB955Bo94dyNBxCG?=
 =?us-ascii?Q?BjpUz7DQSwIML95+a3Ym6gpl8ZrOl58AlIp+kPqk6krPq/Fu/0uw2L83XElk?=
 =?us-ascii?Q?SNxTbw3E4KH9uGftu0pB8dlQ/tE1UcSqujwSIt8bsjt8ClnZvd67byE+TuOU?=
 =?us-ascii?Q?lvLOMlhJmmcpc8ADMZK5tPnYJd+tU7hHt3cRnw2x56LaUEC+W0C4xwBCiQi3?=
 =?us-ascii?Q?QgYMpy5nbetvn+c/j3J+huQY/BWRSqivU3C7yTXFnvYMrPFwZY+9ypCTSjm5?=
 =?us-ascii?Q?IyJhOsOGMJSyoHjzHOMwgktabCCKm0/xlpiyNtNunF4EaycoCHcADGANzeYr?=
 =?us-ascii?Q?F75zw5RGJPXgGVX2ooqGDFEui3nnI7HoUnAYnbOvi/3AdeT7C75l22IWaD9K?=
 =?us-ascii?Q?5COBcSTc0UPXr/Sfc0wCY1sYcbOc04QcKwH2EdlCP9LkvrrWXT0qYO395YVm?=
 =?us-ascii?Q?Z08dLSHH/mnfSfSCSeE+4/AHmepQ1X4RxyIvrZBU9XKOeWHttZnVU7W33Nyw?=
 =?us-ascii?Q?mafuu7kUg0k1pd81haHAISoHRPRTUPWCnSGWhJGk218BmwqzOaZ4VrpYz0GU?=
 =?us-ascii?Q?MUsIjbWH/9cxUMfTXV/fpLRJMKozYKFGGbK2E8itnJJj1brqXHu4FjiDRaww?=
 =?us-ascii?Q?9O+lT2SoaKtdYYrKhyfpmUcuWb2SH0ofwvEE8Vf8OSSajVEbIRGSoWMwkmlf?=
 =?us-ascii?Q?ASZjTMoJ7PsXHZCpEbjdqOZeAKYLEXBlIDPrVnf2RvHOUF0I6iibGi6UqsXi?=
 =?us-ascii?Q?CAnJeY48L5EkeqwvBQezd4SnB442ac5fC4qzkegeV+MwT3xE50+yVVCRUByz?=
 =?us-ascii?Q?yED2VfmchfI4/qFNDJhjmRjM3d9Nz7BzqP2n722pjfWtF+xxATKljDiQlwTP?=
 =?us-ascii?Q?636ndcpZdFkP4713X13KEMCHbZEK8n4EdR32pMhYfexkF6DEzed6SFuOoBNF?=
 =?us-ascii?Q?i1hlJ8riP/ygh+lYetpKsQUq9Hkkt1wW1DvfT5Ik9aur5E/w1HbUH9tlxRj/?=
 =?us-ascii?Q?JiSDgaqypMK/f3CfVv4cendwwDa+gjjEYVR44OL0Pwl7HdOzyv7t5CiHhaJE?=
 =?us-ascii?Q?GNHFrbqBAuTLpoNO95cWE9kZZvipQmixHM/CBk21mwcGPk+BXvw9MVbIW7eI?=
 =?us-ascii?Q?omkDHolSEyIABbplqQedflkZ2HikmiIW5CGPy01gqCUB2Vbz4Cx50lQlIg3/?=
 =?us-ascii?Q?1JXtWUMh0IcpTwOmlqGH6d6DLzo4WwBIlAdlqdmkG/zLiB3CElFatMxG/IVV?=
 =?us-ascii?Q?43rvvQA++F0CvWjFpY8WKuHRHNAAUOEsW1UhnxhzndJRR9gZDLsaPLe0s0t4?=
 =?us-ascii?Q?IFCk9XePOxft11AEtTIfS1tNh6lvdwAuiYfKKXxzV034raEmDZ1M?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 785cee30-6165-4308-44e5-08df1939e63a
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 06:14:17.7609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7R9EKw9VVoXKHsay1UMIKGl49Lov2pBPM7cL1y9uVvEaitx80IJ3/quHrrPYAVY0CZ9/KX3PKDMWBgiK2xul57GDFLlk3HvpmCd0q5LVwxinfiUIr+ViHKBJBlbb9nU9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8339

From: Chancel Liu <chancel.liu@nxp.com>

component->dev is the underlying i2c/spi device whose devres is only
released on physical device removal, not on ASoC card unbind. Getting
the codec clock with devm_clk_get(component->dev, ...) in the component
probe therefore leaks a clk reference on every card bind/unbind cycle.

Move the devm_clk_get() to es8328_probe() (the shared i2c/spi bus level
probe) so the clk reference is tied to the physical device lifetime.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/es8328.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
index 7d52b5d9d061..37fda2f42b0c 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -829,14 +829,6 @@ static int es8328_component_probe(struct snd_soc_component *component)
 		return ret;
 	}
 
-	/* Setup clocks */
-	es8328->clk = devm_clk_get(component->dev, NULL);
-	if (IS_ERR(es8328->clk)) {
-		dev_err(component->dev, "codec clock missing or invalid\n");
-		ret = PTR_ERR(es8328->clk);
-		goto clk_fail;
-	}
-
 	ret = clk_prepare_enable(es8328->clk);
 	if (ret) {
 		dev_err(component->dev, "unable to prepare codec clk\n");
@@ -906,6 +898,11 @@ int es8328_probe(struct device *dev, struct regmap *regmap)
 
 	es8328->regmap = regmap;
 
+	es8328->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(es8328->clk))
+		return dev_err_probe(dev, PTR_ERR(es8328->clk),
+				     "codec clock missing or invalid\n");
+
 	for (i = 0; i < ARRAY_SIZE(es8328->supplies); i++)
 		es8328->supplies[i].supply = supply_names[i];
 
-- 
2.50.1

