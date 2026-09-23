Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011069.outbound.protection.outlook.com [52.101.65.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48003396D1C;
	Wed, 23 Sep 2026 06:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144002; cv=fail; b=ZyOWElgBICGuNCwoVS1/wGhmdGR4ipdwRCEuRSyeV6MN10uqOMXe+ZRDLBXTdildSrFWrd8Dn9E/1y8NPwJVNKyp/PlhZvpSDIijwVFR0vQmlZS5x7630LxVN3qMZCO7xpOJUvvSCCa+k2kdI2LgoTNcH07Hk741D26LKhGWgrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144002; c=relaxed/simple;
	bh=9vztH+PjSFFgrPs2Onyd59ZSaPGKNi6YOlld6dx0qJI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=YnkGja7aKU/pbKp6Hn57saXmjTeWNrU73rJs+Kxy49TJ4aJdcnGa3axLVwi5XWaoL8W8+i/AjS/yx6HW/J91hRgWVyNvYkg91xPkxwDwGX7cT5QSUSPh5NxlkzmOFUYvm0gYm3uMmfzwG1Wb13uE90awDEj+lZXTbk6hF4gPuJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GF0e/WC5; arc=fail smtp.client-ip=52.101.65.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GF0e/WC5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X7ZbiloxcFhCdjyC6qGyqD1wFA1gE787ATjTAT0dQpoBSSMbbMxYYOG/wCzwhdHtcjOFjZQjinyrnzaeu7KemPdfShLWAegxK2FFjIoSY5n4/oEGzSNWel9aJ+MD+o1c65E9U1uieDmOsZe/5TOr7oxDvywyRfXc5604aDlJZKnHB1/b95ZOBD/sPCE68/lJLp9/u4VErk7Z98tfq2nlX52Wa9XPz0JQ1jxVkC6raaBnhsgNIi0VjVYS5m+ytgn2ABUWBbTmSreert28+W5I0/iFFDxVGST/Lzn3aVafi1shgpr+hotXMt6TywfweYoBONgVmIaAt7NJKNpc8BmmSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WIIoxapV6SgesKHwGkTB0OOZX5Sf3d/J7Esf2QQZ2sI=;
 b=y2GrSqwjgWCQE1v3CuJaHiFS26RRi5RmeBxaDn+sFdEJh3Zr+AGuI/ncCuwWxh3ssZO8yEGDGmfQ1sAwJ74Kdh/+Ya8T+t6D0tQMZJPyXVB8DvsNx4+ELb22UgwrhFPWDn81o4A5wZnEzhpsVG2XnpNzugtDeelfxfOAWkhy3yxCsgdYdL+zhAczIOrwW4A3e6yNp77meyeac3li6ava7q2V9P28JC3NYfV86uNvpVCaGZZNVryq4Qkqa3kuLoO7caQgnomabfyym2yE3FCKQaQupmlixrfTokOa6qVcwtupHJnqcRy4zj0ZZh983rcoAjayMfJ1UHelzGZ5rUvaGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WIIoxapV6SgesKHwGkTB0OOZX5Sf3d/J7Esf2QQZ2sI=;
 b=GF0e/WC5rwl4lkUonMJfdwxtcokZhaYK689EBo0SUPtqPm502GaGH7BjMRDk5aZ9gPE60SYAaEoDPnVKy+jhAsam9gMdDlGFItXVDr3ySfORFa94LsORAgp0p0y4ILqqbHxGaw2fl/j04HONtXNA1gUA7OmemAE77TKy/x8kuASsllINbcUZ70dPkPyoKTpTUW3U5a0+X0F5hXTf+u86vx9jo0xrF2PMakjXeg5KD9rs1YqgHa6/nCh8HaAzsd+csI4yAUU7YoDLpn5hWc9L8RSlGTgZoxTTK9vpvLh+YgMjoEwb+7krQQp31+G5oLOdWHQ2kRDcuSSFnXJ0MS9Ikg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VI0PR04MB10997.eurprd04.prod.outlook.com
 (2603:10a6:800:267::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 06:13:15 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 06:13:13 +0000
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
Subject: [PATCH v2 00/21] ASoC: codecs: Fix resource leaks across card bind/unbind
Date: Wed, 23 Sep 2026 15:12:44 +0900
Message-ID: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0063.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:118::12) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VI0PR04MB10997:EE_
X-MS-Office365-Filtering-Correlation-Id: 68afdfa6-fa38-4767-7ff5-08df1939bfd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|19092799006|10067099003|56012099006|3023799007|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	0C3s58fgurb8EB6OcsnqxRep4PxJmSxm/7HfCoca1G6fW29TpyjnrGUC3U5tDBoQffKlWuLjSP57zMApL1znlz4l7wsDvCqxiSutBOd8M3byRNLi2IwbWMNTmxPqwZAOtVLde8xSYN3JRWrpC5tv2pg0lKzYe91RGBLAepFlnESrSE4tT2fdG8UfeTTpPbXC/ERh5Tj3ptDw/5pB2QrTiBLOJwyS+pk3EbqSGdZSvESwkeDzL35/5gEyFjHu0AMGz+G0UhLRhv1Lnz3AIlcmzTpw5NZP/dk+pnmL4X6iqiQfXP191O/Y0c6P4MLW/+FHOKg3rq+iYuGPLwxESRdORkoUSYbZ0AYqY25Dnesmu/tCrCnxx72nQHX2rz3iAYfv9hCK3JDlFFshSx1O89uVt19UJSae5MS6l15MBuo6C9KwP+gxb2cchKhmWIn62WU4VXGMuHTHOEV09o/m+L5EN8k6KQ32kekZ6xgpgVgpj18mSfiwAXYnzuGlUfZvQfwRdPSjz/2/kpiVNFKgytBhWTK97QXt3UYsoWOGrZQ6cgBSzRCwCgPrEjoSFSNedOahG97WsNPZ5UZlcz2IoJOCKrMhE+7OWjRfpMsM1J7NaZwjgVRUuHB4iLZ9hhOKL0C6jo7imr8KXtnBcDoR80U4WwiZ+onkb8j/TRt6LMaVzaE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(19092799006)(10067099003)(56012099006)(3023799007)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Bk/D+5cpcSsr4HwOm8bWlqlaE+7UOUXjFd/wceqoC+LhAXnMDc426NRBjR0q?=
 =?us-ascii?Q?k6y+kR+Rl6ObqBbh2j5zVTRdR1z+Qs3HqJHlSmkI7mfIPS4h3Ym84PS90f2o?=
 =?us-ascii?Q?oqiJ3tH+AFXJipihh383fDonG60BQ5qhVuR8m788cdm95Ov8opWlJtZe8Q4K?=
 =?us-ascii?Q?+21Y6kpsLD14IZFxh8DFuQG+688msCjc99o2YpIuIsveXerDk72P24Bw/SEV?=
 =?us-ascii?Q?pmNPvVO5EOzGwggY4gHbJpylW4tGlBO3DIYJMpPoRaPDLFNsWB0Eg84c1qnA?=
 =?us-ascii?Q?1AYJCuGfHCDIxFGjZVw+wvDmA9BDbNwtjzkwWKXtNVhKui2aWe0WVp1txIvz?=
 =?us-ascii?Q?OB3IIP0hDMVRSB5MCEG+BsIHKAJ2ypNSGLkia37NPtATVAU5xBBfsIlkeGN7?=
 =?us-ascii?Q?xePpLRqBgdh84+cLnTHZkwitF4q8QkHD0F4nEZuJMvr2ZQCXVIMDUe/+n2tN?=
 =?us-ascii?Q?AIhMdGk9snR5tdTf4u7Mr/zy7JEWau5LDQJfK/cjGVi22vco1EWcUWtXHUix?=
 =?us-ascii?Q?WojvJrt4MDHrv9NjkMVXyf8twGXemb86hwezlWv+fHCLiapOI5AJoHt8r8BH?=
 =?us-ascii?Q?WO+liCxeYgcSHDfJXh0a5z0P3/1bmzerl5/AmGgIPCCgDIEaTQpdLnh/6nH5?=
 =?us-ascii?Q?PvF3jNVxpgfSltgbFlJwbOb1Qbzk7gJYD3lc+yuLenn6g4UwLjDulMhWcHkD?=
 =?us-ascii?Q?bBt8n7jYvJC2aro/eX6rg/fuRWK5LDL+E2gdQ5xDkaKAq2X7LpsTQ45iFk0I?=
 =?us-ascii?Q?kyjFJLnkSpGVOOKxSV0CUJIQmJwmM/JwXvpT7izoxoGBF5PMn12rIOnzAq8g?=
 =?us-ascii?Q?62O7BhzZrqSQv4VOkEtt02n0hwIl+EU1cVbViNaR6tRBNfW7rTzl39ocxZwD?=
 =?us-ascii?Q?xfaz50V1VC237RM7BYYoD9H/jvwpmzyjHB/3HK9s+iEyxfzZYaWF8lm8nvRl?=
 =?us-ascii?Q?5Q5SnYsreS6fnBN2ivfO7d6jYTRuwFiGNTtVVwmgfBMIPD3p3VjngidJbZQk?=
 =?us-ascii?Q?B33+nJO7jJwMDnfLW7mx95sakpEMZfsfyypE5IJ/TTpj1ytr6neYcYuJPy+d?=
 =?us-ascii?Q?UvK+c2hdjJSi69KyGr84GYCnr4SROpvPqSPsZO1pgX+4GDR7su+Otyc73TOC?=
 =?us-ascii?Q?UA01Ak8E5+T1bMPuYz8aNZIxMg0vB7R90zihDbtQJ/9OlP6XzgpZnfZ+HNGV?=
 =?us-ascii?Q?sHJSRx0lLYzg6vIAjwoKRK1y06BSQtFHCC91amShMTds9xjHNMxNBLRn55su?=
 =?us-ascii?Q?HcrpkMEL0wzQa3qs6J2WqJbypsL7zfi2m1npJV+aQ0LhJ3pelfxv6hxZYTHF?=
 =?us-ascii?Q?rsY8rKNdHlGqupterwKwsq3uQ6Vhc67K0rH5lqVI+dkyyuW6EkPHJnN1RhJA?=
 =?us-ascii?Q?Z5u0WQZoq1oupFOT5qNKFfvmpyGyJC0iMTyWHRiMyIZwz2Y/TyKobKREA+Zl?=
 =?us-ascii?Q?XsWUsIoLSdkd7+O3BUgWa03qYIqR5MYZIq0Eb7TKWOyzs8r8H2VOVuQpQY3j?=
 =?us-ascii?Q?hghxL3Z+SqE8+uc9ONaVj4MhdD9qY8+MsBIoZ0vPuv5EWVlTYRzH7/4yCyiV?=
 =?us-ascii?Q?a0GoCEWlUdtwogKrwZTJrN7LroLtguimHnTWoE1M//RbYk2nbr17hNml+vuZ?=
 =?us-ascii?Q?mahTSuxja3I5InbZYxX5yfo5ei9TaBvw+9X7y7rsL4TjYtEF56Em8G4sgvTL?=
 =?us-ascii?Q?BZan24pumFwoV8LixeLZP/pcsPWV41X16nmR5pnrD79OOcMDoiITPjcTh5Ss?=
 =?us-ascii?Q?QlB2d0OFhTmTS/HPFZDbS0GDMzq5qa9T6U/u76CIiXe/pAONquC/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68afdfa6-fa38-4767-7ff5-08df1939bfd4
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 06:13:13.6562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: em5ea1wOiYdgfamVgKxgeCZHJxcd9294/2ClrVLk3HLsmx2aOKRwF5cgNJYJ+L5tlFgcQxTNsfrbGst4hjutN1GlAaenPON5mAH3Psh/zRKPMuJmmik1KNKpKK0hPqJq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10997

From: Chancel Liu <chancel.liu@nxp.com>

For an ASoC component, component->dev is the underlying bus device
(I2C / SPI / platform). Its devres lifetime is tied to the physical
device's probe/remove, not to the ASoC card's bind/unbind.

A card bind (snd_soc_bind_card()) / unbind (snd_soc_unbind_card())
runs the component .probe / .remove callbacks, but the bus device
itself stays bound across the cycle. Resources requested from the
component .probe (or from a runtime DAI callback) with
devm_*(component->dev, ...), or allocated there and only released when
the bus device is removed, therefore outlive a card unbind and
accumulate one extra copy on every bind/unbind cycle.

Each codec is fixed following one of two principles, chosen by what the
resource actually depends on:

1. Pure hardware resources (clk / regulator / regmap / GPIO / board
   description) only depend on the physical device, not on the ASoC
   component.

   Their acquisition is moved to the bus probe (i2c / spi / platform probe)
   using devm_*(&client->dev, ...), so their devres lifetime correctly
   follows the device and they are not re-requested on every bind.

2. Resources that genuinely depend on the card/component (they are bound
   to the component, or must be torn down when the card is unbound)

   They are kept in the component .probe, but switched from devm to
   plain allocation and released in a paired component .remove:
   memory (kzalloc/kcalloc + kfree), IRQ (request_irq + free_irq),
   delayed work (cancel), wakeup source and mutex.

While working on the card re-bind resource leaks fixed in
https://lore.kernel.org/linux-sound/20260913101531.2787654-1-chancel.liu@oss.nxp.com/

I noticed that the same devm-on-component->dev pattern is present in
many other codecs, leaking resources in the same way.

This series is the result of code analysis only, based on the same
devm-without-remove leak pattern I confirmed by repeated card bind/unbind
with wm8962. The individual fixes have not been tested on hardware, as I
do not have access to these codecs; review of the resource lifetimes
is therefore appreciated.

Changes in v2:
- All patches: prefix the subject with "ASoC: codecs:" (Cezary Rojewski).
- da7218: also move the device tree parsing (da7218_of_to_pdata(), which
  allocates with devm) to the i2c probe (Mark Brown).
- rt5514-spi: keep the original behaviour of continuing probe when the
  IRQ request fails (Mark Brown).
- wm8985: move the "Failed to request supplies" error message into the
  wm8985_get_regulators() helper instead of duplicating it in both the
  i2c and spi probes (Charles Keepax).
- rt5640: acquire the mclk near the start of the i2c probe, before the
  ldo1_en handling and its msleep(400), so a deferred probe does not
  repeat the long hardware delays on every retry. Reported by Sashiko.
- rt5677-spi: serialize the DSP context teardown in the component .remove
  against the exported rt5677_spi_hotword_detected() callback with a
  dedicated lock, to avoid a use-after-free. Reported by Sashiko.
- es8389: drop the now-unused variable "i" in es8389_probe() left behind
  after moving the regulator loop to the i2c probe. Reported by Sashiko.
v1: https://lore.kernel.org/linux-sound/20260921104640.1941554-1-chancel.liu@oss.nxp.com/

Chancel Liu (21):
  ASoC: codecs: cpcap: Fix devm resource leaks across card bind/unbind
  ASoC: codecs: da7218: Fix devm resource leaks across card bind/unbind
  ASoC: codecs: tlv320aic32x4: Fix clock leak from runtime callbacks
  ASoC: codecs: twl4030: Acquire board params and hs_extmute GPIO in the
    platform probe
  ASoC: codecs: es8316: Move mclk acquisition to the i2c probe
  ASoC: codecs: es8323: Move mclk acquisition to the i2c probe
  ASoC: codecs: es8311: Move mclk acquisition to the i2c probe
  ASoC: codecs: es8328: Move clk acquisition to the bus probe
  ASoC: codecs: rt5640: Move mclk acquisition to the i2c probe
  ASoC: codecs: rt5616: Move mclk acquisition to the i2c probe
  ASoC: codecs: rt5514: Move clk acquisition to the i2c probe
  ASoC: codecs: rt5682s: Move mclk acquisition to the i2c probe
  ASoC: codecs: max98090: Move mclk acquisition to the i2c probe
  ASoC: codecs: max98095: Move mclk acquisition to the i2c probe
  ASoC: codecs: wm8985: Move regulator acquisition to the bus probe
  ASoC: codecs: wm8955: Move regulator acquisition to the i2c probe
  ASoC: codecs: es8389: Move regulator and mclk acquisition to the i2c
    probe
  ASoC: codecs: rt5677-spi: Free the DSP context on component remove
  ASoC: codecs: rt1011: Free the bq/drc coefficient arrays on component
    remove
  ASoC: codecs: rt5645: Free the hardware EQ parameters on component
    remove
  ASoC: codecs: rt5514-spi: Free the DSP context on component remove

 sound/soc/codecs/cpcap.c         |  74 +++++++++++-------
 sound/soc/codecs/da7218.c        | 129 ++++++++++++++++---------------
 sound/soc/codecs/es8311.c        |  10 +--
 sound/soc/codecs/es8316.c        |  14 ++--
 sound/soc/codecs/es8323.c        |  15 ++--
 sound/soc/codecs/es8328.c        |  13 ++--
 sound/soc/codecs/es8389.c        |  36 ++++-----
 sound/soc/codecs/max98090.c      |  10 +--
 sound/soc/codecs/max98095.c      |  10 +--
 sound/soc/codecs/rt1011.c        |  30 +++++--
 sound/soc/codecs/rt5514-spi.c    |  37 +++++++--
 sound/soc/codecs/rt5514.c        |  23 +++---
 sound/soc/codecs/rt5616.c        |  10 +--
 sound/soc/codecs/rt5640.c        |  10 +--
 sound/soc/codecs/rt5645.c        |  11 ++-
 sound/soc/codecs/rt5677-spi.c    |  21 ++++-
 sound/soc/codecs/rt5682s.c       |  12 +--
 sound/soc/codecs/tlv320aic32x4.c |  94 +++++++++++-----------
 sound/soc/codecs/twl4030.c       |  63 ++++++++++-----
 sound/soc/codecs/wm8955.c        |  24 +++---
 sound/soc/codecs/wm8985.c        |  35 ++++++---
 21 files changed, 388 insertions(+), 293 deletions(-)

--
2.50.1

