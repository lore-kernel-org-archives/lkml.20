Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011002.outbound.protection.outlook.com [52.101.65.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0993248167A;
	Mon, 21 Sep 2026 10:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987735; cv=fail; b=nIIL0AgUdt6cxgpPzU1VLSeaulKmU5SZKhRVf5AMf1QQeoulWgIUIqIm1lV/Kx5UvbWBU6ncvPuqQD1DQ6VrGSPJ2ebMJW4h547WFvdnxBYTDorhmJGC0jgbEftzVmnMjkcEacbm4uDgEfrGjGkTICVV0Xvsz6yT/aGr8gzmNiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987735; c=relaxed/simple;
	bh=2dGct7pOPoGeoZwRwlhBZ9zVmMRdsa9mHkQBqnLdYgY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mx1aLQv8GNhMJd8QNr6EKbrrKV42Tjjh5kEcl1eHPQetN73OAv2wJpdapbvobCde9AE88bPqutfsWFT0cXZmpVdmrI5Odw7uEZNmcSz3i/KIwdyUluJMNpeD0lUrXAy83jpd4ON41AwLC3G69Al7cKMbPEfba/1ZNfPwufjc3gM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=eHJ0gKrY; arc=fail smtp.client-ip=52.101.65.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="eHJ0gKrY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+gtJxS1g/BJAkKJ3KCkQjXO91aJeFnkdnqzp9v10utzpcwD6/8MjTwnInpOaJPyNmDb/RQwjn7JbttdmONA1frOkbD16csQ+Wd0M1bDQD0N9cI7oGBCIVNKOCkoqLLgDH6La7G237ksv8rBMzVzhI9lWofM/2wl8N9omKXFeE21xPjRXwcv7SQF5T8ydADSe9VTPHjlXJls34zPwwaUGRwm2d7SErio1cviiFXrPnpMvS+Wiu8+1uLZ/a7aHtJBj/7QPbZII/yRRT1t6nf/OXC/AV11ythAkjnF/e7sPzavV4kp5HF2ILMa+4akzOfPGkhhYNz211t5h1N9vQ5XtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YS8TVnn968W53jbx6UjxUYC3bdbhAgN4q7p6A440Zrk=;
 b=dWtKz+vmYS9BVwvJp2zarlkFnL7PI/XHT6hI/600dyrlQQxfmw92EGhpnsIgwx5mq9g0Lc1QkUih6S8QSozQJYQyn/o6kU7oNCxz/YJGdA+OGM1/dcmT0hfGYBzdp74d5jKoaa2rluOiibT3wvlJs35VkMaH0gdS0akhmZeH5lEccuKasPGuJJx4z7SU1u4Aqo3K7Cwh6dnXgwHL72sVEx5VtdlAf6lJsMElJNZXl/LmLsbUDlYsxwQFv3SikEtr7Znxa6SXGVi6vSqS44wcsPRvDYfSai4TC41oTvcDrs78EVbsmrbgorHnC/dXtMWtkMN84H/Yzw5Doa+J3MF/4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YS8TVnn968W53jbx6UjxUYC3bdbhAgN4q7p6A440Zrk=;
 b=eHJ0gKrYaJElBVFmE7ywVUMCzQX5nUmDmC8hUdyCdyDuGkgQXJWcOCldLkMQmafI1hVWPWbim/EiNgjQcbqFHAAd8jU/rajpM/QrOPPjvm7bDcZw54vMq1QICWhj8zk8E4FRYopCJd957u8iRS9+87bqgVUBlUHMVOeGCLoB2og6yuqtx3EzvqoRKnxK6bgcSSxQdnaF1yNfJKiZQEKV2tK6C41d/6UVsDDGirgKPJaxQ0/INLgyhvQKhr1mreUUiPn9AhTCpMJ1OhkT5fWDOUvAubLYAEBiREpHWaWymUe48yW7YiH3yAeaCW8d2pJGCN3NrphtBWh0BLIdeOCnuw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VI0PR04MB554873.eurprd04.prod.outlook.com
 (2603:10a6:800:361::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 10:48:51 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 10:48:51 +0000
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
Subject: [PATCH 17/21] ASoC: es8389: Move regulator and mclk acquisition to the i2c probe
Date: Mon, 21 Sep 2026 19:46:36 +0900
Message-ID: <20260921104640.1941554-18-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
References: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0148.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c1::14) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VI0PR04MB554873:EE_
X-MS-Office365-Filtering-Correlation-Id: 8df89988-d549-459a-272e-08df17cdec6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|23010399003|366016|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	x71ZbUz+jpo1fPXUSRFUy1ha4Ddrj19vHU/vVVsCCfC84mqW3I6kxzOM+P93qf7fl+BBXjYdldcqZRZyyaYUVLbsBrxEkR3WZk02KOv5g21JV69CAj9vBBAy2wM7Qzjo/bGWLTdVy4LvNFpYYr6ZSP3JGPqNyG7a11AqCVIPDtcHPUQBRdVS2Kay3wERxQxgPNfZvUPRlqtWMPWv//aNGh7nUltFwvt+6ioA3ar28WaPSPeSsdcVuZRxi9URdiQe6cNs2p0fEFTYnv3hbNwML93oxi5ziahxK/ZDrq5t/S3icsXP5I+VFhowjvIZKj79arqx5qHzSgM8irOTTaYYzstkcxV0KthIbZLrhqov0lIaVC1wHmJS9af037nQ+Giiwzd2LFYoJxZzigEInQc5lXYEkXOTToQG7gTRFC5Lld7VJ27TwtEhZwzoSLE0eJ4RKSyOBoLsESQm+dkw2IKKTT9z6QNqMBu0mWkBtPF2BMYh/Ty9reR+4b034iEiRrPMa9sam4cB6QhvCA9eQ+dgOkWlsJcegGSf6qCb8w2ZR7hQ48khDNlCG06BpNRWkvDvwhFSXi0hFXeqVru7iKyRwqtGr2QnOa6+/Dg+DjmZf4Uf/1gaDPJ48v4SPQt2et4+BPTN14EDnZgA/D7dUPnMDMQ5fLMCNIhMMLyllDX328k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(23010399003)(366016)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7HCyqchZKeO3B3c/fy0cxZ13pJw2vnKdboUSujOe/qJwcbjEJh2EYKCPl3rN?=
 =?us-ascii?Q?1ALWOzMncsiIyf5bYl98m5rK1ZoIKv7++0iDsiBFtTzXihV06MOhQepyBz2k?=
 =?us-ascii?Q?PdVqD9F/bq/PQNNxWNQqKA8WcYXTbjhVrm7CXilNOczHKcm7FnzMNqdMJttT?=
 =?us-ascii?Q?OkJpkumtobB7z7FIZ84JL4S/c/hq27ZpajLtLa+wo51UAsyu5fqMhrnMtneh?=
 =?us-ascii?Q?mQ8t+oPrOduUQDp86AtBmVuxPKW5kekguTBYF8aTSgNM/9OFBT5/tFbkMqQl?=
 =?us-ascii?Q?d2TtlqL7hg2THRrBZXxSqKmLn1nlPOLQkb4GU3D46koCWLBdaO6Th8GdIcoq?=
 =?us-ascii?Q?4CgY7D+b0X4jnHnjMsx/d/gBozIWdYN4L8UodWGMWX6YkpoGj3LGJsWI1OMS?=
 =?us-ascii?Q?tk+Vo+vK2eb/uG9jjczE4p6PvxGRktFrX+47xJSkDg7h1h1z0Cn22nIlSNNL?=
 =?us-ascii?Q?/mb0uelNXNvZonlrLBAb+fTieXE/GuTjuGW3+5vixyNv9+0VfCtKKs/7rGnt?=
 =?us-ascii?Q?fYvya3WY7AxNxxl9a3unXXATRxZaYow5e245UFrBtw3HKcPYDtw0c1nPoDwB?=
 =?us-ascii?Q?1HNkqJXmeDD0rTO5U4IC2oA8Si48Jz3FD7DPUQhInfZuBnxftNDERNzb3TvA?=
 =?us-ascii?Q?9tV9m2DG7IwdX+pSpx+9z8fjttTLw3oMNHzH+6MOSsxX8AblJDKVKD88LVUX?=
 =?us-ascii?Q?lkyUm6D7MAE0u4xMIP+Bb1VawOXNAz63pIDfnQtSPm3Bz/iWBMGHh+2P1K8J?=
 =?us-ascii?Q?3NlC2ADAzZyIe4VWeIP/fFbM+4IIrtbgSzlgBilKTn81ijUltCHk3x1Mtmtk?=
 =?us-ascii?Q?Gy9mqvVmkuxVwAzXRPnL3KFMg9ZV79ApirbtFHUJbOKpgDfZcfXumrkB4+sR?=
 =?us-ascii?Q?5rlG72Lm6SFoX/bVj0RPLgODWfZQBWdZ9x7CBTWHyN+pI+tGYqdxvz2r3Yxf?=
 =?us-ascii?Q?QyvlSCQwjffAh5FWnLay8n3+gxEU6JDt6/6wn5emXLkgXhDzdKmZsI4KzlNd?=
 =?us-ascii?Q?LksITG6Z47VIpXnnS7cbvEMPtTpJYtEP2JLhIDBP9aUwL6lQuUHGuh36gkjZ?=
 =?us-ascii?Q?r9EIw4+cWSnGiHBqOYIvoH5TabpvlyI+e7sKFvLYnVqxouwECoLQ1FM53isT?=
 =?us-ascii?Q?XrGr+zQvZx0+ZH8U4W39djz6x5kDq4lZO7zcwPp9nESqe1SWY0p71HP6EhJN?=
 =?us-ascii?Q?lIDALA9y8/sHX3rgUEWSmZXLck8aUSyXvapO1PoKuVkvRcP70DaDMLLmEPgW?=
 =?us-ascii?Q?CUUob5nWwwVa/OHMuFaSDuWYLpn+nY3P26GTxNbNtdblDm3Ru8LIUp4waEmq?=
 =?us-ascii?Q?UpgK93Mmh1HEEeV2G5cwWrCZVInsqWGQ3ssEC9BKYYTwpWpscYkm2Wmkwzg3?=
 =?us-ascii?Q?HBEbfBnhWcoTW69xV1DG1JjyiW3R3vYc6PhHrSS6WTYtNm7IQsS/SxNixyXU?=
 =?us-ascii?Q?4td2ZqYdBEHoG9I+9iocg4nAcVlZRiB4QY97WHjgKxH1TLWQt1kI6DPTy9IL?=
 =?us-ascii?Q?PqZBr1eArKebFtHdcNo3XHi5FBSklqVfqf5amd946Qa+FxzacUTCt81fG0/u?=
 =?us-ascii?Q?bVELV7M+DGnH8Sssr/NTM8/s2seOBf4qoCZZfqpCbrMjFXB22HuDbSMQoGSY?=
 =?us-ascii?Q?ALFU5S67Wl9soH9jT9lM81rlFqFqy1LV84eLGDDokFjN+74ceyt04HJP21Me?=
 =?us-ascii?Q?1KaZkvRMqNe/vhSwLAqG2bAc7MkKMov4b2AFAPiKw82EMJcPwWdKXFV9VXD6?=
 =?us-ascii?Q?7vukVLnSYaSB0OQMEYxmsh7jCTG3rqdhUMwh5KCdEKarIjHb/fNz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8df89988-d549-459a-272e-08df17cdec6d
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 10:48:51.3776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fHTrxJ731UdfETHEB3VWfwv00A+PxTMcyPbiyHAmzclI0NSDZknIRnXiFGqMaZhmvMFa2eSvIGwvqP2dnEZOCp2sgHic5XEUThphlMnoNFr4bgc4lxu9WWpxZhX/FTxF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB554873

From: Chancel Liu <chancel.liu@nxp.com>

component->dev is the underlying i2c device whose devres is only
released on physical device removal, not on ASoC card unbind. Getting
the core regulator supplies and the mclk with devm_*(component->dev, ...)
in the component probe therefore leaks those references on every card
bind/unbind cycle.

Move the devm_regulator_bulk_get() and devm_clk_get_optional() into the
i2c probe so the resources are tied to the physical device lifetime.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/es8389.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
index fe341fe56760..931577e5e29f 100644
--- a/sound/soc/codecs/es8389.c
+++ b/sound/soc/codecs/es8389.c
@@ -1076,22 +1076,6 @@ static int es8389_probe(struct snd_soc_component *component)
 		es8389->mclk_src = ES8389_MCLK_SOURCE;
 	}
 
