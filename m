Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011006.outbound.protection.outlook.com [52.101.70.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC0F448BB6;
	Wed, 23 Sep 2026 06:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144122; cv=fail; b=KGtHhaVgETFM+dsaFcKw4WMPwDR1KkEl+fTCYxvfMHCHsHucN7rj/A0m3FhNkApvPoYkakZF24zqUJ7O0b1FOeNGgbD9kifjzNLV7yEFY9vY91sOhmugs5gqlEt4afaH2tsx5/ccvS+oUm00tP1lf0p5YV8T+8rLeEmvR5fy6kc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144122; c=relaxed/simple;
	bh=9NhWP74d3mPaPE1tLFZ6wCMUVzC0I0ArZSXaLWFe5vs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pbgni74fM5M/cFDC5mT0zpacP9jF4fGKi7eec6Gn8QxWC2H3vq8BVXlIiEVf9yU8Skx9xuNQlzF1r63ze6jbC0Nbkdljj83M+Nl0IY7YHZzv5WnFLZ+heSkj7Xy0/nMMPEBo0v0uT08AVESl2j4P1AcGGoV1xL/kzj0JM1FA9Rg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=s3x5A6my; arc=fail smtp.client-ip=52.101.70.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="s3x5A6my"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AqO8jEOQf9UaW7eRSxwD3wvgqr5XZqrmt1HBMv6HtDQffrbmRPD5U9gy6n5fASQrfkQEWolPZmBx8o55xLmFIBtrF98JWLOhaR2Z0rWlCZ+fkB+7KYlQhdWMI9oEIJs+ONrOqWn4YCydhUY2fOUlKjkqL5lZ0w11zcUfjD+dJluS+SQH6lyVPDLGqgW8INkeSUcEGi+QT2sgZIeq07xLc940Yk8qJEzCNSreh1oHJVTENGTV0lqbYZh+RWEUD79plOqjdI9NpY9dvrzv8QSHBaU2/csod0viDP/CpoUAe9Oei+DAsVHi4yzkezdM977DhB19cfvt122IdZ7ykwslUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYoyb8dfU6L91BqURFZX5DX6jAaL5bAOZs82ZkFr8Iw=;
 b=hoiEiwNPqwZ9jBAkK4/J02jhlC/pc3PKfUnBoPAss65zfpVbgY3KOnB5p1b6/1ZP+qt1bMh2hBhYwz9PM++Fo+xJfbaQ25gq4mMHr7bQO64w2w2ejEzWxO6Pw4NzAng5SUubYookhmMRPn9Dy5tGaZ5ON5DHWH1rujT4u/dDh6w4AVMh6NZ20zSaY2Lo7iPDUXU9Tx7CcuLYasHrTFfvhg2qFQRszHuakwX9n3/kwOsPDQ0bQt+FcR73mR1caLtIeBejbQLhEEuyrVYJ78dM6k22Se/1+KNfaryoqTguKrevqMGMenmjJ3G5s949+hN1AvDdP9ndCRp9RAVk8gs9CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYoyb8dfU6L91BqURFZX5DX6jAaL5bAOZs82ZkFr8Iw=;
 b=s3x5A6myaWh+FBQE9A2khVx11q5CB+U4zLw08tG/KFGLGG+FaAs00Rhma8jteDB1A6+n3buK0LF5Mk8vFRfzxcE7t3uh9E/5BPEv4+9nWxbZ/HODfYjI3GlGLo7MIYwYJcUlrQNhHIU6QZH1+BnpFH8CLcI5Jq9rTRTJk8GcJXmpDKWm2wMBhBb8+o7HpSnUK+JeaqE8EHuuD9Kbn3x4BBgF3xe0jxCaqQ4EIhPXUPfPr3CaHhm53CvtG8eMyKrT4R0kewC0tSxm9OJKfoHvbGkeZzeyyWT8JcJ2muJa6ZxPYwkWaFsMst4xSwmfYf2tj9HpIdhpSPpxUlRiVF2wYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM9PR04MB8339.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 06:15:06 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 06:15:06 +0000
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
Subject: [PATCH v2 15/21] ASoC: codecs: wm8985: Move regulator acquisition to the bus probe
Date: Wed, 23 Sep 2026 15:12:59 +0900
Message-ID: <20260923061305.4041197-16-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
References: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0029.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b5::15) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM9PR04MB8339:EE_
X-MS-Office365-Filtering-Correlation-Id: 22af2523-7d10-4ef7-f670-08df193a034a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|19092799006|7416014|376014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/SQGGXbjB/+gPlpESCocfUs9Cc1LDm1moPHlK2hJ/OsMpApwL6TwGyoRIoxJR6I/tDvN357+10GhSMI1msENsNGGt337gzVMyYfB/hrnQKaigncO3HmirGgiT52FsynKlAkL1DBJFiO8P2dkS85SN3YTsinBTYFg15mCxKzVi4bhIDEvKI152dOXXQn2p/AN9d1RHEhf0QrvoZMxY0eU000J6FIL13uUt2LPFJIsi59ylvugu1R1JL56FjXJ4nDMaW8IbgQnuhcfPHzMeo4rgo3MGwDL3jT7OT2pKy//kR1akHcJhxqZk6TqxFuBgaJA+qPgmiKOWubePo44wb2nD+KxAlLkJrbhnxGr9dTeQ8Bz3csxoPksiEw2Ni36z/FaxY+BJmKZd3EtNUrtpWupv4KMMiEQGV/ooMaXQ3XkUO7m5lMWUi8vs7cnMcM5enlnZzeSn/e6P37Og5ftZzl/hPDuJr7/tAdNGtvyfaXKn9Wwz0D+ZDusNZcWJ5ea5gthte6u9b4emUAkEQveGHmb3kzDrrrfxrQZ1Y97ZjCz/ZwYlWeHAeb235O0NAAX3h/By9n6zoMrLMx/tAcMlpMgfQRjhKDydTbN4lFUUUd4NGiz4WtQyfn2fBb52ej5kjh795w4CaIbcKrHIrLvP2fqaehIBEpQDQHmpLY9Wat0tUk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(19092799006)(7416014)(376014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3jnMF582jNtMyN6ClrE8tNNyFY+g2lb8/Esz9tPTNAPZbr834qY/p0o+Q8RJ?=
 =?us-ascii?Q?EndBpMmkzgT7ErNg+hrzBosS9RlnKwK5lOs35aOV6LxwxCfzcaXUS+V9eM7b?=
 =?us-ascii?Q?NPG0n1tyeCxjUkXvb7KQBQVMWiWGxPDnZ16tziNYcQP5Zxg1+g7MOtAftB6z?=
 =?us-ascii?Q?Kjtz2g1rgfAK1QBMU8hD9DFoU3q/M9Vgr00yq1Ikd5pYzdhJOAw/uPUvEetL?=
 =?us-ascii?Q?pvtSjhV6C653QuJnhkrJ7GGn4EA/dddLxGkKBaE8CXuDBiZLurBai0dBUKNQ?=
 =?us-ascii?Q?SdGUWJol59LWSVgdAic6IPhlu33Lj8GSrX/YrtRWfraxwMVSkl79G5pW9uJ1?=
 =?us-ascii?Q?wUl9sKTCX98JrGkFL8DYGrojcvhEdpqjEVaiReZs9kYZaTnK7Oo+xVQIy+Xs?=
 =?us-ascii?Q?UmnqwnZYj1W1TLqfyyu/fMtwa3Vk2CmHvzYhimbm0pNcD35Crlx6JOhJj+bd?=
 =?us-ascii?Q?dKbLHwvNc3JrHkby8PR/JxRtGDHCHpd1JOZ3kB8gO/pERGm2inrFoSZXmdFa?=
 =?us-ascii?Q?xwUgvuaZZmrP1Z+nD41EBg/3E3rk7TOqqqO9mYZQyiHHnvYWKzudfXAjf6we?=
 =?us-ascii?Q?zIRFy/5JS5+OfyVotW9mODXkQRBJX+yzMLk6E357mvpq+xluMM52bx+ltY+I?=
 =?us-ascii?Q?iJLKippGOtNMofi1YLruaeulZ8IPGyDoSvelSpomK7FvDf0H2ABP6TexZMMB?=
 =?us-ascii?Q?Zj5hE3ic1mPyLwvQMuN/DK0DES767rjWnkRj9kmjyeK2jg2ZbNdPf+TGe5G5?=
 =?us-ascii?Q?3UYcy/NVKtAiIX8q733YFPV8cf+0sUFGSY7fUEHpCjAx6hIdbhwiVIoY4cQb?=
 =?us-ascii?Q?C8iq/jXjnHigX3dDXOUUx2GF+nrCuG23NOz//kBoFhW5oU8Nyj0ZOunEbbXO?=
 =?us-ascii?Q?rqliqGR1T6kZ+mBWsmGfLpG1dXmKQaRERVCRqxJmzZyWiwCev/NVVZYEtdkB?=
 =?us-ascii?Q?cy6hTenpS/J0frQPX4cp5ioimbTaeEJ7mxSC8T3kEB6UQA79ZWp0LdXokStW?=
 =?us-ascii?Q?T6lnIdH65ktlH6oi+WB2gKzGRYdtWqUPB19aNIjcQSzeUqCYZdaKLn90KRMh?=
 =?us-ascii?Q?SJszAQLq0Ows03eo7YOSQJpoPvqdUItXfMQ2InGjjAlP9OvhzYUrK/4rQry+?=
 =?us-ascii?Q?lOnlK6/l9teoRwp1YNj3kbgAQuAeTdvY0hvC4g3nLqgvcBWYWvLKMY2Rv5CV?=
 =?us-ascii?Q?O4e9YcvQ1DYYuHIq34sgAuKIpPV69VeowIDzAp8InzNsm0Ei9vYLx7ZXnZpd?=
 =?us-ascii?Q?xEQUHt+IL8N9P8TIXRCUINYd2powmAMBeYNCXU9RanOBqKQ/gsy1bsOh7NP8?=
 =?us-ascii?Q?WmM1DNb2VHaXyv3kdJjkXyixbFqhGySac0xUP+cAH1IZTFjl+pQgJkng2gZT?=
 =?us-ascii?Q?4lgoBl7e54hDC91TEFu80NIlN7mrqnLR6QRJEmoeHgO99l++cFOgoV3stlu5?=
 =?us-ascii?Q?3l+0ZQ/lJjh/g2vlY/Zy3/LYnEdVduej7EKS86hV76c/M1hYQk80u2FQF3xn?=
 =?us-ascii?Q?Y9JPU5r4Giqar6YP1G3GHvkmCNMHCTNTCf5p2sQSuE/ZteOrmt+UYcckeRwb?=
 =?us-ascii?Q?Npasu909xkFU16V+rM15+eJiWyeetwSGRERt44Q97aPiaUvmBGH1D/64Z1/s?=
 =?us-ascii?Q?VYz2jLhnaSAgszROJ5rWzaHRBmSHR82ZIxP3cy71MYgOKEWtvrK7dj84I3VR?=
 =?us-ascii?Q?8W3Urfo0eENKefsehYzGh0FJW/ih2/TLb9/9bFlpDcEQQpfRbQSi1/dC5/RY?=
 =?us-ascii?Q?kfwYVj2Fa1Y6R2hG3y4qDAybIO/K1cMLoIyo0rpEAJtu9x06/yaS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22af2523-7d10-4ef7-f670-08df193a034a
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 06:15:06.5308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8wEJmWPcCsy9ODi15a323wfeZpXu/qIai66Mj+EKjcQ920VPOwJqaOXtE7BpDM+4zrb99U/2RH6hslNPdOp4tLuz3Dgi5Uzs5sp7xosMFFtAE9xpj1xUqHiXZ3xqMhh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8339

