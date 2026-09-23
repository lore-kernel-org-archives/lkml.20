Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011006.outbound.protection.outlook.com [52.101.70.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBC343FD3B;
	Wed, 23 Sep 2026 06:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144126; cv=fail; b=g5UkRQy2crBx3AlWcaJKz6OfQOwpnwOFK9uZzAY8oWooLwa2/o0k8ypxYMa3D0EONy2nqRquVBVcLn9e2if/ID87+dyRYwoKxciIbyxMJcTNo18Y+IlinB4qUjJh4Ck/Br4c+opYCSOgKzGcMh6YON7VKNgrSCpLtAQvQhenrEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144126; c=relaxed/simple;
	bh=/acDThl5gAoup1rWkXiDFbHLlg5wiW4UdXtuAEkvqtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NH2oBgJdSJLiv3B8ijaHjVvwUm86Z3EkICBYYTLJ3cp4AkEvIlcSYs1+pot8ni35nPn6cePRpQZoal3jQJ5+6WMsyWVWJFZV5d7u5b5m3zGkguaOkytb4mVfnyMOjdl5Bc3KwBWHCIRgi2O7TbUkupX8UQQG+HbZfvwe2RjCoZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=itMCOrhh; arc=fail smtp.client-ip=52.101.70.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="itMCOrhh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NUsHUKIrnTmP++yZN//220V/cpWBSbR6Wqquf48ksZupmCHRlc07dPFYLMcdtMm+FGx/q/kf+sdTtQZbOAjbZu/Rj+pCNENuPNCu+IILXeZXLdadqJ3JFH38NJw9FdbMQPASlXs+K50BJn37632AJW2TU+0oD60NmYVkEncF7O9yo6nPSrGTVKlJGSt8k709B0NCrRc2RdWqXl/JwdL2n6F9b/XvKjM+uCsASiGbIojyuV8C70eBU9RhN/cR6MfK62eREhWlojQ0W/EEhpugnIrr2i0727eef10TUth/EMviKB3tdz5DWbOmu7fZBjNjGI/F8m9fRU1VpDo5xEjNTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VelTJgkHqeFFBwjK3peHcKzGJzlUV1XbpZpE0nwdgto=;
 b=DW6fJ3NK5tzLq19ezt+mWu0mp9Apx8v8nPn0dkXy80NynZYVb9uWau1TGcSdyFLK5z7uAn6KFSp/6LDjBiRDS2WgENeZ5G900O2/+fMCJztUjhTv0gzrnclErIkpToqUPnZx3DyX6ptoCVxsGjc+Pc4CM+ilDaigxPLxY/7E6CU94Fkb44Ez1cOWuhq5BwWbGnbY1q3t89/XelCqW08vS5WAiLlGTikCD4hFup+RrkdVrzyCykF64m2QwYlMS9yWYH/79mFl7Kb2KxQf6xjGr40ol9jqKGFyKKuNpejqp0ZRYKzeXpR9rc0U7APPFvJZF8LMvNUH8kF3rSlZzMmViw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VelTJgkHqeFFBwjK3peHcKzGJzlUV1XbpZpE0nwdgto=;
 b=itMCOrhhPd93S8QECvmdeLgv5yF6fBgB3FQMqV42WMSw82EmikkjWACX+SZhnulyhWcPnd7K8gXB7mbMnY/MOEwLB6V2qwhNN7EiG8ltB0JRDUBPvmTqIL7sl1LUeRgw74OU3KChWd+6lsohgsBhdQ2lri/cMYlU6n6c2EWvd80RlH7nDY2CBo9CjyRHpPais7m0SXyXRWBhQ0ul1PdOdzW/RsgkVFhqLT42HTXX/bCrLvCLQzczuVFxj9z6TS2tKYPl7M+7hR6YRjtLC+hl2W2hXaRxkW+XnWKEIANufpccFNPLt8QjrzoY+EjozfXs/73XGVTVmcDbyPtgKyokLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM9PR04MB8339.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 06:15:13 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 06:15:13 +0000
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
Subject: [PATCH v2 16/21] ASoC: codecs: wm8955: Move regulator acquisition to the i2c probe
Date: Wed, 23 Sep 2026 15:13:00 +0900
Message-ID: <20260923061305.4041197-17-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
References: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0035.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b5::10) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM9PR04MB8339:EE_
X-MS-Office365-Filtering-Correlation-Id: de46c924-b900-450a-5a07-08df193a0771
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|19092799006|7416014|376014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	WMStsdb1wO5cPYbP3J0LbSXmMEXgJPyUQXLC1dLpxExl2TfzO4cMAKDWGFmrVjKr2JEs8fDLXYO9hWtLLLLzZyPTAvBD7uR/7SoIyrJJz0QKYn9ImZPSfrJ+Yb53qihCoutHHVFfmUrmh/F94M1qBmUbXgqe2ukR7SEV6DvqbNh4Zj43uYAriMJeQW/dQPbL1OAwE/YOIdq2Aq4+QxVTqZhK+7dO/157ZxV7n0gX/A6Zo9OW1qNAyQAP24J7PNXWlREnz8W2514kEh32sO9rh9i+iXrfsUrvM6UpPFjJeJXvtJdKpfSy/9w3WC9qCyX5h6eposuC3zbJTc8ruHZ7r/ZYi9YjHdAvWZaCop/l3YDv6v8N1ZHMSJIyTOFewiusisebFp/DAwb2yQ93Ot6u5nGig0br3/MTWrs+NJusl72y7lrasWphhOKK1pixjWq8Cwmuvs092ab8VUYxjoHPGGpTyJTXSBM3n6NwufD7WHg4M1OnRKt40psLDbTlIqjbQq0NhPIaA8Jv3+6PubjZaD3Y0nZWkl01pICwHyn1dkwxq/Jq37FTb80tFIdPPb2IkPAYdXMvk2IMO3khtZlhRLlminCHGb4mbl5FZu+6tIOL2Zyy7pdZLpKYEA49bltAf7rKnS4nhrRqbapCjtR9IQ6el1AlRb2WsZRpvf7hH9o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(19092799006)(7416014)(376014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SlebPJ9QCJkwl8ryVZ9qVOhuRhyeZDDB8sNNrUevOXski/HTNg/1BQjkTUgm?=
 =?us-ascii?Q?RppWgjhvkLIzQw7xF6ZpE2Wj9Ik8AWB+tkfwXI21SDdIAbq5egkGRmIuRMag?=
 =?us-ascii?Q?80fKkYzAWmthn8tZWSYUYyiHpnA1ASEn/1aUByo+tQSH3zyS4teCj3YuVD9N?=
 =?us-ascii?Q?Dnr+bNb4D+FqNEvR3qpUoAAKvjMRmROUlKgphFnJq8GTnbk5yzrNdzI9MTrq?=
 =?us-ascii?Q?mE5FTJ0bPAeJvFa892B7s1yDtUBiLpIa1hM09cnNP3gcFFfg2wRslAgS7HhC?=
 =?us-ascii?Q?d2IQvy6daGrVywmLvgRfhjk1n7XH6a8FC4KBAR4PFyvHlotYDFSA1IUJc0De?=
 =?us-ascii?Q?ZuKgK+1o64IKCFDcBiKZAOhPTsJQWhP6T5Gt4rM9pNNzcmP2IWcwyBadob98?=
 =?us-ascii?Q?LrtURtmhzyZmv9jr453iwq+5nE6wQEH1SrTRdf2gZoAYAo1aihd091vh81qW?=
 =?us-ascii?Q?bWxXHP0c4c0JugQbdEqCV7aW2sVcIx8CUBSwJcUMDwVcd0wo3iwq2r43bsTh?=
 =?us-ascii?Q?9qWQIdYfCoYqDajdymnkev9rcy2u9xkw2PcKp+0unEQc3FPxfwTgp/3ky06o?=
 =?us-ascii?Q?9K6RRLwgxaTJY+pUCkJsE3egN3ZWnYvH1jfby5tT4+HnfpGs01hDpe4l9Aey?=
 =?us-ascii?Q?1aeQ1tpGKkWVt/cIvTjXHrLC+8n+b+10uCZyyU+bzFKYCoAvFLJwPuc+Pacu?=
 =?us-ascii?Q?r+v7ufZX5iD31DD6jxT+8spMiF/mb7BFFz4WCVPENbqkozYRmcK/+vXcTEHH?=
 =?us-ascii?Q?LoLhxO9esESoOP6Tc1OsCpflS1Xop+ok4htW6/z9SYlsobMnRxL0zqAj6q2V?=
 =?us-ascii?Q?Uo8bI1hIymQjh7/UwHI5ytsuGu8MigajgtTO80xPkoO0mC8z1Jt0ZMJbGLTn?=
 =?us-ascii?Q?FW2AdbNp/0pMYF8KU8+IZG39qAYvYhu/g/0mDRdnczMTLBWKtU/wM1OtsnmD?=
 =?us-ascii?Q?7u9yIspC1iIMcQ8M43eoIuH/zBdqXkN82aMSn6rnlpEAbT82rqVp24tAZ8Y5?=
 =?us-ascii?Q?KmO7Hhi4oMn0Sos0VDZd8huhNf2N3h1V748BNgXM8Eui8Qm55b8qhUeYTvFg?=
 =?us-ascii?Q?TwzuZ/q5R/bdrdyrxrj4o+2NTsMKExKwWk/ppuKeZglETLSAA/dT93LgA2ki?=
 =?us-ascii?Q?h8LKZQy9raXRI28lybStlD6Ic7xi30YP/6GM90Xe1Z6yzrLZR346NKoylbyb?=
 =?us-ascii?Q?pI1DpPs0B0X7tSA2ZQmgKORDJ0kYF1Yme9JWOSboKlZ/XxcpPFYDo+r/0EKG?=
 =?us-ascii?Q?I1E3lnuqYdOLqZC5wLw4EZOqx59p33aY7fgm3ov8N7DRtExT63oVMRyyBh1G?=
 =?us-ascii?Q?alSjN6+eeiV5WhvMa9yDD4CqUj/6GSN1Pcqeit8ckU4xGUjtfjEc8eMsGRbR?=
 =?us-ascii?Q?sHLp/L1AqdqzgR0vZ6ZtAFJflbs1gfWqb6wePKMdz9xbppPBXH9clj7AEJdd?=
 =?us-ascii?Q?DbkZZgbXDaI343Zfq4KEKmk3XBFYM8ooAU9qP5Op2wlRB9nrl219oc5f+huJ?=
 =?us-ascii?Q?caiESTTu2DOeO4AkwPxVQhlWo/cudA0oTik1r3Ym/c72LB/KNiwpJmdUHB0J?=
 =?us-ascii?Q?acagWX8rbLTR9h/Ezn+X8vIP7lI3pWDq4o4WLht2dJLDQ9+ZVVfkoCOWN+hO?=
 =?us-ascii?Q?paYjIlHhSBTN2i6AVQbNEX4+w4lhq4x3c8mTOhivEGmhndOfYbYMNT5ZgDCV?=
 =?us-ascii?Q?nc7lYO3Q/ubP+QCMvh9s94in0Usm+Zvlq+oWa6FNE87qo0fvluN9lKmMdwrN?=
 =?us-ascii?Q?1vozdq6Ub1/YyZCQUZCrju+qm+lIFvgxa+CuOtgcb3p9mrrLnFmG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de46c924-b900-450a-5a07-08df193a0771
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 06:15:13.4931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sVuKdskmxTme2mnPYC6PYDMzNuYfC0+f3oWxUBXi1lt01aHt9pfAXJnjH6uD3fgPwnhv0bQRYcLWC/6UwmrEpt+PBCcoklmVgBPH6jvlz02mjS+0nVuXoYcvPPv9LUVF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8339

From: Chancel Liu <chancel.liu@nxp.com>

component->dev is the underlying i2c device whose devres is only
released on physical device removal, not on ASoC card unbind.  Getting
the regulator supplies with devm_regulator_bulk_get(component->dev, ...)
in the component probe therefore leaks the regulator references on every
card bind/unbind cycle.

Move the devm_regulator_bulk_get() to the i2c probe so the supplies are
tied to the physical device lifetime.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/wm8955.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/wm8955.c b/sound/soc/codecs/wm8955.c
index 1d367a957f3e..017ec2e37d1e 100644
--- a/sound/soc/codecs/wm8955.c
+++ b/sound/soc/codecs/wm8955.c
@@ -888,17 +888,7 @@ static int wm8955_probe(struct snd_soc_component *component)
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct wm8955_priv *wm8955 = snd_soc_component_get_drvdata(component);
 	struct wm8955_pdata *pdata = dev_get_platdata(component->dev);
-	int ret, i;
-
-	for (i = 0; i < ARRAY_SIZE(wm8955->supplies); i++)
-		wm8955->supplies[i].supply = wm8955_supply_names[i];
-
-	ret = devm_regulator_bulk_get(component->dev, ARRAY_SIZE(wm8955->supplies),
-				 wm8955->supplies);
-	if (ret != 0) {
-		dev_err(component->dev, "Failed to request supplies: %d\n", ret);
-		return ret;
-	}
+	int ret;
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(wm8955->supplies),
 				    wm8955->supplies);
@@ -990,7 +980,7 @@ static const struct regmap_config wm8955_regmap = {
 static int wm8955_i2c_probe(struct i2c_client *i2c)
 {
 	struct wm8955_priv *wm8955;
-	int ret;
+	int i, ret;
 
 	wm8955 = devm_kzalloc(&i2c->dev, sizeof(struct wm8955_priv),
 			      GFP_KERNEL);
@@ -1007,6 +997,16 @@ static int wm8955_i2c_probe(struct i2c_client *i2c)
 
 	i2c_set_clientdata(i2c, wm8955);
 
+	for (i = 0; i < ARRAY_SIZE(wm8955->supplies); i++)
+		wm8955->supplies[i].supply = wm8955_supply_names[i];
+
+	ret = devm_regulator_bulk_get(&i2c->dev, ARRAY_SIZE(wm8955->supplies),
+				      wm8955->supplies);
+	if (ret != 0) {
+		dev_err(&i2c->dev, "Failed to request supplies: %d\n", ret);
+		return ret;
+	}
+
 	ret = devm_snd_soc_register_component(&i2c->dev,
 			&soc_component_dev_wm8955, &wm8955_dai, 1);
 
-- 
2.50.1

