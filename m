Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011046.outbound.protection.outlook.com [52.101.70.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7703E0222;
	Fri, 16 Oct 2026 20:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792181530; cv=fail; b=Fx+WGK2ReoyQrc+0Qwif36QRe8CWw+cEmPmVAHaq/vY5ZDwzFT5M8Oy5xd2Mjaaq4PrfgN6U9TVtEOoJL+BU50RvZWooqvxKtkziYkbZhiUnx5oE8ZYv9GOxj9kNkAH5bI3eOkKrVvCRHpnmm3xrOQJqoFSTd9GfMjXzdsB5wLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792181530; c=relaxed/simple;
	bh=H1ntiHuwBK/Wj+4ENvUJKTO8SE9vONGzHnDYCVNc6ns=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=AIodMknXz3JVMj1ruND/d3Tl/PEzG1mNNPGb+TrtW9zqt5C9OLvcjumskVw3BMPJrA7U5hLZ9GOpeR5EE8/d5WsSxpoSFOGN9d4QPp7Mmo5DlS3DTitm6WuFb3QZUZ2DUXRVaPvXn+sJ1D1cqbgkwVUmP/UqFDGfE+AhtRPbxFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OC32khcf; arc=fail smtp.client-ip=52.101.70.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OC32khcf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jw9pZuD6PEWuui5GMPTEqqmCdAlI6HMv0+egteLZbbSkcj3/0/I/2XvNtsRXXxayJWNvC6d8bkUiY0aT98ahr5NQid4TNi+EZneNIQQ8KOD1i3F8Ssbhl/l75szmpjSyAXsMo0Nkum2mhlbmKPFw4uPrSqGOWykvQPad/vvBhyh2NIb+fsgndpOFfeMjvWi2Tx7GBZQ/myEoB/6YC8wKUXmxQjKjr7JI27ILoSwYrHrEdjG0WFbuuQFMvzoZAT8zFcm0x0YHDpnzLVC/QtQdIBPTVr/vg/byyhdbUfxYeJolDiao4v6Eh0SFJ0hKdYUv4OMaoPLI2RcwIbTFhPNUgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f5Pollkk4dQ2cG+DnkmrD/rftQFnAlat2nff0ay0MIM=;
 b=SfRQGupav+iu7Aq0XZx6oqTSAwmKSnnXWsk7e3K8nyRbZ/g6sgDr0yudI0oiKlGIy5LFCh4RZwmlgZYLeFNBxFS+hMJBDdNTRN/cmxGnk40AP1/SvMUdiIgK5ofF+8mhM7H7HJFUECQepSmCbijzBn66u9C5Sq3CeyjZwkdd3NVHldm870Mnuyisz4KVLqDM/XXQr5abxleJgyubFmLxcgMtgc6eBKemRm7gobdl6U7G4PC6CY8ziEc+lcb1SLithsL65nP5B6AihTfnbuYtdvB6Dvo7sTff8QYsz59uxwSvecDOGfuvbg7dEO+CRJ6kck32sRfT25BEQgzX7cwg6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f5Pollkk4dQ2cG+DnkmrD/rftQFnAlat2nff0ay0MIM=;
 b=OC32khcfBTl2a+lARwPbAMBzXVnhnTOvUMA3Bp9gPLhavyCtBh5v2KEqV9g8WPwtz3b7AnU2TckRt1iPxaDUwRQ+4809+2xxOFODOOJpqU8LotyCOnkrAyhsX44QCrMeUf4vqSCPn7nYVHJmZ05cdpc/k444YY3/A4wTi1U5wIMrTHLkh4BwFRewcaDVx0JTwvvGYMLVF5mqhGYcucDoP4hOrNcrlSqXLBrNwzlvIlGfcw83Ih8j+1CKjUu4nJbJmbrRQaAN1S1amgqfAb6Jx4EH1zZrqLlSOR4DYBud4e8jkGZ9QA6RHoM6F+ebRcmETILN3QGgWRBZ0Z3gh/faMg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8738.eurprd04.prod.outlook.com (2603:10a6:20b:42b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 20:11:45 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 20:11:45 +0000
From: Frank.Li@oss.nxp.com
Date: Fri, 16 Oct 2026 16:10:53 -0400
Subject: [PATCH 10/14] ARM: dts: imx6qdl-tx6-mb7: remove redundant
 pixelclk-active for simple panel
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-arm_dts_cleanup2-v1-10-3a0cab9fd784@nxp.com>
References: <20261016-arm_dts_cleanup2-v1-0-3a0cab9fd784@nxp.com>
In-Reply-To: <20261016-arm_dts_cleanup2-v1-0-3a0cab9fd784@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792181453; l=1244;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=UrteHKmHfY1ep0Y1HPDz3udibs+iQRWnL63mfZDyHYo=;
 b=H3Vn1nGfydDsYaVSTsVETcaQtWLuOr33r/sFOcgtHJfBUTLXD2tt4i+joTTu4tJa/9qgCPh9W
 k58Fjy/Y4YBBFwH9YF8vq5tjVb+uZLFS8aNg4hZn1WTswJYJipWsQWA
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DS7PR03CA0167.namprd03.prod.outlook.com
 (2603:10b6:5:3b2::22) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8738:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bfc9345-f61c-421f-1b58-08df2bc1b3a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|23010399003|10067099003|18002099003|3023799007|22082099003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	CZhrWV4ZDpTGZd5O4HFo17nLfRxoySbSyNN/Y9f8ueyLDhTNU9tf4xJeClEkNwf6wlfDSDu5MZua6A+O1cntuiXQ4wifG/uIcZxix5s1Pthi+FTGRhV1Wvzw/R0cctiRFK/hNQQu+Yxxz3oRoOO7n/7Ju7ESxOBqbS1vomDzmJTU/aVuVlhlz/L/fSUKO+0RXgOnW0skFGZ02tg0hBQ98zYRI2hRUYpOEEqk9K12nisZZR10EESuj/RB3YT3DMAl1E9WzS9lXiYMYGTxL9unufFS+VJj9vrKoyIyBvwAoQ5vQRLj96bmTC8mZ7gZUZhFdF5Dzk2jYFnUEnK/zoslkKfEPePw9/G3a0ZYY3+VwC/CJQebEjVbzUUcxhgCDpM1SSBjhLdzjVFCREybTBD49nAIqRz9KC+tLu2ATuQtM9iHqd3qRnrkJjhtfoWTkBmrZII8iffvNLwaEXPuX0UhPdTwu/S33BJTEUYC4jICOFouuC+LIncxlM8XslBNCwWs5P9BT8kJKXg+pYMaFNLj08/BI5KKHy1NkOvhJ6BB1mH+5ZkjDC/EkFahrGw/VFZxeIaJ3I/v648uMaUN+jOFOZdCxGWgNj0YJ8IsPB0daVv258Ueb6xMN1aR2+c8IrH+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(23010399003)(10067099003)(18002099003)(3023799007)(22082099003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1IvTUQ3YTFFV0MyR3JIeFlxMFVhcC9UTzlJK2hRQUJhelA0U2pzc29FVFVp?=
 =?utf-8?B?cHRpd0U4SEM4dWpzT2t4WkRVMEdjeU5nNGtFRGVMWUQwMzhIcGFCZDFpMmM4?=
 =?utf-8?B?SlFnaitScEovWmoyRFZ2RWN5N2NaL215VGhta0lmakp6YXRrK0l6KzYwRVB0?=
 =?utf-8?B?RENSMDdOVXAzRWJycnNLb20zNGpPOGhrVHV4TUlpdXpBQnJrektXUFVLYS9w?=
 =?utf-8?B?bHdkQi9abWpCemNuWDB5Q1NiWkxVdEJCc1ZYcjJxdmk1MWg0c3lXcEpjUjhS?=
 =?utf-8?B?VnI5TEJLc0hrQURZUzY1U2dMOXZWU1o4S0VNdDZOLzlXZHFjd1dqVk1NK1NK?=
 =?utf-8?B?aEdsNzF2TjVmZjFnQ3l1VkY0cjArU29raFFLWSs1OVdJc1ZvbXVwdmpkUmhz?=
 =?utf-8?B?c0YxVFRNL1NQcndEbTh6ZDJOM1NLWlBaRkFPNkYvUUQzK1ZNR0J5djE3TlZ4?=
 =?utf-8?B?N0hCaElPTy9SdWlYLzFUc1VJc2pwcnRKUTJFSlV3WVBRZEt6TVdONlV0c3Av?=
 =?utf-8?B?cFhWU1dVazZEMXZKcU5iSUhRUW41T3VLb3E5YURwaXUvd09KaEtUYkJXNURR?=
 =?utf-8?B?elNVdnlka2k5ZlRnRlgzMnJVbUlxU1hGOGQ4NFhhTXZhdERVb0hUOHB0d3Mw?=
 =?utf-8?B?aEplbmU1WlE3NTZ3V1RFelN6Yzg0TUV4YkpBTGZaOXNOVHQzbWppQTNGOExk?=
 =?utf-8?B?eHJKMkt4N2N6djlkWFgvVWhMWGs2eHB3OE1uUGFweDBMcm8ydGZGWDNyYnZ5?=
 =?utf-8?B?bUUwTHhiTFdNMjNPVnNpakJ3dFRoQTNSWVh2aXh5eDdwNGcrWTdpYTJLLzB6?=
 =?utf-8?B?Nnd0V1UyODhxK3JENHhXbnBJeHdxZUMzZ3lzN1NHaHlKWEVKRmtXZVBSMDN4?=
 =?utf-8?B?cXRVK3hINllpL2tiODg0WFZCOXhMbXFIeStvT1pvaUI1Qmh6cm9ub3ErUElM?=
 =?utf-8?B?c1R5YnRrYzZwaU5OVU9XVWo4M0dwVDBrRnpmOHJzN0twMm1leThkZDdVRGpr?=
 =?utf-8?B?ZWs3YXdBZTY2MDNiZDFOS0xWSHZ0UkJNVVhBdlJ3UURkb0hQWlY2ZmNTdUpY?=
 =?utf-8?B?SURGNFoxK1RvNWM3WHdaSlFpZ05XNWt2ZVVCeVdHYmNxdlcxVjN5K24yRXc5?=
 =?utf-8?B?dUs4VTlCeTdzM0dGWjZ6RkM0WW9NamdZM0RHam1IZDBuYmxiUHlhMXE4Yk9G?=
 =?utf-8?B?cEZITWFlRjRXaHVSN3NKWWNyOGlvZUdqeGQ5Q3hQOExRY2dpSndieWFTaG1q?=
 =?utf-8?B?bi9QY0xiMXQ4N3lUT29DRFJNZXN1VWY2ZHJsRk1qQ0Q2U1FGRkRGNjA3WEsz?=
 =?utf-8?B?VEJiNURiV2h3Z1dKWC96Wmw0a1NaKzBsRVpuUkV6NXUxR3QzYzRxOUpicjc4?=
 =?utf-8?B?ZTd6UjJ0S3hISEI1bWlWakNVZWp3MDZnK2RIbXJqZFJZMVhKcW1IdnVkR1ZX?=
 =?utf-8?B?UFRNZHFaTmVidzBDWTZLdEVlQTM2Ky9BZG1uWWhDbm5SaVdmMmlYNlNGNGhE?=
 =?utf-8?B?VlJVSDBhdXpYMlJWQ2dtbUdGNkdtUGJKUkpjQ2E2RHN4MEQzbzFxZi9TZkMy?=
 =?utf-8?B?bU1md3JJRjFGOW5XbXZSUkl3dmNCckp2YzhsOGIvdkRzNTlMZm9paXRwUCtL?=
 =?utf-8?B?NlErNWgzQzVZOWlVZ1NkZ3dya2pLYVJsSStRSTZyQjRqZ0E4Smxvd2dtTkxV?=
 =?utf-8?B?NkxqZDk2QU12MkdpZXpETlpWK0VpSjJzV3J1M05hTXFxWnVWQ3p2blVkTm1U?=
 =?utf-8?B?blBGUnBJNkZIdTZPM0VtbDRQdHJ1WTFsZnIvdDRKenBGTk5NVHRvbUdodjJO?=
 =?utf-8?B?Tlcvb3V5ZWY5WERDNE1zTkdndlFMOUNtOSs2bVNjeXVRTTIydDMxNmZvZkhz?=
 =?utf-8?B?RFQxWjJhVURRZm00THVkYXlsL1Z5ZDBLb2o0dHJiMzBZZ1F2azIxWHZWYnpr?=
 =?utf-8?B?VkhYcXUvaVI2a0xmRUVScmZwSWVuV3VLMC9PbmVPby9KTUlZT0VUcHhJeHhi?=
 =?utf-8?B?NUkrU3ErZHoyMjB3aXJiMWZmVVVxTGM3MndiWk05NzhDT3ovQ29ZTjlSbDA3?=
 =?utf-8?B?WjNjUllvaXhGWVBibHg3NjlHVWFjYmxTL0tXUGcyUE1uN0N4WEF5NjFiaUsw?=
 =?utf-8?B?MFh0VTA1dFRBSkJzaGZ6T2VLaGozeHZxRmxNYWdjQmE1VTRsYmU2YmkvNi9r?=
 =?utf-8?B?M2RHTzAzdm8rS1g0MGk4WDUzZVlodDlDNjhUTmVNSlduQ05RQ3pkTWZNRFVu?=
 =?utf-8?B?ck1YZXBkUnRwUWUzUXdoN2l3b002U1YrcjZsbUhaQlVSTk1CVFhBUjhSS2NE?=
 =?utf-8?B?TWJoN0d5MkZRWFNlL0xPS1dlczQwb2I5ZlFpUm9CQzhVSzFVU2dZVzBPVkky?=
 =?utf-8?Q?BgPRlMa0Uj4BwGvnys+TK2egV3UtlMFEyv+IX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bfc9345-f61c-421f-1b58-08df2bc1b3a6
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 20:11:45.3948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DAz9eytlouFMp0VB72XVmDol0Ensb5mEjnJ1zlY8w+bTlsQ7lTAZBm0IyLsQz3Zrz0JgEDZsKOVk19AwV7U3g8Rq5zQRUdGT4qc4rJUK4XoeTGn7LRyRcjqC5nhw+S9r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8738

From: Frank Li <Frank.Li@nxp.com>

The information pixelclk-active already set in panel-simple.c according to
compatible string. Remove redundant pixelclk-active to fix below CHECK_DTBS
warnings:
  arch/arm/boot/dts/nxp/imx/imx6q-tx6q-10x0-mb7.dtb: lcd-panel (edt,et057090dhu): Unevaluated properties are not allowed ('pixelclk-active' was unexpected)
        from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-mb7.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-mb7.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-mb7.dtsi
index 8232f4ea27526..b770d884c6f3e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-mb7.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-mb7.dtsi
@@ -17,19 +17,16 @@ backlight1 {
 	lcd-panel {
 		compatible = "edt,et057090dhu";
 		power-supply = <&reg_lcd1_pwr>;
-		pixelclk-active = <0>;
 	};
 
 	lvds0-panel {
 		compatible = "edt,etml1010g0dka";
 		power-supply = <&reg_lcd1_pwr>;
-		pixelclk-active = <0>;
 	};
 
 	lvds1-panel {
 		compatible = "edt,etml1010g0dka";
 		power-supply = <&reg_lcd1_pwr>;
-		pixelclk-active = <0>;
 	};
 };
 

-- 
2.43.0

