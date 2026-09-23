Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011005.outbound.protection.outlook.com [40.107.130.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576844446E4;
	Wed, 23 Sep 2026 06:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144087; cv=fail; b=R1ItqH6w18Y7MNc8NAnbPb4Qi+uJwk8a/PNhi9+TMzS2C1YsyA3846tDeW2SIqGX8cOHQhUtiOSwqTCQlO36vh5qq+YVvLpIVnUN8RhwJsrIKa/40MvKlfEk2pOtPaN9/LSrX/0EhalVHTHDZ9cj3wHlEBR9e/ez+EBf5GtLPZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144087; c=relaxed/simple;
	bh=r/zTdlq7Jy5Tiwl8gnqpM08S5NLLfvLYcMs0BuBIvqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kIR869JBeSMTzGmsuBcyfclK4xWX/6/vVOfFLUgjo+Sadw+Cf2D7F2vDuIYTCbMfpz0VDqg1Lzt28ovzkRs5of8Iu3qBoAAB4tI4q2SXFwW/DAR19KFg6nGoxfJ6RJkoiXkbdtrPR8EmpkDDv+AhTZ6oRj7tXMx4IWnnv3tnX1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iossBspX; arc=fail smtp.client-ip=40.107.130.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iossBspX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGtVDn18unZeq7KhLmVGx/MFST1eVOPDrtiOeKWUezTnC1zmRCbXpPf0Q9wJjybJ+tkCQkX30S0zaE7COTjxJptW9eUaQtyclfmwFNYWDvwmnuLPfA7zW56WAT7gw8v1t7zXi86WO9/itH+W0Sf1+5uuEMkcBVG9jPeDxh89a3cS8d/2ZnZw/Cq04gLugS3gZc5omExS5NaWaO/E28tN0cD0lMBb2SM0WFhKUGJNi6XZX/RkAo4Ki2/CtWQxIo+SP3jt7s026JNHFeOSC//bGXi1xEMhifOHdusl2sxa94GMu57cDDwPfjwECGgYGcGyAjQPdk8XhqQ3I+6l+QfXXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=syyI4noX614QyhJXKFAb8Yn43sk5lPtVZT2395KgcIE=;
 b=HrMW6zmBM6YsugRoAVJBiDnVFJRPQNDeJ9s5TcMylZUOAyCuUQ6Q7NVDgAtdfcizN9ipUOdRIUgZdyMsisQUCPnl+POiSrh+HEBGbluuf9OpEKVAO+FxmzlxjdYfR93GWGlz0R4lCw0fltZ+rUDRJA6Yu3FgPgAsH68jJw7XpWKlQYpDIqGJ756VNQsh0YIqyra1NcLMxy2HZd2PXFL+fcRMAmT1IBcm1LneZ7yvdUNSrcDi9CEkPxB0f8OM8NUXZXcTO8BE8WyIWGN6xCerfbgS16tBUOd7KsRs0JjI/fPrOg19i3RZhlEICq8Cmj46ZN1q/swWxuOzu7VLaWbgtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=syyI4noX614QyhJXKFAb8Yn43sk5lPtVZT2395KgcIE=;
 b=iossBspXw9KjKRYgCD1Xf0FN8Ls4pUiXAAmdQ5Q0ldmzycrxUs0DKAnklb3Hwu6AOu5E5xVe26lIM/s2jbjr5hE31la8viP5vJbO4wMn/C+F5EQrYNN1Me/XaKmuyppTjSDatQKDgkWOOwWKGbqc+N1L1kUuCCBODrAlYQ9g9oAl5fi8cJW6z9SEj5TL2M+3WjmtArsoI6uC/PQWnifR/mgaMjojMN7UKtzeZEqZA/Sw16C+kNjydUFIYff2z4dbXEJXR5RhCBJDxMjZDqzTP0BgMmh3lvOTDAgh81IGJi6QVGqZxNwieL49lzigFCCOZv4tLo1azDb0LdRhpdgGcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM9PR04MB8339.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 06:14:39 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 06:14:39 +0000
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
Subject: [PATCH v2 11/21] ASoC: codecs: rt5514: Move clk acquisition to the i2c probe
Date: Wed, 23 Sep 2026 15:12:55 +0900
Message-ID: <20260923061305.4041197-12-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
References: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0166.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2cb::6) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM9PR04MB8339:EE_
X-MS-Office365-Filtering-Correlation-Id: 37b70c44-50dd-476a-5538-08df1939f2cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|19092799006|7416014|376014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7O0xFMg+vdMqnS9XdbN6xPsAjipcF8HgEgm3XVUXOv/XY1N7H7hb5mIlXexYjGihEJcvpDa9IfPXM4/fX+1JtuJRCwHe2GrcbiXUdH8aGCcq+PvPDM37Tce1Aw6CVaN6JBNpj2CAMLgCdswRDsRBbMjrn5gQJ+igzNCQLRL+Xou1FSEubtj1fqNCfplVITqvSQNRJKW8XccnHqic6PaavePjrPmJv5tjfnQEzOvH0G/PQAjIFzILRp+fUKFLxj8N+mlf8SuSVZk683BuqIYMauvTrrHcAoERyE21D5feBV3DCi1LxzU2UW+nEuKQOwfIk6muUilT5hOWYfzcgolKh1yUuOIZx1BHQd6i1uKatpkrQzNUQvHwbm+HKUKFmXsw+beS7LY49uolI9iVW6pHYtty3dGM5/sD/6+2GTCndNTMzGJfjtPjp8Bolqf+pBPt6X2fT/bkf3kc2bRMdEZHdtJ2GyfiwPdydnGHfLj3nwSVgJ9eyfbD/IPpGB/McFlMZ3cU4egi+bKOtL8oXfeA84cIYXqEHon3GHIlIaNVCSLvhB9vduhEIx2/2HuQOHbVO8YQVpw+Z9oxg1A9IH2K8nQc81389nSI8xxwha5cGh/Yyu4I6rifvmmMteIJYmH3dBOXyeyonYTPuRFtg/MX4sV74RLoxbxPbWNVjk61qcQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(19092799006)(7416014)(376014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VUck5/AobwQ93rVO12OZrUqmScqvZsiIVHdjBPq7FdhN3REwPyVI0aX5bxSy?=
 =?us-ascii?Q?TWA2zrqGV5sfEkOSFTfCc37d3PoLgDLwT5RmAcM6ICUWfGCiw6OCCut1G6JM?=
 =?us-ascii?Q?Shnu/Nu6UPf8AwipXEKnSYMxxDe7NyqoZf+SJaanw69H+oVrkcNj9SxC26iG?=
 =?us-ascii?Q?RY8unSq8ZB0LuRc4g86B2lpOcf2kQx1EMX1+EZODKngpdAm68c/xH+AkmWMP?=
 =?us-ascii?Q?OTWBtD7C8lkPR383X461VnfYhvDHZwuzDbCNaHbV1IEh67otl7E18/mXY3Wj?=
 =?us-ascii?Q?Th3iTaCtWNc0fjJ9YjrVJCGf3pTqi99uzG4rQgYUcsp8czKoyyJofhqcqeej?=
 =?us-ascii?Q?9hlNapGSaEU5YzrSDdcmSYoGQ+66XzQnzNeMX2H2wsNsA2la0gcOxi7/V0bu?=
 =?us-ascii?Q?lUhlrhtFuLJveNgaGxlE941JneK+/XPpQ9VK7wm7gut32p6XCdybihSFy4u6?=
 =?us-ascii?Q?f13xlcf76eHnTOgXqSNjnb2s4oGM9+DpOPJBXYzUkrZl5d6uReuHef+UEyN6?=
 =?us-ascii?Q?QV2JLAqEdCYUPS6qWjTrPn9jdQLL17FOJ3vPOB+wgmqwCutKWs27kOz6vPyZ?=
 =?us-ascii?Q?QLzYmLE0+vdvCnL/83ZSWFNc5fTBzWrofJF/3/XD/lGN+m2JMecix11s+/Fi?=
 =?us-ascii?Q?ziGgoQMwLA8qZm2q5rLcywQulukAxVGEERasr2yeDTMCKu3zHhhM717QaGeh?=
 =?us-ascii?Q?4Adr+LJXKWD8wXG2V0HkGMHYydDat+xSZlbZT77naDt5ikPwvfNNnLfCY57d?=
 =?us-ascii?Q?stOPEg9R3rCgkrQcLsmFckk/py+hQFeqEQN9Xlb+aZQq6fstIBxTgmcSDUHy?=
 =?us-ascii?Q?/v7Ajfw3zUVeqfORgo5hhN83/gXL19zhcs322lyEN3zOIgTWwtj+Jt+DJMTS?=
 =?us-ascii?Q?BPjV59hbG63QaKwh8UjfKF+5elvJznJUEGMWkL7Io8uF/AyUS2FEMuyDLfmT?=
 =?us-ascii?Q?VPUjKO4zTO5xtw1LdBmnB01bFGlnPENQPkZtUuGc4lsDfwMSZvpS0viuF2ja?=
 =?us-ascii?Q?+hQFeqQ8lHxgnq9M5XphAxQEWPPh4LHO+e9pl2RpbjL8+G3u1HHnNr9/KeoC?=
 =?us-ascii?Q?h9rf6Y7lhSQaSg7cCHpTRThbSItVEJ4Nc7NWC3GVvSAn7fDloOb+ytToDy5U?=
 =?us-ascii?Q?MPkMyGFA46x1QLsYXyQ7dPGV5hsUlUePpRyvdeJsx67JdYyUnVN5IvOim0VS?=
 =?us-ascii?Q?her9iN/JYY8yV/clclMUbXZR6E2rCUvwWAOlXYIDtSXhzSjG0E+Xd3LAS24d?=
 =?us-ascii?Q?ecgrGHt0yURC/lBUfqmgodL6474UUJY0IJRD/NKAt4Rv6R+A6saDlaXwNpB/?=
 =?us-ascii?Q?c8Alrujn1pMLbJ/igGwSpc8qw1DwxS8Q642sWorpRsgSbpwB45J/eHbFZEOt?=
 =?us-ascii?Q?a20StIq6+eDslyKXgiXgGSEx3N/qSv8C55KUapM3E9TUl1jXO456MJH4T2PV?=
 =?us-ascii?Q?T3b8UiqU0AZD8XCCYduM0rfaZ2LEwJyS9rhA7UHnHKPXVwDa9n8zQoO5wnXd?=
 =?us-ascii?Q?VBWIpfujMheFsdKtinWh5LPF/q6pc0b3P34/Id8Mvuk+uD0rolSVjuXyOvaZ?=
 =?us-ascii?Q?+s319HA7ZvDHWfOSWk84ePpdWfHW8aGkbwmmTU+0Cdkmx7zu4kqMKQIHoi2a?=
 =?us-ascii?Q?6tVjjtc+uF2ExLJIiPUNbt9PPQnrsF3ZrnvyXT5DGz0E91I8b3MqsaAhopmO?=
 =?us-ascii?Q?rUovaEzfj2MHhgdyH42aVw7kZKDdHhmae4rU5zHrN+i9rmtotOFT+JmqtzkL?=
 =?us-ascii?Q?Bt96fH0jBr5aensdR7DOExlRkWNVbIHxH/Xos9Cu4H9HR5sgDLt9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37b70c44-50dd-476a-5538-08df1939f2cd
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 06:14:39.0976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: blZCAw0XPva7WuFNEQ9GiUfEcWBg6wmSCUZX9076x2AIzcafCXWgNlgYBP4ZlBc/Ckgy3F4cn0Jgmchy0ojtMOB+VpUIKkzCb0S4C+LANcihbItUKka8H5KClUXURR36
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8339

From: Chancel Liu <chancel.liu@nxp.com>

component->dev is the underlying i2c device whose devres is only
released on physical device removal, not on ASoC card unbind. Getting
the codec clocks with devm_clk_get*(component->dev, ...) in the
component probe therefore leaks clk references on every card
bind/unbind cycle.

Move the mclk and dsp_calib_clk acquisition to rt5514_i2c_probe() so
the clk references are tied to the physical device lifetime.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/rt5514.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt5514.c b/sound/soc/codecs/rt5514.c
index 753143e2d11f..a33fbc9fb047 100644
--- a/sound/soc/codecs/rt5514.c
+++ b/sound/soc/codecs/rt5514.c
@@ -1099,18 +1099,6 @@ static int rt5514_set_bias_level(struct snd_soc_component *component,
 static int rt5514_probe(struct snd_soc_component *component)
 {
 	struct rt5514_priv *rt5514 = snd_soc_component_get_drvdata(component);
-	struct platform_device *pdev = to_platform_device(component->dev);
-
-	rt5514->mclk = devm_clk_get_optional(component->dev, "mclk");
-	if (IS_ERR(rt5514->mclk))
-		return PTR_ERR(rt5514->mclk);
-
-	if (rt5514->pdata.dsp_calib_clk_name) {
-		rt5514->dsp_calib_clk = devm_clk_get(&pdev->dev,
-				rt5514->pdata.dsp_calib_clk_name);
-		if (PTR_ERR(rt5514->dsp_calib_clk) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-	}
 
 	rt5514->component = component;
 	rt5514->pll3_cal_value = 0x0078b000;
@@ -1285,6 +1273,17 @@ static int rt5514_i2c_probe(struct i2c_client *i2c)
 	else
 		rt5514_parse_dp(rt5514, &i2c->dev);
 
+	rt5514->mclk = devm_clk_get_optional(&i2c->dev, "mclk");
+	if (IS_ERR(rt5514->mclk))
+		return PTR_ERR(rt5514->mclk);
+
+	if (rt5514->pdata.dsp_calib_clk_name) {
+		rt5514->dsp_calib_clk = devm_clk_get(&i2c->dev,
+						     rt5514->pdata.dsp_calib_clk_name);
+		if (PTR_ERR(rt5514->dsp_calib_clk) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+	}
+
 	rt5514->i2c_regmap = devm_regmap_init_i2c(i2c, &rt5514_i2c_regmap);
 	if (IS_ERR(rt5514->i2c_regmap)) {
 		ret = PTR_ERR(rt5514->i2c_regmap);
-- 
2.50.1

