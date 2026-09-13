Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012002.outbound.protection.outlook.com [52.101.66.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F1939F168;
	Sun, 13 Sep 2026 10:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789294578; cv=fail; b=PqmDVOQd3wZZPq63CmuQFQhn2CNUhQzj3FIgj0TZUfU8v8nPEgmx19OTAXaZjK0n3srcRboOAyY0Dp4a3zvQhDPQyj3hkV/LTcRbBKCsk1rvrsdxufQnEjO6C9qcV26sg+hlZVJpDFoSd8aNDrh63VQ7NotFJxG4oz89krEY7c4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789294578; c=relaxed/simple;
	bh=GnCo1yw3uVDKSbSedrtm3tiD4xzspQdiDRq4kpX9ELo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CncBm7A1IrAca27e9DPg9/9RfrgrxIXlxMB4Nq4UpOSrx2/ctu61HWCRw7ulvK1UBplmD2Kw9oMk0OcJ1mOTIWKHdmTmPgjZZPboeu2XvYAud3gB/b/DHT//iTVKHky6w+rk4CxHEE7IVLBricp8ViGLgXYFnSAYFSUOiY7VTZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=V9USobh4; arc=fail smtp.client-ip=52.101.66.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="V9USobh4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LR/XafgQUg5K1a5awWcM4NwDEc/Oh9xfEnmsT4yK7LYDVPC91Ec45tNNhec4tbKqgVoC+rpQ52C/rNUQ13PaAhfZx9ijDWBDNMWWWbAyjSgFo3tmOLRTy7WXz/+eYK9X5qf2MGTEqw6BkvOPDkiuPvez0o8t43ov+1TXQOa49HWNDd03ep5gS9Hw1yUQhTd30WRniGmMlX8uIrWON/HtQprOgDLUGrpCREDe7H2zKvHkpig/ZSPvFJ4ZfBnTTIPXR++Bb6wYDjHA7E1bET6tn8uDVN4KWCiMxXLwi42FcxIdfRqhiMiZPqDpICF08MnJ/c3hjmutVXcIwlUPxK+Xag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lNH//LWI6WQ4zj7cNQ6Fsw2aFbeOkFy6e7LKkyVLfAY=;
 b=S32dTjnHFlR36BYh3LMpPqhX/oHotD5TumMMJuonmJ2fayPrUrUflKYXCVxTe2qh2SgbgJufRAUmRsU0k+SqYDqeedGzW6vimLLcYdvyWsDWdPWHR9ziHFnchMiRC/cXWz/2skjGPfyHyfWxFYRvLZXd3B8XQFjpQU+t+xTMsq0VVVdw2na5O7i5ZNyEtOkQJ2OtVLWHa8ZavDKqsB0S3PrYekwyoLZT/kvMH/WZiKDFOncbO20ov/GCmDJ6ZykeZDl1sv1BbHX0EvJzJz70/p+eiZAO/k4W1M0DspJMcrBeohpVXFl0+suA34fR3uivwd8KIWzzaaFhao/fySRSyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNH//LWI6WQ4zj7cNQ6Fsw2aFbeOkFy6e7LKkyVLfAY=;
 b=V9USobh4VjXelIAmbCb43vJToxRXraXVZ4LHTO5v8Pi/dl+JyD3HTAALnTwje5BSRe+NJCexZY0+/b5wlBp4R1tMkIdR8C4Rk5Ecz4uvFi74IaVcgfjfH0b4hPlJv1Ru+EiLX3FBO5M66dMDONYjVaai+YndIL1u3SW/tGP2GSvnLawLWgrmvOUa8KzShahYpcesRgDoyaexmmStDhRutMJpHsj9VPJqElBGSaIugSftdGH2eWP+48RSmjP9mrZNp52BXdIQALWBEV/qWqQIgocJmbFY6jjna3ifkNh5Akk+HDg4crIwWIO2oklm7wlLwRZ5neVUYwBxtpsapirTlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM9PR04MB8602.eurprd04.prod.outlook.com
 (2603:10a6:20b:439::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Sun, 13 Sep
 2026 10:16:12 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0406.007; Sun, 13 Sep 2026
 10:16:12 +0000
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
Subject: [PATCH 5/6] ASoC: cs42l52: Fix beep input device leak on card re-bind
Date: Sun, 13 Sep 2026 19:15:30 +0900
Message-ID: <20260913101531.2787654-6-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260913101531.2787654-1-chancel.liu@oss.nxp.com>
References: <20260913101531.2787654-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0013.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b4::14) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM9PR04MB8602:EE_
X-MS-Office365-Filtering-Correlation-Id: 5339fa2b-7323-4631-e9db-08df1180095f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|19092799006|23010399003|22082099003|18002099003|921020|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	djIwmS9m4oRXz/g6RtahUL7WtxlKb4fe4B5Kye9x0KsCRU3ouvDeUybpGFuwhsJLxRaSbyCTaLzMMCrHank78Frv+GklVHKfC95zkHp7dQZUwA/7iFdxVCm0ksUCumbZkComQWU730qcl1Yn+EVfZv1XelGJCf4x0zkWX7COYt6XmjnD4H5RRwVQsMwARh72cnOhkNb2+6/Ogi3OESKm4fltDdRy54MeCwJ/2D57sJExIkujK/Yo/c0yvGOzBP+IHS/+ym1k2xdF6cHHTXR+H0Ap3inXv1Ox05pI2OlpvhiFdN/j96QewkjvXB+euJJEgGz+s44EOeJcCjVl0QioANUk+sJfT1i2uwixpWfOz6lNpRun6TU6yyFCPjTNfc+J//TUP0q/SR8ImI/DL0Gj5H10Uq0qXn4m6ZYJjyxFFQHBeBBGdWKuWeYsD5CYoKg1VeMw+BkcVzTgITkYjxDqXuW9D9vdhuhphTxewko9ybiLu2IrR5TafyeowJIrSPzdjV1AZMPHGkyhwIouxaX7BjCzSOm1wluOlEHFo2G6X4FtB6dyNBYdc2ru1K08eTwyZQAk10N2wZhf+8ltjmPRZe97ShXsTvQ5Q/WIwONA+YN8zXGjQnnjmVPiSjJWgoPqqCbY/WJ9ZnKzPmupY0kYNPg+B5Pf9i2TvB+UabfOwFGwTDsOTZNJuBJNxzo2dfhCW/K4QqwpdlHs+rziXJQEsw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(23010399003)(22082099003)(18002099003)(921020)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yHN7JnyZt0VhzJkDdPE8t/35bPhsXeFh3yHbBBZaCPaxOBZmKxis03sLAS16?=
 =?us-ascii?Q?ZUdk/lk0gSc696c5B9Ps0NUFj4S316sva8Ywn/EMx78bnRgxsTQnUj/fS/LT?=
 =?us-ascii?Q?+JEmz+ITyYXKnT650PCMe3FQD/CDxLXBPYgdtjsUJBFb+Q8m2guWulBk0f5N?=
 =?us-ascii?Q?BhROiM01cBc3/Ik1D4W2+gQpfCHNCQxFmGscUd2uctBxkoBQpr3mTrFTogYu?=
 =?us-ascii?Q?HQ9Kyz6+oGmjiW24AiBG9W0p2Q03eVSgEjUXz4LD67OjVF9e2u+HBuiz7TG/?=
 =?us-ascii?Q?E7UUU5dBFWi0QrjT6ama6SYqbeLBNdy8AF4QG7XGPZkMmA1QJ43bqjKkasLC?=
 =?us-ascii?Q?rbAs+p33VyxA25MGw4i1sxkRHIEaMrLu+PQBwa+iftJY+ji2tOcTJ36/t4uV?=
 =?us-ascii?Q?wHU4wyDi0ouTjpLEfdur/RDw9aQNoWAtbn/7OgAI+8LR8/r4+IWAaYcMzNQl?=
 =?us-ascii?Q?MubiSN6ytG41QgdLci0iyA0X+Qicpxcpq27CcATsEmF4TdJOkD84TNRedytF?=
 =?us-ascii?Q?D1ZfmWt8z2qEQBKm8bphL3OZn4J3Bc0IUCdLBRQ+KGiXzs/r6MCqbm0j9fnR?=
 =?us-ascii?Q?6ScbkNwOVk1vsQFFnjsrFgVKHuX/0IOYLJvqNe128Bvo0t8UU58AqQge47L/?=
 =?us-ascii?Q?m22mSQDyLNTYah9wo0/BgVlnxFhBtM91cIyKK20Tygy/KXH15psgqbHyMkbG?=
 =?us-ascii?Q?0dqCEUFZCbw68QLEJFjgeeBY25nEV/6oU+k7aVEFngFyk9PTLaBEh2sBkNTa?=
 =?us-ascii?Q?/hm2zL/wXBU9h2JDB2Xam5JP5UJAD74V6TLYfM6j6HK7LBoMYnttYuUpuPP0?=
 =?us-ascii?Q?D0TKrQkIaaDrS3MQypA+3dTj5rzH6GiZjrU6MVMhKctC3q5glg3zfDLGrYAW?=
 =?us-ascii?Q?zER8QUdjBDk1QpQxeyuIbupfY2gt8Z2KqK07LNsqDLSH4rZINdTAXB/cJ5QS?=
 =?us-ascii?Q?W4hZcAxnkE/HF007T3zIjVTTXUo/DSX9KYa3GsHju7OXpt59T2Yy+xfMkUVX?=
 =?us-ascii?Q?1r610pknskw9oCWrMUC6tBh5XW/ck18RMIOcBDQtLX9Ig386NFuuW15l2z3g?=
 =?us-ascii?Q?iHfBhAlDF6qgXNuNUXxWC4RpPBerUKvqUlHawi9+O56PuBkA/9wbOHDS854L?=
 =?us-ascii?Q?OZCuOH2aCc4cAKcf5CAUlJLNlpVcnTBxSRqlKETBg2mdcgvxmF7z1n5nfick?=
 =?us-ascii?Q?TDo6U0Zpq9gP9sgw0OY82Few5CV/7kxXuQpdWL4nTd8rGTze6XnvYcycXgO5?=
 =?us-ascii?Q?3l3/0XUQegipbmHOYYHo3TdpQqYlMancRemvjCREH1FZQICdr7sRUA7RTF8H?=
 =?us-ascii?Q?2pu6NDn99LZV70LN0c4NB7XkEscA7e6mBknPiZ0aS9x6/scfmfSAJEVHkgV9?=
 =?us-ascii?Q?i1NvMn0oBI1QwTWCxLQS34nypvbLPXANswkPE9+RqjbFGFCYM/Bsq6PuTW+7?=
 =?us-ascii?Q?sG+Hr72fVe6baKeXJQhLLFl026FS6+DN2Q1CAaOSTG0Ne5xvVAWkNft9manm?=
 =?us-ascii?Q?oj3UMAtY4PrTopo+JhLWs9ezbncoNfAOKMOznT79+B7s5FfaykywQYA/hmM8?=
 =?us-ascii?Q?ygDvEj43pAN4W3zc2OLmRGudbC8gS9FAhP0C0ke51ezLnuKnre5MO7NA583W?=
 =?us-ascii?Q?nthyMbdXtf4xfm0Ersf5sKT+7GrLoFrELswipZzfBK+0BFRJfK3cY4MTOg31?=
 =?us-ascii?Q?46xdbJ6ii21j9WCTJxmaXiaapAJ5KI+Y3r2tu7FcYBcZiw0HRH+va5Fbwt2m?=
 =?us-ascii?Q?HM0zFdN2ZWJTik+c7LbdjW494xMuEg7+BnZL2iGX/iCkHi4rph0Y?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5339fa2b-7323-4631-e9db-08df1180095f
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2026 10:16:12.4741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rgJeXF0xGN1JfHdMa2HDOG0kebWrTn1keJSw0QNFJ+spfXgy3v2R05mQUGknNAteNTF1ytSXY0JiR5llQkamnYwpcgqsdH5i44KU4ENofjXpXH1dC0E4SUkl8p73wcqh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8602

From: Chancel Liu <chancel.liu@nxp.com>

cs42l52 allocates its beep input device with devm_input_allocate_device()
from the ASoC component probe, but the associated devres cleanup is tied
to the underlying I2C device, while cs42l52_free_beep() on the component
remove path only clears the cs42l52->beep pointer.

The input device is only leaked when the sound card is unregistered and
re-registered while the I2C device stays bound. On that path the
component probe runs again and allocates and registers a new input
device every time, leaking the previous one and its sysfs/input node.

Allocate the beep device with input_allocate_device() and pair it with
the component lifecycle: input_free_device() on registration failure and
input_unregister_device() in cs42l52_free_beep().

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/cs42l52.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs42l52.c b/sound/soc/codecs/cs42l52.c
index 9d6bcfbbf0b2..0cced269f300 100644
--- a/sound/soc/codecs/cs42l52.c
+++ b/sound/soc/codecs/cs42l52.c
@@ -1000,7 +1000,7 @@ static void cs42l52_init_beep(struct snd_soc_component *component)
 	struct cs42l52_private *cs42l52 = snd_soc_component_get_drvdata(component);
 	int ret;
 
-	cs42l52->beep = devm_input_allocate_device(component->dev);
+	cs42l52->beep = input_allocate_device();
 	if (!cs42l52->beep) {
 		dev_err(component->dev, "Failed to allocate beep device\n");
 		return;
@@ -1021,8 +1021,10 @@ static void cs42l52_init_beep(struct snd_soc_component *component)
 
 	ret = input_register_device(cs42l52->beep);
 	if (ret != 0) {
+		input_free_device(cs42l52->beep);
 		cs42l52->beep = NULL;
 		dev_err(component->dev, "Failed to register beep device\n");
+		return;
 	}
 
 	ret = device_create_file(component->dev, &dev_attr_beep);
@@ -1038,7 +1040,10 @@ static void cs42l52_free_beep(struct snd_soc_component *component)
 
 	device_remove_file(component->dev, &dev_attr_beep);
 	cancel_work_sync(&cs42l52->beep_work);
-	cs42l52->beep = NULL;
+	if (cs42l52->beep) {
+		input_unregister_device(cs42l52->beep);
+		cs42l52->beep = NULL;
+	}
 
 	snd_soc_component_update_bits(component, CS42L52_BEEP_TONE_CTL,
 			    CS42L52_BEEP_EN_MASK, 0);
-- 
2.50.1

