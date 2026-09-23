Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011055.outbound.protection.outlook.com [52.101.65.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9623A9D94;
	Wed, 23 Sep 2026 21:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790198024; cv=fail; b=pjximvGw5RDO1IIC1qkUHu9/PJIONd3HDh7SNsyFxrM5ZauUTuIzgBG02tDoFeidGmpWD36eyj9XSUo+b3gw68ye8uULNkd+pcL2BL1bO2nJoCtmHY9uxNUWph/UlIEnkj0+J1xWcHznKYSPOaqyLDe1X7IB+dd+Vm3UIjtjKa4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790198024; c=relaxed/simple;
	bh=R9Mo/8vJhnOAGnTqg9pyscdIzttXhMLdZgmVz9Fcf2M=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=k7TOy5Q7ctHkzMFVF5tIPqHBx5gzXvoT4Dc/PeP+Y5wyPo/ieCTouprCxe2Zgxo47VAt/B+7JzThmbOlsQsTbI6bN/6Ijmqqw+ayJ8AB3d/OZi3hM/9DIshUa2WJQdMkxuYHn2HNYjW284yAEkwa0iVfJBkhHeDDhtAymj9Q3oM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Ffm9SWBl; arc=fail smtp.client-ip=52.101.65.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ffm9SWBl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xZgAUs4FQ/Rb41k69e/5v+oOwDSnqzgS22+FWQZBf7WGvF+B6elyO0iMUI4V/4rNNLgrCXMF3mhk9+VNgqoEhf3W6ATMvKzbQv8N/vukZXVKn4HWJWT+cmOOPYg+LX/d83AvMINDsGZsjodxP3GBiT8YTtpbqcCqRscHxWiA+HXolzXEM51stsft68Eei2GDh52JRnBFgzKIsif88m81bcEeUOHe9xfaTBrE6TRt4ngBXu/v09hiP8kmhEL+oRRX/LuXeCJNa0UtBOWXlTR09TbjwYWIHkekvRGsI1RSZZHfadm6MASRo/Q3T6wrsl293AsxRJQGg7EMoOods/K2Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6SBwHJ5b2pPYOYCxoaAOZ3J23d9m9AQx4Pow/VjU41c=;
 b=xPmifqcdRcBfoflaeUBZ6oYCISGPSbpgQV2sj/c+aE3uX7rgs3gdvN6dz7ZEKPEMm5ZcPuVB3RH2CLppgELb3uxquY8GnAUFDZvVfOCxYJS5u4j9uJJ0STD7L1sW9MRs2VUQJa6YKdotWkhyAAnyOZaNz764JJVMtroyX37GeKGfsRF6VgoUclJu5o0Av1RmLCDrb9Vs3Bz1GkvwA3LCZXymU6FhwEC6riBIPOgvosupCYq/Kw87i33LOkgCxRouucC931NSLZag16JMx5m1fcpPB5e+zpttDpHkDROf3TicIPf4U8M915WbcqQBRhXpC60Pda5gXOzQCwskYwOyPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6SBwHJ5b2pPYOYCxoaAOZ3J23d9m9AQx4Pow/VjU41c=;
 b=Ffm9SWBlPGWaENX8aHkPnkQwvH8WsVnutPn10lw3uA7/6jDPzd7GQyQKHWkjmXLupeotAXm+gTXYlAmapLAi0LZBaxZLiJUOdUC1lZXXxc5yY0fsqMMdaqaBNaqG2zaPK2ewjuelWHX3CEDmmf817zeqdR0PJKFC65juegnLXe9Xp7Gg2PJVV5yuVAL4EsFy8BgjHRhEbWZd7vBvDOreJh25bEJ+51RZ8WMSj67YRosMcXz0mWkt9HVFr+GiVaFY23oCAZxk5md6X8e6vCL+O4sbxoXBXVQpOCaKxI9rbW6UFAiKz8vk4iM5RkYfWaBc+7/qiv0ZgxeVHnE8y8z1YQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by BR0PR04MB396449.eurprd04.prod.outlook.com (2603:10a6:2c8:5c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 21:13:34 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 21:13:34 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT...),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT...),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	Josua Mayer <josua@solid-run.com>
