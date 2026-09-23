Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011034.outbound.protection.outlook.com [40.107.130.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C275415F0B;
	Wed, 23 Sep 2026 06:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144031; cv=fail; b=BlGj+Z7GlLm6JhHYsAWNVqN64d8BAPaM1lV0474JvnBJsjpBus9H4RsCi/wbzrfKa9Wq7i58EDGbETKqhh7/sLZrdu+iWkcs6QZToCP+uuTxPBtd0WJlJYUWwACi/4tB92RLJOSRbhNpCxL023GN+3W+E40djj3vE/lCD8ATJy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144031; c=relaxed/simple;
	bh=XP5kDniofYKa/9VQ7QhRDEBhaOJNuAK7XrVXn9wZjdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ri1q3XyRZb8iiCgEdikpQMeahsOdLAyOFleVdWbwCybg2j/pkrzPhSToInlht+HVN/B+udMXOQa0b53K9GPVO9wc5rfsB3vChjiCjVGTr7ORXzrKYgVjWEt2iMY/eVE/FWR5SRShb+/+b+hgKK4hl8A8QJuY4o618+zo7HaKbfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vXo/Ugpe; arc=fail smtp.client-ip=40.107.130.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vXo/Ugpe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mJZREmFXhWGswqTRkqhxC0UbrwNr3jS/WTU9+6aVYPo4uEyagN8ahDHcrm6Xdvopy0ABBLU8f/Hg7Yx4+wqWlXhxdlQks9/G19ziiKfCYuLnhR7EzrrpoMBWAs0lwJVm0hbeqgcgk6EGyDKGM3qZBBZvDt57PoDcZmEiOSFlkMv2ftgrOxbPOroh9PQx7/Iv1PH46vk/sEZAAwG6dWRioxVc7K0pjVPPCzayOJxPShyOHxLGILe/dEBDPE/RghIu2bghvmUCZzLdjAqZ3uG4sca8rJXBCQRLTOA0m84fpy/7Ctc2FQXM0/kJOglyABgrEWFeDuLsPL0yyCchf9Y4zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcavGUxELXPW98RJksf9nLoEG+k/mtu5EkghU1zE0dA=;
 b=F2dyq4jzBoJBOBCXVCKQZ4EH7+YcxJnUnkH0Enz2f3FsKGt/UpNWrHV54RCFJu5n5Bv0Le1ZClVB4vHRZFK2datJXyTeOItS1Xys9/o/CB0I7xl1btuVrSJDg+Y3+DIFMzFBenay7VkqTf9Jb4cft0Hfa1kXnnM5j48L4Z0unpzbv9GdBDaF5hhWKMLIjjZav+AUnwJLIRRU0wsdM7YfBTPmqc2QbQ1YHBgxGocfCM+U4IWab0ZnjL4ehiOytj75ywd/rP0tF77prSL67OEo2nbqaKmPmPxvkp/MtFdM5FR9lY5qEG5u8HXe14zskwSYBzwl/43HtiCnvpxofIWSfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcavGUxELXPW98RJksf9nLoEG+k/mtu5EkghU1zE0dA=;
 b=vXo/UgpeyF80hD/FuLCkxFt+5klvePZ2goi2Imwqu96bEzl5xK7kDynhlK8A/UW+ONamoukOpaDXJ1qISyJOzMb5mHeM7CoZCu0RnepX1TNssgHOAvs+5muT+XgDFYjKr0agbt7yiTaMsZgSbkMSaIOg1ewbE+tTYHN0o3DQnEg5F0cBHJkpjTQg8vtVX2bts+A+Pu92rEeQnqRXWT3hh4AlAdN7504RMvXNfOJPrkoOcJ17o6ECZJJPGnZ+Ba70TejvrgwlaDegRBdd+mmh5v6uOBlZsvjLKLN8n4kKQ+TsvxdE/IzO5r9CWMrLbGKeVA2nS0SFkUPSb/UfeqVNTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VI0PR04MB10997.eurprd04.prod.outlook.com
 (2603:10a6:800:267::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 06:13:41 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 06:13:41 +0000
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
Subject: [PATCH v2 04/21] ASoC: codecs: twl4030: Acquire board params and hs_extmute GPIO in the platform probe
Date: Wed, 23 Sep 2026 15:12:48 +0900
Message-ID: <20260923061305.4041197-5-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
References: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0060.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ba::8) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VI0PR04MB10997:EE_
X-MS-Office365-Filtering-Correlation-Id: 0756055c-8bcf-4387-8b97-08df1939d0bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|19092799006|10067099003|56012099006|3023799007|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TzYKsSdy6zL1gbMVhOAfGYyHijOvkQact7KtqLBR9Lsd5xecNsYlRJ4V5SOpzsvXetA6IZIN02vWqx0CejI+1vlEx44z4v4/tr5nOXmQSI6PYcsHAM3qHIHlIS8j9CUip4aB8FnAjJ+a7Eyq8sDTXdecQNYApz4nUTMH8yMJfXl/aG3UVFr2/b2zNVjVtOdjXWJ6j1X8+NcxRLNHImDFVSyUJnF0NtuPVaUK6rFLx62ZKp6wMvosnaxGyRsgreKRZrE1AAPQbmnhrS3VgO1oX8a1THFrcB0w+UUbpk1kQ4PbcWCRjOEWu5vA2CF7XcMVdkDuo2TnNz2bqU4OTinc0ejFRM5oJo9k0gilO3qFz/m4T7AHeRYCXvFayid9R2dXozXLxIHzlYdzHC/ei3lz8h0vBzDyooR3JdZnvD1IPRd71M1oizbUL2GG4iPHo10Er1oE6HYc9BF74LAynsoByQv8UvyUrqIvZcfefxPVakTH8sONX1E9/YuNldjtJZngxfzyOM/uGKR565cbTZb/3qn0heBZivYFhyvaWd//ysXGnvkt/D+/Y5P4ufxumfJh4pfvxr96Sb6BPCRZQhnEDOdrQqM0w8B2aIQRODX3gHvQq/cj9HJiFU03WG4VVZJafQ/LlY9FTTvVpOaVfDYRn6nVFR/S0P8DlHWmzjNUNlY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(19092799006)(10067099003)(56012099006)(3023799007)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aGjPqjzjhtZYNTP5hWeulpzfwo7RoUWYOfTriFcktEsXjhB5J0u5TBr9a0i8?=
 =?us-ascii?Q?I8FRw+F9wk7VrFIke2Qoh5zQg15AJnJn54fsmTLM7LyE4RXbfrJGi6jq9oVx?=
 =?us-ascii?Q?55cmnEq6cyq6YL7moqPi+oPh64zoEwnYTp4lkBa6QvChCmCexHY/ncTN/YS6?=
 =?us-ascii?Q?aIQzNjeRVCiP2JCiPkE2gbiAjesI57K/iaZxmK0y2zr0oYgzWGKjvqSWV/kv?=
 =?us-ascii?Q?9dLULUoc3IMPR5RzLPMDhDAk6NWmtIjQA+XdBKWCKlht77sy+gKH6S53X+u6?=
 =?us-ascii?Q?unyizTNzo6O4rVRRgod7Va3R6zu1T7w1PP9aLSl4xAdnMkWefW60wb7m3zQp?=
 =?us-ascii?Q?axaOl7pa/mDZQuwSEqOdexuK4Gxe05jACw1yfYScq3gVlR0Nhp6vKhFfYwKJ?=
 =?us-ascii?Q?F/ibCbB05HraSi64kA7MEOn/ph0NZnZdOWBQWBdHPKQapQrVV264r3uW7dyh?=
 =?us-ascii?Q?dfMBwKlzI+CGyNN8K8g2Vxayy/xV7+LBML0wwMucS/ualvJpJSTID+Wz49Xa?=
 =?us-ascii?Q?koGrsjDyY1QLriX0s+uH+NxwGKJAhWsoWgY8E1kwd8zg1cMgb5/sjLRPd0VD?=
 =?us-ascii?Q?gh9w+nSubv1Dssx1VbbNE40NxR5yC3sRPIFal8STdQ6v6pOnq6uvfvQ6tL/H?=
 =?us-ascii?Q?zdD/JRQEVq1hy1Ql9zEaCKjjCSVIfqolx7jInNudR/fLwFCnbyE7j327zZcj?=
 =?us-ascii?Q?QMiAWpMPivIf7M58hoOm4fNWAodjxQ343zDIauMfu3QSnO8JjImR1qycsAW2?=
 =?us-ascii?Q?T9g3M7/ACrsybeaUTisVOAZ5YJZ99aCtj4BdIzSO55AJQcVBZMKKU3xdqRjp?=
 =?us-ascii?Q?xRd/TRrEXZZob1kvwwiVxVHlqOMj2e7ZfBBPOq4LUulTJAS8SCi8gap6h4tG?=
 =?us-ascii?Q?3+AOR1Pq8gpSfDgEbDyNMNdv+53HCF19evOWt1xAvCr+dNzApqJr9Cvmj920?=
 =?us-ascii?Q?wvrliNytyiIApB4GkibLetfS3OYBiciOWhI34VXoKKNa7D561HKIudSLz/2t?=
 =?us-ascii?Q?DEYnwckDAFfsUXlcIMk9nupQAbuecIGl2jOGVJ04M+OiVfwjOU5/K7/wuGOZ?=
 =?us-ascii?Q?4blCPnFFMsCf+YTu6PHDwROVEC56C5jmFMgf1nI7DBHkntdCgibGmR5nQIh7?=
 =?us-ascii?Q?XY+khAA4zrkTUtSSUEtI0W6TldF1L65CnqY2gQZyNGj+itkP1qOIrDWvJvMm?=
 =?us-ascii?Q?Pidf71vZGn2h41fwKSlrB2vOGdAk/yGub+nqHvOI4/hAVZqTrOTOycnPpXSd?=
 =?us-ascii?Q?BRvNp6J8M4ani4O0caHoEMTuUB8aHq8bqL2fGq4Kclpt5KmRloTT1Nn7HUWM?=
 =?us-ascii?Q?UX2FH4p8FnlVgq8fL+pByPtZ6tWf1XT0ED4KFrt3KNFplc8hf34UgzzBk9G4?=
 =?us-ascii?Q?8sfKZLtwB8mFpTuhIxKHqX9CY+0NOnQf2XHfVpnZB4bgX9RtUAOLfiLZX8fz?=
 =?us-ascii?Q?T0B0gz3REbiPpDXJIk/PObclU2v54ONP+EpQ/66AwCdZ+W1pHmjQN1H7S6rQ?=
 =?us-ascii?Q?ms0DrzvVbWsMJoVrQa79AlAGc/MmVzQ82FWVFIS9Dn/38BrjQLhLu2pepbha?=
 =?us-ascii?Q?kOXlvbg71JX8KA+eP4+yyO8CD7li5esLQd2vp97sS9i7gMfxfEvjTKWDbVZJ?=
 =?us-ascii?Q?DaIG1iPNjqR6K+gpCJtpFbF4sBdUnoEGGeK1pV+cMEYzw5/3wQs2/znJQSrK?=
 =?us-ascii?Q?cqY1fPuDsCLN7HLhZOoREA3VC8jfJ64fixoDHi9smlSFlOC0/jvexnBNTtMK?=
 =?us-ascii?Q?qJJM3ABy1rHfL523uIvF7J4RZU3ZMd9LMDSmOWu3xwnHkgshPgPW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0756055c-8bcf-4387-8b97-08df1939d0bc
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 06:13:41.7105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hF2NJobo9G/u7ExJckSc2lFT93WUxnoqqIguxQCdLvn0tcs7zTjBAyRmwYj++DkkTjncvTApawU0cx5VScVoWr1BDDhpP/MEwRIe1S7noOQ+AlsRMquOtEo1Y0L01oSL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10997

From: Chancel Liu <chancel.liu@nxp.com>

The component .probe/.remove callbacks fire on ASoC card bind/unbind, but
component->dev is the underlying platform device whose devres is only
released on physical device removal. Resources allocated with
devm_*(component->dev, ...) in the component probe are therefore never
freed on card unbind, leaking one copy per bind/unbind cycle and leaking
the hs_extmute GPIO descriptor (which can also fail to be re-acquired on
re-bind).

The board parameters and the hs_extmute GPIO are pure hardware/device
level resources: they only depend on the physical device and the DT, not
on the ASoC component. Acquire them (together with the driver context)
in twl4030_codec_probe() using devm on the platform device, and hand the
context to the component through drvdata. Their devres lifetime then
correctly follows the device rather than the card bind/unbind, so no
explicit component .remove is needed. The component probe keeps only the
codec register initialisation that genuinely needs the component.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/twl4030.c | 63 +++++++++++++++++++++++++-------------
 1 file changed, 42 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/twl4030.c b/sound/soc/codecs/twl4030.c
index b986ece55d5a..442624cf2a31 100644
--- a/sound/soc/codecs/twl4030.c
+++ b/sound/soc/codecs/twl4030.c
@@ -212,21 +212,21 @@ twl4030_get_board_param_values(struct twl4030_board_params *board_params,
 }
 
 static struct twl4030_board_params*
-twl4030_get_board_params(struct snd_soc_component *component)
+twl4030_get_board_params(struct device *dev)
 {
 	struct twl4030_board_params *board_params = NULL;
 	struct device_node *twl4030_codec_node = NULL;
 
-	twl4030_codec_node = of_get_child_by_name(component->dev->parent->of_node,
+	twl4030_codec_node = of_get_child_by_name(dev->parent->of_node,
 						  "codec");
 
 	if (twl4030_codec_node) {
-		board_params = devm_kzalloc(component->dev,
+		board_params = devm_kzalloc(dev,
 					    sizeof(struct twl4030_board_params),
 					    GFP_KERNEL);
 		if (!board_params) {
 			of_node_put(twl4030_codec_node);
-			return NULL;
+			return ERR_PTR(-ENOMEM);
 		}
 		twl4030_get_board_param_values(board_params, twl4030_codec_node);
 		of_node_put(twl4030_codec_node);
@@ -235,21 +235,22 @@ twl4030_get_board_params(struct snd_soc_component *component)
 	return board_params;
 }
 
-static int twl4030_init_chip(struct snd_soc_component *component)
+static int twl4030_get_hw_params(struct device *dev,
+				 struct twl4030_priv *twl4030)
 {
 	struct twl4030_board_params *board_params;
-	struct twl4030_priv *twl4030 = snd_soc_component_get_drvdata(component);
-	u8 reg, byte;
-	int i = 0;
 
-	board_params = twl4030_get_board_params(component);
+	board_params = twl4030_get_board_params(dev);
+	if (IS_ERR(board_params))
+		return PTR_ERR(board_params);
 
 	if (board_params && board_params->hs_extmute) {
-		board_params->hs_extmute_gpio = devm_gpiod_get_optional(component->dev,
+		board_params->hs_extmute_gpio = devm_gpiod_get_optional(dev,
 									"ti,hs_extmute",
 									GPIOD_OUT_LOW);
 		if (IS_ERR(board_params->hs_extmute_gpio))
-			return dev_err_probe(component->dev, PTR_ERR(board_params->hs_extmute_gpio),
+			return dev_err_probe(dev,
+					     PTR_ERR(board_params->hs_extmute_gpio),
 					     "Failed to get hs_extmute GPIO\n");
 
 		if (board_params->hs_extmute_gpio) {
@@ -257,7 +258,7 @@ static int twl4030_init_chip(struct snd_soc_component *component)
 		} else {
 			u8 pin_mux;
 
-			dev_info(component->dev, "use TWL4030 GPIO6\n");
+			dev_info(dev, "use TWL4030 GPIO6\n");
 
 			/* Set TWL4030 GPIO6 as EXTMUTE signal */
 			twl_i2c_read_u8(TWL4030_MODULE_INTBR, &pin_mux,
@@ -269,6 +270,18 @@ static int twl4030_init_chip(struct snd_soc_component *component)
 		}
 	}
 
+	twl4030->board_params = board_params;
+
+	return 0;
+}
+
+static int twl4030_init_chip(struct snd_soc_component *component)
+{
+	struct twl4030_priv *twl4030 = snd_soc_component_get_drvdata(component);
+	struct twl4030_board_params *board_params = twl4030->board_params;
+	u8 reg, byte;
+	int i = 0;
+
 	/* Initialize the local ctl register cache */
 	tw4030_init_ctl_cache(twl4030);
 
@@ -288,8 +301,6 @@ static int twl4030_init_chip(struct snd_soc_component *component)
 	if (!board_params)
 		return 0;
 
-	twl4030->board_params = board_params;
-
 	reg = twl4030_read(component, TWL4030_REG_HS_POPN_SET);
 	reg &= ~TWL4030_RAMP_DELAY;
 	reg |= (board_params->ramp_delay_value << 2);
@@ -2163,15 +2174,9 @@ static struct snd_soc_dai_driver twl4030_dai[] = {
 
 static int twl4030_soc_probe(struct snd_soc_component *component)
 {
-	struct twl4030_priv *twl4030;
+	struct twl4030_priv *twl4030 = dev_get_drvdata(component->dev);
 
-	twl4030 = devm_kzalloc(component->dev, sizeof(struct twl4030_priv),
-			       GFP_KERNEL);
-	if (!twl4030)
-		return -ENOMEM;
 	snd_soc_component_set_drvdata(component, twl4030);
-	/* Set the defaults, and power up the codec */
-	twl4030->sysclk = twl4030_audio_get_mclk() / 1000;
 
 	return twl4030_init_chip(component);
 }
@@ -2193,6 +2198,22 @@ static const struct snd_soc_component_driver soc_component_dev_twl4030 = {
 
 static int twl4030_codec_probe(struct platform_device *pdev)
 {
+	struct twl4030_priv *twl4030;
+	int ret;
+
+	twl4030 = devm_kzalloc(&pdev->dev, sizeof(*twl4030), GFP_KERNEL);
+	if (!twl4030)
+		return -ENOMEM;
+
+	/* Set the defaults, and power up the codec */
+	twl4030->sysclk = twl4030_audio_get_mclk() / 1000;
+
+	ret = twl4030_get_hw_params(&pdev->dev, twl4030);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, twl4030);
+
 	return devm_snd_soc_register_component(&pdev->dev,
 				      &soc_component_dev_twl4030,
 				      twl4030_dai, ARRAY_SIZE(twl4030_dai));
-- 
2.50.1

