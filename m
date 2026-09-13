Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013032.outbound.protection.outlook.com [52.101.83.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8863CE4BE;
	Sun, 13 Sep 2026 10:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789294570; cv=fail; b=WEY1T6r5pyc/hQjLAPyxY4R4cbYigg7v5a5qsjOtICJZ6ujF17b+ewZBYDp7kJpOu4EfX+FmOPKv2Nc2tJj26h4Armbr/i2TM1reFVfIGDOobbFdF4iNhAmL+Pk4EPKkW3iMi3bZRNEUle4E27ntBpISeZjPTRXs1Wf5Dmv0QNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789294570; c=relaxed/simple;
	bh=3oo432SC+Gn102kL+ddsOoY3bNL0SW1YuGZR3tCV6Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uYk5Xk3T8pi7lV2CEzHg0NkkUchz5pCrQZElN5MUpi3dBZhjnuIn18/zV2MsQTPgzNRhaUPjUyGk6DRxvS05urTMnqs6+LCuOFQlt4zvhb9oJi0PtnxiO7bznfd+Cepljo54lbZqdP+UWFnJMTnfRuXtjzAsChyXWT/a0GSbBXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cUC2xkuU; arc=fail smtp.client-ip=52.101.83.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cUC2xkuU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h9cQwkLtWsEU45ueXz0ty0QdWVRGHV13/IMvjvtdo1Ov3c2MK+riReMyN95uCGl3lEdrfAqSJd7YE7z3cTqvKn2Dg+GiW4EyaKh/x1x67M3ziR3lYFPyUV+EBVrgYbYJifdUiemf/7hA7qE0ROhsMND5lUzW5bCxbvycFdBamd704SSKdaBQHqVwBHXE0rwZLc6l6YfGpYWrgdro1307usnc3kGBbxta6tbUkoWxqOwvFmgWEybfkbOzWEyAzEwybgm6gh0BGSEgIY+0mnTIM+ZGGVzaDHghldtOk5s6n79OHGrLlg0+O9QdaXLsRUgmjJBUH15mvr3FR34LFx1gVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=txOiz7Hhw/ZJtymEQPCzwN0oEvexMpQYZOhuTTUDVkE=;
 b=gZghrohIAitdFwL5iwDLZHChr3qhFZUDbHOUpm/ksHsVxTQMaoeTGgQaFdyynBkecKkIn4dhb+x/Z31iS5hSqNHzGpSZODJgZ816trQJY28ZmXDL6gD9FzRKIRTY42kp101AcNFuR/PTsmkzJ7OXJ2DzVPc9BUmRcrj/5ICP2EcHfDZe1NpcBdZ31iEPKFuXhywwTZRGxkLQmhkUt7C7TXZ08buT3AYWRzNQYDkKaCK2aLIirP+XWeH6eKH0S3Ra0rSK6wAfmzMoReZLJFkdKHrFY8qspItN7ifLu1bCWdFMiYjJJhsxuVyH9n+y3A9RabrcXi6GihwV+0Qvv3R5eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txOiz7Hhw/ZJtymEQPCzwN0oEvexMpQYZOhuTTUDVkE=;
 b=cUC2xkuUNMbwfc8E2zak/+M0kx7P//Tl13JhTfhH/cIgIcOvyrktZzycVuRWN4tTRkSGG1hgRs10I9S5PerHr7QndzQvtQZ18gRziZzHcXwR5X5yI3PVM9nb2aSgYZ8/IxGnkkZ4HzXgCnLxODewoO6+/qs5rOTluHaBktx3kMlcBc+JCAAuVXA601O++RpO/fyHkGYLaAouIL6WJd0LjodZ8YpHSmtorbOua0L9q7eOF3DlFL56Z4wDLm/LU4T+YNVDuLbiX6IApZZl5hHRMRhN2NU9CWO7+QdD19m1Sh/hstzzMYWvQJfQRnfh2DaAM0Xh+7t2dLZxCumpQarRdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM9PR04MB8602.eurprd04.prod.outlook.com
 (2603:10a6:20b:439::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Sun, 13 Sep
 2026 10:16:05 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0406.007; Sun, 13 Sep 2026
 10:16:05 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] ASoC: tlv320aic3x: Register regulator notifier from the bus probe
Date: Sun, 13 Sep 2026 19:15:29 +0900
Message-ID: <20260913101531.2787654-5-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260913101531.2787654-1-chancel.liu@oss.nxp.com>
References: <20260913101531.2787654-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0004.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b4::17) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM9PR04MB8602:EE_
X-MS-Office365-Filtering-Correlation-Id: d6d889c7-47d1-4866-9d49-08df1180051c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|19092799006|23010399003|22082099003|18002099003|921020|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	IT4AIUFAn+iDDcmuusqbb29ePfNw27xnbnUsrfSJnFWLhMmfDMEBpKbhATji5kGitP9/D+M/e2Ep//JpKhRPKqqPCL7uRvAmTRlVcR6nBUckPySmZvaTzhN6XIsMfwUJGtq9m5kBJq6D2PpD80vagDzqtEwc5uYbOomgOcmU9sak5stGsKOyqwM+OykoRnwIq3F/+2WPFwOKMopH2OT2no3taU2xKo3b0OBSQoHk+hyOFFrvf19Tgs58C1DJsOXIgBBsi9w+1b2/X+aOA/RiJ6JDNuH6pVuxVkjDZzjajlJxLCQpO1ZSrVDqHXlmOrngVfjTJPVLecSnakPcBA7VWLQHMxhcQH627kNMjFFpIru+Q9f/xm3yZfYEBQBviVmIguWD1xOKVNcvNNNNBXIYSrkiz39Sr4fB5tf2TOjXJRBy5xbugBiA9ydJkaC1y2cDhNNAH7s3ZwrpsQIt2GfI00wejZDEJbZ7QLUgB9jxW3HNyKzRcEeVI5p3swNnsixOlKcqZviOqa2GH6SrxQl9HZjfXwLjPG46ANau2iS+KoR3OzR0DywWHkAgUeFxZojKm/vHkB6xsivdNF9FraGg0ZlyjC7itWWao82OMCcl4jqBo6hSaLPvV6NBIgxtq5Cs0SwrwQr1iH1cAKOvtl4AJGx8WoY36YMgbLOc008YM1m/rHYHxuua5PwCZW1lTtcjd8TpI3tGWLTW4dIjQAwQdg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(23010399003)(22082099003)(18002099003)(921020)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NS0q5el/NhBMS23lq6dxt9Kb0992B6jvozKo1JEH2fjHmvVGK78qKpHm3fTv?=
 =?us-ascii?Q?KrZ4iWIbxEtu4ZS8zKhAhXyzg8sKgCGOjSRQf0uz/WBUpDwh8oV6XZEukgM/?=
 =?us-ascii?Q?Ebs5EhaOOzjmpyRHhF9fLuau9G7dQ620jWTG4DF6G0PEluOn5eNxvCAdCuLI?=
 =?us-ascii?Q?fZIE3Z5sFa/152FU/aouFvpL0Kuj/rUbSKuKdq/UsrsDou9tP+ULRZ+8AOfd?=
 =?us-ascii?Q?U3vob3THBOqPXElzenDg+pVcJbM+8tZJE4VRU/WxGVkflw2tye4gCO4+vpbo?=
 =?us-ascii?Q?vI0ZZ3AKGYiOxfq2d7da8PICL/EbG2Hi01taFi2rRtxixeEtKp9t1NnfbUbf?=
 =?us-ascii?Q?haMmV3ftIiRCE7VBW4dR1FnhPk9bSlkJxpr1KHDO6mHRfpmDdeS8KyIbqhFu?=
 =?us-ascii?Q?vVuRdWCn3Hu2C5fx/6/nEoE7GvqInpQPplEfBoahJzsshnkJfpdfeJmFYY99?=
 =?us-ascii?Q?0kmC9hZAruP2WdfC8gKfQFAtfa99+/0hd7o2d+JMal7tp6tQdIEMx8lHPthK?=
 =?us-ascii?Q?s+uZxF3lq0FkRLUZyqOy1+w7LUKAX+VTQqXAv/KGAvYFN13XLcjPSpbVsVj2?=
 =?us-ascii?Q?QNz+ntRR8aL1S05hREldyhd0vex3fthYy3ous8z/AujXE2yoffrOT7rMizxk?=
 =?us-ascii?Q?EsP9rviLIB2JcxBBfvxF4x2KgUCgNG80JltrUQDvS6N7tWKg8D598rQcfOQu?=
 =?us-ascii?Q?GcIE0Ea74UXBIKjqCGZDYctcdJrRqi6n30CBToze50sFgsvpzaDqoasqti28?=
 =?us-ascii?Q?TqPnTQjHLWhksvLVJIgKxWDB1LPIjY+6KiWkb8+5aLTMJiar+pjp+TIyO2ZI?=
 =?us-ascii?Q?HKyWuPFJacuTGHtZTErsQ3xvB+2J4tYZbw9lye9kCUBJMHa2vhdTC1uX0yd/?=
 =?us-ascii?Q?3klD74pt95DaNKaMyl1UFJQSe5uZrKbSKdNiLM7sQ7vIG4th9+0pQK2Kz3+5?=
 =?us-ascii?Q?k2lgglpC6kSnbuJWNIwOMQHQm34iOOmIJiXS9aj4DWi0ZC/LGBr5h2K/7oXe?=
 =?us-ascii?Q?9ViDA4ISoiqCTNvC5SeffJsAuVDeje/mVHrVHM7W2y7Gu/9Mos2Mgo95kV5H?=
 =?us-ascii?Q?HuGqRwmxJAJ7L6l/NiFqgeKTqlDynAt17FQqS5mQY90TIm8zKzSXPfvM0aTr?=
 =?us-ascii?Q?LD4f+R/krXi+SbiTg0G+3qHftv97dR70sDQiUA3EdH0lnhX0bIw7VdOxfybi?=
 =?us-ascii?Q?/gjvhbKplvQvSLcHHr757Tqka8Jf1FD1s52MkZRiMufTtxSjhB7vINc1GSbV?=
 =?us-ascii?Q?dMl5K1VES99q+w01nJWw1/zzGVh3Z3s28O5MSt057BnRwknqKhhAL/9uI15n?=
 =?us-ascii?Q?mWJFeiWB40XC5vT7TWO+fYuW457uQGiyVqVwwhYast9haKJnotAPGpOM1Ohz?=
 =?us-ascii?Q?3uL0JyC9z6nDl/b4Zby/lMyrJGNjYQwpNbxqSPkyaGYb4RavXBOsLalNdlv6?=
 =?us-ascii?Q?bnKkFAxopKMay/Fz282D7zo0xaBcDy+Ym6GdB9A+ebgCLpTOnlQeWdw7bhqE?=
 =?us-ascii?Q?ZS1bpcY98WcqMsA1V+K+XXf5jFJQgoSzyuGLO3iiZVna+lNivWawe2fMOUOZ?=
 =?us-ascii?Q?/+3JB3B88G1Q3y1/7xWbytYCF+TQnkjv6VfI5EJqVlrbvd9N4lGEaXYVVstV?=
 =?us-ascii?Q?09CooavtzAydKYK8j9OOWGo/af/4cKwZvQSYDlhLMYX1FzyFAuuATphwWbov?=
 =?us-ascii?Q?lz1gwyfnTIJTcliSyLWCyz32xYJgxr4A+xp0kumv0FjfHA3KzsH3ZLhhfYav?=
 =?us-ascii?Q?47JMiZB7F+IFy+RDT6RSBDUxVG8AnkJ0Pi04GKmp/ef9x4UIHi7O?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6d889c7-47d1-4866-9d49-08df1180051c
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2026 10:16:05.0673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lAUbSjS4Ks9AP2lH3GvnbnYOwg1QwcLpdXibAAacH/MInFtTAHoERcXN3GlQg8tSRtbLiZmjZZbtYifxnd3oHH74lKfnqAK5rIFJ1Fo0lOOic/l+oZLbAEP7wHeaF0ln
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8602

