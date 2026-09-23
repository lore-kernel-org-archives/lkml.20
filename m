Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011005.outbound.protection.outlook.com [40.107.130.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872BD43DED6;
	Wed, 23 Sep 2026 06:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144093; cv=fail; b=Xu9pXlP9z8M7kmI4tDXL3aJ7aZFBM5Sqk4+BQq8om4vJYQKimnuNSW0k5K7Dw9RUzMlXJKjvXRIhkVvyXphVkZ9sd5ZOWa9nmsQJGXkyaIVrfYfqbO9pRxEd5zbTahaJyKdMdNLRXdxq9oa5lggxPkaxisQoFJ5qzXH5ml2eK4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144093; c=relaxed/simple;
	bh=VpvAo7qXEd2Rqi1WDYCnzhPE4R0Br/moU1IdcV3fDEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MwPztPKVnBY0eEHsZZMf0Z7vvFigG7LmxPN1cpn55SY4QdbfgydOQ7EUOHngfOgLx3MxtAU+fjEv67dMQ669sZCUU/3n3CaH5OiaP749TuOnTq1CEJNgXj9l/gysXeyq98bvxMVuy8g1vOdEaS2pu6RQfzLU3nv23FJqrUhcOOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=F0aSnezm; arc=fail smtp.client-ip=40.107.130.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="F0aSnezm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jgTBO87joFopljmJwf8U0hPpA3HRF98wZt15ttRRxH9vKS6htUhWWiu2kNwwo6pmGeAgIZPFBwY+Fn/OqEoxD2PKQGY+/9zMuZf2CYCgDun/pJnoQTsJ7WtLun6ik5Y+4ctrbzheF9jMLWDoQGX50i6PwkcX3jM3wtWLdmaV0HZUZbAUgdb9RfRIP8TgqnHn9Yy8p75SZXs+gJygDpTE5uTwdcGflEP5bzMAwC2bYDAYAG0db1pUIz+oqNpFXYwQMCPmIr0AhLjYBKl3xbUaPETL0NeE5j1fMpHA8mbeT/IgKvOhKU6WIWmyspbvhCWyEkZXdP7BZZy/zSLhwZDkDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9CTVnuhHZqeMHOqAN4F3nA/gxXDKFyCpdxr6CXxGZg0=;
 b=JfhNYWvHX/F3qiy5U0olxeZMCo9wsUHP9zYMX+fWCGBIeXdY21bONLp4+Gh6u7Vx9qMfKBzH33YSQ4eyOqjgUeIqcRmVLnlFfkqM+Y+dYS/v9SVoRngotYMsS6PFgUmoTRg3WyVLKxS8DZ7yJxYuinNLEV65eSV/Rlj2YP/1FIYEAabT8CAr/vd13n1SHD+wHg6M+FuW0MrV6HkQj5wDVyZbroDPQs5RFS534T96Wx7OlGcbWMi7GvPMGxcLZSdofZsFx0BG/QBBOyd4sb3sDLIygvdTeg7UrMuqGkyo59GSzXDIvqZh5OsheePphVe7+TsrAFxT2M/ZmPLNnvpMfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9CTVnuhHZqeMHOqAN4F3nA/gxXDKFyCpdxr6CXxGZg0=;
 b=F0aSnezmZb/mACWb4z3TSPfo02Qih5N50s9VjfI5Ur2TGRJDinPybNU6N4M9UmuSrH/ZglIDtfDQILXhsBFRK6F7dQz2MIqOFobMC36PsL4ZjJtpyy/yvU+Vg6XjEZ8VT9vu+EapcygH5h7TGcEgNd77hc2QVQUNznlwRKq9BjkH0DE28/vhv44TOoX0CcgB7p8cvlMa6r8/JcaiabTLrFckAZ7MMb5OQ/BxktyvxwjZuOMrMf+kO1cphmyKWPlnrYWGtD4orSgm3C+ZuzIQHRJgS7WBIKw94z/gMK9vXa9tdJQ+HM1OFNDNRyDjoiwYZUpr6TDsBxkVmHzLbzH6iQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM9PR04MB8339.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 06:14:45 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 06:14:45 +0000
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
Subject: [PATCH v2 12/21] ASoC: codecs: rt5682s: Move mclk acquisition to the i2c probe
Date: Wed, 23 Sep 2026 15:12:56 +0900
Message-ID: <20260923061305.4041197-13-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
References: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0110.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bb::7) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM9PR04MB8339:EE_
X-MS-Office365-Filtering-Correlation-Id: 20b026e3-63e4-4424-276c-08df1939f6f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|19092799006|7416014|376014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	DMW7/rz1ksctltpgsdWCnjwGHiBCK0QXuKX43ItrFdP5/TK43/Ex+9LZ7P111rihXgEKs3NPt+rjtpwNdEt4YnVr42HTRlxWijuTV9Y4wYHKdo4NFVzevOGozGEFmV7PjTDRqD85/dOwZk5Z1yuiWpVtqXMWi8OkHt3waRPSASVf1Wo7xCEnlRBoD9ONuIn1Z2AE+56pu13wctXrrz8+ZiMNAapTz/MjAiVVEl2Szgnm9D4htD1uv2JR4CdZZUZtnRGkcXhzex0hXuqjtfal3xeukELjGZDDWBQSfttslvGN6QGjyQ88WePKYnwo9+VVMTCCSVgwOXRhINGVEhCoLK336bSrPe6eBasIgNdUCT3lAsYyHoJyGH/CVyehmjnInVAsgUanQPrhIuBlDcOpdAdT/1LbDlAhifjp/IYSbOSyIeKSqBpe2EzcLQfky83j6/lFOaCg39jSkmPSnPgO00BOMsMRH6PUyY/1aa7OzjgmXG4xjkdKeK5Pv+V6IjkBwBkSxNPCnwpw7CZtcG+BI6Qcusl1sAQ/Z/Sz3OYe1vjPxei4q/p3n5f6FfpcJZTy3W5S+NVCTOK0/Djjj3OleW0eefqTEw5Xk+Q2eHN4CSomqk56APl66Vjx3Lcw942pYTnIofk7e62rXBXp2BbI2PuxLlg5UFq0rsKRTfJjKjY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(19092799006)(7416014)(376014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EJHjOYM40QNcP7NEyf4OKyh0q41crxa0vmUOojpdIYojyFSlVvuSk/f7a8pQ?=
 =?us-ascii?Q?U1FDIfbEpqQIffC071j9so2BIDEjYmCzqG8AhMlod617yJixvjwTtxLDHm1/?=
 =?us-ascii?Q?bpkfgzPqzWkix3p0a3vchpFU5uwElAsck7Rpc5x54WR3QDgv72Hl21YQWJ2E?=
 =?us-ascii?Q?e3vJGdQk2Sa/JFR+6I5gmkqyrLmX1FiwvencQ0ci/GFU05wUy+/2+PVg/ZBO?=
 =?us-ascii?Q?9BNHwlRQ7TF4CkmwqvZOKVQqwkHqm1fLdrTvf1R89Kh2pWAkdGlic8pbIVxH?=
 =?us-ascii?Q?7duCCz1PWKPUFB78wMLCwrqhImgxZcNVDThEF4TObZiBze7XjTRvh04/UZ2R?=
 =?us-ascii?Q?P8vI0c75ywP0jkmVd+su4Mr+5d8i3qSYCzFd2dfw1bILUv9+xFP5qZP/vvZh?=
 =?us-ascii?Q?OhTwaLxvH+aq32C0V1IdQLCI8NE6uksHn23ccJs53DEnJzLiPvd93bMwJUkF?=
 =?us-ascii?Q?efsrWjImn8ZRA6NeVRypJ4HYn5rtJiYnJ5F1+pBC3RSihPyQymM3l8Sa7/zV?=
 =?us-ascii?Q?QRfQZBiS1OuhCCHM8WzUMJx0rWVeFbrjE5V+oLH3GcChNh4+7eeP6nJcwDKe?=
 =?us-ascii?Q?/X0eV6bA4MkrS/3/iVcf+rQpZT4kbbmv4HE1lbIeZRSlI/+vRZi9hfi7skru?=
 =?us-ascii?Q?SFuS16fR/ybBv5GMsGsRtcRoHDxx8bBIPOaUv8NgbUCYi8Evh6Zzy7JDroiG?=
 =?us-ascii?Q?ok4sKDaS35XDOXaCYxOEMgpagnuiPVAVTn80LNh+GUoG1sANCfg1DMjHBM02?=
 =?us-ascii?Q?e31KlcisBGd3Zbj1Qd+w5E0XN/ifJOMjS2vmFFZCwDirSXREUIeeXgfup8uB?=
 =?us-ascii?Q?9+lpKS5HOdEVGdPMOkHKilDrG3gncS+gVV5iJj5jkz+Y1PmCON2uRia38QX3?=
 =?us-ascii?Q?Dv58V8z++vlGWHGe3WDwYckpqOL6vlPWl/gqluDufpw7ElOEIo81ZDVoD5tX?=
 =?us-ascii?Q?VKMZTsfd23wFPoaFo5uCa3jgMbejRpD03boxZhBe8e3w3KpYoinnd/Rg5z81?=
 =?us-ascii?Q?NR5cX7OTSzN2vcau9ppO8KXRWZY+LiFwpW8RazlquxjjsbEycya14MDkINlO?=
 =?us-ascii?Q?QZJsutEzi0xjplrF9zgY0G8GqvE+lmBOsd/KrCswMUx84lCHTJCKXwYy9YBo?=
 =?us-ascii?Q?6ARhmdalTUL1ltVJ5+rX8U/4itTkDvymFg/EAzosN/I9QnVQ73HbSAUocygB?=
 =?us-ascii?Q?gUdOTfaqoraJSKbdyFqH4BmMmQZqhncfanZKSs+FmC/crccEBuiv3f9H8Wnq?=
 =?us-ascii?Q?ZzgfU7gCWXgxcuarjGqve9+jz/PTMCXYOsaBeeKLJN0N2Ea2Y8IjYZT65tkp?=
 =?us-ascii?Q?uZhf6fZTis/sbEZ6RkVrVKE4uDzPz3q4+yYS+ICxD7c7Ail58HIxMp8wGYam?=
 =?us-ascii?Q?Jz9N59EQZAQkbuM+nMMyRkOfxY8jjJvFkIFDSn5UEnNir3JRfH1C9uvHSn5d?=
 =?us-ascii?Q?2QErddfdAq+9P6/8iK7+liphHoJHsM/Lj3TiZGpgF/cO1pRKtr7KMDwNShZ9?=
 =?us-ascii?Q?otoF+zZS/F5BHKD8y9lVtE7tAGR3CuZ2Vf22+Upr0oXlVyP5A4as+I9qygrv?=
 =?us-ascii?Q?m3CxmuQvvKqh5dDC7giwdm3PN3jgYBfEw7SeKU6PY6sZt6pS4vNzQ7wT+hWq?=
 =?us-ascii?Q?/tThzJ1Psn/hxXgfSTOWiwjfmqSf8ycSZVOb4VQCWUaGnefUuSZF5Sq2WB5T?=
 =?us-ascii?Q?AYHgsWfDbANChNTeVk1J7VCRcJ+EGr0vfEF0sRi64aO1HhIcHIwcSeT0jjNY?=
 =?us-ascii?Q?xyyRdz2Px1EgGkNpbPDhds1GhQGIn1XqbndDtvWQGrj4YVTxu7vY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b026e3-63e4-4424-276c-08df1939f6f3
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 06:14:45.8181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /fg48QhNjrMAbS40BMGzaucWOYTfbhvkFgyxyMoIPaIbQ7M64SnXs1dXTRV1bTVKru5XskXblpabJF75nsIRaU99U1oeS4zeQiSW+Jaa/RAzwtCdvdoe94k7cfQBRdtd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8339

From: Chancel Liu <chancel.liu@nxp.com>

component->dev is the underlying i2c device whose devres is only
released on physical device removal, not on ASoC card unbind.  Getting
the codec clock with devm_clk_get_optional(component->dev, ...) in the
component probe chain therefore leaks a clk reference on every card
bind/unbind cycle.

Move the devm_clk_get_optional() to rt5682s_i2c_probe() so the clk
reference is tied to the physical device lifetime.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
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

