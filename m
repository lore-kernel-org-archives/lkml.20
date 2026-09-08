Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013054.outbound.protection.outlook.com [40.107.162.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165E33CF698;
	Tue,  8 Sep 2026 08:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788855442; cv=fail; b=q85Yfud+/9Adn3V1jTDB+WacL0DG6OVSmCyJ9e3FI1O7J9JGm4/i2PNHv1Umn3ygTcDhNsVcwuiFesruyHbo1LeuIaWzx6UkkI06W04k3IP5TpvwyqieTmF+gsyGu9tQk385cNitn+14jgnZeHtYTd4/MSq3Rouiidnh/oXJffQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788855442; c=relaxed/simple;
	bh=hMuavIKAfdl+VKcrpHXAWt4Yl+NskaRX909EijQMcnM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F25F42VNfcuDCmlayQf7ccVxz72JA/0GkBumpySbHP1ADblxnnVGzYDQzodGQHEP3v8lJUGV9TQhvVUMpHuile8eoi8uJutt60xmawOYF1NiJKA6DEsL/cuzJan6TMh52PwajOCv4y3mZFpIPDTi9sTsfokbt3hG+yycroAYxrY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pQWAUapA; arc=fail smtp.client-ip=40.107.162.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pQWAUapA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F2zAZuYNX/kAdI05wyrlIoPHoNTQPd7xnd28d9yrIl1c1ryD95+MUOcgWu1XHctl5vE1QtPQD/WsgERfUsNyOnVjbZAppWDMIXZsvOPCL7sji7B5WyH8DXO+/Z/CAQHh8OV9ZIAd8RpwqU4Sr39PEiCOjif+YJhj+XlBvG/x6hWCwH3hGWHDyIuGpU3z86VLrw+bDA8HVi2ZQv6DoOtdfAUMStzdROAr+Dxo6PCq0ZP9T/ZwVUNph/YIammqgfiV4DRBHGz/dpPdjhkSFumC7vUp6cC0+reXJsPSl3acWcU9VFHxPQTUzdYMBR3qNw7dXQv8vKiLMIQU4REQswMX1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oax3EOtwSWUBbyOhPwHTShb1CFawMGBm1IfBJYkvZL4=;
 b=Y5od339AyE/+CYVY+kaNBvcsvg+bmxRkFo5NGbbci2GkNDmNTyGO9DAvSvxJemeVRS3ot58w5S75rWy3S9GYVAbfu6bRVQjtNOTXgxIQsnyS030eAe9PkecW2tf1pK9qEp82BSZMmVom1xr0xDuNX0rcnzUA+rR/2l4Rseh5VMLAvZwgORdbMckLXNRd1dAX1I2frpehc8C5aBMz4pUBOZhYUlKfXlkBJiRB9TjSK3g6jTlBhXbVf20Q10vDx9e2g/rz0Hkt8ZFUvTp1kc7rc14UrdVyHKdEolFozS2w72/FSvCB6QMxla0meGxTvkG3+KpHJyjq++7ZD3DsCSfIwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oax3EOtwSWUBbyOhPwHTShb1CFawMGBm1IfBJYkvZL4=;
 b=pQWAUapAvXPP31eFaKrb3FJ6dWslMWxdiWf0XKvo7jn7ts3g+Sy8JvirIIxE9v/8pMnCfSsuAO3lgI6UvQzsabBr7D6S/SLTaspz31rUzmfd31fIOgOqBRskwoE2W+U3o9Xk9abiZ0sSK2QUlGZqxQj3DjLWbcyDBu6UODogdAbpzk/b4NpGSVET87AHQV/p3+kLRHU58OpAO43Yup5a2TYyPwkEI4cWoU6va0kQoq174MuWb1AT0igiqt7F8m0a3chGIPV3scw69gwro+zb+gwlcehr1Temp8JU84HI7ISTcnMlf3NjnVkB0nj46kcOuT0m8R1Ikea3oOjwbRHZpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by VI0PR04MB754002.eurprd04.prod.outlook.com (2603:10a6:800:364::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 08:17:16 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%6]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 08:17:16 +0000
From: shengjiu.wang@oss.nxp.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linuxppc-dev@lists.ozlabs.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: [PATCH v5 4/5] ASoC: fsl_asrc: expose individual DAIs per conversion path
Date: Tue,  8 Sep 2026 16:21:39 +0800
Message-Id: <20260908082140.1316872-5-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260908082140.1316872-1-shengjiu.wang@oss.nxp.com>
References: <20260908082140.1316872-1-shengjiu.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0166.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::9) To PAXPR04MB9351.eurprd04.prod.outlook.com
 (2603:10a6:102:2b6::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|VI0PR04MB754002:EE_
X-MS-Office365-Filtering-Correlation-Id: c589841d-e481-4b66-9993-08df0d8197da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|7416014|366016|1800799024|376014|10067099003|6133799003|18002099003|22082099003|11063799006|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	9m7cCR0jbYBNiENgioUobrx4MGX6CQw8L1YoyqU+Na+Xi1ARzjix4AVIEBHb/evdyWZCduiQ+8FxOVCQzrUOau81U3IeLsqr7qv2MpmAVnINFzmZIYcBEHEkZHbaA9hs4t645nXMGUPkpKbyzWTWV7ScOB4ilnjDJii66n7l5sUnlMnkTI/eJUzurZn/AP+7c8TS1jZMkT4tMFeIgGC+TzAXHhgQ4AlfMNmip4WoaATyvs2dH9Ex36Yr1e3ZHYp2DPjSQO5GoYO+XayHRevMLrb+wynhsqjZOJvVgwJvg5LXjSEYWZx3MaUeE5QcgXtTPXieSD+TRHKWbBwUchL6S3rTO0vuX7lxqVkvper8+0G6i61U+sVY3CmuurGdnSFnQalvNUBuL9V1hgVgpxmfWJ7qVP+TuORrwKqjm1v0XZDyJLXDT3VaF28XeM9RLDUeFIjFYaPHSRZ1K4WRs06+X8qvVsQTSFXpM57SPx2QCvcfGj9AuuAfGWVmZyXuGk7sr/4anul4+ue5vkw2oOICraWcmfA0wgphzUyFTFJnsfKnvSO3GkRXHRX1rsXg35pI6HiDfbc/4tcVRfJW547jN3kaKveYbgYS7s/fxidtwTQmQBdczBDoQ2QoP4uE77wbRD7VPReG3SyLkwTO1wk0pZ9pz+OCMkxJuiVtUkr/yT7FRSAWu2hs9uStKQjUE1SVPeNzyia4vhoRMOmhTgtcjg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(7416014)(366016)(1800799024)(376014)(10067099003)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DbjVWXzOZF1AVS+Wse+8684qEcX3Tj2ArIXRvZLR85Nh9Y+qDIyWbRBHhTjt?=
 =?us-ascii?Q?E9Vie8x89rN7pROEYbUw3IHL3kx+5f7TzhJfCkehUoKeQ3DhxNk15VHlAqEI?=
 =?us-ascii?Q?Zcellk7MawkXP3zm78dyI0sUMsfAvYGCO4fDUz8uoKjN76P7yLGEqgl7lPZc?=
 =?us-ascii?Q?crGVu8nIiRFx/I28Se7WlMsibQd3fOCL8mcFToqzmj2pIjfdaEy5Un/X75gg?=
 =?us-ascii?Q?0yIPwBo3YpSDKyfmDMIAkTBZj1Y4bAOhslSG18x9tckUBWBwprvBe14Zcm+y?=
 =?us-ascii?Q?8+gRqpn7k2AdluQU2+Fq5vM8zq0DeJxbns8kI6aOYU7N/eAZIbDraxnSBHbC?=
 =?us-ascii?Q?RKyQVg6aBuga3uclpcEMn3EEYSIrFg9jXKvcoK/79U6lcUWCdBmSJhGKUvuk?=
 =?us-ascii?Q?p/lWXsbFDjwwkQ4R+8boXJHRmQLoFOgKaQ3Wh3mKhhkuEGGkNzIKorr4a0tE?=
 =?us-ascii?Q?9lDJ1RaMitThd232sNMEHAYXpqBELW5c09EHFaRp+GUHXexR7lrFGtSiwlGN?=
 =?us-ascii?Q?1vIzxlQ0VkK/pxYtbnmEhImU4sLjHN0/islrToNoBncSxwjESSz5oKN6qSA2?=
 =?us-ascii?Q?QWe720j/vF0g+87nww2bmLKuXzy/M/MnHJk9R6LcGMCgbRM6OULHb6FoAGKv?=
 =?us-ascii?Q?OrSks0NcvlGAUN97U90Xhv9XcVmiMOnTyFC95//XHyHZUtVY0dlEyJuG4vnd?=
 =?us-ascii?Q?uhaeFP+EX2ehyIzBZcJDYcrdO5DZpgQxzElXhcQRTclvkvEx3nJJfZK2iZ7Y?=
 =?us-ascii?Q?qKwEw23sGwgT3Z+QUIUpX3HB9MEukvI4H+/Q5/edxQ+a3nkSOe/CIgJp5nD8?=
 =?us-ascii?Q?A3IQlyDUiuPniH6jCG768ERUILIQcByYuyZgPOZO1e/3wkul8OVI26MBxNCQ?=
 =?us-ascii?Q?RVegcISAJuO0rUeAPURIu/ftIq+qHEZQ84AgzRzU6ojiFBlVJEvbKLbatCpA?=
 =?us-ascii?Q?3stfFQNn8iz8kNbcna3d0M1vcfhQ9y0+hpHmNIZKxBquSAOgXbEOvbeRAGVl?=
 =?us-ascii?Q?cZPf89UvBC4qq8SIbxPStEbXqk00iCVro1xsgruYPs9C5ka+1eWmV8LZaUy1?=
 =?us-ascii?Q?ftS2B8732FEnkdC4yywLZgvA1VPgveaiJjT9gDpagOcFrTls9AuCegIpjf8Y?=
 =?us-ascii?Q?6QdoNGal4F3OXVLoAnPgjfyW3J5FN3mPKK8LPKX66pGgHotwLy/FjqEEqKFK?=
 =?us-ascii?Q?mh1dwsLgtF+EBrdmXjsWnwtzf4UYbZzutErb2Cjn24e9E5MwJeGXZI+LMSqv?=
 =?us-ascii?Q?PXAZgeelgzgcjo9LyCL+PhsvSDG8lj57lnBgViUhGTyAbbLexHpdZm/mAOet?=
 =?us-ascii?Q?to5zkTK9bAMlWW/enI7jgcjrQFODvWXon9+v8Etakt+F1U/ie0okQj4uUOpp?=
 =?us-ascii?Q?7GNekC8MjyvRqPg4JMRGWXLQ+rLE3D6vK6iprFGxRfgXIbSSU4v/j3BddP7m?=
 =?us-ascii?Q?fuW0L5eNR4X421Zr2SNf39/XVN8Skvip/veBYpKTmb+TNvRQRgSwXdHjKMA1?=
 =?us-ascii?Q?sXusA+WhsZ5SwCBvnSb1czQxi1x0BMB431c4I7DvNkX3la/dV6rj0wJCEbf2?=
 =?us-ascii?Q?wuTT/+zKigrOZxFgoXT9fpi3HOVcHP+zKVyMngNqwwH3I/Qd7iMS54zX3vfv?=
 =?us-ascii?Q?noHBBLtI2GeNpj1u9F80CD3hy5l86CyWf4t+GhzfDNqg5ebicCfO7ClNHBXM?=
 =?us-ascii?Q?fOSSWBlttNqQFeOpYF3oDyfjSkR/t9TuGs+BdH/xJwsUTDC7Piq+M9GBmBh4?=
 =?us-ascii?Q?QIP8BXYhMN3SPtMJtxBYWvShQBMrJzRkhTHA7O+Kl4XWVryU/KhJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c589841d-e481-4b66-9993-08df0d8197da
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 08:17:16.2349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rBHLaPbW9IP0owFKy+hkUnrXUxRaSF1EbxjaCMdZNDbUW3grorp3frUSvvhXKkUc0ouv/RouMotW1R3tNefA4BCt7YivqiO0ogRJlotvTs2f8O4f8X8XnTeVXyIQ3t04
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB754002

From: Shengjiu Wang <shengjiu.wang@nxp.com>

The i.MX ASRC hardware supports three independent conversion pairs
(A, B, C). The driver previously registered a single DAI with generic
stream names "ASRC-Playback" and "ASRC-Capture", which prevents
multiple independent conversion paths from being used simultaneously.

Replace the single fsl_asrc_dai instance with an array of three DAI
drivers to allow up to three independent conversion paths to be active
at the same time:

  asrc-0 -- ASRC-Playback / ASRC-Capture (backward compatible)
  asrc-1 -- ASRC1-Playback / ASRC1-Capture
  asrc-2 -- ASRC2-Playback / ASRC2-Capture

asrc-0 retains the original generic stream names to preserve backward
compatibility with existing machine drivers and board configurations.
Each DAI retains the same channel, rate and format capabilities as the
original. Update the devm_snd_soc_register_component() call to register
all three DAIs.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc.c | 89 +++++++++++++++++++++++++++++++---------
 1 file changed, 69 insertions(+), 20 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index d226531f1332..1c611ca89dea 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -792,27 +792,76 @@ static const struct snd_soc_dai_ops fsl_asrc_dai_ops = {
 				 SNDRV_PCM_FMTBIT_S16_LE | \
 				 SNDRV_PCM_FMTBIT_S24_3LE)
 
-static struct snd_soc_dai_driver fsl_asrc_dai = {
-	.playback = {
-		.stream_name = "ASRC-Playback",
-		.channels_min = 1,
-		.channels_max = 10,
-		.rate_min = 5512,
-		.rate_max = 192000,
-		.rates = SNDRV_PCM_RATE_KNOT,
-		.formats = FSL_ASRC_FORMATS |
-			   SNDRV_PCM_FMTBIT_S8,
+static struct snd_soc_dai_driver fsl_asrc_dai[] = {
+	{
+		.name = "asrc-0",
+		.playback = {
+			.stream_name = "ASRC-Playback",
+			.channels_min = 1,
+			.channels_max = 10,
+			.rate_min = 5512,
+			.rate_max = 192000,
+			.rates = SNDRV_PCM_RATE_KNOT,
+			.formats = FSL_ASRC_FORMATS |
+				   SNDRV_PCM_FMTBIT_S8,
+		},
+		.capture = {
+			.stream_name = "ASRC-Capture",
+			.channels_min = 1,
+			.channels_max = 10,
+			.rate_min = 5512,
+			.rate_max = 192000,
+			.rates = SNDRV_PCM_RATE_KNOT,
+			.formats = FSL_ASRC_FORMATS,
+		},
+		.ops = &fsl_asrc_dai_ops,
+	},
+	{
+		.name = "asrc-1",
+		.playback = {
+			.stream_name = "ASRC1-Playback",
+			.channels_min = 1,
+			.channels_max = 10,
+			.rate_min = 5512,
+			.rate_max = 192000,
+			.rates = SNDRV_PCM_RATE_KNOT,
+			.formats = FSL_ASRC_FORMATS |
+				   SNDRV_PCM_FMTBIT_S8,
+		},
+		.capture = {
+			.stream_name = "ASRC1-Capture",
+			.channels_min = 1,
+			.channels_max = 10,
+			.rate_min = 5512,
+			.rate_max = 192000,
+			.rates = SNDRV_PCM_RATE_KNOT,
+			.formats = FSL_ASRC_FORMATS,
+		},
+		.ops = &fsl_asrc_dai_ops,
 	},
-	.capture = {
-		.stream_name = "ASRC-Capture",
-		.channels_min = 1,
-		.channels_max = 10,
-		.rate_min = 5512,
-		.rate_max = 192000,
-		.rates = SNDRV_PCM_RATE_KNOT,
-		.formats = FSL_ASRC_FORMATS,
+	{
+		.name = "asrc-2",
+		.playback = {
+			.stream_name = "ASRC2-Playback",
+			.channels_min = 1,
+			.channels_max = 10,
+			.rate_min = 5512,
+			.rate_max = 192000,
+			.rates = SNDRV_PCM_RATE_KNOT,
+			.formats = FSL_ASRC_FORMATS |
+				   SNDRV_PCM_FMTBIT_S8,
+		},
+		.capture = {
+			.stream_name = "ASRC2-Capture",
+			.channels_min = 1,
+			.channels_max = 10,
+			.rate_min = 5512,
+			.rate_max = 192000,
+			.rates = SNDRV_PCM_RATE_KNOT,
+			.formats = FSL_ASRC_FORMATS,
+		},
+		.ops = &fsl_asrc_dai_ops,
 	},
-	.ops = &fsl_asrc_dai_ops,
 };
 
 static bool fsl_asrc_readable_reg(struct device *dev, unsigned int reg)
@@ -1393,7 +1442,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 		goto err_pm_get_sync;
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &fsl_asrc_component,
-					      &fsl_asrc_dai, 1);
+					      fsl_asrc_dai, ARRAY_SIZE(fsl_asrc_dai));
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register ASoC DAI\n");
 		goto err_pm_get_sync;
-- 
2.34.1

