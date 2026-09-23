Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011006.outbound.protection.outlook.com [52.101.70.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABCC442384;
	Wed, 23 Sep 2026 06:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144105; cv=fail; b=ZeyoLZjUPDQSSQEEyIdNs4i6fh2lsYo4Fp4IcUS16l4guLewCDEyQeyux/bgghBJk4wEG/H890pY4XwOaCjptqnWL0k828JfzlDxkAyGlyER/gyK1JlJUPdYxW0EKDu9fB9WS/7tPfDf8XyzU+JNAUSLjfIJq6wf3svS3zw5qiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144105; c=relaxed/simple;
	bh=OJ51+xaqdJ9LqSarlEliD9zBHik7ItrkR4skyjxJbFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z700zPwFq20qLKb0NHAuFE8pc/HVcZBh1CcGm34WHfoj0VnCDCwm+gxFrrZGT9JwD0HftTJPUMryJsXxWNVmsDxucP0sjWkVOhAnITqwmO7oEcd9cqm11m++Sc5q2e2ONpo+GIWK+NN/Px31oM8vRBZOZBQS/QdjhaPCtMtbIPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=C6kSMPKj; arc=fail smtp.client-ip=52.101.70.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="C6kSMPKj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w3GaNhc68V+w58sgXOYM3RKJ00snyT8kfND2kxvoibF9J0jSoZNn13aef9lVqqJjq103hakldXdPC8Qi8H1ZbfF5EYmZwWQQc13IOwAqgwopPHOhHOraAwzM6eUGqqT1UGAVIBMODP4Vk0ipVNZDtskAFxWt3cNE9MimdyD0+yetC4J6br5VXfV92IqI9si7+lX37u+Tep4LPhUYYBiy41b5o+fkXDsDEnXPQDT1IXWpUtKm5CKf9fZX4wQAEtShvFRqIqWrC2EFX5ghhioGTc9o9H0BCggkrdPbPrHmkJE1i1/mYfDvI5vHKbzO+G9A05FJ3+wT8fML0TYimEDDlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jprutNdFgkcAYybSFgGpZoFZCil8zgrm1y90FJDPXG8=;
 b=G8vTmgCkQjs2v9cGdDUQQW8umnITGG+6CVxUNSWvtbzcuQeRWTMDLizwHkQB1l32XYevJw8hMaBvu+3DbqBJFljPPYVZeEfAYph1Id7KWdXCy7vYDPQd3Zze0XsfFSiBSEJGn3rbP/1lAHG8GeQ2secWKglBQyGZmmpCG/RSTqGFVzJbtIRz4DSQvNoeB0IxskHujG5KcQPNVHGgd2v9wQddWox8MR0/MRMv6ApO+cBKG31nwXzC0QmcnT2G4ugiTqmR5vf6cGTYjwrQBFwk6olJO+bllaPxW0wnTvmxmMs9o4yE2Peb94pf8Vdx+rUrD3qjPMEaAksl3FuYubtOOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jprutNdFgkcAYybSFgGpZoFZCil8zgrm1y90FJDPXG8=;
 b=C6kSMPKjKsFsL6KKJzu/oE1WY6ljNSTWRbvKwmncC/RBbrdSf6Vk0FiA73c+tf/W3vtj6jOJaK3fapvIPkH15oaK2A+Iqy0N+fPTi9YywO74ozbC+KWzlVFKSOwqiTgPw5mP6XL6wgRj071pyL8WwtiV8kyFrJZRmFqo6JMeTRhci9pZiNGU2kClTCid8nWc+ue+MiSAy71g9MK0ZCDr2Rw1bMXVHqB9F4BsF3ll8LcO/L8/rCKrmDMTJX1MopS+VOEyL6ARWwhFxGnH/ZlIzBmpTmqA2Kr+vEXhmH9ym/5El8x3Y72LloNRcdvK3gKqhte2SwbBHXUQI2h5zVVGtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM9PR04MB8339.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 06:14:53 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 06:14:53 +0000
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
Subject: [PATCH v2 13/21] ASoC: codecs: max98090: Move mclk acquisition to the i2c probe
Date: Wed, 23 Sep 2026 15:12:57 +0900
Message-ID: <20260923061305.4041197-14-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
References: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0108.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bb::13) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM9PR04MB8339:EE_
X-MS-Office365-Filtering-Correlation-Id: 91af088f-eb45-4fb9-353f-08df1939fb58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|19092799006|7416014|376014|10067099003|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Wl8w0GnDu0mZQbQu7tJzN16k/4nJipSgDrhTptONZGC+fXnfpEa/G5El0+XXO2kPTSxt5jSokBF7Kv9jgHQPquPIOKQKy0qF4aM1hn1VwiRPOX7yVv3ugA9t69pdYk9hgPt1QBNbeyP3WxK52IKVnYzC81GZBHns9FL0dHhqQfaNg7juCUoIjNLbAddUW0FfXMtFrx0CLNib3GPdMM68a56QquuDhbNyeVwT5yoG1/IeuoOH0WuDm6PCmbe3yTHc4a6B2qAJEDNX8NOTvz077nrZyPATqv0a5QNjTKw7JeM5QK+FIkuAqq8psAsF0GAaZtoTJgpQJxJP8URd5xl7zxuOCY3aCuHd9TaU69TIEOzijXNkN8Gzhbh3UIEMAVKMZ5oAKvHvhfFlyf/dDYoy6ywp7aPu3TBsP3pidww0/fxlVJh0GLqIMr63Z5kzjTKS0PDpo/YzS+YiDPvOubkyoGzhLs9/U7I5uKY33ZEd5vh1Vfb8RpRinEpty6vWy5gnNsX/Jqe6Hpdsu8eSgUJh0gvcrwqlIJ7kGKyG/0codHsSsSRNM9LSgeM4nxegxcrL21/Rv8Rxgb7Eqq65foqMZ393C3jItTVHUpdJ+EtMEvVYb5HlldIcT3tdnRdqZ5WeXUaKANkmlfEfRgud5vzO+Ypbqjob2Q1pBTqt8FpBpAI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(19092799006)(7416014)(376014)(10067099003)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vv4bQHFZwhF0+IWrx9siXgJ5HyinYDlj+qhsjDde1LuzSN+2yEvFpTtuIYk9?=
 =?us-ascii?Q?uPZkkjLTZgFxf9mK0Y0KnXzJqsKc2P6mz8Z1USruvAB9SkVCRLpBsTZDiWPO?=
 =?us-ascii?Q?PxFU1HdNR1NAYUGPa4oLF0UuB87VceD9tYmi6yLWe3irqRmwOxfox+hYc3sb?=
 =?us-ascii?Q?dFqkXyXhROmdpOiHkL0F6tnpYrErmRjiZc62kfQ1i/a+5kzactRGGkJODsfo?=
 =?us-ascii?Q?1wfBMTvdKV9efINfYhrnPtJf0VwhTK+oDmre9F96heFryOtpcwWhKcDfQhV1?=
 =?us-ascii?Q?k/ZbLkSDYxoVx5u278tNnPK/zFpreqK40k8Pl5goa4totyUXXJSxU/WeHkOB?=
 =?us-ascii?Q?qVlQNWMjEyv5gJXY8Vl0zZolLAzEfajTVrShSIW78IC5zMEmDIHXwnq+5jmI?=
 =?us-ascii?Q?o7d9abxFgdSgdK3+W3AfLGzdEUay8G8xPNTfI17/6GKBdRZInU31WWEf95ZX?=
 =?us-ascii?Q?dLNeRyDvM2GsaL2fPM0GOYHRf7nvrf6imQ6z7/LjWBwBlBg3qwedOIzkkSg5?=
 =?us-ascii?Q?9IyOQNkHt5qPfuzINEQ7K2TS2gR+TKWCRBAd0AC7zJPy27TVqomiMPHxr5VE?=
 =?us-ascii?Q?dipTNDdfK2BlwXrew0q06x7bxP4vPsRX46v93Fg/r1PV00LUAF2ftOek9v9P?=
 =?us-ascii?Q?F4mCU1iVh307mBsaOPHohHQgXqExbEBygfz+Ut5xJtxRvNqQgKgt3c9iBDq8?=
 =?us-ascii?Q?lYFQZ0lqctckYk6psqkkmi8+VSQYqx0IbZIQqefpdqkXYjSTcvf7lXYSmfs5?=
 =?us-ascii?Q?byoJbsaLd99LI/3QUU9IRLHJf3wPgwPhmQaUI76XawTfs875QA5/xZ7ojNB9?=
 =?us-ascii?Q?L+h7Xm1oza0msji4JFEBh2kbBqkdLq6TSBZmvqYOU9eqWKXd8BpNOcegQ19Z?=
 =?us-ascii?Q?E/J5IhEbd7atnntmBFf+OLuqPRUV/ySumvKrBMOhZatArwl9AwBmpqSrr5V2?=
 =?us-ascii?Q?hyL1869Hxf/e86BJAUGrzgomWEMvWjoB7heeuWxP/zynGJB10AgSUSl8dkCa?=
 =?us-ascii?Q?e+9GJ42rG3az7Vpo4oDaFWe7lu8vhIVBddP5brWS0x1BFl+rJDdpvTvSmkUL?=
 =?us-ascii?Q?Z+N9JrYrmwUjUGvvOKmOHTkeUxE+aY/n1DzmHx40QHXcJkVZ+09U5lmGhdGU?=
 =?us-ascii?Q?GNvG8OMNc705J29zB3ougNIy07J5g2sjv7RKegXQWRoALyfULwTA/myxyQDf?=
 =?us-ascii?Q?C8UpHd2zcvBtXGWkh7utl5z6JYLr3fI/pJXANSg1dk8iVi3WvK+yiuspxv0k?=
 =?us-ascii?Q?4a0kKUR4Nk9GXbFRQtksfy371T7JnR/AYJOGSdbRhusSOxWFS5uhzkPaqNS5?=
 =?us-ascii?Q?d+Y69RF1YY6czp4w7vxADQwgk+J9zZr6HXHg+8CLH8TMgVrjTXpA55+rWx4E?=
 =?us-ascii?Q?Dp2MSpfioUsPLHxXDIMMmUnPhSdwfyL7Hgs5TAJsxHciyhjeQgyyMtdLCX2k?=
 =?us-ascii?Q?/3hn10+L5azn7WeFAqYTKwQ23UHDLERxuNLhGMhHAhc89peVgwyXVg+42+ij?=
 =?us-ascii?Q?fcJhO6CJOSE3GG4E5+3hqT05SD0BXNhsf6lJK20NEK/ymtfMjkBYmerpFzsv?=
 =?us-ascii?Q?IagXcd/zQ3jfIhbmDrupmGWITbjGulMYL7EsB88LCJJkoz7ZEhMrsXm10Zgm?=
 =?us-ascii?Q?eo8ndplqLQ6ZxF/NcKwoQk1SSlVKkbCJJ8XZd1NLdnTIGICp5mv+mC0BDhdC?=
 =?us-ascii?Q?uDth8BgftHv7nJWs4PLF9lrPwmItiIyaZsTtNmKE+uZYueIUdnU7+030dhXt?=
 =?us-ascii?Q?sWmh6YlXLO7BQKxBpFRLJuHM1/tDCA7ctfSSPnmDgQqvZ413CIbg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91af088f-eb45-4fb9-353f-08df1939fb58
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 06:14:53.2117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dd+7klN15AWvesxn/azMouEraguja3XL7afFErIJY1801T0zduP/U0jcVwKfpOcmqZCq5xx03HivgbjSFU6zH4hDXVNlsZHJFVN5ZKwmUHzdHZKXOCvYof+2V+qziuhr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8339

