Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793689501;
	b=DlVj+pfDlorZVZJfTI3LSrmypl9GNq01gtpkn/cnc4tUSUdQdIcLyiF2xq99TUH3VqPr
	 pdIeZZoxIUYAwo4J465aQpyyztFEhNjJkN8osO3H/YBYZ6kBozVFfVvm3bIrjWnFiRlmt
	 5m+Vw7ZGrWen8Xr/gy7qVSovymS+ypizfemtpZwnZGpItf/MldwBjKAzLHDN/rdxh0lKr
	 SfbWVLsmI7C5Is0vazUl+bKjqgGRWJLBFsI4jP+WbdpdbAZms6mX8ZiGHP/06Es5kwzjD
	 fep/8vmO2M28ZCLFFnmH0QeIYw6dwLiRYFCgpYqWr1f3r8xU4NDjV3RcXk9SWgICW4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793689501;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=9hSWeVrgIg280EeJlefISlB47C1n5HfGNtr5e793vUg=;
	b=FGIdzdqYGGZew/C2fAV22kXg7DpKa/BayL5F++xTJ+DWwZ8QQVemVRBAq3xf7uR5rDEG
	 4z4KUGHBnQRtA42V8rz4SHOttNv0ycpslEFP+j8vnibDHU53kBDlGUwKqoDfA+C5aP3jU
	 WUxMTaUHG+haw7im6zG316DeuHvutuEkxsdRaYiOIHkX74nnod/OCxmF+Epk31U62QO7E
	 MFoxRSyxbPFlbmISJRNM3MFgu9ZOoN429Waz6kD8LV8E/LwJoHlAEADRAl6ufunLlMJ9Z
	 5UlL9IoWAYb93iLKmAFrKzn37DhVGWdRCUoFUj2LDwit3XRRl1wIGHzY3LnB8pc9bEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=DDmF+WyR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.32
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012032.outbound.protection.outlook.com [52.101.66.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69681606A331;
	Tue,  3 Nov 2026 07:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69681606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=DDmF+WyR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WM5djZ9HnqY/PWz6WrNVh350zish47X0d/SNHV/OqOn0wTGM/aFG8NOIRK909UiNW4dZRr2UQSJxJGfC5FaYSaCGc/hqjddkhkteL4njUOLpPsTaEnNHMRWhS9PLcR5rYnXO3juFg07sIL1GfHEqcqSCze/LG0qtAcKZbklqhsZ9iiUkKhDfYk/a4aIXjxyvC2EmGYs+SQfvduxF3FHEad+0nrOOUHtUtx40yXwNQ2uz6ZnZ9SyV2LlHLcFsBcQxA52JE0t4ELiHT6/6dwyO0UfNShvDtrQva0CeHbDgbkSmyZNCaHDdfSmkSddTVo6Irk0to/2OTVXxJn0R5kP5Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9hSWeVrgIg280EeJlefISlB47C1n5HfGNtr5e793vUg=;
 b=KHJ3O42nGo9BmE/W1DS4Kv5PIQpNJG7I4HJpS3jQeS2aD0KGapn1muRB8D/bVVPBGuklFWO1v2Vh5IKUEjjyHNtgNB0252KmRqC7jtuSyBfO3H1YfS+ZbFaAVhdl9a6wuUoDWEOkGx5tyAF0R+pg5tkX46/QG8fdpluEYq4MstgziMrsql2ZE7kTsVK94Uaa5R4CuyCLNX4XO78TvLlY0GkOeHR1lppBhYM+UEndEXSAKZqT+UkYhoiMa50BUmhEJiQ4GjS+61PchF+T7lOZmnUlXsivDrCXYuRVTGMsnCnsCtZPJvjhFOX8R52ltRISJ7zxdA3yogkIGLh1nhG8og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hSWeVrgIg280EeJlefISlB47C1n5HfGNtr5e793vUg=;
 b=DDmF+WyR165H1kusk9KOySjAweEp4jKL3Ea2Jrhj6xOpCWi7T8EeedmZsE7ISraf4AMe3QO2T5UUXPuhwAPrm9hMrimBTaZ60iGbvi5FapaR5Yx6MHZ4qFfyU3pQbeeztjwBKoUo8YSGqb5sgK/x0rJSNsGwTspPODAc3W7xwceL9QkHuPjS1VqeLpzDphA80h4Ce9pfrL1Hgex5ta3rj0pGVr3merdHOnk0ko68vrRqZmkjM0NQwkjhgcOefh093YO7RbV8NY8EN8YA5Y+lu8xG/9q5RWwWDvOvaO2RMbIOs+tD2La1r5eGhw7F41RJbWncbdZ1dXFUDR8KoUnbXQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by MRWPR04MB11518.eurprd04.prod.outlook.com
 (2603:10a6:501:74::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 07:04:57 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 07:04:57 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/4] arm64: dts: freescale: imx95-19x19-evk: Add IMX-AUD-IO board support
Date: Tue,  3 Nov 2026 16:04:31 +0900
Message-ID: <20261103070433.2307145-3-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261103070433.2307145-1-chancel.liu@oss.nxp.com>
References: <20261103070433.2307145-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0044.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bd::7) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|MRWPR04MB11518:EE_
X-MS-Office365-Filtering-Correlation-Id: 97603bb4-6fcb-4014-9751-08df3978c4fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|19092799006|1800799024|260925022911599003|260925021911599003|260925021311599003|11063799006|56012099006|261009223027099003|261028144727099003|261102123227099003|261022105027099003|261022075727099003|261021121427099003|261021123027099003|261026140227099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	RP40HZwcNfQU3DpFTIUWT1F91SX4rEPXC4wznZ06Pz/7SSsWcbixZ9uY1I58o+Gn7Rb3TTYQGj4iRGc6FTNCvHZJOH4Nby4VALnqI9QVlioKxifXG0eR/Jr1WiaZ8X9UosOu/9XuvLvfWqya4klvcTNI2vDZbusiniGJ8TF9Z6LsQ+1nc1QvX8k3RXTXGiyzFcwAzxxosLlfXTYzyHCJBH3iq6dE+QjlGC5vrP29ceDi0nQ8+UKJunE3aktalrFApW5UoA6AAwRk75imKOQ0pbo4R+CUtIFKg2kxZ3KoVkgmB0nbpGv6qA9BMnWi4QXEeG+8lM9tnktNjryMncZZF/gv0sFUnidsQ6cxxZcMSi0FZAvvgM8wY55OKC530Qvteje8npfnPoNvZA4WlJt6pUwFJ8e17wMaM9mbrFz/s7udsvLVqEpvKnhlAzUHc8ZFhHJmgkvZrxOuXlx4lV5BeC4Ui/qa88zTFVuzxFRp37rLwkySGbEZUvCJpwHmG+8PBpoW0MPqcXq3bKBPrjinqIWdfB5t1T4kPsXGFHFQdvNsOlkimdVNHz+dd3pyYZA7/G7oeaTgeJg3HZdV9RyFPLAXSbUKwW8+qeX951pvJaOoSDtkogTi4YWNF3YbyhcpJFWBZaltPU76LgTAGnqqlMo7u+7Z/pnNxhijkbxuabk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(19092799006)(1800799024)(260925022911599003)(260925021911599003)(260925021311599003)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261102123227099003)(261022105027099003)(261022075727099003)(261021121427099003)(261021123027099003)(261026140227099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hbbkIbaeQN/T4jaPvedLBx9hKpVAFjrRwxrPBjd3LG8xA61MwDxlpV/iBHQC?=
 =?us-ascii?Q?mkMvpXgXwooCVyNwl9m1PR3Qkuw0k36BRgop2s/nWZrOc+h287/9gwQ64tFr?=
 =?us-ascii?Q?v18x3qQXEBcXL0XVsRXeQmTyIh3F476yW6LL6eQ9ci+eVQmto+KgvcFvDLD6?=
 =?us-ascii?Q?kHqSRj7h2U+DkoZEcPi3sU/OHPdszJCKGJBSxETBt4iisQjeaFC4bwZgy8Ba?=
 =?us-ascii?Q?T32KASsF7FCwDnJy5SYIR+uYXw4QiPtpWNzmib5nRaPXZ3NAKx7Fny2uPuMg?=
 =?us-ascii?Q?dMpAA1HQ01d04yOlmdyo2ZHRgFy2nE9ieOuLw5mxbClikXOQjElUEc2RdbxE?=
 =?us-ascii?Q?yc4RlW+BULuq0EfjG3O+vWrk6m4h0csms/ozTTY303sKA0sM1hOTkfNZpLyk?=
 =?us-ascii?Q?/EM9qXW+zT64zj19E5pcJUx6r7o+xCiwyFjRceORbHhP3uH9qC/uq13dWSb8?=
 =?us-ascii?Q?QBi7KQ8VoZ0bGe/D1JpjIBbpObHW2QjRkUu+HmsBmDvM6sflMNqzBEBfPKEa?=
 =?us-ascii?Q?GRmZYqr1HoP4OxuTh9tzHpoJwMKrUW7s1eEyJlItT9Er1GxVWeonfRPufojf?=
 =?us-ascii?Q?QR8NfgV/+mRKa73dmMZjCUUlsBJHcrH6yuRFiwDBjc82JjHQDkVXHP0C8kde?=
 =?us-ascii?Q?kHfqC8dq+p0Dmm8DEVx5doMkttQo0+cjfmJ2jTvkSsJyNoFJk0BAPUsPGLDX?=
 =?us-ascii?Q?BlD2okbKlnxupB8sD9B8c2+y8ZmuaaV5ksBtHx8W5+T87bNzc/xa9KOApy0S?=
 =?us-ascii?Q?zKv2WrVgfR4/+jzw8XhJAF/dOCMv3NFQ6h0Ed0qFsUDUurkAvkZnB0MLNNUD?=
 =?us-ascii?Q?A5Ba3Ce3DGUYvyJqu/KuvgFdQanMRRlNnfj8xBgI5pmXwFwmrcehn0XOpwTT?=
 =?us-ascii?Q?XKNBsuu3AlIkH/0UhdFUUai64V0szLmPb/2vbd55fe2JBUgZBRU5RzlehXW2?=
 =?us-ascii?Q?oLvQqdLL+8sO6ilmu3lBrBim6nF+cikeSDYkHwcYyW39UOm5NwTGOsVNEKN9?=
 =?us-ascii?Q?qRWwJl/TbYWMzW5ofSBJnZ2ns4toW2LkQUgE20uevtcQBcIolK2cqbFbEhe5?=
 =?us-ascii?Q?w2BiBLDzbp2848areW9ZUyzGsoiZvpHysQ4OqpfcHRLZZlUtCvOlBHxaiLWw?=
 =?us-ascii?Q?b7steWDq0ZkEmavBtmzTi9eKO00h0gyDWMmS8I6eqlridI/vNtKHIgLx6V7G?=
 =?us-ascii?Q?trpfXn28dqZz56qaGNpeagYUlnTiaHXWrlRMI24LgobLy285XmCl65kFJAji?=
 =?us-ascii?Q?DuOO9URWy11/iEP58w3MeB4uZd5KpXYZaro6HR5TJnsSBcXFsPgH2X2t+kd3?=
 =?us-ascii?Q?0bVm0pR+ufrCMkUxM6s/2TVEGJoh5XXTKhcdWAYpme7if0ADn/rXzIWPxXqE?=
 =?us-ascii?Q?cc+MesUCDFnzE8fY3fMsY4Fa8+pdheaF+NaqggQtaZB6zSWF//Owkw437eWO?=
 =?us-ascii?Q?BH4Ee24F9gfXNAd0py0y05QGAZHCFxiC+cu5XFTXGI/MfQGkgdN4iIfLpO46?=
 =?us-ascii?Q?fUcI1/0vc5GIZdlNhk6XueG38h+2TEjp0kgcdmTcMEDzXnk3Fas47EPhDDVM?=
 =?us-ascii?Q?lkHFShVB3APh6BR/M1R7h6uwqbV+0d0biQw973zxQv7TdInG5umRDDlOQxyp?=
 =?us-ascii?Q?vXWOs6+WkSlvQ7eiRv1fYIbtkLDibDWYRQZGyby6M/9XzG33e7sTWwpIDgzP?=
 =?us-ascii?Q?dS6IYCnUFbahK6P8fGYz5hBMozNpsBmUbdW5i/muE4tY7BeA2mSk0zlhvIMb?=
 =?us-ascii?Q?9glWl6q6Zjjo4zbW0GKIqrifmuRwPIUhgujp+wb5GsdgcpTOFhuq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97603bb4-6fcb-4014-9751-08df3978c4fa
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 07:04:57.5576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mCuvofsoArQyeASjW4wiHicu0vfX7lCLQqI5hTOJGkDvDUEi7PzYnlzSA2l+af9PC+lEV1RAoVl4zF2G4Yp7XT3AuWSxuOewiyRhHxpq+U8ze6ttzVQeW7728UsKtCM4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11518

From: Chancel Liu <chancel.liu@nxp.com>

IMX-AUD-IO is an add-on board which can be connected to i.MX95 19x19
EVK through a physical connector. This connector is described as a
fsl,aud-io-slot connector to expose a constrained subset of GPIO and
clock resources to the add-on board using fixed electrical wiring.

Also add required regulator, sound CPU DAI and I2C bus configuration to
support IMX-AUD-IO on this base board.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx95-19x19-evk.dts    | 54 ++++++++++++++++++-
 1 file changed, 52 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 47ed0ef67611..ddc5aed2ea8a 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -43,6 +43,18 @@ aliases {
 		serial4 = &lpuart5;
 	};
 
+	aud_io_slot: connector {
+		compatible = "fsl,imx95-19x19-evk-aud-io";
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-map = <0 0 &i2c6_pcal6416 8 1>;
+		gpio-map-mask = <0xf 0x0>;
+		/* Only pass through GPIO polarity flag bit 0. */
+		gpio-map-pass-thru = <0x0 0x1>;
+		#clock-cells = <1>;
+		clock-map = <0 &scmi_clk IMX95_CLK_SAI2>;
+	};
+
 	bt_sco_codec: audio-codec-bt-sco {
 		#sound-dai-cells = <1>;
 		compatible = "linux,bt-sco";
@@ -161,7 +173,7 @@ flexcan2_phy: can-phy1 {
 		standby-gpios = <&i2c4_gpio_expander_21 3 GPIO_ACTIVE_LOW>;
 	};
 
-	reg_vref_1v8: regulator-1p8v {
+	aud_io_reg_1v8: reg_vref_1v8: regulator-1p8v {
 		compatible = "regulator-fixed";
 		regulator-max-microvolt = <1800000>;
 		regulator-min-microvolt = <1800000>;
@@ -175,6 +187,22 @@ reg_3p3v: regulator-3p3v {
 		regulator-name = "+V3.3_SW";
 	};
 
+	aud_io_reg_3v3: regulator-aud-io-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "aud-io-3v3";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		gpio = <&i2c6_pcal6416 11 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	aud_io_reg_5v: regulator-aud-io-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "aud-io-5v";
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+	};
+
 	reg_audio_pwr: regulator-audio-pwr {
 		compatible = "regulator-fixed";
 		regulator-name = "audio-pwr";
@@ -449,7 +477,7 @@ i2c5_pcal6408: gpio@21 {
 	};
 };
 
-&lpi2c6 {
+aud_io_i2c: &lpi2c6 {
 	clock-frequency = <100000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lpi2c6>;
@@ -671,6 +699,28 @@ &sai1 {
 	status = "okay";
 };
 
+aud_io_cpu: &sai2 {
+	#sound-dai-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai2>;
+	clocks = <&scmi_clk IMX95_CLK_BUSNETCMIX>, <&dummy>,
+		 <&scmi_clk IMX95_CLK_SAI2>, <&dummy>,
+		 <&dummy>, <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+		 <&scmi_clk IMX95_CLK_AUDIOPLL2>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k", "pll11k";
+	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX95_CLK_SAI2>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>,
+				 <&scmi_clk IMX95_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>, <3612672000>,
+			       <393216000>, <361267200>, <12288000>;
+	fsl,sai-mclk-direction-output;
+	fsl,sai-asynchronous;
+};
+
 &sai3 {
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
-- 
2.50.1

