Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011058.outbound.protection.outlook.com [52.101.65.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB8B466B66;
	Mon, 21 Sep 2026 10:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987752; cv=fail; b=hD47ZkkKL2sPIhVDhou/5TZKt0TX+7idf5eXBX+xeyFKMlypmD0TXzLG0dudC+uu5uorf4OL/O7lOxdgGddSW+HhkTryNf9M9nOWhr0eR1eDraOmiy/Cw9h5KUX9ChXfYUgQhP3Mide/Z2sI/TyfSKBqtNN/LVNVmXwdRT66X8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987752; c=relaxed/simple;
	bh=ZlgmRKe+3W39m05Q5PIm71LY5brgRujlkiKZtd4imio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EFQtoLA4OD0XAfQ/ZPjOs5h135PQ497GTcxNv5hdXMBUQa0TWRjti3G7ojjHBggtbF1HftaVOD0/BLEbJ8bED4CnVXswP7RYA4p3AnI+laLzYRNnwPfOi1jbVEUbNuJEeN1/pCA3efdqTBbWrvYjavNGIs60AltLz3qyCF1+fEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nhJpODKM; arc=fail smtp.client-ip=52.101.65.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nhJpODKM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bU9AMvgbub5inKkdIWvqGOqDhNtNYmwOCXpVz0ecfEcDplRfsfUFtAjNswDVeG2/I8MR46pcJ5zF0O1xXuM+pxGOs2Rpgtxklf/lRIRZaN6lcs94VxkPEs6w/dG0HZMMo2ERo1KGfKnIW6BNCy0KlJ3iNR1gsvk6QowPm8f6Z9G+ofHld+Uk+reLCs0L51fkZMG3z5mFzhzYyZCha8SWqyAPM/57aRbJVVMqCmhq3zRNDMfPguHKZz3h22vwXkM7BFx65gVQYM/22J+MRREZHnV6fhm9ZyQ2PUPutminljcYuqdngrAm1T1Y9nX1tx/xXJNP0pGp1xEfeGSYWVdLxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJYBDOLVnzUjPONlXIHXH7lw9hUQK7r3BWfpstH+XE4=;
 b=uBwv1sVlCpQXOKQdNm4ZwJH+kRdFEnoZK6sgJz0/GwBQrDlOSlSrJqq93hkrn3D0dTwMAmmXgsCmge1ABK+yoNfgOjWg3/FnlSLoligs0VO6ExHqCwSJPErU7kA6TDg62leArRAyzxplCcZbfdjzIlQpwCPGkDevAkOFMD1DM0DJNGIfj48LwzF5s1DMQv6qv4S9oBCM2b3G8geXSbLMlwuNm8u349kOgPuWm7W20h2kcSSKiG2i6mDYo2sBo4PBBWtt1uKrxEW7+rD+4kWR/tkSmZu7rkfcJup+wSRE3FP5Ubarb/1wHEJQKHkW6at7oVoQjBh2nhl4CPqsywDaGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJYBDOLVnzUjPONlXIHXH7lw9hUQK7r3BWfpstH+XE4=;
 b=nhJpODKMTu3/amRomyS36VBkxZU72jUwOrBpDOA4s/ftKPoLRBtarKJfM6s7ukKxaToiixIrg3Pve0pvgrtZkEyxdMu840nVSiMI5Ql9ZGA/l8X0rJGYKSg2r07iocZew9S4k5pIyBAe3warjQYnyWI9EnH0K9Jkz4uoOZozuG9ziSthyh51VDYxdhl9daLNqHP4IqbmI7VmADWQuTw8OpF7mGWNYHVdeMApqwRKe91hOyoGkF/5ZZvE4KCmIGVsKz6jsNjTbMwgmtYXLRxL8ftCC6GkrT9kSphWcMVoa5/JYVQHHao+ZBh8aEy/9E1ZR+E1LEMggSPc7e4DqMQuTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VI1PR04MB6862.eurprd04.prod.outlook.com
 (2603:10a6:803:130::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 10:49:07 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 10:49:06 +0000
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
Subject: [PATCH 19/21] ASoC: rt1011: Free the bq/drc coefficient arrays on component remove
Date: Mon, 21 Sep 2026 19:46:38 +0900
Message-ID: <20260921104640.1941554-20-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
References: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0151.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c1::10) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VI1PR04MB6862:EE_
X-MS-Office365-Filtering-Correlation-Id: 1257f46a-079e-43a9-e073-08df17cdf519
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|19092799006|366016|1800799024|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	y2G1bnbP6npYA1bAbvq8zjpRFKlkWhKsF1ZyQ1tBGxR9Y6svVswSOdjG+FqmbSozfmT1MnRdYLOGBuaFJyB8JYW23UrEV2qp3hPE6/sCmQKcoUudTn7YVfHtFvLF21oonpS31KjWsmUsyfydanhKGwcYt9rXsyLxzc4l3oX9SVtVQVk2mRXmDaC/rsoxwmLYARs0GFcbP+T0aYq0Pz/WX9Vsa8FpMQEqJUXc78jV1eY9EJSyW3Azz/JqLCujgqaGlHH/LzA3EMm4tT1hE8EdVPR4R57jRpZc4P88ms+MUjvtW0Mtx3JXqp8ynPGgAoxrfczJQX9HYKNZNFmrMQUx9wxy7/N6CZ6d8FOFdFQoN1nn6D7Aqw17vJOlLUcmDuausHWaI+o1WL2lma7XRpskPItJ7Q1JPm/XJbkYH/CK366gdCnloE2P4MlmGtmKCSDgHkKx/WGhg1xBMce2vEmUBBVlBXUqlqgGwukZI3vS+7s/pI6+mHvvudiSzToQyTEDPhxkU3hnZ4mJ0jlOUIvnq0dsSinq7vw/hSTJKU3C3KO2ARC2Ynio6aKLhsgO3LhaLSIXJc30caQ+xh1CwqpjK2Zz+3wdvh69XqmjAAuRt3JsL2DIiusmRLolLID8NFznvnebhuqRffAoz0tpGpvPDzfQnDnTphsVcnJgqAnpL/E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(19092799006)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gWGS5gBYYBKxFZv/tqLLvmU9GTE2ih6OKRI0TB4Zxe6Tp3P5ADUitC4VBQRm?=
 =?us-ascii?Q?y/jpP4g9cWKiTN1sz40b1sHWgEipuYSSYsbZKFnSxCk2RApeN3rUzxvCTpWs?=
 =?us-ascii?Q?Jl2WdSLM5zGX81VNuHK1N4HQaHMNJqNhpmvnCoKBDcrLy9HbZyh+3ko9ROOi?=
 =?us-ascii?Q?/Fk0crxVBn24UgxABHW2gV1gKWMbac9q5dLejdPuzW0e65u2UlMBjMMG7gH8?=
 =?us-ascii?Q?xFVxU0EmOmlN1nvOw3Vs/xLU+Sp8BFF9SU931L6UlyZ+C9NOvUph1yhKcEw9?=
 =?us-ascii?Q?uzBhf8vVrz6xnqkjjlpT7jmz+kKva6wkqsT6pH1AlzQCb+mT0ow3EaLfQbKc?=
 =?us-ascii?Q?RGl6rRRyQGExUqWFD1yZQu/a8Xkh6rhno1i4q6Z6wz0y2HsAKTCv85dRY22E?=
 =?us-ascii?Q?9Vho2z+W2iJCIlE2wuVLDffpr5MK2RJWkpbg+fdDdgTVPAMSBghI+dAvAp5m?=
 =?us-ascii?Q?4EnhRBJArFwLwb7tJdBLGFArAU4ZU/73BN5SsA3gs+h1/JiGHhJnymLHRL6n?=
 =?us-ascii?Q?RfgXQRYe32ikPoyS8wl/79P+eezeA1uIsC7TtVQzZ7iKusMUG1GIvUIUWYwt?=
 =?us-ascii?Q?nW/REkxFqCAArki9KiPbMC3vCPmO5kC2bKZ1m+L9CPCUphmltbbYKABWcSjI?=
 =?us-ascii?Q?49DAJ/BW0fqw8NQCH7V/2lJkEbq2NiTzvnyPs/zhBcJEDWRitSpcg26rTHBX?=
 =?us-ascii?Q?E50POJikoTKYkR8athvIjmyw1Gv+j7DA43Uxiq+4NQzIrBW04TcsAsW5+xz7?=
 =?us-ascii?Q?HOwP0ozySIbPesJAQpM3o2+HNJvMMZdbiAKFPk6fipNVNiGhGgza58HzJ83F?=
 =?us-ascii?Q?FE5X2yX+PvLNwXu++qgva6jp68YAjVAJ1wt4qhiq1VAcBwcQF1ViBe1HteGR?=
 =?us-ascii?Q?mQtSGQoDyPazjEmMjOG5DKaJoNXCnvGzjrZ5diMgOusDqj76j3qemuVBi76+?=
 =?us-ascii?Q?0SW9hUJFI3Giv7e7EaTmT2kZVJa59/hxaEgjD8CY4DZqPIvNKCXSUDt6LnCD?=
 =?us-ascii?Q?ZEGS7msY7yKHs8bsTzIUIampGnu3J7h7mCU0IoI9RpKlk5vlZByrkZlOppsD?=
 =?us-ascii?Q?t1XU7bjjA5is5sctDq+pxdZD5U/5uq3mZn6uCI73zJwXbwPO46saZ5XeyYhJ?=
 =?us-ascii?Q?B+NeAVVKDPknRAq+keosO03yAxUTwe6zG9m+jUMEjw/jusI5xOxz+El8WmD9?=
 =?us-ascii?Q?6t12GfoZh6EpaDN7rkftvoabQrnUR5LaHztHEVifT8IpY0wO4/bH8/YqjLoG?=
 =?us-ascii?Q?dE4D916Mj+0N/6LzznJvjTIjLRdpjrea6rhfuMfePBqtJvOKlHLiCGqMGjrr?=
 =?us-ascii?Q?J8IV5snHCkrCLw8ctbzq0qn+7arCmW6xUwhuGUQgWh7TjpDK9JOoC4pz5p2I?=
 =?us-ascii?Q?NBI4qrOYlDYZ7tkxJLOlqZt9xbkU8ECPCq36BiCNKtE17B/aWwGcPPaXGH7h?=
 =?us-ascii?Q?zor4eq+NMaNi9oeRTnRoNU0kL+dLbHi+LteJurQ8yMQx5CYSrujkmTI3U+5E?=
 =?us-ascii?Q?PTN0cvrzUit09gGNCzmAy2VwfIaodsX0AvlP2srO7z7n/dklh2p87uymuFAq?=
 =?us-ascii?Q?1wjOWx1A7H8j5gH9Yz6IwD9d5Foq+dvaqts3dGXILZq7/kVf758W8+DQBvsl?=
 =?us-ascii?Q?AN0KTxTdiPfrfyHJrT+nhNVPNMUnnVExslZbEZbzLgU0vA1R1UdNF+Inb/hf?=
 =?us-ascii?Q?Q9fVKb5EIfczvkWXMHsYyYbn+P3cAl8PC5avUP+CI5Oip4nmrY5v7wI7Bn1C?=
 =?us-ascii?Q?GgrME/pjm0sSfqoP+yltDojJynkcFPe3eHyGmDJwguY4BUmx59cN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1257f46a-079e-43a9-e073-08df17cdf519
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 10:49:05.9851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KiPLR7H0/H0XrOtDOdV/m2u6PaUgX4TZSyTDLoCozMYeec3IZLd+gak7WCEmG4N+yWHr8AKyYversrqvVQVFV6b8JAatf99HO6xyJ5FaRSfBbz8G4mYwUyoHoDcq2S9x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6862

From: Chancel Liu <chancel.liu@nxp.com>

component->dev is the underlying i2c device whose devres is only
released on physical device removal, not on ASoC card unbind. The
bq_drc_params arrays allocated in the component probe with
devm_kcalloc(component->dev, ...) therefore leak on every card
bind/unbind cycle.

Allocate the arrays with kcalloc() and free them in the component
remove callback.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/rt1011.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index d47b0370dd6b..c140c079838d 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -2053,29 +2053,45 @@ static int rt1011_probe(struct snd_soc_component *component)
 	schedule_work(&rt1011->cali_work);
 
 	rt1011->i2s_ref = 0;
-	rt1011->bq_drc_params = devm_kcalloc(component->dev,
-		RT1011_ADVMODE_NUM, sizeof(struct rt1011_bq_drc_params *),
-		GFP_KERNEL);
+	rt1011->bq_drc_params = kcalloc(RT1011_ADVMODE_NUM,
+					sizeof(struct rt1011_bq_drc_params *),
+					GFP_KERNEL);
 	if (!rt1011->bq_drc_params)
 		return -ENOMEM;
 
 	for (i = 0; i < RT1011_ADVMODE_NUM; i++) {
-		rt1011->bq_drc_params[i] = devm_kcalloc(component->dev,
-			RT1011_BQ_DRC_NUM, sizeof(struct rt1011_bq_drc_params),
-			GFP_KERNEL);
+		rt1011->bq_drc_params[i] = kcalloc(RT1011_BQ_DRC_NUM,
+						   sizeof(struct rt1011_bq_drc_params),
+						   GFP_KERNEL);
 		if (!rt1011->bq_drc_params[i])
-			return -ENOMEM;
+			goto err;
 	}
 
 	return 0;
+
+err:
+	while (i--)
+		kfree(rt1011->bq_drc_params[i]);
+	kfree(rt1011->bq_drc_params);
+	rt1011->bq_drc_params = NULL;
+
+	return -ENOMEM;
 }
 
 static void rt1011_remove(struct snd_soc_component *component)
 {
 	struct rt1011_priv *rt1011 = snd_soc_component_get_drvdata(component);
+	int i;
 
 	cancel_work_sync(&rt1011->cali_work);
 	rt1011_reset(rt1011->regmap);
+
+	if (rt1011->bq_drc_params) {
+		for (i = 0; i < RT1011_ADVMODE_NUM; i++)
+			kfree(rt1011->bq_drc_params[i]);
+		kfree(rt1011->bq_drc_params);
+		rt1011->bq_drc_params = NULL;
+	}
 }
 
 #ifdef CONFIG_PM
-- 
2.50.1

