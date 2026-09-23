Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011006.outbound.protection.outlook.com [52.101.70.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1825F443C13;
	Wed, 23 Sep 2026 06:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144152; cv=fail; b=jEsSb1GfCbfZ/vj1oE0VLRbIoMYua/D2/A/cmmLt79y1yFtZFUpWYAkUPVwBvlfly1gDF57IWdDP3g0iLazLhFaQhRu75NZYbMTMFaBpfxd2W+qMJAdMmJVq4CkiWLEHmhX1zZ7eNIIGH3+zQvWAWkNyl4Sijwxat9XQ72WLdTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144152; c=relaxed/simple;
	bh=JPVk6OLPGnYLMjpzmUaSjmgmFcxuzMD6fYGhiLfXprk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o95xhcl1lEiDwf/V23TVUd50J5km9A/sor0i0AtZPgvkCtyKB2Kk/NOqKHeJ11kxZF1Y1aNoV7b8HmjKej+Lfcg/iQe31sITM1hFZgh+WgtRzd4ADCDXdswAkpb3+MKMigx54fG0oZPL+AjUMCepHvewTS5tC8vRgLUbSJHa8mE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SbBvcMBF; arc=fail smtp.client-ip=52.101.70.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SbBvcMBF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZhMxeaffiLRG2r+nik3xtXcy2Yef63t0m7WXfCR99y9wDcAKU1n4C+Q0L5eLy/BcI7PNvru4baLnwrUk0mysFL4mTqQS0ZkAGeiRTodKYfBzPOi3FZ07Oe5al6P1tvcdQ0ZBVqgJ0OrZOZTB1GIhTd4eRASF3nG4VdVMnG7ck2WnIEVg4llidYcaiSvxguonkv8Y0uL6f+9QBTkuwYyfSEyQAsEdVWk8xuRLYYgtuVxU3BP4O19XPmbiqjql7+s4vp86PQdddO7cSwcOSOg0fuqaW3oVBt1CYrcGuu/JLPiPYdr85IGE4jrVAKKmtmkARp4YhKqKNVR7UzaNDSfCSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BxFdUUGYT95PcNgVSXEA0hpu8k8F0qaF05f3olGLh8=;
 b=hmEFE0nxti0bKTKOmEW6qB30UAca7Cqqg+yEp3ArD0s8waPIvdsSS8vx4pH3asfo5lcTCRYhdCGazYWiCzu3VByni+atE8YH5mFT6lakxZeFl/0MqLUBa5KXnVVyXw4WfIad2o+wCfiFINC0EgGsU06QjXe8LSdYoeSRtBdLeskP0BHAbswE+ghvA0xGJMyw68UBSpbxR1930w3v2dXnAfzXZHstVKXZjSdnQrI1VdGOIvWw0Wp7wM5cizX7w4sJ9yZNyfzkIm5bq0ebns0Oiq/10WXBeDm4zfABX7xISDztqC1tAiCMueSCc9h/KLKPDeTDA2s0r2rJpJBjMMWITw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5BxFdUUGYT95PcNgVSXEA0hpu8k8F0qaF05f3olGLh8=;
 b=SbBvcMBF5tB07JXihUrGIzoS5UNieud5JhgDCMwwjhwnLlWPMWYDGmT7HAXVWEx8UfgDsE+feQOYh9usI7FNTfI+kYpH3l2JiK36iiLLOGawzOuB9vrD/jLwQTU/E10GkdDR0zRoxk6ENX5WKuAnGr6PSkvEe1Istpn/nX9YU0bBk+Pyc8WkrK+7/lykSgEImEMcMQup8LGDHi40G57xF2SaFLVGnyfMICqQ+A+0AX/aZLszXXdyXj9Qm9TFxRpOnMcwwdtrA4UjDSt75PQMg1GNgN7n2W4Z8ihYcF6Kgrrvc0WLdliK/iKJ5MFfGY6RbwY2zeuSxtwELQgdMaLC2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM9PR04MB8339.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 06:15:43 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 06:15:42 +0000
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
Subject: [PATCH v2 20/21] ASoC: codecs: rt5645: Free the hardware EQ parameters on component remove
Date: Wed, 23 Sep 2026 15:13:04 +0900
Message-ID: <20260923061305.4041197-21-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
References: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0049.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:115::20) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM9PR04MB8339:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e04cc62-3396-4c2a-ced4-08df193a186a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|19092799006|7416014|376014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	URhPXN3XwaF+bdT6s+xeGGRyFtrBxWr6LgUPl3yTWqY+fg4FfoU7y6vYwZDz8BremHSwnJX4AAwnpBj3UM9tfehcZJF6KHT/hopDKFTDFiOKiJCBDG1M9C/a030iDX7d5oiiFykaxf9rWip3j/Mc8tiKV85/8J+HacAHnxC6wkQz2Rid0H7MYctpWnEmlRqBqRVKGF6camcomMXSOk13HKawCWcNnRgUZU32H2VHefwDe7zICkSJa7OIkOJNvRqGaL+27tPe3hOAvI7Gxe0XE2k4/5e5/9odrwMRBW1qYjhTKw9KSt8ugf2QCal13W3Z+dqfGK1KL/DpqXLFiYKGvLwMHoCCEiOLNzLAht0z8vso7UmH8fa1LEZmiJWKrKn5M75eSQAs897xOOlhm8rpGtDhojqykVQQ+aSHX8oUUeDoyfuIS7ZpaBzlNsJP3MkcDMnL7+0tMsL1joVnQsPcTn2FrWN2D+TGSVEB3BkqVD3k9SgffMPzFH0ErSyMhsfZJORI6y/aXFNqZR363uhQOSPsPoRJf1g6EmBS4QukgiXlJ6PBV6N76aHk1+4BkMiWPG7bXt3vx2/DQzTqIk6uibvBIIyWslGLqAAJWAAxT/CzjS7KcNzAHI8AufoXEBB3+1KwYL4tGq/kGBJvJDM6sGq/FdAhO0mS9foVNfrQTXM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(19092799006)(7416014)(376014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ujTRvBVledfCXMYf5o76TeTtuBJJMLOdUpe5djyFkN2+Cw2gj0aPcQzsDHJQ?=
 =?us-ascii?Q?gJAiLrTOGTsMt2ENRsq7KfWoRzAfrlb7xyxZnr0p9G1g0isUhCMytk83YICg?=
 =?us-ascii?Q?0BHI1PBufCNirMwrpG+CWt5DxG+aEWSebUULlxxoFk5ehqM9kEzYq/2ie3uf?=
 =?us-ascii?Q?lWmP10MdOVuVT6S/NqxdePGGAbRNPki+fgWTFlBjR2Y6ttAAGXsXBNM0alkH?=
 =?us-ascii?Q?l0g2flzjW7q5OCEWks1jfqWIb+9+KflH8VvqiOIkFHktXE9hL9y1zHydlJEX?=
 =?us-ascii?Q?ttT5l4yV6wPDBMKBsMP2LeNH0QtV9nLBAgxbKrlf0hqYyIuCXY/1JZP7J2bq?=
 =?us-ascii?Q?iuNbBMtFx1qpMw+06vYVYRBtoXzko7JIyGpT1RmSKklsCOuS+iGKebpn/dSH?=
 =?us-ascii?Q?SZplqD7NVSXhZoZ6GtJCjeGkqQkyk5mmMDi6GewJqhuOhmPEl7szWZIZ2rkQ?=
 =?us-ascii?Q?S9bouJ2NJjG3tDcqyjsc8r3xG0ZQfWCz509vtK1scJ1cC+8Eeyaxhf5OfMFe?=
 =?us-ascii?Q?tHB8xUYeK/HgmfbLVLKEaMoxw2K0NffnEflfDVEF1qyVmVf4LpFZpjT1gnjW?=
 =?us-ascii?Q?5RQIlx7HPSMjnLggqUC4CrKW6QSms+2jxnBfVibdT/BejBwR3MBu3aK3nrLH?=
 =?us-ascii?Q?lMILtz9KXeNWx0u1VBVrmIhkevulB8qXbgwCdVfNhcrkoST5zSJmXzgurDvB?=
 =?us-ascii?Q?DKTiOe6jt3tpdarewwR+Rtn8yCuL4xOunQp61LJyW5Eg+w3NT0l/eHiEPJkA?=
 =?us-ascii?Q?7lFzuDH5r31mqRxrNvTGt8Rx7R10LxnimbF+g4rGOPUi/aSJ7Nz3oGp6W/4K?=
 =?us-ascii?Q?AjjGuitVG5RopCzMNqKrCU4/yVU9GCG3M477DLZR0rdY9iep9qf1WtkUTJQB?=
 =?us-ascii?Q?4SlTmtorcmJmATm4SftWdanOVUh1ezv5IT6BSyrQKD6/7KCAGW6EkCiVN6Sr?=
 =?us-ascii?Q?t0Hyh04mvoqaIwZYMZE4LxU/QSnb/Xatzi+9CxeU/HPziatt6FYBngCWylFM?=
 =?us-ascii?Q?CkYQou0CmSeOrcZ4nHePHOqVHa3sQNFXLVBp5YZQEy576qzPYaeVmq+1GCf/?=
 =?us-ascii?Q?Sc8TpyJK9f1gxSAmX2Yma2zM7+An4j8Cm7PpMqGl0h4XyAlf2cCUFjBDcPgl?=
 =?us-ascii?Q?gw1p6yJ7CHp9GYHaBtDFDmJQb7CvsxMe462vAL/DjpqC+psaJv4jvQ8BIDmj?=
 =?us-ascii?Q?N5OgKpYrqyaongJMvKs/aJsEng1kdiaWp3fjss5Xxe9Gkwz0AQ5RuUarC3qO?=
 =?us-ascii?Q?7kWLBs851K+Pjq+KhSVSV2ck2SDm//fAl3orPsOkOy8GPpBQCWpyfWxvHWW8?=
 =?us-ascii?Q?8MZoByQoSYraDsG2yv2LasMgsx/tGGvSamiCttdAdd1imDwP5vQTtIjwHh6m?=
 =?us-ascii?Q?PMidEMvgJT2dHZ5WVQu+mjkHIzcATww2HYPCqKA1W9bZbUUbKgtXE6D+hYHk?=
 =?us-ascii?Q?kPXstXidMyn5qHU/J05gQFMtkPP5IWNajVSThVcdcvuT/ll5v5saxisSqDwx?=
 =?us-ascii?Q?mhUffIG/SJGItcEUoE/2Vk+wwUkRXmcBfNgZaiqgMNATr8hrO3s5KqHxAcRx?=
 =?us-ascii?Q?t+WYuWkoFwKaeu5X0afyyG5cRTWoJ4jwAsxjGRYKScSe1P+MHBYuF3gWPCkV?=
 =?us-ascii?Q?OSTij4Qs+ECTWzV43OPKBkj6k0aiL2jJAiigxyespLFvqGShBCaUKXKoDB2c?=
 =?us-ascii?Q?6bWXbB3uwdsFEYaAW1dDrtOSiEvtxI68AFwcRtVxSGUh2Eb/NCVla6LvzIxm?=
 =?us-ascii?Q?KNgmlWJ9+nVIcyzJh2kALUnuIkwXP0VbvhtDV6W9VmSxPg1AxbgW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e04cc62-3396-4c2a-ced4-08df193a186a
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 06:15:42.2443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UrcBS9CrCNCrvVeAqcwJ0fNHESqwJ2XI9RFAdDZ0Dqk/1EFSJu29Lz/EzYwYcHaDzj9Fx+DBue0e8P4mfHsruR4lMTsQbmB4UydvwCRHqkdOX8GVQs6QwpPHmTSHWLOw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8339

From: Chancel Liu <chancel.liu@nxp.com>

component->dev is the underlying I2C bus device, whose devres lifetime
follows the physical device's probe/remove rather than the ASoC card's
bind/unbind. The eq_param array was allocated in rt5645_probe() via
devm_kcalloc(component->dev, ...) but never released on component remove,
so it leaked one allocation on every card bind/unbind cycle.

Allocate eq_param with plain kcalloc() in rt5645_probe() and free it
explicitly in rt5645_remove() to keep its lifetime tied to the component.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/rt5645.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index bb448254275f..15d21097ed0c 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3487,10 +3487,8 @@ static int rt5645_probe(struct snd_soc_component *component)
 	if (rt5645->pdata.long_name)
 		component->card->long_name = rt5645->pdata.long_name;
 
-	rt5645->eq_param = devm_kcalloc(component->dev,
-		RT5645_HWEQ_NUM, sizeof(struct rt5645_eq_param_s),
-		GFP_KERNEL);
-
+	rt5645->eq_param = kcalloc(RT5645_HWEQ_NUM,
+				   sizeof(struct rt5645_eq_param_s), GFP_KERNEL);
 	if (!rt5645->eq_param)
 		return -ENOMEM;
 
@@ -3503,7 +3501,12 @@ static int rt5645_probe(struct snd_soc_component *component)
 
 static void rt5645_remove(struct snd_soc_component *component)
 {
+	struct rt5645_priv *rt5645 = snd_soc_component_get_drvdata(component);
+
 	rt5645_reset(component);
+
+	kfree(rt5645->eq_param);
+	rt5645->eq_param = NULL;
 }
 
 #ifdef CONFIG_PM
-- 
2.50.1

