Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.65
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793860906;
	b=p6WLbNgfsaw30lOBGfm3gTGgXEYBuXN7sZ/XbnXCugT0LNyHK/yM+k993+tusi0Ix9kY
	 QDAxqQ5AMFpX2rmCMefsNpSlHAvfzvX7Qc4u8j/yX3X6AI8WHZmBhosiK+YHmDccSDvOs
	 yPAkIenN+7NXDdQ1FGHmcCiTmXEFDswaGU4DPh9kxmRVNFNsO+F5LwiRsG8r3CAoBvNuZ
	 P0ggI3BSnsMngxIdqN8XDwUYW29d121Cb36d0D+B+MrKMI01GDV5XezwlqF+hTsyRajgX
	 3Zs1vRN6BVYS3Gwb8sXizCM3BL1WcqXtXdZM1MHrPh8aU2haVWhGnE7//nLUx65E/3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793860906;
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
	bh=BG0BcKD7UKFhGejgv2THYLoXo1lQUNfVhpVtZumpoqk=;
	b=Nr/62GP8buktaXfvjDtgweJ2tdpsZh9+KRl7qC5od1xwn8kSejmUaZ3xw/Ppo6e1xORM
	 fgKThOOK6lAYI6O0XXyl4YRHzP7fwxHKNU8KbtUCcA2Erp4xxMoKpXo66X9dq8c1c62DV
	 yPvMhn6dySf5PNui7JRBNjSetprPfbP0KgiCps20aPobyaH+JKHI6f4BFG1TfyDHGRQfV
	 Hlrj7sLiI3qaB7nzdMYJAE3s8VuW1PkRcSjNhqtZRqyfKptY5+KiBgKnRFpLZ0Mxoj8YQ
	 q+gHLaHNY/bWsxvXnup2UuXJlppwTEgDgLot2v0JJBvjc3tQ6QBIXGKiuISCLfICtng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=FHsdX78S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.65
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012065.outbound.protection.outlook.com [52.101.66.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10E2606A32D;
	Thu,  5 Nov 2026 06:41:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A10E2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=FHsdX78S
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YVDKDTNKx1Jk+zMZwGzyf1CuGggSuS9NdSX0o53ov+AI6evf45hGGapb/a4E/CyoU71HJZspSPEK3XwAaplveHr4i3OuWoETK+OiiyPP1YbBVde+3rjuP+1G3C70Xo4+5kI5PVrIRBtS+BOhzN/u1W379eoSE6gIYGNKF670yOPY2gGc6DO6hIaNhSaAiW7f7xfxHZ/Wq8JF7FvSgqcFqk4mMClu9xEHWGP/CTw4aHrxTYUMjBxk/jgDZSVMxJ/9AW3ZYARTuPESN4GjS15iNM9kN5lz0VfxSxav0EslQWoGojPsofGgsx9Kpo6DIbRl4EXqavwhY46RwCXPUCUV3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BG0BcKD7UKFhGejgv2THYLoXo1lQUNfVhpVtZumpoqk=;
 b=fFKon7b55k1Hag026f6FIhqPw5Vr3ONZgdloHjdcVCKsKoabMgNmjbzTjyUwUA345s6As12M1IBZ+jPLTsiKZuiE18FCaticSMju58yOYTMM3HD8/v9vM/kDuGLDdCrE/hL8x2b3rCj4yQfS/+ki3spiFsMbzByuYnqbR7x2s2mE7tXjShE/qbDOAzVdXeIXuh6VpGNYJM3UpdlEg5XiIQSR/WQLMTwfaXRQdPdQ02dizUd5NpU7znZxyphBfIsPOXTWOiK8OWFP81+PWcqDFO6ebkw+KHaGGINXaYmz5chF1xb9sPusI2UjK3Dl/tx8KDgJNjMu76OoDPmqjwcDRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BG0BcKD7UKFhGejgv2THYLoXo1lQUNfVhpVtZumpoqk=;
 b=FHsdX78SflR9ZZi6gcg67pAfZJ9k2MN5YkGP6OfaReH9609322BZEIoiV0Qr18GVF7OIgGz4mvnSNsWFSXOeC5pdIxMHYizY+WzRZ4tu8KMQxSklfYMvgh4ECqnd3Lj0ZtKP6ZKXnNMLWKEuynjLlx44zWIwIRTgXRon9wtgdywtg7220QNesvn4wo2+1O1QpVyLOUxWER9mXiaGXX8tFZUhpT2pW5W9P7WmEHyxeURMrAje5bFIa1zQrILpDUrd2KP28ImAQqjN04UhvIOynXRoR08fO1yERvwi+gzZO/9bY3wksCQ4DSSIeM4W8eLor0qVYZse4O98eTpSB/HiUg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by DBBPR04MB8026.eurprd04.prod.outlook.com
 (2603:10a6:10:1ed::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 06:41:43 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 06:41:43 +0000
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
Subject: [PATCH v4 2/4] arm64: dts: freescale: imx95-19x19-evk: Add IMX-AUD-IO board support
Date: Thu,  5 Nov 2026 15:41:15 +0900
Message-ID: <20261105064117.277495-3-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261105064117.277495-1-chancel.liu@oss.nxp.com>
References: <20261105064117.277495-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0098.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bf::7) To GVXPR04MB10021.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|DBBPR04MB8026:EE_
X-MS-Office365-Filtering-Correlation-Id: e368ad2c-a352-4638-7e8f-08df3b07daa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|7416014|23010399003|22082099003|18002099003|6133799003|10067099003|3023799007|56012099006|11063799006|261026140227099003|261028144727099003|261022075727099003|261021121427099003|261021123027099003|261102123227099003|261022105027099003|261009223027099003|260925021311599003|260925021911599003|260925022911599003;
X-Microsoft-Antispam-Message-Info:
	EBpEFYgXHPNA26cgN0D7RIJItBj4XKmoJmohrR0ffoMnDN+vtB0RNX7V71iN42SWDE/KrFkNuA6tLpD9xXKBEFwUuIs6ir8c54XYUXjpjX5WGMjiMqVOvupTS4m+lcCFO3k1rvswwqVZubUyitCZ2txkYkiN2NlgsLpvHKcTrjRLEWuBcFVQ+HIISv74ve+pL9SPJJseH9ln5uBLejU91I44Kd1RDkTTU9N+Hs+f3hkvhNLjPmm7PzX5z97OQANIzkA5ILryuEiTjsu5gnLdYSxTpPRY+fvQgT/Ujs4vwQz6598O2VBuE7heFN6r8QVTCaFxj5KNh34sH+1l5PxbQQmG/tBZJXy8ZNx3B9xSvXx49DfF7pNW3nWd/QuSDCZT11dpfmbPg50G7m/FUCJAmGWp6xDEWq3rFdd0bF/kXcxOqIIWRE1nKez0ydlPxZ9MUzWZ/IS90Ny6cUTyS3sRBvGPdu6+rnF1Q9Y1ti/P1PWKZZC6UzoTi4tAqS5PbFIDqpgrC1MbwlIyc+/fPFUrzS2SaFnyEd7/XlnVALEUTHmt0oMorZY3Rk8t2Yf5QAQZA9AtOerl46I14JtzIC1QUPuDU/jMgXS03+3x5plpuRpCBKwdyIBICRos7aMa5oOiMmjyGSPkDvIc/LhJJa08yhlCtPHMFQb/S6ly3CAIJX4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(23010399003)(22082099003)(18002099003)(6133799003)(10067099003)(3023799007)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261022075727099003)(261021121427099003)(261021123027099003)(261102123227099003)(261022105027099003)(261009223027099003)(260925021311599003)(260925021911599003)(260925022911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wr59FjKUrbm03mFEv1N0nB3hI+psFWPyZrI+gj1ajaupEmNo6HKdfE4zgHrP?=
 =?us-ascii?Q?OVqgqjAUIzO50FMkixj4jOT8AON0eSJ8Vdy1fbFcj/2rQr5deWSIGKTTkzdb?=
 =?us-ascii?Q?scNnsIIfZgKDk6NuYFJL2Mq/S+ZtZcRbi7Q23mn9qDtHwFy2tb9BvBTLCUm3?=
 =?us-ascii?Q?MGE5AxsZ58oSyhLMOrlVGHE1YH58Usboe08Qr/GD7dP9+yINXUhIfCPDLtks?=
 =?us-ascii?Q?byvIgwQcWEBOMr4mj6GFLKFurzupdBWZufNh8l+K50IDUpr6WZ1ee7Nc0Q+x?=
 =?us-ascii?Q?PsmXB+ogLts5LVee7xuJYbwFRm48jasx5aFMJNbLOKuvHXCRdq8Cr1FIB28G?=
 =?us-ascii?Q?+b9ewpRL/a8oxqnLnEImjHWcNjlauFwOpsSoK87qtmtV0NPG6JV9TeLAjw0V?=
 =?us-ascii?Q?/P3I9KyQZwAEkzzMZDv8kld1duQXIr4pqR3cvFHlYfUVUwbIR89iUmjui4+3?=
 =?us-ascii?Q?XnwU32l3FcX0YmXCRqy18uJvv6DKTOFj8waTLdJ8NPdoe2BXU0ztvhdGr7Eh?=
 =?us-ascii?Q?SHjeaLv1ssuWTUmv5aHfCNl0KKDuV+SUeHGFkiYOfzXDKpb/Ov4AQ5cJIy6Q?=
 =?us-ascii?Q?OhtDu33AoUI5x+LcYQtQ3qu59YkIyawq5l07igcd5dPI8Nt+3uEHDfGmnN0U?=
 =?us-ascii?Q?VcdA5jX9D4AvCo4YJh/tStfjKH8xH9wYNUNBNDFnEbeGQUorug0FJlTVAEPr?=
 =?us-ascii?Q?lh7k4+uzM+wjatDXNOKzcyx2KDHQ8mwisoElyyMugX6zuB+OCQ9PN6ZUDNKe?=
 =?us-ascii?Q?+hL+IiS4XNbply1mqCaDwkJt3kkmIhtuGBknxDJS08P5AZOQtux5uPpqfs2Q?=
 =?us-ascii?Q?xGp4a/aftKGx7wG9UM9ei7QI0GhDuaZs0nTTl6uDUb4T9R/+zlu1OY0nGKEg?=
 =?us-ascii?Q?VVoSxo8XfVtU59Xnie9+y57Y3yJEoGM8VvKU8u5Cmx6FhIvQeF5En1muAxCV?=
 =?us-ascii?Q?Jn4RHOoUEkGfrSDFprKkCFKNxZ5zs/IGn26xrL7nYhidLDYb6YLovrVSi3wX?=
 =?us-ascii?Q?3mf8OWQ3e0uYGOPteWdUkkRrRyenwpFEqz22MX182kmxKoTU5Zaxi3FBUSqK?=
 =?us-ascii?Q?vcnUJChlzYqEoTc6Vmr4CZ9dWZiXIrdGw5uoIuXgOQHfBNe/jDRUyjDHC+sy?=
 =?us-ascii?Q?1a6RSwvLL1V6pluy3DVUSi2w+gpfADHVZp0KeFRYTRax5KSolvbqdv5zfITq?=
 =?us-ascii?Q?0fZaxA6j1ijIsVtXpOeFR459mghB3bAINh1m8MJtZfb45Bc/5OpK3ta9zl0e?=
 =?us-ascii?Q?jyCIgCHT2+B2seie2N//7CeqKqGDi3mJpbTPN6cwNwY1XnAyIGXLockHsxXd?=
 =?us-ascii?Q?MDZThlECjekV+W0Q5N7t10UTvCMh82Z6KozuJP0pzJsFNSRU66nm2QrYy2PX?=
 =?us-ascii?Q?Ko6DOrzhkQ3BnbVCWj4QBpUShmo/rr3SzWpBqKIWHyQHgxw5x3IhgvCZtNaC?=
 =?us-ascii?Q?uETs3Io54wsfZP/LglSppxF+n85Jtot9asFQRFmSVLQZX17OL5sLYkw7vWd2?=
 =?us-ascii?Q?RGCwCfV/FzwmYZzS5aLnP88LDMnu4qAoty350hP9e8ta53fAR277TDduTFuN?=
 =?us-ascii?Q?coy5t1jZq2fQZzb5Jak0xlAHwgrxDoZeoCdE4oHD5frHk01541j5eEeuQbFQ?=
 =?us-ascii?Q?vy4LTDxkDX/yXHmfwb3zDgAOh/XYkziodsgdno/S068qLCg0KEwPAgDQYQOz?=
 =?us-ascii?Q?5VWIqSUfOJW8tIy9gNDqez2Y4q+3g1bsp/G6IpC57odT12tvZ6MPCG0ihQqP?=
 =?us-ascii?Q?3wCvortKjaaUAMpEITQno0In8KWIO2s7Kt7IMnalU8f7r1X+MyZg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e368ad2c-a352-4638-7e8f-08df3b07daa6
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 06:41:43.0872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ms1u/ts2DFCX/YSNAUyzLYDui7A+jmUCxgfJCYJpwaj42toOKrdAdCc5Iq1FuuGwsk5uQBOWoNhf1Z21GFzoqavf0bWb7+OJMBb2jr24o+EexdBxWNorr68zATecskGH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8026

From: Chancel Liu <chancel.liu@nxp.com>

IMX-AUD-IO is an add-on board which can be connected to i.MX95 19x19
EVK through a physical connector. This connector is described as a
fsl,aud-io-slot connector to expose a constrained subset of GPIO and
clock resources to the add-on board using fixed electrical wiring.

Also add required regulator, sound CPU DAI and I2C bus configuration to
support IMX-AUD-IO on this base board.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx95-19x19-evk.dts    | 52 ++++++++++++++++++-
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 47ed0ef67611..843443d5d17b 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -43,6 +43,16 @@ aliases {
 		serial4 = &lpuart5;
 	};
 
+	aud_io_slot: connector {
+		compatible = "fsl,imx95-19x19-evk-aud-io";
+		#gpio-cells = <2>;
+		gpio-map = <0 0 &i2c6_pcal6416 8 GPIO_ACTIVE_LOW>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+		#clock-cells = <1>;
+		clock-map = <0 &scmi_clk IMX95_CLK_SAI2>;
+	};
+
 	bt_sco_codec: audio-codec-bt-sco {
 		#sound-dai-cells = <1>;
 		compatible = "linux,bt-sco";
@@ -161,7 +171,7 @@ flexcan2_phy: can-phy1 {
 		standby-gpios = <&i2c4_gpio_expander_21 3 GPIO_ACTIVE_LOW>;
 	};
 
-	reg_vref_1v8: regulator-1p8v {
+	aud_io_reg_1v8: reg_vref_1v8: regulator-1p8v {
 		compatible = "regulator-fixed";
 		regulator-max-microvolt = <1800000>;
 		regulator-min-microvolt = <1800000>;
@@ -175,6 +185,22 @@ reg_3p3v: regulator-3p3v {
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
@@ -449,7 +475,7 @@ i2c5_pcal6408: gpio@21 {
 	};
 };
 
-&lpi2c6 {
+aud_io_i2c: &lpi2c6 {
 	clock-frequency = <100000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lpi2c6>;
@@ -671,6 +697,28 @@ &sai1 {
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

