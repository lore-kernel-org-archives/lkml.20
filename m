Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011006.outbound.protection.outlook.com [52.101.70.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE9A3E559B;
	Wed, 23 Sep 2026 06:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144145; cv=fail; b=bdJd6hk2tVUlm9TWQPlYGQVlyVCqoZ+Kh8t2rNg1seu5GKrU7q8dzwYBVSmH5zCeLsP1ZwI2z8OsX1d9WH6K3FeuSxG6RvQYSEzhGi6rxamsLUcXkzDN7Khzvnh5RiVjduoIu6jknTwOlQJKQh1tofQajR03ZJMs3H+Evzf2d8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144145; c=relaxed/simple;
	bh=ZlgmRKe+3W39m05Q5PIm71LY5brgRujlkiKZtd4imio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GSRqUnSH1O0kMXjBoArnqOIqf2qT7VFVoItBnMjiPl+E3JZLCjSEtUb5yya1yErhRbFpobxL6W9SZEIGe36D9iXSfA7mlHAdIcYPSWoI8aaVme47tET34lzzOoa3Z327YqW37b3ODEGt13XnQ1nbBrD7v1YUi3inAqJbt77hYeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XfZzrlBP; arc=fail smtp.client-ip=52.101.70.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XfZzrlBP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UEBrcRedxTxfcacnRbDTFZH4U/NaedZq585RzTIDnp3zl7sfB/ociZ1R5sm8p+sAnVrGD1BL6hI2FHNH1fXE6SNEILmNgtBCDaSiYbVStFdGGO7E3JZvFPt+qj6P968w0Kdt/YXlZ+3HuvylKNLk0BlNsNc1rk+PAh85DJg1xOqKp4dJW09vlGSCqziOYjBP7O/w7TWvdqFTk5nrXun76vOj9MACLoKPvliCcjCv5kdDyMAj/8k0MWGIqknyjvoGJzwpWUW+JsApuUYsL7IN1VwpWdZ7TvkY3uLYtApE9zospHS7wxaMWppPe2wcgyoI0h7GSOJVFVRwNtbkDeYpjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJYBDOLVnzUjPONlXIHXH7lw9hUQK7r3BWfpstH+XE4=;
 b=GBU1i44iz7yW2KJ8D8FsLgoFa19GOstcRUkEmyI9wKmw5EX7HALjb/JZJRNahpehqZU1QXUUceLn1dlMcPkm3998BXKvRwuMaw6sYRA9Oth7rNzK7BavlXXosTHMnsw3kjFmC4rOaWRYvQJAj4F0pcSBvJs0By+8GjBvDAkOr+hcWas5ucOuO4vvaxtxIe4aWspJ5sFdNzJbQKjhSZKJ1Vwgc3VCMeu7NC32Lq5FqEXDEG9iVBJQhK+pw83sJC+/3O5srqhqdyrcfsZ2yjdIKoyM5/k73P8MllzOWzu7jZcaYr8MCFzSOTa3ZIgAbmw1oxqM1R11KsP/uLB5mGXY/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJYBDOLVnzUjPONlXIHXH7lw9hUQK7r3BWfpstH+XE4=;
 b=XfZzrlBP1923nAQFDsAD/TxzzII8vfoShCoabfZDC+VMSM6NmrQqEGkLPehIYM4UOJKHbAmApfhBdeLvNgoRoTJ+NcO6tx+ePZi5Abnc3oYK9lUlURkWFedQPyyJKQamWPdEFty0oLEPhNutDC03QC8hzFO2B/xYrVyTepSAAOyX6cRIt607GxE1oT3S+6UEIYhIXMgMal3ajtZcT839/7Vb2ETQnkuZoR/szoA/CF6PG0HN8OtqSwxvE7aQjz9tr2Jl/wpkJUBPZZnJ50Ws9mal6UmA4H1uqgSpte7XQJpGmcUGSc40eI2MWA9SvCXikeQKB9tLVANZZTYSYfLKjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM9PR04MB8339.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 06:15:35 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 06:15:34 +0000
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
Subject: [PATCH v2 19/21] ASoC: codecs: rt1011: Free the bq/drc coefficient arrays on component remove
Date: Wed, 23 Sep 2026 15:13:03 +0900
Message-ID: <20260923061305.4041197-20-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
References: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0058.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:115::15) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM9PR04MB8339:EE_
X-MS-Office365-Filtering-Correlation-Id: d60acfa0-5c4d-4c9c-e203-08df193a13eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|19092799006|7416014|376014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	nzBDrGwZ2SdCT/Q6/ctq6lWt1RKrC76ai1ocZ6GckyMY9AxoK+D/qnEL11AUcJkx3gJi8teaSP1co2X+0IzOuz56lIsTFh7tb3uqzEsA8Kh83JJKZdTsiidoiGcwDcOb+Hgz6U7YJdDVeEgiXHksnc3vAkgXHAssLMvH7McZcM9IQUZwG6v+dV9eye3/zVUD0i0dcBekyRAItKnvBafbxSX70RvKGVU0KaJ/Crga7F0QOuLJvUKg1c29zlxW/qdcukFmqd0y3ug8ekWYHx01b6onGELfyvaoIDzAgVWPh3tUqe+izWuIg1F2KTrHnqfdCHlLnqEQ1B9cZ7kBpZiB6Hnct7Sn+DfhHAriPHyVbhbVQVDjhUOJh4qDxXzR8s72A8cCU1ICndO4uz7gJ4CvyIBahLPeYVUAEvWDPpSRE7MleFKVFQsWTFIksopb3FMhSQ1XbQv0QYF8rNL4H5+H5YDIusmCYJ+Psq5DzLvcbGTn/szFTY+8Yo3GrAaQDt2derYpO9bL4DLipBFbdveQ4IcEfZLvbdA5yjODcPkVbL9kz0NZcLnQfgfnRWxNt2R8f+QhHP4uhU+3HJTcK5aCio99ItcBL/fOxvjvt9JvlZn6d5HFj1OwVVxHXvOb6cc2o1gbqrR0H6JCfLPN5SZNarfl4gD6C/EAbuCmokXCQi8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(19092799006)(7416014)(376014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PxCFT689NjtqSzHwbpp8JMAV6XW1/NpSeUXopu3O99D2bwr/m/uy9qPMN5OV?=
 =?us-ascii?Q?ODsUMXm1aRGTJmjBYov/+9G2aW7yoqPYAtAMGuqYTTwePL9dBUi+9ZUYfz3k?=
 =?us-ascii?Q?PAlTYNSoZdoV9tpAkENObuj55EYyFvcpj9Azg3ll/NpTY4JsfDpGCuEuTAtH?=
 =?us-ascii?Q?kLw5nmE5sFZGolNZyg7ZsX8xOV0aJyt+Xhk+dSnyztkKNH+p87LO/pR5zoJW?=
 =?us-ascii?Q?d+ArOimLCk02Q65Gb9U7GvHiXSkDH9srQP/whO+o6pn0lJWQOpmpg3Mb9cTP?=
 =?us-ascii?Q?aJveNjE2TxRZIorKJX6WEwndLJ2whR4pVmPs6YgG7Y2aWUwzR2oleg/kmubN?=
 =?us-ascii?Q?7z3BlurgRPYBQL88OnTcdDlF7MiLlQXJUQTZnS5saskrwBeh3Yy1f7I7NXFX?=
 =?us-ascii?Q?1D5hQmsAme8C/t6Hl2SboWuG/UTKxwgweJzsRtuTa/djeklmXKWiAwux4z0g?=
 =?us-ascii?Q?Q1l0lHwm68A4djRBC78Aysp074Sbso0jaw3EKoogeeSv1PdDTfdewzb6IyG/?=
 =?us-ascii?Q?QzBtbmU+C8Z6ZXKkOtxPUo4QK02TI4DIXSOnUf1usSfzhgSvBEhToT85N7S8?=
 =?us-ascii?Q?vsyh29eJUJOcXx6uHfIWNsAwmTQNbG+KzRe33FUciqHYSOsskqkFwU8z9dyk?=
 =?us-ascii?Q?NQFtjtLWU0N+YGfkLKWqGGm0STv0xo0FN8yWI34xI1eR2hDh1slZESKJaqhu?=
 =?us-ascii?Q?F1bxq3nVSWNRbvu5Emp/OOptM/Eo3x1bO7/l4lFCeoDGWEboeuOZiX/RdTRk?=
 =?us-ascii?Q?GLTn1E1lxoVibwmbdmLARQ1++XqoDvJWOgG9hOLq+3u/11t9N/dwcsJNwhfR?=
 =?us-ascii?Q?IiZ73CljgH5ut9sipdZKCf/7Lh1sb8MQBjOYgO5jT1ydfcgdLTPlAIWIPWDk?=
 =?us-ascii?Q?VHiVBbiM0GgzWC31DlBrnwR6roFdXqeH2OGpY0E37ghl/Pq3e0K3qW+kJu/h?=
 =?us-ascii?Q?wg1u2qaXi0jgSDuXcYCFQH0dAHNUTMR/RHa9LYKc5gCsSXQA7ZeGhcVrZoGj?=
 =?us-ascii?Q?y0PB6W8yYteEiNaZxST/pV8y0EuD45N0kj4mpMvarHI6uJDR7ZPTcYj+fq8y?=
 =?us-ascii?Q?6HX/SMV8iem7MGX4DnJGD73XuGzXYcIt/QmMbYy5gkmh+iTLUJYwleAayQLX?=
 =?us-ascii?Q?ayr8GePjmO+YcfgNBivqRQ60rrdC3Kk+xT3thqTPQgQyAFnbfZROSLfM28pW?=
 =?us-ascii?Q?KNBfU9zwF7yy8El8U3nX+1W7h7/EgBOrbBHUwxC9IsLuzeFo60fAXvukRp6X?=
 =?us-ascii?Q?rxylNRoxmPb1Zwsoc6eA6xYRYvZUM/dGIc29lJtT2fcSs0Wk3vPLizGO9ISr?=
 =?us-ascii?Q?SYARhyOASUvjjdpu7Ay4DGRYxKV5FnMkG+8GZXHDzg3O6wBGKpQHMuKL3r2M?=
 =?us-ascii?Q?Kiv93Sbv1eyc+1qLip8gP4OrUx3cOZKrOzIeHbesWtjEW80Qeko+RZNNKKQz?=
 =?us-ascii?Q?xDTbHUYsFacvZv3gW97+1GAUGrm/iLTx5jUQd23+F6ujcIJE+a66UCOC0FgR?=
 =?us-ascii?Q?hy0yYJt0KLUolpNB+v9B3Podz1cZSmUBZ81GO7+NwcjlGnVt+2HwiLegr1iK?=
 =?us-ascii?Q?XdCPeowSv758nq7H0jhplniGNa7I9jKLl3HbE4E4yi84hFikyfa/8WAM3qNJ?=
 =?us-ascii?Q?fIbzxJbToHebS6nOMKELBENNfyxaixKa1OmJS+fuDm6UjPDH6ulEpG1WGrkT?=
 =?us-ascii?Q?VNqDl0RdEciv0WzaSE+s3D83frX6o9TS4/uxZkdo1wiwno+eWe3JoOGpE/MG?=
 =?us-ascii?Q?RV41Da/cy39Yt92Oq1OBOieszUjf4uF88/D2I8PaoBP3lEE/ENvz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d60acfa0-5c4d-4c9c-e203-08df193a13eb
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 06:15:34.6627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xjxXlD20dzN2b5kkHLBQRKnJHpP7LkOshSJuxbK/sXFoXP8BU71bjKDLTMS7easQ6o6Fi4Jal45lTPkBTh428g9rvboXj/LWAwJBq34DuHqO2nHnc+sEqd7myjFSxiS5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8339

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

