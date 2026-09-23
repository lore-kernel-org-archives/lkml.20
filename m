Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011006.outbound.protection.outlook.com [52.101.70.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40AF4477E3;
	Wed, 23 Sep 2026 06:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144114; cv=fail; b=Ufe7DMiu2QPnzGa0xkOdQtZ7rVrX2r/UOBRTBS95FtdbIXQePfbgxXRz2X6GOIvqQPZ6s+tLnIgT2g8GrFVx4rFVxyeTNJValahhBWLvxbHHeNtS8uQsskp49nvWY4AqVaV8LUL62KO0Gc8kUS09qTTiYMMeKZ5Z026Ykd1dh8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144114; c=relaxed/simple;
	bh=ACLIwfI6+MP/LziWe8+WT0hfuSfpBA+02D0LnAe94Jo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cO5Amu8gRwazJd+P3XGRHiczRzgPhWnxOyT4UFx4MxSf9Sez/sVPqG2LzXUend/ctzKTubzt1eIz2XrR2UUrzl+sEFNbJEVz5+eIRlFq2RkshxUSzvjVl5W4rm2RpUR6y5cY96M6ynqSQP8o1h8m1mIpsbTf6vvxbDIs27Ns++Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EyAke+LO; arc=fail smtp.client-ip=52.101.70.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EyAke+LO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AsMz2Fvmv4x0aoKhhO0wqUJlGOZlOXdhvAkkYo9fjzTbv1A+w1JUfPjwC7M+aTArj1IviKFwk2IKQmTkwH1b9CIcFJ4mXHM/gDHx3a0LVF1IVzgRzTEfdAc+q9WFB/oSNz3nrNLSNj706M4KVzSr3pkx09H0egGlcBFIO9AZcgfO10eupJGVT2pb1XDympTc9yYQlhIjF49aogb4RoKGndRd+JL76vV3jUYPKTOQqOKZOqtBDY7czjR+Goy39H5FU+p0jLqtr74vAPHHqk7VHBo5cqGmkF7fpNL+LSztIx/q4nLemp1S4nxvADl4WeGCzuuZQDjODBHFRf4e6LMfvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YqlcUEgwgpt1Z2duAXgZuNaoc3t0vkQSgRKbhRZdnwA=;
 b=ADQAYpys1cLVUeXRxd3Ja6l1DvEWYm+fZQwl2uYx7NbHyi6e4SIF3O5teaMzeV9fjsU3b2VdJxtt9XT7+CJAzal4VCzSPf/neGG3yc4UV8dkOweP3vOUBRwyjcTCpGvia01nMU1qYVlv8vKgqQPqjjjwr65WevYiSapS0dGeapw1zEe6yhkcRpTwKhrjW2fwNGP+dvVkyVKFIru82pMOaTCC7vmRUpS/Qz76q9H+lMslaFafpl3fNReM0J7jY/hQs2Kzz5CGcR4RUHbnlDP2HFj/rQbcUqcDeS0Q3zNjknwLip/xYzWJa1sNQFS5c/M1naB44HOmsvjvc2Dxdwn/TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqlcUEgwgpt1Z2duAXgZuNaoc3t0vkQSgRKbhRZdnwA=;
 b=EyAke+LOVVnJg0/S8ZZwzAT9avPgiZzveFiC3L5q6jbLdSqDvKJ2bYXm2Qgttlr4hSAkv9auvyRwxeupJNOLa2NtqBaPAnBD0eAFOlWUZ1xN9+pKf2bChT6YOuJ/dbT5wTFHKp6M0tlGWxd8QAi9C5T1z9fRRo2+vAUKHnTyiSKMPcQQwoWqe/IQj/1bkf16MhKyzUO31IFl8/CX9Gg5EeJsYNGXZm3p6HuhGMv4L+2bjVPJ96z0+LbBniFjM7g8PhGSR/C53H5KPC3Hz44p2XRhrIgtsSK8bkrZkjLL6REzxH7wMEncsxDDkfxsPfIu1GpqnshriCBZ7jxBN+L4BA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM9PR04MB8339.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 06:14:58 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 06:14:58 +0000
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
Subject: [PATCH v2 14/21] ASoC: codecs: max98095: Move mclk acquisition to the i2c probe
Date: Wed, 23 Sep 2026 15:12:58 +0900
Message-ID: <20260923061305.4041197-15-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
References: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0110.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bb::7) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM9PR04MB8339:EE_
X-MS-Office365-Filtering-Correlation-Id: c71cf05e-3246-4634-63a0-08df1939fe85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|19092799006|7416014|376014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BIy1BTT9188EqQS7oQ/URCbcQPoGy8pxKqT4bcJvJtT8Vbi7mEbsdlgbZBEEZd+rHwS70MY9/MeoAwkLYVVBml9tZEiACSO4pmy9xHIMHOoxKUvn4J6Iqs9ADDLXoBFf9B4wmduMqsyspVhLOvdtQezU9jTtYXnt8fnezcoEp6sniN5c0n3wzlRl3Olgq424lpu7DMJ+1dv+PDm9zUro2/XxsktIu4P6g5ovXub6sC6m5AbE1MyEmAA+ePpK8gwrxsijIHZ3Sm2/7pAH10GJUkjAygXjcHJtEBVk7QT502hEVeI+z3tu83qc+284HEHWn5AqRfGaOBSPfzK84vB+zOy1RoILHWMBR8aDi71z2033i2eX+6Me7r5W4UF9bl9MUncYJuADkbMFtSY4hjUADFSaKWvhdwl76Er3CgldCIrUEC8WHRt5FyM4TU/QYUkA+XCczOuCjgJ/ww0qyKBm19tqstiTDZwPmVmGEhqv0qdQaZ/WXn7p3t26SakNMQcvf17RvFFz9Mg7x1agwS38727IOgbOdHqz9N09ZHgvd3cgo0ytO/qdz0GsFVMO5YGDrdgPurg9ffEeLBBh1o2+CEo4f2BsSUJQREKz/sbTOogjCeaIwTXTmnqqDJIA4HARSKlPQNWH19zlMAlu4ox0ngPDi7i9LOpvosTEIhL/FoE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(19092799006)(7416014)(376014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VzDaj1gXep4l7cC+3Y/0ZQtYh4qfaNhDUwlCM2Wl13TZ81I0EYaHPLg+lDbx?=
 =?us-ascii?Q?YArqYu+taMFrNNqx115FvkkO3fSWT7C4W2CUDg7Nf+OlzW+KYj/meBBIjCZb?=
 =?us-ascii?Q?XL/8425rd2Tmq6WCDjOleCtgjmFM7prXZFHXQ8ESIpnwZYAtDRi6CDzMdPSx?=
 =?us-ascii?Q?8cIKSRhDP+ZcHcwDMj4fzpUQXQW/WjagCLIyMvbEicjes2m6+E9jSVQzJDUG?=
 =?us-ascii?Q?0W48VkT8QGQ5jjZFFBlXBqfTFMnva1FsGljIKohl/SynyxMNBz5NKrS5yd3E?=
 =?us-ascii?Q?VveE2DtU/CxP68CmyRFwshtFl9n2pR0F9iLLUxF4wW0v1vGuV5kEjM00a5un?=
 =?us-ascii?Q?IZV1G+I2x/qHjQ2SJKZPW84TVyZY6ytSa/+cn+UFJChzsJoIyLKROAbSVz9f?=
 =?us-ascii?Q?m5V1D/oXOeyQvDeARmEhws93cZLc93UYrWZ7dw+pnAERQoW1A1UPbJo0OG2j?=
 =?us-ascii?Q?tfTH70jCBhhz+iK85QWuBPVMrdl7hJPn3oxMWrJRUlD9oI+R8l7hpFKMmFbq?=
 =?us-ascii?Q?5bVb2jitMuNZLDTGU1TNfrcGUHHQE9bHA0nUZTH73FGJ7VBKSKJBapOOem8N?=
 =?us-ascii?Q?HrId75HLyrrtJMvB+nux9J3OOjXtA+M7PnvNZzQ4Q6Grg9dAX6wx7mabntSb?=
 =?us-ascii?Q?TT/1LNRC6eOhJ1i85687+Q1nF83gatmE+gsaLaARR9AfQpLyDTw49GR7W2rP?=
 =?us-ascii?Q?qdSTv8TOtgWQp5nnzJEEpCd39GnjH3CfezFXhYt6ziqq0ASo4ZYOB+b/x9nv?=
 =?us-ascii?Q?lTod0MMtHlb8UiALzRvgDW2txY3nXSGE4Jddp5kJlEjKlVwW4ZF4pDYTt/3L?=
 =?us-ascii?Q?BbmNnwWZpm2I1LG959YjhXDt68akyE71utkgIpPHvzyrDouCGd27VIIP+Yot?=
 =?us-ascii?Q?AJp48tzcsKKLAUaBygzOpXSoMAxT2IR3NdVzs6WdwqS/+IaGybWxkQn3T64E?=
 =?us-ascii?Q?td1o06KlBijm2og7xA+Poan8Mulc8H0s2ktzceCBxpa99mAS7o0ywsOT9h7y?=
 =?us-ascii?Q?Ex3/1AAAOb+jXBIXQugBM8kR/n2xA9xE3bxlDQmVzL/M06XneISMnLhuYoBY?=
 =?us-ascii?Q?juMvG709V8ufqrNra9HAH8nED4mwFbFjgmHp0AvkOiGlZ1qvchFmFdOfBgKm?=
 =?us-ascii?Q?beZiBx/iTfuz3JxzbCAhT91jyh6gVqkhry53pSJFdDw+CAAGYMeGmCLPaMM/?=
 =?us-ascii?Q?MWJBxazqLuWwLKtc7k/nZSpAVxqSK/pj7x9LponMgC4ZCE7CXg6ENdp58LzK?=
 =?us-ascii?Q?QAACjEY8WWed9RbMhtOLVbbYFLU3imrqxgeJ6Xcg7kGn1ouUMXwSflalonOW?=
 =?us-ascii?Q?PCAwAC56bazHeea6R6P6dX9wmWoPeTPwgG0pxaf7O+lpqAoEUaxr47dPZoDM?=
 =?us-ascii?Q?U99Rx+J853yPmQdG88fDakEpLImQQdLQ/Gwkt3sZobtLX6nPNwmBTVRtx+aB?=
 =?us-ascii?Q?l+rVE2sbmz955ZHB/GrU6j8ecRZWyqms/x0gUih8s4Ne5eDpiL3Y1JhvaJzS?=
 =?us-ascii?Q?tn/nhAWSGgRuOQUiH+krvJryrzLbkmkrG47BGnD9CCqdgVVaIQC2Wm1tpuaj?=
 =?us-ascii?Q?Ld9NwKVAhA5ImHl8fvfpqdn2dmX/4dOpxwT/6hXLLYUwGghbXtQWYaIXvca9?=
 =?us-ascii?Q?MGhAg+EdjJZfcEu4QYQSXhQYR38KA1uDAUdo1t0YviGN2rau6tsA1jYB/X1x?=
 =?us-ascii?Q?J9Z/FbYrgxYiRlhXToDvy83i16QRwJ9xYeU1jJBUpJnN9HvdYCcF5e7hzd6S?=
 =?us-ascii?Q?GL2D7IeorzXg/6EohOKqigBfKhQRrQrm8IrprPT58ylfG7PnySJA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c71cf05e-3246-4634-63a0-08df1939fe85
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 06:14:58.5405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c0GoiLt6yFhYwhGO76DjzFKWOyDLza2+5xr65ciBmmcRmJy1a0ucG4sdqpJH/o/dskI+e2XUK7vs+v2pgnET26ewJCerhBPve2lzjRO7UMEBS1ZjHFOhcBbEznMhI8RP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8339

From: Chancel Liu <chancel.liu@nxp.com>

component->dev is the underlying i2c device whose devres is only
released on physical device removal, not on ASoC card unbind. Getting
the codec clock with devm_clk_get(component->dev, ...) in the component
probe therefore leaks a clk reference on every card bind/unbind cycle.

Move the devm_clk_get() to max98095_i2c_probe() so the clk reference is
tied to the physical device lifetime.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/max98095.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/max98095.c b/sound/soc/codecs/max98095.c
index a64a5ba00379..c827fd47a5b0 100644
--- a/sound/soc/codecs/max98095.c
+++ b/sound/soc/codecs/max98095.c
@@ -2005,11 +2005,6 @@ static int max98095_probe(struct snd_soc_component *component)
 	struct i2c_client *client;
 	int ret = 0;
 
-	max98095->mclk = devm_clk_get(component->dev, "mclk");
-	if (IS_ERR(max98095->mclk))
-		if (PTR_ERR(max98095->mclk) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-
 	/* reset the codec, the DSP core, and disable all interrupts */
 	max98095_reset(component);
 
@@ -2153,6 +2148,11 @@ static int max98095_i2c_probe(struct i2c_client *i2c)
 		return ret;
 	}
 
+	max98095->mclk = devm_clk_get(&i2c->dev, "mclk");
+	if (IS_ERR(max98095->mclk))
+		if (PTR_ERR(max98095->mclk) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+
 	max98095->devtype = (uintptr_t)i2c_get_match_data(i2c);
 	i2c_set_clientdata(i2c, max98095);
 	max98095->pdata = i2c->dev.platform_data;
-- 
2.50.1

