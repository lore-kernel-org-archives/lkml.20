Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010065.outbound.protection.outlook.com [52.101.69.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484C443FD11;
	Wed, 23 Sep 2026 06:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144064; cv=fail; b=N2aOdpTM7KR9Mvdi1c2DERNBRGapYg4mzLBcCeHZ6jYsMkWsaN4Drj3HYhkYmDElZJoucYO0Uz89YKAGo9VBcj5v23ULxDtejohYb3wld/cNPAifdfHXBIoKDYYrMwRNlvzQxLAQMLlH/SUEZVWopCbj5PS2FhT7BFEw22lguAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144064; c=relaxed/simple;
	bh=PgK0+gRG8n/xAyp6jC++w5seWnYOcf9w68CNq3/LyX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aKBBDDscgKbpZPzEiDD31tF3EJtW6Ki0o8MITCkuATtd0KRhCEWleYkTXu2/RCbnXmKsN57ldlO32QHK2WiYKmF/PIm0ZiEtBt4/SHpBpXUJ6uVyE4uQx7jd4Jx8dAH31RqGhLWkPYAJmOoIAf11QE0Jn8t7JZbv2qSfmqloXyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jM8pjdV7; arc=fail smtp.client-ip=52.101.69.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jM8pjdV7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BDRIa6pzkb4hVOafQC8zt6YAaT1sAxChmVABNEHlmzppexhK2/znJpOs8mO4uGVjEsJPhT/GugCm4sP1wIl+WHbFZCzrm31ZkDrtnemwexoq2EgQfmED622ApkajjyvVHu6w4m+wEgXccZ52XFEJqhelHDPOHXIopWUMGQorud5kSrzMbdBPf9pDrgKzvMKMSzvA2vXWGzpVAD9nZWRRxDUMZrRH2Vi4MhuZmYsxdnbwa/A8vGu4vqyYqp5OqrwCemjoazSEmB31/KKVlTSK3tMtBnJPFhwBA/nMKpzYjFVSIP6KpQbp1nB1USlhQZMaDVkJKSt7qj96no0IHUjM/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYRk6dum8k/ZLlscthqEH5dcpW8CX9F8697rr841jgs=;
 b=DwIKivdgISDYfTF+HLwDUmtJQZslmdgVxqfv+kSXC+oTq48SvjvHwArDSEA0am3pCKn7lelZBlbybKQjkteLnFtFYBseqYITbo5RZmtobm8n/IYqR9UQ6AJRA2RMC282qGjtLEIlTWPtYJbe3DGtjTlwQrhA+uDnHSwC60ttidAHjo6x7iaBbY/YlV8iOO/zD9FlUgMKBPH1AQvnpsy0HauHGxqBYbQI2Pi/AtrrCwhkgHtg92uIhjezs1pKn6CgUsLzh2LehlEsIomW/jlRy1PsEajDA8Mizbx4y3XmZo6xLGcBJz4bqmvhkEdu8JTXO+aqt6yEZtVRReHDUpDyxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYRk6dum8k/ZLlscthqEH5dcpW8CX9F8697rr841jgs=;
 b=jM8pjdV7aOvgcw8wJE+tvXSqI6Vjv/g6Bs9rkE2c2YRaWRdi2l2cA8rRfEJIAAMUMET2NuYaig77lU5T5t4EfcleEZ8+v5hJVdjpojpNqPUtO9owv27vMhtkytWeyQXAha6PIfSps4ClNJ2K9GRtv0gAD+iYi1wEWSnCVkKA6x7nQrGV0RmFJ3ih87vYooX5qjT/yLl/vL2o4PiLLB0IpWqyMm52Hl6MpVH7RXAbhqtmnigDafKDrfmd+vEM2pQNdl2WUqtt0qqOM4sbrQ442lUH8KVDEkYcBC4mHc6zfgQb1U41ESvpHI7FB1UeeLeOZ106Bsuhhjoj+whDsTebXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM9PR04MB8339.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 06:14:10 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 06:14:10 +0000
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
Subject: [PATCH v2 07/21] ASoC: codecs: es8311: Move mclk acquisition to the i2c probe
Date: Wed, 23 Sep 2026 15:12:51 +0900
Message-ID: <20260923061305.4041197-8-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
References: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0063.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ba::12) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM9PR04MB8339:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b3fd81b-1b7d-4d95-24bb-08df1939e1e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|19092799006|7416014|376014|10067099003|56012099006|11063799006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/LzDAQb4YbqdPqaafzua4fsxw9OjF/c2je9aKxWfGgzmV3aswWduRbxHSE1EpQhkfuwyRh/o4Kn6FGY78rqUrXMX0+BkSVNnQpThnvTGvQekk2g/Ck5XNaziSmPXRyemhgH3xwaFco3jhdCaMkv8NbYeKf8ccEejut/FG08OkSsiBvut4QtNlHODUgs2oak5c8tAlwz7XjaACrHqEF0dPoAh0OS6cRGMgRz7zHGvzR+aWob3ZTNLtdBSrRSC0ycw5+FU2k+MVBFlmFiZAwPIbD8hQZSTGLl+o2t9pLTRDBMGvfrdF95ivwfLjlXo62zjiX72EOdgN4BnYITgNFUq0ZomzuFGJ9zuL8c/CWYbV66p7PBf/tyBuXwoGBz5dU34IHVcS36PNElH7LEpa1gZGDT0ppEdV5/2IRmxAEOO5vq9CsR9W4AUOgkwk3ifC2c9S1Dk1rGh9uN1IIFVWw1e37TZZ6AfWpn6rewDQ+W4lE7o7booaKEDjaIbhkNGuwbzVArPg316hGxd4RtCCIbhjMze18y4y+T76BfLEMOydK7lbempnr41HCqgzAXxLrYm9Pr6/S+Ji7eoz8enOQ5H2iWi/TAoEHf0iv7S/BP142Fct929bC6oYKDik0q4xnuxzo4NoL8hOO5w0qOZk3DVrE8Wj8yOerliqTPzd6E/XGk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(19092799006)(7416014)(376014)(10067099003)(56012099006)(11063799006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uQbY37e3Spv/8K+qzekTIQbDFj4thpu7tSqLa5OiQlJV3BohQnHCzQyM2w26?=
 =?us-ascii?Q?+T54JyANtO18wf3x5aRgNCxaRycuBdR3cIHjdjN4fIfuMdp8TruOS0LJ/V2m?=
 =?us-ascii?Q?iAv/UjsqXthr4VK6hg2QdLXJo3M/cuGuh88HR091mGyHrTJ6h4xSTveWmjjJ?=
 =?us-ascii?Q?6eMFm4VLCK3aONuN9LNwrfdR+gNIm+Iu8EflG4ktrJAYZUV96NgrtWr5rQfu?=
 =?us-ascii?Q?c89//keV5KdpfNx3eq0agxXc1kvWqFjmBWTzTW8ghwQ0xtAjzstDHJiRQyB8?=
 =?us-ascii?Q?xn+PG4GLL1P04vMGZcPqFq3UQ80vSXpiTE9JOqNKvEPtH0g7zNplCuJdKUK9?=
 =?us-ascii?Q?2UDyZT/8y4r5xFKRIRLVMrlaAQ9MLVeVr33botD+W67E5n61FmMdrTsjsKlZ?=
 =?us-ascii?Q?9NdP2T5/JXYefqbK0uPWgEJJfjrnvLxxyGRTtcOvU/o9pcO3TKXJzJUa9ed2?=
 =?us-ascii?Q?/bxt+ZoDWF+j7NI3tZ6NWD+MxQVsd3wjVH3KlJ/zMs6nTDXVJ0msWWPrDkXn?=
 =?us-ascii?Q?WPDUcLCGd/1tWiZlgDJpcZzyeOOPYZ0gzGt62vIbkB8capFldwoli4dIeA3A?=
 =?us-ascii?Q?48m2Qic2y+0WfMkQjcszZYGrayi4SjOtXO7oFk9S3Uk5fF7IX1onGUoWAe5n?=
 =?us-ascii?Q?IpVV5ht6+4QdGX77wRsVMzpAMnoHw/8gWjLl4IfSsJPcan8I2b/kvANE04lh?=
 =?us-ascii?Q?Sbl90Qq3eCC94U8Fc5IBIhTC3BJwEyji/3o1vSnbD9bMvd7CRclqjaa1Cg71?=
 =?us-ascii?Q?CQbmK084fRHubrOK3xlriypJCX5KkfKas9/TPOjFw6/4RG8m41n3YudFelne?=
 =?us-ascii?Q?m3NQbhp3egXu/+uGlWa5pJpKf8x3X8xdlxSvWQHY4dFlrNaS1D5EINjO9UxW?=
 =?us-ascii?Q?/wnUiVHlgeW+rKGTCtV7Slr4oAUzJNQiTvuK5QkmzUuS79o0RFsctDNCorBh?=
 =?us-ascii?Q?YE3s+Z0h83YnEpyp0SUVQS0IzUvq/V3UThpYXM5ZWfc8l6j8c1mXWwK4MZYC?=
 =?us-ascii?Q?YJc+LW1GucmJCaT0AKwwgKMp1YIFh8JK+cmdMYRfOl7x8mYl8NeOOvjC5aEt?=
 =?us-ascii?Q?OseF3zj81GsP0LOMDPoTRDJQfp5x1/aK8DFPdnpAfLcu2HEVor9D0bIOWhnA?=
 =?us-ascii?Q?j2RlmjMjpEFg1exan5LNRTunve3T0sBjGymfU47/2s3YQzBl2HxcqQpTrm8s?=
 =?us-ascii?Q?hvPs/PGHCuhwVN0w6KDmQQ37FwPqc/NihlOcJaShmmBvGT8vau6kf1LaljVS?=
 =?us-ascii?Q?IzpQkUNcM79s65L+z/71Aw0+2paeZvtvCt6+/54bJMR78WYkIACpmRykVGO7?=
 =?us-ascii?Q?q7Z054vT554oPfYgvjDPR0Din4fONECbQVfEu79QbsPkyY4rzfD+0VRt/9MS?=
 =?us-ascii?Q?ERUR1ijjExWRjoHQ/yqcFilEySj9dPVpkZ7QAVTgPsWJlVYEIx3F7NFZTyeB?=
 =?us-ascii?Q?B3LAJp3dIhtDZatpVX+l3VrK+k8afHZ1fXz9dfo9ARSKW1CfJk55qnxAjmtf?=
 =?us-ascii?Q?iuGIpLSumjxonpEAJ/OdEPhJz8czhMJFT/JaQ+sq7nTQ2GvF5SHjSz3jE8Jg?=
 =?us-ascii?Q?G0ivZpidv36+HAgEyX3Hpf/rN3b8DoSNqE40A3au3N2tcv8czkbepMP6JtnL?=
 =?us-ascii?Q?GyJ+wGFs51n9IcnZ+UsHvOViBBYrZ9h6R3AnJwHLv4SpEvu2eAqnK3FGomxF?=
 =?us-ascii?Q?NaRz4J3N7ypknBZNq/fDMm4aW4lED1mmyVoimIX6Q2boEBRwTt71ATfC5x7l?=
 =?us-ascii?Q?ykQu4PwdnZnTgUey+9Oj6oLvOiyhjAadY/YUQHZ2otz06hHlVV06?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b3fd81b-1b7d-4d95-24bb-08df1939e1e3
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 06:14:10.4706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0BZ6vtlyeFvHXp6XsIRRQmO/48OH699lTucyLxp1BqVFjcateDQLdfk/KUV8FkNMkbbVbOIybtRAQ74/Zy91Xw/4ETDQeZvc4N+t3ErgBaolD+qaXl5sAjmesxXwR52y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8339

From: Chancel Liu <chancel.liu@nxp.com>

component->dev is the underlying i2c device whose devres is only
released on physical device removal, not on ASoC card unbind. Getting
the mclk with devm_clk_get_optional(component->dev, ...) in the
component probe therefore leaks a clk reference on every card
bind/unbind cycle.

Move the devm_clk_get_optional() to es8311_i2c_probe() so the clk
reference is tied to the i2c device lifetime.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/es8311.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/es8311.c b/sound/soc/codecs/es8311.c
index e46b85f11d57..ddbbfc2443b3 100644
--- a/sound/soc/codecs/es8311.c
+++ b/sound/soc/codecs/es8311.c
@@ -906,12 +906,6 @@ static int es8311_component_probe(struct snd_soc_component *component)
 
 	es8311 = snd_soc_component_get_drvdata(component);
 
-	es8311->mclk = devm_clk_get_optional(component->dev, "mclk");
-	if (IS_ERR(es8311->mclk)) {
-		dev_err(component->dev, "invalid mclk\n");
-		return PTR_ERR(es8311->mclk);
-	}
-
 	es8311->mclk_freq = clk_get_rate(es8311->mclk);
 	if (es8311->mclk_freq > 0 && es8311->mclk_freq < ES8311_MCLK_MAX_FREQ)
 		es8311_set_sysclk_constraints(es8311->mclk_freq, es8311);
@@ -960,6 +954,10 @@ static int es8311_i2c_probe(struct i2c_client *i2c_client)
 	if (es8311 == NULL)
 		return -ENOMEM;
 
+	es8311->mclk = devm_clk_get_optional(dev, "mclk");
+	if (IS_ERR(es8311->mclk))
+		return dev_err_probe(dev, PTR_ERR(es8311->mclk), "invalid mclk\n");
+
 	es8311->regmap =
 		devm_regmap_init_i2c(i2c_client, &es8311_regmap_config);
 	if (IS_ERR(es8311->regmap))
-- 
2.50.1