-	for (i = 0; i < ARRAY_SIZE(es8389_core_supplies); i++)
-		es8389->core_supply[i].supply = es8389_core_supplies[i];
-	ret = devm_regulator_bulk_get(component->dev, ARRAY_SIZE(es8389_core_supplies), es8389->core_supply);
-	if (ret) {
-		dev_err(component->dev, "Failed to request core supplies %d\n", ret);
-		return ret;
-	}
-
-	es8389->mclk = devm_clk_get_optional(component->dev, "mclk");
-	if (IS_ERR(es8389->mclk))
-		return dev_err_probe(component->dev, PTR_ERR(es8389->mclk),
-			"ES8389 is unable to get mclk\n");
-
-	if (!es8389->mclk)
-		dev_err(component->dev, "%s, assuming static mclk\n", __func__);
-
 	ret = clk_prepare_enable(es8389->mclk);
 	if (ret) {
 		dev_err(component->dev, "%s, unable to enable mclk\n", __func__);
@@ -1179,7 +1163,7 @@ static void es8389_i2c_shutdown(struct i2c_client *i2c)
 static int es8389_i2c_probe(struct i2c_client *i2c_client)
 {
 	struct es8389_private *es8389;
-	int ret;
+	int ret, i;
 
 	es8389 = devm_kzalloc(&i2c_client->dev, sizeof(*es8389), GFP_KERNEL);
 	if (es8389 == NULL)
@@ -1191,6 +1175,22 @@ static int es8389_i2c_probe(struct i2c_client *i2c_client)
 		return dev_err_probe(&i2c_client->dev, PTR_ERR(es8389->regmap),
 			"regmap_init() failed\n");
 
+	for (i = 0; i < ARRAY_SIZE(es8389_core_supplies); i++)
+		es8389->core_supply[i].supply = es8389_core_supplies[i];
+	ret = devm_regulator_bulk_get(&i2c_client->dev, ARRAY_SIZE(es8389_core_supplies),
+				      es8389->core_supply);
+	if (ret)
+		return dev_err_probe(&i2c_client->dev, ret,
+				     "Failed to request core supplies\n");
+
+	es8389->mclk = devm_clk_get_optional(&i2c_client->dev, "mclk");
+	if (IS_ERR(es8389->mclk))
+		return dev_err_probe(&i2c_client->dev, PTR_ERR(es8389->mclk),
+				     "ES8389 is unable to get mclk\n");
+
+	if (!es8389->mclk)
+		dev_err(&i2c_client->dev, "%s, assuming static mclk\n", __func__);
+
 	ret =  devm_snd_soc_register_component(&i2c_client->dev,
 			&soc_codec_dev_es8389,
 			&es8389_dai,
-- 
2.50.1

