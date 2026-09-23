Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010065.outbound.protection.outlook.com [52.101.69.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA0243E08F;
	Wed, 23 Sep 2026 06:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144074; cv=fail; b=ncXZoAplcaD/u0XXAxs/szhm3qFAV4LdVweMVFg07wVTdsTJJS9zmCbaxYCkwSyX1ZYAWVew1Ndgd+A5ZS2ZX592NWNcvMu2nCHIWZnYy1/nV77Wuc1MNWGbvTCtExf6vjL3LXXJcdaEcya05i9sOMAaFYTcLRI++Vm4pmQdK5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144074; c=relaxed/simple;
	bh=sE9IMpwJa5zfJ2mRMW+R3hO/Lx4OH6fN9Nt5ju1rc0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IUqFT+DusmLej9Q6nWsAWirgFbzgKxxVsQLFdfromNcrylaEMSJ+ti/o8tBsjglXryuVYo0tQ4WnDTGngai0RLNCI2sAZ+SaTwtFK/j5pQ9dvPfrozPz62ec9ck15e2zryAjR/9ct9YIy6uSY/dlmMilhrPaWVz8vcvw6eNrceA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MQ05FTv2; arc=fail smtp.client-ip=52.101.69.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MQ05FTv2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CrQRDBqYizFubJOuUzsQ523MV3d1zZaoe0MDc0BrVVUK5FauwKqt56Xr+8i3vGD/RRpkodyh6OUwu1Om6qtXjgtmzsyQ/Emb90c8wFYFwbY4rGyEJkVuxt4dm98JYi6xc/jwsr9AgmPUUORW8UDHgWzDnupGy+/f0GAxKXxmYbYdY1IjFASQ+vco4WoJprUK7+sOPuHsO+yFBT5TLqSvADvN2yrLhDyFxSx46nvYwdwy5/fL/P8P3D/t5PjXjRNDUuSLqvKlujNi/KZLOdcpHmi9/NP3wVrK0UT+9vn3tSsSJOAImPZb4R8s6DNrmdxwk5vxEQvTFLZY54Wl+caKSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3iEdDgfZ2JzcK3JMfRphV0Klhm/H18JpRzD0Ud5DsE=;
 b=YWYnxJYE2IKqnEfFtZuVN6t1uUzmTbO3NTTRC2IGLk5rZLjtCOrbDjY46cSGZKcpkV6MnDteTP4pUsFMjVjeQG4Y844fPu2uOonWGL8YZJrx6Ny/ouQIR7qZN+hKt8yFuTQIk+OcJsQyDqybH1nzyZGPttkfLBUOmZbtzaMUkln+klOaRUWeg3gnOtkx4J0dFKIedoM6TsOH91kkutvjZ4+nXO/vwl9gYdM/KuUc3rKc3lIyRXCrsEXOE6hvkD9EZeqFwTUhf3wz3Z4uogSfEwLlvchoqYRkCDhggeZ1NwmgE/X3cHExcmpKVso3K19usfhXjeYIV1rHpX8cDRIXPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3iEdDgfZ2JzcK3JMfRphV0Klhm/H18JpRzD0Ud5DsE=;
 b=MQ05FTv2wLMxN0i3Ule++oJ2E7NTnaHd1T/muKzQbv5r/jxKdm6Z7KF1954gWUtICEolEtuXlSdPgZ3uoeiFT0iq8BRUQ6klJbitj7fHDB/6N5TOkdC1jmU+TexXFmgaBR+GWyOQB4Sxj+11fwx7wT8sboGq28YvmHQ3AtxiWEvdY2TtEVOePmljsabs/q51rXpC4DzMdE5/i1ry/4YYGW58LgSscjriasOqsi3WmrhX9Hs5v0LxSPSu8JYHI81tBFKa8LSJrpA5hl8O35pYSLj9+gQscfl7CwAGin8cuDmGIb3FcHH2KFlkXy4w2P1zWpMpxh9Apj+fu77/bJYatA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM9PR04MB8339.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 06:14:25 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 06:14:25 +0000
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
Subject: [PATCH v2 09/21] ASoC: codecs: rt5640: Move mclk acquisition to the i2c probe
Date: Wed, 23 Sep 2026 15:12:53 +0900
Message-ID: <20260923061305.4041197-10-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
References: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0094.KORP216.PROD.OUTLOOK.COM (2603:1096:101:3::9)
 To GVXPR04MB10021.eurprd04.prod.outlook.com (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM9PR04MB8339:EE_
X-MS-Office365-Filtering-Correlation-Id: 9faca5d0-8ce3-43ed-5035-08df1939ea7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|19092799006|7416014|376014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oywwTsib7gKwuGA6UZLyKW7p4fQw23edX3MWlQGes553riF6MuhkJJKxtclGLWYWe1ZnqNWO4QJgi9z0g34w/1b6NBHzK89QfEFaNyr//IEajqVfVroD/X8M/vIJ7z05jcCmdjr9LarIsjkUVEKzVIx27WYJXASjmUP65ZarngSE1HoFQG+hkpo/vTH6x0cTv6hX+Itfq9swt0PKVDVELkizv4Ox00fJ8K0VSpHP4mHSIKBWNREDrUiKjk5OJmL5K7cGwNmGpHxcgebkd8PLhSo1d+1Sv9VTsgH1yZ9K9r44HsQ+1m+Ti5E5d4wtm51vJaZP1oJF8wD47mzqiTBY11ZGag6WEvrEXUyB9cCzUdJy4t5+seNoOdQnfvdWtJpAf3I23pPd1cyMP+WSbFogAnKHqZfNsAZqX9TW3oSLJqsZ+Si1eIT3TtXO0FlFTbfY1OsGRlEQhU9bGoBpIrrL0VankxvkdmwYUyCqTyvB3qOyky7MlJwkkxnGy8xy85nTBJzCI7Cm2onTts572ljXy93t/PNVHdThp6+paBe3LhgICJmWrPpgidWX0vudWUt70yWuBjRbYAZYZEMxbQfDsGjcPhEmEmqE/ZoBUg4uIilgLQ0l2URe2zDl+KD5oRp6PgpfuhQ7gJKgrfzfiVJHlX/ChWS7K24g4PttIwZhMWM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(19092799006)(7416014)(376014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UCaSDlOJkxlOdvOXtcuwmrVJtAZhQHPwJ5PGJniGdUhWuOCVN2R/1083pM+6?=
 =?us-ascii?Q?POTngr5I3Dr78MBdavzCQyOZfLPmMBKbrBP6gaLTUrhNLqzx0GZwXTAS+SEr?=
 =?us-ascii?Q?Dy5VsmRR+ZFvz3Bt5x2nMnfLUwVihs47YYv+2X7ci5qA+5fEAQ4ozClka0RW?=
 =?us-ascii?Q?vbnjwbqHiJ+zd0s8RfWZ5iOuLfTjlC1YUG78wd6Eb7qqWxLt08X0LXSCgiOf?=
 =?us-ascii?Q?sHjRo8qgGrC68pvFjLg9amNFy0DgMnasl/wTSspXw0ze3bpJS9ASceUZhmqJ?=
 =?us-ascii?Q?MURjMxou+fGht5q8c7LmmRtqELnCDPMZLi9Wl182h473on4ffwbxYG+XNG+6?=
 =?us-ascii?Q?EV+iA69VqWQnKjR2ZgC14ulBsxs3IXruOj03OqwEbKrSdwiJNvArxDkVRnfS?=
 =?us-ascii?Q?TM282gicmN6bNUdgSwuFiiwPWFSHpx656StDjDQ2fk+ev6YzACt7TWR+1BEs?=
 =?us-ascii?Q?aQHmREZkUc76EAlUV0Lkadje6pjGDhzCnjHfDfG0Gqesp5RAICF/yuHSiBIq?=
 =?us-ascii?Q?1+DGwTV6EHYi/IIQSXcLgYFIyvW1LEdpiJ1bbEG0a2T7Htb4FsnII7hmEXep?=
 =?us-ascii?Q?wHiSEmJhXffFT0rclFaxLUO76uOjWDegt1CNt4p6h2uzlWX7Fy6T0P6LDe+L?=
 =?us-ascii?Q?sWXgBZxXOHMp5f/AEuJh3PLioQpzTGCh6tvliNN0CNds9yTujMt2JTZ9xDmI?=
 =?us-ascii?Q?QTO2dyKA68UcVzxaB5+HeD85uLRD1BVq2jTSzXf8SLDEUhEY2hEfrImGwKMl?=
 =?us-ascii?Q?D48U95dMifMpZtXQKxWWkjV01ne1lsW64XIuBdr1yzjbGX1ii7unVjD0lcCr?=
 =?us-ascii?Q?B9YyGs8ZcCBJHOR2nZi4h7/j+CS3E2x6JepEsODCL4c/DTMdAD0mtQwB0a92?=
 =?us-ascii?Q?BEkSFGcWEo/pYEqZtygzBgjnHctUl4BVxTTBFBbtROEBwGUQlChtB1esINQP?=
 =?us-ascii?Q?lq9bArZurNcwkjfVPoAl8iK+yxvli3bqVPKAPnlqEa5LVvM1voO0a6hLYbEh?=
 =?us-ascii?Q?FnGXYaRACN7lZMINKprdrtvR8OWwUfbYPtfsQsAtYHpKJn2bY7aCzAXr0xdG?=
 =?us-ascii?Q?+NfmB98XKWH1DJxIIuKwUn2OsSBtWCn3RgSrRlo6k0fN6eJJVNPPbnAiAHdH?=
 =?us-ascii?Q?FJs51TlOd78TtVjhZQ5uPp9yfEUzYep/p31gRTRFYIBC1GwdZx2zvQyato/e?=
 =?us-ascii?Q?pn10RJ85LczQqmWgrsby4WUvkNM5Lz3UZwuekmr8xuxiR8HB0cTti2xIybRM?=
 =?us-ascii?Q?xcR1uHe2zYgb5fmn63sNzfj+iJFKXRjG0qcOyg7WugXRn8CTtlQ3dWXG9QhD?=
 =?us-ascii?Q?6AhKN+k3Dwzgp37u2ykgkEyZAruk8yoMgQnlwQt/cj1tLV9Bb/2gHfnZxouK?=
 =?us-ascii?Q?7gflvIHL1A8gKAySL7lkbfp2+719GszBMkCpiSuYIXHHFKSLf116mUNqA9ER?=
 =?us-ascii?Q?bxepzKVm/6ylxablPvHWWu4woPMgSPQN/AZncIeA/pWMu5c5t4xt/wg33i/t?=
 =?us-ascii?Q?iHcAw85eGDnlJgKAstkCIX9CiewIC8bzq6LQK9RLydvzVfTIiz55Rc/u7yze?=
 =?us-ascii?Q?PzDyqcvb3zoYzsliHtDDYNXZA9nfuxZmhgsFSL2VO8o3VrqesYYzYhHLXheH?=
 =?us-ascii?Q?UfRBcrq87aiRo01sEYQxwKaF3SaPWwklipcbQk7fAID9MqrGEXHivxrVbqlG?=
 =?us-ascii?Q?o9L4W3uguXqTSSylC1Aqdlb7kFQ788mi4ViHLKuc/NNr9HGQ0CMSAMxgc6s0?=
 =?us-ascii?Q?5xe2QEDFQCDfrFeso9zqmhcVJ5gH7g7iUmpT9po9q2egiCFgwjUZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9faca5d0-8ce3-43ed-5035-08df1939ea7d
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 06:14:24.9131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gGQ8JK+5zvsuOljJdpYoimYFG4Hql+Ua1+TJkDMKlsxzAjb1FJR8aLY6eUZsfvmg/WUW+Vqv3v7bbfRmN3nuMkDZ9iB8w5qWR/rP22NEwTk0q/dSwTES1i0GLEjDy4gH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8339

From: Chancel Liu <chancel.liu@nxp.com>

component->dev is the underlying i2c device whose devres is only
released on physical device removal, not on ASoC card unbind. Getting
the codec clock with devm_clk_get_optional(component->dev, ...) in the
component probe therefore leaks a clk reference on every card
bind/unbind cycle.

Move the devm_clk_get_optional() to rt5640_i2c_probe() so the clk
reference is tied to the physical device lifetime.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/rt5640.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index 03d0ac3359f5..d6068bb5cb4c 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2667,11 +2667,6 @@ static int rt5640_probe(struct snd_soc_component *component)
 	bool dmic_en = false;
 	u32 val;
 
-	/* Check if MCLK provided */
-	rt5640->mclk = devm_clk_get_optional(component->dev, "mclk");
-	if (IS_ERR(rt5640->mclk))
-		return PTR_ERR(rt5640->mclk);
-
 	rt5640->component = component;
 
 	snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_OFF);
@@ -3012,6 +3007,11 @@ static int rt5640_i2c_probe(struct i2c_client *i2c)
 		return -ENOMEM;
 	i2c_set_clientdata(i2c, rt5640);
 
+	/* Check if MCLK provided */
+	rt5640->mclk = devm_clk_get_optional(&i2c->dev, "mclk");
+	if (IS_ERR(rt5640->mclk))
+		return PTR_ERR(rt5640->mclk);
+
 	rt5640->ldo1_en = devm_gpiod_get_optional(&i2c->dev,
 						  "realtek,ldo1-en",
 						  GPIOD_OUT_HIGH);
-- 
2.50.1

