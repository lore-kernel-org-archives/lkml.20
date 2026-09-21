Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011038.outbound.protection.outlook.com [52.101.65.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19252485953;
	Mon, 21 Sep 2026 10:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987716; cv=fail; b=kyWMUJZxe0jKhBQNcSH0Z16XH77AugYOsFgKV1VSXp+5XIbLwkDkufV1AASC6SX/g3OihKtk6YfW35qoToQ11GdlCzAbLEyJxryEgkBnt2oU0B6/H5k36SPwehLNVUlO9S2UZbKJdp+OlC5638p5erkZyN9KAMR3SK9+J2KF9F0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987716; c=relaxed/simple;
	bh=ACLIwfI6+MP/LziWe8+WT0hfuSfpBA+02D0LnAe94Jo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F/A0EfBx1rgaBmFPZJ+6s9w0lVQAAV+MZhGZlFb8093aDPo2ubuZbt6KgKTn3FznUR1EF00kE+Igsv7e7ha3A3SnXcBH/Zmi5vDUV2rRyKR/7em4fdH13VlcrofQ9rYpHPqNopdtYs+BtmyYCXyMoNcqJAhe7MoT8GsFYuMHaS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PlRZYCzs; arc=fail smtp.client-ip=52.101.65.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PlRZYCzs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n4Q9lIe+J1DMSl2bLmDrslk8LX0+CB5KGRJ2qYdVwMa9LmlSGbtoIokFS6CqOxZYHz3HGYSMj8rp+gMcs0g/h5wEo8wN2TKwxxp+dIuVs2vAdWrdud/TLiqXgYGgWF1QtQRW1Qherzs5pXqEK0+xsVJ6JZfWyFf4BBsbCKbemaTPKOkG7wYAQMDI10zWfcjg+tKmyfECvkLcARE5BxKnJCmleBnFPxuMVoW0iGGcQ9cNIuejVfkDB7nBuEK+M0+B36lQ9I7SkxPCpnxlaF0oyo22CKUSVKgd/tWp47T8BP4lQJHiNpyjo+QfnQOwKAafN6m2QRf+Y61aojr5kaRLiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YqlcUEgwgpt1Z2duAXgZuNaoc3t0vkQSgRKbhRZdnwA=;
 b=rUO2N7zO2tb+mw1LL85Wq6YtbYXRbBuERY5U2ygcANPJKdwQyFv9K2dzE7NqHn+gJcashN/IXrdx7dcKEbN/PUO+odmoYZrqFRcdixJ4jyLOZ/wcsmW7/BJq8u8a05PUcY5SwBfpWod5spR+NDkWT0RtICUFj6af5FgyGkIZMKYA/sfsB1RG6TKcz/MycXKa5Rd17Tigs0ZoJ0ECwhjxCS1ENNiTZEwn/3M6crp6ppl9/A6/lcMpZpRCCAFWas3SRyqZR3z8DyFEWVJt6n/24RR7/FQEhmA5394QKKyHxS8w5cqMz0J2xu4U7WlVm3mXxruidvWOF5yje9X3JGhfWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqlcUEgwgpt1Z2duAXgZuNaoc3t0vkQSgRKbhRZdnwA=;
 b=PlRZYCzsmpK3qzmK0dgSYaRpL+ZK8EpJYvKgW7mTMss0hhtK6QdaRDNOpRUiE/R4bwSIs5kT/nhvShZziBXXo2x98T2xEIt/DfX9Jzq6rPZN4Emx6lZHVfX3YWGZwChaIAM5aiZR6vRLZBvtoWIztQkgzpvEZH5mpaeB5HN9aaJ4fP45QzQNgECoqoopNFVo7CCiS0JqxImw9gBGPyZ88ETdQ4WGYHpSZYPvsFNtJ5YCtQ9QdqkV/RWKgD25pCWh0sMjHqZUHxdxxmlSaUeWTLvHIHKoA1yKy+4G3O6eUSIZg9LCwVdGG+v0LFmmYZItynyAFiZdwEWrjn0tin4a7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VI1PR04MB6862.eurprd04.prod.outlook.com
 (2603:10a6:803:130::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 10:48:31 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 10:48:31 +0000
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
Subject: [PATCH 14/21] ASoC: max98095: Move mclk acquisition to the i2c probe
Date: Mon, 21 Sep 2026 19:46:33 +0900
Message-ID: <20260921104640.1941554-15-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
References: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0039.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b5::13) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VI1PR04MB6862:EE_
X-MS-Office365-Filtering-Correlation-Id: 3653e5c6-23d2-4bdd-0495-08df17cde06f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|19092799006|366016|1800799024|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	FlHBFWMyBzftOKWOAf7GfrQ8TTWvGlvN+mW73Uyrhi0pLoJLGJKs1FWpEtM2JfeUMnJq/Y/zzDgC5eTNqU2wttNQaYR6rljbrTGkieQvoPA7S2UGiCOAfJ3QBbhKO99jSDuBwJkAUuy0sq9O/4ZJ35qjP29sEXs5hUlyCeeRV/kNhmkvcXc0DnCsZqVTWMgUkCR2B9LOnVl+AAzfel8EnBvqGQby0nwc6A4sTbXi2TaGknkJwl3KhZmkMwVWjV8jKF/NECWCXOASa98aZq/kn87Ch2u4dxVmesJ2/7OLbJoq3ECsmlFwTk1/BWiaqqgNgVzUOAs6Z230b6mXpCxEnBNM3QDAw2j8Fnvts7EW/hgmWaULbFvZvNxIh5GsPS+K5rnfxkD+YUyTxCfk9I4Oo35GcpRdyFABhzCJyixZgZSxwAyAA5FFrwyvcgdvgYRxMb5TDlUjNiFBhqiy6bfdr3bodhU65dMG0f1kBUfLJ1/AQK9Uugixj2tYIZfzfvF+HSmiyoO8mefukl692TeNco0BYUDhWmt8O/NL13OXNzCPyvrN7NHCxb3QhVBKQC4mw0oqWNOiGywRjiHlGdBpxHsSk7lRV0iyLFz8ODB+lfg3B+MAqi3Ann4hqC0c3KkdtLh3/V7VPVXe6fnUa5jHtOYjRYfGCfhHD71i0KCR/v0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(19092799006)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Hqj8mFY5DoKX7fC4qVwbaBZdBQHar1HXTJNF24OWFYoyFQ8u1vVdZYQSp0RL?=
 =?us-ascii?Q?2PEhBc+/nbK2NVyE0wNOACEpNV2lHuPzmrMarQBuIP2F0SnKm8dSQlmoAOlJ?=
 =?us-ascii?Q?h51zBsQb+6wEYClogxK3fMHRgQC+fReU9ukqYXViRsE0ombI0GJMmKVAcCD/?=
 =?us-ascii?Q?IPZpc/jUW/+Yo2kWAsdRX1suUWhvSr1eLkqDASquEQq8PHwLa5V+S8sNn5zM?=
 =?us-ascii?Q?y78/5nORCQ0VWAoRHMkLxwyJMULHDQgDg7amENNK6N+f4LHh/tArjpIejt8a?=
 =?us-ascii?Q?YEtsmgjWns7Oo2NtBZlFeH/4v9N1+ndgacyZqlUAv5LRC/lJllaZRn54aeXk?=
 =?us-ascii?Q?CHV1mLjlvgMPzUAzN/vCYbMeITmxZ2hpwiHxiWYk1X7Ku8xVanZwiLx2neHa?=
 =?us-ascii?Q?Vlwf0SvdY53cXeH7kEcvNLXA/Qofla1wt/gbAHQnZaRN+vhsT498tLuQ4HO8?=
 =?us-ascii?Q?zOTHi7DEKAMr5cMroX9+t0aAtWMw2ByUiPlfJPWMg7uVKEaiJM1ph0ShVkK/?=
 =?us-ascii?Q?+BfRK7UuvXjO8sjqT8hCcsoOs4bjbdo4BlIJQytNZCaU/sEWtD4QmZuO/XDl?=
 =?us-ascii?Q?9H8zb+DWMqs8diDyXUQ3KzpMMWbLi4a4v6dME5XnTJMsq72hOs3yg6iBsGBa?=
 =?us-ascii?Q?IUErOcHiO7RVdgMxMkyIOn1WTo8jYJ5WE9vSanRTEf9E2+7402d+rCYnNdVy?=
 =?us-ascii?Q?ae2z2D/y9VDLWl6HTv5S5gCjIhQVYnJ3DK0Gcduj9NIbnz6WC+14ZAMlf9XH?=
 =?us-ascii?Q?TzhsLVcqxLUrJ7kXnYYVfAQMyoQrYD7TVHzZ3ueUWsIB/X/GJX7vMcoxEW4u?=
 =?us-ascii?Q?LymYYpwKrviLRsLr+lb0navS/5OCQOjLxObyPzwev38IAQtL67tKVRMhamrP?=
 =?us-ascii?Q?xyH0hPtEMGkVYCsW7ioByfSy76RjIfhwHlhX8M08FVFJW01jD7mSq8AFRbDt?=
 =?us-ascii?Q?+dYFepDUEBEXPLMEjot9F0Ilxpi/WUznE44ya7oQaj+yqiAk+82z9OMd6WhT?=
 =?us-ascii?Q?tSiAmVQxA4Crx+Y9KCiLAUDudj3VwDrJhpG6V7uBcfvn+n6uJW8DGjsdPGtb?=
 =?us-ascii?Q?K3NKgAWokuVLwngxWV3Pj3S5GJnQETQkWw9lAJWUNvOt39QB7FAktm69shvO?=
 =?us-ascii?Q?i+H7PB/tT2oJRHOJfCLI2Dov0NaYH/0LHDt9B5Wfdb1ftrm/XBcXOa/Y/TxA?=
 =?us-ascii?Q?W9kgzIInHDWU/c/3bEn59JNU2UB73ZA3olaKfUuIsea2iPNYiFoZ8rJaosc+?=
 =?us-ascii?Q?r/MfRAJc2yUXa1LL7TWq4SicIbVs4RRe3wMQWkOpYu+vAJrFRPlIZpgFw/dS?=
 =?us-ascii?Q?FM/9U3ma8+9MKj06dPtW+KPGUUIqE7DvlsaPh0RqgJeYILZSNOiOed70Sazy?=
 =?us-ascii?Q?IDr+9CGj7zex676Ot2dgbekXMjgvu7DpJNNlq66DsUngkQ8KbgoMm62x6Riy?=
 =?us-ascii?Q?/lQzk+uSVu3wdaa1jLUH404RRMaWq7DduArXFnD/yEp13XfnWDlZZ7ctTENy?=
 =?us-ascii?Q?UxGeALm6H8Z76FSxnXP9bObf3fhX5PYzizRWzgvExlwIzucTinJixvjMbUYv?=
 =?us-ascii?Q?XE+9lcPQT2z27/Gd9Nu8nh9kNxZzNDf193Ai9TLuy6CHi61wpcjfls6O9Eyn?=
 =?us-ascii?Q?ty/sfE30O7++wjlRQ+E3SSD3hjILwOr24Yi+4OqRuTFLXCk3jcDCC+Ra8I/k?=
 =?us-ascii?Q?7XYqCpCjT8nbl7T/DNys/UG6iY2ApGU4yzcqIThm3kYTpBEhQWFiPBpf864B?=
 =?us-ascii?Q?rsjbcLhFcBZ/H5dW9SscOB6JiRN5meOKEsfY+cfxdlL7xt8PSoAR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3653e5c6-23d2-4bdd-0495-08df17cde06f
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 10:48:31.2977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 93YzYxkAeCevh5NOWt3cCL1HB1Jt+DZDG0C14YoYXCohWfYiqoVTr9cdfKj+FiSzDbZBgcGNIwj/GtTchOwOmx4XHk5Vu4ELlUgGTsW/MTjRDWGp6gTR3rs+hjbas/dF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6862

From: Chancel Liu <chancel.liu@nxp.com>

component->dev is the underlying i2c device whose devres is only
released on physical device removal, not on ASoC card unbind. Getting
the codec clock with devm_clk_get(component->dev, ...) in the component
probe therefore leaks a clk reference on every card bind/unbind cycle.

Move the devm_clk_get() to max98095_i2c_probe() so the clk reference is
tied to the physical device lifetime.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/max98095.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/max98095.c b/sound/soc/codecs/max98095.c
index a64a5ba00379..c827fd47a5b0 100644
--- a/sound/soc/codecs/max98095.c
+++ b/sound/soc/codecs/max98095.c
@@ -2005,11 +2005,6 @@ static int max98095_probe(struct snd_soc_component *component)
 	struct i2c_client *client;
 	int ret = 0;
 
-	max98095->mclk = devm_clk_get(component->dev, "mclk");
-	if (IS_ERR(max98095->mclk))
-		if (PTR_ERR(max98095->mclk) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-
 	/* reset the codec, the DSP core, and disable all interrupts */
 	max98095_reset(component);
 
@@ -2153,6 +2148,11 @@ static int max98095_i2c_probe(struct i2c_client *i2c)
 		return ret;
 	}
 
+	max98095->mclk = devm_clk_get(&i2c->dev, "mclk");
+	if (IS_ERR(max98095->mclk))
+		if (PTR_ERR(max98095->mclk) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+
 	max98095->devtype = (uintptr_t)i2c_get_match_data(i2c);
 	i2c_set_clientdata(i2c, max98095);
 	max98095->pdata = i2c->dev.platform_data;
-- 
2.50.1

