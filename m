Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793371661;
	b=Rdk5LyY9f0p3Yg+zdNiGAl8MC6aIXeCgDgPDer8x8YOAIMVRoFamS6h+ce27toBsrn0D
	 L1/WvnQ17f43HKKRZe4MiTWNjkWXj4tfVEirAHieB61QHe8malSCzIkaTtCI9qJegGDKY
	 gItKiecaqHXQAdzDPnUJw7yhluwScseaj8mY5WBVM7GM2IUpgcJepWDM6dNzTGLnjlWO4
	 FdzKSDtV+VUP7ZGUuNCISqxmX9i4FVbvizoVIcJyYmQCzikhZNllDIA9H3RoBEYf8kDUX
	 bDoh6b9wGuwIX5Ew9iECU9ZEwUz39tix8906wXqsPf/54MlILA9KP/+Kl/rqCUkxBGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793371661;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Wii1bM2DmXt8anyyiJur5M4ikb+Kdg6ZYyMZSCzDZKY=;
	b=Vws6HC1ElYY+I/z8CVzqV4KdKcy4lcEYrum+87pOFnoAOk/S6zH2ogCvqJ7iFHDfdL3E
	 JsJUxrTILhgOr8i96oC+OQXofjZC73Q01LkDJJq1OOv8YlTP9XhkHBRWYhlUUOoS43SIQ
	 082zUXc89AhC6+n1mM9uDT2WBr6Y49gDH+t16L50Ud2/7NE+eOUIlESSngeqXgsFHV0qx
	 sqTuELkaKSAwGeKz4D7Hh/ngI8tR/GvQ5VgYCQ+O4+/f3qYDDZ/PiSAaIRYuN+6wW6WZG
	 RFm8K016UaTeh1wuAyn0+xh+3TGpyyMfzwUTgM99fcwwd6e/ZBOV+UQv9Zg2qCmSAxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=xDZDz5SO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.10
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012010.outbound.protection.outlook.com [52.101.66.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA56606A32E;
	Fri, 30 Oct 2026 14:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFA56606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=xDZDz5SO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nmTmL/UbaDZThS5IXxKEZYUx9LurfOulizS7tJQo4Iqu4IuyIE+Jkvzyz5qbdodRSWoDLupDtIMMFCn1Dm0fPTTxCFR6Zn6YRWk99JcBC/UeTp/ZwQVa+TSyvCQnyyFRNEnm8aiugNl6XeGdLKXp5ZvfhqIlsU0q0DMe6a8R9DIoyiX/cvle8rx7BJ062H8KxNNM+L53aWiapLocgWbbqAIQb90ldT7qMGG6eJdZmJ6AdFZyA1LlFiKdZk7M8sgoytAAxqZFs+W9AHW3CODsx8rcNpFKHpjkLrsOeeIw8tw0UhGJDYalxDqXfyGOt4shWzpeghjNqdOQ4ZZUTBVYng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wii1bM2DmXt8anyyiJur5M4ikb+Kdg6ZYyMZSCzDZKY=;
 b=cKQ4KL7UJEmfW6HahqWwkIrFkukKusmnCdi+5/XW0kpSA5yreK+8z41FYQ7u4FL33JLiJ9Vj4ib7gUNX5FzZZmKauS0XYgRyo/yQ6dUI91tCXDiaf0Ii6tPCkYSExZGJlHDWbEMOJSQnFjLBSbgJP0e5n+nCFk9u0PRjPKpd6XgUXBNjrg4GRh1w25fDOtOrFfcp9bV7YfLu+39YTU6xzRUjxvRzTDT+KCi94ZZWHgT9ak8x6MDkOx0J+MWfW4/igeV5+Jf5qxfhA1NzMR5iZqu6h6K/VxOI1Fi5eydAPHKicoIgNPp1GLNYUZQB8qJrfYZQwpkE2XmU++U7Q2eaUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wii1bM2DmXt8anyyiJur5M4ikb+Kdg6ZYyMZSCzDZKY=;
 b=xDZDz5SOfTllVuVKksvG0SHisIdd2WV1q6hpZwTFyOCy17cC3LKxMWwkbwQl17/5CAgNgNsfSxqrTFqc9dzhLuiKwGYSY8YnUspAwFVsUKKGmuEnNrHttt9sK0IDbxiXIvDkBJ31pXAYTYQY2JpRg3p1gYXBts4+t2lcNG3XiIpM+OXdrfvoviggg3KnPWYxHe21nrcAuijLNOLc56sro6hJgmBBleX8HWZ5CbEw1YM4TDAfrmFhA1onpqCTlb89tJmclHLSxBsBftqQvR8PLsz4nQbWexLnBhPUpfFl4k5V0UrAJw/Ra7ZIyV2EFXY2KxWVoWKgeNffrYTnTEUFhg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8114.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::22)
 by AM0PR04MB7154.eurprd04.prod.outlook.com (2603:10a6:208:19f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 14:47:38 +0000
Received: from AM9PR04MB8114.eurprd04.prod.outlook.com
 ([fe80::cab0:e4b0:6be:b1d1]) by AM9PR04MB8114.eurprd04.prod.outlook.com
 ([fe80::cab0:e4b0:6be:b1d1%4]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 14:47:38 +0000
From: alice.guo@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH v1] arm64: dts: imx91: add U-Boot bootph properties
Date: Fri, 30 Oct 2026 22:51:49 +0800
Message-Id: <20261030145149.921308-1-alice.guo@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::10) To AM9PR04MB8114.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b7::22)
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
X-MS-TrafficTypeDiagnostic: AM9PR04MB8114:EE_|AM0PR04MB7154:EE_
X-MS-Office365-Filtering-Correlation-Id: 16e9d856-be0c-4776-a202-08df3694bdd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|19092799006|1800799024|18002099003|3023799007|10067099003|11063799006|56012099006|261021121427099003|261022105027099003|261022075727099003|261026121527099003|261026140227099003|261028144727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	eBKdYtvbfIDjr/U9oY1/uPFaQ7OV7yWY8rKDcmHv2qmehkuAyL9dvA9yJOrwYx7JZjH0TIukrWTaIS24mzBimf30e9db4KJJDwnz9hJqDuE8wscE2dOQ3sU8eWijK9k1FHqaD3desOBKTflXeZXNJak5dWaat+wNkEbhgavKMktD+/5dszpDYJ63f+7jslb8M49pgw8Mqh8FV7ocFmNPJKLTQAAOTYnqwagzLNjlQN6Wfk+h23DQvmVGbNNov8QSIQF65Mm1+XS3SFNFhpDcXvZEuuW3yBKVDToE/aeIjh1mou59GT1q8LFsgv7AdjwkGn+NZju0wm1SiktcqYSyiWtCmyx+iRAvYfi81+PmAex98/Dbpo36MnsbzSbtC4sl52oeqRrH9qXpt1wf6/XdTe4Ro5gLUCczMxhVm2MUFgryrtQKAaZU6PjL98ERnn0IUNh+/dNZAZMW81VLR0WyfIvnD5e3TUToWwwqJguIelnMf4z8dOJkRCAdtodix4FMj71rM7w3W4PclvozimqOQND/egFz0Y4ScvVeXvQSofhulz0w2qGblF5NQ362BwBIhnAlnWDxcgw0AABX4jTjSwP4yk/jlCYe1eSDOF5DKzKi60xqiz2g5DH6YWhecgVzlkucFdE1tieQMl69j7R4OWlGzKkH43x9ri7kWIpDQoc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(19092799006)(1800799024)(18002099003)(3023799007)(10067099003)(11063799006)(56012099006)(261021121427099003)(261022105027099003)(261022075727099003)(261026121527099003)(261026140227099003)(261028144727099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wH9/pRuTfdBwDEsv4z3SNpuU2mqR2hWQHz2+AIDqcMbFrg/HcK0sa5Mv+L+v?=
 =?us-ascii?Q?oGtVFnZE6EyBtxNy10gAlHVDTY6n2VneLIhdCcsDskHq4VQaq5EDuyLI5tcx?=
 =?us-ascii?Q?M6YSmxfS22guezYn16pEG19A89tHCHgM+UJHoed5p75OVmeaDscIzQP1SaJL?=
 =?us-ascii?Q?iXIVHPk3sS237qgQ/v+Q7SAgCaeWMmsYggWLv0n3jZjCebtFh6g7KmjejGBb?=
 =?us-ascii?Q?fiXaVu4A9ZTA8wXIT3osWDM7c/krd0uNyApYqLj/aI5x8s1rhSCsHs/mnc72?=
 =?us-ascii?Q?2Ami9BsbVOKia2WYUBLQKUH8qGQ6U7lnOBUXfbmPD5wJ2y9e9NDrWH6IeW2q?=
 =?us-ascii?Q?RxrR4556KJ/mBZ+IT02Uy61winEZyrIH7LHpN9RxmFxqPumeZ/nrnDlHNUUz?=
 =?us-ascii?Q?6Nk61y7Mw7ZkgOoHZt6inRIrVXYU2/zELWWELckRL+lNmTYLqcDUOSVqbHJM?=
 =?us-ascii?Q?pBNrNlrhxylDxrEBNBhcu+2Q7ebf35oSLqJZFRSOvln9MnD56wUMCVE6bp4Y?=
 =?us-ascii?Q?6AM/KS8gwe0xMQkALyIZXk1I5C0MZ/gEVMz5igoOrg/un9M5T/2VqtJGmfmN?=
 =?us-ascii?Q?H0MsM8bONS5tRJPx05HCjfqppb1pyeO9TejZqmp4f1ogqcdIfcHmgsFbTQzm?=
 =?us-ascii?Q?lHgElr9YoVIEuf/hjF6I5rwPtsj9FNNuSoEgeOaf8Hhu9PGRR0pWkyQGO05D?=
 =?us-ascii?Q?oBx/7BHFR21ROoJ7lJYPeFPkmsQiCOMXeysefJ4ErWzR3MMwCRPCHKx77L56?=
 =?us-ascii?Q?io4PaZLlM3tpBBFnv0AosFmr9Ae+OphNVvN9vq1RrolS0RaesQQVNxKrEYGq?=
 =?us-ascii?Q?mimZcqePahdUN1INx5oGcOJH3YVqScavYzFjBJ0OMhnZwLdax/0LTrkLM182?=
 =?us-ascii?Q?odocdoqfY4dc+wiY4I7nECYAgJCCXdVEWBIQOBRAMN74l7EYpFl0I0iSxbtL?=
 =?us-ascii?Q?27nj5b6LGPGxklE9mwTL3ktSBPbfBujAJh3ZlgecNOk177wEsK62zpMZyVCQ?=
 =?us-ascii?Q?bsrXx1eSLZZ3RJvIIpcVtAOWpNWxjXk9uuyrbG51IW/HUmlW10iNKM+zCZ8C?=
 =?us-ascii?Q?qfsLF8bH1dnI2mj+fPT0N0xVXheK+glSgzB3P9RffP4GfkVu1E5cvpNewcbc?=
 =?us-ascii?Q?x7YR7DunkheV8fEBX7puqPTjx56sJCtUUzzyx7p/hepJv2+AlWQ9IJEElF9z?=
 =?us-ascii?Q?D4KQyuB07l1aTCHbffsfEqZxAbiclHNopnTTFScAeXri7jENnTxiRy83N27O?=
 =?us-ascii?Q?gwqcMdddDhcBoS/w0AIn2RiLQf/GaQ2cN5NIEHeRysVIoQHBZ5JZo2YzEaSC?=
 =?us-ascii?Q?tK6DyKjlyZZ54w3GsaMqV8zQbgd585LQ1EhcaoeNfBphOmdhLWaPkwlrOIPP?=
 =?us-ascii?Q?Vzl1kn45vUG32ivwNxD+pf2oNYIeQiLFXzJUc5Dk2KicYL3rjVvfzZvg5YTr?=
 =?us-ascii?Q?VcoiAAWiFtJyer5dYkHU+h+a6y+ZtO+uW5KON7ul8jzMTOlMO14DFBmLh+xS?=
 =?us-ascii?Q?Zo8nYWOS+XSJ9le56cnkoJYEhWWXkkqlnYXTr1h9NNZdV4rPE1AA/fM8mPFp?=
 =?us-ascii?Q?QsLb+cl1MNppaPVNQbRKDhXI7+Yo3ViIqogbijWE7Xwl2SysXZfBbFnuuDoH?=
 =?us-ascii?Q?YYOKg3JKUpX++h/jqwerIYDCCSn7ChGxyTy/NZH+XdSSvkp34k5Vvf+LKGlR?=
 =?us-ascii?Q?z3Eahk3W2GJfMllqfaEcWy4IfKU0J2fo+gA6pvYqX2kiEeFlLOppzpM8MTu9?=
 =?us-ascii?Q?e6k+LUfZiD5PTGUK6jNEQ2fHPoHbVtJCoTJNORO6ONKtYR8urN0G?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16e9d856-be0c-4776-a202-08df3694bdd0
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 14:47:38.2688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MoXV9oo0lStoWAM5IjeAzMJFn9RfTUwZi1q6+EMZkMfnusXT+3UaKY298tZmXRCm81TBVqDjG8Cg39i70EXdLiwizbYBu0cow3RdkhLiiike2alt9fW9TvCHw484DyUN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7154

From: Alice Guo <alice.guo@nxp.com>

Add bootph-pre-ram, bootph-some-ram and bootph-all properties needed by
U-Boot for early boot DT processing.

Place the properties in the Linux DT sources so they can be consumed
directly by U-Boot when generating its device tree. SoC-level nodes are
updated in imx91_93_common.dtsi, while board-specific nodes are updated
in imx91-9x9-qsb.dts.

The properties match the current requirements of the i.MX91 9x9 QSB
platform and include the clocks, bus, GPIO, mailbox, USDHC, LPI2C, UART,
PMIC and related pinctrl nodes used during early boot.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
---
 .../boot/dts/freescale/imx91-9x9-qsb.dts      | 21 ++++++++++++++++++
 .../boot/dts/freescale/imx91_93_common.dtsi   | 22 +++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
index b7f0e39b867a..fbb7de8c0a12 100644
--- a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
@@ -172,6 +172,7 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
 		regulator-min-microvolt = <3300000>;
 		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
+		bootph-pre-ram;
 	};
 
 	reserved-memory {
@@ -257,6 +258,7 @@ pinctrl_lpi2c1: lpi2c1grp {
 			MX91_PAD_I2C1_SCL__LPI2C1_SCL                           0x40000b9e
 			MX91_PAD_I2C1_SDA__LPI2C1_SDA                           0x40000b9e
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_lpi2c2: lpi2c2grp {
@@ -264,6 +266,7 @@ pinctrl_lpi2c2: lpi2c2grp {
 			MX91_PAD_I2C2_SCL__LPI2C2_SCL                           0x40000b9e
 			MX91_PAD_I2C2_SDA__LPI2C2_SDA                           0x40000b9e
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_pcal6524: pcal6524grp {
@@ -284,6 +287,7 @@ pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
 			MX91_PAD_SD2_RESET_B__GPIO3_IO7                         0x31e
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_sai1: sai1grp {
@@ -300,6 +304,8 @@ pinctrl_uart1: uart1grp {
 			MX91_PAD_UART1_RXD__LPUART1_RX                          0x31e
 			MX91_PAD_UART1_TXD__LPUART1_TX                          0x31e
 		>;
+		bootph-pre-ram;
+		bootph-some-ram;
 	};
 
 	pinctrl_usdhc1: usdhc1grp {
@@ -316,6 +322,7 @@ MX91_PAD_SD1_DATA6__USDHC1_DATA6                        0x1382
 			MX91_PAD_SD1_DATA7__USDHC1_DATA7                        0x1382
 			MX91_PAD_SD1_STROBE__USDHC1_STROBE                      0x1582
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
@@ -332,6 +339,7 @@ MX91_PAD_SD1_DATA6__USDHC1_DATA6                        0x138e
 			MX91_PAD_SD1_DATA7__USDHC1_DATA7                        0x138e
 			MX91_PAD_SD1_STROBE__USDHC1_STROBE                      0x158e
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
@@ -348,12 +356,14 @@ MX91_PAD_SD1_DATA6__USDHC1_DATA6                        0x13fe
 			MX91_PAD_SD1_DATA7__USDHC1_DATA7                        0x13fe
 			MX91_PAD_SD1_STROBE__USDHC1_STROBE                      0x15fe
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
 		fsl,pins = <
 			MX91_PAD_SD2_CD_B__GPIO3_IO0                            0x31e
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_usdhc2: usdhc2grp {
@@ -366,6 +376,7 @@ MX91_PAD_SD2_DATA2__USDHC2_DATA2                        0x1382
 			MX91_PAD_SD2_DATA3__USDHC2_DATA3                        0x1382
 			MX91_PAD_SD2_VSELECT__USDHC2_VSELECT                    0x51e
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
@@ -378,6 +389,7 @@ MX91_PAD_SD2_DATA2__USDHC2_DATA2                        0x138e
 			MX91_PAD_SD2_DATA3__USDHC2_DATA3                        0x138e
 			MX91_PAD_SD2_VSELECT__USDHC2_VSELECT                    0x51e
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
@@ -390,6 +402,7 @@ MX91_PAD_SD2_DATA2__USDHC2_DATA2                        0x13fe
 			MX91_PAD_SD2_DATA3__USDHC2_DATA3                        0x13fe
 			MX91_PAD_SD2_VSELECT__USDHC2_VSELECT                    0x51e
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_wdog: wdoggrp {
@@ -404,6 +417,7 @@ &lpi2c1 {
 	pinctrl-0 = <&pinctrl_lpi2c1>;
 	pinctrl-names = "default";
 	status = "okay";
+	bootph-pre-ram;
 
 	p3t1085: temperature-sensor@48 {
 		compatible = "nxp,p3t1085";
@@ -455,6 +469,7 @@ &lpi2c2 {
 	pinctrl-0 = <&pinctrl_lpi2c2>;
 	pinctrl-names = "default";
 	status = "okay";
+	bootph-pre-ram;
 
 	pcal6524: gpio@22 {
 		compatible = "nxp,pcal6524";
@@ -474,8 +489,10 @@ pmic@32 {
 		reg = <0x32>;
 		interrupt-parent = <&pcal6524>;
 		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+		bootph-pre-ram;
 
 		regulators {
+			bootph-pre-ram;
 			buck1: BUCK1 {
 				regulator-name = "BUCK1";
 				regulator-always-on;
@@ -540,6 +557,8 @@ &lpuart1 {
 	pinctrl-0 = <&pinctrl_uart1>;
 	pinctrl-names = "default";
 	status = "okay";
+	bootph-pre-ram;
+	bootph-some-ram;
 };
 
 &micfil {
@@ -623,6 +642,7 @@ &usdhc1 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
 	fsl,tuning-step = <1>;
 	status = "okay";
+	bootph-pre-ram;
 };
 
 &usdhc2 {
@@ -637,6 +657,7 @@ &usdhc2 {
 	vmmc-supply = <&reg_usdhc2_vmmc>;
 	fsl,tuning-step = <1>;
 	status = "okay";
+	bootph-pre-ram;
 };
 
 &wdog3 {
diff --git a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
index a68ffd04ee08..65e66309bc1d 100644
--- a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
@@ -51,6 +51,7 @@ osc_32k: clock-osc-32k {
 		#clock-cells = <0>;
 		clock-frequency = <32768>;
 		clock-output-names = "osc_32k";
+		bootph-all;
 	};
 
 	osc_24m: clock-osc-24m {
@@ -58,6 +59,7 @@ osc_24m: clock-osc-24m {
 		#clock-cells = <0>;
 		clock-frequency = <24000000>;
 		clock-output-names = "osc_24m";
+		bootph-all;
 	};
 
 	clk_ext1: clock-ext1 {
@@ -65,6 +67,7 @@ clk_ext1: clock-ext1 {
 		#clock-cells = <0>;
 		clock-frequency = <133000000>;
 		clock-output-names = "clk_ext1";
+		bootph-all;
 	};
 
 	pmu {
@@ -136,6 +139,7 @@ soc@0 {
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x0 0x80000000>,
 			 <0x28000000 0x0 0x28000000 0x10000000>;
+		bootph-all;
 
 		aips1: bus@44000000 {
 			compatible = "fsl,aips-bus", "simple-bus";
@@ -143,6 +147,7 @@ aips1: bus@44000000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
+			bootph-all;
 
 			edma1: dma-controller@44000000 {
 				compatible = "fsl,imx93-edma3";
@@ -357,6 +362,8 @@ iomuxc: pinctrl@443c0000 {
 				compatible = "fsl,imx93-iomuxc";
 				reg = <0x443c0000 0x10000>;
 				status = "okay";
+				bootph-pre-ram;
+				bootph-some-ram;
 			};
 
 			bbnsm: bbnsm@44440000 {
@@ -384,6 +391,7 @@ clk: clock-controller@44450000 {
 				assigned-clocks = <&clk IMX93_CLK_AUDIO_PLL>;
 				assigned-clock-rates = <393216000>;
 				status = "okay";
+				bootph-all;
 			};
 
 			src: system-controller@44460000 {
@@ -444,6 +452,8 @@ aips2: bus@42000000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
+			bootph-pre-ram;
+			bootph-some-ram;
 
 			edma2: dma-controller@42000000 {
 				compatible = "fsl,imx93-edma4";
@@ -919,6 +929,8 @@ aips3: bus@42800000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
+			bootph-pre-ram;
+			bootph-some-ram;
 
 			usdhc1: mmc@42850000 {
 				compatible = "fsl,imx93-usdhc", "fsl,imx8mm-usdhc";
@@ -1039,6 +1051,8 @@ gpio2: gpio@43810000 {
 			clock-names = "gpio", "port";
 			gpio-ranges = <&iomuxc 0 4 30>;
 			ngpios = <30>;
+			bootph-pre-ram;
+			bootph-some-ram;
 		};
 
 		gpio3: gpio@43820000 {
@@ -1056,6 +1070,8 @@ gpio3: gpio@43820000 {
 			gpio-ranges = <&iomuxc 0 84 8>, <&iomuxc 8 66 18>,
 				      <&iomuxc 26 34 2>, <&iomuxc 28 0 4>;
 			ngpios = <32>;
+			bootph-pre-ram;
+			bootph-some-ram;
 		};
 
 		gpio4: gpio@43830000 {
@@ -1072,6 +1088,8 @@ gpio4: gpio@43830000 {
 			clock-names = "gpio", "port";
 			gpio-ranges = <&iomuxc 0 38 28>, <&iomuxc 28 36 2>;
 			ngpios = <30>;
+			bootph-pre-ram;
+			bootph-some-ram;
 		};
 
 		gpio1: gpio@47400000 {
@@ -1088,6 +1106,8 @@ gpio1: gpio@47400000 {
 			clock-names = "gpio", "port";
 			gpio-ranges = <&iomuxc 0 92 16>;
 			ngpios = <16>;
+			bootph-pre-ram;
+			bootph-some-ram;
 		};
 
 		ocotp: efuse@47510000 {
@@ -1113,6 +1133,8 @@ s4muap: mailbox@47520000 {
 				     <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "tx", "rx";
 			#mbox-cells = <2>;
+			bootph-pre-ram;
+			bootph-some-ram;
 		};
 
 		media_blk_ctrl: system-controller@4ac10000 {
-- 
2.34.1

