Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011046.outbound.protection.outlook.com [52.101.70.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A2D3DD873;
	Fri, 16 Oct 2026 20:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792181522; cv=fail; b=FR/O2TxQnZn1yWsmCVWMolEyObDQy2HtAjtRzl1NRUhUl0Xuymhdtq1rRce5qpYZvkoEbvINz80BJZUxHaKmGKWt75C9tZtmQYVC/Q/kcn3A6omKxunyM4EOidocAnrWq3uAtj0xnYKpDnR0JDNoRHLrkK/xcvH7FCNhnGb/Qus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792181522; c=relaxed/simple;
	bh=Y2wirbAqMz7jID9eV5IPQGJE633skilZS3eus+/O2f4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=KEpJZ4/bTozigqsnoQBTerfy9anrc18fosR/TmEW9poWlvGLj1iuraEJMmvXfR94k7FPQ908ED9ELYhhEuN0RLUC5QTgnCNalKxIYmplL6hPLFBxtbmKDm/pAP4khf1xOforzb7g/vHdDD9X6G650Y3l1d0e4Q1z4FimFUTZqGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Lguu5i5H; arc=fail smtp.client-ip=52.101.70.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Lguu5i5H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KLxLAK8PzrmcyNgY+wFFXOB7H/L5KzouMKE+Tzp1QHF6GE0wjAztCxACW8aejf1tKsDTmHmkLLpgv6dtWYdOGP/HOfJWVqRnpXAdRj2CtxOv8hZnIxhPYoqHLbmkmCT7L6NgBHVNOk6e/2gYHs1qpVBystuthbUzGzGaVxSvy2H43+K6p0ofxontoeAIYxb1jvjHsz0xLysR6w+/3hdmAYTO7mxMxVwqTkQqVaT37N765a1ZOgd47xVFxmqAqffB0wf3BHRMkoCXusOy2LRjkuDG83QGmHwCjR9aW3EgayN+XfAGbK/MWQcK9DyD8sZvXIBCL+ko+L0amFfAjQeV5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUWx6ysNnP7/GeiWMmATkeHz9cF5u1tcCzlosaQj7z0=;
 b=KgQHC/kg/xxDp/V/GjrXqKocT7ZSUALq6LV545vnUByn907CwzXxzi0P86cT542vlwP/uOw0c8wYIKqsO+HFv240Yep6+1t2xmUWdXrjFWtYI5uFexUUxVmrNznngHq8SbF3KcGswjtR57JcMcHM162WhyegtG8bhQ1T9N9repsYjco+zpxKhdUMIc02jeemizpHaAeoPVs799H2+Rh3A6vsxBNCAeOZqCM93sNXsuOCvrOpxXHZDRzB3rFgsT6pxBlp6cvzp8qjt1W+2H5dT2cPpPaI794PKxcOyU9lz2AbBJUS1lKE4LYFR5X+aKm+uo7tg8y7Y9WebxS5xg0Rtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUWx6ysNnP7/GeiWMmATkeHz9cF5u1tcCzlosaQj7z0=;
 b=Lguu5i5H0C1VFGMGoKDycNTl/Nyz/btsS2UFQaNI4VsI0SRW9Kba8bzCjxcdLx0YkbtlhlD7lp+FqUenGH5LfLFoCBgGBpWxe2Dyup13j92kATc+kYM6Law/Hsh0BqOZZhcwGbgiBmbrKx9vJaAYgqgoQESUo2LaMOjb+RLGtHwE/QUX/eTijTHgqFIFdlRGflHpCbPo8RZhbf5LUiSGua7VA8+1DfcgFkmwD+QrVq4Q3kwgU1WgQOgRpDjFUsYiarljcLLem3EtmFgbjVK3HATM8/u1S2KxLjZBRt6N5zIzxP7q/P6KUY0SjIIV6Ks0IMjHv9kvbqkF2j+wgxyHDg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8738.eurprd04.prod.outlook.com (2603:10a6:20b:42b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 20:11:36 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 20:11:36 +0000
From: Frank.Li@oss.nxp.com
Date: Fri, 16 Oct 2026 16:10:51 -0400
Subject: [PATCH 08/14] ARM: dts: imx6qdl-apalis: remove disabled node
 "panel-lvds"
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-arm_dts_cleanup2-v1-8-3a0cab9fd784@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792181452; l=1318;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=bYrJORTuxEvPY0aC/Ims2WM+rpKk80w4FRtiOu49Nd4=;
 b=muLe2O30DrP8jVdseAqzO5UJm7/XyvWpdKjHGusLSlBBd9uW8Ta6u8Ulvw9sEwxQ8pLuUJi4B
 net+iAibODOCqNZFeQOSZ+G3XWJ/sTkOJuk2d5Vwy6cmiu9BYdrc6dq
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DS1P221CA0019.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:8:242::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8738:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d7c6fc4-3310-4e02-d113-08df2bc1ae09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|23010399003|10067099003|18002099003|3023799007|22082099003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	+NkJUVLk1GCnyuSM3ltOEMfDFeYnK3KtDSSrl/kCE4xn+m2E0xnx//A6M15w0vcvpsJgRyYA/R9hg5yBZBZOJaGXmq7UHd6za3s4I4Js9bZrxqxD1iE7qoFzPN4H5K6E1daujGV8Ni7vUz0ZAH+1k2rfshZdz9NZRnMrdkSsu8At8WjHisZMwtme6uT7ssC8VGDjuANvPnLdFTGB5ZHBnxdXs2C34P4tMH8vPf6rcsRd8wFHm6fywZ8dRjsla1Iff55wCA9bBflt93o5AJYGNENE4YO13FvC+BJoBQlpDkAFyb9XTz8yzIpubOGNd1ey+RrTfAQXzULX+7iNgp+N8hiDbthzxmlGzOebUOwoPdYrX5SYO62ngXTgyJcqTMatdmhRn4mc8UBrBLz8qV9C5GBPDIK8jbQgq4jfMLO0MTeHrQtvZNVS6dG9BF+aOZwxwp/Y4+3PrHC/j/rlYFHfV9nmONvGFwQS4Ed08xf69K5s1Oj6Lne8JmhsO61ELqfSbVlhytBxCSddExu3t6DjAH4ceb41wjg0WLzGELlFR0wSkdONYs4Q2WQtQWpOgVIWn3tkWxE9kszc8gWlMBcA7fi/nWxh2KjZ1aH9iFsczmAmqyIO9ruqFUbsjNHhzjqQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(23010399003)(10067099003)(18002099003)(3023799007)(22082099003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1NITThCd2VhWHBaN25LRGNmckR0WkpXMWVDa1VSWEgyRTlTay9VZzNjTDhz?=
 =?utf-8?B?WmI2VG5hZks3M3h6Sm4vbW5TK3IvQWVRMHlyTG16K0dTUW9CTHc0cEQ1ZzZE?=
 =?utf-8?B?d2ZmTUJVZlhJSVh4anFuK2w3bXh0YzFFbGhrTCsrMEhSR0xYZlEvMU1VSCtl?=
 =?utf-8?B?N0VCV2ZNWG5mMnJHU1FTek9aVU4yUkdqQkh1M29hdE44KzFNbUxGUEhvM1pU?=
 =?utf-8?B?WE9pN3dUWDErUjIxWmpNSEJ2VlFwTStvcFo5Y2hnVTE2YUVqaDFIQ0x4bCt6?=
 =?utf-8?B?UWtpUFZqVEp5M2VHZVZ3SUUvWmFqakcvYk80SGtmWXc5L2t5UXovTG13bFNp?=
 =?utf-8?B?U1VlVHdveURINjBDelU5aVhQdWZ5Ymx2dExrMkFKN1Zaa0k4aENDbHRWM3p3?=
 =?utf-8?B?NFp3RW5rVDlXNmtlSTZ5M3hlZU5IdTMwMHJsMXg0TkNWV1ByN0M0UG43K3Ay?=
 =?utf-8?B?MVI0aG1RMytGZk5zYTJOM3ZPcGVabDNoY2hWZjR3dTVZZEM3cGtTcmRneEEv?=
 =?utf-8?B?bjRNWER5aENpRGxzVzI5MzlGODlDY2VDNktabEJ2eHZ5RzVVS0pRbVdTeTJr?=
 =?utf-8?B?VVFQQmVmUllYUWZNQW44KzJ5aWVULzRyclpTNE1oaHhDK2xRbE5obFk0V0JY?=
 =?utf-8?B?M0xoby9qdEtVVHdYR0tyVm4wNUJ6dTY0bUdSMUs4dlV0RjBPWi9FSzhxT1Bi?=
 =?utf-8?B?Y0MvMncyNlA0eXVnM1g5LzhkQkFoUm91R0E0d0ZrNTlmcjJhekxtRG9xK214?=
 =?utf-8?B?M09ybEcrYWJMRVRPeElKZFQ1MWthTFU4aDRXK0VtSmtGeUdWY2hKdXczQ3Uz?=
 =?utf-8?B?bnp3dmpDVURIVnRxb09xL0RObUtxY2dyakJvTVdEd2haNzBvM3VHR3Bvc0JL?=
 =?utf-8?B?bUp6Mm40dGI3ZzZqN255WDJXTFhiQ2o3a1JqSnBudy9ZbFhGcCtZblhUaTRM?=
 =?utf-8?B?UXhOWjRzSFRab2gybjh0SEpPRmd4aHVOaHpIR0tHVVRMSGZlZmJLamR4Wkxj?=
 =?utf-8?B?Q3NOTGhBTVBGWW5sYUl2RWJHeGdLMHZqYmpaUklZWGRvajJLWWdaVnE5b1Nt?=
 =?utf-8?B?MU9WVENISmtLV3VyNGRrV2RwUzJ2ZWNVbEZPOHQwSURsc0paRXdjTXdCRzAr?=
 =?utf-8?B?V1NMQWxoZGV4WjNRcVRtS3BmZXlRV2ppRCtMcTFrRStOaWg4N0xwdmpPdEQ1?=
 =?utf-8?B?b2xuY1lFRDBxZmJZa2RHbGFsWHM3cG41V2dXeC96ODZRc1d0cmQycXZ3Sm53?=
 =?utf-8?B?UzEyVEpocU5TNnVvWE1ZbW5Edjl5WStXZk5RTFdONjhNa2ZHVU1NWG5UZ1Jo?=
 =?utf-8?B?U2xScVpYQnJJVUE0QlhFR0RjYkxOUnB5TmM1bHRBcXpjMWpOQlgzR2lZeVBa?=
 =?utf-8?B?aTdkOUgzblo0MnB6OWV4bjJiNUh0ZURqbllNY2ErL1dNUmVNS3dKLzJqdVlX?=
 =?utf-8?B?MXlIQVJ4Uk5BMlJ3M0pINlN0T0xvc1lNRnNFOFlzOUlHK2t6aWR6ak9CWkRR?=
 =?utf-8?B?YkdqNUZtZkFVdUp1bndmSTRGZUtheXVZQk14cE1Dc2crYlRLM0Z4UGVMc0I3?=
 =?utf-8?B?dlRJdCtyTmJ2c041dGVFWTlwYzhMUG42VVQzbXhLdnpabWRtdXFWcUJCZkNy?=
 =?utf-8?B?ZGw1WitUVlpsblZQVU5tN1pPT0xOU3NqVlBZZU9BQUdYOEtFN3JXR3UvVmtE?=
 =?utf-8?B?Z2ZMSWhvQUd4ZTRhN0h0M3FKYXJvdDMxSkFld3VaTjJIeFZtWmJPOFAydUFy?=
 =?utf-8?B?RThlSlM1VFdjQjhTbHRRaWo2MGNrTEdoV3ROdVAvdkRjTHY3RmR3cjFoRmdM?=
 =?utf-8?B?MStMMWFJTDFzQ1RQNnhIWTdmdlRtaHh2VGQvS3dMb3Q3UkE0TTdLdE51YVFF?=
 =?utf-8?B?UjluTW1QK0w3cklmMktmZkdLTDJPSlFlc3RGV25sZTg0NjZRRjN2dk9qeWU1?=
 =?utf-8?B?M0NVMDZ6a2p2ZmlucmhSNzY5bnpyOEJHNzNnSmVGQzM4TzB2ZmZiWDJaVlZi?=
 =?utf-8?B?K01qVzVwbnJjcHJxYlpQbUxMNHJTTWljMTBiT0tWZE1yRkg5SmZCdE1TZWlU?=
 =?utf-8?B?QStnUjRjMFFhTEYyNHhNZ0VFMXR6Uk04K1lNTjA1ZnJ0NmZFRDF5aWhmQllh?=
 =?utf-8?B?Y0xvQjJXTnRWVG5xYzRlek9URmpEcWIySWtJd2QrTXdvRjdnZEFGcE5Xb05i?=
 =?utf-8?B?WlhYMWorZlM3TVhieUpZcmlheFNmT3plQUZWNU0yQytXOEZhQUVqWTFpSk9y?=
 =?utf-8?B?NHQ1Q2h5Q3VPVEIvQUorK3RTRmRUWG9rYkJ3QndyYVF6cjRqMnA4NVZtTlBt?=
 =?utf-8?B?WXRxK29XVmlWL2V0ek1LZDB2ZUlRbk84bnI0T3prWDNWTFNubFZnckUyNHZF?=
 =?utf-8?Q?LDHjIwUqHkxnpBRi5VFs7GYpuvl1quMFIIZnK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d7c6fc4-3310-4e02-d113-08df2bc1ae09
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 20:11:35.9760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S7FEVdbcQGapqq6qkX/0wB/D8Ojdu769GyxWT7DFKdyTG/BTjVVKWXnMc9dahtT72hqnn6lpqg6ZanZGg8xUntJ3Y2LT19NewQ5X/Qz0Ye3XLtIZ+n1aKTT+QGvdFsIy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8738

From: Frank Li <Frank.Li@nxp.com>

"panel-lvds"'s status is disabled and no dtso overlay to enable it. So
remove it to fix below CHECK_DTBS:
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtb: panel-lvds (panel-lvds): compatible: ['panel-lvds'] is too short
        from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml

Reduce move than 44 lines warnings.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
index af038ac472261..3f6a77453516e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
@@ -95,18 +95,6 @@ lcd_panel_in: endpoint {
 		};
 	};
 
-	panel_lvds: panel-lvds {
-		compatible = "panel-lvds";
-		backlight = <&backlight>;
-		status = "disabled";
-
-		port {
-			lvds_panel_in: endpoint {
-				remote-endpoint = <&lvds0_out>;
-			};
-		};
-	};
-
 	poweroff {
 		compatible = "regulator-poweroff";
 		cpu-supply = <&vgen2_reg>;
@@ -733,10 +721,6 @@ &ldb {
 	lvds-channel@0 {
 		port@4 {
 			reg = <4>;
-
-			lvds0_out: endpoint {
-				remote-endpoint = <&lvds_panel_in>;
-			};
 		};
 	};
 

-- 
2.43.0

