Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011033.outbound.protection.outlook.com [52.101.65.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8C8480DD4;
	Mon, 21 Sep 2026 10:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987701; cv=fail; b=sE8Z9HA3ZQZkL6/H7bofz1DjInwrD8Lskd50IP3vPHsf2FrDGJkzsC608tyQe1ceclmRSYEWj526nwSj/Ccg0SAV7TMAwQBZLqECLUV6Nij9PTKqPNsWnAFg3Vrg9mqegqry5cu+A2TKosdwFLvGWWSYi+NcYSKIP65oOQAQxKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987701; c=relaxed/simple;
	bh=0vFTS8m5w0yf+84s8SXUTpOrFH9XmCsdKUQ6a5PaB5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nSsLQVDz/gnTC2A+4uBr6epurfdpptP1Td+AExaeV7wUnKqzgpVx7iisFrjBp44SomVC4R8kW7UBRUgLeNJQzwzhuWzyNDk1sR+uZqxMg7ldfCTPmhmjz3wzq04/tORqjKQiGZXEdvu6z3TCclZMNPc+DFcqXYcu6DdL1ZJoagw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ssi+L6Wj; arc=fail smtp.client-ip=52.101.65.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ssi+L6Wj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eDwCD8hJCt8csjq/M/72ol6J4XXLd4sHE1hbHR19fzuiCNBiljqS0gspDPZpkTcoprpnLfdcU+XA7Ny8CxcLdBTUt8EYYl9YnSWObcIweFON0aZvyLZZbKydd6Fr+ooCru/YnHlqbd3aHcA4sS/I7khIUmV1nAK1IBdqbBlqMTAz3KDcTN60V4/rbhWeAIiQzRxNjpakTdLzMYIRfMRYFHYPmv9hiXuq3Ytn95e4ItUztAW2o53U8XAXNak/dHkUmhgw6aIGgMBKJBiv9gdlgHJYyqUM/5AX8C0+HsVFhnLH4/p+hjCVmDbxrDKCT4kHm5AZ/Rod0vExYDAf07v7iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRWDHehRnHoYUn2YBoC2HbS4R8nIkzG6iVRGtts0/fg=;
 b=RadxHQyAdfiJ8G014z0y5AOFDzllt2zdVi8EWHZFTrCJ994P7+TzIy/7T6qFx9WeC/sT9XgXKO1Veqhjmb0xAXX0eOl0Lr8Tz2eFzf38hmVQhW14ZR8P9H1fhZ4Y5AQrNDFD7uu/gfDoYDYZUnNOcaroCP1npO/H1PeIVp8Q9v00rjofM3mOJGex7pvfBqCwYYjL1ua4M7vEwDHDe8kvXqXbKMA1Ul56QvE9Pjt1Q3nItu3vwLHSPzwkrwX5POBG7lB521d1bAASSocz0RSoDczbY/H4TUvRAvRArtjU0DPmYLfSjsaMUPhZVIZyN4MfANGBJz45RSdb4rQRapVeDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRWDHehRnHoYUn2YBoC2HbS4R8nIkzG6iVRGtts0/fg=;
 b=ssi+L6WjNqo+kBgwEfsReRiIVUMBrGiOkx7yS2aB46u7wpBqOrkPAcJDN7PhM8AEtl1bBYkvQSGDlGraaZ4Ta8/FED5gK9AdE+oFKYrAVoHG7cQu6+LdkJ2H4VDqxG9cRRKbczD1nymP72pvp4uRUIpOicfsYi+At2PKUKrn7lhlw/33cENoKFzG7IwgSuOz/dk6PlM8NJImGnRm9IkhSBsgqodz8Kw16FIP/IuzfguczU1RuaO1pdGMKjbsyo0/VQwjgc9OgVb82UfhMCtHZWXJJNixG9F/4deImLfPB3GOACR28/w1GBvqfxWypTn7k5mRxMv4xRp7ikB7LxS1sw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VI0PR04MB554873.eurprd04.prod.outlook.com
 (2603:10a6:800:361::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 10:48:17 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 10:48:17 +0000
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
Subject: [PATCH 12/21] ASoC: rt5682s: Move mclk acquisition to the i2c probe
Date: Mon, 21 Sep 2026 19:46:31 +0900
Message-ID: <20260921104640.1941554-13-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
References: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0206.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:19::9) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VI0PR04MB554873:EE_
X-MS-Office365-Filtering-Correlation-Id: 060420c8-d52d-4b3a-13e4-08df17cdd7e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|23010399003|366016|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jLXQvnQ3y6GLQpdw1eKpPED8odYAXoc6w6cc7pMoq9VGbaXhQKMJVapBToPJu6+YvtCVwbGXc9cGzlwwDXR0BfdGdk4Uf0xKvqlv13myPp4jYnP31E79qi+KiaTK0jk4Pv4/k5LlbmQVhSWdXr9J/wQlYSjekIyeHG429Y/AyprmaKo/DzcQD+7e24ETHCh1JO/9mh9pFc6FUD1txQoZXxjxkAiAhgIds7kloZlEIOntyVIti9HC174rc4K6pGYxZJYhgrMGGJKAwCx7ytyl18cAFkuiLYK6CY7zwkyxs7mpn2WYImde525NmXhOfC2x+IghkKubdPyPDC0ABmb2yIQbVjkH0PDsAbpryw5TD4uooHrPR+E7Kr1Z8xRy0uRAdSTlg/NhBlBHDCuDRxTD4nMwk5rYIeVJJvuSZCDeTR20uPjTzQNDnGCAKDLPPuOKvKUVQAPZlLaJqzZS6UtlsCUflfr19LEpbCJ5ytpAdgB3H9bOLJDRsS8UOXBbRtiGZQOh9P5hP6AyhOW35ljuRR6pDBCcqq+kaUjSzAfe44oUY7kZNZHBdLUoEIBzh+QLmI1oI96gs23amqiasCCdgPoveEA5DHhYMvBPb887WjY6yAPgzcGv72qT9xblzw0S7Qtyldj6dnlb91x+ylkRI9uH6ZiqxXvMIhVhapL++P4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(23010399003)(366016)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5AFs5puQ65YVJ6NmXpk5zguNND+VO2rFbLRXjxwYT8rmdX1A+EgF7wigiaGk?=
 =?us-ascii?Q?sqCg2+5nT9xKApu9rTd9HKUSIxUFum4WM/94kSBbs600WFengje6ag2cKu9E?=
 =?us-ascii?Q?gUIurrEwLqTH0yHlITxNaLugaHOv5RZVp4eMov1vvKlQFpbsoDD7Y+dO2NHE?=
 =?us-ascii?Q?7A/FwAodiEuNsC9/hNpG8hmOjhXNtv9N55EzVrzMKPj00zpXLdN49xO5FORP?=
 =?us-ascii?Q?vlf73M9+rf755p17WvHK2izxRh/3W7eciGV12gstHQ0XbHbB8JBnLjtQUlpC?=
 =?us-ascii?Q?JKuRB2KxXcP0shVaRT7UXmeSzZAz62He17YH2/1fupHPdfoWh1CiAoKQpnkA?=
 =?us-ascii?Q?7U/Emmfa6u7WwMmVhvqKmMC2/lKssYRscbgG4cOzPSSZpEnC9JL4mkLPof1g?=
 =?us-ascii?Q?N0Bpxc1Tmvnc5RM7o94slwVh1gToMtWTMOJAXL9KmNM0XVqEoMZsyHitLNLk?=
 =?us-ascii?Q?HtwDjW2qbYd7OVULCCOzBmnrLtPGXtJmseM6MOIv7mi8ahJ1K6DLsUIu55vx?=
 =?us-ascii?Q?lAglrcgtkv7FYJcruFmXvWZna2kOFS8cK7rnPctYDHx3Pc/9Xs7jn7vieoW8?=
 =?us-ascii?Q?72ZmKqR0CK8NyMciBnwNc1HOSz11jqTJoAA8WeX+24fftbfIge3kFO1bUxhT?=
 =?us-ascii?Q?eIL2tWLgQbo/aypND96tlfztbxGyzIR/CIU2NSZsH/3903gS1qdPacJxmXJ0?=
 =?us-ascii?Q?1jlYub8z6QLGGA+yMu/JgeeuCbSa3aMQgMgQbr3dCnkJgzaAr6AX5XG6FABT?=
 =?us-ascii?Q?jdbCiaxIYVAkdW5uTUS6LRW+anA4DkrlCX0gllJFcyIiRl8xU8uFUgtFXOYX?=
 =?us-ascii?Q?spKQldzcsKwbC3OhEEVctTq3gh0qGLc4YAI2p8eTSwe0Hsj0hlsKs8jCsrmS?=
 =?us-ascii?Q?/JOnkuoHH3yZ7nUIuL2+wEUPF9QK44UEmwxrvJx0Sn5QAKLzduydhFAnHwpr?=
 =?us-ascii?Q?equ3HW8ivWCv8aEkhSf2xoplbLJnB7My5JsvCs2zBh22X4l5gRemBOk3dqMd?=
 =?us-ascii?Q?D6EeWb3FIC7bo3OEEcmtu77s5i7WuAkezhZtttVEzRB4cXLMziAC3Cx6SGXy?=
 =?us-ascii?Q?9A6yt7WSAgAW5NkW5+qMp4pVcqGhWxVDZxIYq0dnRoxnVmYH6fBqpXMfaLbu?=
 =?us-ascii?Q?uPYRk8CUVEhuhiSzMSm30Eze2RmKmn1UMttJwqZitjniEZWYBORao9qFT1i0?=
 =?us-ascii?Q?FU6Ov1Nrmeyj6inVIrF6kGsraHet4sWrpKqirosXsSx+0uJwGZnmqyn1a5dF?=
 =?us-ascii?Q?5kadXGOXsS4E46OUuP71IvyNfPmGdX/etGvLC8ibwRJFofJzAXS3W1w3WmqW?=
 =?us-ascii?Q?fYYIPsSwwQ7qapGvP+6Hi6BUvnrKZbobeEZmKhVgCQcOyeRRejA/NmSJUwrd?=
 =?us-ascii?Q?lAevHUizf0MhwwIlUMi+ED6fx83XthQzKO75EEi8dLPyZLiKrxPO0gjr0iHw?=
 =?us-ascii?Q?T2ZIUoqLgcuWh+oA+NeaT8Rks2hpGWk2dR0V9eHcom2a8/6BdMp0UZ6QA4Dc?=
 =?us-ascii?Q?UbYwEl+zdTKo7m3h0FgM3p73TCaHeBGgSpfjwIl/Mkw3B4gIdP67dx1JLJ8j?=
 =?us-ascii?Q?0RhGIXWEjD3LZQZYxe/sdyQ8IXkiXhgu91Ri0OsfSiYC08Y7O1EmPe1v9zcq?=
 =?us-ascii?Q?wm0jTepY/n/v0xwV4HoAlIfueTT7nFAFXEIGZNNwz7UMK7CdaJgnxDIdrMKc?=
 =?us-ascii?Q?FrqRWv5Jiw7HEffhV5ewZZ5J9jIiehkf873t9Yo9Va73inVR/bnOQhVXVSfx?=
 =?us-ascii?Q?PprmV47p3FXZjLQ+sGPpFIJriV8vW5huzhy46Vj+JhLdbrRSn1z6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 060420c8-d52d-4b3a-13e4-08df17cdd7e0
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 10:48:16.9063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fueDnMTc6EMKvY1QuTr2QCWrC5hohrc3xLK+Q95VkVbawbS5L5tKI8bm8vtmoBAuVg7H4sYVb+fyp2Xxv3WLbTcsGmUWq6JcpJ/2ulgonOzBpxYiVCRf3hvy5Cr3U5aT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB554873

From: Chancel Liu <chancel.liu@nxp.com>

component->dev is the underlying i2c device whose devres is only
released on physical device removal, not on ASoC card unbind.  Getting
the codec clock with devm_clk_get_optional(component->dev, ...) in the
component probe chain therefore leaks a clk reference on every card
bind/unbind cycle.

Move the devm_clk_get_optional() to rt5682s_i2c_probe() so the clk
reference is tied to the physical device lifetime.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/rt5682s.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index 6dd0d36a7186..0f80e4c32f57 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -2846,11 +2846,6 @@ static int rt5682s_dai_probe_clks(struct snd_soc_component *component)
 	struct rt5682s_priv *rt5682s = snd_soc_component_get_drvdata(component);
 	int ret;
 
-	/* Check if MCLK provided */
-	rt5682s->mclk = devm_clk_get_optional(component->dev, "mclk");
-	if (IS_ERR(rt5682s->mclk))
-		return PTR_ERR(rt5682s->mclk);
-
 	/* Register CCF DAI clock control */
 	ret = rt5682s_register_dai_clks(component);
 	if (ret)
@@ -3152,6 +3147,13 @@ static int rt5682s_i2c_probe(struct i2c_client *i2c)
 		return ret;
 	}
 
+#ifdef CONFIG_COMMON_CLK
+	/* Check if MCLK provided */
+	rt5682s->mclk = devm_clk_get_optional(&i2c->dev, "mclk");
+	if (IS_ERR(rt5682s->mclk))
+		return PTR_ERR(rt5682s->mclk);
+#endif
+
 	for (i = 0; i < ARRAY_SIZE(rt5682s->supplies); i++)
 		rt5682s->supplies[i].supply = rt5682s_supply_names[i];
 
-- 
2.50.1