From: Chancel Liu <chancel.liu@nxp.com>

aic3x registers its regulator disable notifiers from the ASoC component
probe, but the associated devres cleanup is tied to the underlying bus
device.

The notifiers are only mishandled when the sound card is unregistered
and re-registered while the bus device stays bound. On that path the
component probe runs again and re-registers the same notifier_block on
the still-registered regulator notifier chain and corrupts the chain.

Move the notifier registration to aic3x_probe(), the shared bus probe
helper called from the I2C and SPI probes, so it runs once per bus
device bind, right after the supplies are requested there.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/tlv320aic3x.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic3x.c b/sound/soc/codecs/tlv320aic3x.c
index b38393a8130f..405c60ec1448 100644
--- a/sound/soc/codecs/tlv320aic3x.c
+++ b/sound/soc/codecs/tlv320aic3x.c
@@ -1627,24 +1627,9 @@ static int aic3x_init(struct snd_soc_component *component)
 static int aic3x_component_probe(struct snd_soc_component *component)
 {
 	struct aic3x_priv *aic3x = snd_soc_component_get_drvdata(component);
-	int ret, i;
 
 	aic3x->component = component;
 
-	for (i = 0; i < ARRAY_SIZE(aic3x->supplies); i++) {
-		aic3x->disable_nb[i].nb.notifier_call = aic3x_regulator_event;
-		aic3x->disable_nb[i].aic3x = aic3x;
-		ret = devm_regulator_register_notifier(
-						aic3x->supplies[i].consumer,
-						&aic3x->disable_nb[i].nb);
-		if (ret) {
-			dev_err(component->dev,
-				"Failed to request regulator notifier: %d\n",
-				 ret);
-			return ret;
-		}
-	}
-
 	regcache_mark_dirty(aic3x->regmap);
 	aic3x_init(component);
 
@@ -1845,6 +1830,19 @@ int aic3x_probe(struct device *dev, struct regmap *regmap, kernel_ulong_t driver
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to request supplies\n");
 
+	for (i = 0; i < ARRAY_SIZE(aic3x->supplies); i++) {
+		aic3x->disable_nb[i].nb.notifier_call = aic3x_regulator_event;
+		aic3x->disable_nb[i].aic3x = aic3x;
+		ret = devm_regulator_register_notifier(aic3x->supplies[i].consumer,
+						       &aic3x->disable_nb[i].nb);
+		if (ret) {
+			dev_err(dev,
+				"Failed to request regulator notifier: %d\n",
+				ret);
+			return ret;
+		}
+	}
+
 	aic3x_configure_ocmv(dev, aic3x);
 
 	ret = devm_snd_soc_register_component(dev, &soc_component_dev_aic3x, &aic3x_dai, 1);
-- 
2.50.1