From: Chancel Liu <chancel.liu@nxp.com>

component->dev is the underlying i2c device whose devres is only
released on physical device removal, not on ASoC card unbind. Getting
the codec clock with devm_clk_get(component->dev, ...) in the component
probe therefore leaks a clk reference on every card bind/unbind cycle.

Move the devm_clk_get() to max98090_i2c_probe() so the clk reference is
tied to the physical device lifetime.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/max98090.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index c31f3d32fa43..4bb5478f4642 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -2448,11 +2448,6 @@ static int max98090_probe(struct snd_soc_component *component)
 
 	dev_dbg(component->dev, "max98090_probe\n");
 
-	max98090->mclk = devm_clk_get(component->dev, "mclk");
-	if (IS_ERR(max98090->mclk))
-		if (PTR_ERR(max98090->mclk) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-
 	max98090->component = component;
 
 	/* Reset the codec, the DSP core, and disable all interrupts */
@@ -2633,6 +2628,11 @@ static int max98090_i2c_probe(struct i2c_client *i2c)
 		goto err_enable;
 	}
 
+	max98090->mclk = devm_clk_get(&i2c->dev, "mclk");
+	if (IS_ERR(max98090->mclk))
+		if (PTR_ERR(max98090->mclk) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+
 	ret = devm_request_threaded_irq(&i2c->dev, i2c->irq, NULL,
 		max98090_interrupt, IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
 		"max98090_interrupt", max98090);
-- 
2.50.1