Subject: [PATCH 1/1] arm64: dts: imx8mn-solidsense-n8-compact: drop undocumented adi,led-polarity
Date: Wed, 23 Sep 2026 17:13:11 -0400
Message-ID: <20260923211312.3793073-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY8P220CA0034.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:47::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|BR0PR04MB396449:EE_
X-MS-Office365-Filtering-Correlation-Id: b2e37753-0980-4e73-ef73-08df19b786c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|19092799006|921020|10067099003|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	SOiETzwCWu3HUPLwI1M8DZUEZMMRWmosQ90outXbCcT0qX9owMfk+Csv7OI9BfoTeQSrL6gFgxfpHh6px/wcOpp0NXzGnMEP8vDi4nxTgbcX37h5frXUka7beJsdlKC7HEciYEUSgxAfDlTN68ou+uyMtWwwM5GJy088QmLoPTUjmx+V85BaSp3rW5OteQz/UzFvFYU0AF/lnp9SrUF5Q6RLEejjAxMv7Ks/zxEcKFXVUsPbk9VdSO2ZLObH9K4LLHcpcb7zyr67QiyvszRZI1oIHzlLSlV4RdGlamaSp/a2D4/WB6zWE6WHBiHNtsCSX0cTMSnfWxbsS1+9u+qw4XkCpMug3vjd79szkM3/mjsnV9TbkJxldigoti/3ME2I06KHRt6iGTe7vmFYGU0xh/DRjrbbyyNJomvvKOz2Etd5GKFDDj/O0+j9CvX3V6hEJv2d9Gj1pCSkjNvS+rVHMpfJ612B07TlvGniEuCfv0yKzFyTj+zGh6LaKwPm/Qclvd/5VP8Bv0wpncbXnksiedzUBaxxaQZtQOAL8jV0ZTibEVmqOu0XY5YsAVdQVBxbnOWVa4IlZ4pQ/CiMCIQkGzNVNTiy3KL7X6/Em/fS7SYRY6ADGGo57UkM1mokhlSTMSviWpfbJrQnNGw5Zob6//bXqscQRy9QpszEtyaleQASMjD49db8qogBidfMkwcrByscgSe9Z6memQz7ZX0PEg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(19092799006)(921020)(10067099003)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NM9d6036QFnkphYOkty2HqtPJnVjjFF9o4+BX6YKKQ0NmcxT0C6DdYp9eHn1?=
 =?us-ascii?Q?384CPuCTNnS66GYBIJ3pxBKWK5Dg5Dg/lgupNAs4WXbITPXx4g3hj6Wjjesh?=
 =?us-ascii?Q?HvFmVuwgRldXiEPe2i0hlowRwboeM9SA+Swzx9PX1FvPJbeI/fT9ynzkcnw2?=
 =?us-ascii?Q?YIfYT1FfjOyrZ15OPqyhgM7m1sG7uMT59uqUChx6xBwlGYUsP3zc6Wjjn1Qo?=
 =?us-ascii?Q?f5TE6hdvXcZyRCpLXDW4Sm3fyuYWZvP/eLcrLRONzjsADnRUtIw6wPTMtRbP?=
 =?us-ascii?Q?0rn6QgBkfTVl994muuVxEnKahZYGztEChH7llCLuE8XRFgb0JerxIc8Paj6n?=
 =?us-ascii?Q?ZWUkXVIjj4r7UlbzXnCLcCbNnsvWFwdjtuUvb1Uqp2dgQrTE2/ZGEdoBBDUY?=
 =?us-ascii?Q?ypnR1AwAMOWEW5j7V8VISFGJv1KYA3vAR0eNM0EKdFHpYXL58RS8NurzP4UZ?=
 =?us-ascii?Q?xejmTwP08RBqmxXh9AeblGDOiK/kqaCklUdnZvZX0loqpdU8Pj3SY59UfNyP?=
 =?us-ascii?Q?7tgKosBZ6IzXRiG/XsoYYPnGBTfJOTF9HJTNrKUggMtj2VqMXQhUQCYv52h5?=
 =?us-ascii?Q?OvmU3b7kk3XhXmBxUWb049bwft6RuuJIkHyIExpPuTKXrkgsP1itwrprFnKM?=
 =?us-ascii?Q?9yzirjnXTElhpzpDdcfRNSRMPdREFCVwxkR+zHVyjN3yTkkTa+Kwut3rTXjj?=
 =?us-ascii?Q?txGpas6OJNJG/6FA8P1cqHW2oSAV1QsUhrQuVCoI5UIUj47jUquxYyUBWl8V?=
 =?us-ascii?Q?FU4BA9DexCLYJXiuiIhkRBP9wJjJWdcIL1RNW/PVMpTTZHfUUIlofP+a/Svs?=
 =?us-ascii?Q?ZizrC1zyKEuq6wY1Kc+xO7LgiPly7AnQIE6dzXlZmC7jBQeMe8lMYRfhz46k?=
 =?us-ascii?Q?6Q7s4/BNzCVJKDbXLCZaOvaI1I5eVqbVd2bUrbELMLBxnXTVMCj7W2r4BAjF?=
 =?us-ascii?Q?e5PqtW+4gmJkDgZYyCB8t9xYonLaUwyV/XPIGQbUTTXoWu0pNK7p8N/Vi2bF?=
 =?us-ascii?Q?myL25H+GxzBgJtPwHgOMRqGxWnpJ7iHmNeb8bf9klUMxsaheBxa0KdSp3NuX?=
 =?us-ascii?Q?A8odYrEAm2TW/acdkWhYc6fAdmggEq4rdpqkD5yx2HqH88F3ZFTU5ENzgd36?=
 =?us-ascii?Q?LMWseJHxWsmFmWvbXP5MBn45gf+apMDWtWBAGYQTFRyow3lBG26KVv63HLKC?=
 =?us-ascii?Q?OecVE/siUWGwoa8UQLqbn4vG2b5etZGcMDdo58tNQH0QgpWlts7prtGTTcM9?=
 =?us-ascii?Q?j5B7ZvSHMSzZalQu2PY15J2k56xiE4FudMPR3HdFYzYhTgOzhiZbHIICtORf?=
 =?us-ascii?Q?yiZr0K1PWAqWprxWGQPTChAbO/L2fKU5Z2suZc6znq/bYmsVe72teucrqT3R?=
 =?us-ascii?Q?FbI5D2KUgOBtvBt9TiofMY85/vrKmFySyXygyoel5dwLVDB/ZFMmyWF0sSYb?=
 =?us-ascii?Q?o7ce2FHFuKNeRxIx7vxUNZHVkog8TRFYvmfhcBMi3Q869gTdNywQWe5yLhxW?=
 =?us-ascii?Q?CPRul1oaGU6cHeghNBSoL5sDXHoGgQt3+xYu3isYWj2S+fAS9yff2EP76P4S?=
 =?us-ascii?Q?pTmsYdss5j/Mxug39iNCSC3IKIBOeqMbWjalU0ju8hYmIa6mtgehyt/lQft8?=
 =?us-ascii?Q?4FQJBvXnq92A2OPYFJJ9bszDOuCdHzBfdEcC7eCaguKKrDEbpZymt0hcbyP5?=
 =?us-ascii?Q?RSX+rOHN96N3dsY/8P9cnnnxhTTaSxl8Xm+4w209o8p7MvAO09DUc4tM0E+E?=
 =?us-ascii?Q?PgOUkPH/4H5w5KKM1bAsmXiV8FCRdsMQrE9Pj3BRll7rkbYo+lrF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2e37753-0980-4e73-ef73-08df19b786c5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 21:13:34.2872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yvqKfCsQT3A3Y6S8ZDnm2Nh99hiDs6rl01j7TQp9sjU0ZUAjb83WadOu5zKn+bUC+wP23CHEt1iFDaiSyWpxnVUWhTcWyQd80iTnULzT+/tevNIEk6m9358jqqxvcUDN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB396449

From: Frank Li <Frank.Li@nxp.com>

Drop undocument property adi,led-polarity and adi,link-st-polarity.
ethernet-phy@0 status is disabled and no in tree overlay file to enable it.

Fixed below DTB_CHECK warnings:
  arch/arm64/boot/dts/freescale/imx8mn-solidsense-n8-compact.dtb: ethernet-phy@0: adi,led-polarity: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
cc: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-solidsense-n8-compact.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-solidsense-n8-compact.dts b/arch/arm64/boot/dts/freescale/imx8mn-solidsense-n8-compact.dts
index c8c6760524dbe..9b8b971c1a5c2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-solidsense-n8-compact.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-solidsense-n8-compact.dts
@@ -226,8 +226,6 @@ phy0: ethernet-phy@0 {
 			reset-assert-us = <10>;
 			reset-deassert-us = <5000>;
 			reset-gpios = <&gpio3 19 GPIO_ACTIVE_LOW>;
-			adi,led-polarity = <GPIO_ACTIVE_LOW>;
-			adi,link-st-polarity = <GPIO_ACTIVE_LOW>;
 			status = "disabled";
 
 			leds {
-- 
2.43.0

