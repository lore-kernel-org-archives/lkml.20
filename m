Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010065.outbound.protection.outlook.com [52.101.69.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D7342E8F0;
	Wed, 23 Sep 2026 06:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144048; cv=fail; b=UzHixuMw3dcRqR2g/pSnHm/lUp25Sp+fddhtoUnfvuEekAN1gEBkmpzLi7GCkYs7ZdlYjLMYak18PTcXEv6ub2/rsAJBhphopGVmUqDkgv14O85B85lT3FQIxBDRPxxfQv5kjpko2O9H7JMh5Gk6uwbnXd9paS9CXamlwjPOQaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144048; c=relaxed/simple;
	bh=QjTRwWXeLgHnbSiJxCHL0q62L09aC/5C+KC63eh9SX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CYHvocq3TME010BfcXh/9KClNtafKwcuw+rb0mVhhk3G9dsMXMLGHaRP0o1wtM+0FhIFAblvUNZYcYsw5uJOvUQmNiEHVMMBoKB1JWQU8zUO/G7tXrDkDoVS5uD/ioTl8FpNrG8XVTdXpl+2J2chWHtyrYudk5YbFfjrXWFcOGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xydOLsd3; arc=fail smtp.client-ip=52.101.69.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xydOLsd3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mY/I3m5CvwT68zaUmJ0uwsSytw+yKzT/NsBTottvg6Rpi48UYqtkDfTfeHfDQCc9P/2PrdUi5MvTaX9u7oJ1iUGoin5/Wit8hMvKR6F7lSKPsmViZWz779TpjL2zEIsrhmAKJMJku0M0zSJ1duPrlnky0f2r9OA7pFc4CDn5WvGYb1LDqeImaJVcnPuSqOenD8J1bqoWXRqgH+FVFx8xWvsXpawRfqbhM/uOP1rBmSTolTitEqdjT1jbyvHCXW+lQPbR2dqDQ7qePJnFILQPBrv76SeTTLrUcyUubZ7+t8LdNm1LkiCazbL1zQFZZKoPpfJG6w6la5+YLxLJ4RwS2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2G/gwqRaBvMiPM7MSHBjpa+qTOS9DfoQPYr3z4aeoLo=;
 b=CmYUc4G0BLA5OMdfmgOTRQIE17kJ070AwNpXYPbf2Kksah+PjOlsZ2JPYv4r6CPYKIYp9+/QnzV/xPafcvRd/PldiGMxxizhTfwPrmg01hLfGYa3IV1TbB18XkJPBcle+LaUH04W8U0LWONQ7sRap53IH6an5j4LYAnmg8PtKj2VFGc34MmOPZAI21p7+xLYC+jLhN9oTR4aW45utq70DYjAVxDRRNMulhueHlamdTIa0GsvS9XYIZIJ02t8eGvyiKSy+Nu0K/2yCe8UamO775ZlUmPh6jmgHwvwapn5eIWpADwaVaySi8wEzxAdYrju0M/BBufpZK7p6AwmUpm9YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2G/gwqRaBvMiPM7MSHBjpa+qTOS9DfoQPYr3z4aeoLo=;
 b=xydOLsd3YpPGT302+vaSpDOHW2DNsDfVzfOkeYZq05BCSamfuthh3g7Wtbt0UrJPwI6gzgjgC+aTfQV176IZKbPkVf6fqKofFi94+5FGu/f45dYxrUmLOBnVG+koboXx1fgHR05fETxN8496K9pOC0WB/ZipllnUkJf05/CdQ1fzGBl6WC9Is9wob2U/GhU2I4EgYREzasqxr43PFy3CUI6bMUdfOXGNEGdJeK136mvSv6CHQUW2tuL/OTICMtPh7iS2GMBzpQV8gio5ZPd9W5ZhVBtRap9dbW0+7UUogrPOhFTMoJFeOCNtodJxY0Jm/AkXX4WV/nTN8AiBVq9QTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM9PR04MB8339.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 06:13:55 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 06:13:54 +0000
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
Subject: [PATCH v2 05/21] ASoC: codecs: es8316: Move mclk acquisition to the i2c probe
Date: Wed, 23 Sep 2026 15:12:49 +0900
Message-ID: <20260923061305.4041197-6-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
References: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0057.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ba::18) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM9PR04MB8339:EE_
X-MS-Office365-Filtering-Correlation-Id: 01a86643-30c9-45c5-746c-08df1939d895
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|19092799006|7416014|376014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	XDZfJ1eSxTsbpvEOcIMYfVQLeryJYGARy+pER9AG87G6Acb5j8EDq8dUbfsz9xFSblOM0TGfAckEl1pFJpfNcOwm+tX6xA/vTdzg4P2vm1cnhA9F9JOjUoF/m2JKMu+IMc6NDaUsMp7I63UZZqpLk3CsfLqc4CvDVRBV/bjh4esxGWoes4wOKBDAkxqQbRsW2xpGybHiUPbo/wmqQJZRQG2FVoW4DpQWYVITmMQ6McnCLOntuFh8lrw3TDcKle0iYR54Si0gRRbMTrvmdci0OlCxuQk54zBGLMuQPh0ikbFM+zwi77CIYfWLCZL7eecGfYlM4t56NUDTTmxCyEypMdmvk5QUC+F588Y9tB9tWm9Hdx6DOhp1HOBj9sQiM3Ob+AwGtPd2rygzKuiy62pTRx3w+3CBFShn/uszV8K3wAHnxnkMeSj9L8Q5BebMeNRlNuYyvDL9sYpmBPxwUzh4uRHu4OFL2mVYTRPOzdZTTGU+hDYORisnVkczbS0nKtzK+eZtURJxJumsPi3qfiC35t/QBWL2pFjQZT5PPhB16NW7TnGhZCudYLrxy2rEylchcJlO9q4Bjdr7Say7GXs6yOKonlbyBBQJnDhe+Zzb3HgidAdQlw3H9FHHfHB0+zsT9SUSU1Vdh+wSb0f1URU62twjWBNumLruDZpgpW5YKOk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(19092799006)(7416014)(376014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Tt1rBP5xB0Z8beI5z1GbafNiyQJqZ3mcPni1KZQ0aNRCxqkQvglIyayo2Y5Q?=
 =?us-ascii?Q?XEu+guMpUfaVoCBBCRhvyX/Mc+qVwsXNB1knDLHo7T7vrzlTiMMrNHnY7Dxu?=
 =?us-ascii?Q?BoWPkzYLBhhw9DFNonngYyew6zUs2kuJ8jIIdUfN2F35+UzOFgpH6imBwRXJ?=
 =?us-ascii?Q?6ipGUm+fCgh6rzCNZq6LiF3Rb3e6PBarCGwKDdlJ0xf4FZvzx5W3QYD14QYi?=
 =?us-ascii?Q?iWtcJKXj71cKhz0EAMo2WKPui8QVsWN845Bk7IppAEP+RJe5JZJGiABSfqil?=
 =?us-ascii?Q?uerTFnMtZsf/Xlsczd2DtlPzoriFbk9YU1c4rzTa2O4FKJp0FmfHTKn2ybEI?=
 =?us-ascii?Q?5mv4mLdECVOVMkWyKQq3lGhHEi2vNVFUhgBkb2gjCRos5Oez+JO0VvdB2Ek4?=
 =?us-ascii?Q?Bm3ql+DxQ9LjeH4zYDrjbS0OH6wbRmFMcOtN1dlC1R9UgOf5QcqINzUQH4qO?=
 =?us-ascii?Q?hVIxnJw40Swxq/jZeCc8a4aF9JUQ2tPSV0p8nVInygN5O80LjoFqDwklW8b0?=
 =?us-ascii?Q?koFXAzjq235JX+aB5MBwRE4fSpDzp2tn2w9hnw4UhJNQc7E58+QjnbYj8LZk?=
 =?us-ascii?Q?2NgthpteR6gBtQa6w70pUwXhMw3gTwGxwpaMawymt8TpA8RY25uGZVXl0eol?=
 =?us-ascii?Q?2E0ar2wZQ3Adz2RxjNLBFl1T+XA80ULBC1qMu5dnf54tsjoAm/xQ5QhyOR4e?=
 =?us-ascii?Q?LqOZ14i06u+DG4vL3g6jPpiDUVbJRkbn2wXzj1uC6WtLeprG+fwrN6FbfXjZ?=
 =?us-ascii?Q?4DgSvA2GZBAToxodESUqOO5281C7e60N54wEdJeN2FfNIAqxyYE1Ofq8NnhL?=
 =?us-ascii?Q?e06/KKkcv9wbrQUOz9u4PfBPKECogXwDjPo11W8YXyHf/PAeXkxEI7wKKR8W?=
 =?us-ascii?Q?jqErXTpYDQtgwGIHVgCIVivJkAHoUOPDjkc2jy+/Kj5Rb9v/5kdvRsDfBujM?=
 =?us-ascii?Q?obTGFt5SRHCRoG5pGDWj6MTEFLq8l6BEvogh8wkJc8PfNL6QDs8i4bn55m7p?=
 =?us-ascii?Q?OTyKmnSEJ4fv1HyU3tepQ65kD0JN0lHlXE+WEBsEy6B1W2ztAu+iktO5KPTg?=
 =?us-ascii?Q?tbuYJ1RHzO+xvXsUG0Mc5nca2Yh8usxoe2brzXuYHbVR30tTsuIS9+XKcGSc?=
 =?us-ascii?Q?5lEvBk9vmuQW3LMVAb9T7qMNbGQ2iS1g7SS9QnELRb4OBRGLHo0Yz5uXt1uJ?=
 =?us-ascii?Q?G9+LIO+zq4dF3BP763feQpGC7UEncKJkOX/5JrFiat/ynVXPnkZo3yRM5Sgn?=
 =?us-ascii?Q?X9IgYl0I3c8XWUsrJrZegzHNcwv9DJV6o7K/2Ha+tjgLgb9xTxsLfxAcmUuG?=
 =?us-ascii?Q?caOeQMhn4YOnQ/5NVjY4QHkX4a7ygilA0rWBeZFA5oHWBP5nqRJPcN321CAL?=
 =?us-ascii?Q?VVGVPcEKaRm2okW6q0IyFu4eVOjzH8miGOYtQ3DpqyITFXe9vSVFT8HUsiwz?=
 =?us-ascii?Q?WQIhA2qoWiQNqqtq1GoKy33FOdluftUbmSrtpiZ/slzaCVi6Vavx0eMDXndI?=
 =?us-ascii?Q?l26iYRJfQvMl25pqvHDMX6HFD62herhXqwne/pxb5j//Q7ObfCcBLE0oqSoG?=
 =?us-ascii?Q?suHxEvkNhJn8vZRhJlJSNoMGRJDtOX69WyN1UHZt3/SK155Ulk2fXf/JPCq/?=
 =?us-ascii?Q?QYTxeai3Aoo3hd6ow7porm6d8m1LnKUpTRtIF0gVdrZssiWVVstohjHRndHc?=
 =?us-ascii?Q?vhByuukRsy5OnlUtf1ICoewjFT8xXh4d+MqwqhUsrY417P9++UVvTNx7xVlm?=
 =?us-ascii?Q?ZS0uOZl9hfNk2HZ+Uq46ADzYQC2c/jCrCx98toalsveETgUNC7nF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01a86643-30c9-45c5-746c-08df1939d895
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 06:13:54.8775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pLvzX6rHMU0/78b9UQ1+XEUoL+hspWFeMw2CdTLuUvTku0CZxPC6CiUp69O2BXPgQS1TUzA8tcwMyY3GcswHZQgfqRaEm/RhOciML/aQPO+Q4GBld3azc137opFukwuZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8339

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

