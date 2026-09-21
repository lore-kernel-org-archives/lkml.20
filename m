Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010010.outbound.protection.outlook.com [52.101.69.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAF147FAFB;
	Mon, 21 Sep 2026 10:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987621; cv=fail; b=SyuoiIh3UxV+N4oubrB0YWQxdYIh/TTL/DCb7OPAz9XNl3LKVSkKh4B7yb3DX49JKcRC2qtUTEn2FhggQQxOHNP6KbHhyrQjkCYMJzIpDEY01ctdXAPYn4Nc3GmaZWDvIBxfkgTht15FLdCOEdBqB987zpQHTgGkiHHkfkFCbdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987621; c=relaxed/simple;
	bh=c7xnN5kAv/DZQbbn8SLYdEX5Ut8bjYu9XqB5HOe924o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Lo+hJwPVZAQ3u/ayrHP3CUfJfTmzn25sXVInNFvI5tbw6/p9mflg8ubIl/+Lg1ZGi4bcn9sc9niL/ZxVwZEjuFU7Z9uhKEb+gNKEQ2dSOEvMqZfzT6UzqILmPXoAvd3zv2aAR+Mh0I/EXFps9AF8acInt1/wzNkmOv9ul4XcCjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iAlzu/zC; arc=fail smtp.client-ip=52.101.69.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iAlzu/zC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=opJX0PivM5UhgT5GDb1hU5Mx/vLmjOl51zBEEpeddR+depbymhskrdMTFza0OkejUxYZMDgaNxkshVjy5Vw5K7mcR8YiTzoACpyhz6FwTbCiQCatFxgdRh/ElRwQG6dtoc43ufuuHsEVM6CDd9czt3eI5nlTxqbfi8xDiaL+SxlWkoLn4SM3G/tkgrWSjJ1U2ICVEY2zpt9zcpsIZV/K8feHwc59BEI3EMGeJ+NNLCYdb+n1Aj3FbKCssGtduf3fWOHJh9WzP9zCyxB7XnvKYEZnXUz8uxDe/i4D+kmPMgn2CqMTm1lr/WRnfjRSBtM1U5UBm00AkqIsT8vXMjCIgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZQVQZf/6Uuyp9pKwkWGP7D52T71N5AtDOq4Fwo3zvo=;
 b=JAMwxQbd/PqCvH//XfkQUfoFYtjpMqYZepOF2WOQTyLIcy5sNWeffnrnGdEgyZz2xenojcCq3dp3ZbMtWcH1G7T8ahMLSFPQwMVf6oj1RoV8v45yOTGvgFCorQ+snxyAmKurSjs7e1LVPwUKl6xgPg4uQDNE/2Ljr+1cKNd8VkWNHCBYQ9Mk+sY1jT+JE7pLvlJaVK/X9IwVR3HckLyq9YqmCCVn37r8K9vJpF64HXBjx1hsgLFEPrubPmcbIvGbwCQG3fddzZA2PVCiinhhOl2Xy44E3W+rxXUrylC2PvDRNKXsIRmI9UYAENumI+DKmLUJMvxJg0YkCoyeS/jenw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZQVQZf/6Uuyp9pKwkWGP7D52T71N5AtDOq4Fwo3zvo=;
 b=iAlzu/zCMoFZVP1s4rdkpExvL/c5GOlr3VGm5rTp0UEjA+OhH/P71j+nMfCKUFDiSA/KH+uj+z+Nv4g/7DZRS8EYGIkQ9cDKtgKY4CclnHFEmuw7tFCo7rJh9Xqgv7mkVdqwkzbnEwk5ysBtdA7tyB/HjzPzTlwsR9vCwxGuDyGamQGrBq1Gtyop7UwLJX53WFqep0DI7VSK40vZXIQvSpsprcZA9yabNDtnvoQ8Lkgl8Me60m9okebhfiMUQwL3/Ux1jCNU41KM0HAeu0ikMny4xf8mTvq5c870vu6uKXxDmpgq8oURHCsf/MbzJra62OgR5A2Vpy3ZhwCibNLAPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by FRWPR04MB11198.eurprd04.prod.outlook.com
 (2603:10a6:d10:171::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 10:46:55 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 10:46:55 +0000
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
Subject: [PATCH 01/21] ASoC: cpcap: Fix devm resource leaks across card bind/unbind
Date: Mon, 21 Sep 2026 19:46:20 +0900
Message-ID: <20260921104640.1941554-2-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
References: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0125.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::19) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|FRWPR04MB11198:EE_
X-MS-Office365-Filtering-Correlation-Id: e2ca388e-b8df-4710-e1f7-08df17cda77d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|1800799024|366016|19092799006|376014|10067099003|56012099006|6133799003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	AWMjRtqiMsWJFVstERL2XDFptSXLtlQbRZx/TFCbv5GDW2T7v3/pWf8zJBcOdh+gItB7Fn7g+rWrhMTmN155pGcni2oqcclg6mAjWp9ahtQbgtUxo+s7XaAXkzgrOnczGokvlzqVxwqTHu5C+j7ejRH0l75mW5tb4wRHs8KihoDTcGaSSOs/0t4EnQGiquU44HCpjREai/tJkqM4Hm8nNzAQXC/duShVThtOxt4uR+SkTDjOZHP2STfWa/qoLEBqwdJTsgiFb2r0Pr2LyQq8CZIUuB4QweJxXoVjwv0bPKT5WiTV9ICTnw69V1KeoITasJy0NDB/k0EoRH+PQbD2s+SRQ4gGodpB2FoiM4AtDH489oQubjECG9y+xhKrzTfnBDgt2+uEuVNCUcc1ib6C2cRE4sLhMYrRLaJisEcyUv5RrUaH/1o9aMcuyhb7TyDfQCzD5a3ari1Qy5Q543nx3orRgZ2WrShaBH1Sjnkv9EtPYM2T1dx/6smoK3OZSJM6RGbRJa9veIAPjjb1yuRSCt1DTG9XuCBKjQ0Xmre1Q/fJCz6zfBfKwqxpjGtiy+MB5iyxa1HRGKziwReKfVjxobkYGkutxIxGMMuoj0i/qcLXz5+ff2N2bmGiwDfeNT+HE3Z0FS6MOnpk9Y0usxcRWV7hCkTRI2AIjyFXXhNU0n0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(1800799024)(366016)(19092799006)(376014)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kzm9jXqYgbNSeHY5PEQxdYUNEMIj37id7Ua3bQx1IojqrEv5MGzKxPp9NLGH?=
 =?us-ascii?Q?5nBlvP4uMM35I/5JmYJ/h4Yi4OGrW47urq8S7qXuh5vOJcUxvzABeHDmK1r9?=
 =?us-ascii?Q?7L2Tv3teFucys5ubWgLejPdist0bEWZmX0VeF4W5RjuFShwver8EFKug/v/0?=
 =?us-ascii?Q?admmTwGxl1yoU5B6uc78Cay73xbZXvxAKr6OpLe2mSQjbt3oVBx6UjKv8+zt?=
 =?us-ascii?Q?s060NNEp9vpiduQk3eENeVABsOEEqUYU8+BqtbkPZWCvl7nX9Y56wek4eayw?=
 =?us-ascii?Q?Y5xTh33kUrczHEE8htGfnEvttaFWD6YagmFXMDkdn7UAAM84rLsvtfh/szDB?=
 =?us-ascii?Q?aGvNvUpUbAtO8jrQOXKWB61zgyrMnkcdsXLnrKUDysYtqB9RNejX+mgUnQEC?=
 =?us-ascii?Q?dywfNrkaj4oNQQg+VVFO+1lnpm930/oTCiGFv8bW4RQ0JQEohxJQzqVjXTjQ?=
 =?us-ascii?Q?v52HFgbMtHaP/PPDhxTpI6M2or5KLvQAgwoeVkP+bcHrx870PEsAY0NmG6gA?=
 =?us-ascii?Q?qGj5B3VFPN0QL1EFGzNzEHGMEe1BFRtO+G931wvwj0eWoELD66lXTyrxYQ6u?=
 =?us-ascii?Q?K1bRpWzxVsLNbr3oSiagLXoUhgDEG1m1P4/xRxMJRQpLYmxBP/jDXd5GU5sx?=
 =?us-ascii?Q?IDxIfzQxd/BBS8nWwMiGXMd42dXRPYxahwAJaqT3qImHZYRdyZVOAPEXy/0+?=
 =?us-ascii?Q?NU6k7kxmHbt3bVz0dU5GuVh/ZrZjkFk6VBYibkzsHsVKpC0MJCQr34Z1LOjL?=
 =?us-ascii?Q?gTlWSLfRdoGYDj+EhstrndUP/eT3xED76tJYHBtHNlj8dZqZIQuDNrcl8619?=
 =?us-ascii?Q?dL4j3ArvackpAFMnN1d8tvbkCvtE5BU3UUrnGwucOgUxl7vYql+iMf9Ue71A?=
 =?us-ascii?Q?AZ96LqkQZDE5xZEHQop2a+1arU0VHZDbE6a6b4AuIruxKql662j9jh7sOvJ7?=
 =?us-ascii?Q?UFp/oHYNG7rqVOse20BTbBGqByMaPWkQUqmS/BC3Lte2ss9PmtUS79IZfTm/?=
 =?us-ascii?Q?gpdeRTPNF7oR5yugWneyivhWnEfVbs13dO4M5S8dXe55JoFA15hhYysOEbS4?=
 =?us-ascii?Q?KPo+NoUd+3fpbiJVpxhK6KbFtvW5j68PX6UuSqv0HBgQ/w2LLxATeT5qoiWB?=
 =?us-ascii?Q?P1MNQAdUD5F4rnEzv0Pd6kK7cbyHrywlhvwytZZ9ymKcbwyzoAv16i8HXj01?=
 =?us-ascii?Q?1c2hGk+bJQd/t8lO5VxdkF4vtvqvzhmSdH4g577D4713FLn5NH8cJv9vd/cy?=
 =?us-ascii?Q?OBTVlS/zpRaUr+qCAKojGEY++BJuD2+8HcEhxI0fxo2n98Nti3F2ptELgXPN?=
 =?us-ascii?Q?55q0zoxp21p9dFcwucLKVMmVgUQgsO1iiAaVxok+rVB3oHkSy5UCFIL/eNtF?=
 =?us-ascii?Q?9IyngF8TxHsFb5Wx/LqhATqyXSpqBxdhRN9y2eSX6KOuDO1KTQwrC8dt7TSn?=
 =?us-ascii?Q?F1S841f3W4vSbWVZP0OHsbi0pIPIb63oiirLuiMx/oUZbvgX0cjFwtw/FomI?=
 =?us-ascii?Q?lJa5diz6yGrFm6OvuvJJTBqCnvDsTadcqjxj/0VQI65QhtjNzjBtW2j8QOlP?=
 =?us-ascii?Q?6tioTIM/N20VQIK5l3oMvBcF7YYQq/jKdBx2gOS1quKpQQnXGpPKIzqEC6tM?=
 =?us-ascii?Q?fcQ7wPi7z7hGLdWLkQ0EION1DLNAyEM9h3LBnIANpdXL5KXs/fJQTQuWuzQ0?=
 =?us-ascii?Q?BhPRdn9zYjqrRfYyJASef+q3Mesom0gcEgQVUw/+XunzC0TxOUhkfvkQGPK9?=
 =?us-ascii?Q?XczI5vCp4fIfrG+Ei1YLlJfDGGkq/oalt8X7nE+R0sZW5rR3CaTH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ca388e-b8df-4710-e1f7-08df17cda77d
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 10:46:55.7589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +M4HFtojRrBMq8uFs8HRrWB3E3mo0jF3MbIPXQS//8iQw3dYkvKR9pRnYS2OvuGvCGP0HhgZ3RR9Fv5wgO8KvpiRNLoudiXv3sGTvbBu2PEIx/W/d8lu5bzXZ1IbuVrT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11198

From: Chancel Liu <chancel.liu@nxp.com>

The ASoC component .probe/.remove are called on card bind/unbind, but
component->dev is the underlying platform device. Resources requested
with devm_*(component->dev, ...) or request_irq() in the component
.probe are only released when the platform device is removed, not on
card unbind, leaking on every bind/unbind cycle.

The VAUDIO regulator is a pure hardware resource that only depends on
the platform device, so acquire it with devm_regulator_get() in the
platform probe where its devres lifetime matches the device.

The headset/mic-button IRQs genuinely depend on the component, so
keep them in cpcap_soc_probe() but request them with the non-devm
request_irq() API and free them explicitly in cpcap_soc_remove().

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/cpcap.c | 74 ++++++++++++++++++++++++----------------
 1 file changed, 45 insertions(+), 29 deletions(-)

diff --git a/sound/soc/codecs/cpcap.c b/sound/soc/codecs/cpcap.c
index 0262900fbb7d..dda68165b817 100644
--- a/sound/soc/codecs/cpcap.c
+++ b/sound/soc/codecs/cpcap.c
@@ -1622,21 +1622,12 @@ static int cpcap_soc_probe(struct snd_soc_component *component)
 {
 	struct platform_device *pdev = to_platform_device(component->dev);
 	struct snd_soc_card *card = component->card;
-	struct cpcap_audio *cpcap;
+	struct cpcap_audio *cpcap = dev_get_drvdata(component->dev);
 	int err;
 
-	cpcap = devm_kzalloc(component->dev, sizeof(*cpcap), GFP_KERNEL);
-	if (!cpcap)
-		return -ENOMEM;
-
 	snd_soc_component_set_drvdata(component, cpcap);
 	cpcap->component = component;
 
-	cpcap->vaudio = devm_regulator_get(component->dev, "VAUDIO");
-	if (IS_ERR(cpcap->vaudio))
-		return dev_err_probe(component->dev, PTR_ERR(cpcap->vaudio),
-				     "Cannot get VAUDIO regulator\n");
-
 	err = snd_soc_card_jack_new(card, "Headphones",
 				    SND_JACK_HEADSET | SND_JACK_BTN_0,
 				    &cpcap->jack);
@@ -1660,13 +1651,13 @@ static int cpcap_soc_probe(struct snd_soc_component *component)
 	if (cpcap->hsirq < 0)
 		return cpcap->hsirq;
 
-	err = devm_request_threaded_irq(component->dev, cpcap->hsirq, NULL,
-					cpcap_hs_irq_thread,
-					IRQF_TRIGGER_RISING |
-					IRQF_TRIGGER_FALLING |
-					IRQF_ONESHOT,
-					"cpcap-codec-hs",
-					component);
+	err = request_threaded_irq(cpcap->hsirq, NULL,
+				   cpcap_hs_irq_thread,
+				   IRQF_TRIGGER_RISING |
+				   IRQF_TRIGGER_FALLING |
+				   IRQF_ONESHOT,
+				   "cpcap-codec-hs",
+				   component);
 	if (err) {
 		dev_warn(component->dev, "no HS irq%i: %i\n",
 			 cpcap->hsirq, err);
@@ -1674,25 +1665,27 @@ static int cpcap_soc_probe(struct snd_soc_component *component)
 	}
 
 	cpcap->mb2irq = platform_get_irq_byname(pdev, "mb2");
-	if (cpcap->mb2irq < 0)
-		return cpcap->mb2irq;
-
-	err = devm_request_threaded_irq(component->dev, cpcap->mb2irq, NULL,
-					cpcap_mb2_irq_thread,
-					IRQF_TRIGGER_RISING |
-					IRQF_TRIGGER_FALLING |
-					IRQF_ONESHOT,
-					"cpcap-codec-mb2",
-					component);
+	if (cpcap->mb2irq < 0) {
+		err = cpcap->mb2irq;
+		goto err_free_hsirq;
+	}
+
+	err = request_threaded_irq(cpcap->mb2irq, NULL,
+				   cpcap_mb2_irq_thread,
+				   IRQF_TRIGGER_RISING |
+				   IRQF_TRIGGER_FALLING |
+				   IRQF_ONESHOT,
+				   "cpcap-codec-mb2",
+				   component);
 	if (err) {
 		dev_warn(component->dev, "no MB2 irq%i: %i\n",
 			 cpcap->mb2irq, err);
-		return err;
+		goto err_free_hsirq;
 	}
 
 	err = cpcap_audio_reset(component, false);
 	if (err)
-		return err;
+		goto err_free_mb2irq;
 
 	cpcap_hs_irq_thread(cpcap->hsirq, component);
 
@@ -1700,6 +1693,13 @@ static int cpcap_soc_probe(struct snd_soc_component *component)
 	enable_irq_wake(cpcap->mb2irq);
 
 	return 0;
+
+err_free_mb2irq:
+	free_irq(cpcap->mb2irq, component);
+err_free_hsirq:
+	free_irq(cpcap->hsirq, component);
+
+	return err;
 }
 
 static void cpcap_soc_remove(struct snd_soc_component *component)
@@ -1708,6 +1708,9 @@ static void cpcap_soc_remove(struct snd_soc_component *component)
 
 	disable_irq_wake(cpcap->hsirq);
 	disable_irq_wake(cpcap->mb2irq);
+
+	free_irq(cpcap->mb2irq, component);
+	free_irq(cpcap->hsirq, component);
 }
 
 static int cpcap_set_bias_level(struct snd_soc_component *component,
@@ -1754,11 +1757,24 @@ static int cpcap_codec_probe(struct platform_device *pdev)
 {
 	struct device_node *codec_node =
 		of_get_child_by_name(pdev->dev.parent->of_node, "audio-codec");
+	struct cpcap_audio *cpcap;
+
 	if (!codec_node)
 		return -ENODEV;
 
 	pdev->dev.of_node = codec_node;
 
+	cpcap = devm_kzalloc(&pdev->dev, sizeof(*cpcap), GFP_KERNEL);
+	if (!cpcap)
+		return -ENOMEM;
+
+	cpcap->vaudio = devm_regulator_get(&pdev->dev, "VAUDIO");
+	if (IS_ERR(cpcap->vaudio))
+		return dev_err_probe(&pdev->dev, PTR_ERR(cpcap->vaudio),
+				     "Cannot get VAUDIO regulator\n");
+
+	platform_set_drvdata(pdev, cpcap);
+
 	return devm_snd_soc_register_component(&pdev->dev, &soc_codec_dev_cpcap,
 				      cpcap_dai, ARRAY_SIZE(cpcap_dai));
 }
-- 
2.50.1