From: Chancel Liu <chancel.liu@nxp.com>

component->dev is the underlying i2c/spi device whose devres is only
released on physical device removal, not on ASoC card unbind.  Getting
the regulator supplies with devm_regulator_bulk_get(component->dev, ...)
in the component probe therefore leaks the regulator references on every
card bind/unbind cycle.

Move the devm_regulator_bulk_get() into a helper called from the i2c and
spi probes so the supplies are tied to the physical device lifetime.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/wm8985.c | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/wm8985.c b/sound/soc/codecs/wm8985.c
index 877a691c188b..1e862609f5b3 100644
--- a/sound/soc/codecs/wm8985.c
+++ b/sound/soc/codecs/wm8985.c
@@ -1029,23 +1029,30 @@ static int wm8985_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
-static int wm8985_probe(struct snd_soc_component *component)
+static int wm8985_get_regulators(struct device *dev,
+				 struct wm8985_priv *wm8985)
 {
 	size_t i;
-	struct wm8985_priv *wm8985;
 	int ret;
 
-	wm8985 = snd_soc_component_get_drvdata(component);
-
 	for (i = 0; i < ARRAY_SIZE(wm8985->supplies); i++)
 		wm8985->supplies[i].supply = wm8985_supply_names[i];
 
-	ret = devm_regulator_bulk_get(component->dev, ARRAY_SIZE(wm8985->supplies),
-				 wm8985->supplies);
-	if (ret) {
-		dev_err(component->dev, "Failed to request supplies: %d\n", ret);
-		return ret;
-	}
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(wm8985->supplies),
+				      wm8985->supplies);
+	if (ret)
+		dev_err(dev, "Failed to request supplies: %d\n", ret);
+
+	return ret;
+}
+
+static int wm8985_probe(struct snd_soc_component *component)
+{
+	size_t i;
+	struct wm8985_priv *wm8985;
+	int ret;
+
+	wm8985 = snd_soc_component_get_drvdata(component);
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(wm8985->supplies),
 				    wm8985->supplies);
@@ -1176,6 +1183,10 @@ static int wm8985_spi_probe(struct spi_device *spi)
 		return ret;
 	}
 
+	ret = wm8985_get_regulators(&spi->dev, wm8985);
+	if (ret)
+		return ret;
+
 	ret = devm_snd_soc_register_component(&spi->dev,
 				     &soc_component_dev_wm8985, &wm8985_dai, 1);
 	return ret;
@@ -1212,6 +1223,10 @@ static int wm8985_i2c_probe(struct i2c_client *i2c)
 		return ret;
 	}
 
+	ret = wm8985_get_regulators(&i2c->dev, wm8985);
+	if (ret)
+		return ret;
+
 	ret = devm_snd_soc_register_component(&i2c->dev,
 				     &soc_component_dev_wm8985, &wm8985_dai, 1);
 	return ret;
-- 
2.50.1

